Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55B0CCA47E
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 18:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RPwfs7fH31QSBl2wd+n+V+7eKJTC5gIoBv0aSaZMZEU=; b=CACG8DpOfEFaEV
	zgEVtYA/Feg9ljUizQ5wpzCPB1PKWosjz3kijAqEZ2SicGgEUUBL6qRirHbMwqVpTb3G2c9OVVzDK
	uIyAvXFI9EOIoYPtdoRNOiL6/8aVxYxQjKF7i8YEnhxQDdwCFXVIyaqDNGawqEIERDlFKEfA+xAVG
	YR5TNZ8FXMFicuM2tleKXRkAqxHULp9460ddFeHDTJPA5negvv0eXDvdi0RWT17/VOOyiOfEu7xjI
	Y+uTFDI09ROxN1UwV2pJ9gnfwzsswZ/g3LzuSXRwO671pRvsUQw/4AVF01O3uvc0uol7RvKbRB83Z
	SLLcy8MAKCZLnVAmlIGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5t7T-002KVX-Pl; Mon, 27 Jun 2022 18:05:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5t7P-002KSH-Tk
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 18:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656353151; x=1687889151;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jZk/JbbHouGijU0bHYxj5ANsT2FgUgoTS9HYC+K1d6Y=;
  b=nrAuxcBfRl+pR5FUgbkhNTgalXJ+XFftBUlfudJVCyxjhSDHtZ8fRhmB
   ZiZZvXIVbwrktCvJwSjuv5/MM280cDAdvF7KY3WGg/+FqZGYem+eEnBj9
   AMgAq5kzNUclJwLI10lFojQCCw5AoLtfwNv2qew7sfk6hjtwDL9VjB2gk
   o/DJd5Lsp3A6s0SuyYHqw6o5tLNknjJ587qlBuH+zk2sQoYPJOuRT/Z7N
   MdYjEt/403poNXp9wjxwOLtVGTfCYlVaRDuvzaOcEoBhFFy5Xk6jZi1E1
   TxMlr+PdxH9VKvOONPfCP9aqDm1EpHMEBUVwwJig7ansO/R5haE8RD6zC
   w==;
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="165295260"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jun 2022 11:05:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 27 Jun 2022 11:05:45 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 27 Jun 2022 11:05:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4Pu7qCv4ShRgPzG/qrH3iWZm4ea+Fh0jguRU7bwEpDyjBj79pXWwmiIf5p6By4FMOrKlR+KY0DtyeV7PBKYH8sgUYGZ/Vijv58dsefpnQFqjwNcwdSdjs1Rpoz8E+HmQdxvKPJxc0Ti6SZcbkmYpCUo4vQfIFzOMoIxrn1KMCX2n7Tl61OeQee3JAiiXuwxdDELEMWMqTB0GbWORR5R5rcPB3cXoUVA3/xRr8sMdCewPDlkq//sA6vLpSFE5mkbzdzzINnvW9OHiSccq5Xrb98v9hT1EKjAWr/9FUq55LUwLK9AwzO23oSVdIF88g52OtUlEX1Ey9WsTd4Kth/OAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZk/JbbHouGijU0bHYxj5ANsT2FgUgoTS9HYC+K1d6Y=;
 b=YltOrSiB2C2QO44BTvukxBIRlKGI6JQT7FAurheU5Jkr6p4Wg0WCzC6lkK8wDPvhIsoalcbefesmzTIaklEynNt6o2GgzkOSBhQQXI5zn+M+cYGedldNWOampWQ1lFROGPiwoSxHRf9+bbQJcxrOtoGDtYpC4k2g1KiMqMhR52UpkOSv0db9+EZhty9ixS4rP8iI04UF9K/g576omziAssc0nubG1nwcidJW0TPvIzssE2QrCVf+LT+Xix3FdeiYgruPCzVzCRdYBX7b3yoTGycmWo8dyGqlhZM+d4pCQDrCwqhzxkXu3n+8GlLZlpADZtQ/kKe09PtlNGuEsN39lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZk/JbbHouGijU0bHYxj5ANsT2FgUgoTS9HYC+K1d6Y=;
 b=fro4JrCMRGR3ZDhp2wQyWwdPkOTrNe1lJYvdUZ1aYVjjO/wb5TEzpLdxMfOWF89dY2dWBepka1y+PKPKRXL33jDl3kHBVChoqjLjIlmM29spapB6YWu2RmQcvFCjwmT/3eJuyZ97c6t8gFoJKY+F6CcIutatXZ9ic/knz6O/KuA=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BL1PR11MB5382.namprd11.prod.outlook.com (2603:10b6:208:31c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 18:05:40 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 18:05:40 +0000
From: <Conor.Dooley@microchip.com>
To: <robh@kernel.org>
CC: <mail@conchuod.ie>, <airlied@linux.ie>, <daniel@ffwll.ch>,
	<krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
	<sam@ravnborg.org>, <Eugeniy.Paltsev@synopsys.com>,
	<fancer.lancer@gmail.com>, <vkoul@kernel.org>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <daniel.lezcano@linaro.org>, <palmer@dabbelt.com>,
	<palmer@rivosinc.com>, <tglx@linutronix.de>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <masahiroy@kernel.org>,
	<damien.lemoal@opensource.wdc.com>, <geert@linux-m68k.org>,
	<niklas.cassel@wdc.com>, <dillon.minfei@gmail.com>, <jee.heng.sia@intel.com>,
	<joabreu@synopsys.com>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dmaengine@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-spi@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Thread-Topic: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Thread-Index: AQHYgw+Pu1Tn+/2s8EmHi9NhXNIv361YymsAgAACs4CACr+gAIAADiaA
Date: Mon, 27 Jun 2022 18:05:40 +0000
Message-ID: <4b143eab-9905-a926-b3bc-10627cf0098e@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
 <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
 <20220627171500.GA2600685-robh@kernel.org>
In-Reply-To: <20220627171500.GA2600685-robh@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 583ddbaa-a6dd-417d-73be-08da5867a520
x-ms-traffictypediagnostic: BL1PR11MB5382:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sAWGaL7b6OZclb+HIG47GQLdhiJbeMtdLTHwdJFK3Q2299qcSQKpKFoOq/9IxvqAlR5mcpk0J0KQpb49XsxGcsAgMRNEcm2NwLwGYb2+9B7QkM4zm+73sFAfwucC4VfmZ9psXON79xUsFARjAGzqrybbqtOJ59UndghqXMq9293PMh2KVvUUUfpTslUADzXuULlC3+6+UuMmV5K54d9/oYTK6PNAcjbEy/fir14ejOhR//npXSAgHi31G2FaquPJ9xjKw7n5J3jZVtDYDu5TFiPWNK+978S3Za+3vyUq8beyA8C+SId+t/bkEusW4574npsW5mrfDvfipjEiWvFMHj0ISxRKTEoURisxvvGoLkKKSyKKV/7OT1rUbfZ87yZRS26fgUy09jmQfqCD2/Cy+5QdZwZNm4lCHDS0NAi++8YkkMZ4Xf7rLlKC6zkDix1AkN0Qh3zWfDXvQgR1WVf+6NSRwqH+AYxO0OOE0LdsiQiI6MbYjPqXS7NPtIIBqDK54RmFDrDPdGvNDgVWhbvqinN8vmelg7v7ivVMvJEDtas3U6TYt8F+90UBJFDX9hvpjqYTNuMtp1X0qQpqDqtO3Rhsq8JTTuM72KizOUCdQxVFLXt3t8ZmtOWVUY7JFD+vUxcgmXkxXGjyuvI7rutUYCOJI3Re8gYTrMNNPlTdmLMb3Lqwezq4SNqMZuY2OM2hMUq3EWKzibZsO5Gx7ke1xi0UjejPApPwKPPOCHW7GmextnQghZtW3jCEZyCHLCEq+6TZwb4/GP0AAtFX6m3n+SY0ELCqLtQE7dFkpFq/JE2r2+f79kwXTcYo9zE+voGTIBx4EJsToU5Tnf3a/ylENzOJxduyUSoUY/yUODBVNWk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(136003)(396003)(376002)(346002)(2906002)(6506007)(15650500001)(122000001)(6916009)(186003)(478600001)(36756003)(53546011)(7416002)(38070700005)(31696002)(41300700001)(86362001)(316002)(31686004)(54906003)(8936002)(38100700002)(66476007)(6512007)(5660300002)(2616005)(4326008)(8676002)(91956017)(71200400001)(26005)(76116006)(66946007)(6486002)(66446008)(66556008)(64756008)(7406005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDB0MERITURHVHAwbWxmbW8yTDYxRU5wTkJzT0V0c1VBcGpnNXpocmJLRk9z?=
 =?utf-8?B?dzVGZkFqN1ovNmxlY1pmYnpnNHFUL0QrUTUycUVGTi9Ycno4Mmt2M3BIbVdF?=
 =?utf-8?B?alpvL0dBcitqTElUdGFHNFJCWWtINVdFb21XWHpuZy94ZEttM3I3M1h4cUxW?=
 =?utf-8?B?WFFDUjlHRjVMZjNmeW5vQVJCTWcrUlVoNlNCbFJLa1hsTnRFT3BuSFpNUUZY?=
 =?utf-8?B?S2xocVdwRmQ1a245bzJnMVVQalR4b05oSm8zUUUvbWJ5OUtBcWJ4SjN3Q0JU?=
 =?utf-8?B?QUY0QlF5dmd1OXJUTnM2emIxR1NRUlpyNWZkcFYvV0R0OGg2ejVUaEpZZ0ZU?=
 =?utf-8?B?WkhpbVRTZDJKQSt4T1Z3NTIvUXpDL3Q1cDlGeGRnc1BubnVGNkNuczlKVFJl?=
 =?utf-8?B?Vkw3SDl3MHJDcWo5NW9sdjlxN0FWenhvNlR3ejNFVFMvL0JnL21ZV24reGZW?=
 =?utf-8?B?WEd2clhodlJvczJmeE05ZE9RR3ZvSUVjZG9DdlVGSmRoUGxSdkJWQTRaWWFY?=
 =?utf-8?B?dG13ekREeWs0RW5JUEtVdmpaaXZRTTY1TisxL2dab3JKeHNlaWRrWm1wWjdt?=
 =?utf-8?B?bjJHSWRzSnJWcU1rWW1IMGlrZlA1cU9zQ2NYTXB1V0YwNjhVU0xjU3RESlhW?=
 =?utf-8?B?NC90OTIrNG9NUWhnajRvcEwvTzBJUElMcXRmbTBOUG5Qd1oxNzd6cWQ5THFx?=
 =?utf-8?B?RW1GSkJ4RmI5QUI5aEMzQTNaK1duTjhPUnpLMkEybmFmUzZ2UnlIaWxoZENY?=
 =?utf-8?B?MHRUeGFWaXl5SmdDRE1JTDJLMmFoR2FxN0MrcExSUC96aEl1SkhzSjhMTVc3?=
 =?utf-8?B?OERXTHV0UkIyZ3MwNFB5SUJEV2Y0OGVzZDlMOWJxTU8va2xHT0xJQyt5YlNF?=
 =?utf-8?B?MGxNRktOSTRFbmZrWnVNaVhHRjlBc3pUNFlhL09LamdNUWpleDl4dFJJTWdM?=
 =?utf-8?B?bS8yUmJvdmQ1Q2phZ3o1NXkwVzVDM1NVRHZIWi9MZ1RXdDhkNzFSK3RaWkhz?=
 =?utf-8?B?bFNGRHJoSXhVOTA5K29lVjJhS2ZvY0RPbmxMd2Z5WEZrbDZvZzVTclJWUWpF?=
 =?utf-8?B?a1ppbzh2YVp1RGhaWG91TUJxb0kvaUlyUXdIUmR1eUlpWG5xVXV0WnIrWXJt?=
 =?utf-8?B?ZUR6bmgrblpzTW5PUkFHalg1eHVVYkJCZHEzeHp6cG5XdURMam1pUDNObEs2?=
 =?utf-8?B?MVoyVmpLVGF0L3NtWWI1MERXUDVvV2FmbmxIU0c2V2EybFNoS0oyek5Ob09P?=
 =?utf-8?B?RFpKUnFxSUpydTVTZXk5S3BmS1pZNURaSzdlb1N1dFFybEgyK0pSa0FMZGtj?=
 =?utf-8?B?VnM1UXVjcDNkS3R6MllldXlWYUF1ME5LM2JYYzMrckh0MncrSzUybFlTQ1li?=
 =?utf-8?B?MUhTSjZPRXJwUWtxclMzWVRyOVlza3ZmVnI0ZnJNV0lHbW8rTTkwL1lOMUw0?=
 =?utf-8?B?aHVsYUI2NExWZzhKSnNiWmNIYzdyQzNZU1BSYmExMWNlZmlKMk1JOXlDZ0ow?=
 =?utf-8?B?cm9ZdW5sUHRyak1rMEFRcmZvUFRpVGpadmlXVFlaTWVkQS9VajlBbHdCS29H?=
 =?utf-8?B?S0pGdFNnRjNmbjE2T0JoTTVVODZvNFFoOXlBNm9ac0M1RnRKTGpNcHBCUDl0?=
 =?utf-8?B?Z0ZsdFVVL20zYTJxbXA1OFAvQXNYVEtoMFFzMVlkZUJDQjBRUTlHRjF1dEN5?=
 =?utf-8?B?UTNMTDBuVDN5dEJZbkp1d0lLN0Mrbis3UGtqdnlJMHVLNW4zSzA1RlpkVjRI?=
 =?utf-8?B?SGw3M2RwTHVENURtU3V4ZmNpcVM2azVLZjNST2g0Z0xyNk1VNERSdmZUTWto?=
 =?utf-8?B?NkhraDBhUUdJQU1Tbno1dm1iRkVLSUFTL1ZoelFLbThZTDRkcWgzKzV0VGo1?=
 =?utf-8?B?WVlSRFVGbkxqbUhyS3ZueHBVQ1huc0dCZ0RVd0pQWm1JNGNUT0pJdXRadVhJ?=
 =?utf-8?B?cHJFUnZRNHp2Sk1pb3haQUNxdWpFWWxnaDZjZ2pBbU1zUDIybDhvYVhNWEJh?=
 =?utf-8?B?anBqM0FncjJienJQeEJ3U0JqMmhQTmZ6dzdVMzh0a0xLRUZZSEFqS0tGSFU4?=
 =?utf-8?B?WXZHMm1PSUVUOEp6OU1kYTZOSndXZTFaVXZLNm1zMTVmYU9wN3QvM0tLenJ2?=
 =?utf-8?B?dTJwNlQrdVRXV2FxalU0V3ZSZUxQQnpOQkRDeURuMjQwSTZlaDVRK3EwNDNa?=
 =?utf-8?B?WGc9PQ==?=
Content-ID: <671BECC7F1B437478D2868D3EB15E4DC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 583ddbaa-a6dd-417d-73be-08da5867a520
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 18:05:40.1433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tP+MJgXXrT/tWBavS26BJT/1QE6lkA08rEL/sVp9uk1pkzoK6yCl7pi+YFJijHEnYY8CteKlZ3ibGkc7R7R+W66PAe8zCnn0ifIu9gesWCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5382
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_110552_107877_D6A5BA6B 
X-CRM114-Status: GOOD (  13.81  )
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

On 27/06/2022 18:15, Rob Herring wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Mon, Jun 20, 2022 at 09:06:34PM +0000, Conor.Dooley@microchip.com wrote:
>> On 20/06/2022 21:56, Serge Semin wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On Sat, Jun 18, 2022 at 01:30:28PM +0100, Conor Dooley wrote:
>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>
>>>> snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
>>>> width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
>>>> this.
>>>>
>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>> ---
>>>>  .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 ++++++++++++++-----
>>>>  1 file changed, 35 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>>> index e25d44c218f2..f2b9e3f062cd 100644
>>>> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>>> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>>> @@ -135,19 +135,41 @@ properties:
>>>>        of the designware controller, and the upper limit is also subject to
>>>>        controller configuration.
>>>>
>>>> -patternProperties:
>>>> -  "^.*@[0-9a-f]+$":
>>>> -    type: object
>>>> -    properties:
>>>> -      reg:
>>>> -        minimum: 0
>>>> -        maximum: 3
>>>> -
>>>> -      spi-rx-bus-width:
>>>> -        const: 1
>>>> -
>>>> -      spi-tx-bus-width:
>>>> -        const: 1
>>>> +if:
>>>> +  properties:
>>>> +    compatible:
>>>> +      contains:
>>>> +        const: snps,dwc-ssi-1.01a
>>>> +
>>>> +then:
>>>> +  patternProperties:
>>>> +    "^.*@[0-9a-f]+$":
>>>> +      type: object
>>>> +      properties:
>>>> +        reg:
>>>> +          minimum: 0
>>>> +          maximum: 3
>>>> +
>>>> +        spi-rx-bus-width:
>>>> +          const: 4
>>>> +
>>>> +        spi-tx-bus-width:
>>>> +          const: 4
>>>> +
>>>> +else:
>>>> +  patternProperties:
>>>> +    "^.*@[0-9a-f]+$":
>>>> +      type: object
>>>> +      properties:
>>>> +        reg:
>>>> +          minimum: 0
>>>> +          maximum: 3
>>>> +
>>>> +        spi-rx-bus-width:
>>>> +          const: 1
>>>> +
>>>> +        spi-tx-bus-width:
>>>> +          const: 1
>>>
>>> You can just use a more relaxed constraint "enum: [1 2 4 8]" here
>>
>> 8 too? sure.
> 
> Then no constraints needed because the common definition already has
> this presumably.

Almost, the default has 0 in the enum too.
I'll go with that - thanks!
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
