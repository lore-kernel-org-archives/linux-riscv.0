Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E7EC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 15:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EZdx7YgjWG0TPS+zf9Q+U6u6pl3iiIK0sbKAP34R6S8=; b=LzjPWMN8TEG8H9
	/sKMBC0IpPoHoxH5NdS90oTE+tYHLG7AhNghXxgM0LpQjTlKFLdfkOlLsKB86m33dAqWwpKkMwUFA
	4u2i0W6eRLzkZ+PWu3qPC9WXLFTrTzorPxxo2Fq9bt2kA9XjGiiBQptEok29Aj45LYYNXFrAdlJ6V
	omXE2qXOfOBq02QECqb0iMW5ZFFAGbZN9wUdQCXi91/2wujVMjSEGnGO6/e7QogRro+OJOy0jdmyV
	ItjVI73OoPN3X8AZBhAly6peaRXE9vEgHzX3/zg7JnozfQiAREXwZd/Rbj2iqSJA80vtfF/0KitM5
	OPF8pFY2i8pECMRsrOkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC18P-00FwF2-50; Thu, 14 Jul 2022 15:52:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC18L-00FwCe-8G
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 15:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657813930; x=1689349930;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=ENEDPanqvOCW6fz4kacwKu+wpVtvQgsC9tq13tybjK8=;
  b=py15oVI5mTsf7/BFyFUWIR3gNa84bLYu+2fne6/O26uP92AXtV3p46DI
   F/O00wLS3/CvFEZ464TyvKKFT9UyU5aJCn6Cmlu5VHNzbCZZYqraS44X3
   W2gpdIbdi1MnpPBMAjHR/UOIvfUiIR4mGcJtMY9ys0ZNTq2q9h+8XZi1c
   OHaAgBxW8c0jIfz8pBdriCSKcsWCN4puxQHiNycVR+BM8gKL9Hb08FSXC
   2BYWBG6Sb/tACuh4k4xxJgZKjFzoTQuuSWWGamwc7Zm0RWOBo/F74y2KO
   ZbpL5KdWWDXUn4qjv2pXhLLsUwDVlvYMPowvGjkBWKlDxmE3Q8bTMnDiu
   w==;
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; 
   d="scan'208";a="164763386"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jul 2022 08:52:08 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 14 Jul 2022 08:52:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 14 Jul 2022 08:52:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhcQM3xue3iyqC9x4KZnt+kESKqJ/NehIs0iWoREf0Du8wLhGvL5U7QqIg4C0ej079pgaChOgMOr/LpHIVEI/R5WSE+skl3t7vlr3FL9azu+GGniPfH/zp1CPSLLp3QlwZwecOhZMi3IUlk6Nxv+skPPvGGDzEDe5TxzVuQpi+dZYv6dGWDEwrhbbeJyVmNEcByOMfMqYGEuJZktq3WFFnkn19PnmOtpU1NM0MQHa3OJr9ThjYhL7EnxqbgwzTGOMJGINfAt5yQe38HNZ1yBgiBQt7ZbkFNU5+3G8oXuy0ZScl+Xs4lzaf7vpQx0JMfwLDLgM2HC6wkx8p9j9rPF7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENEDPanqvOCW6fz4kacwKu+wpVtvQgsC9tq13tybjK8=;
 b=OWAeWWtvxXqWzw2s7zJ0kBDYJuqAT/SW0gYSrwy7AQ61tTLAPMvhJUVbiGeubzjhFS/f879uskifgm0o8KUbbyLMHmtvbZ4YZLigoJkIpeh60yMTX4rh32WBtRF+bYqrATZbJh51E5i1DhliflLBFTR475JewSKGd9wNg/XP0mOpUcYL28fuDXwNcIMf9YpTQ8B+uDgHvTOhxrySd1FRXtoG/2Qi7E9ly46DANVVfaeg4OYWhHS9Ed22w0XMZ8p8duHQwtNAFoYjuEn8le6EcCcUoeQtV/t8LZ99pBJi3bNC0o6A8OXs6LnkvGtamc02F+hAYKzyZ+tWRE3bvST1MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENEDPanqvOCW6fz4kacwKu+wpVtvQgsC9tq13tybjK8=;
 b=Cq0MRqhO8rGoZ+UBEIfTTlul5FeB3gNkUYHErJv2A03MDhylkxN94wG2HbfQ60yRBCD+kBr7kobs7qNFeqnRUSpegYTDnYdEbmxFAGQrEaykWTrTv9XCR9eFloG6dWMqptNt/8PWFxslWRV0nl+LWHMiUv3h2BX3uam/nMtCwcs=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB1697.namprd11.prod.outlook.com (2603:10b6:404:41::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 15:52:00 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 15:52:00 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>
Subject: [GIT PULL] Microchip RISC-V devicetrees for 5.20
Thread-Topic: [GIT PULL] Microchip RISC-V devicetrees for 5.20
Thread-Index: AQHYl5mnv5DTllMwykGF4lOjs8iv6Q==
Date: Thu, 14 Jul 2022 15:52:00 +0000
Message-ID: <3385229d-5522-82c6-6fb8-79ab8290af96@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0b42e58-607e-4081-be36-08da65b0ca33
x-ms-traffictypediagnostic: BN6PR11MB1697:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gkrEe4O8hI2AX0zdSglvO2M3GQS71+E1vgjcIz5NwKclzheOD5jfo32IYSySEbbCzY823Pk/C4NhKuoiZYQiaYiYjgjo0824LVHyTC27I8GiSPyYG80I8o8/REZypKx1sIybejhYd21UpIApjKehOcACcxrlgJQG1hrV1LG86gHcGchfjjR26ZpkOn0fb+/vL0QTod838dy9VeyvyQGDF3Q0NXZKlDiCS7XK/YUtKrgLug5Lks22NJLVzOKx9y5cpd7m1UZvVCAVRKzdCFiydReWDpkMrAgJadFmhUT3Lhwxy23bhmQLz9b5P52XxaAuCuUauh+f1yRnz3QIdcqYRJpwrzRXrHfcwuZJeRPNZ0JCSiHQTNnt5a9Mq3CUWwhd83tukvQhjTsLo6YaAcPQRnC4exVzAoEemWanbejf8Vg9Gq9G/eEuHGgBz5fbNBOu9DQ5b8z2PqCj86XC3wovBI3n8IQDSkf019u4INZVwkKqqRK7bDf2fYDC+77hDUvkT/HHuv6n0IJ08Y10nteBxE0j/GbNwIVwphl1gIinkqyoM4x3xtrhlPMTCtQwAUHPFvk5iIAnx32wFU28rBKSuQH8KrTRQ/IukOHkuxubyVQKDMB6Q9oWnRJ5ytNxH5AtY/TPQxV9yvaPDuCoXn5W54G/xSbvKhazOg3wTkpd7crvq5FaPUhEeexLIjBROitkTKJctuH6mdb4jQMZWOA0MzhNLUygsTFDMCWAgZl5dplFUN3GPgwoTuZGsBAhrHeFdNxuoWX5Q6mlnGrkFOW0+M2Uk7RQbSl3FdCnluDcl82BlfLMZliNHrxpIMJZxJbAnNCIxKQxVVIsQpcswuIFyiqvd5J01NaOzioTW6myOk2Q8r8852wgKO3omegNDkQw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(39860400002)(376002)(366004)(136003)(66446008)(64756008)(66476007)(66556008)(5660300002)(8676002)(4326008)(31686004)(26005)(91956017)(186003)(6512007)(36756003)(38100700002)(38070700005)(2906002)(8936002)(2616005)(6916009)(31696002)(86362001)(316002)(83380400001)(76116006)(71200400001)(66946007)(41300700001)(122000001)(478600001)(6486002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWZmN3VZbVRJN21lVW5EVjNRK3c3V2xETDFGTm9vSGpRM1lhYUx1TEFFaTU1?=
 =?utf-8?B?cTVQVncxcGwzMkJPUERWdGRtVDJ5Y0xnR2JlT0Y5OTFYbExIYmxyMC82ZGt1?=
 =?utf-8?B?VFZxVmdSUUhZMkxRRm1PaUpDSUFKZjEvcVFaRWhVc3N6UVUvQThaZEdLL2JM?=
 =?utf-8?B?UHRpQ0QzZ0NwMFJFeXI3andtbW4vVng5UWcweVBLcnQ5Wkh3QWpnOEpGUHR0?=
 =?utf-8?B?OFY5UnROeUJQRjlNMUhTYjMvRGtiSVlZZDlWRHFKRXg3R0hYbHNuY1IvZXg1?=
 =?utf-8?B?R3NmKzVETmJoakZRWVV4ZUVEOHEyRzZydXA5VC85elBtMm5KMUtpRS93aXJm?=
 =?utf-8?B?TEZQK0IxVlhhWkpQK1FVY3VxNzFYVUlMRXBodzd4TlBodmZSNEk4TEY5TEh2?=
 =?utf-8?B?Ynlna0lyNVlVcTZhVWV5RVpUU1h1d2hDY1VVbFBlRjRoUVErOE1rVnRodzdM?=
 =?utf-8?B?Qk5iOG1za2VQZnhiTGtiVW5LdFRFcTYreDVvL0xhZG5BQVJwTXZYbEJVMDM1?=
 =?utf-8?B?RmJXMENjcDFJcU5yTmFaVzVnZHpobFhKM1dwNHBjUWovbU9KYUlKUkNuSXR4?=
 =?utf-8?B?NkxJeWk3NU1TK3V2b21KS0NzNS9NM2dEcVZrUCtkMFlvNUZraVNzUE1kS2d4?=
 =?utf-8?B?cUEvUGtvcVhGWWJ0d0JzbEFsYk9sUGRqYkp6NEhmdzZuaHZLb3BGSitSTGRz?=
 =?utf-8?B?ZU5mWFNXRk8xVFNpSE5GOXJlOUZhVlZGY1FsSlN1VTBoWTh0L1pLeEJmSjJw?=
 =?utf-8?B?RXFuVlVMa2pQdmEyTDJQbDlJK3QxUlF6Ly8rcDVvWlZ1aDd4MjlPYmVmdlZq?=
 =?utf-8?B?L0tKMzFkd1lKeW5PNjhMcnJsbjFpNVhkYUJRcU56VENlbDR3NjVXYndwclh1?=
 =?utf-8?B?cXRVRFZzUEFIYWZEMXdXVDhzYllIVGEvc1pyTmFCTFQ2aEdoQmhvTEFBZEdY?=
 =?utf-8?B?WXRYN2g3Vk1hc3BPaUVNNlZibzlMbHF0N2JVTHpMcWtRenVVR1hINk0vUFpX?=
 =?utf-8?B?RG1xbExvSVBDL3BNTzcvdzJkVGpmTS9mMEh0OStTYWU2Ykk1ZnBlQVF6b1I3?=
 =?utf-8?B?RFVHN3VWZTg1ajcyYURTZ1ZIbC9rWDMwMDRmM01adGVCRUZOMzFqV29IR1o2?=
 =?utf-8?B?Q2pzd1FUM3NYc3FzMTJ6U0RVTTZHMytjUlRHTC9SeEJVRmFHU2tHbDlVMmlk?=
 =?utf-8?B?WkxReXN3aFNXSnRpZlpQVndpT3NjR3lTaHRmamdXdWJic3E5RHR5MWJxcWRM?=
 =?utf-8?B?allyTU9OT29kbmVSWHZMMlYwMTFaMHdYeTVBRWNvUDZCQnhpaXdIWDNUVG5T?=
 =?utf-8?B?MXluKy9tQXNnTm10YllreDBUbG5TOGt3NThFMjlNTG5nZnVRb0hwVC9aWkJa?=
 =?utf-8?B?T0VSM3JJOW9WQmFsUVAxaW1zTHFSUEJ1QnVnd2JhdUo1ZW9uR3FmakdZZGZi?=
 =?utf-8?B?Rk84THcxQWNRT094OVpHeTc0KzRYTjl2U3Mwbmx4dnBtQnNRY21zSTQ0eUdN?=
 =?utf-8?B?N2k0YytYYmFuT0JDRndFMHJPRnBldDI3ZVRaWXRFdHF1cHRjTXZZRnNTd3Rp?=
 =?utf-8?B?Zm1KMGU1TXcyQ05pRWI4TExDMnkySmxENW5qTFY1TTJvWGJtejQ0Q21Ub1JZ?=
 =?utf-8?B?OGhmOVMwbUNMaDhoQndBNlhIazhrUno2SkVNajh2TVpxNTRWS3lrekU4S0dO?=
 =?utf-8?B?RXR5dDhUUkhOV0V2V1RlNmVia3RpSXlYQkpyTCswMmlaVytQbWt0ZlRXWlJz?=
 =?utf-8?B?MmhIYysyd1diSlpUVGtDL2NrVFQ1SG1MOXBxYjV1RzEvaU9jdm16S0JWMDNI?=
 =?utf-8?B?VWtkYytJcndTTlBtTDRpRFlBZjlrcndWVEFvZFVJaC9saGJ3YVRJRHhTZGdw?=
 =?utf-8?B?STFmNWJ3T1JXVitQQVFiQU9ZVzRWdGFpdEZJV1poS21tSDJvdXRWbEN2UWNh?=
 =?utf-8?B?NHgxQUcwSUlzUERYZmZnYVlwMWlCc1N2bVpIK1pob29FUDI3MWlHdm9uUjg3?=
 =?utf-8?B?Rk9jRWJLWU9LZ09TaW01eTVEdzJUZnJhUmxJLzk1WS91WHpISFQ3N3RmWFc2?=
 =?utf-8?B?T2s3bGo5YjJwaVVHWjEydkJOUE9lSWFJR1JkVlNFTTY5eGJRVTNNYWt1Wmor?=
 =?utf-8?B?YkJ4b2dYQWhFeEdzbzFBUDVkSVNCazhZM3BIeFdBQ1FkYS9adGZtYXRxTVZT?=
 =?utf-8?B?Q3c9PQ==?=
Content-ID: <FCE6D12C8CBE344BBB13249D161BE9FC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b42e58-607e-4081-be36-08da65b0ca33
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 15:52:00.6915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FDstDDtZcso2wtpud42Og1eFrQyUfqBFB0j+OjaBN6lvGAW62ARrB1yTG+tkFQ0/ie0/drjVU4c5S+vZAe2u1m3/bDYeVEUoo43vcX6BMR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1697
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_085209_403621_F66BF946 
X-CRM114-Status: UNSURE (   9.21  )
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

Hey Palmer,

Merged one PR only to get another one..
Small again, but I am expecting there to be a bit more for v5.21,
as I'd like to get some things out of our vendor tree.

Thanks,
Conor.

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git tags/dt-for-palmer-v5.20-mw0

for you to fetch changes up to 88d319c6abaeb37f0e2323275eaf57a8388e0265:

  riscv: dts: microchip: Add mpfs' topology information (2022-07-07 23:15:39 +0100)

----------------------------------------------------------------
Microchip RISC-V devicetrees for 5.20

A pair of changes for mpfs.dtsi:
- A pair of patches from Suresh & I, removing the bogus max frequency
  properties from the controller nodes for {q,}spi. This is a device
  only property with no meaning for a controller and should never have
  been there.
- RISC-V has no sensible defaults for cpu topology, so I added a this
  information to the dt for MPFS as a cpu-map. This is an optional
  property and therefore is not a fix.

----------------------------------------------------------------
Conor Dooley (2):
      riscv: dts: microchip: remove spi-max-frequency property
      riscv: dts: microchip: Add mpfs' topology information

Nagasuresh Relli (1):
      riscv: dts: microchip: remove spi-max-frequency property

 arch/riscv/boot/dts/microchip/mpfs.dtsi | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
