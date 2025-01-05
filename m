Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CFDE77197
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jan 2025 08:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7elH9qHLi2pLN9o7MLk3O2zO9S4Eq0h3DCTBC+VTtcU=; b=ri5Sxhnyfl+h9k
	7Xqy4oW4f9TT1IA3Lb5ZXiRB5FJvsJSg2a21qB3KcMRqgDMjalCX5OkaqOKKSvRfhP1jteRWDdl5o
	yem4sac0mWZK/VHTrRq4zyb8cdaSabtqx8aQRUxkl2UI0EjjJtkvEHvrsGDlgrqbitm/h3I4s1QWk
	EU/Ktn7NfdD61bYV7rxMOD74Z0lw3TZBgPxra3fB+OAlvDJkqJa300O8HnheJT2Xc2sbO5rs56sQA
	zMG5Nl7GbpgIzgWgUdcq9xyy2KZHT3/8UvcS1gzpL6Z6dGpqhiKNMnC81ZvNr7iNHBGw9SkNs8qsO
	zvY8wPxh+CuOacL7ONMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tULl9-0000000GVrq-0Tvc;
	Sun, 05 Jan 2025 08:13:19 +0000
Received: from mail-vi1eur05on20620.outbound.protection.outlook.com ([2a01:111:f403:2613::620] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tULl5-0000000GVr9-1J1E
	for linux-riscv@lists.infradead.org;
	Sun, 05 Jan 2025 08:13:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iq/d+vCalfubzd5c3krfggN2torH/uVyTKaY4CqbciF0CGeMvtya/GzxOirbUsKUF0E1LJnSE2q+GSPopa+zmmgyDLvz/eW1lTE+I/0ItV+IE6fhDR30fiCDApDIJXheAa68N7xEGW2SfV3pRcISwVl6sBHUmLGvJOHq+iwpMkGLpWvbf7dqybuqu5c1hH/9nq2l1uCOQOgjDgRsCugp3XtCWGwcc+GKPnYtgAACyI+DHNARFlj7rC8VwhVfYpcpL3jFqvdBNuDunnpPuvGsKFm1dr9l8QN4sMtqE6bOug3IS3u28ycibngncp1m3B9IeSP5Sd6OkK773yGwkxIbFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3i2+NRz9attaGhQmmhr5LMBM5zPSm5jvwGbG8nkJho=;
 b=FMFqRismafhHvXivfzvbR6UKccfKRmTWWjk/jtcq84adQaFwNbU2NByIIBwoHPPBBiD/N9CgNNFKkiRvwXZPz4+YnUyw84iLv/wnIBJ6CImPijvC0zvnxfz7vjsAr1gkPnrjD4suqEyRfrTdylGoUTECi9desxZB65/Lp0/TJ9BXKHp7//lCeemkpabWHgHVLaBw8vxF2qopbONCcniknXPWEwESxRWpeFAihMSnma1sxF/aOM6T/n6UxTUExAjzCYLvcNIo2elSinY1o73cHsc28XJAQTrw8gncqgt+aJqDQ8zVUD4RACDtr8o6g3v9srRpXWKvhG/jBfGWDERKDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3i2+NRz9attaGhQmmhr5LMBM5zPSm5jvwGbG8nkJho=;
 b=gD496mbC8fOhqXgKRPv6WooIJxnqxigBLqhJ7ha68jJU9Bw1SJGQqL0w5JEjByiNQnPN9Fc6Qaza+uPvQi3ReqQ0RR8ufmi0S1YX5s2UWKOfuHQFsrOFREc2Bs9ozfnFiFRY4tRa65kaoy/Wc7F8Hk4sxlNQuK4LS+WF//TxvwI=
Received: from VI1PR09MB2333.eurprd09.prod.outlook.com (2603:10a6:803:82::16)
 by PR3PR09MB4330.eurprd09.prod.outlook.com (2603:10a6:102:3e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Sun, 5 Jan
 2025 08:13:00 +0000
Received: from VI1PR09MB2333.eurprd09.prod.outlook.com
 ([fe80::fef9:cf7b:cbc2:d3b7]) by VI1PR09MB2333.eurprd09.prod.outlook.com
 ([fe80::fef9:cf7b:cbc2:d3b7%3]) with mapi id 15.20.8293.000; Sun, 5 Jan 2025
 08:12:59 +0000
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
To: Anup Patel <anup@brainfault.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] irqchip/riscv-aplic: add support for hart indexes
Thread-Topic: [PATCH 2/2] irqchip/riscv-aplic: add support for hart indexes
Thread-Index: AQHbXPqNFcr6QGksckemYmPir0qzALMDoyuAgAQ0LoA=
Date: Sun, 5 Jan 2025 08:12:59 +0000
Message-ID: <VI1PR09MB233382AE574F4D619B8525C094172@VI1PR09MB2333.eurprd09.prod.outlook.com>
References: <20250102094116.3847894-1-vladimir.kondratiev@mobileye.com>
 <20250102094116.3847894-3-vladimir.kondratiev@mobileye.com>
 <CAAhSdy3RaJEnUJEB+W+7iTJ46c8r8vWUh5HBNe5utpxFv-zr0Q@mail.gmail.com>
In-Reply-To: <CAAhSdy3RaJEnUJEB+W+7iTJ46c8r8vWUh5HBNe5utpxFv-zr0Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR09MB2333:EE_|PR3PR09MB4330:EE_
x-ms-office365-filtering-correlation-id: 68def8fe-c1c7-4d4f-15f6-08dd2d60c499
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WFhnTll3MWtsdVk0STlmaEVIRjBYaXBISnR1MjlsZjZtV0lqQlZ3eE85bVZL?=
 =?utf-8?B?dkl0emdCYWdKTHlURGVWWjdWcG5EZUNPRWJiR0s2Yy96bWx3dXNHajE0VTM4?=
 =?utf-8?B?WW40UFJaQk90ak9iWWtseUxQVUF1SzBmT2R5bGtwaTB1NytkNjUwSEhheVFp?=
 =?utf-8?B?b0p6cU5KNkNmTUw2dVllQUNwWGNubG1WR0J5aEM1V0hJS3drSndka1hXdUwx?=
 =?utf-8?B?RzBOS3kxTzdmWE5OK3FMNjBrZVdmM2ZnSEgrUlh2OU9CVzN6WC82WU9jSndW?=
 =?utf-8?B?MVJKZEd0dFVLenUwSXYwK29XL05qSys1ZCtIbWNpMWh4RkIzcDcwcHNDakI2?=
 =?utf-8?B?OG9Yby9jY0pGSXV1bGZRaVBySGpuZWZFN20zUkdTZ1J3NHJLOXdNTGhHaVRK?=
 =?utf-8?B?NTI0c1VIRUV1dkU2L1pnemUvQ2xDMW1ZdGZYMTNPN2xMb0RJbUVTZ2ZseS9K?=
 =?utf-8?B?N0ZPQnJvNFNHbDJQWWlsZzhaOUFYY3VWQkJLVFhZNHQ4cVVQcGZYTWwxZmUw?=
 =?utf-8?B?YkNyRy9waExDSFlqSjZCNWZpZzZqcVFOQVlNSVArU3lUTGxaN3lGQ1hMOEx3?=
 =?utf-8?B?YWM5Y1ZvY0FmTmtZcUduYU9VV3RLZW80L29MZDBUUVpHZjl2Ly8zd09zU2Vv?=
 =?utf-8?B?RFFSN1NDU2NZU2F3MTI2NTJXMTltWGtZdHBMc1dIOXNESURJeDJNM29DakNO?=
 =?utf-8?B?UXpSZk5ZdlIraENIMkNHTWxGYnk4Zlp2VzBSQ0wvYlVxZG9nbXBZSzhlYWY5?=
 =?utf-8?B?Z2xhL1NuZW54MVJkVHpWUXVLSm1oYjhlWUdoZ3dCTC9JbWJGYjdyQmc1bGQr?=
 =?utf-8?B?SC9hRHA2c1pFRkNqc2Z0Y2lHa1FIaU5iSGVUTDNFMkduWGhnQWRYczZvc0Qz?=
 =?utf-8?B?YjRBRU9YWFR0TDNCc0xrSzE3Sy9WL0ZPRG9qWUcyUjlrZmo1OVJJQ2dIZGtC?=
 =?utf-8?B?RWhReTZ3TmF5MVRwNU5kMDVjdUtKd0pQLy8zU21yYzBmdnVIMkZobzlhL2lh?=
 =?utf-8?B?cjkxSVhFUnh4WTU5ZzE3UU9aR2RDOGozRTNYWTJIUkNVVDkwZGJ0U1FDdUFo?=
 =?utf-8?B?Y2h3aW0ycUpVR3B3UEF3eFlFUlhLQlZJNTdzUk5hYUhoZEhvWEpiOEF3NTg1?=
 =?utf-8?B?U1FoM0ZTYmtPcW5qMmF2OGRuUXpVbFlySXdVN3JLN0cxa2Y0QXB1c0N5UWFL?=
 =?utf-8?B?NVZQUDF3SFN3N1h4YkMzSDJlVTRSTGZ2aDQ3c296Mm04KzVIRGdYSlNKVkRm?=
 =?utf-8?B?VWRlWjV2aHRKZ05zb2lqcUJ6VlJxejJONG1ndGlXNVBuNFdUamhOSTIzRW9N?=
 =?utf-8?B?VHU3R2JzTFBlUXVGaWY3TC8rU0xLUmdkNXpWRWMzbDh4Y1NVSGZUcFp1K3lH?=
 =?utf-8?B?M1ZEbXBicjNsOHpxTnBrdHZZc3ZmOElYV1ZuVUFHK29HcCtJZ2JFcmVuVS8x?=
 =?utf-8?B?SXpTaVVXeWpzajBzOTF3L0VHUlVBbEpya1pqUCs3cUx3RG5IMlBGc3hjSWw2?=
 =?utf-8?B?NUVoZ3o5RUlZaTIwTFZsZnhQejdRUWpBd2RsS05SaWRRbnAweU5KZXA1cFNS?=
 =?utf-8?B?S21HRUZxMzhxNTlBQ09ZQVQzVnFxVXVTUWZDeitSK3VwOHRNVTJzRHdkNW52?=
 =?utf-8?B?b3BCWlpkVDlmcWN1eEN1THRLNjhHZ25aM2tCaVVKRkFCdU5PT0ZXOU9tb3pS?=
 =?utf-8?B?dHp3UDBYaFhocklFelkvUUUyNURsWXdyWDFiY3Jqd3hsQUl0NUQvd1MwU2F5?=
 =?utf-8?B?ZVpsanN1TUMrNU0rMlZmbmR0Y0ZIL2lldmlLQ1oxSFpNK0czWDFKTFZjNW5O?=
 =?utf-8?B?MEVxN2NCVWVNRVkyKzZFM2M0cEdTTHpLUGJGMGhqcVB2NjJJZWxaK1MyZTdL?=
 =?utf-8?B?ajBUalRqMVNHN2xpaEhaNldCSHduRzdLcCs0KzB0MGI0UW9FTlhPUFZ6N0JM?=
 =?utf-8?Q?ibTP9UJk3P/Su4ERITYIqz8yU1qjXXeW?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR09MB2333.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VW52MktnTzFXSHhCdm84ZVY0aDcvc2FBNDlYL2dGN2c5RHYxSmpibHpCVTA5?=
 =?utf-8?B?TU0rME9QUGhtYXlrK3lySG84U1VBVzZlTU5VMWJ3dVRJSGlxdnVwTXZGU0Rl?=
 =?utf-8?B?YzBadlJxOFllUXVyTGViRTNpYlo4eGdCUkNtWEpDRUtOaGwwY3M0MXE2amdV?=
 =?utf-8?B?ZkNtYjIrUEtHTEdwTHFsVTFLZmxLdHZqMWx0OGVlcjZ6WldKUzNWeVpRYm5i?=
 =?utf-8?B?d1dUTXhFSm9lMm9mTXBKUUJhSzNJcTZYcS9NaVFPVFA3b3lGMTNxa0NGU3FV?=
 =?utf-8?B?ZlpOVkpqamcrZW5CLzZEY04vL0s5NDk1WnArZENSNGx4Rm9jZGRvNkNLTDZR?=
 =?utf-8?B?TUwwSldvWFJaRXVHUkkrZDVOLy9EQlA4ZDZtbWd3djNaQXliZzVqZmVDWENZ?=
 =?utf-8?B?YzVleExKeFhnTnBmT20zMERFbE1VeVdFRitIVFRIVFFQWllEc3F2L2d3NWV2?=
 =?utf-8?B?UVRMcUhhVFFvMmlRbHNoY2xXYzNFNzdtUExXWEN2VzVtSTJVZW52YnNVbWNn?=
 =?utf-8?B?SHRnNVJlTUMwUm9saUJlTDFMdkJUa2graW9yS0wrOWUwMll5N1J4VlVjRHNs?=
 =?utf-8?B?VklFd0ZoQktVdnVnbG9tTXJYUHQzeDIvOUlFTjlZWUNMQ0V5SU5PMTN6TVIv?=
 =?utf-8?B?ZHNZZEpsUmNoeXA0NmtoMEswUVlqMnQxTzYrMEJORUt0d2pSRGtpbU11cTdM?=
 =?utf-8?B?UEZaaHprMEFMN3JRRGlYUExsTmtpclJMTzVzQURneE1pWFY2Rmd0bjIzUWVa?=
 =?utf-8?B?VXQrUk1GVXVQK0lHdWVZbEE1NEdvMlJyUWtVRUY3dnY2RjkzRW5iWjJrQkFU?=
 =?utf-8?B?R3l2eGVZNzVNNEFPZE5KT3A3a3A3NitCQ3hTb3dXQmZpT2hKajJvUGV5ejlP?=
 =?utf-8?B?UnA1VkozTWwvMm9Jdy96NnZBSTZrMzhtV2RBY3JaWjk0RUdkRXd2dksyL1Y1?=
 =?utf-8?B?SEs5NDE2MWZXWlNtRUN1T2pEUlVWR3V1ZEdxcUdXMWNXTVRzOHJhNXZEcWNU?=
 =?utf-8?B?QjErQjAzOE1sbnFKUEJYRGxBSnFKYUVaMUtya202SlBSWmxOV0JYcHcyOE56?=
 =?utf-8?B?OTJGa05OUFE2My96bmIrV0MyelE5OGVEUTVueWpXUk1jaElLdVpleTUxbUcr?=
 =?utf-8?B?c2Y3VndZMC9DSkFGeGFLSnVZendWR3NXUjFwYXNla0hpSmRNbHh1UDVzdWl5?=
 =?utf-8?B?NnJrUnAzTWx3S1JqREVUMXFIQ1gzcWZMcTYyL2JRTnBhNjhiTTg0ckNLR3Uv?=
 =?utf-8?B?N2xHd2k3a1AxMGcyeG03TlgreVl0Y2d5SWo0WHV6cWRyT3JyU1lLK25JbmZw?=
 =?utf-8?B?N3p1ZThNN0FTaGF6eUlDQzhDZGhhelFyVWhzaUdXQ1lDOXlsWm1Qb0xzSkl4?=
 =?utf-8?B?NXAwdWlvMnVTekErUEd6d3lXTlFvamRHeS9IOHR5Y0lnYUxMbXpOU0VTL2lr?=
 =?utf-8?B?R2loUFhmblJjeUthbGJGSWxTQ09JbkhyWjJ1QjZTUDhWSlpJTHNuR2gvRnFu?=
 =?utf-8?B?SlY5aXJuSXQ0TWpub2FvOExuQWFZbmMwczQyazM5bzdwdWx3eFA1RVg0S09B?=
 =?utf-8?B?VVlLVlYvNXR3U0Zjd3V3Z0JlcVRaNUJsN0xTSVhEdlIwc1ViODV6aVpHaFVT?=
 =?utf-8?B?THJHNmpXN3VNeDV4Nm43bXpFZVQwcUcwWlNPc1VZYnVvRkd0S1JCOGpZMXVu?=
 =?utf-8?B?Rkw1Y3k0ODUrV2JiUVJLd2pqSHpMMmtDRjFPYVNzeXpoL1FxTHhBZWo1UXBC?=
 =?utf-8?B?NnNOcDhzcXppR21ITDIzSVpyM2ZTeTAwQUZWSlRDUTB2OSt0TklDZ213a1dm?=
 =?utf-8?B?KzFDRVE4ZnRtbDVabVUyNzdBUDlGaWVuVzJGT0FiSnFqSjRMZ1dpUEZ5Wi9N?=
 =?utf-8?B?SWhMeTYzU0VMZktlazVjMkUyamZkUk5OaUtsRHlZU2NLMVJ1YWZlNnlGL2dK?=
 =?utf-8?B?Y1lUZXVCWjNzK1ZFZ2h2cmRLeTkrNStNa1pMRTZpR1BSbUlxTXhPUmkvMWVa?=
 =?utf-8?B?KzRibktrbklsbE5hcU1UQ0EvbXU1TGVobkJxOFpvaDFlbVE3VTdVU0FTVVNE?=
 =?utf-8?B?VzV2US9mdWhUcWVndFI1Y0hZT0V2dkxBYUpmZWxTMmRZRWJGdnZqUERxU0RX?=
 =?utf-8?Q?rMPUUjLsuCHkAmb7Mwy+OaPsh?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR09MB2333.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68def8fe-c1c7-4d4f-15f6-08dd2d60c499
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2025 08:12:59.4869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H67vxrU/IeZPOjDLeWAwzQtSvo+IHdEoVJWMe/a3nXMhwnzTz5be+Ynw02MObbZeliYKD6iw90oWSEIllT7thQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR09MB4330
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_001315_555228_3FA1DF4E 
X-CRM114-Status: GOOD (  11.03  )
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

Pj4gUmlzYy1WIEFQTElDIHNwZWNpZmljYXRpb24gZGVmaW5lcyAiaGFydCBpbmRleCIgaW4gWzFd
Ogo+Pgo+PiBXaXRoaW4gYSBnaXZlbiBpbnRlcnJ1cHQgZG9tYWluLCBlYWNoIG9mIHRoZSBkb21h
aW7igJlzIGhhcnRzIGhhcyBhCj4+IHVuaXF1ZSBpbmRleCBudW1iZXIgaW4gdGhlIHJhbmdlIDAg
dG8gMjE0IOKIkiAxICg9IDE2LDM4MykuIFRoZSBpbmRleAo+PiBudW1iZXIgYSBkb21haW4gYXNz
b2NpYXRlcyB3aXRoIGEgaGFydCBtYXkgb3IgbWF5IG5vdCBoYXZlIGFueQo+PiByZWxhdGlvbnNo
aXAgdG8gdGhlIHVuaXF1ZSBoYXJ0IGlkZW50aWZpZXIgKOKAnGhhcnQgSUTigJ0pIHRoYXQgdGhl
Cj4+IFJJU0MtViBQcml2aWxlZ2VkIEFyY2hpdGVjdHVyZSBhc3NpZ25zIHRvIHRoZSBoYXJ0LiBU
d28gZGlmZmVyZW50Cj4+IGludGVycnVwdCBkb21haW5zIG1heSBlbXBsb3kgZW50aXJlbHkgZGlm
ZmVyZW50IGluZGV4IG51bWJlcnMgZm9yCj4+IHRoZSBzYW1lIHNldCBvZiBoYXJ0cy4KCj5SYXRo
ZXIgdGhhbiB0aGlzLCBiZXR0ZXIgY2l0ZSB0aGUgdGV4dCBpbiAiNC41IE1lbW9yeS1tYXBwZWQg
Y29udHJvbAo+cmVnaW9uIGZvciBhbiBpbnRlcnJ1cHQgZG9tYWluIi4KCkFkZGluZyBxdW90ZSBm
cm9tIDQuNSB0byB0aGUgY29tbWl0IG1lc3NhZ2UKCj4+IFN1cHBvcnQgYXJiaXRyYXJ5IGhhcnQg
aW5kZXhlcyBzcGVjaWZpZWQgaW4gb3B0aW9uYWwgQVBMSUMgcHJvcGVydHkKPj4gInJpc2N2LGhh
cnQtaW5kZXgiIHRoYXQgc2hvdWxkIGJlIGFycmF5IG9mIHUzMiBlbGVtZW50cywgb25lIHBlcgo+
PiBpbnRlcnJ1cHQgdGFyZ2V0LiBJZiB0aGlzIHByb3BlcnR5IG5vdCBzcGVjaWZpZWQsIGZhbGxi
YWNrIGlzIHRvIHVzZQo+PiBoYXJ0IGlkcywgd2l0aCBoYXJ0IGluZGV4IGZvciBlYWNoIEFQTElD
IHRvIGJlIChoYXJ0aWQgLSBoYXJ0aWQwKQo+PiB3aGVyZSBoYXJ0aWQwIGlzIGhhcnQgaWQgZm9y
IHRoZSAxLXN0IHRhcmdldC4KCj5UaGlzIGlzIGFuIGluY29ycmVjdCBhc3N1bXB0aW9uIGluIHRo
ZSBkZWZhdWx0IGNhdXNlLiBUaGUgSEFSVCBJRHMKPm9mIHRoZSBIQVJUcyB0YXJnZXRlZCBieSBh
biBBUExJQyBkb21haW4gY2FuIGJlIG5vbi1jb250aWd1b3VzLgoKRml4aW5nIHRoaXMgdG8gc2F5
ICJmYWxsYmFjayB0byBsb2dpY2FsIGluZGV4ZXMiCgo+SG93IGFib3V0IHRoaXMgPwoKVGFraW5n
IHlvdXIgYXBwcm9hY2guIEFwcGx5aW5nIGlkZWEgZnJvbQplZjcwODBiZDMwYmEgKCJpcnFjaGlw
L3Jpc2N2LWFwbGljOiBTaW1wbGlmeSB0aGUgaW5pdGlhbGl6YXRpb24gY29kZSIpCgpXaWxsIHNo
b3J0bHkgcmUtc3VibWl0IGFzICJWMiIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
