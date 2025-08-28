Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A3CCA0EED
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 11:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1OrwpX8ma4HL4vXKZei4jpIWAcIpW1RQeKjyIp02VJU=; b=WDKB552d6vp6xc
	0cKoPUn1nfngGDGoqJoxnk2Yax2mvfwDZ3Ygcf8x9K933GNxabd2/QVavNlZjRvR+aE+GHxigZv2W
	I8tZV+t7yHnObhavKbKd5f9WLw7QB4aVW8GBGBLx3VFzSBvoSlin2vREr/h3YfsnvXsF46ZLZ6ydY
	QDe7tCeb9aN/QKzCc/9nemYo9dcc/Jwqa2e2xKnA+1aj8CB/EK5UtYFHYD2jQArEULOxtzf66iCfA
	ZGftDfkgf9xC3h5yacXd5o3hQW9NNEJb7xQUzM28zbrG56uxhYvY08Qom6DDdxff/aTCFGWWvqu82
	3vsdOkMyfVUZn4qtiUPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urado-00000001K8L-1ATW;
	Thu, 28 Aug 2025 11:18:04 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZoY-000000018kv-460T
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 10:25:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLdLhoqOkosfc7RAoqbK7FOQceJ6qDRHYcIMK1xsKSjqx7T3zN35hM0jGQ+Olf41U1GuNr/H11iX7Mg8Rviln7d43r00TuMYs1ZG6R+csPTb2Qv3jBNEEKj+vHwfPBTaHS+BhyfxUoyaWWMTTuNVN6o6g5+gf7XSPXOyvOSIIhsc9bEtYsxJruVLFlc8tKRtMubM64cR1oA8eNX/D4JXJZxUaryu8Ur0KbrKOaLW1zKGibMV4qpcc992YGJ8MYOY3yqgMzWYMWOujPeBGzcEjYRW3xfd7P+gyG5/6AS8HN5UeJiNnDwbBk/7slQDovhCgOcvC9tXo8hak7bWbKP+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OATL8/fjPpoliwHCh+gVyPBtysYYMGux8gDcbaId190=;
 b=cYMKu51T7ZJse8rqxYK43yp8NvwkQtCdHGPDGlFeUMaqweufIDGYqWlD+X99p1tDyHp4ySNKGRgsXX/cPpkAvUOt6gWmfRSnrGlHzJI7ZngRq15Ton9hNo6uE2voRf43OEJhlSqoV8/xB2D+BI5X4egdnIv2fnprOD1lTX2/35mWr/rTnWGTkFdHVbd53wacihhjc4Tb3sTAB3qfWe0iQvNjgljudzsDxIazgmCCmpvRuwZl6g9fup1GD9eYFbN07uAyHpGgqypFB8D0yrvg7cN/C9vGhIj+Qg5UZ44/ayUWWN57CyD6NaX0BnYGapiCIbdGM87Q3y4VdxsD+Yxp/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OATL8/fjPpoliwHCh+gVyPBtysYYMGux8gDcbaId190=;
 b=feRsgvwST99Bt5LrwNhrGXZy9d5MenxUjXQxlwzxHvFwxkexLug+/5fN/fPNa+uLV8iTH2x1EdafiVNgubPFCqBq3XfXJlAocQOn4WYn0/F5wRBVvuwtZUnpJDeLzbGY87YJECqf9x5OhDxfrj07v9GGDpOQl2m+zjhRmtZH2j2FnK6f6k7AeVxhRf4ry06FHPqitLrx9LqLYedlTu52MIKy8mbkLUvSJnUldoSdwOZGQY3NpH6BhIMfmnKIUawKD132ifIBRbz7bJlmcRdNYsLr16hNvzXprhDIvop/2w3wc/OsIQFArvW76TfSH3JYbTJyR6CULV6ZpI8N0giyUQ==
Received: from DB8PR09MB3260.eurprd09.prod.outlook.com (2603:10a6:10:105::13)
 by VI1PR09MB4256.eurprd09.prod.outlook.com (2603:10a6:803:13d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.24; Thu, 28 Aug
 2025 10:24:54 +0000
Received: from DB8PR09MB3260.eurprd09.prod.outlook.com
 ([fe80::cad0:cb5b:959d:f7f]) by DB8PR09MB3260.eurprd09.prod.outlook.com
 ([fe80::cad0:cb5b:959d:f7f%5]) with mapi id 15.20.9052.023; Thu, 28 Aug 2025
 10:24:54 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "devnull+aleksa.paunovic.htecgroup.com@kernel.org"
	<devnull+aleksa.paunovic.htecgroup.com@kernel.org>
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
Subject: Re: [PATCH v6 0/2] riscv: Use GCR.U timer device as clocksource
Thread-Topic: [PATCH v6 0/2] riscv: Use GCR.U timer device as clocksource
Thread-Index: AQHcBs12repHpSIFJEu3XipmITYBdLR3/kgA
Date: Thu, 28 Aug 2025 10:24:54 +0000
Message-ID: <a17a89a1-cdab-4082-8cf7-bb6ec456a51b@htecgroup.com>
References: <20250806-riscv-time-mmio-v6-0-2df0e8219998@htecgroup.com>
In-Reply-To: <20250806-riscv-time-mmio-v6-0-2df0e8219998@htecgroup.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR09MB3260:EE_|VI1PR09MB4256:EE_
x-ms-office365-filtering-correlation-id: bdd4fca9-5ca0-463d-136b-08dde61d2143
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018|13003099007;
x-microsoft-antispam-message-info: =?utf-8?B?dmQzMkVMSWU0V3o2YUZkUHZyUkhpK093bWU5S3BkUllaQ3NtSnE4eHJnV0Y0?=
 =?utf-8?B?ZWsvVEw4dUNiUW9DcitZQ0N0eGVpRWVvL09CY0ZvMmhSajBqblhacEdBWVZI?=
 =?utf-8?B?TkVVTzIwMEVrekdTR29DN00xMEpaQSs1c05BempPVk9YUHVRaXEzSHZhUzk1?=
 =?utf-8?B?aGxYVHJMeXduenhVcmJjdmNjM1YzTDZBd2V6dHVsOXlKN2NmVTRVVjBjREVp?=
 =?utf-8?B?a0c1ODN1a3BIS1pad3NrVzM5bmpEd3dUdVdUU25EZGpkMFNMTTlmODRrWlg4?=
 =?utf-8?B?ejlKOVZMRlNtOGo0bEs4SGFwVTJGaC9QZ2h4cnZ0dzVMSHorS0hYMkhqTFVl?=
 =?utf-8?B?ZGl1RWp6SXErS1Y2RmNoVHd0MGNVTU91S1V0azFJc2J2eUFWZEFrVGJHK1J3?=
 =?utf-8?B?MGlOZTRIT0R5dzdYTDBXR1E4bnFJQzl5YkJaSTR5MCtSZjlFakxXSGNTcStx?=
 =?utf-8?B?VnpaZWl2RGlkd1d1ZVJxN3FjV3NoL0ZtN0ZJT0FaT1MydE9OZXlxbjlTYm1K?=
 =?utf-8?B?ZlBkYW1hcFVKTzVHd1pqUURPYVZWTm5MRmlWTUg4OWJkOXRDY25WZ3N6YTc1?=
 =?utf-8?B?Vm9hdVdvbW9NYzN0Vjd5ZTZZT0pWOUJMSkdvelVBZExyNVRLTHZRTCtkMk1p?=
 =?utf-8?B?RnFxcjVWdnNGZWhhUTRORnMwaGFJazhYbU1JZ3NEdTgwT3F1ZU1aU3orMlpL?=
 =?utf-8?B?M3oxdmpUczdzWnZwWTBKaTJjQjhCV29tdDR3Zmk1RnFibldBZU4xOEN5N2hO?=
 =?utf-8?B?eTFpdVlNUnMvMXdQbmIxZ1FJVnNQZXF4RjJrbmxQbnQzUCtXSmE1alAzRHZj?=
 =?utf-8?B?WVJUNmlDQ0tUSmZ6OHpSaC9VR1pZZk9jQXhHWHluSkJqOC80U2F0S2ZyUHBJ?=
 =?utf-8?B?NzYvU09wQnBkdDc5RHJZdnFIOE0wQzFETnIySG5mVFBMQkRheE9KdnNhajNR?=
 =?utf-8?B?aGRvaGNyODUzS2dORzBpdEdXc3FlNCtvNVVWZUYvMTlJNkUxd1BNV1dTdUhq?=
 =?utf-8?B?SWdCeXREdlYxVjhDV0J1VytnU1pHSWxOZThvSFNWMW43RzZWYnEweko1cHp0?=
 =?utf-8?B?Ym5Oam1RK2xQak42eUJPVzNqZ01mVlYybmVGbWRyT3NJYUpJQitGWkpUVHZm?=
 =?utf-8?B?V1d0NlhXdi94S0RGZlRXRVdrK2wwakxqay8xNkczSmI0QmpwQjA2MTNqY09a?=
 =?utf-8?B?MkhSQzRpcWQ1R2FLMkRFRUhvTjFja215N0h6M0tzR2U3UGVpa3JGSDhveGRZ?=
 =?utf-8?B?Uk01NlNkTHBtUVFiL3Z5SW4wRTBWOGtEK25KWGVSSzZNZk4zTHMrNjNWYjdT?=
 =?utf-8?B?TklWUnc4VmdiM1dxMW1wdStwdWVpcmRwSHN2SUg1dlRHNWFMUE5NbUJPTFhS?=
 =?utf-8?B?TXNZeWMreDFKdzYvMmw3aWlQQUR5WWNlN3lKczJDTWR6N0xjaU1oYytCRHZV?=
 =?utf-8?B?ZHBEcExldUZCcXRJdW93K1VKSFNvNEF6c1JONjEydFhxMDVLOGRZOXovMTBv?=
 =?utf-8?B?YTZoMkMzWlczRk9lVzZnVTQ4b1B1alIrVHVaSkcwaHhlTWw4SmY5NHVhTDBm?=
 =?utf-8?B?bS9pQ1l0ZWsrOVZqcm52aUtXLytaOVFpQjVjZGU4bUV4SkNHSVdmak5YeDdq?=
 =?utf-8?B?SWFGVjNLcitRWXlWTStQZ3lkK3BaczUyYnVEazBoY1lTUW16ZkRCSkd6Ti8z?=
 =?utf-8?B?S1dMZEFZdlBKUU14NC9hK2o0U1BVbFE2Z2ZBaTI3NGJsYytGYW1icm5TSVFt?=
 =?utf-8?B?dW9NZ3lKS2RnZmtnQ3JGSjZPMS9Hb2tSWFhtSjAySGdLMzRZUDFUeWlLM1lY?=
 =?utf-8?B?Yk40ZVlURUpFZE1sWUw0eDlzSDN3RkdMd1dxencreE85U1YxL0Zod3QzUU52?=
 =?utf-8?B?dU9ldGVnNDlOcHBpZ2hkbUV3UGlSSGhoVExhYnE2S01wblA0RTVIZjVTb296?=
 =?utf-8?B?UmtxTkF4VDNISzFsRmxQWExYU2pUaHVaYlE4a0gxWHh0c3MySFJla0dXQ2hI?=
 =?utf-8?Q?9s5lGyfn0jjOY4tRRvmN7pDPu8Y2go=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR09MB3260.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018)(13003099007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEZ4OC8wZ0xVTXFSZTFqc3hkTmN6T0NNWk1vODQydis4L1hUa1I4RWZ5Ujh0?=
 =?utf-8?B?T3lGajhvSFAvak9LZFEvT1pmZ0k4bURZaHd6TUJRZ2xKcmxOeitVMy9lcHBM?=
 =?utf-8?B?ZGo5L3c2UEd5amhCM2VLbEliQzFVd1NJSkNUYVRER3Z6ZU1PZXVieWJJTGh3?=
 =?utf-8?B?UVF5WS93bmY3SVQ3WVd2Q3E4eTh5aFpjYVc3MnhtN2FiK0xJWld4Tm1VNTJi?=
 =?utf-8?B?M3Z6VENYT1ZDQzNTcTRYUEZEdXU0VDNGbWhRYTgzOFdxdjdnUXZrNDZ6dWxL?=
 =?utf-8?B?Z2RZcU5iczArNnh0OUN2K0RCbTNsdEgybTZtU2tXb2ZNTEVHdjRta29GZjF3?=
 =?utf-8?B?ZmtrWldpbWwwMzJxUTRKQmNzZURGalBWc3V2ZE1UaE1Tb1hZdytXSjh5ZzNt?=
 =?utf-8?B?YnBVTzhVblJETEZMNklPdzRLeTMwamlTQlRsNVBTRzZXNmN4SW5uZENHeUtk?=
 =?utf-8?B?d0ZZdmZoSWo2bWxpTTUvYzFvdU1PMUJWRmZnbWh6NkdHYzRRam5MUVBFemx1?=
 =?utf-8?B?WnQ5bUdMUXN3bEtmdE9JNW1ZOWVOYU5Rc3hDUW1LZ2xvOEdvdzY3TXpKYktV?=
 =?utf-8?B?bTlTUjFCSmgxK2ZSRGtoZ0xqbjFXZFZOQjliZzVOalBYdWtmMVpLbTZ2Q1hr?=
 =?utf-8?B?eXVrS0tMNmtweGxvdzNoMVd3U2JvaWNOdWdiWmw2eDMvT2JOQmc1R09ta0Z0?=
 =?utf-8?B?ZS8vRkh0eEtKdTFsS2d5c1F2WDFmb0swaHU4Y0U5YVE0b2tVRXgvY2t0MUIy?=
 =?utf-8?B?TjJpRXdCRWx3bGRuTndTdEVraVVnOWRsbEhnZWtncVQ2a0I2aE5Xc1piaTUz?=
 =?utf-8?B?aDdGcnZPN1h0MUVGNmlpZlNFK3RQckUvWVdBRkxiWVVuazlNcFpDVGFnWFBx?=
 =?utf-8?B?TklDcUFkUWxOZWNYVUhtY3JwS2g5V2xmUy9GSk1KWWdmVlRZd29MYVpFVVZq?=
 =?utf-8?B?ajRodzVxZzBDVi90V002YzJBMlFMRW51cUVuOHRpZWZTOWlpeTJQa3c4SVE1?=
 =?utf-8?B?VlhOb0s3cldmc3h1ZFJkdHJ5T0Y5THM4RmR2RzdHVDM3MGVGK1h5NmlYSmF0?=
 =?utf-8?B?eEh0MGFEbDhrR2dKVkhMTjZOc0J4RUl6YXZpaHdJZ0w0V0VIaldHenVPYWxu?=
 =?utf-8?B?OFp3blcrNWpMWVoraXZKUHZ6b24yMVJ0TXBsV3NXUjhhN3FLREVHRklFK0F3?=
 =?utf-8?B?bmtQUmN0RVJSdHlFbXhwY1ZJNVR3MzRsd2dNb1J5NzR1WG81eFhybHdRRmRO?=
 =?utf-8?B?RzBlQm9vN0lnTC9veEdDRVM1Mk44NnhxeC90dSs4dDVpR1dCOFVjR2tuVDY2?=
 =?utf-8?B?RE92V2xHcjh2NTFRNmVYUkFaSVlUdUNCVkFOMlNyR1FhMTNUOCtCUzBZZ2Q4?=
 =?utf-8?B?T1lYYXB4UklTTzZSanlLZlduY1AyenJrT2dqTnRlTTMwOHgxY0hWSVZwajhs?=
 =?utf-8?B?QUtWS3hqSWhuNUd1dkEwZ2JRalFMNWErR1duS25CYlVDMXYwVkxpNTNtSEhR?=
 =?utf-8?B?bkJiVzNwZjRwWXBMSVRWa3V2bXR3UTBoRnBtblB1bzhaM3E0YU8yRlN3UjQ5?=
 =?utf-8?B?clB5dFhlU1UwbVUreTkyMG9Qc0cwQjlUTXdkVGt6ZXE1ZmJiQUV4RHFDcllq?=
 =?utf-8?B?MFJuT2FwQjJWUTVGVUdTU1ZoclFRTXlUVGo4Z3VWMWZIeDc2a2VoMFdkUkFO?=
 =?utf-8?B?KzQyNHJHM0x6ZFk5Rk5ZMGxsd0UweURtTDl3STdrWklFK3ZjeUcyekNPUmdo?=
 =?utf-8?B?emRWQmZ5ZHhONWZzaEtXMWRYRUhreTMvQ3R0MlZrRXFaYUFZaTl6blQ2M2hN?=
 =?utf-8?B?VmtPR3BSUmRIZGNLelJIQnJDR293VWZPSVRVVmVJZm1vWTNZcis1WkZDc3NO?=
 =?utf-8?B?dW5US0JHOHQySlEyZWh0aFdJLzhCMkNJakRINFRMb1ZOazNVL1VKd2QzdlMw?=
 =?utf-8?B?dzhZTDRBZTNsNlNHTnZoQ2RGMVlPbzFocXRhbmhNYjB3cHVrSDFQanV0WGY5?=
 =?utf-8?B?MXRYeVBJQjQ5STc4dFJkbk9lYkZSRzNVQ296Y0tmRGIrMTFwSy9oVnZNSGlk?=
 =?utf-8?B?bks2MWRRT3FWRDhNSUJKbW1RcmhVNjBXaVA3MFBxTGxTQ05EczViWG1US0ly?=
 =?utf-8?B?V2NXMCtSQXVMaWNKRlBqOERwZE1GUDBBRjlnZzE2K2ZzcytkcXZuTWxZUTRB?=
 =?utf-8?Q?SlOzsNHVad5psYyvFwS1NdA=3D?=
Content-ID: <E60373D0C2B43843A521074F7DD86273@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR09MB3260.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd4fca9-5ca0-463d-136b-08dde61d2143
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 10:24:54.2628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KBsWzZhHE0LRDO30ZhDgPjKdVp1KDbG9MPE3XKSsHxFKCxVr5HnjdDjO+w8wtsXAdI30iXN7ENYLw7bTcjt0hNyCW41CTbHErT/bQAglbME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR09MB4256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_032507_045590_D7CBADC9 
X-CRM114-Status: GOOD (  17.81  )
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

On 8/6/25 14:26, Aleksa Paunovic via B4 Relay wrote:

> This series adds bindings for the GCR.U timer device and corresponding
> driver support. Accessing the memory mapped mtime register in the GCR.U
> region should be faster than trapping to M mode each time the timer
> needs to be read.
>
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Gentle ping.

If there are any further comments, we'd be happy to address them.

Best regards,
Aleksa

> ---
> Changes in v6:
> - Rename mti,gcru to mips,p8700-gcru
> - Link to v5: https://lore.kernel.org/r/20250711-riscv-time-mmio-v5-0-9ed1f825ad5e@htecgroup.com
>
> Changes in v5:
> - Fixed build issues on 32-bit RISC-V and sparse warnings
> - Remove clint_time_val and clint.h, replace with riscv_time_val
> - Depend on RISCV_TIMER in Kconfig
> Changes in v4:
> - Remove "select" from mti,gcru.yaml.
> - Refactor the driver to use function pointers instead of static keys.
>
> Previous versions:
> v1: https://lore.kernel.org/lkml/20241227150056.191794-1-arikalo@gmail.com/#t
> v2: https://lore.kernel.org/linux-riscv/20250409143816.15802-1-aleksa.paunovic@htecgroup.com/
> v3: https://lore.kernel.org/linux-riscv/DU0PR09MB61968695A2A3146EE83B7708F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com/
> v4: https://lore.kernel.org/r/20250514-riscv-time-mmio-v4-0-cb0cf2922d66@htecgroup.com
> v5: https://lore.kernel.org/r/20250711-riscv-time-mmio-v5-0-9ed1f825ad5e@htecgroup.com
>
> ---
> Aleksa Paunovic (2):
>       dt-bindings: timer: mips,p8700-gcru
>       riscv: Allow for riscv-clock to pick up mmio address.
>
>  .../devicetree/bindings/timer/mips,p8700-gcru.yaml | 38 +++++++++++++
>  arch/riscv/include/asm/clint.h                     | 26 ---------
>  arch/riscv/include/asm/timex.h                     | 63 ++++++++++++----------
>  drivers/clocksource/Kconfig                        | 12 +++++
>  drivers/clocksource/timer-clint.c                  | 20 ++++---
>  drivers/clocksource/timer-riscv.c                  | 34 ++++++++++++
>  6 files changed, 128 insertions(+), 65 deletions(-)
> ---
> base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
> change-id: 20250424-riscv-time-mmio-5628e0fca8af
>
> Best regards,
> --
> Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>
>
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
