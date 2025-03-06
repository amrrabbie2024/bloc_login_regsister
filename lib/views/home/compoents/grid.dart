part of '../view.dart';
class GridSection extends StatefulWidget {
  const GridSection({super.key});

  @override
  State<GridSection> createState() => _GridSectionState();
}

final gggbloc=GetIt.I<MoviesBloc>();

class _GridSectionState extends State<GridSection> {
  @override
  void initState() {
    gggbloc.add(GetMoviesDataEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: BlocConsumer(
          bloc: gggbloc,
          buildWhen: (previous, current) => current is MoviesSuccessState || current is MoviesFailedState || current is MoviesLoadingState,
          listener: (context, state) {
            if(state is MoviesFailedState)
              showMessage(state.msg);
            else if(state is MoviesSuccessState)
              showMessage("Movies count:- ${state.movieList.length}",isSucess: true);
            else if(state is MoviesPaginationFinishedState)
              showMessage(state.msg!);
            else if(state is MoviesPaginationState)
              showProgressDialog(state.msg!);
          },
          builder: (context, state) {
            if(state is MoviesFailedState)
              return AppFailed(msg: state.msg);
            else if(state is MoviesSuccessState)
              return _grid(state.movieList);
            else
              return AppLoading();
          },
        ));
  }

  Widget _grid(List<MovieModel> movieList) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if(notification.metrics.pixels == notification.metrics.maxScrollExtent && notification is ScrollUpdateNotification){
          gggbloc.add(GetMoviesDataEvent());
        }
        return true;
      },
      child: GridView.builder(
        //shrinkWrap: true,
          //physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 8.w,
              childAspectRatio: .6
          ),
          itemBuilder: (context, index) => _gridItem(movieList[index]),
        itemCount: movieList.length,
      ),
    );
  }

  _gridItem(MovieModel movie) {
    return InkWell(
      onTap: () {
        print(movie.title);
        showMessage(movie.title,isSucess: true);
        navigateTo(MovieDetails(title: movie.title, movie: movie));
      },
      child: Card(
        shadowColor: Colors.orange,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(20.r),topEnd: Radius.circular(20.r)),
          side: BorderSide(color: Theme.of(context).primaryColor)
        ),
        child: Padding(
          padding:  EdgeInsetsDirectional.symmetric(horizontal: 4.w,vertical: 8.h),
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.center,
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(20.r),child: Image.network(Constants.Movies_Image_Url+movie.posterPath,width: double.infinity,height: 150.h,fit: BoxFit.cover,)),
              SizedBox(height: 6.h,),
              Text(movie.title,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 22,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}
