Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73002C00140
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 20:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UlQVWplncDySeB5AJ31DPkQ15+LM1AHsxqpNb+gM0aA=; b=QLwZ+t1MVAQbBJ
	TY4DBsQDKLOqahHUUYrYxOqvkhFgvimNmv2f5h6dmHVEbaWOzkh+uwGV2A0x+9+MC+h9rNmexF9fb
	pXrQ+rKM+nwa4b/3/7Ryl2kj/fhiKtBoDxX4aYYVotN4dz+jt0uvXXDLA1Zu2iobQKsLZKOU/AgfU
	YeG3WoVCWIopjR/9brskSnXCtHnS1w4dxVsYk6Y2EeHefuA9qvXLuj4H0UsC9Ik3lAu+E2nKWvY7L
	+fsaGYaGhl6v+gu5t6yoG2VZf4OYBR287+EGe9r4gwkYYglD53CA24ugG4rdOzX3No8cSvnfdzsQM
	fqbxiRBCkFAJvhoqEn7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK3W3-000MMU-O5; Fri, 05 Aug 2022 20:01:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK3Vz-000MJo-HS
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 20:01:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659729707; x=1691265707;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=P9SSN6vz5v5tnJK62nzSEhUN7uUMSnnySHBc5Ru9evI=;
  b=SWS3Dqq+SxcMyHCf/otsKZDsQYUUwtxI1lgqDQyZrJAHIbtmr/dc1QuW
   Xn7YeMXCcEfnn75GI3IKfBh/Hzn5YjNVY6xzQ+zakpb/p9FhvMd4LoG0T
   kjZQQrPJHB3hjwbRADCWlgxphKd4G+NtpbX+yplNfUhgec/M6FDGioIz2
   RfAhZZAMNQaeaFXctbkZ+8TLAN0MWJ7igRTEycbMG2DHXvsKwz9fvHdAj
   TLoKYDHxzHCr42cuydu2EIsxnC+BTgPHjsWWTEUSu4wcVTJDxRPR33ibs
   qdin8L+Mm3D21S7b5/lhLZSNymdptoaVwWjtsCTQ0sfqTauWh7jBMiWPW
   g==;
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="171205681"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Aug 2022 13:01:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 5 Aug 2022 13:01:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 5 Aug 2022 13:01:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqMyiLU/VYWD/aJcZv1WufbC6AbfAtLRzqiDvDto1UBHIisWMnTBXxGVKC77/C7XduBi7b+/GelX0GAmeOYbfkYAJHOl99ajtmuvgExJIhz2vkBxfkFo5EA1LT1cBhu9HcMDlS/jGwDiL6d/oNZ8VhIkS2/H3gV2roNdw3xSI6gQ/0TIvSVmJiT3gkREDDlME5oUUWvTYHxFqodbuOzBELhNI0xaONE2eFPtba5ULiLFHDnLqHeBMHmEeOv3iPjGYfsSFmODfO4Dd36HDuG+DY2WoRkdMo1KoC9iQTvaUzJkfftwkxbuYQiWvdRNNnFXaeGcqUGOI3vJYTsZLVtM+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9SSN6vz5v5tnJK62nzSEhUN7uUMSnnySHBc5Ru9evI=;
 b=F4UGm6FUcTx6ZdilHAEfBEzJDOnEL7VcRDEuYDUfqUsuqco0RGGZF86/jpfTNq6EAssYp45Wcn5wBGjJ4w3YS7d6JNR1jvdUpA7DkOa2/jfJSVSmug1pg80UDUph3gGfAyBXzD8qWX6+WPnbn7hORz1q86CCg5FWakDbAQvrwlKteLrMVIagfpU6+Wj0b+vuOsJZgRSJua6pagc/0+BZRDAVl4a0JxcCxJCZTbYnYr67Qmq6dSOaou3Tbyh+1FBYKZX6T/6osbxcSB3zZqiLLjVelq7Qv81tnAIBPXShh6lWHi9WQ8ZhDy1HW5RYeVF7sa6pFciYYf62DRq0ZW4Kag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9SSN6vz5v5tnJK62nzSEhUN7uUMSnnySHBc5Ru9evI=;
 b=mtg//BgzEBAS32tJKdYL4RodqQWfw+X0abdu80gPULOtYxsBisXO29RN6gheH6LJGcuawcSzYzBF9kkzdKp01W701cVN8KAJUibbqLiEdcqgFGwAye5x2fmyH8XfO2rHE5LVQhTN8tIZCPLsWiwupl6OkeFnGyK3cQU1mn4KRP4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM8PR11MB5701.namprd11.prod.outlook.com (2603:10b6:8:20::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 20:01:27 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 20:01:27 +0000
From: <Conor.Dooley@microchip.com>
To: <u.kleine-koenig@pengutronix.de>, <Conor.Dooley@microchip.com>
CC: <Daire.McNamara@microchip.com>, <devicetree@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <lee.jones@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <robh+dt@kernel.org>,
	<thierry.reding@gmail.com>
Subject: Re: [PATCH v7 3/4] pwm: add microchip soft ip corePWM driver
Thread-Topic: [PATCH v7 3/4] pwm: add microchip soft ip corePWM driver
Thread-Index: AQHYnSZd8pL1UjMIH0GsTy6F2x+lta2bXl6AgAA/1YCABTL/AIAAAMoA
Date: Fri, 5 Aug 2022 20:01:27 +0000
Message-ID: <428842ed-4070-ced8-e032-bfb48d5af4fe@microchip.com>
References: <20220721172109.941900-1-mail@conchuod.ie>
 <20220721172109.941900-4-mail@conchuod.ie>
 <20220802084619.wunl3nglcpgo6j5i@pengutronix.de>
 <e55e4a7f-b0bc-f48a-b555-d4b96d69bb87@microchip.com>
 <20220805195836.vh3wv4xbpwjhuvfs@pengutronix.de>
In-Reply-To: <20220805195836.vh3wv4xbpwjhuvfs@pengutronix.de>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d2793be-5a5c-4220-56aa-08da771d482c
x-ms-traffictypediagnostic: DM8PR11MB5701:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p1Qw+JMi8uQ4ofkD0Aq6qwwl5sYWJhOhj3+9yoKVMf5tFFa1FEZDXDHIw9ip+MRzLrDOCR+pP+UeL4pQISDX9pU5ssuQGqMoRjaktGLMcPTJVZYEjFgtULW0l7Uxtpl3w8jnPz/rLncOizfnwmwxfLH5w4mn/A5U0DGrKX684ZDWp0PP00u+g0iLONimBa5sk1nYqsmrojZkyzvEL3UI+Yc7jYgoyCWKYBBD2nYvECv5OckMTFthFcod+ujGrMi393MhZVVAvKZic8kcxbSNq+ADOzwjDL+qNVrVxgx9/l3xrBG8O/f98N11cQHjx3+YhHSDnNduorJUwmYWj+mGlbLICHCgD9C0EOkKTLtvWpxdd+M2FRPdIzkzc3etgayqx0wJ19UWkXXSNdWAly4wF/YIamO6uxV+Csm3rh54Uc0aL5KUq8CHW7FkuAT2x2mHvIlIxHfrLF5ZKU6nNy0fBSByXBJqSpwF+tK9/P8k60fBwg1v5JHbXSrGTTrCr7Y7girsrgkGD5S6xPHocNjbfcYimQkERWPlTPz0I4Kff5T4G7RIND2ZiRx/NZXFgn9JpkKW1iSamHnwZ2tyrDNYo6kkAtzS/UzcmsIa5ilIF2vRpYeirC64KkU/c3MuOxSfvTnj60YVO/y3dTroNM3C5l5WrZAS2Wx3Zshcv8fyiv5l/CvUQe+GcFH5tGNDYKvC7dPS7frspKVvTXMeA0zCodcRs5bxd+WgQSoMMPkoHHnsC9QsNXuWpvG5v2wwku/GgjtWVY0sqkd/E+VFdJWI5fAZVBP7abZgJhS1g3KEOLA6+xV2rH69Or3q6b67DLsYVSaPwfDhX8WzIVrL9XeK8cceaLGEBfJE6RvyI/B5uasLeLqTQj5sRVHmDgLZ2aUa
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(396003)(136003)(346002)(39860400002)(71200400001)(41300700001)(26005)(31696002)(2906002)(122000001)(4744005)(6486002)(186003)(38100700002)(8936002)(5660300002)(6506007)(38070700005)(36756003)(316002)(31686004)(53546011)(8676002)(110136005)(64756008)(4326008)(66556008)(66446008)(54906003)(76116006)(66476007)(66946007)(6512007)(2616005)(478600001)(91956017)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1hmSDRUTWxyMXZFY3MvVStUZS9TMU1veTFLRzFYb0NOajlGcERHLzZmaFA2?=
 =?utf-8?B?MVlvN0paRktySHRRcFFlSVRlYmluSVFtZk43OHN5dzVpOU1SWHZsN2Y2NTMw?=
 =?utf-8?B?U2NYZzEwb29LbWdJdjJQNmp0RVk0UGN2YVpFamJTSnZyQ3lJQWRyM045bnhj?=
 =?utf-8?B?UlBocmY1UWlxdmtBdmpIWUNrcW05cE1DRXFFd3Z4ZkgrelZiajJvWlIzeDBB?=
 =?utf-8?B?Q3liS2dCQ0E4Uk5KbGJkUUFyY21tOE51VndqNEFZSmdRRkdKR05MVGl2czBw?=
 =?utf-8?B?eXdPcmVyZVE1RDdEUEZidHQrYjBHNXVxV0JtbktjdXkwb1lUYjd0SFUwRWlB?=
 =?utf-8?B?SFBjMnB1Y2xFN2l2V0FFZ2tIV2JmdGpxdFF4aGJjLy9FUFVsanFWVVVPaHp2?=
 =?utf-8?B?aFp4Nk1JZFZOZjNoOTdlYzJSbmk1SFNQMVY2eSszZ0tjdUJoSy9MSDhYaXpV?=
 =?utf-8?B?T0QyY2R0YzBJYldsU3BxY1RDNGovQ2hHZ0tNY1dZdFFKNWJxQjV0Qk5EQzlO?=
 =?utf-8?B?MjZxZkc2Y0dRT1cvM29kUDk2NGgxT2M0NlBuVTBLcHYvMGdPWXFyb1gyS2R1?=
 =?utf-8?B?R2lCMjdVZXBEcUF1U0xFdG5icHp2aHhmSzhNM3ZhcU13QS9rZytCbmgzMWls?=
 =?utf-8?B?RnVDZ3BzZzFDRDhFNFhaNFJiOThydURHV1JCQTFSRDBMZkNJbTNNZzRKYU1s?=
 =?utf-8?B?WmhUaEpBcGNTaUdTTEZIRTFQQ3NYdjlERnJON1Fzc2Vqdk1mL3o2Qm8rdXhq?=
 =?utf-8?B?VUtTb0tVd3NYVGpJYXhYNy9mN2UvZDduQ1kvdE1QUGQ0cGxMYldZK0FObkxt?=
 =?utf-8?B?cVBOS2xaUFN2L0I0bkJLV3BsTTdieU1abDlIbTgya2xCMFRVUUtKYlhnSTRG?=
 =?utf-8?B?Mm9ZcHRlSS9GRWthdlRsSlFobCtkSHlHS05hcHNBVWlJN214Q295bHpMQjhQ?=
 =?utf-8?B?UnZXSWFsNWRRYnE2YnRUZTFNYkl6V1Ywdk1MMnV2SEw4eE4rRHhkTmtQSENL?=
 =?utf-8?B?MDhKc0VQRC9ZQ3JNcHRWb2JjekUxeDJtdWhhOTdwaFJUV1hwQTJSYzZuRjZz?=
 =?utf-8?B?TWNuSnVaR0l5L0h5dHcremFwUDFmNzYwMHlpNFpmalJKbHkxVVI5OWpDVVNN?=
 =?utf-8?B?d256NkFpa0duNzZEbTZQcWNhT044UmtCZWdWVEFXaG94OERJVXErWFh0WG9n?=
 =?utf-8?B?R3d5Y1g5YjZ3bnVFdFcwNFhRakxOa09Fc0xvUk9TQlBSY0t5M1ZDaHR2QUQr?=
 =?utf-8?B?TXhoandrUnN4c2F5S3AvclozMmVHd2t2dXA2Um8xQVJGMmhHUXkyandjWjZM?=
 =?utf-8?B?MFl3STJlbU5za3VYNSs5RFcxMjlsUEV3dGQwby9vV0hhUU94VTBNeUxjSFNi?=
 =?utf-8?B?MThXcXFvNDlYek9BeEZ6ZkRiS1crLzJpS1Q5U1JPRzhCcXBHdy9OSy84Mk5p?=
 =?utf-8?B?UWx0SVI2ZmdORVVqM1lKVUl0RHBDL0kxQlNFbnJOYk9aUEl0S0QrZVhDeUla?=
 =?utf-8?B?M1VmZzllR1ZFeWZPTElYbEk1aGYyNjE3d3JRQkQxdVdjSjF5VUc3bExhNlV3?=
 =?utf-8?B?QXB4V1hGdkFuRlRJTkV2bTNHTy81THZzdzZBZk5pRGI3Yk1Yc21rTzY2Y0Q1?=
 =?utf-8?B?RnpGK0IxYldsZU90bjF1RlE0SGVrdWUxc0VtSmFCajZCY013NW1DR1lzcU1n?=
 =?utf-8?B?VDQ5RW1rck5WN0h0cWYyamF3UkhJM1lhSmRtNlREQm5nSXFQekx3TFMwN0sr?=
 =?utf-8?B?ZytvZkp6WDRXcUNYeW44bnN6bE40KzdZbFN1cnRtK09xc29UTG5CeUtaT1Fp?=
 =?utf-8?B?NFNmZkVxZWNDZTBaajE0TlphaDBRVVdnQ3VCbm83MHBNQy9lV3hzdlJnbHgv?=
 =?utf-8?B?K1BSTkpqRFZFalJsbTRMdmNzTlM1UHlkMmJaM0w3a3dodXB1emNsaG96VzRj?=
 =?utf-8?B?ZGY0b1NBR1lLcVZMZE9FTGpEbENGa1RvWVZvd0tpMitqSU9pbDBhU3E3NElx?=
 =?utf-8?B?eUdzdHdTK25RR0Z2VDZvaDc4WVFySzE0SEZlNm5OMjVyZ3BWeGt5UlN4b3ZN?=
 =?utf-8?B?K0pqbUlNNERyVjFiUkpLS3MxTk1SMVYyS0wxZW14OG1Da1hCY01sWlV2aHI0?=
 =?utf-8?B?dmNhRFhCUEZ2bm5jT040U1VUQk9DOXhLNU1kN3dVK25MSFNzVDdUcTBLNW5t?=
 =?utf-8?B?OFE9PQ==?=
Content-ID: <83689A9343C6664EAB4DBB9663077B4D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2793be-5a5c-4220-56aa-08da771d482c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2022 20:01:27.4500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fOXP2Th3srR0APvDD2clvmZ5hLW+wvBp91HPmGOSZu36nivFU8aVLAVY3YSMmpUFy6dkHgY3kEeG4UXSULAbx8d1XSDrkul5DYAlrL6oRwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5701
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_130147_886192_6520246D 
X-CRM114-Status: UNSURE (   9.74  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDUvMDgvMjAyMiAyMDo1OCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IEhlbGxvIENv
bm9yLA0KPiANCj4gT24gVHVlLCBBdWcgMDIsIDIwMjIgYXQgMTI6MzQ6MTRQTSArMDAwMCwgQ29u
b3IuRG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBJJ2xsIGZpeCBpdCBhbGwgdXAgJiBz
dWJtaXQgdjggYWZ0ZXIgLXJjMS4NCj4gDQo+IEkgZGlzY2FyZCB0aGUgd2hvbGUgc2VyaWVzIGlu
IHBhdGNod29yayBpbiB0aGUgZXhwZWN0YXRpb24gdGhhdCBhbGwNCj4gcGF0Y2hlcyB3aWxsIGJl
IHBhcnQgb2YgeW91ciB2OC4NCg0KVGhhdCB3YXMgbXkgcGxhbiwgZG9uJ3QgdGhpbmsgdGhlcmUn
cyBhIHJ1c2ggb24gdGhlIGR0LWJpbmRpbmcgZml4Lg0KVGhhbmtzIFV3ZSwNCkNvbm9yLg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
