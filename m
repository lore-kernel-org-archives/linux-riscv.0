Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B82ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 12:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G5MFqiOUEkLjofLzIv+F5ZoLRA8oyaANU1tEkRy0JRo=; b=vTe+BluXdzUVbt
	IfYKqtM4HkYgaQwAjZpP7Q7qJ7ylkSQ9Wc7ptVJZntK5BaDOeHgqtKIcn0MrHgFbNQkXJVaGHsDX8
	eNdrjZxWrB+3kKFBarIbOHsitC/XDBdKlBhsJbo0Vxqr0qTYYYvkr37NXUSCPGnwi2HnHTMXePlll
	4BROT+RbekAU+LGI3J5A627akqf++Ngqtht1VzTORvIxGPX3rCB0Dz+OdgRbTEyy1k71gachF8htc
	eQNEfg05i4o1wz4dlLEMMVmNkjuJV2hJCDhNIifzwQe/mlNc09/CsRakbx4YeOFNSepO4UXqwEoPA
	ebayaVte+DQK5daBHg4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT00r-00GiRG-8g; Tue, 30 Aug 2022 12:06:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT00o-00GiPk-7g
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 12:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661861194; x=1693397194;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zGahl8DxHptGg/nKQoilE6yI4B1835Z8LgSWyNoEmg0=;
  b=KgzC5XeWdoVIsRgHWck1qsZLcq1em4F44faO4oaVnpwSEPQvImLj8BiV
   G1Brir4XwbwnT5G0gPnViCXM3d5yyL1k+jLq9hacybX4VCvKf/ZY1EkTA
   uXVP2FoYsj/LQZwJxw4qg7LS4X3ozTx+4jirmrnc97FEi1p1IOXuxKnei
   4kWnSGHoSpn8jfdSWnqyvk2vrlCmYM61cmdcncWB+T0WDbhh9HqtOKZ3d
   5u0WNOlDvVytsOEjGksEPYeyexGv/4pSJ0M/UHXsxiZB6SmQIkXip9WWn
   Rlp5UG84R0SiuVw3PYYX4uwM2vceJkQjq8aHlO1K3m8DDCgH/fvNEDQ/q
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="188633635"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 05:06:29 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 05:06:28 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 30 Aug 2022 05:06:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiEEo2dITu3xG/GqLzDvvWfQ4e8uHW5gDXldB4XX5PgQKvghlsit58iOR5Fsdg9+krDnQY1i6+3qUQbC/d4JeBbJPbG4PcldzAo9aKnX6FpsjJRsfblTmxe3japHBDNoP6Kfzw6FaxsUSFSnX2RJsm/ZMKDdrW2MXSJELCfmODu9Bwb2iODMaV36Ty7tliRIFSXxQqf8Z1V6J9QTKbLBB3NaqtxHymRvsHYXlPQLTohiBTCC/mhv/DzwrHIdmtMRD+1pQ2IOnyS1wUwzFVtNSB3CPF/hTSqPg8MpN8ZkBizf/ozMzsrBBHvMOABfCUftiQwfQZZHTQOY6O6AKR5N2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGahl8DxHptGg/nKQoilE6yI4B1835Z8LgSWyNoEmg0=;
 b=N4agFNi8BtYIegAJ5W1mHHJ90afiHxtIX6pDbNuDq/0p0QboAccO5QFFAaw4UhqcdRg5I1Tb7UTmYXltgDRCJtnLusQiWj4J4dBur9yd3ed+D6mRDXv9HyZHJzaAB2H8sMeELx+HCWcFlB3kD9fguhNWM1D8VhGv7ZmnV08w+ahK56v/sXs5Cbs2fAApf82EIYvoDxFS9rKnHexeis38dUs9r8gxmd8JDkiTrueYMTYwqZuEIpd8dpxsw1hjEttaIx6HN3OS5HhFDm9S6J1EgW9m/QhOl1uiUY1JJcgNk3GzQPF1Cf4TNLnXVAFqDcrH3sEayWK0OeeIzIYQF1PshQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGahl8DxHptGg/nKQoilE6yI4B1835Z8LgSWyNoEmg0=;
 b=klJF4hV4stxQMEWdRCGm4oGHW4eCqE3I7s50w9WcaJ96Fs70nud/w4LoA/Aa3JnO1s0J0Aqq/nVNpTY8CHCKJOjxma0L1Se4Bximu0BLP2yEezSzp5fnwx+2YtLg3o+9HwWRad04eSqDsF2NC92b+/NSO2mqdZqt1SUmF8oKEc4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB1554.namprd11.prod.outlook.com (2603:10b6:405:b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Tue, 30 Aug
 2022 12:06:23 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 12:06:22 +0000
From: <Conor.Dooley@microchip.com>
To: <ben.dooks@codethink.co.uk>
CC: <paul.walmsley@sifive.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<palmer@dabbelt.com>, <Shravan.Chippa@microchip.com>,
	<aou@eecs.berkeley.edu>, <Cyril.Jean@microchip.com>,
	<Lewis.Hanly@microchip.com>, <Praveen.Kumar@microchip.com>,
	<wg@aries-embedded.de>, <Hugh.Breslin@microchip.com>, <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <Daire.McNamara@microchip.com>
Subject: Re: [PATCH v2 6/9] riscv: dts: microchip: icicle: update pci address
 properties
Thread-Topic: [PATCH v2 6/9] riscv: dts: microchip: icicle: update pci address
 properties
Thread-Index: AQHYvFoaNa+MnSdZ4EKp19+vC0Z5b63HQlKAgAAWvIA=
Date: Tue, 30 Aug 2022 12:06:22 +0000
Message-ID: <bbdb3953-eaaf-8efa-a55a-9ca083320af7@microchip.com>
References: <20220830101803.1456180-1-conor.dooley@microchip.com>
 <20220830101803.1456180-7-conor.dooley@microchip.com>
 <879a6823-6651-93cf-8500-661bedb050af@codethink.co.uk>
In-Reply-To: <879a6823-6651-93cf-8500-661bedb050af@codethink.co.uk>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78bef4c0-c1a7-4cc8-2aa6-08da8a800e54
x-ms-traffictypediagnostic: BN6PR11MB1554:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FXV6tPi5y47o5fea1fRjeXNhtbT5sseC3B6t6pBkUBq0bWPPL1Omp9OJl+h1YZk+Hrnc2JMSGS70MqqM6BQL8L1JQb0GJdvhZVpXo4Boy4TCCDa1eJ1sRr9662pXVibR9WuVdZKDMamhN2FLx7/Vhj3R2xpjRNwV/9Nuvfu2VkBADpVrbqSDyB8uy4cKumtkEqRwvupFfN0KaDZeztYkxLVYDKo8XRKFZBOckfxKjgtQUYGGoiurdeGpHlRRjGIbqvWryDOj+HeKN/ZQa8xn8TfJX/mgEck12tt85hYnMM4bB1PKCWG5mkkdijrc1DCZmclpr38MMNu9uuIy9CSORPBv0aEdhfsP8lWmRSDJ9krqDFgQpVI0fRr8FJVmqKztR41BfeJEgsS23F3g8MgE2Uyau0epf1WRKLRdg0v7sT7LVdJH1Hg/kaEfU5RU7OxR1JBm8c1wGvvwqvD7ZRcUqSMmXRPKZlfGF3DiIxBtdSs7YMXMWaM8LrqAO3jmdAzLoF63sHB/ThcKm0QI+KHAhG9ocf8QA6ZEa8jXqdAyAdCvXAj4mL1dRVPnW0Fbmmqp53q5w1d64KA9yr+nAcGkFj1HdXyaRdzsLuwraf5i87yVH6I3wksnlcgqn6vY2RvMU4j64v7U8ZuH3fRdcYLisxO2h3eYyW+Yu17ol9DH5EicSilMTBQbhEESuuFdomRV+YiMO+Z0PmC4jnogWQIHpx4CPUhNuOpc1FbDvZW0xcCTYwbAByfLi436G17lkiXLi5ltzfsmPbnhgtEsie8vbQiEOGKnq2lFBLIsFpX6gPzv4yzNkw4SYAKHbFwdVbDQWcfmernZ+FQpdf69kDPQgg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(136003)(396003)(39860400002)(346002)(5660300002)(8936002)(83380400001)(2616005)(7416002)(6486002)(478600001)(41300700001)(71200400001)(2906002)(4326008)(54906003)(6916009)(8676002)(76116006)(36756003)(66946007)(91956017)(64756008)(53546011)(107886003)(26005)(6512007)(316002)(6506007)(31686004)(38100700002)(86362001)(38070700005)(66446008)(66556008)(122000001)(186003)(66476007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0VxVEhZOGEwUkY2SmFMT3BvUFR2U3VXQ3FlVnFjVjFnNlBzYVZZa2FDYVdF?=
 =?utf-8?B?U2hUVEVqZzQ2azEyZ2JicVlzRFUvWXNPRGJSUUd4RmxjcFc0dGtCUk5URW9K?=
 =?utf-8?B?OWI2MEczWlN6NVJacFdIN25rVFpzM3hLU0d5VXpuZEN6TTRvbVZBSnp5VmJ2?=
 =?utf-8?B?ZURwajcxYlh0cmFVVXhIYTlHSHFUcXIxNmZ2SDY3MHJMVVBYWGQ4UFh3YUJo?=
 =?utf-8?B?b3dTell1QzJ1RlZ4WEtYSThiY1cyZEloRDVtOVgzR0M0WUdTTVJTTkZLZThV?=
 =?utf-8?B?VEtERmdPNTl4alVnZnJZdmRsMzA4VUg3ZmFXOW9KYXJESk9JQUtnMkJ5Njhm?=
 =?utf-8?B?MW55MlBpNUZrRDJSR2lydGhpL28yeTR5Um0rdTIrMy9QTUN3cjR2a3I3S1Mv?=
 =?utf-8?B?U3dPN240b1dqT1NkZFk3S0pHWmhKYy9aa3UrZWxjWUNQcVJHejZtdGZvbTlm?=
 =?utf-8?B?ZjFQTU1IeHlDWTM2RlJCMGZYNlJFL0hqa2liODAwdmhhQmRPcUZhL2lFU0tX?=
 =?utf-8?B?WWpZUVBBb3N5WXZnYnI3S2RMRjN2K2VQUDhNNldRbGh5aWI1NjYxbzRRdmxL?=
 =?utf-8?B?ZFk1QXMvTjRVcFUrazlwRzNXZWFlQlRtT3lOaS9nenlGZmdPK2V0RnRGaCtk?=
 =?utf-8?B?blFSZDVOVjFTKzRWKyt4QmRYWGxtbFkyeDd4VHlVNm1NSENCanlQdlBWVkJt?=
 =?utf-8?B?a01kbEhWR2p3YkxrcTFLeDBxSmUrdDUvR1liWnR6UUJiY2tEQnRrNGVnUEJy?=
 =?utf-8?B?dVJIRlV3L1BXZTB4OTlyL0loU29vci9Jd2FJWDkxY1V5OG1xT2VxZDJPSUVQ?=
 =?utf-8?B?N2ljSFRFdExTQ0FrZWlUeDRoU2tyTklZOHludmErNWFqRlpycEluQUMwRk13?=
 =?utf-8?B?MjgrWXRjOVk4R1ZtUWhGemx4NHNydlZtdGZnOFpyNExpbmR2SGxtU1ZETXVm?=
 =?utf-8?B?Q3RTWHF4c3lvL3NCbllMREhiWlBMT0FqcDJJVHpHQXZYSU50RlJSejhTR08y?=
 =?utf-8?B?ZndOV3Y5TzRtbE1zOGsrTHZVaVRQT0FBd2FYZ2c5Unk0bnhSRyt0eGhMWWhq?=
 =?utf-8?B?WlBseCtueEVzZGVDRzlLRFZ6cm9hNXd4TUd1Ty95MnhMYXFIMStJVkt6UFMx?=
 =?utf-8?B?TDgyQlpEZEs1UDNWSDNKbEx5WFRLOUdhU3JnSkRsdDNYTTVORzNkQzZxUzZC?=
 =?utf-8?B?R0tmOW56aERLVDZhak9HNWhUU1kwY2N0UnlQd1d2R2FFRmtxQ05nTEE2N29y?=
 =?utf-8?B?VUZ6d1JPemVoWmoyYXFDVFRzWG9ucEgvemVWSGZKa2wzQU1EbGYwNFEwU2JB?=
 =?utf-8?B?VEJCdy9ScysvQloraHo1eERlQk0wOVlJeWI5WEt6UFFFVDVYdTRQaVNYMkto?=
 =?utf-8?B?N0RZRnE2NmU3OEJpU3BrZjg0S2NHdmJ0THg4MXR3ekt0bnBYcW9lWlRQeEpy?=
 =?utf-8?B?UzcwTHBWaG5IczZzVjVQTjZMclJaand3N3VmT244Yld1VWtiQnVxOXBPNldQ?=
 =?utf-8?B?T2N1OXRBUGJ1NmpsU0VYRTA3QW9NWnZxeWdySXQzNHdhMm1LeElOK2tsWEoy?=
 =?utf-8?B?Zkl2MUwwWnJWSWlyM3I3K0h3VVZHK1g0VHFRcWxLQ25zOUc5RldrbEFiQWkz?=
 =?utf-8?B?K2JOU04rT0YyOVNBTW9pd2dHRDQ2TjlTMXRPMGtDR3pxRmxId1FCWHIrdGwx?=
 =?utf-8?B?MUxwNkVjOWRXQ0dKY3hXVExmY2I0S1ZkNzBnVlUyMks0K0RHK0t0S01BNlB2?=
 =?utf-8?B?Ky9iR2V5VVlLMjdIYUFibXFZZjFDZFdxVjJ3ODRkZVg2dm9icEhDeDBzUWpO?=
 =?utf-8?B?eGJUSlBXOXNqQTluL3JsOVkrZnV2WEJ1eTRESjl5aGRCR1NFM3BQMHhlVndF?=
 =?utf-8?B?aTdsODhlbXR0YUpiRXFRaTkydVg3Vzk0QS9nVU1uUDRUUi95cTdnN2Ixc0Mr?=
 =?utf-8?B?K2pXUXpjVWRUZFByMktidVYwNGZ1WG1pNzRqTTBEbWtTWTFzOUwrWEI5eVFm?=
 =?utf-8?B?dnpZL0hQY3d2Q0JudzBrUFpMd3NtbTA4aUh0aEZ4Q292VnE0dC93YTlMV3ZV?=
 =?utf-8?B?Qk5waEFiM2xKSEx6YlNXZ0M2a3pHUlUxajM5aUsyTk9qU0c5TFE5RUlUc09x?=
 =?utf-8?Q?zt9A/Qs0YSpR2G+nPYuHq4lbz?=
Content-ID: <C7FEA6C0E548314584F4194D09D4D391@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78bef4c0-c1a7-4cc8-2aa6-08da8a800e54
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 12:06:22.7034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mOSzFElfW4WN8kn0W+wZZroiLKV8xzm6RGQ4CKHG1r9wyEAgnrvtAJBB8amdpYKS0r+SS9sTp8HnrJW1sJs22YxzPEk6pHkHbxlDrHGXJ/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1554
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_050634_651854_2F3F1A2D 
X-CRM114-Status: GOOD (  13.82  )
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

On 30/08/2022 11:44, Ben Dooks wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 30/08/2022 11:18, Conor Dooley wrote:
>> For the v2022.09 reference design the PCI root port's data region has
>> been moved to FIC1 from FIC0. This is a shorter path, allowing for
>> higher clock rates and improved through-put. As a result, the address at
>> which the PCIe's data region appears to the core complex has changed.
>> The config region's address is unchanged.
> 
> Did this also fix the 32bit address apperture issue which plagued
> getting pcie graphics cards sorted.

Eh, not this specific part of what is changing in v2022.09 - this will
just allow us to close timing using higher clock rates. But another
change that is landing in v2022.09 will (see patch 4/9). Performance is
not going to be great, but 32 bit devices will work again... We've got
some more stuff in the works that should help on the performance front,
so hopefully that makes life easier for pcie graphics cards.
soonTM on that one though ;)

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
