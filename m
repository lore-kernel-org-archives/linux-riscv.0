Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A60606A337
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 14:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Fde7A+C;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=htecgroup.com header.i=@htecgroup.com header.a=rsa-sha256 header.s=selector1 header.b=V/qpCIle
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1+mdClTJhyaEdeeY1te49Ab5oozB601hnxhDoxPpd2c=; b=0Fde7A+CsbUU0fn+646zXUiCz5
	cvS8KSUZtPa3flpQDiiK3aA6NZqV8QuSC6DFk5XT1NBfZJwjpIgYkt18XhqImNVSW/bT1y1Lob5oW
	Q+IplkM7DkspjVlvcaYC5pmzJP6YIQzFCwDaz+DrKsmDUgfwtK1ukdlMdpct2dwfl1HQ7Rg4zcQfn
	fABtAA9kTyxGG1P2P7o9u8JNYgADyBHf9qEZec1R15AmkA8n6o+PpVe+ZBEzDnwnHdoqpe2OmPuhs
	nYyTNGaDNdw//yCBmaNn+5/3204dfBElUXbpuIl8gfk2zTwW35ZZtdcmhMFZ9SHNKRVlRnF1g/yu7
	kVXI9Ecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgZl-000000095YB-008T;
	Wed, 18 Nov 2026 14:23:53 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgZh-000000095Vk-36QL
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 14:23:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uS4jdMwceCLHIk38dhDPYlv39pkfiC9SSM8af3V/wkEXxeDX/AXvgGCFb3RCX7pmg0Juk+C8aXRVLtAHuKUWBpp3GKPGENBCUAQZT5CPf5/B05sLLioNeJsAWyaFAPjVroDPwfBT2pC18ewNpF8owLqLDMCA8Jk9U3tcZdl+VpWUvn+GPL0vlRdL6YeGxlZbPml3FYDgH9dw7jk/rJH4PTpZn2SqWivNmiyzy1vtBZxHFxpl5HFIyFEVcj/7RrTQnICXD/0g3IyvX2wvC02MSepFBYetNfJjORzsp8kzqFtL5Gy1TuFdxZpXz9hMQ+wfe8mhDDt2hEtbPEM7kRM18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8hClT+RuWX8Qdk4QSp0HgSvoIrkznOt8CvxNPQ1yw4=;
 b=KpxjFOqRqr4dPU7Qoen5Qk0x/uIEn9Jxu6N+p5tQwHyFYd9DLXxIerU7SMlPa4COrFF2/4qlRZmUDSOj2sTRAnKpLv0a3f36mon05hHUKHSZcftR/R50aisxJBZdUoZdRWJqcF4OLCD42O8eUXeXnP6CshdivZKILUuC/bv7+YJpDXVh2cQrJdMTFjyEKJAJNwqFGwk3nAoxgbVmCyTnMigHS1vkhsrRdKGFAI/P/ri/2mpS+VVU/BjcWWQTrqtXKIsR9JIqSzLbJv66CJ0MKAc9qqwAm0DKxHavF1/GpVAH0hjw6+3UutipfupWL8m/rVwmLCBikPVchXv0DC37jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8hClT+RuWX8Qdk4QSp0HgSvoIrkznOt8CvxNPQ1yw4=;
 b=V/qpCIleEEiXLMhuZzkPyEDUa+Bn0/q06xCSag66GZeNd1wBsqJw4k/vOnpQu80h80hhb3k+PvZqwElsfdbiXv9/Cd/btR/l8RE9Rxbrq7Ke36RICvoIzE605ILwciO8iF06NKGb9Ybc/7LjhnE1RHXVKVCNqmUgCUdnNFLRP4WmVOIodi8nKJCuczfnuI7dbKkHgFGsDFC9ZsjqUA1a2jXiRHRhh21eBswji8G+rnGF60yNZWxdXkL0UHwIVUHYJglIIPAoxOBmaDTsZ2hULcG2aliLw33F2kvojcN7YJOIO+DwVUoPBK7IHGM+JfWkbhw1SOSgbe+5n2oDPiWbaA==
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 (2603:10a6:190:56::10) by AS8PR09MB5904.eurprd09.prod.outlook.com
 (2603:10a6:20b:54d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:23:39 +0000
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee]) by MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee%7]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 14:23:39 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "anup@brainfault.org" <anup@brainfault.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "daniel.lezcano@kernel.org"
	<daniel.lezcano@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Djordje Todorovic
	<Djordje.Todorovic@htecgroup.com>, "inochiama@outlook.com"
	<inochiama@outlook.com>, "joel@jms.id.au" <joel@jms.id.au>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"palmer@sifive.com" <palmer@sifive.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"radu@rendec.net" <radu@rendec.net>, "robh@kernel.org" <robh@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>, "vladimir.kondratiev@mobileye.com"
	<vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH v3 7/8] MAINTAINERS: Add entry for MIPS RISC-V SoC support
Thread-Topic: [PATCH v3 7/8] MAINTAINERS: Add entry for MIPS RISC-V SoC
 support
Thread-Index: AQHddcFpJxsnJ1pxHky4QG56lXjOZrcw98CAgALtegA=
Date: Wed, 18 Nov 2026 14:23:39 +0000
Message-ID: <53de742f-60eb-48ec-a883-410431aac274@htecgroup.com>
References: <20261116-canary-pedometer-9df9d756da82@spud>
In-Reply-To: <20261116-canary-pedometer-9df9d756da82@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MMZPR09MB547520:EE_|AS8PR09MB5904:EE_
x-ms-office365-filtering-correlation-id: e0ad217e-af11-4e32-601d-08df457f8a5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|38070700021|10067099003|260925021311599003|11063799006|260925022911599003|260925021911599003|56012099006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003;
x-microsoft-antispam-message-info: +GzqzeyA/W//cW3Rt1vJFBqJz37WiQiEpcPtjgV8x3ZxGHrqcHHb9gW7bMEqmDL4WyYCzNBINZpMeJAMr/dri7wXDgrgkL87x6nHFOXzgc2BpK7+S9THFa4DjQYVB9UZ/bjixo32FqT9pQc9PRqQqS6wSpHawSs/A1fNs4RLdc5k5evv5EBaY7+Dz1oZMfi0TBNlNIeI3A2pKrtUYmGsrHv0coHsgHZjzr0F4SsPDy53Y+SpS+VOH+oR5k5BOHJGB5YpHE9HTzOTfH4pU+OBmOlTTVpxkjB5gIikK2IDFuMk71iwCUxYa8jV3tFjQEAGD/zYOvG6eauy/nqxdVRhea1w0fZxa0leO63EgFUTtdh0jrOWN5NSBtxPvtiLQDWBDxKymZvq71+L94fTFT7I86G3MNn47vOwUjsybuEJ4g2QHWNHeYMi9HxrK8Y4kcWzNzCkT5LDMfhKj7ej/PA5Dbzc2boWA03F98MbX740qwjR3U0CQqzmtvygtIK22Eh7ibGC4oP+YLNC1xRpWHy6PDC1/RPKmoUFCO+DO8xhxZTLGjgX249tBK8A2EPb5jTuVnnp1IIZGCAzQOdNRIDblyw6AWS1it50PJjs7Yid6Yj2iPk6D9icel6oXhDweimnawPo/6WZD4QVWHVDhZAyQ0tWX+15voge4hbRBxLQMtHWiLnyUohddZVn6QKAIh6YL4/nXIdx2oVpTgwfQyK9OS0aDNVS2y09sgLOMEEGSWY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR09MB547520.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(38070700021)(10067099003)(260925021311599003)(11063799006)(260925022911599003)(260925021911599003)(56012099006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODlsOTIyVWg2d1NUWGxmM3VnNHd3ZUZFbTV4d1YxckxHaGFYeVAzUmhTWXZS?=
 =?utf-8?B?c09acFF3QUNwdll3Q0RlYURmc2tuVFRwalNxb1phVHY4QUF6OFY3c0J5TzQ1?=
 =?utf-8?B?bVdQWWd4U3VVZWJJbEZ6OVRqUllrejhsdkQ5bWtSY1pCZzZZTlpnSk8waGxI?=
 =?utf-8?B?ZXNBRXN2RzVxaEtCWnVoa3N1enR3aGQrNGZSV2hlT0lrSHJlOHQ2VzRmUzJN?=
 =?utf-8?B?Zk5JN3RpTmZ2OHZrK0Nrejc0elFmZVFMWnFOMUtzNFV5QXRadW0yMXBVZDNE?=
 =?utf-8?B?c0U1V1JWc3VFTXJjanJFTCtoWGRPdHFLa25DZ1VXenRla1A3QUd1RkdHcWFY?=
 =?utf-8?B?N0hHQVFSTTd2K3hwNGphUEZST1lpcmdqOGNCSnYvTFRWZHNaNDZsOHUyMWZl?=
 =?utf-8?B?QmlaeFZTbE5rdW5tWmd2bGlwZG0yWS9pM0NBQzVYMWJwZFNGYWxrQTR3M0Jv?=
 =?utf-8?B?VnE0Y2JMalJuS0o5MHhkV1BOcjB2ZTZVK0xSRk95SERMbVN1dUdvWTRiYzRu?=
 =?utf-8?B?YldxLzQ1cnVQUG5qbmF1L3RjYVBSbTBOOTRseG43eGdOa0FOYy8yN3IwSXpN?=
 =?utf-8?B?WEFuUEJveGc1dEJPNHkvaWlHWFhML2lYVzN2dFp0eDVQTnJDSXg5SkorbS9F?=
 =?utf-8?B?ZmdsUE1UVkV2WUprZWMyVWNWTTR0M3FGQmVaeWVDenlDREFzYXJ1NUhUeE80?=
 =?utf-8?B?ZkphSVJtZCthZVZPeC9JT0FlWnNrQUpaYkFyS2FlSmpYVG1XVFpjYXN1VDJC?=
 =?utf-8?B?WW9EaEpMYlBkMUVKUEppaHA0Sm1MMk54U2wzclB6VTQ5czA3Y29xTkpTa1Fx?=
 =?utf-8?B?NzdydHVWTHJMUWFxNkd3NGl6WmVJaGRVaUVrSFJGUEYzdG8xb2F6SDBMTG45?=
 =?utf-8?B?OVhpY0wrMFNGb0NySU9QNUk4a2R0TTB4U2ZaZHg3TEZ6NHU3L0JHbGFxT3Vt?=
 =?utf-8?B?T0JZR0RiMGJ2U3VlNFNxZzgxKy9QUWs3M0JqUXhFd0EzTEhtVnJZOFNLUERL?=
 =?utf-8?B?cFZ2Ny9XZzJvbHc0NHZGdmZkSytsVHN2eXZQNlVreGp0QUZNWjFFbGZ3RDFo?=
 =?utf-8?B?eEdQVlFwL0NCNnRTWWFjSWh3K09YTkdIdGMvdXNxanp3L3hueENKUlB6Y3VG?=
 =?utf-8?B?WWNMbzNqT1lqSkNEZXQwcXh3TkI3UWpXVWNEL3BLelBrOERuWVRvL2x3UDRZ?=
 =?utf-8?B?ZTdnRFpPNDRwRHBRSjNTZHA2YUNwZVZBcFlWdEk3SHdmRm9ob1FBTGcrN3U1?=
 =?utf-8?B?TmpzVmFLN3lJNEdhbzRCOEJDamRQRC94bFdHSUkxbDBBMDRpelNlWmIwMVRF?=
 =?utf-8?B?Z3YzeU52U3E2M3ZFcCt2V3BFUldneUYySTcwR2RXZU5KOGxwMEpDejV4L3p2?=
 =?utf-8?B?SktRdnhlV3M2SDNacG9vUWxtK0ZLakhzYzJCeHIxZDZYanAyVENON0d2djZW?=
 =?utf-8?B?bnBrY1lqa01rOXk3WFNlSXdwbkRtb1BJdzRLQmVvOGFuT3h5dzdaUFdEWTJU?=
 =?utf-8?B?QlUvd2VKaGJtVjltS0lpNlRiVFJiVW5OV1llQjMyRUhWaWNGRkkrUnBwNTFQ?=
 =?utf-8?B?bk8rUStXcERsU1I0NCtWaWo4MHhPN2JxSC9IUm5FeTU1ZFZYaFlUSXdLRW51?=
 =?utf-8?B?YzdxR2ZIakQwT1dYWVVFQW9STlZxRVNiTTY2bVN6YnJmSHNDYWFWeitCV2F4?=
 =?utf-8?B?bktzVlNtWWIvY2NUamFPVUFTSDRyU003RFcrQmpJWXpRZm0yOSsyTjhjUUVB?=
 =?utf-8?B?TnpFVDQwU09GN1BkOTRzaUYxc1I4dHNvbWZjb1doa01ja1M2VlpLUUlWc2hG?=
 =?utf-8?B?ZXppT0RzdHA1d01GSU9OWWxXNUVGaGtMWWJMWk10Q0NhajZkN2YxMkUwOWFv?=
 =?utf-8?B?SG55RmNDZGlUZHcxZXRoN3VvNjdQYVdwT2pEcVoyazQwSDdETW84U2hTUmUw?=
 =?utf-8?B?RU05ZS9rc3RpdldsR2lDMzljK0MyMEZSSTRLNGNTS21xcnNPMlpZMGVCSVR0?=
 =?utf-8?B?cVllSDlqVHN1QnV0RWRQMVpQVXhQWVFRc1h4Q0xXQmZVVE92Q2tTYnlaQ2F6?=
 =?utf-8?B?Yjc5MEx1dnl3b1J4Y2IwSksrOS9WRUJiR1RjTFVZSlcxbmh3UUFMTnNjNXln?=
 =?utf-8?B?Titpb2hvU2xRSU54WjYzd05BVWlLa3dabmVkdlhKNlpwR0x6U3Ztb3I2K2lO?=
 =?utf-8?B?MEtDMkEydmhiK0IzR1kwTlBySEZmOVIwOWFTVytNT2krL2tQc1dHWEZqdlp1?=
 =?utf-8?B?RVFOYjNJbmF5WmF1Ri83S1FsSzVqRzJjSEMvT2JmMU1QVmxFVFVJb0tCcnFv?=
 =?utf-8?B?Y1U5c0JtMHF0UXBtMXQ3TnFyL0U1ZUg3dFRXR1JWaHh3OW83STFqR3ZHYlNG?=
 =?utf-8?Q?nQA8ps3hnCJ3yR5Oc0A1zN42dT+rYOJINj5P1?=
Content-ID: <75A5F8B0BF78414FA734D88F59AE4556@eurprd09.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MMZPR09MB547520.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ad217e-af11-4e32-601d-08df457f8a5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 14:23:39.3724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jI3UHrnpi39BhHM0Pv3l97m5VMVL1RubQcSFCFz4hI/IPVC7QH/VkbM8Yq+mZjFzAksGGqgXjc6+fwguqiZfASe7GHfA4dyuhqV+OIOpEwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB5904
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_062349_792807_3BB01AAC 
X-CRM114-Status: GOOD (  16.49  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQ29ub3IsDQoNCk9uIDExLzE2LzI2IDE4OjQwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+PiBG
cm9tOiBBbGVrc2EgUGF1bm92aWMgPGFsZWtzYS5wYXVub3ZpY0BodGVjZ3JvdXAuY29tPg0KPj4N
Cj4+IEFkZCBhIE1BSU5UQUlORVJTIGVudHJ5IGNvdmVyaW5nIHRoZSBNSVBTIFJJU0MtViBkZXZp
Y2V0cmVlIHNvdXJjZXMNCj4+IGFuZCB0aGUgYm9hcmQgYmluZGluZy4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBBbGVrc2EgUGF1bm92aWMgPGFsZWtzYS5wYXVub3ZpY0BodGVjZ3JvdXAuY29tPg0K
Pj4gLS0tDQo+PiAgTUFJTlRBSU5FUlMgfCA3ICsrKysrKysNCj4+ICAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRB
SU5FUlMNCj4+IGluZGV4IGMyNDE0NDQ3ODkyYzI0ZDU4NTk1MDU5Y2EyN2IxODc3NTkxOWFjMTIu
LmEwMGYxYTgwMWJlM2M1MzJjMzM5MThlNjczYzc5NzdkOWRlOTE4MjMgMTAwNjQ0DQo+PiAtLS0g
YS9NQUlOVEFJTkVSUw0KPj4gKysrIGIvTUFJTlRBSU5FUlMNCj4+IEBAIC0yMzU0Miw2ICsyMzU0
MiwxMyBAQCBGOglkcml2ZXJzL3NwaS9zcGktbXBmcy5jDQo+PiAgRjoJZHJpdmVycy91c2IvbXVz
Yi9tcGZzLmMNCj4+ICBGOglpbmNsdWRlL3NvYy9taWNyb2NoaXAvbXBmcy5oDQo+PiAgDQo+PiAr
UklTQy1WIE1JUFMgU29DIFNVUFBPUlQNCj4+ICtNOglBbGVrc2EgUGF1bm92aWMgPGFsZWtzYS5w
YXVub3ZpY0BodGVjZ3JvdXAuY29tPg0KPj4gK0w6CWxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcNCj4+ICtTOglTdXBwb3J0ZWQNCj4+ICtGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmlzY3YvbWlwcy55YW1sDQo+PiArRjoJYXJjaC9yaXNjdi9ib290L2R0cy9taXBz
Lw0KPiBSaWdodCwgc28gc3RpbGwgbm8gZ2l0IHRyZWUgaGVyZS4gSG93IGFyZSB3ZSBnb2luZyB0
byBnZXQgdGhpcyBhcHBsaWVkPyBNeSBjb21tZW50IG9uIHRoZSBsYXN0IHZlcnNpb24gd2FzOiB8
IFlvdSdyZSBtaXNzaW5nIGEgTUFJTlRBSU5FUlMgZW50cnkgZm9yIHRoZSBwbGF0Zm9ybSwgc2lu
Y2Ugc29tZW9uZSBpcyB8IGdvaW5nIHRvIGhhdmUgdG8gcGljayB1cCB0aGUgcGF0Y2hlcyBmb3Ig
dGhlIGFyY2gvcmlzY3YvYm9vdC9kdHMvZ2YgYW5kIHwgdGhhdCBzb21lb25lIGlzIG5laXRoZXIg
UGFsbWVyIG5vciBQYXVsLiB8IFNlZSBEb2N1bWVudGF0aW9uL3Byb2Nlc3MvbWFpbnRhaW5lci1z
b2MucnN0IGZvciBtb3JlIGluZm8uIHwgfCBJJ2QgYXBwbHkgcGF0Y2hlcyBhcyBhIHZlcnkgbGFz
dCByZXNvcnQsIGJ1dCBldmVuIHRoZW4geW91J2QgbmVlZCBhbiBlbnRyeSB8IHRvIG1ha2Ugc3Vy
ZSB0aGF0IHlvdSdyZSBDQ2VkIG9uIHBhdGNoZXMgZm9yIHRoZSBwbGF0Zm9ybSBiZWNhdXNlIEkg
fCBkb24ndCBjYXJlIGFib3V0IHRoZSBwbGF0Zm9ybSBhbmQgd291bGQganVzdCBhcHBseSB0aGlu
Z3MgdGhhdCBsb29rIHwgY29ycmVjdCBpZiB0aGVyZSB3YXMgbm8gcmV2aWV3cyBwcm92aWRlZC4g
WW91IGhhdmUgYWRkZWQgdGhlIGVudHJ5LCB3aGljaCBpcyBncmVhdCwgYnV0IHRoZSBhYnNlbmNl
IG9mIGEgZ2l0IHRyZWUgaW1wbGllcyB5b3UncmUgbm90IGFjdHVhbGx5IGludGVuZGluZyBhcHBs
eWluZyB0aGUgcGF0Y2hlcz8gSWRlYWxseSB5b3UsIHNvbWVvbmUgdGhhdCBjYXJlcyBmb3IgdGhp
cyBwbGF0Zm9ybSwgd291bGQgZG8gdGhhdCAtIGFuZCB0aGUgbGFjayBvZiBhIHRyZWUgaW1wbGll
cyB0aGF0IHlvdSdyZSBleHBlY3Rpbmcgc29tZW9uZSBlbHNlIChtZT8pIHRvIGRvIGl0LiBDaGVl
cnMsIENvbm9yLg0KSSB3YXMgcGxhbm5pbmcgb24gdXBkYXRpbmcgdGhhdCBsYXRlciBvbmNlIHdl
J3ZlIGRlY2lkZWQgd2hpY2ggdHJlZSB0byB1c2UuIEknbGwgZml4IHRoYXQgaW4gdjQuwqANCg0K
QmVzdCByZWdhcmRzLA0KQWxla3NhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
