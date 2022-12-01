Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EDCC4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 12:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fnkeu74A6SmQh6pxEUevfh56dBOV+6xdyUhKoYlLecQ=; b=hOvpOHKn/A9K46
	bz2KTvH3c/igBVG2AKVgfAjmKKnBIlT+IzW1R23mGX/uSFDDTv6jmoZyVub/ToCAv5bBGOwzOQJjO
	rRf2uDYimurP4tDDWPgHW2v36ihhwr2CN3jeqD5JBnR5KlJCO599X+nneD1jkMtAGPO6yueOu38i7
	hGBU0QTGeZn+oYjEfxXTND+cz6u/ibUm4/M0wEKZtEaU5IP7vyIr4mrOC9e/yCLZAwwu4oHnai9q3
	Y9ktgpThMczEeFQsjIc5J6ZoJv9ivyw9XDJxmGuuXVDGHcTHiXUYZtmquFYl3m3V8O+g6TWSUmZ3g
	MfxLJ6CDidHAORwhIRFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ipE-007Kz4-AO; Thu, 01 Dec 2022 12:38:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ip8-007Kxh-LJ
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 12:37:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669898274; x=1701434274;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=frgx892P5A6NhrU+kultCQzgnTkx2xIr7k0g4GB9XLw=;
  b=IyFeEdhigo8/iOeRbqNqd0d1/CjgknupfvfsKQnJTcp1KUqkdLcsmxcx
   OQAO0wPdujHvTQ6sBTXuGprTKR+bowndj8nyOAztE4chbfNnnF6p5WlU+
   gIrHlt6ZHTJXN44pSv7Fjp5pitIYcGJcHkCIafzpZb9OBVTKqaoikFge3
   ORpV5gJbiDxmyLKhCEB5Vz6rGMJMJ1D+awdeCGiEGs1wK00cn1/Al7uqL
   7LkmHiasvJ8McHZNAbovSrwaUf+bYDcp/EzEHCMt+zjEVLkTOP/nK2lt4
   yA3G+/5kISUV+ZhyjP0xPsizYVmEiTuqZtwidhqV/ui3J7ELlMrH1hmAR
   A==;
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; 
   d="scan'208";a="191286149"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Dec 2022 05:37:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 1 Dec 2022 05:37:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 1 Dec 2022 05:37:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNK9uHjWmbX0fbqcZDLyz9MuvnjPvUoVMvj4ucq4w4+QdIhWLvvoPy0/4dVFXI9FjpUbjcF3Gj3GofgI763kPogYHp7hYPGVsi2db4JGg4HW5ypQ7SGdqYP8KEM6UBZ4Jx8oPFLvlKBq+K8Ep9MkAkwPgM8RapQzELJ8kLutzUPd90KnjOhKbIbAiQ1krSKdx4plv9YsJgdEp8k7CqEdHMVEi8brwwHBTKriep1LHOPiaMnIvUJEForZ/WjwVOFaKoVDElrCbgURcHQp/DW/TpdePzCV8rK2S+fwRfTt97Fm6CG2o9EDEHCRN7NZmUtxriLMl8wxlPn+KXH1o/xRpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frgx892P5A6NhrU+kultCQzgnTkx2xIr7k0g4GB9XLw=;
 b=MuRNFjAV+6lo+l5osOn+cGnfpxv7nfiPOGRKRyEKuGYo2f6Y9rzj42CFPpmdZeDFxywCZjcV6wLnGslkeaLQqoBAjLRNOnuQH9miRfNVkfxr3BWfAKC4Dy+2P2pD3T6eJJbm1U4BnPtTUVJKGhIDQ6SU/liZH4F0n2X/mF0c0njRZtHw+3J0tb/tFFHKPe5/rhYCvLJZ2vgPmIha5TuOLlWEMLOMUXCpaVsgRyj+4fNTO2QDtRXFbtiNmBnNXT64c/y3xMxb6QLM9tM3mzzRLKa/O+jEEoCwomGDsJYWqjXkm3iqsC/99TzD+Q2ueJbp1zUv1GpBEuhf6DCklzNYrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frgx892P5A6NhrU+kultCQzgnTkx2xIr7k0g4GB9XLw=;
 b=HVw9zxZoaNn7JagyI6mHuXguWlbGRINtlNS170qcPp5SD7I1hG5yGF2COnHCOeiDFhBAca2Yl1BncrG7b1Kxy6GNEeevm6Y6DzdDxvr83ra4ebjRKmbcTJYvMBakolNLgPS3qfgrfcKhXMOrYFQr3YNFPR1wUXhHOng2cdRCd6Q=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH7PR11MB6379.namprd11.prod.outlook.com (2603:10b6:510:1f9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 12:37:49 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6%6]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 12:37:48 +0000
From: <Conor.Dooley@microchip.com>
To: <ajones@ventanamicro.com>
CC: <conor@kernel.org>, <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <aou@eecs.berkeley.edu>, <corbet@lwn.net>,
	<guoren@kernel.org>, <heiko@sntech.de>, <paul.walmsley@sifive.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v1 2/3] RISC-V: resort all extensions in consistent orders
Thread-Topic: [PATCH v1 2/3] RISC-V: resort all extensions in consistent
 orders
Thread-Index: AQHZBRVtePpMTlRDd0C09eEQJBtfKa5YvJuAgAA6c4CAAAIigA==
Date: Thu, 1 Dec 2022 12:37:48 +0000
Message-ID: <6c5e52d2-2f1f-1180-a678-5b8ab6b32f39@microchip.com>
References: <20221130234125.2722364-1-conor@kernel.org>
 <20221130234125.2722364-3-conor@kernel.org>
 <20221201090041.525op4sateq5wq4y@kamzik> <Y4ieQf4Q9ywJivDH@wendy>
In-Reply-To: <Y4ieQf4Q9ywJivDH@wendy>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|PH7PR11MB6379:EE_
x-ms-office365-filtering-correlation-id: 0a05093c-897b-44ad-734a-08dad398daec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A7Qxsg0xuxsqlAYiFObVcU1gG6jwDKi3Ltd4PU7kD8khdUkm8n+HfgAMR4KGKxsZFVl/t62Y/J989aFnSUj/TEcyKItKmp8bIda4ZwGqqN7jiNYyMY1NZauHup7autL1x3oaEIOwVEtc2AtsFExi+S6rYo6Gmp7ZtISH7AeJexY+j/mSQJvMXT7IqCEbG6hFZA9+qovpVLkD60OBhJe9Gc7hr49q0fyDUmotgJY4YsAUJB/EqHqJ0CWQRpXptnR67YzI1SiC89hnsdMT16ktJkKU6V86Az/SRTw7Ggurub/jrz14U/pAk/2FFJN4iBwBTCnQZDpmrTC9cdyqT13DysXWGbQeCKry9vim6SeTeYS8mPezmifmLkDhC3w4OP/09UayA8T0Y6cd+0tEEDVvmESUt4EPl8uJhNv3HV4NIXT170n9W5YKjZ219tHxWc/yjS4MgPv9SucUhkReFxjfymbM4PmKDE8Eo+ybvSSB371WoLoBY+OtFy4gr5LBmtBsWbQfN2l8rr6nR/ecU20QvaPMD3G/Kl5YmvLneGg0DY69JF3a+PyoNmcFpzxkHVlr4W8hiFO7UKWWgsyAico+fgWyZuz/3O62Aa6RwqrB/NOzCUNC4hCfr0vUfLvhODv5rlrpSfag8GL9iwrBzVw39DaWmbpKcHUfwKZjq+O7EWifEwf3v2xETfkrko4YJWuiIa60A/eg8f2/tSpyr3w0wZXmjwkMm3ZuGuB6+RmM7caWzHIYHDbrrzjiC07zfnOJD2GZv9vN1EmsCsKfy8A5cWnsXPcmOdyCwxL5zi8jxME=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199015)(91956017)(66476007)(64756008)(8676002)(66446008)(66556008)(31686004)(41300700001)(54906003)(6916009)(316002)(4326008)(76116006)(7416002)(66946007)(5660300002)(8936002)(36756003)(966005)(26005)(6506007)(122000001)(71200400001)(186003)(53546011)(2906002)(6486002)(6512007)(478600001)(2616005)(38100700002)(31696002)(86362001)(83380400001)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czU0b25UL2svdXYyMWJaMldLTk5Pblh5dWtRaG92emN5bklEcXcyR2xGWURz?=
 =?utf-8?B?a1dxWW9PdzV0ZkVjVHI4ZUxKMXhkWDQzVjV6RFM0VnFnQjI3REJlNVpNbS92?=
 =?utf-8?B?cXVKWWZDVjFwNVJuVlhBRUR1TU8rbjBVY2graHM4OVRaMEdCbm81elM4MmVG?=
 =?utf-8?B?YVhwM01SdWpJMVFTdzlFaXBqQkV4K1hDRGFWV0J6dTlrYkluTHVMZmNlbHVI?=
 =?utf-8?B?a0VvcTE2TmdVV05JWXdFZTcvVnB5Q3ZDUzFGVHFCT01ZZDN5RitmUmtzSmxO?=
 =?utf-8?B?cFFQV0RnSk5wUUdtdG9wU3ZtdVpTQnJ4Znd0ZUQ4Q09nQU03enordkZKZ0pQ?=
 =?utf-8?B?QVd6ejNvRkdjaDB6VzF5YUxFNThzeFExM29GL09kSXJ2NldRVmYvZklBZnVS?=
 =?utf-8?B?cHNoc3NCaTRSWFVydWtIT1hOclZRa0xhc2dpZ1BzSTBiQzVuWVhxb2VuT0lN?=
 =?utf-8?B?Zk5IQlk3MlZDZEE3Q2tFcWsyYlR0RFdkZnoyVzN0Ri9qR0lSaThOcmZDRVdM?=
 =?utf-8?B?VGRBS2d4ZGtKVlgzTmFzaGhmNWxBNWZNbUI4MXFtUHg4S0d6UG9KOXBkcDNi?=
 =?utf-8?B?TVhLQXU3aVk0djVzVDdqVmVYbEpvb2lXYmtZWTM4N2FLTSsrTzhLT2R3YXBN?=
 =?utf-8?B?V3BmV1E0Y1JZNFZyZE1vSEQ1eXhXelp3TXFNVklxblVyS1JIQ1R6SlhaQ29p?=
 =?utf-8?B?MXFmVG5yZE5Jb0FiMXdQandJUEhRT1ArUVVKNjVNd2ZtQmxyRzVLckZRb2I1?=
 =?utf-8?B?N1o2UVY2QS9RakxRNXdmSFErK2dydStLZFlXL1pjaStWT1hST01OdCtzdzVF?=
 =?utf-8?B?bXV1SUhzVGQwa1ZnNC9PZDMwVEdKTzR6eGNzeVZiNTg4a212a0VPUUpzQWc4?=
 =?utf-8?B?VGlYbmF5dGhUTkJ0M0FSUTdpU01UbGRDOCtZWG1BQmJMbzNvOGZzTmlmWGNv?=
 =?utf-8?B?bFBocWlob3NRN0wxQ3hkazlGRDFERmtsQm9QcG5zSm9Wd3Y2bGROTVg4OTFR?=
 =?utf-8?B?cTd0QkQ2NHFJQ1QxN0x5SWlmNmh6b2pOWUh2Z2FLVkNjd2hxcHprWmFnNDRE?=
 =?utf-8?B?RlZ5Zmhsd0RwOHFnd2ZOTU1qelJuaUFYcnVTNlhMcjB2Z25uZzdSbUZxcHc5?=
 =?utf-8?B?VWQralpnRVZSZGN6TkM0bTlzQldIR1Z1NnZub25RdHEvck9ORTlYZ1AyT2Zy?=
 =?utf-8?B?UUJyZXR5RnBCNkswWVg5bmJHUW9MK1hyK1hVcGZVVFVFcTVNaTJzUDQ4VGE0?=
 =?utf-8?B?bENnb0RNQnE5cVdLZUhZQ3dpUWlLcGd2N1ErT3doSi9Kd2gyc1RrM093TnVi?=
 =?utf-8?B?dEZxQ1FMR2JTZzk1aVEvdStoejRyVUdJdVJBT1JSQ2swZC8zU2g2azJ3aWdE?=
 =?utf-8?B?cFJoNFBCYXVqbjBCYThiN3ltYlRGUGNhUGZSbzE4NDZ6cWsxQVRlL2ovOWNx?=
 =?utf-8?B?UnNzWUE3MTYxeWZ0ZjBBNkZXTXdMYVcvc25NSUUxMWNqbENiMjRGTjQxakVF?=
 =?utf-8?B?TE1lWVpab0JOV3o2R3I4VTJYdHF6b0xUOXpQamczNXZJNlkzK1dnajZ2UVdn?=
 =?utf-8?B?eE1CRXhHSHBya1JZd3o0RTUxRk5HMStCMFplSmtXdFdRWXUvcHJzZHlCbVBN?=
 =?utf-8?B?RUZtdWQ3QnRGWmFZWkI4SmFlcGRzb2psc2xTaFRzYTd1VVFUTG4zZjYyWUd3?=
 =?utf-8?B?L0p3WkJLSTd5eEtHMlRzTFhHck1lZUllNmRmaitmRkRFYlZ4Wk4xQ2tyR1Vw?=
 =?utf-8?B?QWNCZkRDczNBeHNZNjFUSFVoalFFOXM2bWttekFxVVdPVHVJb2lGdzd5c3NZ?=
 =?utf-8?B?UEl6Qi9QV1RoeURCOGlWc0I0eXEyQlVwekltZjlzQUQ2QjBUd3RlUSt3Rnpn?=
 =?utf-8?B?NEhwZlZwZC93QVF2V0VLTWEvd1ZCTzhUN2tSZ280TjQvVHRMUnRjRnNWUExz?=
 =?utf-8?B?SGQ5cDVwaU1xb0R5VlRZZE9tN3p4SEpSUnZUM1BEem05R3dlRHRCUXRGbjNl?=
 =?utf-8?B?R3g1VkxjRDNiWEcrVm5mandPNXNFWDJtd3RySEhDMU13UDJ3M2JMUjBIZWxx?=
 =?utf-8?B?SXIzbUoweU53RWNOR3NyV0JoMjI2TlR1WGN4TTE3anhvSzZYeTFMOFF6OW5j?=
 =?utf-8?Q?72yfWRVlIg45hGRqHkDMR3cB2?=
Content-ID: <B687F347FB7F624E92F650254E1ADB37@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a05093c-897b-44ad-734a-08dad398daec
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 12:37:48.7609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bnblTdXVJy5avTG8MEWXx8mLcoelp8s5rjUeYjnU3yHMqW8IsQn8YTb4PpZaR73/PgJyfJjKIHT1Xtjd0HvWXHpMmp/oOTcQr7yjiTW9q9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6379
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_043754_944897_97EAAE82 
X-CRM114-Status: GOOD (  18.89  )
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

On 01/12/2022 12:29, Conor Dooley wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Thu, Dec 01, 2022 at 10:00:41AM +0100, Andrew Jones wrote:
>> On Wed, Nov 30, 2022 at 11:41:25PM +0000, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> Ordering between each and every list of extensions is wildly
>>> inconsistent. Per discussion on the lists pick the following policy:
>>>
>>> - The array defining order in /proc/cpuinfo follows a narrow
>>>    interpretation of the ISA specifications, described in a comment
>>>    immediately presiding it.
>>>
>>> - All other lists of extensions are sorted alphabetically.
>>>
>>> This will hopefully allow for easier review & future additions, and
>>> reduce conflicts between patchsets as the number of extensions grows.
>>>
>>> Link: https://lore.kernel.org/all/20221129144742.2935581-2-conor.dooley@microchip.com/
>>> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
> 
>>> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
>>> index 68b2bd0cc3bc..686d41b14206 100644
>>> --- a/arch/riscv/kernel/cpu.c
>>> +++ b/arch/riscv/kernel/cpu.c
>>> @@ -161,12 +161,12 @@ device_initcall(riscv_cpuinfo_init);
>>>    * New entries to this struct should follow the ordering rules described above.
>>>    */
>>>   static struct riscv_isa_ext_data isa_ext_arr[] = {
>>> +   __RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>>> +   __RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>>>      __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>>>      __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>>>      __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>>>      __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>>> -   __RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>>> -   __RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>>>      __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
>>>   };
>>
>> Technically we should have leave these in the wrong order if we want to be
>> strict about the ISA string published to userspace, but I'm in favor of
>> changing this array as necessary and hoping we teach userspace to use
>> flexible parsers. Actually, IMO, we shouldn't teach userspace to parse
>> this at all. We should instead create sysfs nodes:
>>
>>   .../isa/zicbom
>>   .../isa/zihintpause
>>   .../isa/sscofpmf
>>
>> and teach userspace to list .../isa/ to learn about extensions. That would
>> also allow us to publish extension version numbers which we are not
>> current doing with the proc isa string.
>>
>>   .../isa/zicbom/major
>>   .../isa/zicbom/minor
>>
>> and we could add other properties if necessary too, e.g.
>>
>>   .../isa/zicbom/block_size
> 
> Yah, this all kinda ties in with Palmer's RFC set that does the hwcap
> stuff. Kinda been holding off on any thoughts on the isa string as a
> valuable anything until that sees a proper respin.
> 
>>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>>> index 694267d1fe81..8a76a6ce70cf 100644
>>> --- a/arch/riscv/kernel/cpufeature.c
>>> +++ b/arch/riscv/kernel/cpufeature.c
>>> @@ -199,12 +199,13 @@ void __init riscv_fill_hwcap(void)
>>>                              this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
>>>                              set_bit(*ext - 'a', this_isa);
>>>                      } else {
>>> +                           /* sorted alphabetically */
>>>                              SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
>>> +                           SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
>>> +                           SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
>>>                              SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
>>>                              SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
>>>                              SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
>>> -                           SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
>>> -                           SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
>>>                      }
>>>   #undef SET_ISA_EXT_MAP
>>>              }
>>> @@ -284,6 +285,7 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
>>>    * This code may also be executed before kernel relocation, so we cannot use
>>>    * addresses generated by the address-of operator as they won't be valid in
>>>    * this context.
>>> + * Tests, unless otherwise required, are to be added in alphabetical order.
>>>    */
>>>   static u32 __init_or_module cpufeature_probe(unsigned int stage)
>>>   {
>>> --
>>> 2.38.1
>>>
>>
>> I realize that I have a suggested-by tag in the commit message, but I
> 
> I did one thing as a "putting it out there" in the responses to another
> series and you suggested something different entirely. Ordinarily, I'd
> not put review comments in a suggested-by, but figured it was okay this
> time.
> 
>> don't really have a strong opinion on how we order extensions where the
>> order doesn't matter. A consistent policy of alphabetical or always at
>> the bottom both work for me. I personally prefer alphabetical when
>> reading the lists, but I realize we'll eventually merge stuff out of
>> order and then that'll generate some churn to reorder (but hopefully not
>> too frequently).
> 
> Think I said it at the yoke yesterday, but I don't think that this is
> much of a problem. If it gets out of order, we just get someone that's
> sending a patchset already to fix things up.
> 
>> My biggest concern is how much we need to care about the order of the
>> string in proc and whether or not we're allowed to fix its order like
>> we're doing with this patch. I hope we can, and I vote we do.
> 
> Being a bit hard-nosed about it:
> - the spec has said for years that this order is not correct
> 
> - their parser cannot assume any given extension is even present, so the
>    index at which the extension starts was only ever going to vary wildly
> 
> - to break a parser, it must expect to see extension Abcd before Efgh &
>    that order has to change for them
> 
> - expecting that a given pair of extensions that appeared one after
>    another would always do so is not something we should worry about
>    breaking as it was always noted in the comment (and by the specs?)
>    that new extensions would be added in alphabetical order (I'd like to
>    think that if a clairvoyant wrote a parser and knew that there'd be
>    nothing in the gap between the extensions we have now & what may be
>    produced they'd also account for this re-ordering...)
> 
> - the re-order of sstc is going to land for v6.1 & the addition of sstc
>    out of order landed in v6.0, so either that is an issue too or this is
>    fine
> 
> I guess I sent the patches, so my opinion is fairly obvious, but I think
> we change it & see if someone complains about an issue that something
> other than a re-jig would break.

typo: s/would/wouldn't/, that changes the meaning of my comment.
If a valid addition would break their parser, that's not really a
"uAPI breakage". It's only something that this re-order would break
but additions or valid change of the string based on cpu capability
would not that we need to worry about IMO.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
