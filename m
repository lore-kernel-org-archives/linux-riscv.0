Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE92C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 17:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uA0L86VryRtKKXKNjPK/1HekKBJfFW1pWn8qBHlhqko=; b=UcLzdX+wYVGAvl
	fQqFvQ4JlYtUZyMintVGjjyJjyu+7lwAG/lwHbQNnbzpGJ+9Pq4uGThm3KcEmEer15YN1A3hCCsgy
	kdomOTwlAoPPdHB6yPdqbG0DRqMIUFIdRWfwD0AQQzG9uF61C2I81siodu48EQoGJdq/Aopxy5vr7
	YJwN8f7HR54gwmeQmpftq7jW61p0pbUvS5oQQ6Et3NO34MKNvLqV2SMmG5FNUpoeZdLAfkG3rSWJO
	cF/F1GzYxRfInje15AjdbjyzQiBrn2zAZFxiztEHpB0oHUfYWunEAa08P3VtwJTWfqnRj0lRhhVHO
	7Q+E981JiVPmMzLo7tnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCPHE-009CXC-4R; Fri, 15 Jul 2022 17:38:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCPHA-009CUx-Dq
	for linux-riscv@lists.infradead.org; Fri, 15 Jul 2022 17:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657906733; x=1689442733;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=gusHs5Qe608KYGgnEvPBbVNpR3hbdlG3uGG+g45HrEc=;
  b=rhf2nczpQTC0VImBeo/BW7OCoFG04A0KlAJYoh3QzmOKvcL43zkIsOp0
   lIkwvLRvP1s2mwADdwQgNXKpV/xltKZ05DqdBiw0VZU5sZsCh9HP1TL2y
   DTXyIxB2dWwbrqkcweIiei66HbB9Tt8sm+3JMbOFXtMXhLIrVUwB0uUb1
   dvsL9m9M0ts6DiXueupWLSRPiT0iZcMZVzB83FSJCfe7ibOtThclfps8d
   2OssXelASxCTzGX2H2o/80ZMFBs3TIgrNbbjopsEkQSDtHeOXSmDChOYn
   bcisx+YcT+LikPQH+rWLdIAmNMWx2Er9M4Moh2dG2LWGkfJW2SThWDod9
   w==;
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; 
   d="scan'208";a="164955227"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jul 2022 10:38:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 15 Jul 2022 10:38:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 15 Jul 2022 10:38:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W07yCRT+42lpyBhHHJEpfvR8zRte4aFTqzx4X5ZBIboMkFIidR+ZwlA9tLBH2pmuwG1M3TjCbucs8J2Z2UaQU9J5KmkTpaIsAS1SnxaVdvtUdyrGMuQfqL3MRHkXwWcMgJUqC887Nl8rpepBf2fqS7vZHcJp309hDLhY5yw9EYWVsLtZgMbFwFBT1MqjcPCvWHmxAjq9OC6GpkrMsvEESU+WDBQoq9cFelibpP7mevy2Ml4HsYa3Kpffq9FS2nrV881gJZekcEr+icUFureQp1us7BPvAeY+QHM67DrDmYSgjvrXhQ+o3rLn8ZZoj2MMfsqoRMVau899Jbpboh+DOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gusHs5Qe608KYGgnEvPBbVNpR3hbdlG3uGG+g45HrEc=;
 b=X5zFw+Z+0wbinbBCYbDwVNouiXGWbZy6uBQkSFTQgWrp69X3wesrWmPMpV2qY+IJLp/0kFJYKOgYQR3064BG3Gt4uJ6s8EFBQnAhcrG1K7PayyYV645HmsEr3OTddkIIaZr8yaHjv1+PNe6QxTqYnT8c1e2C2EQH7e5XbiHZglUBMJopLPzDDUJFLe6a8XFGfKH7O+QG6EQbeFSyahd0a9L55hUnkyhWkvTPwPvya2RAEW7vjF6/wb+PcEyXjEuQ279INDzEiRg9a88t2eZK2UWg+foX/0BEHbACypMqnLisF1m0qffluurOV6XF0lKK9SvSrZ0SgSCY43iAKNyHBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gusHs5Qe608KYGgnEvPBbVNpR3hbdlG3uGG+g45HrEc=;
 b=S4cpOwx5NIsq0CkqUNlu/j5Mqvy0iYbb0Tt3grMq/eWMmOvO+nXpTeU2Bi4P0sOt8yPT/6/mVBAXL2cn8AOGOil6LzSyshrZY4wbDRZT4ZHjm6zhLTcpdZKMmmTIdknuqsUVjzhGD2tjepDZL/2ygsVaj95k+gz8Nfls7Ju53AY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR11MB1478.namprd11.prod.outlook.com (2603:10b6:910:8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Fri, 15 Jul
 2022 17:38:36 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.014; Fri, 15 Jul 2022
 17:38:36 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@rivosinc.com>, <conor@kernel.org>
CC: <Daire.McNamara@microchip.com>, <Ivan.Griffin@microchip.com>,
	<linux-riscv@lists.infradead.org>, <Conor.Dooley@microchip.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, <atishp@atishpatra.org>,
	<sudeep.holla@arm.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: dts: microchip: hook up the mpfs' l2cache
Thread-Topic: [PATCH] riscv: dts: microchip: hook up the mpfs' l2cache
Thread-Index: AQHYi/R2cChvvgAbdEmXdeD6+mo/Z61/ybQAgAABzYA=
Date: Fri, 15 Jul 2022 17:38:35 +0000
Message-ID: <1804ca07-253f-c4f3-1328-e2e500b9dd9d@microchip.com>
References: <mhng-08c6a73b-d3f9-4776-8efa-d98175c957c1@palmer-ri-x1c9>
In-Reply-To: <mhng-08c6a73b-d3f9-4776-8efa-d98175c957c1@palmer-ri-x1c9>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5cb38bf4-d9b5-489b-b61e-08da6688d87b
x-ms-traffictypediagnostic: CY4PR11MB1478:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vu23BnabXvZ3Stu5JnMiA2MG9Dt2fLt+NkMjOa/yQXjyxScp5zCNSCRGXKxJdHQWD9DbvDfURpiOMIwqf3sWNFOOOppFCDrAtZSAFponGxUUOuoPPpn5Aherg3A8b9OOvUSQ6+0mC/d7kEXOmZjHVoN3gdcc7fR2TqtOLNQXpUHm2aTHDozJfSpJsOKeeCrxmVgsEpux+Wx6N212O81rhwLB3ansyPJG/srG3jSkBYwx+MXhkUSxpQT8NxdntAso2Tu3Pb2NQF+1sqn/XSsSxOs5cCIMvxL4HjEPQvSX5ZhV6UaDzDfFXmh5ucS1AjFCOlpWb8myu8uxGi5/OGdlQSys2Kow500pnFrNWYER64BrrVuml3GRfYSHY6qKMuE98jCPMqR5fx4/E76XfiBNToqkZim0giU4PlttkVXPEbDTh6yj+Y2Q0emylJ84F7pcq+qgA+3qyxITJPzkkMDZ8DVwoL0V6MfU9dn8hWaH3ZiLtl0SoOix4rlU8QUQv+b8lFr+Y6QlCfCRsE6o1A2gF3Yg4MPT8h1tGQqpLGKidbAOI9GwikKpHfrpzuP9//rYYCU5O86jd3usSdww1EBoBrMhRaW/CraVGr4vB7r9HA5aLo8TM9XSpCULcR0J1PFvBUlAeYWPnzYFga3VaJS8tZ56Km60C0zsZU2cqkGGbLBsPVArUB488ay5IDKnGwcRV7Gca91B8q9hpU/KZIyw51XQn/zPe830jPnilD2SNzus7Jbj49mycXRxrvzcscY4F1ecis8ooYIXKrOkNtJjW1lhpzlGqz4cX5fGWNcaVPW3cx61Kp2C32g39cbWLDCQqar6RZEN5hy/ZVuOoFoX4JFWD+t6jLgPM5Ag9tY3/8oDb/jyhLgplFKCWIIHu6/QLcNJnxrLvYCARlfStoqP4wqVM2EQ+wFKaobqSC4hzkXvrOBpBRvbxVmorUqtz9UM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(376002)(39860400002)(366004)(346002)(4326008)(66946007)(186003)(8676002)(86362001)(66476007)(76116006)(53546011)(91956017)(6512007)(6506007)(64756008)(71200400001)(2616005)(6486002)(66556008)(66446008)(478600001)(31696002)(26005)(41300700001)(38070700005)(110136005)(54906003)(8936002)(2906002)(38100700002)(36756003)(316002)(31686004)(122000001)(83380400001)(7416002)(5660300002)(52103002)(158003001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmpGYmNYSHR5bXptaGNkNDBlazViU09ZaU9VMGlidHV1NFdUYzBwcmJib2lh?=
 =?utf-8?B?M2VRdFMyNnc5TWd2UDg0cXMwZ0wxTytRbTNuSVpSTmdocjNQcU9uVnNEa05W?=
 =?utf-8?B?TmFHZWUvN3pxNjliOUtMNmFIOS9rTU5nZVdveXF4WmNiSDkyVCtkVWJYUDJx?=
 =?utf-8?B?ZkdFSDVoUHhocmNIZVUxZk05OWlmZjVzVG43U0NXVzdKWFhuWGRUOHdqUFdu?=
 =?utf-8?B?NGIycG80RVNYQlBFVXFOakZBOFZuakJla2FIS2JLTjNkVHVtRmdwMEN6ZWxP?=
 =?utf-8?B?VXRwT3V2bURmdFBNd3ZPVEVFVHhxeXNoZTU4VUtJQWVOREg1N1QvbTYySDN4?=
 =?utf-8?B?aHlZK1VqakwxMEFBN0U3QllRTHBuUk5TbEZvVm05UkZPVFBVdHRmS3RDd1ln?=
 =?utf-8?B?RUoyZWdjRmh3UW9BMU1FYlQ2K3liVUx3RDI0VldCMlBOYWpmQ0pNaEI2VTdu?=
 =?utf-8?B?Nzl4U2NPMTlOWEV3YlVia0creC9hd0FOV1hLRmUrcHF5T2JNSmIwQ2kybmhy?=
 =?utf-8?B?dG9NaDM2L2lhNDRyZ1hBV2dTbHBubDc4a1RVSXIyZ3FxVnVxTHRIa1R0b3J5?=
 =?utf-8?B?eEZrQ2oxRjBZWndCbGtKb1FicjlGbW84UFB2SDB4dHhXckJ6TVlwcXF1d2hL?=
 =?utf-8?B?dUJOdFpmQlgySjlsV1RyR05LRXNOek51cDZWWXJENFRLSTV2QUtlNGNvUVVK?=
 =?utf-8?B?Q3pjSlZHdWpqSlBMcFFremJLbHFORG42cWQzRnNTNkZ5TUlDWmZmUVoyOVZ4?=
 =?utf-8?B?R0pSaG1ZdCsvQ3JsbEFDcG8rV2RhOGUzSXB5RmhzR0xHSFRYN20yb2xqdHF5?=
 =?utf-8?B?UTZFbmViVXNSWFRWREJYYlJjVkRYbis0UVRJOFRWL3VPT2l0NTREdk5jU2FU?=
 =?utf-8?B?Rk5OZHpCZjBBNnNXdklDZGtyY0FkZlVUMmhERDQ5MFZ1b3pXODVmTkwweHJ0?=
 =?utf-8?B?dEJSMVpkelcxMFpMMHB6OTIwTyttTmNTTE02N0FFaXRTcGdwaE43MCtHTnBl?=
 =?utf-8?B?UC92VnZKUGlVakJmNFBkZlpyd2h1emhuUG9uSW91UHVldnlrVm5IS2dYeUxz?=
 =?utf-8?B?NUg1Q2dqOWVlWEVWSXYyU0liU3FjSzBZOE03QTU0eUxXLytJamw5cVJYRCsy?=
 =?utf-8?B?Wk5jMXlmbU8zUDBZWWtyVU5KbUlJRURnb1BCSGJJRDBENlRDbE1ZN21Vc0Vt?=
 =?utf-8?B?VEdpcHlGQ3l5NDkvQ2t6NzJKT0ZJNkRQMmF4dVdpSGNrdzBPK25meEJaMFpp?=
 =?utf-8?B?dFNFMDNlOWFSYVV0VEI1UkltRTg5YmU0Sm5JaTIxdi91Q1RNVC8wZk42Ritr?=
 =?utf-8?B?SkloM3FmRTlYWGdZNzB6M2tpNEl3cHlyaXVjSnlxR2tqb1RPcnVHUFJPNWs0?=
 =?utf-8?B?d3lWMUZRT2NoeGxDSTVSK3JIVDNRS0p6VVJ2VDBJN0o4aGVUZnc3cW4zVUI1?=
 =?utf-8?B?dldNZ01SeDlrcW8wNDI1V0phajdXbHRuZldRV3NiTVIwbDNxcmlYN0FaSURx?=
 =?utf-8?B?T0VnSDBrc1lPYjNjMnpJZ1NJazhWcm5lRDdSL0pSNWJENG8vWVBLck5nNVBr?=
 =?utf-8?B?Y2l2eXFHRDBGZFhUb1kzWldpU05Uc0tScHRVR0tQK00xdUk1bzJXWE9mbFlq?=
 =?utf-8?B?ZFdYOWZNMlZoVUpQM21uckhFUTFSZVF1QjRLcVY0b3puaHlCZTBOVURJcFFO?=
 =?utf-8?B?THdKVkl5Wmd2OTVadGF1NXh1eXlVU25HWUROMHhmWDR5K3Y0azBxcTk2SFow?=
 =?utf-8?B?ZzJuVDJhQkVyNWFxQm9aZitFZTk2aEF2MnBzd3M2ODVpR0Vmb1M2UDJvb1B0?=
 =?utf-8?B?Q0JyWFFuci80dGUrNWtBN1lrY01SY2lTMVFiZ1VJVXNGc2pkbU5BVFFQSFcw?=
 =?utf-8?B?d2k1QW1aeHdudE92dVBNbExVSmsvcEVMQkpiOHh0dlQ3MnkraWdMZVdDQ3FI?=
 =?utf-8?B?TXFuNzY0eEEvUzRsMVVmamtpTzJkMlBwSmVrWUZtQkF5WXcwOWM4WVkxMWNG?=
 =?utf-8?B?cG56SGpXSk52WmprMUhxbzFkUEtQd1dMN3FKd29BNE9PakpXY29TMVFvK3Jm?=
 =?utf-8?B?SkNtdXZvTFhXczJldW5rSUVETS94VDJBOWZuTThrUEM0TG5hK3B4bDRHazV4?=
 =?utf-8?Q?rcC8S2MNA2YbkwdXfex7niSLr?=
Content-ID: <5726BEDD97FDFD4F952CB27577B0CE52@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb38bf4-d9b5-489b-b61e-08da6688d87b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2022 17:38:35.9449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nQquvKpbt4xtsBEzDAENQPEKvHpsMgS4NXwp4kizpalYyviSyA/4sYQ1S9RWuB07n7ySLpb0/jW9g0tC1eqNlrX1wVXN36QAfDqjxC0Cgr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1478
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_103852_808225_3E15B66E 
X-CRM114-Status: GOOD (  12.46  )
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

T24gMTUvMDcvMjAyMiAxODozMiwgUGFsbWVyIERhYmJlbHQgd3JvdGU6DQo+IE9uIFdlZCwgMjkg
SnVuIDIwMjIgMTM6MDc6MzMgUERUICgtMDcwMCksIGNvbm9yQGtlcm5lbC5vcmcgd3JvdGU6DQo+
PiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPj4NCj4+
IFRoZSBpbml0aWFsIFBvbGFyRmlyZSBTb0MgZGV2aWNldHJlZSBtdXN0IGhhdmUgYmVlbiBmb3Jr
ZWQgb2ZmIGZyb20NCj4+IHRoZSBmdTU0MCBvbmUgcHJpb3IgdG8gdGhlIGFkZGl0aW9uIG9mIGwy
Y2FjaGUgY29udHJvbGxlciBzdXBwb3J0IGJlaW5nDQo+PiBhZGRlZCB0aGVyZS4gV2hlbiB0aGUg
Y29udHJvbGxlciBub2RlIHdhcyBhZGRlZCB0byBtcGZzLmR0c2ksIGl0IHdhcw0KPj4gbm90IGhv
b2tlZCB1cCB0byB0aGUgQ1BVcyAmIHRodXMgc3lzZnMgcmVwb3J0cyBhbiBpbmNvcnJlY3QgY2Fj
aGUNCj4+IGNvbmZpZ3VyYXRpb24uIEhvb2sgaXQgdXAuDQo+Pg0KPj4gRml4ZXM6IDBmYTYxMDdl
Y2E0MSAoIlJJU0MtVjogSW5pdGlhbCBEVFMgZm9yIE1pY3JvY2hpcCBJQ0lDTEUgYm9hcmQiKQ0K
PiANCj4gSSBqdXN0IG5vdGljZWQgdGhpcyBhcyBJIHdhcyBsb29raW5nIG92ZXIgdGhlIFBSIEkg
anVzdCBzZW50LCBidXQgc2luY2UgeW91J3JlIHNlbmRpbmcgUFJzIEknbSBubyBsb25nZXIgcmUt
d3JpdGluZyB5b3VyIGNvbW1pdHMgYW5kIHRodXMgSSB3b24ndCBiZSBhZGRpbmcgc3RhYmxlIEND
cy7CoCBJZiB5b3Ugd2FudCBzdHVmZiBDQydkIHRvIHN0YWJsZSB5b3UnbGwgaGF2ZSB0byBlaXRo
ZXIgYWRkIGl0IHRvIHRoZSB0YWdzIGluIHRoZSBjb21taXQsIG9yIGRvIHNvIGFmdGVyIHRoZSBm
YWN0Lg0KDQpPciBvcHRpb24gMywgU2FzaGEgQVVUT1NFTHMgaXQgOikNCg0KR29vZCBwb2ludCB0
aG91Z2gsIEknbGwgbWFrZSBzdXJlIHRvIHRhY2sgb24gdGhlIENDOnN0YWJsZSB3aGVyZQ0KbmVl
ZGVkLiBJICp0aGluayogdGhhdCBJIGhhdmUgbm90IGRvbmUgdGhpcyBpc24ndCB0aGUgd29yc3Qg
dGhpbmcNCmluIHRoZSB3b3JsZCBzaW5jZSBpdCBpcyBvbmx5IHR3byBwYXRjaGVzICYgb25seSBv
bmUga2VybmVsIHRvDQpiYWNrcG9ydCBpdCB0bywgYnV0IEknbGwgbWFrZSBzdXJlIHRvIGRvIGl0
IGdvaW5nIGZvcndhcmQuDQoNClRoYW5rcyBQYWxtZXIuDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
