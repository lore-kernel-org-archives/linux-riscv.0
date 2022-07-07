Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2ECBC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 19:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQTjpXwyC8re+pvecjaOzW6oXFJ3vN8v8pSzANG7fus=; b=VhphrleVwQHNOW
	K1D1Xz0fNxCnLRrDBArnwUgNGhWUMtVUlaklBhYVlurQ1ODAHPtZZxU1FBgyc+5AL/WydYmL8NhjR
	e4678geKqoRd+43mDAYn6Nhw7l9yooUQ8HWUKMnxSQQ++ogZpeCRYVvqeKQKQ72fBlKATIzuUjjjO
	ZkxmS2FClxPo1tV8cNb281nahLFYG7kfGSA+PYS5cCTN59qQQoAcDSr/SryLVLZPTzyJ/t+kWbOYG
	ZxQMJrB9dXUHDOousfcbBYIcyufzNjkbiM+gO046pB4JCn9MMPpWAKoPRTxKWGACdHSCrAJthpo9S
	/vr/dbD2AXjSwr8k6yaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9X7f-00HYD3-JI; Thu, 07 Jul 2022 19:25:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9X7c-00HYB9-9p
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 19:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657221908; x=1688757908;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0dgxODwxyaQfuzHBDFLgAcvFl1H3kv6fNxfM+5/xsX0=;
  b=DcyTrtiV9E7DouIr9bWBjPyY54cqj1rS7olViec1HC7uTZMp375uOucQ
   91m1C2pqikf/AnGv9b0v64+RWAs/cvgOAwzc5joEUy/9VvGu06LNIuuYv
   CdiUVaVE4Jw6/QACO5frefqdh2e0H+Q6cmAHxQdeEQp4BxRB7sF9x1s6O
   Qura8hE25nlD4Mya/Cwm+5Ure9BxMaTW9TbrjnxJQR1hDi+AelxaPeHtC
   tnpuryx/C6a2o0N/zjKdEeIUyL6M3p6+XDm4v2HC90RWxucyk88vSnARw
   alGhZqFiHZuD+PdrOE/7f0SNZyBARbZsBvT4q2kX6kCCsl9vX5r9JNPI/
   g==;
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; 
   d="scan'208";a="166891501"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Jul 2022 12:25:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 7 Jul 2022 12:25:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 7 Jul 2022 12:25:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmD7WjBRLMwnbWymPmtqJXXSFhcFLqBV7JnuZjL/v2Qo3d/B5kN1yn9hnuQGe1mwbyyz+v0smDu04AS+UFwpYyXMp+hikeCVHG/fUt7TuHED5D6BIDrlZeBWyVYt1K9UuRv6OSqL6Jn7OyHazQotCg7va8fmlx3yM4pIcbx9QwkGbOrYENhm1IT7cdlH9XwsZCfOpVInqx8J5lqyfXf97Am1Z542KTsrs74Pp5mdLJCliyKmn73qcIh3sqRFiDN136Fv34Z+wsdxjuv6vcRS14PHxPTuZns49K6tMhbsHOFonK5Xui2zSHITth9pD1WN2UjAbqLxcgakYG7SmD770g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dgxODwxyaQfuzHBDFLgAcvFl1H3kv6fNxfM+5/xsX0=;
 b=lqKviVi3dVcCmbl3h52Fi1xYWBF9shSWoCFoIhaXgg3RymtWGyN8jar4vS9+7rKMQ+ys3kSFiGjfks6Yx5d+7CtVsUGtDjh3kx9LBMx1bf/7y141RqPCdwLfwwmZg6mx4SoDxiP9qJAiCEpWwW5t4ZxM5M5fYiFXGzKrs+1qYXbL97a6w3ycEJAXThm7Ucm8/DLweYpffOcCTGoZM5FxZhUvUeCw6IC5eHkRbfNMOudY4AFWcpduzMWAU4gOTk6HDN+nPmV0nisX7SHXEsvNEpohh6SlsKdGQXUIrvVR1HNQDWL3oos8iYQN0hXCIc53ihIQAu9BmRqKeUlIerQzyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0dgxODwxyaQfuzHBDFLgAcvFl1H3kv6fNxfM+5/xsX0=;
 b=cy+5jZcnbT9TiyOO89bde8O8evhkyascYZEGF2QlDtNTAqbJ8190LlzCgDIdhMcskj+KcaISkvS2w+M3sNtKbkYd0E4Rh08xjDCYGgcnAWhwLobBqw02lFHboOx8dPYOLYqTzn5QaVrCIbs+Cy2m0v04iniJ5aymkwcZUOTwX24=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB2794.namprd11.prod.outlook.com (2603:10b6:5:c5::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 19:24:52 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 19:24:51 +0000
From: <Conor.Dooley@microchip.com>
To: <kettenis@openbsd.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <kernel@esmil.dk>
CC: <palmer@rivosinc.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] riscv: dts: starfive: correct number of external
 interrupts
Thread-Topic: [PATCH v2] riscv: dts: starfive: correct number of external
 interrupts
Thread-Index: AQHYkjNVXPGYSaRh4Uqt8flC17YMhK1zSg6A
Date: Thu, 7 Jul 2022 19:24:51 +0000
Message-ID: <27617ba6-addf-6f29-e1a8-2cb813dc303a@microchip.com>
References: <20220707185529.19509-1-kettenis@openbsd.org>
In-Reply-To: <20220707185529.19509-1-kettenis@openbsd.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e33fc0d6-b9a2-4348-f432-08da604e5d79
x-ms-traffictypediagnostic: DM6PR11MB2794:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JDT2ODSXhEy8hVa6L8Zjk4+m7X2pxZB1Cuvs4/BG2/FluC/3V4iEEdWdpMjlxyhKv0AR2xeSMjyhbCt5pskyvZG+dVrnrL1gIhQoSWy/kihHBQKZ1iP6WxEDQ0bpfDQcLphSnNnGOxtjZr+dRrQMFi9p5oJZtYlSAARiNhndkgXVvu99w6J2h8prjUzGfUT8OZTRbP59ObigbQcQejxtFCv2waT0vhgtEmPaKdJZgVkuAzh2YtOxjIJhA0GeSTS3LY3gP1nBrP3LXPnSiFGiVgQ6uZXZbaW8haRGGbM+WKasItLz3zV8YN80oaxfQGNkn86oDuY++CuAxMuVF+IqX148yJrT1i9/zE06Xtcg9qSyLJIcTWRarkBsDtZl0ZV9SwOC31Kaus3bZniUxdZdL0MlVFTqr1xAWs7FFAQAWrAah/YLS5RE8khe4vliwktZ/bpFp0Tl9tsGFvxV5OS6Ht5FShXxeuupxBXc74Bo7j5fIeK+ZQLcerKruqCNB4sL483/P4y+JyMiVY3JGEiz7cEaxQLR5e8FhETBFBvFhqZsQVdBwSpA7WsvuugFToL4jTu0ypBvihc1R2tX8CdxqMtmos9vDo06OPrsgsOXxN7BevZOyBqUSmZN222qbF+NTvI/ec9VwLTJPd3OCAzrP0eL4BPKjLhpSBm8ISSAawfhiFGfGOzk33IltNDxC5LdHgaKhGO42J4wusirYu+asLzoG9nrz2kD9KMhu0FdyER/lpewtH9Hpl2dlLGgiKLo7fZJrwGjq2BERZlaCR7/MuJcYtSXkxPFCExVWKRNJzRmCrlIc8aYTN/cUff13R4VDd8Yk4YVzAiPHwn6Gwd4ae2CVCtA1N/ShV6O8Izrt3zMoVqSm2W1j9T+nFE2Rv2tet/VimmcZ4aCYu7XYeU9g3v1L/CCV2rg01jbD7dYQHc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(366004)(39860400002)(136003)(376002)(316002)(26005)(54906003)(83380400001)(110136005)(122000001)(36756003)(31686004)(186003)(6512007)(66476007)(86362001)(2616005)(5660300002)(66446008)(7416002)(8676002)(6506007)(2906002)(4326008)(91956017)(76116006)(38070700005)(64756008)(66946007)(38100700002)(66556008)(71200400001)(478600001)(41300700001)(6486002)(966005)(53546011)(31696002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnRXb2hhNFFjNUlsYXNZRi90a0NzMEcyU284VjJYS3Q0UDhveGl4NDg2QWFK?=
 =?utf-8?B?VDJWcEZzN0IwdWY3T2RYOVAwM3pQZTI5ZlRvdGFoc1Q1NWE1MU14OFA1anFj?=
 =?utf-8?B?UTdMbm9LeFlTSzhJall4T2pFWmZoc1NoT21uVXdDUE1yL1JkSWJRSElyakRz?=
 =?utf-8?B?ZDZIVHdGNGJhZTBqZHl6ckk0ako0cUFLaXpsZk5nWTBNNlZnYm0rMHlzYk1i?=
 =?utf-8?B?SVNsNVBaR3BNMlFtZk1qOEFaaTVOTm50UkF2a2tWQU1MdjhjOEFvS2ovRTBX?=
 =?utf-8?B?dXp3ZmR5WUJjZFYzMXFKdmd2VW5EQk5pcWo1RFhkNU03bE12aHlIQ3ZmZG9G?=
 =?utf-8?B?cXhQTlNyYy9Od0ZOTTRjUDc4SUE3TzkzRlBNT25vbnYzc0tUdXR1TFMwckZS?=
 =?utf-8?B?V3UyNnFnM2Q4M0p4OWJSbFdVQTlLNWd6V1k0N0pwbUNyZzYzUWdMS0RBTjMx?=
 =?utf-8?B?WDVRN0VqbmJhb0luNnFjN25kUzY3U2psZGpWYVFqY2tLY0F4d1pIejA1Qnls?=
 =?utf-8?B?RU4xZTF5dnI2TnpkWENZdXFvZWh2OHVGMFFLaWpNcmJGRld2WWhDdDRiSXBh?=
 =?utf-8?B?SnIzWGprVEtlWTBXakpNNDZqKy9aQTlBV1J5THhMc2FsbXRzZ21kWFp1bEMv?=
 =?utf-8?B?N3ViVURaWlZGdlVLME1nbnhvOHdMaTdnVEU1dm1yQnY2RGhuQVgwY2ViODJV?=
 =?utf-8?B?TkJMbXYwdFJkM3Vucks2QmM1eUwyYzlXTXREdHBDdlZUSHZPMjFJeHRrSG41?=
 =?utf-8?B?SmNpWDBHR29JOVNhRHRpNnVXdkxqTU1vZWxJaWhSQ1NQeWhvaHBRYVNSUFFi?=
 =?utf-8?B?UnlHSmVvc2FkQVp0RlR6ZmdQU01VNm43UXhTUkhxUzBla1hQSkFEYjlqbXZ1?=
 =?utf-8?B?VDJoWHFtNC8yVVplSlFhcW9IbFVlZEZkd21xZXIvejJMdTh2L1l6YWx5aDA3?=
 =?utf-8?B?aUx5ZmozdDFOdkZ4M081QVJPSlhWSkI1WWZZeTN6dzVXY09wVUZaQVptV0pH?=
 =?utf-8?B?OE50Qy8rNDcxNlp3dVZKUkc4OTBndEg4MCtMWU5WWXF0bk9uTHJLZkRrdGFp?=
 =?utf-8?B?TlhjMHErRktyUTlwT3FUdk1PMHdpQVFvdWtNOWgrd052aDVuNXVxcjdGbjEz?=
 =?utf-8?B?aXJRMWY2NVJiOWZQNzBkT21iUlJoTElGQ0tlV3U4VW1zNFh6cWdmMzUyRzVG?=
 =?utf-8?B?ZnpESUxZR0M4bndwRitmUHlQWXdrT2ZWOUJ0aE5kZ1dXU2pkQjZVdlYralFt?=
 =?utf-8?B?WkJvcEhKbTFRSXg3aGs2ODl2cjcrM2tLVGhhS2hSVGlUMnZvYXpXdFd5V3NJ?=
 =?utf-8?B?b3lDSXJId0JJNUs4OGxNSjI5dGgzMkVyYTJoOSt3MVc2cEpiVDg2MU1KQVJj?=
 =?utf-8?B?SG8zcTRibkpjNk5NeDNSRllHWHJjcm42dkpETkZPc2dBbytwM0VqcURLeW1j?=
 =?utf-8?B?SllWRTNZb2hpV08zcWdtb2l1cU0rb0I3MnVqTEhzSHppS2ZkNWZyRUx4Y1Nx?=
 =?utf-8?B?alpNK1VIdnpRcjIzLzhFWmhWaUFaS0M0TTJWcUNIY21IeTR0aDNlQzJDaGVL?=
 =?utf-8?B?dG1PL2Z2SUdHdDdJQlh6WVlMeW1WUW5lQlJHdEZtZmdxKzNiZjBMbWVRdHlH?=
 =?utf-8?B?ZlB0TXJaL1ZkSGNtOHBBa2VDVXN0NGpQaTJKeFY3M2N5aHhLTytEYUozYUU0?=
 =?utf-8?B?THVEazNpZ2dXaHQ3US9iSSs4RzI2c1ZyK2EvNUNQcGxlMWtidnp4clhLNlcw?=
 =?utf-8?B?RU9JREJnS25FTVJ2blVqZGJNRHp0MHcrODI0bUFvNm5MWDR0NmhYaDBKb01w?=
 =?utf-8?B?NmNQWjUrQUlnemJlUmJ4OVBidDFwQjlWMDhyc3lzaGc1TFVmOC9NZ1NzSkw5?=
 =?utf-8?B?SFlRZ3dnMEdrT2R0L09VR1J2ZFFJeTd4NUg3ZjNITldQTC9UdlBscUU2RXVx?=
 =?utf-8?B?bkswU3lza3hBbklPZEY4Y2JpK0plODcvbCtrbXlndVIwUmtzTTZ2K1Njd1dw?=
 =?utf-8?B?Sm9YTjQwQklXVzhEMjBaUUhXUjVjeWV1M3FsNmlhN0hhdXRqYWY4VTU4QlVz?=
 =?utf-8?B?RjQwRDc5L1VrQ3hacWlnYTBsOHNSZVNVcllNblVSbzhkTm0wL0tDTkxMSm5o?=
 =?utf-8?B?U21wR2dzcjF5NCtzR3FITXFUOXVyT1B3VkNnMTJuaU1XNGFMZW82bk9ZWFZ3?=
 =?utf-8?B?dlE9PQ==?=
Content-ID: <B21DC5700E8ACB439618C4E5D5163E10@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e33fc0d6-b9a2-4348-f432-08da604e5d79
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 19:24:51.8023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hy1fjpGmL8Nr2gGJVfLVsnGV4Kq2d7+7XDQAiCLJEU3coXeE320rkRvOmYurHqomUgyDr99F/RGbHi9QTw+jcQCn3qvoZtFXd6uav2jnBec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2794
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_122508_451170_998FE58B 
X-CRM114-Status: GOOD (  19.95  )
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

On 07/07/2022 19:55, Mark Kettenis wrote:
> The PLIC integrated on the Vic_U7_Core integrated on the StarFive
> JH7100 SoC actually supports 133 external interrupts.  127 of these
> are exposed to the outside world; the remainder are used by other
> devices that are part of the core-complex such as the L2 cache
> controller.  But all 133 interrupts are external interrupts as far
> as the PLIC is concerned.  Fix the property so that the driver can
> manage these additional interrupts, which is important since the
> interrupts for the L2 cache controller are enabled by default.

The missing 4 for the l2cache controller certainly make sense &
the documentation does mention there being interrupts as far up
as 131 in Table 28.
Table 33 disagrees and has an interrupt 133.
God knows what those two are used for, but the documentation
certainly makes it look like they do exist.

Link: https://github.com/starfive-tech/JH7100_Docs/blob/main/vic_u7_manual_with_creativecommons.pdf # Page 44 & 45
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> 
> Fixes: ec85362fb121 ("RISC-V: Add initial StarFive JH7100 device tree")
> Signed-off-by: Mark Kettenis <kettenis@openbsd.org>
> ---
> 
> ChangeLog:
> 
> v2: - Fix commit message
> 
> 
>  arch/riscv/boot/dts/starfive/jh7100.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> index 69f22f9aad9d..f48e232a72a7 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -118,7 +118,7 @@ plic: interrupt-controller@c000000 {
>  			interrupt-controller;
>  			#address-cells = <0>;
>  			#interrupt-cells = <1>;
> -			riscv,ndev = <127>;
> +			riscv,ndev = <133>;
>  		};
>  
>  		clkgen: clock-controller@11800000 {
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
