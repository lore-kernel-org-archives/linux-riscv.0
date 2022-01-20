Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4CAC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 13:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyDDn2/VUdmH8+PqT0Jnu4qZp0fD0XPhVtQioxMfCl0=; b=3GFBeHBG9kE7XR
	jkVLEjLFKopKxeOYH6B/jx+b2+jOUpPfz+wkOYQG/duPGv/7zrbHiCcgqjOXWcbCRA5v9CmJRywMw
	oYMPaUrtcNzEp2W3S8QAsMqMWU++X+K41IvheYsl59FT3LJQ74UgwWZSMcbztNDKFLMRzXwrPjygK
	+V+SRUhfqMYJg11BFuUAjEHVXAfcglmgau6UfhSk+hCylUDgt3Zgp9U+GjI8/Bq9jVsQYFs9mXp93
	J1UxvKFE7wHXa9VyaM485zXw82+4kvylbQ3ehf1QZoOvuvONThXb6QHNwKogat53ttCXvkVyb6VXC
	G8LyEkW0YvicLlXOUapw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAXiG-00BlPr-Mv; Thu, 20 Jan 2022 13:42:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAXiB-00BlOB-Ol
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 13:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1642686167; x=1674222167;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HIeMSXBUZL1C8hkf2CPLGNs2WkHD+CVIZvSJFxv1cqg=;
 b=iFBhTe7eShhw0riRpGBWes8t1ssw8UpZNZsyQhMWNDhwkq/6Gd9nWplY
 uB1YuiwhryWveVXZISH5YVVMVJNjUcuak/tD5DHRP/xCqRuCAJHTLvCaS
 GigE4x84p8aclqLh+fb0KSky8Jtbji1sLxKguP/iAFGiufcuqbafLeOdn
 Rto3gcd8xuelJKAOG+FkWj5Nxkp9AE00TMQkGoFow0k0RzUB+eTN2FcQJ
 d9d2c406jrQysIbECnVRNM0g8dIt6R5uhmdkMFP1a9D3tZQV+BYDzoFXt
 h55h7gP/qMvZQsQRhX9JV4BN4pzqyVYzzSWBOK/ycXcm5pmi1WEZjfLKv w==;
IronPort-SDR: saykuCGy6SDCKoh4vTIxMG6sFLt7DaJlnXwuUWvVlwJzPzURuC0HE46Lne91a6iv44fyrPjlWN
 waXtjPMNzSpDl6DSw6irwjFe23+T3BaL5FPEAzuSs0pW9XWdw0LY54TvgpKVITsO/AgRqdRaXQ
 T5pnZWjHsxyPbbEZ2cduxtWP9kT1CELuR4KD3tkjINY0dghPhstfnCl/HOkdhAboU/8vgvg9yd
 tdHfuUsqio9ZIDaBJxxeznJIAo3E7UiwtvSmbTOziST/gjhHH1bPKQs3GaZReU1Cd3LBdsX8PQ
 dCqcIiWkpVipRbfRMC3GJtEu
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="143339278"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Jan 2022 06:42:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 20 Jan 2022 06:42:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 20 Jan 2022 06:42:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZu3QsljI8xE6Pw0pMHu3rTkLAtWqKJHpwkRWk/aikXAKgHd6KZ0P6dAEJJvOiMdnwygu4oXW7T1n1j5wOMxkzzFZRQZ9D/LJ1uyCpCn0rNjNL3kQsxJDmxF8YgZ3pp4Qizrk9x8MYdLckv7R8gK1RyX8sFwz1LzIDox4w2O7RWaKlkRLzYKAA0Rk1QeNZdV+4xPSD1yB9IkML2OAM8jlWY1DZWtbHeYd/t9asmmgjW0VrYH+heZ41WvG8FlGwFYQ76lsAmEB2imedAUvSl9lCDU42ET9eOJ+j2P9P5+7ea9FbokuKq3pv2fuWakxQS8pylByAgO2E7k6eKso/te2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIeMSXBUZL1C8hkf2CPLGNs2WkHD+CVIZvSJFxv1cqg=;
 b=XUai1Yf5mZGJyQi1L4tnkyLp20DUQktiPR5Vz3dGKjcP3ixCgy7ggJJwlPe/lcVRazoMPX4LXaJfpRok/1A29Jg4rZ/MU/cLPMFPa/AlvC2pfuQxBsYsZnaG6a8iQjJkivrgEdng4R/mej6Vw3joI2c82lwSXSMK4eRmOPGexYiN5Th1npqLT2jRPPyLzWk1x5cQkkMK3f7B4tFYVVwPArwf1xnh8JkoMzZS7LH8zOQd5XfgD4trOKIdy3aRLqCn7ECBDOlCN4ZVwMY3tdPujPuvi4cnPp+mZZAzLIdHG7oYdBnnLwINSFIPEbxx4zAakl+cCq1qlj/5rROHhD17Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIeMSXBUZL1C8hkf2CPLGNs2WkHD+CVIZvSJFxv1cqg=;
 b=ClL21z0gI+ot7DffPfIwR8xnxKbVeYTYu7YXRktlWflPegWOk1SCGbJ9OPUFkCS2Jj7xOfg80m9wMmSP3jjVoMTonO8OUmkxmv6Row6ev/F6XwCb1pEOXctUKuycYgUXYj0ncnOHTKybgTim5nTvMZXm2ShJDGZ9RiQFEPiId1U=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by BYAPR11MB3366.namprd11.prod.outlook.com (2603:10b6:a03:7f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 13:42:25 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::6032:bbb2:b522:2ac3%9]) with mapi id 15.20.4909.011; Thu, 20 Jan 2022
 13:42:25 +0000
From: <Conor.Dooley@microchip.com>
To: <geert@linux-m68k.org>
CC: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <krzysztof.kozlowski@canonical.com>, <bin.meng@windriver.com>,
 <heiko@sntech.de>, <Lewis.Hanly@microchip.com>,
 <Daire.McNamara@microchip.com>, <Ivan.Griffin@microchip.com>,
 <atishp@rivosinc.com>
Subject: Re: [PATCH v4 03/14] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
Thread-Topic: [PATCH v4 03/14] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
Thread-Index: AQHYC5I9k0MUBcshokautkGlf/2Vd6xrmLeAgABX+gA=
Date: Thu, 20 Jan 2022 13:42:25 +0000
Message-ID: <889dab52-95eb-f36d-0af9-beea958a97e7@microchip.com>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
 <20220117110755.3433142-4-conor.dooley@microchip.com>
 <CAMuHMdXwe3_F8NeePnoFrLwyzKUwnHtmETC=ambgsC2N3w_h8A@mail.gmail.com>
In-Reply-To: <CAMuHMdXwe3_F8NeePnoFrLwyzKUwnHtmETC=ambgsC2N3w_h8A@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9538771-92a2-4418-fcc9-08d9dc1ab15f
x-ms-traffictypediagnostic: BYAPR11MB3366:EE_
x-microsoft-antispam-prvs: <BYAPR11MB33662B2E390D34CA760370ED985A9@BYAPR11MB3366.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hamnv9aUM15ZZpDmV/nYLj6CbBPOlVliochEbOzlBmR1os6swIOnNNT/6Ea8pJqhHa61aUJRZSWAVBvd77Rv5OQ/oU9JUJNIjodSWtBo1bXobCEtJEb+oDLUUM6oe8cLVjBSA8M/DIivkM7+trqFlGPlLS4ZMMxLCkU2OMfS3jBSp0HbrLs8/qWQJHPNjFc77sRe8+Ee3Ewls7BEFe4be+oeXQ6NdrHhEcVvP0vl0iDPdvl95CzRiSnmftkxFufHK2YVcSdMJhue2yDapzRBaC3e3LFTGU6x0OQJ8h3mZtKPdkVX3WzN2PmdD0SaWEO4aDlWMFGTbWpMXNopA1El1cjQMM/09Kc96CMKiKN4oThc75AQNbXmQ8Rq5nnSoICTyBuupNvc87Kl9yjoxkS2TIRg/hGWQxzwLw+r27L7l8iIcrquHLfk7Fy4ctrru3+4cb2ltbjjPczFUEy9dcC+lukKmimNqIsLh8CudiUg1vL9XF2Cp5u6nd79M1J3cJzEu8B2oRuoyYKpIbZDFDo3vkT89OidVv0jzKcz539LQU/NNEcdwwKJawDb2svkaUgJTr8MTYFvWG1jXMkT9E/Jlg7RqaQZjYC4V4THywkkKt1txUtrrMoQRT4gzY1qRBHPq+miRMj6M0o6YAU1mj5ozzz0w1H29PwurtSaJKhtt00//tMW470yOdSpqxzDj1bjdJ4x7AeoobIIBnCegRgzrAC06DvPw8Pf4pUBHz8WejGoXs+vDaFl9EQoaY88j8r2glMe7s8aQkRO9Ejg1ny1WcbC03jj196jJ7A30coYsCZ62q+ybbyhP0mahJy18LLAVjJO2QcYTBd3tvFMCuhtHDrK+fyhf0wXfhtI+XQ/f1lgiQT7oXVef2fumgE5eFIezfi3FJrnbRYvEekK07+Bxg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(5660300002)(2906002)(71200400001)(66946007)(508600001)(66446008)(8676002)(38070700005)(54906003)(6506007)(2616005)(6486002)(66556008)(76116006)(91956017)(53546011)(66476007)(64756008)(966005)(38100700002)(36756003)(122000001)(86362001)(26005)(6916009)(186003)(6512007)(316002)(4326008)(31686004)(7416002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkFsOXpKV1hud2U5RWtwVEE0QWVJdXp4WDNNeUYwdWsvckxrWDNpd3pjaW13?=
 =?utf-8?B?dUt1eEFsOHRUVFdIOGdIM2Vib3RmUDM0Y2x6UHFTckFIRnBqdi9LWlhxUEZy?=
 =?utf-8?B?NGNZY0NoQzNyTXQ1emp5ZzBZc1hpNkxtWmJ2bmc3VmRQdXBKamp3SWxCTyt4?=
 =?utf-8?B?ZTFuT09EMUcrdFpicjdhY2tVWHo4SzJWaUhuQWdQTzJYcWtKaDlNSlRaaDQ5?=
 =?utf-8?B?Qnc2bzBwb1dIS01DWEx3Zkc0bEtiajU5QmVjaXVvUU9tTDdkREY0ZVBiNnU5?=
 =?utf-8?B?ajBlNU54MmFyWG1sVW9yeks2dkRKSnBWTzgzemVPdENQNFVsRUtaN08yajZU?=
 =?utf-8?B?Q0I0azVBekhqWTgwT2JIV1A3NXM4YzZqY3RuNUN2b1Z6a09VUXdBOGZ0K0Qy?=
 =?utf-8?B?NU1naWsyLzYxWDNYUnVlTDVKanVobUJ0UE9uaGpiQWFPd0NCbE1jbjA1WFRm?=
 =?utf-8?B?dnFDbS9lVEVWRWdPK0JUb2xWcHNCQ3pVaE04aE5GbXZ5UEh5QTh5ZlJmM1ZY?=
 =?utf-8?B?TlkyTlNqdFBVOWxRWllhZFNCeEsxMEVVeW5vSkhxUk5hdVVjWG5icEtEZUwz?=
 =?utf-8?B?WnpOeXBJcVZpTUpTM1FTMkozOXRvNFdzS1ZtYjgzQjRLaXpla0hGdHd1eGl1?=
 =?utf-8?B?bWlmdFNTYjU4Z2dtQXBjNTJPM0F4Y2pwTDhEZkQveDBHM1NYbkVJSXJEcVlB?=
 =?utf-8?B?RUdlYllTM1JGcG4zdm5CdlhoWUNZOTZmM2FRdnJuckg5REhIcElyV2dMOTlj?=
 =?utf-8?B?UkN3SHNIbUFIaHZwQlVJdHNVR2NBdHgwSWJuVERrQUxFa1NUd3h1VU1KZTRP?=
 =?utf-8?B?Z2t5ZlMrRDdReUVoRTh6NW1FTjNZVzRNSkN0WGtkSDBsWEVJVlIrZm5yUHlL?=
 =?utf-8?B?WSsyWEMvT2ZQWlB4QkRxWDBPc0RHNW93dXF6M3ZJNkIwNnBzenBWbHora1M3?=
 =?utf-8?B?Qk03b2VGR2IzRlVwS2V5RUdMdWYwNkRGbTJjTzE5Q2k3ZFMxK25kREs2Smdk?=
 =?utf-8?B?WmliWWVsQmNwZm1iRW94blVzSVQ2R2hGMWUyc0VyRTQyVUNOVHRJRUh4c3FQ?=
 =?utf-8?B?U0JzSU5LZzdGcWR5aXA4ZFRRWWZxc2pvUy9EZFRqaDBrdHVXclhyaFZZSmZZ?=
 =?utf-8?B?QkxUSXdZdkZEZm9QRmlOLzk2OEF5VDg0NXNUbmxjM3BBUy9OT0tVa0J3bjFj?=
 =?utf-8?B?MXRaL3pGZnZnQjFETVNidm5KV2xtRkdFUGRGb0ZrRHVwUjJqZTJrZm14cERH?=
 =?utf-8?B?QVhOMGVabm9MZXVJUFRQT2I3RnRZYWR4V2FPRGMrTUNCcStaQTF0RjI4U2tN?=
 =?utf-8?B?dWJrOVpFMCsxSmJiMmkxeEVlSnV5bTgrQ1N5ck1tTEdEbW1UTFN6Q3pKM2tG?=
 =?utf-8?B?K2pVTklOR1JWbVlvZVp2N2duaS9oSUs4MGwyRzBhaVBZbEJnS0VzN1Bvc1pD?=
 =?utf-8?B?cnhTS0VSSTVoL0JPT2NzTnJ2TmlMUXJpUTFwcW9Na3pYUU5JRGU2Y3IyRUNE?=
 =?utf-8?B?bThxYnVFZ1dSMzdWeUF1UmVubVpYVzBqSGtTZW5yU0hOZUJuMnlJa1VZaUtU?=
 =?utf-8?B?b3l4VDRhQWtLRDMxV0FvdW5jUTdVK0p2WVJvV1Q1ZHZ0bGFOa0pRTVF4V3VT?=
 =?utf-8?B?MnJaL1cwQ0txQWNiZTBSN1NMZU0wR3dQRkVFdGR6MitLNSt0UjdaR1N2RHpE?=
 =?utf-8?B?RjBxOE9TbTJNUGxaL0ZhT1VKZ00xcytldzJuMjJHeTFZTlZHOVEwakF4TTYv?=
 =?utf-8?B?YWdTelVDYzJwVUtYbzZJNE02TlRYTDNVZ0N5VnErUDRyTHFHYUJqWmRBWmtD?=
 =?utf-8?B?K1Z2K2w4SzBlQWRpajlzakJMc0YwdENEcnJOcjh6ZW40OE9XeTFkemM4SjBt?=
 =?utf-8?B?STI3R0dhMkpIbTRocW9Va29OMlNmZFd3RERhYUFwbENEYXgyQWhyeDBuOEdT?=
 =?utf-8?B?ekJjRm1icUg3VUxwaXJNUTBMd1YvTk9OTWlmSzBNNFh6OVR1K3U2K1ZCY25V?=
 =?utf-8?B?TXVzMWhaZlB2enJickkwM2dDZnFKZTVmZFZIdm5POFBRNWJuSVgrblNzOEtz?=
 =?utf-8?B?aTBUN1Qrdm0rdHFPczlJZXd0eS81VFBHeWFHazFpWThJcXIvNXJkSmZGVXJi?=
 =?utf-8?B?Wld3ckhDRWJVTzVoNXBBbTNpTVhGeXB2WUpzeXBBZk9EdmpUL0EvbWJHZnVj?=
 =?utf-8?B?Y1F2MWQ3RWRwRGY5L3kyTk8rRlQyOFU3YXQ0S05pUy9saTM1NXFHa1FEVUYz?=
 =?utf-8?B?WkJTM1BTUGttTWlFMjQ4NmZaSEp3PT0=?=
Content-ID: <2641086EC3544845B70143108139E42E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9538771-92a2-4418-fcc9-08d9dc1ab15f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 13:42:25.0084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Qxs4hGScBgbEdA5lxI851+JvwgsvMw8sdm4jiBv180XHHv8cTDlT1xXmDlpsyRf4O7WVmuAbhqb67udfealq4HrWZkIw1msmsdgPrSQnmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3366
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_054248_029210_AF01790B 
X-CRM114-Status: GOOD (  26.19  )
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

On 20/01/2022 08:30, Geert Uytterhoeven wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Conor,
> 
> On Mon, Jan 17, 2022 at 12:06 PM <conor.dooley@microchip.com> wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Add device tree bindings for the i2c controller on
>> the Microchip PolarFire SoC.
>>
>> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks for your patch!
> 
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
>> @@ -0,0 +1,55 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/i2c/microchip,mpfs-i2c.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Microchip MPFS I2C Controller Device Tree Bindings
>> +
>> +maintainers:
>> +  - Daire McNamara <daire.mcnamara@microchip.com>
>> +
>> +allOf:
>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
>> +      - microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
> 
> Wouldn't it be more logical to have:
> 
>      items:
>        - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
>        - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
> 
> ?
This would be fine for mpfs-i2c since corei2c is a "superset" - but how 
would that look for the fabric core? I don't think falling back from the 
fabric core onto the "hard" one makes sense. This would mean the 
following two entries:

i2c2: i2c@44000000 { //fabric
	compatible = "microchip,corei2c-rtl-v7";
};
i2c1: i2c@2010b000 { //"hard" mpfs peripheral
	compatible = "microchip,mpfs-i2c", "microchip,corei2c-rtl-v7";
};

But this generates errors in dt_binding_check w/ your suggestion - so 
how about the following (similar to ti,omap4-i2c.yaml):

   compatible:
     oneOf:
       - items:
         - const: microchip,mpfs-i2c #  Microchip PolarFire...
         - const: microchip,corei2c-rtl-v7 # Microchip Fabric...
       - const: microchip,corei2c-rtl-v7 # Microchip Fabric...

Is there a prettier way than this duplication?
> 
> If the IP core is reused, it can become:
> 
>      items:
>        - enum:
>            - microchip,mpfs-i2c # Microchip PolarFire SoC compatible SoCs
>            - microchip,<foo>-i2c # ...
>        - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP core
> 
> That way the driver can just match on the second (fallback) value,
> and no further driver changes will be needed (until v8 or later).
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
