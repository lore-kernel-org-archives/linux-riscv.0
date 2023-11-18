Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2003DC072A2
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Nov 2023 00:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0f0/F3p0HWIrGQh8lLwMIFE9mSWst+VRQ61pG74sHdc=; b=qXoHc/d1aLNiqQ
	DYLeVlduuoNLcSCl8woNyX4cNq228gTTLdxw+2IHkljmM+rq2b47+lBv2Df7WsjivpwcKcKnQkk/M
	cyCZOj6qL8b0RRAnGM3VvGcqmI3aqWPHj/1WeTFeaEPNk9xvp8UejV0nVeYqhIaK7l9vHDXMgC4a4
	tGRT6Tk748EqH29CS46KBT1uTV8Iq/9lzsZKJHnMxy7INE6lVoiAw6IXSdQBIXMF6B1NMN+Ilc2bE
	9Uv98AtD/FP4I4NTCVGSw1rYl0fLCh4ckXnLl7cGXNsBcnhbdKQXDMWfljjuVkRGVyvWWzPZgc7NL
	wT5hrRUfbJQAdtVuydLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r49fl-007e29-0A;
	Sat, 18 Nov 2023 00:58:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r49fh-007e1O-0N
	for linux-riscv@lists.infradead.org;
	Sat, 18 Nov 2023 00:58:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1700269133; x=1731805133;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RlVcAsZGxSJLqfyCdMkuycrkSwjQfpaBCIp0emxMqAw=;
  b=Xbfs0cyjsPp15jLyeNxBvuGLN6sQKJLBf7DUIOIqLY8GM7Qv6ZJSK8xe
   quTKYvOSjbBxkpt4sV4ADd+iBEHyWP7KmbGYhdtW257weVw870LnKw7nL
   P4swEYuGQxBcmG+nI1uEZAJYJPQTuOlU87af7kSZBrPieFSBO5f7mgGTb
   MTobjkisFNUHldMvCq2xcCyMF4AjhdXlK/93Wv58zf98vfA+Qn3j4f0Ep
   gzh4mTQ1xbGpKIGSwvlQChTEpdTmhrKi/oaulALsOcqQPElSk8l5B6/8R
   YsGj0/vgtFaiwAnwzJVZDOaFOjstqCguGRB1G/ahpVjh3RW6aJWsWB3Az
   w==;
X-CSE-ConnectionGUID: T+AnjKmbTAWrbXkwqgW0bQ==
X-CSE-MsgGUID: vHN9VTCQRdG+48bCI9fe2A==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="242595989"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Nov 2023 17:58:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Nov 2023 17:58:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 17 Nov 2023 17:58:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ykh+fQGjG5vOIBKsy5qrfOyGBr1vMiEZ3Ei3hNxXDFkbg7oWmq3HLhlrmx4kOmkeBN6GqFuG6Nt96N0B5G5lPUQQqFRjIuSHGvxr8BNa+AYcSX+PfIV8+h8cZAnj5pHZU45AFcVDVy+QuBfX8A/IFrJAZi+SG7q1q0RRliyqqyf1WW5BA3+P8t0bUj0Mb5fOt/IyVzlb+uspDR/oeY3lE6+QtOw1BgA29Vaa4CIqSS/V77TNsVhQ+ve6aOf6tDvYfXLDdEcnyQT5nqXgNytlD7S0MGx9hGbOga+oTef//FWg8IiMt8l8V4QajQ83O1ur4AW/rfZsHXJJNEKOS2Lm5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlVcAsZGxSJLqfyCdMkuycrkSwjQfpaBCIp0emxMqAw=;
 b=LWwL65kCj2G+k4ZddWCifJMe6LugKdXJbtRiQhJ9Vw3zH3db45QSUjZih1lxhSejclir2dzItlpWZ4mDy0vC7O6a8WDohiEWfBNSAKYqddvNmNge1Q3cA12RigYKFerOdpS+q4ZeHhTDcAuGUSlVjEunfTgSTwBa8lvgHa2ISWbPwZuvTmsIxxCX3dr1XqqS2rIURHuIZLWKQnCamfWiqf3qltYIzbLy22jLACz1ZwnySRif1WDuUitT6M0pYXUQ74I1VAg8rSvkl5YYsUDON4/rCflnKTfSQLWYJ+h5sGabTeMb1joUq0Pb+flkmNY9h8YMtfWQHXbW8Xw8LflKNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlVcAsZGxSJLqfyCdMkuycrkSwjQfpaBCIp0emxMqAw=;
 b=wgHQ8BH2rSOFY99iAMCi9RPWEw/hNT/I8h+vyCX+vjP8FLXPBSI2TD2G28yGycK1stBjaQyS9bsq8kO3/mqepGwGX1vK+UGPRUtjXbtCXaG9kAj1XfjGkkQU8/hP5AJqrqexfZBXriv4JMOnYFo93SS/IR/BO3hVhzQ6hDFJMPhuAAbZJCDzNOfCXUUIoaLsmfqe8vvEOr01hPZBNNVhdxn5A5dZPfsXucZ5++kBzPQINyURhTuSXAUQRUtgYhJAI0/vzgAvop9Zj0sdYgIeluJ4ejTos03LIQtosmUGSOvLhaD7Ik4Wd5W27jsywVzYOKHSXKb7VeeIq1WJzrKzBA==
Received: from LV8PR11MB8678.namprd11.prod.outlook.com (2603:10b6:408:20b::16)
 by CH3PR11MB8240.namprd11.prod.outlook.com (2603:10b6:610:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Sat, 18 Nov
 2023 00:58:08 +0000
Received: from LV8PR11MB8678.namprd11.prod.outlook.com
 ([fe80::c99f:310f:d10a:34d0]) by LV8PR11MB8678.namprd11.prod.outlook.com
 ([fe80::c99f:310f:d10a:34d0%4]) with mapi id 15.20.7002.022; Sat, 18 Nov 2023
 00:58:07 +0000
From: <Conor.Dooley@microchip.com>
To: <inochiama@outlook.com>, <conor@kernel.org>
CC: <krzysztof.kozlowski@linaro.org>, <daniel.lezcano@linaro.org>,
	<tglx@linutronix.de>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<unicorn_wang@outlook.com>, <guoren@kernel.org>, <jszhang@kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: timer: thead,c900-aclint-mtimer:
 separate mtime and mtimecmp regs
Thread-Topic: [PATCH v3 1/2] dt-bindings: timer: thead,c900-aclint-mtimer:
 separate mtime and mtimecmp regs
Thread-Index: AQHaGRP3NnIUDpWQg0iOY4D1arBpnLB+W0AAgAAWQYCAACFuAIAAlbMAgAAZy4A=
Date: Sat, 18 Nov 2023 00:58:07 +0000
Message-ID: <cd5e88b0-db70-663a-6436-e892f589e3a3@microchip.com>
References: <20231117-kindred-manor-863549870bcd@spud>
 <IA1PR20MB49536A1E4C97EA62558C6CC3BBB7A@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB49536A1E4C97EA62558C6CC3BBB7A@IA1PR20MB4953.namprd20.prod.outlook.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR11MB8678:EE_|CH3PR11MB8240:EE_
x-ms-office365-filtering-correlation-id: cf6d058b-ecca-485e-e0bd-08dbe7d16dbb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QMa9FYmROwRJPM+nN/GUXYiT7utCxIiGaNu3QXTVGD+0uVRSZVcp45uZRPmI340EgZHO6IIJrOqYQtQo1nKUrowym0UYEgpLPIuXeNOsXcAlgMvxg3+NFm3rnWsbLYcj3Rbh3jQlZcaodsDq1MInNSlg4SzHMg3km51lblZ/P/e3umaORY8eU6uzTe1BSCxyMOKUv/LJ0QXqHVeCzZotGxXI8pSrbwJjwzEriP1BZ7d1fSEzGIHXTjpdQQrNOuBVQ/nclogz1GlbbZb6oj2AiYhav/fZ6igNZ7OpJaVRDGjVLhRpkQvWKsYWbffd5i2H8rkAWAXYpdPzb019riA+fsB4ZGpVXDyys9mki4K8A0CH19E9+UgVADFx9AI9XXA6mEAAzf5hb63XxEcSFXfLNXe4esYOaO48URyxWzZU1WBvyjuZpepjbPFTjWKLJ+wKFBTF//hkGlSwLSeLnW8Ib7NcBl5TUoafJQTw48YCvrh+EGXh9ao24kl5s5mFO/kVF11AQIFcuLy9STTMc8QpDwr7RWOOBIClGUetiE+yf3Di3e0ZAOCfQozG+MObv/Yi+mht8wHFPh8UhhMWCkGEj27hNAhrKYpwrAhqwTeZqdBslNGT1DzMY2a8ZaP8BGP4cUP8+EIz4Kk6aNgFMIOwugCt5qQsVcn430CJY4/66xZbUzw/+03870hrCD6ReF4s
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR11MB8678.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(39860400002)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(558084003)(26005)(41300700001)(122000001)(31696002)(36756003)(31686004)(2616005)(6506007)(38100700002)(38070700009)(6512007)(71200400001)(6486002)(2906002)(7416002)(86362001)(316002)(66946007)(5660300002)(66556008)(64756008)(54906003)(66446008)(110136005)(91956017)(76116006)(66476007)(478600001)(8676002)(8936002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OU1jS2o5ZmVWMlNNeFM3cWZMcFJuQVQ0TktRTURCeG55bE1rTUJhTXhPQys4?=
 =?utf-8?B?M0RpZGVKdlFQRmZGYTdFT0QyUSt3QlNiVFdXL3lwVFpxcVBtZ1VrUmROOEk2?=
 =?utf-8?B?Qi9pcjBXS1pFNHNVRFVNeHdiSU5QRmRCL1g4ckQ4dGVnWmszVmIwZUNwbUgx?=
 =?utf-8?B?Zy9SY2JnRU5sc1JtSWF1NTZwdjI5cTB1RVlGTkxGWVhwbUdNNFNDTFpDRFo1?=
 =?utf-8?B?QmlMZWFHeGRMaW5yUnBOdEJDWi83ZDlnL1lZNGpFOXJrUjZpSm4wdWR6aVBj?=
 =?utf-8?B?bVlPZ3Mwc1h5QnlNa0dUb1BUTWpacFB4b2xqRE15NzNkd0ZZWjA5U08zckZP?=
 =?utf-8?B?cDE2Y1ZZSmR2L2E3ZHdUNWRMWWFXM1loT3luTzlraWQxUlVxbU9QVlprL09w?=
 =?utf-8?B?SmZrZ2M0aXRWa3F6RlMvTzZEQVFNbWNLQ0M4emI3R0c4eWh5NThsOVRPMjBG?=
 =?utf-8?B?TWUzVXNOQ09qY2trWTBjWjZPWXB1eDgyd3Qrd1M4MTJ1MUdLNis1M3FLMkgr?=
 =?utf-8?B?SzIzWFpMcW1KRTNleU9nT3lMVzg5MkVsQmpjSnR0bVhQcU5xTEZoUjZlejUr?=
 =?utf-8?B?b3BPRHNCaEp5L2l1d2lYdktRYllQRVFvcmtwK1hPSmFZZ1N2T28vcmQ1dHRr?=
 =?utf-8?B?cExKUlA1am9tQkpDTW9IMGZQVUlnaXBMMEhWREFRRG9XMVBqVldRdm5GVTlL?=
 =?utf-8?B?RytTUUwzR2xFWXZLdUltYzFQWUdPSk5HNWRVVmVtVEEzclNsS3Y0aE9KOEww?=
 =?utf-8?B?bkJxOS9GMjlzRXlpTnBuSWVLUjZUcCtjUjl5R2dZWHR2b3owODRKTEtkcWxL?=
 =?utf-8?B?bVlwSE1sMXlyRjdydVh3WkJwRC85cTRYSVBycEhmRDZhUlJBUWFjb2dYeEVW?=
 =?utf-8?B?NGpWam9TZk5PdldrMjZzT1VIeEh3N1JNYjlSUDBjNUtEK2wvdDZLbGhJM2tk?=
 =?utf-8?B?Y3EyZ2NLc0JQRHVDSjVOb095VTJJUmEwMEI1ZEFiSjNwRzk5dmpQWTArYVFr?=
 =?utf-8?B?VVdNMHJCdTc1QXBmK3lBTkhobHdVenQzbkx2MHdVcm5xaitvdDJVdVlVdHV2?=
 =?utf-8?B?TEplOWxxVnYwTjJ3Qnd4Vy9rWVJIWHlNR2Uyc3h5SlEzRVR0aEVWM2greThJ?=
 =?utf-8?B?VXA4UG9raURvVlIyZGlwWWl6Y2RRYnVWM0pSaWdsRDR3QWcyVzEveVdkenFV?=
 =?utf-8?B?SVowSEpHSzRURk1VbmpnL3BjY1hVeE05UGxZeTRHZy9qWGR6bG01aGpRWDNs?=
 =?utf-8?B?ZDNxVFFxS3B1eTcxV3k2T3NtWU4wRnd3eVNlekoySCszZHA4K2hlNmhJdVhI?=
 =?utf-8?B?VzBMNGorVWV1ZEVVRlhQMW44N3NiYjZMMmNZMFNQdVJhRkY0TGR1emRhOGk2?=
 =?utf-8?B?ejZkemJzYmk1YUxJb3NabDhLQ2tORmNKVENGTzUvTVdFdFJaY05rYWdDR3Rr?=
 =?utf-8?B?a2o3S2dNeUVZQWtKMzZlSzJIYUhHdVRUVWNSNnZIdkVCZU5vaGp2c1pSdncv?=
 =?utf-8?B?OVhGTUhWbVQ5alZxMTNKVVh5MVh4cm9Ja1BwZTJCM0x6aWNIVmkremtNei9F?=
 =?utf-8?B?b095LzdyeGZRRUdORUZJSnAwSXFkMU1LcnJIZXk0UE12NTVwUmhYSTBqV2NZ?=
 =?utf-8?B?a2ZwZUdWTnZBTWc4T243d1Z2SFlzazlUUm45OGlwOXIxSTZ0Z2V5NW5SdVBR?=
 =?utf-8?B?dmVXMTVVU3JCM0EyV0JDaERuT3VCd1ZkR2J1TEdnS0FCWXo4OTRpSi9Nbndp?=
 =?utf-8?B?cWF3ZmtKc3MyN3RmVFhNU2FMQ1lvKy9BeEk1bEtCUlgzSWI0TXJMdURFSVpl?=
 =?utf-8?B?L2lvbnVYc045UWZHdXpveFVqd1hmOVRZR0lkVnZSczRjM2ZLZ3l1OEtLR3Rr?=
 =?utf-8?B?dXhMQmhOUWphQmdRVVdIZldVd294Qm5qRkpLbnJKdnpIdnliWE5RV3kvNkJi?=
 =?utf-8?B?M0h0RWcrQWxyMDRIOHgvcEZFRGVzOGZrT0N4QmVzdDJuRFFQM0FaMkt6S0hK?=
 =?utf-8?B?NGh4Ym1ta1gvQlFYZkVldWowUXNBTFJPQ0h6cWR2MjVldzVkSU5IREpRRXlB?=
 =?utf-8?B?d1FIRGlhRjlDWHNTUkRKQW9OT3phT012UloyaDJwbXlHV0c1eFJDUmxkM0Zl?=
 =?utf-8?Q?PoAhiyRZuC7GjwVNYinX61ZtL?=
Content-ID: <8C2943241FDDB54DAEC03986A0B13BE2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8678.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6d058b-ecca-485e-e0bd-08dbe7d16dbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2023 00:58:07.7976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rq8EJw2E1Hogqts+VUiHUGkO6kR/373XL5q8O5bqcsV24RukNefv1TVX7aHCqHWSdXjwNJXmivI6Rh/CWpcd37athtCcogf2m9uNNnc6HvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8240
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_165853_524698_5ADC1542 
X-CRM114-Status: UNSURE (   8.96  )
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


> Thanks for your clarification. If I understand you correctly, the binding
> should have all registers that ACLINT has. But for specific use case,
> it should only contain supported registers and omit unsupported. Please
> correct me if I misunderstood. Thanks.

Yes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
