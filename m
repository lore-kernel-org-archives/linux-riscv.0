Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C929EFF886F
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 23:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eLU36dDYuGZEoGrePy//jzbAdadlwsY9tmdbJ11R9+4=; b=GJOcYqiu5pRrWfotWvWpfpLUMi
	2M9VmVDx6IF6IhpAOSJ0AIKQu72Uxu/vsngijPqjw1Q47RbbsaohgmTND10uwypNx0iMBkOp07Le5
	PKc0wDaxY+JtqnQ48SeeJWlLyVMP1dXi+1KMAmy+Ff+4rxVrYepzXC7rO6C3iAIsyFrnmEiBR0Fc3
	f5eecizaOBJGk5rnbu/kY67MXwGb9L4edy2L3E8NDaVMRonFmCCK3Jxqsu/DYPz14WwsPv383Nle1
	AYP6iHQ3v4rJwwe3b8tLpDtHewMT6nlMak4tRZctgco5GBjWOWJFrU82D/TrlptpdGRyguEe8kpef
	U6BbNxCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIagO-0000000661o-00OM;
	Thu, 30 Apr 2026 23:20:36 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIagM-0000000661I-0qoc
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 23:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777591234; x=1809127234;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dRS3/mr9kCMBGYYIPoWnl+v1QIBR5K1zBtIMXu0mdOA=;
  b=lauanmGRBAiOBn1jOswKs/aT6jsoM/81x5wLLtiNXo29qolr2pVaSaKb
   sBebdIU7bKkamUEzM3c+iv9eBmGSeEsd0uV9RwXTqHKPmJM20UsMnyuyF
   zjSPKPLYrTY13vKDxaDkwEVaXTrqgntbWOM9yLAMVwCDAuB0hTT+b+ZaA
   EJAhcXHqXa5cbth8IsMq3m7BRpA3dhVL3/FmqXvH/M3qhdaV/k+huHYPC
   OThrMZKEw42pLjXUTLDlpIDpsvi34eM/3Vz6ZIhtBFtx1KyTTCjAlnIT+
   +p/sSrf5/u6X6zjsUSZifh06FGj8zspsekBv+6+GSdQl+pBJEOEsKXQ9V
   A==;
X-CSE-ConnectionGUID: V6KzW5akTIa8Be4dacCdGA==
X-CSE-MsgGUID: T4HlTtJzT/eHwxWhA6Qq1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78487157"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="78487157"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 16:20:33 -0700
X-CSE-ConnectionGUID: Gemlu5ngTm64BPKy4A+zHA==
X-CSE-MsgGUID: GnzWcTsESWWZyHysm0zm0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="239709066"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 16:20:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 16:20:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 16:20:30 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 16:20:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtKeZvatFKlhmlkZhYt6YSijGGOlaVd6RzPisqajRje4WYhMNh/7wDSmG5ivzVMdqJRFnzTTkO+QHAcUNMBtc3geNmmP5FOQOhQXxj8wBOSUSw4BxOX7NXB3F4lRN7BKWfu5JEyW0bUWC8/+cFq5iX59gMm2sBJWJKXJ9DVTH4e4oQVcAhgv4Y7UWk91ZBcspMQVvVwOdQ2s9s/pAceTyY1b2hza9oRhkieSuiEbo2J7mjqoqsvduFMuwY4x5PCNKs53mEQBTSP/S+ytS3R1KYjnws2Kl1tfR1yHvBPeo7lBWOpl4VuX87UMOfmVo3ibLAElK7rZRxEu10e4POf84A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3NGpooKeWJdRL1GGmLqOr44NeV+yYambF7HCBNKSPA=;
 b=DU4/mhIlTTNagg8sl6EdRX0El/1ZxyZRmgmxio2bpTZLsxisIfQkR47hcfFiJ2j28GCUPNpCJNSBb0m3TlmK9OP9sFGDWkrLRNSrzL3/ln3WazWnFvlNgYbLpTd6L/wL50d3hVyKXDknbrucvZ0WpTMxmFTyNYTDFbcW80WLAbVFTV/jaSdrwuBhqUCzw6kSiZvSC8DyAZcgDJ+XQUb9kl+PN7Ywh9OXf/zV3SbCxA7+OvmED8U6unJJ8YzrHy0aR61v84ZuVQiCMPxEk5XbWRXXBzlkOKTCgC42A1GuLmWs9TiWoHQZ75RY82+3qnc0k+7q6G1wP4bb/KOUU1+UHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by MW3PR11MB4651.namprd11.prod.outlook.com (2603:10b6:303:2c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 23:20:27 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%5]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 23:20:27 +0000
Message-ID: <4fa25edf-65eb-4ff6-bb52-a7087490e81d@intel.com>
Date: Thu, 30 Apr 2026 16:20:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 08/11] ACPI: PPTT: Add
 acpi_pptt_get_cache_size_from_id helper
To: Drew Fustini <fustini@kernel.org>, Paul Walmsley <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?=
	<rkrcmar@ventanamicro.com>, Samuel Holland <samuel.holland@sifive.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>, Nicolas Pitre
	<npitre@baylibre.com>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
	Atish Patra <atish.patra@linux.dev>, Atish Kumar Patra <atishp@rivosinc.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>, yunhui cui
	<cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, Liu Zhiwei
	<zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
	<guo.wenjia23@zte.com.cn>, Gong Shuai <gong.shuai@sanechips.com.cn>, "Gong
 Shuai" <gsh517@gmail.com>, <liu.qingtao2@zte.com.cn>, Tony Luck
	<tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, Peter Newman
	<peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, James Morse
	<james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, Dave Martin
	<Dave.Martin@arm.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Robert Moore
	<robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<x86@kernel.org>, <linux-acpi@vger.kernel.org>,
	<acpica-devel@lists.linux.dev>, <devicetree@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>
References: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-0-b3b2e7e9847a@kernel.org>
 <20260414-ssqosid-cbqri-rqsc-v7-0-v3-8-b3b2e7e9847a@kernel.org>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-8-b3b2e7e9847a@kernel.org>
X-ClientProxiedBy: MW4PR04CA0272.namprd04.prod.outlook.com
 (2603:10b6:303:89::7) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|MW3PR11MB4651:EE_
X-MS-Office365-Filtering-Correlation-Id: 816a1760-e867-454d-570e-08dea70f1052
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|22082099003|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info: sOA8bHoRE7vXXmDYbkM89h4SrlFXYwBwPwlbYmuHW0YnO0drfYsX1795Ld88BLDY4GY3KxDzjXFtyfwyblsMw/ti/N9xXhhbCcvQnijFxZHif2AA0JeZOrHgBzDr0OD85SeeV8A2NO0BVficx3pNfqeTt2ajbAGd7Dc/elOd0D851n7re/IkVId5nWOZlOQwCFiDNkq43kNxddoi7T9FyKAbvfr+C3XJtk6I7e320ib2LqSCgW+rTIJWdFMOLHjZ+eTB2eqCHWh9UsVS0AGiBBuXXCiFr5Evc5Vyj98TZNjEEVn7y0D+tBnvbHswDoOwe6lkwi1/p62OX4qhtIfkCVu5TDv85xx+WgnHBxt4VvUkS9uWdqNird9uOzuD4VUhyuwyb4dZ/PtQJ35McdNSYNxDiC2U+0KD/3W88EppwHsI9wyJqK9LcpZC3KGzfQr0BkoAJSsPU0Coa99JBbtGJ1ApvSa3DjjzHju3kuz/jNJbl4pn9iPcBQkuhdb5GS7Un57G9wT4D79mqMckds5vYgqKXoMabVwNQk75aiNWE2cX3KdjhlzVkdr7xhAtaGyV0fxFlk3n7adGpllr2nEwi9kh6lNcwas6z1r2HUtK0NdWmJFi+gtXRXzu8IQ7OW7CyzUtzv/WrI5CQpmTYG+oH37PDfeiHfAJgteWaetF/7HcG0rSABVKeSfOlPhEwCjL1rzJywhBsgErOgyPBu/Iz90+Vcf3ko9bSTOweeLtfgs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dldNZkZrbjQzWTJTc2UyaFptb3NocEp4eXQrRmFHaEtMWnNlM0ExSlR5NmRa?=
 =?utf-8?B?TjdZcGtLa2poeEYyVExxeEVpUUlOUjBuSUs2emlGdWpKV0V2SHVlajIvWG12?=
 =?utf-8?B?Tm1PaCtXZDdPbERCUWEwR3RnS3RrUWUyanMxY3RjdFUra1B0SGJMN2hPYTBn?=
 =?utf-8?B?VHVnNThEOUFFVFlzR24xL0JNL0ZUbkYyQWphczN1QktOMGNjS1lSNWlTV2ZT?=
 =?utf-8?B?OHFJOGFicUZqKzFBbnFwRU1NQ2wvdVV4ZisrUGdvRlp1d0huRVR1VHhDUkF1?=
 =?utf-8?B?blppTkFGL1dmQUxXc0NENHFya1dKMTI3OUVxTkVuaDRVVDlITDF2S2g1WGpi?=
 =?utf-8?B?UVV0RFcyODNYMDlpWFFEV2hFWnlxNHU1RmV4NEx5d1BhaVVmNjVUV3NnWjRm?=
 =?utf-8?B?VjlzYTdKUXF0MHZ0MDNlbDNXTUVsREVOU1NDMU9HVEZ1WG5rQlFUKzB0NGdW?=
 =?utf-8?B?dTg4blkza1FrVEpOYis2OFh0VHpmaXA3OHRvWXNNMmdlOWlBaHJOOHRmMFFi?=
 =?utf-8?B?SDhmbTVJU3hLTTIyNkFqRTVLNWVDZks3dTRjV1NPeW93UmJObDN3M0s2MnQv?=
 =?utf-8?B?YUIvU3RpTlBpQ0dKTWRSR05KcXRYdzIwNjJJVU11ZVlIS2pId2tVVjE5S3Zx?=
 =?utf-8?B?ODBEb1ZiVnRneVU0dk12UllwTWEyaGpRTEhURmdwNGdDODdpUE5HYkl1NTNa?=
 =?utf-8?B?cjdiVnZzMWxWY05SS1ZlcTV2STUwcWpZdDZWcFpLbWRRWTRBWmxVNFZWbHBw?=
 =?utf-8?B?VUQwNUlTY3ZqZ01nK1BjcWFMaVhQblJ1SjBOdjBsakVPaTlqSlZYR3pZLzRJ?=
 =?utf-8?B?eHVFeXd0MGlOcDcwbCt6ejhCSGxxeWVBaDBubUw3djh0WFlGVWFzV21uWnlU?=
 =?utf-8?B?SWFnSzZ0TlRiWVJKcFg3UEVDREI0bmV5QlhoU2NSSTZFVWgwWFQ3eE5LSjJE?=
 =?utf-8?B?VVpMSTZMS3VnU1VGYU9sMkVJVnMrSHNYcE8vNjY3RUJ0cHNEZEEvTFc2OEZZ?=
 =?utf-8?B?WTdna3RsVW1qWlA5RTJQZ1c5aUlWQzFMYlZNSWFoWFBVZ1pucEIwVzA1S0lP?=
 =?utf-8?B?c2JEb0hqODVVUnRaUldkcUlMajYxbm4yU3lmWFUvTmlmWmZxOFUxdktYcVln?=
 =?utf-8?B?SmphUW1vSnhaRHFLNTFBd3lWaUw3K3k3Y1ZCMDlkUnFSMDdYRUE0cnpYTENM?=
 =?utf-8?B?Y1ZOaktNWnFPU21qK0pzSHZlUGMyS0ZEMk11dGw5TVRIOTdHNW9QZG95WjBN?=
 =?utf-8?B?b250NE0vNHd6SmN3UmtPR3A3UkF3UHhzQ1dqVGFHSjR6Z1FIY3FMM1lXRVNI?=
 =?utf-8?B?ZXZsK2MzUEZsSFZhcnhmSm4zY2x5aGM4TWM4YTNkeGk2YTkxYXVCa1E1UVdn?=
 =?utf-8?B?NDVoTmtSQVpyWXJFL0NXVTI0bGFRV1B1R3paWjZnOHdDQlFBUVlJNW9RRDFS?=
 =?utf-8?B?QkRCMnpPVjNrWXV1dkw0T1liRUJBVVpYVlpkSEtTSWRYeFpKcUFjMlRKM1NN?=
 =?utf-8?B?dlBRWTh3eDVYbjEwYVFqaEFCZGJOVVlTczBiUEtZdEd3QzJ6YVRFWE1ZS1Nj?=
 =?utf-8?B?dkE4aWZTUGQ4bkpZTklSbUFSVVB3Q0ltSXVRdFhPOU9aTjhLTUJtL0xJd1JG?=
 =?utf-8?B?UU05Y2daaWJoc2k4RGxIZzBwUDZUTDV4RTJwNDlFREFjaTBtMXUrQnppaFAy?=
 =?utf-8?B?d2JHWGl6aW1OUjV4UUQyd1hJUUtnUVFjRWJhTlNScmVCMUdpYm5ab3FuNXkw?=
 =?utf-8?B?dlR0MC80Q3lZZVQyMERCcHNCRFFDczUxZWxEQ0hZWVRYbXFoVS81NS9MMDVP?=
 =?utf-8?B?a2h4ODVTQjFGYXV1UXBGYWl5NDhVcGRZRkJTd2lWZzJSNTY4TmNwSndUZVFM?=
 =?utf-8?B?Z0NTbFd6UlRDTndoNDJIUFdrUURNQ1paeDZLS3c2dFpOU09KWW9OcjRjaVhB?=
 =?utf-8?B?WjBybG1VVjBqL2lpLzFCUlVsRDM3UGZCT2xGWWdsdjArTFVLamxtTVA2eVY4?=
 =?utf-8?B?a2Jza3dvdVdMcmswZG5ydHlpb3JoNjdYY2tZUU9pV3U0Z0M2cTRvdGVzSjNY?=
 =?utf-8?B?M0wxT3VmYzhyNUVBeEZNNEpYRmg3dGs0SUtVbzBSN1M1aHI1ZUtWdjVQd3Bk?=
 =?utf-8?B?cjZLT2ZraGtNU0JpNjNPdSs0NjBoUDRRU1VSVEJGYnUvQjJobTQrUEtneU1E?=
 =?utf-8?B?QmxGWlE2NTNOWmJoRy80THdRZFUwUkdOME5PanBhZldGbUd3a2JnOHJXSjFO?=
 =?utf-8?B?c0dpMm1PNVhCRk00T2prQVlFeGhlVTIzQlNubm01eUVlc3lTTkMyWEZXK2NK?=
 =?utf-8?B?b3N5ZmpwUFB5SklHQ3hBd2RiS1RwQkZ5ckxuNkxiZTh0NjR3WkNSTmVJcy9m?=
 =?utf-8?Q?XpBnTX5NhNc/3u6A=3D?=
X-Exchange-RoutingPolicyChecked: g2yWmSjkdmoX1xUA72XsgfECBlmL9wJW9diUoC3KC8eCiKq1FwN0VpDBWLfZu2wt86ey+TCmF/1mLtQaDDfCW0SA1J8LZawE93ExvBcL6AE7ct0KshMU8zyD/f7UjVH53ITk/o3/Yfqml7CVaYSf6GS/7HX4YfdnkmPSlijOUHapUISy8DztLgolJHLy2B9fOMg62UT1pxJUGi8ymSdEqd6k3zDTQvs9WOT1MzmHvXDdCltvocYY25koH9tsu51Bdy/x3/BAgmS3aR80aKHXHOPtJlRqNT9xKuBHoUSmnw9UIt/6PksqPOHOHsHOoNtlreHWx2fQBXplu1BW7zdq8g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 816a1760-e867-454d-570e-08dea70f1052
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 23:20:27.4583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O7gSUZXYBvWAx5Wkflnv2Ye1Fq2B8hUY+nYXo4AHwTzndW89B1xQ7k8MrhJ84Z5ZTpPVqdJwQC2g07oKYjQ2EM+B00IcU+rKzTLNBl7vzjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4651
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_162034_297416_BBA15C4B 
X-CRM114-Status: GOOD (  10.12  )
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

Hi Drew,

On 4/14/26 6:54 PM, Drew Fustini wrote:
> Add helper to look up a cache's size from its cache ID in the PPTT
> table. This is needed by the RISC-V RQSC parser to determine the cache
> size for CBQRI capacity controllers.
> 
> The implementation follows the pattern established by
> find_acpi_cache_level_from_id() and acpi_pptt_get_cpumask_from_cache_id():
> uses acpi_get_pptt(), upgrade_pptt_cache(), checks all three cache types,
> and uses the do/while empty-detection loop.

I see how this helper is used to initialize cbqri_controller::cache::cache_size
but I am not able to determine where this value is used.
resctrl does need the cache size but it currently relies on struct cacheinfo returned
by the get_cpu_cacheinfo_level() helper to obtain it.

Reinette


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
