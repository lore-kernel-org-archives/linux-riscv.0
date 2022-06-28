Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAF4C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 06:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=axKGCOEzsVOq07CAtJaY6nmRr0lcz3y8Ij84+QfMZmU=; b=cGqGhpOZpFzKrI
	L28q4lQG63TG51oM++/wUT2TB8o2IQGBmVnScTv798B/VB39Id1N+yaKmKdeoRFAo9ihOF6fgt1yf
	6pLRLS1od0Bw1VepBmmdyFujNyH2HDC+2XTUKUM3eVVUBIZF6p9W0hx6mgM3C70pa1c3GM4IcK/L6
	OppB3uwXlNSdXqE0WmbIBfcrOu3uBfxYUHzt23/fmOBnAzKpPZud5mMy2ONFlaeCaKku75f67mHDs
	ZVHrDIl4P5KHu/USo/7JunB7grdp4zKZs+4Ok3RC6kY+/7C6wHh53CzdMhxCP4XPYxQozBkdIuD6W
	I5vkJ3vvog5NsTCOg4zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o64kQ-004hZK-8s; Tue, 28 Jun 2022 06:30:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o64kM-004hXT-IU
	for linux-riscv@lists.infradead.org; Tue, 28 Jun 2022 06:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656397850; x=1687933850;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/5XHY9K4lbYzXiNjL4hQ814bQqdvbFHGIqkYf9O+BDY=;
  b=wtr+FxOrgISnYCUxOqzjz8clW4Cl3hp0H5RlTfEjHfl8n2ub2vxVUMei
   hyqoRZ7NzmKEzW79zOZqcB3Y948f+qIXihGVo2LCyWNSsU+mBIrDYEDAe
   7kIgzkgsLC5sjXqmTT9DKO4kVu+w7kr9kZNZEHkpOIR07ESbDIvfw0+ta
   TI48zNEqi1deXPfISBTIwmRj44s1d/BLTSOpMdsMjdtuWkEp2QJTIGiVp
   FIjshXnYegHj8DDs3V+7MfypcpXP32bdNOfUok67NEYvi4DAUK1V7FcTO
   TsWNpVselUgijnDamaJcHmLtvFhNYxdsGhbhaZUPhGMOFtttT3yOXKzgA
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="102029594"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jun 2022 23:30:45 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 27 Jun 2022 23:30:45 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 27 Jun 2022 23:30:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2Wvv6F5BFHd2924qcGBeSo56yLmCMz15QCkfc7syIigEEUehSZ6cKYQikHjt/cmP6bF6s8jBJOzgbMeIkk1BWA9drZ1HGA9lZjyE9lYPobGp/HPso5mEhVODyaotT0g8RAHR1E/j2O/q7ZgSabj5652gDinjo3DhHY3t7+KzoFwEOifW5mM/J4PtWGhogp3m9gPsXJQjn97zy8vDKh3A6twNjSQK98z++OH0B4pT2AyAqN3Sq9nZbiEvH3X8BUdBE0IpSG+MXTkiUhRt1xJuBgpOL/MtOtIB4at8nuT2p615gxupIe3Kvc8yatg+s83OIZI+UcHnd3qsYTDm0YxzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5XHY9K4lbYzXiNjL4hQ814bQqdvbFHGIqkYf9O+BDY=;
 b=DnlzqLItgS6FcuXy9JWXyq4uF7/5XuiLSAVVNut5mKq3nY+fFBCFFbG1VHv7eMufAvmCQXq95T1i6NXbzZtAXCV3drfl18hCUJnGKWeYfO0HES5gGUKZTOhlbitLkSV2W+/P/MA8YD0lIuU/C8yA8vOmbl6EGzzMfLEDyPIyY+V+89XZkTXX38hCKO5ob0HiFNEgqJiM0592f+CNlAqxh0wJ+7lBs6ma7sNM//tiiXbZAUEMWRKUxxBc/SS4ymSLNYzkFaJrd/GoYHWHTn3swcg5LU0be+k+bYWlivMuuI7xJMsWmyLXhxYtU44eaiSwdug32mIvDMkER3IBdLrZ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5XHY9K4lbYzXiNjL4hQ814bQqdvbFHGIqkYf9O+BDY=;
 b=Ez165tZAXH1FDvJL3GtkVonSwrjTJhia+6bQy++gt26aQ7mlxpEaejJYw8GX43e3rg811ef3MM8rA937TCgMOp4lMi6VTYVKZDVzAm2dPKT7GqnYBn2MauzUmpZlEqvzPgVlAUfIn8xe3qcwCFUbO4856qOjDHajXtH/pQiRnHo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4047.namprd11.prod.outlook.com (2603:10b6:208:13a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 06:30:40 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 06:30:40 +0000
From: <Conor.Dooley@microchip.com>
To: <robh@kernel.org>, <mail@conchuod.ie>
CC: <airlied@linux.ie>, <daniel@ffwll.ch>,
	<krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
	<sam@ravnborg.org>, <Eugeniy.Paltsev@synopsys.com>, <vkoul@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <fancer.lancer@gmail.com>,
	<daniel.lezcano@linaro.org>, <palmer@dabbelt.com>, <palmer@rivosinc.com>,
	<tglx@linutronix.de>, <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<masahiroy@kernel.org>, <damien.lemoal@opensource.wdc.com>,
	<geert@linux-m68k.org>, <niklas.cassel@wdc.com>, <dillon.minfei@gmail.com>,
	<jee.heng.sia@intel.com>, <joabreu@synopsys.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-spi@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 04/14] dt-bindings: dma: add Canaan k210 to Synopsys
 DesignWare DMA
Thread-Topic: [PATCH 04/14] dt-bindings: dma: add Canaan k210 to Synopsys
 DesignWare DMA
Thread-Index: AQHYgw9+LDzD+WbZ2Eu77tOt94oRs61j9VOAgAB1sYA=
Date: Tue, 28 Jun 2022 06:30:40 +0000
Message-ID: <40d76866-34e3-baef-c3fe-8836cd2430f6@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-5-mail@conchuod.ie>
 <20220627232919.GA3158390-robh@kernel.org>
In-Reply-To: <20220627232919.GA3158390-robh@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d0de0da-5dcb-4e68-993f-08da58cfb869
x-ms-traffictypediagnostic: MN2PR11MB4047:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hHiakVJV6unwx07bC+iy9KowBPt/FOGvj1vmZDUBwYo4ryGARvKVkXOTxYI7wklJGlCQBnRm3n4wOxfBdtF20Jfob0uUqeusIXoRndMdiGoMe7KG2bh0p6V771VKnRp8sMUncZxqbfMs1AmnuDqRyWbIWEkttiaoee8V5PtrzGqLPSa+H6XH+xtA8qgbTvoov/BFPUrrWjsLJidD8kBEdMsz+whv/c4KddX/Y7APzAEvYH+BhPZduFlmkT+BH5cUqPQsCIhYxvnnybyKw7NoikhLeDXNiqX0EX7EnBgTeFkvC2ZS4OUnGvPTZ1Wi0e5jDGZZkYIpDi6x/5mVioIAqWyE0W/BrSlkQB8lsPqH3pMOXKDe3tzEVZ71GduA/vZOUz6LxWNmuJAxX/zDFOn5CPZKoNFoVXMlTv4cqu8LpWtnIFbC9HB0CE66f/JGO8T0bWgOaHXOVseT1RfRIoY4eS8niMyP2TRCs1Yp5xPoUvBB49ljSp4hY0/KiiRoCg99lb21+J+m+XM/Huso2xg2BH/JaIgs7/JqXrPaKXUfeUcHm2PWiomjOkDSB3YSFvjDVX6G9/u4030+i3vvsoQ7KlUFjGKypI5RsxHJgYjRTkPKLcH7Nl4WE9fAEuZFgGxFDX2Wv8k6U1LhJjJy6lHWPKYPJ2gnjfQdWJ8HiSKH3LU/9bUZ3jaQT5m78pa6H88Vua7lFPdAMFJe7XKp9eWBY2fyEJ3Xw3iBtOwKauy28+xTM51+mQu/+x8be6iWE9gmCOePDq5kt1v8DPRzHSLT47y7nlAehqfeu7lsF63kgq44I95/N642TarDH6VU9OXHvCfm4R5bVaXzeBmX57xClRuhP+gQemNvBk3nkA8CuCpcR3F6KPq4fCfxIkMYmjDLsjwCcqukkCKDz7aNyn5HFlGdiHQwyckVhZxyRXCAtSE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(136003)(396003)(366004)(39860400002)(966005)(478600001)(71200400001)(2616005)(6486002)(7406005)(31686004)(31696002)(41300700001)(91956017)(186003)(316002)(86362001)(38070700005)(54906003)(2906002)(66556008)(53546011)(38100700002)(64756008)(66446008)(122000001)(8676002)(4326008)(83380400001)(6512007)(6506007)(66946007)(26005)(8936002)(76116006)(110136005)(7416002)(66476007)(5660300002)(36756003)(43740500002)(45980500001)(15398625002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUJrSmozQlhIV1ZqdjlBY3MyZ1d1WHc0QjVUQmVsZDBMcW95U0RVTE5qUW9z?=
 =?utf-8?B?aW53ckJaNU1LMGJWTHh0VFJoc0tMTUNRejI4S2NrTnVwNGtvU29RNVZIZU9C?=
 =?utf-8?B?TE1DZkIvdTZ6dGdza2k2ZXhhaFgvdzRhOHNHOFJRT2swQjRuNDZjRlNwb3A2?=
 =?utf-8?B?ditjQTkycWFwLzFvWkU5UER5R2RBRFNPbEpSdkhxVnBkcVcwa0dodVcyWkFy?=
 =?utf-8?B?NzB6MzdtL1hnTFBCaUJmbFF4VjVJSGpaS05RNVpZZ1l0QXg5Z0pkb1ZadVNH?=
 =?utf-8?B?Y2tDSFpQVW1VZDhORmozL1YxYjgzeTA4RmxmeFhISTVJV284RkJDd3lrWWg0?=
 =?utf-8?B?L0pObStlVmZKNS95Ym5EVnE3ZzZvcngrZUJvZTRySFM4aitBMWVMQ20xZExo?=
 =?utf-8?B?d0ZocGhyeUdkcXJDeS9iempISklqa1kxNFZvZGdZekdJTGNON2ZKcEdFT05k?=
 =?utf-8?B?RmV1MldIMkdBTWtzcy80b0Y5NTI1TG1jWU9DMm1jNFlFZjJNdy8yeFoyY1h0?=
 =?utf-8?B?YVk2MmhQWUUxdVdWZDBxOXJBTHg5dlZabTBkZ1VOS0NQeDJDT1N1U1d4UHdj?=
 =?utf-8?B?cDVrUHBISnlMTHU1bTNzSjJhVXEvY1pGQkRNdTdwblFJQnd2TlVkeUxGWnR1?=
 =?utf-8?B?SGdDT05ZTWw0T3QrekFQRFBzN3ovVkFvNk4vQVRxeU1uNERLZGd5N2JidDQw?=
 =?utf-8?B?N2tLc3hBMlNRd1VBMFVjUHNiVlVoaEtsSGhid2FOaVNkTWFIRDVLOVFUM1FY?=
 =?utf-8?B?ZFpZNExVcVV2YVl3OTJ3ajhEbzhaMmxQNHlBU1l6VnFhTnNZcE9uUllBdmJM?=
 =?utf-8?B?QWRHVVV1SVVmWm9lb3ZEQ1BkOEhUZUMwTDhyOEFLWkZnYXY2UXJZMnhRNzBi?=
 =?utf-8?B?bW82UkxrL2JVMTg5UmNYYThra3N3NWJ2K1hlUm1QdHNuRDJZa2FZS281bTdY?=
 =?utf-8?B?WXRxcXRYSUNEYUFOTkdubUI4d0JPLzNLbVNzbDREaFl6Z3diclVYZnBHTWpn?=
 =?utf-8?B?MkxiblRSRzJ0Z3dpdGRzTGI0YThVUi9LaTJMSVN4OFFMMDAySmFxWGxHaFZC?=
 =?utf-8?B?UlovRmppSFhmd1habFJWV3REM2JBMHZuc3VGaHlBNS92TW54NzlvbEwxS0Vs?=
 =?utf-8?B?YmE3ZmxDWndjYXVXVUh6bm12ckRhbFBRSGg4bk9GOTZxRTBDWmlNNzRhWFg3?=
 =?utf-8?B?RERENGVhZ21FVlRhSGlnYmtWTDNQS0tyS3FsZzJXdUtvNllYS2lSWGprQnEv?=
 =?utf-8?B?eFlMWnpRVWVTYUpNWk5nZWZ6dHplRDlqVzc4ZzdrM1VtdXdJa29IeG5oZTBB?=
 =?utf-8?B?QksxSlpjU2dHZmY0Tk9CRGQrWnhrL1BNNk5YNTdnMU9xdFphUlkwdmN4dS83?=
 =?utf-8?B?eC9ub2dpbWdFL1luMUVUZU0rTy94U3JySVhzR2NyTjd5RUVpc29URENLRE5i?=
 =?utf-8?B?dW1aYk81SWtFeCt5WTd3UWNrS1dTU2RxTDMxTGpJZGxaTlJOMlBHSHRzWSt0?=
 =?utf-8?B?R3o2eThELy92TUIvNUw1VGFjSmpwdmxmMmk2ZWJiTllDbjU3Nk8wcitYV0ZQ?=
 =?utf-8?B?Mmk2WTNtQ21zWXR5ZDFnSHpvay9TcSt6ajM5bGFkTXpDclU5MEhMYmtRSFhB?=
 =?utf-8?B?cHFjSVdMak1ia0xEcURzTUtweG9MV0JtaSsxSUQ4MzMvZkpFMzk1dmxsS0RB?=
 =?utf-8?B?OGdodTZiMFlnN0lwWXVHYmloVW9CMUlwWnJYa1ZhQjBBMjg2TkpHdlhaam80?=
 =?utf-8?B?WVl1Q3JNdzFRb2VoRVhtQjdvc090WlJEWXhtb2NMbHE4cTlDV2JyT0EydTVI?=
 =?utf-8?B?cEIvdG1UNVd6QnZEZksrMjcwSmZscmp4VkhxckhHSlVsN016QTBVcHEwblhs?=
 =?utf-8?B?WHdlSkVFUVQvTXlZYlFJOG9NR3c2VDhwVGV6K25nSCs5ZXAzeHhqdmhEcmhR?=
 =?utf-8?B?QUQvbkV2ZGJRZjZ3Z3BvNE1GSkh4RTM4RDNYb3lYY2ZlZTB1UGIvT2MzMXI0?=
 =?utf-8?B?RGJEazc5ZTgwKzZoQzhIWmxma0N4RVNlbXFRdG9EdUVaQzZXdTNmenJJeUNr?=
 =?utf-8?B?MXc1WEpuSlBRVG5LbkhPRDFoamRHRE56WVo3SEh3NGp5aytZc2VJR3VuY2Nu?=
 =?utf-8?Q?yBDEBE4/L9qevxht5VAMZtWeu?=
Content-ID: <D9FDC44A3C4FA6488D0F3F11FE471592@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0de0da-5dcb-4e68-993f-08da58cfb869
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 06:30:40.1124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: frhMo0g9GYOA9TjBFz/KEtZ77XmoHOCEkJaejj+UZWZMxt391PpTLCyEWjCo2wylpCSWsqvY1cjGXHQRavgzpPa70w0cu7fGhvc52hVUzUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_233050_751129_F031DA64 
X-CRM114-Status: GOOD (  20.77  )
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

On 28/06/2022 00:29, Rob Herring wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Sat, Jun 18, 2022 at 01:30:26PM +0100, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
>> controller, but according to the documentation & devicetree it has 6
>> interrupts rather than the standard one. Add a custom compatible that
>> supports the 6 interrupt configuration which falls back to the standard
>> binding which is currently the one in use in the devicetree entry.
> 
> But it works with only 1 interrupt?

Seemingly...

> 
>>
>> Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 58
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   .../bindings/dma/snps,dw-axi-dmac.yaml        | 35 ++++++++++++++-----
>>   1 file changed, 26 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> index 4324a94b26b2..bc85598151ef 100644
>> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> @@ -18,9 +18,13 @@ allOf:
>>
>>   properties:
>>     compatible:
>> -    enum:
>> -      - snps,axi-dma-1.01a
>> -      - intel,kmb-axi-dma
>> +    oneOf:
>> +      - items:
>> +          - const: canaan,k210-axi-dma
>> +          - const: snps,axi-dma-1.01a
> 
> I would drop this depending on your need for compatibility. Are you sure
> on the IP version? It's not really compatible if the number of
> interrupts is different.

That's what it has been using until now. Am I sure? No.
Do I have docs to go check against? Unfortunately, also no.
Does it not qualify as a fallback compatible if it supports
a subset of what the hardware does?

> 
>> +      - enum:
>> +          - snps,axi-dma-1.01a
>> +          - intel,kmb-axi-dma
>>
>>     reg:
>>       minItems: 1
>> @@ -33,9 +37,6 @@ properties:
>>         - const: axidma_ctrl_regs
>>         - const: axidma_apb_regs
>>
>> -  interrupts:
>> -    maxItems: 1
>> -
>>     clocks:
>>       items:
>>         - description: Bus Clock
>> @@ -92,6 +93,22 @@ properties:
>>       minimum: 1
>>       maximum: 256
>>
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: canaan,k210-axi-dma
>> +
>> +then:
>> +  properties:
>> +    interrupts:
>> +      maxItems: 6
>> +
>> +else:
>> +  properties:
>> +    interrupts:
>> +      maxItems: 1
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -105,7 +122,7 @@ required:
>>     - snps,priority
>>     - snps,block-size
>>
>> -additionalProperties: false
>> +unevaluatedProperties: false
>>
>>   examples:
>>     - |
>> @@ -113,12 +130,12 @@ examples:
>>        #include <dt-bindings/interrupt-controller/irq.h>
>>        /* example with snps,dw-axi-dmac */
>>        dmac: dma-controller@80000 {
>> -         compatible = "snps,axi-dma-1.01a";
>> +         compatible = "canaan,k210-axi-dma", "snps,axi-dma-1.01a";
>>            reg = <0x80000 0x400>;
>>            clocks = <&core_clk>, <&cfgr_clk>;
>>            clock-names = "core-clk", "cfgr-clk";
>>            interrupt-parent = <&intc>;
>> -         interrupts = <27>;
>> +         interrupts = <27>, <28>, <29>, <30>, <31>, <32>;
> 
> Does the example really need changing? The old one was correct, right?

:facepalm:, committed my dt_binding_check test
Thanks Rob,
Conor.

> 
>>            #dma-cells = <1>;
>>            dma-channels = <4>;
>>            snps,dma-masters = <2>;
>> --
>> 2.36.1
>>
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
