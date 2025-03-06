part of '../view.dart';
class ListSection extends StatefulWidget {
  const ListSection({super.key});

  @override
  State<ListSection> createState() => _ListSectionState();
}

final kkkbloc=KiwiContainer().resolve<MoviesBloc>()..add(GetMoviesDataEvent());

class _ListSectionState extends State<ListSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: BlocBuilder(
        bloc: kkkbloc,
        builder: (context, state) {
          if(state is MoviesFailedState)
            return AppFailed(msg: state.msg);
          else if(state is MoviesSuccessState)
            return _list(state.movieList);
          else
            return AppLoading();
        },
      ),
    );
  }

  Widget _list(List<MovieModel> movieList) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _listItem(movieList[index]), 
        separatorBuilder: (context, index) => VerticalDivider(thickness: 2.r,indent: 20.h,endIndent: 20.h,color: Theme.of(context).primaryColor,),
        itemCount: movieList.length
    );
  }

  _listItem(MovieModel movie) {
    return GestureDetector(
      onTap: () {
        print(movie.title);
        showMessage(movie.title,isSucess: true);
        navigateTo(MovieDetails(title: movie.title,movie: movie,));
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(20.r),child: Image.network(Constants.Movies_Image_Url+movie.posterPath,width: 160.w,height: 160.h,fit: BoxFit.fill,)),
          Positioned(
            left: 10.w,
              right: 10.w,
              child: Directionality(textDirection: TextDirection.ltr,child: Text(movie.title,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 24,fontWeight: FontWeight.bold),)))
        ],
      ),
    );
  }
}
