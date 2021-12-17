Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1E7C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 15:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24J5c2298LHBplNXRbYtBYRODgQeRnKgTiY1vcoL9Hc=; b=cF9y9zirWosWoc
	w+c5v5tLGCqTuXebgz8nJ26qxm2R3ruPtlkUb4sqC7WfpvYmOwqtZv9tVm2OQqQfvJLJOp22NJtuh
	k5pSj+Y2bwfeT1vrHP43kxNDiWm/zsBzoku8KYhh7mCB8yZCL+ds6H9ggznoKEy3W1xwUIYPiVXHo
	Vjo8VFB8Ms3JmQU4c3SWUTZ3jlzl6fd+EqJkj/uI0YRAM7OF785G0VVvAoX55WqSBH489qEmSReXF
	qZN3nfXvOaWSUGNE3MtLDheGUJ/hCOaucRAbzVYJ+IY3hLX53MkPm3U8SvVQcNyVH1cH4nF9un7Xk
	ICbZaBTT5IjPJm1sqHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myF55-00AtPY-EV; Fri, 17 Dec 2021 15:23:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myF51-00AtNZ-99
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 15:23:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639754611; x=1671290611;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=e/rgwXEOYoqzU8X9KAzjzXgDD96JqJNLwbLamYfThkg=;
 b=FdtPSGrigkEmog6ryf2DT44OWo1ZlTy65SJ0y1poQ7x1QG4PBvOWR0yf
 8SfkupwjGYnb0NS3cVeE4tgL/g4fW0aJTibOyKH89pkgjF7b75E/hFm0N
 uuH4LM5y369qNsRUcgPlPXFCGpPucAa+NSfyRyxrNosurjuoQgcD5fz9M
 kbOdpm64u5K1hsFLj4z0V6aTFC2EQ6HvpWEe/vLc0rbl6pIeYoFvDjOOd
 Th1AM2GoGeS6AfMMAXN4USqFliq1eYCfqFKKiVu/wDmsGOhkmX9v2aXUW
 uSBzG+Oqkod1ewcC+hnwyjvaS0h/iJ0kd1M2IxuZi1HPNLRRcFOhwQm8y A==;
IronPort-SDR: XF1epj6/yPxdjX+C0zKB2WXC/qMaoodaZY3nbM4P2j58QCUS8Bf1lQeRzEVyj9sscJJq9lzmtK
 wr8PrC3pCQU/EmUXJmJu9PA3cSc8c0FdRJNwm2cM9H4CHHecrudi72OtqKANoXIE9zt6Ta23aT
 /3UewvSK0u8pu9PKlIxFOKvhYoWlPxUFRTyS1GCO4Y5nP585IqsGeEqA2eCk1qZOPnCT0nuWFF
 oSkKYnfMMVbf6AG0508XDW52LyAj2U9LDlULivdFtu9i8rQYrU69jtiMaoJgzvxVhDQFLtKPDK
 9avzIEGLI1a6k8hOHQwwjRgK
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="155887772"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 08:23:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 08:23:17 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 08:23:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGHAabC29oqjRQ/ojaiWyFby/BkblItwks10wpD/bx3HAMKWMg2WaVnmFPhnX4VG2ggvzwsNYyMIebc84DD6Urw8BlH9h7xQnmJ2k6bibzxKg63cabBVdOJ13SlBu5+oSSqSsRUwtpc74QqSmfWtta5+eGKWy+LTwHAVaSMy6j51KtSYZk3rxVPvbeLPmkGAWfnWxX490MX1pjWTNu6L8qQuY1jgm2xQAk1QpiP6tEpteRSYBO5fEWm2JAHo9aXO9iKBP6juPnF4qHgZa0tHYjtQASgQdqTJ0FUC8gWecVvhdFCe6++3UyKTP5/j0xGJmbS3G/UGcAKAQ2Yrjy8EBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/rgwXEOYoqzU8X9KAzjzXgDD96JqJNLwbLamYfThkg=;
 b=iTdZOYUI7Vp/1hVIY+oyjuIGsuPqWYEv5ChWSID9qs38VWCSAP3BcmN3DII3vC4Aw3a63DAu5Vx64ysmBXvibuN7BxUYCcjvtVoQHYKqkF2FvbLS+sPceZk/YUTFymtkPBmrbNEPqXC6g4+quFwR7qeJhe8kSxKHtet5DI1UnA6vdlZ/1zf05zCFFnjdNHm5np+Sn/XO/827IVHlA/nQNxECZKHhASUUzNC3fUTnPdqJX9sybVTJYNIjP2skFBGg6W19n5CjcuafQutux5NN1mvuO1mbFTo0DFTp9qOrwxR86qkj3vrSCiJzfbVMb2kiPEaGx4fLYKruhvjjytQ4jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/rgwXEOYoqzU8X9KAzjzXgDD96JqJNLwbLamYfThkg=;
 b=DT0dlTZtLCHjq5Ic9h5fjAQKtBtIIs5rXfiWMkZRzjJoy6Zmm2hTfL6OKR/y2+Zn6PIcLK4Oeo4y1vr050YjzrUWrjlDiZToMhv7e8fwjo1p+q/snIe5WqZycoCyPXpZd85hYJ5geKxFFMNsWGWEjl0W7wJzbq5QICYYhdvEKps=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1998.namprd11.prod.outlook.com (2603:10b6:300:1e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Fri, 17 Dec
 2021 15:23:16 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a192:c9ae:1f83:797b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a192:c9ae:1f83:797b%9]) with mapi id 15.20.4801.017; Fri, 17 Dec 2021
 15:23:16 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@canonical.com>, <linus.walleij@linaro.org>,
 <bgolaszewski@baylibre.com>, <robh+dt@kernel.org>,
 <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC: <geert@linux-m68k.org>, <bin.meng@windriver.com>, <heiko@sntech.de>,
 <Lewis.Hanly@microchip.com>, <Daire.McNamara@microchip.com>,
 <Ivan.Griffin@microchip.com>, <atish.patra@wdc.com>
Subject: Re: [PATCH v2 15/17] riscv: dts: microchip: refactor icicle kit
 device tree
Thread-Topic: [PATCH v2 15/17] riscv: dts: microchip: refactor icicle kit
 device tree
Thread-Index: AQHX8ylEKKNUHVy5IkWjmg6nu466E6w2yFYAgAAF4wA=
Date: Fri, 17 Dec 2021 15:23:15 +0000
Message-ID: <429325fb-9190-0c65-7c54-fb6b1c8e847e@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-16-conor.dooley@microchip.com>
 <0b7344d2-629f-7f78-b0e8-f6c70fbe9f37@canonical.com>
In-Reply-To: <0b7344d2-629f-7f78-b0e8-f6c70fbe9f37@canonical.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d88c6321-d680-4d96-84f5-08d9c17125e5
x-ms-traffictypediagnostic: MWHPR11MB1998:EE_
x-microsoft-antispam-prvs: <MWHPR11MB1998AA573EFF3F90BCFC533B98789@MWHPR11MB1998.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qfzRoKjfznRzhxbEOInRp828FPTSeM3o5vbljg2TdI5YvtMXiCuwjOMPawGNbSwIrrA2+6gbFsESGK9kLxGr5+EAi2h9eLvKV6yZNSyoNUOTz5iv0Qz3d92XUe+6s3B8y5GBye32Z3k82Ym6ykHXxFIMvwwZmXegNOYHIjVSq3cpyA+OUZnhtk9raa5TZkhXHpr5O2WN8RRexuMOP6lRQSALiO5xSmpp/TIU3Jxu4NiaHEwWkgcYaMe/9N1XX6+wgwTcaeQsjuVQQqTXbDiPwQ2eGkhUt6OwC/FCpFMvEOp3NknWcSKL0ZzrhERpNcotnX7e9X2dtsZ1FsOh3Jf1guDDzzEImtuQVZ9zoxGnQcanJXuNOReAMGiCiewUnVpp6kOWg3Yo/w/O4gI0cvJlBg4fuTIRbyY2do/CvlQ1RA41GmYzyUe/Vh/ncq0fKpfq0Flkd+JgmswcZPi2g5NM/nHu4f0MpjzNF3llgCkMV0qOXdBt+Nr6qwFV8crF/DrGN3rCY/McbGS0HQ7J1bmY0wrUQVS+dEh/3/xH2Q0kBwcenfTcTFha6Y7cya/BnxoNqtmAtunnFcsVHgpcovW7XrGWIdjIoA8XSCGt0rm3vbpF7hhL/tNjtKm+BZegHiB8FU52zjuRaXxW1WgA6Vc+jFCtDa+p7A19G6hY7YAnRfYBJ5J1qyvmhbvI+ucd3zmhxZ7bzBrFklFuJlRvsKlFzHHUySXK0BJnCcDqN1RsLitNvZTOy/vjEQrxCNHYfNTSJBBzdoKriWcShU8vjC3AbEtNERdiICi09lia6+Fm9KY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6512007)(6486002)(316002)(83380400001)(110136005)(54906003)(122000001)(38100700002)(38070700005)(6506007)(91956017)(71200400001)(5660300002)(4326008)(508600001)(2906002)(76116006)(64756008)(66556008)(66476007)(66446008)(66946007)(53546011)(36756003)(26005)(2616005)(186003)(8936002)(7416002)(31696002)(86362001)(8676002)(921005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDNFMXAvM0J0TE9SZWFLcHQzdVVvUC9NY2hMMjVEOS94WnhrQVZ1T0RsdVNB?=
 =?utf-8?B?eTNEWVE2a2k1TFZWVnpLc1c5WTJQOXdoemZCNWRLZ2RnNDY1NXhWRElGM0Jq?=
 =?utf-8?B?WTNGWE1SdUdINzhPR1FSZlhEWXRHU3Y0U1hBTjQyZUdxcnlYT2JvbHFaWkh3?=
 =?utf-8?B?TGtJOHVVWmVQZDMyVnd2d2k4eC9QdUZvVWRVYXZEY3VrRHEwK1NLQjlDRURv?=
 =?utf-8?B?VVhGcXZXT2J6VjZqUkpGdWczQ2ZRSlJhR3dXOVVhVUs2U0tZVzJJT0tKQlVV?=
 =?utf-8?B?NXEyR1BJM1lYM3VqaFJqSGpLREhKRXpnd0sxczJ6RWJMcllPUG5FT0hmN1M3?=
 =?utf-8?B?WnZDbTJvUHRMWGQ0QjVBRDNyaGVhajJJem1HOThNRW9RN01TZm9jelZuLzJ1?=
 =?utf-8?B?bXRuTmViVkR5eHBDKzJPRHphcWJPWVBicjkvU3hyaXpKdndxcU9tZ1ZWbDRP?=
 =?utf-8?B?UGIrRTEzYmxQdDN4OGIzdUU5eFVKVG5JRlk3MzJYRDNSVG9lWHZvaHhIZUor?=
 =?utf-8?B?YTBHUnpmVXNzWFBmc1RwSWZmUnlZRENLSjJ5dHFtU0JVRi9ZV1lPZU5mcW00?=
 =?utf-8?B?T3ZJODFFWEgwZStIenlQQUE0bVpjOHRQUXM5RENtY1ArSWFNcHhOWGFzR0tW?=
 =?utf-8?B?eWRObjhTTC9WRHBFWVVPd1ArNDdxWm5pSXdIV25zM2dGSktQMTVLVVhOYzVF?=
 =?utf-8?B?WEZYRmNIT1YxeE1URGR4dzJMd1NlTHlYWVVDYmV4dm5vdVNuVXZRbmtiMGdP?=
 =?utf-8?B?ak9aVGV0QTJHeCtUVzZsajVFT2ttMGZDSWhWRFJzcHJHWUt3NGxqR2hOTFpt?=
 =?utf-8?B?T3RVd1dBQTJ0UjFYTVhob1V3TEczem5IbnE3Rkx4R2tTRlhxRHhEQmlBaE1E?=
 =?utf-8?B?TWJlZFZ1T0k2aHQ1UkdiTGdZY3VXOFlyZ3dNNldXcy9wZ3VlWEZtVHFmT05x?=
 =?utf-8?B?U1BZTVJPTVNwSDg4SmVIUC9WRjd4bzU5bU42ZDlSOEU4R0lUdVlHamRna2RY?=
 =?utf-8?B?dnEyemh0L2RnWi9ZV2NzbUZabVdJY0pVMTB4OWJnSW1SRGF5TzZDOE1scXV4?=
 =?utf-8?B?WUhrUnZoNDk5NGpTSUovWHdZcWxqWTN4U0J6WWVUVENKS3BsNXlFa0RIeDhP?=
 =?utf-8?B?NjRka3ZxYy91V2lITDU2SVkwOVAyTTYrMWJzRTYzTjh4NEMxbER4c3N2VGtq?=
 =?utf-8?B?dEJoR2lEMjc4THJuWGNjdHZEeWRSRGlYNTI4dWJBYm1hVUd4Q1pINDZHazRr?=
 =?utf-8?B?R2cwa1oxSVp3K3ZXTlNxNTF2aitXR2JHdm5qVzlod05OZHg3Z2NqUnhzaXNT?=
 =?utf-8?B?UG5tb056QXlDYUpzWnJWeG40cVFmbVF6d2Q5bU5GZnRaOEc4bHMxTndheHB3?=
 =?utf-8?B?Sks0UlVURFdxQ2xOOVN6cytUandQd0FZVnZyZXphMzBIZUROdmRRVjM2Rnl0?=
 =?utf-8?B?WmZoREdNUlg1ditUdGZTcDRPMGhoSXdxTVJJMGdCaHpFbFQrUDQ2THdPRTlJ?=
 =?utf-8?B?TzNkaFlrOTZOY3ZOMXU1SnZCSUtGRDJ2WEFkSzlqYlJ3MjM1TFROcHpPbExl?=
 =?utf-8?B?R0R4ZU5QaDV0M2xSUnB0d3ZOZWY2SXlQOE1leFJFTEdTd3FFNlFUakF2Vjdj?=
 =?utf-8?B?SGN2SkU2OG1PNXU0STU3MlVrL1ViZUZGcXpzQ1JXZWowbzRsaUZTQ2pNSjZE?=
 =?utf-8?B?YytWZi9NN2pPeDg5VjhiVVN2bUFlYTlCUVpGTVcwaUNNeWpyWVUraUNFTU9S?=
 =?utf-8?B?c2paYjBoejY3LzhVSDRjamx1MFVacnBWd2F1Wm9pMW42aXVDZ1VkSjIxTDQ1?=
 =?utf-8?B?NkFINnFsWWdNUVBLdVQxdk40ck1pbkZjYnRBUlIwcXpoOGVIdVNwdERUVVM1?=
 =?utf-8?B?WCtpT05SNllVamtielZkdUdtTlYyaDBEZ0x4R2JPUDRlMkFPd2ZoYmYrTHN0?=
 =?utf-8?B?SkJudG9Zc21pZTJDQzlveGJBVEFGZWRWVDVHOHhmbkd6TmFJSmYxem4yVUtU?=
 =?utf-8?B?Q1BaVCs1MUNpakJSd0w3Wm5VLzJhTXBnMFdheWZwR3NwSWJvbUZUcDlQdVRz?=
 =?utf-8?B?TDc0QUZQNEJCMVc0cnUzWTBpcjJqRHVoZ3BobFBJT1FSSmoxNFFpRTJUMlo1?=
 =?utf-8?B?bVU2TjZaUmxuODFjaGJTVGRaeERaMnFBVFBMN09VZ2pRTjJTMGpXaHRqZEN1?=
 =?utf-8?B?Z2pCbjJ3RnBjSTNrWmYyWC8wejRrbmNGTDRybnVWWmhNWjY4ZHJzNmlHVld6?=
 =?utf-8?B?aWlZWUg0Q3N4Q0Nyd0V2a2VwM1VnPT0=?=
Content-ID: <96F393AC1001374D9C8DD6DA4D04A552@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d88c6321-d680-4d96-84f5-08d9c17125e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 15:23:15.9181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RxYBXG0pYblRbJa25f9SPtVc0RM7Vw5HECI9a6jwgzDLJKi1T2ZGnlUyBqps8gAdA8NK36YwBnt95rVo/hgyq5ry937tLHAkHQhxptqWG6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1998
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_072331_371547_DC131543 
X-CRM114-Status: GOOD (  16.36  )
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

On 17/12/2021 15:04, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 17/12/2021 10:33, conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Assorted minor changes to the MPFS/Icicle kit device tree:
>>
>> - rename serial to mmuart to match microchip documentation
>> - enable mmuart4 instead of mmuart0
> 
> This is not refactoring. Refactoring could include renames,
> hierarchy/layout differences, naming, coding convention. You are
> changing features, e.g. using different UART. Please split the changes.
will do :)
> 
>> - move stdout path to serial1 to avoid collision with
>>        bootloader running on the e51
>> - split memory node to match updated fpga design
>> - move phy0 inside mac1 node to match phy configuration
>> - add labels where missing (cpus, cache controller)
>> - add missing address cells & interrupts to MACs
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   .../microchip/microchip-mpfs-icicle-kit.dts   | 52 ++++++++------
>>   .../boot/dts/microchip/microchip-mpfs.dtsi    | 70 ++++++++++---------
>>   2 files changed, 68 insertions(+), 54 deletions(-)
>>
>> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>> index 174f977c164b..f6542ef76046 100644
>> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>> @@ -1,5 +1,5 @@
>>   // SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> -/* Copyright (c) 2020 Microchip Technology Inc */
>> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
>>
>>   /dts-v1/;
>>
>> @@ -13,25 +13,34 @@ / {
>>        compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
>>
>>        aliases {
>> -             ethernet0 = &emac1;
>> -             serial0 = &serial0;
>> -             serial1 = &serial1;
>> -             serial2 = &serial2;
>> -             serial3 = &serial3;
>> +             ethernet0 = &mac1;
>> +             serial0 = &mmuart0;
>> +             serial1 = &mmuart1;
>> +             serial2 = &mmuart2;
>> +             serial3 = &mmuart3;
>> +             serial4 = &mmuart4;
>>        };
>>
>>        chosen {
>> -             stdout-path = "serial0:115200n8";
>> +             stdout-path = "serial1:115200n8";
>>        };
>>
>>        cpus {
>>                timebase-frequency = <RTCCLK_FREQ>;
>>        };
>>
>> -     memory@80000000 {
>> +     ddrc_cache_lo: memory@80000000 {
>>                device_type = "memory";
>> -             reg = <0x0 0x80000000 0x0 0x40000000>;
>> +             reg = <0x0 0x80000000 0x0 0x2e000000>;
>>                clocks = <&clkcfg CLK_DDRC>;
>> +             status = "okay";
>> +     };
>> +
>> +     ddrc_cache_hi: memory@1000000000 {
> 
> This looks unrelated to refactoring - split of memory - and needs
> separate change.
> 
>> +             device_type = "memory";
>> +             reg = <0x10 0x0 0x0 0x40000000>;
>> +             clocks = <&clkcfg CLK_DDRC>;
>> +             status = "okay";
>>        };
>>   };
>>
>> @@ -39,19 +48,19 @@ &refclk {
>>        clock-frequency = <600000000>;
>>   };
>>
>> -&serial0 {
>> +&mmuart1 {
>>        status = "okay";
>>   };
>>
>> -&serial1 {
>> +&mmuart2 {
>>        status = "okay";
>>   };
>>
>> -&serial2 {
>> +&mmuart3 {
>>        status = "okay";
>>   };
>>
>> -&serial3 {
>> +&mmuart4 {
>>        status = "okay";
>>   };
>>
>> @@ -61,29 +70,32 @@ &mmc {
>>        bus-width = <4>;
>>        disable-wp;
>>        cap-sd-highspeed;
>> +     cap-mmc-highspeed;
>>        card-detect-delay = <200>;
>> +     mmc-ddr-1_8v;
>> +     mmc-hs200-1_8v;
> 
> This looks unrelated to refactoring - new modes for MMC - and needs
> separate change.
> 
>>        sd-uhs-sdr12;
>>        sd-uhs-sdr25;
>>        sd-uhs-sdr50;
>>        sd-uhs-sdr104;
>>   };
>>
>> -&emac0 {
>> +&mac0 {
>>        phy-mode = "sgmii";
>>        phy-handle = <&phy0>;
>> -     phy0: ethernet-phy@8 {
>> -             reg = <8>;
>> -             ti,fifo-depth = <0x01>;
>> -     };
>>   };
>>
>> -&emac1 {
>> +&mac1 {
>>        status = "okay";
>>        phy-mode = "sgmii";
>>        phy-handle = <&phy1>;
>>        phy1: ethernet-phy@9 {
>>                reg = <9>;
>> -             ti,fifo-depth = <0x01>;
>> +             ti,fifo-depth = <0x1>;
>> +     };
>> +     phy0: ethernet-phy@8 {
>> +             reg = <8>;
>> +             ti,fifo-depth = <0x1>;
>>        };
>>   };
>>
>> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>> index 808500be26c3..d311c5ea27c9 100644
>> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>> @@ -1,5 +1,5 @@
>>   // SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> -/* Copyright (c) 2020 Microchip Technology Inc */
>> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
>>
>>   /dts-v1/;
>>   #include "dt-bindings/clock/microchip,mpfs-clock.h"
>> @@ -16,7 +16,7 @@ cpus {
>>                #address-cells = <1>;
>>                #size-cells = <0>;
>>
>> -             cpu@0 {
>> +             cpu0: cpu@0 {
>>                        compatible = "sifive,e51", "sifive,rocket0", "riscv";
>>                        device_type = "cpu";
>>                        i-cache-block-size = <64>;
>> @@ -34,7 +34,7 @@ cpu0_intc: interrupt-controller {
>>                        };
>>                };
>>
>> -             cpu@1 {
>> +             cpu1: cpu@1 {
>>                        compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
>>                        d-cache-block-size = <64>;
>>                        d-cache-sets = <64>;
>> @@ -61,7 +61,7 @@ cpu1_intc: interrupt-controller {
>>                        };
>>                };
>>
>> -             cpu@2 {
>> +             cpu2: cpu@2 {
>>                        compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
>>                        d-cache-block-size = <64>;
>>                        d-cache-sets = <64>;
>> @@ -88,7 +88,7 @@ cpu2_intc: interrupt-controller {
>>                        };
>>                };
>>
>> -             cpu@3 {
>> +             cpu3: cpu@3 {
>>                        compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
>>                        d-cache-block-size = <64>;
>>                        d-cache-sets = <64>;
>> @@ -115,7 +115,7 @@ cpu3_intc: interrupt-controller {
>>                        };
>>                };
>>
>> -             cpu@4 {
>> +             cpu4: cpu@4 {
>>                        compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
>>                        d-cache-block-size = <64>;
>>                        d-cache-sets = <64>;
>> @@ -153,8 +153,9 @@ soc {
>>                compatible = "simple-bus";
>>                ranges;
>>
>> -             cache-controller@2010000 {
>> +             cctrllr: cache-controller@2010000 {
>>                        compatible = "sifive,fu540-c000-ccache", "cache";
>> +                     reg = <0x0 0x2010000 0x0 0x1000>;
>>                        cache-block-size = <64>;
>>                        cache-level = <2>;
>>                        cache-sets = <1024>;
>> @@ -162,10 +163,9 @@ cache-controller@2010000 {
>>                        cache-unified;
>>                        interrupt-parent = <&plic>;
>>                        interrupts = <1>, <2>, <3>;
>> -                     reg = <0x0 0x2010000 0x0 0x1000>;
>>                };
>>
>> -             clint@2000000 {
>> +             clint: clint@2000000 {
>>                        compatible = "sifive,fu540-c000-clint", "sifive,clint0";
>>                        reg = <0x0 0x2000000 0x0 0xC000>;
>>                        interrupts-extended = <&cpu0_intc HART_INT_M_SOFT>,
>> @@ -198,15 +198,6 @@ plic: interrupt-controller@c000000 {
>>                        riscv,ndev = <186>;
>>                };
>>
>> -             dma@3000000 {
>> -                     compatible = "sifive,fu540-c000-pdma";
> 
> Removal of nodes does not look like refactoring.
> 
>> -                     reg = <0x0 0x3000000 0x0 0x8000>;
>> -                     interrupt-parent = <&plic>;
>> -                     interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
>> -                                  <30>;
>> -                     #dma-cells = <1>;
>> -             };
>> -
> 
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
