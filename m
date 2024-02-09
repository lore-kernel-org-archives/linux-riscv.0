Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BC4C48297
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Feb 2024 20:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UVkd3F/9drHJgkKcnTE/3wa7RtbIym5On5rHd17esg4=; b=DgJss764dmxCx4
	JXrMiSoG2rwAyXbAH/t9SGscPD0qqNI7f1JkZ9EJTs0TwfmYx9t5iStplbMHQRsvhF1gadJJs9N+h
	CPCi9I6lmV3DVq+2TTHfO9/uT9jFhCYSpYbDBr3mjw8u9GwAlsPL/MfHU8SOfwwlp6CdAe6yCv59B
	jgu/oYrU8gXc/VQA2OedMO6yzhHNmZiatZGLLPCaTZ+CMFSGgrpEhVZGWGJeeAxnGCqiPVGsR/pNa
	oTglM8yy/dqCs/cUwVHYJyOf6HEsX2yE3WI8evMeT7yfsyYFN89jNOFGpAT+c4cRnq+XiqVbdZb+M
	2qYPezsYBoFMoqCiEkyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYXjs-00000000XEb-0o3M;
	Fri, 09 Feb 2024 20:44:48 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYXjp-00000000XD1-2POx
	for linux-riscv@lists.infradead.org;
	Fri, 09 Feb 2024 20:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707511485; x=1739047485;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oqexUimvPWm+tux+NLxL55o2cXrEg60MsWPVM8feUgg=;
  b=DYwpyRksueqAjFmhXmEr71P7VFoTwDJugy/ict1sR76C6dWMOQHm44lm
   cqAmIg5+wiN8Lgl13peCQC7KJI8WCe5E32QW7Tvdd1cvEZ/N4pL3aimv1
   nVr7VdyMHalxZsW2gKdLIgLps+C7iMM9iMNNfEiV0K7qdlMrdrbNhGVyT
   8FFbQ4tx9YND+t68Cnfs5DmYjrAcYQdvt835dtBIlBXwhI3PxL/cWfPhp
   GJH9PXChhpX398ly/H7o7N1OaG2AAcqpwNDyv9AcOXCJbAGWKMVflWdUX
   ACZfWJS85KoyZJLkOh6UmbtIH42nIzNyeEUI5lK8sIA0mAWb5ha49SuF8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1813922"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="1813922"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 12:44:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="6681396"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Feb 2024 12:44:40 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 12:44:40 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 12:44:39 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 9 Feb 2024 12:44:39 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 9 Feb 2024 12:44:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfdjM0bhqMwVSCaCv8ZzR9yFqbyRG660ct+k9GCSKH+rlsKN3wi0AIIcTAte36fapWAt2osS2FS8bFVTre3/nANqnXM+G7XHOI++UJ2DBUMDUAbB3ilOrddvL5QiS20YfSMyok4CvjSwYo2lWOVemhqnaTJNKurqHy/w0Uzl+vU3Q+RQT+TTTQA8k9l4WnUVPHjcbFPY9lEsvkFTiVHZN9e7MHEafvLPhMUY1eLy5hNCw+X5juN9oZgqKGf5Svju3LY3tjP8r2LogLVWBZShQp/loRoF1q/AnMHfVvXEsvjd5qrgbJ5wsThHPnsArFCHlkeHf2YO7h/69sSRTGbqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqexUimvPWm+tux+NLxL55o2cXrEg60MsWPVM8feUgg=;
 b=Wy9bwZnnGM8sXFjSZx2P9dDPkI6t5Ck+hWSOD7CbA1PYFrAtqTldR8hw8kTODNY5Ywvscv8kc6GdsPV7AwhrM5uBr9yVK0DCd9SZw8QEHu4j6KvF0B3M/RlKkKhTZtm5f3Jsn+UouqEgko/aEP4tIyK8kAAqPNzczdyP/57eGVGTijw9CDcBkN26Lpf8DBK3RmmsoGVSI2aGmA43dO4o4R/RlcgTnCuFNbaJcV/G0eNqV7Xf7yDRQmd6t+ND7TrdcuLR7okDhrEDneR6nAAst5CcHhCatjrhfrohX92OUqilXVEQ/WOS/WQJ0QftjGTGW6mN7eLdwtFgE1mUVpkwMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DS7PR11MB5991.namprd11.prod.outlook.com (2603:10b6:8:72::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Fri, 9 Feb
 2024 20:44:35 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::5d40:83fd:94ac:d409]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::5d40:83fd:94ac:d409%7]) with mapi id 15.20.7249.035; Fri, 9 Feb 2024
 20:44:35 +0000
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
Subject: Re: [RFC PATCH v1 11/28] riscv: Implementing "PROT_SHADOWSTACK" on
 riscv
Thread-Topic: [RFC PATCH v1 11/28] riscv: Implementing "PROT_SHADOWSTACK" on
 riscv
Thread-Index: AQHaT1fizUrHzBlKK0GvKmrNcgQc37ECkuMA
Date: Fri, 9 Feb 2024 20:44:35 +0000
Message-ID: <2914cf78e47010e195d963857b37807e8446e3be.camel@intel.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
	 <20240125062739.1339782-12-debug@rivosinc.com>
In-Reply-To: <20240125062739.1339782-12-debug@rivosinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|DS7PR11MB5991:EE_
x-ms-office365-filtering-correlation-id: 33e971a5-4c09-4762-9e24-08dc29afed1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JBR6HucL2TbwhEZrw5kFU4BOD8iQiHigJUpWeQYhQ0QFObtbxAWAqvnov3Hmv6teFXjYadSes9AQbBTOEii0Obd+QnWq7XKe6KokJp1+RT98e06LY/zlF9k161j+MeXDjW+WPKDqqT50oj6gNRurKFuBf6yg3OctiM1ZLyzfN60Vf2BRondKTzaa3xqsfRObZyEN2Ez0eK+NV0rBwceinhPcqFkX4kJEzG6+3ILHkm6xNFmjzVPXKCz0eCS3VWA5NJtCzI64kIqt+750mzB3sDW8qv0C5QttuIONQ8uLp7BZ5nTK+Dp9tnhhe0BtUL+QgOb4pc1oDAB9tL2kc+hf9zgPNZcz5UJH16wuiSJdZBfyiWTb8o2Jzpn6WgiBKbalA/IWAAqcIdZXtkqa5L75gErxisljD2VYe05jIUFQpqoL3nOKjQYQZsdBeM5KxTXJTnSAMCCgoo1MkHkcc2sIqxtwXd6uNSe57SUR8JN4LuH1B/GJIPyBYGkZ5bblhANcbBeywTbSSe8yjvf/M9CXb17tGeL22qQhTWjCuaANhdlQ6MLfWzPqQdKdrXpb5FdAxhB4qRYLPLyjsiAPxL/S2g+DsTlMakpqaUYejH8dyvyA7x5OpzMVq+Z0eUuBa0UP2/AIVn3sul5O+Y0I3sb8BA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(346002)(136003)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(7366002)(2906002)(5660300002)(4744005)(7416002)(7406005)(82960400001)(86362001)(6512007)(71200400001)(2616005)(6506007)(6486002)(478600001)(26005)(8676002)(8936002)(38100700002)(122000001)(64756008)(66556008)(66476007)(66446008)(110136005)(76116006)(4326008)(316002)(66946007)(54906003)(38070700009)(36756003)(921011)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aW5LSzRzaDg3Z3htenkyRktSRWJhYnc0bmtnaFQwSVJIRnVPblF2RkJOMm40?=
 =?utf-8?B?MkN6ekNremNrTmlYaUlPc01TQlNveDFYWXNsVmVrNXM4Q2RKcG82Sm5kajVs?=
 =?utf-8?B?Ry9PeWxtaEhWYVBXZ2s3aFZ3OXdoT25DM1NYR3V4OU5BZ1k3akY0bS9Bd3h3?=
 =?utf-8?B?S3AveGw4OG5NRFRZaVp6bCt2b3ZwRDZKaXNpNExMemt3T2hnUTU2Z1IvQ2RM?=
 =?utf-8?B?cFo2N21vdUU3aXZXYmFKZVZFNzVlZ09NT2QxVUtleGNJbWRMVTJJNTFvNTZ1?=
 =?utf-8?B?RGFSR3d6MFFxVjY4QmZjTXE3a2NPWnR1Y0w0VkpYNU1wVGJxUStVMXlHbXNn?=
 =?utf-8?B?WGdwcWlwVWI0aFJvdGd6YjR3RTJzOUhYV1BtTTR6VllRWjJrRzBQTE1Wencx?=
 =?utf-8?B?WTdWd01QTWVTRWxEMk9rSG15cmtRdWJtVWtpWmZmT2JlRm10VkFieFM1QXYr?=
 =?utf-8?B?OVMydTg2ak1yZWJxNFp1NTVKcmhDbUpDU0dmc1lSQzN0cFBNMTlqaGEyZkls?=
 =?utf-8?B?MFU5LzNKMWlFcXVVbDZIdnRKZll0bUVHdTlkb1lQcVhUV1FwSldaeEFzWjEz?=
 =?utf-8?B?ZUhRK05jUWtTUk14OEVsWndNRThWOG53ckdycFd5WlYyTEpiS2ZyUCtEekUz?=
 =?utf-8?B?VzllMklGUzlCSS82RmhPaUZKSCs4M20zUnFiQUd0bkhocmhBdmNMcVZmUXNm?=
 =?utf-8?B?WWo2RlN6b0JDQXErVmorVHY2eUMrUnBPQURxN2dHUmcrS2QyMm1XcXR4WGlm?=
 =?utf-8?B?WHhaSmdrTVpLYTVSVEZYd0paUzFueEJWa2ZuSmFPRDBwakhPczhja3dnV2w0?=
 =?utf-8?B?aGUrMGUrZTlLZW15QTUrUjZJT1plM0NOLy9WclFJQkp4OHdyMk81Z0pkZGdO?=
 =?utf-8?B?YU1jRzNwRHVabjlud0t5ajRoa0dYcXBzU25jZnhDaUtCWUVsQ2czRnM1emly?=
 =?utf-8?B?NW40SFB1UnZ2YlhmYWlWMk45a2lqeklWNjVCSWRZV1UwbEwxbWV1bk01OXZX?=
 =?utf-8?B?WEJ0cGV0MnVmUkpaZkpETzNNcFpXanVDZ3lPSENyalZCRVdRZlR3N05qTFgw?=
 =?utf-8?B?eEk1R2E0VlZ2RXovNWJ2ZU81ZGRXZmlEajJiRzB0ZWpLQnF2L1hUVVZSc01Q?=
 =?utf-8?B?RGlQeVFjUzFmMUVVdUw0RndCbGE2ckhsLytGTFN4K0FsUmNkUWF6M2Zia215?=
 =?utf-8?B?Z3QxaC9zTU9saFZnbS9OQjhJc21yL2xVYTdUalVNakJpUEFISkhsSzNzVEh1?=
 =?utf-8?B?MGR6VElrZmxBTFArWmJyZXJiVkptQlhPelNNaFh6SHVRQS9razd3cnhkMXdj?=
 =?utf-8?B?WmRBVTI2YThkNWtOTnRRbGY0VW9FQ0oxUy94Rk9vb1kvREhHNzFPOHJmZkxp?=
 =?utf-8?B?MllNZldlazBGdFBtZDdmWVNUMTVOKzdYRUYvVUhkMFdVVHVrUkloT0dWcmxK?=
 =?utf-8?B?Wm9lb0tUd3JkT01pbEdpaVNqc2wyYi9BTlV0TkNpaFBOTmlSNXlPTlhMVURU?=
 =?utf-8?B?Z3ZWOEg4d3FSV1RHTE8rTkpRU0JYS3Jzc2sxQnc1aXVHSUV0Nk1rTDZNNndl?=
 =?utf-8?B?ODlqNkpWaGorZDlJWlN4S0wySXRPa2NneEtEL1FKOUM1RzRLeWZvTHhMbHo2?=
 =?utf-8?B?QTVnbzk2ZXlxWG94K0p5RGhWUldGYzUwZzE3SkRKWkJ3ZG9Dc0tXb1NhK0la?=
 =?utf-8?B?cWs3czN4VWNmT3dyWTJmS3BDNmdhaW53YXNHTVM5Z3B5ditvNGtjMXNEaGZU?=
 =?utf-8?B?M3hNNWczZzlMb3ZkTVQ2NTJHR20yZ3JBQU9MTHJzYWVjMEV1SURNRnF2QUpZ?=
 =?utf-8?B?bloxNDV4eTBTTmNkclE2MW16bWVFakZvSmI5RnZPU2UwN2U5OFZZMU5WZ0Y4?=
 =?utf-8?B?bVJhRkdYdDgwUWxTOVB3a1NzckVtd0x4S1BJYitwZzFBRFlCai95QlM0bDla?=
 =?utf-8?B?Wk5haG9KZnlEbEo1WWRZTXdiYUplYXpEQWlGSU1kRnlLZ1pvRHZkaDFPUjdX?=
 =?utf-8?B?V2lBdzM5QTVxTlFBT0NSdUV4aEEzdGROeUtYN2YvNVhrRXFkQWlaYmJHMThJ?=
 =?utf-8?B?TVByQzhjY2dOUStZRXg1eFlyMzRlNWVjakVCUjJ3NStyK2xoa29Ub1BTenp5?=
 =?utf-8?B?VkxvVGdRRUw1bWpNMEc5UTMwUHFlckhaaTl1bm1xQS9ZUUN6TkcxMFhCcFIw?=
 =?utf-8?B?TkE9PQ==?=
Content-ID: <DB48B61DB02D1049A3BDACFBB9ED3B5A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e971a5-4c09-4762-9e24-08dc29afed1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2024 20:44:35.3518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tp8DCULOkdfHtMDzu1Xbj19lXXzdg40gLXE+O2qy0+LMiTLOqOD86boA3/FO3qHyqW+6kYj0yUBMlrEGDcTuMHzw1lgVhasvj9BlTv/GWM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5991
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_124445_664920_1B31965E 
X-CRM114-Status: UNSURE (   9.82  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMDI0LTAxLTI0IGF0IDIyOjIxIC0wODAwLCBkZWJ1Z0ByaXZvc2luYy5jb20gd3Jv
dGU6Cj4gK8KgwqDCoMKgwqDCoMKgLyoKPiArwqDCoMKgwqDCoMKgwqAgKiBQUk9UX1NIQURPV1NU
QUNLIGlzIGEga2VybmVsIG9ubHkgcHJvdGVjdGlvbiBmbGFnIG9uIHJpc2MtCj4gdi4KPiArwqDC
oMKgwqDCoMKgwqAgKiBtbWFwIGRvZXNuJ3QgZXhwZWN0IFBST1RfU0hBRE9XU1RBQ0sgdG8gYmUg
c2V0IGJ5IHVzZXIKPiBzcGFjZS4KPiArwqDCoMKgwqDCoMKgwqAgKiBVc2VyIHNwYWNlIGNhbiBy
ZWx5IG9uIGBtYXBfc2hhZG93X3N0YWNrYCBzeXNjYWxsIHRvCj4gY3JlYXRlCj4gK8KgwqDCoMKg
wqDCoMKgICogc2hhZG93IHN0YWNrIHBhZ2VzLgo+ICvCoMKgwqDCoMKgwqDCoCAqLwo+ICvCoMKg
wqDCoMKgwqDCoGlmICh1bmxpa2VseShwcm90ICYgUFJPVF9TSEFET1dTVEFDSykpCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRUlOVkFMOwoKQXJlIHlvdSBzdXJlIHlv
dSBuZWVkIFBST1RfU0hBRE9XU1RBQ0s/IFNpbmNlIHlvdSBhcmUgcGFzc2luZwpWTV9TSEFET1df
U1RBQ0sgaW50byBkb19tbWFwKCkgZGlyZWN0bHkuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
