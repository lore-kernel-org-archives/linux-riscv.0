Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81F1C25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 12:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lGDSaTHKxuO1kcWuPY2PldzprD1ymQktM0EKBbrPxyk=; b=LYQmSiG4YiHuQ8
	5rKevLs3xVrKEf7km2yt9GFZ/1NzTIuyEQr1zaT1IZ6/GXEZG0EKGHLgJ8zuH0jN+lak3V+MGmkcj
	qujc7+6Q1B9j2sr1ThWZUBpCCRSrrJUUF7W8TmT0ytyWupMBpHuoymLGucaIp4o31yoBt2usjLIxM
	BTq7Cc+LSX9LnioQKnwdVFRtsiK2tZomcoKfm64k6yKepj49n+TqzRV+b1KwWdHUXUwWmvLqZjOM+
	z3vcOzEXAvomDXc7PllhMg28gGv5YHuy+z3wtfQJ+peBPViV8gCUtFPIkohG0hiABnVJUrrOhNsl6
	f52kBnpaW8lLRsmSTIqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOHzK-001oo5-NX; Wed, 17 Aug 2022 12:17:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOHzG-001okc-FL
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 12:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660738650; x=1692274650;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rFtytMZmOqo7lJUeEmUHG859yWZ3pPUp+1x/qZ/nXjY=;
  b=0hotQ5OMK5xJPYXFp9B/34zBzVQuVHW5nTRoQMVDAmRXkRJKiH4ebnRF
   xfn3O34cIPfR428TkByTvsT1q3dwGwowvgnGrLm/zmxPeHH9JaSUWW7/k
   2NYrv81kdZ4ffDRcmn2515rsCqjOKwr86Bdc8DTMNMgbRc8N99+nzyhpE
   RMCNEWbgNcn/Gus3ev1yzpzGBUIHwjT5eTXabfB+Qcp1G/Hw82nVp/s91
   fOG9q9u1PDyQYhZr2ghQDSSmCDTcYcwgw+TdoLxdvoLMx3LVkIFHrv8aG
   OJAUm7FkA8CQSGeWTVUUPDA096LFZJvatu7LtgR3+EhrJ9bX7EnVANZNC
   g==;
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; 
   d="scan'208";a="176747665"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Aug 2022 05:17:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 17 Aug 2022 05:17:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 17 Aug 2022 05:17:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ClB0p2ol28P2d7nMYL5OwB0JvsN7/0SrgUFcNzJqFsRa7hKY0kZ2T2uI/H2euoParwu6rzOf27IY4V5PLptVqmzsWJb8LgiaV+LYNY0P7b9hcOcIBz7TGRUG2N/nHeKb/M2Gtkmgox9qMteItINbunrhaaOjNbiYswEYlqyz9bB6WYYzt95bsbjI3V+aW/y2ILGPqE3uehjYpV4MI22qb/wUN//4zEaCv8oK33pzGMQAQe9jCqZOn4EDUDgONBZTPlwgqlH+6UkpL4FGvxnMNR2nDOZcQuNqhK5+5A2VPRrPdAh0hRHwLrWbqQlq0Gy80oodIcZwKVTaYgBbys8YTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFtytMZmOqo7lJUeEmUHG859yWZ3pPUp+1x/qZ/nXjY=;
 b=g0esITalnVSy8K+J3Ea5ijiEVtlDcMxoMb3r4j3QsXkIp9wJF1FCuJccZ/96EeOhklz4uTsdbMV6bb847YfunadczzZGWOaZk694EowqEqs/n0Cq2AU08kERqjuRXRvU1oMpn2sDpSD5206l+mJ2WGqZR8hjI7wjh//+bUS9pGvZzJDKD2ECHV1e3QGRu8WZvIUOLKmO6iwrcSFLcqNL3XUWaViciGjp+h/hxse2i1AdU2U5mM9u4DfoaCOwXTupFgFeUPHAqTC8TwZ3R7bVU+e0mSIWbnzVMCXbM2bLq6rLAIb/hdAqP2kdqjcjKHxESdHiwf8AwNNmUvJr+AXiLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFtytMZmOqo7lJUeEmUHG859yWZ3pPUp+1x/qZ/nXjY=;
 b=oguvjmSS+89862t45MorC8fhdWb4dm/x/lCAOy9f8ve9oYWoytW98FXNHf+aVuqaudQdgOJkMGI+YuJ0dyk9sjtOHti4CYiqcNNC4myUsa0ZmLkjrn3naxTc6Tf8+MpCVT3qnG+K0h/PhJric8xFbFh3/hXdzDCxAGTUJvkuZWM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR1101MB2267.namprd11.prod.outlook.com (2603:10b6:4:52::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 17 Aug
 2022 12:17:11 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Wed, 17 Aug 2022
 12:17:11 +0000
From: <Conor.Dooley@microchip.com>
To: <nathan@kernel.org>
CC: <ndesaulniers@google.com>, <llvm@lists.linux.dev>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <p.zabel@pengutronix.de>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<Daire.McNamara@microchip.com>, <palmer@dabbelt.com>
Subject: Re: [PATCH v2 00/12] PolarFire SoC reset controller & clock cleanups
Thread-Topic: [PATCH v2 00/12] PolarFire SoC reset controller & clock cleanups
Thread-Index: AQHYj5/vIrxOVV1EL0SoHOsgiQHkyK2nacwAgAFM1ACAAAaZgIAAA0QAgAADOwCAASU6AIAEnVYAgATA8oA=
Date: Wed, 17 Aug 2022 12:17:11 +0000
Message-ID: <62bb08d7-0a14-13e4-5ca2-edb5ef3b9793@microchip.com>
References: <20220704121558.2088698-1-conor.dooley@microchip.com>
 <bd14f1a2-750d-2511-df0a-85a9f5925f84@microchip.com>
 <YvP/bjh+wXihlrdG@dev-arch.thelio-3990X>
 <fc470bf4-33bb-d67b-3860-3ac775982f27@microchip.com>
 <YvQHtGObJwyBKGCQ@dev-arch.thelio-3990X>
 <3d2c56fa-8245-4992-2074-cd39677c2b3f@microchip.com>
 <d38d8b9c-45da-c464-264c-bebd084bdb17@microchip.com>
 <42354fef-8ca8-a81d-6af9-f250ecfd1924@microchip.com>
In-Reply-To: <42354fef-8ca8-a81d-6af9-f250ecfd1924@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2151dde8-ebfb-4405-4d39-08da804a697c
x-ms-traffictypediagnostic: DM5PR1101MB2267:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sCpBpW5rLdfN2nWtb2RxQ4lm09Nh+DY81TvugfWc08A/iqjDvaYNrFA0uM1dYhwmsKVP6E0zTtKZCBCgCNOa4pho7tBS2OUz4jW0YUinjkvTkMmifWTc/KEm1z7E/vbMqfeGMwWzX4Yujf29dXNlQFOQAQwuQghGAV6g2YB7bVcos/W8NnWrOJT93OCwmtyGA9ycY0LdY0+VT+WA31Qj4hF4m3vDspJFIipDwzexMvL3GBqJcUCMU7tW5RdjoLcN9LYZgMpTfICIFs4ze3WgOt9gpM/LUjpV94DDvw1hfBhkJENbr0Cr7lHl+CQ9LGPlW7sZflcyoCyYPVaaoDuE9vgWOtQE3Cp6HjcHOXA1HzCdc6jFutU4KNA6qT2eZ2bV5+Kz4iUCYZ60wV2mr2DRZHtPbV09ujTLVDzvmB0Hv+soCZOJkoD9BYysJ64jGP+/D5iuaSfED2zoG9tWnzx4X4uNg6XgJjclWEFEMNhazuR2hX36rerLDjLxkkLlFgUaClRBPhMar3Sl4/3j6VcFEtlD774Ovn7QdJjPshCAaNNLyRypTzchEx+iC1O4I3ookcsG+nDHLvdV912F/Uk0a5vsDPMXzVdRF0/87RAHbjsQcMFig7lu2bswge5BiM71ON62H+kStt61SEqj+xgpGGAniFozl3SGfbQ2gOPExwoWlEJjcp2SXLuEgxapun52r8EoARZ6hnuLbU+EffCZkB6y+D8G3vw180kI1BmGmn9FUAHiPk1Zi218dgg31v9xFMesxxnQrSx5+1AORApE/l1RSZPjKu7efvbm4rbuFGoAOf7aZd5/w2c3pY3MrRcvpYg8LePm50CxmYvFAd1Xi2aon3EQkA2r9r10XUchiv3o107DPIJ1K9HvqKhx2Uz+ABqcar2rPylxKnjLXNbAvxN4Z8Qps1Ce6HIbg6hJWrUlATCGjKCJPhQL0pOvwrzQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(346002)(376002)(396003)(366004)(4326008)(54906003)(45080400002)(91956017)(83380400001)(122000001)(38070700005)(86362001)(8676002)(66946007)(6916009)(76116006)(66556008)(66476007)(66446008)(64756008)(31696002)(38100700002)(8936002)(316002)(5660300002)(2906002)(7416002)(186003)(2616005)(6506007)(71200400001)(6512007)(53546011)(26005)(41300700001)(966005)(478600001)(6486002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UU9Ddy9RdWVMZzNBY2VIbzlISUlCbmhXY1VvWlMxMElOS0pRRFhpUzN4NFhq?=
 =?utf-8?B?TXdQSEtvZktqQ2xRczJDeS9WUVZIZURocFNzOTdxUjJDQmZVb3JSNnJ3a2w4?=
 =?utf-8?B?NWFabzlSL0pLY2pHU3JOY2trQ2pISVk3VjRNdndnRVdJVlFvZGlQNU9RY0Zz?=
 =?utf-8?B?c210aktxdmVxdENkZGM2cHlXTUFkMlpIVVZVNllWNzJuUWlxSnBmVHEvMG5p?=
 =?utf-8?B?M1dWNk5yVCs1WWRob1RqRVcvYjhqeDA4Y0JZTi8rTDcyU010MDNFeGZacUo1?=
 =?utf-8?B?Szl2V0N1V3VsSWx4bEZvNjFIU3VQMm9zcStDZlVqdGtyQjY0MGZWVnQxU3dN?=
 =?utf-8?B?bUNsdis3N01vaU1MYllSN0FvdzNVR244L3pzZjlGODBqTDM5a0xrbUt5Z0xT?=
 =?utf-8?B?SHpjL1FCRENISnM1ZlBOL3BObnVYZXBOTHo2a1RIZUx5TmYzYTZMQit4M0NS?=
 =?utf-8?B?T0tZZzBzZ2M4MjNUVStDemkrZDg3Sk1Rek5pL0dJRjJUaXFDN0xvencwdWdF?=
 =?utf-8?B?SmhwZEF6SmoyOEl6c0J1Ly9hMW44cm0yUlRnckNHUXBpZTlFYlI5bkM5alg3?=
 =?utf-8?B?R0txVVlDNkFjeUV2NzU2ZG95TVhNaXo0UWtNN1JhNkxGbnp0VlVmdXd4SmR0?=
 =?utf-8?B?aVZpWUwvQlV6bjNhOWNhUWtzVTdHWXhSSFFKd0xKTlFzMEh6VHFFbUR6aHpG?=
 =?utf-8?B?UmNDYW9KTzdsK2FVNzNCQk5kWkpyYm1JakRnU3M5WWhRSlhOaklHNlhYb0Z2?=
 =?utf-8?B?N2hzYkN6VHY1TmFNRHhyQTN4eFNOSEF2bHA1blRZTHJ1WnRET29BY3BaRkNS?=
 =?utf-8?B?QWpjZjhmVElZMnd3NS9KQWFBTGowamcwMFV0RGZtc2UrZmt6UEZUUW4zS0Mz?=
 =?utf-8?B?M0xFNFQzT3pZT1BNd2tMTUlRTkoxOXh2ekJRVnBwb3Z3cmlGckxWYlE5Z3FG?=
 =?utf-8?B?aXR6ZVRhdzFzUGV3Z1FUOWJHNHFZcDM3N2V1Y1pDL3psUWpFZjg0clIrU0F6?=
 =?utf-8?B?aU0zbVJyRnFCSGpadTVyTlpVTEZnNDdQNWdMcmV6dEtnUWJleVVyMUVLZ1JF?=
 =?utf-8?B?Q2tNUUN5QUR3U29KTWxnTUZaL1F2TVhIMFBCZFlLMDJHS2tMYXFJVDg0dGdN?=
 =?utf-8?B?djlJZDF2Q1k3Z3VCNGxxbWRmYkJFWkpoeDRsSTEvaUUrYW5JKzViVFRWYlIz?=
 =?utf-8?B?NXM2OStBYmpEbEtEakJ6MUhhRnVmNi9KKzBXY05DVUJmQW1wa1MxZ1haVWtX?=
 =?utf-8?B?YnJXQVdJTFR5dlpoMEpaYlZMQ2ZQTDZlUFRNVEFXR1lUZit4MEYrcWd3Q1dt?=
 =?utf-8?B?WCs0R0VwUFQ2RXdsY3JwcFkzMWlERUZKMWFoSjdRbFovOEtNbDNQa3BOYUR2?=
 =?utf-8?B?QWZkdW5XbmNycVB4OXRQRHdOZGc4WGxXbldXVVlTaDRuV21MS3R4RXR3Nnkz?=
 =?utf-8?B?WjJVMHVNQXBWcVBTendpaSs5aWRMS3VNL2JteThkd3dEUWlMajE5RXF5aC95?=
 =?utf-8?B?SXMzWkZVTGtKbFA3MjEza0xuQTdFbVFJcEpHclQvSWVpZjdOZkcyRmdnTENG?=
 =?utf-8?B?Z1BOV3kvSmpuS3lhYUlOUEI4SHN4Y2JUWlFBZXMxY0txcGxFR3pZY0V4OCtH?=
 =?utf-8?B?a3FpUDlPMjFvajZOQlZST2pjUzkzN05TVGMxdmJveDRKRlBKZVR0RVdtbGhk?=
 =?utf-8?B?MFRwbUY1UERyeTlTQVRvQnp0d09Hck1SRzZpQWMyT0NHcmZZNWs4b2ZFdlR1?=
 =?utf-8?B?bGtDWGhnZVN2c1FidHpsa0RRVXFia1p5Sk9SdVp3VWlBNVp4V1FLNTRhRkVL?=
 =?utf-8?B?T2dGdWRzM2RuL0FtclpQUXdDTXJrdk1WWk1Ma21JaDBEMFRYb1I3SGlEbG5J?=
 =?utf-8?B?eXBhajdIWlB6N3hNa2dGVGdqakw1eVJpbFIwdFZuUUx2SVMxMFZmUVVtT2g3?=
 =?utf-8?B?cHh6RlAxdC9qemtLZWxtaEFad3NCTUU4YmViSGRZcmMvRHQrajNybU5PaTJL?=
 =?utf-8?B?a2N4VWQ2KytVUjE4UWc3TS80Z1VpYkF0MlZhbEg4Sll4QkdQSk5MMUN1OThR?=
 =?utf-8?B?eUZVVnBqWCtaLzBFZkFUS21BZkNwNThtc3ZLUEdkMVkzOVdlNVB5K3BndlBG?=
 =?utf-8?Q?N2fR8syjOl4yLm6aEXztQCnL8?=
Content-ID: <17465025E1B51E4DA92E35B4C21E9DA9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2151dde8-ebfb-4405-4d39-08da804a697c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 12:17:11.1723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pjHUH/4a3dmbjJs9jTWwG0rIkuF7L6U2jWYLYz8PyuwXWpOV3V6V/nKwcHHaUO7Wj1pa+ZUyy90kRHFcbWDyRQFv8GBsMwBmCwbHkINs63s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2267
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_051730_553206_5295A785 
X-CRM114-Status: UNSURE (   7.77  )
X-CRM114-Notice: Please train this message.
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

On 14/08/2022 12:41, Conor.Dooley@microchip.com wrote:
>>
>> Doesn't really matter since thats long enough to get past the switch
>> out of earlycon which is where the clang built kernel dies.

I had forgotten something obvious: keep_bootcon. With that, on the sbi
console I get a nice:

[    0.581754] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000b1
[    0.591520] Oops [#1]
[    0.594045] Modules linked in:
[    0.597435] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.0.0-rc1-00011-g8e1459cf4eca #1
[    0.606188] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
[    0.613012] epc : __clk_register+0x4a6/0x85c
[    0.617759]  ra : __clk_register+0x49e/0x85c
[    0.622489] epc : ffffffff803faf7c ra : ffffffff803faf74 sp : ffffffc80400b720
[    0.630466]  gp : ffffffff810e93f8 tp : ffffffe77fe60000 t0 : ffffffe77ffb3800
[    0.638443]  t1 : 000000000000000a t2 : ffffffffffffffff s0 : ffffffc80400b7c0
[    0.646420]  s1 : 0000000000000001 a0 : 0000000000000001 a1 : 0000000000000000
[    0.654396]  a2 : 0000000000000001 a3 : 0000000000000000 a4 : 0000000000000000
[    0.662373]  a5 : ffffffff803a5810 a6 : 0000000200000022 a7 : 0000000000000006
[    0.670350]  s2 : ffffffff81099d48 s3 : ffffffff80d6e28e s4 : 0000000000000028
[    0.678327]  s5 : ffffffff810ed3c8 s6 : ffffffff810ed3d0 s7 : ffffffe77ffbc100
[    0.686304]  s8 : ffffffe77ffb1540 s9 : ffffffe77ffb1540 s10: 0000000000000008
[    0.694281]  s11: 0000000000000000 t3 : 00000000000000c6 t4 : 0000000000000007
[    0.702258]  t5 : ffffffff810c78c0 t6 : ffffffe77ff88cd0
[    0.708125] status: 0000000200000120 badaddr: 00000000000000b1 cause: 000000000000000d
[    0.716869] [<ffffffff803fb892>] devm_clk_hw_register+0x62/0xaa
[    0.723420] [<ffffffff80403412>] mpfs_clk_probe+0x1e0/0x244
[    0.729592] [<ffffffff80457dea>] platform_probe+0x82/0xa6
[    0.735581] [<ffffffff8045593c>] call_driver_probe+0x22/0xa4
[    0.741848] [<ffffffff804557da>] really_probe+0x13a/0x27a
[    0.747819] [<ffffffff804549f8>] __driver_probe_device+0xc4/0xee
[    0.754460] [<ffffffff804554d0>] driver_probe_device+0x3c/0x196
[    0.761013] [<ffffffff804552cc>] __device_attach_driver+0xa2/0x18c
[    0.767853] [<ffffffff8045284a>] bus_for_each_drv+0x76/0xba
[    0.774016] [<ffffffff804547ca>] __device_attach+0xa0/0x15a
[    0.780179] [<ffffffff80454896>] device_initial_probe+0x12/0x1a
[    0.786732] [<ffffffff804529c6>] bus_probe_device+0x2e/0x7c
[    0.792895] [<ffffffff8044f290>] device_add+0x21a/0x3aa
[    0.798693] [<ffffffff805c323a>] of_device_add+0x28/0x32
[    0.804578] [<ffffffff805c3c54>] of_platform_device_create_pdata+0x88/0xb2
[    0.812181] [<ffffffff805c3e70>] of_platform_bus_create+0x14a/0x1a8
[    0.819117] [<ffffffff805c3ea6>] of_platform_bus_create+0x180/0x1a8
[    0.826053] [<ffffffff805c3f2a>] of_platform_populate+0x5c/0x96
[    0.832606] [<ffffffff8082bbaa>] of_platform_default_populate_init+0xc2/0xd4
[    0.840400] [<ffffffff800020e8>] do_one_initcall+0xbc/0x216
[    0.846563] [<ffffffff8080126c>] do_initcall_level+0x82/0x94
[    0.852830] [<ffffffff808011ae>] do_initcalls+0x5c/0x98
[    0.858611] [<ffffffff8080114a>] do_basic_setup+0x20/0x28
[    0.864583] [<ffffffff808010e0>] kernel_init_freeable+0xba/0x104
[    0.871223] [<ffffffff80746856>] kernel_init+0x22/0x1ba
[    0.877013] [<ffffffff80003700>] ret_from_exception+0x0/0xc
[    0.883218] ---[ end trace 0000000000000000 ]---

At least I had somewhere to start. Since QEMU repros, I continued there with:
	$(QEMU)/qemu-system-riscv64 -s -S -M microchip-icicle-kit \
		-m 2G -smp 5 \
		-kernel $(vmlinux_bin) \
		-dtb $(dtb) \
		-initrd $(initramfs) \
		-display none -serial null \
		-serial stdio

Dumping the backtrace at the devm_clk_hw_register() callsites shows that
it passes for:
- the main pll in mpfs_clk_register_mssplls()
- the "cfg" clocks in mpfs_clk_register_cfgs()
- the first 4 periph clocks...

It fails on "clk_periph_timer" - which uses a different parent, that it
tries to find using the macro:
#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT].cfg.hw)

If parent is RTCREF, that becomes: &mpfs_cfg_clks[33].cfg.hw

And yeah, thats well beyond the end of the array!

Booting with gcc, and looking at the clock summary:
  mssrefclk                            1        1        0   125000000          0     0  50000         Y
     clk_rtcref                        0        0        0     1000000          0     0  50000         Y
        clk_periph_timer               0        0        0     1000000          0     0  50000         N

This is reported correctly, so how this works for either gcc or clang now, or
gcc with the patches applied, I am not really too sure..

On v6.0-rc1, gcc and clang show:
  mssrefclk                            1        1        0   125000000          0     0  50000         Y
     clk_rtcref                        0        0        0     1000000          0     0  50000         Y

I guess this may fail gracefully as the pointer is actually null, but
the extra level of indirection added by my patch started tripping up
the error checking. I must just not have noticed because I added RTCREF
in a bit of a hurry trying to fix a bug in time for 5.18:
https://lore.kernel.org/linux-clk/986c73df-9634-d18b-eed3-37584fa2ea89@conchuod.ie/#t

Obviously I've got to fix the bug itself now, but now I am left wondering
about GCC's behaviour rather than clang/llvm's!

Thanks Nathan - if even just for being a rubber duck :)

Conor.

>>
>> Didn't get a chance to look at disassembly etc today, but as I said
>> last night it reproduces with GNU binutils.
>>
>> Thanks,
>> Conor.
>>
>> On another note, brought up our QEMU port's state today so fixing
>> it is now on the good ole, ever expanding todo list :)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
