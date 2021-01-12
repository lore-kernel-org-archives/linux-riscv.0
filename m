Return-Path: <SRS0=7m3b=GP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1A0C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jan 2021 01:07:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DA74225AB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jan 2021 01:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DA74225AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=xsCOccz0KbF7CYBa6h+222ZaqUMR3GOiQdb1UBs/490=; b=n0VzCntt+FRfBLn4dH7BmLA+c
	Xg6PEeQsfjZQQfIL3e5iCZwDLa0gKerqPLtlMsIOmv9/i3s9lKfi410idYsdpfPtetwxSPbCWmRNs
	qV+fkk9DBV72swKNnTUFC/2hQDxEtQOsL48LhSLCHw0T9q46Gz3VVE77ce1YPfOHbreC0jxl+rBQS
	bLlt60maRLcqvR+atnkKHMlIuAYLck6nWhNLr8ZlEByc4aS1aVCGveXf7Ci0jQ7TNKmirP+zUTb89
	8QjtjA8xFo1wOPAGAhs5WlDQSC7XzJuZ1E4YSHvpV5RIHDJ36FEUKbc2LMKl5+H04LHiHfVNoqRdT
	TMuJwMj0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz89v-000124-Nl; Tue, 12 Jan 2021 01:07:43 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz89s-00010c-7N
 for linux-riscv@lists.infradead.org; Tue, 12 Jan 2021 01:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610414365; x=1641950365;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=g4DY/f4bAaHbSwR3imj3xvIgHAl4vMLVMk3x/d6Iodo=;
 b=DKho1jMVMalRvX++HE3NYNF/vHobfrm6weGfezGGBag+Pma2hbbzbTlW
 sO6S/O8e4bIYtPAnzfuZjAEXLm3ynDa07Ctk+h9WVZ+hdrK+ojLjcq7lc
 +6XpKx+nSI7eYGI5JfjE5bpG+1f4bopeCGfAMfxMrnY7Jlpj1i2bMTRee
 mCQoVd9mChVKoVQjiMQV1EV3Tb9scMm5wMulQT4CfspWOv+uwBSxftsmu
 /eKrB+0uK2w2mMyC3+fhtEMv2zZOCboXO7qHvAgWsUynlTIKSgbCqWcip
 x/9B9f6BJ8HuPPcsmE44f8E2F8A2Sbbi4G/7J9C2nSL1DF++QSkDk5Hhj g==;
IronPort-SDR: 4ZGsue3tJEKeljAjXIR/FUmiJBwi5HoCHh4NuwUp4XkTD0CHRLUBJIOLqo0Zlmk9MkM4vyxmVu
 yCyg3ZcNj3aDJcUylCF5yzrefYPvxIPsoGaffNkw402Tgc0rmiXrf2q2o8cwUiIhDMwTL1ARXT
 uLOFkBBSguen3fm0gZTFUmNE+MosCG5XPqmEhHyNLsfq7x9a3HWBK77VUNCsr2ZxxZ08byzcgk
 hQr1A2XMo/5rdAzVk8Tmom6GtCOD3Kl4GEofcHfxHsFOAyuFIBY9Lw69s3Ag7PkxkNqjISRDTa
 4mA=
X-IronPort-AV: E=Sophos;i="5.79,340,1602518400"; d="scan'208";a="261085984"
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hgst.iphmx.com with ESMTP; 12 Jan 2021 09:19:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dj2ThM/K5tksIRazraQMT670b7WQLa3S0kXJgahZY8iYVfOgxswj0zJoipAMNUZfpwJyIk+0WzMA9yI6LCzzzz//q9Y1uWQ61J8Z5SgPv2nYsgC7htjPHQky5+SWXkGlpq2ccQIT9j/yCtCGAm058QfnoEye0y6rrP6WPVI/MyEW22dw9pRNTva8v938P2Hv5KkxjzSkCjBSkKNTE6Rc/ltQMVFw/PP277wY9+xc3vQhYMD/eFfBxRIS/nG9OGPiDBBLfpihDLMXvKYdWdou9/EwipORh6KTjfEN61guUcA7f+YleXy/d1VBo8tHHrsdeLhfQCYO+4Webp+93SR2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8wTOo/BEO1SmiI3pAUoYCi5B1IHqwgP8WblquMoIhM=;
 b=Yu7/5dP16Cgyz7mHdxMd04otmtzdpQyFOXorLYdzbRSgUNiRkbH2XSUfAPfvq5a6T3/7dNgd9PPT9ACbSGVSwb1dPev7WzLUr/XglAmQZWUXjbxmu1yECcyUTnhYZ7JojzHdbv3M9m2zWL7qz0z1kqc1niDSuGazCTCZGlQflxokXyIVu32IsvixWuGVeYGaJjIfiEORJVuJ3oINRgGcEutCqgkH3MUtRckaEjyHF+W7SFWxthSm2Br8rFm8hUXgmhc1DavSfXzLNBbSXj2wSuFZxKTRTa1QLmyILuK2KyPi/QlvAP3vnytquyOfzzOEK7aH4Il1mUWFeesA+76tcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8wTOo/BEO1SmiI3pAUoYCi5B1IHqwgP8WblquMoIhM=;
 b=jh1x1J+8AXwmad8JLeLB3zL8nQw5KTkjO6ZyESnOU62mk1kpVrQ/Z3Cf8aeL9Ipx25AQM0Hso3E7YGITdp3PTwe3hrdZLMI0PvfCLAAWAUNaXp7he4hTEujxR9HVtgmrM/BI8du9nr4BwtIJAgisZDXQ2YlbdkfcTPuuFllNXE8=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4641.namprd04.prod.outlook.com (2603:10b6:208:26::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.7; Tue, 12 Jan
 2021 01:07:34 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::2dbb:7e01:f076:eca0]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::2dbb:7e01:f076:eca0%9]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 01:07:34 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v11 00/10] RISC-V Kendryte K210 support improvements
Thread-Topic: [PATCH v11 00/10] RISC-V Kendryte K210 support improvements
Thread-Index: AQHW6H4YA3l8oMWx7kmMNP0/pgzYLQ==
Date: Tue, 12 Jan 2021 01:07:34 +0000
Message-ID: <BL0PR04MB65148451DF93AB82F79BB320E7AA0@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210112005848.199951-1-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:5cb8:2b48:5f8c:2c03]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 59f2eac0-cbab-48c7-9550-08d8b6967203
x-ms-traffictypediagnostic: BL0PR04MB4641:
x-microsoft-antispam-prvs: <BL0PR04MB46412041155B26B88BE02942E7AA0@BL0PR04MB4641.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gOeod7CJ3VcmvcZYeK7k2y4SuKd5P0+hkSBM7SNCOuGgpAeJ/667wbUexTKjE4g+zlPCYeIkFQ7m3ffMGHyNXZ7ayoJb+rZSGLAmhqtQYsrvJpNm7jQqk5+QyZYy192Ubv57edCsbYY9vUXUV61ZTkrfKJdXjD+58GD6h41XBAcBsByBauUk2GFxlMbkmB0HXm8XCZ95brYSigZxikpFVJEX/Zz8XWZTzgFFc4LeJIRlyKPD+V4CaYdQI2ctFot7a07hSxzWjE/+7TbIcXrkOWq6kNChGcIf8ta5MuyfpuWpc5CtbLWc197p1sDFAviaZQDkYreQF8MadljT8iXYg7+Mi7E0+ZboMNNRJoRXYsgBjNbG470fBKNb3ABW4atycyP3iswUphfeQEJii+Na4wo1V3YGLNkVgfnqQd3NrNKCsEmwvCXQIm+F7qpQtfXQr3VXXPx/MaRs++C1L51Olw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(186003)(71200400001)(33656002)(86362001)(83380400001)(6506007)(66556008)(53546011)(76116006)(66446008)(52536014)(4326008)(5660300002)(91956017)(66946007)(55016002)(7696005)(66476007)(8936002)(54906003)(110136005)(316002)(966005)(478600001)(9686003)(2906002)(8676002)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Bh2ZPUKccppBgvG0RblZj5RueX+NNQmbYO2/G7ck6OO8J+vGEn8BxJ7rrFoG?=
 =?us-ascii?Q?GAxwxp/DTxSfTz0iycOKcFHm9n/lcmcEpjYuW9p5qxQ0fita96ppneEANOwT?=
 =?us-ascii?Q?ueBxOm80Yq0/m6p8QAYdaJheK6oXdfKapgoTY0+Bnsz8jdTzAdaPOKteyiqf?=
 =?us-ascii?Q?WH6XfnLqPndbU7m9wq6jGzqi4kMhBHRUr95sIPb94BhCl02MWzkq7H5U//J/?=
 =?us-ascii?Q?A6XLdBPZwDGDopoNxXqjyb0hxtbG7ogcbcACurf8EHRGt2RF/7VLgz3FPj/E?=
 =?us-ascii?Q?3IrGxxMeR5g49Ko+Isnt0duMHTWtjjJu7i8eAUtoShKhpxrsIQa5nzSmAtNe?=
 =?us-ascii?Q?e3bO1/K1IQL21oJqftEK76EztseepMH1Uq/R1CEWQdYYiebD4QuhKTi7avhi?=
 =?us-ascii?Q?nXw+rH6RHvd1epTRfMOcp6rh8ApBQoKDI7vr84U1+AYhxcyuXfu128RPVFEh?=
 =?us-ascii?Q?ZtR6yL18tAf4oZPGtBsmmfDDCF2pkphliddJl/+iXzadhKZMA3ndxTHKisLf?=
 =?us-ascii?Q?eXivkHKI5TDnFB6HvtZ5kyJp1IR+HnJ/G1v5H+BBzRtvFuNgolb0wVBfc+v4?=
 =?us-ascii?Q?cUzG6iXu1H6/gi5qkbyN5hsjsnmAaBVBqNGz+HvSu/zKQjtBGg/U0/zAujr+?=
 =?us-ascii?Q?EQGJELfaCsSsOFEAPlFeqZ+C3H0envXte0eRRNhe2bEoRf/Gh5UJZOkj2t+L?=
 =?us-ascii?Q?qbZNCdKoh6s99cnH2GbNggbv2jqMAycHeSUYhqPWXLHZ/tWE+wCVZNuwVI0N?=
 =?us-ascii?Q?2VZCweXhDW6trEI//ZDi5S+t2LPY9Jqd59XZSaSwFZZbFRc4gU2Z4HIgRKqi?=
 =?us-ascii?Q?vK7F3IKKxMWNu7T5LhDl8pMq65FTJbFcSDFxPG56ZY98CdtXTXtYdCNi2nlB?=
 =?us-ascii?Q?NUB9SRoa1iJA3BFVsgYMn7be+Wh04guExGhTtD7udbB+VMP7AH8E04VGIROU?=
 =?us-ascii?Q?29I9RNNabnr4opUdYbe7u/HnQloOGBzkzfKv/6TT+3tCXxPkVKKZp8/zE3ZM?=
 =?us-ascii?Q?wHZ5ZzhUzxWdKUO1r0MG+H5f5Lk0TeN+caQ0BHOyhEah0gF9En90h1k23vaG?=
 =?us-ascii?Q?LrU7ec+V?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f2eac0-cbab-48c7-9550-08d8b6967203
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 01:07:34.5798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IPQ4HUgReltF8TODZM1I7sF1H/ZXO0CW3AuqwRGlEsrNyMEbk+830UAXSqcDJosHLVCKmp4i/kxDu+/iS/SX1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4641
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_200740_626311_AA5CBEE8 
X-CRM114-Status: GOOD (  29.72  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Boyd <sboyd@kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/01/12 9:58, Damien Le Moal wrote:
> This series of patches improves support for boards based on the Canaan
> Kendryte K210 RISC-V dual core SoC. Minimal support for this SoC is
> already included in the kernel. These patches complete it, enabling
> support for most peripherals present on the SoC as well as introducing
> device trees for the various K210 boards available on the market today
> from SiPeed and Kendryte.
> 
> The patches here are the remaining patches of the series not applied
> yet. Patch 1 adds the SoC clock driver and patch 2 adds the pinctrl
> driver.

I screwed up with my git-send-email setup and patch 1 and 2 went only to Palmer
and the riscv list. I resent these eparately to Stephen/linux-clk and
Linus/linux-gpio respectively (suppress-cc and other related cc&to control
options interactions are a bit obscure to me...).

My apologies for the mess. Please let me know if I should resend correctly the
entire series.

> 
> Patches 3 to 8 update the existing K210 device tree and add new
> device tree files for several K210 based boards: MAIX Bit, MAIXDUINO,
> MAIX Dock and MAIX Go boards from SiPeed and the KD233 development
> board from Canaan.
> 
> Finally the last two patches updates the k210 nommu defconfig to include
> the newly implemented drivers and provide a new default configuration
> file enabling SD card support.
> 
> A lot of the work on the device tree and on the K210 drivers come from
> the work by Sean Anderson for the U-Boot project support of the K210
> SoC. Sean also helped with debugging many aspects of this series.
> 
> A tree with all patches applied is available here:
> https://github.com/damien-lemoal/linux, k210-sysctl-v24 branch.
> A demonstration of this series used on a SiPeed MAIX Dock
> board together with an I2C servo controller can be seen here:
> https://damien-lemoal.github.io/linux-robot-arm/#example
> 
> This tree was used to build userspace busybox environment image that is
> then copied onto an SD card formatted with ext2:
> https://github.com/damien-lemoal/buildroot
> Of note is that running this userspace environment requires a revert of
> commit 2217b982624680d19a80ebb4600d05c8586c4f96 introduced during the
> 5.9 development cycle. Without this revert, execution of the init
> process fails. A problem with the riscv port of elf2flt is suspected but
> not confirmed. I am now starting to investigate this problem.
> 
> Reviews and comments are as always much welcome.
> 
> Changes from v10:
> * Rebased on riscv tree fixes+for-next branches. Patches already applied
>   to these branches were removed from this series.
> * Fixed the clock driver and pinctrl driver patch titles to indicate the
>   correct target sub-components.
> * Applied reviewed-by tags from Anup.
> 
> Changes from v9:
> * Added patch 6 to avoid DTS compilation errors after patch 9 is
>   applied and until patch 16 is applied.
> 
> Changes from v8:
> * Addressed Rob's comments on the sysctl driver bindings documentation
> * Fixed a typo in the fpios driver bindings documentation
> 
> Changes from v7:
> * Removed the __init annotation for the drivers reset, pinctrl and
>   sysctl drivers probe functions as suggested by Geert. Also removed
>   the __refdata annotation for the struct platform_driver variables of
>   these drivers.
> 
> Changes from v6:
> * Annotate struct platform_driver variables with __refdata to avoid
>   section mismatch compilation errors
> * Add empty sentinel entry to of_device_id tables of the sysctl, reset
>   and pinctrl drivers.
> 
> Changes from v5:
> * Addressed Philipp's comment on the reset controller driver
> * Added patch 6 to reduce the size of the clock driver patch
>   (now patch 12).
> 
> Changes from v4:
> * Simplified reset controller driver using of_xlate callback as
>   suggested by Philipp
> * Fixed compilation error when using other configs than one of the
>   nommu_k210 defconfigs.
> * Addressed most clock driver comments from Stephen.
> * Removed CONFIG_GPIO_SYSFS from defconfigs
> * Rebased on 5.10-rc7
> 
> Changes from V3:
> * Add one entry per driver in MAINTAINERS file
> 
> Changes from V2:
> * Add MAINTAINERS file entry for the SoC support, listing myself as
>   maintainer.
> * Removed use of postcore_initcall() for declaring the drivers, using
>   the regular builtin_platform_driver() instead.
> * Fixed fpio pinctrl driver bindings documentation as commented by
>   Geert: removed input-schmitt and added input-schmitt-disable, fixed
>   typo and added input-disable and output-disable.
> * Fixed device tree to have cs-gpios active low, as per the default, as
>   active high necessity was an artifact of the gpio level double
>   inversion bug fixed recently.
> * Removed CONFIG_VT from defconfigs to reduce the kernel image size as
>   suggested by Geert.
> 
> Changes from v1:
> * Improved DT bindings documentation
> * SPI and GPIO patches removed from this series (and being processed
>   directly through the relevant subsystems directly)
> * Improved device trees
> * Various cleanup and improvments of the drivers
> 
> Damien Le Moal (10):
>   clk: Add RISC-V Canaan Kendryte K210 clock driver
>   pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver
>   riscv: Update Canaan Kendryte K210 device tree
>   riscv: Add SiPeed MAIX BiT board device tree
>   riscv: Add SiPeed MAIX DOCK board device tree
>   riscv: Add SiPeed MAIX GO board device tree
>   riscv: Add SiPeed MAIXDUINO board device tree
>   riscv: Add Kendryte KD233 board device tree
>   riscv: Update Canaan Kendryte K210 defconfig
>   riscv: Add Canaan Kendryte K210 SD card defconfig
> 
>  MAINTAINERS                                   |    8 +
>  arch/riscv/Kconfig.socs                       |    3 +-
>  arch/riscv/boot/dts/canaan/canaan_kd233.dts   |  178 +++
>  arch/riscv/boot/dts/canaan/k210.dts           |   23 -
>  arch/riscv/boot/dts/canaan/k210.dtsi          |  551 ++++++++-
>  arch/riscv/boot/dts/canaan/k210_generic.dts   |   46 +
>  .../riscv/boot/dts/canaan/sipeed_maix_bit.dts |  227 ++++
>  .../boot/dts/canaan/sipeed_maix_dock.dts      |  229 ++++
>  arch/riscv/boot/dts/canaan/sipeed_maix_go.dts |  237 ++++
>  .../boot/dts/canaan/sipeed_maixduino.dts      |  201 ++++
>  arch/riscv/configs/nommu_k210_defconfig       |   44 +-
>  .../riscv/configs/nommu_k210_sdcard_defconfig |   92 ++
>  drivers/clk/Kconfig                           |    8 +
>  drivers/clk/Makefile                          |    1 +
>  drivers/clk/clk-k210.c                        | 1005 +++++++++++++++++
>  drivers/pinctrl/Kconfig                       |   13 +
>  drivers/pinctrl/Makefile                      |    1 +
>  drivers/pinctrl/pinctrl-k210.c                |  985 ++++++++++++++++
>  drivers/soc/canaan/Kconfig                    |   18 +-
>  drivers/soc/canaan/Makefile                   |    2 +-
>  drivers/soc/canaan/k210-sysctl.c              |  205 +---
>  include/dt-bindings/clock/k210-clk.h          |    1 -
>  include/soc/canaan/k210-sysctl.h              |    2 +
>  23 files changed, 3844 insertions(+), 236 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/canaan/canaan_kd233.dts
>  delete mode 100644 arch/riscv/boot/dts/canaan/k210.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
>  create mode 100644 arch/riscv/configs/nommu_k210_sdcard_defconfig
>  create mode 100644 drivers/clk/clk-k210.c
>  create mode 100644 drivers/pinctrl/pinctrl-k210.c
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: linux-clk@vger.kernel.org
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
