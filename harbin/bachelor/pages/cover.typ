#import "../../../common/theme/type.typ": 字体, 字号
#import "../config/constants.typ": current-date
#import "../utils/states.typ": thesis-info-state


#let cover-course(
  title-cn: "",
  author: "",
  student-id: "",
  supervisor: "",
  profession: "",
  collage: "",
  course-name: "",
  year: current-date.year(),
  month: current-date.month(),
  day: current-date.day(),
) = {
  align(center)[

    #let space-scale-ratio = 1.4

    // #align(right)[
    //   #text(size: 字号.四号, font: 字体.宋体)[密级：公开]
    // ]
    #figure(image("../assets/school.png"))
    #v(字号.小四 * 3 * space-scale-ratio)
  
    #text(size: 字号.小二, font: 字体.宋体)[*本科生课程论文*]

    #v(字号.小四 * 2 * space-scale-ratio)

    #text(size: 字号.二号, font: 字体.黑体)[#title-cn]

    #v(字号.小四 * 1 * space-scale-ratio)

    #v(字号.二号 * 4 * space-scale-ratio)

    // #v(字号.小四 * space-scale-ratio)

    #let cover-info-key(content) = {
      align(right)[
        #text(size: 字号.四号, font: 字体.黑体)[#content]
      ]
    }

    #let cover-info-colon(content) = {
      align(left)[
        #text(size: 字号.四号, font: 字体.黑体)[#content]
      ]
    }

    #let cover-info-value(content) = {
      align(left)[
        #text(size: 字号.四号, font: 字体.宋体)[#content]
      ]
    }

    #let base-space = 0.8
    #let key-width = 字号.四号 * (4 + base-space * 3)

    #grid(
      columns: (auto, 1em, auto),
      rows: (字号.四号, 字号.四号),
      row-gutter: 1.5em,

      cover-info-key(text(spacing: base-space * 1em)[课 程 名 称]),
      cover-info-colon[：],
      cover-info-value(course-name),
      cover-info-key(text(spacing: (key-width - 2em))[姓 名]),
      cover-info-colon[：],
      cover-info-value(author),
      cover-info-key(text(spacing: (key-width - 2em))[学 号]),
      cover-info-colon[：],
      cover-info-value(student-id),

      cover-info-key(text(spacing: (key-width - 2em))[专 业]),
      cover-info-colon[：],
      cover-info-value(profession),
      cover-info-key(text(spacing: (key-width - 2em))[学 院]),
      cover-info-colon[：],
      cover-info-value(collage),
      cover-info-key(text(spacing: base-space * 1em)[上 交 日 期]),
      cover-info-colon[：],
      cover-info-value([#[#year]年#[#month]月]),

    )
  ]
}

#let cover() = {
  context {
    let thesis-info = thesis-info-state.get()
    // cover-primary(
    //   title-cn: thesis-info.at("title-cn"),
    //   title-en: thesis-info.at("title-en"),
    //   author: thesis-info.at("author"),
    //   student-id: thesis-info.at("student-id"),
    //   supervisor: thesis-info.at("supervisor"),
    //   profession: thesis-info.at("profession"),
    //   collage: thesis-info.at("collage"),
    //   institute: thesis-info.at("institute"),
    //   year: thesis-info.at("year"),
    //   month: thesis-info.at("month"),
    //   day: thesis-info.at("day"),
    // )

    // pagebreak()

    cover-course(
      title-cn: thesis-info.at("title-cn"),
      author: thesis-info.at("author"),
      student-id: thesis-info.at("student-id"),
      supervisor: thesis-info.at("supervisor"),
      profession: thesis-info.at("profession"),
      collage: thesis-info.at("collage"),
      course-name: thesis-info.at("course-name"),
      year: thesis-info.at("year"),
      month: thesis-info.at("month"),
      day: thesis-info.at("day"),
    )
  }
}