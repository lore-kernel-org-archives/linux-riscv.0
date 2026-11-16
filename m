Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653E0606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 08:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZFHGgkBU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wDTgA37LNcPXaXQjP8abuCksPrL9M7oKuXsYjlYlO5k=; b=ZFHGgkBUdWsBBM2djaNrMZ6n1n
	rNTV+ordn3bCeiwHFQB2zTakq2k6OsKzOFu+q7uUs4AjmvToyssXb3L4lOwD//RDYC8Etiq0oFTiF
	Uo/WBv6r1WrU5GFriMqGU5wc7RtRy/UhyfL8X1srlq9e4bRnywbVWU0Vk363b44RhozyIq8e5pcku
	hAbnUVUrEKvBWTqsC0CdOndOfVq/7zP/EMb+QPnoLqfOWuiEgSsGImFIUAT+1BCRbWI74N764ZdWD
	mp4j53I/VRXwv9jWqe/fDke8hTwROnV4i9F1+hBAm8RAmr96Fvp35RgbqwkbJIJ6tXNCLzfVbgQXr
	H+ffYddw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSreQ-00000001VgB-1XBp;
	Mon, 16 Nov 2026 08:01:18 +0000
Received: from mail-bjschn02on20706.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::706] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSreM-00000001Vf4-0yYH
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 08:01:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCQVAPK/LEXqMWCd5zSCf4V2p+O5RrErl4dSuQ0+P1DYuNTedNTXB2/Dz8/S3pZWzCd4HwzvXoFTvFOsnIQ9tzAcOR8YSi/srRA9IZamDOV2W9IDS43Y5ColMIswVAlcOfH8I6T4dZ+rTz+Kw2OInf7Pvxc6lVv9h+48rEjivXzdWP0QQ+WdpnL/zkDBsbAAvpYV4cOlnlydKmZTEN7G+ji7UyY4V5u3Vgfd5hxAZj9LATyaKT/f7EAs7GdCOktEy8KjiaAjRyXxJY3qM58F5zWF5YZoVH3NCBXXQM9mC9BTAdU5VXiYXSc5JPxJonuJ/JRN/WV2ryeQH0Umeb5Jbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HApZlbt+hTMg8Hf4OamGduqmsiTL4yJNzRju2xDk02s=;
 b=mSO6M+Zj3UOLXO7hQu/UbW6atis4yAR/MRE6y5D1EepvtOvJoYnbrLSkADk8jRPFXurYM9WoFQSuxAHN04CPigCyM3F2FYo6lBlLshejzcBrZ/pIMBMgSZCrjdGQWCTEKUdh/DQylYaMcu+kUIunJi6mNd17n7dnS570zF8BYgVU/idoMryDQWagUFbQHzuaroxW0P9UWJxccMxLYKwsMudHxhGtHe83i9p8B8KzQ1lNrNRA5PVACj3PR93fWQeMt8tyFtV4jfl3nIW2DRqEIeU2EXZffobRtMZmaqlfdtoWQtzu9S34RT5N+Fwz9qcQ3XCNagWlkyJvMYCgD1vzFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 08:01:03 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0615.009; Mon, 16 Nov 2026 08:01:03 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Brian Masney <bmasney@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v1 2/6] clk: starfive: jh71x0: Move reset controller
 registration to jh71x0 common code
Thread-Topic: [PATCH v1 2/6] clk: starfive: jh71x0: Move reset controller
 registration to jh71x0 common code
Thread-Index: AQHdWv1uA4scW39GXUGR8HsEG5hmTrcvYmMAgAEo4XA=
Date: Mon, 16 Nov 2026 08:01:03 +0000
Message-ID: <ZQ4PR01MB1202C1DD9DE098DB4674A940F27C2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-3-changhuang.liang@starfivetech.com>
 <179475230833.3873592.13070196353304136001.b4-review@b4>
In-Reply-To: <179475230833.3873592.13070196353304136001.b4-review@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1233:EE_
x-ms-office365-filtering-correlation-id: c157d13c-002e-4cec-337f-08df43b7c2d4
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|38070700021|56012099006|10067099003|4143699003|261022075727099003|261026121527099003|261021121427099003|261102123227099003|261021123027099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info: A3qN//guP7fxYC1gAl52ly0mBrF/ypL+VMVxYPEcfe0bYCYDvbGZP42WhaKx1tqRaw48T5Gyv8Lf/66TkfFtHV3SxUooPx+bpdx/5bexoqG4zh/zQHS09jhyvaWY5BqnEsgArDztPPG+Yq/wATlMkVQWFZx1L574JdQlvQ0C6LECCevMQhKz06H0vdFDJFdgzqxGfG/TUPSto8fqUlhUXOG7Vv1D9c0fbO8f4aY6DJVSp2OWrHImMW62lirvpjncFXfNNDW0IKAbB1Yr6pCe1NT/pS65t3WnXA6gC4yUKhsoudkhnFCtcpS07OteMYk1lRCK81kQt3DVIanOZ5ZXFPwoZrwHF3r4kQVsJw2ne7q7qVz1Mnhd/BH5K4TlMMSwkVqDj0WpgmE/RUcRe1cBdbPdgB2PQt3G5Avcq3mlCSo5F7hyvTBgbmL5S49db+/snHRfWBqLZcnbB1irT887VqlcnWoB5XY89cMEjq3VvT6mDqKzQtc5LuFzu+sLJ4cCQX5PvnMAAlSgb20vxbc9o3TGoO/Ou618/h/oLdTnum4d6vGEUjW4lnpG9muruGR+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(10067099003)(4143699003)(261022075727099003)(261026121527099003)(261021121427099003)(261102123227099003)(261021123027099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckp2L0ZhM0RGbTRMYUxaMjU4a2luVGlwTncyYWNKUTJsQ25NL25UdFVOZm5Q?=
 =?utf-8?B?MHU1cldIdVBDbi8vUlBTSjFDS2l1cnlISWhUYklDd0hBVFdJY1VWY0RCZHk1?=
 =?utf-8?B?MXRhN01KbU9LZmpRV2ZoZTIwKzY1eUFyNm1hQXhJMGczb1VOM2MzU1NhN0JF?=
 =?utf-8?B?cGJzSGpGUURvQ2h2ZkZyR1lXcW5aV29jN0M5U1N6WkNWaGJzYnYxWExjNHk2?=
 =?utf-8?B?UWFjMHFPRTdYUVpQUTBnbHZvL0RUUWtsdDFFTVFINXVTYXlPRElJdzRMZkpx?=
 =?utf-8?B?cUVCWlJuTjVFTCtCbndTb3RlbHc3eGRBd2ZhdHBwNkwrazJoNkpJL3VkeTRp?=
 =?utf-8?B?L0h6NTFTZFQyZy9qOE1sZG9RQXhmaUVOK1JyYWp4dzFjNGpvZ0NmSUM4WkUw?=
 =?utf-8?B?Q1FXcnlkV29uWTFJNk1ZZXJQSnZvODRoRmtHUW5GR2hXRkFaL3JlNml5UkV5?=
 =?utf-8?B?T2RudDdnd2xzSUJzWGVQRmYrZTZxOUZuL2FUYU1wekloYlRLR3NrSjBVSzM4?=
 =?utf-8?B?NVE4TWNRd2U0YzRZREJlTXhuUTNySFIvQzQrNmk5bWtWZHk4OW11c0RKeHN1?=
 =?utf-8?B?Yld4RW1DM3RmSUFZYnUyZjdNeFRkZDZsZVZUVStwMkVmUkdpVnRGemRSVDBM?=
 =?utf-8?B?eklhSjFjWEYyMFhycHVMQ0tpMFVCNHRlZ3pVdTgvb1UxTVRRL1ZRbFcxeWJu?=
 =?utf-8?B?Y0grUUF0eHhHa0JqTWVpZDNjVTZyaDVscmo4UlB4SHV4L1JWeDZ3YlZNcUVK?=
 =?utf-8?B?TUN1d1lXRWR6UDZnZWU2cUlqTjkxRnFUZ3lZck5ZYW9aZ3F5dmd1a1NWdENS?=
 =?utf-8?B?RVEyQXBlVFZkemF5enlrNmtlK29OQlNpOUJKNU5USmZkMmhFZFpWdUZ0VmdG?=
 =?utf-8?B?TWtQRExrZHZ1UFJVd0NRMXR2czdCM2QrcXMzVWpISm5yQjc1c1RVdGdjTTI1?=
 =?utf-8?B?NVVzQm5XNGJEQms0VDJ3SHRmYU5tQTI4SDZiN1BMcXZYUzVXeWltYUwvbDQx?=
 =?utf-8?B?WHN3UWx6MU9qdFhxOUhmcVJUTlNRa1NDZ1NSRThjM2FHaDAyZStIU0VhVGRL?=
 =?utf-8?B?YktWVks3ZHJCcXNYdW5yd01CTnAwb25vZHNza2xQMmRtVE0xaUI4ZUp6L0RE?=
 =?utf-8?B?S1VYQTlmZmowS0JwQTdZQnpqZk9LZUNPKzVCKzhockhQRXMwZUVOZTJmK09Q?=
 =?utf-8?B?eHhDdkxmaGp2OGNyaHhwVjA1b29JY2VFUjZZZ2ZISmlRdFp5R1pBemVKM2hj?=
 =?utf-8?B?Q3NXTUFWdjVIVWdQWDRFWVZ0bW4vQXoxNDA1czAvcU5XZVloZnJMZCs2eFYw?=
 =?utf-8?B?bEtTQUl3YU9tM0xTWVcraUVhME5UdEVKWnduOG42TzVoSEdlK0NvYXgxZm1I?=
 =?utf-8?B?bEc1eWVRZ3AyeWVrTk5LOFhxKzlRZjB2ZjBGdUlBWkdPVnAzTTBoVnhERk14?=
 =?utf-8?B?ckdDTkZJSE5HY05qNXlYaHNuMHhEaUNhVkpXRllKRmVzMWx5WGZxZ3djbE5k?=
 =?utf-8?B?K2tFTmR1b2pYTFJ1YTBIZU85eTNydDFpMW1ma1Vxd0N4bG82MllGOVZiV3hJ?=
 =?utf-8?B?bm91QThMNjdrZmVrYWgzbXNONnN4d1RJRmx0Vzg0TGxYNnBJYUFYTjBaSVp1?=
 =?utf-8?B?RUhKeEdMNmtNMGxTdng3bHg1Z0R0WXhTRk1vL0pMSHgzSFJUSnk0RmtyWmhz?=
 =?utf-8?B?akZOazZ5TEU3eWtUeHBNUEJYR3FIWTNYLzZqWTVtOXU2OWFWZnozd3dyRWZZ?=
 =?utf-8?B?ajgzdDhUSWVyRjNQd3o5TlZPYWpaaDhwU2pLWlRMbTZZSTVMdE9BV1Z4WnFW?=
 =?utf-8?B?NE92WkxOUXY3TldSbThwV0h2ZW5qakFVWUtabjd3RUkwVmxVL21vMHR1aHVl?=
 =?utf-8?B?Qmd0YnhPd1dFV2R0TUZpaFNoUmJnSHNlL2p0WklycVdXbjFqem1qT3hMNkVM?=
 =?utf-8?B?K0htdjFLR3AwYVUrMHE1RzAxTytyclVUWC9iVW9NRmR3UVVwMzJLSnFzZkxT?=
 =?utf-8?B?MVd0a3BqYndBVWNWVExnRmVSQWJDRnVKUGphYmdtZHpqcVc4UmpiQkNMaGY3?=
 =?utf-8?B?anYwNndVcVJIR29IUk5YWlhLcjRmMW1TanY2MW9tTVYyT0hPMFE1QVYwZkRG?=
 =?utf-8?B?aEtQeFZ4THVidUlrblJIM0VvYUMyZGFQU09kVWY4akdxdTliUFcxTytwWnBx?=
 =?utf-8?B?T0VBaFpuME1pdDhQR0NUM0Ftd3RPYVFzWXk1YUJkZ3lTRjdkUTZNbkNsWmRO?=
 =?utf-8?B?S1VCNmtDMExJYVdMWVNxNGhsZUs4ckZmTTN4WTZISTBPZVhMYWZ4cER3L2tT?=
 =?utf-8?B?N0wvaXBoa0kvNFZ3TWpmaTBac2Q4SUVLVFBJdDh6WlU4NHFXRkx6bjg1dllD?=
 =?utf-8?Q?l8DdwjsMlYL/uszI=3D?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: c157d13c-002e-4cec-337f-08df43b7c2d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 08:01:03.5665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w9tvrF8VisWOhPO+igOpgyVy4TL9eD0p06wob0G551ng7zccTPC07HNsz4tCb2VZElFw9f3gyKg4riUPJ4u5RQbn6f7tga2Gr64OqVHXqABANx8LMZV0NNxniiYxR7ep
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_000114_293413_258EA172 
X-CRM114-Status: GOOD (  30.14  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Jerome

> > jh7110_reset_controller_register() is only tied to the JH7110 system
> > clock driver by its location. Its logic is generic: hand the CRG
> > register base to the reset driver through an auxiliary device.
> >
> > Move it to clk-starfive-jh71x0.c as jh71x0_reset_controller_register()
> > so that the clock drivers of other StarFive SoCs can reuse it, and
> > make
> > CLK_STARFIVE_JH71X0 select AUXILIARY_BUS accordingly.
> >
> > While at it, replace the open-coded auxiliary device allocation, init,
> > add and release handling with devm_auxiliary_device_create(), which
> > already implements all of it. The register base is now passed to the
> > reset driver as platform data of the auxiliary device, so struct
> > jh71x0_reset_adev and the embedded auxiliary device go away.
> >
> > The auxiliary device ID is dropped: every CRG already uses a distinct
> > auxiliary device name, so the ID is not needed to keep the device
> > names unique, and it is always 0 now.
> >
> > Since the helper now lives in clk-starfive-jh71x0.c, the auxiliary
> > device names are prefixed with "clk_starfive_jh71x0" instead of
> > "clk_starfive_jh7110_sys". Update the auxiliary_device_id table of the
> > JH7110 reset driver in the same patch to keep the tree bisectable.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  drivers/clk/starfive/Kconfig                  |  2 +-
> >  .../clk/starfive/clk-starfive-jh7110-aon.c    |  2 +-
> >  .../clk/starfive/clk-starfive-jh7110-isp.c    |  2 +-
> >  .../clk/starfive/clk-starfive-jh7110-stg.c    |  2 +-
> >  .../clk/starfive/clk-starfive-jh7110-sys.c    | 59 +------------------
> >  .../clk/starfive/clk-starfive-jh7110-vout.c   |  2 +-
> >  drivers/clk/starfive/clk-starfive-jh7110.h    |  4 --
> >  drivers/clk/starfive/clk-starfive-jh71x0.c    | 24 ++++++++
> >  drivers/clk/starfive/clk-starfive-jh71x0.h    |  2 +
> >  .../reset/starfive/reset-starfive-jh7110.c    | 19 +++---
> >  include/soc/starfive/reset-starfive-jh71x0.h  | 10 ++--
> >  11 files changed, 45 insertions(+), 83 deletions(-)
> >
> > diff --git a/drivers/clk/starfive/Kconfig
> > b/drivers/clk/starfive/Kconfig index bd29358ffeec..51716655554f 100644
> > --- a/drivers/clk/starfive/Kconfig
> > +++ b/drivers/clk/starfive/Kconfig
> > @@ -2,6 +2,7 @@
> >
> >  config CLK_STARFIVE_JH71X0
> >  	bool
> > +	select AUXILIARY_BUS
> >
> >  config CLK_STARFIVE_JH7100
> >  	bool "StarFive JH7100 clock support"
> > @@ -32,7 +33,6 @@ config CLK_STARFIVE_JH7110_PLL  config
> > CLK_STARFIVE_JH7110_SYS
> >  	bool "StarFive JH7110 system clock support"
> >  	depends on ARCH_STARFIVE || COMPILE_TEST
> > -	select AUXILIARY_BUS
> >  	select CLK_STARFIVE_JH71X0
> >  	select RESET_STARFIVE_JH7110 if RESET_CONTROLLER
> 
> You've switched to imply for the new controller you are introducing later in
> this series.
> You should probably be consistent and align this one too. Not in this change
> though, it would be unrelated.

I'm not going to put this suggestion into the current series for now. I plan to send it 
as a separate patch later. Do you think that's okay?

> 
> This change otherwise looks good to me. It requires Philipp's opinion as it is
> touching reset too.
> 
> --
> Jerome

Best Regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
