Return-Path: <SRS0=mxd0=G2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12A8C433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 06:25:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7682523B00
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 06:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7682523B00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=LWtJdPtgTVUiXF6bgcR6KpYinFE1o6uUvwA8XKsDHWc=; b=dZEniQmwyrrgNNIfcgXwI3RmP
	17/7O1IPFkDig9UeSXwP7nxntixL2ADJhRoy4RTwpGgMM1lKP3di5u1qFe6d3KiWJOLWLSm3KuZN/
	29di2iE8GyhFjiOMeKIMgtVtuJjvrZvbvSP7EOAI88TFvU0ImHnq9ptXgtEevjKz8C+0l8CaBdSIW
	PhEUs1BMubfBh3Kv5ZeqsmkCcByOkpehivILYTG4cc0zuvMttRDljUiBUft6wmwOjgrfpzDhcasu5
	vslrPW8BYozAwvCPeUQxnI8YbLmkO1+g5lF4E/BNWThMt/MYg5sCMvVXtxDUWen3hj8kCWHqQ2/aB
	X8RWkrUWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3CLi-0000U2-DG; Sat, 23 Jan 2021 06:24:42 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3CLg-0000TM-0c
 for linux-riscv@lists.infradead.org; Sat, 23 Jan 2021 06:24:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611383079; x=1642919079;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=VYD81CnJx+3mTZtJ6wuYnbNgH9queBlDI7V8HZvtW+U=;
 b=U58YY+muM3ECcJGUyScC1W4CrSNDyJQXzPBoCfkRwAyJba0oqaWRVrzU
 KHNL76fnKGDwqsW9zQZsLSJnGH8GfsHwpNaDK3GOmrPjhijEFDhgrjmwu
 0GUavchLK2uyWYs6ng5aI/ik5LD7g+kymFHqH6S7xkLhPuvEFnWAQgkx6
 2C1fI8/4dSQdyySHKY+BgBSbVX+PpPvGjsS8msO2rIdEPGFeF1XAmQr9L
 5zsYlgs4slvnkz9UwAelRhAyJlBanM+MuLe1m+Nd7KLo/kYTDuErmAJl5
 7FKUFAdLnQ3xzVbxbBpNurOrC6U7bYO08hq7bvV7bUuDkFsuKNhqFP/Dy w==;
IronPort-SDR: rtdMB0X1vt9yFnIG+S+NgOtYkUvkeYkkptOaXaJ0XuTi16iy/M/TwVVQFZ4PA1HwQauyYJKJT9
 VqpZ293Szx+xbqRE67wyLKGxdTyKx9YNgJBogKwiROFth3mGDxgY+HPX+0wBvsyH4xBECD8VSX
 aEfpHkppuK7YfsGIP5Dc6KkLWzMvwI/ImETnrnVK5Yad/Y0xlZWWvVILNhKLyyHZ4XTXz7uOvH
 iGcKLKcjB5HkeCv1yYG4WggTdL0JrqFAC7IBtsW15yeT+iFMhaRjeG8/bPlx6cdwcwpsgmX4qY
 kJo=
X-IronPort-AV: E=Sophos;i="5.79,368,1602518400"; d="scan'208";a="268489252"
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hgst.iphmx.com with ESMTP; 23 Jan 2021 14:24:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMz3lddF3Xlfht7bSUuZpwlsr8A9vHiOQptZyp1QXJMmPPzuOIR1EKfS3vW655PLGTgkb6yLNQsFH2GgilN1BskAzJ0zgB/dlo3/f+rJ8urzrG99AcG6PFFFXBS2ZWi1QJ74+kuoSIDV3SRUqqzQUP0QG1rKgGd4ehqd6+BgSpVXBvUaQmEGWjLwEI3ojLmmTtibl5nFqYvUzryFrl93Ao/fm0r5buHh+Rst5F3+7s2AhukZmw4Ib6L03lPsx08IqtqlXpMgbU3NDBM6LcjJNFRr5J9sDhCMRpgaX21gJyaSWGFA3mZoSgqwFsVVv0oQJIHYjT6t8ek5LeDjwDk/2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIy8w/35uARKW0JN1PwYhjpHEUd0pGsIJwN50Fu/ZvU=;
 b=UfpfP+m+Yok774XeULE4OPdTHT51+xThwKOrCFHr47SWT4lwJRXhNieCt5WbzQYQQ/1Uxkcjvwvd5ZLJlocWBuH+rpOjzA52MSuqFMUPAr1y30EQMa4sZgPiZHrrTVIq3VFNHxgsCWYTkytmKBh/mvU5foLY1gHw1y5FYKNeG1C54H7vQ9WMZU2UpYanauUUIuycHpvveqOFcxbqXQ0zMLspipxAKeWNJkAxt87KDziqzQ8C2hZYhA3ofa+W2rrss4IHqrYEHSyFo3KuqPK2QR+7EJF9RQU2b9r9sDPEbCdSHjl9cDt+4l2xvFBEFXFzj7SOzbLFRDdaxmH+d3sc1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIy8w/35uARKW0JN1PwYhjpHEUd0pGsIJwN50Fu/ZvU=;
 b=ZMygGjXfzUpbl+zLLC3oBt6P6BWZwJAXl0SAOcmEI2RDYm2OOLVQWt6/p4MLqHvSuB2vUItSOJ+j9Xabn7JiIeNyysQRoteXnydbX5/vfSnwI05KgFurj3gxmCfqtr+gvJ68bk+YR8GWQAn4NeY0fX3xt8CZjn+1N/0EJLCHEqs=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB6596.namprd04.prod.outlook.com (2603:10b6:208:1cf::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Sat, 23 Jan
 2021 06:24:34 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3763.014; Sat, 23 Jan 2021
 06:24:34 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v13 01/17] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Topic: [PATCH v13 01/17] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Index: AQHW7T4M5lVOShVlf0aMYmOIexNLQQ==
Date: Sat, 23 Jan 2021 06:24:34 +0000
Message-ID: <BL0PR04MB6514572B007BE53072B63146E7BF0@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210118020244.103451-1-damien.lemoal@wdc.com>
 <20210118020244.103451-2-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:2db5:5c10:5640:816d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1ee1cd4c-0cc0-441b-6273-08d8bf678d6f
x-ms-traffictypediagnostic: BL0PR04MB6596:
x-microsoft-antispam-prvs: <BL0PR04MB6596B8DFBFDEEFA1BC871D7FE7BF9@BL0PR04MB6596.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8ja71RLcDD13vdRbuLrs96UkQcyS/M1ix6vAMJcWRxckcjxiShmvdBA7Agi0qHpP67i3HuVMFmwHU6B2YpBcRTUbnXFgkJpBg8BI1/qekzJLhl6s8EVJTCeuo9gqSkDmBeGFB3Jqfo4PiChZiHE5wGQICsE5ChHDn5tZwah8pZBrjQfyCm3/Gb35ZZYngSOCeuQ23y0GTi+vLo1yh2WTqVLTFT/d0UX9GxPLe+pMhRtS2zmh4vf/ttgfkT3lTyDgqNLPYXgi3xN6R18TIzoxhoMyMZOW48EKsc6Bxzl8YIElHRVyD1s2WdoAvTegYtW9dyA0MQ2pioDjnrzY3W8m9UIJ0qZPdLOQMIb4PLASocuOKshma/oSpCLIx6CKhQa7FQWguYKUJpkjflkUt6l1ZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(316002)(2906002)(7696005)(83380400001)(110136005)(186003)(53546011)(6506007)(8936002)(54906003)(55016002)(52536014)(91956017)(76116006)(8676002)(86362001)(66946007)(66476007)(66556008)(64756008)(66446008)(4326008)(478600001)(9686003)(5660300002)(33656002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?xezMukQIjuQFO6hmh7aBF5Q266oyIx5eed4o5qAU5Scrtbd/qMpjFKAbDy42?=
 =?us-ascii?Q?ZMzVL522essjVMG4Z60U3XSbhtrSAW7yqXTU3xtESmOWWqUWQRQANm+mA9wd?=
 =?us-ascii?Q?Z+x578y2NjX7VMs4dr3s9cgujl/ZiVscyEpLCibF5aJTIqBlu5U3v+6WOZLY?=
 =?us-ascii?Q?hvbNck/UVTBfSl9bH7IscX5p61+a7l2dEDrPhiLgxrczXmTIvIoOdp3oXzBd?=
 =?us-ascii?Q?tocZj8lLlWuqQyYAeBKbscaiuQUHuAkCQFFGYXfn2VAp4kUK4qbrpb/ynwF8?=
 =?us-ascii?Q?/+45ed0DGDyo4uJG1Juk+fK80VrCM3rTzyUzQBePdwpnymQxcKNZqePGdInH?=
 =?us-ascii?Q?9LOWMI36WV5pmro4y3nWcvm6q4sWofRjyjZ6uKRd4rEb2rnl1Vv3ffhOHFLu?=
 =?us-ascii?Q?T4k2AxhmQIFZZyI6i86Veur2Uj8dBZAcqbX2ErKrCBTpuHY3KhJmTtbQNa3p?=
 =?us-ascii?Q?e0RyJbV1Jaf+/oeuTsG31VA7V5Z7XMF3EEKVqD73btvNwRixPcYqpE7/ysMn?=
 =?us-ascii?Q?S7UJpQYcAx864ZoDX4VNj+W1tr8XspOcUhIEzXjfJDAQUPhQu+zp9ehSV3Xz?=
 =?us-ascii?Q?gy8A5ni9pwk4HBNrPAqzsedpspfPKCMKM+c1N722sMneFhbhXuzDww01rQXo?=
 =?us-ascii?Q?YDFcVtrnmfy4F9ZiAOX20a1Hc4g9pfGNVlH/tmZSoTEREMMdSXQzFiblPjbR?=
 =?us-ascii?Q?dtTxUeH8fdCod38XVTpmNLc1+9ioL1z6q9K101gzMHi7f6P5j1TPwTjpwpJh?=
 =?us-ascii?Q?79B5ufV0vmfR2Lh5C+rM8QPkxIzqNYzCyO1QncyLTorJC3dMGLZfhBgftRrD?=
 =?us-ascii?Q?VNxT+h5bN9607x7J135mWVpG9sMrykDr0JGWHtLEjavZpdwtYf3x/g/jkPal?=
 =?us-ascii?Q?h4U5DAgWPvM84z/z0zOEwXgBK9ktSe5SX/j7PyB0tWr1fgma2rXCiHO5J2uI?=
 =?us-ascii?Q?rKbAFXt51NC6q8s+9NTf/PuAr9HMSS9bVvNBHLkZ90A7pNdf8bDcuihStgQD?=
 =?us-ascii?Q?0+D4mu+T7CVR5+J/aAr66WEV9uRwoUvayQjHlnxvq+AhAIsGOtvpRHLceRxc?=
 =?us-ascii?Q?IH22/wS8Ik3DMdU+glX6vQQJ8jXZKI7NtK6Tb4dcI4Ioh74M9a4rsG+4GIDT?=
 =?us-ascii?Q?yiQkVPCf40ju6JrdSiAPEQF6FFSRxSgzyg=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee1cd4c-0cc0-441b-6273-08d8bf678d6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2021 06:24:34.7283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MvPXHpAU0NEv/PS8KsvsSiRdV+dG8pY2SwkzfJ80RHtPppAcHtCPbhBHtKghaOB86X/KQSeQ5kUSolI9X6SpNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6596
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_012440_242984_801BAF54 
X-CRM114-Status: GOOD (  15.77  )
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
 Michael Turquette <mturquette@baylibre.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021/01/18 11:03, Damien Le Moal wrote:
> Add a clock provider driver for the Canaan Kendryte K210 RISC-V SoC.
> This new driver with the compatible string "canaan,k210-clk" implements
> support for the full clock structure of the K210 SoC. Since it is
> required for the correct operation of the SoC, this driver is
> selected by default for compilation when the SOC_CANAAN option is
> selected.
> 
> With this change, the k210-sysctl driver is turned into a simple
> platform driver which enables its power bus clock and triggers
> populating its child nodes. The sysctl driver retains the SOC early
> initialization code, but the implementation now relies on the new
> function k210_clk_early_init() provided by the new clk-k210 driver.
> 
> The clock structure implemented and many of the coding ideas for the
> driver come from the work by Sean Anderson on the K210 support for the
> U-Boot project.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  MAINTAINERS                      |    1 +
>  drivers/clk/Kconfig              |    8 +
>  drivers/clk/Makefile             |    1 +
>  drivers/clk/clk-k210.c           | 1012 ++++++++++++++++++++++++++++++
>  drivers/soc/canaan/Kconfig       |   18 +-
>  drivers/soc/canaan/Makefile      |    2 +-
>  drivers/soc/canaan/k210-sysctl.c |  205 ++----
>  include/soc/canaan/k210-sysctl.h |    2 +
>  8 files changed, 1071 insertions(+), 178 deletions(-)
>  create mode 100644 drivers/clk/clk-k210.c

Stephen,

Ping ? Could you review this version please ?

I addressed all your comments, except the addition of a timeout in the pll lock
wait loop. The reason is that if the hardware misbehave there, the CPU and/or
third SRAM bank are likely to not work either and the board will not even boot
(it will hang in the early soc init code). So I do not think adding a timeout is
useful.

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
