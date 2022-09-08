Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1738C6FA83
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 06:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uMQ2CrV2sn0KUZjBC5comdKU/sdoxE7XvP6c2MfKJDw=; b=Ab1fQR3TRACgpZ
	tW8q21a19n/WHozI2Bss4Swvrs/ZIm2JKvIXpcUa81o0dXj2I3CWF0dWeI0P9oy8G2lZU0CFEiYxf
	cfA7tXfcKEHm5kwv+n+ECu6eCshufMhNBQbqfWXsv7j5npKTXvR4jZHuFySIvrwOMJBpqRLBq/ZMq
	bORdaHbWymaePgFoGGoL1LxY83AQvSK2B5t198AK9ESnUcegBm8b+cPdqGqijdXkxP4E+n34OUSAu
	3pSSrqIoQbK2Ym5RLPbgY88xa9sI8uLfkuhc4fQOc9ah1D7zacXkx1bOtwfZttuc6LnqSKRYCBKSl
	HJRgVFEFluXSzcdSSNbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBIc-00HWtT-NZ; Thu, 08 Sep 2022 06:46:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBIZ-00HWqv-I8
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 06:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662619563; x=1694155563;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=P1Lojcx2YWOVInHtw+eKe1yMvkeY2d52VtorRTd8cxY=;
  b=BF7hBULsa8ntOzzEFNW9PSA/7kZS8O5LvYWGXDhrrf1wwxqE0w9xYqEB
   gYUGHYw3Q/rtsT0JFbyl+Nb+BQLLDpzmO2g4xh7gWKjWoh7MOX5Vwg5pS
   0VNhznHCmvmbXPHtnluM3CJbCHZGoD6ouiJHAxtbKZb9ggM6pkq7ZBfqF
   NSk1AQBq7H4ATiGKZvF2ZF5AMgVqylTUWEqjDLg/165CUJ+yyCsT8ykOB
   3EsBqklLz+aby7iWuHwXhB3I5YEloVS2c1C2H3SSqDd1EwFp3pkzbI3zN
   ZkOd6MnPguR+bT9J6G1rR55gAW6q03tLvbsq/PWqAg7yLftIPW+Eni5To
   w==;
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="112686443"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 23:45:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 23:45:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 7 Sep 2022 23:45:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUvJtWqqAzOC8JrnmLG6E/aZ6r1IJ5f3Y59GaKOGTApz5+UPaMdyf0IyKD2HtaFuatSQn7ff/c3HFRvZwDLCGj0kBA6E1oofiD+RrxHNB4p+3GyYLk0IoGe/9S9stGXuCHNBngSr6Tq+/92q0kHnXljMEcyjtylOH6blS8ZSMcgzn0DYH/uYs5sHOzVnxcKL0C48sEzayHlbCOGNgFLoIdYFt7eCKnOWyBtfU/+rEK9Op6Wt3YKoAzsqQE2eygd33XQQU7t2yi0FAn2N6bapVgSFUMxBHSNdNHWUCTTn8j/cs29VZFPQPMFlUK5tqCVHD8fJntSV+qMxpHoBeqx2BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1Lojcx2YWOVInHtw+eKe1yMvkeY2d52VtorRTd8cxY=;
 b=G3PQ2GeJV6r5LcCRXWlbBnpfI56iwGP5ePMfN3sX8g2HdBxV1u16Gy6IYlHC2tkqpXLQAyzo22VyXx4U017FN+VnC+kgT2PY4cynGZveitUg6EkhHJ8pjsa38aa31dfQq+/6m2ODKkf8oZrKLdmRRqrtphwGmUUniZ+uFSGebkVBBn7e8AdZwEEiiVoN2RzuSkWsYd/jWo8rYJqXKP2btlU7IwU69kz1Yt0HGSkXME6NG7nU7JWV/lQsDrEykz1U9V8qWfMCS5uR/i7JAmhtPHaXniFmss6h1b4S41dAtpMVEhoqhh9aRvFjDYtCDA/dVy0MLUUuvo0fFiheDsAsgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1Lojcx2YWOVInHtw+eKe1yMvkeY2d52VtorRTd8cxY=;
 b=GFQk+gt+0X9Vv236OoGKdzg1x0IkoA2GuJhSF9vlVYyjVkRUd3hzrdnGeI2loRCYllCLtnktCqiJIihfS/Vhj00qObMF7Ehzluzx6vlyG85IxXAliWb41Umc05ZhNsRK0Y5XDXQMjc0t6s3p2K5xSjdFHa8AsBzvniIYTk4hRMk=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by PH7PR11MB5766.namprd11.prod.outlook.com (2603:10b6:510:130::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Thu, 8 Sep
 2022 06:45:48 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610%11]) with mapi id 15.20.5588.014; Thu, 8 Sep 2022
 06:45:48 +0000
From: <Claudiu.Beznea@microchip.com>
To: <Conor.Dooley@microchip.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<Daire.McNamara@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 03/13] clk: microchip: mpfs: add reset controller
Thread-Topic: [PATCH v4 03/13] clk: microchip: mpfs: add reset controller
Thread-Index: AQHYw06gcYslIcMXbkKmEr2H/zkOIQ==
Date: Thu, 8 Sep 2022 06:45:48 +0000
Message-ID: <ed347cdc-ca39-000c-8386-376dd833154f@microchip.com>
References: <20220830125110.2372514-1-conor.dooley@microchip.com>
 <20220830125249.2373416-3-conor.dooley@microchip.com>
In-Reply-To: <20220830125249.2373416-3-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4cd74170-defc-4d04-0016-08da9165c35b
x-ms-traffictypediagnostic: PH7PR11MB5766:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5eHqo3CEfaoG22d2Rgmia8qoEL6+tLKHlGO189nkiVTZp3Op0+f13iNW4Au7owdyGdS4wAd7eEBWplDSK6b6Kr+E+Tnm+7brpU+R21+nAC0NVwBDA/9bdrQSW4its9V1z/vKQFeuzGuZqhuEQL42luBoIJEvE7H0HOVx+r1oLLXvA17xpHNEKF1fLY9K5le6sHdg9nBdIvrKxQqfthdzW9Jc+5WIq3B4kM8ZnwAwXk81VdfHlJBY/AHIHKLXNrHzBpz0byJeEAcOEC/RNXAJ9/3PAHsiEcdGEy2jg25PolZillKYX0X3MsLWuJgr0UlIyFYEUKW7FhFOBRx4t8A8OU+4X79kjbmkNRLbURkkDvUpRXPLu5aPVXvy7EeRo4d7/+CR9bbs6yRPrXx0o6M8Px2AjUOUyJElKK5+hV08grZ5dpgY7ExGcW4UfNsxsqiclImtlX/6VYsWXokliJot3/Tl5Z5xAxf9bxSaSECbIVJE70IWXN4AAhM40Jjwub9qQ2BR5p5paa8QKJiGVcrmdlhBXESS2iy3UgAk4uEpvJIdw2yD/POsIIFABHFDNOSpdH6zNVQXQBZQvZAnNz6heDo0EY5TkNPOXkuCyqNg0oJNaBci/jjgqnnOWYWOzMZ28WMQdHHF3aCPF9r3N6kCIHlCpR2JPNYEYhYW+E7F4snd2K6N3QEa4XBK+EIvwqKj2tSQT2XhwB26g4irwocCOUrlPoUh6DxsXsENpepH6hFZjhvOe07ATbsJq4t/TeuS8kquwWmD11CvYTG7uXDExhP8kO2M6K7JmJZ7lftpWQqBjgYzyKOTU8nwafKewhdiaDu9+ayNH+l5Bap4sKObmA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39860400002)(396003)(376002)(346002)(66556008)(110136005)(316002)(2906002)(6636002)(83380400001)(6512007)(53546011)(6506007)(478600001)(54906003)(26005)(7416002)(5660300002)(38070700005)(31696002)(36756003)(86362001)(8936002)(66476007)(91956017)(66446008)(66946007)(64756008)(8676002)(31686004)(122000001)(4326008)(186003)(71200400001)(41300700001)(38100700002)(76116006)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0tkcEoreGFmTkpMVmZtREFNV0xkT3VTUnJNSUlDUUdMWUt5OGdER01SRnFI?=
 =?utf-8?B?VWpENE82ZUNQbDR4VjVUSGNyVHIxbldiVHZVMFpQZ1NwZ2FLd0tEMFcyVWdV?=
 =?utf-8?B?RXNpdmVmWnZ1VURQYU1hbjZ5cGVGR2tJZDRqaTRCVjZQd01Jc1dmbnVUOFdN?=
 =?utf-8?B?QS9nQTVFYXpMMXNhSzBPbFlxQ1RNNENqUGUxRkpUa0VmNGpnR1JvZWVRSnYr?=
 =?utf-8?B?NU1QYWhiSDgvemlXN0VTQzJrU0JhYXd0d0dZS0VmV0EvSG50SVplSkZseDJW?=
 =?utf-8?B?V1o5RDAvR1FyaWYvTGxlVFpUZG9lZHpodWtOZXV4Q2N1d21ONExiZUpvLzBY?=
 =?utf-8?B?VVgyMVJrUS9TL2pKa1FuNThuTjJxQi9UMEdnMjlxNGgyTkcydStWY1pKZWtM?=
 =?utf-8?B?MndqOW1SY21mYzRya0NYTVdyZmorYmY0WGtxdlNybUtiaUFUciswa3ZXTy9L?=
 =?utf-8?B?NEJoTitsQVliSGFjMHhOWndvdURiN1dZQ29lUkdnRDhyRDlNWCtEa1o2RWt5?=
 =?utf-8?B?NGpWaDNRaThmRDZMR3dYbWp5US91YU01R3VIVEV6NUM3NlYzY3B0Ulc3MUZJ?=
 =?utf-8?B?ZUI0b29JWksrVmUxWmZ4QnVMQ1F3OEJveHFSVFl3RzVjRHZsVkl5REJTRUdT?=
 =?utf-8?B?YUk1ZFZpMTd2QW5laXJpY1NhSGRjWDkvamNnb1YveTFvbGtxR0V3Wk12K3ds?=
 =?utf-8?B?WVRBL1VKTmNhWVpxRkVERFBrdWc2aHkvN3pKNTVHTU9xeUUvTGNraGpURGhJ?=
 =?utf-8?B?dVUzVHBrK2lUbnFXTTJia0lGL3ZkYXphVjdhYXZ3SFFLcDdISDFaNUUvOTRF?=
 =?utf-8?B?MmVobGJ5emJiV1Frb1Y1V0RyamJLLzlMUzl6a1VQQXY1VDRNNUZoUU1RSnZ2?=
 =?utf-8?B?QzBNNkE4SkpCL0NaWUtiRmc3b3kxZGE5L2pDdkFicWV4b0lmdy9sYjB1RDU2?=
 =?utf-8?B?S2thNzRrdUNxdjltRmFTdWxrNlNUWFNFWkRSMGZrNGo3WGhlVi9JSno2UVhU?=
 =?utf-8?B?WS9OZU9SRXFLN0o2eWdVeEpmVXQ3MjZ6SnJQdHdVMC9UbGpmaWVQVUpxVlhI?=
 =?utf-8?B?VkcrM01WcTB5eG5ObW8yNUdaaG5NYWRGNVRLVHZrYTdDcWhUL0NqUy94OVpq?=
 =?utf-8?B?NXRkVmlhVW5EZ2RseFUwSDRvZTZPS0FjcmNUV3Q0V3U2ODZLVVhlRlhhWkl0?=
 =?utf-8?B?OEZDbUNjSDEvSDRaSklUNDFiUEVUdUZSVkJTZ1l3Wm5Ib1E0U2dDMmVSQi92?=
 =?utf-8?B?Z2F6ZklDWTRoaXhIcmtIc1FrV3JhK3ZsQ2tGSXFQQmtEL2REVXowNTFMbmo4?=
 =?utf-8?B?dWxnamZSS21YUFlTbDlibmJRRjBkOU0ySURsS0Qvais4RVF5L1dEOXNjbW1H?=
 =?utf-8?B?TkcrSUUyYWxSK0JFaUMwRmRKR3Jwejl2bHJRRE45Zm9vWlVDbk5UalMvVEhq?=
 =?utf-8?B?ay9QQkJhNWRZcFp3dHd4cVFVdDh1ckZScHVEMHZxakFXdGpGWW9ucUMrL2l3?=
 =?utf-8?B?YlB2UUFoWGsreklleHpqZzBiQytnYVBUZXpFWVNUL2F0TEk2b3FPNFp6VzNF?=
 =?utf-8?B?ZHIvQlJVa0tFWm16RDIxbllzUVFQaUxPMVUzMHRsQVFURUdHQ21rU0dnQlA5?=
 =?utf-8?B?Sm1KbkpZRE9PWTBHU2dra001U2Yvd3VBWHdMd0I0NHBsMnZJaTdPWjNhWXdZ?=
 =?utf-8?B?UXJIRm1Ec3VrNmJXcm8zV0VJRi9iNkpxc1lNZDRLOUV6NEpjcTZQUDFLVmQ3?=
 =?utf-8?B?cFlYVDBwc1BjZnFPa1ZWbWNBQ1AySDJjVUZTSGVHakFVZ0ZEbzN4cDcvUmZZ?=
 =?utf-8?B?cEROZkxBd1MxMnBMb3pnZXlrQ1NzdE9xK1JlTm12SVY1MTlTWmR0OTlYQzBP?=
 =?utf-8?B?UmxSRnc0cGhlbVNTa2JkNEU2NXpFTldsdkI0S1V2QnkvS2ZBcVBiQVVZNnZ3?=
 =?utf-8?B?ZHpCai84NW5STGEza1pGWkU5NVQvYlpSNjFBYUxqVmw0cUpEb0NMR243ekxX?=
 =?utf-8?B?NkRBVGdyczNZL0h6ellHOXVRSE1sT3hYQTh4QXpQWmpQaTQwcmtkUy9SUmFL?=
 =?utf-8?B?QzBxelBQVEFRcFpYV0ljUUw5cVlJMldMUCtUQjRyc012dHB2QjFHaFp5OW9U?=
 =?utf-8?B?Q2s1bHBBc0h0MnlxU1F1SFFYbGZsNnpvT0VKUENVTkoyR3Z0ekN4MW10bWRF?=
 =?utf-8?B?TFE9PQ==?=
Content-ID: <8844859FF1558D4682EB2D953AB8C886@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd74170-defc-4d04-0016-08da9165c35b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 06:45:48.0966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vftewdXEkQB5odSvOuAkAKs8tOEbUeyQzFRgc0eKaTp2l53lzExno6Yae8NLnKdh6Y+CUGjJeM5QwjDV3hgcVzjIYEHe95I+8LNmOW4iMKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_234603_770565_9C08748C 
X-CRM114-Status: GOOD (  22.95  )
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

On 30.08.2022 15:52, Conor Dooley wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add a reset controller to PolarFire SoC's clock driver. This reset
> controller is registered as an aux device and read/write functions
> exported to the drivers namespace so that the reset controller can
> access the peripheral device reset register.
> 
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>


> ---
>  drivers/clk/microchip/Kconfig    |   1 +
>  drivers/clk/microchip/clk-mpfs.c | 110 +++++++++++++++++++++++++++----
>  include/soc/microchip/mpfs.h     |   8 +++
>  3 files changed, 107 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
> index a5a99873c4f5..b46e864b3bd8 100644
> --- a/drivers/clk/microchip/Kconfig
> +++ b/drivers/clk/microchip/Kconfig
> @@ -6,5 +6,6 @@ config COMMON_CLK_PIC32
>  config MCHP_CLK_MPFS
>         bool "Clk driver for PolarFire SoC"
>         depends on (RISCV && SOC_MICROCHIP_POLARFIRE) || COMPILE_TEST
> +       select AUXILIARY_BUS
>         help
>           Supports Clock Configuration for PolarFire SoC
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
> index 9e41f07b3fa6..43cc9583cd14 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -3,12 +3,14 @@
>   * Daire McNamara,<daire.mcnamara@microchip.com>
>   * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
>   */
> +#include <linux/auxiliary_bus.h>
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <dt-bindings/clock/microchip,mpfs-clock.h>
> +#include <soc/microchip/mpfs.h>
> 
>  /* address offset of control registers */
>  #define REG_MSSPLL_REF_CR      0x08u
> @@ -30,6 +32,7 @@
>  #define RTCREF_OFFSET          (CLK_RTCREF - CLK_ENVM)
> 
>  struct mpfs_clock_data {
> +       struct device *dev;
>         void __iomem *base;
>         void __iomem *msspll_base;
>         struct clk_hw_onecell_data hw_data;
> @@ -304,10 +307,6 @@ static int mpfs_periph_clk_enable(struct clk_hw *hw)
> 
>         spin_lock_irqsave(&mpfs_clk_lock, flags);
> 
> -       reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
> -       val = reg & ~(1u << periph->shift);
> -       writel_relaxed(val, base_addr + REG_SUBBLK_RESET_CR);
> -
>         reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
>         val = reg | (1u << periph->shift);
>         writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
> @@ -341,12 +340,9 @@ static int mpfs_periph_clk_is_enabled(struct clk_hw *hw)
>         void __iomem *base_addr = periph_hw->sys_base;
>         u32 reg;
> 
> -       reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
> -       if ((reg & (1u << periph->shift)) == 0u) {
> -               reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
> -               if (reg & (1u << periph->shift))
> -                       return 1;
> -       }
> +       reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
> +       if (reg & (1u << periph->shift))
> +               return 1;
> 
>         return 0;
>  }
> @@ -441,6 +437,94 @@ static int mpfs_clk_register_periphs(struct device *dev, struct mpfs_periph_hw_c
>         return 0;
>  }
> 
> +/*
> + * Peripheral clock resets
> + */
> +
> +#if IS_ENABLED(CONFIG_RESET_CONTROLLER)
> +
> +u32 mpfs_reset_read(struct device *dev)
> +{
> +       struct mpfs_clock_data *clock_data = dev_get_drvdata(dev->parent);
> +
> +       return readl_relaxed(clock_data->base + REG_SUBBLK_RESET_CR);
> +}
> +EXPORT_SYMBOL_NS_GPL(mpfs_reset_read, MCHP_CLK_MPFS);
> +
> +void mpfs_reset_write(struct device *dev, u32 val)
> +{
> +       struct mpfs_clock_data *clock_data = dev_get_drvdata(dev->parent);
> +
> +       writel_relaxed(val, clock_data->base + REG_SUBBLK_RESET_CR);
> +}
> +EXPORT_SYMBOL_NS_GPL(mpfs_reset_write, MCHP_CLK_MPFS);
> +
> +static void mpfs_reset_unregister_adev(void *_adev)
> +{
> +       struct auxiliary_device *adev = _adev;
> +
> +       auxiliary_device_delete(adev);
> +}
> +
> +static void mpfs_reset_adev_release(struct device *dev)
> +{
> +       struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +       auxiliary_device_uninit(adev);
> +
> +       kfree(adev);
> +}
> +
> +static struct auxiliary_device *mpfs_reset_adev_alloc(struct mpfs_clock_data *clk_data)
> +{
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> +       if (!adev)
> +               return ERR_PTR(-ENOMEM);
> +
> +       adev->name = "reset-mpfs";
> +       adev->dev.parent = clk_data->dev;
> +       adev->dev.release = mpfs_reset_adev_release;
> +       adev->id = 666u;
> +
> +       ret = auxiliary_device_init(adev);
> +       if (ret) {
> +               kfree(adev);
> +               return ERR_PTR(ret);
> +       }
> +
> +       return adev;
> +}
> +
> +static int mpfs_reset_controller_register(struct mpfs_clock_data *clk_data)
> +{
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       adev = mpfs_reset_adev_alloc(clk_data);
> +       if (IS_ERR(adev))
> +               return PTR_ERR(adev);
> +
> +       ret = auxiliary_device_add(adev);
> +       if (ret) {
> +               auxiliary_device_uninit(adev);
> +               return ret;
> +       }
> +
> +       return devm_add_action_or_reset(clk_data->dev, mpfs_reset_unregister_adev, adev);
> +}
> +
> +#else /* !CONFIG_RESET_CONTROLLER */
> +
> +static int mpfs_reset_controller_register(struct mpfs_clock_data *clk_data)
> +{
> +       return 0;
> +}
> +
> +#endif /* !CONFIG_RESET_CONTROLLER */
> +
>  static int mpfs_clk_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> @@ -465,6 +549,8 @@ static int mpfs_clk_probe(struct platform_device *pdev)
>                 return PTR_ERR(clk_data->msspll_base);
> 
>         clk_data->hw_data.num = num_clks;
> +       clk_data->dev = dev;
> +       dev_set_drvdata(dev, clk_data);
> 
>         ret = mpfs_clk_register_mssplls(dev, mpfs_msspll_clks, ARRAY_SIZE(mpfs_msspll_clks),
>                                         clk_data);
> @@ -484,14 +570,14 @@ static int mpfs_clk_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
> 
> -       return ret;
> +       return mpfs_reset_controller_register(clk_data);
>  }
> 
>  static const struct of_device_id mpfs_clk_of_match_table[] = {
>         { .compatible = "microchip,mpfs-clkcfg", },
>         {}
>  };
> -MODULE_DEVICE_TABLE(of, mpfs_clk_match_table);
> +MODULE_DEVICE_TABLE(of, mpfs_clk_of_match_table);
> 
>  static struct platform_driver mpfs_clk_driver = {
>         .probe = mpfs_clk_probe,
> diff --git a/include/soc/microchip/mpfs.h b/include/soc/microchip/mpfs.h
> index 6466515262bd..f916dcde457f 100644
> --- a/include/soc/microchip/mpfs.h
> +++ b/include/soc/microchip/mpfs.h
> @@ -40,4 +40,12 @@ struct mpfs_sys_controller *mpfs_sys_controller_get(struct device *dev);
> 
>  #endif /* if IS_ENABLED(CONFIG_POLARFIRE_SOC_SYS_CTRL) */
> 
> +#if IS_ENABLED(CONFIG_MCHP_CLK_MPFS)
> +
> +u32 mpfs_reset_read(struct device *dev);
> +
> +void mpfs_reset_write(struct device *dev, u32 val);
> +
> +#endif /* if IS_ENABLED(CONFIG_MCHP_CLK_MPFS) */
> +
>  #endif /* __SOC_MPFS_H__ */
> --
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
