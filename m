Return-Path: <SRS0=RRT7=FT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB93C4361B
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Dec 2020 23:02:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BD9122573
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Dec 2020 23:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BD9122573
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=dFMOTN/WJVK0FbWlHRA9xjFIxWWwhZm8AuwaqZtFM8E=; b=OFSZWGyaR/H20cF5s6L4wIs7j
	LmqgU3W48oirmWxAI/Ori4d5fffKjwXSHt7QCBpnL1hv6bfCkVsRQPeGqIS4vFy6dJdMS9f6vewM6
	26Y6Z0zi6jZ3BoHEDE2MUCjEymFL6mfqj4vOIUQTJLX6IMYV2MCoCk/LmI9tBIv6gA4b20oALRj64
	d68GyzTQ6xpGT9Khyjg6/NLxd0YqzWX1QLc6c2bL6FKN/X2dpZ4SoUZyRgOFlKiRFt29/EjnmplLq
	0lrJlunzLB8hvxKHIOIuCciG06u9dq9lJkOo0VkuRiTiv7HBsLvFd0zbtkzPFWmwpq1z8giq+ulxr
	xugFfoBcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpJKv-0005hx-MO; Tue, 15 Dec 2020 23:02:29 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpJKr-0005hb-3u
 for linux-riscv@lists.infradead.org; Tue, 15 Dec 2020 23:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608073345; x=1639609345;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=Z2AmIV1bin5PNwuj1s6oP+3wcAbfIpD99zu5z7FQtbU=;
 b=hfb/chyrUdNzLDqKEbqlIDnHDS3nIaVVg1uaxniZlhOsS3MoTn1WTi5G
 0FnaYInQ5IlOg4EtvvNpHgpTd0SzpF63TCGeia1HFBwlW/E1DLSAG38ca
 v8TvuVKsgReE3Xt7nFR4whqhbLM6uL5ixMDCURFVV200JPFMjhxOdlxsr
 QTkhzFpyaKmDLh4bT+73n6tSjv9uWIkvLxnzUd8F2V9VZ7CRqpR3WYOei
 QO9Nu/ioXr74hIuCSbuBmp/6/rhrYN1XyUZcpxdlq4i4mWLormLkaDOuZ
 7x21vD0us1wXQafnizwJE8JYrDrLToXVt8Bedd267rL4/i9NoZFF4Rp+9 A==;
IronPort-SDR: GoyxP0wrAic2DILpqPgiHknTXiXtzajlcom1BLTG8ujOYCSfwfUnjR/42RLcr6+I4M8w0o2zcd
 JCiMVaZKzehqC8UOMfclep8HvVOaW9Xpo2m+vrGufxU30LVDWYrern3ZdIVmiBo9MvYMbwZ+R6
 1Fe62mY3pNF3kXUAzLa638qfcWbNrLdei1hyh5NgpQk1ODo0TvvD7iBkniWwl/S2ChNu6MOLPC
 nXOAIq1AFn0w7ycjUq+DqODMzRK1X2cMoHj3Z09Rz57IPi4l/vW1+n0bu4bFF3OVrcp7OaxxFH
 GI4=
X-IronPort-AV: E=Sophos;i="5.78,422,1599494400"; d="scan'208";a="155263542"
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
 by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2020 07:02:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jg1VPvQdKyKfS5hE0DaAnpB2HFzeJRmeLXDNBn0DaSj8STDW2hvLT8+ossuQ/PIR14hZWgDgI76wU6w3ZM60v/0cfM6xhA2W94Bna6n++4X5QbVtav2Qlao4fz1KOaVJvaYFcBetY5EDG0l+Q6jDtj5xXs+hi2SHzyli4KJVGgdhgFMEU8C+L9fp83fwJj8ODKYeFRkn5nSk4MJFKN4koVroJKvZHCMZzfi44HZk/HcbBEgZtM8JU/BVbSMFTm3+P+u2Jr9MemJdeku6PX+6xxtskpvsULXkJFg5dPArUF0b2wV4wlip9AuTneFsR6OH9HaWLFO8kgMn4y7HYKGnmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcqym9b5yMe50qvF4GaplURAgrkNSenYbzrUYb77j+E=;
 b=aeem8iLPV+QNfs/BMUllvuHJybpFZCidpqC1HO2xYhnDPRq4xmxAPCSZD5QATogvOJOlZ9S8AXIzUk/FS4I/HQOeq9KvH3xjX37ez3YuIRdCD81BlK6lcGLfBrfghiK9v5pWumeowlibN89wqbmHpIXoeuNWMunY5H+fhIZ/5GN8AT2nAXNwbSK7SpDFfJtYLHWjNl+oy9YYx1e3ncfgmfKeda+cru96afYGIzKeEcKlcXYgrPrdsxmYKOLIy2CmRVswlJ9g1jYJmK+LTYrIiHMc0nrLp9pijRBoYjnhCwOLP3MvBVVYI8++oyWn5oAGII1CSKolPI1MPCIX6bOoZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcqym9b5yMe50qvF4GaplURAgrkNSenYbzrUYb77j+E=;
 b=NSCn2fj+tEcsqM7u6Mntki+n7qHDWnXivSU8uO+vqYmFO1+VlLnSNXt6dPGP8tCfBwIXnqZt9f3w4X+RIA1jBme9vXDRMGo216TY5BOMvCzHtps0Vcl0wEuFKG+XDkd8Qu6yHrUt4rktjwG/KObuEk+NSOhzqKPA7Gvgem24XVs=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6902.namprd04.prod.outlook.com (2603:10b6:610:a3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Tue, 15 Dec
 2020 23:02:21 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%6]) with mapi id 15.20.3654.026; Tue, 15 Dec 2020
 23:02:21 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Boyd
 <sboyd@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v10 00/23] RISC-V Kendryte K210 support improvements
Thread-Topic: [PATCH v10 00/23] RISC-V Kendryte K210 support improvements
Thread-Index: AQHW0VcBx/1WqOKLiUuqE6/7D5Ba7g==
Date: Tue, 15 Dec 2020 23:02:20 +0000
Message-ID: <CH2PR04MB65220A2CDD6F186F1DB53D3AE7C60@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:f0b5:b4fe:45e3:5658]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5be3c3b1-e915-4cd9-87a1-08d8a14d7a5e
x-ms-traffictypediagnostic: CH2PR04MB6902:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR04MB69024F2D0D4D0DC2B063A74CE7C60@CH2PR04MB6902.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YIPFrmC/kYmCYkENJUYkQa1U8ufquettU69kp1G/DR17NZk+UIjzaqbcunvc/rQY/qmBPA3AwhLe/zRYaDsfJTfN50tHqP82UFQUjFFFY6/ijN0HYOaDZKWATlLinGkeVU0XNPo352PTDCTer6244N0dZ/x03TTHlaxv0I6rv8V0LQGvW2RDotaD4in4Fb7Eg3Ci8NL0qtEfPZNub5yMmQNu7TSdWbc4WIb8RZPMNoojjpj1uYcUCpLmIC0CsW1RdPFB1zrvkQL29ji71Y8wtdvz4K8xZHzbC00WPLu8NUWCuUofKWj3vyK7tIv5Q8V4iQJcwTDTGWtBHUr8lQSTmmN9LydI6uut0aotVpYeY/cCB+vyIQZcm1WJxUyualqMeCSNXSg6wDvZyv+Zi+H/zw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(316002)(66446008)(8676002)(55016002)(83380400001)(2906002)(4326008)(30864003)(5660300002)(86362001)(478600001)(71200400001)(53546011)(8936002)(52536014)(6506007)(7416002)(7696005)(91956017)(9686003)(186003)(66556008)(64756008)(33656002)(66946007)(966005)(110136005)(66476007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?0CNqvw5BM05PpFmqHxPlOPnXs4K8aw0ivPKiWpJT1qEqxnvmVcYR0tEVCSPv?=
 =?us-ascii?Q?VCVGUixIy5ldK3R+Ev2N2lVXDEe9gyjvorwE2eB7BktQtM8mFHc+0LCmfHNt?=
 =?us-ascii?Q?6umz8fvNDrjEFj84bCuH3QU5hi6wyvzhTlHGtogY15z0wvTfst9TaPaU3kfz?=
 =?us-ascii?Q?mpHb0WHgvgJDelAUnh2MV2xvwGVoRq6V2NC8P44hjNEu3kCdj3ytMoXkANCv?=
 =?us-ascii?Q?8cqdOiRFaIujdQY9C4t2pAzTdMRbjX6XH3k3jk2u8YhSHHStpfI3/hUWL7p+?=
 =?us-ascii?Q?jrjt/5+4KSyGfQu2EaT4BbhDlOk8rWD80Ben5O0E8K82JTnkIn04idAQLxnf?=
 =?us-ascii?Q?W6DLBCn6ABvAMk2jobucqn3MaVNlb4Zq+9ic0R2i2uDRontdvfQBb4GEJf4h?=
 =?us-ascii?Q?FkgxzsKmI8rs0zY8ECbyrkOQc5Ew0HlS5iasBtsYQK9hiULXt2WYO+xF+FMV?=
 =?us-ascii?Q?GG2YKNaTuTdI4JJ0xVzWLp98B5pStgfpj9ABSXIdjqOKL7v6EMIkaICYAcLg?=
 =?us-ascii?Q?WhOXIzLXRWB/FdIvXppbKgYOsjPR0AE6ow7xWpJHim1dl9c+xDxqWZyWfH2V?=
 =?us-ascii?Q?T1Iam6ftLQLewnw9LLvFr8qjl4dPuGnoXnmNOO0LWKN2r9I3vT/ezb1GPk2s?=
 =?us-ascii?Q?9tSrPg9p4HvMggAJEISTTYC+/YZhp2YL2ffB0iu4NY4nAp+yTKUJSY+ATetK?=
 =?us-ascii?Q?hoxVp2jUUnYzb7eNwdjxGvS0uiIMK/mcX9Ij4+/gmbjKDdxW2Cp/7f25g+eF?=
 =?us-ascii?Q?ajcCHATcfdbyzoAk8JhqCBJytnt+RQy/9EryG6vzR8XzEd7AQP7pDQ9Q9m35?=
 =?us-ascii?Q?6kj+bMmxsx7zRV790qTmlQ/h9ZtNAF5ctHJT2iScCoW2nnASlb78Ccy7RdOG?=
 =?us-ascii?Q?hfpRWGDYjiB9hOgTsufXl++Ed1b2WBiXlcL9F7pGrLrLh3rd7wcGp91WWhdm?=
 =?us-ascii?Q?AbVvltGYQtJHSn1U9WMLrW2HYtpCAKfgyfQiCRm30SHSJZwoo+ru1u4OYOLZ?=
 =?us-ascii?Q?OCFdVM3lCxwdXzV3a3nwfL+YaisX1qOzlVjZu8ruiAzo9qaOm3En6AXlMw7Z?=
 =?us-ascii?Q?3fP8Vbad?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be3c3b1-e915-4cd9-87a1-08d8a14d7a5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2020 23:02:20.9498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GUCNsvJ3pDmYZExyRa1IReu29Ix5dr+pH/y/IEFE64AIy+q7jpXpkHXW/bsoXpndoVXz9CuPdQJPFKjvWH7seg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6902
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_180225_589478_E80311F4 
X-CRM114-Status: GOOD (  30.16  )
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
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/12/13 22:51, Damien Le Moal wrote:
> This series of patches improves support for boards based on the Canaan
> Kendryte K210 RISC-V dual core SoC. Minimal support for this SoC is
> already included in the kernel. These patches complete it, enabling
> support for most peripherals present on the SoC as well as introducing
> device trees for the various K210 boards available on the market today
> from SiPeed and Kendryte.

Palmer,

Ping ?
What is ypour plan for this series ? Can you queue it for 5.11 ?


> 
> Pathes 1 to 4 are various fixes for riscv arch code and riscv
> dependent devices. Of note here is patch 3 which fix system calls
> execution in the no MMU case, and patch 4 which simplifies DTB builtin
> handling.
> 
> Patch 5 fixes naming of directories and configuration options to use the
> K210 SoC vendor name (Canaan) instead of its branding name (Kendryte).
> 
> Patch 6 is a preparatory patch cleaning up the K210 system controller
> driver to facilitate introducing the SoC clock driver.
> 
> The following patches 7 to 11 document device tree bindings for the SoC
> drivers. The implementation of these drivers is provided in patches 12,
> 13 and 14, respectively implementing the SoC clock driver, reset
> controller and SOC pin function control.
> 
> Patches 15 to 20 update the existing K210 device tree and add new
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
> https://github.com/damien-lemoal/linux, k210-sysctl-v22 branch.
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
> Damien Le Moal (22):
>   riscv: Fix kernel time_init()
>   riscv: Fix sifive serial driver
>   riscv: Enable interrupts during syscalls with M-Mode
>   riscv: Fix builtin DTB handling
>   riscv: Use vendor name for K210 SoC support
>   riscv: cleanup Canaan Kendryte K210 sysctl driver
>   dt-bindings: Add Canaan vendor prefix
>   dt-binding: clock: Document canaan,k210-clk bindings
>   dt-bindings: reset: Document canaan,k210-rst bindings
>   dt-bindings: pinctrl: Document canaan,k210-fpioa bindings
>   dt-binding: mfd: Document canaan,k210-sysctl bindings
>   riscv: Add Canaan Kendryte K210 clock driver
>   riscv: Add Canaan Kendryte K210 reset controller
>   riscv: Add Canaan Kendryte K210 FPIOA driver
>   riscv: Update Canaan Kendryte K210 device tree
>   riscv: Add SiPeed MAIX BiT board device tree
>   riscv: Add SiPeed MAIX DOCK board device tree
>   riscv: Add SiPeed MAIX GO board device tree
>   riscv: Add SiPeed MAIXDUINO board device tree
>   riscv: Add Kendryte KD233 board device tree
>   riscv: Update Canaan Kendryte K210 defconfig
>   riscv: Add Canaan Kendryte K210 SD card defconfig
> 
> Damien Le Moal (23):
>   riscv: Fix kernel time_init()
>   riscv: Fix sifive serial driver
>   riscv: Enable interrupts during syscalls with M-Mode
>   riscv: Fix builtin DTB handling
>   riscv: Use vendor name for K210 SoC support
>   riscv: Fix Canaan Kendryte K210 device tree
>   riscv: cleanup Canaan Kendryte K210 sysctl driver
>   dt-bindings: Add Canaan vendor prefix
>   dt-binding: clock: Document canaan,k210-clk bindings
>   dt-bindings: reset: Document canaan,k210-rst bindings
>   dt-bindings: pinctrl: Document canaan,k210-fpioa bindings
>   dt-binding: mfd: Document canaan,k210-sysctl bindings
>   riscv: Add Canaan Kendryte K210 clock driver
>   riscv: Add Canaan Kendryte K210 reset controller
>   riscv: Add Canaan Kendryte K210 FPIOA driver
>   riscv: Update Canaan Kendryte K210 device tree
>   riscv: Add SiPeed MAIX BiT board device tree
>   riscv: Add SiPeed MAIX DOCK board device tree
>   riscv: Add SiPeed MAIX GO board device tree
>   riscv: Add SiPeed MAIXDUINO board device tree
>   riscv: Add Kendryte KD233 board device tree
>   riscv: Update Canaan Kendryte K210 defconfig
>   riscv: Add Canaan Kendryte K210 SD card defconfig
> 
>  .../bindings/clock/canaan,k210-clk.yaml       |   54 +
>  .../bindings/mfd/canaan,k210-sysctl.yaml      |  109 ++
>  .../bindings/pinctrl/canaan,k210-fpioa.yaml   |  171 +++
>  .../bindings/reset/canaan,k210-rst.yaml       |   40 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
>  MAINTAINERS                                   |   23 +
>  arch/riscv/Kconfig.socs                       |   33 +-
>  arch/riscv/Makefile                           |    2 +-
>  arch/riscv/boot/dts/Makefile                  |    2 +-
>  arch/riscv/boot/dts/canaan/Makefile           |    5 +
>  arch/riscv/boot/dts/canaan/k210.dtsi          |  621 ++++++++++
>  arch/riscv/boot/dts/canaan/k210_generic.dts   |   46 +
>  arch/riscv/boot/dts/canaan/k210_kd233.dts     |  178 +++
>  arch/riscv/boot/dts/canaan/k210_maix_bit.dts  |  227 ++++
>  arch/riscv/boot/dts/canaan/k210_maix_dock.dts |  229 ++++
>  arch/riscv/boot/dts/canaan/k210_maix_go.dts   |  237 ++++
>  arch/riscv/boot/dts/canaan/k210_maixduino.dts |  201 ++++
>  arch/riscv/boot/dts/kendryte/Makefile         |    4 -
>  arch/riscv/boot/dts/kendryte/k210.dts         |   23 -
>  arch/riscv/boot/dts/kendryte/k210.dtsi        |  125 --
>  arch/riscv/configs/nommu_k210_defconfig       |   39 +-
>  .../riscv/configs/nommu_k210_sdcard_defconfig |   93 ++
>  arch/riscv/include/asm/soc.h                  |   38 -
>  arch/riscv/kernel/entry.S                     |    9 +
>  arch/riscv/kernel/soc.c                       |   27 -
>  arch/riscv/kernel/time.c                      |    3 +
>  arch/riscv/mm/init.c                          |    6 +-
>  drivers/clk/Kconfig                           |    8 +
>  drivers/clk/Makefile                          |    1 +
>  drivers/clk/clk-k210.c                        | 1005 +++++++++++++++++
>  drivers/pinctrl/Kconfig                       |   13 +
>  drivers/pinctrl/Makefile                      |    1 +
>  drivers/pinctrl/pinctrl-k210.c                |  985 ++++++++++++++++
>  drivers/reset/Kconfig                         |   10 +
>  drivers/reset/Makefile                        |    1 +
>  drivers/reset/reset-k210.c                    |  131 +++
>  drivers/soc/Kconfig                           |    2 +-
>  drivers/soc/Makefile                          |    2 +-
>  drivers/soc/canaan/Kconfig                    |   12 +
>  drivers/soc/canaan/Makefile                   |    3 +
>  drivers/soc/canaan/k210-sysctl.c              |   78 ++
>  drivers/soc/kendryte/Kconfig                  |   14 -
>  drivers/soc/kendryte/Makefile                 |    3 -
>  drivers/soc/kendryte/k210-sysctl.c            |  260 -----
>  drivers/tty/serial/sifive.c                   |    1 +
>  include/dt-bindings/clock/k210-clk.h          |   55 +-
>  include/dt-bindings/pinctrl/k210-fpioa.h      |  276 +++++
>  include/dt-bindings/reset/k210-rst.h          |   42 +
>  include/soc/canaan/k210-sysctl.h              |   43 +
>  49 files changed, 4962 insertions(+), 531 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
>  create mode 100644 Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
>  create mode 100644 arch/riscv/boot/dts/canaan/Makefile
>  create mode 100644 arch/riscv/boot/dts/canaan/k210.dtsi
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_generic.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_kd233.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_bit.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_dock.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_go.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_maixduino.dts
>  delete mode 100644 arch/riscv/boot/dts/kendryte/Makefile
>  delete mode 100644 arch/riscv/boot/dts/kendryte/k210.dts
>  delete mode 100644 arch/riscv/boot/dts/kendryte/k210.dtsi
>  create mode 100644 arch/riscv/configs/nommu_k210_sdcard_defconfig
>  create mode 100644 drivers/clk/clk-k210.c
>  create mode 100644 drivers/pinctrl/pinctrl-k210.c
>  create mode 100644 drivers/reset/reset-k210.c
>  create mode 100644 drivers/soc/canaan/Kconfig
>  create mode 100644 drivers/soc/canaan/Makefile
>  create mode 100644 drivers/soc/canaan/k210-sysctl.c
>  delete mode 100644 drivers/soc/kendryte/Kconfig
>  delete mode 100644 drivers/soc/kendryte/Makefile
>  delete mode 100644 drivers/soc/kendryte/k210-sysctl.c
>  create mode 100644 include/dt-bindings/pinctrl/k210-fpioa.h
>  create mode 100644 include/dt-bindings/reset/k210-rst.h
>  create mode 100644 include/soc/canaan/k210-sysctl.h
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
