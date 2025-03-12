Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F84CC28B28
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 15:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o3cBsHzQ/vWbCZAngN+peyEukk9mIHckpvyyQk/OJ7M=; b=GDvUJqPRpPatVJ
	wMr+GEcrfa/QXASPuJCJEnF8mVm36Vv+jumHeyDSeBKcs70JK246ikAOim3cKscyYEVg2YFoxtAK6
	mZabepcskMBo/JQYYtq9H5JpRWr/jkbfVHzxDAwN8fuj6IrIDKaHBY19qYsEbNqeIEXp8HMAFssZi
	q8b2/T47FE3r4/8l7NO/qqgWrub36hGB/Ne3hnkLbqwFF9iDX5m2auABgHfdH9umtfkQ9TVeR6mub
	RbfDohYQf92Lf01PilQ9OWkDlOVmrJ0nw2bwkcWRKe7ABGtuZed71BmBisk+BQYEwm5z+X4pRcFqK
	3Ms9nvL4NCNiA26xIf+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsO7X-00000008sx3-38iQ;
	Wed, 12 Mar 2025 15:35:47 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsN1O-00000008gqE-3ivE
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 14:25:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvjFzb7H51QofHyYj75ofoxId2cOl53kPDGRiD/j8y5xNa6ZcSxnWMZqxAdpJ0Kb7UKmqwrGyD0Nrtd2C/xPsZsVSiKcembx0LJ5tklgmFj99jkiY1l7xlDRAlw0H5q1JbDky/w9vXAyVzF8ZTBJhGZ0xkomHtx04MS2pBLgv4g5cNN4Sc/XhTF9fAW+3nryHdbQzb8TsNb0f1FG0EcsXAWXxj0adlpVvhDk8Yp0AO1LWfX0JN/Uc+smHBC10cJiOSZyVjay+amIZPXg4K0uqg/Qiaxjz/hiDHhLk4TRx/aJBTxmdQLCcoTNjshrur7hZFwOUcCWfngXvpH8UjJ9sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Avg2uBet6we0NXyFa/kolgZrPPS63Yhw4v3grqsbJYk=;
 b=M7WV1d8T3+AJeASprPkjafUlhbXzJPZjlkwLZ8u52eMlhmpwO/U/SxZiMqrFAB6wytBp9xtfkg2Slv+P3vN1Q6YweFjqigjGJKSGi4nhNDb55fRqwSuvqn+nKvUwcqO2txSWYQBbFP4aPBZoBfHQTAGxCZL7wkdOw1g23tJY5krVxNNKhmf3HGlSCUaph4hpzHRkGkXybdZcoFdcnF3z2BPxfieLePRM4o9dSbgf9/4K4n209YZ2+6FxP5Ulj1fFEOnGCLhzGZpAVL4VvWKdMBlcbbNjfQ234R3vXgZZEg4mFziLYGLK4/1W3LnRszoANc9fzuvrGpjs1QhSfd7wyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Avg2uBet6we0NXyFa/kolgZrPPS63Yhw4v3grqsbJYk=;
 b=v2z0/uqiSWnjFrhZ8M3GH/3HQc8EG0IJSf/xI8OIXGoKlAUokwiYd0/z4YZl3UPQ/uTM7U+0hUL2uL5FAPqtUPGALskR8s8jhQsEUvQri97L0Qt95ehWpRrw90rr/7rScd6KmgVc/3puX13hzgV/wsk6DVZcjbDEZV6T4cLb5Ts=
Received: from SA3PR04MB8931.namprd04.prod.outlook.com (2603:10b6:806:381::22)
 by SA6PR04MB9300.namprd04.prod.outlook.com (2603:10b6:806:41b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 14:25:18 +0000
Received: from SA3PR04MB8931.namprd04.prod.outlook.com
 ([fe80::f323:b482:8b18:af1d]) by SA3PR04MB8931.namprd04.prod.outlook.com
 ([fe80::f323:b482:8b18:af1d%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 14:25:18 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland
	<samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Min Lin
	<linmin@eswincomputing.com>, Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Yu Chien Peter Lin
	<peterlin@andestech.com>, Charlie Jenkins <charlie@rivosinc.com>, Kanak
 Shilledar <kanakshilledar@gmail.com>, Darshan Prajapati
	<darshan.prajapati@einfochips.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia
	<a-bhatia1@ti.com>, "rafal@milecki.pl" <rafal@milecki.pl>, Anup Patel
	<anup@brainfault.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [External] Re: [PATCH 04/10] dt-bindings: riscv: Add SiFive
 HiFive Premier P550 board
Thread-Topic: [External] Re: [PATCH 04/10] dt-bindings: riscv: Add SiFive
 HiFive Premier P550 board
Thread-Index: AQHbklgRgQTFZBJrh02jn1nr33adDLNvd3sAgAAW/AA=
Date: Wed, 12 Mar 2025 14:25:17 +0000
Message-ID: <SA3PR04MB893109C2F7D6DB3B0499B0AC83D02@SA3PR04MB8931.namprd04.prod.outlook.com>
References: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
 <20250311073432.4068512-5-pinkesh.vaghela@einfochips.com>
 <f6601929-3d1e-49ae-8120-c3005f99e57b@kernel.org>
In-Reply-To: <f6601929-3d1e-49ae-8120-c3005f99e57b@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=e19e35d8-71fc-4d79-80da-75a96a024300;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2025-03-12T14:18:07Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR04MB8931:EE_|SA6PR04MB9300:EE_
x-ms-office365-filtering-correlation-id: 6855a7b4-f98c-4071-6344-08dd6171b6a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WFBxbFF5eVZla1h1RGJxZkZSeWN4SjZTUit1aWVYTXJnTUxBbFhQeGRLWis2?=
 =?utf-8?B?NkNNZEVHekdoR2h4clNqT3AwekRhMmZ4ZEFsc1VNaHZvZTMySStvc3dOOHVY?=
 =?utf-8?B?WnRaSXhBREU1SWFkWW9kNWU0QVRGWU00SnRTTWRsS2ZSaFlQbllUQzdtMTJU?=
 =?utf-8?B?YUxWbExhV3d6V0V1TG9veFR1OXRNRklabHI2TmZlYmNGMlYvWlNPNTZ4NTFD?=
 =?utf-8?B?YkVKOTIxRVRHRnJ0R09qSzdJS09qZ2o5VTZ6MG9qYi9QczhoazdRbFFXMzZh?=
 =?utf-8?B?TU9HM1QycEV6QmUvN3lRK0lZZUdDbi84cVRWR0dVU2JSNU9mVmhHZGFEUnVm?=
 =?utf-8?B?M1FteEN3cDZmcFVTTHYvLzN0RXZmRWFHa3Z2Q3gwTmF0b1llYkVWU3UyQ1Vh?=
 =?utf-8?B?TGgvdHFERE5aQ0NzTUNnY3NQdS83OEFudEVnNkd6K1NzZXhNWS9PV2NOa0Z1?=
 =?utf-8?B?OFVPYmJPV05zdFl3OEY1MCtzcmdQY0tCbWtVTnBKUEVpZTVpYS8rVnJqYWUx?=
 =?utf-8?B?MWx1bHc4dm9wYlBBU2xyQVpqcWFyU2RTQmFTb2hEMDAyZTEvTW9BSHNveWJY?=
 =?utf-8?B?cDBybXd0TkhXbEYrTkRLcFN1bi91bGJCcjBxMGVrK2dvMnNvclA2TDhNckx2?=
 =?utf-8?B?amxGQ1J3KzZOeEh4L29IVHdpaTM0bkN5ZUdKYThrcWhHK0JGdEVlcmVGcU5y?=
 =?utf-8?B?ZjVkN2tnYTYva3RxcnBvQVRTL29YajlUYkNMZjU5bFdOQVlhWTJGZGRQb0c5?=
 =?utf-8?B?eUdxOG5HaUVwang4L1kxRU1aQ0dVSkFPUGJjUG5HaUs5Y1ZpZzdQVDhScTFm?=
 =?utf-8?B?clVldk43VW9TcDBKbGMwTnRZNjQ1WDg0UGxpRkhrUWJ6V2RkbDhiYkdQWWZj?=
 =?utf-8?B?N1Jta1IxZFFPS24wM29aUFo3a1NVRE5GU2NrcUlKY05iRDFaQUhCSGhQOEJN?=
 =?utf-8?B?ak94bEJaL2FPTnQzNkV0YXd2SXo3M0FwQkZWYyt1TVRORy9DQjJldHJNVFhy?=
 =?utf-8?B?RmhaUllJdXE3YXJkcEFCbW1JUTRad2o0ZnFrdlNlbU1tdXdnWm1KdXhsckw5?=
 =?utf-8?B?SmRsK09wQlZjSDZVeDh0N3Y1TnhpelFFM3ZVTElvZ01GLzRaOWlwekZGZlpP?=
 =?utf-8?B?UDVDampFaEhNdk9mek9aZlNXMEF4Y2FFNndpTGlVRkdRT2t5VFZjTnMzMVcx?=
 =?utf-8?B?YVh5TkdUZlhkTkJFYUVRWUNCYjBBbjl0WXM0a2RjNnJpY1dvaFVvZXlTQU9Z?=
 =?utf-8?B?NGRKNFRtSkRmUWs0amF5bVR1VXFhM1F2cm80L01ZUS9Bd3gxTDNpcExVaEJN?=
 =?utf-8?B?cWtxQkJuNzdra2lpRll2T2NSejhuK0J5VGs4YitlVUhZaXhnVGlNYnlCcnFv?=
 =?utf-8?B?RnV4QXdRMnl3NEh1N2VYQXZhbXpUZGgvY05DY3h0YjRqUHNVU1M4Q3IzMmt3?=
 =?utf-8?B?bCtrdG1ZSzZvQk1heDFlNXhEQ1NrTWlJUVcybHA4YUdyd2duVUdtWTlrQ0pU?=
 =?utf-8?B?YXRJck5ncnd5K2xFd1lMZFN1UUFkTDMrMlV0V1RzVFlMSElQUmF3Mzl0cFB1?=
 =?utf-8?B?cHVNOE5meTN1dVlGblhBY3c4ekhtWGZpS2RJYkZ0SFlVaGNxSW94RWJkUU1N?=
 =?utf-8?B?R0tHSitjN1JkU1l0Nk44enFSUUNEbHFzYk1UMkZGNDRzemcwSnc1elRuaWdi?=
 =?utf-8?B?RG1lYjMxTEp3azBnYzV6bWFLYUU4b2xsczFaYUpEaTNLdDhMNnAvaFNVNmho?=
 =?utf-8?B?c29MUnhRTlFDS1orQW15ZU54cGVYR0s5YlBrdVVCOUplVzNCYXVQaWpORm0r?=
 =?utf-8?B?WU5WWloxbGw3SDdMVzhBOTJCQ3JRbGl2YU9mZjZuUnpBRWJkdGROTldseGdX?=
 =?utf-8?B?d2crQ1Q4cmhyVzRrQk13cHJJRFM2cXllVFR4clMzckdLZGtyWVdORVFPUWJn?=
 =?utf-8?Q?Vb6h/KaxNIqCPZ9h/TaMoDYzPP6A2rT9?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR04MB8931.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEoyNTI1OXNWUkQyQzRmQll4WWo5U3ZRSHZCREpHR0pzWkM4SGJlVXlmS0FB?=
 =?utf-8?B?YndidW9qZmtROWtkZFN0NFZ6UTlMd2R4Zm55WWk0RGx4NFdpWE1oQWRzcmQw?=
 =?utf-8?B?YkNOdlZoK1JPemdyUlBBbmZnaHJTdFRKdFdPcVdTQjlJdi9RNWpzNy9rUjlv?=
 =?utf-8?B?dmJDQjFadjUrWEIwWXdjSDlSa1hDdkhmLzJSc0NDOTdhdVliZzVlcmlOYlpZ?=
 =?utf-8?B?LzBVeFdlMzlNaldhMDNTSnVjenM1d0lmRGFrQkhOQlFod3Z3c09IbUtaSkNr?=
 =?utf-8?B?Wk8vcGhPdUxyWlFnSENzbENiVGhKN0RoeTV3YUdIekRHTnN3bk1OeVM5ZUhr?=
 =?utf-8?B?SVhYL1diUDVtMmFxZmxBSitzVWVTZW9GdXVXQXZ2OFBIenh6aUhLMThoZW9N?=
 =?utf-8?B?NFRqZjFwRTlqano4SzhtTllMdUFYN2tlSzlkMmQ1Tlp2RW1OTGRkMWMxN3h4?=
 =?utf-8?B?MGJTc3l5cVU4RzgwK2kzTWlzekh4R1B1disrSXpBWGt5VHY3SnNwaDZKWEhF?=
 =?utf-8?B?dW0xNEtRclBlVnFGT0I1Y3FITHROdmlnclRtV1BIeHluUnNvNEw5TE0yNEZI?=
 =?utf-8?B?ZDhJcjFMdmFxZ3o0Vy90YUlpMGlHaG5VQzdVVjcxclRyTndnUWlEM0dvazJD?=
 =?utf-8?B?bGk3ZURmVXdCOEkwV0tid3dyNVJOWTJVUzdSK0x3SkhWWU01Zmk5OURSbE95?=
 =?utf-8?B?UElITFE2TUZNNDhWbFJCbFJsTUkrR2xqOWgvamNkaENCei9sTW1Qb01pdFp6?=
 =?utf-8?B?Wno2Wit3MXFiODlsTzVTN0dzRXE5M21nbTF3SkUwRHdBSU9tSy8zeUFVV2xO?=
 =?utf-8?B?dXZjMTNNV0w2UDVTbDdzRlpoODM5RS8zc0w0SFNXZFhaMitGcFN3dmNPZVhJ?=
 =?utf-8?B?WFJ6TTFZMHp2NjZPYVAzVEZWNW1kdzBxVHdHVXRyd2ZUZGdoUTZHMFBKNFA5?=
 =?utf-8?B?b2t2WkFSTng1ekxOdllGNUtzeWFRSlhhbjd0RE9MWFRtUWVZTnpWaGE5QWRn?=
 =?utf-8?B?RzVWamJiTForZGtUSUU4ZXIzRVlRSDYvSlJzZ1doaGx6akpJbVdFRlY0TVZh?=
 =?utf-8?B?cUdHTUlMeU5XenBJQUFveVpqRnBzUk5xbWlZY041WmtQejFtdzNUSisvZ01I?=
 =?utf-8?B?UVRDMVl0Y0J4L1FBVmVmeDI4bllEY1NObEJ0aDczRFhpL2FLN08rczFzajIw?=
 =?utf-8?B?aExITW5UN3ZEbVRSS3hzOWRRK3BrdTd2SlVHU2tNUXNEdFdmeGtIV0FtZER3?=
 =?utf-8?B?Vk5GMkdNb1hqR01mT1VtWkFsRm40dWhtWFJvTm10dmhYZkVCSlhZZHQ2OUtK?=
 =?utf-8?B?M3FvVnpUOHVieXFuZWFJOFJ4WUpHLzRsSUJJQlFyNVBIYWFveFBwQlhoNE9V?=
 =?utf-8?B?NktCbldOdjg5OWdQd3dCYjI1ODhWZHJ5Tlh6emVEOE5EYjFrTVN1dlQ0WU85?=
 =?utf-8?B?MndFUVoxYjVHTTlZTWxaMWVaZjRyU2VucUsrQ0FOQWtScDNxWXJyN2xWcFBa?=
 =?utf-8?B?Q3BINy9GMDFUZjRsLzQ5RFh1d0FxNjlIc081cW04TXhzWXF3TFZJRzJLR0pT?=
 =?utf-8?B?aWZLaWZadHdrZlpPNmN2RHdqdWQyRE9xOENWRGwwMEFvMlNMUTJGVXB1dmJC?=
 =?utf-8?B?TkZZaXpiYmUyTUQ3L3BWZ3BTQjlVNnNRVzJGMkN1WU5Cc0NYQnFqdldBdldV?=
 =?utf-8?B?YUhYbE9xRFNvbHZWMTZ4bTRZM1hWTlp6bXcyY1EvRnlvMk9CWGZJRWtKMXBE?=
 =?utf-8?B?WjF5R2FBeEN6UXI3Z1UxZ0twN0xuK1BqRmh3TFh4ZTZtUi9tUzVuR29MNklD?=
 =?utf-8?B?U3lReDFTa2lSUHdGL1lKK0RlK1p4VzYxaCs2QVEwcDRQdUlndVp0SjRkeW4v?=
 =?utf-8?B?K21LYmVsTHRmQy9aSUZCc1F1cUZCdUE1eVRXQ0dGNjFTNTQ0WkkxYWttRVVh?=
 =?utf-8?B?UURISExDQzg0ZXdRVGN3aiswaXlsSk9hOEk5cUdtNEo3RWNKVWpyc1FoeFhY?=
 =?utf-8?B?OXR0TVlJaVZKUEM2eWZxaDk3Nlp5bkpEdXZzcUZBd040amZsdjN1TSswUXV1?=
 =?utf-8?B?QTBSWkttSEZ3eTV3b3FpQ0Vqc2l4OC81K3dwand5OGdUTThTTVk1ZjNsV0dx?=
 =?utf-8?B?TGJaN3Rmb0xtWEFnTzlTVFpPQTFPYnpVQkRoSmhQZWRRZExoMmpnVVM3WkVu?=
 =?utf-8?B?ZUE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR04MB8931.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6855a7b4-f98c-4071-6344-08dd6171b6a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 14:25:17.9696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6XXqHYcE1SHH3XtGC4nzKF9TIYy5/XyoJG1oWXyrlro1TFYOinZf+Da5cjFCrUUT2vScwdu0LRn69kA9ctvkVN8nVnoG9Qz9uY0kUnHPTHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR04MB9300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_072522_930125_EE2724D2 
X-CRM114-Status: GOOD (  17.79  )
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

Hi Krzysztof,

On Tue, Mar 12, 2025 at 12:55:52PM +0530, Krzysztof Kozlowski wrote: 
> On 11/03/2025 08:34, Pinkesh Vaghela wrote:
> > From: Pritesh Patel <pritesh.patel@einfochips.com>
> >
> > Add DT binding documentation for the ESWIN EIC7700 SoC and HiFive
> > Premier P550 Board
> >
> > Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> 
> 
> This Rb tag appears everywhere, while this is a v1 and it was not given on the
> lists, so I want to be sure this was not some blank tag added to series because
> someone said "yeah, lgtm". Was it really review as in *reviewers statement of
> oversight*?

The "Reviewed-by" tag was added because we had a thorough review of all the
patches from Samuel Holland before posting.

> 
> > Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> > ---
> ..
> 
> 
> > +
> > +...
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > 25c86f47353d..901d0e0adb25 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8572,6 +8572,12 @@ L:     linux-can@vger.kernel.org
> >  S:   Maintained
> >  F:   drivers/net/can/usb/esd_usb.c
> >
> > +ESWIN DEVICETREES
> > +M:   Min Lin <linmin@eswincomputing.com>
> > +M:   Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> > +M:   Pritesh Patel <pritesh.patel@einfochips.com>
> > +S:   Maintained
> 
> If you add this entry here, then add the path for the eswin binding.

Thanks for the feedback. I will add this in v2.

Regards,
Pinkesh

> 
> Best regards,
> Krzysztof
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
