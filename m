Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A51C43334
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jul 2022 12:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NMJYzaaMbdwj+HfONAtmqyI+VnniKrW82LZAWrdSZk=; b=igO5++uDPkeCAu
	2wDs7X+yYtnQMPFXTyUNdKYJAUmRsdOtX6c5mOcnQECgnq7IRhBAoJ3NoOurewjLtVs80IBgYuooM
	AoM4XPfBAeAd9E8TVfOV9Nr+SpeFxgujN/ezWrOrXaaL5gEMWMRrgf1AETvsShbLotTM7GvZb6s8X
	qbMUBuDX4M87J5pLBsdCqQDT5BsgsRAoKRQmY3GcBwu91IdHEVamyWF5+MVxyPdkEYhhd/lQJvZc9
	wibxqimE1BArKBBJ82QzzPhdzk1T3i+GHcHKLaLtsCWQc4Mf9458PInOAIbO2yG1QeoOc7CLxC8mQ
	yZe1x9/s0AjZM6uP68WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAA3F-0080EN-EN; Sat, 09 Jul 2022 12:59:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAA3B-0080Bz-IO; Sat, 09 Jul 2022 12:59:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657371549; x=1688907549;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=E8WwRYPdXfHqdC+LuZ6MoW8oBA2uQ7qOozR6ggl55yA=;
  b=Nur+BwMKg5WVI4mmYjL8NQkfnbvAtjvIvP//W9XCRVotO857/cfvWFdR
   iXzlisiJRbQyYec4dxSj/fj1v7uW25yQ30qVuEPTQMYERVTLXqTUFAmFk
   78wKXcjfkeRXZlwImGC3lVQlb30u8c7hepfCtbMW09xyF+b+T82FufPQs
   QqTNcD2nklT1VJXty8ioAX3tApfzEAVivokJ8X0MlNCw0Chjx+g4dv82K
   EbJmftOa2TEip0gGRNy0dOQR7aE37mew4/3X+BtSd2GsDk4YHRrP9rH6i
   YEmea8eAbdYYAvG3dP9vf2I5w9kCLfyE0rUoroag8z2l4VpckV2+/+dNR
   g==;
X-IronPort-AV: E=Sophos;i="5.92,258,1650956400"; 
   d="scan'208";a="171441529"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jul 2022 05:59:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sat, 9 Jul 2022 05:58:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Sat, 9 Jul 2022 05:58:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3n5J7ZLwel+UzVaiIoyVq3SU/QqSMeyP51fhMSMNodtOmkBNcwTM44CT1MszYNl3duietwjAKa7zFchbILMTZx/xv10BHY5+XKdligyQAGIiiKhfZ62aoDbADxPP/hlRDXl3Gc5UlG5zlrJZekxR9nBm6kYEyAyVKXMAbInzaSlZa1LtfDxiEZF52AEqtsEHs1vhGJnNFNQFN52snykqjTHhBGpAa5xoklVJ6uq0blZG+jpNdMqOzNxPVYxJQlCDEuPvGJ51Qigf5H7yL+cfalQ1+0E5SC1dJ/2fA43xUZO6AIeyv6kx/3Zz1lpH8dR0RazR/73LG21w4Triizaew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8WwRYPdXfHqdC+LuZ6MoW8oBA2uQ7qOozR6ggl55yA=;
 b=BYGkPFhmkCQAmyEi/665pSqzN1iP9yvlpygawaudrKS9JM7GrHC8uRDP0in+VPgv5ILhPhFFuFJQRY9wGzOkbdgs9NPQpD02ublVL/e5KLqwlxV94v/7MJXyI6ANJlUL41BpeiAny2Gi7bvybXgLTd+LkrabI8rvZwUmlp6Tzhz6Hcv/4jHhwhORUMR+oTUBTfNEBSiJZmFdkJE7yD7kkWYdkiiqR0X8ztRjkXfDmkUqQV2A6qTjyMEZYe1n4JyMjt5oyb07CVB2LRvHVVrWe/r+efcq/eaO1e98ctNdC+Wa84351qOjI9xkUatWWRaN2ClAT5L6C9XGpwNJPp6Y0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8WwRYPdXfHqdC+LuZ6MoW8oBA2uQ7qOozR6ggl55yA=;
 b=hmUHekKs8MAxtqnp6kdP7vdwJYCxYQEgM5jfwcOLDX/r2eQWFl+Ox6cFuhAajLrkwp4JMPDWFU9l3MZpKQh1JmbhCQhHroNr2r4Ch0HgoJ5lFzBGqwAKDM9UdL4GNj28jhnd1FlivOzwb+X/9YZY7hjwInSOHWUFnjd51FHJnck=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MW5PR11MB5810.namprd11.prod.outlook.com (2603:10b6:303:192::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Sat, 9 Jul
 2022 12:58:58 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.023; Sat, 9 Jul 2022
 12:58:58 +0000
From: <Conor.Dooley@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <palmer@rivosinc.com>,
	<aou@eecs.berkeley.edu>, <sudeep.holla@arm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<linux@armlinux.org.uk>, <arnd@arndb.de>
CC: <Daire.McNamara@microchip.com>, <niklas.cassel@wdc.com>,
	<damien.lemoal@opensource.wdc.com>, <geert@linux-m68k.org>,
	<zong.li@sifive.com>, <kernel@esmil.dk>, <hahnjo@hahnjo.de>,
	<guoren@kernel.org>, <anup@brainfault.org>, <atishp@atishpatra.org>,
	<heiko@sntech.de>, <philipp.tomsich@vrull.eu>, <robh@kernel.org>,
	<maz@kernel.org>, <viresh.kumar@linaro.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Brice.Goglin@inria.fr>
Subject: Re: [PATCH v2 1/2] arm64: topology: move store_cpu_topology() to
 shared code
Thread-Topic: [PATCH v2 1/2] arm64: topology: move store_cpu_topology() to
 shared code
Thread-Index: AQHYkwoSKn1B1/DCVEW+Ox2TaLu0fa108T4AgAEP+oA=
Date: Sat, 9 Jul 2022 12:58:57 +0000
Message-ID: <efa89122-b428-7691-49d3-f5867206f05a@microchip.com>
References: <20220708203342.256459-1-mail@conchuod.ie>
 <20220708203342.256459-2-mail@conchuod.ie>
 <fb8534d9-baaa-2643-5119-602dfa5de758@microchip.com>
In-Reply-To: <fb8534d9-baaa-2643-5119-602dfa5de758@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1c99354-f38e-4856-0b26-08da61aac992
x-ms-traffictypediagnostic: MW5PR11MB5810:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?NWs0T1I2clk0RGcwRlJuenF2em8xTEU0OVRTNkVZS1N3N0xjWW5jaVp2dE41?=
 =?utf-8?B?Z1BiTkFLdUFkNGxMTmIveExtQjAzVnJmUDdrNEJ0dEVzeE5Ra1FCV2dRbmlE?=
 =?utf-8?B?SGJabHdIRXVaRVdDa0haSDM0MEJOS0x3Uk1POVpOcENZMlpWNDhsc0loTEJ1?=
 =?utf-8?B?amNVdzU5R3UwMFlOKzlkOWFFNGtVTUdlZERCWVpSS2hPL1lZZDFxUmkrR3pp?=
 =?utf-8?B?bGE1a2ZMVDB3Z29RSmFHeFNCV1lQc3NpRnRFektuOFkweXlmSjZ2R1Q4eFR5?=
 =?utf-8?B?eWxwanR4TkxTeWFrY0FseXlvRStoQ1Axcm1rdlk5UnE3eXRMOGZjMUdXendC?=
 =?utf-8?B?bVRaemR2cDg5ZU0wZ1pNRFhmT0h1Y2ErYUpNTGNlL0ZRMFlsWEFPL1FCVldw?=
 =?utf-8?B?RlpvOXlVcjBuN3g5VzBXTmNPL3pUWDBkTXdUMTB2eEZyTEt6RGhBWk9QWFFr?=
 =?utf-8?B?T3ArdU9lNHNkalZWVjQ4bkxYNWFDcTdPK2J1ZVUyVlJMTEFIVnoxRndjL0JE?=
 =?utf-8?B?V2JUTy96THF0d1lERVUwU1JZbE9sZVBqRU5DTlRFTmlrZFlRek5Zai9jOURX?=
 =?utf-8?B?czBvZlRZdUhac1lnczJ5aHZSUXBjR3BCWmxVSXl5VnJ6L3JqV1Ava0h1TFFQ?=
 =?utf-8?B?OENvYVpadzZwZ3hsaFEwdmZVNTl0QjdERmI1Ym5HL3RkYXFvZi9wTmRCQ25N?=
 =?utf-8?B?cEJKWlVyell5NHk0UmVHamJYRzNUTEFLUGhId1YzQnZ5TTJLM3hYNWI4Y2dR?=
 =?utf-8?B?L0huNjE0QVA1N2VjdXV0YXhDQk9rRWdUUEN1eVBqdjM2WVZvU0krejVnWnJn?=
 =?utf-8?B?RTJ6bkcxaElQeUZPQkJVVlYrQkVVczZaTWMzRVVaZEFZNGZNN1U1bzBlNWND?=
 =?utf-8?B?cnZzMmd0SXdzOUFZSTNUNEp6bGc5YmZhZmxLdkg2dU1uWWdkelRmdXl6RFBC?=
 =?utf-8?B?YmJtYVBxQmtUZE1QMkdSdXVHcmNIU0tEZmVObU04MjZkOWpleTBXOU55d3BW?=
 =?utf-8?B?K1M2VUhGeVpITE9PdmZFRFhEMmxUYmd2ZlZXSUYydDArczhKcTdDa3RoOE9l?=
 =?utf-8?B?TTI0ZldGWTdPendNUVFMN2NtclBHazZialduVFUwMUVBUVViMS9reWkzbkFX?=
 =?utf-8?B?K1pZMXpDMWVzbkJUcGc5SFlWdEV0RDhLOTNhY2QxWUJDa08reVUwenJmeWtw?=
 =?utf-8?B?cjJrenNjWkV3WTFBNGpWMFo0SFlkK1paWUhxejlFK2Z6aUs0YU0rYmt2VCtu?=
 =?utf-8?B?UU9CUlpjclRzZExabWpLRnBUYWFjZFpCQnhxNFVkOVY3THhNQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(366004)(136003)(39860400002)(346002)(71200400001)(2616005)(38070700005)(66556008)(110136005)(921005)(8676002)(38100700002)(122000001)(54906003)(31686004)(316002)(36756003)(64756008)(66946007)(91956017)(186003)(4326008)(83380400001)(66476007)(76116006)(6486002)(8936002)(2906002)(5660300002)(86362001)(26005)(966005)(6512007)(478600001)(31696002)(66446008)(7416002)(53546011)(6506007)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmRTZkhtYmhzTVpkL2ZzblB2Vmg5RXRuZ2pWc3BXT3ozUVZ1R1k2bHQ5TG9S?=
 =?utf-8?B?L0w2R2dZd2tuQmNxaGVmeHhjckhFbjFMK05aNUYwN3ppT1dqQTFqbmJiaTI1?=
 =?utf-8?B?NXcxMUdNSEhXdkdhVVdqdGJJNDM5eDc3ZUgwYUpoL3JLR3l3bWhiU1ppUmFs?=
 =?utf-8?B?Z21aUzlJekZ2MmI5b0txUkQ2bnBSZnl0ZndhTFNJeUNPRHQ2RTUyVC9EY25t?=
 =?utf-8?B?cVRWMlNGOGRPVjUwL0xNMEV6RzBHOFV0dVVxcHJhbXRWQk91Nkd4R21qSGpT?=
 =?utf-8?B?Y1VjdWtWb1o1RXFRdzJEemc3dFVnMTVVajJ4eFZoTHU0QWhYQlJMQ2JpL2NU?=
 =?utf-8?B?dnJsZ25KeGNqSUxJSzBsWTlUajdEaGdvRU1lSjcvbm1VV25MM0ZMamcrUFNu?=
 =?utf-8?B?UGc5TUt0Q2NlRjlweWJSL2Z6R1hnY29CRzRKVXd3N2FDU1lFVG0vaytsUG0x?=
 =?utf-8?B?TDB6R0YxUnM5d3h3WjdNTE1ONXFrMTRIc3d3WnFXZ1dTWlZiVVNKUHdCT0Fj?=
 =?utf-8?B?aW94UlFFc2VJL2hhVUV1bE9STkFYSDVmdHh2TEc1WEs1WnpGWE1jZFA3WnlF?=
 =?utf-8?B?OU1mQkI4aHk0ZExvRzc4M3ZremcyTm83NnJJQ1VvMmxoRlMwNWRVOGlONWtK?=
 =?utf-8?B?Q0tETkpXeDFLOG1YaFZtRnR0bkJkSFA4VXNSQmszN3RPZVo1Z29HMWFlYUh3?=
 =?utf-8?B?YXZmQS93djc4c1Y4SW1TeTNBaS9kV1lRTlkxQmxOUGRGbTNPWG1DL2tuNmV5?=
 =?utf-8?B?d084MWRqVHVVelp1R05haTA1QVR1OE1td0FDRGZEM1JCSFpIK0NyMmxDb0Zp?=
 =?utf-8?B?VjNhMzlGUndWMG9pK3pSNG1JalcyMDBXVUtWZFRRSEJ0cXlQdnBURjg2NTlQ?=
 =?utf-8?B?cEEzMkZQSWdRR0g4OVI3SkdWdFpmZFV5U1llUDZIclhXU2cvRjhzRXM1dXVp?=
 =?utf-8?B?ekl1UUsxVEppSEovcmxUNnowSW9oRE16RDk0endTV2Y1Zmg2M0tXbFA1V056?=
 =?utf-8?B?ejBCd0l6ZjEwL1RxQlFBT2ZqYTFwUkRaNWloTE90WGtpSWdnMUYrUWhSYlcv?=
 =?utf-8?B?ODlZcG8zRFhOTGxNSzZFc1AxRnN0YjBPU21acUw4VnBiZENEalZJRjRiVERZ?=
 =?utf-8?B?UEZjb3Z6bWYzaHNvaUdUbjMySkRQVjYyWGYzSmZyMUNvZ1pkMmR2UlJxbllP?=
 =?utf-8?B?Q0YwTFlEUk4xS3cyY1hPZytiS0g4WEJqUlVxQlkrL3ZZa3ZwWDBra2x0K05w?=
 =?utf-8?B?MXRtRHVUTXpSV0k0dUlVcm9wb3Urb2Jhclp3aitGbkZXajQvQ0dPcVVrMnM3?=
 =?utf-8?B?RDhDdTh6WW5PSk9vUmZCTVFDSm9icHNMem51SjMyV1F0aENPSFZWRk9vZ2M3?=
 =?utf-8?B?a09JU3NiSWdVRG4zNFdsYWU1WjBaaEtNZ0J5TFA0bFBLeDduN05rZ2w1Umk4?=
 =?utf-8?B?UVcvSmxhbHYrVjFxdzh1ZzBGN2pXTlRRL3pRN0JYQ0hXRmZ4djRoWUNLeXIw?=
 =?utf-8?B?TzZzVTRWKzNYTER2S2R2b0NPbHRMaEN5aTlzYWpLejlidmFPZ3FpWG9RdC9l?=
 =?utf-8?B?eTV1Z3FWRWpIR20yT3dLT0NqQVh1SlErM0ZBMGxvSjJPaFlBd1MxeG5QaS96?=
 =?utf-8?B?aVBVc1pTZVV4SFJNUStnWlNtUVhOcmFxV0Rna0FmRlB0SUdMSWlRTGduSzlE?=
 =?utf-8?B?YmJTTiswZkI5M3VmbUs5aU9nV0I5ZjVuSWlIMkZiTjZ0L2hHUmo5cjVpVWJM?=
 =?utf-8?B?aHErVWlNcUpMdFhxU0xld1V3WG5SRVFpcmx1Wm92VHNYU0hUK0kwOTFSWnJv?=
 =?utf-8?B?VjRkdDEzc1krNXRnaHRIdGxZd05xenJ5NGF0ZEVVM2pIc3lCSnc2dmd4ZFFZ?=
 =?utf-8?B?UzFOaFQ4TmRYOEhETzA2ekFpdXBiMllTU2JsYnZDOUxwOWlIRHdiRno5OXIr?=
 =?utf-8?B?cVlXYnBqMVZxME1CUHNXREVNMVdQMWRScjAwYU1Mb0hieWhramhCSCtZb2wy?=
 =?utf-8?B?Q0xiNmJ0OTVDbHZKR3pwanZTVWZDRmJObzRPSi9sbGk4OTBNTmFtNjh3ZXlW?=
 =?utf-8?B?WGlNV1FtbHlmakpqcEZVQnloZ09ONjZlWGFCcnQ3MmpqcENObGZtcDZwdHlJ?=
 =?utf-8?Q?Lcr65ke0jM8zXM352jPCM+PzX?=
Content-ID: <C70C4228004EAB40935745A31AA5E231@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c99354-f38e-4856-0b26-08da61aac992
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2022 12:58:58.0003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Sr6jY9X/XqJO6CbS30phTBMKzI2aY66gqPfwjv6jWNZvBKgtnpp808PS2HCiQrDWi7EGWRMo75DJkT/qhNa3IGxqLSeV7sjO2gTXFmbddE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5810
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220709_055909_869065_AFA2DC4E 
X-CRM114-Status: GOOD (  18.18  )
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

+CC Russel, Arnd

On 08/07/2022 21:45, Conor Dooley - M52691 wrote:
> On 08/07/2022 21:33, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> arm64's method of defining a default cpu topology requires only minimal
>> changes to apply to RISC-V also. The current arm64 implementation exits
>> early in a uniprocessor configuration by reading MPIDR & claiming that
>> uniprocessor can rely on the default values.
>>
>> This is appears to be a hangover from prior to '3102bc0e6ac7 ("arm64:
>> topology: Stop using MPIDR for topology information")', because the
>> current code just assigns default values for multiprocessor systems.
>>
>> With the MPIDR references removed, store_cpu_topolgy() can be moved to
>> the common arch_topology code.
>>
>> CC: stable@vger.kernel.org
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
---8<---
>>  #ifdef CONFIG_ACPI
>>  static bool __init acpi_cpu_is_threaded(int cpu)
>>  {
>> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
>> index 441e14ac33a4..07e84c6ac5c2 100644
>> --- a/drivers/base/arch_topology.c
>> +++ b/drivers/base/arch_topology.c
>> @@ -765,6 +765,25 @@ void update_siblings_masks(unsigned int cpuid)
>>  	}
>>  }
>>  
>> +void __weak store_cpu_topology(unsigned int cpuid)
> 
> Ahh crap, I forgot to remove the __weak.
> I won't immediately respin since it is minor. I've pushed it (without
> the __weak) to https://git.kernel.org/conor/h/arch-topo so it'll get
> the lkp coverage.

And build failure for arm32:

> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git arch-topo
> branch HEAD: df379c4b12f6b22fb8c07c2be16fd821a4fcbfc5  riscv: topology: fix default topology reporting
> 
> Error/Warning: (recently discovered and may have been fixed)
> 
> arch_topology.c:(.text+0xbac): multiple definition of `store_cpu_topology'; arch/arm/kernel/topology.o:topology.c:(.text+0x0): first defined here
> 
> Error/Warning ids grouped by kconfigs:
> 
> gcc_recent_errors
> `-- arm-defconfig
>     `-- multiple-definition-of-store_cpu_topology-arch-arm-kernel-topology.o:topology.c:(.text):first-defined-here
> 
> elapsed time: 721m

Looking at the arm32 implementation - it appears to be mostly the sort of MPIDR
stuff that was removed from the arm64 implementation in 3102bc0e6ac7 ("arm64:
topology: Stop using MPIDR for topology information"). Could arm32 benefit from
the same shared implemenation too, or is usage of MPIDR only invalid for arm64?

The other difference is a call to update_cpu_capacity() in the arm32
implementation. Could that be moved to smp_store_cpu_info() which is the only
callsite of store_cpu_topology()?

Either way, will respin a v3 that doesn't break the arm32 build when
CONFIG_GENERIC_ARCH_TOPOLOGY is enabled :)

Thanks,
Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
