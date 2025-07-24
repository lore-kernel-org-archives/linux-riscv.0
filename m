Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DA0C87FC5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 17:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=o0PKsAexS50BIa6vjvji+78LiAXv0Z1O3JRz8mSNTp8=; b=IjrjZbB84VZ8Dk8sOIhcCrDJ74
	MA7VufSwY8rpE/DAR/dtbYgEnLn4lxkrz8T41dQM+VG5uzVses2ukqtArlfIOvgsYaTL49F5YMDYY
	M6DwFBcD0uvmed66n9Cynu2cWkt66TIofXNsG6rCP/YWzdz/sbr0p5RWkIZxnktboXk1WwUuLsetK
	Oh+xRcwJ3och+KRMuW5c4QtnYHFpNYk9UFw4odUqHUT8jcR3Cy/zvCbxnGRhsMCxUXNi5QmJUt5WY
	rUelSOcMZKVpdQLYhozoX414TCkx7OUQOT/DxuSALtLywWZF3PJfDlusr2FfTlsbVpDsXSmaQXAxs
	zY6yd5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezNt-000000083VS-19rb;
	Thu, 24 Jul 2025 17:05:33 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexOu-00000007nY9-1NMd;
	Thu, 24 Jul 2025 14:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753369108; x=1784905108;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+0MgedeWyXFgOBizMvFn6d7htbEgMXoLkwmKmGFg/a8=;
  b=VOl7R0f0FFSn4Q70/28Tl1BWJrR6ynk89ZqlS+bE/FuC4QW/zrZdwCrV
   BStuzQv0Z6wOKDzxhCM+iiJn6RnLnt+3olEUBIAFFOezjW8YrNCywMSpZ
   Nmh8etDqhzhglnduYInCJ1A/AmSdIVprcD4EgHuxJvm7L4QBf9sGXQ6JA
   zv1YR2XPLwDI85F8X3FYqz8BLe/Y1pYqPpXxJdpa7NVoW0f6RWCRuPyiD
   HOjl6QXxsSlpXL9U+Wv405JGZ4HiwCoZQ/BDhMer4PGox+Eo9UM8w84/e
   kJPzoEdXvhvFP4YS2zIuPuB8o4pkV6iqLTN3MKWMIy5dIma+/H5yUDWuI
   Q==;
X-CSE-ConnectionGUID: MnwjQ4PCQjeZUdYUOKxBVQ==
X-CSE-MsgGUID: 7mKTUic0TMe9xstFYSxmCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="81132255"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="81132255"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 07:58:16 -0700
X-CSE-ConnectionGUID: R8lT8YreReyiJSN10Y9qxg==
X-CSE-MsgGUID: D6IRg2uHR6qoAU74ub41ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="164337252"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 07:58:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 07:58:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 07:58:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 07:58:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHgbQ03IxVe0gTti3c6mSnK6OCanAEyCw0SpK1Vxf82AeSrVRSHj8b03xw9K0x9abbLSIIunVne57hn8FhY8TC4HUeyJZh/J322yHlNvkaeVCDGcD+m4Tr3UVJe3c+LSWiSxFmdocc8hnh1W3CI8jeFvtPVd71fTDe38qtzW3rCVVp0s63qEO+KRZk45De1JAPQKMlVyCXmoKPMeI8jERIi+R6VnOGktUPQDJ+1F++k54lvHyms23H+Fy+//4CCTHbU4wa4V5S0DPRz0f6SQnGD/mVTbrWxhI+9E7br3ZtM4vK4fBnRY9NFtJbu/pL1e+JVLRu2Sh4QAKhwLJY8HkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lHe/7yfjUc5LaBBCZvq1ERSzzXHStX4S/5XDpNrbHE=;
 b=kLzauAI/xF2qUaO7APZ4uFhEWSO5u45ykQKEKw89S82TM1UdCkS1crnaKT9l0Kkh4DKD9giMXCi04acN1kCPcYv5c2uyc5dKAsDvgVV9kctDlTZsz7N1Jc9lFZaS9JrZ0WJGGmQD4WgHM/nZdEdHwoToDyJ7OXa6+bu6l9PmWknYK8/Eug3wT/QsDyB2nIVz5Vt0dA3i0Q7w7b4Qf2AaJqZs9/3nNplBclBWXBoh5OGiohth+YCF6S1hBwkEXBkI4v+lhZ/+tdzO4UFN5XsIk0Ren3NjYNAIruzcRHEbASe+yV8H/++K2Y4BICFDuoDgnJhoVYGz6UTz4pTg2xcLJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by MN0PR11MB6159.namprd11.prod.outlook.com (2603:10b6:208:3c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 14:57:44 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%5]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 14:57:44 +0000
Message-ID: <30cb2e71-5e0b-4fa0-b0e0-3263d9aa8712@intel.com>
Date: Thu, 24 Jul 2025 17:57:38 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] mmc: sdhci-of-dwcmshc: add common bulk optional
 clocks support
To: Diederik de Haas <didi.debian@cknow.org>, Robin Murphy
	<robin.murphy@arm.com>, Chen Wang <unicornxw@gmail.com>,
	<aou@eecs.berkeley.edu>, <conor+dt@kernel.org>, <guoren@kernel.org>,
	<inochiama@outlook.com>, <jszhang@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <robh@kernel.org>, <ulf.hansson@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<chao.wei@sophgo.com>, <haijiao.liu@sophgo.com>, <xiaoguang.xing@sophgo.com>,
	<tingzhu.wang@sophgo.com>
CC: Chen Wang <unicorn_wang@outlook.com>, Drew Fustini <drew@pdp7.com>,
	<linux-rockchip@lists.infradead.org>
References: <cover.1722847198.git.unicorn_wang@outlook.com>
 <e57e8c51da81f176b49608269a884f840903e78e.1722847198.git.unicorn_wang@outlook.com>
 <f81b88df-9959-4968-a60a-b7efd3d5ea24@arm.com>
 <99899915-2730-41c7-b71a-f8d97bb6e59c@intel.com>
 <DBKCYCNRNTMZ.1XJU81M6EE2D0@cknow.org>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <DBKCYCNRNTMZ.1XJU81M6EE2D0@cknow.org>
X-ClientProxiedBy: LO4P123CA0085.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::18) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|MN0PR11MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f06635-7da2-43e4-f9d0-08ddcac2721c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHA2NTRYV1o2TGdtVTJ3eXJXOTRoUGZ6T2JHOGNML25EZ2tEckZRVVhWZC9W?=
 =?utf-8?B?a3lRQ0JRZEk2Ky9hTFJIeThpTFpTcytBUzJpTGl0WkgzQkhqL1dzUklWRUx2?=
 =?utf-8?B?TERvV2pEdGZIS3NCenBIOG1zb01NaVJXMGJHQmV3TEQvZ2JjZmF0T25JVm9z?=
 =?utf-8?B?MGlaOXVRWmFkN3BDMEluZmJrNkNTaWpYZG9KbXhCVmpjVUt2M1dERzY5WUx6?=
 =?utf-8?B?c0thUzdpUjFVRDM2Y1RzekNvMmMwMkptWnZSeWJaemQwRHJPUkE5bmRZL2Vu?=
 =?utf-8?B?RGVnNWdWZTZmdW44b1hqUGJGUjlkLzBlWllZTzJIa2MyV1R1Q3U2NTk0d2tD?=
 =?utf-8?B?aFB1c3dNSkwxYmdXam94MlZxbzN6NXZqVWNNaDFkTUFxOEJjNlRicXFJbEVZ?=
 =?utf-8?B?L05jdDZyN1BKMlVsL2R2cFhhaFJrcVNUc0VHbGM4amtKN0VTdTRLVkNlUHN5?=
 =?utf-8?B?ZGJ1UnA2MU5ENGFRTEpVRlo3YjVYYVpwWTlwQ29vcjl0N2ZTK0NuTjhvWGc0?=
 =?utf-8?B?Y2xNN3RyaGwyVDAwZnNHQjdicnYvSTl4Z3hrZU54T256dC93dlNtUngySFlD?=
 =?utf-8?B?WGNucnpXK2VtTjFJeCsrVFlJRWVXN3lPNEh6bGp4eGExL2VTKy9uUENEMFZi?=
 =?utf-8?B?cE9UOXFqeTk4T2FzQVJMcERYeWNzYzVpWCt6V21EZXZROFhtcHNITjF3VkhG?=
 =?utf-8?B?aldpUktzNXZteE5ZSk1IbTJKQzh4anZaODF3SmtIRHU2eEdNMEFLUmRGTWFE?=
 =?utf-8?B?MlRLNnpYZ1oyQnY0b0VzY25wSTdpRmdqUm9iczJ5SGtnUnNMSE1YUmNMTlky?=
 =?utf-8?B?dzRrZUQxeDlwYUdtd2k2ejhFaklCWWZYL3I2NElYbXdxc1FzazJZd2wyRXYv?=
 =?utf-8?B?eDZ3RUloQU1qdzNDK3BTeVF2V0NUVGNrMFF0dmJ0SjczZCtCWURScFZXT0w5?=
 =?utf-8?B?T1RleHBpQzBpc3RGUXd5U3N4VmZYZGQ5dVQvYzdSVVRINkdDVkcrZERtd205?=
 =?utf-8?B?WDZUZDhyUnpYbzFpSmlON3k2ZEk2V1YyWFpISjRmT0xDNjR2RzRwQzJoL3RY?=
 =?utf-8?B?bWIvZUo3Zm5rQWxad3hwR0ZQbnVpeis5TktHSzFSNjluMVZiNjlCMU5qaEt4?=
 =?utf-8?B?Vi9qUDN5ZXpnZWZXQS9LcCtYbmNoWTRqamZxZHFJWGQrMXl5VjROZ3UxRXF1?=
 =?utf-8?B?SEpVd2VaZm5tbEpBS0xFUkl4NStONytKaVdnNzhSRzJxK09YZDdabExEVEVv?=
 =?utf-8?B?NWlPSDVzdUtPN3J2cEdEemowQTdBcDFhZFg3RTNGVERkWW4vY083Q3VMaEJX?=
 =?utf-8?B?T20xdGFXUnZjWHVwaktRQ3Z0OGsyKzhJaktKWSs3bmZJMzBUdGVMRWd4ZnhY?=
 =?utf-8?B?SFVKR2N1UlBxQnJObW1WeUM4Rkw2ZXNFaXg4dHYvMjBxRFdTbUpJQUxOOGZi?=
 =?utf-8?B?cDJBNFlkb3k3cFQrODRDYmNSQnFFMTFhdGl5UVpxYzg2VklwMVNXNm12ZWhT?=
 =?utf-8?B?ZHZLUHlwS25hVTZjNG8zWEYzc1YzdXVET2xnaE5UZlRUdk5lTHo3SWFmMEdE?=
 =?utf-8?B?TmR2TXhSWE1MWHpRWE54YVhhSERRWG9UKy9WYUZoMEFSOGNyaGp5d3BGWjlm?=
 =?utf-8?B?b2xwaTBPaW5qb1BZaVVZTGIrWXdTeWkxUTh2Y1RDQW5OOEFqcnJlbUNFOXEv?=
 =?utf-8?B?ZHEyU2ljenZJaDA2ODI0djBrei9zYzFIQTlvVExQSlp2NU1FbnIzbVk0S0VE?=
 =?utf-8?B?WGNPV2JWdnhBbUs1V1AwQklkcWdaVncyQW5hL05JNDkwYXNDemNZdzE4TzVs?=
 =?utf-8?B?eDdmVEpoRnp1TVg5S085eXlhckFxNnlKV3BqNXhaOGxOQk5KTDdIb0IyY2Jh?=
 =?utf-8?B?N0RzL0h4ZjJNZ3QrRVJnTTM3eWMvNkhUYVM1d2lPY1htV1hEYWV6bEc4eDl3?=
 =?utf-8?B?YjhnK2FhOFNFWDcwcWNyamFWdWV2Rys3aVA1NzBzcDFmWFh4aE9LeXFsVHMx?=
 =?utf-8?B?ck8xSHFtWGV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzB1Um9LbThSdHpHNXY3ZEJHQmhXT1JCK2RDb3E0aGFaWVhhcWZ0aklLeXZx?=
 =?utf-8?B?NHcyUitZME45RGI0QXlyWjFueXdobXdDdXNZbUJMTjF3enYwSWpnLzUweW9Q?=
 =?utf-8?B?U3duYVVCRG02MkpTWi84Q3cwNGRzSkwvcGMxcWZFTERQWkE3VlE5N21RVDcv?=
 =?utf-8?B?UHpIM1Y5QVpUVk9FY2IxSkFSUzFmWFdHNVJ0dlFXWWIzSVM3YllUSVFTejJ4?=
 =?utf-8?B?YjllZnFLN005Z0loZGN2Y0kvYTNvVi83NjdUUCtscWp1Q3A1Mnl1N0k0cVB6?=
 =?utf-8?B?UlRJSEhrdG1CZ0tCYlZEL3RKOEEyeXNLYzk5OHhnT1g5RGtiRG0zRkR1TXJF?=
 =?utf-8?B?aUFMSkRHQXVsTGRBT0xmYjhkeFVTbUJrMHZWeE12eVJiMlpUSXFGSUt4SzFj?=
 =?utf-8?B?L0pQeTVDWUM0RjhpcHNaNmVUZU5ZR2JiblRWdWJXTVVoNTdpSWFkcTB6bjdF?=
 =?utf-8?B?NTRzeDZyY0ZQRW85VE4zekRDNlFmVDV1UTVwc29TQ0lvWjNsWTNlaVYzZnRJ?=
 =?utf-8?B?MU1WQ1lZUFo2ektsbXlCR21va2ppbVdWVXN3M001d2l3Rk1SaS9naldlSHVT?=
 =?utf-8?B?MmovYVlGcUZWemNOWGpNWnpQQ21jRXA5RVRnOUhDa0dSU0s5NEo2b2dhNDdw?=
 =?utf-8?B?ZUlCQXFQWm1aeHJVc3VOZmlRbFQzWHRoMko1OTZqcVRzNVAyVVBscFRsQitR?=
 =?utf-8?B?cElOdW9XTWlHa2diTngvNXVkdS9PU3pRMk5JTGtaencwQXNtUkh6M1ZvTW1q?=
 =?utf-8?B?WXN3QUpWbXNPZFBUa202d1ZnOEZwMC9mV3ZpcWhqbEF0RTBnNERQdmpHcHFZ?=
 =?utf-8?B?OTl0QTE0NDNjU2FXZEdSVkUxdFNHYkxqd3IxNEJWc3pQN0hxS3R5RU5VRkdz?=
 =?utf-8?B?ZW5oVm10eWdvVjlneU85UFdRdENsRmo3ZzV1VnJsUkh1VUpOWWRLNlFwc3Fj?=
 =?utf-8?B?MFRBTzhXdkhBOEdWQ3BwdmpqY2VYTzY4dUpCdTFwOGZBTVdLMUl2TnBTRDJm?=
 =?utf-8?B?TlZiRHNLWEJMYlg3YUFuUlN1VXE0blhDeXFNbHZtbmFqR1lCK25XZCtwTTBT?=
 =?utf-8?B?dXdzdEZVYmZmK2dBMlFNaGJEQ0U3NGRXbjVXOHRRM2JSR2hqUE1rTVJYbmpj?=
 =?utf-8?B?M3lKd3BZUlJMOXpOa0ptQ0psai9oczBTd2pmS0s4WXBYcDgzNzNrRDdPeThq?=
 =?utf-8?B?aG9aa3QyaEl2OFJFSjU4RFRQM01ERkx6UlNpWWs4ajNMSXcya0xOanc5RlJp?=
 =?utf-8?B?dmpXU2NZa0FSd2I4TlI2bGV3Uk1ScW1mNjZqQlpJd0NqQk9vME10dHI0Yjh5?=
 =?utf-8?B?cFFWYk1PTjlmUnhmczBXQWtiQWRFeWVUZnYwc0FtWkEvNSt4S1l5cUNKMG44?=
 =?utf-8?B?TVV3YXMzMHE2Y0traFNQUkNudm1MbmZPS2RqUXBHYkRxMjdOWlBpdDZObXNR?=
 =?utf-8?B?N2g0dkxZN2FQZXc5a2oyV0dwRThBY3lOUmtaRlltS1B2RmtPMS9XVVRPbzBt?=
 =?utf-8?B?ZHhRZ05SSThhcXk5QWoxWm5SWTlyTU5TdkN4SFB2RlA5TXh4RFJUVHRSbkh5?=
 =?utf-8?B?a1lJV1d1TEE2aHNIZVJLSDNoMFpPUndhbUErMU5McHE0a2dKWFpGMy9ISVN4?=
 =?utf-8?B?ZVhXbS9nYktZMmVCUFA0SlhEeHlXRDQvcEZMalBmNk14N3ZYaTFsQnJYZU82?=
 =?utf-8?B?ZHFHVWkrd2l0RkV1UkNLNDhHZ2MvZHd0R1ptbHJLN1VGcVgvK3hIemhmcENx?=
 =?utf-8?B?V1FxZ21pYlZBb05NT0tpTEhCQmhDS0RlYm9ORU9uanN6VjZiRWZwVEtsRytT?=
 =?utf-8?B?OHdDanpodFNlbWJHZCthZnVyOXpsclBUUS9vVkdKZ1gyVklCeVhNSkNqN2du?=
 =?utf-8?B?VkcyRXNRNXhtYTFtTGc0VTAySERxdjFtV0twVVVhVlhoY08vYitwN1pEdFFP?=
 =?utf-8?B?eUEwY1JJUk9kanlxb2ZOM0lIOXF1MDFlRWRoajJ0NFRHa3dscFRiWW8yV0Nx?=
 =?utf-8?B?YXl3RXJuQUNybVc4U210MnFpTDhwT3ZjMzlncmxscHBueHlVWkFpdGVDdFFt?=
 =?utf-8?B?eExDcEFhSmxvVnNsalJ1aExIYXQxZ2hxdnhjelNrSWM1SEZSeHNtdVU2SFJV?=
 =?utf-8?B?dDZ0SGtrNTl1OGdPUUlraXkwYnhrejRPcStBL1lqalphcXNoS2h4MkxHaEhJ?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f06635-7da2-43e4-f9d0-08ddcac2721c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 14:57:44.5680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITRxTeO/OgmfznpjQgrzHrVrXiMdmtsJYAm1J4BchfxNswsrW2vaqH/yS436+2fttRbdvNpEVjqORgEkCvX2GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6159
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_075828_415919_2DAECF7C 
X-CRM114-Status: GOOD (  13.35  )
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

T24gMjQvMDcvMjAyNSAxNzozMywgRGllZGVyaWsgZGUgSGFhcyB3cm90ZToKPiBIaSBBZHJpYW4s
Cj4gCj4gT24gV2VkIEp1bCAyMywgMjAyNSBhdCA3OjMzIEFNIENFU1QsIEFkcmlhbiBIdW50ZXIg
d3JvdGU6Cj4+IE9uIDIyLzA3LzIwMjUgMjE6MzMsIFJvYmluIE11cnBoeSB3cm90ZToKPj4+IEEg
Yml0IGxhdGUgZm9yIGEgInJldmlldyIsIGJ1dCBEaWVkZXJpayBhbmQgSSBoYXZlIGp1c3QgYmVl
bgo+Pj4gSVJDLWRlYnVnZ2luZyBhIGNyYXNoIG9uIFJLMzU2OCB3aGljaCBieSBpbnNwZWN0aW9u
IHNlZW1zIHRvIGJlIGNhdXNlZAo+Pj4gYnkgdGhpcyBwYXRjaDoKPj4+Cj4+PiBPbiAyMDI0LTA4
LTA1IDEwOjE3IGFtLCBDaGVuIFdhbmcgd3JvdGU6Cj4+Pj4gRnJvbTogQ2hlbiBXYW5nIDx1bmlj
b3JuX3dhbmdAb3V0bG9vay5jb20+Cj4+Pj4KPj4+PiBJbiBhZGRpdGlvbiB0byB0aGUgcmVxdWly
ZWQgY29yZSBjbG9jayBhbmQgb3B0aW9uYWwKPj4+PiBidXMgY2xvY2ssIHRoZSBzb2Mgd2lsbCBl
eHBhbmQgaXRzIG93biBjbG9ja3MsIHNvCj4+Pj4gdGhlIGJ1bGsgY2xvY2sgbWVjaGFuaXNtIGlz
IGFic3RyYWN0ZWQuCj4+Pj4KPj4+PiBOb3RlLCBJIGNhbGwgdGhlIGJ1bGsgY2xvY2tzIGFzICJv
dGhlciBjbG9ja3MiIGR1ZQo+Pj4+IHRvIHRoZSBidXMgY2xvY2sgaGFzIGJlZW4gY2FsbGVkIGFz
ICJvcHRpb25hbCIuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFdhbmcgPHVuaWNvcm5f
d2FuZ0BvdXRsb29rLmNvbT4KPj4+PiBUZXN0ZWQtYnk6IERyZXcgRnVzdGluaSA8ZHJld0BwZHA3
LmNvbT4gIyBUSDE1MjAKPj4+PiBUZXN0ZWQtYnk6IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBv
dXRsb29rLmNvbT4gIyBEdW8gYW5kIEh1YXNoYW4gUGkKPj4+PiAtLS0KPj4+IFsuLi5dCj4+Pj4g
K3N0YXRpYyBpbnQgZHdjbXNoY19nZXRfZW5hYmxlX290aGVyX2Nsa3Moc3RydWN0IGRldmljZSAq
ZGV2LAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVj
dCBkd2Ntc2hjX3ByaXYgKnByaXYsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaW50IG51bV9jbGtzLAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNvbnN0IGNoYXIgKiBjb25zdCBjbGtfaWRzW10pCj4+Pj4gK3sKPj4+
PiArwqDCoMKgIGludCBlcnI7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgaWYgKG51bV9jbGtzID4gRFdD
TVNIQ19NQVhfT1RIRVJfQ0xLUykKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7
Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgZm9yIChpbnQgaSA9IDA7IGkgPCBudW1fY2xrczsgaSsrKQo+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBwcml2LT5vdGhlcl9jbGtzW2ldLmlkID0gY2xrX2lkc1tpXTsK
Pj4+PiArCj4+Pj4gK8KgwqDCoCBlcnIgPSBkZXZtX2Nsa19idWxrX2dldF9vcHRpb25hbChkZXYs
IG51bV9jbGtzLCBwcml2LT5vdGhlcl9jbGtzKTsKPj4+Cj4+PiBUaGlzIGxlYXZlcyBhIHBvaW50
ZXIgaW50byAicHJpdiIgaW4gdGhlIGRldnJlcyBsaXN0Li4uCj4+Pgo+Pj4+ICvCoMKgwqAgaWYg
KGVycikgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgImZhaWxlZCB0byBnZXQg
Y2xvY2tzICVkXG4iLCBlcnIpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gZXJyOwo+Pj4+
ICvCoMKgwqAgfQo+Pj4+ICsKPj4+PiArwqDCoMKgIGVyciA9IGNsa19idWxrX3ByZXBhcmVfZW5h
YmxlKG51bV9jbGtzLCBwcml2LT5vdGhlcl9jbGtzKTsKPj4+PiArwqDCoMKgIGlmIChlcnIpCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGVuYWJsZSBjbG9ja3Mg
JWRcbiIsIGVycik7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgcHJpdi0+bnVtX290aGVyX2Nsa3MgPSBu
dW1fY2xrczsKPj4+PiArCj4+Pj4gK8KgwqDCoCByZXR1cm4gZXJyOwo+Pj4+ICt9Cj4+Pj4gKwo+
Pj4+IMKgIC8qCj4+Pj4gwqDCoCAqIElmIERNQSBhZGRyIHNwYW5zIDEyOE1CIGJvdW5kYXJ5LCB3
ZSBzcGxpdCB0aGUgRE1BIHRyYW5zZmVyIGludG8gdHdvCj4+Pj4gwqDCoCAqIHNvIHRoYXQgZWFj
aCBETUEgdHJhbnNmZXIgZG9lc24ndCBleGNlZWQgdGhlIGJvdW5kYXJ5Lgo+Pj4gWy4uLl0KPj4+
PiBAQCAtMTI4MCw5ICsxMzAwLDcgQEAgc3RhdGljIGludCBkd2Ntc2hjX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+Pj4gwqAgZXJyX2NsazoKPj4+PiDCoMKgwqDCoMKgIGNs
a19kaXNhYmxlX3VucHJlcGFyZShwbHRmbV9ob3N0LT5jbGspOwo+Pj4+IMKgwqDCoMKgwqAgY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKHByaXYtPmJ1c19jbGspOwo+Pj4+IC3CoMKgwqAgaWYgKHJrX3By
aXYpCj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGNsa19idWxrX2Rpc2FibGVfdW5wcmVwYXJlKFJLMzV4
eF9NQVhfQ0xLUywKPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmtfcHJpdi0+cm9ja2NoaXBfY2xrcyk7Cj4+Pj4gK8KgwqDCoCBjbGtfYnVsa19kaXNh
YmxlX3VucHJlcGFyZShwcml2LT5udW1fb3RoZXJfY2xrcywgcHJpdi0+b3RoZXJfY2xrcyk7Cj4+
Pj4gwqAgZnJlZV9wbHRmbToKPj4+PiDCoMKgwqDCoMKgIHNkaGNpX3BsdGZtX2ZyZWUocGRldik7
Cj4+Pgo+Pj4gLi4uYnV0IHVwb24sIHNheSwgLUVQUk9CRV9ERUZFUiBmcm9tIHNkaGNpX3NldHVw
X2hvc3QoKSBiZWNhdXNlIGEKPj4+IHJlZ3VsYXRvciBpc24ndCByZWFkeSB5ZXQsIHRoYXQgInBy
aXYiIGlzIGZyZWVkIGhlcmUsIHNvIGJ5IHRoZSB0aW1lIHRoZQo+Pj4gZGV2cmVzIGNhbGxiYWNr
cyBldmVudHVhbGx5IHJ1biwgdGhhdCAiZGV2cmVzLT5jbGtzIiBwb2ludGVyIHdoaWNoIHVzZWQK
Pj4+IHRvIHJlcHJlc2VudCAicHJpdi0+b3RoZXJfY2xvY2tzIiBwb2ludHMgdG8gd2hvIGtub3dz
IHdoYXQsIGFuZCB0aGlzCj4+PiBzb3J0IG9mIHRoaW5nIGhhcHBlbnM6Cj4+Pgo+Pj4gW8KgwqAg
MTIuNDcwODI3XSBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0
dWFsIGFkZHJlc3MgMDAyZGY3YjM3ODkxNzY2NAo+Pj4gW8KgwqAgMTIuNDcyMTA0XSBNZW0gYWJv
cnQgaW5mbzoKPj4+IFvCoMKgIDEyLjQ3MjQ3MV3CoMKgIEVTUiA9IDB4MDAwMDAwMDA5NjAwMDAw
NAo+Pj4gW8KgwqAgMTIuNDc1OTkxXcKgwqAgRUMgPSAweDI1OiBEQUJUIChjdXJyZW50IEVMKSwg
SUwgPSAzMiBiaXRzCj4+PiBbwqDCoCAxMi40NzY2NTddwqDCoCBTRVQgPSAwLCBGblYgPSAwCj4+
PiBbwqDCoCAxMi40NzcxNDZdwqDCoCBFQSA9IDAsIFMxUFRXID0gMAo+Pj4gW8KgwqAgMTIuNDc3
NTQ3XcKgwqAgRlNDID0gMHgwNDogbGV2ZWwgMCB0cmFuc2xhdGlvbiBmYXVsdAo+Pj4gW8KgwqAg
MTIuNDc4MTI3XSBEYXRhIGFib3J0IGluZm86Cj4+PiBbwqDCoCAxMi40NzgxMjZdIHJvY2tjaGlw
LWdwaW8gZmRkNjAwMDAuZ3BpbzogcHJvYmVkIC9waW5jdHJsL2dwaW9AZmRkNjAwMDAKPj4+IFvC
oMKgIDEyLjQ3ODQxM13CoMKgIElTViA9IDAsIElTUyA9IDB4MDAwMDAwMDQsIElTUzIgPSAweDAw
MDAwMDAwCj4+PiBbwqDCoCAxMi40Nzk4MjZdwqDCoCBDTSA9IDAsIFduUiA9IDAsIFRuRCA9IDAs
IFRhZ0FjY2VzcyA9IDAKPj4+IFvCoMKgIDEyLjQ4MDQxOF3CoMKgIEdDUyA9IDAsIE92ZXJsYXkg
PSAwLCBEaXJ0eUJpdCA9IDAsIFhzID0gMAo+Pj4gW8KgwqAgMTIuNDgxMjgyXSBbMDAyZGY3YjM3
ODkxNzY2NF0gYWRkcmVzcyBiZXR3ZWVuIHVzZXIgYW5kIGtlcm5lbCBhZGRyZXNzIHJhbmdlcwo+
Pj4gW8KgwqAgMTIuNDgyNDIxXSBJbnRlcm5hbCBlcnJvcjogT29wczogMDAwMDAwMDA5NjAwMDAw
NCBbIzFdwqAgU01QCj4+PiBbwqDCoCAxMi40ODI5ODBdIE1vZHVsZXMgbGlua2VkIGluOiBzZGhj
aV9vZl9kd2Ntc2hjIGRybV9kcF9hdXhfYnVzIGdwaW9fcm9ja2NoaXAoKykgZHJtX2Rpc3BsYXlf
aGVscGVyIGR3X21tY19yb2NrY2hpcCBkcm1fY2xpZW50X2xpYiBzZGhjaV9wbHRmbSBkcm1fZG1h
X2hlbHBlciBmd25vZGVfbWRpbyBzZGhjaSBkd19tbWNfcGx0Zgo+Pj4gbSBsaWJwaHkgZml4ZWQg
cm9ja2NoaXBfZGZpIGRybV9rbXNfaGVscGVyIGNxaGNpIHBsMzMwKCspIHBoeV9yb2NrY2hpcF9u
YW5lbmdfY29tYnBoeSBkd193ZHQgcGh5X3JvY2tjaGlwX3NucHNfcGNpZTMgcGh5X3JvY2tjaGlw
X2lubm9fdXNiMiBkd19tbWMgbWRpb19idXMgZHdjMyBlaGNpX3BsYXRmb3JtIG9oY2lfcGxhdGZv
cm0KPj4+IGVoY2lfaGNkIGRybSBvaGNpX2hjZCB1ZGNfY29yZSBpb19kb21haW4gaTJjX3JrM3gg
dXNiY29yZSB1bHBpIHVzYl9jb21tb24KPj4+IFvCoMKgIDEyLjQ4Njg3MV0gQ1BVOiAwIFVJRDog
MCBQSUQ6IDY0IENvbW06IGt3b3JrZXIvdTE2OjMgTm90IHRhaW50ZWQgNi4xNi1yYzctYXJtNjQt
Y2tub3cgIzEgUFJFRU1QVExBWlnCoCBEZWJpYW4gNi4xNn5yYzctMQo+Pj4gW8KgwqAgMTIuNDg3
OTAxXSBIYXJkd2FyZSBuYW1lOiBGcmllbmRseUVsZWMgTmFub1BpIFI1UyAoRFQpCj4+PiBbwqDC
oCAxMi40ODg0MTJdIFdvcmtxdWV1ZTogYXN5bmMgYXN5bmNfcnVuX2VudHJ5X2ZuCj4+PiBbwqDC
oCAxMi40ODg4NzldIHBzdGF0ZTogNjA0MDAwMDkgKG5aQ3YgZGFpZiArUEFOIC1VQU8gLVRDTyAt
RElUIC1TU0JTIEJUWVBFPS0tKQo+Pj4gW8KgwqAgMTIuNDg5NTM5XSBwYyA6IF9fY2xrX3B1dCsw
eDJjLzB4MTM4Cj4+PiBbwqDCoCAxMi40ODk5MTNdIGxyIDogX19jbGtfcHV0KzB4MmMvMHgxMzgK
Pj4+IFvCoMKgIDEyLjQ5MDI4MV0gc3AgOiBmZmZmODAwMDgwNzEzYjEwCj4+PiBbwqDCoCAxMi40
OTA2MDddIHgyOTogZmZmZjgwMDA4MDcxM2IxMCB4Mjg6IGZmZmYwMDAxZjAwMWExMjAgeDI3OiAw
MDAwMDAwMDAwMDAwMDAwCj4+PiBbwqDCoCAxMi40OTEzMDJdIHgyNjogZmZmZjAwMDFmOThlMDFh
MCB4MjU6IDAwMDAwMDAwMDAwMDAwMDAgeDI0OiBmZmZmMDAwMWYwZjM1NDA4Cj4+PiBbwqDCoCAx
Mi40OTE5OTVdIHgyMzogZmZmZmE4ZGExOTliNGI0MCB4MjI6IGZmZmY4MDAwODA3MTNiYjAgeDIx
OiBmZmZmMDAwMWYwZjM1MDEwCj4+PiBbwqDCoCAxMi40OTI2ODldIHgyMDogZmZmZjAwMDFmOTRh
YWZkMCB4MTk6IDBhMmRmN2IzNzg5MTc2MzQgeDE4OiAwMDAwMDAwMGZmZmZmZmZmCj4+PiBbwqDC
oCAxMi40OTMzODFdIHgxNzogM2Q0ZDQ1NTQ1MzU5NTM0MiB4MTY6IDU1NTMwMDMwNzA3NTY1NmIg
eDE1OiBmZmZmMDAwMWY0ODg1NjUwCj4+PiBbwqDCoCAxMi40OTQwNzVdIHgxNDogMDAwMDAwMDAw
MDAwMDAwMCB4MTM6IGZmZmYwMDAxZjAyNWI4MTAgeDEyOiAwMDAwMDAwMDAwMDA4MDAwCj4+PiBb
wqDCoCAxMi40OTQ3NjVdIHgxMTogZmZmZmE4ZGExYTczZWY5OCB4MTA6IGZmZmZhOGRhMWE0NjAw
MDAgeDkgOiAwMDAwMDAwMDAwMDAwMDc4Cj4+PiBbwqDCoCAxMi40OTU0NTRdIHg4IDogMDAwMDAw
MDAwMDAwMDA0OSB4NyA6IGZmZmZhOGRhMThjMmZiZTAgeDYgOiAwMDAwMDAwMDAwMDAwMDAxCj4+
PiBbwqDCoCAxMi40OTYxNDVdIHg1IDogMDAwMDAwMDAwMDAwMDAwNCB4NCA6IDAwMDAwMDAwNmNi
NmJiNjMgeDMgOiAwMDAwMDAwMDAwMDAwMDAwCj4+PiBbwqDCoCAxMi40OTY4MzNdIHgyIDogMDAw
MDAwMDAwMDAwMDAwMCB4MSA6IGZmZmYwMDAxZjEzNjVhYzAgeDAgOiAwMDAwMDAwMDAwMDAwMDAx
Cj4+PiBbwqDCoCAxMi40OTc1MjRdIENhbGwgdHJhY2U6Cj4+PiBbwqDCoCAxMi40OTc3NzZdwqAg
X19jbGtfcHV0KzB4MmMvMHgxMzggKFApCj4+PiBbwqDCoCAxMi40OTgxNTRdwqAgY2xrX3B1dCsw
eDE4LzB4MzAKPj4+IFvCoMKgIDEyLjQ5ODQ3MV3CoCBjbGtfYnVsa19wdXQrMHg0MC8weDY4Cj4+
PiBbwqDCoCAxMi40OTg4MjVdwqAgZGV2bV9jbGtfYnVsa19yZWxlYXNlKzB4MjQvMHg0MAo+Pj4g
W8KgwqAgMTIuNDk5MjQ4XcKgIHJlbGVhc2Vfbm9kZXMrMHg2NC8weGEwCj4+PiBbwqDCoCAxMi40
OTk2MDhdwqAgZGV2cmVzX3JlbGVhc2VfYWxsKzB4OTgvMHhmOAo+Pj4gW8KgwqAgMTIuNTAwMDA0
XcKgIGRldmljZV91bmJpbmRfY2xlYW51cCsweDIwLzB4NzAKPj4+IFvCoMKgIDEyLjUwMDQyNl3C
oCByZWFsbHlfcHJvYmUrMHgxZTgvMHgzYTAKPj4+IFvCoMKgIDEyLjUwMDc5M13CoCBfX2RyaXZl
cl9wcm9iZV9kZXZpY2UrMHg4NC8weDE2MAo+Pj4gW8KgwqAgMTIuNTAxMjI1XcKgIGRyaXZlcl9w
cm9iZV9kZXZpY2UrMHg0NC8weDEyOAo+Pj4gW8KgwqAgMTIuNTAxNjQwXcKgIF9fZHJpdmVyX2F0
dGFjaF9hc3luY19oZWxwZXIrMHg1Yy8weDEwOAo+Pj4gW8KgwqAgMTIuNTAyMTI1XcKgIGFzeW5j
X3J1bl9lbnRyeV9mbisweDQwLzB4MTgwCj4+PiBbwqDCoCAxMi41MDI1MzVdwqAgcHJvY2Vzc19v
bmVfd29yaysweDIzYy8weDY0MAo+Pj4gW8KgwqAgMTIuNTAyOTM5XcKgIHdvcmtlcl90aHJlYWQr
MHgxYjQvMHgzNjAKPj4+IFvCoMKgIDEyLjUwMzMxNV3CoCBrdGhyZWFkKzB4MTUwLzB4MjUwCj4+
PiBbwqDCoCAxMi41MDM2NDZdwqAgcmV0X2Zyb21fZm9yaysweDEwLzB4MjAKPj4+IFvCoMKgIDEy
LjUwNDAxNV0gQ29kZTogYWEwMDAzZjMgYjE0MDA0MWYgNTQwMDA2YzggOTdmZmQ5YzQgKGI5NDAz
MjYwKQo+Pj4gW8KgwqAgMTIuNTA0NTk4XSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAw
IF0tLS0KPj4+Cj4+Pgo+Pj4gVEJIIEknbSBub3Qgc3VyZSB3aGF0IHRvIGRvIGFzIGEgc3RyYWln
aHQgcmV2ZXJ0IHNlZW1zIGltcHJhY3RpY2FsIGJ5Cj4+PiBub3csIHNvIHdlIGhvcGUgc29tZW9u
ZSBlbHNlIG1pZ2h0IGhhdmUgYSBnb29kIGlkZWEuCj4+Cj4+IFByZXN1bWFibHkgdGhlIHByb2Js
ZW0gaGFzIGdvbmUgYXdheSB3aXRoOgo+Pgo+PiAJY29tbWl0IDkxYTAwMWExYTA3NDllNWQyNDYw
NmQ0NmFjNWRmZDQ0MzNjMDA5NTYKPj4gCUF1dGhvcjogQmluYmluIFpob3UgPHpob3ViaW5iaW5A
bG9vbmdzb24uY24+Cj4+IAlEYXRlOiAgIFNhdCBKdW4gNyAxNTozOTowMSAyMDI1ICswODAwCj4+
Cj4+IAkgICAgbW1jOiBzZGhjaS1vZi1kd2Ntc2hjOiBEcm9wIHRoZSB1c2Ugb2Ygc2RoY2lfcGx0
Zm1fZnJlZSgpCj4+Cj4+IHdoaWNoIGlzIGluIG5leHQuCj4+Cj4+IEluIHdoaWNoIGNhc2UgYSBz
ZXBhcmF0ZSBmaXggaXMgbmVlZGVkIGZvciBzdGFibGUuCj4gCj4gQWRkaW5nIHRoYXQgcGF0Y2gg
dG8gbXkgNi4xNi1yYzcga2VybmVsIGluZGVlZCBzdG9wcGVkIHRoZSBPT1BTaWVzLgo+IFRoYW5r
cyEKCllvdSBuZWVkIHRoZSBvdGhlciBwYXRjaGVzIHRoYXQgaXQgZGVwZW5kcyBvbiwgb3RoZXJ3
aXNlIHlvdSBhcmUKanVzdCBsZWFraW5nIHRoZSBtZW1vcnkuICBSZWZlcjoKCglodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvY292ZXIuMTc0OTEyNzc5Ni5naXQuemhvdWJpbmJpbkBsb29uZ3Nv
bi5jbi8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
