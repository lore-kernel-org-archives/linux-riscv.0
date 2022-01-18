Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FBCC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jan 2022 11:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0Q9UvojwoN8dJq0LZwS71/PoKBHURWUJ8YfNKM6Mjk=; b=RT2sSM0imfnKf/
	+ssI4Hp8x47Sk6cmXCIBqdzqbKBE8+/RmvCyKK6hIV7qBqCnyuLgCaQhZeyxlnF7PlZ5VFTIDo/oM
	1V5RK25GGUtgq6ygTGEipH1DYMH+ZqyHE+T6MAJhwQGh/JxQjahbxg43z7t8RzvoFL1tjGpL4NhNY
	hIbfD0xXJHAE3H4/L931Wqu2WUe3yfEcI47cE3TV9i+a/+MwBHzkEM+zjlZKHLMe5JcW+eLCYKAA2
	551Cether9rQerwZrorE3GO9tQtHck0d+J5G+5aRVT7RnsLNLG5KLEB7xjkR1IbKghgK57QhPW0sg
	QuPT3Xfo2rG2xFgXmhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9mRP-001GeV-KZ; Tue, 18 Jan 2022 11:14:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9mRK-001GcX-6U
 for linux-riscv@lists.infradead.org; Tue, 18 Jan 2022 11:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1642504453; x=1674040453;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=t6s2b9xtzF8qHXUKiarnhRufYMiIG5EPZ/A7rmFPv8s=;
 b=MdjIYRG7WjXbG6BmShamJGByBMMnVT5FE+F0U9QQn497/B6KbDMzt2aP
 AANGn6miyzKPGpzp+CbbIb8Zku8IGOHxdnO4yWKwMC4moKbt9eyWEmQmk
 RbMF7FjWWLlbzD1BDvFGvod6WJMDzIru5dnkzz58hI43Zp1/BR+J/9X+r
 o+ek/Xi8j9b1zXwuNnQ/jPn7tapkInIadP9WwvIKV2HtW1Bnkt1qnYGeJ
 6lzlG604BkviYsfEDJH9fIFUlBwc/f2ISPr8oiRrmC48ZQmoCSzKiLCHv
 ZEXbz8S/8Sjx/TNBPucLkPc6kECy+tsIYaBPt53QMgIWn2Urgr0pgnkAa A==;
IronPort-SDR: eVRSdINdbDTFo3U1uUhduXzZJLEOiYoKEPJk8ASqW/ljRGk+JaoEAwwKx2sO2RaunrqBp+DQ6q
 iXYu7VQgvZFxq/gUq2sOhJEdLrr2LnTLJgDW+sJA6csIGx74mm4l+iZTWg2O5Ixw8GKtRGJv1o
 LWyn37GERvdDwmBssYPTSdjmpLOstyZJqRKMonE9rIZm5S/czfLEBhXx2LbtTxR5FYNVR3uxWa
 gGhsuuSlM484fnVAN7YQhKDQSSu7R3Y4ndTyMbeLX4nt+Gn4h9UiCEMkkYretBAntdNbUNjAIq
 GpVCAMxgpWlX641KjTBW3A14
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="82841482"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Jan 2022 04:14:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 18 Jan 2022 04:14:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 18 Jan 2022 04:14:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZ8tL1aqoQHdJqqEbdZSJ/2yDoIiyRtjAH6z+VvIRRuSkD/BXf9Cv9SLAjOtxRoEljGQj99c2BiZYCGhTJe0gz1E5dMteIp1QfFQLEPLntSLijit9eJ+ihlLMpwEemvXMDqqqSsR+LN02bqsl/90QmQ4eEqittx6eTMDNyxQ3AJg/VUjIRXM1djYbigqW5XF86Ban1ld2MtYY45UpB9QTd7luW0k/8zShQRPQX6mYoPCU4dnFuFkBc5f8RFLdNHy2pOtMnc5OeLE764WWGWGZlL/FLjzmcA8e2N5/ntNISsC3VMeZKJ7aUTd5nN71q8qF7PAkT1Dmg8uCOljlMcR9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6s2b9xtzF8qHXUKiarnhRufYMiIG5EPZ/A7rmFPv8s=;
 b=aK4rRgRpUfLmPbOhiUFcA4kcjGUFHEye1kBwMltXaXkVjrGxNyQh61BLwzDck77ot81HTxF6PXwvJCCur+dqWbl48qTUY5qQ+/Mfg/IieA4GUCnNDRFwNJoiJEO6zasVtcAmGwDx+JO9tK2ptrSYmEIwhvmzK1cz3a6qx6UI1J3pEqowvNo9PqicPrYK5yDjRxZvfd2h5MmFYD3VnOCHpI94OrUv0ohuK2Su8kXFSGUCR5aaGH94/vSiRU5n4Dn64W47kXNMYEkn4q8RZdgKNKK1Rs/pkh7cW/l4uM0CHeT+iOy9zjmYCGqCE9htSX4u1VdOaNdMgPTIXoCrRwFChg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6s2b9xtzF8qHXUKiarnhRufYMiIG5EPZ/A7rmFPv8s=;
 b=jBkjHHVWyCEf43FlU+71FlSbSxFmTxj5BoHBUP35o4Z8NXs06dJ3SleWJ+Egy9LHIlk+gX/sqRCTDLiduRw6Jnvxerq1ADOpOVtT7O/4xDe/C/Y3KT8kwMSjN43Y+kLivMjt/K7TE/1/Mzr8tH7zLlYVqxXHTmMoy4/CdNfddyY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by DM5PR11MB1274.namprd11.prod.outlook.com (2603:10b6:3:12::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.10; Tue, 18 Jan 2022 11:14:04 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3%9]) with mapi id 15.20.4909.007; Tue, 18 Jan 2022
 11:14:04 +0000
From: <Conor.Dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>, <heiko@sntech.de>, <Lewis.Hanly@microchip.com>,
 <Daire.McNamara@microchip.com>, <Ivan.Griffin@microchip.com>,
 <atishp@rivosinc.com>
Subject: Re: [PATCH v4 11/14] riscv: dts: microchip: refactor icicle kit
 device tree
Thread-Topic: [PATCH v4 11/14] riscv: dts: microchip: refactor icicle kit
 device tree
Thread-Index: AQHYC5JrH64PK2OptEWJglhbAWJ60KxoopSA
Date: Tue, 18 Jan 2022 11:14:03 +0000
Message-ID: <3ffaaaa0-4cd7-5609-e17e-0294f804fe44@microchip.com>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
 <20220117110755.3433142-12-conor.dooley@microchip.com>
In-Reply-To: <20220117110755.3433142-12-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35c88b7f-569a-43b9-54a3-08d9da73a308
x-ms-traffictypediagnostic: DM5PR11MB1274:EE_
x-microsoft-antispam-prvs: <DM5PR11MB1274268A4EF612AFF25EE0FD98589@DM5PR11MB1274.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:404;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UMsk596/Howeo4K9WXeuMrR+3HXT01V18zyve/V8BF8aU07MOwwPN2P8eryUFPShmNX+gVnhyz/Mc+10TzqrlinVnXXpHq4uunOEj3SF5W/gRIhkskz/Y9BlAv27FG8V7F4mMs+81zr+I3uGMDjayYmvs7vkCEJMgpLlj8fwm8Z42Qk1dz64PSJYNsaRAl92cUOMNit5UVUPEbXdIOetIept7lIZw+MhNkyi4UZlhh2c069lVGZg7bh+WlLQD0db2h9eIjCNcsnsQzaFDC+v5cP4bZCsX8tQbpz1TmCKRU4ierEIIdCTfDqM5ujRgwzE2xa3ZeCK2NETrAj0wdlqr9XgDZM0zK69+dP89MeZo8DNa2a+mv8E9GaUpHZtD53PfiH8pw0cpE5uSWMoEAUxTcG1t+piUdH0U1GN0vKRov2GVTuMcEQ6+ITBUeqj7JsEpnjIKAf2g6ekGdcOA4dSopjC7p1KrBSQ9m0YQlrJHy3Oku5GhlwRJW8Mt8gPySkX76UGIL3w1wh0tLnwKvZU/SnPHv/oGgiQHsWQyG9Duh1aIxJ8OZTdg35uxWmE9Q/vpil94zAH0Lm5YL5j3c6lB4/KcwSNkZTbM4J2Zfgt6SNgx6jIRP+hxJK7gRMyNw2OFRYoad6NhgpK+y7hanyLNKQ5YeZXPlSljhOwZs8YidESNhKy+mqpHwDVnnPUe27zNmDliy5kW5mratP4N9z9AVRuN9KSp+Us5TcFkp939XsOV6eHSQyZUfR77jx69vXYL9G+zK2fflAqTfW4lq+n+iEqolPZ+k1IZAI3GHWS/oI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(66946007)(4326008)(921005)(71200400001)(316002)(54906003)(110136005)(66476007)(31696002)(66556008)(76116006)(91956017)(6486002)(36756003)(64756008)(66446008)(6512007)(122000001)(7416002)(53546011)(186003)(6506007)(2906002)(2616005)(5660300002)(26005)(38100700002)(31686004)(508600001)(83380400001)(8676002)(8936002)(30864003)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3FFSmRRME5HWTgxTWhOdGxHOXhnU3FlTW5OWld2ZW0yTXBPckhvQWo5TzhH?=
 =?utf-8?B?L2VtZzhhOEhGRTROV0lHSDBkT2thQmNkUFVFblVzTDhvNGJqMFl4aE1JOTli?=
 =?utf-8?B?NFkyV3o1UHlmb1c4TTN4T2tYUFA3MHNGQ1BkNG95SU41NUVqQkVsV1ZJNFZ5?=
 =?utf-8?B?Z3R4Tzg0cTA3ZXFSbEd0dkFzVGJoOUJYL0c0L3dXWlZRSWV6Zm5RYnB5RDhK?=
 =?utf-8?B?VnJURnVJRGY4UXFqWDdEOTgwTUI1Ymg1NEZTbktPOWVZUG1PNnlYOWpVN1cx?=
 =?utf-8?B?ajJVcng2eEhxM2MwZlRsbFhUNFRoUHljdmpPK2dzbGtBUnY3OFZiL3l4UjhE?=
 =?utf-8?B?dWErR0ZJN0dtclJaSXRQNU5SZjhTektZM3h5K3VWRUszUWxMamlLU1YwNk9y?=
 =?utf-8?B?bW9ZdXMvcFQvT0dxdGF5V0ZTZERSRVNhQjJmWStmMllXb0FJZlFqTTRYVHFR?=
 =?utf-8?B?TGtoNjIxQ1RyTTJBOU1CUkpZN0laUm5GOS91N0JKSStoZGlpOERUelFhQ3Va?=
 =?utf-8?B?c242UysrZ0dKZ3BFN240cytrd2FzbVR6R09Dc0JtMjZ0NHdKVlk2RU9rUjBv?=
 =?utf-8?B?clBjdkNpM1hIOFNGUmlDajlBazZ1V2s1YldwWFEzWkZvVE02TW1VQW53MWxz?=
 =?utf-8?B?cE1JTWZ6WDRaM2FKTFNLcGVsNExpOWljU2d2SUhnc3hSUXRxdzZML1JoL0ZN?=
 =?utf-8?B?RCtJT054aUdOVE1lL1Q1bjlSSGtxeDV6V1ViNnltZndyMXNVVFdxV0g4eVd2?=
 =?utf-8?B?aUttZzN2b0UzQ0tVRVZma00xUkZIcDluVXlvZDNGamFRMi95bjd2bHhaQ1lw?=
 =?utf-8?B?amhURGdrUE45dlpKVEdpTktTaEVtK0xhdGcyK2NpNDFmRzFTT2hkdmxyR1ow?=
 =?utf-8?B?NG5IUmpvVnkzRTlISGhad1FsNnRXR1M4L0JDMjhaKzlNNzViYUM3V1RvdHRF?=
 =?utf-8?B?TElCUXQrZktVVXpESEpWUnFxZUZKVTNHRkZQWUw4d1YwK3FPNXh2RExLS1Fx?=
 =?utf-8?B?VXNQQjZqaE9PSHRRZ0ZjeGxXMmcrSDlaTGFKNzd5WVozTUhNVElUb1dVRFNn?=
 =?utf-8?B?K1VOR29QL1pKWnhERlkySTZxSHIzYS9zRzU5UndTdS9pSEM2dkhyc0krT0FD?=
 =?utf-8?B?aXRMMmFWZjRPdHNLZ2dFNlpCa3RKc1kvbTlybHVuaW5PN2NETCtLamVGQUJq?=
 =?utf-8?B?QnhkbW4ya0Z2Q2Iyait4T0Q3V3hmb1ZjeDl2Q25JTUZsUUFzQ3hkRXA3TTlG?=
 =?utf-8?B?M0NMNFUzc0d6SWdTdkR0MGNueTlyeG5SRXRzQnY4Sm1ZaSsrM2dBdXFRY0Ft?=
 =?utf-8?B?K2VuN1JvRG5zVlAzZ05qYVREVTNwT1hmUjdyb0w4dGQvcEZQa1VtVW9qQmd5?=
 =?utf-8?B?d2FKK3B5MCtQalNab00yOXhveVdoTXUrOFN0Qk4yclF4cTgrWVVma1U2QTZU?=
 =?utf-8?B?cWlLV2JubzZZeUZYa2c1N1hLT29RL3RBNGF0Znp2Z3NGdFczVVMxUzV4cUxw?=
 =?utf-8?B?aEVmZjRZSXYxbWRVWUdHS2tIcVFwZkRqZGFiMzluWWE4Q2tBOFgveFVTSk84?=
 =?utf-8?B?UnRYRnhwUnBnLzVjbFZJZVJmOWl5bGg4SloxRG5yRCtydGhUVzVYbjFFMkty?=
 =?utf-8?B?cWczdlJicjJuYlM3NFZEamNWL2dYbmxaVGtMNjY0QlUvTkdvNG9MMHFaRTdn?=
 =?utf-8?B?aUJkc3NwM1dQbVpWUVo3SXVkQlJUVmJwbWZRQ1VWV3ZKQUptdjI5alYyVVR6?=
 =?utf-8?B?bG4zSHprekdOaXhyM1I1ZXQ0STQ4MmZ2d3pMZ1huN2VuZzVLYUtUMW9HVnVz?=
 =?utf-8?B?U3lTT2FGMEtSV0dIMWl6TWx0M0FudWJZdGZkOW5pS2x4OHI4MjVoTzNoOC8v?=
 =?utf-8?B?YzM5L0crNWljakhQZkhYUFozYklMU3JXZEVxRHpkNW80K204VUh5anQ1Y3NN?=
 =?utf-8?B?bDZKdlhVVTRCdlBiZElpdzBwYmZrbmxKUG1jWklPeUpOSDVveDRldUpidkVB?=
 =?utf-8?B?aFJZNnhSLzUyR2hpRGJhRnVxNnk0bllCd1RCYlpXUXEyN25uMVF6VTVmdC8w?=
 =?utf-8?B?d2owcUhnWmhvUVV1MWpKdWUvMDNuRjdKSkxBaFpEajBYbjc4b2w3RmxPYW5B?=
 =?utf-8?B?YndiSFZLVnB5cUlaVTJsWTlKYloxUFc1MzBMR2J6MHlWUmpiSzBkREYxLzZo?=
 =?utf-8?B?MFNqOVB6dE5hV0tMT0x6MlRJS3EzcjVUS25CTGpUWkI3Nkc2NlhMS0xlUVBK?=
 =?utf-8?B?UlUwbUs5dVNoZGRYMHR1bVYrRjh3PT0=?=
Content-ID: <D1F7261D64E4CF4FB09220584EF92121@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c88b7f-569a-43b9-54a3-08d9da73a308
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2022 11:14:03.9868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2kXAw35AsMwbK1BdQAJ4wg8sh0bsRFSBwpSEbSXnHMODfhLIGHP2wugSWcuUajF0am8YF1B8Y8nv164YYyGTbHZ/Wu5Rc8vxiYNsxxicn3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1274
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_031414_479237_2CF07937 
X-CRM114-Status: GOOD (  17.10  )
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

On 17/01/2022 11:07, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Assorted minor changes to the MPFS/Icicle kit device tree:
> 
> - rename serial to mmuart to match microchip documentation
> - move phy0 inside mac1 node to match phy configuration
> - add labels where missing (cpus, cache controller)
> - add missing address cells & interrupts to MACs
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   .../microchip/microchip-mpfs-icicle-kit.dts   |  37 ++---
>   .../boot/dts/microchip/microchip-mpfs.dtsi    |  65 +++++----
>   arch/riscv/configs/icicle_kit_defconfig       | 134
last time i checked this was not a device tree change.
what a mess i made of v3...
++++++++++++++++++
>   3 files changed, 186 insertions(+), 50 deletions(-)
>   create mode 100644 arch/riscv/configs/icicle_kit_defconfig
> 
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> index ab803f71626a..c51bd7cf500f 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -1,5 +1,5 @@
>   // SPDX-License-Identifier: (GPL-2.0 OR MIT)
> -/* Copyright (c) 2020 Microchip Technology Inc */
> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
>   
>   /dts-v1/;
>   
> @@ -13,11 +13,11 @@ / {
>   	compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
>   
>   	aliases {
> -		ethernet0 = &emac1;
> -		serial0 = &serial0;
> -		serial1 = &serial1;
> -		serial2 = &serial2;
> -		serial3 = &serial3;
> +		ethernet0 = &mac1;
> +		serial0 = &mmuart0;
> +		serial1 = &mmuart1;
> +		serial2 = &mmuart2;
> +		serial3 = &mmuart3;
>   	};
>   
>   	chosen {
> @@ -39,19 +39,19 @@ &refclk {
>   	clock-frequency = <600000000>;
>   };
>   
> -&serial0 {
> +&mmuart0 {
>   	status = "okay";
>   };
>   
> -&serial1 {
> +&mmuart1 {
>   	status = "okay";
>   };
>   
> -&serial2 {
> +&mmuart2 {
>   	status = "okay";
>   };
>   
> -&serial3 {
> +&mmuart3 {
>   	status = "okay";
>   };
>   
> @@ -61,7 +61,10 @@ &mmc {
>   	bus-width = <4>;
>   	disable-wp;
>   	cap-sd-highspeed;
> +	cap-mmc-highspeed;
>   	card-detect-delay = <200>;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
>   	sd-uhs-sdr12;
>   	sd-uhs-sdr25;
>   	sd-uhs-sdr50;
> @@ -72,22 +75,22 @@ &i2c2 {
>   	status = "okay";
>   };
>   
> -&emac0 {
> +&mac0 {
>   	phy-mode = "sgmii";
>   	phy-handle = <&phy0>;
> -	phy0: ethernet-phy@8 {
> -		reg = <8>;
> -		ti,fifo-depth = <0x01>;
> -	};
>   };
>   
> -&emac1 {
> +&mac1 {
>   	status = "okay";
>   	phy-mode = "sgmii";
>   	phy-handle = <&phy1>;
>   	phy1: ethernet-phy@9 {
>   		reg = <9>;
> -		ti,fifo-depth = <0x01>;
> +		ti,fifo-depth = <0x1>;
> +	};
> +	phy0: ethernet-phy@8 {
> +		reg = <8>;
> +		ti,fifo-depth = <0x1>;
>   	};
>   };
>   
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index c7d73756c9b8..62bd00092bcc 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -1,5 +1,5 @@
>   // SPDX-License-Identifier: (GPL-2.0 OR MIT)
> -/* Copyright (c) 2020 Microchip Technology Inc */
> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
>   
>   /dts-v1/;
>   #include "dt-bindings/clock/microchip,mpfs-clock.h"
> @@ -15,7 +15,7 @@ cpus {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   
> -		cpu@0 {
> +		cpu0: cpu@0 {
>   			compatible = "sifive,e51", "sifive,rocket0", "riscv";
>   			device_type = "cpu";
>   			i-cache-block-size = <64>;
> @@ -33,7 +33,7 @@ cpu0_intc: interrupt-controller {
>   			};
>   		};
>   
> -		cpu@1 {
> +		cpu1: cpu@1 {
>   			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
>   			d-cache-block-size = <64>;
>   			d-cache-sets = <64>;
> @@ -60,7 +60,7 @@ cpu1_intc: interrupt-controller {
>   			};
>   		};
>   
> -		cpu@2 {
> +		cpu2: cpu@2 {
>   			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
>   			d-cache-block-size = <64>;
>   			d-cache-sets = <64>;
> @@ -87,7 +87,7 @@ cpu2_intc: interrupt-controller {
>   			};
>   		};
>   
> -		cpu@3 {
> +		cpu3: cpu@3 {
>   			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
>   			d-cache-block-size = <64>;
>   			d-cache-sets = <64>;
> @@ -114,7 +114,7 @@ cpu3_intc: interrupt-controller {
>   			};
>   		};
>   
> -		cpu@4 {
> +		cpu4: cpu@4 {
>   			compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
>   			d-cache-block-size = <64>;
>   			d-cache-sets = <64>;
> @@ -152,8 +152,9 @@ soc {
>   		compatible = "simple-bus";
>   		ranges;
>   
> -		cache-controller@2010000 {
> +		cctrllr: cache-controller@2010000 {
>   			compatible = "sifive,fu540-c000-ccache", "cache";
> +			reg = <0x0 0x2010000 0x0 0x1000>;
>   			cache-block-size = <64>;
>   			cache-level = <2>;
>   			cache-sets = <1024>;
> @@ -161,10 +162,9 @@ cache-controller@2010000 {
>   			cache-unified;
>   			interrupt-parent = <&plic>;
>   			interrupts = <1>, <2>, <3>;
> -			reg = <0x0 0x2010000 0x0 0x1000>;
>   		};
>   
> -		clint@2000000 {
> +		clint: clint@2000000 {
>   			compatible = "sifive,fu540-c000-clint", "sifive,clint0";
>   			reg = <0x0 0x2000000 0x0 0xC000>;
>   			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
> @@ -174,6 +174,15 @@ clint@2000000 {
>   					      <&cpu4_intc 3>, <&cpu4_intc 7>;
>   		};
>   
> +		dma@3000000 {
> +			compatible = "sifive,fu540-c000-pdma";
> +			reg = <0x0 0x3000000 0x0 0x8000>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
> +				     <30>;
> +			#dma-cells = <1>;
> +		};
> +
>   		plic: interrupt-controller@c000000 {
>   			compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
>   			reg = <0x0 0xc000000 0x0 0x4000000>;
> @@ -188,15 +197,6 @@ plic: interrupt-controller@c000000 {
>   			riscv,ndev = <186>;
>   		};
>   
> -		dma@3000000 {
> -			compatible = "sifive,fu540-c000-pdma";
> -			reg = <0x0 0x3000000 0x0 0x8000>;
> -			interrupt-parent = <&plic>;
> -			interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
> -				     <30>;
> -			#dma-cells = <1>;
> -		};
> -
>   		clkcfg: clkcfg@20002000 {
>   			compatible = "microchip,mpfs-clkcfg";
>   			reg = <0x0 0x20002000 0x0 0x1000>;
> @@ -204,7 +204,7 @@ clkcfg: clkcfg@20002000 {
>   			#clock-cells = <1>;
>   		};
>   
> -		serial0: serial@20000000 {
> +		mmuart0: serial@20000000 {
>   			compatible = "ns16550a";
>   			reg = <0x0 0x20000000 0x0 0x400>;
>   			reg-io-width = <4>;
> @@ -216,7 +216,7 @@ serial0: serial@20000000 {
>   			status = "disabled";
>   		};
>   
> -		serial1: serial@20100000 {
> +		mmuart1: serial@20100000 {
>   			compatible = "ns16550a";
>   			reg = <0x0 0x20100000 0x0 0x400>;
>   			reg-io-width = <4>;
> @@ -228,7 +228,7 @@ serial1: serial@20100000 {
>   			status = "disabled";
>   		};
>   
> -		serial2: serial@20102000 {
> +		mmuart2: serial@20102000 {
>   			compatible = "ns16550a";
>   			reg = <0x0 0x20102000 0x0 0x400>;
>   			reg-io-width = <4>;
> @@ -240,7 +240,7 @@ serial2: serial@20102000 {
>   			status = "disabled";
>   		};
>   
> -		serial3: serial@20104000 {
> +		mmuart3: serial@20104000 {
>   			compatible = "ns16550a";
>   			reg = <0x0 0x20104000 0x0 0x400>;
>   			reg-io-width = <4>;
> @@ -257,37 +257,36 @@ mmc: mmc@20008000 {
>   			compatible = "microchip,mpfs-sd4hc", "cdns,sd4hc";
>   			reg = <0x0 0x20008000 0x0 0x1000>;
>   			interrupt-parent = <&plic>;
> -			interrupts = <88>, <89>;
> +			interrupts = <88>;
>   			clocks = <&clkcfg CLK_MMC>;
>   			max-frequency = <200000000>;
>   			status = "disabled";
>   		};
>   
> -		emac0: ethernet@20110000 {
> +		mac0: ethernet@20110000 {
>   			compatible = "cdns,macb";
>   			reg = <0x0 0x20110000 0x0 0x2000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
>   			interrupt-parent = <&plic>;
> -			interrupts = <64>, <65>, <66>, <67>;
> +			interrupts = <64>, <65>, <66>, <67>, <68>, <69>;
>   			local-mac-address = [00 00 00 00 00 00];
>   			clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
>   			clock-names = "pclk", "hclk";
>   			status = "disabled";
> -			#address-cells = <1>;
> -			#size-cells = <0>;
>   		};
>   
> -		emac1: ethernet@20112000 {
> +		mac1: ethernet@20112000 {
>   			compatible = "cdns,macb";
>   			reg = <0x0 0x20112000 0x0 0x2000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
>   			interrupt-parent = <&plic>;
> -			interrupts = <70>, <71>, <72>, <73>;
> +			interrupts = <70>, <71>, <72>, <73>, <74>, <75>;
>   			local-mac-address = [00 00 00 00 00 00];
>   			clocks = <&clkcfg CLK_MAC1>, <&clkcfg CLK_AHB>;
> -			status = "disabled";
>   			clock-names = "pclk", "hclk";
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> +			status = "disabled";
>   		};
> -
>   	};
>   };
> diff --git a/arch/riscv/configs/icicle_kit_defconfig b/arch/riscv/configs/icicle_kit_defconfig
> new file mode 100644
> index 000000000000..f484130e723d
> --- /dev/null
> +++ b/arch/riscv/configs/icicle_kit_defconfig
> @@ -0,0 +1,134 @@
> +CONFIG_SYSVIPC=y
> +CONFIG_POSIX_MQUEUE=y
> +CONFIG_NO_HZ_IDLE=y
> +CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_IKCONFIG=y
> +CONFIG_IKCONFIG_PROC=y
> +CONFIG_CGROUPS=y
> +CONFIG_CGROUP_SCHED=y
> +CONFIG_CFS_BANDWIDTH=y
> +CONFIG_CGROUP_BPF=y
> +CONFIG_NAMESPACES=y
> +CONFIG_USER_NS=y
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_EXPERT=y
> +CONFIG_KALLSYMS_ALL=y
> +CONFIG_BPF_SYSCALL=y
> +CONFIG_SOC_MICROCHIP_POLARFIRE=y
> +CONFIG_SMP=y
> +CONFIG_CMDLINE="earlyprintk earlycon=sbi debug uio_pdrv_genirq.of_id=generic-uio"
> +CONFIG_JUMP_LABEL=y
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
> +CONFIG_BLK_DEV_ZONED=y
> +CONFIG_PARTITION_ADVANCED=y
> +CONFIG_NET=y
> +CONFIG_PACKET=y
> +CONFIG_UNIX=y
> +CONFIG_INET=y
> +CONFIG_NETLINK_DIAG=y
> +CONFIG_PCI=y
> +CONFIG_PCI_DEBUG=y
> +CONFIG_PCI_HOST_GENERIC=y
> +CONFIG_PCIE_MICROCHIP_HOST=y
> +CONFIG_DEVTMPFS=y
> +CONFIG_DEVTMPFS_MOUNT=y
> +CONFIG_BLK_DEV_LOOP=y
> +CONFIG_BLK_DEV_NBD=y
> +CONFIG_BLK_DEV_NVME=y
> +CONFIG_BLK_DEV_SD=y
> +CONFIG_BLK_DEV_SR=y
> +CONFIG_ATA=y
> +CONFIG_NETDEVICES=y
> +CONFIG_MACB=y
> +CONFIG_R8169=y
> +CONFIG_INPUT_MOUSEDEV=y
> +CONFIG_INPUT_EVDEV=y
> +CONFIG_SERIAL_8250=y
> +CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_OF_PLATFORM=y
> +CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
> +CONFIG_HW_RANDOM=y
> +CONFIG_HW_RANDOM_POLARFIRE_SOC=y
> +CONFIG_I2C_CHARDEV=y
> +CONFIG_I2C_MICROCHIP=y
> +CONFIG_SPI=y
> +CONFIG_SPI_POLARFIRE_SOC=y
> +CONFIG_SPI_POLARFIRE_SOC_QSPI=y
> +CONFIG_SPI_SPIDEV=y
> +CONFIG_GPIOLIB=y
> +CONFIG_GPIO_SYSFS=y
> +CONFIG_GPIO_POLARFIRE_SOC=y
> +CONFIG_POWER_RESET=y
> +CONFIG_MEDIA_SUPPORT=y
> +CONFIG_MEDIA_USB_SUPPORT=y
> +CONFIG_USB_VIDEO_CLASS=y
> +CONFIG_V4L_PLATFORM_DRIVERS=y
> +CONFIG_DRM=y
> +CONFIG_DRM_RADEON=y
> +CONFIG_DRM_NOUVEAU=y
> +CONFIG_FRAMEBUFFER_CONSOLE=y
> +CONFIG_USB=y
> +CONFIG_USB_XHCI_HCD=y
> +CONFIG_USB_XHCI_PLATFORM=y
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_EHCI_HCD_PLATFORM=y
> +CONFIG_USB_OHCI_HCD=y
> +CONFIG_USB_OHCI_HCD_PLATFORM=y
> +CONFIG_USB_ACM=y
> +CONFIG_USB_STORAGE=y
> +CONFIG_USB_MUSB_HDRC=y
> +CONFIG_USB_MUSB_POLARFIRE_SOC=y
> +CONFIG_USB_INVENTRA_DMA=y
> +CONFIG_USB_SERIAL=y
> +CONFIG_NOP_USB_XCEIV=y
> +CONFIG_MMC=y
> +CONFIG_MMC_SDHCI=y
> +CONFIG_MMC_SDHCI_PLTFM=y
> +CONFIG_MMC_SDHCI_CADENCE=y
> +CONFIG_MMC_SPI=y
> +CONFIG_RTC_CLASS=y
> +CONFIG_RTC_DRV_POLARFIRE_SOC=y
> +CONFIG_DMADEVICES=y
> +CONFIG_SF_PDMA=y
> +CONFIG_UIO=y
> +CONFIG_UIO_PDRV_GENIRQ=y
> +CONFIG_UIO_DMEM_GENIRQ=y
> +CONFIG_UIO_MICROCHIP_CAN=y
> +CONFIG_UIO_MICROCHIP_PDMA=y
> +CONFIG_UIO_MICROCHIP_DMA=y
> +CONFIG_MAILBOX=y
> +CONFIG_POLARFIRE_SOC_MAILBOX=y
> +CONFIG_POLARFIRE_SOC_SYS_CTRL=y
> +CONFIG_POLARFIRE_SOC_GENERIC_SERVICE=y
> +CONFIG_IIO=y
> +CONFIG_IIO_SW_DEVICE=y
> +CONFIG_IIO_SW_TRIGGER=y
> +CONFIG_PAC193X=y
> +CONFIG_PWM=y
> +CONFIG_PWM_MICROCHIP_CORE=y
> +CONFIG_EXT4_FS=y
> +CONFIG_EXT4_FS_POSIX_ACL=y
> +CONFIG_FANOTIFY=y
> +CONFIG_MSDOS_FS=y
> +CONFIG_VFAT_FS=y
> +CONFIG_FAT_DEFAULT_IOCHARSET="ascii"
> +CONFIG_EXFAT_FS=y
> +CONFIG_TMPFS=y
> +CONFIG_TMPFS_POSIX_ACL=y
> +CONFIG_NFS_FS=y
> +CONFIG_NFS_V4=y
> +CONFIG_NFS_V4_1=y
> +CONFIG_NFS_V4_2=y
> +CONFIG_NLS_CODEPAGE_437=y
> +CONFIG_NLS_CODEPAGE_850=y
> +CONFIG_NLS_ASCII=y
> +CONFIG_NLS_ISO8859_1=y
> +CONFIG_NLS_UTF8=y
> +CONFIG_PRINTK_TIME=y
> +CONFIG_SCHED_STACK_END_CHECK=y
> +CONFIG_SOFTLOCKUP_DETECTOR=y
> +CONFIG_WQ_WATCHDOG=y
> +CONFIG_SCHEDSTATS=y
> +CONFIG_DEBUG_SPINLOCK=y
> +CONFIG_STACKTRACE=y
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
