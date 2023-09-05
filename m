Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4003CC83F2C
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Sep 2023 14:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPXEgBAtWsyMKK8GDVHhQBSXb0kq8leI1YxUEMXUTW8=; b=NsMB6V7ZTCOuRS
	wWi73udxej5MijWsJJZVuStVMhcqWqu4A8pK05Da+GGpAnvo3m87STTpo6P4/wsomB5LxlfNtoVWc
	ZFmqNqTmQX9YMvVRghNQa7S2A4oIlVF4ZB1YSsyKKM5kDZG/VWxMvX6w3XFp6BAT+DGBlLLBouGCk
	SYF3um56m/QGptrgNOPEQ8zxckL2SSMy/S5x6chGCc0xKZTBk5GxOn7q8SyBF4sIqGfv7Z7dVfbCD
	8TCM2rZbA3P1M5xQuEb8dpKTrgEkUL1CmOozXT5o7/Rjbd4IMVTgqDvMi+4x4OGT+fnxVue16khxo
	WzyKrwSM3po1Tatn47tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdXC4-006CJ2-24;
	Tue, 05 Sep 2023 14:38:16 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdXC1-006CHg-26
	for linux-riscv@lists.infradead.org;
	Tue, 05 Sep 2023 14:38:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693924693; x=1725460693;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FHVSSVVjYYfJXU7AS46BCiZOeeoC2/tVCXuRxjvmpZI=;
  b=Ttn6qYbwegPpFwis1XabqFxTwAIulxz/b+uNdyicmpA4eQn0PDIBaUgS
   cOVfG3WIoMxZqr9ewi+g2Z9bx6kK9cfYfuSaBLabDQRI4nS3sToiD+mfL
   tkpcM93zZwgsPfeGsutqKzV/+3GpM6xIYsJ/e4Np1/ybprjFWFcBjqLNd
   ZOrf5IybHyPm5uXmjSqjgHSvjozXl36o8S1teqlTFwIMoa5Y2mZgqxb9c
   Q9hLoF90T51gyeaI6HvmQ+TRxVj12KKDDvHl91XZaYr6J6ox9rHex15tT
   aTk0ARhtGh79tTmIS4uAqpYtnl9qbnbSSUa6/T2PhVj8knEaJROkA90Vv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="357117480"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="357117480"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 07:37:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="734668226"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="734668226"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Sep 2023 07:36:48 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 07:36:47 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 07:36:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 07:36:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 07:36:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Msc88E4hHnZFTiN65nRc/iLOcfmbRoRpfVeZRSxwakZf2PqcNeBUe48pRsDsBwfm/8sHrW4c0BMfSluiJgr9KvPsrvqz4aA4rkXqwASyiNFuthN9L6+lthheFheySOj8FHRoXnfXLyTaZByGajZ0S2PlBP3SHLmLH2dLOJdnkRBTqMFY59wO6Uruxoikk+eiVELpwC22EWtJRGg7SM1hiNb6IuM8Gr4epaA1des0eBd2RpF9y2ijQnnc2z5TZ1Ey5FQ4wFDlKV+20RhNsC7+11F/lB+2/l0I78WjXr68DoTg1Z1yHXhgo5pPE8brAQsrSsm4dN3JLayAO1q89WxvOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2B30mzqvhSPbFXxXJXTrO1pw92sy8R8f8mnZGaSZlfE=;
 b=fsnPwq7/9qiWw6b/9E+Fr0rQAkAVNOTnYJCQhc9X4bTM8v5t4RN+EWQSk5ntq4CYMUE7hK57um7301wzshAoK9iIjQl1b9bpNrlgojOkgHldEaIqys7PTYaUUxtwEaR9EiFNtV+7ipjYv0coZP0VE1B5bGqx3ON2QprFj9Q5NfXpy6ZPr76Jp09jAufOb6josr0fXV8PQFX2+hGEmIe4P0mH6OFinDbYTAKpctiBopXP8gGJvlVXq1Nt85DbYfjwEmfwY+adlFgJ+rm1UvYfSOuxKUSR4yLTOFH3ley4TOw5wtQoElsrHE7QHj9yTnY/t3mwK2jt1MRZvKkU5OAqUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.33; Tue, 5 Sep 2023 14:36:45 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 14:36:45 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "evan@rivosinc.com" <evan@rivosinc.com>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"apatel@ventanamicro.com" <apatel@ventanamicro.com>
Subject: RE: [PATCH v3 6/6] RISC-V: selftests: Add CBO tests
Thread-Topic: [PATCH v3 6/6] RISC-V: selftests: Add CBO tests
Thread-Index: AQHZ31HW7vt06QjRE0u++TCPc9NhG7AMQ2Zw
Date: Tue, 5 Sep 2023 14:36:44 +0000
Message-ID: <DM8PR11MB5751158F177162EA71B6164AB8E8A@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20230904170220.167816-8-ajones@ventanamicro.com>
 <20230904170220.167816-14-ajones@ventanamicro.com>
In-Reply-To: <20230904170220.167816-14-ajones@ventanamicro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MW5PR11MB5764:EE_
x-ms-office365-filtering-correlation-id: 92b67359-41b8-43fc-45e1-08dbae1d8744
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LNGjS6z4r5Zjw10EVSU0JrXZhI6gIXq/q+KKCNsIvsZitrNuuCNSj12B9fIXReb1t9qB0Yxzjx38hTv9GNYu6ifetCTurWBsokL6G6WUOtnpXyMfE2shWZeZ36QCfYfb61qWGsbYRezeFns6/ZwKnLRUCu5y+mCHx9LeDHczVNF1FUTMX19dV1aNN5StCiSFunEsGRxgtVG2eugJSSKR/fGbwuaCzybt5V06sKWAzvN+pxSgfOA1HYov9uEhR5vZka7IjrzbbgvYMhReu1kJPCtdK1l44zp2tmCSb1sCj6JQXb5Jqf5NyIUUcMn2XgJ5m/g4BEnbl0P/feIK4Mqisks3yfdTb+/9y0PyiLCOf2xKOtTJjCZ89UzKEqCzg1yqUCdDifqmP5penFBzsti9n7yJJgJQplBPjpzmVMYKCbugXhkCsBbPq2YEs+1pGdk67oZZu1MQ7udWttfr/qGXDqZVzTtTOoWrxPJY8RtAlfNtPL/OHx+QTQxcwv24Y0uzPds8kPZ6KOOMDdjtSWZR9cR8LA7R9De2/C1EaUz29XSl+p63c29JBqdtRqeR59tzu7A1Rfz7YFeJeC8FrIZbgNOMmkEmiRnfFTmvgQJomUk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(376002)(346002)(366004)(1800799009)(186009)(451199024)(8936002)(5660300002)(8676002)(316002)(64756008)(66446008)(66476007)(54906003)(2906002)(110136005)(66556008)(66946007)(76116006)(4326008)(52536014)(41300700001)(53546011)(6506007)(7696005)(26005)(9686003)(55016003)(38070700005)(38100700002)(82960400001)(122000001)(71200400001)(966005)(478600001)(83380400001)(33656002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?EUDyochFpYRtNiuVKJUYuQ+zLcQ5jjGl5ufPKCXygr7mpCdYpWdcGopP?=
 =?Windows-1252?Q?lUn2kX4oSRQ/doV3ENK8M/zUTnwK1n6ouixincvqQBGWxAinLjmN4qTV?=
 =?Windows-1252?Q?xqhWeuOXl8wAfLQgZf9fara5CAeu81q17A4qWCG+8rB7+Ia/faoP99lI?=
 =?Windows-1252?Q?5++Z1D0IH5WmVPTCaQ3hm22G41nEmn85wFDT6DeNyBE2SIlc3sWD5vGz?=
 =?Windows-1252?Q?MjU3lQjQViRJWmP1kkRY84HTCkwAf2ZSUj/GkvkMaS5GM9nV/F3bLHF1?=
 =?Windows-1252?Q?OaFA3WFg1IVrJs8Ia/JP348H7+oKLP/m4NcPTuQo6QFW9LYlsqHHLY4J?=
 =?Windows-1252?Q?rqnFbt5Rw6xgTTMunA5MW3FZyJPXuHbgEcaEUls8bKk3KHzQMCaul3tu?=
 =?Windows-1252?Q?G/tSgDbJtKXoD1xVLUZeQoJySd2Enkx8FTpQ+6fr9mDuv+kzFzO8bvUq?=
 =?Windows-1252?Q?XsmUCSL/pHnew4SkAlo6034cBG+H3Cp8PrGVU42S6bylDgUqBsKRAKJ5?=
 =?Windows-1252?Q?Wvikehl7q9ov2mhHqGdKuo8WYxPCLquOfIhzW8qhq8UPjggv2Paap7+e?=
 =?Windows-1252?Q?FIdK3COOB5YHL4pEZ13TSVA51Uuq/mLGudkRjKpZNMYICZa67Htlq2zs?=
 =?Windows-1252?Q?DD8UKf89NMwetrBUbHLwAP/1uG4yCa1wTADM+ls3l1yUj7zqrbX5mLO1?=
 =?Windows-1252?Q?6r/br5fG/yuUjI3HoK/EqBfbRbzXxd8AljXFFjpqb7nAvwHZbffCQ6ga?=
 =?Windows-1252?Q?fSaQFvvze36YqBCltCWel2w485bzPyhjMtcs1ETfI+jSLIHMFqtg9d0S?=
 =?Windows-1252?Q?T5/TePXtYAvoNS9/IBBRTzbG1M0AtjXa+00BR4ob33utegrWopb5KU1r?=
 =?Windows-1252?Q?q5wWK6lm129R/WUJkpRcAIwgaJM+OmtJ2N8fzv9FOK9T1ave/MGdUD+O?=
 =?Windows-1252?Q?lNY93tEPCb2gKRxG3Ef1kvEgfzSCmjsSJe9zvAxGRivnHCSn8R+GXw6P?=
 =?Windows-1252?Q?Y9NmL+GFKz5hQpJ40i7/cS08sK0GaoM1BOAID2dDfJW3Qg4dNywZzXKw?=
 =?Windows-1252?Q?QExbRbUwCmy4vuOVX2pZMbW8jHmmwTFRPXGLBc4aFc8CnxxieLBPwBaN?=
 =?Windows-1252?Q?KUXdCtAoRBRLHXtorsW02HjJT2WPXOzM8r5mucTKK4cHWyDDvjCQQjdk?=
 =?Windows-1252?Q?2nLNT0lxTShvNtertMQPv0UePn1L97UyTMtSeeN5IEycv7d9ioJLokg7?=
 =?Windows-1252?Q?qtlqlokjvydgjr+4kXNYzPO5VzETuT51579Axv5afEdrpJWTlia6g1UA?=
 =?Windows-1252?Q?d+MmfKjkr79KKCwYpvvzWi2MKrbB//YQaz3vlUzV9aREZssDxaEet0KC?=
 =?Windows-1252?Q?mf8xF5BslFmG+GD3x5SjjJyMzNDXOJt3Q0r99OH6IIgKc6T2f2E31i1O?=
 =?Windows-1252?Q?8N2///55NG9nhVTIVRWbUe3VQp89oM0+hPI6kOYuEn2OFfvX2/8601bW?=
 =?Windows-1252?Q?fasYsaI1SneYPnIyCrWJ7Ek07xXSdXKe3wNSpKRgFHOliAjhe4TaYZwO?=
 =?Windows-1252?Q?QvDYCg47ga3yYG0upcOIVYmSdNFvEjNabiGeBluWgF/yt1ubURYNX2XH?=
 =?Windows-1252?Q?rB1AwwOn8BZtYUL/4RRfqRqEHOE+LmSRvpiRxa8vFzuaHKX8GUuEQ/1N?=
 =?Windows-1252?Q?D8+SEOyJ6bKgMKwWgxYq7QnVISO6j3Pl?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b67359-41b8-43fc-45e1-08dbae1d8744
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2023 14:36:44.9508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HDICcDQ7afDqS+6t3VDo8z2oVHokl9FWym98ei0BSVvt2944WxsNnL7GNhH0vm69Hgvots8ulEosShxxtqMN3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5764
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_073813_721624_83A83DC0 
X-CRM114-Status: GOOD (  28.42  )
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

Hi,

> -----Original Message-----
> From: linux-riscv <linux-riscv-bounces@lists.infradead.org> On Behalf Of
> Andrew Jones
> Sent: Tuesday, September 5, 2023 1:02 AM
> To: linux-riscv@lists.infradead.org
> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> aou@eecs.berkeley.edu; evan@rivosinc.com; conor.dooley@microchip.com;
> apatel@ventanamicro.com
> Subject: [PATCH v3 6/6] RISC-V: selftests: Add CBO tests
> 
> Add hwprobe test for Zicboz and its block size. Also, when Zicboz is
> present, test that cbo.zero may be issued and works. Additionally
> test that the Zicbom instructions cause SIGILL and also that cbo.zero
> causes SIGILL when Zicboz is not present. Pinning the test to a subset
> of cpus with taskset will also restrict the hwprobe calls to that set.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  .../testing/selftests/riscv/hwprobe/Makefile  |   7 +-
>  tools/testing/selftests/riscv/hwprobe/cbo.c   | 170 ++++++++++++++++++
>  .../testing/selftests/riscv/hwprobe/hwprobe.c |  12 +-
>  .../testing/selftests/riscv/hwprobe/hwprobe.h |  15 ++
>  4 files changed, 192 insertions(+), 12 deletions(-)
>  create mode 100644 tools/testing/selftests/riscv/hwprobe/cbo.c
>  create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.h
> 
> diff --git a/tools/testing/selftests/riscv/hwprobe/Makefile
> b/tools/testing/selftests/riscv/hwprobe/Makefile
> index 5f614c3ba598..f224b84591fb 100644
> --- a/tools/testing/selftests/riscv/hwprobe/Makefile
> +++ b/tools/testing/selftests/riscv/hwprobe/Makefile
> @@ -2,9 +2,14 @@
>  # Copyright (C) 2021 ARM Limited
>  # Originally tools/testing/arm64/abi/Makefile
> 
> -TEST_GEN_PROGS := hwprobe
> +CFLAGS += -I$(top_srcdir)/tools/include
> +
> +TEST_GEN_PROGS := hwprobe cbo
> 
>  include ../../lib.mk
> 
>  $(OUTPUT)/hwprobe: hwprobe.c sys_hwprobe.S
>  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> +
> +$(OUTPUT)/cbo: cbo.c sys_hwprobe.S
> +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c
> b/tools/testing/selftests/riscv/hwprobe/cbo.c
> new file mode 100644
> index 000000000000..50e85f31a2c7
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023 Ventana Micro Systems Inc.
> + *
> + * Run with 'taskset -c <cpu-list> cbo' to only execute hwprobe on a
> + * subset of cpus, as well as only executing the tests on those cpus.
> + */

Patch 3/6 exposes a common subset extensions of the cpu list to user space, so, if some of the cores support ZICBOZ while other don't, hwprobe() won't expose ZICBOZ ext, but in this case the cbo_zero insn might run w/o illegal insn exception when the task is scheduled to run on a core that support ZICBOZ. The test result may vary for each run for this case.
Maybe we can add some comment for this special test case?

> +#define _GNU_SOURCE
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <sched.h>
> +#include <signal.h>
> +#include <assert.h>
> +#include <linux/compiler.h>
> +#include <asm/ucontext.h>
> +
> +#include "hwprobe.h"
> +#include "../../kselftest.h"
> +
> +#define MK_CBO(fn) ((fn) << 20 | 10 << 15 | 2 << 12 | 0 << 7 | 15)
> +
> +static char mem[4096] __aligned(4096) = { [0 ... 4095] = 0xa5 };
> +
> +static bool illegal_insn;
> +
> +static void sigill_handler(int sig, siginfo_t *info, void *context)
> +{
> +	unsigned long *regs = (unsigned long *)&((ucontext_t *)context)-
> >uc_mcontext;
> +	uint32_t insn = *(uint32_t *)regs[0];
> +
> +	assert(insn == MK_CBO(regs[11]));


The byte order of insn should always be little endian, while the CPU may be a big-endian one, then the check might fail.
Maybe we can use __le32_to_cpu(insn) to convert it before the check.

BRs,
Xiao

> +
> +	illegal_insn = true;
> +	regs[0] += 4;
> +}
> +
> +static void cbo_insn(char *base, int fn)
> +{
> +	uint32_t insn = MK_CBO(fn);
> +
> +	asm volatile(
> +	"mv	a0, %0\n"
> +	"li	a1, %1\n"
> +	".4byte	%2\n"
> +	: : "r" (base), "i" (fn), "i" (insn) : "a0", "a1", "memory");
> +}
> +
> +static void cbo_inval(char *base) { cbo_insn(base, 0); }
> +static void cbo_clean(char *base) { cbo_insn(base, 1); }
> +static void cbo_flush(char *base) { cbo_insn(base, 2); }
> +static void cbo_zero(char *base)  { cbo_insn(base, 4); }
> +
> +static void test_no_zicbom(void)
> +{
> +	illegal_insn = false;
> +	cbo_clean(&mem[0]);
> +	ksft_test_result(illegal_insn, "No cbo.clean\n");
> +
> +	illegal_insn = false;
> +	cbo_flush(&mem[0]);
> +	ksft_test_result(illegal_insn, "No cbo.flush\n");
> +
> +	illegal_insn = false;
> +	cbo_inval(&mem[0]);
> +	ksft_test_result(illegal_insn, "No cbo.inval\n");
> +}
> +
[...]
> --
> 2.41.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
