Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEA4C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 11:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AfEP1fmCrMX9MlD7fcWqrKZai1zNb6Jc1fRk0mzdGt0=; b=ocBLXJS/hQc8Tg
	8aLu4MWewXDKtv372l8aes9EzuokM9y+6VLjAw5vKPMeQMGXrRQHRcyFpD4obiPo4TVXX7aZ8U4Q8
	dpmV/Wa787G32PTf6slD3ZD9zGpa23LPtaTm911ZyEGKn9aWONAiVmhkbR2UGGNsFt8vB3gMgpSJ1
	qmojZTnrRULFyGhlObrk42wcmU6XNzH5R9T2RMKmcvegxnnhCuWNjWSHq9y2ArElPaUCHlUtnobUW
	bv74+Y6UxiS1h0jazDP+EJbIfgm6++EKLw2N41A8IBPsEfqhRDv2vEWs6vlcKHzxrppScRyshw9vo
	dzeASELaHMsl/+hctFgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mWR-000Mej-Rq; Mon, 27 Jun 2022 11:03:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mWM-000MZk-TO
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 11:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656327791; x=1687863791;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Wp0kyNkmroTn9RCaxHByL3CuxFxtV2N+kxDE8aaKZ4k=;
  b=C9U09wVky5Iqy/WSCJIJuvVM9SCJARdD4UDBjA3RcU3aqod2QrcFogcF
   SS5Ty/vkvpT3zu2aBHkWN1dW+4eEjBpa403Azlc3lS6Rytec8jv0poCOB
   AdwdwUm7rfpjL3dKBsiE0f+rdkNGCdJ1MgjVvfXB8jN8i5HjR8pYo6bXQ
   Sf13LhimRJQa87ZnGNGA0S76ow6HmoyLUL7HK/2LsuGzsf6qusZ78zBWi
   J2oXTpK4/ywbEgaYqt7g9CZTAVv6jFvRhfzaHtfsK74pXTdxbFf24Czt5
   72vJ2yaYIDl53QzSmF/h7jWlLGVJn64YbgfPla/vUU+X/78khaK30AOgg
   g==;
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="169732728"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jun 2022 04:03:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 27 Jun 2022 04:03:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 27 Jun 2022 04:03:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOGRbDh9tT0XOWLmrX/PVzclTBlTLhfWRCL59zl52gv3xF8NbBJwR/1oOLqDjo5bQ4dHeffStA+WDWbtBL1hp1T03y6AC+rMerNI9WakEimQA63vZWxf0pgKYwyoRz7lJy8MG595BLPwUWaxrcjSCAI0xGjZNMjwhKwk4sCk8bXjawPPl4aSZAZwd7oeg9I9lmCdiwivF5rt6UEzZ+h8FER5M3NezcLMsixvg5z6ayXqy50NpvRX+He1jfkJEbrMo2TkoZoSoAu/+uJix7+P+qehCLWKKVxWdY/O/p55JX8m3nRgrW+Z1XnarCVLjJ2pt9ReE5m+5/DFXxFiPx9Z/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wp0kyNkmroTn9RCaxHByL3CuxFxtV2N+kxDE8aaKZ4k=;
 b=POx9BDtlZDTOsnMvlxoQSNyjruWA26P90TILQA3BKn2VVFYAPlnevaqKZXvqpRENnkZO5j0PDhCPpgtBdbP9RV4hbA8DG+1rrVE0xyJWSK06Yu4yTJ4GRu9zX3xzlzvlk6W7FP/vj5B1YHwDhbLGst6RAdzipfUX9Kb+K/dA7ctSvSbLpkUyuBeJNltKe5xJEweK5GRKp7cEF0ClRJFyuT3CjiCBWtjhYw2cRenHxeEYRhBuppNz7RiIJKvcnjim8Sm5I9BjmqtBlQcRXK8czpuYEVKg+OS3EvZFtjmlIUuaLo9vyVkNgdBryJK/56VvvWX6tKNrSUQncLcfCuYAgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wp0kyNkmroTn9RCaxHByL3CuxFxtV2N+kxDE8aaKZ4k=;
 b=tzvWvsRUzwG0zwR28+Gd7es2SX093V93jUk6tb/Vq7vT/yzxzNd8qThxAx64qr/OJT7hb6duVlJsC7b/7+D4WpawvmRsw+8C/J92rld5KvrrdFef0EZFNXNI83oailT7db7eRq0Fq+ajACeqGyzwQoQ2e4A2obPTmhoOzts2VI4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4677.namprd11.prod.outlook.com (2603:10b6:208:24e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 11:03:03 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 11:03:02 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <damien.lemoal@opensource.wdc.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <fancer.lancer@gmail.com>, <tglx@linutronix.de>, <sam@ravnborg.org>,
	<Eugeniy.Paltsev@synopsys.com>, <daniel.lezcano@linaro.org>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, <masahiroy@kernel.org>,
	<geert@linux-m68k.org>, <lgirdwood@gmail.com>, <niklas.cassel@wdc.com>,
	<dillon.minfei@gmail.com>, <jee.heng.sia@intel.com>,
	<thierry.reding@gmail.com>, <joabreu@synopsys.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<airlied@linux.ie>, <linux-kernel@vger.kernel.org>, <vkoul@kernel.org>,
	<palmer@dabbelt.com>, <broonie@kernel.org>, <dmaengine@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-spi@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <palmer@rivosinc.com>, <daniel@ffwll.ch>
Subject: Re: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Thread-Topic: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Thread-Index: AQHYgw905RVeuSLdkUCudsZPOTg0Ga1XZVUAgAAEPQCAAAjWAIACL32AgAk9twCAAAL9AIAAJpyAgAAbkgA=
Date: Mon, 27 Jun 2022 11:03:02 +0000
Message-ID: <626a079e-9640-b358-a452-6b226a619f34@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-8-mail@conchuod.ie>
 <9cd60b3b-44fe-62ac-9874-80ae2223d078@opensource.wdc.com>
 <e1fbf363-d057-1000-a846-3df524801f15@microchip.com>
 <891cf74c-ac0a-b380-1d5f-dd7ce5aeda9d@opensource.wdc.com>
 <6c9de242-6ccf-49a2-8422-e6949c5169ff@microchip.com>
 <70cd0066-9aa7-ca41-ad61-898d491328aa@linaro.org>
 <b8dce80e-2753-497e-1dd3-3eb0d248b74e@microchip.com>
 <430f5284-b107-e43c-7329-9e299093a352@linaro.org>
In-Reply-To: <430f5284-b107-e43c-7329-9e299093a352@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d072f39-dbde-4018-3921-08da582c9a9e
x-ms-traffictypediagnostic: MN2PR11MB4677:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4UdqLWS2QaVT2nHtCaHrF46RtPRm8mhvMRovzC6SWMxYsrzVFIXY6CH6vHdKewtnA/hRpZi0kAIrhzXVGFdzV8I+caK0dCRUorxR9BLb4w8Vxrs3Cjf91VnXzd2ArP2ketGxJn7Dq+O+QBteQSyecGoqLB10sOiN6W2qhjOBkQJ93eAT583TQ1cr0VbdNVixkIM6nH1Wg+3AVu52bx1+9a8HmiuiHmSO4cWRj2B0enEfB561900fD5gIhtnbDeeSqmt+O+jX5S/HY510w9dwcha3AxQ6eBmfVxj9wLHF6NkbsDMh8VoA0osOYbsO9DxtWT+BHBgkYIBT00sJ9fS0ixxNPtnZ2YxsTSDq0fQuYa1lRx+bBJ8r5E6FWTz6Xd3ikGE+1aLecfdYO8QwhEAih+iJkGbZiL7nxYdnO3ZyStnHQOsvJL0KNlPxOQWicTu8c2tAnkQYvBV2g7Kt91NJiP88+hUHVg78r04pqBQU4nMEFQZWrUJKlJw69v+oP/WzmaaLZajiqO5b5UjqrlyMXU0vVeJwQx2kAf/OYnHt+y3XoQGxmXh5BJS1z1BTb2VatLKAxsew7EceWy/W0D80kdR6If04hpJbdi8zqBFZood5oRDOzeCqEfz4rUFUOyO+uKFvV7cRoe5ET1vA82JIDz7jGlfWDePAoo5JdYMKhUW77pFIImSs9VlwORoOkaH11MY9J8DqaKZBrCaA1yS7AeWOjmrh9tRsch+6jj8kIKfgogv6PxHkB8xt3G/HlKM+8PCBjW8VIR3y/uEMFccsz+oZwkqhRlF7piFPik7AQfYLXv0bwnGFPtwC5HtlUGwyuGFWJhmSCAyMXZbEaRRyWmZQvZqafR/9xZ94WcvF/w0JFLv0Zf1pHFiUnekTc09+vNKjnCDp0axzDBPoQ2ZkVA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(376002)(396003)(136003)(39860400002)(6512007)(6506007)(110136005)(38070700005)(31686004)(38100700002)(53546011)(83380400001)(316002)(41300700001)(36756003)(26005)(478600001)(31696002)(54906003)(2906002)(66446008)(8676002)(4326008)(71200400001)(76116006)(64756008)(66476007)(2616005)(6486002)(122000001)(7416002)(86362001)(8936002)(966005)(91956017)(7406005)(186003)(66556008)(66946007)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3l3VTBNWEFOL1Z0VDl3dUZzczRJWmdCY21CMFFiaERGVjVUWlVYY25YaDFv?=
 =?utf-8?B?T1VhU0JBMlVTZUcrZFJqLzRxQlgzenAxaXFNKzEvTnFKSnAyV0pqNkZPQlpO?=
 =?utf-8?B?Ty9WbG91YW0xUGQ3MjNqUVBOYU0reittYUNnMjRqUXVKaVA2VklTenJ3RTdV?=
 =?utf-8?B?TUdNMDZqV0h5TjhDLzVSRGlnZDdQa3I3NWMwWEFOdFdpSWFOa0ZrRGJxb3ow?=
 =?utf-8?B?Ry9OZ21Rak9GYVU1akJCN2NMS1VsZzdSeFRUSjJFcnE2Z0QyTTRkNmtISTg3?=
 =?utf-8?B?VUV5MWxNdWhiOXM1ZnlFVitmeU00QlBxTThHOEU2YjBzWDl1VmRldEZlTWlW?=
 =?utf-8?B?T2QyZEJiNzFOcS91Sm1xTUxGeDRpNXVKUkowelRwOHFXSVUraGlDR2EvVE51?=
 =?utf-8?B?VlllQVJ1dVArS0x1YVRBWEdWbE5UTVdKa0ZKWWlNeE9Ec09RdkVlZ2pQdmhO?=
 =?utf-8?B?YnVTd1FXQzRlZ0VOSXk3UFl5LzFGTkp5QzhUVjB6Qkl4akJJMEdKQlhUZHZP?=
 =?utf-8?B?WHo0a0RJZHdORVFoOE5EbWY0SExYSlhpM2V5VGNDVGNkb25CeXlMVnp0TkNm?=
 =?utf-8?B?QmRZOHEwclVaYnZKS1lrbG1vSVV4aEVxZ3VtaU1SY1JZQm5URHl5R3pDQ1VG?=
 =?utf-8?B?VjdKcnlhUHBLOUdIRmNLT2pUczczY05uWTZXZkhuM0dsd2N0ay9TNWo4NHFh?=
 =?utf-8?B?d0dkd3FsZWM1bTBTbGNTc0NkMVNNaHlMVUNSbEpPZXh0OVc4ZnNnUm4yNlRr?=
 =?utf-8?B?SWIvUUV6VmE1d291S3FibGw5a1Z6ZFNWK0hXZTZQZ05kajEvV2ZLS0lIVlZq?=
 =?utf-8?B?OURtM2x1NXZaOThUY0VzYWRwd1NFR09lMUwyOE1lNG5xNlBDdEtUMXNjbFE5?=
 =?utf-8?B?Lzl0ZVFpNHJFdFhYSnEzN3BkcDFlTnYyakZWeHFBSS9PTVYzVjk2bGNOMmI5?=
 =?utf-8?B?czloczZ1UDFzc1orTjIwd2l1ZE1uS2pVYzh1Y2Mxc3pxY29ZQk1DMHlNdG8v?=
 =?utf-8?B?bzV0bkRxOHhtVWdmMVgzeTV0MVpIZlU1OVN5RzV2RW1wS1oxN3N5djNITEJF?=
 =?utf-8?B?OXRuRFdIRHVvNnZVbThNWVdpT2VxZGxSZUVQL1VTY291U2o2MkVORithdXBn?=
 =?utf-8?B?YlRSV0FhSnhCazZnNm5RdmpXdHRZTDJEMHdxUzIxTjRPNWZwS0tGSmpheGgw?=
 =?utf-8?B?bHcrck9hMm53Y2VWTTJSMXFOeW00b3NzNDBVUEo4RTU3c08zT0pYUDNWUlla?=
 =?utf-8?B?TWZNejFUUDVIVG5seE5yNDQvZ25RbVNrQ1BOMHpmZUp4Q3FmU2VEWk5BSXA4?=
 =?utf-8?B?N1hweHVIV3FVR2JJWXMyZGlrOXR2Um5ha2xqc3dzai9TZ1FncEdRNzQ0YmM0?=
 =?utf-8?B?TDNyeXFPZlJCOFBFSXN0a1gyT0VlUlU3NllyYWFJWmJXV24vcENkaXhYN1hX?=
 =?utf-8?B?ekV3UC9sb1RZR280ZHI5MFArNm9STzRscjg4bXJLOW5IcWFTaHhza3hUM3Ux?=
 =?utf-8?B?YUh0SnBMS1p2ZFBqK0V2Sk1MVkhFTDdlY0N1ck1Od1EybmZ6YmlLTy9XWW51?=
 =?utf-8?B?VS82VE5lK0N4YzZXL2hTKy9VK0IxY0x0Z2N6aFhGb0o1MDBVSFN5N1gxZnVO?=
 =?utf-8?B?RHlTL3BhODViOXpCTmVtRXhIM25jOXZMcGFiUGJneHRxeXlvVDZvTCtTbHNi?=
 =?utf-8?B?dnJBNHhqTHdLT3U2V1FEVW5oRDhxc3o5SkFsQkg2Z3FWeXAxNG8wNXptUkpi?=
 =?utf-8?B?MGxYZ1VnRVRGblYvZFppM05aSFN1RkZBaitmbGdwaFFtbWhYNjdUN1hta0Fn?=
 =?utf-8?B?Y0haTjNiQW5KN1B1Y0RweFR4MEY5c2tBREhNQTh1dWF3cEVBSmVZWUNqTWVz?=
 =?utf-8?B?WDlDRXMrVVl1QmhWdlZsV25iSElzanF2VHZRa2FJb2c0dW0vNFdNcDNtZG9y?=
 =?utf-8?B?bWpQdjEyMGtjYm5XNGxBK0lsaVk2Z0cvd0RDL1V0TllhbzliNUd0cjdXZXo1?=
 =?utf-8?B?QVp2MDlCZW1ESGJyU1VWcHZFdTF3Z2xrNWRCdlBRVXdCOHd2TmRtUkRvVk1Q?=
 =?utf-8?B?K1ZNUmh0VXBiMDZBN1NhM3E0M1pUYWJHUysrOE9Fc0szcmR0aXE1MVJobVVh?=
 =?utf-8?Q?bMLLgEFO0jREhptlfhoiFQExM?=
Content-ID: <87E1808B9EB0314AAA11A69460A0F845@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d072f39-dbde-4018-3921-08da582c9a9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 11:03:02.1587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sb6xBcaMxHrlIdNqlxg/OccOgYTIqk5EBrC0kKHATSYIZbSu/gY6RDU2pv/z66RbF0X3zK4BOCnuLXBBxtJGqPBd06rlvLUeAHZdINPVoLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4677
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_040311_001278_B43A8C2D 
X-CRM114-Status: GOOD (  14.62  )
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

On 27/06/2022 10:24, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 27/06/2022 09:06, Conor.Dooley@microchip.com wrote:
>>
>>
>> On 27/06/2022 07:55, Krzysztof Kozlowski wrote:
>>> On 21/06/2022 11:49, Conor.Dooley@microchip.com wrote:
>>>> On 20/06/2022 01:25, Damien Le Moal wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>
>>>>> On 6/20/22 08:54, Conor.Dooley@microchip.com wrote:
>>>>>> On 20/06/2022 00:38, Damien Le Moal wrote:
>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>>
>>>>>>> On 6/18/22 21:30, Conor Dooley wrote:
>>>>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>>>>
>>>>>>>> The k210 memory node has a compatible string that does not match with
>>>>>>>> any driver or dt-binding & has several non standard properties.
>>>>>>>> Replace the reg names with a comment and delete the rest.
>>>>>>>>
>>>>>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>>>>>> ---
>>>>>>>> ---
>>>>>>>>     arch/riscv/boot/dts/canaan/k210.dtsi | 6 ------
>>>>>>>>     1 file changed, 6 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
>>>>>>>> index 44d338514761..287ea6eebe47 100644
>>>>>>>> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
>>>>>>>> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
>>>>>>>> @@ -69,15 +69,9 @@ cpu1_intc: interrupt-controller {
>>>>>>>>
>>>>>>>>          sram: memory@80000000 {
>>>>>>>>                  device_type = "memory";
>>>>>>>> -             compatible = "canaan,k210-sram";
>>>>>>>>                  reg = <0x80000000 0x400000>,
>>>>>>>>                        <0x80400000 0x200000>,
>>>>>>>>                        <0x80600000 0x200000>;
>>>>>>>> -             reg-names = "sram0", "sram1", "aisram";
>>>>>>>> -             clocks = <&sysclk K210_CLK_SRAM0>,
>>>>>>>> -                      <&sysclk K210_CLK_SRAM1>,
>>>>>>>> -                      <&sysclk K210_CLK_AI>;
>>>>>>>> -             clock-names = "sram0", "sram1", "aisram";
>>>>>>>>          };
>>>>>>>
>>>>>>> These are used by u-boot to setup the memory clocks and initialize the
>>>>>>> aisram. Sure the kernel actually does not use this, but to be in sync with
>>>>>>> u-boot DT, I would prefer keeping this as is. Right now, u-boot *and* the
>>>>>>> kernel work fine with both u-boot internal DT and the kernel DT.
>>>>>>
>>>>>> Right, but unfortunately that desire alone doesn't do anything about
>>>>>> the dtbs_check complaints.
>>>>>>
>>>>>> I guess the alternative approach of actually documenting the compatible
>>>>>> would be more palatable?
>>>>>
>>>>> Yes, I think so. That would allow keeping the fields without the DTB build
>>>>> warnings.
>>>>
>>>> Hmm looks like that approach contradicts the dt-schema;
>>>> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/memory.yaml
>>>>
>>>> @Rob,Krzysztof what is one meant to do here?
>>>
>>> Why do you think it contradict bindings? Bindings for memory allow
>>
>> Because when I tried to write the binding, the memory node complained
>> about the clock properties etc and referenced the dt-schema (which
>> for memory@foo nodes has additionalProperties: false.
> 
> Ah, I see, I looked at wrong level. Indeed memory node cannot have
> anything else.
> 
>>
>>> additional properties, so you just need to create binding for this one.
>>> And make it a correct binding, IOW, be sure that these clocks are real etc.
>>>
>>> Although usually we had separate bindings (and device drivers) for
>>> memory controllers, instead of including them in the "memory" node.
>>
>> I guess changing to that format would probably require some changes on
>> the U-Boot side of things. Taking "calxeda,hb-ddr-ctrl" as an example,
>> looks like the clocks etc go in a controller node, which seems like a
>> "better" way of doing it -
> 
> Yes, because I think memory node is kind of special. It describes the
> physical memory layout for the system, not the memory controller or
> memory characteristics (like timings).
> 
> What U-Boot needs is indeed memory controller node. It's not only
> calxeda but also few others using JEDEC LPDDR bindings.
> 
>> but would break existing dts in U-Boot
>> without changes to handle both methods there.
> 
> Yes, that's a bit inconvenient but also a price someone has to pay for
> introducing DTS properties without bindings.
> 

Alright so, I'll make it a memory controller and conjure up a v2.
As always, thanks for your help Krzysztof!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
