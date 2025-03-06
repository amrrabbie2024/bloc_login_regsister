part of '../view.dart';
class MovieDetails extends StatelessWidget {
  final String title;
  final MovieModel movie;
  const MovieDetails({super.key, required this.title, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w,vertical: 8.h),
        child: Container(
          padding: EdgeInsetsDirectional.all(8.r),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.5),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Theme.of(context).primaryColor)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(20.r),child: Image.network(Constants.Movies_Image_Url+movie.posterPath,width: MediaQuery.of(context).size.width,height: 240.h,fit: BoxFit.fill,)),
              SizedBox(height: 8.h,),
              Text(movie.title,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 24.sp,fontWeight: FontWeight.bold),),
              SizedBox(height: 8.h,),
              Text(movie.overview,style: TextStyle(color: Theme.of(context).primaryColor.withOpacity(.5),fontSize: 18.sp,fontWeight: FontWeight.normal),),
              SizedBox(height: 8.h,),
              Text(movie.releaseDate,style: TextStyle(color: Theme.of(context).primaryColor.withOpacity(.5),fontSize: 19.sp,fontWeight: FontWeight.w600),),
              SizedBox(height: 8.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(movie.voteAverage.toString(),style: TextStyle(color: Theme.of(context).primaryColor.withOpacity(.5),fontSize: 19.sp,fontWeight: FontWeight.w600),),
                  SizedBox(width: 4.w,),
                  Icon(Icons.star,color: Colors.orange,size: 48.r,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
