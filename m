Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9610AC5519F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 06:14:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 129A5208CA
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 06:14:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KDHS/6Ih";
	dkim=permerror (0-bit key) header.d=wdc.com header.i=@wdc.com header.b="SUh6HCnL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="icAPg7WQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 129A5208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=MYSYbk2c/tQJYezzg6RvWRdnk6zKGv3lwofYdcNEtss=; b=KDHS/6Ihy51Lw21A7vacrRr9i
	kPIfu+bZsgtC9CajveVyIq3nR34kKzj32h4nL+Fxs1S5wtJrto2t9iQddEyQlrwDH6Hd35+/dEKF3
	wYDpu3/BmAxY5JDNCgr+J01RJJtjbo9Ot8UMsDLYq8olcO9xtUsrQRb5Vgoehm4RCEI9uqqp6wCLu
	iS6mh8Chp/zK9DApF0lFa/Kh7qx+3gvo4msJK4o+MCF/WuwUQ6XU6ofDzoeoV85iCDPpm9gfkevPX
	6xunKaIwi4egn+VNLXdZHXPmiFnNu9t5+8QCelMf6RYl5cCd9M4eNAQm5I550NUbOTHgmp1IbD8JZ
	0xb7DCiWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kho4h-0000zA-Lj; Wed, 25 Nov 2020 06:14:43 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kho4f-0000yT-Mj
 for linux-riscv@lists.infradead.org; Wed, 25 Nov 2020 06:14:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606285375; x=1637821375;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=lEBuSKDz7A9I1573NJOWsVt5AfQ7DjKT9kZYIvRRgMY=;
 b=SUh6HCnLaIeoRMbev+GX2pIpxWAaLX6U78JodKs06JHkAST9xdGJS8xO
 Ijwx5nKmm3FfcTgcaAjmLJC7SukEOnpjIxTjoPiZRZMx2KRPwTfw6LUKl
 3cY/L+eiQg5BTtXwcqgpbSCBa0vn8PnxzJ2bX9keGqvdDTh4UYio3HmIH
 iDtz/h927UdUTilME7Lhw3CbQN5UTyfhWO7MNemAJO1ks+RvjpI3wbNNP
 60J6UX0giEHVv89VYfBftyFmdW8NhX0I9wjv5SX5fw86rtpGYbfwb8pdE
 YOdyFKiEX7+nc705fZEzfPlmY41GBnHohQZdX8eUBjqzFhcPexpo0zfRY A==;
IronPort-SDR: Gcx+TvSy0NXU+geL0ybbGY9dqa6N8jky5Ezc+0CyfeHuwxWW9auFQdTgjHbExi8+5hPtZvP7qN
 57YDpISE6hQT+lIPCsoZcXYzNpZKdUDj9JyE9wU6bjCgK+cvgpMhuGctLCPSDH6t1fO9wS9eqO
 QRFduv+afHa+lYUdq4Ai7DHirL7EpiPHm/UCdPCbyjywSj64QDHpoa/ns1ThFuJZnLbWxYkrSL
 lixtT26fQ3ikJ8+110/82770ayE15Z16/MAQsxeBivQd3Z87jK6Jg/8tZ+MoFTFyB4kM7SVSVG
 9/k=
X-IronPort-AV: E=Sophos;i="5.78,368,1599494400"; d="scan'208";a="257062168"
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hgst.iphmx.com with ESMTP; 25 Nov 2020 14:22:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOvLQbboz4p3Vr9jHOD7ao1l9LBrIrRtTW8Mo264nh4b2E3qG5QDbY4ubqiuNLAHPFwSi/59bN2YTONL8LEFqyIMXI6XdMAfWumaRK4oeq9xiq9ilymEE4nELDc+BruOz5le3jugw4IbFc7Pilfrdk98tGTQsgI6loAnpkLgpV821Sarhpz0r3E0SR2uyHoSeIXX+mTt/uROweNFCVKgg/YXfxlRHz0WVAv3k+UPaqSBWEalPrt2HtrJYXZroC1UqEdEpBfdzExZJfocNcTOb2aU2k7OVxMKWQYb9vtXWSD2iv7WamRjPm/pTY7xUZLqK0N7tYEF6kDNfE6bK9froQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUy+IuRwKwEINnPViVgyD8SJ7lOCv5zw013XMzPCDPU=;
 b=lbg6OJr4h2zQp8K4vdagAJ+ndc0koYZpAnvCJoZDHtin/vV8B99V+GjH54NSVQ3He32VbYVZKRSNrb9ujurPvlaWQatYlu1inBSeunDjofClKXz3cpJVKDiHoOPaiR6WTbM8M228X2Mzi4dNWfBIpbuSj21KBUSTujqHfOaYk0f85KMsSzxV9ygS02uJtQp8Kw2uh9hIkHVSoGZ3rsWX8WOU2D5VfY6BkfMTQSEV03swOAZsUJFAnFPkbRz+pH35DHISxZGDrAofX3q85jN3psAsV7tRYSuy+K7MNFO3nvWCpWSeufQ8inok0ErhwTTyVgWKQx9vVVfZ3cuZfzRwPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUy+IuRwKwEINnPViVgyD8SJ7lOCv5zw013XMzPCDPU=;
 b=icAPg7WQDFdQnqQOMzqSInGhKOH9GnmoU+7mg/hx2uGpvbMUYKS7JCNLQjgMBRzkc3n0skCqDhz9MHDXbo8UI/W2CHh8GUIxWTRodXU3x0MSbxZSu399eyRewYpoJ7YZ+pMsx8b5J37ru/sTCCQYKRUu4FCwStr3hcPFIheftl0=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6538.namprd04.prod.outlook.com (2603:10b6:610:35::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Wed, 25 Nov
 2020 06:14:38 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3589.022; Wed, 25 Nov 2020
 06:14:38 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] riscv: defconfig: k210: Disable CONFIG_VT
Thread-Topic: [PATCH] riscv: defconfig: k210: Disable CONFIG_VT
Thread-Index: AQHWwpO1HQiFqsmnr0WJzbSNTitMeQ==
Date: Wed, 25 Nov 2020 06:14:37 +0000
Message-ID: <CH2PR04MB652231C5B82E9F8184F496D8E7FA0@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201124185738.3541314-1-geert@linux-m68k.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:7477:1782:371:aeb9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f0c68056-809c-438e-eca2-08d891096362
x-ms-traffictypediagnostic: CH2PR04MB6538:
x-microsoft-antispam-prvs: <CH2PR04MB653843957CF7A4BFA4280BD8E7FA0@CH2PR04MB6538.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z4x4bgqKvGW6v530qpF2GQ07J3smFFhF/LjLwNBS5zCFgxOrFGGRUZrDrB5dYNNsff0kFlknFpwGZ0XWsdWpE8ci2zDsQEbQh0uPcMnt10s08DS+Pn3mp6AjRSkpLrWXxdZn26tadbz77uod6p5wXeAkThHdtves0kpXXZTdRf11vb58oOxbY6YSdCkXsicG7/ZPf0qVJhnCjxgOAkl+a+dYYLhG15U4DKDflI1Lidp9IBgACOC4WG0izb+j55AcR+xG/3yuyBy2+hgQEGYXZKDWnpEdXXAMFATbpgfaMLNedPo9fyd3WLFloJUlc+7y8bcbqNDmWmOJb0SNss7LYA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(478600001)(83380400001)(71200400001)(7696005)(91956017)(66476007)(53546011)(6506007)(76116006)(66946007)(52536014)(54906003)(4326008)(64756008)(5660300002)(66446008)(186003)(9686003)(6916009)(66556008)(86362001)(8936002)(8676002)(33656002)(316002)(2906002)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?8YqnsJviO1yxQ8LJePpJ7pYxHegvwm8qO/IlHsAujIGW0bzzUHGF/RIJWTo2?=
 =?us-ascii?Q?Lvu0LVBmunWttEv7VmsumPjVGgM9pPSz2sTWl0MKziZPZNgcX0cwPsVNt5B2?=
 =?us-ascii?Q?MP/J0ikLN44jNlrTqNxgmjfrg3KNgc4WJQYupEG153csXE1ZMZeA5q5odfuO?=
 =?us-ascii?Q?M6XtEMPuuNuNLfK1lgXLnJr05h5cGrAeJ0OaFS3Q+BzYTibqlgxmzfpncDoy?=
 =?us-ascii?Q?CBxWtKs2O4s0bm3UINpy7+/I+kyYfQzyBMNBvyBV0RRULVO10/85VZHhK96G?=
 =?us-ascii?Q?uogeZxowD6eXLKO74fs1792Lj5sVeDGa6eoCwV+BhGms6/U6j4t/teXENWhc?=
 =?us-ascii?Q?EtZFePB2nB3LstFTzZXBbjbSDzX+5FD5VEQD1qZcc4h+a/B1lOJjmmedkztX?=
 =?us-ascii?Q?w+NizvTeckAvWEdyAuzInznWQqWrRVMJU46x+Ynst0nWH9aHH7EX3f/8d810?=
 =?us-ascii?Q?/KBLLjuNcpBiUFTCpgaBV1MsgUQbpwU+CtQV9sZ/AhqzMFVZpPenkTbxHPiV?=
 =?us-ascii?Q?C4EEU8s8+SFkWtvX7YEMiA4sqAYV2ZJe/XOB7NgCg/boWC3F1xCA9Y5plROp?=
 =?us-ascii?Q?97BOh/ftgd9tQPXgI6vFI6CZFqRExGLxDDWlgNexG57FEhP5hE39C1t59ljZ?=
 =?us-ascii?Q?Gxc0FmBBz9Loj2iB9rRQJd/OHHCLvm/FKY3TBQH8R1mzGTaqXQkw71MKyGRK?=
 =?us-ascii?Q?eRAWK2kGDSV8CPjmPVYYCRzJkHLmAtViJo41Sg4hVnHyyBK5ubGaeddG/MXk?=
 =?us-ascii?Q?oepdvt5AifqQ62bsPWJSB85SK324+4fclVq+fmY+l22zQ/T9cnD5QxETOfkQ?=
 =?us-ascii?Q?x8oO74PJ5SiBUSjG/ZqADG0biZSKfmkcVO6YWKtXdJcxQYzwX717nyEKcQxO?=
 =?us-ascii?Q?dCBAYoML8g61JcqfhQ+9zw/AuBFbd2dNV0BxzhnbXTOUf6GvTzmVwDbMm/vY?=
 =?us-ascii?Q?zbFmBj+qtTa33U0pgX48A2HjAYbs8UCPElKUGBLOxZiZzkYRvjhf3DpYEvb2?=
 =?us-ascii?Q?QhAfUqjGUMnKA//b1VheJxfLwGaXCMH2IJfiPvdlnnVp0mVeL4++fPDAXagK?=
 =?us-ascii?Q?Rz7i49Bu?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c68056-809c-438e-eca2-08d891096362
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 06:14:37.9721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o0VzY5KycZc0FOzttIzRr777ywO+D7HNsX/rTKdI5eWpyfpu9Tax2JxIuHjEpaaRtkhzflO/ajT+t2tr6E+y0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6538
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_011441_925586_7D0CA10D 
X-CRM114-Status: GOOD (  19.11  )
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

On 2020/11/25 3:57, Geert Uytterhoeven wrote:
> There is no need to enable Virtual Terminal support in the Canaan
> Kendryte K210 defconfigs, as no terminal devices are supported and
> enabled.  Hence disable CONFIG_VT, and remove the no longer needed
> override for CONFIG_VGA_CONSOLE.
> 
> This reduces kernel size by ca. 65 KiB.

Indeed, nice saving. Just tested, and all is good.

Can I squash this patch into the 2 defconfig update patches of the series,
adding your signed-off-by ? Or would you prefer that I keep it as a separate patch ?

> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Against k210-sysctl-v15
> ---
>  arch/riscv/configs/nommu_k210_defconfig        | 2 +-
>  arch/riscv/configs/nommu_k210_sdcard_defconfig | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
> index df89d53bd125679b..9262223037e43479 100644
> --- a/arch/riscv/configs/nommu_k210_defconfig
> +++ b/arch/riscv/configs/nommu_k210_defconfig
> @@ -48,6 +48,7 @@ CONFIG_DEVTMPFS_MOUNT=y
>  # CONFIG_INPUT_KEYBOARD is not set
>  # CONFIG_INPUT_MOUSE is not set
>  # CONFIG_SERIO is not set
> +# CONFIG_VT is not set
>  # CONFIG_LEGACY_PTYS is not set
>  # CONFIG_LDISC_AUTOLOAD is not set
>  # CONFIG_HW_RANDOM is not set
> @@ -67,7 +68,6 @@ CONFIG_GPIO_SIFIVE=y
>  CONFIG_POWER_RESET=y
>  CONFIG_POWER_RESET_SYSCON=y
>  # CONFIG_HWMON is not set
> -# CONFIG_VGA_CONSOLE is not set
>  # CONFIG_HID is not set
>  # CONFIG_USB_SUPPORT is not set
>  CONFIG_NEW_LEDS=y
> diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> index 3d2cb4747e7f85b7..4cd1715dd0cf3747 100644
> --- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
> +++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> @@ -41,6 +41,7 @@ CONFIG_DEVTMPFS_MOUNT=y
>  # CONFIG_INPUT_KEYBOARD is not set
>  # CONFIG_INPUT_MOUSE is not set
>  # CONFIG_SERIO is not set
> +# CONFIG_VT is not set
>  # CONFIG_LEGACY_PTYS is not set
>  # CONFIG_LDISC_AUTOLOAD is not set
>  # CONFIG_HW_RANDOM is not set
> @@ -60,7 +61,6 @@ CONFIG_GPIO_SIFIVE=y
>  CONFIG_POWER_RESET=y
>  CONFIG_POWER_RESET_SYSCON=y
>  # CONFIG_HWMON is not set
> -# CONFIG_VGA_CONSOLE is not set
>  # CONFIG_HID is not set
>  # CONFIG_USB_SUPPORT is not set
>  CONFIG_MMC=y
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
