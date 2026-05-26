Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD13CD5BC8
	for <linux-riscv@archiver.kernel.org>; Tue, 26 May 2026 15:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Subject:From:To:Message-ID:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=q5t2MpDZydFqaiv7jsWId4Y884ovjcE3ZdSOt3ASFTA=; b=f1+O45taw/8vJInuppWfndgrto
	B5bCkm/cW7/fVlsPUdP67LY7cV7K6CTibXUE5imCtSSrzJHnUhyFigzj2Zv1xlNH67bwm4noD2Clh
	CIT9H0gC4OnAYHVxpe8e8PUSeXb/2dtN6hIdp4ux0EPBEzlawOKYT8EySEpsFF8EqRgGNsI6aMD9O
	LhkqZxjehUOEQt6FPnYjI8tGkRQCR9GeIUEzDneXTglX+VNX9bvl0ye102LGjaaoN5QggoNUwQQW7
	h1XRDBaBAtE0psayQWgIlNK4+0vb7nTjcjpsjts/0zWeJfS6BCu1gEUS3CKzDPMo0Crq0+mGVmxb2
	rtHd99mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtKz-00000002IsW-3VZa;
	Tue, 26 May 2026 15:04:57 +0000
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRhB5-00000000pez-0e2I;
	Tue, 26 May 2026 02:05:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8FeMcjHeR4Gnvmh+y0TDNQprs+ebQy2bC13ISjsHCqgL4b6bVwJCDyP3m7nlQfUryyk2shuacVSkTl81BZZSiY09JeUoEEZGkldJtQFr0OOUGlnqpvjeFE1RTDL/2RY+El7QWnKB17X08aVvbzBS+F+mMlQuF4dBj2yynHZdJLRCAYCe89GH9KH3oQbbE9htK4TT0ZEwVBlD6P7b976UU0yGavGFhzT3ni1Lf3pInTgzDbc11K09itBxfyqRqyIOidJpkQnzputo+JHa8m6VRlgV65Uy4mbq4qj225GppkP7POHLSswRhYdeuq9s4SxAhtoFsEMDRJIKGBrFHto6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1nGZYh+fmHBVjVnA3755O0M1Nd6r2yNLqN8u8uzehc=;
 b=ffxuV1nvySA0ENWCpMQtU18Odfri+UNBRaghp73HtLUGcrfoR5jwQ3LKASseKiX4+X2nqnn85og17CnjW35rYY5v8MgABD36zxnmeYP3xFz+YbUaiW15f7ylF0+eir1rUy76BcTkEIPEXx3u4NE/bLzFDvkcUhORAIuQQ/2s3UdIciBQ0J6jQtkYA7trMEidtH4RENHd0k0Xn+0bg8LiSWfDLmT9zBRMN+qNMmhegzVSKXPGr8FmHxAzsFOS9ltjoJjd86nt1PENaFbJyjuSQ+h487DdhXRIGTcaUE96N+EDa5Qlz6h1U2ZINRXIS5MlLv7FjCj1nID9OQQuBGCh3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1nGZYh+fmHBVjVnA3755O0M1Nd6r2yNLqN8u8uzehc=;
 b=ZI40QtDPSHHTuyxXxVKBqoyyo1wFKtFZDczxGObR6H8oN879Plkxutux7Dij93gvrcmorGZiCdfKWYByhbj9IG/RRVj4j3v2S1UngXD1sADUV3V3gUbjRoTg/orejca+tl2XfxWekbjpsHH6wsqUWvO8UEIG8Jugglih9r7aN70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB16102.jpnprd01.prod.outlook.com (2603:1096:405:2a5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:05:34 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:05:34 +0000
Message-ID: <87ldd7hqno.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Alvin_=A9ipraga=22?= <alsi@bang-olufsen.dk>, "J.M.B. Downing" <jonathan.downing@nautel.com>, =?ISO-8859-2?Q?=22Martin_?= =?ISO-8859-2?Q?Povi=B9er=22?= <povik+lin@cutebit.org>, =?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>, =?ISO-8859-1?Q?=22?= =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?= <u.kleine-koenig@baylibre.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Baojun Xu <baojun.xu@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, Ben Bright <ben.bright@cirrus.com>, Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, Binbin Zhou <zhoubinbin@loongson.cn>, Bram Vlerick <bram.vlerick@openpixelsystems.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, Chen-Yu Tsai <wens@kernel.org>, Cheng-Yi Chiang <cychiang@chromium.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Daniel Mack <daniel@zonque.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, David Rhodes <david.rhodes@cirrus.com>, Fabio Estevam <festevam@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Frank Li <Frank.Li@nxp.com>, Fred Treven <fred.treven@cirrus.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Guenter Roeck <groeck@chromium.org>, Guoqing Jiang <guoqing.jiang@canonical.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, HariKrishna Sagala <hariconscious@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Herve Codina <herve.codina@bootlin.com>, Hsieh Hung-En <hungen3108@gmail.com>, James Ogletree <jogletre@opensource.cirrus.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>, Jaroslav Kysela <perex@perex.cz>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Jihed Chaibi <jihed.chaibi.dev@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Kevin Cernekee <cernekee@chromium.org>, Kevin Hilman <khilman@baylibre.com>, Kevin Lu <kevin-lu@ti.com>, Kirill Marinushkin <k.marinushkin@gmail.com>, Kiseok Jo <kiseok.jo@irondevice.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, M R Swami Reddy <mr.swami.reddy@ti.com>, Mark Brown <broonie@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Oder Chiou <oder_chiou@realtek.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Paul Cercueil <paul@crapouillou.net>, Peter Rosin <peda@lysator.liu.se>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Qianfeng Rong <rongqianfeng@vivo.com>, Ray Jui <rjui@broadcom.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Samuel Holland <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>, Scott Branden <sbranden@broadcom.com>, Sen Wang <sen@ti.com>, Sharique Mohammad <sharq0406@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, Support Opensource <support.opensource@diasemi.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@kernel.org>, Tim Bird <tim.bird@sony.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Tzung-Bi Shih <tzungbi@kernel.org>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Vishwas A Deshpande <vishwas.a.deshpande@ti.com>, Vladimir Zapolskiy <vz@mleia.com>, Xiubo Li
 <Xiubo.Lee@gmail.com>, Yixun Lan <dlan@kernel.org>, Zhang Yi <zhangyi@everest-semi.com>, chrome-platform@lists.linux.dev, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-sound@vger.kernel.org, spacemit@lists.linux.dev
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/83] ASoC: atmel: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Date: Tue, 26 May 2026 02:05:04 +0000
X-ClientProxiedBy: DS1PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:8:450::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB16102:EE_
X-MS-Office365-Filtering-Correlation-Id: ca321409-3635-4999-d157-08debacb45d1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|11063799006|22082099003|56012099003|18002099003|6133799003|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info: F3fQCz9cSYyWEeq4QOeQyr00EILiH91IBZhRlk/ylFy+lQWvsQ2jdmLt9fz/XiHnCXscLFDd9fh0hy3br7gxhO9Ae/sqoru3mvkaADvPne3P9nCMvD34IG8lWzJDOkuKtYg4sWdjSqwmRPKTNCiYRnuu9bw7QAiWc4QeqPJCj03WGkFTAxw4yBmsI7nmyeppgqENKIe9UmWFLWJPHBeKXG9L3i7Ebljdx2CHdnCaM00miH7JFDjAIAuym1qb9QBorgdVflTUrukUtSC0XOOkVDWTnUHXngNeSr15Oy2NB/2hYBH25iEffDVFw5LoUC7Tce0Q+J6pVF8/VFA0oDUAJtCyZqNG9TZ+b8ffMZez9wneZrocOD36+t0aYxvgm7R4pGK+8ZBt+bqaHdTaYMDV57qMNxoue5hf99wPKVV61T063iPVuPsLIRHdKdaNRWJOmmqIqGvtbItFkN0TWgMJyeRSF7FtUczHJy55KjEScYM5Bcub8xNZYvc/H1cLs4Ro4QCwhsvTnUVK6/yLPpfXQdGkeLbNw/SFCjqTKQpNQo5HNDDzN3MzeXzPyZe21NsjgOpDscBuWYP3W9GY4a5g9IZZ7yPZu+zXz7KqqOou+TKgN1etOJt2GmSiaPIoPML1wnuuNU+cap+X7nKApt26h+2FIIukxkrKV8ySfWyJ+LDMsGXVc6Uhj9/Rc5Cf2mbkYZT/jdNX39ynf9p0fvBbGp0ylIE+0m70bIWgiqhlKnyt9e1EIMLbMeVwAhWPwi8fwTsX89XJhvEX21HClUxxQqt1FAaPjM06/8tOWnFJpQ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(11063799006)(22082099003)(56012099003)(18002099003)(6133799003)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xMEWAsu4WsISlDyzf0/AecjJdyhqrKwYkF0eatWqVfIb5Lgi4eFr9xPAed3f?=
 =?us-ascii?Q?EDLA/R7AkiLX/E3PRlSF1QcQ3z8SelC2BGKWYgBBU8dOJrSkF3suns0dpbN/?=
 =?us-ascii?Q?vH1VAe4q7f/YMqvszu7Vp2ksHHrGhqwsrV5Su1mjL08SWwhTosW6IsRbW35x?=
 =?us-ascii?Q?Av9ma+iE45QmhxeVYnj04Dg3LHJkptGhMICYJRZduU6V+F0b3yx/tK+hRL92?=
 =?us-ascii?Q?U+BVKc2LFIB82TjT2sCkjeMPDJRT8HiuV5/GkL3gVZy5rNYbdajCwrehVjiy?=
 =?us-ascii?Q?pFyTT7Mq1XVsGERbp41cuimZ3ebz6tykV5+18qoe02O2ElbD3j4amorxVIx3?=
 =?us-ascii?Q?KEgKlEBc917+JiUwl17oIiAACLDTCq02wmYITTAnL+6S6E+Q9G64olDe2iCp?=
 =?us-ascii?Q?SuDcivd5uS7ieUKNH308chHfx43eGL/Xca7jo94seBSUJw1cglDl5e4uwf3h?=
 =?us-ascii?Q?8K8nP/+SfYsyAk+gVkVa/PFUVXgb6WkmeSw3vk5hOUJZQbOznf92WuQSiYc5?=
 =?us-ascii?Q?ZdX5HNLgMkmpeVQuh8ESk3VjfJ38GWxIz903wjGgKytuG7EPIz36C+R6xbYm?=
 =?us-ascii?Q?EO48kJuglmKTIec1nPyAcKU4KhbYHt4KmyesPsL9tJuNosv8bj9n+PGcKq0z?=
 =?us-ascii?Q?uI6rzClacxB4Rc1rh0jcpB2biaSmzUZDRiK5x/SRxcgWIbZic759HONaH3UX?=
 =?us-ascii?Q?mzaEPY2F98haya3iozKajjOJETRv11Q/GbxFCzyczRFg3whzITJ9N4a07cO7?=
 =?us-ascii?Q?LscRgrHN27YNBCBIEhxWj1qEa7jkx4dN+5SwKEFhrUA2ZkaSEyrljVLc2NBA?=
 =?us-ascii?Q?47jQm1pVtUxr/mZ9WwfBGIcef8/OiiPnD67cnvJ/Bs9VXBEgtSpxPXCH2BQ2?=
 =?us-ascii?Q?iCUGkeS9Cpaew6LrWfCC4iCnr3lcTc8A8fFyMNe1ymza/vM+ptF6sDE7Geq+?=
 =?us-ascii?Q?2JReDF2mXL+2038ArutvCuVE785f0eAMEJxN0CxlIa3Dp1tINN3lF/1QbxHn?=
 =?us-ascii?Q?EFVBRDrEGZT6Ao2XhiTTy1lnmVlAP/RnoVQkvUcX97b93H5CgCTgWZynAptE?=
 =?us-ascii?Q?l+x4Gm6H3WAZYyDQCK6DVHXpByMoY88gqFpzOMud9zDaczQZElowqCdLgEtQ?=
 =?us-ascii?Q?VQs83qWv30O5HZrT9gWXn2dKmXtsZ9KcAGYRJMuAAAub6R50ydS5tvMK9gwj?=
 =?us-ascii?Q?Sro9gR/lVd4zSJN+SBJm7LTEa8UkIcn2KKXI7hvUL770tlYNSrBfjIYmDTo+?=
 =?us-ascii?Q?KJjYyv8KhlrqgfG8yftRb3tPYM2vgPXp6TfYLWgpNAGXUqJ+ucRoiTjKNKo4?=
 =?us-ascii?Q?Vk8FZEkaT5uvvtDQto5T+RHFqHjtwkANUIaKgdSL3vT004GnlDLemg3d+9u1?=
 =?us-ascii?Q?NpNI7MWHS+NIPdyolGTffP746kQqjoL5uzX9uLtQB93QrDbsmjD8olu1vaWA?=
 =?us-ascii?Q?AbS1TWGEdoIWTqFixUANGkHeGbDfYccWib/1L8FTkMsPVgHacMeuqD73gu5D?=
 =?us-ascii?Q?VTgZV66CK9xGkP17qFGT0AH/MlZn64XCN9xbW15dwsRBBxLcYEkj9YoTppcq?=
 =?us-ascii?Q?zojyn5RbEj362OBljyH1+mkeI/og1BuaM4JUZeABMwmGtdkrdou2FSQbQ2DQ?=
 =?us-ascii?Q?fQ1p6nK9phrH1ax+YfqiCzFoA4tTNbRn0h+8/rB5hXBv778ZKsOafIFI8zoY?=
 =?us-ascii?Q?coudUBTg5iolgeEdrXkXAffZ72uRi2F6WW5i91EZVGHBWV0LWwBNLRzFWk0j?=
 =?us-ascii?Q?b06MKIaIxBDDKjFpn2JrvYSjg369p8r97paRL0OWsx3p3KBZlrrB?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca321409-3635-4999-d157-08debacb45d1
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:05:34.6938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: of/3562nmFsI/AiNLUsEA0d4DmAkJABvG9QQMDDjFr4jsDm+uLYrmhV3oH2KYqXtnVv3mrhrSTlOoiEuN8kQale9V0zcbkM6r377Q7AyZTv7+g5MFTeKgZizaOw09Ebl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_190555_314841_404300DB 
X-CRM114-Status: GOOD (  12.27  )
X-Mailman-Approved-At: Tue, 26 May 2026 08:04:54 -0700
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/atmel/atmel-i2s.c     | 4 ++++
 sound/soc/atmel/atmel_ssc_dai.c | 7 +++++++
 sound/soc/atmel/mchp-i2s-mcc.c  | 9 +++++++++
 sound/soc/atmel/mchp-pdmc.c     | 4 ++++
 4 files changed, 24 insertions(+)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 762199faf872e..d9ad262ec44de 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -540,12 +540,16 @@ static int atmel_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 atmel_i2s_selectable_formats = SND_SOC_POSSIBLE_DAIFMT_I2S;
+
 static const struct snd_soc_dai_ops atmel_i2s_dai_ops = {
 	.probe		= atmel_i2s_dai_probe,
 	.prepare	= atmel_i2s_prepare,
 	.trigger	= atmel_i2s_trigger,
 	.hw_params	= atmel_i2s_hw_params,
 	.set_fmt	= atmel_i2s_set_dai_fmt,
+	.auto_selectable_formats	= &atmel_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver atmel_i2s_dai = {
diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
index 89098f41679c0..f4f886bf678d2 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -825,6 +825,11 @@ static int atmel_ssc_resume(struct snd_soc_component *component)
 #define ATMEL_SSC_FORMATS (SNDRV_PCM_FMTBIT_S8     | SNDRV_PCM_FMTBIT_S16_LE |\
 			   SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 atmel_ssc_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops atmel_ssc_dai_ops = {
 	.startup	= atmel_ssc_startup,
 	.shutdown	= atmel_ssc_shutdown,
@@ -833,6 +838,8 @@ static const struct snd_soc_dai_ops atmel_ssc_dai_ops = {
 	.hw_params	= atmel_ssc_hw_params,
 	.set_fmt	= atmel_ssc_set_dai_fmt,
 	.set_clkdiv	= atmel_ssc_set_dai_clkdiv,
+	.auto_selectable_formats	= &atmel_ssc_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver atmel_ssc_dai = {
diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 17d138bb90648..a832dee73ac78 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -912,6 +912,13 @@ static int mchp_i2s_mcc_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 mchp_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_GATED	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops mchp_i2s_mcc_dai_ops = {
 	.probe		= mchp_i2s_mcc_dai_probe,
 	.set_sysclk	= mchp_i2s_mcc_set_sysclk,
@@ -922,6 +929,8 @@ static const struct snd_soc_dai_ops mchp_i2s_mcc_dai_ops = {
 	.hw_free	= mchp_i2s_mcc_hw_free,
 	.set_fmt	= mchp_i2s_mcc_set_dai_fmt,
 	.set_tdm_slot	= mchp_i2s_mcc_set_dai_tdm_slot,
+	.auto_selectable_formats	= &mchp_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define MCHP_I2SMCC_RATES              SNDRV_PCM_RATE_8000_192000
diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index ec7233ce1f78b..a6a9b5e6cd95e 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -741,6 +741,8 @@ static int mchp_pdmc_pcm_new(struct snd_soc_pcm_runtime *rtd,
 	return ret;
 }
 
+static const u64 mchp_selectable_formats = SND_SOC_POSSIBLE_DAIFMT_PDM;
+
 static const struct snd_soc_dai_ops mchp_pdmc_dai_ops = {
 	.probe		= mchp_pdmc_dai_probe,
 	.set_fmt	= mchp_pdmc_set_fmt,
@@ -748,6 +750,8 @@ static const struct snd_soc_dai_ops mchp_pdmc_dai_ops = {
 	.hw_params	= mchp_pdmc_hw_params,
 	.trigger	= mchp_pdmc_trigger,
 	.pcm_new	= &mchp_pdmc_pcm_new,
+	.auto_selectable_formats	= &mchp_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver mchp_pdmc_dai = {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
