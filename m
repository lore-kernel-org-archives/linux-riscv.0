Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA8CC5519F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 09:02:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C3ED206F9
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 09:02:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0DN4uS6j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="c08nDERP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="XReADO/a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C3ED206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=4t2mx4xMygMVDfwrWUryFncSgr1HmgG6wkN+G/56cIs=; b=0DN4uS6ja/4Vo4FW0EKCS5JsH
	rH2fwrQdq0wTyy/nOyGgv1cYCdsOg5taKuq4Q5BW60gTQ4GfPug0T6wD6d5sk0YAS2+bvKMkLOm6k
	jGet+YWRDrLmUu9nJU41GagFWSL3TOflNAlBpYAEDAWkW6dqjYhnK2/aoUp0V6X4VPvq8i4qg5AcB
	n7WBFzynCIXC/jsShXpuCRcjuL+m4P1bT7L85XVEGVHdASuF8vXK5++SDSqlHnN/viaKZjjvURYwg
	pIbEKwrsFtefEGT/fMaim6N2ZdVLuxu47B1t7efk8z6WOcNtrPaCqNc6wQjP60EqYaPGEUR0pfN49
	alelDRa0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khqgp-0006zd-Gd; Wed, 25 Nov 2020 09:02:15 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khqgm-0006yq-6R
 for linux-riscv@lists.infradead.org; Wed, 25 Nov 2020 09:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606294933; x=1637830933;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=mn8lqUN9ZZL3ksoxNXcgVkrsqWNS85oBNQNa2H/sl8Q=;
 b=c08nDERPj/eckWWgxvKA9lWyhgbx+rnqk7Qlz8P+i51pqCMG+gypti2z
 /eMQNv83Whd8J74bEg/AEs0Gx40PugOZQRbqzFIafFcD8FGP3rQxy6vLp
 vIBF3vPoaIfzHSe8Ha3oqghufl/f40YbLelzL+IhHk7OBFJoFldp+8m0v
 9WC1PZy541e4WWRPemirFCKO4avPvHWORz2j3k9kfg1HZTN+02KaWk6O4
 FGMEKAb3tMwELtdSRqNXC1r9ZdDjrAMaMOJHJTXg3mbuSOnOCeakjSVBg
 cHFsGhfI5jJlgwyC2PUYHJhRDxl8n9iRnkjjMZAlWrjQpcdCyTsVaES3b Q==;
IronPort-SDR: bIrlFnxICO3byY97if/RaUXUF+A1Gzc5/6xhvj0rM5bj8rEB5zVoXS5yxpYc3L9+P7HUvWGaNn
 fAxA90QEilbLoTA4kXPVF9wLbHL+gFYU3kDmPtZVKuJKhOcIoCd9uOySCqW3jKXF8HbWxzmrQY
 S4UdHJT4ZX8CgEamEKh2Q1guwD3uu6dDFVJ0MOpOkshnurEiX825sdzMV4EWN4RHgIQcdUiNWo
 Rby0nrsdPDq40KL7zItTpB/36F5U4ZpCEnR3CBykhPmPtVtM5FdmA18tfXB1oR89aC4473lnko
 sAo=
X-IronPort-AV: E=Sophos;i="5.78,368,1599494400"; d="scan'208";a="154642604"
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hgst.iphmx.com with ESMTP; 25 Nov 2020 17:02:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8j3jk1o9Pj/XjwFvgnQyWJ/VIXM2R/WGt+ZOgr2D4L9r8holL3ksWSezPtUtgsSsE0Uk+03VKi9aDE6bgBf+K3OJhfZcEz2Zj87YF1VpnLqeSwO7L+HOVcyV3tuCrEJAsJuE7emhMHG0w69M5q489ikzIMGvAyN9OrV2foMEUXKIrpejO4BBUM+wj1obRaEGHHi7xgDe/tSwphUAAK4euElVSiWuj9xEQBc7Aiv3Q8R15UmtKyiLX5CnyRrTqkHiZak3SZWoIQGV6hZAnLlCqbTd+2mf5tNgB/6TvZA7ijClMv6h8tsqUMZrmQr5pWt6kzmZW0uTNoEQjuNTKmkhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1+orjbugRjjjogNrU40rqD5TJ2xRXwM9EpIf8VdSAU=;
 b=ZjntGkwubFMYbtVmZhYrf6XxvoKiL6ziPOZ3wAtGGX9KI91ZPzzLV6vCBiTtUyC4ornMuhv1MRyiH8JUr2ovrNqnYllpTpPLiAGNa3OP6WEv02arhamuhcweqsKsYvQWxVvNftanDMsfWx/EfpRkSAU33xvUox8Pqbg8Pl0TxKWi8yXj/B4vqSsXKr5mZ3Zk3uUX1UEw4SY1wf7Ff9t8NW3WTqyTnkqhEYoWlCqUfro3/LbmyjOasbZlN1t/Rp1XjJf2MO6eM7l0ETwq7G+nj1Sfzjx/LncDkOLKME84ysPyCJcbBbZ1qoQa7jiIk7mjVSgPzfjLoGN6ObwnKWHgUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1+orjbugRjjjogNrU40rqD5TJ2xRXwM9EpIf8VdSAU=;
 b=XReADO/aNqyfsiF5hQ+mx246yFLAFWF1fnBSoXCHUHphOb5jtXEoCM01xCuICeCiuiNX6UeBt+9qUmhm4KD0JgguSBGd0J00nK2yUax9Oidhq+p9C+KWf2rq7axhqhhFOq1cF8yXlt6obCZNyiXK/UtWKc298vPgVAlTPIMO1D4=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6603.namprd04.prod.outlook.com (2603:10b6:610:34::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 25 Nov
 2020 09:02:07 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3589.022; Wed, 25 Nov 2020
 09:02:07 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] riscv: defconfig: k210: Disable CONFIG_VT
Thread-Topic: [PATCH] riscv: defconfig: k210: Disable CONFIG_VT
Thread-Index: AQHWwpO1HQiFqsmnr0WJzbSNTitMeQ==
Date: Wed, 25 Nov 2020 09:02:07 +0000
Message-ID: <CH2PR04MB652268FD0FB44AA5DF36ACFBE7FA0@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201124185738.3541314-1-geert@linux-m68k.org>
 <CH2PR04MB652231C5B82E9F8184F496D8E7FA0@CH2PR04MB6522.namprd04.prod.outlook.com>
 <CAMuHMdW9dySq3y_Uixv8_7e+Pe2VKw4iGV36mx-DbX6-yzk-Gw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:7477:1782:371:aeb9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b5552c54-3c5f-4ef6-a256-08d89120c926
x-ms-traffictypediagnostic: CH2PR04MB6603:
x-microsoft-antispam-prvs: <CH2PR04MB66032015D47A848530441EC2E7FA0@CH2PR04MB6603.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FJ8go7V6Ynnlq3UPNeMjekP6h7WchBKWi8OXucvwvLE8AKK/NX0JEraTGTOm40iH6yyL02Jo8NWq0zuLA23OKhCONkZ9wxV7IOdS2k4Psse0vxW40ueJeGPV6LyjBWaZ0hOJRFWDcOHOk1HwwqoDzFgC51o6B2yDDjAKDmiRGB5xcMrBomhgeFDb8frLa6ZaIyXDcBpsEMjGb7qHiB8ggo8/Pvc4ek7Hl7/Ikp+h9EJwd7zQOGTRBXFBAqu6Z/Z8jxILcRw7WR2W5RK1F/OutWTk+U6WJE63UvtrtzLodj57tB98Cw2FF+cAZKRkQsE45tx5/sgxDaa1+O6upR+Xil/jfjC2mo2RcyHxedFJTQ2HvdQ5lNrNahLgfJA27B+K7wiTB6BImucpHD9f0uwpmg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(4326008)(5660300002)(55016002)(66446008)(316002)(66476007)(6506007)(66556008)(83380400001)(66946007)(966005)(8936002)(86362001)(64756008)(54906003)(8676002)(53546011)(186003)(76116006)(91956017)(33656002)(71200400001)(9686003)(7696005)(6916009)(478600001)(52536014)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?LN6+WD1WZB99mtdugGVIITUZyny1tHl9CuoMKbcjJv1wauKTElgayl4yKFqs?=
 =?us-ascii?Q?iI6vpbMK1BuqqKGI6rPk7PAZtpaxaTiTOI8N2KHrhmB5QvfKBmW/ciK3jqIM?=
 =?us-ascii?Q?dTEINFv74N+rtmqMCTEuMN5H2NA4+dGiiKRvl65jrosfTc8iXepgZJlKQrM9?=
 =?us-ascii?Q?uTMn4/Up23PblJaPuq8ikbbLbn5c+8nTumI7kEIsuspmjLP4ClGDgKFyWmZt?=
 =?us-ascii?Q?rsyN25GIlshU5tsnxEaEARnHRvf6j3VSnig0goIS9+GjhN71AHNNVA4X9yd5?=
 =?us-ascii?Q?CKm29y55NQfFLAR86DB3JrJAckmU59QfxK7kW0WhS3ZqN/VUi/EArBhrJgmw?=
 =?us-ascii?Q?lq8+dZpGHEtbmbouE7eGZa70cgZg2RRtndgoPZ+Zj7Y58aF7tJxzfDY/AoCg?=
 =?us-ascii?Q?lvgajMa+rh+sW+TVF7vPeqycaICJ5x82p4rIqINn55z8pD6+cgyxsifGUlpf?=
 =?us-ascii?Q?B5nMbgbpss9O59X4JcxMRRbKCLpBOVoMwg2KCqYpLefHkv20N6DsKTlNtqRY?=
 =?us-ascii?Q?L2FAPsoDTsugSNtiLdL8QEpH/6VAoK/rzMUD7aElBj0rWGnQmPrBg+DXyiAM?=
 =?us-ascii?Q?dW21nsQNo/ojhIRBtR2anq0X9MoCFdaw3Wzj+kQ0qhcCjHxVRw62fQhIED59?=
 =?us-ascii?Q?xPrABIBBhixtr4WeEcfHyQcMWRA5Tophelrm9RgR5G4AnfFY8vjIl4jYYlBk?=
 =?us-ascii?Q?JnjryUTcJypgOCLtjvxl133259QsAu062IZkiVL2W/O5iCwORX2JyQsaskVx?=
 =?us-ascii?Q?qQJDkPe9NvYpO5gVkUsikBhiijErhmpPhmO83i1mUf9txZt3NJrWGo0EMvqB?=
 =?us-ascii?Q?NueqVVPc/HluHjjWDaEdDP97Yudj2LEz8p1IqLmu7J4DeJqbz8JbZugivWOW?=
 =?us-ascii?Q?dATO71ikcQY91hmCckpK7ph1hxyBtRu/Lp/Kp8rejtDnGKKjkH+ikotmWJGJ?=
 =?us-ascii?Q?F7Yz68mnf77TFwsJ5LkThX+5gx8wkbOjhNjHeA7l/rqD+2BcLEdKmTPSOYJH?=
 =?us-ascii?Q?dPZN8lxXZ79QV5Pkauj8X4bvZUE5FRvpAd0fISvM1bPtSYLy9LIIZyscbOZ2?=
 =?us-ascii?Q?SqFQSod6?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5552c54-3c5f-4ef6-a256-08d89120c926
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 09:02:07.1852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CJbFcYaneFxlgo0IFCi6VY0wDsaHXfmHZkloI/79IE4CxpPrTTbFJHHWd+fJTGLqAPXoKDOMisIPiWYevleA1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6603
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_040212_452827_4C21A8AD 
X-CRM114-Status: GOOD (  18.23  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/11/25 17:51, Geert Uytterhoeven wrote:
> Hi Damien,
> 
> On Wed, Nov 25, 2020 at 7:14 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>> On 2020/11/25 3:57, Geert Uytterhoeven wrote:
>>> There is no need to enable Virtual Terminal support in the Canaan
>>> Kendryte K210 defconfigs, as no terminal devices are supported and
>>> enabled.  Hence disable CONFIG_VT, and remove the no longer needed
>>> override for CONFIG_VGA_CONSOLE.
>>>
>>> This reduces kernel size by ca. 65 KiB.
>>
>> Indeed, nice saving. Just tested, and all is good.
> 
> I used my old script[1] to check the impact of disabling config options.
> 
> I don't see any other low-hanging fruits:
> 
> Disabling CONFIG_BLOCK saves 492890 bytes
> Disabling CONFIG_EXT4_FS saves 322528 bytes
> Disabling CONFIG_PRINTK saves 214612 bytes
> Disabling CONFIG_SMP saves 214486 bytes
> Disabling CONFIG_FRAME_POINTER saves 166368 bytes
> Disabling CONFIG_TTY saves 156618 bytes
> Disabling CONFIG_PROC_FS saves 110274 bytes
> Disabling CONFIG_MMC saves 87656 bytes
> Disabling CONFIG_VT saves 70350 bytes
> Disabling CONFIG_SYSFS saves 62298 bytes
> Disabling CONFIG_BUG saves 50882 bytes
> Disabling CONFIG_SPI saves 34420 bytes
> Disabling CONFIG_SOC_CANAAN saves 34286 bytes
> Disabling CONFIG_I2C saves 34086 bytes
> Disabling CONFIG_PROC_SYSCTL saves 23890 bytes
> Disabling CONFIG_POSIX_TIMERS saves 18388 bytes
> Disabling CONFIG_I2C_DESIGNWARE_PLATFORM saves 17530 bytes
> Disabling CONFIG_MMC_BLOCK saves 17200 bytes
> Disabling CONFIG_UNIX98_PTYS saves 16360 bytes
> Disabling CONFIG_MULTIUSER saves 16148 bytes
> Disabling CONFIG_NEW_LEDS saves 15964 bytes
> Disabling CONFIG_SPI_DESIGNWARE saves 15434 bytes
> Disabling CONFIG_GPIO_CDEV saves 15352 bytes
> Disabling CONFIG_MMC_SPI saves 14754 bytes
> Disabling CONFIG_SOC_CANAAN_K210_DTB_BUILTIN saves 13864 bytes
> 
> (Yes, I have ext4 enabled ;-)
> 
> I haven't done enough riscv kernel development yet to assess if I need
> CONFIG_FRAME_POINTER or not.

Disabling it significantly reduced code size for me. Since the series is more
stable now, it is not really needed, so I disabled it in the defconfig.

I was just fiddling with CONFIG_UNIX98_PTYS. Disabling it is OK with the simple
busybox userspace (no telnet/xterm like app running). But it saves only about
1KB with my toolchain (gcc 9.3). So I left that one enabled. I am surprised that
you see 16K size impact... How big is your image ?

For me, it is 1.768 MB right now for the sdcard defconfig, with CONFIG_VT
disabled and ext2 enabled.

Disabling the block layer, ext2 and mmc driver, the size goes down to 1.511 MB
without any intramfs cpio file embedded.

> 
> [1] https://github.com/geertu/linux-scripts/blob/master/linux-analyze-marginal-sizes

Thanks ! I will try to run this on my end.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
