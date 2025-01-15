Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FABC02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 06:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UlqO/9+o56RTCQ0MM1ytikEGao31tf0idzdWMHbN13A=; b=bYjYOS6/GXHQYL
	P+YyI8KJNJ1F01MaSwV+PreHxirsrXZA5G6Vc/E0YXvnJyAeyu0IVAUScPV/1fCfaRYoWbhSNPzAP
	UgaFTBahS7qoHd0dupe/16O32PUdQ5s2K4rs3ZNFb4knGU9DaXu+8dtZO4NBHfUAVjUpNMXdL5XsI
	CCxNXmCJ9dvLbdOEW5Ym3MKUL6k3hVkP0RZCKEjtl0H8XG40guLHw5CYDDgzMoAAN9+664l/MzEdo
	+tiBQ7QIen5K/hZUdU0KGZzOnRYvbO5cgg+BBY6GZJyTRH7+Ba14tpiOlPp/ZCoRyTnHbahHdkAxv
	6/1qsFg19CoUe/Tc9glw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXwxs-0000000Ao0L-2kgD;
	Wed, 15 Jan 2025 06:33:20 +0000
Received: from mail-sh0chn02on20702.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::702] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXwxn-0000000AnxA-45op
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 06:33:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUrogUA1p79v46MdMzIfhf/9e2Fg36iOwzoGMVxybNVC9ZOzrqJjK3pfleWm7RcvRbnQAMo556mWh8IbSLI+T0sXzT3ONhyvW1EdzKQOzRWo+JcOwX2yZXDZW5G54tIDQTwOnCqryTijL+oaVtBLcVsiOwkuHWVoViaplWgnReYmaJfifecj7nDIZCIM9AJw2mcLRwib/fQxsgZHoVSQaRj49xUvVtNgZrgfVT7RtI7BdWzf0KLiBeKx1VuRGEZ/r0zoKiaIES6OZ3cLYol4UPMMOfHvvfvcEZ8j2l71EAYRqmdceRWch+4y+LQ1/RXBSkDSqNLVoYKDNTUzPCFzaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsMrOogKvZ2Z34J8tgkpd6BIpMUol8hpOezL1QzCSVQ=;
 b=GbYnrK0mFC6siOrOSmfR1pf+P0TWcmN0/Z5FHgel3wtkbKe9vRyZPUoTEJMCj0KNElvd/yfLRCKmj/8/04KWLm0Nd17iFfH4B7q1HVCEnoMpu5hS7XYWzRA46ldIlGSegu6kNZi/TYNA6lD093JRxSS01hVIpbgphR6IKA8FXcAtTt7BoDdnYFx8D7E5La6s/WyWcJpBK00Cd4KGu7VdZqygD6WyeL9QYrxbhNx7ZrASJ943Q77CpFUFGKbo0rdgan7cioH3Ih7Dvtyoyu9NSI7FgFw7s+wZHSYkHuMPZYlhJ4cHUDCLL3nU0a4uthr+jwIoYLiv7U4NFbmf+YLqZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1161.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.20; Wed, 15 Jan
 2025 06:33:08 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%3]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 06:33:08 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Conor Dooley <conor@kernel.org>, E Shattow <e@freeshell.de>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Minda Chen <minda.chen@starfivetech.com>
Subject: RE: [PATCH v1 1/5] riscv: dts: starfive: jh7110-common: replace
 syscrg clock assignments
Thread-Topic: [PATCH v1 1/5] riscv: dts: starfive: jh7110-common: replace
 syscrg clock assignments
Thread-Index: AQHbXuxdxuZNa36t4UObgTOkoTzN5bMKL5KAgA0EEvA=
Date: Wed, 15 Jan 2025 06:33:08 +0000
Message-ID: <ZQ2PR01MB1307A9E106AE06E144875D6EE619A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20250102194530.418127-1-e@freeshell.de>
 <20250102194530.418127-2-e@freeshell.de>
 <20250104-mutilated-unpaved-008eebdb200a@spud>
 <56c372c3-bb8b-4150-9b34-a6cca906d740@freeshell.de>
 <20250106-suggest-waltz-47d7f7760069@spud>
In-Reply-To: <20250106-suggest-waltz-47d7f7760069@spud>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1161:EE_
x-ms-office365-filtering-correlation-id: cbc08ad6-5b04-49a8-2807-08dd352e79ce
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|41320700013|366016|38070700018;
x-microsoft-antispam-message-info: HF3RpKvAFe2E+jeDLL1bBfq6Qz5LpsDckdgqhozK1lDEqZD3ZQYSfgegan55wEpx5rO97bW4hJQVVxUc7+O1YmrL7Zb9G5qI7W5fTJ/b5reqoWaeN6/Jk9pxulRRs1Fo88ai2y5jWpqOwsJLYS0l3o3oajkwwU7nyHSJ+U+T8l63Bk1TKKyJRzlGMyeUA3GR0WxuoQJO05Efz7+UGP7WW61VahEhnDmNxLO9hiouwoxb5J62B/v6kFb2GbDB4bdsdqu4puk0WlrYcPisw7yxF+t8nT1YVmqt9x11dNX6cLPYT0WJ1lECh2efJmyOtDRuPTnsnKCNKmG+iTQgrEa0c+zuvQt7Qrbgb/N2xwEZWmhN9Qol24/mkl53vYZpDF85gvgw7+gS71oJ0ojrTLlHorn6owxtCvznHMR0Sdyp4/A8Fc8q/TMoGykDS6kB0CqQUD5JUDUBN6TDUo5FihjEYOGJ76llXrY5EKEJoRIblQm8xAXG44wDYGlkOaS2FPkjYYRTS3bBzeTUzVpgm+1M+0zCjKZegr+yv7/R6LNkP5O89sZZSBZBFkkA782fjrfQC7z0csx4ApdHgnBoJIsfCJtD7zKJTEvX65Xq4ZJIyXg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?80672Omtatjd24KNZRbVrgCYtDhLk9SkiirZUwgnVeKoDaNGhyIP8kCw2sla?=
 =?us-ascii?Q?m7AqIvptldY5UqgdCyvDL3MSkWad11AeO1ZcEvS3LSWj2TVdUc+Hv1R1mzgQ?=
 =?us-ascii?Q?+SAP2gcwh2EVMCEa+JQhzJmp9PwVhpP2cGBghYnbq9NLlRd3wBkdkN0lYHDm?=
 =?us-ascii?Q?gKb+MSkziiKDDDTMpc6EIMgu9scPwZi6BaNWUHxoGckb+hVHkkS5IM60Z7nS?=
 =?us-ascii?Q?rjqoT8Y5BKS/c+ETqn+VQP+qJJ/Ffr3sE323R+y70y0Fx34RZ4F1Zvg6rAEE?=
 =?us-ascii?Q?/OmHq5dwDmQganWkxqbfK6bm3reVKr3frWVp32iziNdirSOCI/DM/D34t5qK?=
 =?us-ascii?Q?acZOFQXI40m3nPVCFCmtuYqFvjVcZaXT1+saGYE7JHGJK/T1jYKDP41Kp/KI?=
 =?us-ascii?Q?odw8UhD6GGmCeoWEMG2a7OmjhB0Mpzxs4xOCjJju+tnTwCTnTOm4R6GO+Eiv?=
 =?us-ascii?Q?Z1tQuM2+iRKH30spmOupsHRJzhcUX3IMhSrrleVQgGOWpqoqCUSUP1+FXhzT?=
 =?us-ascii?Q?6WlalW4oxNGEwR5xjNv8Tm7tKybwQkgTBPPn9U2npdoqQg/C6wAnb29fvOzX?=
 =?us-ascii?Q?3E/qaBVVNmi477AThDAndqfhmlTSegfL9T1EyLO3XikvVd8vrgnj/SUgqaP0?=
 =?us-ascii?Q?POsxFashHYS8lFUEigqR46BvX2ndRYHGuvxMH1dzS6xCjbIha5cUOMgl6nzf?=
 =?us-ascii?Q?+M6tAD1qmeTb1SoHYMWR6ibkLXeyAAhGaTJXxnyAzYn6WkziNYn7/RFJbf18?=
 =?us-ascii?Q?8vWBuUR5EIuileCGof793lbFDC1njAEPjINRjGV/bK0mzPB272xi2yRNPnIT?=
 =?us-ascii?Q?DV/Mrvk7kpTYt345/J6/TDMtIuBVbAUBsvlXk8fzazWO+DKaA7hYJ1A1JElt?=
 =?us-ascii?Q?ipPp/zc2nlQ5A6lfIO0izN3+Xc8Tdaoh9cjWVhF4toZPZTS1zOWMrs+VGsyl?=
 =?us-ascii?Q?qBx62rQ3Qpx+NJyTQiAwXhkSAO2Vsmxp5XpXos2B88QjRlxa7ivmd8ufARsP?=
 =?us-ascii?Q?KDbKKEEhDo2wDbKOWH1W1IKZDJW5nCCQ445JcuDh6Q5sgbV/nUE3QAQZ/ZEI?=
 =?us-ascii?Q?Q88a/PFQ0VZDCj2ci6RvGfxRw7dUqnwimiKXB7QwXoLKHrnoT6WbPu2ooW/9?=
 =?us-ascii?Q?PjFiTXZVK9dWmc0XtUi9n0WbFjOWLakm4lByRIhifMbeFzJMV7skr38DlnQE?=
 =?us-ascii?Q?aFcscDgzJ3bODLTml004IwXcl4nJszl74zOZrbK+7onv3ansgJ3Y+YSIWP/4?=
 =?us-ascii?Q?5bI0ta5AdfXI+EckmRlmDqO8a6dtiHvy0a5QmLu++Q26udjb2lIlwxw9EkCJ?=
 =?us-ascii?Q?HqMG3kn+WZOMBiLuEjsVRRsnRheRN/UqrzTiSO1VRbTsu3WOgQ1LDtylypKE?=
 =?us-ascii?Q?Kdt1gfkGNtz3D2T0zl97E8vTHelckTLmEDMyrJJRVqOZUERv1gWgMxW1Q9MW?=
 =?us-ascii?Q?TsN4njnd9f+eQFRwuzFY/hs5G4YBOkA3D/JJcRehaEWg2M2rxZHuoJ69LCMi?=
 =?us-ascii?Q?+3pYVDoHQdovZ3fgH/k7bwNap/uxz5hnlvlXCWVdXiAzVx34wlaSAHswLnHF?=
 =?us-ascii?Q?BAvKvGisQ9viGNzxnFv19kja3S6wpmqRPD0l8Iac?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc08ad6-5b04-49a8-2807-08dd352e79ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 06:33:08.4754
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hOPMCMXNQglLhXbemuVqJKMScraSh48QsBELZqdG250GQZenFiN03Q6z1GzQp6lTqfhMT0rdMgta4sEKLh4HK7DmAIOHL+4Lm2+PW6flOQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_223316_022340_8CF3FE4C 
X-CRM114-Status: GOOD (  30.14  )
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

> On 07.01.25 04:08, Conor Dooley wrote: 
> On Sat, Jan 04, 2025 at 01:04:30PM -0800, E Shattow wrote:
> > Hi, Conor  (added CC: Minda Chen, Hal Feng)
> >
> > On 1/4/25 10:33, Conor Dooley wrote:
> > > On Thu, Jan 02, 2025 at 11:45:07AM -0800, E Shattow wrote:
> > > > Replace syscrg assignments of clocks, clock parents, and rates,
> > > > for compatibility with downstream boot loader SPL secondary
> > > > program loader.
> > > >
> > > > Signed-off-by: E Shattow <e@freeshell.de>
> > > > ---
> > > >   arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 12 +++++++++---
> > > >   1 file changed, 9 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > > > b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > > > index 48fb5091b817..55c6743100a7 100644
> > > > --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > > > +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > > > @@ -359,9 +359,15 @@ spi_dev0: spi@0 {
> > > >   };
> > > >   &syscrg {
> > > > -	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
> > > > -			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> > > > -	assigned-clock-rates = <500000000>, <1500000000>;
> > > > +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
> > > > +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
> > > > +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
> > > > +			  <&syscrg JH7110_SYSCLK_QSPI_REF>;
> > > > +	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
> > > > +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> > > > +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> > > > +				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
> > > > +	assigned-clock-rates = <0>, <0>, <0>, <0>;
> > >
> > > Why is assigned rates here 0s, rather than the property just removed?
> > >
> > > >   };
> > > >   &sysgpio {
> > > > --
> > > > 2.45.2
> > > >
> >
> > Assigned rates all zeroes is how it is in U-Boot. Removing the
> > assigned-clock-rates property as suggested does work in U-Boot and
> > Linux both.
> >
> > For context, U-Boot fails when replacing assigned-clocks to
> > JH7110_SYSCLK_CPU_CORE (500MHz) and JH7110_PLLCLK_PLL0_OUT
> (1500MHz)
> > from Linux. So I tried to merge all properties together and in testing
> > then U-Boot failed (or I did it wrong). However replacing the Linux
> > properties with the U-Boot configuration (above) on Linux does work for
> both.
> >
> > I do not know if this is correct but I can test any suggestions and
> > report if they are working.
> >
> > Do these changes make sense? Are there other variations I should test?
> 
> I'd like the commit message to at least explain why these clocks need to be
> set to zero (I assume that means disabled?). Maybe the StarFive folks know
> why it is required?

Here "assigned-clock-rates = <0>, ..." means skipping setting clock rates.
You can refer to
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/clock/clock.yaml/

Linux here setting JH7110_SYSCLK_CPU_CORE to 500MHz and JH7110_PLLCLK_PLL0_OUT
to 1500MHz are for increasing the CPU frequency to 1500MHz.

VF2 u-boot is still running at 1000MHz now. You failed to set JH7110_PLLCLK_PLL0_OUT
to 1500MHz, because CPU power supply voltage needs to be increased before running at
1500MHz.

I think a better choice now is changing Linux device tree as follows:

&syscrg {
	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
			  <&syscrg JH7110_SYSCLK_QSPI_REF>,
			  <&syscrg JH7110_SYSCLK_CPU_CORE>,
			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
	assigned-clock-rates = <0>, <0>, <0>, <0>, <500000000>, <1500000000>;
};

For u-boot, if there is no requirement to run u-boot at 1500MHz, just keep
&syscrg {
	assigned-clock-rates = <0>, <0>, <0>, <0>;
};
in u-boot device tree. If we need running 1500MHz in u-boot, I will send a patch
to implement it and then &syscrg{...} in u-boot device tree can be dropped.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
