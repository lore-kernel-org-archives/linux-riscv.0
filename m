Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E232DC6FA83
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 14:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GkIDrcNItge1vrDVFhXJAh+v4+sPzF55Y8s4T0AJyg=; b=ZXxvpuK05zdyWc
	FBlOEBBJ+ghVgGurLHzzc4NwZO0ZZipH2A/VnlXvBAjj7io8cmY0YH1I1vodCTi1wuQ9C4yHgqriB
	Re/wfHdKyrhVc4uTNjRAMvqconux7kGvOcEVCgSiZFpRtVeybyc3cK8o623hO6sG/UYFrZ9fhAX9r
	PoNbp9shQ69V7eVUCROw/Wj9kdfozy/rLrpq/pwtj+TTZ9xmE3mgTwHKjU4WxWvVir+mq3V0KWVCI
	i58NJoGFf3MNcQJGhz8Kh2urtkpGgb6ZVSlO7G2pKv3Fw+2VJn4fjzsWkoAYZDcOPI3wHMZl6ySto
	W/lk8sJH6JruTV2mEe8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWI9P-004P4u-TZ; Thu, 08 Sep 2022 14:05:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWI9N-004OaN-Cm
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 14:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662645901; x=1694181901;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Cs+IweJPQ8n+Ek1tHz6D3FxlLaS54to5SESt/Fl3Ulo=;
  b=OX3fzfHyjaf40cco84MKdpEU9tzwq4dVPffByCKdG5uT4jWeMkYF4qqh
   KCZQYrrzY/SZPLXMNhKkM/2zOIl9fEGP5mrknliTnPj/qrwKfFW5Mnd8l
   LOSXZnPK8VKEIeMcGPdO8n86aAhfIBLiGJIChj5rqd/ufLqAtjgcFYOsd
   IjBa6t97Vnk5Hv3XowJopstral+rVFwfnY6aPTEqpF1xLxrrOL4ENIy/K
   S1DlVmf1FlbAY12BsH719GT8nBC75Qf3yIBCH3s9YtbNyeRogCtcrj/Bg
   KXAeL1+itbUho0NPGvlBKX9rjHvILtYbKUzHDbI4dBUEqFO6MqReQ06wG
   g==;
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="176227096"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Sep 2022 07:04:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 8 Sep 2022 07:04:56 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 8 Sep 2022 07:04:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKuiOE4yiByO7RFZ3fDuvcAF3Kn8fr2/mxEJA7B3zq6vOBcJDDs7qGL3s5zSLB9y4nMevmJ+3WdJVrG+sWrRJ1YSsNy7FpnMI+RYpvguGhuJWXOVsfveU+95KAKd5Zxo6O6F5mojHquHZWGvnRiMLFhjE8F5c26u5kBe6ndXAf1mkjWcK7BRKyfMJwkbJhMFc5cg6d5JfEFKzVrR/cKzcdYUl+ZOw+bz6WIs0BCKT/+teQ4qPItapiPfpmeuO/ttW05wrLRD2KH4E7llkg8A7r1lfVinTW7ZpAN/fFL0+Lg7Ts5i+zKKQj5Mb0nI4NCP793mN+VBDbQODwmsT/DDJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cs+IweJPQ8n+Ek1tHz6D3FxlLaS54to5SESt/Fl3Ulo=;
 b=f2b4FFSjhMq/HOk+toVI5l+PVINzDsQOO/vCqO5Dfthh0e3pFc46bALZYFDL5gWjSDKSERkYjrU1opOVb1eDL/Aaz9YNT8wli6xlbFKGV67+DacJ3Kdm2hboubhd9Kwwc+vLAsNH/BIDT0mv+lHuC2AXpiunRNGWobbw2SJqO2nfLFdJhFK4u08k5u7iXtnxxECJOOVXIbgbDyq78yRLdTRVq0g8UP9XELhFSkpq3Er6jUgu7IAeiRI6cjHcAwWuZIf3iqtBn84BdMo+Cdaj10HCRg4RbKrvZ95ZIUjTHcuqjmHaE7JkcUZdrTvsViHig87NVR1BO6GFOIqyUNS52A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cs+IweJPQ8n+Ek1tHz6D3FxlLaS54to5SESt/Fl3Ulo=;
 b=p284pCM7skYNCMKaQz0gz5avNpfKlXUL+LlcqCFdaBgoVXhz23FLLxKb/qH0ooGQgNCfknFBJ9f1rOn7HftEF3pfJlbbnoKAUpdA9kumv+3POuQK/KmSQL2kgcV4eo3Nsbo2p6V2WQH8DaP1xsduqdJJ3zVKrWtjuZNvysAj/3k=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SA2PR11MB5002.namprd11.prod.outlook.com (2603:10b6:806:fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Thu, 8 Sep
 2022 14:04:51 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 14:04:51 +0000
From: <Conor.Dooley@microchip.com>
To: <biju.das.jz@bp.renesas.com>, <atishp@atishpatra.org>,
	<palmer@dabbelt.com>, <guoheyi@linux.alibaba.com>, <guoren@linux.alibaba.com>
CC: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <atishp@rivosinc.com>, <apatel@ventanamicro.com>,
	<geert+renesas@glider.be>, <linux-riscv@lists.infradead.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<prabhakar.csengg@gmail.com>
Subject: Re: [RFC PATCH 1/2] riscv: vendors: andes: Add support to configure
 the PMA regions
Thread-Topic: [RFC PATCH 1/2] riscv: vendors: andes: Add support to configure
 the PMA regions
Thread-Index: AQHYwdqljaYH7D6050aAz/t+qDALqK3SNfiAgAJOpACAAB1VgIAAlz4AgABEFACAAAUnAIAAEbiA
Date: Thu, 8 Sep 2022 14:04:51 +0000
Message-ID: <02df5db7-99bc-5476-2530-4237c3904933@microchip.com>
References: <20220906102154.32526-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220906102154.32526-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <8ecb62b7-53c4-1c43-65b3-567d8c12e131@microchip.com>
 <CAOnJCUKLpRz4Fbx1XiMnap-ELw2k1c8E9V8bZiSP+x7z9Z5QrA@mail.gmail.com>
 <f362eaeb-6ccd-4392-a346-55fa5ae25e13@microchip.com>
 <OS0PR01MB5922833FDCA60892191B211A86409@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <5e894d87-8abb-540d-fbd6-8a1d6f9d0e91@microchip.com>
 <OS0PR01MB5922F6CC81114BCE7696BEDB86409@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922F6CC81114BCE7696BEDB86409@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|SA2PR11MB5002:EE_
x-ms-office365-filtering-correlation-id: 3fa75df4-8fa4-4231-d5b7-08da91a3193b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: acBfem8em/nsY3jmflIO+yw2QEbnY7herK8+zmLFgeJ12d5f/f7PIoPbqLtTKWBPskmmGSd+r2zl/PTQVWZIZrW4BkKQgYKXtBaG9EbvGvADy4hN5IxpGpfJBnkUb/N56EFiDM064poFuEX1SY0Put9lk+DQfPMAokt4i5/x88Lh289SgnTpQO8H8YDBwZwbiZt40lLHG5NFxfctUHWuhJQRP+6r9W5uBsT7mjnHgnjiwaDypnLQYNWnTOhcBanHWO47qipmNWpqdwc6CECV7Mm4T60X6BC3rorbgManvdKMFnMFEchFrsxGRj9WkY/dWtZGzhI/xZbPNvMWqnTENmtauvo/allGaSOWeSzmchzAEPYtsSwWXs1icGXV33z02h59wD7hTvfmEORbE4nYTJ8yX6QuMtu3lI4DiDF6l1qUnpIaeWt+DJkQp9M7HYw1j0qJIFbqLB4IGK5P/41yGh6mC5c9ubXkqDnd+wYd981OoQdCZgIfL9WSp1/ZusmxJqZTq4bXKNwTnNBsAOR/7D3c6zUnDkjda9lAECEE+McsWsSwmlLQdryPA732nZKljMmuvjl/jJ/sY6CsB23EVr1L7mmGk6CnJphn4WS3S0T1V2jk556CfJPKqGDiEZ/vPjg8FswIiUmxwsb+GGhy1H0c0ViAi4V98sHrb6SWGAx31V5tlMxgZQFb2rYqliKQzix87W++cS5xxxAX5qH2Q2ggcaTJ3kM01sobGk1X40qlepH4MtZbSbz21qxVg8yenyWl9uSKlfs6qOOrxP64FUEivqv+AllAmpGMXi81jyCb2rL7ae+0I3rK7h2sfSIW4Y+n09rWlbmk2t9Ls3DiJQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(39860400002)(366004)(396003)(376002)(86362001)(83380400001)(6506007)(8676002)(316002)(54906003)(110136005)(31696002)(38070700005)(508600001)(41300700001)(186003)(6486002)(2616005)(122000001)(26005)(6512007)(53546011)(31686004)(5660300002)(7416002)(36756003)(2906002)(71200400001)(38100700002)(66946007)(66476007)(66556008)(64756008)(66446008)(76116006)(91956017)(4326008)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SklnVW5oem9zdk8rNTZ2eUgvdWlJMXdtdk5YaDRUQU5HMGdrZXl3TzR4L0wz?=
 =?utf-8?B?YXRwZlJYS3lzOVdSaVFkUHFvWFZCRXVqL2cvK0RqSmNkT09MZkZ2dlVzK1I3?=
 =?utf-8?B?NzFLWE1zWnhWbitnRWdRUW52L1lka21mNHRqNXJuZW5qcGl6dk5BbEQreHJs?=
 =?utf-8?B?VkxkOHIyRnBDSGhBei9KM3hBQk9RWHdDL0VkNFZqaTJaU1lWanNJcXNTMHJD?=
 =?utf-8?B?S2h6ajVKY2tGM0c4OVl1cVFNT1ltZlJITDdhMHVZVnEvekNCa2VoNWpHemg3?=
 =?utf-8?B?T0xNZVZ4NklHcDJRQnhockVyZU9TVTlMU3RTRUJWQkpFQUNrM1VrclZJNnBX?=
 =?utf-8?B?VGVNbGVCa3d6UFY4S21RMnkzREtkeGl2b2swVi9pWlhWYTRXK2FyVlprcFpE?=
 =?utf-8?B?N3hQWG13YzdnZWZnMnVlT3ZiS1lvUHBzWEZtaVVGay9GUCtUMW4zTmxLb1Nt?=
 =?utf-8?B?SzVPSnE1UUNWaEVuOFZrMjhRUDFBa1hoVXBiRllSdFZFNWVLalJRZ1hkV0pw?=
 =?utf-8?B?ek9nQWpoajZ6akl1bHZVOVhzMXVmZ29jYVhmK1JLYkYxcHdJRFloM2NpTmc4?=
 =?utf-8?B?cGFrVjhISzBIZjRHMVlEanRjSm55KzMxR1hldzhYVGg2T1NKUmgyNjltNDd6?=
 =?utf-8?B?QkFnTnBDamdVNS9nN0hjVG1zNHhXR0kvR3JXUVNzQ2daMi96RjV3cEN2bE5G?=
 =?utf-8?B?eUxRUUVNYU1Lc3FqNUFPMVlDVjJPcmFrTWpWOUtoNmJtUUxQbXZSNFN0aXJ5?=
 =?utf-8?B?YlZrYjVjNzFPbnJoa2Z4TGZOQ0k2bVA1WThCQkZPTytnOS8zVjhqMEJ6b2hq?=
 =?utf-8?B?QWNzakYzaTRNRldEeUw5UjRoWjgvVDBJb1Nla1g0S0ovTlV0Rm5JWE1VLzFt?=
 =?utf-8?B?cnc3VHRWME5IZEJ2T1lWYUdwR1BDcFlkSEg3a0ZONzVQOG13MU8raHZBZHhQ?=
 =?utf-8?B?UjlTd2ZxOUJlK0RkZWM3ZlJCOEtoemdpdml0Vlp2d3hnSGdsUmRzSVhYcjNJ?=
 =?utf-8?B?ZGxYVWEwQ2RCQ1BlSmsvdEdQR2NDUktLL05YZG01a0c0Rkx1RnNuM1h1RUtY?=
 =?utf-8?B?bUJmR3VBNmtjdUM4SHcyTlExSjJRWldDNSt6d3ZwLzFvSjc3bWRtYnErNFNJ?=
 =?utf-8?B?R0V3VFhsSy9UYWhXQ2lKNUEyZm5hVXFCcExYSXJmcmRpbEZTa21kdGlFNERn?=
 =?utf-8?B?dEdmY1Fpd1F0YTJnZ25kSC9SK2hjelB6WFQ3TE1lNEVxSDgxSS9oamFBZk1G?=
 =?utf-8?B?ekFadnh0eS9rK1kxZ00vZmpROFFFZGpSQ1lSTTROOWc2bzRDUC9sNEwxVkhz?=
 =?utf-8?B?TDRiQnlVdHpETWRnMkN3dVprOUdDbDhKK0NhQUhlbHM4SWV4TnpQVzFjdXVC?=
 =?utf-8?B?L3ZFcXIvK1VySkYrOEhUWEhJeU02ZzFhZUNubCtRQ3pzdkdoTHV5Rmozczh6?=
 =?utf-8?B?a3paTlVSbGFTMjEvWnBNQWFTNUNqVzVrNGFuaXAzTElDTzU2UDlwRU5IcXlF?=
 =?utf-8?B?TllVQ3U2QUQvSXdKaXdZUCtoNHdTelFsUFlSb0ZPd2ZCMW13NWc0YTlySUw5?=
 =?utf-8?B?STkzWFpzV1VUd2dLRlhiWlRhdWg1bWVwaHFtRUdMWHg3UXRidzZJT0hPQUhs?=
 =?utf-8?B?YjVnSERQcEtTeC8yallzSFZrajlrN2VRcFB0RWxoWldKR0RPOGpNMzYrbmZV?=
 =?utf-8?B?Y09TSnFoV1J3Tmh0d0pLa1hvY0VXNHFYd0hCdmtvU3dXRlFzYzdqVzM0UERw?=
 =?utf-8?B?QTRYeUhtT256OTF2NlczVjcvdlNreS95ZmY4bWdnVWd4Q3pzQ0dhQUlZYlJS?=
 =?utf-8?B?RmtITEdITHpVdTJndEs5b0ZLVmxsTlZyL01acS9memhGaWlFSzVRc0loa3lF?=
 =?utf-8?B?YWwwU0F0eTJJQnhRZXJVa3FBbHZBVnFXeloxWUJHbkhMOUMwTU5qWnJGaHZT?=
 =?utf-8?B?TlFLMFJzSmxDeDV2R1NlVWRxTVVnaXNTb0EzTXFMMW40UXpaWDVxYktYVWRJ?=
 =?utf-8?B?cTdLSnF5bmsweG41ZzloT204SVhBRGw3ODFZdnUyVkFwVjVPVmxsTnd4b2hO?=
 =?utf-8?B?YUE2N1VKWGsvUWwrR2JvSE0rRm9hVm4zdkhxa2w5djJPTTBGMTMxSHlyZ3Zy?=
 =?utf-8?Q?CwczsT0fDw1w7xdUTB84lJcLU?=
Content-ID: <FEC670029B8AE64EA1DF3B84CEBC3B33@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa75df4-8fa4-4231-d5b7-08da91a3193b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 14:04:51.4926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eFwPcWkjcYXUlRtDnrCAXR5eek2Wv06F9zvz44tgG82lnYWriCCxD1JLT8MqI6zw48R5R83sxYYc65y116hL+ncosBqHn7y8y6aGlY9IGIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_070501_629660_76D12435 
X-CRM114-Status: GOOD (  19.85  )
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

On 08/09/2022 14:01, Biju Das wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Conor,
> 
> Thanks for the feedback.
> 
>> Subject: Re: [RFC PATCH 1/2] riscv: vendors: andes: Add support to
>> configure the PMA regions
>>
>> On 08/09/2022 09:39, Biju Das wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>>> the content is safe
>>>
>>> Hi Conor, Atish,
>>>
>>> What RISC-V devices you have?
>>
>> A bunch ;)
>>
>> A __couple__ PolarFire SoC boards, HiFive Unleashed, D1 Nezha, Canaan
>> k210 MAIX something & the VisionFive.
> 
> If standard DMA api works without any issue means, on these platforms
> IO Coherence port is enabled in the hardware. So all peripherals
> involving DMA work as expected.
> 
>>> Ours is RISC-V uniprocessor without IO Coherence Port.
>>
>> What does "IO Coherence Port" mean? Zicbo*?
> 
> The HW will provide coherency between CPU and peripheral.
> 
> If Zibco* is uniprocessor, then highly it may not have IO coherence
> Port enabled in their design.

Zicbo* are cache management extensions as Geert pointed out.

> 
> Guo, Please confirm.
> 
>>
>>> Currently USB, ethernet, SDHI/eMMC doesn't work with standard DMA
>>> api's.
>>
>> Sounds pretty similar to the D1 so.
>>
>>> On RISC-V world, how do we handle DMA api for uniprocessor without IO
>>> Coherence Port?
>>
>> If you do mean Zicbo* you're into errata territory there & I don't know
>> if that'll be acceptable upstream - not for me to make that call...
> 
> It is not errata for sure. It is a HW design where we don't have
> IO cache coherency port enabled in the HW. So looks like it is not
> an extension or errata but it is core stuff.

If you do non-coherent stuff that is not Zicbo*, the precedence set by
the D1 is errata. As I said to Prabhakar earlier, do a
`git grep "ERRATA_THEAD*`. I am not a maintainer so I don't know the
"rules" about doing cache management without the dedicated extensions
are.

Hope that at least helps,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
