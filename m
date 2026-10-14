Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83993CC6B1A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 13:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jsxsZBdpngVwp1IaflzfKZHjGPKW57DZKqH2K17Gbs8=; b=h4vAwoxbSsVRb2
	8iFvt0/TgTP4WQapJXfzM5IHGgW8paYAMXetSdHfuTLmIGjxyItlQS0gzvMJamEE6dUKScFZdt89a
	dgPI7UCmok7L/yv3QqO9CESr6yJJUttSjeHBuqLNK9Q6diuvIZ6uhWy/Tuw8cyv5Ykf/HpQYPQhQT
	85zgSRUO7j2BwekGFJcwDrIy1/JbOQDW275Kknkd1fM374UXNVN/aIS///BFfFTVD8wtjR+UF8Nqo
	BhzW4GFDPdVQiaEIpxz7y/KS/mki2wbu7sKKeOKARw8ZcnMs86HRnbnSDbI4hNfzEta8BjFZaCyYy
	GvaH9ZNcVmD4U1/umRnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGz3n-0000000FbGL-3Q8r;
	Wed, 14 Oct 2026 13:30:23 +0000
Received: from mail-northeuropeazon11022125.outbound.protection.outlook.com ([52.101.66.125] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGz3l-0000000FbFH-1J46
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 13:30:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhrkJ9ZTMPxD9fIUXa1roxHll39SFPI/bRC4IWQ2h9PrLLhfJOwyTPMCq2Iy0c6ahsKff1S614X6aLDva2ccRzrkYTjcEgdW6+6PCcjy3ukHI9DdZQR8E0tnDRXFtyhNIIZAblAtt37QmAm5eyS192qzzwAtlPugBrs9YvYtGK8UMlU81lve556y8qNAvo31qffFy4hEacx9u/E23ednxdzH2nMbBFNGU7qY0QGa4vIuAeKyPu72vI3oqqmSWCcX8MITD0lznbytzPhjluYAgsY27Rc2UsPzN+PvSY1Nco13cDbvM5aALPjnVfB61qUFDVJkrl6Gb9ICw6Kv+v0J1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqXKPWgkkP8bJaQ9No4M2UMAUOdJjjPgd+VNVPEqLmI=;
 b=MHGI6Bx79Iv4ywbbol2gzHtP5E+YLZgVxNlZbpzj2ov8XBGEK54Dby68ZyBB60ZLxLd13vek9lC/AFu8uLALSjc0LWoh+C2JQeTZj7X2BQ48b95e9mUUvzp1tiP/y+fzv3vCP21fImxdLYSdJTpfmu9JUXg0B+tLG2GmQR9CT0w9g+QnafIVrCOnTZGwG960/tHuXoot2zrIFc/T9+5UdzBrtLDAn16QNlXX4A43S5z2foq3fhjbQB44rmsSjpgheAvKFYnD6cGAgOUvKfObln2KTyhPooklxpQK1c8J21nNil2FgtKpayrInjKmkRPB+ZQ+jKoYyYbx5Y20ztTIIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqXKPWgkkP8bJaQ9No4M2UMAUOdJjjPgd+VNVPEqLmI=;
 b=JBReJFNTacSqIoozT2KcXuCQ3Jhyh9rbR7LnxaipcHERTPyujIoSWFqg9SoYTQpqjKttFhaWrMeQJWvkmiQy1xDY0vfPhJvEMNlgF7jBcWmfXJ7V1LspOoi076ae5bnsff93G6GnkA6dSHvUB5RPvG8sQjCuva0WDcXfaYgXWL38VAPyTdqAJGXrIRqN7I0sWSucvRJKSAxmV8JX6HveFBMgU1me81HUCcuzJopnOHBHV3id80DKSdcaY9KVPNXkYw0/xNyjMSw+t/NKAyy+ySZvnnL5To9yExqYfFqxfIj2oqu7QGqmxyJPv+3Li+gB41z1vW2FT0hXushgac6ZEw==
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 (2603:10a6:190:56::10) by VI3PR09MB108268.eurprd09.prod.outlook.com
 (2603:10a6:800:383::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 13:30:15 +0000
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee]) by MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee%3]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 13:30:15 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "robh@kernel.org" <robh@kernel.org>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "anup@brainfault.org" <anup@brainfault.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "conor@kernel.org" <conor@kernel.org>,
	"daniel.lezcano@kernel.org" <daniel.lezcano@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Djordje Todorovic
	<Djordje.Todorovic@htecgroup.com>, "inochiama@outlook.com"
	<inochiama@outlook.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"radu@rendec.net" <radu@rendec.net>, "tglx@kernel.org" <tglx@kernel.org>,
	"vladimir.kondratiev@mobileye.com" <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH 6/9] dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
Thread-Topic: [PATCH 6/9] dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
Thread-Index: AQHdRFDSwB/0hZOO5U+CEwDzBjel5rbZY2SAgCPURAA=
Date: Wed, 14 Oct 2026 13:30:15 +0000
Message-ID: <e6a4fdae-5123-436a-b46a-db0675734f7f@htecgroup.com>
References: <20260921182125.GA1219949-robh@kernel.org>
In-Reply-To: <20260921182125.GA1219949-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MMZPR09MB547520:EE_|VI3PR09MB108268:EE_
x-ms-office365-filtering-correlation-id: 04d973b8-f98e-40e1-5430-08df29f74807
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|7416014|38070700021|11063799006|261009223027099003|56012099006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: Qf0YYFnimBThijP2CmPUm366Yrt1tm4+I8dyqRNgUxR4WMVYlAa3FN/uxPNNxwoJmn3ljcXF7Ch2J7xgFZ7hXjlikZ/DSOeXoQgCtvJeXhdwfpBj/zniMTLOSVgY4SEM9qxWthZ/C6kg8XPUX8LIbof3krni+A8N8QfNj0o/fGkE6qMHo5pVhfHBYUUP/OGAodNrnfh8S01Dc00UOCcg7px1toKRwlXjX0Vg5ktYkMJfN5/jio4fxk33CoHB6jR/7F95RbUyUNTe1tZSHgum4sVeF3dk2SLIxblns/5aA7BzotUlfvQHo6U6BXQMSNsk3KUjXqjde/aiOH+uC9RbAAoFPCzp2ca/miMVU0yMD+58s8YJWdFKvgY1YwXM2Ee+tOUYPeivtozeSFyJ7SpW5AJJVVy3eCzCXaFS4VV7lx4b/D36pa0Jx5xBQVgE3H1VCXM/AOEdOZc+pmY1Z8YTXX8X9S6WYqoloQJ8dqG1VPC9QEdQBp8W0bVhmr88oSHIEwtLQl4t7zBa/Cr3mG25T7p49ExDRP0NEungagFuNjNemj1LXKpOV9A6Y1l9oMsJchmQFErO/9aX04Bfgezq2FGKX2mO4hbBJJwqFA323wJyyjdTkOpBQEBnuxatVQqD7mQQZUr2/eEOmn02vEltgQqdt1Lk7mAAnCvkfOwRAXcA1rZ8j4ty4K2Oe7Jv0ypJ1pehn2aI3DyKBTP8SqDk42kIYz5hGCen1ONHhHj7l3M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR09MB547520.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(7416014)(38070700021)(11063799006)(261009223027099003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzdmMUR4SnBwUW5aM3RWbTJIUFR1eU1BaWdPbjhDV0FFcWcwdFRzblVhWEFE?=
 =?utf-8?B?ckgvQVJjeGhvN1YxRTN2Q1ZIajd2dWZSZ1R6WTJVTzVmREhqaDJBQmhUMlhI?=
 =?utf-8?B?cTlKeTJQNlR5MVlIUHE5NFV2akt0TlFXRHBVd21Gc2FKUk5vVGMxcXlQd3hJ?=
 =?utf-8?B?THErNHh6QTYwU3JWQ2NKK1pqMnpKN3BtUExLRUcrM0x5NFBIWEdXT0g5S1Vo?=
 =?utf-8?B?YVFhVStUeTVCcFhDSlZSdE5nMXlqZmRkS0h1QnNHUEJBZ0pPOEhvc1dXcllL?=
 =?utf-8?B?MXRldW4zTXJJYWU1SmwvYVlZZUlRZGFWR1FmSWFqMGdwbGVUSmNpNGM5OFZl?=
 =?utf-8?B?VzNMZllZVTY4MHFuY2VhazFYWVhaeEJkSkVwSERPS09OeDh2QldzVDZJbjZ6?=
 =?utf-8?B?RWNPTDBrV0tBd2JpeTl2Vy91QWFFdkk1eDdjQ251eTJFWWpmbUFrYWxTWk9D?=
 =?utf-8?B?SmZxVEJ3VXNKWEVtUWdxN2xtclpUcVB0RGNZTWk2SjV2R0tXdThFSXNJbHVa?=
 =?utf-8?B?UVdIZzlvcDZLZVNpQnlZV1hoMmh3cHQyOUkxeFArKzVHZDBmZlcrbmViS0ox?=
 =?utf-8?B?aGpvS0VwK2UrbFZLbXQ3UDZoWlk1NjR5SmJ1dnd4NlNzY0hITmY3MjRSTERH?=
 =?utf-8?B?TDZScnRoWGZkS2NLVTVxeEZVWGtCMVZmWTFQdzBYZVBLa2s1REdVeFhiNFpK?=
 =?utf-8?B?VTZNdWNPblBpSDRGWlVYbzZpcEJKSjd6bjFtaXhuWDNWRVFvZEJLQUYxc00v?=
 =?utf-8?B?eWo3cGJEUlZCVkZGQ2tGTExrSm1RZ09NbEFyQkxyeVBrdWRDSExJRDFmdDZl?=
 =?utf-8?B?dm5jbDRRYUFDYzdJQzdtTXVXNzcveEczRTV1bk5YdG1HNzdXR3hRWnZnRFR4?=
 =?utf-8?B?SUVwcHFQcCt0aFNHUDFiTWxkZUJkRDZ2azlZRitWUWJlOUxMQXFCaUpXUlRa?=
 =?utf-8?B?bVE5SmdUckI2OE1DaHcxaTR6SCtLZ3hsVGE4RWxWSGF0TmVwRk4zMmJvTmpB?=
 =?utf-8?B?LzQ4VlQ1RTdRQ0hlbTNtV09sMUN2eWlWVnViZ2RvYmwyRFg5MERaMitQNGRV?=
 =?utf-8?B?elFEcVd1SEdkenRmTi9ZWHYxeWEvRExHZkVqMys1Y0ZyK3pTZzBTMk02bjNp?=
 =?utf-8?B?ZXdOczNyZnRSZG1zcVZ1d2grQXV0WkVnWmFSQUUvd05Yb1RqRlAyNDhOd05F?=
 =?utf-8?B?Q2M2NU1HTW1QNno5ZDc3TWV6aVB4WlNQOVlKeWJLVGwvQlM3YnF1YjlNL01n?=
 =?utf-8?B?ZVM5Y2FpbVh4Z0MwQmdzL1ZtWFl1Ry9EUWczYi83dzdHaXB4bzR3c3pFZXM2?=
 =?utf-8?B?dXZ0Q0tZSENheXF4TGN0b2RjeU52TVJTb2ROMjZrbGNBZ1R1b2NiWTRqUENP?=
 =?utf-8?B?QTNwQVp2V3AxV1B1M3p4OGVZb0RiK2MxQWxqTE84bGtReWtZb2Z5MEVDdFgv?=
 =?utf-8?B?S0gvL2FrSzdXS2RWTm94WEl4M0VzbkFlRkt2SzNTVlp2Q24vOHBESUg4dHdT?=
 =?utf-8?B?ZmF5YjkwWFdCOFlqc05XWGdPMG5wSmJtZEdZUXEyQlMwcjFTcExqMytxTlJV?=
 =?utf-8?B?aHdYWjU3Qmg5b1BOUFcwTU9uYXZaTS9kc2RYVnd5TTY1RGNqazNqTGdPalY1?=
 =?utf-8?B?RG5pK3pldjl6NVBIRFdxK0N3bHMyNDNMUUVXV0dFcDNUV21OSXdRMkRSMHow?=
 =?utf-8?B?WjZYSUhIVS9rWXBJdFpVTXR1MTkzK3FWQ2E3MTA1ZUJHc2ZGeWt5cjJ2RzRu?=
 =?utf-8?B?VnJDWFlwRHcrNUo2YVpheTFPSFFYbDJDUEhZeklBYkJpdUpuR1VteERnQkt0?=
 =?utf-8?B?RHpLZVRoV0REQVpPQW51WjdVM1F5MEdlNVFtNVY5Z2Voc1NCY0dJWlB3Nm5E?=
 =?utf-8?B?VEpsMm0yT3BhR0dOR0NpMlhwS21KQ0U3M0JDSGpCTEt1N1ZZUm01OUxRR2RG?=
 =?utf-8?B?NlF5OEdabEM1VVFiUmUzblZTK3lYU0kzRXV5azNhQnhPQUJhTnFlcVBQUFFa?=
 =?utf-8?B?d3VQRHViUy9VTDByYnJmeDRiVTFlc0JZdkVRY25yQzZmNU1TL2RIUVlseEJN?=
 =?utf-8?B?dEUwdzRJWEtrRVRnMHZLZUc5Tjd1QmhhVmUzb2wwNzFDZ05IeFFob0pzMS9n?=
 =?utf-8?B?b1FDd04xTkVSbHJ5dC9HUm5ENTBlcVI5MVVYRHlrQjFjQjhMb0lHa3NqK0cz?=
 =?utf-8?B?eWd5NGhiSkF2Z2g5RFBYUkkwM2J3TjVONnBtUnIzRGlXUG9yTlJmS0VVL24w?=
 =?utf-8?B?L0QwZEM1cW5TQmdRaFh1dHlvZjZwQ0tSNDdldDlUVXNkVVg3OWR6U21SZ1pS?=
 =?utf-8?B?cnZLbUlrZE55VENvSllrVDdnRmN2QmFSU09LcDlzSFIra2tCaU1pRXBlSWdD?=
 =?utf-8?Q?LHsb/ZcHlL5TbVH4=3D?=
Content-ID: <5F0269E152CADF4C8C71ADE4C5A56618@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MMZPR09MB547520.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d973b8-f98e-40e1-5430-08df29f74807
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 13:30:15.1802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z6KIU5/AoHz9boGFvF/ainyx/9Udz+3hYPpZ0NGzuw7zVJ8/EAm+f324BOhOc6wKLeCHTzZOBuilJrSiSJj+YmHe7Wrpt8qtl9XR8GCvnRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI3PR09MB108268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_063021_366574_6EAB8D0E 
X-CRM114-Status: GOOD (  12.63  )
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

SGnCoFJvYiwNCg0KT24gOS8yMS8yNiAyMDoyMSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IE9uIE1v
biwgU2VwIDE0LCAyMDI2IGF0IDAzOjU1OjU0UE0gKzAyMDAsIEFsZWtzYSBQYXVub3ZpYyB3cm90
ZToNCj4+IERvY3VtZW50IHRoZSBNSVBTIFA4NzAwIEFDTElOVCBNVElNRVIuDQo+PiBFeHRlbmQg
c3VwcG9ydCBmb3IgYm90aCBtdGltZWNtcCBhbmQgbXRpbWUgcmVnaXN0ZXJzDQo+PiB3aXRoaW4g
dGhlIEFDTElOVCBNVElNRVIsIGlkZW50aWZpZWQgdmlhIHJlZy1uYW1lcy4NCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBBbGVrc2EgUGF1bm92aWMgPGFsZWtzYS5wYXVub3ZpY0BodGVjZ3JvdXAuY29t
Pg0KPj4gLS0tDQo+PiAgLi4uL2JpbmRpbmdzL3RpbWVyL3RoZWFkLGM5MDAtYWNsaW50LW10aW1l
ci55YW1sICAgfCA0MyArKysrKysrKysrKysrKysrKysrKy0tDQo+PiAgMSBmaWxlIGNoYW5nZWQs
IDM5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci90aGVhZCxjOTAwLWFjbGludC1t
dGltZXIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci90aGVh
ZCxjOTAwLWFjbGludC1tdGltZXIueWFtbA0KPj4gaW5kZXggY2Y3YzgyZTk4MGY2NzRhZmNmNTlm
YzcyNjc0MmRjNGY0OWMxYTgyMC4uMzVlMDJkYTY3NWJlY2IzYzhiYjE4N2I4ZTFlNjIzOTk0ZDUy
ZGY4YyAxMDA2NDQNCj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90
aW1lci90aGVhZCxjOTAwLWFjbGludC1tdGltZXIueWFtbA0KPj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3RoZWFkLGM5MDAtYWNsaW50LW10aW1lci55YW1s
DQo+PiBAQCAtMTcsMTggKzE3LDIwIEBAIHByb3BlcnRpZXM6DQo+PiAgICAgICAgICAgICAgICAt
IHNvcGhnbyxzZzIwNDItYWNsaW50LW10aW1lcg0KPj4gICAgICAgICAgICAgICAgLSBzb3BoZ28s
c2cyMDQ0LWFjbGludC1tdGltZXINCj4+ICAgICAgICAgICAgLSBjb25zdDogdGhlYWQsYzkwMC1h
Y2xpbnQtbXRpbWVyDQo+PiArICAgICAgLSBpdGVtczoNCj4+ICsgICAgICAgICAgLSBjb25zdDog
Z2YsbWlwcy1wODcwMC1hY2xpbnQtbXRpbWVyDQo+PiAgICAgICAgLSBpdGVtczoNCj4+ICAgICAg
ICAgICAgLSBlbnVtOg0KPj4gICAgICAgICAgICAgICAgLSBhbmxvZ2ljLGRyMXY5MC1hY2xpbnQt
bXRpbWVyDQo+PiAgICAgICAgICAgIC0gY29uc3Q6IG51Y2xlaSx1eDkwMC1hY2xpbnQtbXRpbWVy
DQo+Pg0KPj4gICAgcmVnOg0KPj4gLSAgICBpdGVtczoNCj4+IC0gICAgICAtIGRlc2NyaXB0aW9u
OiBNVElNRUNNUCBSZWdpc3RlcnMNCj4+ICsgICAgbWluSXRlbXM6IDENCj4+ICsgICAgbWF4SXRl
bXM6IDINCj4+DQo+PiAgICByZWctbmFtZXM6DQo+PiAtICAgIGl0ZW1zOg0KPj4gLSAgICAgIC0g
Y29uc3Q6IG10aW1lY21wDQo+PiArICAgIG1pbkl0ZW1zOiAxDQo+PiArICAgIG1heEl0ZW1zOiAy
DQo+Pg0KPj4gICAgaW50ZXJydXB0cy1leHRlbmRlZDoNCj4+ICAgICAgbWluSXRlbXM6IDENCj4+
IEBAIC00Miw2ICs0NCwyOCBAQCByZXF1aXJlZDoNCj4+ICAgIC0gcmVnLW5hbWVzDQo+PiAgICAt
IGludGVycnVwdHMtZXh0ZW5kZWQNCj4+DQo+PiArYWxsT2Y6DQo+PiArICAtIGlmOg0KPj4gKyAg
ICAgIHByb3BlcnRpZXM6DQo+PiArICAgICAgICBjb21wYXRpYmxlOg0KPj4gKyAgICAgICAgICBj
b250YWluczoNCj4+ICsgICAgICAgICAgICBjb25zdDogZ2YsbWlwcy1wODcwMC1hY2xpbnQtbXRp
bWVyDQo+PiArICAgIHRoZW46DQo+PiArICAgICAgcHJvcGVydGllczoNCj4+ICsgICAgICAgIHJl
ZzoNCj4+ICsgICAgICAgICAgbWluSXRlbXM6IDINCj4+ICsgICAgICAgIHJlZy1uYW1lczoNCj4+
ICsgICAgICAgICAgaXRlbXM6DQo+PiArICAgICAgICAgICAgLSBjb25zdDogbXRpbWUNCj4+ICsg
ICAgICAgICAgICAtIGNvbnN0OiBtdGltZWNtcA0KPiBOZXcgZW50cmllcyBnbyBhdCB0aGUgZW5k
LiBBbmQgdGhlbiB5b3UgY2FuIGRlZmluZSAnbXRpbWUnIGF0IHRoZSB0b3ANCj4gbGV2ZWwgd2l0
aCB0aGlzIGp1c3QgYmVpbmcgJ21pbkl0ZW1zOiAyJy4NClRoYW5rcywgd2lsbCBmaXggaW4gdjIh
DQoNCkJlc3QgcmVnYXJkcywNCkFsZWtzYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
