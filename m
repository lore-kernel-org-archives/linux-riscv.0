Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDB1C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 15:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/cHz5LJp3d25Pxr6yrN1UhutBWWOu4mK6lkS6R/Uowc=; b=ChAg4SWzqjf/FB
	nRBOypOJg6DqLOIxV84qjt1dmDp48vJ+/+7mzUO8ZkwMEvIgR5heJv2Qk9/dFr57G3Pomw5Pt6aNa
	I1O0HVSTkWDWH387wKqVt8L6Q6VMnRyjqTX9dG5T1aBZSOWBl6ro2Bix2Ix1YnuntSJmK89bBuO21
	xMHUZD9LDZ80f81UInGsrUiu2LHJ5KIz8Rvxe4z4dlVzfzb6UkJK54suisVUuuKCTOYaTAPU+UGMl
	JQoq9bOhgDdcASeFNbOc8X9D9kBCIpsx7As+iMFNZ2W93brR7jiAZiMCqYRC2pfcE4xFaR91ti3UT
	qQB7s16kj7pIdilbO8Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDSaa-00GByl-Gt; Mon, 18 Jul 2022 15:23:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDSaW-00GBvq-TC
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 15:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658157793; x=1689693793;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2g2QNAs8w8OlfjQpYPFTJ1IzR1Zh+TBtq8eRfcG5AnI=;
  b=VYVA3spPSUU9Lb3ymEJFa3veY/jMPkKKDqYsAgss7ka2nbXDric+4w90
   VbAYXWu2PZciGC4SYjOs8MWM7YTRgU0NCevDUPvaIw+HD0sWGfxNTRPJH
   wyiKb7H6kShxxg4QC92a1w4Nljvq7CzkGKRQmiuBCvVhBx+mOvuCYC2s/
   UhRQxcDNY9omFecaP5tJ31iZi9F0U5XGVAWssKNUxuUcXPCDymDyoWEKV
   6pi7UQDZhPw04cQMFKC01YKoSJwdXGRV14AJeJgd4l1dfEt6kpKzx6XHy
   FHOTzqoXXLeEJ9hux1uPxF99MnZZw0Vei7L4kH1Nbvj6s6dr6C/Y/ykQT
   g==;
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="172782814"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Jul 2022 08:23:10 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 18 Jul 2022 08:23:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 18 Jul 2022 08:23:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=An682sNlJOx1j1A6rit/XT2k2GJq/4XmFjUfKadSzf40Q1FjUaKnblVFYn3sxiHS85r6Rmy91nUyhsOr5LQM4YlrOdmxvq68cItomSRVqdYS7Uy81CQUxliOqsH2eVG6XSECWNYZmiEUw1abAIy21DeTKonFwWz94PCLPqTwySVZJ2hCZAUhARs75JAUKYSSwoSdDGZd+yHyteXfvY+OnhmI3ASN2pv77d5+Ag2xGIoZNDC8NS66sVEPzDlJIMIo405stPGpzxbdnQ3a8denGWkFf1QMJ2bxa2BkcaAgZbudV80s09Z35gzFEb4NrUKpvEwArjuxA5uyKR7QyMVmRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2g2QNAs8w8OlfjQpYPFTJ1IzR1Zh+TBtq8eRfcG5AnI=;
 b=moQfCuAYioG3Z/fYCJMqOOE9s0rVv99H6PJ0cnyiOI6B9kra/jA/s/EgEstUaZzMaDPwWSARNmXznXqdKsCrnbI+B738Lz0oqEiwrYVrYRX5p/Myt23hGJuRyiX7yvjLKBQnDx51utplesPzrfg3UQ6ehSElicqTL4NbkAi7wB4g3PJY6jHKfRiEYhhxCwrardXx2tUxXIcVq8GVN/eqwegDyWaFEtcRIUP33VmrdnsASm0bhfLAfoD0N04Ya29MZX9YlUIUfoTsAOqsSxWxR4hYq9zBGYe3WlkReKYme4S7Rtf+iUFBf6DWyHk+G9uqosSIWwRcV/9ECH4MPn1+aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2g2QNAs8w8OlfjQpYPFTJ1IzR1Zh+TBtq8eRfcG5AnI=;
 b=qSfKEJjo5MThjCxuE2jN1o/LH33PLE7/EFQAkakfJHlijHU8iiXIEbucnV0ORveZaWWIr4mXfHDgrBjlMrth54iTN4VFQnJStsg88r2NGTDgXxX/fdapgenU+5IGQ1D61zaDWs6VST6q34J14NflxLctAqPWvSLxzFxJ1W8u/Rc=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN6PR11MB2720.namprd11.prod.outlook.com (2603:10b6:805:56::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Mon, 18 Jul
 2022 15:23:05 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 15:23:05 +0000
From: <Conor.Dooley@microchip.com>
To: <ben.dooks@codethink.co.uk>, <airlied@linux.ie>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<thierry.reding@gmail.com>, <sam@ravnborg.org>,
	<Eugeniy.Paltsev@synopsys.com>, <vkoul@kernel.org>,
	<fancer.lancer@gmail.com>, <daniel.lezcano@linaro.org>, <palmer@dabbelt.com>,
	<palmer@rivosinc.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<Conor.Dooley@microchip.com>, <masahiroy@kernel.org>,
	<damien.lemoal@opensource.wdc.com>, <geert@linux-m68k.org>,
	<niklas.cassel@wdc.com>, <dillon.minfei@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <robh@kernel.org>
Subject: Re: [PATCH v5 03/13] dt-bindings: dma: dw-axi-dmac: extend the number
 of interrupts
Thread-Topic: [PATCH v5 03/13] dt-bindings: dma: dw-axi-dmac: extend the
 number of interrupts
Thread-Index: AQHYkLmyRPgGIJz/pUi7jnydjimwPK2EUCIAgAAC9wA=
Date: Mon, 18 Jul 2022 15:23:05 +0000
Message-ID: <035d238c-7530-f14c-123b-f00f789da5f6@microchip.com>
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <20220705215213.1802496-4-mail@conchuod.ie>
 <7c68e645-efd7-c48c-77aa-9aa607c77033@codethink.co.uk>
In-Reply-To: <7c68e645-efd7-c48c-77aa-9aa607c77033@codethink.co.uk>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2834593e-acdc-4ecc-62c4-08da68d16987
x-ms-traffictypediagnostic: SN6PR11MB2720:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jkIbLHj9p3HhbgJ4C4IqdNqYFbnkuzCZgVh35BIWXIL0LtYUNJdSEqPw1Xb8Y1Lnun82JT0xYikL4iVUcyi2nzvvna8jegfKqO8IPDrVSdk2CMyqAZ0Enjul3KIcUvmEWf6Fh5yyE0m7bJ48U1pW7/sGxYnks6xJd2WUSWOLfx3tmeWPw9bAiem/9pIRcUTnlJq0wM3LHTKGWZ4cIhiLWhYfXM3z9a6jOC+PLHeum2EXjz9hbXb4wgeDMbqoArFgCyaMDkuIBqTd96qqiOC3ZtqGsEl3vmRWaoyOYETAuI8RzDUpPXuXgVMomriybmIlCYbF7rb/a99zKZPYMo/RuZzSU6tkrS+Ib6CPQQSPnuccTURvVflxCuSeNanqbK4AkbySAl6yEUrFfr8UG0CLipfxSEybFIlW8JbzVJm7hZ5qVuJc00sATj5/yh0wbOtNk53NvwH/AZCBdrqCC1dV5Vf83mpwqxvcHXzOi9+6QiZwMJrz2EGT1LAjTfU9ENNu8OfLOrlvJAzxJAhyvdWvKCU6B4VUz+RJbgsGMbqydIRvLzcLH06qGYR3X3Ce+vnX4vKG7Ah8FGw8DBLOOaUeOI1J9cSF9LVMxtUJHoqpKyGeQApBFtQzG5suxYQCvYzTmg9Ff7uLBmru4Y+PMZ4ZkiaMHgpK5wFRVMXAwXSkSACOCK3CPPRx+E2qsNieQ9k2MPTCgsxxj0OYmi2fDHuICi6Y5HBiSSRphtg6TQUjj4RV0Y4kV/MMMRgNuhPUNnZOPiHn8YNO1kXx8F0tD7v4xS36VHRdDNVxdvs7h1YHMwcBTi/fmrBf9jxRtOUdKYDyK2Q5eDqaOrjw+yeiFUa9QTu7c9+ftHJfQkP7JiT1V3yz3AQzSNMsqVtA8Be6djPPKrfrbMcwuyWc/W8MnSEbNA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(39860400002)(396003)(366004)(346002)(86362001)(2616005)(6512007)(5660300002)(6486002)(41300700001)(31696002)(8936002)(6506007)(2906002)(53546011)(26005)(478600001)(122000001)(71200400001)(7416002)(921005)(38070700005)(4744005)(83380400001)(110136005)(186003)(4326008)(66446008)(66556008)(36756003)(31686004)(76116006)(66476007)(54906003)(64756008)(66946007)(8676002)(316002)(38100700002)(91956017)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTNGNHlhRGxhZXJ4NzE0ajh0bWFLcFp3N0JpcS9kVitSdmZpcUZ6N1huTFR1?=
 =?utf-8?B?YzNGaWNFRzNOejVMOTNwZ0ZKc0NDaTZCZFVvV244TWlZOUFKS2hPODA1ZTRM?=
 =?utf-8?B?MGlHRDhYTUZUckpGYlo5OUNydFduU3oxQzhRVllIOXM3cFdnYWZQSjM1RnRK?=
 =?utf-8?B?VEx0UUk3VVp3Zk1UK3lRVEdwZ201YUdYSjBkdGd3NkJ2bktWOVJQdm14U0tD?=
 =?utf-8?B?eTRFMzZ0bnEwTEJvQVdxK1RKUEtCVHNXQk82VEhEd0REOXVJK2xyK3QwOE81?=
 =?utf-8?B?VEVQL1M0TDZsRmE1dTF3cDFENlpLNTZRRFZ0Zjl5RWN2SzROV0E2cDJRS2FE?=
 =?utf-8?B?U0lOaE9ockM2cjZoQ2lCd0NhSkhSdUJEU3F2Q09CQlMyZlpHT1R4UDdnbUlF?=
 =?utf-8?B?bHIvUFFtY2J1RFhjajgxaDc3OW4vZDFlOFNzeTBielVSSmRCNm9Ldys2YVRx?=
 =?utf-8?B?R0poTE9ZYnkwYS9TcjgxaWJGbm1BK1Z4YndMci9WdUlkT1RBSUc1YnlCcjZw?=
 =?utf-8?B?M3U2ZHg4NDlTZktrUEJZVGIxRFMvUTA4NGhmYmZTR3RPNFFtcHBRN1ZFRHBz?=
 =?utf-8?B?Wmplb09zSXJQaG55Y0p5d1pzN0N2bithMVEvT1B6WkxCZGhJSnVrNlVCajZL?=
 =?utf-8?B?YzVMRnNIZjJFUFVLcmFvbUNaSzZKTmpaTHhhTDJHY2xaWnVPK1Y0MnU5M1Qw?=
 =?utf-8?B?MWR3NnljcmswZ29PaUpyVEFrVTJaYnVXMDRtTVZGVkRBWC9TTnBxM0JPWHk5?=
 =?utf-8?B?UzZKd2hUSmpISXF1WU02UXNLM2pHcmoxQmptSURvSlZFckNZNkxOSXltaGlH?=
 =?utf-8?B?N3UzUWlmaml5cjluVnQrS1pnanpBZWQ4V3o2RlhhYmhlRVo1QlN5WEsrVUxl?=
 =?utf-8?B?RXpEQnM3V0F5NDJKa0IxNW9pblVMT1hGU3FwT1VoUWZkMXhYc0lKVDlkWDcw?=
 =?utf-8?B?aU1GMkM1MU96ZGFNaEtjMWFVeFNLMk1aL1RFeEU2QlFHZjZWbkpubUE4RVRN?=
 =?utf-8?B?NmttVnpWcFJtcGFUdkxwWFQwOFo4aDRYK0c4Q1MrYXRPL295c0svY1I3V0dY?=
 =?utf-8?B?TmliNVF4b1JJOGpiZnlpcUwzY0k2SnRwb29od21IQTNxaHYrS01XVkFMQndS?=
 =?utf-8?B?Rm5HNVZ2RWR5M1p4Nk5DdGZaZUp1WmhnRlhWNCtJZ2F4azNBeXBxck5yUEZr?=
 =?utf-8?B?V1dMbkRXK05LdkdMYmE0K3BmdnR2RGNUVVFXWVRDR2pPT0R4dEM3RDNhUytp?=
 =?utf-8?B?U3I4Q3VZVmh6aENKWmY5SHppUlhZa3Ayc0VORGM1d2czUWo3SE1wMEk0U1By?=
 =?utf-8?B?SHJPZzZjKzJzUWpRVnNVVnh3VDBnUFBoUFN6N2E1RmI1UUJWUWNiMDVwZExj?=
 =?utf-8?B?VmMzR3lxUFB0YWpnM0l3VGFGMFdySGEvanBlUEtxMHdZblMwbjJhY2xpb01j?=
 =?utf-8?B?ZjBTdzVDT1FjcFQzOUZCQmh6YXJOSXJ2em1XQWRwTlQyRUc1cVJyWVFNZDBV?=
 =?utf-8?B?NnNmeFlvWmNwNWppQmdZZUlaWHl6WlUvaEVENkc5aGJtZTY1OVhMalVMYXVz?=
 =?utf-8?B?cVZaK1AzajZTVlJlTS9YaTEyYUVMSkxYNzNGT3BRK3JLM2M3dzM5bUluUGg5?=
 =?utf-8?B?aGhRUGhlSEZpbHkzVjBCbis0NkNpTUdUN01MUDl4UUVuNDE2TUxVWVRiaHNF?=
 =?utf-8?B?QTlrdGhEVy83bVcxbml1aXI3TVV3NitmMmJyQWIwSkZ2Mkc5UjhqclpWRWxC?=
 =?utf-8?B?MWJydWlRQlNiTkl3UUZwWHpLWFUxdnp4U0NaYUE1KzlNZFo2YjJ1ZzlFWHFa?=
 =?utf-8?B?ektBV2ZlbTB0OEx4QjZSbXcyV1p0aEdlcTJuQmxYWmhDRFZQSFl5b1BySXdY?=
 =?utf-8?B?OWlsaVFFYTVMalF3K09jSGtKTmlOWGhlNGVWTTJ1SFlzbS9QNjh3SFdmTExa?=
 =?utf-8?B?QUN1YWw4c1E1aEJPMXBhMDUwSTNCbUg3alBsS1RKeGtsVUhtRXRSWU5lZGdZ?=
 =?utf-8?B?bFA5MWt0SEVWUXFwQVd3b2pkRDZRSlVBU2pPWUxGUkZuaS9sa05ZMndOUG9D?=
 =?utf-8?B?VmQrV1VyNndVcEQvS3dtSVFBQ3lNZ2U5WU1yT2E5Zk9wS0xFdTRMVDM0bWNp?=
 =?utf-8?Q?XnByRqvrj97aB9Zj+exsSKJOM?=
Content-ID: <219EB6D99275B349AA9C12221539C02A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2834593e-acdc-4ecc-62c4-08da68d16987
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 15:23:05.4124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9HbIE3xZXCGLm7Btrmqj+sc0c7hX45TSS1UIzwvX9A1im7uAJURkQmShASLc5T9Zki0ws9c4elSQZC/OIr+JjQuXPm7BsaoNkaAIvur7XXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2720
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_082312_977853_32851549 
X-CRM114-Status: GOOD (  15.65  )
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

On 18/07/2022 16:12, Ben Dooks wrote:
> On 05/07/2022 22:52, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
>> controller, but according to the documentation & devicetree it has 6
>> interrupts rather than the standard one. Support the 6 interrupt
>> configuration by unconditionally extending the binding to a maximum of
>> 8 per-channel interrupts thereby matching the number of possible
>> channels.
> 
> I think you can still configure it to produce a single interrupt
> even if there are per-channel interrupts available. This is from
> my reading of the driver a little while ago so may not be totally
> correct now.
> 
> Having per-channel irqs might be useful in the future, but as above
> I think it'll require the driver to be updated to do it (and possibly
> some sort of detection)
> 

Yah, driver would need an update. But happily that does not matter for
the validity of the binding.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
