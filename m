Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8151CEB64D8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 16:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G3puGWdOafKFOsyx4BMINehA5XVN8sQ6WmUAgBxQihk=; b=JzrQfqKj4Txh//
	cQ5A6cNF7bfMOqkTwZt1lyoekB6zWntdua+LsjJqFlUZxodr025jWL1o0o6mMmsz2ezeizFEntWoA
	dbnuWz3pm1S7/9V3Pk9Tn7ReaNGz8bc5xsdKdjL5XpOnXg8X6GMk/OscpgYeY+Fmq1zQZ0+RoVATB
	fJoJZpPULkzvL/tl4QsxrXzx2/W5mM0R9uG7J3EYhCrz1/p+TJs16FznReDBJFc1YOvsHHBfFHahO
	5Asx6ncb2Q31Bhw7Z7Vv05w/+0ekUhPcuVIbIK29Y52VgyFRZBlCBWCtJs1TAxinksSsp8khwcgqf
	ETUYNuPjlfhahhvaQpMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qACk1-001CJz-2t;
	Fri, 16 Jun 2023 16:56:05 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qACjy-001CIB-1A;
	Fri, 16 Jun 2023 16:56:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686934562; x=1718470562;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Js61kklOp4BQ1rwerQRjlhJ3sV165mZhQX0vvO8dy+U=;
  b=XdwFcSKI/9iaTtrHFp2u4MIkUzFklYxRXyQIqr8aRkQ0wGmZ4WtPJwM8
   /rSRGPeYracdVitvY5VqBcGlDcD7np2vMfEfCKIJdNs8Nm9Ya+s5tE74Z
   wKXQ79Dnck0n4qroZ8v5KO0pjiMjfC/uTl7CYfEtIxKIyKn+l1Q10wftu
   PlOveKAjs7wK3naHxCqLBxyc0swhsEZ3YtG0eiaW4dwmrowFDKjpNn6JM
   MXpVDw09mRPQAMnlVD8oyw15AkXuNSH94klAUzeBytvMNxxwBjXCtVwir
   X4FqGNy/qDeeKuB6URKbSV5HrqJl+QpFRoZnsOU8RxFa8iRppUJVpkylV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="388029672"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="388029672"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 09:55:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="690308661"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="690308661"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga006.jf.intel.com with ESMTP; 16 Jun 2023 09:55:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 09:55:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 09:55:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 09:55:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 09:55:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLFm7Ts/De8RA8GmO6FLJQKRIVWusJVHr6s+fqv/EeCdguWQNuWrOVnNfdryqbyG365gk51qGQYq44uluAF6B0tXjnqS8wv3pXEsxkpBDqejK4mxoTx51q1LcWKm6LpKgLN3OLxBMz2Jt5j4ecV4JgfTjtz7ncCF0v9TrsjJzzNmUjxIKCGQETBBugoagWzxpotQffXMLzDyPY+6HFx5KcSDm8rTaq9S2rpENT+twKiMGdxQzLAH4BeKFF7OBzi55hTEGPmgLN3reZl8oATWxy6DtuXf9uSBDZE0+DMp9+9zHuknSPpYr4iKdInSSsvEd1cjsLSLDJ8gsRVBbAt3PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Js61kklOp4BQ1rwerQRjlhJ3sV165mZhQX0vvO8dy+U=;
 b=OScAWFPfVesu83HbP6tyN3+R3jZvs6O8YrxYDjOcYFI1b7LC1mfGiMr1z88h1i7t9pIXdqG+cbv8eLEQygrbPEGlpu8uwB+gYeRIMene/VU9DyCNRwuXjaxaJ0ZldlXYZIrPMRIvdIwDrQqD2r6VG1VqFH2zAw4Lgk7RTXdWS5SngXeRpWI/bdkzi4cwkK5St0Kyf8FUxsvctQALOS4mT4WjHZ2F81XZb6gXbsFwDmV7bhzebuv1Y7dpdZFkEL5PTn0HlOyHDwPDPnle2aDePkXNg0l244xnmrQedEN5KZ39sl0cA+lC9I6wXimNr8W6ZC+9omft/6bbc2DD8lBfxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by MW3PR11MB4697.namprd11.prod.outlook.com (2603:10b6:303:2c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 16:55:55 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::6984:19a5:fe1c:dfec]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::6984:19a5:fe1c:dfec%7]) with mapi id 15.20.6500.029; Fri, 16 Jun 2023
 16:55:54 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rppt@kernel.org" <rppt@kernel.org>
CC: "tglx@linutronix.de" <tglx@linutronix.de>, "mcgrof@kernel.org"
	<mcgrof@kernel.org>, "deller@gmx.de" <deller@gmx.de>, "davem@davemloft.net"
	<davem@davemloft.net>, "nadav.amit@gmail.com" <nadav.amit@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "hca@linux.ibm.com" <hca@linux.ibm.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"kent.overstreet@linux.dev" <kent.overstreet@linux.dev>,
	"puranjay12@gmail.com" <puranjay12@gmail.com>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>, "tsbogend@alpha.franken.de"
	<tsbogend@alpha.franken.de>, "linux-trace-kernel@vger.kernel.org"
	<linux-trace-kernel@vger.kernel.org>, "linux-parisc@vger.kernel.org"
	<linux-parisc@vger.kernel.org>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "x86@kernel.org" <x86@kernel.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"will@kernel.org" <will@kernel.org>, "dinguyen@kernel.org"
	<dinguyen@kernel.org>, "naveen.n.rao@linux.ibm.com"
	<naveen.n.rao@linux.ibm.com>, "sparclinux@vger.kernel.org"
	<sparclinux@vger.kernel.org>, "linux-modules@vger.kernel.org"
	<linux-modules@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "song@kernel.org" <song@kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>
Subject: Re: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
Thread-Topic: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
Thread-Index: AQHZoC/TR3JgcIuStE2G0Xd9KghheK+NpnKA
Date: Fri, 16 Jun 2023 16:55:53 +0000
Message-ID: <90a64b6f040491da16af0694172a6cbdaba33669.camel@intel.com>
References: <20230616085038.4121892-1-rppt@kernel.org>
	 <20230616085038.4121892-7-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-7-rppt@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|MW3PR11MB4697:EE_
x-ms-office365-filtering-correlation-id: 5b3da7c8-1546-4167-f029-08db6e8a8c34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 55tymwny0+p9AJrKuV6Lw9CTmKI2ItrnVOstrECWigv9Z8cjWvqSfeaHWQSUGW5VU+mfWIG70rMyttZ4EwUgfMSBR60zyCn9smiGC8YCcUF9fASq/sC8Cf2dDIhithsBz5Pv3FICtzSk8YB9Zy6t+fjAjTY3WFEcUEpLYsXokYmKWva3797Cuef1kpDYCqUXOwnCkMsyPHXxoOjJ9K8kxRC5IZQs/sp1uhaQ96/0lfABWqm8JzoRMTX4njLk8N8x7zKahweTPSQQpeIJZlqaPehuz+tjJWsFaOaBpCf/9MxW2f/Zdg34HyKEakHRwPelRpxZTl6XnoAfILl4qjk7VHWnEIn45mflQ88cnbto+XP8To0FsI7A9yitE7wAos5Z/Nhitl0w/BDdicTSi9b00kfMVBLSNw1qutwPd7+O6rqImZeoBea0Izxc7C00bjhNQBI3I4BrR3icZ/8zLO+vFqr15e/7HLRkTZoKRQF00ZsutWPPAA7Lq/Sld7ITjrMrLcU3r7xzpraFc1dU+lhwUDI8PERloI68A5kU3/DKilTBOiDW/cjVfh1sRC8Yh34F/bABmj8G78GVUV/+ee6mjIdta/q3/kArkkrK2q1g/VDGIkmd2VetbOxFwzTPjuL1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199021)(2616005)(71200400001)(26005)(186003)(6506007)(6512007)(54906003)(478600001)(110136005)(6486002)(38070700005)(82960400001)(38100700002)(86362001)(122000001)(7406005)(8676002)(8936002)(7416002)(41300700001)(5660300002)(76116006)(316002)(4326008)(66946007)(66446008)(66476007)(66556008)(4744005)(2906002)(64756008)(91956017)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlNzbFFxSis4ZmpHV0ZCYXQyTFNsVFY2NnVoOHV1OXpnSjVxTVVNVlg4VlNX?=
 =?utf-8?B?ejdRVnZJWFVMUmpuM2ZxbXZvd2hNdlN4aWxCV2VuTGE3WU8xSXpzVWJvY2xR?=
 =?utf-8?B?bVU4cE0wSitZMms2SEFURzlwN2NDTnQ3TnBCNEhodkdtYkdETTVGWjA1emVY?=
 =?utf-8?B?VlgvTGRHU3JRRnc3NEJ0eUp4Skdpd0x6VXYrRitKS1dFM3VGMk5yZWxWbmxB?=
 =?utf-8?B?SklVUENkaXJjY0tGRmxZNmRKNi9hQnJHa040WUFYamZmZzFmRklaZVRBNkc4?=
 =?utf-8?B?dkhZOGdTb052NHUrYkM0VE9rOExuQXJjeXlERllVeWNENDllMWgrc2FwUDhG?=
 =?utf-8?B?STEwSzdUVDR0bVhiOGZXdjZTV2JWdy9GY0VLeXA1V1grNE1ZVldnNGIybUJr?=
 =?utf-8?B?ajFycDVEd3RrSXBUZHhCeVR3R2JLWXB5ZWFnU2NsS3AxY0c0UlB4S3hrUDJP?=
 =?utf-8?B?OWJhTWRtaU0wSXloc0sxek01cFp3VXMyc21QV2ZIa1BObjRNdkwyVHJXTmo4?=
 =?utf-8?B?WFhUa1lNKzZLem9nbnJEVk9NQ0loWHJ2RE13U0J3aUV6eEMrRnFTWEQwMlg5?=
 =?utf-8?B?ZjJ4WjhDU0U4WDUwNEJpWU9wcXBwcm04NVJ2VEJsTXVBVzNaSVJBSENjWTR6?=
 =?utf-8?B?VGdnaDNlTWNURzJNd1dvUnliaUQzUVlHZHVOalUxaDhtdk94UEVtZ2NaWk9a?=
 =?utf-8?B?M1FFa3dDVEllK205NnlKd3VPTVMwNm1oZ2o5RVIrcjlsWGpYa2hDNkx4WEM2?=
 =?utf-8?B?cVZiaHRGbEZ2T3JvVE1aQ2ZhQ2NETkpONEVmT0w2Z3FZTXVwZUVZT2lzeUF1?=
 =?utf-8?B?N3orcnhNZ2ZyYVQ5aTVHdUM5R2Y1UmxjWHdQdFd1ckhoM1JYbnZ5QzVVeWlv?=
 =?utf-8?B?Z3Y0UWlHb3ZHb1NWNkVIL3dvZVF4T21pRGRtZnRGT01idDE4Q0pTTVMzY0gw?=
 =?utf-8?B?QzJaWUR5eERKSzRsNStsZ3oxeFd4Tm1uazNuWDNpTnJMdnFIV1pOVnFyMnhF?=
 =?utf-8?B?M3FaeFBLRkd6bEt0Y1FNTkE5ZlZmWWVEdEx3N1ZBR3hUWUFYRzVob2ZKSy9U?=
 =?utf-8?B?Nkt3TWtCbDFWd0thdGFLMGN1NmpnMGxBUTZ6S21wVldZejRCeUR2YUw1aTNz?=
 =?utf-8?B?aE81elRTSVVQejlRZGpKL2Z4Nk05ZjluVUUyWHBGaUV4cXJTTWxlWWZZUWFo?=
 =?utf-8?B?WUJVTVFTeWhHZEJoWG50Ykg1QTRkaDdwa1dOU0VBZnIrNHZMSUo1Y1VQbDFP?=
 =?utf-8?B?SExGWmFUbkcxMmVQTW5EU3psNTg1ZTVVbExMT1lUdkRlTHNLakl4azBYM0JI?=
 =?utf-8?B?T2RBQ2tsWisyUU1VTzNFMW1VeFQvRWVvWEh3NXp5Tjl3SE9HK3AxZmNqVXhs?=
 =?utf-8?B?Q3RkdSt6djh4TkFLeU1sZWcvMnlvVWNIOWRTSjkzQnN3ZXI4WUkrd1FXZXBG?=
 =?utf-8?B?UmRtWVBmSnAzSjZ5UU93M2VabU1PS2FPbi9vVnhzR25vSjducmJ6V0cvUXlJ?=
 =?utf-8?B?S1dPQldkRitHTUxpUHlHUVN3ZUU0TTkxQmFlOUMrcTIyU2FWMjVPcHh5K0ZP?=
 =?utf-8?B?aGRWUCtJOEFzdUFlVjMrZ0t0RWxLSHZGNElvWDNXYitjTGxiZEVzblZVQW5Y?=
 =?utf-8?B?S3RLRis1aVYrbnhsRjdrcE13YnI3MGxGb2xjL2xpY2RtVVVNcXBaeUVSUlZn?=
 =?utf-8?B?azFod1BHUmZKSmNiTWp4V1ZWOHJFeUVVMHlCNlAvWTFtU085WC9yTFM3dEpH?=
 =?utf-8?B?dkk5MmpCTDBiZ2pLZlhaVkh4K1VUZTBrY3NiVXVpL2lpZ2lMWXJ6ZmMxYjJs?=
 =?utf-8?B?SEJ0ZEs2cFNESjZLdjBWOEJmS1FFRkdndU9YNG8wUEpocXBhZ2ljeDZxSVJR?=
 =?utf-8?B?MXVObHYyOTBrR2xHNGdZZVlDd1JpanlXYnlGYWE3OG53K1B4dFlOaDgrRnlZ?=
 =?utf-8?B?RHpiY1Z3cTFsSk9Bc0NDVlhkSjlmYmlvbWQzYjMwOFpVMzZPNTlYSGMxdDdB?=
 =?utf-8?B?dVRoWlJjMDVEa1Q3K3dNQU1NeVp6SStycVI0ZEZmdmU2dGNvaXRPdTRtbmlO?=
 =?utf-8?B?WHZwOTB1ZGZYN0phUjJFMGlTSC90OFIyVHFpN2R6YUI0RllGN1QvY3h2OEo4?=
 =?utf-8?B?aks1d2JhQUFETThkWUJCK3crOUFZeEl5VGcwY3F3RkIxc1ZyR1hXSGp2Nm95?=
 =?utf-8?B?OHc9PQ==?=
Content-ID: <296480AEB1784F438AF55677428C8428@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3da7c8-1546-4167-f029-08db6e8a8c34
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2023 16:55:53.8380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: djtwhzK5rIuDoNODv1diC0gNewajiVZ3/uT8OfCTcgK3MGfFfnfk6NQh4QGrKI8Mn/9WaTKi1BcoE2Fi1Wv+cbhC/2Z1m3nfYDGQ4vxU7DA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4697
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_095602_442716_186781D3 
X-CRM114-Status: GOOD (  13.77  )
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

On Fri, 2023-06-16 at 11:50 +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> Data related to code allocations, such as module data section, need
> to
> comply with architecture constraints for its placement and its
> allocation right now was done using execmem_text_alloc().
> 
> Create a dedicated API for allocating data related to code
> allocations
> and allow architectures to define address ranges for data
> allocations.

Right now the cross-arch way to specify kernel memory permissions is
encoded in the function names of all the set_memory_foo()'s. You can't
just have unified prot names because some arch's have NX and some have
X bits, etc. CPA wouldn't know if it needs to set or unset a bit if you
pass in a PROT.

But then you end up with a new function for *each* combination (i.e.
set_memory_rox()). I wish CPA has flags like mmap() does, and I wonder
if it makes sense here instead of execmem_data_alloc().

Maybe that is an overhaul for another day though...
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
