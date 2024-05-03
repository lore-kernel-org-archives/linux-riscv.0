Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8F6C4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 12:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wU8hxlCjFt/F5xpHl3MCwxCqR6XHtlbuqlIR4cYtjj8=; b=kN59IRiXJ1XLbq
	GGlvc75vafwR15+AWkvm60kZN0wGwPPcan+IUjPN1m+xDXEeCe4ZPNkBYuK3sm8afpRuJvZfeczWr
	07hRLkLCZLeOBEOL1RU8193wzwRhnTuEZU+v21Y0mxT8LDhtxLSqZFzfzjUwkmNOEQHwbGD9Oy65F
	LxPIV0K+2kvVZ1XlNGndSTUr6Gw/l4/NjP6Oqtwkx+vkKuYjdfw/0BuOtOjdYws4tax61VwycipTX
	gOhUIqg3qL2XT5SLyRI4+UNJ37PHl0IsOLb2WE2tbOTGtuBhz9+F9JVfQ989QlEHPpZKOMK+UQBGn
	gjlzoh6Igm6oNkgP9hzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2sR7-0000000GVGt-3K6F;
	Fri, 03 May 2024 12:54:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2sR4-0000000GVG2-2yuf
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 12:54:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1714740886; x=1746276886;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=40RUPK77rucAvVhvzECrNpoEkn49tCbAzwCxLZIKLDo=;
  b=nOU9mp1S2g/LNE9gfM3SoX/Q+XTTQQIRQ8ZM9XJGBlAXD7jusyExep0A
   ZGaT/oM7bNxXtIzQjnjjP2Bga9C6JG1+HIGjiCO4TwzgXNEMbb+T1kDxT
   42TjamMDr6s9yK1ZLbfDETNk2rYaTnqWFqQDbseGK5SLCOUjCXwnxjhr3
   8DmPt/EXFWfe3JOS8oo8SNO9nSQhnqxhqqSbd9hwWqcSx/driPr5dFjjp
   2epBI/TUqiwgK1jg1//2dIjdyeZOU7PlUVWWAndaKhjRjhRb+daNdbcbI
   VaDygnnNtcgHvfF0EQER7Nepv5hex0H2AbBqhqb9vxAhtKI5oQiRYyZzV
   g==;
X-CSE-ConnectionGUID: 6OePRW2VSAmEcriAavjNkg==
X-CSE-MsgGUID: yPh822BRSru5EL2JoeKB3Q==
X-IronPort-AV: E=Sophos;i="6.07,251,1708412400"; 
   d="scan'208";a="24077381"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 May 2024 05:54:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 05:54:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 05:54:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHs1McTQYIlP+PSe+iSN8aR2PTQJXdfk5IiGLbrnWDgGQaxIhpbZkPlLIILYgHb75GJpGARSsfZV/YWoVCCS/gzTYSpOJhOoMugF5m7CRjlnSPQxsXj//ghuCSA0ESYIeDaMhE49kWhnPe5rN0pSuzdHW1I9UHdVsYIDkCHDXra2zFYEJKI/oS+K34zRhkbDfwc/lfDgbcsSSRx6XFIIqeW+Rld7BlpkWOduG4gyDItkcj1TsYGja0Iu/+oi70LRD6yr5BJdmYvVOklFo+vPDQ/NgqcuTONZFRFbOM+nu9ZWNlIHKS3NID/kyGQuBoW22+iOaqXQwx9emlLsukq9Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40RUPK77rucAvVhvzECrNpoEkn49tCbAzwCxLZIKLDo=;
 b=X4L5qeTXNmwyr+ep18eSH3e1/T2dCsY7AZOpkGsk/eW4goRFnNppmWaD/u3G8VrI6ESlnb1YRQ4El+Ly9M44shZOr1iIJ4o27aY9DetqZwTQv3YTTOIn2yP+wQSMmUKE7TrQZGQcf0a3uPrwsaqr9JRnSWZadbXkZUsBr37mRHFFt6s/ziLIXe2HTF5MtqDpUsyQWVxyfSeXJNSrZbot7oOVKwVZa78K/QBtS2/+OEbIw8/uPcw8vp0i0GlPDvclW8DhFQWafBZP4VFNCtukJOBsUNJNLZpYKawkDIW3hwgE0TqcimHuTOQ2cV/+tE9SdAjN2dz7dDzWdn4uBeyUqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40RUPK77rucAvVhvzECrNpoEkn49tCbAzwCxLZIKLDo=;
 b=JZX4INjOJsaOSYAXL0m5CtP9+5C89VSL3LLxOdiRDQrNsYn2Pl5+h8e3VcMXac+aC/t/3qgBqLskgzDEo431beG0pQau7/zDJvASZvF9WTGz8bpDReL0JDjAmYgZi2oyIX/SJ1g3n3/OJ8zFHDxWafbcbawPGS+GYSwPZlpx71Qd6L3w/BMwu/iSahkSamYxLJdG/QE62aWsDxdG6eXy8+yezbOKy/cIylbUQwLRsZy8N3VBIbKW6HDzg9U4Gjnr8Gi5z/RYUDtcZ9vJWsXDAucZcE+iJAkEzveXnM44msrRwYHalqQ9chlM1t9bhxralRaPPDOLJO8aURvGXU1HRg==
Received: from CYYPR11MB8386.namprd11.prod.outlook.com (2603:10b6:930:bf::13)
 by CH3PR11MB8210.namprd11.prod.outlook.com (2603:10b6:610:163::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.34; Fri, 3 May
 2024 12:54:20 +0000
Received: from CYYPR11MB8386.namprd11.prod.outlook.com
 ([fe80::22ac:bfa1:678f:f510]) by CYYPR11MB8386.namprd11.prod.outlook.com
 ([fe80::22ac:bfa1:678f:f510%4]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 12:54:19 +0000
From: <Prajna.Rajendrakumar@microchip.com>
To: <broonie@kernel.org>, <krzk@kernel.org>
CC: <linux-spi@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<Conor.Dooley@microchip.com>, <devicetree@vger.kernel.org>,
	<robh@kernel.org>, <linux-kernel@vger.kernel.org>, <krzk+dt@kernel.org>,
	<Valentina.FernandezAlanis@microchip.com>, <Daire.McNamara@microchip.com>
Subject: Re: [PATCH 2/3] spi: dt-bindings: Add num-cs property for mpfs-spi
Thread-Topic: [PATCH 2/3] spi: dt-bindings: Add num-cs property for mpfs-spi
Thread-Index: AQHanJ37n9FOOFXPxkOxyyvGvn4yU7GEB80AgAFxNIA=
Date: Fri, 3 May 2024 12:54:19 +0000
Message-ID: <1edb6c4c1a66c1a2009278b99f897e3a71b592c6.camel@microchip.com>
References: <20240502143410.12629-1-prajna.rajendrakumar@microchip.com>
	 <20240502143410.12629-3-prajna.rajendrakumar@microchip.com>
	 <10671947-f418-4520-a29f-4ce129770e65@kernel.org>
In-Reply-To: <10671947-f418-4520-a29f-4ce129770e65@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8386:EE_|CH3PR11MB8210:EE_
x-ms-office365-filtering-correlation-id: f80b1741-fd40-43f4-b721-08dc6b702605
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?MXB4WlNwaWI5M2F2Z0dLazFnNXEvQVhoV0RIcU1QbWRKQ2VLUlFuRHV4SmxI?=
 =?utf-8?B?ZnVaNU01OXdFN0Mrd204U1NCVGR0UTZGSGFOYXp5NW5IQmdLOExCS2p2a00r?=
 =?utf-8?B?QXFvUExORTNQbk80TzVPelNJN2N6aTBPMHN4b1VpVHhkWDBXQkZVMEZkUThj?=
 =?utf-8?B?eWkvNVE4b21DdEVWSmlPcWhZSUtjZnFxaWhPYXdPWHdoUXc1OXdtWWYxbVZG?=
 =?utf-8?B?elo5cEhCSkhSUkZ3dUNtZXZqakVlYjJhbE9nTWFoNzlQSjN2a3BsdVFTejU0?=
 =?utf-8?B?YTZ1cDcrZ1dzTzMvNTkyUkpDeklxMFB3bnhGdUtGbjA2NTdNK0FvNzFvdU5k?=
 =?utf-8?B?c2RWUHQyb2dOR3cyS0RqTlJQdHFJcll2Q0Rmek84VFpOemtFS2ZlSU54Y3A5?=
 =?utf-8?B?UXBOQnlNUnFHSGs3Skc3MWZMWGd0RjJFTWFGZ1kydXFzV2o1TWVSZTFtVDBS?=
 =?utf-8?B?Sk1GQnlTTDJuTGVFaUhPU1VEQURhTlI0eFpUZ0U0SmY4eTQ2ZHpXeTBkL2JX?=
 =?utf-8?B?V2NxZ0dZKy93czUxbHJ5bVZOOC9qSTNRRHIxU2VDVzRvOVEyc3RRckgwTnlQ?=
 =?utf-8?B?ZUtNcTBvbVpWQ1VPTVUwZTUzV1A0Z3I0Ukl5ZHF2aHQ5ei9WUmNmZ1QwR0FJ?=
 =?utf-8?B?L1hEVUdOdTZJTnIya1pnTk93NjRqYnhBc2dvSnJ4TXpkSmF6Ulp0ajdoTjZn?=
 =?utf-8?B?VVR1U3VyenRsdEFZK0phQUpSdXFBaU84SWRiTXZPaU5Tb2hGTDNleVJIOXVi?=
 =?utf-8?B?WDV0aEkzaTMrK0xXb0xKNExjVGY1cHNVVGNYL25WRWx0VVlPY1ZhOWtXTnVr?=
 =?utf-8?B?TFAzS1NSdDI5Nm9lcnp2SHlOMWtRTVhPTitucGVYcDlvRjBrWU5DaUVwRzRk?=
 =?utf-8?B?cXdMZ0JUTUNvcm9oUitPRUdSYXdjT1lDQ2hoY2Fha0h4VVlSSHlWYTROTzVS?=
 =?utf-8?B?Qm9RYTNFU1piYkdBdVBja1BmUkFNbFc5TEEzd3J3NDJpeEJZRmg0aTd6MWVS?=
 =?utf-8?B?S2J4eWJneEp4NFhiZkJpM0htQjZhREhBRUNaRlJ0SENCU1N2ZFJzU2lBSXpy?=
 =?utf-8?B?eEErbm5XRkw3dEJZbWFXQXpyejdaUkVSQURJdGdlRVVxc1d3TDEyNEZsRG5U?=
 =?utf-8?B?UjVrTVE2UDM3M0U2bDRKQWZXM0hleEkya0NGdDRDc0N4VUp4dnMrL1dCUWRV?=
 =?utf-8?B?bEg4NWtOUktTbXRKQVRwK3MxU3JrTXliL1FHa3hvOENyTUUvMXcxNnQyZWxw?=
 =?utf-8?B?L2YzRWhwemFiNGNxKzl1SGp6RjJaenJkNTA5Qld3WmxtczVRT1QvUm1qQkpa?=
 =?utf-8?B?eXpadTg1aWdkNkFKRTVKcGtVYXRObVF3T3lMak1OU01rUWRkZVFUWTRKY3dj?=
 =?utf-8?B?Y1RScHR1enN5RkdUZUtmL2hudDV3dStjdHVuV3dqZE1PYm1tWThvY0c4ZHM2?=
 =?utf-8?B?WW1Cc05KWTNvMk5Bc0R5bVc0R2x6V3ZSTnBHUFJGd2V0N0tiNmxpY0hCNEsw?=
 =?utf-8?B?c3c1MmdOY2tJQktTS0VsRkkrMkVwc1hjR25TR1VqUUJUVmpWRk9QYlVEV0Zq?=
 =?utf-8?B?V280b3lRYVVaUVRBU3BONmpSelVZb0hkYjl6MkNXU0w4cmxLNnJjUzk3eG9n?=
 =?utf-8?B?TGgrcVN3TkdGNVpGQUo4akE3VEVMU0orakE1WGUwRjZxM1QvdkZoQmVidEN1?=
 =?utf-8?B?VHRuaDVxbGRKcDRtRjJ0VDFMZTJEQU5EUzN2a2lyb1pjc2luRjQ4YUFZZHMw?=
 =?utf-8?B?dWhJTXViNWRsMUVKdlIwQTJVMjIwK2xOMjlLVmdRbW1YNW04UC9xNWRuVGN2?=
 =?utf-8?B?a3JZQUFsdE9tQ3Q0elFPQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8386.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHZjQk9zMHZEWlNEYzJnUXNHSXZSN25TUU1uK0J2bXNqamZ6VjFBaWhLQ0hB?=
 =?utf-8?B?T3E5Tmo1Q3VIMTN5Z1FtWDNhbVZqaXFiN29mVDdOREllTEI1aDFaQ2lZemdY?=
 =?utf-8?B?UFYxbmdyNExxdWUxeGttSm15RGJVSDBycHA3Qyt2ZFhKTFJLZGNreHRuZC9X?=
 =?utf-8?B?ZVNnTytjMmxMRTZMM1lZSEhvSFE3ZmR6a011eGszYWJQcE9GUWI4Wm5nYzJU?=
 =?utf-8?B?bEE4bUF1Sk10Z3laSXl2RkRtaHVGUkVWcmFVZnNpRENaV2p2V2l6L21HVC9o?=
 =?utf-8?B?eGtZQWpTLzdmWm41YldiZ2lnMjFOM3E5THgxbFArWTFoemgzRWMvK2RrSG5z?=
 =?utf-8?B?Y085YVZsVTMxbUJ4SXQ2Rk5Ec3pYK0YvR2RCRzBCc0poVkQzekZ1VkpLM0h6?=
 =?utf-8?B?QXJwSklKSnQxUDNENG0rTlE5UEZNbWJqQ3V2Q1J5SWtkaVVlOWxmYjdaaVlD?=
 =?utf-8?B?eVV6UHdzK3FkN1h5dEFzNExjQjl1ZEkzZVpKV25mMHFZYjFXSUlZanl2bW1V?=
 =?utf-8?B?ZjZ5TWRoQjJNcmMvZHRjV0QvbnZPZExmNWJweEZGWkFsMXVHZFMwaEgzL1VU?=
 =?utf-8?B?Ukl4T1Y5eEcyaHpoVVh1U0Y5eTZneEo1a2xwQnJSS3lSSmszSHRIVFdmRkJw?=
 =?utf-8?B?OHgrRm43Z3VHU1REYVI5Y2llZ055Sk14ZzNYQk5MZXFXbzZvdlFBVm1XajVE?=
 =?utf-8?B?T3dFN2NMSUVkdmdNazZNd1c0aTFZTGs3RlNsUUk5dVl2SUZMQi9BZHRVK0Vz?=
 =?utf-8?B?ZW1KMTQ4aU1IUnlnLzIrVk5ONU1HWWtUZ2ZrVWlZWFlud1V2S2lFUFRWSFUx?=
 =?utf-8?B?S2dHVDlCY3hJNlB4bkpwK2NHaFFpWTJyYXkxcDVLRHAxcTRmQUNDVFRzTTlZ?=
 =?utf-8?B?Q2kreld3ZWJWNVUraDJKRjRvcHZkUHkzLzBBSXJ0VkV1M2xsVUJLWTM2LzM1?=
 =?utf-8?B?L2h3ZHRlbEh4TlVzNHZKdzI0YlpnU045dE85aHU5Z3JPWDZWU21kYUxSSEY0?=
 =?utf-8?B?TFVkZklYL0VESW11Z0hrb0pmNDdTTWVOUEQ2SEx1N2dEQkdiay94SFg3SktW?=
 =?utf-8?B?Y0lRc2t4MGlrUFZKdDR5L3lQV043OTkrOElKNFFUYTcyNVlBQm9QYUlmWktv?=
 =?utf-8?B?d2NQVXpKVnZ4WTNydTRPRnpzTjluRnJuTDdkRHVsNXFTRFY0UkRrVUlnZ3I4?=
 =?utf-8?B?SkkweDZKaGNYREdxYU44eTRhTk0zMGt3V3E4dGNSeklKR3IvbXRrTG55NlI1?=
 =?utf-8?B?UFpIdGJrVnJJWGE3NnNuOE9IOGJJK0o1UU1Bd1IwSGdBb2JaSzlhbDRZSTZy?=
 =?utf-8?B?QldGSUxhK1FURnZUcU1Ua3NhaVNPdVhLcFU2RGZ5OE5FS2N1MkplR1djd2Nl?=
 =?utf-8?B?b0kwdGlwdDVDMHprR2xNNjRuUHpRSTNobGNGR3lQaWNNV2JHRE9EWm4xNUd1?=
 =?utf-8?B?bDFJdmdKV1dvNGp5MEM5NW1CNUkvcGZscDYzWTBqL2M2Z2xXbTJFeTVtdmls?=
 =?utf-8?B?VGorcHBYSVNpRmRnQnNramxIdGVKNnpDR0dUMThSVXY5em9uSW9DRndnb3dp?=
 =?utf-8?B?emNNTTNieFJZZUVlSFVWRkZ4dnFZckhCaXBBQzB1R2pyMU5PT1ludHFmbXBH?=
 =?utf-8?B?M3hGdm1vV2xlTVNHdU9Td0VzK21PdHhuYXVYL0V2MWlwU3BxN2NWd24wZVNG?=
 =?utf-8?B?REptc2RCMCtFVngyamozdDBhNGc3cWpBSjB4c0RpRUJmUEwrY1NhTzNselNy?=
 =?utf-8?B?dVdnVFdoM1Z5L0ZuQUFzeks1L0ZlMmFjSSs4Q0V6YWVPQk5qT0lpejZhSTFH?=
 =?utf-8?B?bkY4YWFwZzhoSWh4U1AwUUFVcFByM2l3Lzd5c2ZLb2lpUlZ6WXVwd2hxWmVR?=
 =?utf-8?B?ZmhRbjZ0UnpidExBdlltSUs3NndpSEpSL3BJWHNPMGExV1d0N3c5dGVkRjl0?=
 =?utf-8?B?ZGd1N2lBSW1oKzhsWnozcjhwWXBFQmgyZmxCZEg4UEg5V2ZhdjhzeHI1Zm8x?=
 =?utf-8?B?TkxtYTFjTWNHdW5rZHhwUEpCYlFSRGkzZXptYlhwMkZubVM3cDhEL1hyeGpM?=
 =?utf-8?B?MXNieFRlRnJYM2x2Q2pKZDQxTDRQMjZqTDE5YTR6d3Q4Z1AyWjhQQW9NV1hl?=
 =?utf-8?B?bzJEbFM5NGJjVEU2TzdwL3RyUmNzYnBTN2lqTGFiQktTcktOOHI3Y2hnNE1Y?=
 =?utf-8?Q?dkfimRrzU0KNBbgDoyAYpIA=3D?=
Content-ID: <AFC84B1F84F31F46BFD12BB8B87462A2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8386.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f80b1741-fd40-43f4-b721-08dc6b702605
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 12:54:19.7725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E7e/21Q3gq9GxoaEGBXaDvWMuMnerYgp9v6WBjKzgaKPYHR0G8z53MAelirAzz5TJdwpCNOvt6HSxyEUsAkFLdDpjnuS7hhfK45Ih1W7jGw0rTrpUW+Jk3p3+w64TSd7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_055447_071038_49871195 
X-CRM114-Status: GOOD (  20.69  )
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

On Thu, 2024-05-02 at 16:53 +0200, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> On 02/05/2024 16:34, Prajna Rajendra Kumar wrote:
> > The PolarFire SoC SPI controller supports multiple chip selects,but
> > in
> > the MSS, only one CS line is physically wired. To reflect this
> > hardware
> > limitation in the device tree, the binding enforces that the 'num-
> > cs'
> > property defaults to 1 and cannot exceed 1 unless additional
> > chip select lines are explicitly defined using GPIO descriptors.
> > 
> 

Hi,

> You marked it as Fix for bug, but I don't understand where the bug
> is.

The bug was that the PolarFire SoC SPI "hard" controller supports eight
chip selects, but only one chip select is connected and can be used.
This was not reflected in the device tree because default num-cs was
never set. Hence, it's marked as a fix.

> Do you describe above the issue or the solution?

It describes both the issue and the solution, but I will revise the
commit message as Conor Dooley suggested.
> 
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: microchip,mpfs-spi
> > +      not:
> > +        required:
> > +          - cs-gpios
> 
> I don't understand what you are expressing here. Did you actually
> validate it that it achieves exactly what you want?

Since the controller supports only one chip select, the num-cs should
default to 1 and cannot exceed 1 unless GPIOs are used as chip selects.

> > +    then:
> > +      properties:
> > +        num-cs:
> > +          default: 1
> > +          maximum: 1
> > +
> >  unevaluatedProperties: false
> > 
> >  examples:
> 
> Best regards,
> Krzysztof
> 
Best regards,
Prajna
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
