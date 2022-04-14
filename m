Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E274DC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 12:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQVd75eA6z1Eq7k9MoO9/oh35WRuurT8uowWYQ09fwQ=; b=m+uHPN1u1HlBCX
	w4Fd9Q+IHx71/sLI1qPSizWFUtRAJevLcmO5Y6YYtkw2qKu3dC3FE/hITbGjuOaekER0PheF8HA+z
	yJhfjiNZGgLqSr3x95Fl3ZXy7eCYBiENN3WZNlPPmxdzoB6XweEk9iJ1w0aqNBFNtlyUDiiKhu9e/
	C/0xhIwFgq2k1sKOovlNCh9wqFU8+tjXQQTaArTfrV2PYofhrCBVT35qB8xv/t4VYz0owy8NOHu3e
	aDDS0a+Ah+nOmZFyqey0+HbUxNq0dKVNRc2YjXbvgL8mBjDQEA7QgC2ko4vQa4MzzpJRUnTTJCaiA
	OqJ1/JX5fL1dclIEKbAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neyxh-005ex7-6a; Thu, 14 Apr 2022 12:52:37 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neysu-005cOn-OM
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 12:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649940459; x=1681476459;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=47vyDcaAocNVxKHD4tOCroWnBDAHe6YI6yWaKpW/ZBs=;
 b=q7x/kRfOZYrwcJ0OViXRpmGHJN5jvBZlCiroSaxfjI7trx9WfHXUPfsI
 oO8AZ1N7GxNs9sn4+YIq/Y1t9543LULnd7v2T2xbbzqfaSaPvswaZcoz/
 cuETTj0/6lEGnOw7d/w5qtWfczi5neUZ5DQbCkt494yBjx7/nhg/7ANrI
 Mrkvhef0BewM1zqNZ84YTsi8NNxESj8EiJhN9JF6qyEFpO2YKFuQVxMCn
 p2evO1VCpXFHVbqArzHu99/plfhLPQNo25CIOj6xIavC2NmbbopHAzoZF
 Gkeu5AdcGdyTevEla+THgdKGxiqqra9bpXkbbQUKA+lphAZY+hAynUJhd A==;
X-IronPort-AV: E=Sophos;i="5.90,259,1643644800"; d="scan'208";a="202769513"
Received: from mail-sn1anam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.46])
 by ob1.hgst.iphmx.com with ESMTP; 14 Apr 2022 20:47:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+MtuRFGE2Xf400vua2OR7/xUqXpah/rBNf1PnQkGv5N4CzThm3cnkekmMYRdW8ntZARLe806Nws096s/lYzx94v0bl+WJMXz1tc87D+q5jf1PrCV+u0mMuSTD7efFV65h+2wDvgXFg0fLptIfbGxejkQcVglHIzEl9SA0S7mpNwsAO6Ws5eXsKWq/3fj+6SzxrVrdBZStl1vLWbeta4ygLV6R2hXrFKqTNGXxglSOX3nj2DjBf/npnakH1ARGAwkcPsL/4mPTdNbmUFXh2F2x56SXjeOuVYJU2YVeOHUOUNnVIArXXYgrY06C2oayqcty6ItS+ON2JchR2y9D1qgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wE4hKtGwbypUy14Nm0/YF/9lnlHNMpeXFCyvd++EKJo=;
 b=hNTpBkz/Uzx0vWVISyNg9j9GKw+RxKa2sCE5haET5zx0Lq0rxaSP9RKAsywQagLTbNqOL1vOnFWNTGOCTPFXaBy0vQIAMxJNmqb02DEB9iEwCe+Gmb64lwnzSRPx88FegD3Mu1DSbqRQtQ9QmSKKoLsNV097CHUhWhhJ6eYeaE6OtFdnsFrv4OT+GjTycSRTlPU8wBJ9NKjxD+ttY9CirA9r+bJYYcrvQfp4vKHrgUGv9+lrefXev9rY8KoHFJaDgfy1XpxMTBk6jN2uq0e/xjtHzzLmnjgiBC21o0HJYZhQ8a4uTb5uLKmwX+Jw4zrhwLrfzm0bd5ILeVRaPTw8Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wE4hKtGwbypUy14Nm0/YF/9lnlHNMpeXFCyvd++EKJo=;
 b=l4ul506Oj17iDtPDQ4EbUNUwX1usWbLdzvmD1uv2vzmJgYBcnrdlr40+nA2hbjo1a+Tk3QcS1MgEfRqRD+AWbNTMEmBqioodK8nnzFEkJdi4k8zupuuEmTAfN9CSGW8Ye1HcZuk/My8KSwOLycDfk8VNktgsYIFUcj38IKfpmSU=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by BN6PR04MB0898.namprd04.prod.outlook.com (2603:10b6:405:44::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 12:47:34 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::995b:363e:8d1c:49af]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::995b:363e:8d1c:49af%8]) with mapi id 15.20.5164.018; Thu, 14 Apr 2022
 12:47:33 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
CC: Arnd Bergmann <arnd@arndb.de>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
 <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] RISC-V: Add CONFIG_{NON,}PORTABLE
Thread-Topic: [PATCH v2] RISC-V: Add CONFIG_{NON,}PORTABLE
Thread-Index: AQHYT/3PpVq5bev62Ey32XjAs/jFzQ==
Date: Thu, 14 Apr 2022 12:47:33 +0000
Message-ID: <YlgX5Jy1pjPPI+/u@x1-carbon>
References: <20220414014010.28110-1-palmer@rivosinc.com>
In-Reply-To: <20220414014010.28110-1-palmer@rivosinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f49a8ca1-0cd0-4c60-d7b9-08da1e14f237
x-ms-traffictypediagnostic: BN6PR04MB0898:EE_
x-microsoft-antispam-prvs: <BN6PR04MB0898466E1AFC48A0055A24E4F2EF9@BN6PR04MB0898.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aIS1mR4KPhWiVqnboIcP3bgfiUhDKQaLHSn5uc4NvOoCiE119Yeu7Mjd5e2mV8sq5ap3YLye3aRjF840YhFXZDTcvz/BMFgxiTCpfW4rgL1SUtyWaKvf4theIyfji3j5JAuZvsaDCo/g7P+yCARiwcae2yDBZEe7N3UxLVV7KSyDtBkjvm7fU5t7KBqpEy+2IgKoWiJcvFH4qM4AyTpXw3QBFZZoBiUZN3dTmvAizuVEmZhxsgN9jj8fbseYH+xGDlIziFBlkkdXe2FqWZMNkfuHI+qevZhVfnjVvFlp0f7bHHIRLCT39teqKOPzUFrmxTtgB8GKG/DoJKiBGhSaVxOhfr2A7JPqv7IVyTyU3ZIaU4DeWUcZUjLaFGQKMCyUJKk/WbSDLxcAIo0m5eapZelyg2A8Jwlv+KFEwU5eMNr7uJV7tLA5svZrxcYF+yXfHwGICMRy4tjUvP/L3+ZEzKBTP+rKd0GOB2B5NdLdsq4UK8yA+u7ivie/p2Crjv+v/h1tKl2M9lApr0gPNta43bbxt8Q+ilIZ9yVqFkeJ6m3b8yElp/sClOq/vpa/neyz8JO2ipAE9BTFc86+aopBGV2jNraYThjJp0gfgjPt2UTHKq1UgRi4uXPhjB50lpmhxh5aoqzg8Rqu8ymBphz4VFjCJ1b27u9vaw53ptMJ7agV92z+XH2IoD2PcSgedGgsXQdFhryK10xM9aY+hoG+xg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(38070700005)(6486002)(508600001)(71200400001)(9686003)(6512007)(6506007)(2906002)(26005)(186003)(83380400001)(38100700002)(6916009)(54906003)(316002)(122000001)(66946007)(76116006)(91956017)(8936002)(86362001)(5660300002)(33716001)(66476007)(4326008)(66556008)(8676002)(64756008)(66446008)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4ZWpk+O50H2rFcWOJk8pIKXZqH/PLicSfABFja02yD47t0tN+U/WZV2J3Ol7?=
 =?us-ascii?Q?XY1l/FwMh1eySSUWwbzPyfW4V3pZbL7HjpeaAbOIFadx5k/0ZUSljwdY/cfW?=
 =?us-ascii?Q?yuSVMXbRIWHyBHzp7uGzEAzxfuXpHmrwbgM+0tXCGhvvq8MKUip/M8eaIENo?=
 =?us-ascii?Q?DA9k2gfKIf20/FMHDTv2aFS23/CPQmAGq9rXBzjL5zLEGMP9MRTemRKLxc0U?=
 =?us-ascii?Q?bw123CU3wuRbuf9BFyReOrkjBAr6XYWbnTTpDAQlfGNKqD/WFR7bpNmhU02/?=
 =?us-ascii?Q?jdmA+WTmB/oEDJXZq8BpmLL324ke0THWiB80XhIYisscXn8ordqcH3SgWW1q?=
 =?us-ascii?Q?zOEfv74G9Nw9+3yz8WSj5DYCVWmi9YfXyVWf6SwP2eSixo0sxe4fbYI59oSD?=
 =?us-ascii?Q?1FV9ZieDk7smBhmYv7KJMZs06Gy2SicRLsIdITInNFZ4EHE7Ch4czTgLlsm7?=
 =?us-ascii?Q?uls8gspDKiKaqoBOOdZipZDEOVvdFDTXyCyO7lon245tvuCbwkszbJLsgoVV?=
 =?us-ascii?Q?TgJazE7Xh2dthXt7gM0MCJsccYUkXfOkDJumOkfvDn2RxUzeRIpv/0avCuiQ?=
 =?us-ascii?Q?A1Y9QqURyLLrQJlg1czgmOtkgo+75hInPA9JJtWbE1rW9667AEfxYFilF6MF?=
 =?us-ascii?Q?yWUN2LoRhszO8Yl5vFawVmc/B1B5Lss3VUak+3o5Y3fvUDb5jcqsO8Jiyb3d?=
 =?us-ascii?Q?9sEbjegf6l7TTrTiDBayAOF+8qhpcPXryM6E0Mdc7HkWc8ix4OKdxSXpc80n?=
 =?us-ascii?Q?6VKNuDm3hOaOCS6BktHbh8QlUf9rS+2+ot+wALGs31VT4rwcV+aSdg10UULt?=
 =?us-ascii?Q?/q4EdilOb37hplswr41xZg0eyDy7+gj4Tbo4ajGaqbbOIE7eEBZ+b2JyNbk8?=
 =?us-ascii?Q?au1citP655UmqE/yhUVOSbuyCGFE/D6MFdjn8eSKQUVHRYEIQJvN87E4OX9i?=
 =?us-ascii?Q?E3SjzVxXFCQ/PBZ6w2BePIuFQwQr/NpkWdgWWS+yR9IyyQpcNJ65meiP2+BE?=
 =?us-ascii?Q?gOxHEW7q6dMUfNshVAm1CzDZGeiWGTm0aQKe+0vnLSRffktzFDIHgQpTBH8e?=
 =?us-ascii?Q?07a1y5LMgwY9iwZJM1kAY0zSxhsMH687QV9+8pCU+b8sFjBs9a+/2oU3rMCE?=
 =?us-ascii?Q?Z5d53AmS+oxYCHe/GOycgXj+jicyLCVSmI6qUDqlMKcaev+eIBmXbIuPt+GL?=
 =?us-ascii?Q?SPom22+0ur9czyu6U2T/r70cojbGzFT26PhXg3EAcz/MU42RdH7w2cZLJ61d?=
 =?us-ascii?Q?BFvWm+vNcp632xhriVoe0DnDMZOjXHWc1QmzRipsOnQefCdHYyMCIaP2ZDDi?=
 =?us-ascii?Q?leUO5U1RFaFNJuFsVRQko3ICVU6mHv/qzeZHqrTyOSmDyI9r71nIA/fMRK+Y?=
 =?us-ascii?Q?GHoslAYdGUBFr6e6Qm6XsI6jPCi3SD+knhBpHz8ZLWJojjsS/XqqxrRhsQwf?=
 =?us-ascii?Q?C4A1DCVFI3jjir5+TcJM+4Flvyi/0rPUxf0xs64RAHAqghXX1sB5FWdbQHfy?=
 =?us-ascii?Q?Yww+1f3IutguUb1gCqX3SeH3I5ozSsJhYVNvxPFNaYZV/lmrp0yU48w/VpO5?=
 =?us-ascii?Q?Q2hA2K+tlPT1+RpVdbQtkJXFgaGezTVuqZjXEzs63l3gnXCR2WeAYQb2XD5/?=
 =?us-ascii?Q?FiblEF4ihkH2eT8Q1Fhj2CyYCZcHlNiRshhLyk6BsoncKSuKpjt9HSyto4ad?=
 =?us-ascii?Q?/6D9FMbdF2kkRZQ2bo4gxNEXpgd2DEgNP3qYqRe7QDNevMTGoa501Aqsvo+N?=
 =?us-ascii?Q?Wcch6f2HmxzU7dGTLRMly3ENU89LGpE=3D?=
Content-ID: <D61A8D6DE3B8144BBE8A22B4D851AC42@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f49a8ca1-0cd0-4c60-d7b9-08da1e14f237
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 12:47:33.7021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s1bierIpzUCVaJ44rPB0AWrhj0LhvFXmViBvtosraft+g6Aof01PYHrEV7aoguaL9Y7teq0Uuvtpo+qhamTQjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0898
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_054740_907170_41D4F21C 
X-CRM114-Status: GOOD (  20.42  )
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

On Wed, Apr 13, 2022 at 06:40:10PM -0700, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> The RISC-V port has collected a handful of options that are
> fundamentally non-portable.  To prevent users from shooting themselves
> in the foot, hide them all behind a config entry that explicitly calls
> out that non-portable binaries may be produced.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> ---
> 
> Changes since v1:
> 
> * Fix a bunch of spelling mistakes.
> * Move NONPORTABLE under the "Platform type" sub-heading.
> * Fix the rv32i dependency.
> ---
>  arch/riscv/Kconfig | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 5adcbd9b5e88..3d8eb44eb889 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -213,6 +213,21 @@ source "arch/riscv/Kconfig.erratas"
>  
>  menu "Platform type"
>  
> +config NONPORTABLE
> +	bool "Allow configurations that result in non-portable kernels"
> +	help
> +	  RISC-V kernel binaries are compatible between all known systems
> +	  whenever possible, but there are some use cases that can only be
> +	  satisfied by configurations that result in kernel binaries that are
> +	  not portable between systems.
> +
> +	  Selecting N does not guarantee kernels will be portable to all knows

nit: s/knows/known ?


Kind regards,
Niklas
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
