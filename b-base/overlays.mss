// Things that go above the labels



#rider-comments.HIDE {
  [offset_direction='northeast'] {
    [zoom=14] { point-transform: "translate(+10, -10);"; }
    [zoom=15] { point-transform: "translate(+15, -20);"; }
    [zoom=16] { point-transform: "translate(+30, -30);"; }
    [zoom=17] { point-transform: "translate(+45, -40);"; }
    [zoom=18] { point-transform: "translate(+60, -50);"; }
  }
  [offset_direction='southeast'] {
    [zoom=15] { point-transform: "translate(+15, +20);"; }
    [zoom=16] { point-transform: "translate(+30, +30);"; }
    [zoom=17] { point-transform: "translate(+45, +40);"; }
    [zoom=18] { point-transform: "translate(+60, +50);"; }
  }

  [zoom >= 13] {
    point-allow-overlap:true;

    [mood='happy']    { point-file: url(img/happy.svg);    }
    [mood='sad']      { point-file: url(img/sad.svg);      }
    [mood='confused'] { point-file: url(img/confused.svg); }
  }
}

