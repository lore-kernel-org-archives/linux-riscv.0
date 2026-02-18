Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B344E9A02C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Feb 2026 21:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gKPnniwTA27kjrsLJsH+Uh3Jrf43FIyQXlvaUTVgZOg=; b=fBXKzuckyp3f7g
	r90738OFRGmUui0Ewik/0UTB83ID5wfkFWtOnDyZp8d0bB8HcQTpwBYrkA2WMP9lGWhrxIsNyI8ep
	28w6GRHPw9YX+y6Pct4AkTK3NcbwfwqhTbHXcuvaNtpOx1rr3FOojb9szYivNOXpjfOlO0ngK2b18
	VS/PT8KEQbf4EzjOXjqwdphuTAnfUeHu1Sfy5Ltv0bAuNcT11ZYVZXnXzdnIjZHilCWGlTJJG7hjU
	ejCRITf/ehiHyR+pupEpPXjCgZ+M+HEapoOfemVvKuS9HrHxYm+qnBYGAOUEEn5nTqe63Rkkp1drZ
	EFaYgcUV4irLcPKdxmBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspZJ-0000000AV2R-0k0w;
	Wed, 18 Feb 2026 21:58:49 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspZG-0000000AV1p-2XHX
	for linux-riscv@lists.infradead.org;
	Wed, 18 Feb 2026 21:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771451926; x=1802987926;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5VSjoGtmac2CDU4eYm0LHn+UJqdA3gs9BmLIQjQEehs=;
  b=FfBfmztzqFgMQjmvA2A8wUabnZIkZtMfteeP8HuGZmdS0SZlRGWjb3V1
   vO+seuZ1dbpdBrSBmY029Zy/w2FNeWq5SmjMkvvAoHjMOCr7KCHn2RXxk
   tZ1OwzbHrdzym4rljuc+UV69QLL6963pJZduxxpbpUTb5Ubgf02Xnf2dD
   f/QhrzLosLMZ5w4XZUNFqMhgRRnyFHlDd17PD8FOUaIJjlkbONiof14Ms
   v2It/Nj/Ms1LZjU/0Xq0jJWQsvuNsMebl8u59e3Y55MPRt4bBMwyPuFf0
   IgPNdU/Z8CrqQt+Ip4cItOxzQZketMCDUEDxYt0e7kUrB3gZ7E+Z5RI31
   g==;
X-CSE-ConnectionGUID: qrFFqivITB2NJ0TmI8CtXg==
X-CSE-MsgGUID: R2gJspf8SQaeOyIJuLNukA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72528840"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="72528840"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 13:58:45 -0800
X-CSE-ConnectionGUID: RMjNbe6CTpGmTMZhHSTwaw==
X-CSE-MsgGUID: 7CVT3/j8SJq+SsJjSCxk2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="218140945"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 13:58:44 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 13:58:44 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 13:58:44 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 13:58:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewBJdKGogd3rD++KFoadQjgxMvR3Ap4ZDW05WNVALgfuvKYEz5Ib6IjNAhwPP4lI/foGY3RlHSs+WzKvmRT+qEM3XLXQDtPSXV9df0PflUPBYNbYkpTP7Z8Ii/k7Mdr6fkre3k5BCcHR+B+LOcBE55gf6CNvMh79BMIINNZNLsYU6PIcjpiS3UqTHsPWYkkG98q2ndWT7+/395vazc+oJH8c+Tayv9HD+Id05fzqrRfKwEletdLWdqQKI/kemEFD88m7eJwjv94UtrqCaNiyy3BMLjYN6Jb2ZRT7SpRogN7PsFqcdcy+NoKviqbWe1+xPWwZfJGysFdWoWp+fF1wjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VSjoGtmac2CDU4eYm0LHn+UJqdA3gs9BmLIQjQEehs=;
 b=PKMipHbnh4Mh9ptnz7LqkMzYUfCcft4W4+qwEGVvNYwP89R8UBXmQRcC+7c5ozK+H+qle97I+5TymDPIs9JVAVQbLF/jKtZHwVK4y3w6QvZKNkyli3xFwYnfwRPOs5mnFerTatVMi14IGxYafHLGUP1VIrBmjY4dBa54nG2wTQ8d1j1DodJYOvV1QByjGvb/niTdpLGOWpZzxmSiNWGBTt6OALZn/k8xKAW9yax2GEwu/v5GdCbqIawLdLD/Qv1jCFBb8r6F8Zgse5L7YEKxiWyJaSt+JQcDKaYCtLMAFdIV5bgltXB2XX5hH1nIZ+c0Nz4ZqzmBoSPgesb+h4KOdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DS0PR11MB8082.namprd11.prod.outlook.com (2603:10b6:8:157::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:58:41 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:58:41 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
	"debug@rivosinc.com" <debug@rivosinc.com>
CC: "Yu, Yu-cheng" <yu-cheng.yu@intel.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "pjw@kernel.org"
	<pjw@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"zong.li@sifive.com" <zong.li@sifive.com>
Subject: Re: [GIT PULL] RISC-V updates for v7.0
Thread-Topic: [GIT PULL] RISC-V updates for v7.0
Thread-Index: AQHcoRDb1MjTrqD39UWBYVZ0RnvrUrWJAVkA
Date: Wed, 18 Feb 2026 21:58:41 +0000
Message-ID: <196537b2933567d1781901f813a72ffffedd10fd.camel@intel.com>
References: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org>
	 <CAHk-=whUXMRa3py11kpZiDMau8uauiwZCok2UMQAecTshfTrVA@mail.gmail.com>
	 <2248971d-d69c-65fb-93b4-10f0d7d8bbad@kernel.org>
	 <b2aae256-7d3c-447d-aa8b-5904848cff6a@sirena.org.uk>
	 <CAHk-=whfQXKr3Sgoc7R1tPWFD3A1gEhUh=j7GGwz8yg_EQVhNA@mail.gmail.com>
	 <aZYZsBlH_tVxnZIf@debug.ba.rivosinc.com>
In-Reply-To: <aZYZsBlH_tVxnZIf@debug.ba.rivosinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|DS0PR11MB8082:EE_
x-ms-office365-filtering-correlation-id: ae8881f0-c888-455a-0f16-08de6f38e0bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RVBnTzBzZlpOWlAyUzhZcjBHNkU0SWpKeEI2SjQ3T2tmNUVuckRGcGt1Y2VT?=
 =?utf-8?B?TGVhSmJtNVFuTWIxNC91eFN0K2o0bHpWSnpkYm93a05pTkhOR3cwOGEwY0dy?=
 =?utf-8?B?L1kzWVJEQnZhVllHSTVUQnBHMmpuYWFVMHcrdlVaOGNrVnp6M3FydjRwOUhW?=
 =?utf-8?B?cjNPQmN0MmhRRVE2WXpnTjBXTU45YVF0TXM5bVdlcUlOb3B3UWVEWmVKZjRS?=
 =?utf-8?B?ZFBoZlNXNzFsbEFMMGltMVBqVEhOamJUQjJzUzdGUE0rSFR0WUZLekNxWmpr?=
 =?utf-8?B?aEhQd2JqcGp3T0FGYkhMUUZiZWl4RTB6QUFFdHZlRm16SThiOW1HVmQ4SUJF?=
 =?utf-8?B?NkpMUGpoTEdBY2Z3VkxDdWNHYmVEeDkwR1drTjhNWmE4Y3E3cDd4U1d5ZS9t?=
 =?utf-8?B?ZzFsR0I4Y3pMN2dtWXlHNW9XQ1RUaEJjWjFpdkFKYnRoR3ZFZks4dVBldXNw?=
 =?utf-8?B?NkxtSVhpbDhIbEFhUnExMEFZaEdhSUNJdnhOekhNS2ROdk44WnZ1OUFBWUd4?=
 =?utf-8?B?dWFmclJtUDBKcHdqdzBJSng2N042WHBMWUtmRlZmRzdPRFg2Um0vdnVOTGpw?=
 =?utf-8?B?NE1FUVAzRjgrVFZ3NzNuZGpoS05lTVBiWXVoWS8yZkRiTGVWaHg0NnIxcUZF?=
 =?utf-8?B?WGRxRXg2cEFaeG0yK2pIVEJCYXMzTjdRaFdnSkk5NGZCSWk5Rk5ra0J2V3Fk?=
 =?utf-8?B?UVVackFrR3Fiazl0d1IwWE9PbXZoY3JQaExUTUwrMWtZdWd0NUJpdm1hbEd4?=
 =?utf-8?B?UnFRNHc5eXpydmlOZVU5a0dzdGpNOENlWGlxZGtOcTlFWW1YSEhQL0szZFQ2?=
 =?utf-8?B?V1VINTBlT0p2aHowWkJ6OVdNdnFOa0N6S3dURExLRkt2LytRaU01TzMrZ2h3?=
 =?utf-8?B?U0FRUmV6bUw3ejFDUytXN2t1UGhiM0JZMklpekRtcmk5K3B4NkNVTC9GQ2o3?=
 =?utf-8?B?NVJKVUVFQk05OUtTb1FSTjVyek5GWnZ4MmJ5REgzTklacEd2SEx2dm9UMUVP?=
 =?utf-8?B?cHpTNXRyUUVoWlZOZEg2TmJaaEsrNVMvUGZFb28wUmtuWGVSekNyZldxaTF4?=
 =?utf-8?B?NjFuZTNOSU5tNGJOTHdabm94bm05cjNGVWM2NjB3MkNMVzJDdHdnQXNpWm9z?=
 =?utf-8?B?eGcyRXhsY2hEcWx4aEY1T1Q3SEJpTHY3M0JtSnZkamVGWlYxcEFVVGpQczZH?=
 =?utf-8?B?L200M29kNTN5Y0plRTRzZVNtaUFCN2dBejk1ZGVpcTNBQldoWW50TVplc0Vt?=
 =?utf-8?B?b1VpM013Q09FN1JHYk5ubS9SUnhMUG82RDdNUHNSNUZ6MVQ4bkxlZnhpTmlN?=
 =?utf-8?B?Si9YckkydlB2R2lwNm5MOUhrU3JtUUZvRjc5bFNNWm1OZjlHNEQ4T1VFUTFI?=
 =?utf-8?B?ZkNsbyttNmRXeEU1bGNUZEhaZ0RvUG5BWnV1UlZ4dWIvZHFHbkd5QXlrQ0E2?=
 =?utf-8?B?VTgrcHNJVU5JMmJaS0ZBSmRzYnBrdkowd0NSOWxBT0pBaDduaWVYR2RrSVdF?=
 =?utf-8?B?bFZHdHBwR2lJeldUT2lLM1RCMmNQcWEvaXJIRUxBaCtDRW1xVnVWcGlYcyti?=
 =?utf-8?B?NUlKODBwYmVyY2JLTDZIQmVzRlRYVUJ1ek5Ob1I2OHJJRHdPMW51d0xuRy8z?=
 =?utf-8?B?cDRZUnF3NXZaaGovK0tURE82RmdlWGhpMFU5ZVV2Q2JsTkRBN3pjM0ZwS0Zo?=
 =?utf-8?B?TlMrL0hsVDFOeStqMjNXaHlXTDJoNGZNVWRIbnpJMi9JQU5JYUJDOGF3aSth?=
 =?utf-8?B?TU9jbVZtSWhtMzFmRkRLaHc1dUxKM0pGSEJqL1FDa2t0QWdmZEdmdUdkNmRE?=
 =?utf-8?B?TlRyK3J1MVFFc25zSnl4VEFHa1NUbkVXU2VaYVFuaHREU0RpWmt2MDNYeVBP?=
 =?utf-8?B?ZXZBQzBKUkViUy9IR1RlK1dKQU4rNjVJNkhDREY4T1I4MlRlWWlIWElwZ0o1?=
 =?utf-8?B?L3JCaDlkR1FyQzljRi85VndIbEZEcnYyemVyRklCb1RrbCtYMEh2T2xNbTF1?=
 =?utf-8?B?ekNJQUFVaFM5NzBDMCtIQjRvTVNnNUcwYld0ZGJINEtmN2FFTlFIRStITFpP?=
 =?utf-8?B?TDJXenI1K2d2UG55ZzNlZ1duT0dyYlpjOVYxbUJ2alRDTml0QmJnT2o1Zmty?=
 =?utf-8?B?bEpIalRuM1JXNUhpU3RjUC91UjlwZlR6ajNFdVMwQkhZbWhIbTkzSnpOcUow?=
 =?utf-8?Q?HWJsUM/7YVcXOMBxToLRDSQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qm5DL2ZoUEJLVlc3R3hpaGJyOXc4M3ZxZndsbGJaa0pMQVFtWjZTQU16L01p?=
 =?utf-8?B?MTRjOHhWSGJDTE1xRzBlQ3VwRG1rNFZINlJmSEM0azcyZlY3bU1wV3ZYK2po?=
 =?utf-8?B?bEtiSjU3UWpKQjJLNzZOVGdiV0p2QlJ3MVM5aVNWUHh2QTVRcXpFSUpyMStr?=
 =?utf-8?B?QmdVZCs0SUJPSTdyOEt1aldHVHJnUXFIL1F0QjA3TXlJQUhXUXhGaStBbThK?=
 =?utf-8?B?Q1pHejc1RnplR3hBQTZLelZNQ2tVZ29mVlFRWmlBWFFRUGhhQ1RqSU9LNEIz?=
 =?utf-8?B?M2FIY251b3FwWFNSdCtVS2prQWRabXRvZTBENkVPbk53K2FpVW9jZmt5MVRO?=
 =?utf-8?B?VzB2RHczQVhvS0pxbjNSM0VmUGtxSHJselVPZlBnbWdNN0pwcmJWSExWMlI3?=
 =?utf-8?B?a0NaQzN0VEUyYnZGWE5TakZsT0I5LzFLNkVZb3VRUld2UEF1YlZta3BBcjhw?=
 =?utf-8?B?aytORU1yUEVWcEw3bVpZWlJCa3RTWFBmR2d5T2FlUENUUGNwc2JQSmZWeWR1?=
 =?utf-8?B?TlphdEZMaHdPamtTR01vRXBlVGdYa0xwbFU5cVRKbFhJd0V3TklZVjk0R3du?=
 =?utf-8?B?N1NzVkIrUk12L0FEWGZSbHYySmluOGpjVVpOWFBkbE84RU5MS0NySVJLSWky?=
 =?utf-8?B?ZmZlMlRKNGJ6a2tNMFFhUlE3K1M3WWcrMFRsSlZXMzYvREJOdlFzOEltV0dV?=
 =?utf-8?B?RVJjMm5OcktRc0RBOVhlY3VxSHdrZEFON3VYSGRJTnF5UThKSG02QnVMcnhJ?=
 =?utf-8?B?Y3I2UFdxeFIyQnBBOEgrckpITW9pTkJ1dHZhWEVTaFJ2bzNhV2tUSjNVb1ZF?=
 =?utf-8?B?N1hCcFdBRnZhY1VoWFRvRWJDbnFaVmcxc0VjbXFwNEsySi95M2g5aWNGelph?=
 =?utf-8?B?cVJqQ0FPTjNMNWlZZElhMTRxQXM0SGM4RmhnbWhjTVI2M2d0alZTb3BHL3R2?=
 =?utf-8?B?TExxSjloTTN3aitacitzdWk1WW44RDc4eWNWUWpiWjU2UEdaN0VxWDFrY0xS?=
 =?utf-8?B?dlBxOFN4RGRaM2xIdENCak0yRFUrTDVMRGZZZXBidHYwOTNxeUFWMXdqb1JX?=
 =?utf-8?B?WjZqd3Ntci9TVVREWWoyOHlPSlEvM29xaG1nRXhCZmtNek1ZdkRITjRPWEN4?=
 =?utf-8?B?aml6blAraHZ4a0JIQlVBVTNRRHdWbm5CakVvakJHZVFnQ1VmQVR4MFJicVZB?=
 =?utf-8?B?TWhRQitFMWVnaGZqRktrcnZnRktpNTAycXJLYVNGZU4xTk1TYmxCTGJTV01U?=
 =?utf-8?B?eTJHVWRtZzRTcmNnbFBWNmZPU29tMEM0cjlnUTlkb1ptT1E0WGYrMmJRdko2?=
 =?utf-8?B?OExGdXRXVWhoNmIwV1M5d1I2M1NEVW52bDlDM0F6WlF2UGhCREFySEdtcFEz?=
 =?utf-8?B?enpWd1U0QzhadEZOR2x1Z2p1b3dTOVVUVUpKYXc4Z013Z2RVNjlMTzBvUFg3?=
 =?utf-8?B?L2lROUt4Y1VuRStRWHI2ejViMlljamF5YmJxNU96QUsvV3ErMVVHWFdHbTJ2?=
 =?utf-8?B?V3ROdnRrNytMb2ZsQ09LYW40UmpPZEZxdFlNRllWQ2FqWHR6eHo0WVJ0eGFk?=
 =?utf-8?B?VTlENnl3SEFybmdMckJnYkJPR1VLbm1Vb1A2UklRdzBZMUlZN1g1TFJIWTJS?=
 =?utf-8?B?dXBSTExBcFpSN2JiSFhNem14QkZLelJFdlloN3J6Qjd2OUFXTjNTN2pUNW5Q?=
 =?utf-8?B?MVBZOHMrNkpMbGdOdlluNERiVUxLdnpabG92eFdSWGJwVVdGVXhBdHU0dHNX?=
 =?utf-8?B?RHBuc1FwTS8rV20zU2hiUDFHOTJFRjNLdHpEcmd0alc5L2dnNFFsaVBKZGdx?=
 =?utf-8?B?RzIyMG5qekZBRW02UE1aVlZSN1gyakM1eHd2dDdKbVpWTzczNUJXUjBvVUEw?=
 =?utf-8?B?WFg0U1U5VE9DMHFCUVJiL1pYR0dSMXRYVnk4OGcvcmp6OHdCU0d5TEtTQkpN?=
 =?utf-8?B?TWQwSFNrQStDRmpoeW5hSy9XZXQxTXBaTzdqSjNQUFBWTUpGSEhDdDN2QzFp?=
 =?utf-8?B?YWQ1WFBGN0MxaFRLOEQxVzZYNVhaeFU1Qm45bkZWcEkyQzU3V0N2Wmg5SU5T?=
 =?utf-8?B?ZWdBS2drcXhCZTRXcFQ4d213YjZoWGs1WTkydCtsb3V1NDVWSTd2SXRQOVVk?=
 =?utf-8?B?RHJ3Ny84Q0orRlNNSmJBMmQ3MWhMejRMdUxGMGpFbUpJdk14NDN0Y1RPb1hl?=
 =?utf-8?B?aUl0a0x5MG1WS3Zvcmp2b0lnM3krNVRhZEI0cXcyTGNKa3RmS1JrdHNTTWhE?=
 =?utf-8?B?TlhZa1hrUERjejQxWXhaQU5VLzJpTE9KcEZyUVJCU2pMbjFHVXRYZlpYa3h4?=
 =?utf-8?B?SHdDL2N3Y3lIN3N3NzZ6ekJjb3NldTEwWFlnbExBUzZSMldGVVMzT3AwR3ZU?=
 =?utf-8?Q?EFh485JHtuIhye7Q=3D?=
Content-ID: <FCAC91609FB73A48BA4E11AA04931308@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8881f0-c888-455a-0f16-08de6f38e0bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 21:58:41.1944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j3EvDlS4WaJIE+pRiHwuPS6A4d4RHdsl5iFVezWZ05pN7d/xWz/7y7idMHGPkup0etDwQyEBaAIv3MtIaMBJb9kHt7l4YwcGYo7IeQdYwwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8082
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_135846_704999_37739BE1 
X-CRM114-Status: GOOD (  19.44  )
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

T24gV2VkLCAyMDI2LTAyLTE4IGF0IDExOjU3IC0wODAwLCBEZWVwYWsgR3VwdGEgd3JvdGU6DQo+
IExhdGVyIGluIDIwMjIgd2hlbiBJIHN0YXJ0ZWQgZG9pbmcgd29yayBmb3IgY2ZpIGV4dGVuc2lv
bnMgb24gUklTQy1WLCBJIHN0YXJ0ZWQNCj4gd2l0aCBhcmNoLWFnbm9zdGljIHByY3RsIGZvciBl
bmFibGluZyBzaGFkb3cgc3RhY2sgYW5kIGJyYW5jaCB0cmFja2luZy4gSSB3YXMNCj4gaG9waW5n
IHRoYXQgYWxsIGFyY2hlcyB3b3VsZCBlbmQgdXAgY29udmVyZ2luZyBvbiB0aGF0LiBTb29uIE1h
cmsgQnJvd24gc2VudA0KPiBvdXQgYXJtJ3MgIkd1YXJkZWQgQ29udHJvbCBTdGFjayIgKGFrYSBz
aGFkb3cgc3RhY2spIHdoaWNoIHVzZWQgdGhlDQo+IGFyY2gtYWdub3N0aWMgc2hhZG93IHN0YWNr
IHByY3RsLg0KPiANCj4gU28gdG9kYXkgd2UgaGF2ZSANCj4gLSBhcmNoIHNwZWNpZmljIHNoYWRv
dyBzdGFjayBwcmN0bCBmb3IgbWFuYWdpbmcgKGVuYWJsZS9sb2NrL2Rpc2FibGUpIHNoYWRvdw0K
PiDCoMKgIHN0YWNrIG9uIHg4Ng0KPiANCj4gLSBhcmNoLWFnbm9zdGljIHByY3RsIGZvciBzaGFk
b3cgc3RhY2sgbWFuYWdlbWVudCBvbiBhcm02NCBhbmQgUklTQy1WDQo+IA0KPiANCj4gSWYgd2Ug
bGFuZCBhcmNoLWFnbm9zdGljIHByY3RsIGZvciBlbmFibGluZyBicmFuY2ggdHJhY2tpbmcgZm9y
IHVzZXJzcGFjZSBhcw0KPiBwYXJ0IG9mIHJpc2MtdiBwYXRjaGVzLCBJIGFtIGhvcGluZyB3ZSBj
YW4gbGV2ZXJhZ2UgdGhhdCBmb3IgeDg2ICJicmFuY2gNCj4gdHJhY2tpbmcgZW5hYmxpbmciIGFz
IHdlbGwuIEkgZG9uJ3Qga25vdyBpZiAiQlRJIiBpcyBlbmFibGVkIGZvciB1c2Vyc3BhY2UgaW4N
Cj4gdGhlIGFybTY0IHdvcmxkIGJ1dCBpZiBpdCBpc24ndCB0aGVuIGl0IGNhbiB1c2UgdGhlIHNh
bWUgcHJjdGwuIFRoaXMgY3JlYXRlcw0KPiBzeW1tZXRyeSBhbmQgY29udmVyZ2VuY2UgYXMgd2Vs
bCBiZXR3ZWVuIG1ham9yIDMgYXJjaGVzIGZvciBicmFuY2ggdHJhY2tpbmcNCj4gc3VwcG9ydC4N
Cg0KQXJtIGFscmVhZHkgdXNlcyBQUk9UX0JUSSB0byBlbmFibGUgdGhlaXIgbGFuZGluZyBwYWQg
bGlrZSB0aGluZy4gSXQgZG9lc24ndA0KbmVlZCBhIHByY3RsIEFGQUlVLiBQZXRlcnogaGFkIGJl
ZW4gc3VnZ2VzdGluZyB3ZSBkbyBhIHNpbWlsYXIgUFJPVCBmb3IgeDg2IHVzZXINCklCVC4gQWx0
aG91Z2ggYW4gYWRkaXRpb25hbCBwcmN0bCBtaWdodCBzdGlsbCBiZSByZXF1aXJlZCBmb3IgeDg2
LiBXZSdkIGhhdmUgdG8NCmFjdHVhbGx5IHN0YXJ0IHRha2luZyB0aGUgcGF0Y2hlcyB1cHN0cmVh
bSB0byBzZWUuDQoNCj4gDQo+IEZ1cnRoZXJtb3JlLCBDb250cm9sLWZsb3cgaW50ZWdyaXR5IGlz
IHNoYWRvdyBzdGFjayAoZm9yIGJhY2t3YXJkIGNmaSkgYW5kDQo+IGJyYW5jaCB0cmFja2luZyAo
Zm9yIGZvcndhcmQgY2ZpKSBib3RoLiBJdCdsbCBsb29rIG9kZCBhbmQgdWdseSAodG8gYW4gZXh0
ZW50DQo+IGl0IGFscmVhZHkgaXMgYmVjYXVzZSB4ODYgYW5kIGFybTY0L3Jpc2N2IHVzZSBkaWZm
ZXJlbnQgcHJjdGxzIGZvciBzaHN0aykgdGhhdA0KPiBzaGFkb3cgc3RhY2sgaGFzIGl0cyBvd24g
cHJjdGwgYW5kIHdlIGludmVudCBuZXcgY2ZpIHByY3RsIGp1c3QgZm9yIGJyYW5jaA0KPiB0cmFj
a2luZy4NCj4gDQo+IElkZWFsbHksIGl0IHdvdWxkIGhhdmUgYmVlbiBuaWNlciBpZiB3ZSBoYWQN
Cj4gYFBSX0dFVC9TRVRfVEFTS19FWFBMT0lUX01JVElHQVRJT05TYCBhbmQgc3ViLWNvZGVzIHVu
ZGVyIHRoZW0gdG8gZW5hYmxlIGFsbA0KPiBzb3J0IG9mIHRoaW5ncyBsaWtlICJNYW5hZ2UgQ0ZJ
IiwgIk1hbmFnZSBtZW1vcnkgdGFnZ2luZyIsICJNYW5hZ2Ugc3BlY3VsYXRpb24NCj4gY29udHJv
bCIsIGV0Yy4gQnV0IHRoaW5ncyBldm9sdmVkIG9uIHRoZWlyIG93biBwYWNlIGF0IGRpZmZlcmVu
dCB0aW1lbGluZXMuDQoNCkR1cmluZyBzaGFkb3cgc3RhY2svbGFtIGVuYWJsaW5nIHdlIHRyaWVk
IHRvIGNyZWF0ZSBhIGdlbmVyaWMgeDg2IGludGVyZmFjZSBmb3INCiJwZXItdGhyZWFkIGZlYXR1
cmVzIiB3aXRoIHRoZSBpZGVhIHRoYXQgSUJUIHdvdWxkIGFsc28gZ28gaW4gdGhlcmUuIEhvd2V2
ZXIsDQp0Z2x4IG1hZGUgYSBidW5jaCBvZiBwb2ludHNbMF0gYWdhaW5zdCB0cnlpbmcgdG8gZG8g
YSB1bml2ZXJzYWwgdGhpbmcuDQoNCkFmdGVyIHRoYXQgYXR0ZW1wdCB3ZSBraW5kIG9mIGdhdmUg
dXAgYW5kIGp1c3QgbGV0IHRoZW0gYmUgc3BlY2lmaWMuIEFsdGhvdWdoLA0KaXQgd2FzIG5vdCBh
cHByZWNpYXRlZCBhdCB0aGUgdGltZSB0aGF0IGFybSBhbmQgcmlzY3Ygc2hhZG93IHN0YWNrIHdv
dWxkIGJlIHNvDQpzaW1pbGFyLg0KDQpJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBoYXZlIGEgZ2Vu
ZXJpYyAiQ0ZJIiBjb250cm9sIHRob3VnaCwgYmVjYXVzZSB0aGVyZSBhcmUNCm90aGVyIHZlcnkg
ZGlmZmVyZW50IGZvcm1zIG9mIGJhY2t3YXJkIGVkZ2UgQ0ZJIGxpa2UgUEFDLg0KDQpbMF0gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC84N3pnampxaWNvLmZmc0B0Z2x4Lw0KDQo+IA0KPiBH
aXZlbiB0aGF0IHdlIGFscmVhZHkgaGF2ZSBhIGZyYWdtZW50YXRpb24gaW4gcHJjdGwgc3BhY2Us
IEkgcHJvcG9zZSB3ZSBnbyBmb3INCj4gYXJjaC1hZ25vc3RpYyBicmFuY2ggdHJhY2tpbmcgcHJj
dGwgYW5kIGxldCBvdGhlciBJU0FzIGltcGxlbWVudCBzdXBwb3J0IGFzDQo+IHRoZXkgZ28gYWJv
dXQgaXQuDQoNCkkgdGhpbmsgdGhlIHNpdHVhdGlvbiBmb3IgZm9yd2FyZCBlZGdlIGlzbid0IHRo
ZSBzYW1lIGFzIHNoYWRvdyBzdGFjaywgd2hlcmUgdGhlDQpmZWF0dXJlcyBtYXRjaGVkIHNvIHdl
bGwuIEF0IGxlYXN0IGZvciBBUk0uIE15IGJlc3QgZ3Vlc3MgaXMgdGhhdCB4ODYgY291bGQNCnBv
c3NpYmx5IHVzZSBpdCBpZi93aGVuIHdlIGdldCB0byB1c2VyIElCVC4gQnV0IGJlc3QgZ3Vlc3Ms
IHdvdWxkIGhhdmUgYSBQUk9UDQppbnZvbHZlZCB0b28uIFNvIHRoYXQgY291bGQgYmUgZGlmZmVy
ZW50IHNlbWFudGljcy4gU29ycnksIEkgbmV2ZXIgbG9va2VkIGF0DQp5b3VyIGZvcndhcmQgZWRn
ZSBwYXRjaGVzLiBJIHRoaW5rIHlvdSBkb24ndCBoYXZlIGEgUFJPVCwgcmlnaHQ/DQoNCj4gDQo+
IElmIHlvdSBhZ3JlZSwgSSdsbCBsZXQgUGF1bCBjaG9vc2UgdGhlIHJpZ2h0IG5hbWUgZm9yIGl0
IChnaXZlbiB0aGF0IGluZGlyX2xwDQo+IGlzbid0IGEgZmF2b3JpdGUpDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
