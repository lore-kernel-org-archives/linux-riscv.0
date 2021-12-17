Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFA6C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 15:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpDk1j7/awRlobsfrMxjxHmVCT0uEZT/Sa3CVoKZC50=; b=d8QoL82qEr5KoK
	Lmr7oEW61Ro4uQSe5Z3kz9ZM/XzTTqO0Z0Dk7Mjm8N0tNm66nj/mbzfUAoIo0RhPjMKVFDArEO0rn
	Z/XrVSdwWHtMudnRV7NSZGox2CsCFnDKHhJf8GF47qLeTecG2APqqx0VdQrvqITwAtQN5f4lmSyTm
	A7Y1IRhA1DGL/e9cJcoPIcKwn63+iTrEpQaxTFPmv3TFQ5SVyCurvUPloqGK4i+v+dR/NHSpW3a5d
	d5C5emhr59tnCIIyL2r4Nif8oBO15gfjuuBUUw6ZhKp7j7oWo1uaD9puOobxDkkJFqejVLSoyJ3f9
	C/VDEHwEOX3YlfadePcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myFE8-00AvbJ-5w; Fri, 17 Dec 2021 15:32:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myFE5-00AvaQ-Kc
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 15:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639755173; x=1671291173;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Bisqq1o+ldEqxGvyiBNrM8RTJ0J6bCWVtlmz1a9G2nU=;
 b=UuW2UAfWX758JNJ54BE43uDqc+sGum/BwFXNemW/OYP3SWEfLcoEmujr
 F9e4y1k89ObDavP1BWhrBV7uaC4isJqQ/GiN0tDiAT9K37ff354RbJHkJ
 Pr1aCuvi3zgxA8xY+1Dh7RmV1lzjELSxtFsE+GYg/gscX/QwmfMEKnzLo
 nbU/gZwOsuB3ORhYvqzZt5SAgNo+OLb8hfUoQCe0rQRUn5lA2b8BgK7oJ
 dWVT75XGkoMHGvrQlkqcS2WJk+vTvl3q79iT6RTKWsdHi6AEeT/jCDDfa
 T9vutGEJq5US6fVwRbPClbEGFUmFaAnqhTFIBg5W9gaLfrIbV9P+ZGfCm w==;
IronPort-SDR: oHXFDyOP7Zy8AuQcs8nEUvXpkTWBTqvVwm/FcXWarjMlacJYF2b88acjiLzgk9JVbec0SsUSVZ
 3PiTf37iGezqvKw5D2anqgSEgSdKhFYHBK1Cs+MZ3ZBWk+jr01vaQ7A6y0OMoIlPhNmVAx2uL8
 a3h7DzJsxNqo+t0Bx1+p/CDV1/+iNkXyMDpDfTKuJ+ge+3yc66jwWFroh9jc7TY+hrhrzG+8Fm
 h4KcTbxNH+CnPLjHhOlpQk+LBxpgHBgB+U3LISqOpVHn5J4li5O4UtwJAu+iQ+q8+8pHX7vxXS
 TA7JQZkXTWe28gJG6nXrBqa/
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="79928072"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 08:32:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 08:32:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 08:32:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlVjelGPp33ltvbJT3rPq9E0YvQohJ2EXAlZT/a7k/k2jmi83ceKXTzVJTF0EOsCRfYszMBEe80z0pKjYla37m+D1Xp6SXpFH4Um0WUptJ5lQ4IfCMtzkF9pwI+c3fNcaJV3JopeC8LnmpqesQIgFU3tjTzNsl6FJT/iW3vLiArZYfwHpk8UwdSPimDNdGyNhkfoI3vulQg9S0NLwOVd+J8Rki2oJaa+IDMq5ueDjj6n2kFthyCn5N1mBJ9ohW4b7q7O57CqZ9K3jEGUj7WOfHK/ZC+qou42xkHXt6VS1Cukn7uNCTEbZdWfPaRQ/ZyNY24NxY9FeDtSCPZVc7GQXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bisqq1o+ldEqxGvyiBNrM8RTJ0J6bCWVtlmz1a9G2nU=;
 b=mI05c7Fk744PQYWsGBpFXIM080ZpXWaV4k2blpdT1YofG5dxDTdmW6mUfmqFvAecx6hJ7Vn2lTbKXup7A1vZijBugtciVgVRSjbkKOxPg6W7qazMtNDdoLquFFdfmUzqmc4/pGM6uH8BlfMpUjOJXu93BE98U41nGSqxE4J3BX/Z4HaEBupxTmdcVXQeYqN7lDAVN2H5kI5m7jrI32ganSB+L3YTAAmQAhLqnaks0+bVl5mmiqze3G4EPbfrOiIXfEsYJk6CCiNJT+b3UwVFTOagD8VPrGxMa3x0th+ZFBUefNPKEsIOWHp35M2y0FfenWv/4PcfebgvAXPHaepMyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bisqq1o+ldEqxGvyiBNrM8RTJ0J6bCWVtlmz1a9G2nU=;
 b=pPER+/SnmfbnOyhu6giUrda6jhDmcgCVloryBbVio4Li5MdvBOs9s8IBMLzJAz9WGznnJMvDv4+H8kn1s6ESHVlIKYKPaCf7O83GC4QfDOkrlGfIsl3mk1Bqz6MV/sUbxXaCJGS6gNAuZuYrwmTBP76q9jzCJc8MzWbSipD8Jn4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1696.namprd11.prod.outlook.com (2603:10b6:300:23::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Fri, 17 Dec
 2021 15:32:47 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a192:c9ae:1f83:797b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a192:c9ae:1f83:797b%9]) with mapi id 15.20.4801.017; Fri, 17 Dec 2021
 15:32:47 +0000
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
 <atish.patra@wdc.com>
Subject: Re: [PATCH v2 14/17] riscv: dts: microchip: add fpga fabric section
 to icicle kit
Thread-Topic: [PATCH v2 14/17] riscv: dts: microchip: add fpga fabric section
 to icicle kit
Thread-Index: AQHX8ylFKW6kqD5p50ew7h8tB9OgBKw2sbwAgAAfJwA=
Date: Fri, 17 Dec 2021 15:32:47 +0000
Message-ID: <11333b59-733c-186f-3708-7357f72d7bef@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-15-conor.dooley@microchip.com>
 <CAMuHMdV0N-15kNZ1fnzaj_psNVCRUQP506Noc-tHawmgxqCVeA@mail.gmail.com>
In-Reply-To: <CAMuHMdV0N-15kNZ1fnzaj_psNVCRUQP506Noc-tHawmgxqCVeA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14810de6-9da1-4c86-9de2-08d9c1727a50
x-ms-traffictypediagnostic: MWHPR11MB1696:EE_
x-microsoft-antispam-prvs: <MWHPR11MB16962ACF1EF6314C0748BF1298789@MWHPR11MB1696.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rXWxfH1KTqxSdE3GpcQAdjy013D8kBmy2qgLtBxbQcMe/FUyY9MP3/BN7JGjDmBrndloKb62rqDAFgSTKk55hpvJtEEPXBPUW9Wk5IPLdvj/SHW6VzoegCh37cuMQmtpNv1anKC1LHDFQqowCSneAIKwAx0F/XLLfLgNnxLpxLC5R8htXj0ad0S7uPxclbnDoCaADtUM95N/MPoiJ5Ha0oCunqSrPNxjJ6/iKRuJMy+w7ouMc87qOnaMiu3wFZOSwEYq21wPIU5jkJUOXf5FLSMsPrmsz1vODQB3aV/l4bK66PtjOcIa0J8JisJ1WkyNLzOcrXrVfMsB/Y9psHxhVLwudsYQ7UZ0xnOp4pctMIVuSvjyIcjKQabCKip0gJJlRFbV9uSd1uknVoC9G3lW+Ii5L+rZqtkd/EMd1Nv2nUd51+zRmW/mdggl1HCXAJJa1LcBYxClFjwan5PAkhCRssysNH9Njuz7R5Qj15C3L9ML7Cp/gGQ/6TJCCz/muwGg2teHXNn+aPB1+imFsobidnKzEvRZZqP/EYjaJ/kXB3hBroYU4GUGm0NWSyU+6z0liOvlxtYeUwlANzrv30h7btff47jhMfjF+gWjtO1uSvZzNeGoHBCbgi9RsU9GFp90KAdxi44qfdmiI7CheVRYHPJcjfNW8HNp5kTDKxI3sc6cFNSEzOvM/XEvir69CyqiMxUj0tXqDAh4PD25RgGPoryOHaf/zvMo580VtGzssstM4JwX7bEj0pUqzAn0ZHyjDR5lhqSBAnzZMKS9B6uxdg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(186003)(6486002)(38070700005)(122000001)(6916009)(86362001)(316002)(2906002)(71200400001)(2616005)(31686004)(26005)(4326008)(36756003)(53546011)(7416002)(6506007)(54906003)(8676002)(6512007)(8936002)(83380400001)(508600001)(64756008)(66556008)(76116006)(5660300002)(66476007)(66446008)(91956017)(66946007)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N29ZUGQ3SURLZHRldG9sckNTWUlkcFVmV3dhMnFuNEd5VU9ITjBnVTlNaTkw?=
 =?utf-8?B?YWhRdkh0OTZmMW96UWg4M1FDUjNMUFQvQlZINTk3a2U2VEU5TlhaTUJXNjJY?=
 =?utf-8?B?bTVFL0NtUFNYU2JxTXEvanoxRlVXa1FxU3RFMDV5QStxRzdoaGp3aVhOdGw0?=
 =?utf-8?B?VHJEQVhVODZueUFpLzdnTFBEcDRwd1FUYkRGQU9KRE11dFRJK1Y5ZnYzK2gv?=
 =?utf-8?B?SkE3VitSVG4yNnJWaXByb0c0ZFA0bTdZV2hKUEZnVnFqZjBpcm5EZVdsVGVT?=
 =?utf-8?B?NXdFSnREL2RwVVpvOS9VdWF3Z2tpVkNiTHJsVW1DWXVjamFjL3FqSTRnTEEv?=
 =?utf-8?B?L21ybW9TQ3BYa0dZSzlKT1R4Nk1LRFlsZ1NtUFpkZVVlTzJRb1hYbEs3cjhH?=
 =?utf-8?B?WEp4OExHWjdTN294MWRTWmZhVjU0b2VqK3dOZXNPeEVFSS83TFJ4bEVKMmNm?=
 =?utf-8?B?b2JRT3VveTA0SGFPc0J3NDhBbFNMOG5mWUg1STRuL2dVbmU4dFMrQmcyOXhI?=
 =?utf-8?B?QTgxbnBEQkZ2SXIrUGRPM1FTTUEzTFptZldYMW04NHpmV1VBS2k4QUV5Ymxt?=
 =?utf-8?B?V0FjWnlXeU1lUkZNOENKcFVBR0lOR2praWEvby9UdEppbk1GRmxGRWZBaitH?=
 =?utf-8?B?QW9GYndzbmVLU2pQcEVFUDlpcTRwYTFPckRqYk5haUpNNXdDOHpneHc0NEIz?=
 =?utf-8?B?VitkM241N3pzRG5Rb2IvRWN4OUJvU3ZxUmhyS0hJQm5TSVpMaXZ0ZHFNUHBa?=
 =?utf-8?B?RzViOE9hU29ZMzNranR0Zk1zaVJTeU5ibE1EQ01ORk5QVnpzRUpFRnpGWDZZ?=
 =?utf-8?B?akJWR0JJUTFSaU9YZ2tJMVFvV0pRK3MvcEdXclVQOGFsQXh2WUFMaXRLQlF5?=
 =?utf-8?B?OXdORkptS0hrY3l3cXJKZGdkWWtrSnV0YVNuQ1RncFZ3cGpUd1JZNXE5ZU54?=
 =?utf-8?B?TVZ1NDkxZGYraWZHdERnZ1JIb1V5eFNMMllUWFNkbVI0eXVBVWl6bWpkaVVM?=
 =?utf-8?B?TkxTQXo2N1gvcnBrTkdpRmk0Z0I5dXRJUjRVblJkT3FTZEFYMWdCOGdwaWg5?=
 =?utf-8?B?U05oSEdaQ2tudTBFZUplMjNoSEU1dHpDSzFQUXB5bUpwcXpqOHRyS3l3NjlI?=
 =?utf-8?B?Y0V0aUlBR2hlUTRvTmpRbUNCQ1gyQzZwV0YrcWhpaS9HQzcrcjByV0xObDdD?=
 =?utf-8?B?bnJSZllwREtELzFaZ09VbnJWc3RNcVhEUlp2SFhocmQxODg3NFYxcFQ1MjBC?=
 =?utf-8?B?Nk5aNWxnMDlIbmc5WHZuTkN5UWFsZ0ZGZ2lmUHVYQVU3ellPWFRhVnpWeWdG?=
 =?utf-8?B?RllveE5DeTJYRzJEakNXSkV3REgwUDVhY1Y1VkVFYUR5ZmR6T1g1N2p6Y00y?=
 =?utf-8?B?WmF3Slk5TTRXN0dkZWZEZFRlVlpqU0F5bUhxYjNJcUxRQ0xsZnNyM1VHaS9u?=
 =?utf-8?B?dTVmaDJYdG5aMU9BbWlxU2lIRGdSOFdOMHgxVzlsYkZFSVZaZmxTeUhraXVn?=
 =?utf-8?B?cE5RSUl1d1F3aHdoYzFZb0Vlc2M0ZEMyVGpIdzc0SEs0ZHFTL01xN2FVNEhO?=
 =?utf-8?B?RVdXQ2lLQk13cExGdjdRNHZmTUlydHFxeVBDTEMyYjIyVUN2cm9JMFFzZUFL?=
 =?utf-8?B?VVdhSjRJd3B1UXJiVHprcU5hSlFEdTlmT3REb25GRC91QXIzeGR2OGx1Smpa?=
 =?utf-8?B?OEh4Q1hxRytXR2taMldOaURsYnU5bVZSUE4wOXJuK0F4SmlEQmtYVk9kYXBK?=
 =?utf-8?B?QnBZMS93NGtTT0lTRk9lanNsaFpsK3NDNm5JckJwcUFHMkdrajZDZjJVRmxa?=
 =?utf-8?B?aVhqWmNHdHVFR1pFMjBJenFlSmJaZFNESzNtVmtCTVdsR0xpWG1QVmViTjYr?=
 =?utf-8?B?NTA4TXBIRncxelNWTVdxRE44NWowT00ycDQvczZBUS8wcG9BY0Z3Ti83SWsz?=
 =?utf-8?B?Z3JVSmF1b2FvVE9MOGpyVEpLY3AyUFZFY0tzczdsZnNPQ1hHOVFVempLQmtq?=
 =?utf-8?B?a01NVzRyKzA5Y0x3UTlTaGRuT3NVSFdRN2E2cENtWG02UVFyd2R3WkhGK1pS?=
 =?utf-8?B?Q1lXcGZlU1p5bTNCNGY4aFVUU2ZaTytQemI3RTdIUGZlOFlsMTEybkNjVURy?=
 =?utf-8?B?YmdvR2w1WDcyK1FFSXUxdGg5QkhLbkhuUDlXb2tPUlEwRXZ2a3FkcVpKZ251?=
 =?utf-8?B?OVVISmlGWDB0Rk1YUDR6T1JhSmt4YS81Y1BkOS9aL0luUzFaWkoxcDIwd2hv?=
 =?utf-8?B?RThCbHNXMCtHUGFGRVZpNnNJYU93PT0=?=
Content-ID: <8FE4DB1D6E5EC142836346CC44B53E61@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14810de6-9da1-4c86-9de2-08d9c1727a50
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 15:32:47.0922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a8z9LXTkFvLRD6tlyyK4lFfC5Oz88t3K7smA4epSyhvii0KDt0jVrY9Wf9YB1yNaLX4uR+5mGnGW4gKah5C0zQQEkOzKyBeVCicdP08wRwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1696
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_073253_806113_939C1A30 
X-CRM114-Status: GOOD (  27.24  )
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

On 17/12/2021 13:43, Geert Uytterhoeven wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Conor,
> 
> On Fri, Dec 17, 2021 at 10:33 AM <conor.dooley@microchip.com> wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Split the device tree for the Microchip MPFS into two sections by adding
>> microchip-mpfs-fabric.dtsi, which contains peripherals contained in the
>> FPGA fabric.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks for your patch!
> 
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
>> @@ -0,0 +1,13 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
>> +
>> +/ {
>> +       corePWM0: pwm@41000000 {
>> +               compatible = "microchip,corepwm";
>> +               reg = <0x0 0x41000000 0x0 0xF0>;
>> +               microchip,sync-update = /bits/ 8 <0>;
>> +               #pwm-cells = <2>;
>> +               clocks = <&clkcfg CLK_FIC3>;
>> +               status = "disabled";
>> +       };
> 
> I'm wondering if these should be grouped under a "fabric" subnode,
> like we have an "soc" subnode for on-SoC devices? Rob?
> 
> BTW, do you already have a naming plan for different revisions of
> FPGA fabric cores?
Not yet (assuming you mean specifically how we will handle it in the 
device tree) - although i was talking to someone about it yesterday.
It's possible that we might handle that via a register, but if you have 
a suggestion or some precedence that you're aware of that would be useful.

The actual naming convention of the IP cores themselves, yeah. I will 
dig it up for you on Monday.
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
