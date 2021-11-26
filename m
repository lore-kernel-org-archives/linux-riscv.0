Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F8FC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 10:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mu6jNEflcnx4Z+uTbcZo7CHq+ADPUADx1R0xaiLTXHI=; b=k/DmNV72YFI2dZ
	acCwypMkA+o7B8fmaKDiXqdCS2dFgkpOP6EEgxV1HVBvIJH1wYqa9T/MmCMKwhZpZQyz3CiwAzXmN
	vl0bNPxGItWk0IFY5V39lGKX5c2U1BhXqDTcQrMpX1h/q+ctMMS9HP1aLAvYL0VKUV1pN9ixAWXJj
	NKhv71wqS43+QcGN27L9dDSi+WYZ61vlhXqp0oriV8cSG/CHs8XcpLmkME7djWfpe0IutVTr72Iu2
	Fbdb7yYqxnoihY6xQpbulHixfrFfo5g5MtysNtCsNlBvuqfI3do9UWMMWsq9g7DHDVbVnOddov062
	+QpxFte0U8o/BPL4kCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqYl6-00A4tJ-Vy; Fri, 26 Nov 2021 10:47:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqYl3-00A4sM-FK
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 10:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637923629; x=1669459629;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZLCV5OwdFnV3m43PiVZnoCyRsZgN78C58T5A35SMsNA=;
 b=urZPWslTNiri9uLUm0BiORGJSh3eKFBRafuKCCJn74jvaV5CRr/xp7Ir
 xeB/UGPwXdCtlg60yMvQMeDH2vispsR+aw6NGRKd1/SzNo1QOXEYXtknE
 ea52NIk83IowETCCc4kEYqOeHtgqqq3lfRqTeACiMlfiCzaCdybULzJYq
 g0jhEz1J1O7sKNOWFNT93S+QdZ/wHn/QnQHj7IW3C29HvaKEy6M+hGv4F
 LooZb7meBSYAtkktHQIYq3TlgEffvc+ZrLfC65mSvQVdIIuTtuJ1i1QP5
 GkRv6EAZ+f3kYune61EzNhScyeO/aUGAAYQvOt/gwqs6fxFrUMeuWY4W2 w==;
IronPort-SDR: IG85QTVLx+8dH9QpAf0prLghw3eP7/wOkGvjFi3Cc7pk1PYh6D7Di36/P6/LaweQHAafX6ixnn
 OpC9VpedPug7M3+JkyajdSw2R2G1kb9UIPuMb20zFGB2nmMPEFhXTYQhiv0vaGcEcgeyW+Fd7A
 H3of6Wj9l/73fSJIvPjIp/RuCV+a8JATzpLOJwZoOmcz5TXMX+WdJLpBzNLRA1RtVQZ2v7MeSV
 dFQiLt3TbF8vwjoGfZxCTVp7csjrjuJQg690B5iCPUcmSP7iQ8g60FP7UOGlZsWHrAvNSvzryY
 uRJn9QAGmu50gxf/mjtKqpHS
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; d="scan'208";a="137808770"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Nov 2021 03:47:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 26 Nov 2021 03:47:08 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 26 Nov 2021 03:47:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6SPuG6W2xzwZjOSZ/UGw8BzBOWPnIXx3445EmJscNo2jHUCnWLPaY8bwy67mWuA657ySzi+FuKgKUD5eEHeuQWGO2CMRNG1WLUjIVi3kZiQ4xmMAp/xj3nEbvodo5sIIgz2AkqL9LzXoZ0/bz4b089gAaInEvc/IQv0amSNWFqi7BdnQiWxHLP3X2TOmmPNeW1bgTBZrfmsjbbszHEe9WulBarjOxDYN52f7lMmbo9wFcOVvf8sEQn3ukDFuSYyMCvVXE4K4zvWV5yU32g4laihxs8VsCvjCjDI/n646tK4cN/AhUW971kp0MkKx1O0yy61CYw8MXRQr5So/tUOaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLCV5OwdFnV3m43PiVZnoCyRsZgN78C58T5A35SMsNA=;
 b=Jp23aVnqhlL3skGfRM7hXIAkm978m9sWd6XI05mpzQ7IE2BBxCwuCgls3RMoxFn8kGrOctiOmXdTDjAc6+269Crgc2vRUMtEXrhI42icEW0RT2my7m/yVUn1pYQJhkwunxHWY0s2sXykXsUS/iFXZMuFRh5B8Fw2Bg5AnLFrQJIgC2r4M3rYDWQnDrNc7he+lhJa2U0kuIPoVyKZ2U+VIXRjYRdmrkkkAdsoRvHvCLsb7acQQJurs4BWDRV9T7n09Tysp33FZ552pQpvqpurar0Evlr8oGg3FiOi1QOJkrLhSqJZ251Am95SqT8qHKUjD3+3K/8X9RpAJE+h4Je6Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLCV5OwdFnV3m43PiVZnoCyRsZgN78C58T5A35SMsNA=;
 b=hTL1di7iZx4HYZinNHOV9Pg6Kb6x++Q+iz2Ko46/KR5nfVWklaZpkNEzeOSpERvVyMZiu+llsnEYZ/3uZHFiM8J6zCu2k22kacygOG0DOtHb5HDIlyIixUqUefoCRdYjoE81LrRS0MOzgRV0zyu1TZl0h1Fo7rFU+Bpg8SidXss=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1776.namprd11.prod.outlook.com (2603:10b6:300:110::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 26 Nov
 2021 10:47:06 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f579:5f0c:dfab:2d27]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f579:5f0c:dfab:2d27%6]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 10:47:06 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <robh+dt@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <damien.lemoal@wdc.com>, <Lewis.Hanly@microchip.com>
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 6/9] riscv: dts: microchip: mpfs: Fix reference clock node
Thread-Topic: [PATCH 6/9] riscv: dts: microchip: mpfs: Fix reference clock node
Thread-Index: AQHX4hGSnfyPBPrmmEGmKCXbzlxSC6wVkVGAgAAH1ACAAAkEAA==
Date: Fri, 26 Nov 2021 10:47:06 +0000
Message-ID: <e029ed79-74de-dc82-9973-f8b1b767a08e@microchip.com>
References: <20211125153131.163533-1-geert@linux-m68k.org>
 <20211125153131.163533-7-geert@linux-m68k.org>
 <3b8442c7-fafb-421b-cd5b-4b57d1b545c3@canonical.com>
 <fc4a0c49-1a3f-68d6-de54-820d3e9c0938@microchip.com>
In-Reply-To: <fc4a0c49-1a3f-68d6-de54-820d3e9c0938@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4edda921-45b1-4796-25cc-08d9b0ca1719
x-ms-traffictypediagnostic: MWHPR11MB1776:
x-microsoft-antispam-prvs: <MWHPR11MB1776C94DFB8062C8691A8E6998639@MWHPR11MB1776.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uEdusQbV7PJX54HLfiFG5TjO/gd1+ZmnbPj4EhErh92LkJ495Hd1XOj+hLQ8lcA/zjFlbUP/OU9/MTzTGs3H5hdAs6VqnZwNtlbLKkg328mz7qrS96Ld4VDAMC4Lv4MYtyidBGdfUncRoPYPmQupzOnPuGYOD5As0M7+oF06d/h9nMc+6QsNGghDp66o/uNMIDEOFKbbLpPelU7GmUDaI0ZxozHGH9K2JzVnOAqGjQez93H4nTrqgAESwiHawdLAvh71NSJJx+nJSut/1aC54b285shYaBj9c+QwJt2i3IVVe2jUY+adFq0gB9Gn4dGsbhKMafiLZx2TlY/oxpV/I6HAxd18q4MKGEmE8/75WuWtaRFso9GI8Wj3ySKGsLKb2juxuAXXMlWVRWlcbEmNJDacn7bZB1QAbbd+JJgY8aKtNDwyhZl0PlnsD49g+csIxHRNZIusyTCZyHrLLSwoX/QvACVLs+/+Hz2UeDqkxrx+DLbn/FY5bqJDMlVglNaAHSCUAnr7G1H1eO/czVJQOSoJ04xX+VhTD6JRUc47ZvK7pkHZtrAouu3SavLrRgODk6d5La4c9ZTUK+iAwET0yJ6/moJ8xocpr2zhIC+2ocpPhXEAxf32knAwydqAWDiU3Jo3fVaizKIldy+VpL6JkhOcPEbLTJsx/yHUdgd+mnjhSULANGTg1B68H++yZRIrSSMopVOtK9pN7abZxReq77RL6I5mmebCDhg7zdGl0fNvFxtFymAcOr/wBmICKzDvVO9GYxQtVlXUmyc/LC0U+Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(508600001)(86362001)(54906003)(110136005)(2906002)(38100700002)(8936002)(83380400001)(5660300002)(6636002)(8676002)(71200400001)(2616005)(6512007)(316002)(4326008)(53546011)(186003)(122000001)(66476007)(64756008)(66556008)(66446008)(38070700005)(66946007)(91956017)(76116006)(6486002)(31696002)(6506007)(26005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTQvU21QWktHa1c3RWlEV2Z5RXQ4VXJ5YTJTNkVCZE1QQ3ZrRnRWeENCMWl4?=
 =?utf-8?B?Z2NoZkF6N0RTcC90WjB3aTh1VFVVbG1tNmhrWi8vbkZ2NGFlMnU2NzFlU05N?=
 =?utf-8?B?WGtiNW8zZklYaDFIQTl2WERHa29iQitoMTdhaVRTL1V5MVVWYUdSMW5xMGhh?=
 =?utf-8?B?RitlZjV5bVRtd09jYlpKWC9wdHNYc3NHNENuQjJ4aUVwUTFZOVNqTkViK1h0?=
 =?utf-8?B?UzhXWWppY1hLT2dCaXJwd3J6K3R1aldmZGhKcDV5RXhzVW0vUGQvNGwzWjI4?=
 =?utf-8?B?d3BVbW5rZ2E5YVQyU241bzg3eGJCTzR4VmxHaC84TTVaL01hNmdqcUx3a3cy?=
 =?utf-8?B?cUdoWnkvWUVvdGxJaVNsNlYvRThXUWdoak1KdXJGU0pDeHREdzlTMnQxTnEw?=
 =?utf-8?B?bWMxMHJoN2krdDdWQWlYbmF3dGcxeWVwcitONmMrWnJMTWk5SnVlOEt6elQz?=
 =?utf-8?B?ek1DS2xCcENhaFVnQ0ZaWW5UMThVM2ZwZUNpWVlPcFBaczRBbnR4dEx2ZlNO?=
 =?utf-8?B?T0s2RWpGUmw5dVhSQXdtNk84dHhQK2hWK1VDdmlDc0EzZkZFV3Z0VzJqNG5x?=
 =?utf-8?B?WmxhTExsVTR5MmdISmgzZVIyWU9KRHlNS3R6eXZQUFgwVFI3RWVPandOZXd6?=
 =?utf-8?B?dXlTbk8rSHJDVHlPT1BHMVhnRDRlZWw2dEpKQ2MvT3RNM2d4bzNRR3VPankx?=
 =?utf-8?B?eDlTMlJKMjJ2OUR6TzJGVkxuelFiT3FRTDh2ZUN1UTVEVFFLcUxLVWRIa3Y5?=
 =?utf-8?B?T3dnSzh1TE1TZXpmUXpTTlBQdEZXTVNCaXozVExIR0s0WlRSOU9JY2tCaFVH?=
 =?utf-8?B?SU90U3Q4VEd3N3MybnU1Z1YxdkhYOGNBV28rT082d3h0bWkzWCtsckM0SFlZ?=
 =?utf-8?B?YWJwbG9GUnZnZmF1MzZyOCtqMVpLNU9LblcyZnE2eW5UNFB0aklRdDJRVjl2?=
 =?utf-8?B?YVVIL0N1T1Q3ZmJSbkRaRkMxaWhxZVQyYXY2RStrRTdPbGhkOVEwM1JzRWJo?=
 =?utf-8?B?M2N3VWNpUWc4ZmtjN3FUK3k5ODRtYi9YU2hMYjNzRy9vWjdWOCtqdE0ySjE0?=
 =?utf-8?B?N0d2YUl0VFZNVUxLWXdHbjI2ZGwxaHAxL3FUOWFmYy9BY0ZXSS92UEIrRE1v?=
 =?utf-8?B?M0xPa1VkY0x3S1lBRnpPU0ZOa1JEa1NOenR5VlF2R0s0VTZGbVVvU1RiY3oy?=
 =?utf-8?B?aHRLSXIwZlQwVGhJd0lsT0JBc0pZdEdYQUxPdlp5K1VLN1hxNkV6TXVrL1Rs?=
 =?utf-8?B?T2RXWlNROFJGcTQwd1BOTnZ0cTlJVS9JVUl2YnJpQXl2TUhBUGFwUk5wSFdT?=
 =?utf-8?B?ZmNRRVlEZUZVVXdlUVE1WVBMK1BURGloUWRvYXc0a3ErZlc5NytBMmNaNnhE?=
 =?utf-8?B?Vkd3QU1ha2duZkhwZkI1NWlpOXpFU1V6b3VmbEVpNXRMamx2KzlUMXBGL0lq?=
 =?utf-8?B?UVRjN3BJR3NwL2VrL1RHNXZERHJSUDBzQWptektocnZ0S0VOTTh5Tmx5WitC?=
 =?utf-8?B?Vmk3Y2xYQ1VnQ2JtSDByL0hWYjIzcENydWl5a05xeTN1SWpTZGZITnU3dUli?=
 =?utf-8?B?VmxrRzZCQ0JmKzdnUGRrZDhCUnV3aXpMVkI2RHZrd2lucjZvMnhtS1BkOE1I?=
 =?utf-8?B?Z2YrVlFiMmo5QjFTMDl3YTBLenFTWjc0VTl6Y245MHZnekJpSHZ6am5QOG1M?=
 =?utf-8?B?NmV1NjdvTHRsWFVUdkxSMWhNS1ZwT3F5bDBIZTZPTnBaTlI1VkpDYWc4Rysz?=
 =?utf-8?B?K2QxZjRGSmpheG5VZHpFM2pFMWY1azNwTDlrYnNXdXNqN0RWQ1RubU5QTkRs?=
 =?utf-8?B?SUZsaUN0STZNdGtBdWNuUlgybGtHSU13ck1xdVN5Rkd3bkZxbGZIbzU5TThP?=
 =?utf-8?B?NU9rQmtyUy9wbnFocEs0cE9xczh4bVQyVGliaTgvOWpHRGVEMnp0VElZNGFM?=
 =?utf-8?B?Zk8xOGVhMy9qRXNJLzlsNFpCOEVZVXBsVlBWSjlXbzZzU09nNDNHd2hvMDd2?=
 =?utf-8?B?UEZSdGlLVGZLSk4zTjRzSHhBTjJDQzAwbnFpSWRTVlF1czV5OTJLcGt3TXQ0?=
 =?utf-8?B?dGI2UklyeklTZjZObkhDYUkwZzgvSWlMbnlCakxpamFJQ1J2N3o2QUFmMDhX?=
 =?utf-8?B?cGF4OERYQ1ZuWHlPdkFHc1hqREhlWmJkMWNWM3g2YmhYa0ZmUmZNRVJhdG1r?=
 =?utf-8?B?YnROTTIza2FFTk01N0hUVmJQQlNqdDN6RkV4bTlmVXNBTGpmcUluSDQ3dWJY?=
 =?utf-8?B?VnExQThoV0FkNDcxY1hVVGZTNVVBPT0=?=
Content-ID: <89237535B6E90B48A28AA2240ABF4287@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4edda921-45b1-4796-25cc-08d9b0ca1719
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2021 10:47:06.5230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eL0tBxvFXLmSpavZ2JnEMv3oI39diYltmiQT98OTJxsbcuTvfepc9kh7/rUKU2A/AUsOLRgpQatBkUVzbWUVkXTXx1PDtgbaDGR4p7/I+pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1776
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_024709_603003_7F52134F 
X-CRM114-Status: GOOD (  17.35  )
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

T24gMjYvMTEvMjAyMSAxMDoxNiwgY29ub3Igd3JvdGU6DQo+IE9uIDI2LzExLzIwMjEgMDk6NDgs
IEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNs
aWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IA0KPj4gdGhlIGNv
bnRlbnQgaXMgc2FmZQ0KPj4NCj4+IE9uIDI1LzExLzIwMjEgMTY6MzEsIEdlZXJ0IFV5dHRlcmhv
ZXZlbiB3cm90ZToNCj4+PiAibWFrZSBkdGJzX2NoZWNrIiByZXBvcnRzOg0KPj4+DQo+Pj4gwqDC
oMKgwqAgYXJjaC9yaXNjdi9ib290L2R0cy9taWNyb2NoaXAvbWljcm9jaGlwLW1wZnMtaWNpY2xl
LWtpdC5kdC55YW1sOiANCj4+PiBzb2M6IHJlZmNsazogeydjb21wYXRpYmxlJzogWydmaXhlZC1j
bG9jayddLCAnI2Nsb2NrLWNlbGxzJzogW1swXV0sIA0KPj4+ICdjbG9jay1mcmVxdWVuY3knOiBb
WzYwMDAwMDAwMF1dLCAnY2xvY2stb3V0cHV0LW5hbWVzJzogDQo+Pj4gWydtc3NwbGxjbGsnXSwg
J3BoYW5kbGUnOiBbWzddXX0gc2hvdWxkIG5vdCBiZSB2YWxpZCB1bmRlciB7J3R5cGUnOiANCj4+
PiAnb2JqZWN0J30NCj4+PiDCoMKgwqDCoMKgwqAgRnJvbSBzY2hlbWE6IGR0c2NoZW1hL3NjaGVt
YXMvc2ltcGxlLWJ1cy55YW1sDQo+Pj4NCj4+PiBGaXggdGhpcyBieSBtb3ZpbmcgdGhlIG5vZGUg
b3V0IG9mIHRoZSAic29jIiBzdWJub2RlLg0KPj4+IFdoaWxlIGF0IGl0LCByZW5hbWUgaXQgdG8g
Im1zc3BsbGNsayIsIGFuZCBkcm9wIHRoZSBub3cgc3VwZXJmbHVvdXMNCj4+PiAiY2xvY2stb3V0
cHV0LW5hbWVzIiBwcm9wZXJ0eS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+Pj4gLS0tDQo+Pj4gwqAgYXJjaC9yaXNj
di9ib290L2R0cy9taWNyb2NoaXAvbWljcm9jaGlwLW1wZnMuZHRzaSB8IDEzICsrKysrKy0tLS0t
LS0NCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQ0KPj4+DQo+Pg0KPj4gSXQgaXMgYWxzbyBsb2dpY2FsIGJlY2F1c2UgcmVmY2xrIHVzdWFsbHkg
aXMgbm90IGEgcHJvcGVydHkgb2YgdGhlIFNvQy4NCj4+IEl0IGFjdHVhbGx5IG1pZ2h0IGJlIGEg
cHJvcGVydHkgb2YgYm9hcmQuLi4NCj4gVGhpcyBpcyBvbmUgb2YgdGhlIGZ1biBGUEdBaXNtcyBs
aWtlIHRoZSBHUElPIGludGVycnVwdCBjb25maWd1cmF0aW9uLiANCj4gVGhpcyBjbG9jayBzZXR0
aW5nIGlzIGRldGVybWluZWQgYnkgd2hhdCBkZXNpZ24gaGFzIGJlZW4gbG9hZGVkIG9udG8gdGhl
IA0KPiBGUEdBIC0gdGhlIG1zc3BsbCBvdXRwdXRzIGFyZSBjb25maWd1cmFibGUsIEkgY291bGQg
cmVkbyBteSBGUEdBIGRlc2lnbiANCj4gYW5kIGNoYW5nZSB0aGlzIHRvIDUwMCBNSHogZXRjLiBJ
biB0dXJuIHRoZSBtc3NwbGwgY2xvY2sgaXMgc2V0IGJ5IA0KPiBhbm90aGVyIGNsb2NrIHNvdXJj
ZSB0aGF0IGlzIGFjdHVhbGx5IG9uIHRoZSBib2FyZCBvZiBlaXRoZXIgMTAwIG9yIDEyNSANCj4g
TUh6Lg0KPiANCj4gU2luY2UgaXQncyBub3Qgc2V0IGF0IGJpdHN0cmVhbSBwcm9ncmFtbWluZyB0
aW1lLCBJIHdvdWxkIGFncmVlIHRoYXQgDQo+IHRoYXQgcHJvcGVydHkgc2hvdWxkIGJlIG1vdmVk
IHRvIG91dCBvZiBtcGZzLmR0c2kuDQpTaW5jZSBpdCdzIG5vdCBzZXQgKipVTlRJTCoqIGJpdHN0
cmVhbSBwcm9ncmFtbWluZyB0aW1lDQoNCj4+DQo+Pg0KPj4gQWNrZWQtYnk6IEtyenlzenRvZiBL
b3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNvbT4NCj4+DQo+Pg0KPj4g
QmVzdCByZWdhcmRzLA0KPj4gS3J6eXN6dG9mDQo+Pg0KPiANCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
