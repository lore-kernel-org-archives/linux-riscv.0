Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCDC606A326
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 03:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NlhYqYnC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tsBC5x/bg3Z+ks6Nt8puFq2NZAZ3DoSguM6gTDAHOSM=; b=NlhYqYnCtzeSP0NnLX2YHslROl
	FngHQmWIqswLbL+j7ZIZNxgcFytDMsHmZx3myWeg3bcvQRY6IOxeXmOTiwifuabT3z/3XM5ayx6/4
	LGpVKQyc9hRcZXnMuF+RsME8Tf9HRAJtwb3z25yszISEmAK1VxXrmDgaoxpPNNPujn48gu7T5MkJR
	5i/ho0lrVkHVYcicz/UybFhk98caKQ+CcjaLXhWBeWtAyOJxopdHRjJgaw+MUnO+7llb9eCoyhp4R
	5itQa/v5sQJ/8bT54UqHoaIG88MY1/iIoGlFVWObTfescmpVQ0K/3o5pJ/+ERA7EKwP3qb81NZ036
	0mTGy74w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPX1Z-0000000E83F-1E8C;
	Sat, 07 Nov 2026 03:23:25 +0000
Received: from mail-sh0chn02on2071f.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::71f] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPX1V-0000000E82d-2nT6
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 03:23:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZdy24yRnC+YSbAXKLtByYnoAdVqCBTfC+cbYuxMzO+r2BRWWxZnu/4OhCmlw8o77BuF7TiSyZqmu5etPDVBp0bMjcKdyCrbkDse6P95tw3Q8FZyyafOCKJxZbjP0SwAD8hDBX1SfkHBFSJN5F9ZiVxSwDrV5XHSTNr2E5eAFiFU/JOefgzynikvKcSfKolxCTYviL+nswprr1IfLFNjZtP4cpDxXy9j5buDahyu8wu9S2gbXcPVPUhyCJ5HWswA78CZ5QgBzdxBxOFs8tsZk9LqNgfnmomtUMETlbYt+9AAM1Kwo2NTy8bU+PPgaePtbWjtWlZ7DdcZXLLVtLzPtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnqz1cHie14+s4kyIfjZWJPcD2V22c6JdUl+C5oo55Q=;
 b=nNXWbn3qcHPnBoJnBW2clg4xu9wMhFF639iCGrqqEpbUzxR1tCMnZyWb4mrX2bNjsMjjr8s1StLp1NvkGZl17K5Uh4t5JkKku3oEkjhtFOc56ZpEgttOurhtNXC7fL+CUtHUl0Yr/fW0hoHT3fvtRaTCJkEEtyZMPbk9LcKNl/dCQxoFTsBUVPmrY9xD2Jbq+PHD/eRgEU6ynDzFYNKuI3HVwRL3CRlVgAyGfU6BAD2le+UP6AbYZ+nTC3rbtWBaeBZiW1WEA+9BfSOmv3FBXwrCHtvnobDDwrN9Y+loLEghOYjpPe8NxLzS0I3mW+buPZcof6ni2muFT1IT6KfblQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10) by NT0PR01MB0957.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:6::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 03:23:12 +0000
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 ([fe80::be4a:d29e:5188:b37e]) by
 NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn ([fe80::be4a:d29e:5188:b37e%3])
 with mapi id 15.21.0592.010; Sat, 7 Nov 2026 03:23:12 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Conor Dooley <conor@kernel.org>, "ukleinek@kernel.org"
	<ukleinek@kernel.org>
CC: "patchwork-bot+linux-riscv@kernel.org"
	<patchwork-bot+linux-riscv@kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"emil.renner.berthing@canonical.com" <emil.renner.berthing@canonical.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "linux-pwm@vger.kernel.org"
	<linux-pwm@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [RESEND v22 0/3] Add OpenCores PTC PWM support
Thread-Topic: [RESEND v22 0/3] Add OpenCores PTC PWM support
Thread-Index: AQHdKHVcUHYiMwEYKEiLBGQTFfpjtLcaTHiAgAA6KyCAAIl/AIAAo5kAgAbIThA=
Date: Sat, 7 Nov 2026 03:23:12 +0000
Message-ID: <NT0PR01MB110240F13DA3D2EEBC9528A6E6752@NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn>
References: <20260810030714.48100-1-hal.feng@starfivetech.com>
 <179357141185.2624073.8394896290201314670.git-patchwork-notify@kernel.org>
 <NT0PR01MB11026FD52BC4266EFFEACBD5E66A2@NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn>
 <auheO4sRs4P36jgw@monoceros> <20261102-tidal-quintet-3867b525d891@spud>
In-Reply-To: <20261102-tidal-quintet-3867b525d891@spud>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NT0PR01MB1102:EE_|NT0PR01MB0957:EE_
x-ms-office365-filtering-correlation-id: 54838b51-c652-4abc-0a6d-08df3c7e7472
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|38070700021|261102123227099003|4143699003|261021121427099003|56012099006|261022075727099003|261009223027099003|261022105027099003|261026140227099003|261026121527099003|261028144727099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: uJhWbQT/ldU6ue7Yh+YCUfvJ+Jr55IJROuycZ9MPt07dyzWeGfstl8QylYm5Ce3yqEuTaCHWwX2tgPBOGbiBc5w59wy/xEIoJRnVd2YQUvHVmNXbfwXrCNaa5kGqRKabWHlBy8xh2ql/K/3I9FpoetnZAR2ifFulot5ABZkMH4NoDS2qm6Y0JobFxZFzO0fY/IqS8nNH9WAlYPFsqZ4A9tzFrZW/ZnXxOTKBVQHxSIJXvORQEKP1esLIsE0OOH3RS6WeO2F+CQC3OXhkPFps5zuFDlXYrtgUe84pAH0dFksod0UUl8g+2nNJZ1ZH64NYb5GzlmpaemfkPA1+Ae4knGn4yYZMUxkNt17rvydXZdf52hp1aiAuBYI7qxma8DGqjA579bZcOI/RlbGrGIvpAlexm5MGgleiW7AY9lnQ1/oqd3pRfw/u7fuLTX3Oel9jN7AiH2iLMmSIr2T5bG9SZUFyAwh7zhq+mMl56rKkB+p1009o4mJsRxRALR+NOTjUqeMrT/KQfNfkKZH6NpUAf6Ayw9NPmhcA4RHqLeuHIz8vQKLGH94VVNuByDSDTmon
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(38070700021)(261102123227099003)(4143699003)(261021121427099003)(56012099006)(261022075727099003)(261009223027099003)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JzNDKsHa9eH78OLM3KZK4q1hzCbUhl+DircNcSPhQXRicC/TIQqnJv10HvL0?=
 =?us-ascii?Q?ZcJLLFXJSLs3c8TmeVT3LiooQt/a2etnYvp2Vc0MdiGxEutcNYZzpS7wk9GZ?=
 =?us-ascii?Q?rRmWxia5lkk7R66wtXpWgphkpQ79ml1Q0RxDPRWgJhck8tq+iMF+DfR0NHvt?=
 =?us-ascii?Q?cQyVQNPzQdSu40FHWLETX2gXEbQEYP5toxAzgjGAn4IAOPEiQ3TPwzGTS/LU?=
 =?us-ascii?Q?gu++PXchqIjSq0R1ZN+fDAcefzbJmSgV7MRiW+tpSkqflThc9eYbcDthmGYM?=
 =?us-ascii?Q?nPcp9F+tcYCabCgKPDpTgWaYBPhZmEfhh5yB1Z3p4OWlh88w6fBQ7rbl1Wzd?=
 =?us-ascii?Q?C5V+iDSo+eRccmxx93U5HLJ13xwwiRBDVwm/dHc047/yydo8V4ESTXIrydYy?=
 =?us-ascii?Q?BhW0F+dT4b/I2ZyCxbSK7xFOwMBvQa3zcY8xEIe1aXl831qBP4mKg/pHe9Kh?=
 =?us-ascii?Q?X0DWnTzTCv3MYBc3YCUYQkZdASl7veWRDHGMA+DHhLO9bMZSwZZ06UMq1mh6?=
 =?us-ascii?Q?fKa6oY4gxD3SZmx+367vDrRVQeWIEZ4Bf8gOlUw/9p0yV0EgjXwI9UuzIemN?=
 =?us-ascii?Q?O5OJmSO//VkxztN+uMzsO3aabyubQB6/u/DAoO5Q4ODTKesyy+9wEU3rtX4d?=
 =?us-ascii?Q?mRyuWc8tD3cFXOMtISSMzJGRZu+qi/9qkB7HPvpHImgVKNnJThSZAp2SoQP+?=
 =?us-ascii?Q?lIX38aChYeyDgcvPbs/LjQp3g50Sr94k+bkOwHAhGtWTN+IInojES5JEq5g3?=
 =?us-ascii?Q?17gVaTDQI1THFQD3tEofv6gMPZvfqQBsIRevBowD2Tz2pWa4UpQq7kKVma8d?=
 =?us-ascii?Q?3WpIeYQqT2NlykConBsMXbM+gokMIn1VG72xo4ItE3lfmsW82P2QE+5UyDsD?=
 =?us-ascii?Q?bQQe0Y/v5AdaTZ1/bx0Iw6scSrttd7adKQYVKHl6WQP2tfCMcgHRHOY08AER?=
 =?us-ascii?Q?yH2Pw4IKtJz4GByD4xkIzHLWeVZkfBrt8zSqwkVLRsYiymRtRXFRbI+nnymz?=
 =?us-ascii?Q?VIshUIVAd8IM5ucP9uX/j2QanXEpeXEfvRrFCTEoSSR6/wsIZta+8Ib+3KLZ?=
 =?us-ascii?Q?ODeX8xN7YbCg4CAb6kNfHTgLSrLkpevHS8l1xmk3r5M5kbibxHm4ai2gW/Gt?=
 =?us-ascii?Q?O8uTQvJAE22NXy5mCq0IayhBMzUJVB0Ugu16aVya3CMb6fgR81vztzg+MeWb?=
 =?us-ascii?Q?6f/CB83dhGkwUOAMOsq82EU6c9rgtFBzB/+/094t0y0Ijc0xl7uwVaKl5kBm?=
 =?us-ascii?Q?+6HHEsNkrhjYMIRM2nvDpMFuuA/1Q7nPIOSx123HU207pcr7y7YJyQUjom8R?=
 =?us-ascii?Q?ZKkjmdy3vf9srAfAQjscAXqyrYSWvkLUsDZqXYm+kl09kT2qegNdJiT5QAaY?=
 =?us-ascii?Q?Qi9u9Ecm1NoHkOBVl5v9HjPn0MsqFMnu5/8dEvSHkiYrTcCTNZDkFYJ1Ej7c?=
 =?us-ascii?Q?8dIx78ckqK603gtTEOVhdxg9VGV+2W14pCMoFSpFY5Nj20AGoj7sLQl7zQjy?=
 =?us-ascii?Q?yeiw1Bs/gB/qmdalAHSLHkMmpfZHe4AQ0iLmEmeuV6SsX3ULGKgNtikTcEV5?=
 =?us-ascii?Q?ZCN+yhFxNB4IqYygvh5vUWaEuAxBax0kWH0wI70eGZ1oUqA8cbqAxb3740/x?=
 =?us-ascii?Q?AKLzAjCDbq1TtbEDvCIgPE3cMPDImh7lMKIaaV39wPefHfIM+sIY/l6Fgq1s?=
 =?us-ascii?Q?SV7G6PcgvHI/aMRxeRpz7vXsk2Psf1BzV0uf4pwxwOQWnLnONYmugn4ljlLb?=
 =?us-ascii?Q?OfXtLdWenA=3D=3D?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 54838b51-c652-4abc-0a6d-08df3c7e7472
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2026 03:23:12.6864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IJ4RyN20dp5KJERDy5aEa1P8hwfFG/Zf76mA7A0TiAdlyXB5lUSEQWF4fjZ0el7MFRI0xtcFEDB5A4Tll2tqPonxZA4gLsyD2iUOeURA7pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB0957
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_192321_903293_B3D50635 
X-CRM114-Status: GOOD (  25.83  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> On 26.11.3 03:43, Conor Dooley wrote:
> On Mon, Nov 02, 2026 at 10:57:10AM +0100, ukleinek@kernel.org wrote:
> > Hello,
> >
> > On Mon, Nov 02, 2026 at 02:11:46AM +0000, Hal Feng wrote:
> > > > On 26.11.2 06:17, patchwork-bot+linux-riscv wrote:
> > > > This series was applied to riscv/linux.git (fixes) by Conor Dooley
> > > > <conor.dooley@microchip.com>:
> > > >
> > > > On Mon, 10 Aug 2026 11:07:11 +0800 you wrote:
> > > > > Add OpenCores PTC PWM driver which is used in StarFive
> > > > > JH7100/JH7110/JHB100 SoC.
> > > > >
> > > > > I will maintain this pwm module in place of William.
> > > > >
> > > > > Changes since v21:
> > > > > - Allow non-zero duty cycles shorter than one clock tick to round down
> to
> > > > >   zero.
> > > > > - Drop the .free() callback to preserve the PWM hardware state after
> > > > >   pwm_put().
> > > > > - Update the comment.
> > > > >
> > > > > [...]
> > > >
> > > > Here is the summary with links:
> > > >   - [RESEND,v22,1/3] dt-bindings: pwm: opencores: Update
> > > > compatibles, examples and maintainers
> > > >     (no matching commit)
> > > >   - [RESEND,v22,2/3] riscv: dts: starfive: Correct pwm nodes
> > > >     https://git.kernel.org/riscv/c/2186ec5f59c2
> > > >   - [RESEND,v22,3/3] pwm: Add OpenCores PTC PWM driver
> > > >     (no matching commit)
> > > >
> > > > You are awesome, thank you!
> > > > --
> > > > Deet-doot-dot, I am a bot.
> > > > https://korg.docs.kernel.org/patchwork/pwbot.html
> > >
> > > Has this patch series been applied? I've sent out the updated v23
> > > patch series, but Krzysztof pointed out the Tested-by tag should not be
> added in the dt-bindings patch.
> > > Should I send a v24 to drop the Tested-by tag tag, or should I make
> > > the changes on top of v22 if it has already been applied?
> >
> > The way I read it, only patch 2/3 "riscv: dts: starfive: Correct pwm
> > nodes" was applied.
> 
> Yeah. And the mail is a quirk of me not removing the thread from the
> linux-riscv patchwork and pw-bot autoresponding when the series was
> "applied" by me to that tree when Paul fast-forwarded it.
> There should have been a b4-ty email from me a while ago saying that I had
> applied the dts patch.

I've sent out the v24, please check it.

https://lore.kernel.org/all/20261107031251.98972-1-hal.feng@starfivetech.com/

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
