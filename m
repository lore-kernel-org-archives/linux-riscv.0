Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDF6C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 10:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DcuZEmw+znK2JmjFHaRRGjgefXSJeF7q4Sppz5jowEU=; b=w2iM6CCMenV8Rf
	n8IpGEooaYkqzeEWm0jBuby/3zaU+yil5sDzRctqkidBLJkP9wlUMDUjTueXRWNNBn8Se1YgcECZu
	y6pPsJlBJbnplTVp5PSOVTDhX1Gjz0H0nv1LcMJIIsKSRPAXW3472P2o9spXM69yF1zyuD9N3odTG
	tFhT8xFA2FhaUhxZ5KRDeXmoT13SkYBMSdOb9rAGXD8fIIC+9K8yYf7jkJQN1+0jfkThmB3sGZsDM
	hNqU9F077yHNnsUCWPB2zCb0eZuledPM3Okn3rDRN1ymcj15y2vzF9T39w/PIhjjIPE2df+zKmw2+
	L1EpZjsRgCUjJkdO92lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAqb3-000dsC-KA; Mon, 11 Jul 2022 10:24:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAqaz-000dpq-LD; Mon, 11 Jul 2022 10:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657535093; x=1689071093;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RloprTTXVAaRvjv+bbx4CzBYrdBDzXeOGhc4mt+Y5lo=;
  b=hFK543LVQufBmfABAdfjhFEFoGuTrhn1nviNZYjW7CSjbEGLtQ1cH4eF
   YJ8Khlujly+wcTch1VVHeYmc2jjOnl2ik8/jMNgufL3fDzoXLz5OyaUlE
   yiNbQIV6L/aaTeO6KtKVaI9AshpqSBaSPToOWst6UIDEcSdxyUcYVHJdR
   WIeGlx7XRXjJxIhtrNAFFNOAr24kTaqn+rdvu/oItYruRmlBc2QJLp3y9
   +dVIm/n+TlNaPsJrf+aDOI8IhOkP/VoGHZ3NvRV2i72wfrDafgH8q9ekI
   eL0Q5U6WFoSu3DfNmukV7MHfM8ciKMvVEoz4IdETYre1nroSykM2Xu3+I
   w==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; 
   d="scan'208";a="171852485"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jul 2022 03:24:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Jul 2022 03:24:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 11 Jul 2022 03:24:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFrqi2ValJQ0IXvXSiID8dknrOESzNqK2wt9yKjwGR042YZm7orgNRoI5+Q2Jhby9oo2psLBYLt1qe0MPZB9+qcDk3z0jIY0zTMbP6PCCGv2gEvceqKoYfNCIod9VA1J/T6QdTY4SfPVYONH0epcFeG1PM8x/doDmQFa98CtQlgy7Gdrlip1fnoh31lyldVpqpDMgXzye648NX9/qBvdo2aWih5FkyFdQrcntVEnvyOvsZfUJu1Kj1X9L/1UGrpsfTrVY03xoQqurFmh+s+DxN7LFUc/QOU4eKFJ0sQwM4X57fVnIdRKaA3QLLIQPS8zqKY14ulPGoKOJ3LHfad5eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RloprTTXVAaRvjv+bbx4CzBYrdBDzXeOGhc4mt+Y5lo=;
 b=cet0UmCQoLfS+FHBpJeA3waABRIiefNv+aILSeEIK6xdK8etxZyXJWrVVxgFhbGF6zgAq2toVMNffRjd120Amsp1U/ijiIpvVZ83xxkfIwj/qwUGyQUCMtPcbZ/d+Gj4FoMzHoWhEWjWx6G5Zn4SnkGvi6OSJH8VzsYCu+Khk+Uq8LIEjNZk1FBOfjeVIOzD5gpqtI/X/ogfq+nfQiBXJ/w8Muvo0xhwpjOiu+KPn4YYT6XbFhSw3WJ61b6h/fHoB4HVgdU+IBZFBV7iN4wTJGADWBfU9wZbYbl+l5qNwJVwwB/wltq4zzdJRQsVmspNXACloEmLIFVE/ujJQeuGaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RloprTTXVAaRvjv+bbx4CzBYrdBDzXeOGhc4mt+Y5lo=;
 b=pmjzGOKUnwxZK7ka5kruwWasBERki/0LYXz1bJ7NUCvp/kw+LtGTUnfTPHFOelrjtgkawnhFh0Xukr+gveoOA2PQTHCAYZ7Mjvd3u+QDE/nFG/O1RggU9CYvGMhERjR1up+RILhpAz3Uw7a2tSVLFEckI4T18didoY7kro7ZBec=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR11MB0037.namprd11.prod.outlook.com (2603:10b6:910:77::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 10:24:39 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 10:24:38 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <Conor.Dooley@microchip.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <palmer@rivosinc.com>,
	<aou@eecs.berkeley.edu>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<gregkh@linuxfoundation.org>, <rafael@kernel.org>, <linux@armlinux.org.uk>,
	<arnd@arndb.de>, <Daire.McNamara@microchip.com>, <niklas.cassel@wdc.com>,
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
Thread-Index: AQHYkwoSKn1B1/DCVEW+Ox2TaLu0fa108T4AgAEP+oCAAvM+AIAABlmA
Date: Mon, 11 Jul 2022 10:24:38 +0000
Message-ID: <24e3d8a0-c998-4a68-af28-57dcf15682ee@microchip.com>
References: <20220708203342.256459-1-mail@conchuod.ie>
 <20220708203342.256459-2-mail@conchuod.ie>
 <fb8534d9-baaa-2643-5119-602dfa5de758@microchip.com>
 <efa89122-b428-7691-49d3-f5867206f05a@microchip.com>
 <20220711100204.bj3r3g6xs577kuul@bogus>
In-Reply-To: <20220711100204.bj3r3g6xs577kuul@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 181eb554-d0a4-4b39-7d25-08da63278f67
x-ms-traffictypediagnostic: CY4PR11MB0037:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SgXE6i5Fotws1U6OgaG9G3PG4RXDZdzkZDM+0/UcIoOVf9v7BAw5ZsHCWmD6gKAYbVwWqmr6EN8g4wWNhxXd6Qzb9FRChCkN22pUlT1GKLBHoKI4HuGiY10CK0qkCgtRlZxT8v+qPiv4ZAdgdGjtXwn8R/m8Lh/GcrIoqQ8O7L5R8ANYQrfZm8zvclUbSkc1GnEWmGCc6KtUp9uOoT6Ev061QrxlHB9cBq/BMGbkYvIY9orwg+mjq8caMUaZmOLwoJJvzVeoCXtW3XgXSe6QzypcDRBrjRMbgUFkL2VCJWpl/VMtM/j0EL7Ke6OazWmpNpvPZd18ULap+2EoimrTzgtM9YXQiXVtH6B6IBDSImi0xNzIL8PDAugFcK1ofPGrZCVsZI8xp4cBsgrSBOfN1yR/N9jg3Afi51Bdnpe8XlbO0DLuGWAg8EL826/pCvLOJq8PEh2gJABoCpMGVgdjv4+MgjHQmmTdpzzH6usGqyg2zeSm5MuKe/cy0/YTpupZjpVQgxPFzC+jes6632nvq1YdI8tXtxz9kmcId2IJgBA0M0cmu6nznAVNbw8v4j6uC9fgeCQ1g6rObM2XjpKo5uKDDjOPahli6Nq8AHiKEeCJSnYXrDbGeA0glc+MH5w6RqwtWwbfh469XrByVv01C7bFoT/ZT0xGapaboUOqU7UCwp12qX0bbg+yrtbtR18fCIiHK5phXRR8ZQy8ChNuFe0Wjx0yBjzyYBnvUzPREbQyvLQoFKLyKTt7rFMiX4beekzsZE/ev5Xe+TxSn5/mcqNHBoyfinRF7QxNfYhh84Vjmb0HtGQW4H4qm4JYKgMAOFiIQ5ZsuF1DLtsaa4rydTKxVhRdYvBe6yN8zNPEeLNJqJ27RL7rJUDufQhQOHIQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(376002)(136003)(366004)(346002)(83380400001)(86362001)(110136005)(76116006)(66556008)(66946007)(4326008)(8676002)(66446008)(66476007)(91956017)(64756008)(31696002)(54906003)(5660300002)(38100700002)(316002)(38070700005)(8936002)(41300700001)(36756003)(186003)(2616005)(26005)(71200400001)(6512007)(31686004)(7416002)(6486002)(2906002)(478600001)(122000001)(53546011)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TThDZ1FQNE84aHhOb2Q4Rm9qVDlIZ2tmSnh0SjE4MU5PUnorSTlxekxpQ21q?=
 =?utf-8?B?M2w1cFN0QXFrZEFXdzVOdDEzYmZGcVlTVWJHaDZYdmY1dkJSUjY3MlhUbHNX?=
 =?utf-8?B?a3I1cVZ0ZWpTck1oYXFMZUpFSWJCWEJLWStIT2NkRDZscmNVL2NiZ3RxVGhS?=
 =?utf-8?B?ZUw3VktzMEZWeDE5RjUydy9lYTJNN1FwRy96a0dEdFpNZzRScitMQlJRRFRV?=
 =?utf-8?B?UWxhSWJ5bE5YWktxdXpoTkJtY2dvaXFuQzdpSUt5VkwzWFB6cWF2V2gzZmp1?=
 =?utf-8?B?QXJteFIrZWliaCtEcVcySWdWMzJWYWRCQStRLy9yRnpkZHpkOHEzY0pQa3ZN?=
 =?utf-8?B?bE54aFZLUCtUL2RsNVdlcTdweFZHaVkrSndIT3kvQTM5OWNkNi9PcXYvSWxw?=
 =?utf-8?B?c1NEeUFhVFNaUkRlYkVvMFkzYzRLQ2twdERrOEFhUmQyZU1Td2pXSjJsa1FN?=
 =?utf-8?B?WTNHYVdGNDFUM1dyN0hlY0UyZGUvYUpUUDFtZktrTlkzNU8xL05ZU2NvMlZa?=
 =?utf-8?B?bEFUYmpUYithZGE2RjNyZXpBVUZYaHNzOWdBdGhKSkpIWVBCeTNqa1FseEtF?=
 =?utf-8?B?bC9CWkxiVTNKTmozdlBRWUJuYjRzR0JuM1NiRWI2VFFMc2xCRnprYjA0SEln?=
 =?utf-8?B?a1FjODZkQ2pqaXRyWWFsMVNqaDc0VUs0TzFaYTlOaTQvTkZodUtlLzI4RExm?=
 =?utf-8?B?REhSTHBTVWFpalBtOFQzTkk1NDNXOXk4TGN6Wkl3Rjg4d0kybXFkWHRtYU1S?=
 =?utf-8?B?S3VGZW9MU1FIa1gyVzYralUxSzJtS1AvcnlOWlA0dTdHNGpHUFc0SitxVjJt?=
 =?utf-8?B?b3pPMVA5TStod01PbjZvN2MwZ1dudGRnWjByY3RGcGtsemVudTlUNDJIZWhF?=
 =?utf-8?B?cmNLNjdDN3hmV1lUYkNIR25WZE5OMnRQMjFYSXdPSzF3QzB1Zm5EbWFsK0JO?=
 =?utf-8?B?SmhyY2lzNGRjOWdRak5tY1RUYnRCOXZST1JjQUlBbmtwUitMVEFEdDRNc2V5?=
 =?utf-8?B?dkRySnY1OUpEb1B4VC9jaWc5RjlXMy9DQjg2V25ZQnVsSFZaWWtBNm95alJ2?=
 =?utf-8?B?VUQ3QXQ0ckdpQllEeE5IclpnQlFCTjRqRlJXQkZlZllCTlFPSWxnV3BseC8w?=
 =?utf-8?B?WU5IQ1NScnRpK3hUaGx1ZzZLa2ZkL09KRXNrMlRZQmY4eDBPRit2SkVTZSsv?=
 =?utf-8?B?SnZ3RW8wY2pyNzl5eWtHRUxyalkyL01kVU5MemtWaHFFeWVVR1kxakpNRmtT?=
 =?utf-8?B?SXB4TXRoTEViNmk4SmFzbm5sQkxibk9kT01HdFg0c0syN1d2eUlxUXNiSVZa?=
 =?utf-8?B?cksrSUd5RTF1YWNDK0RZRXhlNjdiUlEwNmppdUZhaTVSRWh4aXlvZGduWldO?=
 =?utf-8?B?Tm9VNm1lTUhBQVVHSnoraGVodDJad24rUG1ieEVZSXlPVnlPOVNzWEMvVG8w?=
 =?utf-8?B?RUorZDRuaXliYjQvMnAxT3RwejVYWUhTUjdwQWdOSDhvTWRMcWFXbVo4aEJR?=
 =?utf-8?B?YjBoU2ZGT0VPWGdaTEJMaHdWMkpXeTNwUW5aT3gyRUt5WmwxS09lRXE3Ui9D?=
 =?utf-8?B?ZHB1a0d4SkFYenJjNWRJSko3UHhBZGlTNnJTd0p6SlRWNzVKaWo1aytKcTlu?=
 =?utf-8?B?OTMxbzFLUEExOC81RVpiT0t4MzdEakRqY1lTSVhURHUyTFRlM2NocTduWGRr?=
 =?utf-8?B?Z29UYTVIMTZxV2pGa0lVSlhPT0ZSaS9IMm5EY3pEVDZubVRkSTJJMmhvcFZI?=
 =?utf-8?B?K21zUzIvdCtad29GWUZmWU0xV2l4OThlUkdVL0Iwc2hYLzRCL2szZllFZnh6?=
 =?utf-8?B?NllHbWp6QVVrcFp2SWp0NS9jRzBmdTc0VitGNTdhQkUyVldmYmZJMUdBOXZF?=
 =?utf-8?B?VHYrdGJ2NjNMSnVvM2ZpWGVJemU3UUhYS3JNWEZnSGgrUGgvTXoxVGVwUmN4?=
 =?utf-8?B?ZDRRbzQvWGZ2SE9od055YXFJYmJLWEJIVElVVG1MdHFlZU83akVIM1J2NkVh?=
 =?utf-8?B?eTl0YlIxaVlxNzlMZHc1ZmRIa3BpMGlRL3YxcGlKMGo0aER5MENBM3R5RVFI?=
 =?utf-8?B?cGIvVm81NEM5ekZpZE4vKzBEWTBOT2Q0OW9OU0h0UTBtN3FlUDhlb0xZQXQ1?=
 =?utf-8?Q?GRZHg0B/oWsCQHov+0znmLNkF?=
Content-ID: <AFB2E607CD531C41932132939B6D00EF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 181eb554-d0a4-4b39-7d25-08da63278f67
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2022 10:24:38.6520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Owbnck2YWs37jXKsjrV/DfMrefPeGJxstDFgE5CVMiIG0Wn+tNbuwsNrCTE74J1E/2AxCY6mBpdBahLMn+yvODlDjoSf2miRE8FBpwRMu4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_032453_902352_1F980F02 
X-CRM114-Status: GOOD (  17.40  )
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



On 11/07/2022 11:02, Sudeep Holla wrote:
> On Sat, Jul 09, 2022 at 12:58:57PM +0000, Conor.Dooley@microchip.com wrote:
>> Looking at the arm32 implementation - it appears to be mostly the sort of MPIDR
>> stuff that was removed from the arm64 implementation in 3102bc0e6ac7 ("arm64:
>> topology: Stop using MPIDR for topology information"). Could arm32 benefit from
>> the same shared implemenation too, or is usage of MPIDR only invalid for arm64?
> 
> I don't recall all the details but IIRC there are parts if arch_topology
> that are ARM64/RISC-V only. ARM32 doesn't use it as it may break old
> platforms. Some of the functions that still arm32 specific are retained
> in arch/arm
> 
>> The other difference is a call to update_cpu_capacity() in the arm32
>> implementation. Could that be moved to smp_store_cpu_info() which is the only
>> callsite of store_cpu_topology()?
>>
> 
> No please, leave arm32 as is. It was done for a reason like that and it
> help to not break some of the old 32-by platforms.

Thought that might be the case, I won't (and didn't) touch arm32!

Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
