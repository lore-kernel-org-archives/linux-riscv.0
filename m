Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E972CE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 05:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/nOBxYsS4DB8j9kbgpHXcJFsM//pYdP4cXVbF+aMtng=; b=VmNBhTOr5iCjEl
	+AXMKq5DoRwvwRvuxMDCp4KcTA0+OLXbHMynhI46UB2xwwZptzfXTul5sTglSfLQpDRDjyUTmVram
	/t3IlGnzsytiIl2kF3uhDnf5Y7KmLCnACrKxPuv6D47A84GjKXlYBuDCGOMx/RhfwAsXSBw6n8eLd
	Rkbl7aC1DleK9kIipFO8N+z0Rw43U2I6XPR44zjwUXjpvjVJe8Q7uztwgDuTPxFZbtgrOSKKSybxC
	77ZCC2XePObrkeV5I/2zYMfLRmHfaYCuo9CdpORY9n3XUuO0ASh53rUo2KfMp7XscC8disZJDTNfa
	wVxvCj01JQfQgD2ZRhAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qipya-001w7I-14;
	Wed, 20 Sep 2023 05:42:16 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qipyW-001w6I-1x
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 05:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695188532; x=1726724532;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=j74fVV6Nb59iTbKaYj+rBG5+F9vJ7hG/6p1MFwNn5ow=;
  b=nq4DutCQ0FMSlJU3ZxmN4mntqftpUCARPdIl71MRb5cqC8586piEyaZ3
   7/pW0MASqRnf4FagHMk73hM8iL3GykGX5dPvSO+gnRzH3fB2V4hKzGlek
   S3zzt+h4X85aAXUmcvk0o4ZvbFei//adBWDVcp0P4CH+4zAgab7WoUFKP
   Sozcxyr9vaUXtzhbH7zQonyRSbvHjiwEXvVUoN7EFNDq2KuBFRrgJCnkA
   WfHlc4gSkf5KvPWhUmieiAcshi6UIq6uxLRDAFQgwkDZbattwtfNHpFZs
   2p25ZP8b6JVP2fKdNteXDLIundoa/YI7e+ZrI330jgJ6NMWKtUzF2ad9K
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="380030142"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="380030142"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 22:42:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="861833790"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="861833790"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Sep 2023 22:42:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 22:42:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 22:42:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 22:42:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 22:42:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHDyGRzcJvlgp75bs9BrR3oQXmhHtUWuq2uiUfKK3jyO0QXJ2NTe7ARE8gu2zy8zDCxvDITkpqDf7iuppbrHs93r0PaUP7dtKykSaxkHZ4cwXYo/Ck4ipB3HgBOBfiMTN/eSn69zSjOduIPAfABDxmNjSSkb74hPck0mbN7OUhdEmVRBR1OqbLkkQbihd65QAu44h20NDiAIdmr+cuNTQRlE0eW38pP+uHITSeTmzO7SqKvK3oFwhlfQg7AmNcsoHqg7JhEJiBEyzSDuNWj4o7byNZoN9z2QwiAHgS+Sy6VSSIZGltFzDzrXPxZHKdGodQh8/KTLAGntPeIhY600aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AB4MPKjjN5VBpogDjrxvxHM4awCrDC10FfARLpOUN0=;
 b=Cz7gKu7Gfc82awTbzdg1BapQkJfIp5lex69xPxkIQ/YUfx5AxF3OnK1059Tp/AxBNth0YN6baGiZDEwDBaTs128y0Ds8m61EWjz7tN1EQ03cFWE49XSBThTn2teyi/Ezl/ikurAudp2rs7i9qEhgYCa2udHMfTKOUoaZmebK4McZU9rw6/8g9fc+QjE1TIBUDK8zs+y9/GSmIMdScqGGxFenMfR2PMI73E4cVGXzBaGm7jZAHs7RvGg7fecD5O0U6XgWEzh+sWYvfz3Ix+7GmEKO2XBmSb3z5W2ZfEeXrtCorNvPPAq6M0q/1GxRElRjZYRO8ZjwhOzCLMpU+4eD6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.24; Wed, 20 Sep 2023 05:41:55 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 05:41:55 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "evan@rivosinc.com" <evan@rivosinc.com>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"apatel@ventanamicro.com" <apatel@ventanamicro.com>
Subject: RE: [PATCH v4 6/6] RISC-V: selftests: Add CBO tests
Thread-Topic: [PATCH v4 6/6] RISC-V: selftests: Add CBO tests
Thread-Index: AQHZ6jJx85JjcqfU0U2RE/AkT+t/w7AjNQIQ
Date: Wed, 20 Sep 2023 05:41:55 +0000
Message-ID: <DM8PR11MB57513DDD414D76559D0E0B3CB8F9A@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20230918131518.56803-8-ajones@ventanamicro.com>
 <20230918131518.56803-14-ajones@ventanamicro.com>
In-Reply-To: <20230918131518.56803-14-ajones@ventanamicro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MW3PR11MB4649:EE_
x-ms-office365-filtering-correlation-id: a5815ee3-664a-4596-4962-08dbb99c4c9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0VOsDskm2A1K66JbrsZziQSSNgu4QTCC/3fG9VXhuOKe242Tew2ObDFhz7vDNPJhpRQO1we+eRD6W28uCd9gUbHUhM7yVW9JzPhfejuW+WWQ2tTEF/PVMMoCOAn0cJ8n+oisHKwmu+Egkx9Ek3D75Qz+aCrqUaZIFjEulcL+vCnBiob3JPIJzf1Su8XFboXCC4EWS077xV4uzif9lffABS45I2TksHYoHZ7X8wQfgaVS2PJBgkByMRvFrariebHbDVNRYwaX3RqIa1qrCp91jicxHtmywvz1hr4EG89H8K4VuJG+9qUeJP7MuojqyElyDRRzCGWHjQ4w//NKf5F69nMH73ptQ2eXJC/ej4vgDimDXbvjH4kVclYAG4rstsqBrgT2yhrLENKElpQoAsFc+enSZyYYGnrhbv2q3J2kqideh0AuLtc/G/FmoyNIawFpv7reu5o7mSsLKJK0kRlwZqIijnKqAzFzbOQ4f85huiLO8ZYieOAExjTh4ZIOqE1zO/LZVICnonKEx0vDwG6qM7VRzNDcVs3mooKZ9x5TNwsch2aNp2QDKg4gDObIBjn9LkbhlIIDnzfv/UYC3SESS/bU1gWOxuQlWwKlXE1kBu0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(346002)(39860400002)(396003)(186009)(451199024)(1800799009)(2906002)(5660300002)(52536014)(26005)(55016003)(76116006)(54906003)(64756008)(66446008)(66476007)(41300700001)(316002)(66556008)(66946007)(110136005)(30864003)(966005)(478600001)(8936002)(8676002)(4326008)(71200400001)(6506007)(7696005)(9686003)(53546011)(122000001)(38070700005)(38100700002)(82960400001)(33656002)(86362001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?BuOdEQxUCtjJaWWxq2mNdymHzccFW8WdUfUCsFVWP+POadqJq4NykdNN?=
 =?Windows-1252?Q?5iTIjOMMcM6uYScJGdfZyOebSfUJHiqPGc676t4mg9fEUDf0whYkSIZC?=
 =?Windows-1252?Q?tcHiRxDIOa7DpTfD3YPlfTFD4Zi4i54IaluUou1Z3H3kH3IbAbIXRU2C?=
 =?Windows-1252?Q?dSo20f2lRxIUTk3rr4+Po715kIYKCqQKG7iawFkvy01vjxnN0dVOjw6m?=
 =?Windows-1252?Q?mwmKeSiY+/wVwuu2NDgDFr71VczuLoHkeg2jdVGLCKLosbmsCQNEgiT2?=
 =?Windows-1252?Q?q/0evQXeLYVafqIIH5Fj6al0VxHTfZJtokbQRFZKmwV6fycL1pevnt49?=
 =?Windows-1252?Q?ZncsZ1FSMtGCulliyAXlioSrp/Do70cIntyygd30SFm9D+dWGtN7QnhF?=
 =?Windows-1252?Q?g5kUOVph3SjpOI70Dfobzs46JLTlXhGR6G1E9YY7tenqX3UVWoW/isG/?=
 =?Windows-1252?Q?sregDR7H20Euoy4A97XsHh82XZ2fUGDQrqodOXw4RzdUbAqLeqoKGBD1?=
 =?Windows-1252?Q?fQaZ2lgiJ26Y2ID2HFaCoLPUJvRIOa2HNEMPu0zB7l0cdleyaHUpEboJ?=
 =?Windows-1252?Q?rif2ZJ/gsnAE1sLmheNnJrqam3pEfBzrEbJ+yY7M+plEkztlhvtu1gS8?=
 =?Windows-1252?Q?9Tca00eKODxCP5w7CK2xL7pPP2HW8Dk1d3361GWJuX+yH5QyUCAOrk4K?=
 =?Windows-1252?Q?iOQkFSVT8ieB/2161ZF3lt4slw/Cww2VpcZjeyTDcv3giLBIpbMqCdRP?=
 =?Windows-1252?Q?ox7Fuuya/7Vlt+ADJaZUf3syonO0MmREAzJs2qx4qqFxjRZhKgMzU5QB?=
 =?Windows-1252?Q?6nT2kf0nLFOmiJSULKeL7RngXH9veUE8Tr/1NGCNMFKw/q6dvkY/4sIm?=
 =?Windows-1252?Q?ZkV69geNVe5dWFCU02VZfsnlxoUOD4Te0d9RlNGUuUi20UedJg792xAq?=
 =?Windows-1252?Q?1qif/XTZfZlv3XXqfq8h5fMu+vsZ2qbnWkfkMP5JS3D/2lSJ4LLM/jQg?=
 =?Windows-1252?Q?iDl9QVYVph0ytiTJVQBQzl9IelNUOHxcF1mg+VisxwP+tEXJQ9/Y1Si3?=
 =?Windows-1252?Q?mQ7wFD6EBfqUdvk8I13/4I9TMzAUlsrK9DlvCHrMaWBOiewhDTAoP0EB?=
 =?Windows-1252?Q?6sC1u9S1tUQqwmKWtvXXUcv7GQMWMkW5nR3IVIeIRz40ALZNu16Y1kMM?=
 =?Windows-1252?Q?0McNid8xcyINcf0H6u8TEoe89OAGV0jb3nwhVKkce7MkInpXttCjXQP9?=
 =?Windows-1252?Q?43+Lof060V7cn1JqlIFRS4Yh5ZLfAnuNrXRoCUR4qIKnThgIkphha6gB?=
 =?Windows-1252?Q?Yf8PreSVwiNfdz/rnpQZGyNxbUg/u4eLdovQaPiJkoZj82iieLnoaJh6?=
 =?Windows-1252?Q?uEKXge065gG+KFKFQBl6jTIbbbILlj9u5o29dLddYqIAzFc2BaRjsvr8?=
 =?Windows-1252?Q?p4WMEDkpE0DHQ5KtyjHzTHlh6ET0oB6uhiQHpu0bNfdWGoSI4i1mIbza?=
 =?Windows-1252?Q?IsKugsPKsmLIUd/UIy+5g7f0cl3mODHdSNm84z05f3ZGgZPk4masAeZI?=
 =?Windows-1252?Q?y+kRnnNucB7Hi83t/SFp4K1wZe2k/FRhYzjRu+kaSiNUAgad5L/Exau5?=
 =?Windows-1252?Q?xPWckp08A8DJgr2RYLPV8X3xmM16ISY8tLKkwDuCjBhsAzGXlKXS1t0r?=
 =?Windows-1252?Q?l4E4s7m5OqWXfkwJdWmD8r4vISPuvKbD?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5815ee3-664a-4596-4962-08dbb99c4c9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 05:41:55.4342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +08Qtu5aqS8C6UGu2OyCJ3nIi+CopzWia0XibLJaXQCdady1vtMr1gdcDFbj3vptoHaym/b7MSaUu32MITEV4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_224212_683432_D904390B 
X-CRM114-Status: GOOD (  28.71  )
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



> -----Original Message-----
> From: linux-riscv <linux-riscv-bounces@lists.infradead.org> On Behalf Of
> Andrew Jones
> Sent: Monday, September 18, 2023 9:15 PM
> To: linux-riscv@lists.infradead.org
> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> aou@eecs.berkeley.edu; evan@rivosinc.com; conor.dooley@microchip.com;
> apatel@ventanamicro.com; Wang, Xiao W <xiao.w.wang@intel.com>
> Subject: [PATCH v4 6/6] RISC-V: selftests: Add CBO tests
> 
> Add hwprobe test for Zicboz and its block size. Also, when Zicboz is
> present, test that cbo.zero may be issued and works. Additionally
> provide a command line option that enables testing that the Zicbom
> instructions cause SIGILL and also that cbo.zero causes SIGILL when
> Zicboz it's not present. The SIGILL tests require "opt-in" with a
> command line option because the RISC-V ISA does not require
> unimplemented standard opcodes to issue illegal-instruction
> exceptions (but hopefully most platforms do).
> 
> Pinning the test to a subset of cpus with taskset will also restrict
> the hwprobe calls to that set.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  .../testing/selftests/riscv/hwprobe/Makefile  |   7 +-
>  tools/testing/selftests/riscv/hwprobe/cbo.c   | 228 ++++++++++++++++++
>  .../testing/selftests/riscv/hwprobe/hwprobe.c |  12 +-
>  .../testing/selftests/riscv/hwprobe/hwprobe.h |  15 ++
>  4 files changed, 250 insertions(+), 12 deletions(-)
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
> index 000000000000..50a2cc8aef38
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
> @@ -0,0 +1,228 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023 Ventana Micro Systems Inc.
> + *
> + * Run with 'taskset -c <cpu-list> cbo' to only execute hwprobe on a
> + * subset of cpus, as well as only executing the tests on those cpus.
> + */
> +#define _GNU_SOURCE
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <string.h>
> +#include <sched.h>
> +#include <signal.h>
> +#include <assert.h>
> +#include <linux/compiler.h>
> +#include <linux/kernel.h>
> +#include <asm/ucontext.h>
> +
> +#include "hwprobe.h"
> +#include "../../kselftest.h"
> +
> +#define MK_CBO(fn) cpu_to_le32((fn) << 20 | 10 << 15 | 2 << 12 | 0 << 7 |
> 15)
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
> +static void test_no_zicbom(void *arg)
> +{
> +	ksft_print_msg("Testing Zicbom instructions remain privileged\n");
> +
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
> +static void test_no_zicboz(void *arg)
> +{
> +	ksft_print_msg("No Zicboz, testing cbo.zero remains privileged\n");
> +
> +	illegal_insn = false;
> +	cbo_zero(&mem[0]);
> +	ksft_test_result(illegal_insn, "No cbo.zero\n");
> +}
> +
> +static bool is_power_of_2(__u64 n)
> +{
> +	return n != 0 && (n & (n - 1)) == 0;
> +}
> +
> +static void test_zicboz(void *arg)
> +{
> +	struct riscv_hwprobe pair = {
> +		.key = RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE,
> +	};
> +	cpu_set_t *cpus = (cpu_set_t *)arg;
> +	__u64 block_size;
> +	int i, j;
> +	long rc;
> +
> +	rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)cpus,
> 0);
> +	block_size = pair.value;
> +	ksft_test_result(rc == 0 && pair.key ==
> RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE &&
> +			 is_power_of_2(block_size), "Zicboz block size\n");
> +	ksft_print_msg("Zicboz block size: %ld\n", block_size);
> +
> +	illegal_insn = false;
> +	cbo_zero(&mem[block_size]);
> +	ksft_test_result(!illegal_insn, "cbo.zero\n");
> +
> +	if (illegal_insn || !is_power_of_2(block_size)) {
> +		ksft_test_result_skip("cbo.zero check\n");
> +		return;
> +	}
> +
> +	assert(block_size <= 1024);
> +
> +	for (i = 0; i < 4096 / block_size; ++i) {
> +		if (i % 2)
> +			cbo_zero(&mem[i * block_size]);
> +	}
> +
> +	for (i = 0; i < 4096 / block_size; ++i) {
> +		char expected = i % 2 ? 0x0 : 0xa5;
> +
> +		for (j = 0; j < block_size; ++j) {
> +			if (mem[i * block_size + j] != expected) {
> +				ksft_test_result_fail("cbo.zero check\n");
> +				ksft_print_msg("cbo.zero check: mem[%d] !=
> 0x%x\n",
> +					       i * block_size + j, expected);
> +				return;
> +			}
> +		}
> +	}
> +
> +	ksft_test_result_pass("cbo.zero check\n");
> +}
> +
> +static void check_no_zicboz_cpus(cpu_set_t *cpus)
> +{
> +	struct riscv_hwprobe pair = {
> +		.key = RISCV_HWPROBE_KEY_IMA_EXT_0,
> +	};
> +	cpu_set_t one_cpu;
> +	int i = 0, c = 0;
> +	long rc;
> +
> +	while (i++ < CPU_COUNT(cpus)) {
> +		while (!CPU_ISSET(c, cpus))
> +			++c;
> +
> +		CPU_ZERO(&one_cpu);
> +		CPU_SET(c, &one_cpu);
> +
> +		rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long
> *)&one_cpu, 0);
> +		assert(rc == 0 && pair.key ==
> RISCV_HWPROBE_KEY_IMA_EXT_0);
> +
> +		if (pair.value & RISCV_HWPROBE_EXT_ZICBOZ)
> +			ksft_exit_fail_msg("Zicboz is only present on a subset
> of harts.\n"
> +					   "Use taskset to select a set of harts
> where Zicboz\n"
> +					   "presence (present or not) is
> consistent for each hart\n");
> +		++c;
> +	}
> +}
> +
> +enum {
> +	TEST_ZICBOZ,
> +	TEST_NO_ZICBOZ,
> +	TEST_NO_ZICBOM,
> +};
> +
> +static struct test_info {
> +	bool enabled;
> +	unsigned int nr_tests;
> +	void (*test_fn)(void *arg);
> +} tests[] = {
> +	[TEST_ZICBOZ]		= { .nr_tests = 3, test_zicboz },
> +	[TEST_NO_ZICBOZ]	= { .nr_tests = 1, test_no_zicboz },
> +	[TEST_NO_ZICBOM]	= { .nr_tests = 3, test_no_zicbom },
> +};
> +
> +int main(int argc, char **argv)
> +{
> +	struct sigaction act = {
> +		.sa_sigaction = &sigill_handler,
> +		.sa_flags = SA_SIGINFO,
> +	};
> +	struct riscv_hwprobe pair;
> +	unsigned int plan = 0;
> +	cpu_set_t cpus;
> +	long rc;
> +	int i;
> +
> +	if (argc > 1 && !strcmp(argv[1], "--sigill")) {
> +		rc = sigaction(SIGILL, &act, NULL);
> +		assert(rc == 0);
> +		tests[TEST_NO_ZICBOZ].enabled = true;
> +		tests[TEST_NO_ZICBOM].enabled = true;
> +	}
> +
> +	rc = sched_getaffinity(0, sizeof(cpu_set_t), &cpus);
> +	assert(rc == 0);
> +
> +	ksft_print_header();
> +
> +	pair.key = RISCV_HWPROBE_KEY_IMA_EXT_0;
> +	rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long
> *)&cpus, 0);
> +	if (rc < 0)
> +		ksft_exit_fail_msg("hwprobe() failed with %d\n", rc);
> +	assert(rc == 0 && pair.key == RISCV_HWPROBE_KEY_IMA_EXT_0);
> +
> +	if (pair.value & RISCV_HWPROBE_EXT_ZICBOZ) {
> +		tests[TEST_ZICBOZ].enabled = true;
> +		tests[TEST_NO_ZICBOZ].enabled = false;
> +	} else {
> +		check_no_zicboz_cpus(&cpus);
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(tests); ++i)
> +		plan += tests[i].enabled ? tests[i].nr_tests : 0;
> +
> +	if (plan == 0)
> +		ksft_print_msg("No tests enabled.\n");
> +	else
> +		ksft_set_plan(plan);
> +
> +	for (i = 0; i < ARRAY_SIZE(tests); ++i) {
> +		if (tests[i].enabled)
> +			tests[i].test_fn(&cpus);
> +	}
> +
> +	ksft_finished();
> +}
> diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe.c
> b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
> index 4f15f1f3b4c3..c474891df307 100644
> --- a/tools/testing/selftests/riscv/hwprobe/hwprobe.c
> +++ b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
> @@ -1,17 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -#include <stddef.h>
> -#include <asm/hwprobe.h>
> -
> +#include "hwprobe.h"
>  #include "../../kselftest.h"
> 
> -/*
> - * Rather than relying on having a new enough libc to define this, just do it
> - * ourselves.  This way we don't need to be coupled to a new-enough libc to
> - * contain the call.
> - */
> -long riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
> -		   size_t cpu_count, unsigned long *cpus, unsigned int flags);
> -
>  int main(int argc, char **argv)
>  {
>  	struct riscv_hwprobe pairs[8];
> diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe.h
> b/tools/testing/selftests/riscv/hwprobe/hwprobe.h
> new file mode 100644
> index 000000000000..721b0ce73a56
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/hwprobe/hwprobe.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef SELFTEST_RISCV_HWPROBE_H
> +#define SELFTEST_RISCV_HWPROBE_H
> +#include <stddef.h>
> +#include <asm/hwprobe.h>
> +
> +/*
> + * Rather than relying on having a new enough libc to define this, just do it
> + * ourselves.  This way we don't need to be coupled to a new-enough libc to
> + * contain the call.
> + */
> +long riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
> +		   size_t cpu_count, unsigned long *cpus, unsigned int flags);
> +
> +#endif
> --
> 2.41.0
> 

Reviewed-by: Xiao Wang <xiao.w.wang@intel.com>

> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
