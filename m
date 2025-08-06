Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5025C87FCB
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 12:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vUIy2xJc9qbcEUCuJJHu7sAs8ABdqjs5bioSZpboVo4=; b=ea6CYGcgevNii4
	sGaAyGvvFP4Pplx2nL+KE9dMeSp090CKdWRAVTDZjEnuCGpfUMYZhDMS5hMRLMtUbBOnnzcuQXQL0
	NXnCE7HwIEX7PzbFIc/msSq/yDPRJwJEo7V+kmqRqZ2rIeKPitQkyGPDBFo09O2FaKl9Dsm+YaNyi
	+wO2+c2j0H6LIaT4sSUcCu+A23EEV4NnPxD4QaQ8dH4WMvLBxzlA+/KkGI3bEBAgEM93He9R8CPOt
	iXHsdg3nPfBMrx8M2lAa0pq7x4RRyYzaG46szgR3nC+WuSmGPHa8KnnVofjhR27PzJjAI3xFX8pbz
	yCnrhXCrShLdNgNtxiEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujdMX-0000000F9iZ-0Fp6;
	Wed, 06 Aug 2025 12:35:21 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujdMU-0000000F9gk-1YP2
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 12:35:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIoeAkhrMJf3aA5DwCslgiDWxlaCAmMRhd3wFF2ufUkJyH9P6NxvEc1lle/X8XC0KDTz56DfR/cC26/aV/cXLOcfrn4mvAug4NDUwYg5Q3kfAvCgGMssk7qPY3Qg9Zd3xU/FYx4YA3eVLWIi8KSPOPpSE54+n8ESysIYZShjVPDHdGGNmOBP9CQiCGKcG2e1rSShoBbFzbS7lluKDtbjoGY2r2A0453g0CHxDfyn4aSd05FvIJhC37Osmm5hthkxpy1E9F3TtpRHaQ940xe1lG6VoeS8dFD1AMEAyrbc8tPyXqY9K8qCsCvNvCDC5/EZPe3Tb/Ua1QuqfGYP3UVZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzuAdVYG7cXxDXPRBF8q6KHWgBeCh/sa4RT0+O5Ad1s=;
 b=EMpaZl4wcKus5KsYYL/aKoa6KASQF9kbJpQgs6cTsOQdmZIZMbCor4XOdRknY8NJ58EgH5ZfYV7sk0Pm4it4TCyUUYaKRNPwI8ZhTrI3JwxpNlO6gPxlAvNRGGnwt0IBxg1EqrYW+FK/gaffdPRxep+7atqDGXfSBGIbcLgOw12E+9Hups7NERl3RPPuRz5a/K/IXQx+5t9mTm7MQL98RoZRWgVfDO+TQ8bGGmguwfTLwY0At2Fc4qVp1hdyvHOqOD69PJ0z7uu9IRzgEdRFAUPBnXgJYE5PNqkx6LLFVI/R57vCSnGkVbsM9C2HMgPOC2ivZjTIOqrPCwzdExPdjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzuAdVYG7cXxDXPRBF8q6KHWgBeCh/sa4RT0+O5Ad1s=;
 b=E6iB/iYWpoxbDXNV8PHwMsevSYwLuw9sIZBmjkpVQ++HZHNP2L9Ieb8+9+vDtr03L1rD7rITx/AWZ+eObh9+FTl1+CyTcigLc0JcM/S+8T5S2dBzK3WLVTwjY+b2OdoGkQM7TJ2gihygL/afDSpPE6aDNdMPGFD72IVuIld2Xqki2lcAgiKsFAEQhhi0oI3k1+5Ua9ONZzN9em0WD+u90mGwUhJNW9Edn/nHnEcQCzTyRa3FERY3Sfk4YAUGlpdmW8zfTnLQOp2vfWpk60WVWS1+ZL1KOGDLidz9O3/Xq8v336bqa3ASppisl0NfHUAWbW33EwzFAJ+drKjPz+AvzQ==
Received: from DB8PR09MB3260.eurprd09.prod.outlook.com (2603:10a6:10:105::13)
 by VI2PR09MB7974.eurprd09.prod.outlook.com (2603:10a6:800:29a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.19; Wed, 6 Aug
 2025 12:35:04 +0000
Received: from DB8PR09MB3260.eurprd09.prod.outlook.com
 ([fe80::cad0:cb5b:959d:f7f]) by DB8PR09MB3260.eurprd09.prod.outlook.com
 ([fe80::cad0:cb5b:959d:f7f%5]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 12:35:04 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "conor.dooley@microchip.com"
	<conor.dooley@microchip.com>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Djordje Todorovic
	<Djordje.Todorovic@htecgroup.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "robh@kernel.org" <robh@kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>
Subject: Re: [PATCH v5 1/2] dt-bindings: timer: mti,gcru
Thread-Topic: [PATCH v5 1/2] dt-bindings: timer: mti,gcru
Thread-Index: AQHb8q7KQoArbVU4W0Kikurwhoorh7QxO3GAgCR8PIA=
Date: Wed, 6 Aug 2025 12:35:04 +0000
Message-ID: <98bda141-9fd7-40b8-b5f9-5e83e333da93@htecgroup.com>
References: <20250714-wooden-ebony-turaco-a0accf@krzk-bin>
In-Reply-To: <20250714-wooden-ebony-turaco-a0accf@krzk-bin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR09MB3260:EE_|VI2PR09MB7974:EE_
x-ms-office365-filtering-correlation-id: 3c47e227-0dc0-4a58-de36-08ddd4e5ab6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cHNqUE8yUTd0dVFlcVlpYzd2alhaenp2TE1KVEN5bFlsL1QzSnVyalR6Tmo5?=
 =?utf-8?B?cUtod2VvV2NsVmpmaWg4d0Q2ZnNKdWFCTTlqK2NraXJUZ1YxcjJUa25KdlQ0?=
 =?utf-8?B?TG5LZmNTcHpCK05URkIvbDRUWGl2aS9XNnY3cXJ5Q3hVQVJhWGNFREVLdGNH?=
 =?utf-8?B?OVEvdUg2SnB4T1RXVUlUcWpTUE5pWjFNbzFoQ2pvQ1dlSTlobm1ySzVIZ1FX?=
 =?utf-8?B?RkFxSGxKeWp3bTJvL1kya2ZDSEZ6bkY1OERUNVV0R2V5YU8yRm84TEswZ2Qv?=
 =?utf-8?B?aUp5S2RKdWVEbll2cGNWU29NZEFaOG5pT1F3TWhNWERtbEozenZWdUgyc3l0?=
 =?utf-8?B?eXduUDR0ZnNaSWlDNmJ3YSsrWkVwVmRSZkt3V2JFRWpudEJzVTNjT1ViMXFx?=
 =?utf-8?B?bXcxMFJMS1c1SkI4bVJkSk5FL3hFdW90TGpheUN3MjVDRWIvMHdacHgxQW83?=
 =?utf-8?B?WVBncFdRYlRtRVN4OWd6WmZYZ3dSVzZFeTdqTGFWZ2NaeUFIbldvUHRCUWpI?=
 =?utf-8?B?VUhzNnlzNE93YlJvVVBpaTRsS0EzZFhJUXRwU2p5R2JPKys1RGF5ZGVGYmM3?=
 =?utf-8?B?SlBQYkE4c2t0OTlhQWQrWE1GUXJnTmRMT2NiTFVDK05OWS81Qyt2NjhSdkZm?=
 =?utf-8?B?N1BoNTZ3TnNnOHNDUVo5aWUvL1Q5TDg4dkZnbDgyZFplTC9nV0RDWjFvK0ZX?=
 =?utf-8?B?M1EyZDRwaDUvLzUyQ1lHWWFORWN1MWFocEFVTzFOQkdnZFROUDc1NzFFd0xp?=
 =?utf-8?B?Q0xVeGVrUGVVaFFuYnkrbEYyTGpiUU9mdlVLM1VScWNOZWhQajM3S3Zmbjdz?=
 =?utf-8?B?Z1lmYVpJcUhtMWFieVNrdGtHbERReHB4bkZMNWNCeCt6NUVsQUl1dWJLSnh3?=
 =?utf-8?B?aWJWS1k4SlhWZWFFM3Ivdkp6L29HUHArRU16OUlQUzA3UjN1Mkp5MkQzNkxP?=
 =?utf-8?B?WEZhVFlBQnozeEtNTVFhL3dld0N4aFZja3FzK2xzajNuUS9tV1F5TFIrSnZV?=
 =?utf-8?B?QzdmTHpVRG4vRmpyK3ZNUjJEdGJqanhsUnVHck5ZNTY5V1VPeTB3OVNRSCtS?=
 =?utf-8?B?cHhOWTM1VW5KOU1ZMm9rYS94MWdqM0ZlQ28zMTJoSjNQQU9lL2psV3pERzRr?=
 =?utf-8?B?MlpkWmhDTXl3dndQTXllMDhndUJpc1lkUG5EL3V6NE5hcGpkMWxIbnlvM1Iy?=
 =?utf-8?B?TS9iN3FXUTIwV0NUSEtDUmx2bGJ5cnhDdlNKNVZCWjlVRklCNkpLQUZ6aVBB?=
 =?utf-8?B?clA4VGZDYUp0WWlTcFF0WjE5N1p5RnBLZFNMbitwSHVCczVjMzhnQWNpUWFN?=
 =?utf-8?B?c0lsVWx0SUtkTE5jTlViRmJ6OWM0VTRsbTNuMzhvdEgrZ2lmN0tESCtzbHh1?=
 =?utf-8?B?MGQwWmcxTDhMZVRnRmJYYjF0RjFTMmVGLzBHd2pHelo3a3lYWGE5UEFuUldJ?=
 =?utf-8?B?ZmFxS3M3OE9HbDR6bTNPcGl1ZUs3L3ZUMnp3a2JGbzVmaktrcE50a1pKOWt1?=
 =?utf-8?B?YmlaWUNSeHdpWXVWUU1WVXhDNWZrM2paQmtxYk1aUEhyL015Rno2MlY3WjZL?=
 =?utf-8?B?V3loSlQ2eEQvT1BCTkNYVGdQaWlyUDVlbnFPclRsOXhxQk53UEh1amtzSEoy?=
 =?utf-8?B?c1loZnRWbVhZSDBQb09FU1VxczQwTnZ2VHZSa2hqREk2eVBvRXpGU21yVHpF?=
 =?utf-8?B?TFljMzluK0lZSFN4ZXIzeElRL0VwMG9EVW5XSitaajBuN2NkaGxmTjFUNmlq?=
 =?utf-8?B?dHVTWjNaakI2bUxtOTlyL0VUbmN0RzV2bk41Q2JEOHVLazJ3VFNiZDBmZzRZ?=
 =?utf-8?B?Ly8zMHdYUXVlbURWNGtkeFhYYW9sY0VBNXpjWitwTE11Wi9DazdGL3RwNStv?=
 =?utf-8?B?M0tkREFnUUovRE1oNVhRYmRER0QrUXpyZW5xRGV4NW03U3ZZSFFUWkxBeUhQ?=
 =?utf-8?Q?4YkiOo3kFC4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR09MB3260.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVdBNlNzRXVQK0NmUFRDQzBrM1M2Y1gxTHlMaWtEM0NSMjI0SE9sOGdiSWhY?=
 =?utf-8?B?cEdRY0xHdlJLaEg4TlQ0YXMwMysrcjdpMnB1T1k0b1RkeitlZWZJcXBJa3Rt?=
 =?utf-8?B?Q3N5SkVPYTNOdlhnWGcvSEtFYVNaUGNlQ29wZGt0L0ZMZ0swR2lCdGZ1dGhU?=
 =?utf-8?B?eGF3NWlGVCswQUpPSDRCOGhDR2NKSWFTQjBLcEw1dzd2NSt5NU5sNk1YYzdV?=
 =?utf-8?B?UU1rZHZoNEpQL1RaWkpIZlpUL1d5VUJlVzMrY2twMGhDUXFwWDd5d0FuTUdY?=
 =?utf-8?B?blZLOFBlVDZqd1A3VGpOWWtNcUpSQVNTZW15eFRoMUp2cXorbzNUZmVFNDlU?=
 =?utf-8?B?Qk55VnNYcFQ3ai9LZDdvVnpqcHFucVdsWnNXeUlaSlBuM3g3ZkFudk4zUS9r?=
 =?utf-8?B?cjRKaWlnU2tTb0ZGdGxPWkN4WlpYZW15bzRtSFN6QVNsWlZ0cy80Y3dvRWNS?=
 =?utf-8?B?VFZRNEYyMnhDb1FXYUZpa3ozSWpJb1hnMmM0SlpRNGE0eGRud0ZSc0ZrVk8r?=
 =?utf-8?B?eWhmMjJjUEoxV3FaekFsZXppclJpV3RzbSt0RTZ5TXFQTFFjRnY2Z1JZd0R2?=
 =?utf-8?B?a1UwdGVXWmJTaWtROXJaa0EvbnpLYTBqNHdDTGJhWjJKaU5jdkdCRmMzcmVQ?=
 =?utf-8?B?VlVrR3JJbFhaNklNcWRjMWFncFZ4WitlUlBFM3hEbzh3MnZOZUxydFk1QlNY?=
 =?utf-8?B?TlFmQTFkQko2YnlHM05MSUdHR2RScEpaamZpRXdVSE1EOE5zYWNTNzFxWjFr?=
 =?utf-8?B?STNQTmxrUDdSU0tMdXhWY0NJYzhvTURPcTlnUEFZVkhhN2dmTUY2Q0pmc3d3?=
 =?utf-8?B?VjZrRTcvN1E5djBhb1NHTHVmNCtFczJCVUdMcVFGenBVdGZibDlkT3E3RzVa?=
 =?utf-8?B?OTJpd2xnaUdxWHdLT0cvZEFmYVhIUkppSDF3VGlYN1V0NXo1UnhGVnNPUUJu?=
 =?utf-8?B?WFhOZVU1UVFIdmRJZWR5R05vVnYwQlExWC9qc2N0S0x1ZjErL2dQK0Zpdm9l?=
 =?utf-8?B?WXlhckJXd0lCRWpMVWZJUXlFczlHajlFRFVXRGRlSnRLUmZGKy9wcVRUTU5y?=
 =?utf-8?B?VFRVMzlucEpjdWxNWE55c0JZaE4xbDBIa2VrWW9JVmEvdmtKakRPMkJKOXQx?=
 =?utf-8?B?a2hWSzNFbWludmJHVmhTUk5IRk9JZ09maEFFMGxtTElWekVBUlMzVUQvMzlN?=
 =?utf-8?B?SVhvNjZQUlpEMGI5Y3JsM3cxcjZac0hKTSt0UnJRQnNURWd3UEl0cURsSndL?=
 =?utf-8?B?Mmw0dlBlUkdBQldVaU5wcnc0UDFVYVg1bEFTUnNFYzExT3l4WDZMc0NHY2tW?=
 =?utf-8?B?TmxzRlQrWGdQZWNia2NyVlZZOUFVUkorOHBSbGNWY0NYaEZlUEZVREJjeEV5?=
 =?utf-8?B?ZXVTMXVBbUVTSmpMS05NN3BnSHo0alBidUxaQXBWQ2xpMVY5M1QvZGNEeTh4?=
 =?utf-8?B?clRFendDZnMySzlNdXB0NGpWeHhYSlRoeUw2cFNRSVJ1WWNiMUo1UGh4RHJa?=
 =?utf-8?B?UzhwNjZHUUFlQmpPR09UMmhibmJqdjNWZ0tsOVRvdnp5SkxpdTJ6NDU2c1Fy?=
 =?utf-8?B?VDZqdzFwVEZGMjlMam52SXpXY0hBdTJBT2tjRGlSclRVVTU5cDlETXByd1Rq?=
 =?utf-8?B?YUpmK3ZRdWhLNmpUUzJvKzlMQXdGcHZVWTVKMDJzRHZic0VyenlCNldJNkZZ?=
 =?utf-8?B?Q1RjcjdVMnZUSnNJTEpGY3J1WDhlcXorMVliQ0tWSDQrSHFKV0Y4WXJFL3VG?=
 =?utf-8?B?cWdOMUlMWm9iVHB2UjNRZ1gyaVMrU3lOWDFtZXhjVlV3bTg0aXc2K252aGpG?=
 =?utf-8?B?dnpBd0xOMGVqam9HV1B1T0RKTzNJSk0zaUZRWDlSWjVISktKWExVTmxUQUd4?=
 =?utf-8?B?dC9DbzVhem5BbkpzK3BNL3ZHb1ZzaE5hTlI1MXVKY1lKanowUzFkaHBWaEFu?=
 =?utf-8?B?U3N2VWdrWkdReVZob3VpR0VJWWZ1WTZ6RHQrVEVxNjk2MWZKRTFVQW16cXA0?=
 =?utf-8?B?TDJTczdwODlpeStrUi9FekF1Y1lOS0FIK2c4VldtcE10M2QzcVBpa205dUlL?=
 =?utf-8?B?djNQaUZpQy9oOHZJT1AwQ0Z2dTB1OEZSSUtlVWRjZno2N2Q3MEFWdmhiZ04v?=
 =?utf-8?B?Sk9zaFR4OHVYcGNKakRMSFZTZWJjRXYxZlpGUGp2c3o3Mm03am50U1J4Yll5?=
 =?utf-8?Q?bqCKoLhY3UJL5tA3EJdC2GA=3D?=
Content-ID: <A216B63FD2E5884C83E580B47514901D@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR09MB3260.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c47e227-0dc0-4a58-de36-08ddd4e5ab6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 12:35:04.4743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zTcotYkUmAghREuqwIjkSbQMd1jCkoaCRX9Zdv52z/FyLbo/H8Y7NWFERBGWa0yJPejYkOTUsE9jdZX818psxlTEelhETu48VrbbRdfLwQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR09MB7974
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_053518_407365_5DC15338 
X-CRM114-Status: GOOD (  11.55  )
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

On 7/14/25 09:24, Krzysztof Kozlowski wrote:

> On Fri, Jul 11, 2025 at 11:56:45PM +0200, Aleksa Paunovic wrote:
>> +$id: http://devicetree.org/schemas/timer/mti,gcru.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: GCR.U timer device for RISC-V platforms
>> +
>> +maintainers:
>> +  - Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>> +
>> +description:
>> +  The GCR.U memory region contains memory mapped shadow copies of
>> +  mtime and hrtime Global Configuration Registers,
>> +  which software can choose to make accessible from user mode.
>> +
>> +properties:
>> +  compatible:
>> +    const: mti,gcru
> Is this architecture? vendor prefix suggests not. So is this for SoC?
> Then why there are no SoC compatibles here instead?
Hi Krzysztof,

Thank you for your comment.
You are right, this is for the MIPS P8700 SoC. Will fix this in v6.


Best regards,

Aleksa

>
> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
