Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C5AC5CFC1
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 11:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRWgmSfIdeXbJfKeQM9wz/3pabb19AM4ZbbawbO2sOY=; b=Egrc+Hbe1PQAju
	y2DHBHwOLCfrHhYYRkHhYQTxERatVFm29Hl8f0NDl8bOVnyjMUpKTq8BU5NJ7S79/QE3hcvtGlRNr
	0bFotXhnaqMDVH56EcXDboy1ntTcCRGLoRLNDTjEiJ1fp/lzEHGgBK/3XK2bgZWOnNnD0h3HigfH/
	RC+nnOpiBIFbwti8RJdgOBNjaJ9rGUvmI+3L42KaohqpiIjxH32iaMRQr/N2tQJYufme54BSJSBbe
	HMW7E1vtZpvMKdXzeB9YjAqDCPZ3/fJfql0tbHc9tF+xoDe8onxFVcr+gfjti0GEYjJk0BwJE45QE
	TKyD+DNQeg54AxlE/6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtkT5-0000000Dumt-068s;
	Tue, 11 Aug 2026 11:16:27 +0000
Received: from mail-bjschn02on20715.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::715] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtkSz-0000000Dum4-3O8J
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 11:16:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbVH9lNGBMZ32v+ftwDcvgnoxXjL9pdK8RS/tZMhz42FZ8H2eihVnx3hkpY+wp620WhGPZkVOUxiJhMpW0bTK/aVKzKc8kULhfZNWOWdJw6CIzzY9u0mvyWfPW6UYX20lRwTXnXq32rlvYrhtNfgZlDV4GLzWZpp5BnnEovYdMB07kqm559saQMpkW2pwxlaKQm6EdWZ0FZXpYyqZg7dxeI+9asxrLn8bV+g0casp4nQOTCfHlYhHZmejgSiJqvGoy6rzX0AbNXgznyiwcD2P2laKiuo65X7HzxgAKzaLzdnue5phrL99jxrXGnb6Bp3LazOg1ywxSZkkq6W4Sun3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DcvowcfNDe9GrXgb4pVuPCMSgCXJTTSkNxyZumTfrM=;
 b=QY4rXpHgV/0uors3ESX6+cvVCLw8nrq86Qm+oTy3cXZTrnfCrUB0QiN03XQpj6AeTkIAph3bwRDa2K6KhLs7kxCb2ThPPMtRX9+WfeUZiWmVdQEwx5/21OU/hff5XWOfHMqe6/n/wEkNs+Dv2S4//dfhtijUsL63n6dbBonqR0vVP80ucbJV5avWQ/nsPaw1+BYMPPiK3KWR+3BYX1+HI+xFAoOxIBK5pg/O6q8BbNRFWi2X9o+73HIa04aP6xRK9uhOJs/ohH0iSbiufmzOBY4VrLFnECjfoMYV1/3vms/zszL2jlkhlLnOBFMbbMkLcBgDzxLLMg6/4IYQalnijg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 11:15:57 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Tue, 11 Aug 2026 11:15:57 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
	<bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing
	<kernel@esmil.dk>, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
	<inochiama@gmail.com>, Alexey Charkov <alchark@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Keguang Zhang
	<keguang.zhang@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 2/8] clk: starfive: Add system-0 domain PLL clock
 driver
Thread-Topic: [PATCH v4 2/8] clk: starfive: Add system-0 domain PLL clock
 driver
Thread-Index: AQHdJ6GLvS5NNuAYikeWCGx3U49v07aXebyAgAE8kDA=
Date: Tue, 11 Aug 2026 11:15:57 +0000
Message-ID: <ZQ4PR01MB1202021D10801575B515F9A6F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-3-changhuang.liang@starfivetech.com>
 <20260810-dislocate-neurology-f40943216b3e@spud>
In-Reply-To: <20260810-dislocate-neurology-f40943216b3e@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1153:EE_
x-ms-office365-filtering-correlation-id: d811eb8f-df7f-4182-3e62-08def799eae9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|38070700021|4143699003|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: x1ej1dw1NPJIii8QnHtil/kp9ORGs5bmtwcoLZwghsfuJMeajeNkqzmuSlfITuWYK9xdead7uZWiHrwiPWspoBhPVyp/2OI/KCnhe1lghhVeeRkWts017BpvaDbq1+dLORND4uxZPbVZMfS3b1IoKfObmdK90G6WjjEIxWfNh4LK4uwBpK3hPiRkDSa7D5kh5Uw8o/qgEvJwDanezERDqa6HKvEqC1J/oPxR/awke+mW+L1REx9PmmBPw1ZPpz2QIiz3j2PBOp/OTs10VePbgRVt0aDA6K0zw+XmUE/mKmD0yh7aXyV1yyycf0/3qV0v2IJpXKa/vfEiUzWCuwJ+xNic7BEp3Zr1cm70rpg+3BJcUN5OWO+yO6PmAwr1ueIToJg01+XED8P24c0Uxercz3D3Vb+iJtOTdnoMD3Y24DN2oxcvjqm54cfxoSqdrFyx3jGdt2LxjnjSk+cBoni1li5zq+BPwXehjnIieDVoC+Hej0K5wFnV60U4StnEqEeegsigkXaXVJjg9Fpj7jA132JjGo0QSY1P7YchAivjkvSC+Baodgfvgstfa0A/euHZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(38070700021)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eQGPbIeWKXcrx/57QPbgVag1M9GWKICp0x/2vugIJX3u72aUR6aiiPgQMK4w?=
 =?us-ascii?Q?7hgOhflk+rukGo157OIS9mf7BLIfIEqKzkochcPb/LNybJfMTjnPJPT5NbK8?=
 =?us-ascii?Q?3vKIz191u1b597H7jcMDGOXC6JNDbJa8NrJV2KvbMlGRTq3ko1OBECXM1Emr?=
 =?us-ascii?Q?ocirmDwHNlq8YTe7TEKUnA7ec2g2E5ylGCoMTJkpkbDbKepFDhNR2Fq+RsE/?=
 =?us-ascii?Q?Tl4Wjnf/1W7uFoiRLLarTHqktgQciOPu6Sti7q1d7gnrXNLnLPMkyfGJCTEV?=
 =?us-ascii?Q?I4hswMe/e3wtVKNwEsO8AZ6po1XlAd5VoehO44Fzp1WCvOMbox+Aut05xnZr?=
 =?us-ascii?Q?5MoNXfdQKdccIZEeXNTZ5/gOBB5aL5tm8hHpE7ZewwYfSxG4GG2wFrZsHKhj?=
 =?us-ascii?Q?y/xKfac6fCbKd8OpXJ7AtO//779cFEWELTBc4ShtgWe9shXoWnFRDLKouCW1?=
 =?us-ascii?Q?5CnE2g1jz1Y8cyNoWik2BcIWLXBQ0H/aGE3hC5Gm9dQ4wvoWC/LJbkNAPDoH?=
 =?us-ascii?Q?w1LAvpmU42hJdZmia64Ww8bdKhQmXRUpNtZ/aOtW/YHfcCJF8iSgM9+xy/Ai?=
 =?us-ascii?Q?oz+n9VNovlJ2X3dM0GJdAp/ITNwxiAzHQwTTbslv/NurKYY/Uta9lPbvGAOo?=
 =?us-ascii?Q?7iYoTGPDbtUTqCsMyUaVFcPIvEzQl0UTJveE2VI/wcp++WFvkWueUZWS4V0K?=
 =?us-ascii?Q?PL/0HeWLxcbvHtKirZcWO+dz89TzFwT1+ajRrgIpunYLbhbuXNHzxNhMlBG5?=
 =?us-ascii?Q?LX3xlJXYOqFR29BWKjFCQvdN4OL/vHW2WqS0Wfz4MolZKf7MV+HInysJdV9T?=
 =?us-ascii?Q?/dleZjuH+FNCTS7g/JgkCFuXxB1k05P/7Mp6JfNP/m4MoyYiU5fsjW3E0uhy?=
 =?us-ascii?Q?3L2ZEcPVMPgF2IUjCFrTJeLB2jzZk4dXKBEuebUODfS+rrtbMJOJM4WjUOPh?=
 =?us-ascii?Q?jQSX6G5bcigsLTgjrpwCKonlEFTpfd1oGyhv2jvGgGgsoDJoxfoUNFUzCWhV?=
 =?us-ascii?Q?yEevaElcvn1XwQ630CHO/thkncphsH8IEwdkZyqJp6BIptdX9lSgKv8Lx8sd?=
 =?us-ascii?Q?WaZYPcVoj3I6AaeFJRk7VJhNk461LTCBsdMkNdqzlTKiuuV/WB2p9jxBiCuO?=
 =?us-ascii?Q?BNB90kgmnSIbFEu46/FS+4iZY18s/bu2mhk+4t2FhUJAGjOMj5ZmJ3MOMxaL?=
 =?us-ascii?Q?XmoMqRY4SfVioIPnkPxJZtmmvKQnFH0dX1/fyv8h/IFUSU6mSEvxMiAkI8gL?=
 =?us-ascii?Q?DBY5+KDrO+XFRo/bXn7sKB7gRvA9xMXTg8k3MP42FxjMEJv6drrlVVHtIPP3?=
 =?us-ascii?Q?p8O3lWcHiR0zXHTUA7vbG0vDXBIPWz87WXkFD9k8gubYIxECTmJ2XRxuYkpt?=
 =?us-ascii?Q?CLgD3kuSZfEr8mucin7f13t7a1ooe4bxPH8eXhlXFtZJAzCjjJ3XGSaXXOQ1?=
 =?us-ascii?Q?P/r1n6GdwtVBdZc/fiUO5L/mB1r9L2gsfbzr7eiznuVKM4NePHf30HiaXqHs?=
 =?us-ascii?Q?ds2sJupAFYsiOQoaw35ckMeyOGntC5E2YKPsQHfsUcQff8aUd6xRZThN3KUM?=
 =?us-ascii?Q?9YP35t2XEnK8a9CbVT2y9cslP0UHqbJxXRwibc2Vb3sgVcAxnfjE9u/gOCJC?=
 =?us-ascii?Q?mRwpHefyeefJ79Kj+icq/zGpdWdVb7brr2o2FlOQWMBcDRU0eBnNu1Z6XDYX?=
 =?us-ascii?Q?HFENO4CXY6ACN0UgV3e1yE1yNj4iCVU+f745+gtpoR/GHburOs3En9WPHhDv?=
 =?us-ascii?Q?wuJPq5PlC6OsvqEBQOq7BLZCHke3tFo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: d811eb8f-df7f-4182-3e62-08def799eae9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 11:15:57.6351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +xnd96Qn09JTUKkk402ls05tUiCehopNN7NVo3hGfVb63Zeb4ezPmabLyC1ATIYsOo3C0WltH/39T9nfm435mFdQcT1EzcKy7IbCgWClnG1qUQ9cMPwqH5ifzI/WN1fu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_041621_849304_52FBCDB2 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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

Hi, Conor

> On Sat, Aug 08, 2026 at 06:50:48PM -0700, Changhuang Liang wrote:
> > Add system-0 domain PLL clock driver for StarFive JHB100 SoC.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> 
> Could you please get either Hal or someone like Xingyu Wu to review the
> clock driver changes?
> 

Okay, I will ask them to help with the review. 

Best Regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
