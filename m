Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA329C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 12:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJ9OJg9l2sD+0TBiPQHzENd9CUo4O8DAAKiTUT0fsS8=; b=2JkhXv2YPNtWmi
	YFjyP3GIzBdyLbLT7otXQFZQSi0FiCbha2a5pvEN6O5Zn4iJGY7d/Xi9Dk59Sspk+OM55gquN3djQ
	jux+2Xgi8BRkEtoxPwecqnO5/RDEn9G/OeIWa7Otml1Dkz1fuUNO05usYteOGkQ6E9ME2nL1cS03J
	IwLFvUds+7LQE3yQx69zaYjh0LM8jMeK6xC52KeWLO3b+b73bfXEZkf10cGgRhsuPypEdTKpBgfw9
	2XAjHSkqvZ1wxsOZDO3h5lp2cjrd3vtSepZ3Qgn15Q67UXvNCS2SSjbeicy74NCMenLJjWXBITLUD
	eMbFgdelrbU9Kf7u9wSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqa9Q-00AJpa-S1; Fri, 26 Nov 2021 12:16:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqZjH-00ADuD-Vl
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 11:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637927363; x=1669463363;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=o+XAUboNHNDitFaNQ57ANBnJ/kXPjR3OsEHh2kR4m+k=;
 b=ZqPxHlcXTZS1VkvmN5wqzn5VG5Gvql6W6rFZPO/vk7urfRUKKypqNUHY
 XD9qfmMhFz4i/xKHCBlFnGXkFetYT7NzTnbF2FxOmB/GJgOzA44y6Il6/
 lmxH6l6dcqSps5Id69RbrVNc8buCpE1FU/xL4qrgdvYeQ8Z1AXo66f/jJ
 Lal2NULeNfVbqultq156UKjuGzmg9VLWPCRCkXYWykqvKutjHCJ62R1fK
 XvnU5buhbq3imLQ2yfsg/EYqepGQuQJobPYQZ0aYA3gOGH4w6A6Y2yScK
 uq5UiJoyh/5ct30YPMt9d16hJiZ7DwLUhjrZoTptogdgoTBpcUYDWsaFz g==;
IronPort-SDR: aS78WiBdHhzcVnAZcD3rldBOhad7JDxesNBvw6a4P7fA+b+UU5ohoLdoGcUsUbUm8WOc9loq/m
 0DrmYXZNrc3RY+3vTo/CINCo3eiWyCFZRqfg7AgALyEbXeU7ThvLkTPSAmlIMMkG7s/5seU1Uu
 PSMVDohDew00cMWsMblISlS8LV8NqcJGhkK/tRFrHbzq1SlAMTZg0WmkHUGezi0CiO49cxbzvY
 lACrCNABUxdYXcWUBCGlKSQW4db3BvwNtVDgqmlFTNW7vOCiUo/WzD9ra2sYPwRUkwTgd419CJ
 icB2u5ot7DDs1E6gk2SgzLBO
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; d="scan'208";a="137811988"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Nov 2021 04:49:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 26 Nov 2021 04:49:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 26 Nov 2021 04:49:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+ZYYy7Fgu7E2eY1TYqxKbCUZSlW9mr+uclRMxoGm4HaLve65j9TGdQMGzqG6Cv2sHNDOepb830R9vV7ti7z4JIlRgWBejl3Iud222VwFc/iTFKUvzin3SZcCYCLUQ0lJtngSLLv4MbkYxJ7M5QrsfhJ6+tlY4c7ZdFFX3IY5Ou/6kT8FcNBlwxflXlit+ubeT7wh0VM0IqdukgIjs2YckOqm1u2wEaIS9RCww+TLS/7etmYI+DYGssqW36sM/J+LufFLB+RoISbzvhVROy7Qba9boXIWRjjDS+qmx0/uTCyYCM9KXDeoWTlznjWnBcXYt5gcYonyloEM7/vU2DKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+XAUboNHNDitFaNQ57ANBnJ/kXPjR3OsEHh2kR4m+k=;
 b=J9JKPNMxJmlKVkcmUG72YfCDDbwP1qlouHEIIbyTTr4uvz3DQAt/aHZgWCoIC9I/243323OvBCYkAZHkoDpfRzOOd8qHWt2stOoJqGrpGG5IrmW4ZOxVmmcv6TGeSTkp+MVXmebRVQXW201yUj522jLaekjXTXwv/T7zaeLouccLaaYCHIHCtB+UNMQfan1YLgJidmSFa6QoAaI2aS8lcjOsvRwIRBHSkVqq5uzasxLa0EEE/mvia42l1/lYHb4a1NijCAAhwY0yBoi9ritJsfeu3IBKQf3MPh3OegwWnCfqwBWuT2CfkU36nY/QzA7TjuCXB3BZLuXe35Yp6TiRRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+XAUboNHNDitFaNQ57ANBnJ/kXPjR3OsEHh2kR4m+k=;
 b=XQxPU+IIEZOqc2Wcv1NezHvzCm3I07KwxjnvzsfnZUQbm6eLOpTsGpcvvGgbiTqC3sOPXTrM7v6kTkwo9X3Qu0mp6NWUo9Fep+twSRO3GAqMMJNEp4Uof9UVBsqq77y2zVASonQ0FlSGVhAQDSfccCTeQvb0qEvNmf3QAYGWAn0=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB2063.namprd11.prod.outlook.com (2603:10b6:300:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 26 Nov
 2021 11:49:20 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f579:5f0c:dfab:2d27]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f579:5f0c:dfab:2d27%6]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 11:49:20 +0000
From: <Conor.Dooley@microchip.com>
To: <geert@linux-m68k.org>, <robh+dt@kernel.org>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <damien.lemoal@wdc.com>,
 <Lewis.Hanly@microchip.com>, <krzysztof.kozlowski@canonical.com>
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 5/9] riscv: dts: microchip: mpfs: Fix PLIC node
Thread-Topic: [PATCH 5/9] riscv: dts: microchip: mpfs: Fix PLIC node
Thread-Index: AQHX4hGNiujraa6BckKJbvXcGzkmoawVs4wA
Date: Fri, 26 Nov 2021 11:49:20 +0000
Message-ID: <b5e1bed1-171f-42b8-bfbf-09ec0a417066@microchip.com>
References: <20211125153131.163533-1-geert@linux-m68k.org>
 <20211125153131.163533-6-geert@linux-m68k.org>
In-Reply-To: <20211125153131.163533-6-geert@linux-m68k.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38ce6f24-4c13-4e3e-0552-08d9b0d2c8ca
x-ms-traffictypediagnostic: MWHPR11MB2063:
x-microsoft-antispam-prvs: <MWHPR11MB206357DBDAE6391C66B74FDC98639@MWHPR11MB2063.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vtm8IdnBaN8dVeT0u2KAWGh1VT9ViaKvlwj4eWAuXgiiun4B/Qy7rZ5rssFrQ9IWXMGG4OVvd0ywxNnzD5aLgDOavReg+XjR2O7K7oKlXkQNv8m4pl/4MN8BRRN6C7NKJboBZmsREamWSwcvG36ebDnvrzh6Ya0zqnpULAvR//94jeGTeOfN6g1KGhHNM3Z739Bq57+auOLiiA2I9aXPPNHtCUf2qvhO9napBeFxFEgwtgCFr3m66rNH+hVmjG2EMEdRDDtT4IlHvC2u0gLT5jUKvDxjhoS/Q+PdssDkeLYSAgMKUbh8u98+y27h/DPAMstKyeDxi1uFEC6Rvb09edt6zDX7z+dwTPaJhuPHlc/EuHt0c2HGLfOlNYBYeHiNgqI49tt6KtbZSRGgUMMBpg/sE8wl+QgbISrTKz+12nV/wH5qUxWT4EI+QpEvADH9EgFv19Aw9bpcpuqb+qqkSUhGZtnnXAnPDAh77k3ZvD3dekEvpfMV7S2G9CZQAPLH6TURP6gQRA37tyD1+7/T6vnmUpBTHutR/DphuvRl6HlFOJCRd3fMONHI/p0c5x7cuf9b9DMDxmozwSlsL31M2O1juVMMDiyDnlhBjqAXOZBCalXRyqA3waPPBoCSjpOaH2swrSVZBu9hUYxsYHVYrXnoLCh1+dIw4/8xyyNsvZqfL8q/3jz1Ng4iToxc2hh/O/tYJL5r7eValY3i4WfbDFYn/HxqwviAnewgTPuyH0CtXtXOBYlyAKF9x55V3BLcQYrNU5pLi6e39skdxmIP+w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(508600001)(86362001)(110136005)(8936002)(54906003)(2906002)(38100700002)(83380400001)(53546011)(5660300002)(8676002)(71200400001)(2616005)(6512007)(316002)(4326008)(186003)(122000001)(66446008)(66476007)(66556008)(38070700005)(66946007)(91956017)(76116006)(64756008)(6486002)(31696002)(6506007)(31686004)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDBNT1haSG5hUnVsU1ZGSmhiRWhWa0dIM1prZGNiZUY3WVA0RWg2NWZHRUsr?=
 =?utf-8?B?REdEWVhTTW1qSVJJQURiQ0xPQmNLbCtUSzRqcVptaDhZVzVaU2xZaGYxMmxQ?=
 =?utf-8?B?bm5MMGMvVnpUU1V2NE8wVjlYaThWcVphN2RKcnhMK2xGZTRqVmdWbmNCM1VV?=
 =?utf-8?B?ZVl0eGJucGV6VmRHODdZSER5eisxaHFNYk42Q3VZTndQMWIyMnZsNG5qQWFl?=
 =?utf-8?B?cnY5eEVndjU5dy9wbHFubmxsakpjWW4wU1dGMjJJaXp6S1ZrdUdWT2pqTGs3?=
 =?utf-8?B?WFFPeXhIalhYUFRtQmN6T2RGd09sZzc4U082TnNNZDd1enkyVEFaUXNPcXZG?=
 =?utf-8?B?SUFBTDRaNXhtaVROTkF0emszOGhmbGNNU1U5UkxCV0JVck9TblhYbGdPU0tK?=
 =?utf-8?B?RTZrVDdPNjhhdzBMTlcyUTdIYjUyYlZ1alB4bWp0UHpoODZ4TG42dGVNN0hD?=
 =?utf-8?B?NkhLS1Z2Nnp3ekg3eXFhTzd2aHRUY3BlUFFTSmwya25NN3g3bERRRWd2RVVM?=
 =?utf-8?B?eVZkaWlTQU0rQmx0bE5qVHhML3NtRlpTNFAwaUtGTFRNRThQUWRBUjlGSHFq?=
 =?utf-8?B?WWVGYTl6UUMyRy9BUFZOTmYzODk0Yi9GV2pKS0RkbHJZa1gydGdlam9lV1Fm?=
 =?utf-8?B?d3FvOFJOZjdlYWdXZGxSMGVWSW1Ha2VRVjd2em9qZXdYMVRueG5telMzZFdE?=
 =?utf-8?B?M1RQRStYY3RvSmtFclZURnVVTjRSRkJmWjJnaHdiUTNqZEZzTGFDMHQ5b0Zx?=
 =?utf-8?B?b3FqZnV0Tkx0L0VOeVloK0l2QWF5WkxJWFc5OHh5VGFVUU8vSkphMlk4dFpJ?=
 =?utf-8?B?NlRUK1JvTVlNWjU5emd3bGxaSGdLeEFhd3pwN2lhckJKUUxOZ0tLc0tiRk1V?=
 =?utf-8?B?UjlDQmtITlArWktlOVB5MndoTFRVR1dTcDRQaTQ4aGp3dTlLUmRDM1p6emlr?=
 =?utf-8?B?VzQ3Q0FiWnNHNm5oYUN6Qm1IbUZtZnRZUU5UcVMrMmhTdDRkZGhVUFRxTTl6?=
 =?utf-8?B?RTF1MzBrajlCZTRoeTY1Y2xCbnFBR2psVXVkYnJOaEk0bjl6bUwzdlhKT1Ev?=
 =?utf-8?B?L1dxZ2FnNnMvSkV5R3pXanlLcytoTUdXSVYycjR3bGlVcTlMc3E5S3ZBMlFR?=
 =?utf-8?B?QitrTTc4SW9zdUdXUVBnQUtjZkxPU0NZVG5xVmhYKzBEajF6V0l5R2crbnJo?=
 =?utf-8?B?czBiaG1JMWs3NkdCNkxvWm5DUDhaL0ZBY01OZ2hWUEZBWXNvZ1dxU3RFS0RE?=
 =?utf-8?B?VXdmU1ZNaDhlMmZhUjgrOEdZU0IrOGdLRVU4Z1ZjVllXSFd2OTJKUi9nS3U2?=
 =?utf-8?B?QXBpOEg1S295V1ZRb0pQL1BvSDdjbE12RnozamFrVHZ5WmJMQVVDaDhkeGUr?=
 =?utf-8?B?SnBOeFZIQWZrR1c0cDRUaTNyZnFsa0FTbXM0WU9udHFJR0JUNzRQRGtIZE4r?=
 =?utf-8?B?eElrTjVFYlZKdCs0L2pFUCtNTzBCeGFDcTVvMVl0eEdPZmI5czYxWHFFVGtk?=
 =?utf-8?B?OGFYTUppL3Q1bmxGdEpKQ0RrMnhNR2orSHg5SHMvbWdtYyttOVEyWDNVOW92?=
 =?utf-8?B?dTJMSHlMdE1YeE45TXI2ZURvZHk2d0dyemowSStiV0kzaUZQNGRXem0xQ20v?=
 =?utf-8?B?TGx0K3AzbGVzOWxaYjdJSUtSdVlSa1Azc3RIM2xIekZ2UDR6OXhReGd0K2Zt?=
 =?utf-8?B?Z3RxaFVtT0srVFJZNXVJdXJlSGgrK282M2l4VGIwcURmSmcweDBwbWlpeS94?=
 =?utf-8?B?YmNJUkdyRG5hZUZPZnphd01iS043V0MwZi81bE9JMUFlWFdyMFZ0Z1Y0bVhS?=
 =?utf-8?B?YXI5bngwb1JId2Z5anFrQlIyOVFFd2ZpTTZPSVFlRmREQXBlR1I1Qm4xYWIr?=
 =?utf-8?B?NHl1YkJzZTc2bVFtT1VLMk5iSHZCWFBxVG9VY2FwWi81bTR4ZEdqak1oQk9k?=
 =?utf-8?B?a0ozUXpJdVFDNWVuWkpTaFVlUXdZT3hac2xKcGplNVcyMzZkQ1V0Y2JyaDEw?=
 =?utf-8?B?d0RUaU50S2ZMTDhWWVFXQ2dNdDZMUTk2NEFxOFF6SWorTCs2TVpPUWs3dUs1?=
 =?utf-8?B?ajh0UC9jTGJDMUU0NW13T0ZUbisxZUZuTTc3Y0JtSzNCeVBKQWZwZUJDRFJa?=
 =?utf-8?B?Um1QN3VhLzRtL2RuejY5VE5FbHdzZCtMcHhrc2VXeU9kd0FLM25uRUNURmE1?=
 =?utf-8?B?dzVxaGQ2ZDZtRy90dFRSbGhVb1NEM3M5eEp3alRZUTR5cXk2OURWK3ZZSHZs?=
 =?utf-8?B?VTBvbU1tU3JnNzY3SU10NXdDRFdnPT0=?=
Content-ID: <4D65BC4BEB899A48A729E1036F3E5044@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ce6f24-4c13-4e3e-0552-08d9b0d2c8ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2021 11:49:20.6694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pEuGtRTna5FgoNoJwqOfuwj9ycuuu8bU/YJMpj9obcpm6mXqa1GIQwBMh1WfKBkhbc5EaJqyLH5TzxzNI9qTkgYh81LGFcweZkX/6THkvj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_034924_123199_53288C46 
X-CRM114-Status: GOOD (  15.52  )
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

On 25/11/2021 15:31, Geert Uytterhoeven wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Fix the device node for the Platform-Level Interrupt Controller (PLIC):
>    - Add missing "#address-cells" property,
>    - Sort properties according to DT bindings.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>   arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


> 
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index d91226bfa586cda7..c71d2d682fc0a0e7 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -168,16 +168,17 @@ clint@2000000 {
>                  };
> 
>                  plic: interrupt-controller@c000000 {
> -                       #interrupt-cells = <1>;
>                          compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
>                          reg = <0x0 0xc000000 0x0 0x4000000>;
> -                       riscv,ndev = <186>;
> +                       #address-cells = <0>;
> +                       #interrupt-cells = <1>;
>                          interrupt-controller;
>                          interrupts-extended = <&cpu0_intc 11>,
>                                                <&cpu1_intc 11>, <&cpu1_intc 9>,
>                                                <&cpu2_intc 11>, <&cpu2_intc 9>,
>                                                <&cpu3_intc 11>, <&cpu3_intc 9>,
>                                                <&cpu4_intc 11>, <&cpu4_intc 9>;
> +                       riscv,ndev = <186>;
>                  };
> 
>                  dma@3000000 {
> --
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
