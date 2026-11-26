Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFC9606A33C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 16:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K91YMdFD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YamKiptn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1sCsuKEiUurJz9ng6baB78HWbKwUDlc+GKowZntqZok=; b=K91YMdFD3Bkf3Rm2X54laQ+3hj
	XBUCzPUelTWVgfmKpZp9cpMJYxLG2rHSBdVLIZSZxhAGQzuHGbWjBLY6cwtNvai1HJwoy9RxHaLnE
	D2NtYqWl2Z91yagelfCLbJEdx3CJYW4xtX/lCO3fYrO3QUBy49DRsOFURyQyj+sNLy9EuYLm5A/D5
	sLV+sbGyMTH6Ttz4lCESkBwkNVQMhVLm4zI2sEn3oFkfK0ROcx6Z9ZqTOankg+iFzJXzIA4ktUbRS
	bFMAigmr9fNeY5TQ8dOlCA3B6o85ApvkiZtzmq2+oucvD/kBdV26qj9vtqVVUkp/S4gvTnHhS+U+A
	ugYp+gKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcV0-0000000DwEI-2Rxt;
	Thu, 26 Nov 2026 16:39:06 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcUy-0000000DwDk-12LQ
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 16:39:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePuo+9hGI76GtzJwTnUp8trlHq6xTpI/9/cfpfhYh7euI9fXnkBUJSddGAJwdBsjYPnH9Y/Mj++ey3p/izvdbpN+8xlr5LbQozJS/JcUG6BHBDmasD5LozuBoa+7BQ/czzbs5qHRa+rmnP97n3HRl9/0Dy/sItZS8IhjiC27Gherk8ZstkbvlbHXNfVZ/5ZadyaHT/N2e5Bj9xsWJf2nCzp7Zyi/2wIpCqo4DA+jEHZg9OI3nBlBL1e5Xnqb2SzNDqIjHleab/9F05gOgaXOHMegiwfOJ8CFAjHvYTRYD26pYBP0JVwe6HV9OnvN7Yu9cjEAT7BeXmIxwYBNJzLflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FI+DqUf6h9xs6t5/h7tkC+XrHX75GwJgmDV8pt1ZvmY=;
 b=Y0toLq/V8XNc0/zd0aW3kFlezs2Q4i8bQWTvd679Zj4tXu0SWPk1hlik9CP+uOy6mqJ835D9DJE1edJsQsC74qPo5ufQLndICKdOssy70U/xPmjnJjwM9Ftb2XnyT+5cD4oHS7dh1u0H5cemMfWlbhiWlkgaDNojd/Px6LPcSXIN2YpcXMbzZSh5AQ79dJnH5t7bWllU46St/sNvbiCdKTk9VgLPIikAtMQ47fjCTjpWrOxN65h8tU1z0XCXg+eXTbnivR9xNysABa+va/nW6AOhm7ECW0Ep+9iQfuR9ZZp1WUWhNVY6IqRpd5y2RXXZT+tG2nG6IW4N53aYCuXU5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FI+DqUf6h9xs6t5/h7tkC+XrHX75GwJgmDV8pt1ZvmY=;
 b=YamKiptnkj6vj7XuBbGM+zVvhUcxE3mIDu8JllgLxEYyNXUTHZj16m6iJAM9izou2HZZ0Lc+y2D0cGHhTPz5onRdxZHl+Oa1zz2shqtN+P9WOu4nFno8RHoqD+m10IqZfnv79QwqHvQryFmWDKHC1861vX/T9XDcEhrjBKJJFMj3VTODi5wNH4UND/1AqbP/wuTIvb8h94LSpm6uZMwsOKyDp/XZy7q2xBxQfM1LUTKrlJVrG+HeqK8abv9AOvi/GBAS+COUf5FH7t1zz2e8q4pDqg/WrHcJklkP7TWGo+xzqsuyPs9FL0ktVVoEXb0kDBkM1TjI/3uby1c89GTt+A==
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::17)
 by GVXPR04MB10304.eurprd04.prod.outlook.com (2603:10a6:150:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 16:38:58 +0000
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::37dd:8aa6:c6a5:c832]) by AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::37dd:8aa6:c6a5:c832%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:38:56 +0000
From: "Marouene Boubakri (OSS)" <marouene.boubakri@oss.nxp.com>
To: Conor Dooley <conor@kernel.org>, "Marouene Boubakri (OSS)"
	<marouene.boubakri@oss.nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas
 Gleixner <tglx@kernel.org>, Anup Patel <anup@brainfault.org>, Samuel Holland
	<samuel.holland@sifive.com>, Radu Rendec <radu@rendec.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 7/8] riscv: dts: openhwgroup: add CVA6 APU on Digilent
 Genesys 2
Thread-Topic: [PATCH 7/8] riscv: dts: openhwgroup: add CVA6 APU on Digilent
 Genesys 2
Thread-Index: AQHdatMP2AQQGuFOIU2hvXLOlFPo97cbK6SAgCWHqWA=
Date: Thu, 26 Nov 2026 16:38:56 +0000
Message-ID: <AM9PR04MB758686FCAE3D9C4A713B6E98FC422@AM9PR04MB7586.eurprd04.prod.outlook.com>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
 <20261102141727.640769-8-marouene.boubakri@oss.nxp.com>
 <20261102-salsa-cartel-dd4f4b2a9639@spud>
In-Reply-To: <20261102-salsa-cartel-dd4f4b2a9639@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-11-26T16:37:50.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB7586:EE_|GVXPR04MB10304:EE_
x-ms-office365-filtering-correlation-id: 1935c83f-6eb9-4430-41f3-08df4bdbc3e4
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|19092799006|23010399003|7416014|376014|366016|1800799024|4143699003|6133799003|261009223027099003|22082099003|18002099003|3023799007|260925021911599003|260925021311599003|260925022911599003|10067099003|56012099006|11063799006|261102124527099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261022075727099003|38070700021|261022105027099003|261021121427099003|261021123027099003;
x-microsoft-antispam-message-info: vmg0GhYYTjr0QOSC0ntY69LmxIaa59maDjP8FdU+AF3B6FAfa9jfOhGHntniKeSzLUyu94QuWa23J9SLvdr//nCO+x41nraR3vAejuOfoGjSmlHYcTNXrphJbw0xTfaSkvS3agY3sjiyal56uSmGxTpkjOL1HfItQHVyxpr9ha69hSUYItL/cJpuc2amvW0C51Snwk5N0ttlMWbVGLWzxsT40oL7Cu3Zlk7fh+oiRbvTEsj+nQD6vX7kLEpM/tboh//9HwC41w4vk5yIx1vpjGykfg16N50fKPRIrXGDMnw7Ns1b6ccHcQdslBnCcr8OqjPSq/BzFplWWcI29HPP3expU7Zvgd4RvSFsWZ8hbeqNzTw/ZMVCRzt96KffjlQcebuiDc0a4yLObuIDuH7xHxLhTsgbn6naeNnKcCze7ABycfiZseNXBAnE7eLspziZHIbaqJg8nisfNt62UpsZMEGykPnFbZBY8MlRYb3P+F+7RrAt6XLt88qD0NFcI0xy3WeE6tMGhwZAeJiu7DZPdJJsfcY+hodciFMnTFpRTHpITnd/3gztOKuxM83ynGYudt0CYE3lvu98mXdls5o3D2E13M3pnDV+Wv9UvlGFkEasC9DMLuqd0Doai5llqPkw/8ssKs4QEgiRES6FNzvhHo8xTHB78OZk7KQMRd88lbc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB7586.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(376014)(366016)(1800799024)(4143699003)(6133799003)(261009223027099003)(22082099003)(18002099003)(3023799007)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(56012099006)(11063799006)(261102124527099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022075727099003)(38070700021)(261022105027099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXZYNjI1c0tCTFl3Ry9YUFNpMTZKVHloWFZPRXZPRXROTFZiZU5rZm9hTDA5?=
 =?utf-8?B?MXduemlCeGMvZDN3Ums2TDN4QnpMUThJa1hoNU1PVklxTVBhSDNFelpOdjMx?=
 =?utf-8?B?Njc2dk5ZNzZVbTllOHhFZnB5VGV4TTJHVWdQUEl6Vnl4cHJBcjQvQ1lJTUdu?=
 =?utf-8?B?ZWZPaHdnNW9vWE9FMnJadWx1YU5GNkhRN2xlWHlscE0xSnJkdk5jUXZFZnJw?=
 =?utf-8?B?VHk1MitobnBsWnpmU1lYa2l2ZzFrUlJ4SkFKQzdTclJyMEI5Z09nblpvNnF5?=
 =?utf-8?B?UGNKcSt0OEZ0bXJDRUNEbThpdE5jM0dBc2NHNnVvRjRYQXJ6TzRWbTFoK2U4?=
 =?utf-8?B?Y3NjVXpWOUFkRnV4Y1N3c2NqRTRKenlta3JGUUpQRTk2dndsNmIrTnRvdkJN?=
 =?utf-8?B?eDQ3YkxWWEZIZFB3bzA0WWkzYm54ZVdRWmZua29FcDg5RkxmTnBFZWthd2VH?=
 =?utf-8?B?U1p6VUtHNTJBUDRqenNiUnZhNFJJSGxhb1JVVklWSGk1SHBvOWxMa3VucmhB?=
 =?utf-8?B?WmlFd0doUXhUM0JiUTA0elg4NmJUd2lEcldwRU9zUjB5VjlEVDcyT2JnOUVs?=
 =?utf-8?B?WTR1WGtObFllcEtIQ3hLV0xlL3VaUm9STWNHVzExS3dKZ3lQTVJBWXVwVnFj?=
 =?utf-8?B?Q0dGUUtVamIzbjBkZDN2bDk5WjNPcXJ1THV5TUhRUDE0TnhWOXk2eHREUmV0?=
 =?utf-8?B?aGFKcmRneGw0Zit3NE1saVV0TkhDRmc4aUdSMEt1MkRvWEpNQk55QTJFZzAr?=
 =?utf-8?B?MzVYVlVJVW10OEwzNUU1SnNianlMdkRlS0ljWDVrb0dTTVFFSy9YbUg3MGFY?=
 =?utf-8?B?VGtyRjlwNmFDck9tQ0srbUZtZ1E2OUN2WjVYQkJ6c2pRVzBNY3hhNFA5YnZr?=
 =?utf-8?B?RHR5TjdrQXFsOTI4eHU4alljVHAwZmpleTQxa1Y1c3BnSFRUTEV2ZHR1eWsw?=
 =?utf-8?B?MzhjVXc1UGVMTUMrSzAxK1VvSXYrdGhZQzlFZG1DY3ArSzEyaFE0dWo3UWwx?=
 =?utf-8?B?OG5FSDZnbkhqanc4VzNaS21HdWU5aGxwNE0wdDV2WTVLQVF3M1pDTkNzMWMz?=
 =?utf-8?B?RjRWVkJ5UWxBa0hTZ2RwMEVDQ1hZMWUrZkx0M2l5aG02a1hrUXd1b3hHK0hp?=
 =?utf-8?B?VGVKbG4zbHgrdXo3WGxzN0QyOXQ4b3h0enkwWVQ3WDlBV3JYdEhZeENEMXNV?=
 =?utf-8?B?aG5KMS9HK3NaV291bGdZMm9LT2FoUklTRW81MGpEUVJteTVNZGh1YnVHcnBv?=
 =?utf-8?B?bkNBdXZOcTZ5OU81VkUxS055bVpBY05oeXlNNngxUXJBMHBEc3BLT3BSU2s2?=
 =?utf-8?B?clIxbkxFME4wYUM2a3FOdncxdEM5V1FVMjJwQVBZczJYdk5hbmdJMUtIam1H?=
 =?utf-8?B?S2tTd0pHTXA3dHhHRjFzN1BsVkVYNzEzMzhpd2ZjNVdveDBpOGxvR1Vxd1Z6?=
 =?utf-8?B?SEt0TFNDN21CcEdDYlRBeDQxT2VpUVJ4MEdjelFlYmdIc3VTT2k0YTFYOXBP?=
 =?utf-8?B?UXhIempMaVBwUlJHeWNCWHVScXFpZTBlRW5zWVR4YmkyYlh2bC9neERGaGMz?=
 =?utf-8?B?QmVTMER0UGVxbzZkV2NoWVZQTU1ENkVPSDFBS1NJRDVNa2V4MUpsRCtKeFZB?=
 =?utf-8?B?RStuVjIrMnJ6NG53SkJ0VDR6cG5NTTAxUUg5Y2V3cm9Zem0yanN4eENia3cx?=
 =?utf-8?B?d1VoRXZZeWJrL1FSelhlVEJ5Qm8xOXhaRHgzRzUrL1UyR1RoaGZMT3doTmth?=
 =?utf-8?B?a3VGWnBLdlVJWkF1dnh4Qm53UDZQclRTWWVnQlZBckwybDBOWEY5NzBiR1N0?=
 =?utf-8?B?VE9TYlhOL3k2QzVwc0JHZEZscm9kQmE4b3BFTVRCYjVna2x6M1NZbDlmS2hq?=
 =?utf-8?B?aDZqdTJwdnBwY1NpOFNtK2FLWDBVaVovV1FlV3NTNFB4WTJnTXB2R2dqVStJ?=
 =?utf-8?B?RkpEV0NyT0I5VXYybmx2YXIxQ3R4STBGK09Ydm52cDlQeXhVc0JCMmZvWXls?=
 =?utf-8?B?SVArTGg2OXZYYnMxcnlNODUxUjdiL1FUSmtneUQ3ZG5qNjluOHNXc3M2Y1hN?=
 =?utf-8?B?OFdLRm1BbnRWeFNJY3FkR3VYTUp0c0t1OHcrUVl3VUE0UHYvRjNWeWtrNkZO?=
 =?utf-8?B?T0Vhakptb2x4VTV6SVF4QnZWOG1Nd0lJa1JZemoyK1RCcjlLNHEvOU1mMXpl?=
 =?utf-8?B?WmNib2k3OTBZSEluVUZDMkRrVXJOcXFvMS9QN1ZEenYxMWNHRFVDWmRhOCtY?=
 =?utf-8?B?Yzh3WXNvVy9iZGE5Vi82a1p5aFFBakZxT2lkNkR4Yk1rTEZQYW9UMFNoS042?=
 =?utf-8?B?VE9HOVdYdHc0VmpWaWx6UDJ0RVBCb3RGWUFPb1djTk42dUQwb3hDUT09?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB7586.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1935c83f-6eb9-4430-41f3-08df4bdbc3e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 16:38:56.5795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XR2J3uKKAoIU7D/OF8kEVXFZBXWkWW4X8oNxACMZfZOoVrsFnr+o8LvWh33tf8Q/kMtrs/Dx6bLESsSDszUfPo1+ExMgiXVApJABW9P0Yew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10304
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_083904_459103_88AE6ED3 
X-CRM114-Status: GOOD (  26.95  )
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Conor,

Thanks for the review, and for the acks on patches 1 to 4.


NXP Confidential
On Mon, Nov 02, 2026 at 07:30:41PM +0000, Conor Dooley wrote:
> > +RISC-V OPENHW GROUP SoC SUPPORT
> > +M: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> > +L: linux-riscv@lists.infradead.org
> > +S: Maintained
> > +F: Documentation/devicetree/bindings/riscv/openhwgroup.yaml
> > +F: arch/riscv/boot/dts/openhwgroup/
>
> There's no git tree here, are you expecting me to apply the patches for
> your platform?

Yes, if that is okay with you. I don't have a tree for this: the platform
is small and I expect very few patches. I will review and test whatever
comes in for it. I can add your tree as T: in this entry, or list the
directory under RISC-V MISC SOC SUPPORT instead, whichever you prefer.
If the platform grows I am happy to set up a tree and send you pull
requests instead.

> > +   compatible = "openhwgroup,cv64a6-genesys2", "openhwgroup,cva6-apu";
>
> As I mentioned, these need to change.

Ack. In v2 the compatibles are versioned after the CVA6 release the
bitstream is built from:

  "openhwgroup,cv64a6-genesys2-v5.3.0", "openhwgroup,cva6-apu-v5.3.0"
  "openhwgroup,cv32a6-genesys2-v5.3.0", "openhwgroup,cva6-apu-v5.3.0"

I versioned the fallback as well. Tell me if you would rather have a
different scheme.

> > +   chosen {
> > +           stdout-path = "serial0:115200n8";
> > +   };
>
> As I understand it, these should always be at the board level, but given
> this is a pure FPGA design there's gonna be some oddness and I think
> that's okay.

Thanks. The dtsi describes the Genesys 2 build of the design, so the
UART is the same for both .dts files, which is why I kept them there.

> > +   /* Peripheral clock, the same as the core clock */
>
> Sounds like you're then missing a clocks property in your cpu?

Yes. v2 adds clocks = <&clk50> to the cpu node and drops clock-frequency
from it.

> > +   clk50: clock-50mhz {
> > +           compatible = "fixed-clock";
>
> Is this genuinely a fixed clock, or an output of a clocking-wizard
> instance (or similar)?

It is an output of a clocking wizard instance (xlnx_clk_gen in
corev_apu/fpga), fed by the 200 MHz clock of the DDR controller. The
instance is generated with a static configuration: the output
frequencies are set when the IP is generated, and it has no AXI-Lite or
DRP interface, so software cannot see or change it. That is why I
described it as a fixed-clock. v2 says so in a comment.

I will also drop the platform list from the Kconfig help in patch 6 as
you asked. v2 follows with the MAINTAINERS entry unchanged; I will
update it once you tell me which form you prefer.

Thanks,
Marouene

-----Original Message-----
From: Conor Dooley <conor@kernel.org>
Sent: Monday, November 2, 2026 8:31 PM
To: Marouene Boubakri (OSS) <marouene.boubakri@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Paul Walmsley <pjw@kernel.org>; Palmer Dabbelt <palmer@dabbelt.com>; Albert Ou <aou@eecs.berkeley.edu>; Alexandre Ghiti <alex@ghiti.fr>; Daniel Lezcano <daniel.lezcano@kernel.org>; Thomas Gleixner <tglx@kernel.org>; Anup Patel <anup@brainfault.org>; Samuel Holland <samuel.holland@sifive.com>; Radu Rendec <radu@rendec.net>; devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] riscv: dts: openhwgroup: add CVA6 APU on Digilent Genesys 2

On Mon, Nov 02, 2026 at 03:17:26PM +0100, marouene.boubakri@oss.nxp.com wrote:
> From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
>
> The CVA6 APU is the FPGA SoC built around the OpenHW Group CVA6 core
> in the CVA6 repository (corev_apu/fpga, release v5.3.0). It targets
> the Digilent Genesys 2 board and provides a CLINT, a PLIC, a 16550
> UART, a Xilinx SPI controller connected to the SD card slot and a
> Xilinx GPIO block driving the LEDs.
>
> Describe the SoC in cva6-genesys2.dtsi, shared by the two
> configurations of the core that the FPGA platform builds, and add a
> board device tree for each of them:
>
>   - cv64a6: rv64imafdc with the B, Zcb, Zicond and Zkn extensions,
>     Sv39, 1 GiB of DDR3
>   - cv32a6: rv32ima, Sv32, 128 MiB of DDR3
>
> The ISA extensions follow the core configurations of CVA6 v5.3.0
> (core/include/cv64a6_imafdc_sv39_config_pkg.sv and
> cv32a6_ima_sv32_fpga_config_pkg.sv).
>
> The platform also has a lowRISC Ethernet controller and a PULP APB
> timer. They are left out until bindings exist for them.
>
> Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> ---
>  MAINTAINERS                                   |   7 +
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/openhwgroup/Makefile      |   2 +
>  .../boot/dts/openhwgroup/cv32a6-genesys2.dts  |  29 ++++
> .../boot/dts/openhwgroup/cv64a6-genesys2.dts  |  31 +++++
>  .../boot/dts/openhwgroup/cva6-genesys2.dtsi   | 131 ++++++++++++++++++
>  6 files changed, 201 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/openhwgroup/Makefile
>  create mode 100644
> arch/riscv/boot/dts/openhwgroup/cv32a6-genesys2.dts
>  create mode 100644
> arch/riscv/boot/dts/openhwgroup/cv64a6-genesys2.dts
>  create mode 100644 arch/riscv/boot/dts/openhwgroup/cva6-genesys2.dtsi
>
> diff --git a/MAINTAINERS b/MAINTAINERS index 782389bd5c..17865074a2
> 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23566,6 +23566,13 @@ T:   git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
>  F:   arch/riscv/boot/dts/canaan/
>  F:   arch/riscv/boot/dts/sifive/
>
> +RISC-V OPENHW GROUP SoC SUPPORT
> +M:   Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> +L:   linux-riscv@lists.infradead.org
> +S:   Maintained
> +F:   Documentation/devicetree/bindings/riscv/openhwgroup.yaml
> +F:   arch/riscv/boot/dts/openhwgroup/

There's no git tree here, are you expecting me to apply the patches for your platform?

> +
>  RISC-V PMU DRIVERS
>  M:   Atish Patra <atish.patra@linux.dev>
>  R:   Anup Patel <anup@brainfault.org>
> diff --git a/arch/riscv/boot/dts/Makefile
> b/arch/riscv/boot/dts/Makefile index 69d8751fb1..305a93ad6f 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -5,6 +5,7 @@ subdir-y += anlogic
>  subdir-y += canaan
>  subdir-y += eswin
>  subdir-y += microchip
> +subdir-y += openhwgroup
>  subdir-y += renesas
>  subdir-y += sifive
>  subdir-y += sophgo
> diff --git a/arch/riscv/boot/dts/openhwgroup/Makefile
> b/arch/riscv/boot/dts/openhwgroup/Makefile
> new file mode 100644
> index 0000000000..a75a5863b7
> --- /dev/null
> +++ b/arch/riscv/boot/dts/openhwgroup/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_OPENHWGROUP) += cv32a6-genesys2.dtb
> +cv64a6-genesys2.dtb
> diff --git a/arch/riscv/boot/dts/openhwgroup/cv32a6-genesys2.dts
> b/arch/riscv/boot/dts/openhwgroup/cv32a6-genesys2.dts
> new file mode 100644
> index 0000000000..83d0286171
> --- /dev/null
> +++ b/arch/riscv/boot/dts/openhwgroup/cv32a6-genesys2.dts
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +/*
> + * Copyright 2026 NXP
> + *
> + * OpenHW Group CVA6 APU, 32-bit core (cv32a6), on the Digilent Genesys 2.
> + */
> +
> +/dts-v1/;
> +
> +#include "cva6-genesys2.dtsi"
> +
> +/ {
> +     model = "OpenHW Group CVA6 cv32a6 on Digilent Genesys 2";
> +     compatible = "openhwgroup,cv32a6-genesys2", "openhwgroup,cva6-apu";
> +
> +     memory@80000000 {
> +             device_type = "memory";
> +             /* 128 MiB of DDR3, as configured for this core by the FPGA build */
> +             reg = <0x0 0x80000000 0x0 0x8000000>;
> +     };
> +};
> +
> +&cpu0 {
> +     compatible = "openhwgroup,cv32a6", "riscv";
> +     riscv,isa-base = "rv32i";
> +     riscv,isa-extensions = "i", "m", "a", "zicntr", "zicsr", "zifencei",
> +                            "zihpm";
> +     mmu-type = "riscv,sv32";
> +};
> diff --git a/arch/riscv/boot/dts/openhwgroup/cv64a6-genesys2.dts
> b/arch/riscv/boot/dts/openhwgroup/cv64a6-genesys2.dts
> new file mode 100644
> index 0000000000..8fe653b35c
> --- /dev/null
> +++ b/arch/riscv/boot/dts/openhwgroup/cv64a6-genesys2.dts
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +/*
> + * Copyright 2026 NXP
> + *
> + * OpenHW Group CVA6 APU, 64-bit core (cv64a6), on the Digilent Genesys 2.
> + */
> +
> +/dts-v1/;
> +
> +#include "cva6-genesys2.dtsi"
> +
> +/ {
> +     model = "OpenHW Group CVA6 cv64a6 on Digilent Genesys 2";
> +     compatible = "openhwgroup,cv64a6-genesys2", "openhwgroup,cva6-apu";

As I mentioned, these need to change.

> +
> +     memory@80000000 {
> +             device_type = "memory";
> +             /* 1 GiB of DDR3, as configured for this core by the FPGA build */
> +             reg = <0x0 0x80000000 0x0 0x40000000>;
> +     };
> +};
> +
> +&cpu0 {
> +     compatible = "openhwgroup,cv64a6", "riscv";
> +     riscv,isa-base = "rv64i";
> +     riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "zba",
> +                            "zbb", "zbc", "zbkb", "zbkc", "zbkx", "zbs",
> +                            "zca", "zcb", "zcd", "zicntr", "zicond", "zicsr",
> +                            "zifencei", "zihpm", "zknd", "zkne", "zknh";
> +     mmu-type = "riscv,sv39";
> +};
> diff --git a/arch/riscv/boot/dts/openhwgroup/cva6-genesys2.dtsi
> b/arch/riscv/boot/dts/openhwgroup/cva6-genesys2.dtsi
> new file mode 100644
> index 0000000000..95978274a7
> --- /dev/null
> +++ b/arch/riscv/boot/dts/openhwgroup/cva6-genesys2.dtsi
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +/*
> + * Copyright 2026 NXP
> + *
> + * OpenHW Group CVA6 APU on the Digilent Genesys 2 FPGA board.
> + *
> + * The SoC description is shared between the 32-bit (cv32a6) and the
> + * 64-bit (cv64a6) configurations of the CVA6 core. The core specific
> + * properties and the memory size are set in the board .dts files.
> + */
> +
> +/ {
> +     #address-cells = <2>;
> +     #size-cells = <2>;
> +
> +     aliases {
> +             serial0 = &uart0;
> +     };
> +
> +     chosen {
> +             stdout-path = "serial0:115200n8";
> +     };

As I understand it, these should always be at the board level, but given this is a pure FPGA design there's gonna be some oddness and I think that's okay.


> +
> +     cpus {
> +             #address-cells = <1>;
> +             #size-cells = <0>;
> +             /* The CLINT mtime counter runs at half the core clock */
> +             timebase-frequency = <25000000>;
> +
> +             cpu0: cpu@0 {
> +                     device_type = "cpu";
> +                     reg = <0>;
> +                     clock-frequency = <50000000>;
> +                     tlb-split;
> +
> +                     cpu0_intc: interrupt-controller {
> +                             #interrupt-cells = <1>;
> +                             interrupt-controller;
> +                             compatible = "riscv,cpu-intc";
> +                     };
> +             };
> +     };
> +
> +     /* Peripheral clock, the same as the core clock */

Sounds like you're then missing a clocks property in your cpu?

> +     clk50: clock-50mhz {
> +             compatible = "fixed-clock";
> +             #clock-cells = <0>;
> +             clock-frequency = <50000000>;
> +             clock-output-names = "clk50";
> +     };

Is this genuinely a fixed clock, or an output of a clocking-wizard instance (or similar)?

Cheers,
Conor.

> +
> +     leds {
> +             compatible = "gpio-leds";
> +
> +             led-0 {
> +                     gpios = <&gpio0 1 0>;
> +                     linux,default-trigger = "heartbeat";
> +             };
> +     };
> +
> +     soc {
> +             #address-cells = <2>;
> +             #size-cells = <2>;
> +             compatible = "simple-bus";
> +             ranges;
> +
> +             clint: clint@2000000 {
> +                     compatible = "openhwgroup,cva6-clint", "sifive,clint0";
> +                     reg = <0x0 0x2000000 0x0 0xc0000>;
> +                     interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> +             };
> +
> +             plic: interrupt-controller@c000000 {
> +                     compatible = "openhwgroup,cva6-plic", "sifive,plic-1.0.0";
> +                     reg = <0x0 0xc000000 0x0 0x4000000>;
> +                     #address-cells = <0>;
> +                     #interrupt-cells = <1>;
> +                     interrupt-controller;
> +                     interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> +                     riscv,ndev = <30>;
> +             };
> +
> +             uart0: serial@10000000 {
> +                     compatible = "ns16550a";
> +                     reg = <0x0 0x10000000 0x0 0x1000>;
> +                     clock-frequency = <50000000>;
> +                     interrupt-parent = <&plic>;
> +                     interrupts = <1>;
> +                     /* Registers are 32-bit wide and 32-bit aligned */
> +                     reg-shift = <2>;
> +                     reg-io-width = <4>;
> +             };
> +
> +             spi0: spi@20000000 {
> +                     compatible = "xlnx,xps-spi-2.00.a";
> +                     reg = <0x0 0x20000000 0x0 0x1000>;
> +                     #address-cells = <1>;
> +                     #size-cells = <0>;
> +                     interrupt-parent = <&plic>;
> +                     interrupts = <2>;
> +                     xlnx,num-ss-bits = <1>;
> +                     xlnx,num-transfer-bits = <8>;
> +
> +                     mmc@0 {
> +                             compatible = "mmc-spi-slot";
> +                             reg = <0>;
> +                             spi-max-frequency = <12500000>;
> +                             voltage-ranges = <3300 3300>;
> +                             disable-wp;
> +                     };
> +             };
> +
> +             gpio0: gpio@40000000 {
> +                     compatible = "xlnx,xps-gpio-1.00.a";
> +                     reg = <0x0 0x40000000 0x0 0x10000>;
> +                     clocks = <&clk50>;
> +                     #gpio-cells = <2>;
> +                     gpio-controller;
> +                     xlnx,all-inputs = <0>;
> +                     xlnx,all-inputs-2 = <0>;
> +                     xlnx,dout-default = <0>;
> +                     xlnx,dout-default-2 = <0>;
> +                     xlnx,gpio-width = <8>;
> +                     xlnx,gpio2-width = <8>;
> +                     xlnx,interrupt-present = <0>;
> +                     xlnx,is-dual = <1>;
> +                     xlnx,tri-default = <0xffffffff>;
> +                     xlnx,tri-default-2 = <0xffffffff>;
> +             };
> +     };
> +};
> --
> 2.43.0
>
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
