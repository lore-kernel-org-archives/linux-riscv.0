Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C185C28B2B
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 18:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/icsl7boyf2TnOskN2tZBwf/IFGkeA5EHtKsdopXBY0=; b=DszU63ABTkhqjp
	Oh2uaFYxgRroybCidjpSUacMhww9At8sGibUYTGwrPoGLZdtc3nGUhq9/2+bG8qVA/xECd7FClyMq
	hX95zuPKeLRcyU8pd1sJnfvX0+XwX7hUhEqW1BqyAnyFjCzdktoDY/M15e6GAwSCLkF3vVATSQ7dM
	7a9yGMMNopal4WoR+GVpJGXx2BtHDaQRVLNEwI23uTuQ/wC0hE7H4QCC8/ifaPO0pWxSyXtfoRjkR
	zQgqP0KkVwH7ngtyHt4ZUc3vjPZCq1z8HaojQnYr63JYLZxN9LNPArm1PUX9o1ZsxmtSmniuOcic4
	LFWhx+WXJx4I2tc56jAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP6Xl-00B0M6-Ep; Fri, 19 Aug 2022 18:16:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP6Xg-00B0Cd-Fv
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 18:16:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660932984; x=1692468984;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+qNNqNtjU2HzI8xIrLh3qo00eogsEmTw5EXVAGOxTt4=;
  b=XQlDflPPGyacjU5gv6kqc+xiVI46zexAbev48Lh0MBm+eMntG+QjDB+K
   mpdGN6MZk7vBGdeRpowoOi9/yh3afQuOap9ngV9PQMikLIbRWpjVcVnnq
   72uQ3FILoVh1o1iGxj81yARZsM48RnDobiBOzBQ3V7/7NAxRzjHoRsqWU
   sC4zzfaDvPT91byl02E0Pt7mC98nLpkpg+fjFCsvHJeo8zKTt/c+zn13L
   EYBhirBBEmEYSvNfVchHR1H34fc3a97cUtW6A7Fstubh+QvyghY3xPko3
   47dBEEsCM1teLt12xeLcrUxgBJ5k4NwjcCYuVWrT+tqnleQSXF2Qr4KbQ
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; 
   d="scan'208";a="177112027"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Aug 2022 11:16:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 19 Aug 2022 11:16:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 19 Aug 2022 11:16:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7gVlpdYvflgEsDdlSGtwwiQ21eGye9hLoCu1gA/Bs3KyXKisEUanOLTSpSpEHcwgN+WAyQpIFb/slr49a0xkiy/cPf7esX4rKhzEeEU2zrB4LW+z8iFxLMrQHCKptUstiB8eGOiaSidJc762c0SFTy9KI3FU/cSZXYWDGDQMLqHibww7uYNOTvjBRcqVqNg/Z7rXk8ZDqXCWiehI7LmVGHXKTvHtauYJBun/jE38fmAVpGUck6UnGgGHZGnafU1LL0BtKQ+6O520kUKoiHYafkkb8McHGYkaprJXnivvxFB0Of5kv4yAvcHx0xlCfYtDkDzxLVUyDc1kDmqM7dGGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qNNqNtjU2HzI8xIrLh3qo00eogsEmTw5EXVAGOxTt4=;
 b=R2vwySfVZKbuFzdV54swgin2XiYWhlDim1ttQiafT80HwhD4MSvZ0ttCw+TGOckJIwSPePk34MCTAM0A/F3CXYjLtEsbWmB0JLd0Gx2qt4UfC3PoWEALGehGvagJj8eNBOOUGaB7ck1Ya8//QzqdreQFeIishQaG62R9vkfNZtKPy0MMRLKoyFOdAuwBt2A0tt9XlLUuGkYHzsqCCxDvQeKzCenbsScfWIV/hsc5trkHJmRGRnPNdqdzVMUEFFBq6qWPDg+ipv4l++sz6KYJ2LIkkMM0r7eoseZHYHQeJZsAOqtAaPSg5LV98LXZoMITUv8vByqTRxCvML9ftcEd3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qNNqNtjU2HzI8xIrLh3qo00eogsEmTw5EXVAGOxTt4=;
 b=s50xsTPYo5KJvQuicsiF8jxgHHPbQA64pi2L9rZWMBkVBLKMOQFXlO+3UhuAFhWs+x23YajY/uUoK9XGF8FVoZHX1oHf+ZEW8s+mp/z/V2oMuydLeqCh4UvqzwUOXqjNUhLTEfL0ocQcJazuB6VTrDl+sdYUSURqhHBZJ/5baIQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB3477.namprd11.prod.outlook.com (2603:10b6:a03:7c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Fri, 19 Aug
 2022 18:16:00 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.018; Fri, 19 Aug 2022
 18:16:00 +0000
From: <Conor.Dooley@microchip.com>
To: <prabhakar.csengg@gmail.com>, <geert@linux-m68k.org>
CC: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <geert+renesas@glider.be>,
	<anup@brainfault.org>, <linux-renesas-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 6/8] riscv: dts: renesas: Add minimal DTS for Renesas
 RZ/Five SMARC EVK
Thread-Topic: [PATCH v2 6/8] riscv: dts: renesas: Add minimal DTS for Renesas
 RZ/Five SMARC EVK
Thread-Index: AQHYsLovHvp8srW8EUKH5nn4yyg3dq2wUQGAgAAVRYCABYKrgIAANlYAgABuu4A=
Date: Fri, 19 Aug 2022 18:15:59 +0000
Message-ID: <c8f2b4ae-9921-157d-bb43-8fd8154255e0@microchip.com>
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <07342070-d96c-59fc-f9dd-b65cd742d97a@microchip.com>
 <CA+V-a8uNRr+WPX=YC+UMT4ch4S5XwsatHCzUoSt+hTk4C=cheA@mail.gmail.com>
 <CAMuHMdXjWsUF1_CnojrvT+EyEmAp25jkT2TyWSisGinAGgMb3w@mail.gmail.com>
 <CA+V-a8t-O8ro8U3n46sjMS=HBJC-09V2hrdNXUCyhEZDrsiTfg@mail.gmail.com>
In-Reply-To: <CA+V-a8t-O8ro8U3n46sjMS=HBJC-09V2hrdNXUCyhEZDrsiTfg@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e618e5e8-47ba-4b62-b121-08da820ede7d
x-ms-traffictypediagnostic: BYAPR11MB3477:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0SJXXZHvZHJwW77AbC0uqbPZe69bWM6l5fODecV3kUIWCBLjoeHrbNi0R6PXJTr8RAseNsLhI2pbjHTwPFhlmZwpcxGqI5ff7H3SrxbjNhktpQloJxvp9jKA68W8HHY3NjkUQeYCy2w1XrbW3/AZEuCCQk4w8GfQz+WPAQypnBYvVUgND9p34gGv54NVzQBeL+ayfCWs6ApNETQEj7PW0OV90FMXgyhmPfNmHXg7ckGXfX/Z2NKFRUiLsk/ofiuCiveAYOD6yuw2KTwCs7hcB/vGKxiHfGA5WA8oRbo+3Qe0sJho1EXm5y0JdZJRzrm41j7BXaAMC1aMfqjfOT2usXP3SiDu17OHWJ9VHNALunZRhbP7SU4HzwcSrxiP7+5At2nYV1oGhv5B2e5VTWXA6K67JhIbctjDPFJRP6W53ztnPbVZv8UqGNmKpqcFcekIwKexFnuQuXPODAIYr6P5JpBsTpsNb+Y1MSXVmiMoZjOq0CH0uBVnnhtciPfJXPq3gC67igmImJewp4pFIYY9nLRa0MT4tkVN5FE0rQrA7IlhzqDi6zWGahF5hA964nyhmRdxFgEKiGZVmLDchDv/P5J/pHOHrsNRujuUclawXwde6zUXcrZ0Bzfbj9TwMUxyivWDgEz1gTOmMQqzttNNB09i+PYlIlqGucJp9gSKqUkC/dGtVvWs1rjVfvcp79qvWOhfyTcPSTnh79UpqMCKxyJ6XFU9Oyt/hJsxGj5INUHhJGvLpVcUy2tCUuqeRw3sOIOa7IwBwgC1kxF3JNNyT9Kj8GHm6/SWxYCNNZVPEMPTEs+QtuWIQV6JHsOkE2w7ojl9cMAIKFC6SjkORjWFcnS73l7CQEi/vC6XStzHNNA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(366004)(39860400002)(346002)(376002)(53546011)(6506007)(186003)(83380400001)(7416002)(5660300002)(36756003)(8936002)(26005)(6512007)(2616005)(31686004)(966005)(41300700001)(71200400001)(6486002)(478600001)(86362001)(38070700005)(8676002)(316002)(66476007)(54906003)(2906002)(110136005)(122000001)(76116006)(66946007)(4326008)(38100700002)(91956017)(64756008)(66446008)(31696002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmV2dWw0aWE2enR2Sy8vd1BSSC8zd09JYVVFWko3cmVhb3VBdlNBZHlSNE9a?=
 =?utf-8?B?KzgxdzNGUkwxZ3J0b3NFMFI0QjdrY1kyN2J6WnFNRkE3L0FvaW42alUvaTlJ?=
 =?utf-8?B?SFJNZGdLalFvZHUwb1czbmNWTklJdkJJVlNRdmdyd3VEeTZTZlRCWitLNUha?=
 =?utf-8?B?QU0vY0xkdE1zZTQrVnVqT1dLTlB6MnpCbXZFbWFsbE94djlkdU1oWjU5ZHlw?=
 =?utf-8?B?NVFVY2FPbjU0OHNUMVRkVlQ4eG83S2Fsa05NS1VSOXpwSlhDUU5WVmlINWM3?=
 =?utf-8?B?SlBmUk5Dd0V0bzRockVGTERHd3dxc3J5UUlxR3NxZi9BZ2cvYjQ4cEl5V2dJ?=
 =?utf-8?B?TkgxbkZKRXdLNkJsNEp3RFVRSkRwbS9PVnJnUGRjanBLUnRvQmVrNzNIeXdD?=
 =?utf-8?B?TE1aaEl1Uk1VUlZDeDFVRmltektYbEhjb2lYREJLUkJLZGt4UjRUTTVRekZ2?=
 =?utf-8?B?MFNDellJaHVYT3l5dWNCOFBpNFFENkw1OUN6R1hFRWhmTDVXaFBuWWJUOGR2?=
 =?utf-8?B?cFlack4wYzZtQ0lldnNrelBZOFg2NzNraDRuWG14NDR1UGp3ZXozVTBncDdL?=
 =?utf-8?B?OE4xQmNqZ3d1aWxDbFVJdzNITnY2OFpJTWNRYWo5cmVCSDVPbDlscHpuaFlZ?=
 =?utf-8?B?cSt5UnB0NHhubldyVFNzUGE2RVBscHE4QWt5NGl1K2htNnZjUVhSWXUrSnI4?=
 =?utf-8?B?eEhXbDdzaFR0eU11WDlOZVdJbVB6N0ZxdzNKTnFDbTMzQ0hkQkJCR0dTSDl4?=
 =?utf-8?B?YmF2bkZlT3M5WW9FdjhlZFN5dEdRblpMZU9JdXVwYU5Eamd1bUo3c1NCNmJw?=
 =?utf-8?B?bHcwaEYrRUxkK1JNNnVzdmk1Vk5FNFRqMlJXSWRxdkRHWmdia3hlSkJ1U3VZ?=
 =?utf-8?B?T3N5YVFXZEtaQzRzOCtDaTV3eCtDUGs1Y2h1RnNObTBNOWw4NUpneW5mV0hv?=
 =?utf-8?B?Q2ViVHBzMWplNUhoVXJ1L0c5Q0dZY0Z6bHM0S0VyNURoTVpJQWtGcWhnU3FK?=
 =?utf-8?B?dlV3VzNETHEza2pXdW1GZUpZOFpHNDFEZTNxcVVXYlNGSTlQTU8yeUpJWnBq?=
 =?utf-8?B?ampRdXVWSnBydzQvRGRwdEprOGhCUnZlTjZxSGdKa0dKRGVjSnBtQVN6cFQ3?=
 =?utf-8?B?MWJPYlh6RFZXU0tlUm43bE1YU0h5Mko1WFRhM0pPWGRKY0k4SE15SE5NVStv?=
 =?utf-8?B?N2V3QVAzUUY5UjMzeVN6b3ZPMEhObEUzNkdjbnR2c1oyalU1NU9kbG9aWkRj?=
 =?utf-8?B?cDE5a0ZmRTZ0MzNKd2ZGOFFaNGFvTnR3eFZVZTFJMnlnTFdhaS9hRG00MFg4?=
 =?utf-8?B?bmhtNXROT003UmRHMXNIT0RiRElPMDN4a25NZDkwSjFsYVNPNGhiWUJaQmpE?=
 =?utf-8?B?M3ErNk1SWWdTd1BDd0pkNGEwMWo2Sk1VN3pQcC96QnQ2ZEFzNndBV3g2bmxU?=
 =?utf-8?B?UU9vcHBZQS9OZ3h0YU1YRDhQeEs4b2hZSlBIQUEzWnNITE5YVk9xQ080eU1h?=
 =?utf-8?B?NUw5U0cxQnNtck4ybnRFdUtTNWVWVFNqcWRWM3djM0h5WXZ2N21ZZXZQTzRU?=
 =?utf-8?B?M285SWxyUGdZWlZ1Nlc3a29jcDU3RXBSOG5jWGtsOWZBa0Zka0kyNnFwb3ls?=
 =?utf-8?B?OGhmNmczcUdlRFZiTytlelpLWU9tZ3AybldkMTlyMVFaY0dncjh2VEZyRkpl?=
 =?utf-8?B?ekVHaStvVUxocGwrVFprcDFlOE9ldnRjbVJrWGQyQVpMU2ZQdzZuZ3NMbEJL?=
 =?utf-8?B?U1FSdUQvbUVCQ05zRkdJeEZmMVdrRlZ6cURHTGQ2YU8vcFB5ZGpiRHozQzd3?=
 =?utf-8?B?R2VpYnErc2RvWHdiYnFtOEF2bmhvdEx4dGEwaWpDL0dTYUZvYUkzaUIwTDVK?=
 =?utf-8?B?cCtsT0Vnc1FNYW9iUkoxV1J5Vkp4QUxrVXBFTVFva0lQRzhyekZSa3lVS0cy?=
 =?utf-8?B?NmpzK1VrOWxXUVkzbjJORXNyWmM4c0hjaUw4Wjl5UElLR293SFJjNDg1OEIv?=
 =?utf-8?B?UCtPbk5UUFJ3Z3c0MTIxUTIwRFI3MUpHRnR2aks2dEFlTlcydUVoVjFBUlFs?=
 =?utf-8?B?a0NjZ0U5VFNQQlhONE9pekNHOGV5UTRTcTVLdFBCTWwyZ0JCQWU0YjQrTTVz?=
 =?utf-8?Q?LX8pJi77NL8FeKibJviiWca5f?=
Content-ID: <C4162BF5E6680C4FA69587B64AEFFA9B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e618e5e8-47ba-4b62-b121-08da820ede7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 18:15:59.9797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LwAOdC7/co3khgRDXmLTD5B5ESBuexmnBksi4YBFPJoekZCw/oRZWWKn3y0GR3YZN2RB9cOr30mW4erDR97AJTtU1lyUhoNJeBnvoPQlT8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_111624_839835_5FA36C87 
X-CRM114-Status: GOOD (  20.10  )
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

On 19/08/2022 12:39, Lad, Prabhakar wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Geert,
> 
> 
> On Fri, Aug 19, 2022 at 9:25 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>
>> Hi Prabhakar,
>>
>> On Mon, Aug 15, 2022 at 10:16 PM Lad, Prabhakar
>> <prabhakar.csengg@gmail.com> wrote:
>>> On Mon, Aug 15, 2022 at 8:00 PM <Conor.Dooley@microchip.com> wrote:
>>>> On 15/08/2022 16:14, Lad Prabhakar wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>
>>>>> Enable the minimal blocks required for booting the Renesas RZ/Five
>>>>> SMARC EVK with initramfs.
>>>>>
>>>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>>> ---
>>>>> v1->v2
>>>>> * New patch
>>>>> ---
>>>>>  arch/riscv/boot/dts/Makefile                  |  1 +
>>>>>  arch/riscv/boot/dts/renesas/Makefile          |  2 ++
>>>>>  .../boot/dts/renesas/r9a07g043f01-smarc.dts   | 16 ++++++++++
>>>>>  .../boot/dts/renesas/rzfive-smarc-som.dtsi    | 22 +++++++++++++
>>>>>  arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi | 32 +++++++++++++++++++
>>>>>  5 files changed, 73 insertions(+)
>>>>>  create mode 100644 arch/riscv/boot/dts/renesas/Makefile
>>>>>  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
>>>>>  create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
>>>>
>>>> Just to sort out some of my own confusion here - is the smarc EVK
>>>> shared between your arm boards and the riscv ones? Or just the
>>>> peripherals etc on the soc?
>>>>
>>> RZ/Five SoC is pin compatible with RZ/G2UL Type 1 SoC (ARM64). RZ/G2UL
>>> SMARC EVK carrier board can be swapped with RZ/Five or RZ/G2UL SMARC
>>> SoM and still be used.
>>>
>>>> If it is the forver, does the approach suggested here for the
>>>> allwinner stuff make sense to also use for risc-v stuff with
>>>> shared parts of devicetrees?
>>>> https://lore.kernel.org/linux-riscv/3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com/
>>>>
>>> it does make sense. But I wonder where we would place the common
>>> shared dtsi that can be used by two arch's.
>>
>> You can keep it under arch/arm/boot/dts/renesas/, and refer to
>> it from riscv as <arm64/renesas/...>.
>> Cfr. the symlinks under scripts/dtc/include-prefixes/arm64/ and
>> e.g. cros-ec-keyboard.dtsi.
>>

Is this something that you intend doing or is that future work?
I had a quick, and I mean quick, look through the arm smarc dtsi
and none of them appeared to be a 1:1 match with what I see here.

I assume that's got something to do with the "minimal" in the
patch's subject line, and some re-org of the arm files would be
required? In any case, you've not introduced any more dtbs_check
detectable issues so you're good in my book whichever way you do
it.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
