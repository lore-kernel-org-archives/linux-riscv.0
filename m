Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1988C021A9
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 00:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tJguKW7EkmLBJSEbyVA+Rvr6T1CoCxtPxaN4ERyf0X8=; b=q1w2HMBbDIaCky
	h9p0rlPtFbSP+xe30f5TCbwnSIJxxBLIxn5Nt5FMPdPvi/xsWj7It+PU/Vsj4uZH4lHXKW1Qjdy+x
	iPFDX2eIL9CSAQ4aHXndNaDd2R4h3d24P2OLBMNVl7zOR0VoTlkr3oKzsAXulRNaso1jU39yPYL3M
	v//keNWR8UssOdY9ezfZ7i0GyIv9bgCnpDsfxbqrKTvTpdLLEv9Ccuau83KTVGOsbIp0LzjkQml/L
	E3QfWL3c8imEhdfTaA0bRM0RFQghoy//umOb0EBY4v+WUnUdyjkOUkZSD0QeJ7t9tO8kdUb24QYAB
	/U/ch1wNvuyy0d/Nx48A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBeD-00000006LtX-3C9M;
	Tue, 18 Feb 2025 00:39:37 +0000
Received: from [192.198.163.13] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBeA-00000006LsQ-1YjD
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 00:39:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739839174; x=1771375174;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4vm2P/r/uOvEJ5aEyEuMCH3uda8EPMQFjEqJqmIETNQ=;
  b=a7tUw487YA+OiGfeA7bXmWeVgAvsv2vM9uH7QuGSW9Dmf8OIYMQpI9Qo
   +QvgnmnseID5TonFVVFcmcGuQSBKavf4coMVT8Ho6ZmMiDpPP+NRYIYTb
   4841s2uqRhgk9PXDGerci7m3D5N8sKvhMbjdWWrkP6uMPTO/uZ+TPGySD
   iKc3erCT1Joh8o4r3zQkotQp5AcfUwZAgvqRsib6waZPjCsKo7UCEY8wb
   RMmW3OG5eZH2FwJq175i1g6DFfY4TtWnh2OpunJbCV7huN2fzStcQdyXy
   C8VFkho42qeTjmjJqOG6NAtmb4jZnYcc128rD082cnexs1z4GbGhYrTyE
   g==;
X-CSE-ConnectionGUID: q25B3VRqQVm/0b7BGKPodA==
X-CSE-MsgGUID: 27xIKjPtSBixq+3GAEZ9Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="43354658"
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="43354658"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 16:39:33 -0800
X-CSE-ConnectionGUID: p5DwMHdCT+KDzz8bfNS2/g==
X-CSE-MsgGUID: 13MOZszpSC+zVtwKKtY8lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137480533"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Feb 2025 16:39:33 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 17 Feb 2025 16:39:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 16:39:32 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 16:39:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkXEl0InrIKSIbcjEXUszToLYNf8P03sHmh8M+5ZhLg5dAuWf/c/1cOYuW/FOJ/4R53ZM3oDd2LHwe/1MYzY+FBxWouUGzYaT5CVj/26ca+fCOHNjxVG8iCgWduuhzQ/I2qpfmFgVo/sjrHJskRHTtLyG0A7+hgUIZ/hE8NP+hT8veAIXKII8ETzKde//0yWlFeDgP0AD5EChCYxRqVbTcaIs+f7O80RP+j/WQiRBDGum8xuPWVnYGnzn4ROcl+qa/CBF27EsfyP0FfQ2Ryexs8BXv18YjaLfLR6gIUczMxjas6C3YHQIUDZ7kxFTD+GlS7WVU6Runjbc52QkrUB2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfq6dzxsTDxmwn6YVZD0PMgWhVcgOvW5Dwb/tqWJSpo=;
 b=rVPiLV19ySuLuBLUJNIOVaxqCtv3HHXW6xJOLvUcmWd01EG37wfyTPoht7iz3LIoLyVXIEYeQxUSSCNQQBInNP9pz3wO8CwMU5vO39bNUIUDOe+KdC12gunlXv5K1uXlpiVqU1GnIZbXpEcJRrP8EFYJ2W8yu/VWxWTcADLC7ctnMBQdrCZyC7SZTYtTmC1wyZeBg/vqY5Vwzae2O0H0u3Cl0akYH0b0HY/Db3f1QqzwVyiO83qwUWFxSPzapWDyclaHNLrCv1F/atHfwJb9kJLcLPkXYLqsRzdrPk4qNGLGH176j+qKvKon+eQJ4P9kdjPJZ1jlrMvojBBTgeHwAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW3PR11MB4539.namprd11.prod.outlook.com (2603:10b6:303:2f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 00:39:30 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 00:39:30 +0000
Date: Tue, 18 Feb 2025 08:39:21 +0800
From: Philip Li <philip.li@intel.com>
To: David Laight <david.laight.linux@gmail.com>, Dan Carpenter
	<dan.carpenter@linaro.org>
CC: Alexandre Ghiti <alex@ghiti.fr>, Christoph Hellwig <hch@lst.de>, "kernel
 test robot" <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Carlos Maiolino <cem@kernel.org>, "Darrick J.
 Wong" <djwong@kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: fs/xfs/xfs_buf.c:1534 xfs_buf_submit_bio() warn: unsigned '_x'
 is never less than zero.
Message-ID: <Z7PWuSA4jtZnxp5J@rli9-mobl>
References: <202502171326.j4Xd3I0j-lkp@intel.com>
 <20250217092445.GA29568@lst.de>
 <a14347d2-6189-49bc-a1cc-e5959e76e6c2@ghiti.fr>
 <20250217131203.2657cc4b@pumpkin>
Content-Disposition: inline
In-Reply-To: <20250217131203.2657cc4b@pumpkin>
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW3PR11MB4539:EE_
X-MS-Office365-Filtering-Correlation-Id: 23580d80-4ab3-4c7c-daf2-08dd4fb4b4cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?y23Y+kbkYSs28spCSmVKxuGf+rKTNpvQkfNX4qOdzD5ZAoemJozLFiPRKJ?=
 =?iso-8859-1?Q?uMTz7lgEdeP6z4QyNZ6apzitVw4k4X/skQWhRarJAoeXHlHrr8oSvgKElk?=
 =?iso-8859-1?Q?vENuMrk+bPze1enEKgAuSWauBKOOInLzYLcESOqzW5Vaox8s0ZpNLtSbQf?=
 =?iso-8859-1?Q?E+dqiz0Jzq0gXb41Yawp9CvpLfa7Y770CwxNz4sd0yPfDDSsA+Ev+mBkos?=
 =?iso-8859-1?Q?tgwijJVOdv1PvoD6YAtvRlqXoPYq/GrRN5x0ZVF2aQuB7ZPV3hFwD3Bhse?=
 =?iso-8859-1?Q?W1jLVaumOhZrWrzgwjegGMv2LbjCwo4gpQtudO6dJmTHj3Q+5pN8V5GHxa?=
 =?iso-8859-1?Q?2CP55SbTcnd6gW554NVs8hVtpHnyWnQbB0zfaYrzipaO+VNgzpWhBdShXP?=
 =?iso-8859-1?Q?cEG2bhcgvIZ2LQwyQtW9R0vsue6VvVtY3jvsjXYgdjkZDcuMkXxB6lWlVk?=
 =?iso-8859-1?Q?6cJSOEQ4ra6+pgGG67VvkltIUcZtYA2dJW+6oangGl2Ix+u1CBtvsuo0CF?=
 =?iso-8859-1?Q?t4sa76g7lP/U170rx6MPwk+2Y+lR13pN/hdsSQt/V1xFw4/3sxoQRd6ZXq?=
 =?iso-8859-1?Q?C3FWKuTOLttexlTlvaAe7eJg/uP9yVLu65tEvqvy/4Gp+V0+69XO3dJlkN?=
 =?iso-8859-1?Q?dY6gskJ+43RovAFX6CkAzg+5sFPv3tErZWLgXNTXlwuThnrMoPwLDvFifX?=
 =?iso-8859-1?Q?UYU9y1mmJx1F+y6xMm3NtAR1OkEm62V4uLxUdNexmQb5vlciqdVwOq0xmk?=
 =?iso-8859-1?Q?7KnS1LwyM8uOpOuKUEMj2qk3byPWKhwWn4QIEbPFV6jgD+7WUDmL1xNzK7?=
 =?iso-8859-1?Q?WGKqq4MW1T5PKyopUgprzCIscn4MZNZqfKDrqf1Gb9X30ho8NIjIF19M1a?=
 =?iso-8859-1?Q?jfg4sTVKG6PW6+w/9HUn669O4Sp0NncdrtECWlvuiUiy1WpY/rtZaCI3wQ?=
 =?iso-8859-1?Q?5R5egGlF241RMO83HIPYE2LaFtBiJs8lQr0NJdbcdKIaUefsjrM6qfd/p4?=
 =?iso-8859-1?Q?cPC9uoEgEHu1VEDy4sJ4AB8ZaC6qym8ytQ1iT1heq66KywhzJMr1aqnYem?=
 =?iso-8859-1?Q?OHRqKE+zpinU2ZJek4Egg+IK+o3NiCONoPvdu34VgOpYTXrbVIjtqzwkbo?=
 =?iso-8859-1?Q?tHRUdp4XbXEsxu6anuK6WQGfGQqqMQ7higowWn/06rQr4FNTiPh3RfRRzg?=
 =?iso-8859-1?Q?UIrux8VZaiZ1LjMU2fi6Arh5SEOynf0i77JcNSAFMsk+OqVKRFu3irhxFB?=
 =?iso-8859-1?Q?s5C9R0EDOFTO60fMbWOa40UMARvqus2GRCZevlZ8bPP9tThlTEUztUVpMM?=
 =?iso-8859-1?Q?nM4pu/EB6zYHED+cR3PjY7WqMqItNehbAU1FDs3afOj9/xB8iWXaEtYn61?=
 =?iso-8859-1?Q?D+zcK5Uee6iE2ocqB66UOlpill2qQc0aAfu9GKZSP3SXAXLB0hJ0yZUUmn?=
 =?iso-8859-1?Q?iZAGHnf/eXFaxEtn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6N/6gfKcLFjJ0tBwXhcYFAeTHSK2uU3+3NrUmdnGpUFimM+JPoLr6fu9jA?=
 =?iso-8859-1?Q?9E1IlI47Oytw+eB6VFj2wTfCWxf3N+XIy2oIiWU4m8U95/CWjxxIJex2nM?=
 =?iso-8859-1?Q?Gp07IQ3Eq6u6E1/lOUkFcDzDUB/5U2hPwXwtr9liCcHwV4y69La3ptmuMX?=
 =?iso-8859-1?Q?ML98IyNZxK+VZKsBjfsNJj6VLG5c0wOORY76aqd1S9Lo3M2UtqdsyZQmR6?=
 =?iso-8859-1?Q?4MdbLZzAtcrszuufQhK7BvhAuESb1g+l7tXjfbGaTxepk4cRYocEjA7++f?=
 =?iso-8859-1?Q?Q+/zHK+7CblG6u8ecspPs2k6pj5hsblu724xhxUjA9/x9C6q9R1y4Svs2b?=
 =?iso-8859-1?Q?ovFk6frOLWbEz2Nixx+FJqSRfe3zbqu6IKihlzGM/F2OtgjFl4FmeXcPuJ?=
 =?iso-8859-1?Q?bPboapu4U29zOS2EOthmGjAnrdFHFRF0e7GykIk4d6CMb4vqHz2ga/71Pa?=
 =?iso-8859-1?Q?arpq2WJFeJGXAOiuKeVoYcSkXrdpER4jf3Wq56WTGcfIbot2PBVrJW80yu?=
 =?iso-8859-1?Q?vgW7C//cdTSaOxTpv+wvG2I+WpRG6Y5VZe3lMB75E/A4WjQm51Wz6fSLpC?=
 =?iso-8859-1?Q?W8BZqTPdKWc4ycQXr2XZRhp0t814bkEHrbUyCeNGrPUfIdzY23j8eHRRtK?=
 =?iso-8859-1?Q?KPy+8syFSZKKY5RTpXJXsU+w1ZP1P9n74carYFTWbBG4Lr/v5k5AsN4S8Z?=
 =?iso-8859-1?Q?H18+df8Ls+jHn7WkCRUA8pVNWvH5J+mMOTCRd/ZJ9xuuM2XNMXlmOzmZdR?=
 =?iso-8859-1?Q?Nw2bwzQMHEoY6F0o6pAjTtZN4sBYYd4ZcCR0BQ6btCs5+yxmH1aogwhtFh?=
 =?iso-8859-1?Q?ntXzBvSQn5zpSUCoL05tD7EGRFKppUgJKPgsGm1cdZpiHopICyN21XIY60?=
 =?iso-8859-1?Q?QalbDWQX7v/lNPMNMyAZrGOHmqaGEpPmb5t4nx+wcoHTiWaG2O0OKxmG4n?=
 =?iso-8859-1?Q?as1Kn3d7ZIN9sdol2FM9R1BZGFPz0OQAK6WZI/TWABtg9ZlbjpH7vJn0nA?=
 =?iso-8859-1?Q?EZgD/EoWn9aLUEsJiIAbc3OtvRN34fhIcGPNxP0q6gN9PCdFDPwNIUzfeu?=
 =?iso-8859-1?Q?XVQQg/kL7KWYgByxCfkANfgn6s7vzwVVOzVt/zxGkXpjI/aqSF7uhSuwMq?=
 =?iso-8859-1?Q?RmEaPdksBEPhxV4onB3wArD9btWKV3dNBJaIWAacldTWJbPIhkIattekhs?=
 =?iso-8859-1?Q?kNDmowVfGZQk+zsDCyabJFV7i9Z5ma1M2QE/6qC8rk5SyjNjY+ck74hn7B?=
 =?iso-8859-1?Q?YCp90yJYmxGBu4UwrmgqSL/d28O3qWe28W0qK+End0dLzTfRgnTpig6xrW?=
 =?iso-8859-1?Q?33+ywtFvHwhHK71kUadOUIB0Z7xAD9pa4o7gFlJmttRX9bfyvzubaHbtir?=
 =?iso-8859-1?Q?TsEXQjO6o9CtegIouNwtTZqm/0x3ZjbAgr7G42de77Vnv84x8SId53LDx/?=
 =?iso-8859-1?Q?hb2W199Ipg1zpC66OQdczQuMRkwpYzsSXqqycEz+VsGW3O89rNjEi/xnh4?=
 =?iso-8859-1?Q?TY5cgW+ZaLD1SjTatTGa5Z4ks87l/3hZgoXWvRS2kfU1rfcl8C8S+n2nZV?=
 =?iso-8859-1?Q?tWxV+bMDRLV6GsSduA4KfOHDeCdbmHTuxafqT9cL0megUt2AFDH4+TLdaS?=
 =?iso-8859-1?Q?bPbm3PXHV0s7QRWXrfAI3EpL4gdB4Pe7po?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23580d80-4ab3-4c7c-daf2-08dd4fb4b4cd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 00:39:30.5769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HfmMZIrX0QT4VKJe8J2fqCTu4WAR7OIAEDYBNg4e6IDTlAeoCbRxeu9wiCacNmSoVjGWSMMqYzuVxGPoNrxYwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4539
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_163934_425453_D897B83E 
X-CRM114-Status: GOOD (  18.29  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

+ Dan

Hi Dan,

On Mon, Feb 17, 2025 at 01:12:03PM +0000, David Laight wrote:
> On Mon, 17 Feb 2025 13:06:49 +0100
> Alexandre Ghiti <alex@ghiti.fr> wrote:
> =

> > Hi Christoph,
> > =

> > On 17/02/2025 10:24, Christoph Hellwig wrote:
> > > On Mon, Feb 17, 2025 at 01:53:08PM +0800, kernel test robot wrote:  =

> > >> New smatch warnings:
> > >> fs/xfs/xfs_buf.c:1534 xfs_buf_submit_bio() warn: unsigned '_x' is ne=
ver less than zero.  =

> > > Looks like this is an issue in the riscv virt_to_page implementation
> > > which also shows up in various other places.  Any chance this could g=
et
> > > fixed in the riscv code?  =

> > =

> > =

> > To me, the only test that could give rise to this warning is the last =

> > part of:
> > =

> > #define is_linear_mapping(x) \
> >  =A0=A0=A0=A0=A0=A0=A0 ((x) >=3D PAGE_OFFSET && (!IS_ENABLED(CONFIG_64B=
IT) || (x) < =

> > PAGE_OFFSET + KERN_VIRT_SIZE))
> > =

> > But given that the config is a 32-bit config, it should not be evaluate=
d =

> > at all.
> > =

> > Could that be a false-positive and then an issue in smatch?
> =

> Why is smatch even looking.
> The equivalent check in gcc has been moved to -W2 because of all false po=
sitives.

Can you help check this one?

Thanks

> =

> 	David
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
