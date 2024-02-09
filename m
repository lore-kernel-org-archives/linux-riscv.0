Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83553C48297
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Feb 2024 20:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjaPwuZVi2lC6q91y6prXEg8iY02IMPEf1JWI2LIrvw=; b=l7gra1na4vrJBb
	TegQduu8rNfCg6OvgFrU+W40MGMlaQEVHWuTWo0Q72ct4VN9GxXyZSwI1vFK6208LV1oOH3KEoprr
	9PlEDtNJv0A0YBiPTAELNzqzD4ZHn5dkPxC8vijkPPi3fjV3YfALf9KId8F2lbOMdMJlNyFvXOwZ9
	cQO1jBhUusF7rIzHeXYRXbGNWwRAz97uKhuzab6k/V0tBw83IkNF7G/jzIuq07WTZIjiNlWpT4636
	HdMeYgiNTsjBJ5fYjuG/9GCQ89XPP1HDvBaM2thipYqjVwY43eEcFlRDbeA2NuzrJ1ij3UnC/0E3m
	VriVc/XIHydRzas3hAig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYXk8-00000000XLJ-1hJa;
	Fri, 09 Feb 2024 20:45:04 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYXk4-00000000XIP-1TME
	for linux-riscv@lists.infradead.org;
	Fri, 09 Feb 2024 20:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707511501; x=1739047501;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Wk13llEoAEZK2reCAXEFv2pKxLe107CHI28Ei7HUlMM=;
  b=O63ElB6XwaDmDeJ5+CMlojpSdnGps6x7efPpBh6mJjzkc/gj6pQGSDmi
   nnIVQhTcGxRshykKIxmWpIYZb2tswrUdgxg89LeGBXmrJ1Cz8ObvNW+ci
   Ys0GpRQXOa29GTdoJlYf/qkWrHu1VcspVEiCtohxTZjwS7VqtwFOMNNN5
   8W/nZbCOcI+isxeJWZ4Q1Ck600ECaJaNm9UgjnyXDoXDANTgbY1OaJ/gh
   YoynABvRAG7alZrHsGarhqxWcXxQ34RcWyVAEZZQsLqqcY03tej0KeK1E
   OG9FU4uuOG0MrPu21K5iCwCilqzv2OvPTHIGBNN2rHWTP1aSGsIZ3c6Hv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1407324"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="1407324"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 12:44:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="25260565"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Feb 2024 12:44:57 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 12:44:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 12:44:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 9 Feb 2024 12:44:56 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 9 Feb 2024 12:44:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/LswlPLfGdUTFRCT57kEuRb4I7YxkSYbaz2JQ4++wTl/59GWddzYEnDU/XZgeBfwbn+PU/cD7YacNB5ef5BAd/a2OXYFZQ2ZsX0+iHbakcYJIndiC/doR9gdJs6QiHaZVn6I8LNIoeloEwltGVB/v6roaS529lG8azRajcaM+kAc0P2NuwQZhkPISHUiqeVGE1W+bfQtrXzlV4ivuTXsDUrKrKSchcwEJPFs+Gfz/0ww7sPfZsWDYr/dmK1xi9RFVEASGTGRCgw7hgIGHiHPztUEx6vV2o1TkT6tMJQO0rUJM0qWxEpRyzddcy3Ahvowk7u9dqKAG/4NUT+kmf8xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wk13llEoAEZK2reCAXEFv2pKxLe107CHI28Ei7HUlMM=;
 b=VAKiqyaC3ysuIrKOy73pkezj1pZONq0qJMBn3vM6OCSGeYAYI37ajjXdWBdMNVxXa/z7Pf672S3Ecn3JPULPAy33dl8SPol7/he7r2c81iz9+hw7M1RzKXp6NbQy5tGk6nSozO5PVj0Ehf2PN5b+T4Q+HXHgRy+1ZxR6skRPUdldMN54Ootiv3Fic6T2ZPpq9NUzvOoExQyboUKBERPFiJtQVZxNFxe+6KGv9xt8ZJ5OOAVnXPEtYxO2uGOBVo2fxHGJ9jzxSLIJC7hwzZbr6CHkPuRfn/WrCo+LA6ftEWPZ/11Q8eQtFf4stsiUuj3hQaRxT79/WahF1Hn1iXdmwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DS7PR11MB5991.namprd11.prod.outlook.com (2603:10b6:8:72::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Fri, 9 Feb
 2024 20:44:53 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::5d40:83fd:94ac:d409]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::5d40:83fd:94ac:d409%7]) with mapi id 15.20.7249.035; Fri, 9 Feb 2024
 20:44:53 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "debug@rivosinc.com" <debug@rivosinc.com>, "ajones@ventanamicro.com"
	<ajones@ventanamicro.com>, "bjorn@rivosinc.com" <bjorn@rivosinc.com>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"broonie@kernel.org" <broonie@kernel.org>, "keescook@chromium.org"
	<keescook@chromium.org>, "kito.cheng@sifive.com" <kito.cheng@sifive.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "alex@ghiti.fr" <alex@ghiti.fr>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>, "alexghiti@rivosinc.com"
	<alexghiti@rivosinc.com>, "atishp@atishpatra.org" <atishp@atishpatra.org>,
	"cleger@rivosinc.com" <cleger@rivosinc.com>
CC: "josh@joshtriplett.org" <josh@joshtriplett.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "gerg@kernel.org"
	<gerg@kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "bhe@redhat.com" <bhe@redhat.com>,
	"charlie@rivosinc.com" <charlie@rivosinc.com>, "david@redhat.com"
	<david@redhat.com>, "samitolvanen@google.com" <samitolvanen@google.com>,
	"heiko@sntech.de" <heiko@sntech.de>, "panqinglin2020@iscas.ac.cn"
	<panqinglin2020@iscas.ac.cn>, "mchitale@ventanamicro.com"
	<mchitale@ventanamicro.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"revest@chromium.org" <revest@chromium.org>, "mason.huo@starfivetech.com"
	<mason.huo@starfivetech.com>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"baruch@tkos.co.il" <baruch@tkos.co.il>, "waylingii@gmail.com"
	<waylingii@gmail.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "joey.gouly@arm.com" <joey.gouly@arm.com>,
	"ancientmodern4@gmail.com" <ancientmodern4@gmail.com>,
	"mathis.salmen@matsal.de" <mathis.salmen@matsal.de>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "shr@devkernel.io" <shr@devkernel.io>,
	"andy.chiu@sifive.com" <andy.chiu@sifive.com>, "shuah@kernel.org"
	<shuah@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"vincent.chen@sifive.com" <vincent.chen@sifive.com>,
	"greentime.hu@sifive.com" <greentime.hu@sifive.com>, "oleg@redhat.com"
	<oleg@redhat.com>, "willy@infradead.org" <willy@infradead.org>,
	"zhangqing@loongson.cn" <zhangqing@loongson.cn>, "jhubbard@nvidia.com"
	<jhubbard@nvidia.com>, "ebiederm@xmission.com" <ebiederm@xmission.com>,
	"Wang, Xiao W" <xiao.w.wang@intel.com>, "cuiyunhui@bytedance.com"
	<cuiyunhui@bytedance.com>, "brauner@kernel.org" <brauner@kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "ruscur@russell.cc"
	<ruscur@russell.cc>, "shikemeng@huaweicloud.com" <shikemeng@huaweicloud.com>,
	"jszhang@kernel.org" <jszhang@kernel.org>, "jeeheng.sia@starfivetech.com"
	<jeeheng.sia@starfivetech.com>, "alx@kernel.org" <alx@kernel.org>,
	"guoren@kernel.org" <guoren@kernel.org>, "chenjiahao16@huawei.com"
	<chenjiahao16@huawei.com>, "omosnace@redhat.com" <omosnace@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "evan@rivosinc.com"
	<evan@rivosinc.com>, "bgray@linux.ibm.com" <bgray@linux.ibm.com>,
	"apatel@ventanamicro.com" <apatel@ventanamicro.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [RFC PATCH v1 15/28] riscv/mm: Implement map_shadow_stack()
 syscall
Thread-Topic: [RFC PATCH v1 15/28] riscv/mm: Implement map_shadow_stack()
 syscall
Thread-Index: AQHaT1fwP0pRQmDoxEaF26DrihDWXrECkvkA
Date: Fri, 9 Feb 2024 20:44:53 +0000
Message-ID: <ba45e69f69851721419b84f1ff8b66a490f92c86.camel@intel.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
	 <20240125062739.1339782-16-debug@rivosinc.com>
In-Reply-To: <20240125062739.1339782-16-debug@rivosinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|DS7PR11MB5991:EE_
x-ms-office365-filtering-correlation-id: bcc5741f-e3da-4187-8ed6-08dc29aff807
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RfL494m/nmchgdt/zvRd/msCKQq2vajvyEr8dsmxO60NWIanA7oLV5tX56qyLOj+4Qy0jPi6fWOxh9WQ5FYhSwxG5STmjHiUkppI06QAlWzp2jx27qkRLtEDDdh/KjEvUBHLoYimL1ey/keSZVhFCaiAnhwBYVnMHrwmetwBeqrRPhNU5R3nz+ZHIMa1B0ceVzJWBgSvyKksfMMBZLWhBNZvSX7buX9oNB+GbMUoLjMf0hkoZUSgY9t8QH/yCSJz9FCIzvpEvEQ4hDW0CwPy4JICqCKqWaLm2SnOZD3zLFQYoyddlNzxKPnH8sRpS+OMsyIsi3a7RFHvX7c4f0Yia1Fi0QUn1WuJyyved1gUCs5X/UWcBimXmqp2zTipQQ2n9xTpe2sLDNKhyseA8Q7IIwvNkHxJOgIeY2VATwjyQMJ9f4LMrCjpznL11AUvjLRVoaxuwm07Vb14nCuaZXO5AhN/YvgGAH39xjut9JxxWTYhTMEXoQcjCsC4nx6n59fP+2Rzitpp1Ar4Tu5ZC9g1N33RXfWHosa89FW6fStRnI0DhwlzOCTjscyxN8m8F/RZqRc2LbkGWXvNOYUVwW6VLYj2LhH7XnUi2w7hAUmlITE2FzLjZb+aOlnDDhdjbWJd+vj1MVoe1LFpQrA3WGLdzA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(346002)(136003)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(7366002)(2906002)(5660300002)(7416002)(7406005)(82960400001)(86362001)(6512007)(71200400001)(83380400001)(2616005)(6506007)(6486002)(478600001)(26005)(8676002)(8936002)(38100700002)(122000001)(64756008)(66556008)(66476007)(66446008)(110136005)(76116006)(4326008)(316002)(66946007)(54906003)(38070700009)(36756003)(921011)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmlVOW85RE5Id1lERWl5eWM0a25nOXlKTzdKdm8wMGRDUXgydXVyaUJ6SEZY?=
 =?utf-8?B?WHJwWXRLU08yZnZkRWYxVTBFRFJsZmtSbURza0hFSTc5QUlEV3paRGVrMGxR?=
 =?utf-8?B?QURPTVkybm5DK3FoTzVCa2ZWRERlOCtXVmx6akNoc20zcHRhaDNxNWpUdXZn?=
 =?utf-8?B?cTJ2WkN2TnZjRUZhbzU5WVAxekFyY0ZYU0wvemxXR2x0N25XUmtTWDJianBq?=
 =?utf-8?B?N3BoRGpwdURpZklSbGVBNEJpQjRCK3U3bnI4M0tYcEhBczRiZCtFSXhzSGVQ?=
 =?utf-8?B?aTBNTnBTQkUwUE83UXVORWhMaHpTeFRHbUNZbDhMSEpHTmdhSlZjZFUzME1y?=
 =?utf-8?B?Z1dmaXVuUk1KTHVTRmw5cHJXcXdVdVFJL0VJUkMxU0I0dnRUNllrT2hhRVVD?=
 =?utf-8?B?QWM5MkhQaXJXaUowMWdMOXlRaWVPd0Jqc1BKdnRlZDhyMElPQTFoNnBuQ25C?=
 =?utf-8?B?S1pvbUxFZTlRNUhzcllSVDJlYWZEb1NCLzBKY3g3Q3hVcHliSVptTC90Z01B?=
 =?utf-8?B?R042bUY1WEs5V3JTMjBrSXZ5NjhMZGRIb05CQ0daRXZlOXVsbkhqd2tuUmZa?=
 =?utf-8?B?T2dlMWEyd05pQmduNkZDcFF5MmZNYzFTeThBcGdubTRyVksxVGl0U3FrVkxX?=
 =?utf-8?B?YmxVTnA2NE52UVN4TTdBQXdPNkFCUjhLdWQzZGR2alN0RW02ZDIyVDNwcHJX?=
 =?utf-8?B?bm9TRGt4T0o0czdvUkJieU1KYWtBOG13QmNjSktoUGtrWGNtRjMwRVBlcjQ2?=
 =?utf-8?B?TDZzRWxtcGU0eXpLTDdnL1RWNm50dXQybEh6eXNTNHRCMGZRa3EvTEhSVDc3?=
 =?utf-8?B?dUoyYXdUQytFdE85SVhHb3lOUzNzZytXYVJucWsxT210TXZ6VTAyTE44RmJ4?=
 =?utf-8?B?OFdlVnRUU2dSdUpia1FaK04zY0Z5WVdpTEdzN1lCM2FwSFR3N3V0ODRBajRO?=
 =?utf-8?B?cml2QW5vdkdUWkp3VE9hcnlzYVFTNHlHczMvMUcvZ3k5ZkZUZE1NY2U2VjQ2?=
 =?utf-8?B?SmV6WXVHaGtrdXh6eWFBT2lHcU9lTFB4czBkMTlmTHlLT29FT0xzV0IvYTVG?=
 =?utf-8?B?TjNmZVdLRlNRaUo0UTVNZlVkSmJpLzd6WWlwZE9RbVgvTlRid3dZd05ZMWdy?=
 =?utf-8?B?bURKeHZzV3JxOHRPN09rYjQ3bER3N2RUajZVdVExaTdFZXZKc3pBUU4rTURC?=
 =?utf-8?B?Q3QrcFhIVzlYSENoajhtb096ZUYvUkV6UmNlWU5IUGZWcGFTZ2ZvdkhlK2pq?=
 =?utf-8?B?dHZjMGtoUHdLT1hGaWROTDFtRjJnd1FSVXpBSitZR3E3Tk1vNnFPNGNJZTdT?=
 =?utf-8?B?NEVPNXByWTRmb2V4WTZWVktBN2dLOHN0M2l6Ujh1VVBMb1ZhZ1dsN2tFQ0ww?=
 =?utf-8?B?WWRBRndFazFUUktUdjBiK3pWaURncjN5cnd4TlYwSHpLTUJIT1JjQnZPdm5r?=
 =?utf-8?B?YlpzajR0T3laaUNmbldGS1dlQmhHbDZJSFNnTXJ0cEVDUGRhbDFWWTBJUmhO?=
 =?utf-8?B?MXVHWFFJTTBaU0Z6UUM0L0V1T3pQK1RvVi84QldRTmoxMnQ1OVNXSnhGTXNo?=
 =?utf-8?B?WGNSVkVMOVFFUERBSzE3QUZtRUVGY2lMYVNQK1RBaUdJd0F2eENXTHJQSm4x?=
 =?utf-8?B?eUxTWXM3UWdITlU4d2xCQnBxQ3oxZThDdytKTTRqUUMxUkhXOTVBVUY1L2hN?=
 =?utf-8?B?QkloNGZOa055Y2l3RXZ2OE53SWU2ZHBNYmJLN3VHcFMvOVhhd1ZZamhXRFNx?=
 =?utf-8?B?bGw5dk91NWRCTjNZYVdRWU0wdTJldGhLeStrTU1rZ0g5Z1RXb2V0anUwRjRa?=
 =?utf-8?B?Sy9VMTdLd2U3Y1B0ZWkyTHhsOEFkd3pzTjBnaDE1U3VvMDlUKzZHTHA3VDZE?=
 =?utf-8?B?WTNrb0ZjYlVtdTF2R1dvRzZkWHZuaGsxdm9pQ1h1Y0ZmSlgwZnoyMDVKYjFz?=
 =?utf-8?B?N2NZdXJQZzVGRWMrdXE4RGMzcnAwTk5rNFFuYUplRDZuWFJvNE9xeDE2enV6?=
 =?utf-8?B?b0JuVGNjaTNUUXpPRThCdk9tak9FaHo3MG02SDZtUE1CMlNEVDUwUXJQZTdM?=
 =?utf-8?B?S0kvSlJLTi9GRlpSMmJWQjc5K3pxZHhvLzVNN3pNNnpKSkloeEFFY0FkMVUx?=
 =?utf-8?B?M21xY2F3dTQwb2FWQmtOYVgxL0FDRytZbTZVZG1kcXViUEFsYzJkOXBQZGRP?=
 =?utf-8?Q?ynQdPVM1W/lU0iW2sywhLUQ=3D?=
Content-ID: <F51123F34DC04D4481220EDCC93D81BD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc5741f-e3da-4187-8ed6-08dc29aff807
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2024 20:44:53.6707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cv88Va8FxTdyJ2iNA+B3jgAifBZfwtk2/TsmixPIHspGZEZw+gRwFVFCLQ/Kjkhvqb6Cy4Bv+U2gAlySVujhuVqrsCDdYHGR7qs3eWtp+sM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5991
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_124500_554896_E5ED6C5F 
X-CRM114-Status: GOOD (  16.29  )
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

On Wed, 2024-01-24 at 22:21 -0800, debug@rivosinc.com wrote:
> From: Deepak Gupta <debug@rivosinc.com>
> 
> As discussed extensively in the changelog for the addition of this
> syscall on x86 ("x86/shstk: Introduce map_shadow_stack syscall") the
> existing mmap() and madvise() syscalls do not map entirely well onto
> the
> security requirements for guarded control stacks since they lead to
> windows where memory is allocated but not yet protected or stacks
> which
> are not properly and safely initialised. Instead a new syscall
> map_shadow_stack() has been defined which allocates and initialises a
> shadow stack page.
> 
> This patch implements this syscall for riscv. riscv doesn't require
> token
> to be setup by kernel because user mode can do that by itself.
> However to
> provide compatiblity and portability with other architectues, user
> mode can
> specify token set flag.

A lot of this code look very familiar. We'll have to think about at
what point we could pull some of it into the code kernel.

I think if we had an arch write_user_shstk(), most of the code could be
shared here.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
