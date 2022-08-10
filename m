Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B099FC00140
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Aug 2022 19:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1icDp/qw46reafJEdk2H2981PkUtj1BXwmMywbpCkq8=; b=yeDAYTvHzeCSeT
	wxyLEF2H2D1HCle/OyiGcMYlJ4+Y7ZjF6kxci8Uczf8FSN9HqkOcBGfXZXeP+LFGpDCDAsT9Swk4a
	NVFmdO8nhMjxAWVOQPSqb09A/05Syp8cT9GVtUxy7zdopxJRK7Yglx1YVoy2L/kkyvRq0e2taxfJ6
	OMxiHSt8D211kGWS9S3i/DFR85yuDsFAyxj6JroX5119IS10XG0qe2waqUmMjtfdUHuMj4qJ7iHfi
	4Toe1bOJn9601XQxqly8YN41pbatEDu8OXTA1HErDWkvKhiPi0NXcBWma+dpo08rCBOuOp1BZGD+J
	fi0N8+aXc/YtDn0z8JnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLrG4-00E6ve-0P; Wed, 10 Aug 2022 19:20:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLrFx-00E6q3-Fp
	for linux-riscv@lists.infradead.org; Wed, 10 Aug 2022 19:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660159241; x=1691695241;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=skA4v0vmZfIys6ugc3GiBxCUHizQVMWOs+mFw1VLV7c=;
  b=WT+fnIOWb99RyXzGgLfl8rsHmyhxhRi64Uq0A0S7NOC5UYlrh/hljiCi
   oUBd8SzhFv4Gng/LpZ8qaiO2tTUp2YzgK1HnJKlMIeXl6EAXQsxibi0Bf
   cndCB8nllCg90+Fnii2nT9LkAVJuhsCg1BGe6PbYdOZQDjmbal3ud4JWx
   D/bu6uOLLorlSGASZPGQI7iinBILSlvJ0cFfFxoDZWQ6jXJVdetiwaSEV
   5BWpea6Pm/Sx1wW1WVUkP4ztWOh11W2J62Md9XnYyIh0FxuitLbopDVXS
   EWHCZT1nEJnaxQEe6mzOwQtyC1JWIR//8i606qtOMwsFZnrnw6ajZnpfe
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="171885201"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2022 12:20:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 10 Aug 2022 12:20:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 10 Aug 2022 12:20:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cp4KAMQuQ0jJeNe58kvwquibIXabX1p2vGzsdoVL5OCCRudp1CXTi6dygcL2scFXZgkBqmCZlPxrCUo7B8wRY6pDYyc+fpBcVy6hf/N0QEJeVFe7lx3yr3NtDzGRc2v/4BvPh6d4HQ7vs5PCxSz6gkF3nO95r6mVBMi5al6reHJT19jWYDySdh1WZOdjvcIv81TEEPm1WPlk0KjiInjqCjpZB1IWbH1iJO6WeyAwCC9866000WHnKruS/Ep5emA+fSZ/zlM759So9cR8fPiziARZrJS5aAmj52fCvK+CWuUfeLFKewErfVbFGYyLploEXFxHs0OXVUjKOnJDVtmvgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skA4v0vmZfIys6ugc3GiBxCUHizQVMWOs+mFw1VLV7c=;
 b=ajVFJNp0NfHTcxeqUo+ah19USM9OKQCoyjfHbsJ/vjmPtiZDGMs6YUXrzH1OL3aLikInptbmiSjrOS5L5n0jGjTtDVviab7+5v0ni+j0MS12TM55vQ3vHFfdUn+dAg8/93AHn/KdTqV9jA102ck9VHoFVMulWMU6HU6ELJ2V3vA/i0AgiX2tzLy5Qf4VCQJndWz9J2r59miKsGIoOVWsZyFBTW47DYgpsTbK2mz6DOciZbZWtBM3+77g9ipaxRrylghGx4JIWF1Ur6hSqOV+0+IcQHV6yooO5oSPD5p+8kMvE7n/FmXLq1TBoh5zNdEWneSLnD4voGcnoNoyhdjcAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skA4v0vmZfIys6ugc3GiBxCUHizQVMWOs+mFw1VLV7c=;
 b=i0Sovvc02RtsLZJYKV1BZXbpGlvb8/XgyUszMeHI76tgfIQirWv+gzhbyBuJOqlWngFiJI4mIl7zCSJdpGBsliwKnkc3MZbN4l61t2vJ9DLiMDdNj24prCbnOLDHzWcIVmuR23HvMxeesQP90YW4kMUQxXaaFcHPCmNJzF40J94=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BY5PR11MB3960.namprd11.prod.outlook.com (2603:10b6:a03:185::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 10 Aug
 2022 19:20:24 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Wed, 10 Aug 2022
 19:20:24 +0000
From: <Conor.Dooley@microchip.com>
To: <nathan@kernel.org>, <Conor.Dooley@microchip.com>
CC: <ndesaulniers@google.com>, <llvm@lists.linux.dev>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <p.zabel@pengutronix.de>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<Daire.McNamara@microchip.com>, <palmer@dabbelt.com>
Subject: Re: [PATCH v2 00/12] PolarFire SoC reset controller & clock cleanups
Thread-Topic: [PATCH v2 00/12] PolarFire SoC reset controller & clock cleanups
Thread-Index: AQHYj5/vIrxOVV1EL0SoHOsgiQHkyK2nacwAgAFM1ACAAAaZgA==
Date: Wed, 10 Aug 2022 19:20:24 +0000
Message-ID: <fc470bf4-33bb-d67b-3860-3ac775982f27@microchip.com>
References: <20220704121558.2088698-1-conor.dooley@microchip.com>
 <bd14f1a2-750d-2511-df0a-85a9f5925f84@microchip.com>
 <YvP/bjh+wXihlrdG@dev-arch.thelio-3990X>
In-Reply-To: <YvP/bjh+wXihlrdG@dev-arch.thelio-3990X>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bbfa3ebe-5c32-48e1-05d8-08da7b055fed
x-ms-traffictypediagnostic: BY5PR11MB3960:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gyFq+LP6gsW2vS0RtcGNjUBtbpJL1ILTCeDqdV7IqO8f9e3r1HgiBpK5Rn19eA5i9i2ecoJ1i+tGVQGoLuaTJJkWZvHIQtb92F8KMz17CLZEWwnD52dhHYWsprsiyvIlU8LOhBJtvqCCJB6P743sFpOA+rcygvn2OS5lEHQDO5eaSNjLHXl/KOQ3HAVR1QclkayhQqlSlBLEKtirbtTCRkQPFjOvFc/vIIcH6Jy1LMH9uDi48Wqg/sCzGbRxx7KY355SevF8tVLCWL84o2HPB8KNOT5RuONcnsuhzmSSZRQzyCDhxvu4Mrig686MjBYXOxP5HiwIDxVhE96L3J+WHtGtU/RgsioSBfUY+eYzjNVtsXwLJ6W7Epr/uzdNAER9qgeklLewR6mF0C66zLJzsv32Vb378UOfPI6oFx5EKQ0DuEbN2U9k80AL4cGnRhd3CUM2HsGROtzkKj4Rjzx5ggWxEhG/FfRCWtXyoiBW/ZUHNVMC0nYvCyQWj0XbPdK8F2mdgxmf3Hq1moVfdEkctDYygn51+lrm0kBQDVKCfTcHu1QHza2IqDBt+oVkHFB5fL2zhc3fSZWPrGgC516G6zr0yZy9hDazXVzGgBhaU1zfomtVBVYyUUyrzo/i52WN61eCKuMkqGctTBAcllSVqHcpsru9s9fqB2+6oyFb97ngwLOKCcflsg1PIZOnXHdUo5sxXhOa63LAQMZuskx+Xzv+QVqUpuQmOZVs8F9JpMPCBxxL/3z3ofUJk2gBtgpMihxb4dqV/rRUAiYHIf4ZFUQH7zelyayzs9GSUwCkJLw5NEjxDtF32gyEd4YHwxuP+IlE94bW6cqQz67O0EMZnCfVhEgcmvnIj0RsnmmZ6P5MJ5S2NUk/SG9cmGO3ZK9pMAk7us2EDfNJHXMjZ4hH8Udw9hOd/f+3R6VGyFi684ll3j9t3o/0f4dqOCiMEKBl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(376002)(39860400002)(136003)(396003)(4326008)(7416002)(186003)(76116006)(54906003)(31686004)(8936002)(66946007)(38100700002)(66476007)(122000001)(66556008)(966005)(64756008)(6486002)(8676002)(316002)(71200400001)(91956017)(110136005)(36756003)(478600001)(5660300002)(66446008)(2616005)(26005)(6506007)(2906002)(41300700001)(53546011)(6512007)(83380400001)(38070700005)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTIxdWdaeTVjM05UM2tNazVRU0xvV0JDOExiV0dEWk0ydVBZQmZyWHlnR1dh?=
 =?utf-8?B?U08ybmxxOSt2U0dEM29HbENXc3hseEN5a01kZStLTXE4VlJiUHpJYUFLK2t3?=
 =?utf-8?B?TUM2Z2RjN3h3aG5lbHI3MmV5bmo0M2U0ckZaMmQ0bGppVmZNSklYS3UyN3NQ?=
 =?utf-8?B?bkVoOWZxSkU3Z1RSbElNdUozaUZqZ2MwOHlReXhrNUlPdkVWb0hYb2dJWklW?=
 =?utf-8?B?U0dJNmRoZjN6MHpYZVAweERGbzhyRVJQdkdBWTI0d2VuVEJOcFZrT2tjYkFu?=
 =?utf-8?B?WkxTcGovN1FObjlVNjNDWUpiRDlnSzUyNnkrakRGcHdIR1l5cHp6UnhzMnJr?=
 =?utf-8?B?WFB3Y1NJcWRFaklrdzJ6ZzNib3B2aEdZSW9jNnZveXNHeHVTQURPNXZ3QS94?=
 =?utf-8?B?eVhOQzNNc2hVT2pqRGtyT21OcTl0SWlpaURneVJqSThPM0JVZ1kzZnJ0OEtB?=
 =?utf-8?B?eTRqVFVsUEpGL29MamRtYnRlc0hLeGkwWmVrK1crdENJQmFXUGt1Q0ZQTW03?=
 =?utf-8?B?YjRtU25kay9ReXkyM2t6Uzh4TWdqdThBZklHcnNqWkVZUTRDREdmS1ozT1p3?=
 =?utf-8?B?SzBVTUpIKzVNMEovd2djQmU0KzJoSnplcE1rU0tlVE5vdjN5MjJQczdPaTdV?=
 =?utf-8?B?TDJmRUZOUGk4VXpHRkxnVVRycjM4eUJzZXNyb25IMnpMdVZBTmVONW5kc0ZV?=
 =?utf-8?B?NlkzYUFKMTlTS1QxdUZHYy9vKzJVZGhiNGR4TmtFTGNtdnlDa1NZSWQ0eklC?=
 =?utf-8?B?V004eWRGSjQ4dlpXZGdJOEdUV3o2TEg1dFJhaE1iVWJJZHowS2E3RjBoR1BQ?=
 =?utf-8?B?R2NlYlRueE50WFM4WXc5Q0dGZ1lUN01WOFFKdlZ3NEphek1VdHpVZ1BOYklY?=
 =?utf-8?B?a0RwOHh4VWV0U0xJRjNKTXErOElpMW1NK1JhNFBvQ2ozZnRmTXRyOXJZWldU?=
 =?utf-8?B?SWUwY3VXUGsxSm5TeTAzMm5SbDRXellJN3JpeHZ2Q1lmaEZDM0s0MHhkbko3?=
 =?utf-8?B?d081TTFMRGN3VG15cWJjL05vSmJYRkExeERVcVFOTi9WaWVjQUg1V2V3Slkr?=
 =?utf-8?B?ZmdMcDBzM0w5NXpwWWk3Mi8zK3JaQjZ0WEpVUmFjNFFtTlNZMkZRT2w3MW1E?=
 =?utf-8?B?V0FISnBzQjlQM1pJSndWM2FlM0hqclR3UXpObThpaWlaRStEeUltZUorQ2x1?=
 =?utf-8?B?ekkrN2doZ3IwbFhRSHo4OEgwamU5c3E5UHJFL2l6b1dzeFowZ1l1YWIyMFBZ?=
 =?utf-8?B?SjFxNVFZbkZ0OXI3bTZCVkozR2R3a0cwZHVCbkRrRkNYUldPYUduZ3FkSE9J?=
 =?utf-8?B?Y0RpWWI5bzlMUGdBNHo2aGMxOEJiVmRTbDlwN3YzYkpMVklDWFNLMVJNeVNV?=
 =?utf-8?B?SHI1VUpKaktMbjZTd2Y2SHFnWTl1endjWTYwbStLbm9zMjRldjMwcEc1ekNF?=
 =?utf-8?B?MVRFVTlWNDJHcDFWTUhYZkZRTG5JdHZoallMS1d0NXp2amxxVlBzOHNjL2lW?=
 =?utf-8?B?eWlRdnBpT05jTDhrWHlVNGtjZmdMT2ZFMFdXUGZOZnJhaktVd2ZJNjFTTmJG?=
 =?utf-8?B?anYxS0dxMHhwbWVqVy9ienRaVEQwM2lmdEdrL3IrSHVKbFlYRWlhV3QwR1hl?=
 =?utf-8?B?M01zUVg1clBmV0FhcVQ4cU0zRlp4U1JUUVFaMzJLN2JUTkVqK2plbFVKcDZs?=
 =?utf-8?B?QkxhRksyQUJ6dmlzLzdwYzFudVR4cWhhQW96a1dZazhnWHBHWXZZM0NFOWF5?=
 =?utf-8?B?YzRHSlZFOHdIdElIamhWNlJkQkx3QzVqT0FQRzdQVGw4empPRjBOd0tlYmZR?=
 =?utf-8?B?dmpMbEZSOWR5UWRMeFZkY1hWNnJ6U1hzRjdRdEZyTXRjLzBzVXJhaTJmTEh6?=
 =?utf-8?B?Zi9valhOdTliZUJNQkdpd0NXV1FDczNPWksrZVczQ29Rc002cCtOMVdqSDRq?=
 =?utf-8?B?M3NhZ2hYcGxFRVFTc3E3VDYreDlrRU5xenhRZTV4aFhqcGU0MEVrTG9XVlFX?=
 =?utf-8?B?eW5SQnJiWGtZSFliS1doeW1heGluZnFzZUlzaENHK3VjNjVGeWNIazZpN2xt?=
 =?utf-8?B?MnhKdmQzWWVLRG1pNk45N3RjT3pIK3A0SllQZUMwN1pUN1RwaWtpRXZXMFZs?=
 =?utf-8?Q?0W5aEPXmOGDb6fbX8DoVPZCP3?=
Content-ID: <D3371C765AE46C4DB67E1633DB18D5B2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfa3ebe-5c32-48e1-05d8-08da7b055fed
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 19:20:24.0299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: weiBoRFIb3fR/M561lo9Mi5CtSFW6SatwpoE8IP+Zd8VEYPD3MQ2tjIagP7tm/GrfOw9wDRhiYaRZ6rsvSbhClewOlB3Sz8zirtKPALq1vA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_122041_991692_D757E6D4 
X-CRM114-Status: GOOD (  29.74  )
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

On 10/08/2022 19:56, Nathan Chancellor wrote:
> Hi Conor,
> 
> On Tue, Aug 09, 2022 at 11:05:32PM +0000, Conor.Dooley@microchip.com wrote:
>> +CC clang people :)
>>
>> Got an odd one here and would appreciate some pointers for where to
>> look. This code when built with gcc boots fine, for example with:
>> riscv64-unknown-linux-gnu-gcc (g5964b5cd727) 11.1.0
>> The same code but build with clang build it fails to boot but prior to
>> that applying this patchset it boots fine. Specifically it is the patch
>> "clk: microchip: mpfs: move id & offset out of clock structs"
>>
>> I applied this patchset on top of tonight's master (15205c2829ca) but
>> I've been seeing the same problem for a few weeks on -next too. I tried
>> the following 2 versions of clang/llvm:
>> ClangBuiltLinux clang version 15.0.0 (5b0788fef86ed7008a11f6ee19b9d86d42b6fcfa), LLD 15.0.0
>> ClangBuiltLinux clang version 15.0.0 (bab8af8ea062f6332b5c5d13ae688bb8900f244a), LLD 15.0.0
> 
> Good to know that it reproduces with fairly recent versions of LLVM :)
> 
>> It's probably something silly that I've overlooked but I am not au
>> fait with these sort of things unfortunately, but hey - at least I'll
>> learn something then.
> 
> I took a quick glance at the patch you mentioned above and I don't
> immediately see anything as problematic...

Yeah, I couldn't see any low hanging fruit either.

> I was going to see if I could
> reproduce this locally in QEMU since I do see there is a machine
> 'microchip-icicle-kit' but I am not having much success getting the
> machine past SBI. Does this reproduce in QEMU or are you working with
> the real hardware? If QEMU, do you happen to have a working invocation
> handy?

Yeah... So there was a QEMU incantation that worked at some point in
the past (ie when someone wrote the QEMU port) but most peripherals
are not implemented and current versions of our openSBI implementation
requires more than one of the unimplemented peripherals. I was trying to
get it working lately in the evenings based on some patches that were a
year old but no joy :/

I'm running on the real hardware, I'll give the older combo of qemu
"bios" etc a go again over the weekend & try to get it working. In the
meantime, any suggestions?
Thanks Nathan,
Conor.

> 
>> The boot log is fairly short so here ya go:
>>
>> [    0.000000] Linux version 5.19.0-13253-g374b508ee318 (conor@spud) (ClangBuiltLinux clang version 15.0.0 (git@g
>> ithub.com:llvm/llvm-project.git 5b0788fef86ed7008a11f6ee19b9d86d42b6fcfa), LLD 15.0.0) #1 SMP Tue Aug 9 22:42:10 IST 
>> 2022
>> [    0.000000] OF: fdt: Ignoring memory range 0x80000000 - 0x80200000
>> [    0.000000] Machine model: Microchip PolarFire-SoC Icicle Kit
>> [    0.000000] earlycon: ns16550a0 at MMIO32 0x0000000020100000 (options '115200n8')
>> [    0.000000] printk: bootconsole [ns16550a0] enabled
>> [    0.000000] efi: UEFI not found.
>> [    0.000000] Zone ranges:
>> [    0.000000]   DMA32    [mem 0x0000000080200000-0x00000000ffffffff]
>> [    0.000000]   Normal   [mem 0x0000000100000000-0x000000103fffffff]
>> [    0.000000] Movable zone start for each node
>> [    0.000000] Early memory node ranges
>> [    0.000000]   node   0: [mem 0x0000000080200000-0x00000000adffffff]
>> [    0.000000]   node   0: [mem 0x0000001000000000-0x000000103fffffff]
>> [    0.000000] Initmem setup node 0 [mem 0x0000000080200000-0x000000103fffffff]
>> [    0.000000] On node 0, zone Normal: 16064512 pages in unavailable ranges
>> [    0.000000] SBI specification v0.3 detected
>> [    0.000000] SBI implementation ID=0x1 Version=0x9
>> [    0.000000] SBI TIME extension detected
>> [    0.000000] SBI IPI extension detected
>> [    0.000000] SBI RFENCE extension detected
>> [    0.000000] SBI HSM extension detected
>> [    0.000000] CPU with hartid=0 is not available
>> [    0.000000] CPU with hartid=0 is not available
>> [    0.000000] riscv: base ISA extensions acdfim
>> [    0.000000] riscv: ELF capabilities acdfim
>> [    0.000000] percpu: Embedded 18 pages/cpu s34168 r8192 d31368 u73728
>> [    0.000000] pcpu-alloc: s34168 r8192 d31368 u73728 alloc=18*4096
>> [    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3
>> [    0.000000] CPU node for /cpus/cpu@0 exist but the possible cpu range is :0-3
>> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 224263
>> [    0.000000] Kernel command line: root=/dev/nfs ip=dhcp debug nfsroot=192.168.2.5:/stuff/nfs_share earlycon
>> [    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
>> [    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
>> [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
>> [    0.000000] software IO TLB: area num 4.
>> [    0.000000] software IO TLB: mapped [mem 0x00000000aa000000-0x00000000ae000000] (64MB)
>> [    0.000000] Virtual kernel memory layout:
>> [    0.000000]       fixmap : 0xffffffc6fee00000 - 0xffffffc6ff000000   (2048 kB)
>> [    0.000000]       pci io : 0xffffffc6ff000000 - 0xffffffc700000000   (  16 MB)
>> [    0.000000]      vmemmap : 0xffffffc700000000 - 0xffffffc800000000   (4096 MB)
>> [    0.000000]      vmalloc : 0xffffffc800000000 - 0xffffffd800000000   (  64 GB)
>> [    0.000000]       lowmem : 0xffffffd800000000 - 0xffffffe7bfe00000   (  62 GB)
>> [    0.000000]       kernel : 0xffffffff80000000 - 0xffffffffffffffff   (2047 MB)
>> [    0.000000] Memory: 803032K/1800192K available (7485K kernel code, 2858K rwdata, 4096K rodata, 2181K init, 394K bss, 997160K reserved, 0K cma-reserved)
>> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
>> [    0.000000] rcu: Hierarchical RCU implementation.
>> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=4.
>> [    0.000000] rcu:     RCU debug extended QS entry/exit.
>> [    0.000000]  Tracing variant of Tasks RCU enabled.
>> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
>> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
>> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
>> [    0.000000] CPU with hartid=0 is not available
>> [    0.000000] riscv-intc: unable to find hart id for /cpus/cpu@0/interrupt-controller
>> [    0.000000] riscv-intc: 64 local interrupts mapped
>> [    0.000000] plic: interrupt-controller@c000000: mapped 186 interrupts with 4 handlers for 9 contexts.
>> [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
>> [    0.000000] riscv_timer_init_dt: Registering clocksource cpuid [0] hartid [4]
>> [    0.000000] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x1d854df40, max_idle_ns: 3526361616960 ns
>> [    0.000003] sched_clock: 64 bits at 1000kHz, resolution 1000ns, wraps every 2199023255500ns
>> [    0.009713] Console: colour dummy device 80x25
>> [    0.014676] printk: console [tty0] enabled
>> [    0.019217] printk: bootconsole [ns16550a0] disabled
>>
>> FWIW this is right about when the clock driver gets loaded
>> as you might imagine.
>>
>> My config is here, but it's been reproduced on a few different
>> defconfigs:
>> https://raw.githubusercontent.com/ConchuOD/polarfire-soc-buildroot-sdk/dev/conf/lowmem/defconfig
>>
>> On 04/07/2022 13:15, Conor Dooley wrote:
>>> Hey all,
>>> I know I have not sat on the RFC I sent about the aux. bus parts
>>> for too long, but figured I'd just send the whole thing anyway to all
>>> lists etc.
>>>
>>> Kinda two things happening in this series, but I sent it together to
>>> ensure the second part would apply correctly.
>>>
>>> The first is the reset controller that I promised after discovering the
>>> issue triggered by CONFIG_PM & the phy not coming up correctly. I have
>>> now removed all the messing with resets from clock enable/disable
>>> functions & now use the aux bus to set up a reset controller driver.
>>> Since I needed something to test it, I hooked up the reset for the
>>> Cadence MACB on PolarFire SoC. This has been split into a second series
>>> for v2:
>>> https://lore.kernel.org/all/20220704114511.1892332-1-conor.dooley@microchip.com/
>>>
>>> The second part adds rate control for the MSS PLL clock, followed by
>>> some simplifications to the driver & conversions of some custom structs
>>> to the corresponding structs in the framework.
>>>
>>> Thanks,
>>> Conor.
>>>
>>> Changes since v1:
>>> - split off the net patches
>>> - clk: actually pass the spinlock to the converted dividers & gates
>>> - reset: added a spinlock around RMW access to registers
>>> - reset: switched to BIT(i) macros
>>> - reset: used local copies of some variables as pointed out by Philipp
>>> - reset: dropped the success printout
>>>
>>> Conor Dooley (12):
>>>   dt-bindings: clk: microchip: mpfs: add reset controller support
>>>   clk: microchip: mpfs: add reset controller
>>>   reset: add polarfire soc reset support
>>>   MAINTAINERS: add polarfire soc reset controller
>>>   riscv: dts: microchip: add mpfs specific macb reset support
>>>   clk: microchip: mpfs: add module_authors entries
>>>   clk: microchip: mpfs: add MSS pll's set & round rate
>>>   clk: microchip: mpfs: move id & offset out of clock structs
>>>   clk: microchip: mpfs: simplify control reg access
>>>   clk: microchip: mpfs: delete 2 line mpfs_clk_register_foo()
>>>   clk: microchip: mpfs: convert cfg_clk to clk_divider
>>>   clk: microchip: mpfs: convert periph_clk to clk_gate
>>>
>>>  .../bindings/clock/microchip,mpfs.yaml        |  17 +-
>>>  MAINTAINERS                                   |   1 +
>>>  arch/riscv/boot/dts/microchip/mpfs.dtsi       |   7 +-
>>>  drivers/clk/microchip/Kconfig                 |   1 +
>>>  drivers/clk/microchip/clk-mpfs.c              | 379 +++++++++---------
>>>  drivers/reset/Kconfig                         |   7 +
>>>  drivers/reset/Makefile                        |   2 +-
>>>  drivers/reset/reset-mpfs.c                    | 157 ++++++++
>>>  include/soc/microchip/mpfs.h                  |   8 +
>>>  9 files changed, 386 insertions(+), 193 deletions(-)
>>>  create mode 100644 drivers/reset/reset-mpfs.c
>>>
>>>
>>> base-commit: b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
