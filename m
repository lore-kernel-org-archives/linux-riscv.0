Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEC1C8303C
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 18:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vKW6Y41mtKZHa45yLuiXfS5OG5FVy8URqC7gnIogIMY=; b=UWEcfufHK7OekNsRd9DAblXdsi
	xiXwHlbq4wsSGciMsQZ+QevwD8MtGxZS9Hy/gYgokZb1C+TL6B2fSIAGllmbmcOvplbGOY4UsWAS2
	nqsd4mFB55gbSyQZtFgze22UA1agjyyupxhKRq51JF1HOjJFBwkJci2PyikRqGHLTdaCGIk79eJPW
	fkzISbxHysNMAZj//QxGA4nVz1yhkozRHp0D6yZUGvFXrrpTo1WrWjEb9RHJvkIZARRbcLYVhGPe8
	O4Y7hMO6SV0wO3JWpaTMNNHs4WARkAPSUwAgW+qlJC7D3HGl3K4dM+VfZsygJ0mC5vYXeXgM/8yDW
	ZXGh9cIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfzH-00000006Mfk-1jfB;
	Tue, 01 Jul 2025 18:45:47 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdM4-00000005x9k-3ELQ
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 15:57:10 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UDogO8J5J6QWTusW7FDC1HDGBugT8v+yXTpV+a/hOX98ilDCHu46vCu5D5DOqBweVRmZ2EaTaOW16vxKEfKFlF+RwK5xh5eTARfxU8UrbL2WnC/FG1TWtk5WvTDgF/blz4huNODMGdJfDl3iuzborHtEN1EhveTRet8sSNP5qQn7Be0KH62jGX6IwsBLRsn7ExRdwYdtouhJM7GI4Hw0bBeRcNMMx4qi3zAx6JGVtvdHQtjSLzrVvDOIJMzvtReLBfLvgDnQ1hYPijnaWzhRerU2ukf9nMpbMrvV2eHSIKbqfGnM020hKOYPfLme6PSlYyuYOz++Q+CPt2/84w7hBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYZfDEV/ClJxJkOX+TBC/gdbn2sDp9gcrE9533turIc=;
 b=RwquSDLXPr1s+Per7/wUIlAwG4bjx9zGOY0Fa/gbz0sppaignFRKvTrDUdyJzsRWq1vvCBNz83IxC/mLl9eDQXVlEXlvShuAPWPgjNvhlJD6txbwLrny8AZB4ji0HM/S6ThP5DBuB/GNpu8X4VLZTFIMgY7bZkXPDfXoUd41PYQD+e9hf+IRYZD8MFEeY+kx7bGLmv3KHEX2tW4cL2DaTudNQtPXBmAy5l1BIZTAf5KAi2WrpKKS3wsDYqkdBuFXD68IBdgI2gc8FXr1BNXbqpAmIYQoofBhv3VRe8nBDoEXcopWVvZw+gmuYF4eIcPzTnmGXLg7wLW+WFD/4Y5Fig==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.81) smtp.rcpttodomain=alpha.franken.de smtp.mailfrom=seco.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=seco.com;
 dkim=pass (signature was verified) header.d=seco.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYZfDEV/ClJxJkOX+TBC/gdbn2sDp9gcrE9533turIc=;
 b=U3xMhje8xcqz71AxHe0LjWWpaOeV7ZP12wMKx+FJ+i45ojyA6eQCHo+f4oCarxX6c9P3F9DyjhAH2P1ToU0qYDnOblj/G64gT3HmO6UTH5eWMsm+HXbtbFEj/8AuO/NXNCtTujOQisNeBoZKpJJtXyxeaFMsa9YqGkG5wg8MQ/KnwlpEJQ+zEXqZglPKgMM19sIPHJC9RKrMIcxLVyKcxnydIRUpNJFkXpKWQk0FhBbjrgNEkkSLODy5/rNzrsaAVXUb1dV8bkfrIG0nWVOLXooB+J8TRL3xfq3zx2REXYV7NMlnK0lCPKiTBwzWnFpiaNeGATbhuup46M3aBrfvVA==
Received: from AS4P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::11)
 by VI0PR03MB10759.eurprd03.prod.outlook.com (2603:10a6:800:26a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 15:56:57 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::14) by AS4P191CA0012.outlook.office365.com
 (2603:10a6:20b:5d5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 15:56:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.81)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.81 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.81; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.81) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 15:56:57 +0000
Received: from outmta (unknown [192.168.82.137])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 0F8F620083982;
	Tue,  1 Jul 2025 15:56:57 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (unknown [52.101.70.103])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 0997F20080078;
	Tue,  1 Jul 2025 15:56:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVdc90HDrz/nJTvkEx9yGL+KFyqBU2PUgtKFbxkogmMzSShlaCrb2NSqfXdJKSEWNH2vN/aMw5XjALi0VIyJpF4J+DLiQ8ZAzv/o9nW4ln9PcaLetfMjuUMXHc9ES5fEcfxEZi9ZT7mlVcsdycs39nGm7VNDjaAWIH7tEM2Bx+bss9xVg5nQ3LEar834D0Zm+xmyvCU1xqeXvz7D4A5pRTa1+Rho7wHY/nEF44DzeUI3bOW7GJVCFprr5dF1gFPf1vU1w2KOvtuT3GQf3rv/tj3hntaXakrt6AoSiTqKS0pMJsUnn+tjQ15pl0WJWqRAKHW9euahGQJtHIhE4p8lIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYZfDEV/ClJxJkOX+TBC/gdbn2sDp9gcrE9533turIc=;
 b=jfneY+wXs1SqPyIUKavaqK+mtNIfSn+t5bWJ/kfkT9t87cG3kT+TE+dELheWRTfj+coc2juQNkUY0dBjTfIeyqrw7IXmfcifHbl0udHNQgv8nQ8+Bu38pFhGS1ShZKW8kIz/gnE8zuYW6flDFjU7If7T9TtZK6mr1S7vKG1ihpves80+TxOVUc0QBP1MecHU9ubJqL1TOKAAq0X/94fgSWGueu/R6J9+XCyMfQiJ/EuxnKP6hSIP5dpyfE8E6p0XnqwDGIS/MsRzPKMMtwZOoWwFC5XRXiwOzMX4nBzVS5d6CJboYQoXFy18CIoePNGP4EshxiJTyiAf0OOciy+8xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYZfDEV/ClJxJkOX+TBC/gdbn2sDp9gcrE9533turIc=;
 b=U3xMhje8xcqz71AxHe0LjWWpaOeV7ZP12wMKx+FJ+i45ojyA6eQCHo+f4oCarxX6c9P3F9DyjhAH2P1ToU0qYDnOblj/G64gT3HmO6UTH5eWMsm+HXbtbFEj/8AuO/NXNCtTujOQisNeBoZKpJJtXyxeaFMsa9YqGkG5wg8MQ/KnwlpEJQ+zEXqZglPKgMM19sIPHJC9RKrMIcxLVyKcxnydIRUpNJFkXpKWQk0FhBbjrgNEkkSLODy5/rNzrsaAVXUb1dV8bkfrIG0nWVOLXooB+J8TRL3xfq3zx2REXYV7NMlnK0lCPKiTBwzWnFpiaNeGATbhuup46M3aBrfvVA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com (2603:10a6:102:329::6)
 by AS8PR03MB7656.eurprd03.prod.outlook.com (2603:10a6:20b:400::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 15:56:53 +0000
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::2174:a61d:5493:2ce]) by PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::2174:a61d:5493:2ce%4]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 15:56:53 +0000
Message-ID: <d3d7d92a-7969-4838-941d-329f7333340c@seco.com>
Date: Tue, 1 Jul 2025 11:56:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 08/18] net: macb: introduce DMA descriptor
 helpers (is 64bit? is PTP?)
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Harini Katakam <harini.katakam@xilinx.com>,
 Rafal Ozieblo <rafalo@cadence.com>,
 Haavard Skinnemoen <hskinnemoen@atmel.com>, Jeff Garzik <jeff@garzik.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-8-ff8207d0bb77@bootlin.com>
Content-Language: en-US
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20250627-macb-v2-8-ff8207d0bb77@bootlin.com>
X-ClientProxiedBy: MN0P223CA0009.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::7) To PAVPR03MB9020.eurprd03.prod.outlook.com
 (2603:10a6:102:329::6)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAVPR03MB9020:EE_|AS8PR03MB7656:EE_|AMS0EPF000001AA:EE_|VI0PR03MB10759:EE_
X-MS-Office365-Filtering-Correlation-Id: ed709f2f-061a-4ed1-3156-08ddb8b7e858
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?bWxyYncyNkh2WU5oMFFOLzdZR3NZb1pkanl2UG1iTlYybndYYy91MnRSblNW?=
 =?utf-8?B?c3ZPZEZrM0dHT21tSldFUUVHTmtJN3ZQRlltb3RlMUVNUG44Yzhva1RHVjRH?=
 =?utf-8?B?TlBJNmFrWE1nUWsvUG9QZkpsWHduUjViUDNJTkRjZ2tyUWRJbTY2MUNOZFlQ?=
 =?utf-8?B?UEhINlB1cEhVS2NrV1MrdkxkeXc2L3NzdHh4aUVSaWNRM1dqb3pHSllyeW95?=
 =?utf-8?B?Yzd4UW9pRnoyVjBtUXRJY3NGWTVjUTBLZmtFUy8vSCtuTXZ4ZVk2bjZLb1J2?=
 =?utf-8?B?OWdEV1Z6cFZJVGVZVG5wcy8ydm91d3B1TTFpYjJmZHkxQ0wrdUVPbnZIQ3lK?=
 =?utf-8?B?bWV4OGtZOEhORWN1aUhTNTFxbHM2N1BLUTZDNnByNUNpd0F2YWsvVkpscjFa?=
 =?utf-8?B?U28rSGZVbW9PNmphbXhtdDhKaEhaVnplY20yVER3Sys1bnB6d0dKWmJZUFRF?=
 =?utf-8?B?YzExcjB5SHJiQlJjalEzU2ZNditHY0VEdFBtWCtaWWZjNUtiMmtxRXZHYldw?=
 =?utf-8?B?c0FRdFdvWTg0WjhmZzMvVW1JZlpZSUw2T2FYZ1dQTERoWVNZM0E1REZlUFJB?=
 =?utf-8?B?OFVjeDZ4VTRrTGdRN2gzRnNyY2lrc293UUpLL0c3N3cxcExHSW43QWZlZHp6?=
 =?utf-8?B?MEpyc0NyNFA3enJCaUdGM1ZYblVxTzZkRXNQVythekRHcDVUU0JCTEhvaFlK?=
 =?utf-8?B?Sm5tZUJNT1Z1ekhLeVBhaFdsNEdDRG40NWpWb0FYek9QMkVQQ2tzL1k2TXN6?=
 =?utf-8?B?Y0tVcFpXaE1pRC9lbUxwSGZwV3M2L1kxSm5Ca0FwcEd5cGxZZkJTaFl3OThD?=
 =?utf-8?B?T0RkK05DNEUwU3NRZ1ZUdFJFVjdSejM3R1AwUEhZUXBpZUIrU0t1YThDajJS?=
 =?utf-8?B?SFlkVXpsL2dVVGJvRkd4SmFtNjdjSEJuSURYVGVzSkV2QnFIS3huelhZNE80?=
 =?utf-8?B?T01aaDV4NlZVWU15OE51eWZuVG5ZQkM5UFAzSW9ZdGFVS3oycUNhYWdocFpU?=
 =?utf-8?B?a1didFVvOWxiREdIMWEwQmZFTW52NTdhMVdHcHl0UTE3TTRhaTlPTlFiZzVC?=
 =?utf-8?B?UW4vYTRrbCthYVlONVFuNEZLb1hFUEhSVUxNYmJZaDRwaTJISitNNjJrdDQ0?=
 =?utf-8?B?UjFyYjhkVjlRTU1LeXdad0RydWszUytKQ3RMWnVuT2dYbzZ6L1cvUURUQzBt?=
 =?utf-8?B?Zi9RZTRNOG9JOU5PbURVQnpYY1prb1BxWWVwSGM1cGRJbVp4c1RhdTljUkdl?=
 =?utf-8?B?QlVUdW5IdVRFMVhpSnRtZ2RvcVNVd2hTVklJaUFlMUpVK0dyNFppa0I0ZkM0?=
 =?utf-8?B?Z2tkaTNIRzJHdXJtNDM4d2crMHpFVWlIOFdPZm94Y2x2TXlxa2VBSjd4dzdo?=
 =?utf-8?B?WkhSLzNTMUl5ZVVJSHpnUS82MmxRS0tzUlJwS2FjdUMzUjhscGNtS3NkR0p4?=
 =?utf-8?B?dHk5UWN4K1ZVeWFvRjBIVnJYYldUZHcrMVkzVFFsdnFMb2EwdkpBMzBJTWIx?=
 =?utf-8?B?M2oxSlR2azlIckpEaWM2TitSM21OQVViUHhSMEpYZE1QVm9ObXcwaEdqN05o?=
 =?utf-8?B?L1dQMlFONnZhSFpTUnJCTWIraitVNmUrSUdzU1pjNkh2bkVsNFhkak9ua2lF?=
 =?utf-8?B?N2FZTkdQK3h4Vld1STRialp4N2R3Mm5ERXowa3Q0T3hWdU1jVGFRQkpkRFNu?=
 =?utf-8?B?ajROWm00ZVhjN2FVWi8xWUphaGp6YU5VczZpWkJJVlBEZExUZE8ycFJiOGc0?=
 =?utf-8?B?UFEwYWpxcmRGZUd1L1BmSm9qcHNnWjl1NUlqK0FvSEEwbS84dk9BQ0s4NGRl?=
 =?utf-8?B?V1NaemV2Kzk0RTNCU0xKR1gwcmhjL3JyL3lsVjRkUXdFcHAwd05MUVZxb1Nl?=
 =?utf-8?B?SHFMcFU3TjFmN2lNQWlnNEZxMVhvWWc1dzZNYzBneURSYUkrYVpaYUp0VHRC?=
 =?utf-8?B?bUJOZlU1RDJUWWFkdTZMRDY2VFdOa0JLQ2RzblZkekt3OHF2VG1nc1hDeHk0?=
 =?utf-8?B?cmdJbTBPZU53PT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB9020.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7656
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 10bc3183-d1fd-4186-a358-08ddb8b7e594
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|82310400026|1800799024|7416014|376014|36860700013|35042699022|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXlNT0pVYVlRMGY3K0ZVMDJqK2s5TVc1RXE3ZWxGSzFuNE1EUHhMbDBUKytO?=
 =?utf-8?B?a2pjVktJbkdHYzZsS3RZTEduZ2NGVmo5VDQ1eHNseXVCaUtpU2Y0OFZabTlK?=
 =?utf-8?B?bUlBdTc5b2h3ZElORDBTZzd6bmVrZDJIL2dSWjZWT3krYjg5N1RKQ2k3UDNQ?=
 =?utf-8?B?YTJxVzNFTDdKK2tZcFl4QW5EOXF3cEV1MXcvRnZyVkwrT1VLOFRMMmFkMTZ0?=
 =?utf-8?B?VElQd2twZGtDRWRiK2UzVTF1dlRsS1hIT242NFZwMkNVSTJtRWxWRnhwOEFk?=
 =?utf-8?B?VkF5bWd6bFk4cFBUeGhVdDhBVVp0OWJhVHcvSi9hNWFhSTJyR1BKcDQvVjRx?=
 =?utf-8?B?TXJkLzY5Vk5TenRiWXpGcVNMeXpnNGF2UThDZ2tjNnNsQk1RZ1Q3SjRLZG1E?=
 =?utf-8?B?eXdsc1FwQXlMSTdVaC81OTBZaTRDZFkyS0JBcGdPU2FNTHplbmp4TjJpOSsx?=
 =?utf-8?B?OHJlRStEcGRBYmVpd3lOMnBtNGVvM2dDUnhZNmNGV0ZHWFhhdzIwNDhsMStO?=
 =?utf-8?B?SUVFQWt3T0M4bGZ5bUE1cWRrUEdaT21USlZPMHZWM1ZmZWkyVDg5Qk9ZYVps?=
 =?utf-8?B?WW80S1lJSEplaHpjU2RlYVNGcGNXbnphc0FLNWVzdWlrTU5rZGsxVHJpMzY0?=
 =?utf-8?B?bzVFOWVlZzVHRjFFdjg4bWovZ0lJNmdtdW5OYURGaVR1TGhUN0lJSi94Wmcx?=
 =?utf-8?B?cTlUaDVDa3BLeHJJWnorOGR3NGNxWjAzVFBQZnlNTW9hTTg2M0k3ZEFaaWpS?=
 =?utf-8?B?N2p3dVAyWlJGa0x0REJSVEdVU3VYRmxXdzdiek1aSkl2enNFd3RrZnNxWHc5?=
 =?utf-8?B?eUwxcytxRzZXSzdDZUNISWlCKzNqNWp1KzF0SnJGV1dWendzdi9GSitwdXpO?=
 =?utf-8?B?VGt4WGlhTCtGK0pnV0V6a0ZudWNRZzRkZ2E1bERkeDJQUnZKZ2xSRjMyWGhm?=
 =?utf-8?B?MVFMTXdMMXZnS3ZtNWJTdGprYXk2T0cyOCtXSVpoc3dYK2ZTbndOKzlCazU3?=
 =?utf-8?B?WjFjZXpWL2RwdHhSUE9EOFBaallaa2ZzemduOWcrQ1BOb0kwMUFIeXl3aVFY?=
 =?utf-8?B?UXQ4M3FVQzRPS1dlK3FYSGdNV3pGZUlaSzNLenZ2d0JvbmVTdTZ5UEdGeDN2?=
 =?utf-8?B?S0tEVnppYWd5ZkJpRGd6VmVya0tsa1o0aVhPTitZK3VEQldWZCtFNUN1Q1hH?=
 =?utf-8?B?OEJaanpBQWxvVzRCcmt1RTJlS1d1UlVvQ3FpbEVMQnNNVmVEbkZqMGlRUTdj?=
 =?utf-8?B?blRwNjJZY1FaVzkrWUpzNms3UkFHekRjRWFjZkRrQ01rTXNSQnhLWlB1dXJo?=
 =?utf-8?B?d3NoSXo5ZkdKZUo1Zit4Zjl6VkJUMnlzWWo1c3pPR0VHbk83RUtzcVNYK284?=
 =?utf-8?B?MDZQWi9jNjF6WDF3TEhuSzlRbzh5SnBwcmdXUEJWWC92Yk0rTSt6ZWVoNEc1?=
 =?utf-8?B?QWJIeEpYajIxYjFISFdVa0VFaStUSXpJWWxVUE1FWFl4NW1BZEhSWS82ODQy?=
 =?utf-8?B?TUZCMjB5MkF6U0ZGQ0paR1FRMTVFUmJybnQ0NFUweFU5WjJVVlE0ZlE4OG1S?=
 =?utf-8?B?QzBPWVg3VUFGWXBxZ2habzc0VWphYVo5ZTdHMzFzVFM4SDNPTWEyYURUaVg3?=
 =?utf-8?B?T3dBd0JtbXVwRmxUOWZIWm42OWRiSmxBUWcyT2N5N1BUZDl2K3F0SkhrNkxp?=
 =?utf-8?B?VUVjZlA5cmQrNjU5R3VPanMzT0lJYS9ma0txbWswY1lGc1ROWlhvK0NseHdw?=
 =?utf-8?B?c2cveERWamJrVm56ZG9ucXBGYzRxbnAyNncyMXZWWktrYWZYUVlHZU53UkZT?=
 =?utf-8?B?TzBXbDhHY0VWVXhzYXhqY2I3N1lIUkVpTUZCMDBRa0dDUENqVi82bCsvY1NM?=
 =?utf-8?B?UGx1bER4L0hROXlTc2h0c0dWQ2hLekJRUDNMdWpLK3lSMWFGWHZ1MFlRYjJ6?=
 =?utf-8?B?NzFaVmxsMEpuNVZaelJHWHpxcVhGZ3lPOTVWSGwrZFhsdVh0NEFNVVdNVGll?=
 =?utf-8?B?bGtjRERuTmREc1hNaVVEKzJGN0lLSURYVWg4Q1BzRHQzQlk4VFZmY29pbUZr?=
 =?utf-8?B?YjdpL0ZKRWNtUVZ4cnVsWEpra2VldDhrQkFSQT09?=
X-Forefront-Antispam-Report: CIP:20.160.56.81;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(7416014)(376014)(36860700013)(35042699022)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 15:56:57.2468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed709f2f-061a-4ed1-3156-08ddb8b7e858
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.81];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_085709_287385_99391AEC 
X-CRM114-Status: UNSURE (   4.88  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNi8yNy8yNSAwNTowOCwgVGjDqW8gTGVicnVuIHdyb3RlOgo+IEludHJvZHVjZSBtYWNiX2Rt
YV9pc182NGIoKSBhbmQgbWFjYl9kbWFfaXNfcHRwKCkgaGVscGVyIGZ1bmN0aW9ucy4KPiBNYW55
IGNvZGVwYXRocyBhcmUgbWFkZSBzaW1wbGVyIGJ5IGRyb3BwaW5nIGNvbmRpdGlvbmFsIGNvbXBp
bGF0aW9uLgo+IAo+IFRoaXMgaW1wbGllcyB0aHJlZSBjaGFuZ2VzOgo+ICAtIEFsd2F5cyBjb21w
aWxlIHJlbGF0ZWQgc3RydWN0dXJlIGRlZmluaXRpb25zIGluc2lkZSA8bWFjYi5oPi4KPiAgLSBN
YWtlIHRoZSBmaWVsZCBod19kbWFfY2FwIGluIHN0cnVjdCBtYWNiIGFsd2F5cyBwcmVzZW50Lgo+
ICAtIE1BQ0JfRVhUX0RFU0MgY2FuIGJlIGRyb3BwZWQgYXMgaXQgaXMgdXNlbGVzcyBub3cuCj4g
Cj4gVGhlIGNvbW1vbiBjYXNlIGlzOgo+IAo+IAkjaWZkZWYgQ09ORklHX0FSQ0hfRE1BX0FERFJf
VF82NEJJVAo+IAkJc3RydWN0IG1hY2JfZG1hX2Rlc2NfNjQgKmRlc2NfNjQ7Cj4gCQlpZiAoYnAt
Pmh3X2RtYV9jYXAgJiBIV19ETUFfQ0FQXzY0Qikgewo+IAkJCWRlc2NfNjQgPSBtYWNiXzY0Yl9k
ZXNjKGJwLCBkZXNjKTsKPiAJCQkvLyAuLi4KPiAJCX0KPiAJI2VuZGlmCj4gCj4gQW5kIHJlcGxh
Y2VkIGJ5Ogo+IAo+IAlzdHJ1Y3QgbWFjYl9kbWFfZGVzY182NCAqZGVzY182NDsKPiAJaWYgKG1h
Y2JfZG1hX2lzXzY0YihicCkpIHsKPiAJCWRlc2NfNjQgPSBtYWNiXzY0Yl9kZXNjKGJwLCBkZXNj
KTsKPiAJCS8vIC4uLgo+IAl9Cj4gCj4gU2lnbmVkLW9mZi1ieTogVGjDqW8gTGVicnVuIDx0aGVv
LmxlYnJ1bkBib290bGluLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5j
ZS9tYWNiLmggICAgICB8ICAgOCAtLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9t
YWNiX21haW4uYyB8IDExMyArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDIgZmls
ZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgODEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYi5oIGIvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvY2FkZW5jZS9tYWNiLmgKPiBpbmRleCAzYjQzY2I5NDY4ZTM2MTg3NTRmZjJiYzZj
NWYzNjA0NDdiZGVlZWQwLi43MDdiMzI4NmE2Yjg0MDhhM2JjNGJiYmNiMTMzNWFlOGMzY2Q5NWFk
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYi5oCj4gKysr
IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiLmgKPiBAQCAtMTUsMTAgKzE1LDYg
QEAKPiAgI2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3dvcmtx
dWV1ZS5oPgo+ICAKPiAtI2lmIGRlZmluZWQoQ09ORklHX0FSQ0hfRE1BX0FERFJfVF82NEJJVCkg
fHwgZGVmaW5lZChDT05GSUdfTUFDQl9VU0VfSFdTVEFNUCkKPiAtI2RlZmluZSBNQUNCX0VYVF9E
RVNDCj4gLSNlbmRpZgo+IC0KPiAgI2RlZmluZSBNQUNCX0dSRUdTX05CUiAxNgo+ICAjZGVmaW5l
IE1BQ0JfR1JFR1NfVkVSU0lPTiAyCj4gICNkZWZpbmUgTUFDQl9NQVhfUVVFVUVTIDgKPiBAQCAt
ODIzLDcgKzgxOSw2IEBAIHN0cnVjdCBtYWNiX2RtYV9kZXNjIHsKPiAgCXUzMgljdHJsOwo+ICB9
Owo+ICAKPiAtI2lmZGVmIE1BQ0JfRVhUX0RFU0MKPiAgI2RlZmluZSBIV19ETUFfQ0FQXzMyQgkJ
MAo+ICAjZGVmaW5lIEhXX0RNQV9DQVBfNjRCCQkoMSA8PCAwKQo+ICAjZGVmaW5lIEhXX0RNQV9D
QVBfUFRQCQkoMSA8PCAxKQo+IEBAIC04MzgsNyArODMzLDYgQEAgc3RydWN0IG1hY2JfZG1hX2Rl
c2NfcHRwIHsKPiAgCXUzMgl0c18xOwo+ICAJdTMyCXRzXzI7Cj4gIH07Cj4gLSNlbmRpZgo+ICAK
PiAgLyogRE1BIGRlc2NyaXB0b3IgYml0ZmllbGRzICovCj4gICNkZWZpbmUgTUFDQl9SWF9VU0VE
X09GRlNFVAkJCTAKPiBAQCAtMTMxNiw5ICsxMzEwLDcgQEAgc3RydWN0IG1hY2Igewo+ICAKPiAg
CXN0cnVjdCBwaHkJCSpzZ21paV9waHk7CS8qIGZvciBaeW5xTVAgU0dNSUkgbW9kZSAqLwo+ICAK
PiAtI2lmZGVmIE1BQ0JfRVhUX0RFU0MKPiAgCXVpbnQ4X3QgaHdfZG1hX2NhcDsKPiAtI2VuZGlm
CgpTaG91bGQgdGhpcyBtZW1iZXIgcmVhbGx5IGJlIGhlcmU/IFNlZW1zIGxpa2UgaXQgd291bGQg
ZWF0IGF0IGxlYXN0CjcgYnl0ZXMgb2YgcGFkZGluZy4gSXQgcHJvYmFibHkgbWFrZXMgc2Vuc2Ug
dG8gbW92ZSB0aGlzIHNvbWV3aGVyZSBlbHNlCmluIHRoZSBzdHJ1Y3QuIE9yIG1heWJlIGV2ZW4g
Zm9sZCB0aGlzIGludG8gTUFDQl9DQVBTPyBOb3Qgc3VyZSB3aGF0CnRoYXQgZG9lcyB0byB0ZXh0
IHNpemUuCgo+ICAJc3BpbmxvY2tfdCB0c3VfY2xrX2xvY2s7IC8qIGdlbSB0c3UgY2xvY2sgbG9j
a2luZyAqLwo+ICAJdW5zaWduZWQgaW50IHRzdV9yYXRlOwo+ICAJc3RydWN0IHB0cF9jbG9jayAq
cHRwX2Nsb2NrOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21h
Y2JfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYwo+IGlu
ZGV4IDY5MjZlYTExZDcxYWRhZTdhMjVkNWVlMzI5YzE0OGY1ODgyZDQxODQuLmJlNjY3Y2I1YWNj
ZTg1YTlkMTFhYWVhMWY1MDgxYTMzODBiNjBlZjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYwo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0
L2NhZGVuY2UvbWFjYl9tYWluLmMKPiBAQCAtOTUsNiArOTUsMTggQEAgc3RydWN0IHNpZml2ZV9m
dTU0MF9tYWNiX21nbXQgewo+ICAKPiAgI2RlZmluZSBNQUNCX01ESU9fVElNRU9VVAkxMDAwMDAw
IC8qIGluIHVzZWNzICovCj4gIAo+ICtzdGF0aWMgYm9vbCBtYWNiX2RtYV9pc182NGIoc3RydWN0
IG1hY2IgKmJwKQoKVEJIIEkgd291bGQgcHJlZmVyIGp1c3QgYG1hY2JfZG1hNjRgIGFuZCBgbWFj
Yl9kbWFfcHRwYCBzaW5jZSB0aGUgIl9pc18iCmlzbid0IHJlYWxseSBhZGRpbmcgbXVjaC4KCj4g
K3sKPiArCXJldHVybiBJU19FTkFCTEVEKENPTkZJR19BUkNIX0RNQV9BRERSX1RfNjRCSVQpICYm
Cj4gKwkgICAgICAgYnAtPmh3X2RtYV9jYXAgJiBIV19ETUFfQ0FQXzY0QjsKPiArfQo+ICsKPiAr
c3RhdGljIGJvb2wgbWFjYl9kbWFfaXNfcHRwKHN0cnVjdCBtYWNiICpicCkKPiArewo+ICsJcmV0
dXJuIElTX0VOQUJMRUQoQ09ORklHX01BQ0JfVVNFX0hXU1RBTVApICYmCj4gKwkgICAgICAgYnAt
Pmh3X2RtYV9jYXAgJiBIV19ETUFfQ0FQX1BUUDsKPiArfQo+ICsKPiAgLyogRE1BIGJ1ZmZlciBk
ZXNjcmlwdG9yIG1pZ2h0IGJlIGRpZmZlcmVudCBzaXplCj4gICAqIGRlcGVuZHMgb24gaGFyZHdh
cmUgY29uZmlndXJhdGlvbjoKPiAgICoKPiBAQCAtMTI0LDU2ICsxMzYsMzEgQEAgc3RydWN0IHNp
Zml2ZV9mdTU0MF9tYWNiX21nbXQgewo+ICAgKi8KPiAgc3RhdGljIHVuc2lnbmVkIGludCBtYWNi
X2RtYV9kZXNjX2dldF9zaXplKHN0cnVjdCBtYWNiICpicCkKPiAgewo+IC0jaWZkZWYgTUFDQl9F
WFRfREVTQwo+IC0JdW5zaWduZWQgaW50IGRlc2Nfc2l6ZTsKPiArCXVuc2lnbmVkIGludCBkZXNj
X3NpemUgPSBzaXplb2Yoc3RydWN0IG1hY2JfZG1hX2Rlc2MpOwo+ICsKPiArCWlmIChtYWNiX2Rt
YV9pc182NGIoYnApKQo+ICsJCWRlc2Nfc2l6ZSArPSBzaXplb2Yoc3RydWN0IG1hY2JfZG1hX2Rl
c2NfNjQpOwo+ICsJaWYgKG1hY2JfZG1hX2lzX3B0cChicCkpCj4gKwkJZGVzY19zaXplICs9IHNp
emVvZihzdHJ1Y3QgbWFjYl9kbWFfZGVzY19wdHApOwo+ICAKPiAtCXN3aXRjaCAoYnAtPmh3X2Rt
YV9jYXApIHsKPiAtCWNhc2UgSFdfRE1BX0NBUF82NEI6Cj4gLQkJZGVzY19zaXplID0gc2l6ZW9m
KHN0cnVjdCBtYWNiX2RtYV9kZXNjKQo+IC0JCQkrIHNpemVvZihzdHJ1Y3QgbWFjYl9kbWFfZGVz
Y182NCk7Cj4gLQkJYnJlYWs7Cj4gLQljYXNlIEhXX0RNQV9DQVBfUFRQOgo+IC0JCWRlc2Nfc2l6
ZSA9IHNpemVvZihzdHJ1Y3QgbWFjYl9kbWFfZGVzYykKPiAtCQkJKyBzaXplb2Yoc3RydWN0IG1h
Y2JfZG1hX2Rlc2NfcHRwKTsKPiAtCQlicmVhazsKPiAtCWNhc2UgSFdfRE1BX0NBUF82NEJfUFRQ
Ogo+IC0JCWRlc2Nfc2l6ZSA9IHNpemVvZihzdHJ1Y3QgbWFjYl9kbWFfZGVzYykKPiAtCQkJKyBz
aXplb2Yoc3RydWN0IG1hY2JfZG1hX2Rlc2NfNjQpCj4gLQkJCSsgc2l6ZW9mKHN0cnVjdCBtYWNi
X2RtYV9kZXNjX3B0cCk7Cj4gLQkJYnJlYWs7Cj4gLQlkZWZhdWx0Ogo+IC0JCWRlc2Nfc2l6ZSA9
IHNpemVvZihzdHJ1Y3QgbWFjYl9kbWFfZGVzYyk7Cj4gLQl9Cj4gIAlyZXR1cm4gZGVzY19zaXpl
Owo+IC0jZW5kaWYKPiAtCXJldHVybiBzaXplb2Yoc3RydWN0IG1hY2JfZG1hX2Rlc2MpOwo+ICB9
Cj4gIAo+ICBzdGF0aWMgdW5zaWduZWQgaW50IG1hY2JfYWRqX2RtYV9kZXNjX2lkeChzdHJ1Y3Qg
bWFjYiAqYnAsIHVuc2lnbmVkIGludCBkZXNjX2lkeCkKPiAgewo+IC0jaWZkZWYgTUFDQl9FWFRf
REVTQwo+IC0Jc3dpdGNoIChicC0+aHdfZG1hX2NhcCkgewo+IC0JY2FzZSBIV19ETUFfQ0FQXzY0
QjoKPiAtCWNhc2UgSFdfRE1BX0NBUF9QVFA6Cj4gLQkJZGVzY19pZHggPDw9IDE7Cj4gLQkJYnJl
YWs7Cj4gLQljYXNlIEhXX0RNQV9DQVBfNjRCX1BUUDoKPiAtCQlkZXNjX2lkeCAqPSAzOwo+IC0J
CWJyZWFrOwo+IC0JZGVmYXVsdDoKPiAtCQlicmVhazsKPiAtCX0KPiAtI2VuZGlmCj4gLQlyZXR1
cm4gZGVzY19pZHg7Cj4gKwlpZiAobWFjYl9kbWFfaXNfNjRiKGJwKSAmJiBtYWNiX2RtYV9pc19w
dHAoYnApKQo+ICsJCXJldHVybiBkZXNjX2lkeCAqIDM7Cj4gKwllbHNlIGlmIChtYWNiX2RtYV9p
c182NGIoYnApIHx8IG1hY2JfZG1hX2lzX3B0cChicCkpCj4gKwkJcmV0dXJuIGRlc2NfaWR4IDw8
IDE7Cj4gKwllbHNlCj4gKwkJcmV0dXJuIGRlc2NfaWR4OwoKQ2FuIHRoaXMgYmUKCnJldHVybiBk
ZXNjX2lkeCAqICgxICsgNjQoKSArIHB0cCgpKQoKPyBOb3Qgc3VyZSB3aGF0IHRoZSBhc3NlbWJs
eSBsb29rcyBsaWtlLgoKPiAgfQo+ICAKPiAtI2lmZGVmIENPTkZJR19BUkNIX0RNQV9BRERSX1Rf
NjRCSVQKPiAgc3RhdGljIHN0cnVjdCBtYWNiX2RtYV9kZXNjXzY0ICptYWNiXzY0Yl9kZXNjKHN0
cnVjdCBtYWNiICpicCwgc3RydWN0IG1hY2JfZG1hX2Rlc2MgKmRlc2MpCj4gIHsKPiAgCXJldHVy
biAoc3RydWN0IG1hY2JfZG1hX2Rlc2NfNjQgKikoKHZvaWQgKilkZXNjCj4gIAkJKyBzaXplb2Yo
c3RydWN0IG1hY2JfZG1hX2Rlc2MpKTsKPiAgfQo+IC0jZW5kaWYKPiAgCj4gIC8qIFJpbmcgYnVm
ZmVyIGFjY2Vzc29ycyAqLwo+ICBzdGF0aWMgdW5zaWduZWQgaW50IG1hY2JfdHhfcmluZ193cmFw
KHN0cnVjdCBtYWNiICpicCwgdW5zaWduZWQgaW50IGluZGV4KQo+IEBAIC00OTcsMTcgKzQ4NCwx
MyBAQCBzdGF0aWMgdm9pZCBtYWNiX2luaXRfYnVmZmVycyhzdHJ1Y3QgbWFjYiAqYnApCj4gIAo+
ICAJZm9yIChxID0gMCwgcXVldWUgPSBicC0+cXVldWVzOyBxIDwgYnAtPm51bV9xdWV1ZXM7ICsr
cSwgKytxdWV1ZSkgewo+ICAJCXF1ZXVlX3dyaXRlbChxdWV1ZSwgUkJRUCwgbG93ZXJfMzJfYml0
cyhxdWV1ZS0+cnhfcmluZ19kbWEpKTsKPiAtI2lmZGVmIENPTkZJR19BUkNIX0RNQV9BRERSX1Rf
NjRCSVQKPiAtCQlpZiAoYnAtPmh3X2RtYV9jYXAgJiBIV19ETUFfQ0FQXzY0QikKPiArCQlpZiAo
bWFjYl9kbWFfaXNfNjRiKGJwKSkKPiAgCQkJcXVldWVfd3JpdGVsKHF1ZXVlLCBSQlFQSCwKPiAg
CQkJCSAgICAgdXBwZXJfMzJfYml0cyhxdWV1ZS0+cnhfcmluZ19kbWEpKTsKPiAtI2VuZGlmCj4g
IAkJcXVldWVfd3JpdGVsKHF1ZXVlLCBUQlFQLCBsb3dlcl8zMl9iaXRzKHF1ZXVlLT50eF9yaW5n
X2RtYSkpOwo+IC0jaWZkZWYgQ09ORklHX0FSQ0hfRE1BX0FERFJfVF82NEJJVAo+IC0JCWlmIChi
cC0+aHdfZG1hX2NhcCAmIEhXX0RNQV9DQVBfNjRCKQo+ICsJCWlmIChtYWNiX2RtYV9pc182NGIo
YnApKQo+ICAJCQlxdWV1ZV93cml0ZWwocXVldWUsIFRCUVBILAo+ICAJCQkJICAgICB1cHBlcl8z
Ml9iaXRzKHF1ZXVlLT50eF9yaW5nX2RtYSkpOwo+IC0jZW5kaWYKPiAgCX0KPiAgfQo+ICAKPiBA
QCAtMTAyOCwxMCArMTAxMSw5IEBAIHN0YXRpYyB2b2lkIG1hY2JfdHhfdW5tYXAoc3RydWN0IG1h
Y2IgKmJwLCBzdHJ1Y3QgbWFjYl90eF9za2IgKnR4X3NrYiwgaW50IGJ1ZGdlCj4gIAo+ICBzdGF0
aWMgdm9pZCBtYWNiX3NldF9hZGRyKHN0cnVjdCBtYWNiICpicCwgc3RydWN0IG1hY2JfZG1hX2Rl
c2MgKmRlc2MsIGRtYV9hZGRyX3QgYWRkcikKPiAgewo+IC0jaWZkZWYgQ09ORklHX0FSQ0hfRE1B
X0FERFJfVF82NEJJVAo+IC0Jc3RydWN0IG1hY2JfZG1hX2Rlc2NfNjQgKmRlc2NfNjQ7Cj4gKwlp
ZiAobWFjYl9kbWFfaXNfNjRiKGJwKSkgewo+ICsJCXN0cnVjdCBtYWNiX2RtYV9kZXNjXzY0ICpk
ZXNjXzY0Owo+ICAKPiAtCWlmIChicC0+aHdfZG1hX2NhcCAmIEhXX0RNQV9DQVBfNjRCKSB7Cj4g
IAkJZGVzY182NCA9IG1hY2JfNjRiX2Rlc2MoYnAsIGRlc2MpOwo+ICAJCWRlc2NfNjQtPmFkZHJo
ID0gdXBwZXJfMzJfYml0cyhhZGRyKTsKPiAgCQkvKiBUaGUgbG93IGJpdHMgb2YgUlggYWRkcmVz
cyBjb250YWluIHRoZSBSWF9VU0VEIGJpdCwgY2xlYXJpbmcKPiBAQCAtMTA0MCwyNiArMTAyMiwy
MyBAQCBzdGF0aWMgdm9pZCBtYWNiX3NldF9hZGRyKHN0cnVjdCBtYWNiICpicCwgc3RydWN0IG1h
Y2JfZG1hX2Rlc2MgKmRlc2MsIGRtYV9hZGRyXwo+ICAJCSAqLwo+ICAJCWRtYV93bWIoKTsKPiAg
CX0KPiAtI2VuZGlmCj4gKwo+ICAJZGVzYy0+YWRkciA9IGxvd2VyXzMyX2JpdHMoYWRkcik7Cj4g
IH0KPiAgCj4gIHN0YXRpYyBkbWFfYWRkcl90IG1hY2JfZ2V0X2FkZHIoc3RydWN0IG1hY2IgKmJw
LCBzdHJ1Y3QgbWFjYl9kbWFfZGVzYyAqZGVzYykKPiAgewo+ICAJZG1hX2FkZHJfdCBhZGRyID0g
MDsKPiAtI2lmZGVmIENPTkZJR19BUkNIX0RNQV9BRERSX1RfNjRCSVQKPiAtCXN0cnVjdCBtYWNi
X2RtYV9kZXNjXzY0ICpkZXNjXzY0Owo+ICAKPiAtCWlmIChicC0+aHdfZG1hX2NhcCAmIEhXX0RN
QV9DQVBfNjRCKSB7Cj4gKwlpZiAobWFjYl9kbWFfaXNfNjRiKGJwKSkgewo+ICsJCXN0cnVjdCBt
YWNiX2RtYV9kZXNjXzY0ICpkZXNjXzY0Owo+ICsKPiAgCQlkZXNjXzY0ID0gbWFjYl82NGJfZGVz
YyhicCwgZGVzYyk7Cj4gIAkJYWRkciA9ICgodTY0KShkZXNjXzY0LT5hZGRyaCkgPDwgMzIpOwo+
ICAJfQo+IC0jZW5kaWYKPiAgCWFkZHIgfD0gTUFDQl9CRihSWF9XQUREUiwgTUFDQl9CRkVYVChS
WF9XQUREUiwgZGVzYy0+YWRkcikpOwo+IC0jaWZkZWYgQ09ORklHX01BQ0JfVVNFX0hXU1RBTVAK
PiAtCWlmIChicC0+aHdfZG1hX2NhcCAmIEhXX0RNQV9DQVBfUFRQKQo+ICsJaWYgKG1hY2JfZG1h
X2lzX3B0cChicCkpCj4gIAkJYWRkciAmPSB+R0VNX0JJVChETUFfUlhWQUxJRCk7Cj4gLSNlbmRp
Zgo+ICAJcmV0dXJuIGFkZHI7Cj4gIH0KPiAgCj4gQEAgLTExNjYsMTAgKzExNDUsOCBAQCBzdGF0
aWMgdm9pZCBtYWNiX3R4X2Vycm9yX3Rhc2soc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ICAK
PiAgCS8qIFJlaW5pdGlhbGl6ZSB0aGUgVFggZGVzYyBxdWV1ZSAqLwo+ICAJcXVldWVfd3JpdGVs
KHF1ZXVlLCBUQlFQLCBsb3dlcl8zMl9iaXRzKHF1ZXVlLT50eF9yaW5nX2RtYSkpOwo+IC0jaWZk
ZWYgQ09ORklHX0FSQ0hfRE1BX0FERFJfVF82NEJJVAo+IC0JaWYgKGJwLT5od19kbWFfY2FwICYg
SFdfRE1BX0NBUF82NEIpCj4gKwlpZiAobWFjYl9kbWFfaXNfNjRiKGJwKSkKPiAgCQlxdWV1ZV93
cml0ZWwocXVldWUsIFRCUVBILCB1cHBlcl8zMl9iaXRzKHF1ZXVlLT50eF9yaW5nX2RtYSkpOwo+
IC0jZW5kaWYKPiAgCS8qIE1ha2UgVFggcmluZyByZWZsZWN0IHN0YXRlIG9mIGhhcmR3YXJlICov
Cj4gIAlxdWV1ZS0+dHhfaGVhZCA9IDA7Cj4gIAlxdWV1ZS0+dHhfdGFpbCA9IDA7Cj4gQEAgLTIz
MjEsMTEgKzIyOTgsOSBAQCBzdGF0aWMgbmV0ZGV2X3R4X3QgbWFjYl9zdGFydF94bWl0KHN0cnVj
dCBza19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpCj4gIAkJcmV0dXJuIHJldDsK
PiAgCX0KPiAgCj4gLSNpZmRlZiBDT05GSUdfTUFDQl9VU0VfSFdTVEFNUAo+IC0JaWYgKChza2Jf
c2hpbmZvKHNrYiktPnR4X2ZsYWdzICYgU0tCVFhfSFdfVFNUQU1QKSAmJgo+IC0JICAgIChicC0+
aHdfZG1hX2NhcCAmIEhXX0RNQV9DQVBfUFRQKSkKPiArCWlmIChtYWNiX2RtYV9pc19wdHAoYnAp
ICYmCj4gKwkgICAgKHNrYl9zaGluZm8oc2tiKS0+dHhfZmxhZ3MgJiBTS0JUWF9IV19UU1RBTVAp
KQo+ICAJCXNrYl9zaGluZm8oc2tiKS0+dHhfZmxhZ3MgfD0gU0tCVFhfSU5fUFJPR1JFU1M7Cj4g
LSNlbmRpZgo+ICAKPiAgCWlzX2xzbyA9IChza2Jfc2hpbmZvKHNrYiktPmdzb19zaXplICE9IDAp
Owo+ICAKPiBAQCAtMjc4NSwxNCArMjc2MCwxMCBAQCBzdGF0aWMgdm9pZCBtYWNiX2NvbmZpZ3Vy
ZV9kbWEoc3RydWN0IG1hY2IgKmJwKQo+ICAJCQlkbWFjZmcgJj0gfkdFTV9CSVQoVFhDT0VOKTsK
PiAgCj4gIAkJZG1hY2ZnICY9IH5HRU1fQklUKEFERFI2NCk7Cj4gLSNpZmRlZiBDT05GSUdfQVJD
SF9ETUFfQUREUl9UXzY0QklUCj4gLQkJaWYgKGJwLT5od19kbWFfY2FwICYgSFdfRE1BX0NBUF82
NEIpCj4gKwkJaWYgKG1hY2JfZG1hX2lzXzY0YihicCkpCj4gIAkJCWRtYWNmZyB8PSBHRU1fQklU
KEFERFI2NCk7Cj4gLSNlbmRpZgo+IC0jaWZkZWYgQ09ORklHX01BQ0JfVVNFX0hXU1RBTVAKPiAt
CQlpZiAoYnAtPmh3X2RtYV9jYXAgJiBIV19ETUFfQ0FQX1BUUCkKPiArCQlpZiAobWFjYl9kbWFf
aXNfcHRwKGJwKSkKPiAgCQkJZG1hY2ZnIHw9IEdFTV9CSVQoUlhFWFQpIHwgR0VNX0JJVChUWEVY
VCk7Cj4gLSNlbmRpZgo+ICAJCW5ldGRldl9kYmcoYnAtPmRldiwgIkNhZGVuY2UgY29uZmlndXJl
IERNQSB3aXRoIDB4JTA4eFxuIiwKPiAgCQkJICAgZG1hY2ZnKTsKPiAgCQlnZW1fd3JpdGVsKGJw
LCBETUFDRkcsIGRtYWNmZyk7Cj4gQEAgLTQyOTgsMTIgKzQyNjksMTAgQEAgc3RhdGljIGludCBt
YWNiX2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCQkJcXVldWUtPlRCUVAg
PSBHRU1fVEJRUChod19xIC0gMSk7Cj4gIAkJCXF1ZXVlLT5SQlFQID0gR0VNX1JCUVAoaHdfcSAt
IDEpOwo+ICAJCQlxdWV1ZS0+UkJRUyA9IEdFTV9SQlFTKGh3X3EgLSAxKTsKPiAtI2lmZGVmIENP
TkZJR19BUkNIX0RNQV9BRERSX1RfNjRCSVQKPiAtCQkJaWYgKGJwLT5od19kbWFfY2FwICYgSFdf
RE1BX0NBUF82NEIpIHsKPiArCQkJaWYgKG1hY2JfZG1hX2lzXzY0YihicCkpIHsKPiAgCQkJCXF1
ZXVlLT5UQlFQSCA9IEdFTV9UQlFQSChod19xIC0gMSk7Cj4gIAkJCQlxdWV1ZS0+UkJRUEggPSBH
RU1fUkJRUEgoaHdfcSAtIDEpOwo+ICAJCQl9Cj4gLSNlbmRpZgo+ICAJCX0gZWxzZSB7Cj4gIAkJ
CS8qIHF1ZXVlMCB1c2VzIGxlZ2FjeSByZWdpc3RlcnMgKi8KPiAgCQkJcXVldWUtPklTUiAgPSBN
QUNCX0lTUjsKPiBAQCAtNDMxMiwxMiArNDI4MSwxMCBAQCBzdGF0aWMgaW50IG1hY2JfaW5pdChz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJCQlxdWV1ZS0+SU1SICA9IE1BQ0JfSU1S
Owo+ICAJCQlxdWV1ZS0+VEJRUCA9IE1BQ0JfVEJRUDsKPiAgCQkJcXVldWUtPlJCUVAgPSBNQUNC
X1JCUVA7Cj4gLSNpZmRlZiBDT05GSUdfQVJDSF9ETUFfQUREUl9UXzY0QklUCj4gLQkJCWlmIChi
cC0+aHdfZG1hX2NhcCAmIEhXX0RNQV9DQVBfNjRCKSB7Cj4gKwkJCWlmIChtYWNiX2RtYV9pc182
NGIoYnApKSB7Cj4gIAkJCQlxdWV1ZS0+VEJRUEggPSBNQUNCX1RCUVBIOwo+ICAJCQkJcXVldWUt
PlJCUVBIID0gTUFDQl9SQlFQSDsKPiAgCQkJfQo+IC0jZW5kaWYKPiAgCQl9Cj4gIAo+ICAJCS8q
IGdldCBpcnE6IGhlcmUgd2UgdXNlIHRoZSBsaW51eCBxdWV1ZSBpbmRleCwgbm90IHRoZSBoYXJk
d2FyZQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
