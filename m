Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6EE1073CA1
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 11:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jCaOs0SN95ukZpuUkT9YU2BNMmYKzxG1OGMISw2jH0k=; b=U/HzfaEHIgovPx
	J8JfKS2/+GIsrZFfvqBjn2tovD65He1DFE5/jQd/K+V/WJtLPDMbfXartuvpexVLKYK8b5FNdRcgI
	g+66C+q9osFPpb/C15QBCOTvPeeLyWU8YZNdgpXokAlshiGzaEOREON4PJWfVh5Ad5hEQfzyfL2Ha
	pKB6fkUtcAxK9+e7ls4ZL8Aw8v42oPERxkWnU7EZwTTbpPi3SX2cIwVFckQNhgycj2+8lOTeEL9OM
	TGTIbsJUE0sXdYp/OyTDF2Issw62+i1DfGc91A+ZmmpKL+bVFVMWUdmoxOUB3QHgJhuyfyCO3Jb9T
	0Njcgl+/l/7JtDiS58oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wARQX-00000008mXn-1qB1;
	Wed, 08 Apr 2026 11:50:33 +0000
Received: from mail-northeuropeazon11022142.outbound.protection.outlook.com ([52.101.66.142] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wARQU-00000008mXN-0X5o
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 11:50:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehDwL523Ahxy/dbIi7TITFOV3MsmBwXl5g25qGS2EJAKBRDaJA/MiTjH8RxHcizI1+BsANkOR1wgKA0bshC2zkZFD9ewzk0kz8A8w31s0dLmrOetLmMypaE0tPe9RorZfELxDfK1fdMD6mFuFxanTofS0LpW4C0jbgQsN9SHefFcQ0MlRsuEN9f0iKnfR0OGIFH4gSnr0r5DwsGZsA1c73rslWC0AJeEnNim+fYrlRR2y9kae1MaHTw1f72y6OhUBZDhiHHdvfuw5Lup2c0Tvk+/lvA9EmclpKgfO1RBmQdOfioUCvhyIHUsyaje/+vv26CyseRJrFulrNT8Ab5BNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djfveObSDSVsaV0zZuNJUVMt892G69TyJ0pdoA9Lb30=;
 b=RpraPC/UMPF3Zqpn5lbn/RKpOS3ZYCwCNIcJDVfrHHdT7oQoNBTTQ0VqyJiketjgEQIyDA7ll/OnpleUCCNO1hXPUNizM2J6LYn3esX9U9AdknE4ZB8R7q5olLCRYSbB1LZPeywZeaIOLRN8avADp+SKEFmmErRnwyahun2gPXvo2I5HJBbVovjU47fWHUgoNPII1bCR/p6P1GeWAeSCZiFYiOxIRo9B9kXnrerV4mXm+g+pbqB4TS7msnKvDMbe/2MI92Q5S30EXXl4YTPj5ITjkoJ1dM1uG62sByZ2XzLicXvG2qpLgij0OmxThYujmMWp+0VE4lr5fXJhC9PBhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djfveObSDSVsaV0zZuNJUVMt892G69TyJ0pdoA9Lb30=;
 b=klwd8T2ga+JHghv/5dv0b3GATzH88UygQtE2q91ejzk7eDxrIVaNQHVgFASeZXOBWMViO8BUw4m3wHMBIgj3Ly7V/B6RJemWABMB3wxOfCHrr5ionsY9bJHCDXUHjHm6i3iapD3VV1qzIOMYJAEafUwlLOBoXX8gmU21Ut3D63TtwkNv483qhPrS7U0J9AS74C6dfoXeJIySVyK9LyWM+5qXo00P9KxSLvMoWcMa0kjSuKhtIwGJJhSudqad7B1DxtbTc9mvAslRh5fCO5soeRYwzc3ZNSz8346Wo5f+tTRs8qYoOfnzNgvTrYUEy8ZSkKVqJEqnQPfRejcWRga/AA==
Received: from AS4PR09MB5681.eurprd09.prod.outlook.com (2603:10a6:20b:4fc::5)
 by AS8PR09MB5467.eurprd09.prod.outlook.com (2603:10a6:20b:37e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 11:50:23 +0000
Received: from AS4PR09MB5681.eurprd09.prod.outlook.com
 ([fe80::8d2b:5798:928f:9faa]) by AS4PR09MB5681.eurprd09.prod.outlook.com
 ([fe80::8d2b:5798:928f:9faa%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 11:50:22 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: Paul Walmsley <pjw@kernel.org>, Vladimir Kondratiev
	<vladimir.kondratiev@mobileye.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Will Deacon <will@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Mark
 Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, Yury Norov
	<yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	"cfu@wavecomp.com" <cfu@wavecomp.com>, "torvalds@linux-foundation.org"
	<torvalds@linux-foundation.org>, "olof@lixom.net" <olof@lixom.net>,
	"arikalo@gmail.com" <arikalo@gmail.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Support for Risc-V CPUs implementing LR/SC but not
 AMO
Thread-Topic: [PATCH v2 0/2] Support for Risc-V CPUs implementing LR/SC but
 not AMO
Thread-Index: AQHcihjN8PKOQ9FskEui2CIhQNXxcrVc8NYAgHiWswA=
Date: Wed, 8 Apr 2026 11:50:22 +0000
Message-ID: <e9cd5f28-4736-4257-8cb6-95353264d2ee@htecgroup.com>
References: <DFSQIY6WV4U7.3B3RY31KE739B@garyguo.net>
 <20260120-lrsc-only-v2-0-a522e640d27d@mobileye.com>
 <6201870b-b50d-f6e2-814b-7a1fdbf064db@kernel.org>
In-Reply-To: <6201870b-b50d-f6e2-814b-7a1fdbf064db@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR09MB5681:EE_|AS8PR09MB5467:EE_
x-ms-office365-filtering-correlation-id: 7f5469d7-705d-4da7-c82a-08de9565043f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: YgPseqC6CZKCyqkjaDIcvn89WyhHl1ht0evYOm5pHXp354O7MyS2kdvbvtz1fZpWog/JsUD8pqSPAg48ROIxRZZ/MSD4zop6tqhY62ql2lKPXOiX50hczFdeSaOh8CgH9XhHCCT1bU9KHIHanVOuS1TbX0BG2rY5GQfEBOhkupSvPg1I8SlVOsrMNQ67El2C5tMsWvBAuByVM63HKmqnByXWTsI2WEKjWLYNwAlDIBHf/ti3s7NTg9UXJ4Dym9G4vvfK8J+ZJpv/I4bj8KgOxngylIeMKjC9/JKvU37v/u3UBglaON+vPCYcP4QPxRiJgexqIYRcQ26sDgLmbutVJv1O0G1KkOTvll81/OohPL6ixyidw5CuCnoI5lncC5BelYVtNNmO6DZLgTxzMz7y4bpd7V9d8Y3VuxAlWczumstJBnV86DiCr/6BqjN6UQHpWjqCPxtxYzNodDwDoKjTLewtIsS1+p7WTKh02OzZX4Os/pwrKaXpyPDOLUNBe21LqBA9ZxrHiOdynocF6U0tM50EHysBJLRu4NQmjT+jL+ta8kW/1xTMwAQw7IcqQV49KOaTovpviFWCzn3R2wVIgA7XHiraVJR4tUAzUBDq4R3mXG9Qvx6ccFrFPJ0xH3SgkIjPsRGDJNqQsigOMoRvA1Fj1iu9J8JQQDhPSfK1lFleK4bowJH1CtwaqQSFujjqLlxPPXnsfxufk193ANN/4O6kNI0Z9ZiGASgXm7pxRGl6badf64qgnTPivTQGmS1u
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR09MB5681.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dW9scE4xRjF4VGZFQzNFeHBjcnlxVXJwYnFhSWQxT2FUcnpQZ1VjSHFBTUgy?=
 =?utf-8?B?OHVMSDNCNkpOclA1K2FkTlNkT1E1eHE1RmM5azM0dThJRGNIWVNwaWI5WnI1?=
 =?utf-8?B?enVUY2NtR3hkSFJSaTdLK3AxRXI1azN5MUpCdVlud3U4NWpNSjhZWWVNZjlv?=
 =?utf-8?B?TjFCOFoyTklaRkNnYUpNdDV0NUJCVFdaMFRBWVV5cmJ3WnluNnFGSUVWNmpV?=
 =?utf-8?B?aWRCak1IN09uR0VuL0k1NXc0aWtmZWNyMERIWkkvNG43dWhENGlKNzkzMFZk?=
 =?utf-8?B?LzJJK2FSK3liZzN4OE9VN2JiTGtEalNZeXNDZUlpa000QkdZMXFZK2lzNnVL?=
 =?utf-8?B?K0hpa0ZMYXB2Nk5iUjNueFZMMmUwSGVycWZyWVFFak1UNVBXWFhrcXNCUzF5?=
 =?utf-8?B?eExPdlRnU1ZMSDZUYk5yL0lCRUJiMElSNjcrbTlMUWdmVVg1TTJHbjJsWDZ0?=
 =?utf-8?B?R0tGUWZUT0p2OFFZOGE1VEV3bnM3dE9Rck5GcEFBckxXVEU3UDR4bEpRSFd6?=
 =?utf-8?B?dURCaVdNMFcxVnY4cUxzNkJWMGEybWRxZWM2YjVTcXo4S2ZkZFQxZVBOODU4?=
 =?utf-8?B?RzdhY2d5UFpJbG9PMGVWeG8xYkU5VlBCclhGNVRxRXhBZFlNOUtNZUF0Nnlh?=
 =?utf-8?B?eFJJSWxwYkYyV0s4RlVTa2xyVEJIV2doakxoci9sbVBRNTZwWUVKbWhDZVRF?=
 =?utf-8?B?ekNkMHo0SHE3akh6UUUwVzE0Z2I2T01VNzlmSDh5QVVWd01ETlZTZE1vQWpY?=
 =?utf-8?B?R0NwTG84dGhpMUFQTGM5M2hxbWZ1ZTBGcEZQcjNFZk4vYlJUbGJRdWZ2ZWNQ?=
 =?utf-8?B?SC9Tb3Q4VTV0dlFFcVMyVXNKT1RuWk1wdkRhZ2gvWERrYmlWMXZkQkliS2V5?=
 =?utf-8?B?RVptN3dNdWd1SFhXRG8wWVJKUk1vdVF0ZGwyZFhzeEpON1ExamFDMlJGUVlN?=
 =?utf-8?B?QytWeDJwNjVVK1A2bFB0bmljQmdHMENCK21wRHlkc3gwT2lUbkFWOG0zWUZP?=
 =?utf-8?B?U3NBbXZSMy9kbjhBQWFTZWRMOHorTWZneTlJOVVvNEt2TXZUaWRUc1ZkT2l0?=
 =?utf-8?B?UFpoWU00UkRMSllxSXZTSVJkNnhldS9YOEROdVZrcUFubVhWRWZvMzZGNDNo?=
 =?utf-8?B?U0hsNlBPUEFmZTA1ZVZoNnhZY0ZFRzk3VjB5QUtoUUgyanpkRWg0bTc0TEI5?=
 =?utf-8?B?Z2xLR0h5QlY5bHVYUk00b054eS93dmx4UGF5VGxJVDRSNEJsVUZEUEtYcE5D?=
 =?utf-8?B?eTJvY3BHRXpibFg5dS9OendzSWsyTEVZTUFyV21EY2tZa3R2cFd3OEk1UWhT?=
 =?utf-8?B?cWN5MGxkbWhxRit0RGVEMVJESmFsSTBqWHRXODJMam1JbzBYdEp1Wk5GRDJ1?=
 =?utf-8?B?eEVacytqN3RJanVudWlMMWlDQ1NxNTk0SFNYNFUvdkNBSktWTmd4ekw5V1Fu?=
 =?utf-8?B?M29sWk1CSVl6cEtwcmxrTkhSSHpKZDZua3NvZ2JWK2MxZjNqaHNycjQ2ZnBq?=
 =?utf-8?B?dUV1a2VtMkNRVHdUWjBraWtrWnNkeDZFalVjQi9KT3o2YlFJcml2VzFXVGlB?=
 =?utf-8?B?dHRMaFc4SDVlYlEwcm9mU0twYnU3REdtQmc1ZnR0VGFwUG5kcFBKNmVUZGlC?=
 =?utf-8?B?TXhKUUwrdlh0K1gvdHVXazliUElZUXArclFudFpCQ0dJTXNIcmdYQytuRVpn?=
 =?utf-8?B?TFUrM3dlalo4b2FTUDlXN3E0ci9HaXNaK0J1ZmNwclptZHdGME5iRUg3ZGtl?=
 =?utf-8?B?cFgwQUFxYTV6U3V0NjlxOXJDbXhJS0p3bXE5VXJEM210aUNIdkcyQVBpZFlz?=
 =?utf-8?B?MG5BTWgyV3l1ZGJENEwvS3F5MmtZanlBbTVwYWtYTy9PUDJlN3NuSFE4ZitC?=
 =?utf-8?B?V1FwaUVOUzR5a2IwU2ovYnlrU3YrbnBZTThxZmRLYjhyMU5FRk5LMXVBaFlS?=
 =?utf-8?B?UlZUNGZsYjNYMDl3Qk1Fc0JkTGVQWEI2dzNHSXdHOWhnTnl0Qy90TldiV1FT?=
 =?utf-8?B?R3R2YWx3eFdiVE9rNGRRWFJvK1M0amxTQUxaaW04b1N3S3BLYlAzN3dSQXY5?=
 =?utf-8?B?N0RwVFBuY3FZREtlSFJSZnBaTE5VaTA0MWpqU2hpb0RTT09BaXFwdDRMMUd5?=
 =?utf-8?B?MjJVa2dPZUtqOVpYYkxvR2dHTXJVSlJqZytabG9BZTg5T2ZOL2ZVZkw1V1BQ?=
 =?utf-8?B?NlRLTThtRlVTdXpNNUFMMG1mcmJwOWtzSFF1RC9LNDFOTEx2aGY0eDZXa1o2?=
 =?utf-8?B?bVVxQ2x3QndUMHl3Z1g3YXdnS2R2cVFQUXIxbXZYUG1iRkdBSXNOcXIxMFJv?=
 =?utf-8?B?MUtVMW9VaGZOMFVSMFJRcW43MlU2TjRWNXdUa1dsQnkxZlp3UWlNekFoS3BC?=
 =?utf-8?Q?a5kb+AxF/jWGY2CU=3D?=
Content-ID: <ECE8D5B5EC03364BA857AD08F8C25E13@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR09MB5681.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5469d7-705d-4da7-c82a-08de9565043f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 11:50:22.8587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZTSq3BdTjsHSXIvaL9l2bSlWxZH6eQRbYaHRl60qxKnzDyj9jTsfIBSsDMmIEvvCrQQqBQFZGJiTSi9+AkvsgviUxyx8gGeHP6hNzgpZJws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB5467
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_045030_206718_810CA2E4 
X-CRM114-Status: GOOD (  26.74  )
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

SGkgUGF1bCwNCg0KT24gMS8yMS8yNiAxOToxOSwgUGF1bCBXYWxtc2xleSB3cm90ZToNCj4gSGkg
VmxhZGltaXIsDQo+DQo+IE9uIFR1ZSwgMjAgSmFuIDIwMjYsIFZsYWRpbWlyIEtvbmRyYXRpZXYg
d3JvdGU6DQo+DQo+PiBQcmltYXJ5IGdvYWwgaXMgdG8gc3VwcG9ydCBNb2JpbGV5ZSBleWVxN2gg
YXV0b21vdGl2ZSBwbGF0Zm9ybQ0KPj4gYmFzZWQgb24gTUlQUyBQODcwMCBDUFUgWzFdIGhhdmlu
ZyBvbmx5ICJ6YWxyc2MiIElTQSBleHRlbnNpb24gYnV0DQo+PiBub3QgZnVsbCAiYSIuDQo+Pg0K
Pj4gU3VjaCBwbGF0Zm9ybXMgbmVlZCB1c2Vyc3BhY2UgdG8gYmUgY29tcGlsZWQgd2l0aCBjb3Jy
ZWN0DQo+PiAiLW1hcmNoIiBmbGFncyB0byBnZW5lcmF0ZSBwcm9wZXIgaW5zdHJ1Y3Rpb25zIGZv
ciB0aGUgYXRvbWljIHR5cGVzDQo+PiBzbyB0aGVyZSdzIG5vdCBmZWFzaWJsZSB0byB1c2UgdW5p
dmVyc2FsIHVzZXJzcGFjZSBmb3IgaXQuDQo+PiBUaHVzIHRoZXJlJ3Mgbm8gcG9pbnQgdG8gZG8g
c2FtZSBiaW5hcnkga2VybmVsIHN1aXRhYmxlIGZvciBib3RoDQo+PiAiZnVsbCBBIiBhbmQgIkxS
U0Mgb25seSIgcGxhdGZvcm0gdHlwZXMuIERvIGEgY29tcGlsZSB0aW1lDQo+PiBhbHRlcm5hdGl2
ZXMgYW5kIHJlcXVpcmUgQ09ORklHX05PTlBPUlRBQkxFIGZvciB0aGlzDQo+Pg0KPj4gWzFdIGh0
dHBzOi8vbWlwcy5jb20vcHJvZHVjdHMvaGFyZHdhcmUvcDg3MDAvDQo+Pg0KPj4gUGF0Y2ggMSBk
byBtb3N0IG9mIHdvcmsgdG8gcHJvdmlkZSBjb21waWxlLXRpbWUgTFIvU0MgYWx0ZXJuYXRpdmVz
DQo+PiAgICAgICAgIGZvciB0aGUgQU1PIGluc3RydWN0aW9ucw0KPj4gUGF0Y2ggMiBhZGp1c3Qg
dGVzdHMgZm9yIHJlcG9ydGVkIENQVSBleHRlbnNpb25zIGNvbXBhdGliaWxpdHkgd2l0aA0KPj4g
ICAgICAgICB0aGUgY29kZQ0KPj4NCj4+IENoYW5nZXMgaW4gdjI6IHN3aXRjaCBmcm9tIGR5bmFt
aWMgYXRvbWljIGZsYXZvciByZXNvbHV0aW9uIHRvDQo+PiBjb21waWxlLXRpbWUgb25lLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IFZsYWRpbWlyIEtvbmRyYXRpZXYgPHZsYWRpbWlyLmtvbmRyYXRp
ZXZAbW9iaWxleWUuY29tPg0KPiBUaGFua3MgZm9yIHVwZGF0aW5nIHRoZSBwYXRjaGVzIHNvIHF1
aWNrbHkgdG8gZGVhbCB3aXRoIEdhcnkncyBjb21tZW50cy4gSQ0KPiB0aGluayB3ZSBzaG91bGQg
aG9sZCBvZmYgb24gbWVyZ2luZyB0aGVtIHVudGlsIGNvbW1vbiB1c2Vyc3BhY2UgcHJvdmlkZXJz
DQo+IChsaWtlIExpbnV4IGRpc3RyaWJ1dGlvbnMpIG9yIGRpc3RyaWJ1dGlvbiBidWlsZGVycyAo
bGlrZSBPRS9Zb2N0byBvcg0KPiBCdWlsZHJvb3QpIG1lcmdlIHN1cHBvcnQgZm9yIHRoaXMgY29u
ZmlndXJhdGlvbiwgYWxvbmcgd2l0aCB1bmRlcmx5aW5nDQo+IHByb2plY3RzIGxpa2UgZ2xpYmMu
ICBUaGF0IHdheSwgdGhlIHJlc3Qgb2YgdXMgaGF2ZSBhIHdheSB0byB0ZXN0IG91cg0KPiBwYXRj
aGVzIG9uIHRoaXMgdW51c3VhbCBjb25maWd1cmF0aW9uIGJlZm9yZSBzZW5kaW5nIHRoZW0gdG8g
dGhlIGxpc3QsIG9yDQo+IHNlbmRpbmcgUFJzIHVwc3RyZWFtLiAgSXQgc2hvdWxkIGJlIHN0cmFp
Z2h0Zm9yd2FyZCB0byBnZXQgdGhlIFphbHJzYy1vbmx5DQo+IHVzZXJzcGFjZSBzdXBwb3J0IHBh
dGNoZXMgdGVzdGVkIG9uIGV4aXN0aW5nIFJJU0MtViBMaW51eCBoYXJkd2FyZSwgc2luY2UNCj4g
aXQgc3VwcG9ydHMgYSBzdXBlcnNldCBvZiB0aGlzIGJlaGF2aW9yLiAgSSBndWVzcyB0aGUgb25s
eSBxdWVzdGlvbiBpcw0KPiB3aGV0aGVyIG90aGVyIHByb2plY3RzIGFyZSBpbnRlcmVzdGVkIGlu
IGNvbW1pdHRpbmcgdG8gY2FycnlpbmcgZm9yd2FyZA0KPiB0aGUgbmVjZXNzYXJ5IGNoYW5nZXMu
DQoNClphYW1vIGluc3RydWN0aW9ucyBhcmUgZW11bGF0ZWQgb24gdGhlIFNCSSBsZXZlbCwgc28g
dGVzdGluZyBhbnkgZnV0dXJlIHBhdGNoZXMNCm9uIHRoaXMgY29uZmlndXJhdGlvbiBzaG91bGRu
J3QgYmUgYW4gaXNzdWUuIFdlIGhhdmUgYmVlbiB1c2luZyB1c2Vyc3BhY2VzDQp3aXRoIGxpYnJh
cmllcyBjb21waWxlZCB3aXRoIHVwc3RyZWFtIEdDQyByZWxlYXNlcyBmb3IgYSB3aGlsZSBub3cu
wqDCoA0KDQpPZiBjb3Vyc2UsIGEgWmFscnNjLW9ubHkgdXNlcnNwYWNlIHdvdWxkIHByb2JhYmx5
IHdvcmsgZmFzdGVyIG9uIHRoZSBQODcwMC4NCg0KPiBJdCBhbHNvIHdvdWxkIGJlIGdvb2QgdG8g
c2VlIHB1YmxpY2x5IGF2YWlsYWJsZSBNSVBTIFA4NzAwIGJvYXJkcyBiZWluZw0KPiB1c2VkIG9u
IGFuIG9uZ29pbmcgYmFzaXMgYnkgYXQgbGVhc3Qgb25lIGFjdGl2ZSBwYXJ0aWNpcGFudCBvbiB0
aGlzIGxpc3QsDQo+IHdobyBjYW4gcG9zdCBUZXN0ZWQtYnk6cyBmb3Iga2V5IHNlcmllcyBhbmQg
d2hvIGNhbiBwb3N0IHJldmlldyBmZWVkYmFjaw0KPiBhbmQgUmV2aWV3ZWQtYnk6cyBmb3Igb3Ro
ZXIgUklTQy1WIHBhdGNoIHNlcmllcy4gIFRoYXQgd2F5LCB3ZSdkIGhhdmUgbW9yZQ0KPiBjb25m
aWRlbmNlIHRoYXQgdGhlcmUgYWN0dWFsbHkgaXMgYW4gb25nb2luZyB1c2VyIHBvcHVsYXRpb24g
Zm9yIHRoaXMNCj4gYm9hcmQgd2hvIGNhcmVzIGFib3V0IHVwc3RyZWFtLiAgVGhpcyBpcyBwYXJ0
aWN1bGFybHkgaW1wb3J0YW50IGZvciBmb2xrcw0KPiB3aG8gY2FyZSBhYm91dCB0aGVzZSBNSVBT
IFA4NzAwIGNvcmVzLCB3aGljaCBkb24ndCBzZWVtIHRvIGJlIGENCj4gZnJvbS1zY3JhdGNoIGRl
c2lnbiBmb3IgUklTQy1WLCBhbmQgd2hpY2ggZG9uJ3QgaGF2ZSBBTU8gc3VwcG9ydCBsaWtlIGFs
bA0KPiBvZiB0aGUgb3RoZXIgY29yZXMgd2Ugc3VwcG9ydC4gIChGb3Igd2hhdCBpdCdzIHdvcnRo
LCB3ZSdyZSB0cnlpbmcgdG8NCj4gZm9zdGVyIHRoaXMgZW5nYWdlbWVudCBmb3Igb3RoZXIgY29y
ZSBtaWNyb2FyY2hpdGVjdHVyZXMgYXMgd2VsbDsgdGhhbmtzDQo+IEpvZWwgU3RhbmxleSBvZiBU
ZW5zVG9ycmVudCwgQW5kcmV3IEpvbmVzIGFuZCBBbnVwIFBhdGVsIG9mDQo+IFZlbnRhbmEvUXVh
bGNvbW0sIGFuZCBBbmRyZWFzIEtvcmIgb2YgRnJhdW5ob2ZlciB3b3JraW5nIG9uIHRoZSBDb3Jl
LVYNCj4gZGVzaWducyBmb3Igc2hvd2luZyBob3cgdGhpcyBpcyBkb25lLikNCg0KV2UgdGVzdGVk
IHRoZSBzZXJpZXMgb24gYW4gZWlnaHQtY29yZSBRRU1VIGNvbmZpZ3VyYXRpb24gYW5kIHRoZSBC
b3N0b24gYm9hcmQgd2l0aCBhIHNpbmdsZS1jb3JlIE1JUFMgUDg3MDAgQ1BVLsKgDQpNb3N0IG9m
IHRoZSB0ZXN0aW5nIHdhcyBkb25lIHVzaW5nIGtzZWxmdGVzdHMgKGZ1dGV4LCByc2VxLCBwdHJh
Y2UsIGFuZCBsb2NraW5nKS7CoA0KV2UgYWxzbyByYW4gYW4gb3Zlcm5pZ2h0IGxvY2t0b3J0dXJl
IHRlc3Qgb24gdGhlIGJvYXJkLCB3aGljaCBjb21wbGV0ZWQgd2l0aG91dCBhbnkgaXNzdWVzLiBJ
IHNob3VsZA0Kbm90ZSB0aGF0IHRoZSBrZXJuZWwgd2UgdXNlZCBmb3IgbG9ja3RvcnR1cmUgdGVz
dGluZyBvbiB0aGUgYm9hcmQgd2FzIG5vbi1wcmVlbXB0aXZlLiBJIGFsc28gcmFuIGENCmJyaWVm
IHJjdXRvcnR1cmUgdGVzdCBvbiBRRU1VIChhIGZldyBob3Vycykgd2hpY2ggc2hvd2VkIG5vIGlz
c3Vlcy7CoA0KDQpUaGUga2VybmVsIHdhcyBjb21waWxlZCB3aXRoIEdDQyAxNS4xLjAsIHVzaW5n
IEdOVSBCaW51dGlscyB2ZXJzaW9uIDIuNDUuwqANCg0KQmVzdCByZWdhcmRzLA0KQWxla3NhIFBh
dW5vdmljCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
