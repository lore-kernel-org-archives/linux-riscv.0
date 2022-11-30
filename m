Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF09C352A1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 14:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B7MQiW0Raq3MfPYeyhkyQWD7XRN30Z/5V4HX1+BmBI8=; b=Dw2hh9j+u1EnNe
	7VMMOlAu2BfW8PmHpTnucZJ59EA8s+H+TCKkKHzlGasAnorJghlyqaBsLt3fa52GcHTeDKeL1QO72
	rBJULpdiEnT0R6PcV1GUPzZ4PxchnYxk92fbebKzakhCL6zcwG4Hz+TSzCvxZCZ/zjwTtqd+pbqcG
	5PBv6e8DJLxELX0J8gYiD+taMRzgZIA/g9ANiukdqyDqYmgSXD84kca791ZYSPXAX5ppZ6ckfRfyx
	WcctWlRL11Yq28s95lZJtz7H19GMaVnXwevy9cODm3tTwM0gXH5PpAhUguXXRm0Jy6TUYZX5j4489
	NLoKrMahtyiOegLvc9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OVA-00H82Z-PB; Wed, 30 Nov 2022 14:55:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OV8-00H7yU-DJ
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 14:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669820154; x=1701356154;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=I0Te3z47Q4rMc/s6ev2aEoKUSf9GLZnidwArYR0Mmyg=;
  b=0PLNOjGhWpPivW2pRF4ZsSvvJYfy/DkEWdL+84J0osHoEPU0wgLsgcja
   6Y8Dh33g83FOc328RQmYdENERAesA5iIYwbeKGZK47msYpVAKdybBqIPk
   6cI+d0rc+OLwc3wmiGIUODTLVwEG12yOwjdaU/sxytYcj0x5DTA8OHvGj
   2baUKCK+SgL3gJk0BtPKXGielLWD6dlky7HpF6/sc1xYa8SPTk7kmT8Yr
   wA51ofIO0H5mawROx+TEXhjigtc64y1I43AXmvlYqjpABht5C36lp0O9P
   8P3MhyO/tYkNL98wq8xEvdXo13PJMLXAEQL1svODb/FPbpz09aJ8FPQXL
   w==;
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="125812149"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Nov 2022 07:55:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 30 Nov 2022 07:55:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 30 Nov 2022 07:55:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clHPCODsgU94CtybDvkIryMuC7j9Z+E09l11MqXamJkxaaqu2yvnbkmVgbzao8fbMIDKx3E2JgH25urhzqTX4u/edg1tcTiNNOQLAEVVCVLUPXZnP5ck/4aUJ+sVj1PYiJRz7kjVM38ANKGGlEuszliHRP8jFlItxqZbpgthbW1ZbkM4pTj7s99jlRQSC7j4YqIh5vSor1mxBWh51MjeL8/jGYQRVe8OEkHX8b/T8ktqWyKUFfaxWIJ4FqXNJFiihgpKtMw7ciTXnIBaIjNqTkRnnEH5CnUSjWQGP2ei2mH3y0ifwdgZiFNbFnm8s//XGSV4ErOVoXvMVWVU38UT9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0Te3z47Q4rMc/s6ev2aEoKUSf9GLZnidwArYR0Mmyg=;
 b=g6hL+dGcADvv3dG8Xlmcwfo4XmvF3KNkZMkWxSKQJZ553qRXjZM46vX3FZqD+AF37U3iEnyFQRTrZHOMRu64HThoIyP77QZXzxNF1Ig5yYVmSVUu2QBXMOkyoI4emhjqzEJNsu/m7mzvpuyQhNRA5p+E7fH3FbXIDDZsYR62l8NmRoPNFiYjJaCQvo1s694sHAD6OoG36VXdZwH4/4sg2McK7ED2QlKgJm1jSfrLC5PeIKvsVzeXhvJR6JszUQxP2ROMSR8SCzcxXowWjzF3G9/OAWNMSLN7BTBfFmcvAe999OZ2+clFtxL8YCa4OXwx8YTw96DvO3CdAW3jc7JEjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0Te3z47Q4rMc/s6ev2aEoKUSf9GLZnidwArYR0Mmyg=;
 b=A29ISYvpTRqxTxQHd2KPrbVBvcWOppE1zeCWt9ZIhHC279AQJOTF61P6Rwx5llpR2lKcGu2IgA7D1nMiWNAQXieMYtoHeEr77HwWxcy7tYD4dKyOm8Lq9x8lT89ZXhhVdXPyTdkXeeDnXP3BVvI+g3VFNAoMTje0y4EqK3CDTxU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN7PR11MB6703.namprd11.prod.outlook.com (2603:10b6:806:268::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 14:55:41 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6%5]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 14:55:40 +0000
From: <Conor.Dooley@microchip.com>
To: <ajones@ventanamicro.com>
CC: <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<heiko@sntech.de>, <apatel@ventanamicro.com>, <atishp@rivosinc.com>
Subject: Re: [PATCH v3 3/3] RISC-V: Ensure Zicbom has a valid block size
Thread-Topic: [PATCH v3 3/3] RISC-V: Ensure Zicbom has a valid block size
Thread-Index: AQHZA//L8KTmIEGzV0+hnjNXgPsPPK5WTjmAgADq5wCAAB3xAIAADnkAgAAGEgCAABMiAIAAEOIA
Date: Wed, 30 Nov 2022 14:55:40 +0000
Message-ID: <4cd29e8b-7099-da8e-ec6c-4fee1ddd4473@microchip.com>
References: <20221129143447.49714-1-ajones@ventanamicro.com>
 <20221129143447.49714-4-ajones@ventanamicro.com> <Y4ZhT3R34cE35a0K@spud>
 <3c64b508-a629-0c34-1119-e854b1968a2f@microchip.com>
 <20221130113314.jagmoosmx5ktwt6t@kamzik>
 <20221130122502.52w45qvxu73acfrf@kamzik>
 <fe2ecb8e-ac35-54e5-0169-a26ec281cb95@microchip.com>
 <20221130135514.vbkswte2k25wfd7i@kamzik>
In-Reply-To: <20221130135514.vbkswte2k25wfd7i@kamzik>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|SN7PR11MB6703:EE_
x-ms-office365-filtering-correlation-id: feb93881-2868-4ba2-739b-08dad2e2f30f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sAquYTOSpMeDnwUCc9n4seIUtHBsPba1VmBIsG9LCxtVOx0LCl5pUNCxo+dkMisR0z5rE6x6knre+yvZ7kiDKhrrw0XZj9nzB8qF8KVGtFBbvb15NHo7/esCBkOLv2WeIyJ0+pcnqA2wI7iVtAyrSKj10JiNvENgjA4NIZ7golcvvX3UoFH+S2+4LISy5AdrZA+LQfNm689MlfBqwMNhpapgsPcWYnfIuvuRAZ9q35otkJdGWURSBoQgDHpJ7LUpO41SOhGStDKm3ksAPzLB4k0CbTw4kEo/NwBa0LFFmyPn6OtcyRlt+RShuWBdiZea745wuoh8B1tuIn5LkSzG4/DffWekHrA64R2wiahnSnC95XXXWz20tyKMtYcxkwQ8Z/TlBS+QBqbj6/tmhuTc9goeiPlxXhYr1Lh1c2krFEbxhXr8qqOHM5uCZv51H8J3wlDZ3eM9l4ctMw6h4QQyyF28Vzf8Bm8w2KMzgX1wlLtEWb91IlLvbj4DYdXFsdwY6hW7Ah9gnN+RvaMf893zezfmXhR9a+dc/h7ooGlGA35VrC2cHlzGbvEZN8XMdyRbMAIhhthxN0gW4GFQsJYn5qZuWJ3YUrEvMKLjMoRIyyw+WEEqKbXcbpQ7L/KcwIgKkyfXB4z4S6qyinn2YimRT24y7QaKsTaaYbSQx7rznr2HlWDYQCtOXYBD801mpGpOCnzgy6tkbnxuTlZrXHWmeHgDv4axm+0HxQTGKQM7t0yIdCoA9eWB1DfuQey0E4Swhf9pqKz10bcQBiLxQ1y0SQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199015)(38070700005)(5660300002)(122000001)(71200400001)(38100700002)(54906003)(6916009)(6512007)(91956017)(76116006)(186003)(316002)(2616005)(36756003)(8936002)(66946007)(31696002)(41300700001)(26005)(64756008)(4326008)(66446008)(6506007)(86362001)(8676002)(66556008)(66476007)(478600001)(2906002)(53546011)(31686004)(6486002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1I4QVpxMWg4MURxdHo5V2ZxY1NoUTVSenlETnhnWFhtZ2F4b0NkTFVFWjRj?=
 =?utf-8?B?dHA4Y2haaGFqSDNQY2gwclh4SnRoSitqVGFXamxrVVd6T1RZK1gyNEg2ZjVo?=
 =?utf-8?B?azV1NWtzNHhEQS9pRm1CWEpwQ3pVeGhtZXdobnYrLzhLRE54RTh3bFppZ2V4?=
 =?utf-8?B?SU5NdWl3bzg3aVRYYXVRaEpDUW5MbVlscWkvNzdUWDk0bVIzTUM1c3VhM1Z0?=
 =?utf-8?B?UUd6NHR1R1VuODY3T0pCRTR2TkZlVDlvemJPN3VRd0ZUYmdEOUF1ZThGV2pl?=
 =?utf-8?B?aG1nU2JMSkhHQS9BdXFCN0JtOWhmbkRmZUFlb2d5S25veWdKQWU4Wnp5c3Y1?=
 =?utf-8?B?ZTJUbEV6REoxdVNRbjBjTythZEVpM1BsTGpQc2QxanpGU1MyRjhCa3FpSmE5?=
 =?utf-8?B?OU9iQ1lNaWlYYXFKZHBJcFZZNXRMU2RwbmRKdGI3V3BzQm9oaEtDczJxd1VV?=
 =?utf-8?B?OW9SczRESWlZOVI0VTMrMERJcDNuNUpXQlcvbWFDU1NVQjN6VzlQak9Fay9r?=
 =?utf-8?B?S2t4TU1PMWlPMzh6eDFzRHRIdTZyN01xekVsNC93Y0s5REQzeW9HNmNJT3JJ?=
 =?utf-8?B?emFGWXFQYnB6ZElobjYzT2JKT2R6R0phU1dHdU1DVnBpZENHQms0S3ExWmlp?=
 =?utf-8?B?SU5IeFQxa1R3U1kvK3ZYdUhUVHMvMVIrMnVSS2JtSGZyb2FveHc3cXhTMDFO?=
 =?utf-8?B?cTJDNm4rQVhsdVFGYVBVNVphdUpkMXZnbnhNUnhKZDd6d1pGSDNxUVk3L3Fp?=
 =?utf-8?B?bnBEaUJ4KzRaOEUyN1FsdC9GWDdwaWxQWkVOSTlvZFhDcDhNYXZrQkpxRGw5?=
 =?utf-8?B?dzlhaHN0QlZ0S1pCa2RnNU5HcCtuSkZyeWxKVGlJY2dOaU16bHJ2UlpTbzZv?=
 =?utf-8?B?U2JjQmlFTDBCMlN6M2V3ZU9JeXVsT2hvek10aVJyNWlQdEVoLzJlVjRsbm5R?=
 =?utf-8?B?L2prNXYrL2VpL0hIeVhEM1NxeHkyZjlaNTI4eGJzMnI3bnp6cmxLc1cram1z?=
 =?utf-8?B?Y25aSHBBcGNYSy8wejFzL0VPOGZBRW53QlN2YWtDOUNzYkY5Nzg4S3JIMUVD?=
 =?utf-8?B?SjV0WFhUUElrNTNody9GMTM4bmZUVElsUVYwNGZYZGxOQ09CZ2kvVFBOWjQw?=
 =?utf-8?B?eUYvWEVJR1p2dDVFcEhxbVNlMTYxSEFBTjNueHhMWExJREN2OWdQZndnV1dN?=
 =?utf-8?B?YWwzdm9aUmM5YzBoK3NNeklPZUxyNVJkUFhyRVcrUmlCWnp1N3JUU1V1SXBx?=
 =?utf-8?B?M09EQXlKd2VuUno3MFRLU0F1TmdmLzNYUGoyT3BueDhCUXhsWGRha1ZCYzJN?=
 =?utf-8?B?NUl2ZDZGVnl6OER4VW1EWldOeFF3QzJkZUZuZzB2djQrNHpDTEx1ME5JN2Zh?=
 =?utf-8?B?Vk1HS2Mxb3F5YUlDUTRqczdlaGIyMFR3TGNTK2pONitaakFjMG5hTS92N1dv?=
 =?utf-8?B?dS9pZFJhV2ZvZTRrODhXRnFheWFmVjFRUExNdWtHZmhDTjBjTU1XdWpLaVhP?=
 =?utf-8?B?SVVUejMzdEhvWWlNUmFNU1h3OVdUS0ZXb04xUm1uK04rWkZDNElhSWQwZnY3?=
 =?utf-8?B?dWdPenZxckVXODFkYmFrSnFFMzlJeFhHMlNpUnhIL2NDK2lmaHVKZ2QzcjFu?=
 =?utf-8?B?czg5OGsvWjAzUk1xeTRjSGxRMm84RzFUQXFxOXN0MktHNDRjM3N3ZGk3a0Zq?=
 =?utf-8?B?dDlvNkV2dFh4Vm5BMW5lbTF1MEhOL3E0dWNiV3ZaR0J4RXdJRDA4dE92OGdz?=
 =?utf-8?B?dTh0N0kwcTQxWDdLRHUrck1DZUVYd2lTdGMyUFRmVmc0TEYrYWlLVk1wNG5J?=
 =?utf-8?B?UjBpcTd6Mm1zUTU4YTBDSm5hZVhYZ1BjRFJrTWordjlJckNUNVNia2R3TlFM?=
 =?utf-8?B?b1Q0MjFuQlhyZ1B2MkF2R1A0THppWjFIVEg1aWp4eXpqU2hBZnFzU29wQ05t?=
 =?utf-8?B?V1AwNkwyb05mY2pmWXI4dGxoc25CSFdOTmhYeEtxTWpVQzBCZmtuc1M1MDlj?=
 =?utf-8?B?Um5Ra1NqUmxaNmJXR1FYOFdBYXJJbzJJclcrQnVDbm1yZHVKVFEva3lWSU1R?=
 =?utf-8?B?a2trdGJkSmlLc3Y0T25FK0JSZTkvc2QxcXZLVFBsWTY5QlY4MmxocE15ZVdU?=
 =?utf-8?B?MVEyNDZQRVlacCtvUldaYjNaeUl3Y1grYjVoNzYxcWtGTHpVTU52SW43R0Rs?=
 =?utf-8?B?Nnc9PQ==?=
Content-ID: <E06CE1D3813879439A8A3D4CC1397D69@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb93881-2868-4ba2-739b-08dad2e2f30f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 14:55:40.8508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hf3/IomXTadlLVQiUp8AeGiIyrtcQ4ckLFAwCkGuazrWWtbnipLse6SDXm+pchXJ2QsRq50QDBxFq66Ds5i2bSSZRbHrz+8mLUuE6SGsKnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6703
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_065554_776409_A21763A2 
X-CRM114-Status: GOOD (  20.54  )
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

On 30/11/2022 13:55, Andrew Jones wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Wed, Nov 30, 2022 at 12:47:03PM +0000, Conor.Dooley@microchip.com wrote:
>> On 30/11/2022 12:25, Andrew Jones wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On Wed, Nov 30, 2022 at 12:33:14PM +0100, Andrew Jones wrote:
>>>> On Wed, Nov 30, 2022 at 09:46:20AM +0000, Conor.Dooley@microchip.com wrote:
>>>>> On 29/11/2022 19:45, Conor Dooley wrote:
>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>
>>>>>> Hey Drew,
>>>>>>
>>>>>> On Tue, Nov 29, 2022 at 03:34:47PM +0100, Andrew Jones wrote:
>>>>>>> When a DT puts zicbom in the isa string, but does not provide a block
>>>>>>> size, ALT_CMO_OP() will attempt to do cache operations on address
>>>>>>> zero since the start address will be ANDed with zero. We can't simply
>>>>>>> BUG() in riscv_init_cbom_blocksize() when we fail to find a block
>>>>>>> size because the failure will happen before logging works, leaving
>>>>>>> users to scratch their heads as to why the boot hung. Instead, ensure
>>>>>>> Zicbom is disabled and output an error which will hopefully alert
>>>>>>> people that the DT needs to be fixed. While at it, add a check that
>>>>>>> the block size is a power-of-2 too.
>>>>>>>
>>>>>>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>>>>>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>>>>>
>>>>>> This seems to be failing on nommu :/ I've got host machines issues so I
>>>>>> could not reproduce it for you lcoally and paste an actual log, but if
>>>>>> you build rv64_nommu_virt_defconfig I think you should be able to
>>>
>>> You mean a 64-bit build with 'nommu_virt_defconfig', right? There isn't a
>>> 'rv64_nommu_virt_defconfig' that I know of.
>>>
>>>>>> reproduce.
>>>>>
>>>>> The actual error is:
>>>>> riscv64-unknown-linux-gnu-ld: arch/riscv/kernel/cpufeature.o: in function `.L0 ':
>>>>> cpufeature.c:(.text.unlikely+0x8): undefined reference to `riscv_cbom_block_size'
>>>>
>>>
>>> I can't reproduce this. The following commands work fine for me
>>>
>>>   $ make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- O=build nommu_virt_defconfig
>>>   $ make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- O=build -j$(nproc)
>>>
>>> And llvm also works
>>>
>>>   $ make ARCH=riscv LLVM=1 O=build-llvm nommu_virt_defconfig
>>>   $ make ARCH=riscv LLVM=1 O=build-llvm -j$(nproc)
>>>
>>> Additionally, I can't see how riscv_cbom_block_size wouldn't be defined.
>>> It's exported from arch/riscv/mm/cacheflush.c, which is always built,
>>> and no ifdefery wraps it.
>>
>> The base commit matters here, it picked riscv/for-next as the base for
>> this series. I guess this depends on some stuff that's in fixes only?
> 
> It looks like riscv/for-next is based on v6.1-rc1, but commit 5c20a3a9df19
> ("RISC-V: Fix compilation without RISCV_ISA_ZICBOM") was merged for
> v6.1-rc2.

Tut, silly me. Should have been immediately obvious...
I completely forgot about that, sorry for the trouble.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
