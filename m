Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EFECD6E57
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 00:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Subject:To:From:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+QLoScIw3leZansShPNel5G8/vvyqdcK4Tk1Mtpr23Y=; b=sQ3WWZm5+DBn73skhqw4vuoKkI
	CjH5PoaqplAbMNfS5H7gbipn7MtjxuHN/2EuFpQvdo1tTVOba1mVmV7oIKz01Js+jWmj7E3cjprMI
	7t1rGgLWq7qv0cmMUq4pnIKt4xUgwMS3kv3RoCti2jWTM7axc/q2pf1fsrni4P7JF1Pc89w/otnvc
	SyXLgI3rStV17IOP32lirxzoWieU70c7GmdDt1XxmuWGNtqm0LcBS5+UOnhNCC6pmSAI2m7JZr76w
	0hmd6/OIsCmH4OkbqNcuW5SfgfKfZG6EgKMH5yIsswQvtxL/VT1Gg+Nqed30MSAT/jQSWybpczAXd
	FNld9xTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUw41-0000000Fxx1-0M8D;
	Thu, 04 Jun 2026 00:36:01 +0000
Received: from mail-japaneastazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c405::] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUu6M-0000000FtY6-25p6;
	Wed, 03 Jun 2026 22:30:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiDlgTOjquM/2FE5w5nqTPrFknXxRQZP/CGzYppoHfAaqwgYMbOmu3M8v9wE1vxp+RvIyJ/EtYz1GyL4XKb4DRCZgnII91tczhuEndI2P0WEBgOOtGvXTVe4E/IRu6afZ1nB/IXc3OdcsoyBUalSAvZVs05YkhBs4YalBTkgl7/+Nc13KXP8V8FYculSePWX4fFitda4ACghvbbrSIMac+Rift6XingS9pXBYLO03duoKDb6t9//3ZkbFrC5Nr+Ys5Udhz0uDWaoxPGd8La8jmfHH+CTy0FhnKxffCJ8TuTv00LCOinNbLCWnQEuS0fnVXvLY2i/32S33Pd2Phjvqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbXB38SUTgltPz28Qrbj5oXXKCfe23ekoxc3LjZrCj4=;
 b=Uk5ZvW2XjrhF55mroyq9r1J1MXZTRDnVmt25JPun6SVbPHEYuwjv88KO7KKpl2Jwl5VtK2ye4POVjCE3N6usuAFFN1Bj8+G0eklBRrFQWdOCF1evYoqc8+xj/m479ApBx/2fMKLQaYiBAv95GfvNQl/hKXHILo3GEMetWxC6Ta8Ke//elW0NTgk9FMgbiPbie/AkRnciQKd8H0685AVCBMc+TE8pdpFMcnidh3jDcTemNXBsB5t1gvDmt+pbKm8/tXlH6YYkV+QXOB2fN6TT7Zm+JSUbhYkKKNrPjWCjI+I//bxDxzdX7d1yomx0cPJb8SPUpP7itGRW5yiPjeeNig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbXB38SUTgltPz28Qrbj5oXXKCfe23ekoxc3LjZrCj4=;
 b=ULF/oiWs23LHbBNk+vejikbK1FT5bQkDAWfG4U8i/7Z+VlzWKWx55Ko/bNbZtsuGZwDZUw4FqRWehWPb98eAhsdF5oeTBECaBpMGkl+EqZqReIig2ErCwptcVO6Bx6g7CGjTgMgD6zN3Jr7P4oauU5V7KTPAC601ibJ1aGB+3Yc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSAPR01MB7280.jpnprd01.prod.outlook.com (2603:1096:604:142::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 22:30:10 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 22:30:10 +0000
Message-ID: <87se7345qm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 02/83] ASoC: codecs: framer-codec: don't use array if single pattarn
In-Reply-To: <20260603140939.091f126f@bootlin.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
	<87zf1nhqxx.wl-kuninori.morimoto.gx@renesas.com>
	<20260603140939.091f126f@bootlin.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Date: Wed, 3 Jun 2026 22:30:09 +0000
X-ClientProxiedBy: TY4PR01CA0115.jpnprd01.prod.outlook.com
 (2603:1096:405:379::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSAPR01MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: 12607daf-5c35-4ee7-4d86-08dec1bfabd8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|4143699003|11063799006|56012099006|38350700014|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: TzHfVoj7TpgdvJ0HaGWwBMagVB+iozqFbkXG3tqI/A+k0Q2rZwkMIB5Xx3ck6auLWKhc7o6+wZ4bwSxnZ9ogH8It4qEBWtw1aIsCJd11CygAQ1F4yyZtNvDSoIIp/lIJC85yb94H4WAHP87hQmsft9/ZyUOn3u/CUHqDhFepHbaIPsFIb71BPNQJk6n3dUf49wwd18j/MdGNOBeG3yJaspINvLZL1noqZINg8S/AQF66DylY/EzUUU6WtLvxbhfMDQFrznaVBzSrubhuIXUejOSR+c/RiKsDaMADknHbfX8sEqhCY233XPCJzjOD9CdgdkYMdVF6qd1DDRfSpj7Xp7eAliJrUvjQ/pz6evXYjVra64yWF9m9XZ1+TbBFnAsTRXg/DbGpN7JsR+8mfK6CF2bccqF8N7qBst00qqedEkfIQ1U8hK3lJJItYdngZMgQTYsREmzb4lQzLDoSqgNrwRc3SCyed1/YcNEtOnSyIlHKk8jXB9nHhKph5kqYOX62GmzM2lnh2humnTqNrV8Me8AJg7DL48c3WTJnupZdYNHrs0q5J21E6JYzQH5ECf7zt0RE6FBXRLn6c1axLC4DFTEMsCc6qEh0NGBWcMhwF32fZSOdZjVzcuVOmv4QlGmJXGjwUrTnCYHijp7U3rBpcGiAKjewtJQEieXKxU5wUwRU8ci7adSQI2R/1W3Qwx9z7u5upyIbtWXK1p56WD+7WayH0vfH6e8OkUyTrBR6oqpwrW5uuMy1KVIg/4z89G5fGC2T/5vZdSWTCG3Q78Uy/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(4143699003)(11063799006)(56012099006)(38350700014)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lijGfEg2qt0pQmb+mOI2PAFjEPX5cvZTcz81IkTfz7udR+nM8t7IJasJJUvA?=
 =?us-ascii?Q?BkFvJ2fR+7rRjtqcfD9WtFILE68AkGFRGZgLf+1/SGECmnVxZTGtHkc6n0m5?=
 =?us-ascii?Q?z0ZmomtME2rKjn6+MJD9N1bX8ZQ9Lhg9LlSzvEIgIogY1EY+b97qbuWHWwzu?=
 =?us-ascii?Q?S+UNO0yTdFJuHat548RBYCSdywiq+Z/aiBuj/gixLL5aT9Solk26WkaJ/bbJ?=
 =?us-ascii?Q?BRByFu8MTY0oYso1I89HeeJ853ISSyvLqom7RqMbchmyPsggg4AHeP/2oWcw?=
 =?us-ascii?Q?D1tK2woenELOe9S4eZ9XvzhydxAXzlNL+Rzz3pU+o+7hw/SSOQibgCq9n87p?=
 =?us-ascii?Q?vWUm+czOwilM92gdCGaHmfngiAxHQd/dhheYlSTWMIXI02ijWSlIdMUORkdS?=
 =?us-ascii?Q?udpFHyuEIi0ewq5VVw1l36NqBWxtG+Z0xLIWIx0RnujNhxGbNXWTN1GKsKfS?=
 =?us-ascii?Q?7XSE5aTWUrfyJXvrKPKTbjgVKymunDlyBj7OpewOFWqREFbCj0C72+mQhowz?=
 =?us-ascii?Q?TxPXra3+QqOtEu/zl1AvgtUsn8pSYyGsbYNwegoxsrQD9YJVaUSr3IBRgmjw?=
 =?us-ascii?Q?j339RbHAgPrcu/nAR4xIxBQA2sO1rWWLmZ4EpFbk+ez2Q9o8zf+2nmbW5Ns5?=
 =?us-ascii?Q?9cEnW9dpfldeBEzGc9JuDspkKKrrijTOSplwLQ8RZFmkYzQwehu9tniQD1fB?=
 =?us-ascii?Q?oPyFA1Av8VrlDRZlhcUvyOSJ/4BbSED1f46A1jDRWU6rFVpdf2Kbth6RF9/q?=
 =?us-ascii?Q?3WfjMI4zS19/1BQ8GOEsS9eNRRrgYp61eMrbbYS3KH7uu6qQ3uoWlYrECcCA?=
 =?us-ascii?Q?Q/Pmp+hY9uWiP+nw2MJ93u/CE3MoqRww5y0rRajWvu1cWKwFsGQzUIfTtJaI?=
 =?us-ascii?Q?+lAtn+RdnSEN9yJ+SygTCHCAJJGKAJeHtvQsco0xD7CqYsRgq+lgFYgHl/MC?=
 =?us-ascii?Q?XhtHQOOwosIbVUeqVBLqW7WY4dhQzkfnD3oKDnWS8UNSU7P6NE7csts1roqm?=
 =?us-ascii?Q?cwfCaguCX9ky4q5Vmq1nvNR49bPEfeO14KCv08n0/TGWf3SgNVQm+jvIrO72?=
 =?us-ascii?Q?l0ry2ZVaIJhpJtkwS6Mz4dCchmJq80SlX1x6k9dwK8/ojdWJmNMXofvuLUDC?=
 =?us-ascii?Q?aydCDmVSal2VKz4C3hWRuUnGuGEIbqj0lpnSr3UyFou9GNxpg76Ghv1gH2wG?=
 =?us-ascii?Q?Cq31PW8EfXdtNBNvh8NB8A4fk1gzCEzu7/HxlqdYG4eT/mDCA59Yvi6z7aHq?=
 =?us-ascii?Q?9VvX53yqqG1rwPmdot49PgNfjS8KIdh8h8Y8fMmQ99WvWfVoa0BE791bvRip?=
 =?us-ascii?Q?iFJaBEa+yYEn5uCnfV0uXVDNrd/FnYaqBEBiGjtxdlV6NRTGvvH3lhISs4cD?=
 =?us-ascii?Q?pkCYlUo1S6rmoBUNu0GUZdWMfVemPowbfDSp6Ek777P6jfkyLWKtGtP9El0p?=
 =?us-ascii?Q?9Ghr+8TeF4ys/ILqWWMYXAnyMkRKaa2R+HzDia5nyC603B4UnX+9qkBcGfqS?=
 =?us-ascii?Q?KJCfdec5Bt1Eb44J33SLn7MJ8cYUqoSK7n9vCOnznTI7bqdM3VkPFoVwQRwj?=
 =?us-ascii?Q?b/fF7s4jePi+DBbVhWEgeJvi1XzngYhHJqpwFNUrpGp3IaC0g43/7p8064ZW?=
 =?us-ascii?Q?f4i7tmukWnPoQnaGAg/RfmYYuuJzXINCh6wMSsWz221+nQwNIX1JeervuiKF?=
 =?us-ascii?Q?q6SqRaPYePYZhToevnWWbbFBruSKi1cGVMvNACGEgRdLxUXPnmVvjVHdKyBx?=
 =?us-ascii?Q?5euAeZDvxxCg2LmKfL4PNJ+TJ2Qrl4I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12607daf-5c35-4ee7-4d86-08dec1bfabd8
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 22:30:10.0343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EyC61S6I4F1H/JUrqLmYIDVpFK/SlSm13DNt6xUltouV4dvhcRjKpd8NRDA+hLX49R6tOu3NrKhHMj8PEAtVUobxHahqkGQLa4wogB/tn+T5ZY2VVwdW9b3Hw9vVFBbs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7280
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_153018_559580_4782A4D9 
X-CRM114-Status: GOOD (  10.30  )
X-Mailman-Approved-At: Wed, 03 Jun 2026 17:35:58 -0700
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
Cc: Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Xiubo Li <Xiubo.Lee@gmail.com>, Peter Rosin <peda@lysator.liu.se>, Jaroslav Kysela <perex@perex.cz>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Cheng-Yi Chiang <cychiang@chromium.org>, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, Vishwas A Deshpande <vishwas.a.deshpande@ti.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Yixun Lan <dlan@kernel.org>, Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>, Jihed Chaibi <jihed.chaibi.dev@gmail.com>, Baojun Xu <baojun.xu@ti.com>, Kirill Marinushkin <k.marinushkin@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-sound@vger.kernel.org, Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Scott Branden <sbranden@broadcom.com>, Masami Hiramatsu <mhiramat@kernel.org>, Sharique Mohammad <sharq0406@gmail.com>, David Rhodes <david.rhodes@cirrus.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Max Filippov <jcmvbkbc@gmail.com>, M R Swami Reddy <mr.swami.reddy@ti.com>, Guenter Roeck <groeck@chromium.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, chrome-platform@lists.linux.dev, Thierry Reding <thierry.reding@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jonathan Hunter <jonathanh@nvidia.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Jerome Brunet <jbrunet@baylibre.com>, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Tim Bird <tim.bird@sony.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Zhang Yi <zhangyi@everest-semi.com>, Biju Das <biju.das.jz@bp.renesas.com>, Chen-Yu Tsai <wens@kernel.org>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Kiseok Jo <kiseok.jo@irondevice.com>, linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Bram Vlerick <bram.vlerick@openpixelsystems.org>, imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Kevin Lu <kevin-lu@ti.com>, Krzysztof Kozlowski <krzk@kernel.org>, Fred Treven <fred.treven@cirrus.com>, Fabio Estevam <festevam@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, Jernej Skrabec <jernej.skrabec@gmail.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, Kevin Cernekee <cernekee@chromium.org>, Benson Leung <bleung@chromium.org>, Support Opensource <support.opensource@diasemi.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, spacemit@lists.linux.dev, Liam Girdwood <lgirdwood@gmail.com>, Guoqing Jiang <guoqing.jiang@canonical.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Paul Cercueil <paul@crapouillou.net>, HariKrishna Sagala <hariconscious@gmail.com>, linux-riscv@lists.infradead.org, Shengjiu Wang <shengjiu.wang@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Robert Jarzmik <robert.jarzmik@free.fr>, "J.M.B. Downing" <jonathan.downing@nautel.com>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, Hsieh Hung-En <hungen3108@gmail.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Shenghao Ding <shenghao-ding@ti.com>, Nicolin Chen <nicoleotsuka@gmail.com>, "Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= \(The Capable Hub\)" <u.kleine-koenig@baylibre.com>, Tzung-Bi Shih <tzungbi@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Qianfeng Rong <rongqianfeng@vivo.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, James Ogletree <jogletre@opensource.cirrus.com>, linux-mips@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Alvin =?UTF-8?B?xaBpcHJhZ2E=?= <alsi@bang-olufsen.dk>, Ben Bright <ben.bright@cirrus.com>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


Hi Herve

> > Because it is confusable during debugging ASoC FW update, tidyup
> > auto format style not to use array if single pattern case.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
(snip)
> Just a typo in the commit title:
> s/pattarn/pattern/

Oops, thank you for pointing it.
Will fix in v2

Thank you for your help !!

Best regards
---
Kuninori Morimoto

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
