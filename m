Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53017C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 23:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQBRr9S0pnfBxMGwgo5haH70AX01I2v2VBPSixrxNLU=; b=rY1tUnJCLVGp7+
	N9GpjpEecSqeKNVLXgRslG055cYuLRCdXxj1+YIgH3gTA2Gl/9uGbZWdfgRXOpelhWe0X95u4gjXl
	agNvSoryqmVp/HNRJRO60Ar1TjiQmJFtJA32WwP/2sJvUY9KDE7L76FoCDIEzb65i+TUrlQue1alj
	uLxrcbPK/Gz6v/I8Yk7jhm0e5EfInqSicV6N39FPybbqUn3ACT4Luubs8AgM539XvuDuQrv4YWZgZ
	cP3rknkmlEPUgKTAiik1Fy6FUNR+0OMrCh/7abJMWPXrR1wPm6Y+dMKAjs596YgqZesvquPv6JXxW
	ewfV33aMmwjM6HKQdNxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6h4M-00EOjM-U7; Wed, 29 Jun 2022 23:26:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6h49-00EOgO-O9; Wed, 29 Jun 2022 23:25:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656545149; x=1688081149;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=naf/+Kmt0gUjTTRa802VBbpU/wfxiUqJYCVgQWIEr7E=;
  b=JJM7lwp1vSszeMN+DyQUGn2y0q5RzfpMkcmPMzll3aYcHD/ufmBSy8se
   iNykjzNo6NegEvn8nUTQbTmFyvPZKNW6TpAIJrvKHxjfvQJjAg84Emu3v
   iIKNEQYAhy7IlI3tjUpEhn3+SAtDW5/rG8r7CoA83E3KPbYvfFAyC03jL
   5CAtuVONF+F3Xf8CDX1AX1Yl7221ZJ2QKkU8UJON7IesdIOmRTzQYAVGT
   M4TGROYsMbIA0UsOXWYYX+9dTTT35Yfzj4/uVCyzjaojzAkWMcrM4YlFW
   olycfe+Q+dWrgqQxlAa5zFr/Pk80OopkAjuVSxHgTWMvjkz0Y6cyFfbr7
   g==;
X-IronPort-AV: E=Sophos;i="5.92,232,1650956400"; 
   d="scan'208";a="170445040"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2022 16:25:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 29 Jun 2022 16:25:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 29 Jun 2022 16:25:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaEVyp3gqjKOmNnW0PKbT3jgRIQyVGWUOIyM45k9FaO5Gl9B8JZrDR2L3RE1AL9po5KBV3OKJmj4mOQtzJv3R9ASq0VDbZ/p1b7q+y5AVD/HrXjwcvDP7fCgXMY3Rya2uZ5Z+dDLdkXKBzdQAoKw+lJDBu+1SenmJa3DsXj0zfqGgvsJGiFQZLpwDC3ga2Ni/+5YNzrLsZrLqIJHjtV37aH5C5MP//PgxDrLw2h3/P76fWN71/yJMSP7sHo1oudNVJakDBz/qewX2mQOVfH/EBUPo3/jygEOgI61k4UGKqGfOLzll/O5ibP3Cxf32UD5/DN7doEMxrMAfi8ekgvvfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naf/+Kmt0gUjTTRa802VBbpU/wfxiUqJYCVgQWIEr7E=;
 b=S2rdD6oEBeYYQzu8K/AH94uJLfFNk/28KEwa7709DuZSwgBusCupF3Xx64CFKjkep54jTvmJlf4SXpRHhgl3Yh50Snf/dfMo5SXqY+r2ExSAsZ3JaRnz7WcDRC79Negjo7vBpGE1a04WcWw6ejPXEo1juoOmwzrgvSLRvIzhljLnPyXQLmTklFjVo6PqCW9plde6jSv5tE+O+BIWvvI92yYAlh/v+JLADQK3/W9JCyZpTUQFJusbQCWmeiINbQmNA9fhF8qh/N6Lds2sWSC+jVSINAZ+BoI43KOshrNGPXUNarDWbbLc3iUdwaHSDKfouGvFSlT1cXO5ISaxuVNszQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naf/+Kmt0gUjTTRa802VBbpU/wfxiUqJYCVgQWIEr7E=;
 b=bDvP3qjX43ldigedIWPagJ+nmwK0hX6awGxs2muOJJPV9k2WETM+lq+Va+a99/cXArqxr+5fxwqwyk4CzgOQCHRXx/8/G58xRKVJ/29dRDzsVIf6rgXsBGMUC34qternMiHGKv7Xt8HytdHXY0uShG56Fed7IyXiqtgr8i0kwdk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR11MB2054.namprd11.prod.outlook.com (2603:10b6:903:2d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 23:25:41 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Wed, 29 Jun 2022
 23:25:41 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>
CC: <linux-kernel@vger.kernel.org>, <gregkh@linuxfoundation.org>,
	<atishp@atishpatra.org>, <atishp@rivosinc.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <wangqing@vivo.com>, <robh+dt@kernel.org>,
	<rafael@kernel.org>, <ionela.voinescu@arm.com>, <pierre.gondois@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<gshan@redhat.com>, <Valentina.FernandezAlanis@microchip.com>
Subject: Re: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Thread-Topic: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Thread-Index: AQHYikaSsliGXUqkU0W62iFZL9A2pK1mrJEAgAAIIICAAAargIAAEAyAgAAEPgCAAAqJAIAAMFoA
Date: Wed, 29 Jun 2022 23:25:41 +0000
Message-ID: <b2ab0ac1-bfef-5ba0-4ee5-15e604d8aa2e@microchip.com>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
 <20220627165047.336669-10-sudeep.holla@arm.com>
 <bb124e47-f866-e39e-0f76-dc468ce384c6@microchip.com>
 <3656a067-cc3f-fd5b-e339-5925a856cce1@microchip.com>
 <20220629184217.krzt6l7qadymbj6h@bogus>
 <f1f4a30e-7a84-30e2-197c-4153b3e66b64@microchip.com>
 <20220629195454.vbsjvcadmukiunt7@bogus>
 <03433f57-04ed-44a9-a2f6-5577df94f11e@microchip.com>
In-Reply-To: <03433f57-04ed-44a9-a2f6-5577df94f11e@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2926f185-e748-48b9-b198-08da5a26aeb0
x-ms-traffictypediagnostic: CY4PR11MB2054:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DzAKBPLLCDKr+aLvSvoAwz3zUI6JGh49vpm4lcFQ5kcZAI2UFNkkoz6aALhDnGfrx52MMPiMUNAxnkwXitFis4C7PnIV9EqMdyXpNxRTXaaYuw/rZmQjMMXTEtXI8mMaVlaHdU/mQLDbf72+ggBJx8MVlaUpexm4D10u+zt7NoraLra8yw+yxmaoO7DfiAJj2OpPqYm+27q+OOUpPPpRA4adqUKmsZmxCn5EWcpA3zgA7TOFIhF1LqrvC4Ng+erPL9akEsBqoTeeSOx4S7VTQFuF5qRj4FpbHdlypl/OZJSucfFqwoX/FnQ8DHXlKNXA2Pqf+JMQ7X+mkTVSIktQr8+jLI50vE1NSp2S9ADX95GirbJ7AYVXsJHPa/sxGHMvUAU3oTTy4yd5uDQojs69EfDyx8YirPj4f+KpLs9KgDqa8i2q0l+vHdxrHUgShb9W2WaSBtjoWMXczK5ZYN1OH/GVuYBpz8TOj4iUYZFOKo9QQT40InB8sLx70PBYPnBWAqFjHcuoAhmlXNM2iCY8Khoq3VOrX7cNIrk3MV9fjo0M6vPZrj2XYCO3bg0Uea0uo/PaeAOhNDG3q1/ZYe4Kno4VnRrJU4BexJjY2Wtx1MftfsUOjBqoLB82ZLN8EdoehT/pfYnLEURYN9NKNwLEEQ5h1QFDO856PBr1nCFuf6ath6oCxZzqZZChSA/ZBQul/OtO4RoitnDF+epmW6y4RQE4i1c/qKcidyBdB3h3lWpfCSC1gvs9nBPVuLKpGN951QS4iRl0LnktJMkFL80n3GJbJbrWl3MD20TSS/aOr/ZWUBqwnzY4EdZc30QUGMSvGicsoykBpA8o9WDn+eNYiwDXGscohcPbH0/N9AF5aLk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(376002)(39860400002)(366004)(396003)(2906002)(54906003)(316002)(71200400001)(6916009)(31686004)(122000001)(478600001)(36756003)(2616005)(38100700002)(186003)(7416002)(91956017)(66556008)(6486002)(5660300002)(8936002)(66476007)(107886003)(86362001)(53546011)(38070700005)(8676002)(64756008)(66446008)(66946007)(83380400001)(6512007)(26005)(41300700001)(6506007)(4326008)(31696002)(76116006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkxFeFUwdk5sMkVHU1FOeGg4cHhuczFQTEdtV2FGY3NnVTU4K2g5V1loUjR3?=
 =?utf-8?B?WGdka3hWK0MwNVZBampJekdUbjFIL1J0dVN1QjRUTUxVRUhaZFora0QwcS9l?=
 =?utf-8?B?ZFFFSTQ5QmZSNWIzb0tBNEp2LzNXK3QrMWpxMGdXTDE4amh5ZWpIcG1oczVH?=
 =?utf-8?B?Z1Rxc3hYU3BBNXFFOVplaWltT3piSXRvYnVxSjE3OXN6bmc0aHRtR3dvQzBy?=
 =?utf-8?B?K296QXVaam5mVEZWeE1FTUZxb016VVlxZ3gzaERIQk11RGQzYkhxM1lXUVBo?=
 =?utf-8?B?Umk1YktVWDlubEpPZWtwRjhnUGVaUDgydWpXV1NVKzhnTWhBMms1YnZOODFJ?=
 =?utf-8?B?V3ZSWS9NcnVzN2JpYjZPZGhjV1l1Vno0KzFkU2I5d01tSGgrNm1vcjltU0tl?=
 =?utf-8?B?dU5UempTZ1pUUTdkUFlka3cxWVJmVndBcGFXV29PdXYyc0h2OHIycFZQOHYz?=
 =?utf-8?B?RVdYSks5SktJUnVhQWdBOUh5VFlKTUpkUG83Tm5QTFhkaG95RGJySlJrVVdV?=
 =?utf-8?B?SzBmOUZ0Z1BtYUh0TFFWSmlRRTVZR1NHUk1nVFFTOVp6Q1FXaTZBb1dldlZt?=
 =?utf-8?B?NjBjNUxDc1ZWM3VIaTZ1UzBqdkcwakh1SVBQdm9BQ3RNWVVuNGNrRzVSTlYx?=
 =?utf-8?B?MXVVVDJQL3JQd0ExbVpmSE5FOGRGREQwZ2tsbEl4Yjk2NHhvT0F0ekEwR1l6?=
 =?utf-8?B?R1JhaTR2NjY2MldoMXF1TXVzS2xMem93RTBaSHpROUpGWHYyNTNPUHpBeVhu?=
 =?utf-8?B?QzlJVW5RQ2Q5MWlsak16R1Z3WjR3Q2NPMDdoZW5KY1kwWDd6alovdzFYTC9s?=
 =?utf-8?B?NWRDbzQrclRsUDdlcXFWVml2MUpEYmpZRDNSd2dwUlNOYnNEd1RaT2tYQTFw?=
 =?utf-8?B?d1Y1MlBCQUUwUUsxaFpSK2w0S3NBaTBkSzl1N0xSWElmS0o2eWhkY3dqUjB5?=
 =?utf-8?B?b1RPQkgySEU4YVptWHE0L1pIbDgySzNueVJwa3l4aDF4RXl6YVFRaGNRVVpX?=
 =?utf-8?B?QWkrc25wc1hrcGhIdUNnZ3o4VFlnVjRjZTRIYm5ub2NEV0U2TUhNNEhDaXFG?=
 =?utf-8?B?V2hUaytjZ29xYWh3YTMvbmZBQjNvRUpPZkRCQzNCOWpVb3REQXhJUHZibmVw?=
 =?utf-8?B?eXdLTUNtSmRnWGZWNTR1bUpSUjF2YzFSWDhLOU1adWJrd01HTEJRaU8wcDJ0?=
 =?utf-8?B?ZlV3SW84RTFjNjVwMWFIN0FkZWoxWkc4WmkrM1NXWjdNTm82Zkd5VjZPa29n?=
 =?utf-8?B?VStmMmRYUzdDQVgrdVhSSmFFZlpXQUxzbE4xdzd6MFJTcm1YQ2wvZDZiUzIz?=
 =?utf-8?B?eXVpbnZ1aHpGdDF3WnhXZzdJcTZ6T0VCTjZpL0NybG40STJZWVQxd0hoc21s?=
 =?utf-8?B?ZC9aY1U3ZDQzZ1g0eUtOS3BrRjl1cllod2YrVzRFMTF2RmEvQWszK3pSUTBV?=
 =?utf-8?B?S3VFOVRRTENka2VnYThUZmFnSzBHWHpLeGlBUGxReU9zcGZpRnVRN0JHSUZX?=
 =?utf-8?B?UFdPZDYzdGlib1lscDZ6M0hvMUpXOVNVQTlDSHNqM1QwSE5oUjhuSzZXU0d4?=
 =?utf-8?B?NEI2a29CUDNUSHkySm1CczhSUS80SHhGVHNJZncyQ0xXSzlSRXh3Yll1amlw?=
 =?utf-8?B?S2QzTnA5VS9HTGYwWG5LSWtUWXNnR0lCdyt5N1oxeXJNM0lwM01DNUdLcUtv?=
 =?utf-8?B?WkRRVjZXSk5sZU5lQVNqZ3FIS1hQTEtPdXRZcVZNNi9Qdms4eXNXYW04NWVB?=
 =?utf-8?B?SEdMV0d6Z2VYdG9HenprTFBSdlpoV3VUdkJqYzBlekliNGVHaDZxV3owL0F3?=
 =?utf-8?B?Q1pMNENUaURuT3cvMmFkdWxvSjkxaGVndksvUWEvZ0RFS1dyZUo3dld5Qnpi?=
 =?utf-8?B?U2FQYXhlakFoU25DbU9sSERhMmY0RXFDTXVnczlhTFpmSEdwbTlkNkZhWHVl?=
 =?utf-8?B?ZGFzdmJaMnNUZytza1VRMUdrSGxLcFZFc0pOSUo0UkJ5WVd0THAzNmR2aW9n?=
 =?utf-8?B?aFd5TFF6dXZsUnNHUWFwcDFHczRTM2xhVTlsQzEzc25WRE1vYW84OExwYkZH?=
 =?utf-8?B?anhUNGhFQ3VyeEx4ckk0YlY5aHZ3VFNEUFVteVVEMW9ZSXR6T0VmcHJRSTJW?=
 =?utf-8?B?MWcwcFNZUDUrU2pEaWhqTVUxQm51MFJBTVhGWUsxaEc0OUVGekpaNDlpTEFK?=
 =?utf-8?B?Ync9PQ==?=
Content-ID: <C2EFEC3CC58D184682B7DE6B762A0B99@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2926f185-e748-48b9-b198-08da5a26aeb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 23:25:41.1950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E1GF/u7dlmeoQeT4wGlfTLxwrRmzgugA0c0bWr6+iA5P+E5K5wV5aqUsHiLJZYXGEeYMdRm2YfltUhFag92fIgeIr0SFcNm4Kya1mDyjumI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB2054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_162549_842382_B64DC62E 
X-CRM114-Status: GOOD (  15.24  )
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

On 29/06/2022 21:32, Conor.Dooley@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 29/06/2022 20:54, Sudeep Holla wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On Wed, Jun 29, 2022 at 07:39:43PM +0000, Conor.Dooley@microchip.com wrote:
>>> On 29/06/2022 19:42, Sudeep Holla wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On Wed, Jun 29, 2022 at 06:18:25PM +0000, Conor.Dooley@microchip.com wrote:
>>>>>
>>>>> No, no it doesn't. Not sure what I was thinking there.
>>>>> Prob tested that on the the last commit that bisect tested
>>>>> rather than the one it pointed out the problem was with.
>>>>>
>>>>> Either way, boot is broken in -next.
>>>>>
>>>>
>>>> Can you check if the below fixes the issue?
>>>
>>> Unfortunately, no joy.
>>> Applied to a HEAD of 3b23bb2573e6 ("arch_topology: Use the
>>> last level cache information from the cacheinfo").
>>
>> That's bad. Does the system boot with
>> Commit 2f7b757eb69d ("arch_topology: Add support to parse and detect cache
>> attributes") ?
> 
> It does.

FWIW boot log of the failure:

[    0.000000] Linux version 5.19.0-rc4-00009-g3b23bb2573e6-dirty (conor@) (riscv64-unknown-linux-gnu-gcc (g5964b5cd727) 11.1.0, GNU ld (GNU Binutils) 2.37) #1 SMP Thu Jun 30 00:22:42 IST 2022
[    0.000000] OF: fdt: Ignoring memory range 0x80000000 - 0x80200000
[    0.000000] Machine model: Microchip PolarFire-SoC Icicle Kit
[    0.000000] earlycon: ns16550a0 at MMIO32 0x0000000020100000 (options '115200n8')
[    0.000000] printk: bootconsole [ns16550a0] enabled
[    0.000000] printk: debug: skip boot console de-registration.
[    0.000000] efi: UEFI not found.
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000080200000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x000000103fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080200000-0x00000000adffffff]
[    0.000000]   node   0: [mem 0x0000001000000000-0x000000103fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080200000-0x000000103fffffff]
[    0.000000] On node 0, zone Normal: 16064512 pages in unavailable ranges
[    0.000000] SBI specification v0.3 detected
[    0.000000] SBI implementation ID=0x1 Version=0x9
[    0.000000] SBI TIME extension detected
[    0.000000] SBI IPI extension detected
[    0.000000] SBI RFENCE extension detected
[    0.000000] SBI HSM extension detected
[    0.000000] CPU with hartid=0 is not available
[    0.000000] CPU with hartid=0 is not available
[    0.000000] riscv: base ISA extensions acdfim
[    0.000000] riscv: ELF capabilities acdfim
[    0.000000] percpu: Embedded 18 pages/cpu s34104 r8192 d31432 u73728
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 224263
[    0.000000] Kernel command line: earlycon keep_bootcon
[    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] software IO TLB: mapped [mem 0x00000000aa000000-0x00000000ae000000] (64MB)
[    0.000000] Virtual kernel memory layout:
[    0.000000]       fixmap : 0xffffffc6fee00000 - 0xffffffc6ff000000   (2048 kB)
[    0.000000]       pci io : 0xffffffc6ff000000 - 0xffffffc700000000   (  16 MB)
[    0.000000]      vmemmap : 0xffffffc700000000 - 0xffffffc800000000   (4096 MB)
[    0.000000]      vmalloc : 0xffffffc800000000 - 0xffffffd800000000   (  64 GB)
[    0.000000]       lowmem : 0xffffffd800000000 - 0xffffffe7bfe00000   (  62 GB)
[    0.000000]       kernel : 0xffffffff80000000 - 0xffffffffffffffff   (2047 MB)
[    0.000000] Memory: 807748K/1800192K available (6523K kernel code, 4857K rwdata, 2048K rodata, 2171K init, 396K bss, 992444K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=4.
[    0.000000] rcu:     RCU debug extended QS entry/exit.
[    0.000000]  Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] CPU with hartid=0 is not available
[    0.000000] riscv-intc: unable to find hart id for /cpus/cpu@0/interrupt-controller
[    0.000000] riscv-intc: 64 local interrupts mapped
[    0.000000] plic: interrupt-controller@c000000: mapped 186 interrupts with 4 handlers for 9 contexts.
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] riscv_timer_init_dt: Registering clocksource cpuid [0] hartid [4]
[    0.000000] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x1d854df40, max_idle_ns: 3526361616960 ns
[    0.000003] sched_clock: 64 bits at 1000kHz, resolution 1000ns, wraps every 2199023255500ns
[    0.009639] Console: colour dummy device 80x25
[    0.014583] printk: console [tty0] enabled
[    0.019220] Calibrating delay loop (skipped), value calculated using timer frequency.. 2.00 BogoMIPS (lpj=4000)
[    0.030377] pid_max: default: 32768 minimum: 301
[    0.035905] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.044169] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.057018] cblist_init_generic: Setting adjustable number of callback queues.
[    0.065031] cblist_init_generic: Setting shift to 2 and lim to 1.
[    0.072068] riscv: ELF compat mode failed
[    0.072084] ASID allocator disabled (0 bits)
[    0.081558] rcu: Hierarchical SRCU implementation.
[    0.087482] EFI services will not be available.
[    0.093816] smp: Bringing up secondary CPUs ...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
