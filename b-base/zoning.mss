#zoning-districts {
    // Add fill so this can be hovered over
    //polygon-fill: rgba(5%, 40%, 40%, 40%);

    // Everything that is left is small & inconsequential. Give it
    // a resonable default colour.
    polygon-fill: @residential;


    // One-Family Dwelling Districts
    [ZONE="RS-1"], [ZONE="RS-1A"], [ZONE="RS-1B"],
    [ZONE="RS-2"],
    [ZONE="RS-3"], [ZONE="RS-3A"],
    [ZONE="RS-4"], 
    [ZONE="RS-5"],
    [ZONE="RS-6"],
    [ZONE="RS-7"],
    [ZONE="R-1"] // R-1 is a typo I made in the shapefile.
    { polygon-fill: @residential; }

    // Two-Family Dwelling Districts
    [ZONE="RT-1"], [ZONE="RT-2"], [ZONE="RT-3"], 
    [ZONE="RT-4"], [ZONE="RT-4A"], [ZONE="RT-4N"], [ZONE="RT-4AN"], 
    [ZONE="RT-5"], [ZONE="RT-5A"], [ZONE="RT-5N"], [ZONE="RT-5AN"], 
    [ZONE="RT-6"], [ZONE="RT-7"], [ZONE="RT-8"], [ZONE="RT-9"], 
    [ZONE="RT-10"], [ZONE="RT-10N"] 
    { polygon-fill: @residential; }

    // Multiple-Dwelling Districts
    [ZONE="RM-1"], [ZONE="RM-1N"],     
    [ZONE="RM-2"], 
    [ZONE="RM-3"], [ZONE="RM-3A"], 
    [ZONE="RM-4"], [ZONE="RM-4N"], 
    [ZONE="RM-5"], [ZONE="RM-5A"], [ZONE="RM-5B"], [ZONE="RM-5C"], 
    [ZONE="RM-6"], 
    [ZONE="FM-1"],
    [ZONE="RA-1"] // RA-1 is agricultural, with low-density residential
    { polygon-fill: @residential; }

    // Commercial districts
    [ZONE="C-1"], 
    [ZONE="C-2"], [ZONE="C-2B"], [ZONE="C-2C"], [ZONE="C-2C1"], 
    [ZONE="C-3"], [ZONE="C-3A"],
    [ZONE="C-5"], [ZONE="C-6"],
    [ZONE="C-7"], [ZONE="C-8"],
    [ZONE="FC-1"] 
    { polygon-fill: @retail; }

    // Industrial districts
    [ZONE="MC-1"], [ZONE="MC-2"], 
    [ZONE="M-1"], [ZONE="M-1A"], [ZONE="M-1B"], 
    [ZONE="M-2"]
    { polygon-fill: @industrial; }

    // Light industrial districts
    [ZONE="IC-1"], [ZONE="IC-2"],
    [ZONE="IC-3"],
    [ZONE="I-1"], [ZONE="I-2"], [ZONE="I-3"]
    { polygon-fill: @industrial; }

    // Parks (a zoning classification I made for science world)
    [ZONE="PARK"]
    { polygon-fill: @park; }

    [ZONE="STADIUM"]
    { polygon-fill: @retail; }

    [ZONE="BCPED"]
    { polygon-fill: @industrial; }

    // Central Waterfront / Coal Harbour
    [ZONE="CWD"], [ZONE="CD-1 (401)"]
    { polygon-fill: @industrial; }

    // Chinatown
    [ZONE="HA-1"], [ZONE="HA-1A"], [ZONE="HA-2"]
    { polygon-fill: @retail; }

    // Commercial Dr
    [ZONE="CD-1 (309)"], [ZONE="CD-1 (97)"],  [ZONE="CD-1 (433)"],
    [ZONE="CD-1 (477)"], [ZONE="CD-1 (87)"],  [ZONE="CD-1 (41B)"],
    [ZONE="CD-1 (152)"], [ZONE="CD-1 (29)"],  [ZONE="CD-1 (142)"],
    [ZONE="CD-1 (207)"], [ZONE="CD-1 (429)"]
    { polygon-fill: @residential; }
    [ZONE="CD-1 (250)"], [ZONE="CD-1 (63)"],  [ZONE="CD-1 (238)"]
    { polygon-fill: @retail; }

    // Downtown Eastside
    [ZONE="DEOD"],       [ZONE="CD-1 (403)"], [ZONE="CD-1 (397)"],
    [ZONE="CD-1 (255)"], [ZONE="CD-1 (282)"], [ZONE="CD-1 (337)"],     
    [ZONE="CD-1 (270)"], [ZONE="CD-1 (354)"], [ZONE="CD-1 (361)"],
    { polygon-fill: @retail; }

    // Great Northern Way
    [ZONE="CD-1 (478)"], [ZONE="CD-1 (338)"], [ZONE="CD-1 (402)"],
    [ZONE="CD-1 (334)"], [ZONE="CD-1 (488)"]
    { polygon-fill: @industrial; }
    // Catholic school near G Northern Wy
    [ZONE="CD-1 (70)"] 
    { polygon-fill: @residential; }
    // VCC - Clark
    [ZONE="CD-1 (141)"]
    { polygon-fill: @retail; }

    // Shaugnessey
    [ZONE="FSD"] { polygon-fill: @residential; }

    // Strathcona
    [ZONE="CD-1 (41D)"], [ZONE="CD-1 (396)"], [ZONE="CD-1 (320)"],
    [ZONE="CD-1 (52B)"], [ZONE="CD-1 (57)"],  [ZONE="CD-1 (197)"],
    [ZONE="CD-1 (286)"], [ZONE="CD-1 (144)"], [ZONE="CD-1 (11A)"],
    [ZONE="CD-1 (232)"]
    { polygon-fill: @residential; }
    [ZONE="CD-1 (33)"],  [ZONE="CD-1 (385)"], [ZONE="CD-1 (411)"]
    { polygon-fill: @industrial; }

    // Olympic village
    [ZONE="CD-1 (454)"], [ZONE="CD-1 (462)"], [ZONE="CD-1 (464)"]
    { polygon-fill: @retail; }

    // Vancouver General Hospital
    [ZONE="CD-1 (59)"],  [ZONE="CD-1 (187)"], [ZONE="CD-1 (46)"],
    [ZONE="CD-1 (62)"],  [ZONE="CD-1 (147)"], [ZONE="CD-1 (295)"],
    [ZONE="CD-1 (137)"], [ZONE="CD-1 (408)"]
    { polygon-fill: @retail; }

    // Victoria Dr
    [ZONE="CD-1 (294)"], [ZONE="CD-1 (79)"],  [ZONE="CD-1 (434)"],
    [ZONE="CD-1 (156)"], [ZONE="CD-1 (313)"], [ZONE="CD-1 (13A)"],
    [ZONE="CD-1 (84)"],  [ZONE="CD-1 (269)"], [ZONE="CD-1 (41A)"]
    { polygon-fill: @residential; }
    [ZONE="CD-1 (3A)"] // Avalon Dairy
    { polygon-fill: @residential; }
    [ZONE="CD-1 (373)"], [ZONE="CD-1 (382)"]
    { polygon-fill: @retail; }
    [ZONE="CD-1 (268)"]
    { polygon-fill: @industrial; }
    
    // False Creek
    [ZONE="CD-1 (432)"], [ZONE="CD-1 (264)"], [ZONE="CD-1 (265)"],
    [ZONE="CD-1 (379)"], [ZONE="CD-1 (348)"], [ZONE="CD-1 (378)"],
    [ZONE="CD-1 (349)"], [ZONE="CD-1 (324)"]
    { polygon-fill: @retail; }
    [ZONE="CD-1 (422)"], [ZONE="CD-1 (297)"], [ZONE="CD-1 (366)"],
    [ZONE="CD-1 (195)"], [ZONE="CD-1 (345)"], [ZONE="CD-1 (251)"]
    { polygon-fill: @residential; }

    // Yaletown
    [ZONE="CD-1 (484)"], [ZONE="CD-1 (266)"], [ZONE="CD-1 (272)"]
    { polygon-fill: @residential; }
    [ZONE="HA-3"],       [ZONE="CD-1 (182)"], [ZONE="CD-1 (384)"]
    { polygon-fill: @retail; }

    // Downtown
    [ZONE="DD"],         [ZONE="CD-1 (482)"], [ZONE="CD-1 (431)"],
    [ZONE="CD-1 (289)"], [ZONE="CD-1 (346)"], [ZONE="CD-1 (329)"]
    [ZONE="CD-1 (239)"], [ZONE="CD-1 (287)"], [ZONE="CD-1 (416)"], [ZONE="CD-1 (248)"], [ZONE="CD-1 (440)"], [ZONE="CD-1 (489)"], [ZONE="CD-1 (427)"], [ZONE="CD-1 (233)"], [ZONE="CD-1 (200)"], [ZONE="CD-1 (318)"], [ZONE="CD-1 (343)"], [ZONE="CD-1 (319)"],
    [ZONE="CD-1 (260)"], [ZONE="CD-1 (254)"], [ZONE="CD-1 (446)"], [ZONE="CD-1 (426)"], [ZONE="CD-1 (493)"], [ZONE="CD-1 (177)"], [ZONE="CD-1 (331)"], [ZONE="CD-1 (323)"],
    [ZONE="CD-1 (435)"], [ZONE="CD-1 (199)"], [ZONE="CD-1 (491)"], [ZONE="CD-1 (369)"], [ZONE="CD-1 (442)"], [ZONE="CD-1 (418)"], [ZONE="CD-1 (155)"], [ZONE="CD-1 (414)"], [ZONE="CD-1 (455)"], [ZONE="CD-1 (316)"], [ZONE="CD-1 (164)"], [ZONE="CD-1 (243)"], [ZONE="CD-1 (443)"], 
    [ZONE="CD-1 (278)"], [ZONE="CD-1 (279)"], [ZONE="CD-1 (413)"],
    [ZONE="CD-1 (273)"], [ZONE="CD-1 (386)"], [ZONE="CD-1 (445)"], [ZONE="CD-1 (444)"], [ZONE="CD-1 (228)"], [ZONE="CD-1 (229)"], [ZONE="CD-1 (204)"], [ZONE="CD-1 (323)"], [ZONE="CD-1 (409)"], [ZONE="CD-1 (441)"], [ZONE="CD-1 (227)"], [ZONE="CD-1 (363)"],
    [ZONE="CD-1 (163)"], [ZONE="CD-1 (322)"], [ZONE="CD-1 (329)"], [ZONE="CD-1 (374)"],
    [ZONE="CD-1 (450)"], [ZONE="CD-1 (235)"], [ZONE="CD-1 (428)"], [ZONE="CD-1 (415)"],
    [ZONE="CD-1 (311)"], [ZONE="CD-1 (271)"]
    { polygon-fill: @retail; }

    [ZONE="CD-1 (392)"], [ZONE="CD-1 (252)"], [ZONE="CD-1 (169)"], [ZONE="CD-1 (342)"], [ZONE="CD-1 (178)"],
    [ZONE="CD-1 (321)"], [ZONE="CD-1 (312)"], [ZONE="CD-1 (365)"], [ZONE="CD-1 (364)"], [ZONE="CD-1 (423)"],
    [ZONE="CD-1 (336)"], [ZONE="CD-1 (400)"], [ZONE="CD-1 (468)"], [ZONE="CD-1 (259)"], [ZONE="CD-1 (419)"]
    { polygon-fill: @residential; } 

    // Around S end of Granville Br & Burrard Br
    [ZONE="CD-1 (134)"],
    [ZONE="CD-1 (388)"], [ZONE="CD-1 (490)"], [ZONE="CD-1 (335)"],
    [ZONE="CD-1 (380)"], [ZONE="CD-1 (357)"], [ZONE="CD-1 (326)"], [ZONE="CD-1 (341)"],
    [ZONE="CD-1 (390)"], [ZONE="CD-1 (196)"], [ZONE="CD-1 (170)"]
    { polygon-fill: @residential; }

    [ZONE="CD-1 (305)"], [ZONE="CD-1 (389)"], [ZONE="CD-1 (439)"], [ZONE="CD-1 (458)"],
    [ZONE="CD-1 (290)"], [ZONE="CD-1 (234)"], [ZONE="CD-1 (306)"],
    [ZONE="CD-1 (158)"], [ZONE="CD-1 (253)"], [ZONE="CD-1 (370)"], [ZONE="CD-1 (274)"], [ZONE="CD-1 (186)"], [ZONE="CD-1 (494)"]
    { polygon-fill: @retail; }

    [ZONE="CD-1 (332)"], [ZONE="CD-1 (339)"]
    { polygon-fill: @industrial; }

    [ZONE="CD-1 (28)"] // S end of Burrard Br, in the park.
    { polygon-fill: @park; }

    // Around S end of Cambie Br
    [ZONE="CD-1 (494)"], [ZONE="CD-1 (165)"],
    [ZONE="CD-1 (358)"], [ZONE="CD-1 (330)"]
    { polygon-fill: @retail; }

    [ZONE="CD-1 (368)"], [ZONE="CD-1 (303)"], [ZONE="CD-1 (353)"]
    { polygon-fill: @residential; }    

    [ZONE="CD-1 (405)"], [ZONE="CD-1 (460)"], [ZONE="CD-1 (456)"], [ZONE="CD-1 (471)"], [ZONE="CD-1 (483)"]
    { polygon-fill: @industrial; }    


    // Granville-esque
    [ZONE="CD-1 (284)"], [ZONE="CD-1 (168)"], [ZONE="CD-1 (37)"], [ZONE="CD-1 (376)"], [ZONE="CD-1 (146)"], [ZONE="CD-1 (350)"], [ZONE="CD-1 (277)"], [ZONE="CD-1 (288)"], [ZONE="CD-1 (65)"], [ZONE="CD-1 (485)"], [ZONE="CD-1 (283)"], [ZONE="CD-1 (476)"]
    { polygon-fill: @residential; }    

    [ZONE="CD-1 (30)"], [ZONE="CD-1 (14)"], [ZONE="CD-1 (206)"]
    { polygon-fill: @retail; }    

    [ZONE="CD-1 (276)"], [ZONE="CD-1 (198)"], [ZONE="CD-1 (184)"]
    { polygon-fill: @industrial; }    


    // PNE
    [ZONE="CD-1 (258)"]
    { polygon-fill: @industrial; }

    [ZONE="CD-1 (3B)"]
    { polygon-fill: @park; }

    // Knight st
    [ZONE="CD-1 (76)"], [ZONE="CD-1 (420)"], [ZONE="CD-1 (292)"], [ZONE="CD-1 (21)"], [ZONE="CD-1 (299)"], [ZONE="CD-1 (138)"], [ZONE="CD-1 (301)"], [ZONE="CD-1 (99)"]
    { polygon-fill: @retail; }

    [ZONE="CD-1 (41C)"], [ZONE="CD-1 (4)"], [ZONE="CD-1 (40)"], [ZONE="CD-1 (129)"],
    [ZONE="CD-1 (2)"], [ZONE="CD-1 (244)"], [ZONE="CD-1 (474)"]
    { polygon-fill: @residential; }


    // Nanaimo
    [ZONE="CD-1 (298)"], [ZONE="CD-1 (479)"], [ZONE="CD-1 (428)"], [ZONE="CD-1 (487)"], [ZONE="CD-1 (100)"]
    [ZONE="CD-1 (128)"], [ZONE="CD-1 (327)"], [ZONE="CD-1 (304)"], [ZONE="CD-1 (7A)"], [ZONE="CD-1 (100)"]
    { polygon-fill: @retail; }

    [ZONE="CD-1 (310)"], [ZONE="CD-1 (209)"], [ZONE="CD-1 (210)"], [ZONE="CD-1 (56C)"]
    [ZONE="CD-1 (211)"], [ZONE="CD-1 (13B)"], [ZONE="CD-1 (7B)"], [ZONE="CD-1 (56C)"]
    { polygon-fill: @residential; }    

    // Everett Crowley Park
    [ZONE="CD-1 (19)"], [ZONE="CD-1 (68)"], [ZONE="CD-1 (372)"], [ZONE="CD-1 (68)"], [ZONE="CD-1 (72)"], [ZONE="CD-1 (64)"], [ZONE="CD-1 (236)"], [ZONE="CD-1 (69)"], [ZONE="CD-1 (81)"], [ZONE="CD-1 (106)"], [ZONE="CD-1 (117)"], [ZONE="CD-1 (139)"], [ZONE="CD-1 (473)"], [ZONE="CD-1 (16)"], [ZONE="CD-1 (73)"], [ZONE="CD-1 (136)"], [ZONE="CD-1 (247)"], [ZONE="CD-1 (237)"], [ZONE="CD-1 (317)"]
    { polygon-fill: @residential; }    


    [ZONE="CD-1 (473)"], [ZONE="CD-1 (472)"]
    { polygon-fill: @industrial; }



    // Big parcels
    [ZONE="CD-1 (404)"], [ZONE="CD-1 (22)"], [ZONE="CD-1 (80)"], [ZONE="CD-1 (82)"], [ZONE="CD-1 (10)"], [ZONE="CD-1 (52A)"], [ZONE="CD-1 (47)"], [ZONE="CD-1 (103)"], [ZONE="CD-1 (55)"]
    { polygon-fill: @residential; }    

    [ZONE="CD-1 (78)"], [ZONE="CD-1 (242)"], [ZONE="CD-1 (27)"], [ZONE="CD-1 (126)"], [ZONE="CD-1 (1)"], [ZONE="CD-1 (18)"], [ZONE="CD-1 (430)"], [ZONE="CD-1 (15B)"], [ZONE="CD-1 (42)"], [ZONE="CD-1 (35)"], [ZONE="CD-1 (17)"], [ZONE="CD-1 (44)"], [ZONE="CD-1 (31)"], [ZONE="CD-1 (391)"], [ZONE="CD-1 (387)"], [ZONE="CD-1 (383)"]
    { polygon-fill: @retail; }    

    [ZONE="CD-1 (475)"], [ZONE="CD-1 (340)"], [ZONE="CD-1 (231)"], [ZONE="CD-1 (470)"], [ZONE="CD-1 (406)"], [ZONE="CD-1 (249)"], [ZONE="CD-1 (230)"], [ZONE="CD-1 (417)"], [ZONE="CD-1 (438)"], [ZONE="CD-1 (452)"], [ZONE="CD-1 (11B)"], [ZONE="CD-1 (125)"], [ZONE="CD-1 (231)"], [ZONE="CD-1 (437)"], [ZONE="CD-1 (453)"]
    { polygon-fill: @industrial; }
}
