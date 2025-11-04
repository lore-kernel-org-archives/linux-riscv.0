Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A68CCF9E3
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 11:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I79rqEGiW8eAWybwxbVdGmEnvB72XgK/MNtQdY6Wvkc=; b=rFiVKI+gdpaIeV
	n+iNLLmDTlE9cFF1pk3Nn/ANH4E0345o+c8CAisSOvc2tprkhxn2XVz+2p5eMuUsHeQBHV6/hHuIG
	Mlczjp8xlvfzOn6xP+JtNTYxaqpSKbb/W8pOLY34ReUNVJS3CNcaWDV3XQH9CWvAxxsXd8fhgkIkL
	kl/yrVxyiJIvI+ZsGUfED6u0x4EPv07u1HszElNiO4GXWoEdDvXah687Cbidov6LbvDhgnUEWfiIx
	9zYCKZ614w3pRJFAWA/5iQ1pkMfTDt4SaNoNTxFZyYmstAbxyuztJwClVRkQ5VDGXBwmh1z7bA8xP
	0w29qNmZPqJhfUBKXVgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFbt-0000000Bk6H-1R1g;
	Tue, 04 Nov 2025 11:54:01 +0000
Received: from mail-francecentralazon11023072.outbound.protection.outlook.com ([40.107.162.72] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFbr-0000000Bk5a-2zxy
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 11:54:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLXRPcEhoBcf4Pz78ZKmneudhbxmxNBUE/spW2C8CiDOtzDjUQgtamwZpERYTdHZCRGdkpOSu//b7YXllNGL34I/YtZTUEkqhpJmfcy1hl9dBGrs17WN9G2t+aTqqrnX4J+FYtrWcQZK5thnRb8NnpytQrYmYTCcUTu7xO2NcNS8YOgGhWYKu4KHqn6WzzkQmxd8NqZ70EJ38+B55B6CtHSx8snOGD0/IosOKciweC7GaBWpFhvkZLy9ul5i59yC35a1NaO7hbwvcmRDhmESGmcLVlqgwvbCAsRqOKxVIRvQKfrRu2ivQdSJ0gydnTzlUJqUP8+tFiFjq5ZmNGHQvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oat9w5/bEkMs5txSztiakV8b4BTWIVtjkW6BV1bcxSE=;
 b=UWo27ruGDW0XN5sZfVp71KMBqnAgAsQnWnHG+DbNQpsxIgyxOYkFvuCmfdYKK33ORNEVaas3R71pimi1iX9m97phzBYYwqV6yFi3gn2l15eTg/hCw5Ln3lutGIgNnqqnoGE01ht+lJ04O/kHtyDxoSJdv+sfz0FvGGSO9GGv91aNyA8UMrF6ZaOgfTda3OmVtbXpRrfjR2vq0VgMjIEEj4+FcJccpR0RrASvkdicQHqHY482mBBopivqRcyQP441B2vGcABmvXyR5ZHb1qSOQUXKhzca+ohN/5XU/MPDxvcXX8K9QLaHkTvSjeLMVmCJaf33T8hx5kiC574ioE8Wtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oat9w5/bEkMs5txSztiakV8b4BTWIVtjkW6BV1bcxSE=;
 b=a4Qo1hCYAhPKUxCBFPTvzd31LqpYFqMZW5Dx9AdxFaxFuim7aQnjlkivSGLCD/PqhV4S7StTJnLqypOgN2KVwy0lgBAIcwsOKOgsugBfW1LFexCTm6WBOmmMT94Bzrk0A2K5hlD6O1T04qNbCbXComIZegJZYtYHyaA9SQrkjE5/8PiIqEnS0Ke+lbXBfXGUU9kRusv+SPPi8srxRnUucvLAHDBe5/jn1xylzL7jsJ5Xh4uuKLJq+OQpxwCcDMQnpATVGL32l9jtDxCm8kkFybNrd6MYAli+Bg9ZD2/o6JS5qAhzNN9Qbg99a3+WYsLAjlL/g2ZQKCwWmlTuIE4S7Q==
Received: from DB9PR09MB5685.eurprd09.prod.outlook.com (2603:10a6:10:305::15)
 by DB8PR09MB3820.eurprd09.prod.outlook.com (2603:10a6:10:112::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 11:53:50 +0000
Received: from DB9PR09MB5685.eurprd09.prod.outlook.com
 ([fe80::69d7:28cf:73b4:7552]) by DB9PR09MB5685.eurprd09.prod.outlook.com
 ([fe80::69d7:28cf:73b4:7552%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 11:53:50 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"cfu@wavecomp.com" <cfu@wavecomp.com>, Djordje Todorovic
	<Djordje.Todorovic@htecgroup.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"pjw@kernel.org" <pjw@kernel.org>
Subject: Re: [PATCH] riscv: Update MIPS vendor id to 0x127.
Thread-Topic: [PATCH] riscv: Update MIPS vendor id to 0x127.
Thread-Index: AQHcTNNlUqzeKAlBlk2IdkuCz3mYBrThgu8AgADmswA=
Date: Tue, 4 Nov 2025 11:53:49 +0000
Message-ID: <e0e4d521-cf50-4384-8461-e87b15044089@htecgroup.com>
References: <20251103-tabby-laurel-bc895f236a69@spud>
In-Reply-To: <20251103-tabby-laurel-bc895f236a69@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR09MB5685:EE_|DB8PR09MB3820:EE_
x-ms-office365-filtering-correlation-id: 4ed41cd8-1f83-43f3-99b5-08de1b98d1f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aHJPcnA4VEpPUlBGWlJoazIyRUZaUUxSVjI4VzRaVEV3WlRiTXBQeHljNm9y?=
 =?utf-8?B?WnJGdFR4YTA3NmRDdHA3OEhUU09XTERJWUVTRGNRRGZLQkJ3VDA4WksvL21Y?=
 =?utf-8?B?T0xwTmhsKyszaWxDMjBudDVRLzNwVUhaU1ZESkZQWHUzcUZXNkc0NmlJTE43?=
 =?utf-8?B?ZlM0VDJaV3crYldhYzA4MTFpeTZaVER0UXExVzAwN3crdDd4NnlIRVVrY2xR?=
 =?utf-8?B?SUR6QmYzdE85Nmh3S0FUcnJPV2ZMUHJ6WW41MG5UU2ZiQVlVaGQwaTZrSG91?=
 =?utf-8?B?ZTU5QkF4MDNZa0FTRU5jbHR1NFlhdGZscy9wNnh3UWk4Sy81Mkl5V2hHR0M3?=
 =?utf-8?B?b2htZElEYVJpRk9IQ0RXS0RpZHo2SGtHTUw3QXJoOVZPNkxzN3V6aStaUlVC?=
 =?utf-8?B?RUpHbTlCVGVMTlhMWXkzMVBpcUNUNzRDNElDR1ZINVhON1hOYVYvNm0ybkYv?=
 =?utf-8?B?TXNFcGROd1M4ZWtRdUxVTWNnVFM4ZmwxVE9kRVRodnN2Z25FMTA5OWQ0K3R3?=
 =?utf-8?B?T2NrSWcxZHg4aFROQUZZcDRTMTBQaTE2aWhiTFRnMmo0QklFSlhJMDBZUlBn?=
 =?utf-8?B?T2plbWlZZW9scjhuOGhmdlM2NWV5MXFjYXBCTzZtcWpPbk1mNDlNc3hNWnN3?=
 =?utf-8?B?Q0Rpb0F5SWdvcTcyODNFaWhIMEx1eTF4R2c2K1BZazJpVFdLL3hvSm9hOXlL?=
 =?utf-8?B?MVFhQnN2MnJuQjJlRGNLaGF4bXQ0c1pvMjJXeHB3eE1DRlFKdlZHQlB5VlNx?=
 =?utf-8?B?UEs5eGoxUjdOQlBpZ0ZvcnFFcFVGQmN3aDd0TTBpUnVDSXNXMm11SUR0UVcz?=
 =?utf-8?B?SHlHVmRYSW85YnEvZHdEdWJaT05kUTVmTEpST2xvdlY5RDFjMHYwMHFBR3Ez?=
 =?utf-8?B?Yko3bmZoNm93YlpuQ2xrN3c1TkZOMWlyZ3hwemhlL0dFN1owajY1RzQvb0d3?=
 =?utf-8?B?eHpTUUpyYUhMMy9oa2F3b1huclYyTGlLRlRDbzMzQTF0RUkrQTlTZXRWanRY?=
 =?utf-8?B?WkFRbURRRWtNblp3dGZRSVM3UTlIU2JrRUdJc0NqbWNCVFB0Nm91c2JoWTVZ?=
 =?utf-8?B?ZU9JRDlxNFZHYVdLYVJLWUc3cmNUN2N0Ukt0ZGRUcDNlYm1ZWkU4bjllYzN2?=
 =?utf-8?B?YjhxQUdmemhkWnp3bUZHWWx1RDZMVS80YU5IRmMxNFZsTEhNeHZkQm9QUTZP?=
 =?utf-8?B?MjZkVERuRm9NRmJPaFFUTzNRK1E5SHZ4ODBDWm13eEJkcE5FZFBMdEJLQzJj?=
 =?utf-8?B?SXRBam5vV3F5cytqWWc5RXlYcDA0c2hPRzJ5OHFnTC9nQmNMV3YwSVdOSEhz?=
 =?utf-8?B?djZnWEw1aXZvUFlWbVh4Q1F2RFZjdUZJN3JXWjZyOE9qSFRUUFFVdW9jb2h6?=
 =?utf-8?B?UGY5WW1FY3owODBPaWN0dnhTT0tmV0wzdEgwdk56M015S1d1bHBSRndaeEV1?=
 =?utf-8?B?blg2bGVNZDhhZGxxN3RMT3ZCT1JMVCsrVWJHT0dpU0lMTXZwMXNvS3UxcUJS?=
 =?utf-8?B?NVkwVGhGN0FrWFc2QUFIc1FzdW1iUzVoRit6TkVBQzRJWjdrVHdQVWlkV3Vn?=
 =?utf-8?B?Z2RvV0RkdHZOSzlUd2twYzVMaHRIR001VjZ5U0Q2RkpTTnFudHBVTm1xaGlD?=
 =?utf-8?B?U2Z0OTFlZXFtRE1ReEVVdC9lcm1rRVhMWXhEUWJIUDUrTTZhY2FERmQ5U2VW?=
 =?utf-8?B?TkRTMlVXVXFqNCtMZ3BqYVdTR2hxM0tiTEJ6dm9LMzBoaDNQTE9zVDY1OXdJ?=
 =?utf-8?B?YmdNRlVUbjBwaXhHMXUxWkZmZHVZdzFwU3BuQ2FneFVsNUMyMHc5dGZwU1Y3?=
 =?utf-8?B?dDJNRGU5Tm5iNG1mOEMzTnVWbUhaVTVRSUE2by9tODJseXQ3UFpYT2c5K1RT?=
 =?utf-8?B?S3o2TENOV0RLeTYvWm5RK25xYnB3MTJQV082VDRVY1JaT3lMajZxSTlGei85?=
 =?utf-8?B?UDl5MjdmQncyamJBR3VvSU82aEcwYytJRFJjWmUyaUZ6Uk1OeDJCL0tUY3Y5?=
 =?utf-8?B?c2FsYmZJQlZaWXJzTnkvVWNPam1ENVQ5TFI0S3NTNWhmUHBRbkdVWk5ibFZU?=
 =?utf-8?Q?zJ34pP?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR09MB5685.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGg4RjZHQ2NRNktvaG85UHFDemV1WFZJOEk3RGlpVjJQMk1kYW10L3lZSmtJ?=
 =?utf-8?B?WjFSa2I2MmVzdlhTMkhZVEt0Rkh4TEVSSXc4MThlMjVNT0lBNjJQSzNmeDJN?=
 =?utf-8?B?aEpXSkRTREwwRnptNCtxVVo2ZGVMUjVDay9nUUJ4SS9qMVN1K1FIUGZONDVw?=
 =?utf-8?B?bnl1RkZCSXQxL1J5ZmNrMUIzeFZ1c3JwYWJhZ0l3bnNJSUFEeS9pc3VDeUo0?=
 =?utf-8?B?emM5Vk5VTjBjUXBGMjQ2QlNpV0FJU1JkcTBQdlI1ekVyVTlZSUNnNld2Ymx2?=
 =?utf-8?B?TW5FM3d3RXN6WXVUWEpDeDI2ZmpKc2t3YmV1L1BHeit0WlFCODZ6d2FqYnRY?=
 =?utf-8?B?VEVHaFoxcnNOaGRrNVpHMDlob3RPbG9pRnJpTmc0TmVncU42ejlvQ0tkNE9N?=
 =?utf-8?B?VGdwL0pTWVJNRUtLMHhWSWNvUmhwVGlONFdnSXdlMEZ3TFR1V0ROOEQ4R3pi?=
 =?utf-8?B?eFBtMC9iR05DRTRIS2FPN3ZiRm54U0gxaVFsWEl0bUpZUWhWUWF2SUI0NEg2?=
 =?utf-8?B?WExSdGw2Z1d6SHJBNXhBTFEzaGI3YkMrK0dxMUQ1aGhMTnQ1dzl2cG14ZGpP?=
 =?utf-8?B?c25rNm9KVkFRS0ZNT0FCYUlocmNyak92TjlBSitKUVpUeXA1V1Iwb0djN2tQ?=
 =?utf-8?B?K1IzYmRpaktvYjU2czFDVWR5THNhc0dISnFJZzBjK1ZVcWgxeWloK21pWW92?=
 =?utf-8?B?Q0FTVHN3NHZSM0pRQlhPUVptbFh2dWc2UFB1THhGTGQ3SFYwcmMwa1NEWmNw?=
 =?utf-8?B?ZUFzeWZsTndhd2w1Z3R6ekgxMWJPcUJzeml6eU1JQmdxc2swTkNrOUxmWW9N?=
 =?utf-8?B?elJ1Q3V1RHh2STJzMGNweHdzeUVQck4yUHZYTmxOWFdUN3BhbFRTUFZoWllY?=
 =?utf-8?B?MFpqTTAxRUkySlVHbSt5ZWNBZk9IMDVRMGEzS2V3TVBHa1ZOYWF2WGpmZWll?=
 =?utf-8?B?TmUvZnlmS0E0d0k5U3VjSEczRDgwSXZHYVMvbllSelEwWjVlbU12OGpwNnNs?=
 =?utf-8?B?SE9mZmNJUzI4NzI3aVNxdGs1bkxYWnRjQlRsOWdlajl5NTNvNmdZTXB4UkZE?=
 =?utf-8?B?WXVLN1oyeWU0Si8rbWl0NGV2Y25IcU0yRHZvMnU4dGJpeTF4WFNJRmFRK0wx?=
 =?utf-8?B?SzlJUDdsZHFQMm5UK096MlF0dkpMNkZBUzFDelAxT3JGbmdqVXFrNUorYkVR?=
 =?utf-8?B?SlFEOU5YbTNHbXB6R1lYTGFseFhScG5IdkR2SGh1VzV6Y3BQZTJuYXVMdGlY?=
 =?utf-8?B?UHV5SjRHOUN1ekJwTUtpV3phekJTTlRDVkduV2QyVlYzUHRnWWFCeFlsZCtJ?=
 =?utf-8?B?TnF0dEpMY3VPY01QVGM5Y09Vd002MzE0bHRBY2pCcUFWaHR1bEFHblZRekFy?=
 =?utf-8?B?bjM1RzF2ZGYxQ0lrUDRtM29RalRGZ0dvMlFGKzQwdjFhNFlhdjFUTEVFUzc0?=
 =?utf-8?B?SjlGN3c3ZTBxeWVscU1jQ0N6OWFNQkw0RFdkYW0xVnJMbjJRL1MwT0xrejdZ?=
 =?utf-8?B?RTNyNDk1MXdyNzl0djkwbnllK0xmNmgxcFltb0YvWk1FVFJQLzV1cjNjR01j?=
 =?utf-8?B?TGtBenR3STRmZzVwWE1hOEJJSDVSWmUrcjJsV2JCZzJJUitSZjIwT1FpcXRh?=
 =?utf-8?B?SGtiOEU2dUxUQUhDNHBYUk1ad2pvcjRPY2VaMzNpN2dTVzg0OGhRZWJETHBt?=
 =?utf-8?B?akJGNERTNm95M0dCdGNoYnlpY2Jwc3R4UGFXWlc5RzlwSDVsOFhXY3RyUGFM?=
 =?utf-8?B?dkN1a1JyQkI0eG9vQnBkMmZhVkw5MEdjU2tWR3NOOURkOXUyS0thL1lyOEpa?=
 =?utf-8?B?bDdubXNzcGZTUHBwNEVyOHdKZFNERldTN25XRndLOU5zYkNuRW1ram83Tkg1?=
 =?utf-8?B?UC9vanFQYmF4cjI1M1hsUVNlV1ZPR2JDZ0w0dG90SGpGRXZJUlkrYXpRWlc1?=
 =?utf-8?B?NU9jUFJYVkdoN1lUVy95SGZUblo4bDY4ZWJ0cTlVakIvazRYYUdsMTVGQVVy?=
 =?utf-8?B?aElZdnN2c0VkcXFEMTIzZWpxck4rVlprcTZDWFhBSlNqempMa09hWjB3QkZ6?=
 =?utf-8?B?enpUYVpXMkdhR3FSenFWOC9HZnQ1MXpUQmVMVlMvVG9ZWjQ0UW01dzdGR2Rm?=
 =?utf-8?B?djgyUzdNQlV5NDZPOEdJb2NPNUxKaExlZjByQTdyd3lxYktlTElUYVJBRGt2?=
 =?utf-8?Q?SGnoecrkCKpIlhAMgYi0hAk=3D?=
Content-ID: <ACE8AB30EDBF3F43B4C57D5578601ECC@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR09MB5685.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed41cd8-1f83-43f3-99b5-08de1b98d1f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 11:53:50.4111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4lbv4UaN74lW5Q+mwsYzPS74x++L93QGiJyVWlwb0LZGIgDa4ExZX64mt4uzHAhy6p3mm4vPcvviBBFds3Qx0N8b04i45iSdqQbQ3sEkgdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB3820
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_035359_772785_BD394450 
X-CRM114-Status: GOOD (  18.71  )
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

SGkgQ29ub3IsDQoNCg0KVGhhbmsgeW91IGZvciB5b3VyIHJlc3BvbnNlIQ0KDQoNCk9uIDExLzMv
MjUgMjM6MDcsIENvbm9yIERvb2xleSB3cm90ZToNCg0KPiBPbiBNb24sIE5vdiAwMywgMjAyNSBh
dCAwNDowNTo0OFBNICswMTAwLCBBbGVrc2EgUGF1bm92aWMgd3JvdGU6DQo+PiBGcm9tOiBDaGFv
LXlpbmcgRnUgPGNmdUB3YXZlY29tcC5jb20+DQo+Pg0KPj4gWzFdIGRlZmluZXMgTUlQUyB2ZW5k
b3IgaWQgYXMgMHgxMjcuDQo+Pg0KPj4gWzFdIGh0dHBzOi8vbWlwcy5jb20vd3AtY29udGVudC91
cGxvYWRzLzIwMjUvMDYvUDg3MDBfUHJvZ3JhbW1lcnNfUmVmZXJlbmNlX01hbnVhbF9SZXYxLjg0
XzUtMzEtMjAyNS5wZGYNCj4+DQo+PiBGaXhlczogYThmZWQxYmMwM2FjZTI3OTAyMzM4ZTRmMGQz
MTgzMzU4ODNhYzg0NyAoInJpc2N2OiBBZGQgeG1pcHNleGVjdGwgYXMgYSB2ZW5kb3IgZXh0ZW5z
aW9uIikNCj4gSW5jb3JyZWN0IGZvcm1hdCBmb3IgZml4ZXMgdGFncyENCldpbGwgZml4IHRoYXQg
aW4gdjIuDQo+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbGVrc2EgUGF1bm92aWMgPGFsZWtzYS5wYXVu
b3ZpY0BodGVjZ3JvdXAuY29tPg0KPj4gLS0tDQo+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92
ZW5kb3JpZF9saXN0LmggfCAyICstDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vdmVuZG9yaWRfbGlzdC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZW5kb3JpZF9saXN0
LmgNCj4+IGluZGV4IDNiMDk4NzRkN2E2ZGZiOGY4YWE0NWIwYmU0MWMyMDcxMWQ1MzllNzguLjU1
MjA1Zjc5MzgwNTViYTJiNzQ0ZGJhNTExOGJiYTkzNWJjYWMwMDggMTAwNjQ0DQo+PiAtLS0gYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlbmRvcmlkX2xpc3QuaA0KPj4gKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS92ZW5kb3JpZF9saXN0LmgNCj4+IEBAIC05LDYgKzksNiBAQA0KPj4gICNk
ZWZpbmUgTUlDUk9DSElQX1ZFTkRPUl9JRAkweDAyOQ0KPj4gICNkZWZpbmUgU0lGSVZFX1ZFTkRP
Ul9JRAkweDQ4OQ0KPj4gICNkZWZpbmUgVEhFQURfVkVORE9SX0lECQkweDViNw0KPj4gLSNkZWZp
bmUgTUlQU19WRU5ET1JfSUQJCTB4NzIyDQo+PiArI2RlZmluZSBNSVBTX1ZFTkRPUl9JRAkJMHgx
MjcNCj4gSG93IHdhcyB0aGlzIGV2ZXIgd3Jvbmc/IERvIGRldmljZXMgZXhpc3Qgd2l0aCB0aGlz
IG9sZCBJRD8gRG8gd2UgbmVlZA0KPiB0byBzdXBwb3J0IGJvdGggYXMgdmVuZG9yIElEcyBmb3Ig
TUlQUz8NCkknbSBub3Qgc3VyZSBob3cgaXQgZmlyc3Qgc3RhcnRlZCwgYnV0IHNpbmNlIHdlIHdv
cmtlZCBvbiBxZW11IGFzIHdlbGwsIHdlIG5ldmVyIG5vdGljZWQgYW55IGlzc3VlcyB3aGlsZSB0
ZXN0aW5nLsKgDQpJdCBzaG91bGRuJ3QgY2F1c2UgYW55IHByb2JsZW1zIGluIHRoZSBmdXR1cmUg
dGhvdWdoLg0KPiBBbHNvLCB0aGlzIHdhcyBhZGRlZCBpbiB0aGUgd3JvbmcgcG9pbnQgaW4gdGhl
IGxpc3QgKGl0J3MgbWVhbnQgdG8gYmUNCj4gYWxwaGFudW1lcmljIG9yZGVyIElJUkMpLiBTb3J0
aW5nIGJ5IHRoZSBJRCBtYWtlcyB0aGluZ3MgYW5ub3lpbmcgdG8NCj4gaHVtYW5zIHRvIHJlYWQu
DQpXaWxsIGZpeCB0aGF0IGFzIHdlbGwuDQoNCg0KQmVzdCByZWdhcmRzLA0KDQpBbGVrc2ENCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
