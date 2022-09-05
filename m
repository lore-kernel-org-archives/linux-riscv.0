Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3E3ECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 19:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/CkJcZBvNq2nG6O++Mla52eealqz3vyFiVRtfcP/rgc=; b=fSO6Vjm2Bc9i71
	8VlNJ0ifQ3+yuuXZUt/omxnmTzouYGZxPm/YF8XORM+QuGVpH2Iji4Y/Pl35N4Rroq7Erzvg+7Xsm
	1oh9b0IEpqc0jrO41BlkdIRHpJow1+sj1jz5EXV1hkl2BY2jYHd3mLCRRfiPl2bT401swDA8L66S1
	Bl5YN5lieUm5Z/5huvj3hWaXPAiH0dxLjJ0eXEKD4uC5oj6bmhzpDTIYzcCHlhVCxiZg8fkt6UzGh
	3KY7KYj5drlDtWGPESR8i/nKdjfsusMSpIKIDGLErBRD5Ttrt6PxEpkW9he71wq/ai1lgdL0S5WqH
	1k1x7LfugbYfkOu9tbQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVHZA-0094ik-Sw; Mon, 05 Sep 2022 19:15:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVGem-008Fsj-T9
	for linux-riscv@bombadil.infradead.org; Mon, 05 Sep 2022 18:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:
	From:Sender:Reply-To:Cc:Content-Description;
	bh=qKRfMPTXXVCe2s/Wh4JJANkRsrtQzMlHM2YmXjSQsdA=; b=U7HkIdyOUljo8svkkswwJ1LVf2
	CzaIlWCIiUKh40eFU+GVWl9e1AY/gkbUueDniItx5152COtqudzv5IumBwcqzn948Y+cpG2adKaSl
	/axPSrvS8WfSiGL9L8hFHIISbfjV+auRrWRX5RC3xsfAc65DLqurNg7NMvXSeowIBQfLg9N2lDdT2
	QUWtCS0nKAsxcI0Rw9cTslDuzt2cgpyrgfrstjmjaSE4omQwK05RkaOeVEdnV8Q2e5JT99I75bSVQ
	RRivZk0r+jGa73S4vdR8ExTrpjYKuXPPBn8Ac2FUzKausgUfGedyx1i8VJ6w8yjSaJxRRmi0RiSDX
	/C2B1T8g==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVGYe-009uEs-CT
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 18:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662401452; x=1693937452;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=qKRfMPTXXVCe2s/Wh4JJANkRsrtQzMlHM2YmXjSQsdA=;
  b=x+ZpkI4LEzqhh7cxK2uGPqBZ8L93Qla4CMIWR1g1Fz+j7vYBpnkW/4VA
   hmGM1DKo37vMWgumx+Ys86gre/R2KF+zcoeNHsN1BnJCzn6TiHYO0nJ0+
   qELiwtiN5Cx94kZ2zSDg9R1HVBepynXxZKuyd/5j0P9edcihX2gM1jl+q
   6VBeL9eRvVV76lxrIm3CDyuTmnByAXTFgo8JfGf8MIXErCtq1ZAFISV5/
   ZcuVpEwmctWovgTKLTrGFCePYrDMkCNhilSoKZhDn1Jz1EVrPDUg3V9u/
   mFigeLppgxHg4oJ0+2L7DxOi2+BRnOumIMmF5+v/fKDp8gtvE0T8CgASf
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="179244315"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Sep 2022 11:10:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 5 Sep 2022 11:10:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 5 Sep 2022 11:10:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFFLIat2Ucx/ITdKXXSrJI9kcxdqhCsDs3m1pqYcTmQvbRcdQNRusUiOS+j3ZuCEHGvGOUx0PUBo8hixlq26tXtCb109t0hzqKdj+gqOM92259cSZmbU4D9XuRXZd38dIgCvRS0j/U2whWr8c33yo+tfCEZM2vfnWKj9+oyICYxMIiN66Yk/cdLnZNGizK4uztD+vFEfjiX9k0SXIgK38y5kxPXsVmw0HUHnmFRrtAmaEr7v+2SaASgJuXlksQs4ZV6vanT529ZoqU0rFfIw9p0+1iDuOu9poecoz2IeDrEA86GlhFvuwEpH710+hjXu9AKcEvQ72mOnE4gK19S8hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKRfMPTXXVCe2s/Wh4JJANkRsrtQzMlHM2YmXjSQsdA=;
 b=YS8klOf9si9tqSVQS6EzxvjMKc7/Hc3tj+6osxiQ7nWyYPKYpnBhPnTGfQJKwHQEHwaGvyVmmggSyaFq5hIG6vtU4w41HQLf6jK4ozHl3pfM/dHW9GSRE2NCe2O4Ud15wtmNbBuUdDm7n+qkRBqVY93bLu4luMjOYhMCC0F/Lc8xsSA2IRnNyg3MxUod3q9mgXk/yczHAXmu8XGa0XjP7HvL7ooxWXBahnOHnYJw7b1EFkg0w+HvN3bC8bCSGT0hZXCPuZ6Eooqhqq5lwT2NLDxZQNo16Rhsyq1aPZj0zomSJwldSix8/M9+O6+/Xm7IABeF6s3G0NAmZ8Qmx0vRzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKRfMPTXXVCe2s/Wh4JJANkRsrtQzMlHM2YmXjSQsdA=;
 b=quAkMQd5CIFvfmGLJ4fJieAf6DvaP4kslB5lG9G/lGeELIgZlBx6UrpCoFiroiT94PrbIxPAfXOO419bR6K+VKMjT4Q+dY02G+r2QFhq30vBqDozvRD2Vv85noSSwA1B4zww8xDknfxp7rXaPEKPmpuxmKzaH4H3a+I5MCf3QAA=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB3013.namprd11.prod.outlook.com (2603:10b6:a03:8b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 5 Sep
 2022 18:10:40 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 18:10:40 +0000
From: <Conor.Dooley@microchip.com>
To: <zong.li@sifive.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<greentime.hu@sifive.com>, <ben.dooks@sifive.com>, <bp@alien8.de>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] soc: sifive: ccache: Rename SiFive L2 cache to
 Composable cache.
Thread-Topic: [PATCH v2 2/6] soc: sifive: ccache: Rename SiFive L2 cache to
 Composable cache.
Thread-Index: AQHYwQIC51d6t8FVA0+5gd672Syjta3RI5eA
Date: Mon, 5 Sep 2022 18:10:40 +0000
Message-ID: <26246d03-a0dc-8f36-2ac1-daa60d47a057@microchip.com>
References: <20220905083125.29426-1-zong.li@sifive.com>
 <20220905083125.29426-3-zong.li@sifive.com>
In-Reply-To: <20220905083125.29426-3-zong.li@sifive.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63ec390d-12b7-4dc3-61c7-08da8f69f101
x-ms-traffictypediagnostic: BYAPR11MB3013:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kgVzqxPpY0eTrG9x6vUZ1Mgne7DgaMCa+bdYiaTQ+Q0FHIasO8MXNcCjS+yQ9Aro0jty3l1gKVIYJ65RIKTgX1sGz/FApwsIkLs9OiRBOb78uqVK6VphG2FvuTBYGZKQISfLrD5co18fvUCh30sJ16Vwr/zn0kxELBWsxiHILC/qJJX7ff/QLLbZzYiT6bUi8e+NHz+z5QJsmAXmFXuhu5LF/oO3nY88VDBwTEBLnEXCXge5eO6jSN+dDDjx4NmwWG2YI914fLSKllcaq0UbrbmLhb58oLoc8czEfkhx/nlOqjNbRsLjZH8IT1ewlHoO8nR5WZ2KZP5tsaTCtURrszK0bxyXj6no/mDECTLv6qJkRWWvIzIenDj/ZUhR2iIGIqy00AhCjZU4BM4iNPcSRZXfx0YNP0bGKli9cTnWT527tS5b3htx6km62VRuEMmF6IYaMhTZCUi4Kb2wAX8v6TGNgPWCc6BlVPvBSuAlnn3iN3uQdV5YB2GBg9UchJ6VuwxsSTBlikC3ucUarNvuxBwTRbbnzqoA9Kmc7ba/H8xUgd6J0nq1dRKHt8sW9596EWKI3/XtjvtL4T7MGOwfv40XX6D5N+/dtaKgcPPie71XxJnwFAq1EsxxCQWgPKRavVgBO37xDENLjZdgZDRS2phBwssknDEkhnH4Oz39JtIaz0NakJAJUv2xKHb6PYbXKw+uH8c11M3i8JG5OGXnSV8NikzzoRe2TfaGN0T6NF264nEGTRcl3e/l7eLqZqIqeIgqssnkvocjfctWqNKYoM6krAch8jbGBaKKaSSAscnA/E7afSfdHCGLdeccUPPIF88cy4laprCSFkYFNu6NyPrNauwoeT8CJQjgwf/K5KA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(6029001)(396003)(366004)(346002)(376002)(136003)(39860400002)(66446008)(71200400001)(6486002)(36756003)(66476007)(38070700005)(31686004)(31696002)(64756008)(316002)(110136005)(478600001)(122000001)(91956017)(76116006)(921005)(66556008)(8676002)(38100700002)(66946007)(26005)(8936002)(186003)(5660300002)(7416002)(41300700001)(86362001)(53546011)(6512007)(6506007)(83380400001)(2906002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akt3Z3FTZzNqbXlCdVNVWENzb3FwUjFMeExMUW1ucDBzQ1pHb0RudmlobXAr?=
 =?utf-8?B?aUpadFFqWDFJd1BsdzRXK2diaUZxditEK0pyU2xCMVV1ekdJWE5HTzlFaGFX?=
 =?utf-8?B?VkI3Y0M2N1pReUlOQ0ltREdKaVgyN0gvWmhaNjQwdXBDeko5dVd4cGFZTWRO?=
 =?utf-8?B?amorb2J5WXI0RzlucEd2NytURnFKYUNHMUVnSW9kdGhHYStMajVXekZtZnF4?=
 =?utf-8?B?NzlNZXR2RVEyM3dFTlJkbGY0ZlZUOHlHelZHK1JueHJWN1ZOM0lNY1pzeVhs?=
 =?utf-8?B?REJZSjc5aHpob1l5U0xZSUFGbSszOHNUMVE0Si9sa1VSQVlPL2xIei9FL3l2?=
 =?utf-8?B?QU41Ry9ENnZhMFEvZGk2bXFvMDRGR2JWVHh4d1BTSjYvK1ArenEwcm9JZm1Z?=
 =?utf-8?B?ZXgzaHc2MFF1aHNERXgrSjZwbnIwTTRXcTEzaVFJd3lXQnQ5Ym9IZmpzc29n?=
 =?utf-8?B?aWJOZDJYWHNuQ2gxc3B3M0ZXb1VPd29nMGExdldBWkc2MDNrR2NUV1JOTzd4?=
 =?utf-8?B?QWNhMlFrTlg0VjM2Tm1JMkdEZ2JrUE9ieFZ3TU1GcHI1a3lIUTFUWWtoRVJF?=
 =?utf-8?B?NWFlWjZSRi9vMnhjMDhyTXlOQk9zYlBXTCs3T0tuV1dZMWo0dHh0NVVIZnJD?=
 =?utf-8?B?ZjRHeC9aZHBoMTlEbmJUSTJMcnB4ODBxczNUelNxUkVxQmlTZVFnSEpsSWlp?=
 =?utf-8?B?ZjJZcUZacWZEaFRRYTArQU5USndydTAvamlrdU9ZcFEwN0daakdxRkh2V0Q3?=
 =?utf-8?B?ZVRCR3pCRk1aWlVYSzlpdlFZcnBlVThkT29yM3RDYnNJVFR0bGZGMWQreUxu?=
 =?utf-8?B?MmVZVzEyVy9PV1hTOXZrcnlSR3EzcHQxY1RpM29OR3NlKzF0VVpLMGhXRjk1?=
 =?utf-8?B?ZVRBeDQ0dVVudEJxVWhtdTJqZWRUZExXbXk2RG9aWUtVL3pqcWQrTmdYaWt3?=
 =?utf-8?B?VFZXK1BqZ3BER0paRDc1NXhZMXpad0hCRHRHVFlZdlVNblVySGdRamNKeDZ2?=
 =?utf-8?B?K0YxMjNUeVZYblFmN0tzVHdQS2FDd1NxZnZPeDdReHl2MUdITStCb3NxNzQw?=
 =?utf-8?B?ZVA1OHczV0RrRkxwTGN3TjRkWmkwaFNUMkxpRnBYaVRBTFc4M1RYWGViZlhv?=
 =?utf-8?B?clRnZnkrY3lqNFVWM0hkbDA3cGh5M2JzZDFzdDJIV0NHaXBNc0Zwd29VRVV4?=
 =?utf-8?B?ZytsWDFEalJWNEtqMlZPZCttdWxoelAvSVljbG93MGlJZE9YK1BmL3BHUldS?=
 =?utf-8?B?cFBvNnNDMGdGQ1RSNHhlcU16Q0hzbkh5WjVMZVZhZ3Jud3IyUFVRcnE4TXFB?=
 =?utf-8?B?VUJRY1N2ZHY2a0Q0ck9aV0NxMWZHbVI1eFFVb0J5NzZvaGFlZzRjdTlqTnY1?=
 =?utf-8?B?d3U5cFZIT1FTVEpuZENYNWpaYUpGTGdGVU1rVzc5SmlsNWVoSlFpUWc1RTRT?=
 =?utf-8?B?a3VYUitRSi8zanNLam9tMEZWVms2YmJMU21ZQXhYbVNFZTBBZW15bWFkU2lm?=
 =?utf-8?B?MWszenlPWXNFemlURGdYK3I5OC93YW54eEp4ZXMvN3MvRlRjRDJMb1QxWk0w?=
 =?utf-8?B?ZStTVWZPYU1ZZlk2cFI4WW5QNlNMcHI4USs4d0RKOWMycklEbUJpS1plSzJD?=
 =?utf-8?B?NVRURDB3TlIycXdsZ0tBRlZyb0JTbmdOaXJtSDh0QWRuSktaZUJaTVRza0FT?=
 =?utf-8?B?UDh1YWZTaHRsbFRUUzlEMGJ4dG4zc0tBRE1VRUtIMWpMNWhNQmluWHJNMkxB?=
 =?utf-8?B?WlNxK0lpaFgxMlEyUzNyTGhtVGRhRkRpTXNvWTdSOXRpOWxWNE9salhKQVFq?=
 =?utf-8?B?a1haOGFuWWtnWVQvbmp3RjZXQ0NzSmlKanZXK1dtMXo0N3pZTW53QVl6RUZP?=
 =?utf-8?B?VnhDdzlTZG82eG0wcGVtYzIvcmF2WndWNDd0M3dtdldldzR4QmF1cEVNMnJY?=
 =?utf-8?B?TC8wQUhpbXdXdENYR3FyODU1NlhHQUxQRVowdUdsV254QVlnN05LS05COUda?=
 =?utf-8?B?aDVzYVVWTFJTVFZkMktENGVTMkJSMCs4TWRTdzBXNEljR1d3VzN1TzhvYXEx?=
 =?utf-8?B?dGErMm8rMDFwZzBURGdEK21wRXZNMFkxMHEwdkFDd0JrdSt1UEVZZUtuZEkv?=
 =?utf-8?Q?6+Fvjk2L4cvpc9N/npvJGJ9UL?=
Content-ID: <A1DBEE8005E1E74990A3AEEE00B8582D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ec390d-12b7-4dc3-61c7-08da8f69f101
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 18:10:40.3771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KKPphCfImxDdnEBLEU7NJ5HbILmCF4wdO4HqBqeuT9nA8aAOVRBKblt3tkdf02pmhvFHmuGuH00MZFuhWzRADh4SDgsoolgJvDYDTEWsdNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_191053_309999_E3F0AC6A 
X-CRM114-Status: GOOD (  17.27  )
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

Hey Zong Li,
Couple comments on this patch.

On 05/09/2022 09:31, Zong Li wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> Since composable cache may be L3 cache if pL2 cache exists, we should use

What is a pL2 cache?

> its original name composable cache to prevent confusion.
> 
> Apart from renaming, we also add the compatible "sifive,ccache0" into ID
> table.
> 
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  drivers/soc/sifive/Kconfig                    |   6 +-
>  drivers/soc/sifive/Makefile                   |   2 +-
>  .../{sifive_l2_cache.c => sifive_ccache.c}    | 163 +++++++++---------
>  .../{sifive_l2_cache.h => sifive_ccache.h}    |  16 +-
>  4 files changed, 94 insertions(+), 93 deletions(-)
>  rename drivers/soc/sifive/{sifive_l2_cache.c => sifive_ccache.c} (35%)
>  rename include/soc/sifive/{sifive_l2_cache.h => sifive_ccache.h} (12%)

If you're going to rename the header, you need to update all references to
it too, otherwise the other user (the EDAC) is going to have build issues,
i.e. patch 6 needs to get squashed into this one.


> diff --git a/drivers/soc/sifive/sifive_l2_cache.c b/drivers/soc/sifive/sifive_ccache.c
> similarity index 35%
> rename from drivers/soc/sifive/sifive_l2_cache.c
> rename to drivers/soc/sifive/sifive_ccache.c
> index 59640a1d0b28..1b16a196547f 100644
> --- a/drivers/soc/sifive/sifive_l2_cache.c
> +++ b/drivers/soc/sifive/sifive_ccache.c

> -static const struct of_device_id sifive_l2_ids[] = {
> +static const struct of_device_id sifive_ccache_ids[] = {
>         { .compatible = "sifive,fu540-c000-ccache" },
>         { .compatible = "sifive,fu740-c000-ccache" },
> +       { .compatible = "sifive,ccache0" },
>         { /* end of table */ },

For v3, I think you should drop the , from the end of the table while
we are already editing it.
Thanks,
Conor.

>  };
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
