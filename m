Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B0DC04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 07:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LTSgqReYzTvc9klO+ESSUW6n/hQZ8mApUvny/6+ij28=; b=qZ09J+0tCaJbJ5
	abiuavPzWWxBZNfuKLNG1m3YSvd2CEdjatSdvxZkYnoUNOWxTQ5hQuqO0aC8/Ig6LBpSVe2YrG5kJ
	VzNYlU7sPN85qn33xIAtza8OvQV8nK1es+fNHagzpD7uRjgH44/M8mckxuliAmiIxG8Bm4GVWYxRq
	HQJPS8vIHrQnWz6atQ/bm/Z/516JzQkTuvuI5vL7XRg+UvNULfPHmNjODFrz7vFGMtBiciZtJQiFc
	79BbenhyrbBnB5KHHc02QZMQVQRl3O+djXv2qlo0Y5O8a79hXfofJrDae9ebQLq789FQ/YebhpzRN
	N7W4nvLcmvg4KIHP0MEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGbKm-00ARf5-Vx; Wed, 27 Jul 2022 07:19:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGbKk-00ARaS-3e
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 07:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658906393; x=1690442393;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rTBt5N9MnHd5XeKra8KFD44Hyo7pw7KRLjsxQYVl4jE=;
  b=O9GW3addFPOi8McCoLLOO3IDbFdZhUzoUY5gLgnQjGPAf8alQskW/wIP
   PgwtSy8KnDPT/xUf0WEOxRPAOOVmh1iUoc9Jghl0Pcg8XPIAGytp8Zyod
   OAmIi8k/8t9vfTrm4+66cXXnBo8JL/R2IgID8E8wFi/tz5i9NoIx1PcHr
   DXLCMpy1RYFK+zexKHjXYyMc5qT9BTm92A0ELsqXqScQPdT5TOnEVTMmn
   SdsxdM48LhgliaaGV/KMkqgn5MZWQUPyYdi+/ZHLsbvx6Hs03Xn6RzVS9
   OB5RiwSt77dblCHkREWxOgc+6AHQ9nQfu/ANCNSCc1nIbev/oO+yQcgOw
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; 
   d="scan'208";a="106313205"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2022 00:19:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 00:19:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 27 Jul 2022 00:19:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OR1IbJAPLGUkLwjrjcw1/cvgV3ZY9XFVkvSBhB6lbmcLPCaa+YK0V7Oe+VC4NbFXNlYfobsPKd7ZiihWqSsLFzFdHu2Co4IAkddLFMUZDr1W3awSJMBV2xIXmEwcuZ8zakrNmbFOu4R8uJww4dIHW6KH7TFixnahZ89fRdKaBcz068wekuJtNGRznJgJXdEe/z+IxdqHogQLZiWHUk6tC9qc02xeiFjqgVXNeKuHV514cSW+jgSrTwBmk2jaeiq5uelYxZ+4O7jMMsdGcryF+NSJI25wkWO52OtzwR6tHuT+VID2jXcpPzbVOjYuR+NtCnq4ygD61IY6EIa+0Epdhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTBt5N9MnHd5XeKra8KFD44Hyo7pw7KRLjsxQYVl4jE=;
 b=XOX9yp2o+RFFwRoPlo6WuRHGIzs0vu1wQM2O6xq2d5Os8Cf5MJwtDdy1rj0M8f2aQ4Lp7l6dh5K7I7WvAQ611aXIREdsN5uKhve5rrg0EOlamZE8vII497MRNSKSgU7Ug8qENdw5ubdnKcAYrAztU2u+JS0KPPyaVv49+1FJMPu1B05RTv0YLJApnc4+I1GzjhBSMmumMjnywWZ7w/NtkYxmBIFxlg5yRAA9u/Jm2Wsn9vtFMejKOcOuy0N4eVsGjl0OUT8dt82phnstufJ+SAtDnm2DZpa0ms64PsY69KyP1sGlp9Ab0HLK2qY7GgVAjnUvQsP/ybk+O869QRbCFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTBt5N9MnHd5XeKra8KFD44Hyo7pw7KRLjsxQYVl4jE=;
 b=JI8NfzrUrPgrpvBcAHZd+GY+8YIOdMLsa4F0pHNJgUFbgx9R89oir88B3VHjLP5aWbdU0kwp3g/EWYwTHc+Cp6zTtne3xV4hoq8AoHLmLw1jUlCaUS3A4pQ8etsU9ZqVZIDkI6tpa9grUib+tcdIvOyo1CqPzwrFe8GnXltuG4A=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN7PR11MB6703.namprd11.prod.outlook.com (2603:10b6:806:268::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 27 Jul
 2022 07:19:35 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%7]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 07:19:35 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <linus.walleij@linaro.org>,
	<brgl@bgdev.pl>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<atulkhare@rivosinc.com>, <sagar.kadam@sifive.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: sifive: add cache-set value of 2048
Thread-Topic: [PATCH v3 1/2] dt-bindings: sifive: add cache-set value of 2048
Thread-Index: AQHYoRJORxZFGGFwkky2Nc2hNdByz62Q6giAgAABE4CAAOOSAIAAAcEA
Date: Wed, 27 Jul 2022 07:19:35 +0000
Message-ID: <a530d8c8-7dcb-9cc0-2be3-16567e1a99bc@microchip.com>
References: <20220726170725.3245278-1-mail@conchuod.ie>
 <20220726170725.3245278-2-mail@conchuod.ie>
 <246f132a-a23d-7c53-38a7-2bcec50d65e5@linaro.org>
 <c77f34aa-ff29-b18a-a3a7-9d90145364a8@microchip.com>
 <bf470847-9e96-fc5e-0b82-d05068aaeb47@linaro.org>
In-Reply-To: <bf470847-9e96-fc5e-0b82-d05068aaeb47@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aceb0f2b-b88b-4078-91d7-08da6fa05be3
x-ms-traffictypediagnostic: SN7PR11MB6703:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IY6YgU0jgpjTI4fglTL2iUUass1SZ3SfjTuZYLSDFZ2UVVMpH1NZ3OBx+Cuywm2DKHfbg/WzcLWCxNczbtoGOm95hKu5S4g1NUvSVEmkmU7oi97eGNdxdyHBhEyMwjWrJuHfx0tpuNzDn/q1mFgbegmUBNIAMaAcD3p10MMFg2So0R6RuecUP7pTPWRgxE/HBcU+KXrOnwQ9cDDFlBMeAaFfMdm0/SNzsHkpp8N1JssxxISNK6KVZWTiq+ewdFyg/adjDtShhRoBYD9L+CybVpQsbcixZoKTnEyPSFrKvuyGlKze89DeNYboJINgHkNRGrUn9Gu2YWQgXpue68ogbIKhbnV+WT66XA17BaYVVsO5gg226OnX0pobdQPm0R2RES4FPEbwjxylTI+H0WWtYUx86CN0o8yirEHvTlc1IedvRbX3ERdx7b7FspBa1ym3fLyhNE4cEQl0xX3Pct4f6PPmV2+rnv8mfPnswtzBXVZOJrf3CRzkTJE+WU9XZk+uYpHA5c6Ch62cllJWSV8kRX3NVCKMeGc/1VzKtmX77AuC0g83MGNSnPEn7IuMBNZvspxqwjStBT3UAbtg/iG2FpNw0mPNKV4gKnH+UyVhUbPYbpS3doiR5rNNcdTlJN2X6JU95Hcahu27TCIE05DtJ7UIJ1/TbFdVgwwkr2hnVotavGVU+lF9t5A7fimkxXzb81PWuFcpHUMx1re5RgVcQX+fr3NmJ4aXRdoElW8GEOoG/Xyx78BIbO9gWCfR0XjMBJXlXnoSKBFZp0F46AmWlgQGLSuI3r38iqZyRbwr6oRYbT04EsjRvQXw2RKkLn4ZZZxF5MC3xenaU8wmpCL2ssYg942oR50dhlwPiY3kJmP9QOzpvYRUjWanTwNj1mBOhLHKOHFm0ucQD1z2D/PvWjM6X9imhstSfel2NZ8Ge08=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(346002)(366004)(39860400002)(136003)(2616005)(26005)(53546011)(6506007)(6512007)(186003)(36756003)(31686004)(83380400001)(7416002)(8936002)(2906002)(41300700001)(122000001)(6486002)(66946007)(38070700005)(316002)(31696002)(38100700002)(966005)(86362001)(66556008)(71200400001)(110136005)(5660300002)(478600001)(8676002)(66446008)(64756008)(91956017)(4326008)(76116006)(921005)(54906003)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVRiZ0JJWDRGY0NDQTVGNTJvZDl4Z1Q5R1llY0p4Z244cHpMNnp4OHdZek9v?=
 =?utf-8?B?Y0dxdHgwYTVOM1dWSi9Yd1o5WnllangvalRQalB0WXBuamtDc0RtMTJjcE43?=
 =?utf-8?B?U2t4YVF4cXJTTkJWTjJUMHlQaUFlWlB3L2RRTmtFczFwMUpORzEzS3EreGJT?=
 =?utf-8?B?ZFVFLy9EeXA3MGNuQVhtZ1MvVnNibkpLMDI2dk54Qzg3MzZGaG94a2wxMEYr?=
 =?utf-8?B?RFYrakNwaXRmZlVEdWUycU05dktneU9YbkZBcThPclgrS3BWbHdqQndVUEV4?=
 =?utf-8?B?bm10ZC9xWXNWM2tHUWtaUFlJdmUzTThiNFNlR2dTM0JlVlZvcjNiRnR3Y3or?=
 =?utf-8?B?bW1KMDNwYVhKYUJWdlFaMDRJMkg5bXVud0t6dm51OXpsdGxDYTkxYmx1QXZr?=
 =?utf-8?B?YlBadkl2dktzbUhXQXpsYnE4TnNUa0RHSzhQRWljTkwyM2FEUXUvQm8vclNE?=
 =?utf-8?B?end1Y1ZtYjgrTlpwdURZeWMxT0tqbURQOTBPd1NySDNTS2dHMzRaMU5ySFBv?=
 =?utf-8?B?amN6RStneloyT3g5N0NNT3ZLSXBhTExMM3I0VUlyclZ1WjNaV1FxNzFRN2hX?=
 =?utf-8?B?djR0eE1Ca3V2dEh5eGxMV1BpcEdjejZLV2trMHc3Zmh3VE9wK2NuSkVrQU85?=
 =?utf-8?B?VkZSTVUxbkhoYUUybkQvQjVkcFVrS1RsV2JpS3VIbmNZcnBmZEthNHlRbnJw?=
 =?utf-8?B?WXJobVdDODNzS1FWS051a3NaZVdyRXNpNm8yZHVEWWlHY2V4Wm9JaWhGdlBG?=
 =?utf-8?B?RFJ2eTJ0bmgwRkVzRXpnaFk3NXBvd1E1NWErOU5GNU9QaDJTbXhhV24yV0pL?=
 =?utf-8?B?eE5YM01Zb0lLOSsxbkxUSG5WekRYZjFDNVJFUFBrbHB6bDFGcEI5NkFkVDlC?=
 =?utf-8?B?TUlVZGNOYnc4RERDM1RvZlM3Mlg3VHFXRk5KcndmVmg3NGxWTFVrZUxBTURQ?=
 =?utf-8?B?bklVeCtuNExnU2FRZmc3MkQxMmV1MnFsVU9PbC9Dc2hiV1lnemhGNVZoUzgx?=
 =?utf-8?B?T2pNTXJZS3lEaG5ockxyMm55KzM1ajE3cEZUZStYcXB0L0t6MlMzRHN0b3pr?=
 =?utf-8?B?WG50VmxYdEYxS1UrZ1crdTlUYmx3enliODJmZTFFdGErcDRPQTZmdGk1L1hX?=
 =?utf-8?B?b0pVM3dBNTRScnJLVmNuSlFHY1V6VW10c04vRXJ1TmtYNGFlRGlCdy9YdXhH?=
 =?utf-8?B?dG5DQ1MyOER4UUQ3ZzhHRlBmYW9tT1lLeXFVbXZLUmExL3pMeDhvcVU1ejd0?=
 =?utf-8?B?VUlTYWgxM1FGUmc2K2JJanY5OEhOOS9WNTloSzRmUGw4MDZrQU5ScTNvNEFz?=
 =?utf-8?B?d0tBN1EwUUVHVVM3RUgwQXhlZWVXUGFNL1hqcXNQSFNrSXF1NzRrcFRIbEdV?=
 =?utf-8?B?RmE4amJSSG56czdiRTZPZSttcktLT3ZsZlYweXhwd210S29ZVy9KT2tRV1BL?=
 =?utf-8?B?WkhUZWNMQjd5QVk3WFBZR21MUjlLR3pGQTB4amtXYW9LcXRIWjA0Nm80dzZj?=
 =?utf-8?B?dzVKbG43NWFUc09wY0YxeURFZ2hLM04zYStkMWZJUE5RYVdibE1YeEdBZWsz?=
 =?utf-8?B?WVB4NTk1U3gzNjRyd29hckh5ZUVuK3FGZFBkMXZUYURrSXpYQWozV0I4TXpQ?=
 =?utf-8?B?eGt2WU5aN3ovaWJjcnhkeEI1Z0FEOVkvaU5RVGRocU5IcFhWaFpxMVJVa0sw?=
 =?utf-8?B?TEdVT0pQbWYrbUNvV3pScHdra3c1SHRsZUJTNWxjSkZkelhhajZiOG00TVFm?=
 =?utf-8?B?ellveEtHTmx3YW9HUUNZZHFiMzNPaGpqY0RZaHBJUFhwZ3FoYzRsZUtzNUt5?=
 =?utf-8?B?bG84QzE5QmNxcVVtUXlMYWthYmhYbkRlOVc1N3psQktLN0tIMTFRSWg0cWFG?=
 =?utf-8?B?MldIcWo1SkVlWHdtSVRNZU5LdVVZMWhVdlVZMEgxS245VGpVQXdkOTRoNkN1?=
 =?utf-8?B?ZzBmZ2gvRHpBZXdhdHZER3ZJK05paFRMZFpSQVBJQzJSVU96V0lCMzNPS1lj?=
 =?utf-8?B?VTV2elRXblk3V0owQUxLOFVwNWIvUVpBYTNSSnB3TXFIZkpLdXpNQjdoL0ho?=
 =?utf-8?B?Q3BMMDdFNW1teXY5aHJQMysvOGFtZzQycVltRGJDWndVZ3VhdzNJdkRWV3Rw?=
 =?utf-8?Q?UdLkCsc+D/nJbauyHhVcA7l2w?=
Content-ID: <5C6E17024C391440949B4BDA05760124@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aceb0f2b-b88b-4078-91d7-08da6fa05be3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 07:19:35.2968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zmk/Ey9BXqG3hJJsU5mDSDpTCf8nU3CMxtH4MIXtcKoS1uJh/yp0W5VaLvCaXi1pqEE0tlWzdHOAc8Uo8yXdTGDlCINuCLeIgA6Ks8i3B70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6703
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_001954_240946_66224B29 
X-CRM114-Status: GOOD (  20.52  )
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

On 27/07/2022 08:13, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 26/07/2022 19:39, Conor.Dooley@microchip.com wrote:
>>
>>
>> On 26/07/2022 18:35, Krzysztof Kozlowski wrote:
>>> On 26/07/2022 19:07, Conor Dooley wrote:
>>>> From: Atul Khare <atulkhare@rivosinc.com>
>>>>
>>>> Fixes Running device tree schema validation error messages like
>>>> '... cache-sets:0:0: 1024 was expected'.
>>>>
>>>> The existing bindings had a single enumerated value of 1024, which
>>>> trips up the dt-schema checks. The ISA permits any arbitrary power
>>>> of two for the cache-sets value, but we decided to add the single
>>>> additional value of 2048 because we couldn't spot an obvious way
>>>> to express the constraint in the schema.
>>>
>>> There is no way to express "power of two" but enum for multiple values
>>> would work. Is there a reason to limit only to 2048?
>>
>> Copy pasting from the cover:
>>> I don't think that there's value in speculatively adding values to this
>>> enum especially as (I think at least) the scala for this cache IP has
>>> been released publicly:
>>> https://github.com/sifive/block-inclusivecache-sifive/blob/master/design/craft/inclusivecache/src/Parameters.scala#L32
>>>
>>> The two compatibles in the file match only against two specific cache
>>> implemenations: the fu540's & the fu740's. I would seem to me that, it
>>> would be better to lock this to a single value per compatible since the
>>> 1024 applies to the fu540 & the new value of 2048 applies only to the
>>> fu740.
>>>
>>> I have not made that change, I simply wanted to repackage this series
>>> in a way that could be more easily applied & restart the discussion.
>>
>> TL;DR: I would limit it to 1024 & 2048 to match the only implementations
>> although not in the way this patch did it.
> 
> The explanation in cover letter is good, but it would be good to have
> one sentence like this in the commit msg. Otherwise your commit is
> actually confusing - you mention that you want power of two and then set
> only 1k + 2k.

Yeah, I just took the commits from existing patchset as they were.
I'll rewrite the commit for the next time.
Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
