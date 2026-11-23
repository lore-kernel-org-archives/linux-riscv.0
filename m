Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F801606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 02:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b0Dc8xZI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CMe+XSB6VnMcZxhLkluszw/nedZ3jJf6yuWpi6aReG0=; b=b0Dc8xZI8VljH+tV1gA+zQlLZz
	+fhG8JbzICQmEtDTVz/htBwiVKHVZ8ZVL28GLBfpJFWFjlS91WNUjnEGAMxDKyP3MKVGxPbDx2DZl
	P7Uvr9zielzfkxnvEswsLobluG86CGIsc34LcD71f6dw8NeD7iZfSdf9v7PZCmE+S+ZebmN8SM4Ji
	XOwz2v6MWRztHL5S0iV4g0JqB8/0+acRNOtKL87pDDOLHDoYJPpfBOnhTMasKujdUSLcRYqeMmb2K
	TyOzqhXq19ryavsyUCjcVkXFYuMCxogaHaGBmGoo8zsgjlRde563u8TTZ9ZwJaDAnlkm0mVG4P9Z7
	8DDM0ixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVJoV-000000028Mn-3NcP;
	Mon, 23 Nov 2026 02:29:55 +0000
Received: from [2406:e500:4440:2::710] (helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVJoT-000000028LQ-0eyj
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 02:29:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSW19GlKTaXlhZyjBESyCC82e+Z9BN3zoffQSzRODfLt0wT03eJQWU8B/Pvp8JLUpPwDQ5N7EqSfZoN82gfxMsebWwvFAGUH++6S6H9GWP5A4iEYLps7igymLXV6EO3Nd0CG+wbUcB9adKSK7xRGnzEccAbVZBGkFe8YvX011IMSGISyuHolnhSfgMXu6jdRz8++mSvjucdFOFenkGUhnCUMnxRx0ZeVTue1kgJtnoRw/AQkhSwCaOlyM4IWu0ah5Jl2nks7ei28eWv/XIXZ37qCqRG71pD5ALi4HWig4bjKBwMj6rkbbR2Er5dln27FP+zqZBaxYzgptWCbq4VEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7Ea8UbhPN0Dno6LPQF2R+dFWatd71Mn7WiRhWGl3FE=;
 b=CoebTQO8BhJXY8Ii+PHHNPvXWDyjT9SX8OCant9h35Azsk9+iXcwBOkmT7T0vVFMm8RN3yC+wo/qpOlgHEkWFruj/b8fKMv8U3pcXJ0J5wtbn6FX1gJ9+8tfdCRw3fXtcjsZeDW7D+frWLTHcwt+gV4JuRlJNdQP3X1zLRuOUytP5Xrby8gy/90ZPyqG8+MVMwOPd+3unvrX/0x5toVqpOHR43EpFAWgkQ/0unl0aXGbPB9iuEKZLt+4JZdS0RJtkfabX87uQxht4KcbR62PppXSlgC8UfTngMMnHdH4EgXSjjb7nbU8pbFyQt440b+q+6BiGv2bV8J4Zj+pPkIAfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1171.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.19; Mon, 23 Nov
 2026 02:29:27 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%6])
 with mapi id 15.21.0615.017; Mon, 23 Nov 2026 02:29:27 +0000
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
Subject: Re: [PATCH v2 3/6] clk: starfive: jh71x0: Add generic CRG probe
 helper
Thread-Topic: [PATCH v2 3/6] clk: starfive: jh71x0: Add generic CRG probe
 helper
Thread-Index: AQHdd0RdMHcensPM2kK9n/gu2bk397c6QgUAgAC0XPA=
Date: Mon, 23 Nov 2026 02:29:27 +0000
Message-ID: <ZQ4PR01MB120278600373D94EA1F5E136F2452@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
 <20261118100523.11395-4-changhuang.liang@starfivetech.com>
 <179536223421.2728475.4581137443338131034.b4-review@b4>
In-Reply-To: <179536223421.2728475.4581137443338131034.b4-review@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1171:EE_
x-ms-office365-filtering-correlation-id: 5ac256b8-0bda-4562-64d7-08df490998ca
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|4143699003|6133799003|261009223027099003|22082099003|18002099003|10067099003|56012099006|261102123227099003|261022075727099003|261028144727099003|261022105027099003|261021121427099003|261022113327099003|261026121527099003|261026140227099003|38070700021;
x-microsoft-antispam-message-info: 3PcF1rsw7vfmdOPLdUipWorCPeptSXoCrijIfRS/m9BOK7hZAenvyM6yOAzrjOzoG1lhZCsFfgIhi6wvjA6QvpW5Gek8apt5sb9PVd1VjVLZFZeSYgCmFv+3uR/YbAiA0eNc2ulAmmGOJ4dyf28bHtqwz1kNBbKBGwZghbZtBvYDFUx4hpj7dlHRP4VJpp4Agnbatte+i4JGVXJO/e+fwUD/k4UY7jg2HnRGWtdqFNJDv29q+edaggmorCnUlm8rXkNIPMNfZsXu/uWij1DVhtaYs5Sj9NWPLAkaC8EdVCOGtLoaSN+Yhwj2vzeV2bOTLC8gmQCIrHUz1ntxasCBjV90Ywp3XES0LOz9Yywlva7DNtpJWqNQcwztV05b2HHj9/XPIVhpj4DJ8afoB9dNX9eeJXyPM1m/QxOhzoVqe8qz+OeFDndxFwSDHDm3+a4p+nwMs/joc7O2aJ+kzDPbrSR/HezTKIQ1RV9PlG/O1XXB/ONnLDNNa/moz7YfSq6iI2alzQcEZREtt212O4z39bILxuW8eXlwLBW3SMzSRGSAPZTJ9WVXz2t3AP00g0LA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(4143699003)(6133799003)(261009223027099003)(22082099003)(18002099003)(10067099003)(56012099006)(261102123227099003)(261022075727099003)(261028144727099003)(261022105027099003)(261021121427099003)(261022113327099003)(261026121527099003)(261026140227099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NE5yV1ZGSnB1Uzc5YnEzaDAwanNlaE1VM1lFMXV6NWJJZU82Z3kyUFd3ZERx?=
 =?utf-8?B?dWlpeURvRUFSQ1ZZd092VmtPeG9ydlFVOVpSdGVBTlgrN3M2VWxmeElyVnYy?=
 =?utf-8?B?NEtQU0luRTlhbVNLNDJ3Y1Z4VloxTTZ3Nisza2RvR2xHQW5kZkNaNlgzeStQ?=
 =?utf-8?B?bnB6WHJzRkxnWk9EOVhTK2ZQbmZmNmtxY0NTV0J4VWtDSW5Jd1NDWjUxWUNV?=
 =?utf-8?B?VG10dVY5RzNEWnFGNlZWMENCaEYxQXd2ZEt6T3lzYnpaSmNmRkdoMDMzOTJF?=
 =?utf-8?B?VDJIcUZZMWNkaFk0bTlLUFdEU3VxdldmVFR6RlB1Qk9sbDlGOG5TbFZ6U2F5?=
 =?utf-8?B?R29BUzU3ZDhvaTZwa2JpQmI3U0tBUi9lZ2lhUEI0eFdSNlFMWW1OWEFiSk12?=
 =?utf-8?B?Qkp2dW9nZWVqdHpFRytGekkrdTVadEFtYjlOelkrOHZid1dENU1Pc1hYVnlQ?=
 =?utf-8?B?cDhFSCtiT1JYakRJL2JkdWVBdXV2cHJpcWRxWXY4MTJpeHFROWxwZkxvcjJk?=
 =?utf-8?B?SmxNT2x4THczVnhiNjZpWXhnODRianplczNyc1QyeGlQWU5LRllRT09nTE5M?=
 =?utf-8?B?RjUxeTlCdHBoSkt5cTYzUHB6cWRuZDRyb1JUWGtzV2l5d0RLLzY3TUZkNSs4?=
 =?utf-8?B?NXE5cm1kbEFSdGZYeVNRbUJLU09XWHk0S1duWS8yNkNwWWJXU21abVdXaUls?=
 =?utf-8?B?VUNYNSs1QmRRNGFFMjZNZWNhMVRiU2tLUkF2LzI1Z1VkWTVtWEN1V3Uybkpp?=
 =?utf-8?B?SjdZWjlxWXlVY1hxSDk4elRDbHExSUhRNTFSSWNGVjArOWtXaE1LeGEzTDJX?=
 =?utf-8?B?cVhtOWNjNXh4RzhjSkdkUlhSL25wVGV5eUdLdVVDTnNGYzBocVJsaTdnWEVL?=
 =?utf-8?B?dytyMFBIS2syQVlCeEZleExITVV1THpjVEZjTXB0ME8wYS9YNCt1d0pOYk55?=
 =?utf-8?B?VUtxTSttQzZOU3I4ZFVCQmtlV1hPSFVuMEdEdGM5aVM1MlFMMktBcjlTU2Za?=
 =?utf-8?B?Vy9uSVBwUXNoRERiYTFxcUJTN1pKQklEdnJUelh1WHBsSzV0Z2NOSUFyWUJN?=
 =?utf-8?B?VmUxWTFZTXVaU1pGV3M1VStSeE1Mc2ROYm0yNW1ublgxUXJRRUoyQUdwN1ZZ?=
 =?utf-8?B?R1ovZVR4ZzFXTmxodHBGWWJEdW5YVnU0WXBOWlF0MnZjUUZ2dXJvRWp6ODJC?=
 =?utf-8?B?VnZpQUNFZHNJUW1CMjN2QmVwR0RzWk50YXpwOU1pR3lHd2RmUFNRa0pXQWtl?=
 =?utf-8?B?d09VN3JzcDd4ZHk3a1hORXQ1OVhlcWhoOGlPeVJBYi9FOSs0a0g0R05yUmxr?=
 =?utf-8?B?aEhZeGVpaUo3NVljMlNEanNTamszQ3hMQXRtOEZTUUpzMGo3enNHMG8vSTZu?=
 =?utf-8?B?czdpWFpkejRJY2lreDluYUJYMTJ1d0hpa0JuRCs5bVlDODhyT2lENDFVc2VW?=
 =?utf-8?B?S29wSlQwYVZHU21VNTdDNDA2NVNnZ21QMGYrdGRJTkpqRzNBenhDcjFzK3Rw?=
 =?utf-8?B?am5uLzhGamlERWppMllrSkttcUJGMFVhbzk3RTNmRkRZNXZzOURBZ0dueDJH?=
 =?utf-8?B?bERZek13ak9ySDV1VkpoTUxMVnRiK05UUDM3NUZJa0FHNUVTTnUwSDhuRHMv?=
 =?utf-8?B?dE5kSys0dkc2aktxZTZHMk9Ia3BoSTdaNldoYmVHU3JwTGpOSjI4dHMyVEZ4?=
 =?utf-8?B?eDJsU0JHUGVGYjRoQ01oL1hDa2Vzc1dONS84RDFIbDdBOFIzSWVyQUppR2FU?=
 =?utf-8?B?ZVYvYmNzL3FJTWRpL2VNNURPemFjcTI3UmFkRlBucWZHNjR4TUhIbzQzUUVX?=
 =?utf-8?B?M0QrQ253bnNNZ3ZaVTZEbkdYVDQvby9oNjJCUHh6VjBkYXZxZlozbUdqUWt0?=
 =?utf-8?B?V0tJeEpxYnJjY0lVeEdmSkYwOXlaZ3huSkVYemlwRDFEZjMrZkszcnhZYkY0?=
 =?utf-8?B?dVA0ZkRWZyt3diszY3E2aDkxM1g0bndwK1FBUmZiRVRJVVdMYVpjeXBGMFlo?=
 =?utf-8?B?MHM2bTZacnZvYXpqUWRHUHFHS1ludGNKRHFyK2syeXFDQXdXWUtYSzA4VDgz?=
 =?utf-8?B?OEFmU3RhYnkybzRtR21tRTVlYkYzZlhzQjIraU03aWxUY202UTJZSTFYU08y?=
 =?utf-8?B?VFFsKzhDYUtSWXEwcWNtS05vTW9EZHJRejlrcFEzaVFHeGhmMnEzU0RhbXdR?=
 =?utf-8?B?WUY4Wjg3clpPSForaUFsOW0xaFJnTmszRXFVMElpUDQrcEdMQ1FZTXJIVGhl?=
 =?utf-8?B?amRITXFiUkE1bEZmcEtTa01CR3JjcCsvR2twZUk1RFZDRGtGZWwrTk0rN0ha?=
 =?utf-8?B?ajJyTkFBSlN5TWhGQmJQcW5CM2pzalo1dHZKaEhXYUpqMzNmWFFpbWMwYlQ5?=
 =?utf-8?Q?fck62pCla+2fxobg=3D?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac256b8-0bda-4562-64d7-08df490998ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 02:29:27.6645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YYUALX8c0mlOGldkJn7uOuh8roJlXTDQljrg21bbLXZIv/G9fEGMH9JlwFbS1oXYrmqZr+dT7AN5mD0xjzZVn3KBag9bUyIPgmeVhkL9GW+ceNRS6+9DGVFRNbL7opYT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_182949_199791_E340B85D 
X-CRM114-Status: GOOD (  13.61  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Jerome

> > The StarFive JHB100 SoC has several clock and reset generators (CRGs)
> > which share the same probe flow: map the registers, register all the
> > clocks described by a table, add the clock provider and register the
> > auxiliary reset device.
> >
> > Add jh71x0_crg_probe() together with struct jh71x0_crg_domain_info so
> > that each CRG driver only needs to provide its clock table and reset
> > auxiliary device name. The reset auxiliary device is registered with
> > jh71x0_reset_controller_register().
> >
> > The clock table is made of struct jh71x0_crg_clk_data entries, where
> > each parent is described by a struct jh71x0_parent_data: either the
> > name of an external clock or the index of another clock of the CRG.
> > This way the external clocks need no index of their own, and the
> > number of clocks a CRG can provide is not limited by the width of a
> > parent index. The existing JH71X0_GATE(), JH71X0__DIV(), ... macros
> > can be used to fill the table.
> >
> > The JH7100 and JH7110 drivers keep their own probe functions and the
> > index based struct jh71x0_clk_data for now.
> 
> I trust you'll follow up on this.

OK.

Best Regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
