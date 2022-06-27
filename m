Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11DEC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 22:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jpWqGon32ED+S9UffDq7HRWcL76875vPCO0FI0ETQG8=; b=PajWRebxAXCjj3
	ICZMjrFgiV9Ug0xItqriDNvpQjpzY+M/52zax3x3J3pQEgiYs+SlDMmyROOQ9lbk2WPqow5p0MITZ
	34+geykPUi/a+UTXzmryasnBtr5It5MTPR1hzSx7QFCkdHp83M2JFFBAXWVPmYQZ4Yi/K+XrRcsJe
	lQQjxr+0wwxp5zHqRgpxZ22Cv96mOACPKJGpkq0597cLB6k1c5CJa2M1mWW7urQlzrxblDFrMcuGT
	ykxcfT1DbhdnFOhmeHfccoAz5qY2MJJxhUO79jTUWS7zsiCt60pqeYyJJTOxk7vR8YHwMJrHmppqq
	e+M4uN6bHNhdp6zWnRJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5x8q-0035nd-TG; Mon, 27 Jun 2022 22:23:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5x8m-0035l0-Ew
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 22:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656368612; x=1687904612;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=D/9o5cohMu1NvnjPxHqkuc13BvcHggcoK1DCttYcB7E=;
  b=obbifneGM91PoujzuNaTrgRzzIct7W5ZAv7dZ9Uh8vEvd9aEUC4z6VIE
   HdNpKt0MTx59ba5N199nHlSgAbG1IlGZ30qBmzs+QZRhyh8HaQSnfLJ4r
   gXG/cDDZYu++btBskTskIMSPkBNykqTEKYzNQjavvYohYVpaqfgSldI2t
   7qB0pPDSQDQMrec0FT82tYVF5kPbQxJ8d0O5HtbGE6lyV2RzZGMF8Fjr1
   oj2weCjrcFrq4hD9rYbzTfj7McxqIRdYEKW8rkc1PJdi0f7lhFx9uiCV7
   l5+semM2Lrf3vU1mdjzAL5/iZ7h1IDoj2qju3k/Tin7kx6TVMyOF6Z6pF
   w==;
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="170106660"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jun 2022 15:23:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 27 Jun 2022 15:23:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 27 Jun 2022 15:23:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iN2dwTHDUft+Qq5w27f+cRbM/GN/pStTz1sKsfJ2gC47Ot1BE+8E5pDSwAga3UJ5WF3zmtYCe/1P44hAgXZ1tcswSlpwtmY9aluKJBfyKPaRaWvvy7kKKhge2IZr6rCfGkb/I484ES0D+c+IsR5LZQeXJUatth1Nc+brW4vDx7x7WxXJUpF15MgAMU1Q/oR3MmArn59Okws1W22RfYIPiXaZ5RJQoflcBFWOJ+8hTAVPbQ1K9zM2lfJH85yagXhHGUIXOxrn1JjiC9S1eN6dWVapKM4RmH84gyuMWemug7VuiAP2dNXYk2JawuS6ly2BOiBHj4mwNXPhupIbV2FvEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/9o5cohMu1NvnjPxHqkuc13BvcHggcoK1DCttYcB7E=;
 b=ggk940BRN2JVuMCLI2CBLwCHsEwAXhpUjPP4AXhY4UPrigRXeA3PSiJGhZxEX+uUoQd1/mjlMX5RsYJ9bj9SM6SdIb3oGMWm7SeFRsQot8Wa53833SPlkPeOOIJnI4ZDquc7/gKJphR2+NiITHOwhuIS7IRHKeIwykgsn9C3Ai2xAvnsBTxn2tgNKl6dHWsnY0QTi0/7Ms8QVNkd+BLlwKzrBWBpJMgvwghonQIPOaloUN62rNvvCr2I0UfKIkMJV6RwP5iRaniyuRI6uTSDIo0Blivey55680gsb95Dd0+zhvj6/efdnS5j/cAcWkAaWK5BNOR+7IoCJWihJyDPbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/9o5cohMu1NvnjPxHqkuc13BvcHggcoK1DCttYcB7E=;
 b=DS9vZtBE46gaAplDq+jSzKLSEz+hb94wdzLL/klQ4age8dse4zFgI8kLjSimVcDK3A7WKM1OgT+aoySbNz3vuJvmpeAcy6BLFo37gzAx9sa8dERkfvwjeS+SwZOHHirDMJfDjaW8P41z5pg6VMiMxD3SEl1uLikqyuC/0SVpaDw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB3889.namprd11.prod.outlook.com (2603:10b6:405:81::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 22:23:21 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 22:23:21 +0000
From: <Conor.Dooley@microchip.com>
To: <fancer.lancer@gmail.com>, <mail@conchuod.ie>
CC: <airlied@linux.ie>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
	<sam@ravnborg.org>, <Eugeniy.Paltsev@synopsys.com>, <vkoul@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <daniel.lezcano@linaro.org>,
	<palmer@dabbelt.com>, <palmer@rivosinc.com>, <tglx@linutronix.de>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, <masahiroy@kernel.org>,
	<damien.lemoal@opensource.wdc.com>, <geert@linux-m68k.org>,
	<niklas.cassel@wdc.com>, <dillon.minfei@gmail.com>, <jee.heng.sia@intel.com>,
	<joabreu@synopsys.com>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dmaengine@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-spi@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 05/16] dt-bindings: dma: add Canaan k210 to Synopsys
 DesignWare DMA
Thread-Topic: [PATCH v2 05/16] dt-bindings: dma: add Canaan k210 to Synopsys
 DesignWare DMA
Thread-Index: AQHYil3unfMM8MJbu0GkmX2M+wh13a1jxroAgAANjQA=
Date: Mon, 27 Jun 2022 22:23:20 +0000
Message-ID: <47f7cb2a-a9b6-cd3c-7ab4-8ed187dd61ab@microchip.com>
References: <20220627194003.2395484-1-mail@conchuod.ie>
 <20220627194003.2395484-6-mail@conchuod.ie>
 <20220627213450.ukqai4bsjzcwhnlp@mobilestation>
In-Reply-To: <20220627213450.ukqai4bsjzcwhnlp@mobilestation>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c105dfc8-ff2b-4eee-6313-08da588ba48a
x-ms-traffictypediagnostic: BN6PR11MB3889:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8R8MUH1leWseBUpA80yORtbefu4P9lOftYW7SNr8Lkx9ZEADZCQi3xTlKiduRFio1i84zYl7ifcXrSDtFzu9lpUjREXP1cAQ46eDpz0EbxOK8Ew2Ob+lhZEPJCh+mBeygdNenQZ48aIZKww1t5VQ/uItRz6FUVyHqxy/xx6CZYvNorKd3Ys/K02QjsnVwCLh0H32D8XfzCmkSH3vEQ8dA/Stgni6F5WgSsZzF7e2pkoSoxiHqICKCVWV+e6Bj829TjN/auFeDXTizJ0ufNBN/jlJeyKzbamNQB6OFwywQnlaYqWaJ+w2zRDahnZA6FQqoU/B3BrbJz44NTM69DVmLoo3PBK+n9FgHmXWamX7Nyl5oe8PQz1AaJhA7mOC96u6DGFmUjUUu/JJHQk0iAurpUEDN1NwKWEvXGYvYDkCmWhcFeyccjAdUbDR/P3gGt6nPaFHU+FEcM7AlQDCHgE36LBiQUmz8nNcKiFTTYuljZmfGwTYozYl0u4qBOtFZcJBzFy3jvxDvUml5z+d+ATpwXpU9BumRhh6iA+/jvkI1YZJ7u+D7TlyH56FckLjStLZwHVh0sULrjGEzPNJ6R8Rmnsx3eN86sKMW34e8b1dnREBJjSHzzDEJfiNWZq/g+ky1x2YYybYohvrL1N9IW7mslYAhZ54RQ8Dka7lpYUw6G3ruiv35M2VNETU0I7kVcRiw+q3NIU4XlQyVdP6Ij/NkeodUB9TLxwWgtGIC09KR3FbErteY6trizHm7WFAq4gTylM77ckgECQ9xALe2D/xowFs8++i+VGr+d2djrKRhAjvEdbfpWIyQmq5RpiOTE6JfJ00VnmXv/1UakjIcYRXn45mN0JAEUJmNe4AkYrJfI+YTEO7HuL/RJ43Fr/S2TkGIi0Fi3iyrvEkgs3lNWAYBf3rsvsh4tYnCrnMYacgsPY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(136003)(39860400002)(376002)(346002)(6486002)(478600001)(83380400001)(7416002)(38100700002)(966005)(38070700005)(122000001)(2906002)(31686004)(66476007)(76116006)(8676002)(66556008)(91956017)(31696002)(186003)(36756003)(2616005)(66446008)(54906003)(316002)(5660300002)(7406005)(41300700001)(4326008)(53546011)(6506007)(64756008)(71200400001)(110136005)(86362001)(8936002)(66946007)(26005)(6512007)(43740500002)(45980500001)(15398625002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTN6R1d1ZzA4WkFnemdpZFViN1kxTnlBLzJaVG1CMlpqckR2MjFSVTdnT3Ux?=
 =?utf-8?B?ZnRGZmVnZWZDVXRRdFpFSUJEVHFBSzN0SjJMK1UvUEdla2FqZWtRY0RoZXFW?=
 =?utf-8?B?ZEp0QzJGQm5XWXdhR0RDS2xMOHBOa0NIY2dnUXdaWTNLRW1nZkZySG92SlBV?=
 =?utf-8?B?T1hLQmY2eDBaKzVxNlZ1VHhEOW5MVGM3UW9FZlp1YUlMV1RKSEppTVNFaGRJ?=
 =?utf-8?B?RC9BMHZITmZWK3hmRkthYTJUUHZXVGQ0M0IyK2hWVTdBSmcxT1Y0V3NHR3lQ?=
 =?utf-8?B?ZUM3ZzhpV3Vpa3Z3dU5FQWM3WDFKWXd3SnZjVkhUNE1FSGx2OTR0K0ZwdjBU?=
 =?utf-8?B?OFk0Y3ozL0dqSWlTUWNXaERuTEpXUmEzMVJoSEZndGorNGRTM21EMGg3S3VW?=
 =?utf-8?B?bjMxcStxWStjNXR5N3ZZZmZaa3M1SkYrTS82TlkwRUlYbWtTRDhXVysyTDVm?=
 =?utf-8?B?T1hnZWZFRUtzbzJZVjJqOHJ6cS83UzFJMmhNSzErSklCTjRmcXVyZjRlaU9s?=
 =?utf-8?B?RlVNbndxbHVwdnM0R21YRWkwQkxqNmVXejFyaXV2d0dUT1BzT0UzcjJhWTdO?=
 =?utf-8?B?cEJYZENOUTc5SXM2ZktQaFdldTBZRWUvS0xuUkVGVW5yS3hiN2ZhbFd1RHVG?=
 =?utf-8?B?RWcwUVp5ZGhVZHNleWUzd29RQ0RYNnh5eDJhTC8wV1lCYlltcVlYamszb1l1?=
 =?utf-8?B?cWcvbk5CaksxQ3JoZmhOeWFNSEtsWjFteHBCR1BrcTJ0S3c2S2IrV0lNT3hF?=
 =?utf-8?B?K0Npc3kyY3psaE14N0FaM3RpVDJnaEJlRzNPaFZZNGF5MlBOVGlydlZ6eCtq?=
 =?utf-8?B?LzNWNVo4QXVtQjF4eGdXcGN2MXB6NHBGQ3kyUFlQekR4NENWc2ZHWVlDbzVE?=
 =?utf-8?B?ZEI1M3dyNDQ1V2N4b2VTUFA3amNnQW1uOTdpRTF1bHVZNnF1bVl1Mk1aOURm?=
 =?utf-8?B?M3FjbWVucEo0ZHhlYUtYUkFmT2FPb1I4U2VOWWtWaGxzNXd1OWE5dFVLZHUw?=
 =?utf-8?B?d2tOQ3EzNTg2M3VYTjNVQWhFYi9aaGdmY3huU2kzelF0bFYvZDZsMHg1a2p0?=
 =?utf-8?B?eXBqY1pnYVpRTmJrQWEzSCtmY0ZkdHRWT3RRN1F5V09MbktYVFpIeFRkU3Jo?=
 =?utf-8?B?Z0pzUEhxMVAvRUN2YzRDMXRBVEhsci9JZG5LdEtQclNFZTFyUmJqQmZnT0ZF?=
 =?utf-8?B?WlM0VTAvOUdVTkxhYXBjWTExZWxTTXZ6bHBkRGkxbzMvSTM1cjFIRXhCTjNG?=
 =?utf-8?B?ZnRoWXQ2aEFUYU9JdlVraUt4V2JGYlM2WG5FTy9aN2hLTjBKWk0yZHlDV2JP?=
 =?utf-8?B?cXBVclBTZmlKSG1zZDFZb1pYaXZBMEhaWXhPUDg2Qjhmc2hqUzkwYmtyVDNu?=
 =?utf-8?B?WnRMcmFUSzJHYlRmWDk0UXpSa1pXeVZ5cDEyb0hkbGJUL0VWYktQQVVDOWM4?=
 =?utf-8?B?RTZQeHZuVUMreThxei91aDgyV0gxNXVVNnc2djZpc25xeXhnREhpSkY4Vld4?=
 =?utf-8?B?UCtOOGVmRzJDV0JySkFMOTdaRngySnEvb1IzdTlOZ0d6MnFDaEN4dmlpbEwx?=
 =?utf-8?B?dE4wSjJ6aVQ1Mm5aM1MwT0xBc2RZWjlZOUJaLzlKR1A2bnRLMU1vMHRpc3VH?=
 =?utf-8?B?L2xxZVJqc0cyclgvUVZic3dCUzdPK2JwOVA5U2l2d0ErcEp0d1lUZGdoZWQw?=
 =?utf-8?B?S3BBUEpsVGZ6MVJBdkpFQytBYVZvUjhzR0VSQko0T0lGZHgySVRBN1MyNWlT?=
 =?utf-8?B?MzBhMDl6eEFZUDkra3ZncXRXN1BmZG9GaVd0bndteWxmcmo1OUwwN0tXMUtO?=
 =?utf-8?B?Z0hPZ0NoMkh0aFFkVEEwSUxKeC8rY0xNWTJTYTZBWXYzdG1lU3QwNFIwRDM0?=
 =?utf-8?B?UE1WdEE2NG90cjczVHRuQnN6cGVpLzBYbEhjZSsxSUZab3k5aDk0S2RvTW12?=
 =?utf-8?B?dnlGMVYxUDRMU2RnZVp5d3hCcFNIR3ZXY0NvSGxFMVlrSWNJKzFLVzdNZlZu?=
 =?utf-8?B?Y3dWSXNhUlFrZnZ2b1JYUDZhYkcySWdtOWJlU29SVzJrMFVIN204T1IwcHNW?=
 =?utf-8?B?Y0Y0MlphaFB5QVdpWUkxbGpWUGk0UmNFOE5TTWU2YlBXcDBCSnRZM3BGT3NY?=
 =?utf-8?B?SlB4VVVwc0R3UExGT2xMN0pNYnIxcW5OenErcFViS0p3Sm9NNTVodXEwUzYy?=
 =?utf-8?B?Z2c9PQ==?=
Content-ID: <AFEE2DD61A6DD348843A0763CA9E99CB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c105dfc8-ff2b-4eee-6313-08da588ba48a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 22:23:21.0109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r1kxPGPpdRqsF+NjTvcGvyHO4KezIrBP2Oor7rgCNbiXK/XGZgh4qQrka7d1iPUZW6eNeudrkVq9nmdZ5CODgXzhRtCo1lls9dE10K9sprY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3889
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_152332_774549_AEE99B71 
X-CRM114-Status: GOOD (  23.18  )
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

On 27/06/2022 22:34, Serge Semin wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Mon, Jun 27, 2022 at 08:39:53PM +0100, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
>> controller, but according to the documentation & devicetree it has 6
>> interrupts rather than the standard one. Add a custom compatible that
>> supports the 6 interrupt configuration which falls back to the standard
>> binding which is currently the one in use in the devicetree entry.
>>
>> Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 58
> 
> I believe what you've got here is the per-channel IRQs, which is
> activated for the DW AXI DMAC by setting IP-core synthesize parameter
> DMAX_INTR_IO_TYPE=1 (CHANNEL AND COMMONREG). That's why there are six
> IRQ signals and six DMA-channels available.
> 
> Seeing such setting isn't the Canaan k210 specific, but is the DW AXI
> DMA controller common property, what would be right in this case is to
> unconditionally extend the number of IRQs in the DT-bindings schema.

Cool, willdo.
Thanks for all the great feedback.
Conor.

> 
> Please note the DW AXI DMAC driver currently doesn't support the
> per-channel IRQs. So most likely the DMA will only work with using the
> channel 0 only.
> 
> -Sergey
> 
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  .../bindings/dma/snps,dw-axi-dmac.yaml        | 35 ++++++++++++++-----
>>  1 file changed, 26 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> index 4324a94b26b2..bc85598151ef 100644
>> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> @@ -18,9 +18,13 @@ allOf:
>>
>>  properties:
>>    compatible:
>> -    enum:
>> -      - snps,axi-dma-1.01a
>> -      - intel,kmb-axi-dma
>> +    oneOf:
>> +      - items:
>> +          - const: canaan,k210-axi-dma
>> +          - const: snps,axi-dma-1.01a
>> +      - enum:
>> +          - snps,axi-dma-1.01a
>> +          - intel,kmb-axi-dma
>>
>>    reg:
>>      minItems: 1
>> @@ -33,9 +37,6 @@ properties:
>>        - const: axidma_ctrl_regs
>>        - const: axidma_apb_regs
>>
>> -  interrupts:
>> -    maxItems: 1
>> -
>>    clocks:
>>      items:
>>        - description: Bus Clock
>> @@ -92,6 +93,22 @@ properties:
>>      minimum: 1
>>      maximum: 256
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
>>  required:
>>    - compatible
>>    - reg
>> @@ -105,7 +122,7 @@ required:
>>    - snps,priority
>>    - snps,block-size
>>
>> -additionalProperties: false
>> +unevaluatedProperties: false
>>
>>  examples:
>>    - |
>> @@ -113,12 +130,12 @@ examples:
>>       #include <dt-bindings/interrupt-controller/irq.h>
>>       /* example with snps,dw-axi-dmac */
>>       dmac: dma-controller@80000 {
>> -         compatible = "snps,axi-dma-1.01a";
>> +         compatible = "canaan,k210-axi-dma", "snps,axi-dma-1.01a";
>>           reg = <0x80000 0x400>;
>>           clocks = <&core_clk>, <&cfgr_clk>;
>>           clock-names = "core-clk", "cfgr-clk";
>>           interrupt-parent = <&intc>;
>> -         interrupts = <27>;
>> +         interrupts = <27>, <28>, <29>, <30>, <31>, <32>;
>>           #dma-cells = <1>;
>>           dma-channels = <4>;
>>           snps,dma-masters = <2>;
>> --
>> 2.36.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
