Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859EECA100C
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 23:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aTJH7MenkCQqoHOI6I+ko8Rj9fOJ8CGerx4IFLx3FiE=; b=ZNeZai6LOun59w
	UPD7gkiOrqlwBSjUWdqt5TRABELfw+d4ZN6wFBko2FL0+zhspYMePWbgKK/+mU2RSwa7cDAc3SMPN
	x8aOEhU35x+dHcg5Qu38gHqHDaa+1dlEM8nK0t+4FGHU30/aAFesErRCvUSFoieMQpWUi3eCo++WE
	OlkoUHz67Q/k4SAWlwKgl+6G4y0Ym/awq7dm4A1St/UwMEBvy2qKhJ7jpSUcVJHEKbFIlsmC4ad3P
	9yRLpmdIh0UO/rsB8qzHNkfTO+83gc6LcPbjt/0fksfUgMFq87b3y9fzOXW2dnXhd/VjMRl2SBeDV
	vkCCMwOqt9fQB/YKuS9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDgy-0000000EDrh-09Z2;
	Mon, 01 Sep 2025 23:12:04 +0000
Received: from mail-mw2nam10on20608.outbound.protection.outlook.com ([2a01:111:f403:2412::608] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6SM-0000000D5o0-2LEk
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 15:28:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v51dFgkkq980vg5Ee3ePniz/orN9kmGwkbmwH63heIoFZgPK8u9r6sEdjq3++Brzj1eMwR2IpGRRXL1wuhTZhFlzyOiB0qfi+Ev2pmVsMuysq5gNHxYyb8C9G+uhjzKWoMKrScqZZLtZzOCM2GwQezel93ijm8hWy7AaoZOeSwtezD5rIM//L5+/QZJYhVBz+Si77quH1QEiVq6Vn/DQ6lbiA5msQrluUlfqtZnXNTqR2oKtszmL61Qwwm5IRuSpHyAbNuwV0dU/rdUoAiMGeH78rCDJCYkdjbeX8hhndPYb1FlUWTMF3x7M0Z6hWhK4MABfPGqJF0+HcUuG1BrnwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtoAS/zksehuwGPxmCEira71C3k5M7idrNq5u716AZw=;
 b=Z1navI6jd3TU6gYQoaLy35IeXsQwieCIrAF4MCPQ7AviVq/123x+fN8mJ0LOXMmTfThv38X1Ul1aM2xxDD18KbFfL9qjRzSaomRF4VMyw2Pw0zaW53xLqdJGK2wkGS3M94NK78+8wjJX1C086m8BR8f6diOKR1DZkKKJKkRYszufVMHQ8bze1GJI81HRfAbaawb0/X4SFRuRtNwL6ZaaA7DnUynY455O52UAqAwtDOCWdDnYY0nHFUOT1Ra7MnvTQx+3fVBqzO/pluPXKq3rZ03ABbR2BrRKfM1A4BAFoCXllJSWZIZX4pH944R+DbBrF43p5WQ7zoWaMkTRoXYWkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtoAS/zksehuwGPxmCEira71C3k5M7idrNq5u716AZw=;
 b=OQVBkv8qYvh/Wa8ujWPKaIhzeCY0iKaLah0kD1rBL+k1C1y19A/0ZBauaRI6O6QHkDVt999Mo8OM2UrdrnRpoX1d+TeQSX4OfaIUOKikTqnzOzWyOBUEf7k5jjPtk5QlZtpM8Nkl5+pU44JcWQE84MpUoecXexkI2rZ3XXkarEse/hkvIGbkEcWBENr8XkDECRf5K6CMdL9h2LmRN6p9wk9RzjE3dhEU9xsKFu4EfHTYdTwsKs82QExLFzwYTri19UoNmWddXBJyTKEBIzOVd3jKgoQRlsb7DqUz2D32lyBFMheMJKd35YhxGa1FX/kh0aAUmHg7x8Vw1hLai4CELQ==
Received: from DS0PR11MB8739.namprd11.prod.outlook.com (2603:10b6:8:1bb::19)
 by CO1PR11MB5041.namprd11.prod.outlook.com (2603:10b6:303:90::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 15:28:23 +0000
Received: from DS0PR11MB8739.namprd11.prod.outlook.com
 ([fe80::f0f:4a3f:e3a3:d3ad]) by DS0PR11MB8739.namprd11.prod.outlook.com
 ([fe80::f0f:4a3f:e3a3:d3ad%5]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 15:28:23 +0000
From: <Valentina.FernandezAlanis@microchip.com>
To: <krzk@kernel.org>, <Conor.Dooley@microchip.com>,
	<Daire.McNamara@microchip.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<Valentina.FernandezAlanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v1 5/5] riscv: dts: microchip: add a device tree for
 Discovery Kit
Thread-Topic: [PATCH v1 5/5] riscv: dts: microchip: add a device tree for
 Discovery Kit
Thread-Index: AQHcFdxZ+gegSJP6cUq8DodaBl6a1LR4W8SAgAYinQA=
Date: Mon, 1 Sep 2025 15:28:22 +0000
Message-ID: <bb5b0d71-41b1-48a0-82fc-bdb362cc3db1@microchip.com>
References: <20250825161952.3902672-1-valentina.fernandezalanis@microchip.com>
 <20250825161952.3902672-6-valentina.fernandezalanis@microchip.com>
 <2b1eb8fd-2a64-4745-ad93-abc53d240b69@kernel.org>
In-Reply-To: <2b1eb8fd-2a64-4745-ad93-abc53d240b69@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8739:EE_|CO1PR11MB5041:EE_
x-ms-office365-filtering-correlation-id: 36e235e2-cd79-4d95-3d54-08dde96c3021
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?NXdYdU1MTzI4dHUzb2ZUVTZZNzBrYWZoTHVnZzdQNTd6VmhTalhGK1dmT3Yy?=
 =?utf-8?B?a1ppRittVDRvL0V6VGVHcGwwSENtUWdIM0tMN3czNXpiY0UxcjFuclQyenhh?=
 =?utf-8?B?NFFESXhoMSt3ZmFYS3htYWxTelRQSE03WmdTRWFFcXpIcWwxR2lXKzVjNWE4?=
 =?utf-8?B?ZGRPb21IT0JLN1FyTG41b2VqZ0syVngwY1dIeW16WGthQlNEZnpKK3JQbWMx?=
 =?utf-8?B?QS9SL3ZaNHZUbC9BdTR4NlVFck1uaFhRRHlTdkR3L2lRZUNyUXhjSjNCYlFn?=
 =?utf-8?B?amowYmRZZk1nR1FUcU4zTGtCWWVZTnAxOElYNkhDU0Q0UkczazhKQkhNaVZV?=
 =?utf-8?B?U21ac0RvMHJJYUJySVUwYWRJTGJaZXJrS1luQTVaVng2b0RHcTBINVl5SWJ6?=
 =?utf-8?B?cCtJSkRrQzFuVzJhOExDaGtKRWRJVlNicU50UjFQSk5SLy9aZlFraWNtWmNx?=
 =?utf-8?B?L3AwUGNVeXEwRlVUUG1rV2x2K3hIaVMxMGhtVktYR1ArL0E2RUlrNys1Wnpy?=
 =?utf-8?B?eUVmUlpLWkVwMlJSUGpGTUVCVWhnd0ZVa0tTcThKeGhockd0NHVzWFBtMm96?=
 =?utf-8?B?SHRKN3RvdTlxZk92UVZ6MnBpRGRMZDVMTlhZNHNMSWhaRG5mTU85cDNvTXZx?=
 =?utf-8?B?eHdyY1QxbmFkell6M0UrZE1RYTh3eSt1V3cweE9rSzA5OHRXTDVXcXhYS3hz?=
 =?utf-8?B?aVpxTjNLVUQrVmM0OWdlQzNNTVdycUY4K2RrV1N1WSs5Y1dKa1ZpWkZ0NmQw?=
 =?utf-8?B?empjdklYT2c2VXYySG1mTXd4WitRaFZ4MFp0amhuSjFpamFFeWhhWUVuT2JJ?=
 =?utf-8?B?eXdLTDBZaWhoVnpDSUxnNlVDOXB5ZzFBR003OE0yTEVVZDJ6Kzk4T3FhcTMz?=
 =?utf-8?B?VFdqUkt0UkVYSEdPcUNKTjhTWVFUVDdqY1dGcjRkaW14TkFTZnpDR0VxaDVY?=
 =?utf-8?B?UG43dTV5WHJMeHJ3aVd3M0lablJQQmJwY2N5WG1Vdyt3TDNKZG9hak5hcXo5?=
 =?utf-8?B?aE9KUkdLZ2Q0Vy9pOUxIMEgyZ1F6SWs4ZmIyMmJpMDF5VXdXb0pLektFWWla?=
 =?utf-8?B?OWVWb3RRQWxsWXZpdlFQdFlBUXVNYy9EZ1ltVHYxWFZkWm01VFFhYnZEYUpV?=
 =?utf-8?B?bWtiOE5DQnNZUURrVEZ6eVZNam5oeGFhMUR2dEdNamdCUlczVkc1UldzM1Nt?=
 =?utf-8?B?Tnp6OTZtaTRyb0NSNm9XOFFqVEJSSWZIQ3AzQUhQVlc2U20rUk9DQXdzQXVJ?=
 =?utf-8?B?cG9IUnQ5RWdtUk1EZHhqaTVqYlhiazZVOEFKZTFwQjk1em9nWnZaSGNyTnJE?=
 =?utf-8?B?UUpRdjRNU1diNUJBeXk4UitKTXZrcnhPYzRJTDB3Y2pBTHJrUFc3UVhlZ053?=
 =?utf-8?B?Uk5LZHBEcjAwUWc5UXE1NWcveUMxdWNVeE5JMnJLa0JOREJ1dW03TktjdjI2?=
 =?utf-8?B?SzBVZFc4aXpQdTgvSG1KSDlXRDBucHVuNzFNNUxQTFQ2bEQzcm5JUVJlbGE2?=
 =?utf-8?B?R3JpbExtTnJ2VktRUCthUDJWb0xxZXM5SkJLL2ZKVXlrOXY4VjZvayt1VWZs?=
 =?utf-8?B?ZWphU2RwdXFFUktpbWlsZUNVYkFuWmcyT2pTVE5XbWc0NDh5emxXeVlPdkto?=
 =?utf-8?B?R1BWVC84YnJsei9CY01XYnpWR1lFNDBYdk1JVE80WkhiNFJ5TEFJSFNnU2pw?=
 =?utf-8?B?STZNU1NnK1M4bnFFcEFOQS9nRXBONlhacms3NHJvWEdjVVFXakNrZDdiRmYy?=
 =?utf-8?B?S0llVEpMeTNYdXN6TW5DQTkwTTlJMWNZQTNBOGd6cXZybFlINUV2U0FoLzE3?=
 =?utf-8?B?ZGMza0NGZTV3UER4eHVzWXJISkpvSU9XZ01OUlUrK01GR3B0azBoMjlLejdZ?=
 =?utf-8?B?bVZrYlJwb3NLRGhjZ3ZaZ05YVjYvbHMyS0V6enlMUzcwUzcremdLV0E3NTdh?=
 =?utf-8?Q?iDTHR2dLLQo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8739.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amRJanprK0o3M1N0QUU0NHA5SGNuVUVHOEZuU2tHaTN2VG1mL2wrWDdSY0hJ?=
 =?utf-8?B?ejR3aTRFdlZqSnM2cVFjK3JzdStyM2MrZkpnMjZTbEJJNGlnbnpXMkd3RzQw?=
 =?utf-8?B?TGNvWGhUd2g2ejdHYXdSejZvUHdWOU0rQnNoK21sQk1sYVdwd254UGdOZnFJ?=
 =?utf-8?B?bHVsYURXTWtaRVRWZGpZOUVvdVp3RFp6Zm1qVUYwRWN1UGVXUSs5YVZWa05t?=
 =?utf-8?B?MTlnaW9tU1NRL2NhVGRRR28zdWIyZXBCR3M3cnc1cTR3R24wUDkrNnZheXk0?=
 =?utf-8?B?djlWSHI5ajVEb0l4MnhaN0JMWTc3eTdPWDR1MzJqMjNGZDcxSkxzcCtabEhV?=
 =?utf-8?B?VmNPYnRZSTlCalZObWZEbmxZS2tHWlZRMDJuZ29VZ2R5bjVZdUNBWWxxWG9M?=
 =?utf-8?B?ZG1NT3NhMmpDYkEzeWxtaTF5Z0VVb2FJR0o3Q281RnpSaFpYSUtXOE1PUVBP?=
 =?utf-8?B?TmJUanphaWVEUFJ4NkxjcGNQSEhhNDFhNDNUazBnUjFMaFNjL3BqOVBPV3U1?=
 =?utf-8?B?aWF5V3dLbjJpUGNtcXVUeGVnL3F6MllwUmlVTGJYV2lFYlV2emdJbm9iSHFz?=
 =?utf-8?B?NllaZ2d2MDlCUGI1MmU1L2NCQjBsSGtBNVNEd0ZwQ3hiUlo0MUQ5NVpZak1H?=
 =?utf-8?B?TnhISzRQQ0o4MDJtSEJIY1JnNU95dmZrWGhwaTFuZlIyUFg2NVRFcFp3MS9n?=
 =?utf-8?B?dE9NRU9raFM2aWdwWWM2UUg2ZDl4QU52bzF2blJIcC9meHpjT2VUNE9LSGlR?=
 =?utf-8?B?Q04wZzNxbXB5Ynl5UHJlcTc0aFJtdVFObndiaTAxVTArc0RMbW5xNk1sVUxV?=
 =?utf-8?B?QWtTMENLdzU3U2hxRnFvYlJrS1VORGVoVjVOaFkwMXhjRVFZVTNWRzZUK3cx?=
 =?utf-8?B?SmZVUDhLd0QrSjFMVzNCZHlIa3NRSzg2VlRaUThiczUxK2hmR2s5S1M1aFEr?=
 =?utf-8?B?TW5kdGtOYkNlTlpDRzdxVlFvTzNqL3BTVE04ZnJuay9qL3VHOVpJYlNnRENU?=
 =?utf-8?B?NHJqSWNRYWxsMyttRHlpMS9zNW15OVlRMGx2bnlCMlpITGhxaUdnVUJnTUU1?=
 =?utf-8?B?d08wOGw4R2lqR3FPT1VSWWE5UkF0bk1Xd0xhRE83dlptOFdQbU51Q2lnWFVE?=
 =?utf-8?B?TVhmdll5OU1LcFlRVlZJVVJRUDEySllSNVNsQVBHZXlGekJISUNPZkFwdkhM?=
 =?utf-8?B?aVRrQzlNUFpwdUZsTEJtNTRHbFQybzRJdkE2QzRpckhjZWdzdk55SUVmNG1M?=
 =?utf-8?B?SXpBeHhqRzNwZ0t3eVBENzhWSm40THJQSUVldTM4Rk5GT0tkbnZzcmxFc0ZY?=
 =?utf-8?B?cFR0MHc0Umt6NlVsZm5YWHVaVytESWhJTjNLY1kydkN1cFBWM3VtV29lWG1Y?=
 =?utf-8?B?cEk3Rjc5aVFCUlJ4LzcwSWp6N3g5TUNFd2dSa1g5bStRdjM0Q0pKUnF0V3B6?=
 =?utf-8?B?ZWRHRzdWamQ5UGMzZ0lNK3JUUy96WllIVU1mN0lWNmZCc1ZqVnpNMHQySkZU?=
 =?utf-8?B?bU1lbWU2L3BEWEpENXp6YzlGa0NLeFN1OHg3UWsvYm5QOG9UVS9YUlhzaENo?=
 =?utf-8?B?UjM2aWIyeWlFcnAwSWxhNDNtNkhLQUJ6alErcm5LUmd4dDFrN1R0M2hPUDBk?=
 =?utf-8?B?V3FrWGwwL2JlWDdRZnlFVFRiSkR6MHZ3MytoUzdoc2RVbDNTRHNSeDRLMnAv?=
 =?utf-8?B?RXVmZVMzcnpnYlc3cXRIOU1lNnBqVzlyQ1dmOHRHa21ZbGFMOTlIZzNtY3k2?=
 =?utf-8?B?OEhQUTM2VzZ2TE1TR3hrYU52cE1wMFA2cXJwTThraG1lM25IdTVRRXhEWCtU?=
 =?utf-8?B?bm5KNDI1VEo0bUJBQ1hRS1lYVWhTMnhrNDFqeVdvUDdhRG1TallwZXJKQ0sx?=
 =?utf-8?B?L3ptREQxd09JTlRPQUEwRlBFM3ZjSHFEeGhnYlVYNUJHcnNmY2VMczJWUkpv?=
 =?utf-8?B?bVorN3RhTytuV2VEbC9wV2NjR25tdUp0WUViVUJuaXlnTEVDUVBvWlc5OGFo?=
 =?utf-8?B?bXVhWCt3NGtOai9kZkhQSWRWYjM4V1BuSXJPQVJ6bk5ueUJaa1V6Q2l5cFdR?=
 =?utf-8?B?a3B0MVVpWWprc2QyVlFuWDNnL245TFIrWFhkV1RyNkY2NGJlWlF6QWZMVWJa?=
 =?utf-8?B?K2YxeXBwbnE2TzJOdWdyWGIxb3ZuYmlkajVOSldXUnZOcVFTYmNMZk9BNjFF?=
 =?utf-8?Q?bljKwIyhh2wTo6lxQrvOS5c=3D?=
Content-ID: <6EDC2666C8BE1541A4635CF379B587FA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8739.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e235e2-cd79-4d95-3d54-08dde96c3021
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 15:28:22.9353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XgT7sE4vL3XHSIHhyi4Tvs/PfJoYUVoWZVgL2y5R5hgAHdM6+W3aaC34hgylHB8pS3KRCETqAuT07/Ynoy77QnHEM4HiDovob1aAClSVeiy4DjxY+e1xsBMo6kTmglab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_082831_181485_480EBB77 
X-CRM114-Status: GOOD (  16.45  )
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

On 28/08/2025 18:46, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 25/08/2025 18:19, Valentina Fernandez wrote:
>> +++ b/arch/riscv/boot/dts/microchip/mpfs-disco-kit-fabric.dtsi
>> @@ -0,0 +1,58 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/* Copyright (c) 2020-2025 Microchip Technology Inc */
>> +
>> +/ {
>> +     core_pwm0: pwm@40000000 {
>> +             compatible = "microchip,corepwm-rtl-v4";
>> +             reg = <0x0 0x40000000 0x0 0xF0>;
>> +             microchip,sync-update-mask = /bits/ 32 <0>;
>> +             #pwm-cells = <3>;
>> +             clocks = <&ccc_sw CLK_CCC_PLL0_OUT3>;
>> +             status = "disabled";
>> +     };
>> +
>> +     i2c2: i2c@40000200 {
>> +             compatible = "microchip,corei2c-rtl-v7";
>> +             reg = <0x0 0x40000200 0x0 0x100>;
>> +             #address-cells = <1>;
>> +             #size-cells = <0>;
>> +             clocks = <&ccc_sw CLK_CCC_PLL0_OUT3>;
>> +             interrupt-parent = <&plic>;
>> +             interrupts = <122>;
>> +             clock-frequency = <100000>;
>> +             status = "disabled";
>> +     };
>> +
>> +     ihc: mailbox {
>> +             compatible = "microchip,sbi-ipc";
>> +             interrupt-parent = <&plic>;
>> +             interrupts = <180>, <179>, <178>, <177>;
>> +             interrupt-names = "hart-1", "hart-2", "hart-3", "hart-4";
>> +             #mbox-cells = <1>;
>> +             status = "disabled";
>> +     };
>> +
>> +     mailbox@50000000 {
>> +             compatible = "microchip,miv-ihc-rtl-v2";
>> +             microchip,ihc-chan-disabled-mask = /bits/ 16 <0>;
> 
> Does not look like following DTS coding style - order of properties.
> 
>> +             reg = <0x0 0x50000000 0x0 0x1c000>;
>> +             interrupt-parent = <&plic>;
>> +             interrupts = <180>, <179>, <178>, <177>;
>> +             interrupt-names = "hart-1", "hart-2", "hart-3", "hart-4";
>> +             #mbox-cells = <1>;
>> +             status = "disabled";
>> +     };
>> +
>> +     refclk_ccc: cccrefclk {
> 
> Please use name for all fixed clocks which matches current format
> recommendation: 'clock-<freq>' (see also the pattern in the binding for
> any other options).
> 
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml
The fabric dtsi describes elements configured by the FPGA bitstream. 
This node is named as such because the Clock Conditioner Circuit CCC's 
reference clock source is set by the FPGA bitstream, while its frequency 
is determined by an on-board oscillator.

Hope this clarifies the rationale behind the node name.

Thanks,
Valentina

> 
> Or anything more reasonable than just bunch of letters.
> 
>> +             compatible = "fixed-clock";
>> +             #clock-cells = <0>;
> 
> 
>> +     };
>> +};
>> +
>> +&ccc_sw {
>> +     clocks = <&refclk_ccc>, <&refclk_ccc>, <&refclk_ccc>, <&refclk_ccc>,
>> +              <&refclk_ccc>, <&refclk_ccc>;
>> +     clock-names = "pll0_ref0", "pll0_ref1", "pll1_ref0", "pll1_ref1",
>> +                   "dll0_ref", "dll1_ref";
>> +     status = "okay";
>> +};
>> diff --git a/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts
>> new file mode 100644
>> index 000000000000..742369470ab0
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts
>> @@ -0,0 +1,191 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/* Copyright (c) 2020-2025 Microchip Technology Inc */
>> +
>> +/dts-v1/;
>> +
>> +#include "mpfs.dtsi"
>> +#include "mpfs-disco-kit-fabric.dtsi"
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/leds/common.h>
>> +
>> +/ {
>> +     model = "Microchip PolarFire-SoC Discovery Kit";
>> +     compatible = "microchip,mpfs-disco-kit-reference-rtl-v2507",
>> +                  "microchip,mpfs-disco-kit",
>> +                  "microchip,mpfs";
>> +
>> +     aliases {
>> +             ethernet0 = &mac0;
>> +             serial4 = &mmuart4;
>> +     };
>> +
>> +     chosen {
>> +             stdout-path = "serial4:115200n8";
>> +     };
>> +
>> +     leds {
>> +             compatible = "gpio-leds";
>> +
>> +             led-1 {
>> +                     gpios = <&gpio2 17 GPIO_ACTIVE_HIGH>;
>> +                     color = <LED_COLOR_ID_AMBER>;
>> +                     label = "led1";
>> +             };
>> +
>> +             led-2 {
>> +                     gpios = <&gpio2 18 GPIO_ACTIVE_HIGH>;
>> +                     color = <LED_COLOR_ID_RED>;
>> +                     label = "led2";
>> +             };
>> +
>> +             led-3 {
>> +                     gpios = <&gpio2 19 GPIO_ACTIVE_HIGH>;
>> +                     color = <LED_COLOR_ID_AMBER>;
>> +                     label = "led3";
>> +             };
>> +
>> +             led-4 {
>> +                     gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
>> +                     color = <LED_COLOR_ID_RED>;
>> +                     label = "led4";
>> +             };
>> +
>> +             led-5 {
>> +                     gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>;
>> +                     color = <LED_COLOR_ID_AMBER>;
>> +                     label = "led5";
>> +             };
>> +
>> +             led-6 {
>> +                     gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
>> +                     color = <LED_COLOR_ID_RED>;
>> +                     label = "led6";
>> +             };
>> +
>> +             led-7 {
>> +                     gpios = <&gpio2 23 GPIO_ACTIVE_HIGH>;
>> +                     color = <LED_COLOR_ID_AMBER>;
>> +                     label = "led7";
>> +             };
>> +
>> +             led-8 {
>> +                     gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
>> +                     color = <LED_COLOR_ID_RED>;
>> +                     label = "led8";
>> +             };
>> +     };
>> +
>> +     ddrc_cache_lo: memory@80000000 {
>> +             device_type = "memory";
>> +             reg = <0x0 0x80000000 0x0 0x40000000>;
>> +             status = "okay";
> 
> Why? Did you disable it anywhere?
> 
>> +     };
>> +
>> +     reserved-memory {
>> +             #address-cells = <2>;
>> +             #size-cells = <2>;
>> +             ranges;
>> +
>> +             hss_payload: region@BFC00000 {
> 
> Don't mix cases. Should be lowercase hex everywhere.
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
