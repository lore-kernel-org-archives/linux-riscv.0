Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5F2C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jul 2022 16:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VyC7OaK3zT4lfKlz3UZ0S0FU/HMm7MR+TJ+hA76veBs=; b=J2MngQzHWOZJLy
	pkgK12BDOGwMoghrTPcTqHcAZFGjEb5eUhfARogeZWcmnEx1IwnnnPv//Qn4W/I/+d7Z72YP21Wmd
	5h2JTDFFSjoDNr28BQx0xlg0quXEsFJk5Dy2OkfOOWJm3DUTzUdWQVx84Uh8tR6M+waIi95EZ/7Ya
	g4smtxHHrXAAVz8v4OubV1GVhI2Fya3vUDLRKIjWNzJA9a+mfvyxgBux/+v+ZR2IPUWeHZZZKhIqP
	SUfxARo7FUW382+sHzDmDJ7E09gZzXwfFp3SZ0wOwnYOp7P85nsAE7QurWTaDZOUm3mhr22vQkRDt
	ajKow1Vi8qBmuVnUFTfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBINq-00CWO7-Uc; Tue, 12 Jul 2022 16:05:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBINf-00CWJJ-MH
	for linux-riscv@lists.infradead.org; Tue, 12 Jul 2022 16:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657641899; x=1689177899;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Wz662R5HEZqKGe6OTUxiaiQCuczgWJsYw1kfbeYrjBM=;
  b=rjnMjFUkU5RqlrPQlMi629Wf1sTb0EYviFE9dq17lb79dgswhuFulQmm
   2xMamqIrMvlKXJQfNeIdNua5WZzPMGesOIfmnpDw4S7JQcDp+aDvfZYVM
   Y6m/kXHCNhbBwq6+Lrmdx8n/OdOgHwhM8bOWlzIOWuXIHmAbayrbPh0Z+
   GeGl1ou49QqsysN8gbkwF2ZPxt5LQRe7NEJLFAYOoyyREycqr8e0hYVMx
   668fevReRq74S9/OC+6+o16NgfSG64KKqx4s4vjM7C+XH4M8dhAhLQWt+
   +PHgmnUfIdd27rcQ4AGijqZyHok0a6Wei65k8KbXK9IeVXd0AFPxAHbOE
   g==;
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="167484393"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jul 2022 09:04:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 12 Jul 2022 09:04:57 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 12 Jul 2022 09:04:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjbAZ8WJ3EAVhjNbpTaXnzfLPUJYAqXvOkxnh7sUi8l+4YOeDjnOS6rHEvv2Sg9+wTjpj+zof+UBbQh8kn2mz7GsI0+zavyZ6kpwneMfW7HETCxbb11/I+qfaZY50xSY3i9MxAQ1bzTpRuYHsuHHz86WX4bMKdaGf9TNAUhNzrzFkRUwSIYv++5mo/9aIb4p2CM4aNhtcdEaDctq8n3Pe3XAXG6Xvl3Fga1Q1Rn++kzkD/G3PCPrs+VxqazBdaNqDGZXzf8DtyPvY9s6gkXiOzt1XaCzweTFsuajWBr5UvVVVaJGQSkWx+xS8tpknSrMuehi9x4Dc4ISxEKr3l6RyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wz662R5HEZqKGe6OTUxiaiQCuczgWJsYw1kfbeYrjBM=;
 b=kImbh0w8vTo8xeqdRixZJ8CIYgAw1bXJ2ffSUS2Y7pen9FbetaCIqPquZ3Z6k3L1Jora2uDr01DwZPXZDEHURtrCmXQsqAPoxwUhEsgqVbqmhd4BUsWaxY8Is0Bk3GWjJviXzbMKBQR0HIkFi25230E4BLRdZ+lm3WF26vCtv5mOJ37ks7DutyjGQMnBixmtBlpAYXgCgcg719I6DbUJ+cveFc0vSgWFggnRCdsaLZ6CjlsTEPh025NWbpRZYLjptNNH1khuIaMkAM3zMv8r5AR1NkvttfTRDIghhj2IL+yjkhxdTxo9bqmD+j/yYgGtPsXzQGW4pdq6FKw2kf98lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wz662R5HEZqKGe6OTUxiaiQCuczgWJsYw1kfbeYrjBM=;
 b=EolufdnZjJhFqKGFzRvcdGy9uEd7SRi2Xt1N44WA2KbPBonXVWY08oFjNvYaCX9wu9IE/+JAigCVdkWoERPCOrrrExcBO9ZAvqYAIazf1SCXIHs0tQltRVmmu+wP3qtLU2aP0cizT0VLQfWq9oPp1CgGY8s2tiKWOhdGcnH9HQc=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB5919.namprd11.prod.outlook.com (2603:10b6:a03:42d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Tue, 12 Jul
 2022 16:04:55 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 16:04:55 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@rivosinc.com>, <krzysztof.kozlowski@linaro.org>,
	<Conor.Dooley@microchip.com>, <damien.lemoal@opensource.wdc.com>
CC: <daniel.lezcano@linaro.org>, <Eugeniy.Paltsev@synopsys.com>,
	<sam@ravnborg.org>, <daniel@ffwll.ch>, <paul.walmsley@sifive.com>,
	<vkoul@kernel.org>, <airlied@linux.ie>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <robh+dt@kernel.org>, <masahiroy@kernel.org>,
	<geert@linux-m68k.org>, <niklas.cassel@wdc.com>, <dillon.minfei@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <fancer.lancer@gmail.com>,
	<thierry.reding@gmail.com>
Subject: Re: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan k210
 sram controller
Thread-Topic: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan
 k210 sram controller
Thread-Index: AQHYkLmpMN95aImTj0GtIyfn+RYzcq14CA+AgAA9+YCAAqfOAIAAAWoAgAABjYA=
Date: Tue, 12 Jul 2022 16:04:55 +0000
Message-ID: <1f63684c-c549-a726-b046-1197ef94d540@microchip.com>
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <20220705215213.1802496-5-mail@conchuod.ie>
 <a516943f-3dac-70a0-3ebd-9f53fd307f25@microchip.com>
 <b8b015f0-d16f-8528-719a-1a3f74d9f176@opensource.wdc.com>
 <969567fa-77ec-48da-ef63-c5d18de4b213@microchip.com>
 <eeed43cf-7bd6-9d77-9e1f-e018a236a058@linaro.org>
In-Reply-To: <eeed43cf-7bd6-9d77-9e1f-e018a236a058@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 033f8771-fd20-4d93-1d76-08da6420434b
x-ms-traffictypediagnostic: SJ0PR11MB5919:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HG7SxSa9CiV4f4mUkfg8DU2Gh4uqFQ2335rK7KcVGxybsBgxXpTrsatv0tESwQEFJEIrSk5/RiCXC4nwlFwi2c6GEPZzkLRW9XBKFS9T0lGBLekyGR3E9EiiWQYC0XhPOqbC2oITSP3AXsSJaqK+nUjcXPzvqFQAiAaioSI7mi8O32Ss/YWg8XxeyMdqZNFIhhEf/MawnjVpepfTVQYnxXN5R6g46JrfwaDDszxJcChcrvsEXn6x+6JFcMJ3QFKBBO1s3iUZdj/4WI2EXOf4HqM6VG0jTEPS12aTIn3IxmV1R3bZoZ+zTMDAj4V4UnRdklRqB+oRvmIHCHEAWUHcUCjjv1e6+VEx0ZyL05tvZh+ewmdp/bCw1LaX1K2sNyl5uns6cTgyd9nFE1qfFx5qd6BjRuNdnQGV7aK3CAlnHFCUoqlgdbCoYe6lzR00tfrreaOiI8IMHwAK7CCnD9ZprfBidJK+2/cTnGo0g3h8VNzNLnRw+/hOHE6w7bGByRFfvlB/Zol30UNdzFc2ZqdXPlLhxuFeItoj5hj/PrbmMp9OJQUEU3pVE0DKz1AfqQ4wZkAYpOYkE7DULka0g8l8MbA3xmZbglwtWNerA9ZmY65qMmFcCVwVCbGvF22WYSnaw3YzGNEztkF8SQ2yZ4OyFAcZnze9bhcUHL2Ixz/QmBtOIqb415oZLw37l+g2zq7SgQJkTQ1vR07pdauxtduTaEAcXfWv8MCwVDVZmEh8Wnlti17XIJXA5UUdjglc6BqTvoOiGJKu7zyv67Zm17BkB3Bi3Hxa4fN8IVkg8hD7lYqac5M8zlsXv/GPU31ZQpynfd5JWzOzezIXld4yhbZupvILngApDQ9rurLdZDJhzdKqpffsC9E+/00l440W5j9i
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(366004)(396003)(346002)(376002)(31686004)(36756003)(6486002)(41300700001)(316002)(2906002)(38100700002)(7416002)(83380400001)(8936002)(122000001)(5660300002)(6506007)(53546011)(186003)(86362001)(31696002)(66556008)(76116006)(6512007)(91956017)(38070700005)(66946007)(110136005)(4326008)(2616005)(26005)(64756008)(66446008)(71200400001)(54906003)(66476007)(478600001)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TG5tZWxvcGljZ3UrS21TaFB3R2puc0RsQzJweG1lSGJTVVcvc2RNQVF4Yzcw?=
 =?utf-8?B?Q2F6WDJnWjBuWlRXdVJZc05Zd2FYb090Vks4NGdNWGlSV1o0OFFwOGhQT0NH?=
 =?utf-8?B?WThjaHBqZXZHWVpSWlBBMjF4Q2hHQThGUHNPVlFBVm9CMERpQjl3UDdmbUpa?=
 =?utf-8?B?aHBMTGNjTWJTZGw5TG54K3lqeS9YSWZCbDMwVGhDMDVJZDhOUHZSR2NZT2ZL?=
 =?utf-8?B?SUN5NlViL3hKNmNVdXdJVm85YldHVGkxYXBHNGtDamVUcFc4L1BWTCtvT2la?=
 =?utf-8?B?Vnh2djlGRDVvc0NVRTNabytYWXR1ak5MTU50cWRDUTYwdVlzNU4xc0I2OStl?=
 =?utf-8?B?aUxwWU5xbzVkbVcvS2NyZ3E2MDBFSXEwSVYyWENud0g0dm1Mb0ZtN3hYVHBP?=
 =?utf-8?B?Tko4TnRMZmtmbisxUWFsdUNUbDQxK1ZIQjF5Tk81SUdFZ3BwNiswS1piME5q?=
 =?utf-8?B?Q1c3ZUlrUncvSDZ6MVpFK3JJd3lqVkNUaEZrYzJ4R05qS082ZHhMM2VOM0xN?=
 =?utf-8?B?UnRBMGFSaXR5MXVXQU1OR05lL0g4bGpLQUs2TFNQMmtoV3JwbHN1TVJMTVZS?=
 =?utf-8?B?a0JIQ2h6U2RWcVZFMW5HY3VFRmdvT01hMndWQWxFUWxVUDRGVzlnSjNtMVdV?=
 =?utf-8?B?NVh5aDhiRyttR3BxcU9VNkZmSXNwcUNqL21iNUNoUk9CRVRoamgxRUlwOWpn?=
 =?utf-8?B?aThoWjFHcWFWa2J2aHNKaEtwdk04THJOV0lHOU9rYUZZZk1lbERuTEFxSzIz?=
 =?utf-8?B?NDEvUEM2c1JHbHM5RFdNVHIya1JrRnBTRUJPeURWWldFWXZLYUovYVY4YTZ0?=
 =?utf-8?B?d25aNU4zM1hqVHVyVk1LdzJZKzkrMGd5NkMwclBpODd6amltZHZUVDFpSE5q?=
 =?utf-8?B?WmorczVPdWpFTExUbVoxMmtFZlVNOVFSdmoveGJKbzFmNU1DTHF1eHdiUVIw?=
 =?utf-8?B?SUNEL0UwNGNLWktqZXBZUEN5Y2U1VDBUSDR5bSt3ZFJJOVprN01PT2dyNjc0?=
 =?utf-8?B?eG9aZ0VFUmlrZTRLOFNmNll4S2ptdXpyWVZMSWNBTjBtekczQTRaTEhKRUdE?=
 =?utf-8?B?d3c3ampDbzVmQlkzUW9yTU5YMjUvNUZOd2tkTzV1YnRrYXBCSm1GZVJCc2wv?=
 =?utf-8?B?YzdRc2VTTGtnV1BybDBBQTRKblR5VnhzZGFWVkRJdTIwdENpRUVvVk0xZ1Vm?=
 =?utf-8?B?S3I2Z3pYSDJiTXdNaFZOdFJrQ1JDNlZyazFUT3ZTOVc0Y0dvM09oN2h4TUtY?=
 =?utf-8?B?SW9zUnRGZVdvTkNjUVBFdEdSWUZMNXpvMWNIMkM4QUdRUzdZTjEvSEJhZzlq?=
 =?utf-8?B?M28wUFExeGlrcXRoZHdqaTVIVER4OGdJQ3VlUTEwNkU2RWxXMEMzZ28yUFln?=
 =?utf-8?B?QUlVWGEwRnBudkorRnp1TTJPU2dZaWNtbjZCMVVnZ09NY2lzSUlKK0lualo3?=
 =?utf-8?B?L3FCOHc5cDhXM1l5OFRWcUkybGZqLzhWK2IxSHl0WnoxWko4NHVPQUZTQndL?=
 =?utf-8?B?SFJmWjVqbWVlQU11dXFTZlZZSG5SbVBvUlZXVXZmWXBjcjYxM2hpRmNRVGpp?=
 =?utf-8?B?V3Viekpvb3dDYWFLbEZoZzdMb0tyN0w2Z2VBZkhabDVqcHhEdm10U0hsR0Zr?=
 =?utf-8?B?a1ZGSUV5Y2ljekFYNVI0V0RiYVpZWVhjeUN0elFFWjI4WHZrTXdjWWsyR1Fo?=
 =?utf-8?B?Uy9qTDN4K0k0aENlOGpEQ0RabUZsVVRuQlg2VlJNc3FISEdkQWsySGNUWjk3?=
 =?utf-8?B?eVZkMmNqR1BYRFJicmtNeVZrOUswNGtnd1NnZFRQaitxd0xPN2lUU0cwV0d6?=
 =?utf-8?B?NmhwMDRwZElKN3F0Z2xKRzhZMmt1enh6dFRWRCswMkJSYnhyUUVEUFM3STNy?=
 =?utf-8?B?dHVEMTU1U3FBU1JNT2NrRUJWYURZZy9hRDhwNGgyMms0R0kzb1NFSmZRaHIw?=
 =?utf-8?B?UjVsekw2aVRueXRHdmNPMURxVHdWN2dLb0dzYlhBRjU1enZkWVExRE5oTEJY?=
 =?utf-8?B?aWFyNTREbkEwNUM0aTVISnU3RGlIZ0djaEVwdXpFUE9SeGFCajBvSU9hZTZQ?=
 =?utf-8?B?STluNkU2ZHg4eHhha1NjZG43QnhNelpIVlo3UHplaWxkdFV5Mk5zelZnREMy?=
 =?utf-8?B?dVQyeUJKRkVLRmx0SDdleU9mMDltVFV3UG82OWFFNnV1bGxaTVJhUStzMkJW?=
 =?utf-8?B?bGc9PQ==?=
Content-ID: <D5980F53000E9B4CA864EA343D6E92B0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 033f8771-fd20-4d93-1d76-08da6420434b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2022 16:04:55.6605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 90av5G4+HGlxxy4uWYsyMybaTCs4Htu1dEWA2TLxhXHE2FEhRaZXSAH1dyYcgXrIDKgf7qaxrQOmfdlVoXBpIsjj4Xzo3f49zpd6QpQauf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5919
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_090459_807768_C80120E6 
X-CRM114-Status: GOOD (  13.56  )
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

On 12/07/2022 16:59, Krzysztof Kozlowski wrote:
> On 12/07/2022 17:54, Conor.Dooley@microchip.com wrote:
>> On 11/07/2022 00:21, Damien Le Moal wrote:
>>> On 7/11/22 04:39, Conor.Dooley@microchip.com wrote:
>>>> Damien, Krzysztof,
>>>>
>>>> I know this particular version has not been posted for all that
>>>> long, but this binding is (functionally) unchanged for a few
>>>> versions now. Are you happy with this approach Damien?
>>>> U-Boot only cares about the compatible & the clocks property,
>>>> not the regs etc.
>>>>
>>>> I (lazily) tested it in U-Boot with the following diff:
>>>
>>> If both the kernel and u-boot still work as expected with this change, I
>>> am OK with it.
>>
>> It's all yours so Krzysztof :)
> 
> It's too late in the cycle for me to pick it up. If you have alternate
> tree to take it through, go ahead with:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Otherwise, I'll take it after the merge window of v5.20, so in ~1 month
> according to crystal ball.


Cool, thanks Krzysztof. I know it is late in the game for v5.20.
Part of me is hoping that Palmer can take it with the dts patches,
going to bump all the outstanding & reviewed riscv dts patches when
I send my PR this weekend.

If not, I'll remind you in a month. Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
