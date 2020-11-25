Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5DDC5519F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 08:21:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C71020857
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 08:21:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hxta+6wy";
	dkim=permerror (0-bit key) header.d=wdc.com header.i=@wdc.com header.b="YGDgtTMS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="S93CRWS7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C71020857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=20A2jv8Q6pRFIGWvb1QSMuAoBeevFYmIqeC3xpvoF7M=; b=Hxta+6wy7nUauH4EZy9SCncEM
	1WWS6nK0St5Gp2sSZpAoNFBs7QplPtY5V5TXQwj/YUTku50iYq0h1PQG5QOQHMdr9SmAbX3NRbfSb
	AbM6hl3I0A82br/9R/NhcpPPkSnJgIZchqyOOqAVHC6D2Eh7hSTygLR6F5QP/7oGRDxoN3h7JpPcC
	swYN6CR/JU3P9//V4w4BTCr8YVxLmUUAd6lTlULSQRpiLnMAik6OmkSek2/4mjx1u8THpZpO8LtEe
	wYd9qL4TwSE93eTLWksoBGscEl+Ap5FrmKlMgfj3brVq5gb+C5QT/taN+3iClPmBjUDapip+mkg7R
	AnqEci++w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khq36-0003wF-HP; Wed, 25 Nov 2020 08:21:12 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khq32-0003vY-5f
 for linux-riscv@lists.infradead.org; Wed, 25 Nov 2020 08:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606293187; x=1637829187;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=RKtc87ffe9MYKi0dkE3HFgdfkpXhdn1ixTyrexf6bVs=;
 b=YGDgtTMS4DGdeMC/RWnPfg8COFLwO2LsvvHQ1u0jsGVliWrMf95Hq4h/
 1IF87laMQ49b6j8jisIslArQqeIVTXSEtHsF8Yzx3ULI1SyG4GV89n8o1
 2DUytv23IsbMd53uhoPmpkU8TShhmVK9Yoy+K2fjJBVG9nTWD2AA+8COA
 n9LZ0UGNk4Gs3W0CiMG+jNCTg1jtHW9AQIHABPFHYQv4KokzYrGmBsrTl
 9ufhIl25Qq7T/8SFVcf9WeJSviVL1FP20j/8JifvTwnNmqmXzfffKwRnN
 Mrdh8SkKQ1kzLssdJbLeKb/BD87VgX0N18Cypq7NIByrhUtwt+MZ+i3ii g==;
IronPort-SDR: j6rTClXheYKRA30OjF/nIr2tOIO/gHF95/LpO+SumOR+Kh8JlvySulk/H6m0x1caH2Qt93UZB3
 Tl771y1+HJLWeTSIKoAxlEpI8yH0dUWTsNKiLsLcqgpNVmFLqUOs8wmBIFWTNvCYCBtQD0FDpV
 wTvDyoBjZpLwLyiFK+H7FLV/tJRxNXttL5XVLgAuvvlSuqCb2zv1IDHqSGDqCy++pzERfKZlpV
 9mC3H3pmOJzTNIwZYzs85KTi6DhHF6ijo6pBgCe0V6wyilbwuki8j1NAedRchyJGB8nVqGt4MC
 K18=
X-IronPort-AV: E=Sophos;i="5.78,368,1599494400"; d="scan'208";a="257071620"
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hgst.iphmx.com with ESMTP; 25 Nov 2020 16:32:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOAt4OjgQpPv058nTNI3vN0qRjfT9OM0gQnk0TQ/kIJZDYRSOufoYvZE/qTL94Erh/okH5Kp6W44yOfQx6BkL+NvBU3l+jesLO3mJxh23DxEMTFOK5o2EbtNhI7qGv6YJi4KiHCXTzbJmN44ouVVW6xaFFAgKoGZ00qydQmCZ6Sgdcq6+qVCGtknChqjpCx0Pk5aKjFd7H5WkIpUZOC+O3qQUuBN3rgRwGOyW+VMwewn052yFlnSSdc2JUy42f5R5hLU8oG4pXBCCmCiwBpSSNRHSIX5zusM/E87jCfzM6jJoipZWG3SDYyx2SzL4mnmWzxK/yFkt+uZCpJUyWIEeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKtc87ffe9MYKi0dkE3HFgdfkpXhdn1ixTyrexf6bVs=;
 b=c6YB4LOZ7rKuW7mWHwDYDe5z2phrg69E55Co8g0AfXPuMY/dTLE0pGLxQPJr/Defxhj5LiL55RNE/JbEAzOo/OWKdd5rdeSrAuM69UBj4T1RL2zNutStoOHLUy1ecAwtlCLXVT4ng2CJcLhZlttBCLhuarz/bRK9h0wt6QjaIZ5Xfoa8RoEq0zzP3o4Q1vHubSiELuW8Wn4YbKoSo6CLZl8tNCogBJeQ38AjvwvdWCcrCMgfgzXbd598CzygUM2lqRzVbU1Lly8tF0XMgA5xHcjH6VrLZ8EV2fp8orN3Bw7fyhKxZG4KhhKnv694+HwNVlaLyBRY8W9I/OsE53zLMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKtc87ffe9MYKi0dkE3HFgdfkpXhdn1ixTyrexf6bVs=;
 b=S93CRWS7gyvtn/Xu5IuWe62jFdrFdnY1RCOJpUfBvjeQXZFX7Uihx4SSi9JH/Z9ct8ph1GIJ8RU5KQrN71kA1tBbP8PyK1Jys9mj85o5ZgclkNMA7HxxIOCaLttwoni+2nEuF+TNDhzgwZaRYJZZgnkVS818mJvTuo+qS+RXC3Q=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6506.namprd04.prod.outlook.com (2603:10b6:610:61::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 25 Nov
 2020 08:21:00 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3589.022; Wed, 25 Nov 2020
 08:21:00 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "ardb@kernel.org" <ardb@kernel.org>, "geert@linux-m68k.org"
 <geert@linux-m68k.org>
Subject: Re: [PATCH] efi: EFI_EARLYCON should depend on EFI
Thread-Topic: [PATCH] efi: EFI_EARLYCON should depend on EFI
Thread-Index: AQHWwpZsUIWSdj1niEW9g5G97t/JLqnYgqKA
Date: Wed, 25 Nov 2020 08:21:00 +0000
Message-ID: <d3ce2d98a7469eda01a67eae7a26585893a1f757.camel@wdc.com>
References: <20201124191646.3559757-1-geert@linux-m68k.org>
In-Reply-To: <20201124191646.3559757-1-geert@linux-m68k.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 (3.38.1-1.fc33) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5d970405-4825-432a-e157-08d8911b0ada
x-ms-traffictypediagnostic: CH2PR04MB6506:
x-microsoft-antispam-prvs: <CH2PR04MB6506D60B2863131633720DD5E7FA0@CH2PR04MB6506.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RfC88ZO0XgqEcdW1QA/pYjRmAvnq1zHLliMz4siCYOdlMQGAtwipfvhkFR9xDlBZhn63o3vzd/rhwcFKs2LYMQnk+snueoQf52+uBIT/ta+KX8NuF1NCybiS5x9RZggYnOiJOLwRhdIXtyTwAupzev7DQiPj6/U6d9B64F/hnaDwQQSz9loH00REC0fDgeRsjn5tSUggRCSGsNbBXAtWDbd07BDCYWzMEeUJtu9jdk+bxC8pOkQQKeifGD4rnEeyZTlpUse/JwAK5+o/NIoYoctpklLl3+TkIK2zDIIUZSG7rcWmLldPX1JqSeEd+v4je9KgzU4q1uwHHubGednnog==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(66556008)(186003)(36756003)(4001150100001)(8676002)(4326008)(6506007)(110136005)(478600001)(54906003)(6512007)(5660300002)(86362001)(83380400001)(2616005)(316002)(66476007)(91956017)(2906002)(6486002)(76116006)(66946007)(66446008)(8936002)(64756008)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?TXRCMUo2ZkdPYnFGYTUzdzZBTVhTRVVRVlhYRW1wUlZoZUlDMDZNN2NEOVpn?=
 =?utf-8?B?andXUnlLdUJmM0EvS2NrTXBiTm5sRHhsMm94Q3IxaXhnNHRDODBtbEF3K1Q4?=
 =?utf-8?B?NmdXdGxaMVZIaXV1K01SYjVDc05CdlVuTzNvM2dYRTZVcFVML29YRkJIYk92?=
 =?utf-8?B?OFE1MjJ0d0FLRkQwdlczNUxHVER3L01ldE9jbXpWcjVYUmI4eWwxaVBEZ2d4?=
 =?utf-8?B?NjQ4RDhmdTExaE8zaG5WemREd2hIcWU3eElQRHBxcU1JMEdsRGdTMlAySkdj?=
 =?utf-8?B?dFhkUXBKb2JnbDBweDBQaytyMWdVcVl4Wjlqa0tQRW9jVk1vMWtBYm9hQ1hS?=
 =?utf-8?B?ZEdqY2lMc2Y0cWU5b3I1UTJheGZYYnE5ODdRaDBCbzEyNU1oZ1IxUUZKdzB2?=
 =?utf-8?B?ZnlGSS9pTHlvaWlwUFJpVkYvZlg0T2ZGa0Y4dkFQU1pBdU8rWEw2ZE1va2FZ?=
 =?utf-8?B?U2JWMmNmMmFrN1JsRUtYYW82dDJKd0JXNHFraFYwdUVYT0J5eUNlUGxuNXF2?=
 =?utf-8?B?VDNLRlgyYjNMNktMODRJc2RncmhPOW9ZdE9sVkMxYWdXVS9CMXdtQ3BVMEd1?=
 =?utf-8?B?by8wd3VXZmN3SStzM2tqUENBd3plL0pGU3cyODZqUHlZc3JlZnk5UHhkRldR?=
 =?utf-8?B?cVR4NjBlZDJ5L0ZXazRNMXF2WE01VUZCbnU4RHdwdG1JTGV2aXNwSUQvNXd1?=
 =?utf-8?B?cWQ0WWNoeTNXNXIrZE12bVEzb2N6VWtBYmJRSmVRUUw2UmNUdjMzZDY3WjZ2?=
 =?utf-8?B?QmJaSjlNMjA2N2FsWVpjN1BmNW1pUmk2NFl5VFZ4WHNNQU9vRDloREFSNHJN?=
 =?utf-8?B?T1V4Wk5ReENxSStpaS9EM3NlYlc4NnNqNHJXTzVRYTBoSnFZb3RIT3lBUXFQ?=
 =?utf-8?B?Y2hyWlRmTmJkRzZYV2c3QjF0bkJMaHgzdE9PVkhlbDF5Ykc2dWViNVQxR3o4?=
 =?utf-8?B?TjJpOFVMZ2dZTmozdzhJRE02aktHcnMyT0szQWdxS3FDUWNjZ251Q2NLZDZ2?=
 =?utf-8?B?T2tJOWw3RTFlME82c1htL2dYM3BQdS9la3hXWGZYZUFrLytKWGJ1b1pCTWJl?=
 =?utf-8?B?K3VFTG00Q2ZldWpFdGRxajRYbTBmQXgzZXBmOGlBUjdnMVZZR3ZwdDRuWFNY?=
 =?utf-8?B?TWhWNGttRUlwdThWMmovMGNTcHRNYWFocGZFNVE1c1hjL2ROUGpTR0N5OEkr?=
 =?utf-8?B?STVMRG1od2k4MnpXV3crRW0vSk1OdHdWNVpDRDVlbGdZdnMzMm05RmgvKzZr?=
 =?utf-8?B?d0N4UnBqak9KR0pCb1pBWTlQZWkzZDlWdnE4TUFsR1duRUJTdnlBQzgzUVE2?=
 =?utf-8?B?NXRGRDczSHA1SWFBYjAvUnVYaWFiK2J4Y1FHbXBWeGZVeGNJZUpSeXRDZ0po?=
 =?utf-8?B?NE85SFEwT1FQMkdySDZuZkUrQlVxbnVHVjlnVmRPeVlCN290TFNLZERkZll3?=
 =?utf-8?Q?EddZOWhB?=
x-ms-exchange-transport-forked: True
Content-ID: <92D43B96E3700248AED86E84824E91F1@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d970405-4825-432a-e157-08d8911b0ada
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 08:21:00.3822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lcd7bl6KOr+4JNTrmGK+ob1q3+afrKXVHhrrl+4Tw66zEMMQA3x+qj4uNi70SrCFd7djR8uzNYSXO6UZjXfSPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6506
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_032108_579024_CC2344C2 
X-CRM114-Status: GOOD (  21.94  )
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
 "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>,
 "mingo@kernel.org" <mingo@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMDIwLTExLTI0IGF0IDIwOjE2ICswMTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IENPTkZJR19FRklfRUFSTFlDT04gZGVmYXVsdHMgdG8geWVzLCBhbmQgdGh1cyBpcyBl
bmFibGVkIG9uIHN5c3RlbXMgdGhhdA0KPiBkbyBub3Qgc3VwcG9ydCBFRkksIG9yIGRvIG5vdCBo
YXZlIEVGSSBzdXBwb3J0IGVuYWJsZWQsIGJ1dCBkbyBzYXRpc2Z5DQo+IHRoZSBzeW1ib2wncyBv
dGhlciBkZXBlbmRlbmNpZXMuDQo+IA0KPiBXaGlsZSBkcml2ZXJzL2Zpcm13YXJlL2VmaS8gd29u
J3QgYmUgZW50ZXJlZCBkdXJpbmcgdGhlIGJ1aWxkIHBoYXNlIGlmDQo+IENPTkZJR19FRkk9biwg
YW5kIGRyaXZlcnMvZmlybXdhcmUvZWZpL2Vhcmx5Y29uLmMgaXRzZWxmIHRodXMgd29uJ3QgYmUN
Cj4gYnVpbHQsIGVuYWJsaW5nIEVGSV9FQVJMWUNPTiBkb2VzIGZvcmNlLWVuYWJsZSBDT05GSUdf
Rk9OVF9TVVBQT1JUIGFuZA0KPiBDT05GSUdfQVJDSF9VU0VfTUVNUkVNQVBfUFJPVCwgYW5kIENP
TkZJR19GT05UXzh4MTYsIHdoaWNoIGlzDQo+IHVuZGVzaXJhYmxlLg0KPiANCj4gRml4IHRoaXMg
YnkgbWFraW5nIENPTkZJR19FRklfRUFSTFlDT04gZGVwZW5kIG9uIENPTkZJR19FRkkuDQo+IA0K
PiBUaGlzIHJlZHVjZXMga2VybmVsIHNpemUgb24gaGVhZGxlc3Mgc3lzdGVtcyBieSBtb3JlIHRo
YW4gNCBLaUIuDQo+IA0KPiBGaXhlczogNjljMWYzOTZmMjViODA1YSAoImVmaS94ODY6IENvbnZl
cnQgeDg2IEVGSSBlYXJseXByaW50ayBpbnRvIGdlbmVyaWMgZWFybHljb24gaW1wbGVtZW50YXRp
b24iKQ0KPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02
OGsub3JnPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2Zpcm13YXJlL2VmaS9LY29uZmlnIHwgMiArLQ0K
PiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvZWZpL0tjb25maWcgYi9kcml2ZXJzL2Zpcm13
YXJlL2VmaS9LY29uZmlnDQo+IGluZGV4IGI0NTJjZmEyMTAwYjQwMWMuLjFkZDFmNzc4NGYwODg4
ZmYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvZWZpL0tjb25maWcNCj4gKysrIGIv
ZHJpdmVycy9maXJtd2FyZS9lZmkvS2NvbmZpZw0KPiBAQCAtMjcwLDcgKzI3MCw3IEBAIGNvbmZp
ZyBFRklfREVWX1BBVEhfUEFSU0VSDQo+IMKgDQo+IA0KPiDCoGNvbmZpZyBFRklfRUFSTFlDT04N
Cj4gwqAJZGVmX2Jvb2wgeQ0KPiAtCWRlcGVuZHMgb24gU0VSSUFMX0VBUkxZQ09OICYmICFBUk0g
JiYgIUlBNjQNCj4gKwlkZXBlbmRzIG9uIEVGSSAmJiBTRVJJQUxfRUFSTFlDT04gJiYgIUFSTSAm
JiAhSUE2NA0KPiDCoAlzZWxlY3QgRk9OVF9TVVBQT1JUDQo+IMKgCXNlbGVjdCBBUkNIX1VTRV9N
RU1SRU1BUF9QUk9UDQo+IMKgDQo+IA0KDQpMb29rcyBnb29kIHRvIG1lLg0KUmV2aWV3ZWQtYnk6
IERhbWllbiBMZSBNb2FsIDxkYW1pZW4ubGVtb2FsQHdkYy5jb20+DQoNCi0tIA0KRGFtaWVuIExl
IE1vYWwNCldlc3Rlcm4gRGlnaXRhbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
