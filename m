Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FE8C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 11:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/5mOsXSWAg3TIhUIhv/w8NtRLp1P9HLvcNU+CVdjlU=; b=bmeLi89TPwmHU3
	x5+aPuRs9f+qc7MEK8h+HOM1qZU/Si8DrVwN6R0DO3HpS+bEElsYCo51JBy+rdubkZWDXBgkvZrY0
	kTE0U+9nulxAz8cCiEbphgJjFq/5PbCsjbQjFx1IitQ/P1lxbOOpfMOM/NBbgDVrTA0Ff4UX+JPeC
	fLKvGIKSt0x5aKM/ArCt1DbGl7BazmNvsxCHFpj5T1vc8KHEU9kfp5a4nV9vPVTXWTwRqUpOD9WKz
	/b40GPz4UdZBisAkvFLFn6KavqKEjd7wCIeZ22iq3b42DVOX1gJdVcUced0Rsr0F4g++lr0rtsGqm
	ee9v6sYA5ItOOZSPwSKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7CrS-00000001OS8-02dn;
	Wed, 15 May 2024 11:31:54 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7CrO-00000001OR8-432Y
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 11:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715772712; x=1747308712;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/Pqa1oew9oB6HO4AQ0KMZsmQLvxtCxmzSfN7R4sCCp4=;
  b=WQzaQxj5xJNfQo3ZdKlwDEZISFn8gdRFs+/Ae/+rcQJ68l5HWfEnQS9n
   8z+ky7dab0UOhx1YyIRNMkLejj4H+0wHiV2P0WGmZPW52XkBoW7GwYSfm
   5zRb1xP088mRuSNdAnxf9yyCaYABjmQwEk5qJalYXZhvXet018AzvZrQ8
   I19kgHbB4IkXx7R8FGiE9rA8UBEBuxEs0K3MgsOixySYDmeD1udCy7PYb
   m7LezhApZIb/E4jELpVPVBE+UAjisZO9kgQPPnIN7Jvn1ITx6fehlN+3Q
   CCKaaPXFwOZZDm4+2TJYSFnoNc0OpRdk++Tj6bKWRNNVIjflRuOFtL4oo
   w==;
X-CSE-ConnectionGUID: cJdJjusXQa6ZCXxDxsq6Mw==
X-CSE-MsgGUID: t9/7V/sxR0WWIlg1VMdlvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="29306154"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="29306154"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 04:31:47 -0700
X-CSE-ConnectionGUID: gZbIK/xXQw27VsnaVJNg0Q==
X-CSE-MsgGUID: jJAPvFAQQ46LS3FlB46SNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="31048352"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 May 2024 04:31:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 04:31:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 15 May 2024 04:31:45 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 04:31:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9vcK/5oNcvji4i8sPiBD0oMXMhWqjTcw5FimJtqu4pAaL2+Q+bDWIW4sJBgZqTmJ7wwGx5tto5H82gpSX1wvIX/10atIvAZ5iz4B83i/BBX1iu58Gq2RVnZO2FCXt0H0tkJVzLl0NV5MolPYwouNoJ5TV/yEKHqYdI2S6WC7emPln1Fju4fD/NZ5klg2q9EZn0NXjqBhPgb3VtexPIguMQKRG/pJ9xtw3+snCMW6E5Io52CNwRPgjnml5eoHl8yg5eTga2sdPhyPQiEsOcjT5z2q3BCPvdfLl2iJKHn7LNm5NS/PhXxucDpT9HJcVtQwvwsYGyRLaOsCmk4YuQjRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8ypttwVQ+SeZM2cKQh71Hbnkrgv9Hben92HQOK/BPs=;
 b=VuJL0h3othmP1C1olWh4Smaw1gX0nsTh+iZKaYSEyzBuYuy4SQW42ascyVIKoZrXYeEErjxFAat2IdeqaZMxz+ORdpE2jHV/ZWG5/ytyQcYMe3htbEAgbo2gj05Gy3MFso466ajTs5bloDL1BsJ0ydHZDshX8hzHwD8CkilIHcJHFSU8dQ/LJWYr7OCmLcZ0gmEu+W57TmwhrD7FqyNdPsMEHXL6lW2xiym6nQfmZ+icJ+HgmQAwTG7r5mtduQNXfRqa4sl3FLLQx7lX+gVm2aBXH1/aU/eegbPJd0l6o5qmTNmtY1hjMUWdc6qzCsl3a9LAg+MZoER9fPorq60bzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ0PR11MB4910.namprd11.prod.outlook.com (2603:10b6:a03:2d7::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.27; Wed, 15 May 2024 11:31:43 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840%2]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 11:31:43 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>, Andrew Jones
	<ajones@ventanamicro.com>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "luke.r.nels@gmail.com" <luke.r.nels@gmail.com>,
	"xi.wang@gmail.com" <xi.wang@gmail.com>, "bjorn@kernel.org"
	<bjorn@kernel.org>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net"
	<daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>,
	"martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com"
	<eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>,
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org"
	<kpsingh@kernel.org>, "sdf@google.com" <sdf@google.com>, "haoluo@google.com"
	<haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, "pulehui@huawei.com"
	<pulehui@huawei.com>, "Li, Haicheng" <haicheng.li@intel.com>,
	"conor@kernel.org" <conor@kernel.org>, Ben Dooks <ben.dooks@codethink.co.uk>
Subject: RE: [PATCH v2] riscv, bpf: Optimize zextw insn with Zba extension
Thread-Topic: [PATCH v2] riscv, bpf: Optimize zextw insn with Zba extension
Thread-Index: AQHao0tSYAL6LqZaWUWtv7jZE6ZoR7GVZY4AgADuVMCAAG0hAIABObEAgAAUZQCAAB7G8A==
Date: Wed, 15 May 2024 11:31:43 +0000
Message-ID: <DM8PR11MB5751A2BB91C431DAE14F48C1B8EC2@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20240511023436.3282285-1-xiao.w.wang@intel.com>
 <20240513-5c6f04fb4a29963c63d09aa2@orel>
 <DM8PR11MB575179A3EB8D056B3EEECA74B8E32@DM8PR11MB5751.namprd11.prod.outlook.com>
 <20240514-944dec90b2c531d8b6c783f7@orel>
 <20240515-cone-getting-d17037b51e97@wendy>
 <20240515-jogger-pummel-19fe4e9e8314@wendy>
In-Reply-To: <20240515-jogger-pummel-19fe4e9e8314@wendy>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ0PR11MB4910:EE_
x-ms-office365-filtering-correlation-id: 4959df90-3f58-4ee5-cbe2-08dc74d298d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|7416005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?Windows-1252?Q?ZzsH4RacMuL0YzOkG5A8k8eOStGDp/GcJKjGdiK5B0RwqYzFLUf7peQz?=
 =?Windows-1252?Q?LdqU6mP3G3Ibvx+lN2KJ0DCcjV/JA5ZExDMlRqyEa3qYmtR0Mz9M7iMn?=
 =?Windows-1252?Q?sm9IrFaP2NUGkhhY2F5oxMlhRssxADRq+ngWrS/RarScVxDD0A69mLM0?=
 =?Windows-1252?Q?L2wmATwM14usdWQ9felCL/Ak+o/5EEj43K6lILG5c3Kyo7GXlD9jayXU?=
 =?Windows-1252?Q?slezq5u5Ea8EFL6zo0crvhyoZRAj61R1Cmwudd6ZGWwg6wk7j96ZlGyl?=
 =?Windows-1252?Q?GSYOnNlT8LD1HXXJWoTH+ceeEn8Cy9/XXwgNzNC+/s02FKSBwEicVTc0?=
 =?Windows-1252?Q?rotzgHY4hWlELWnFCbVh6eEWrdktRJIZPOkNNo+KsaG2juTaUVuz5QFo?=
 =?Windows-1252?Q?fP72R5mEywbT819TUvbpPbufCMnm3aSTWiKsqSRGAFep4d/55VQMZiaD?=
 =?Windows-1252?Q?YgTk/vT0+tV1kwIpB2YtwKOAKUIugSLEpptePtp6glj/U5TVhX5hNUKD?=
 =?Windows-1252?Q?4MpMtNYmgfE0OtHb2Xh68PK/KWml+d7swu/L5q0+FOjE7S49dx84Q4a1?=
 =?Windows-1252?Q?feUhgTYP6rAlulmdC4yiiBYf5iQlx42gZaiRmwvhe+/jzQVu+1t64TK+?=
 =?Windows-1252?Q?MPjHR+yf5Hbi1CPCT4aJwG+8IfhGKlGyjOtO+ZWlozjdkjO/AroBijkB?=
 =?Windows-1252?Q?IUYKKfjE1u1fHVqxMEFBaX6I9ccRHU5+L/Ov+O3dTFH8ScITReomublv?=
 =?Windows-1252?Q?NUntyY8Pt35tHlrTatV7IVnTQ2NcHnhtxVJYNfsmb4PIMO+xlP5WoVm9?=
 =?Windows-1252?Q?wL6i0csN1rTOJCr6BXGr9vwDaOgen7YMqHQUrgQicjP65piyJ9PBYHU7?=
 =?Windows-1252?Q?Xoz3fnaCGXB87NZD42RnY9f9qiS9ispLOWMogAEYZuQk8AMRq6lsyQxZ?=
 =?Windows-1252?Q?ZVWNcbKsGGvSYSJUdS54B++/qE7ZkK+yO07lSjqiy6UkujNLWBG5ebOt?=
 =?Windows-1252?Q?CGIMRWLc4V4UzhsxcRro4nSz6ab/ns/v0QlEtPAB7Sdfz/xtNp6Ku29x?=
 =?Windows-1252?Q?PSZOH4euLAWN1Y/z52n0S8Nz/1ERmGtah2gueEgiDdFZDzYyDvxj9Yl0?=
 =?Windows-1252?Q?T1CwY+s+LmuJvvekZHyAMdmiQLkut3SyKxOlYKmqwP+kSrzEtyna7Grg?=
 =?Windows-1252?Q?0iqFV5VlrzrbgO73zBGAVoQQn5GGFkI1NXns6QaDsV07YL8IqBWnAVNi?=
 =?Windows-1252?Q?NkDEtQ7Yd8JSVAHVSnZn8fOkCgzdJ0/Ihm/wIOIyXxbJHMFdG8gFYou+?=
 =?Windows-1252?Q?1Ua/3RjVbtbZinpHbI3FTGW88Jsvfpny+VJ7IF7UhB92jmuEwJQ4mH5w?=
 =?Windows-1252?Q?xBh4d969CLwtLw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?u/e49r6AbcJUSoQ4n1HLQajRIHVp/ApqMnG0EuZMggSvyq85bBEw5UV+?=
 =?Windows-1252?Q?e+9X+xyLQiueJ11F2j6380CH8qjHbBR4Ji21yuOOJgpDSW7Ui4OEqmhS?=
 =?Windows-1252?Q?M/BQE0FtHtYoJHVCJlSzeSMhIm6HGPX+wsQ6Jqwnxf36Ogdj/67jzt2y?=
 =?Windows-1252?Q?IKAJWd55K2ONAs8jvF9nrbI/iAfYjJe4sDvFKnIG4taLaRMpcpJtZsta?=
 =?Windows-1252?Q?mdI0Qzt24KiO/hviplXlVFROFDg33y2gpkHzFdzrlGOvvLm9yFd0uNmW?=
 =?Windows-1252?Q?yCieOILq0r/0n1kCGdcmL+k356uAtVFSNZwx8v71PGfkMzHO1auu/yLm?=
 =?Windows-1252?Q?o5R4xcIeW7sY2FX88UcyH36o6AaD2kin16UFMhbbipr40mlr618wHQWR?=
 =?Windows-1252?Q?FAco5ZzDtnZTfPIV6Od43pDBb34jyb0boX6A6Yeo4JcNI0rtTJ++qdKh?=
 =?Windows-1252?Q?yCf7sI6h8AZVU0I+JRvW7Zx5PV3bQc48g4oumKUwQfs2tLk9WU1ZOq8T?=
 =?Windows-1252?Q?WFSgqedOaQS01J0q+VRm1zad+LnfEpOZRQhzH5IOELQgzrU2TXFxeKD7?=
 =?Windows-1252?Q?PkHIJFsvOm7E7XuFAEGHr4goaPEmueqYldGWeyNwrxxVBjdLYfutYRoa?=
 =?Windows-1252?Q?FBzZAHVdAvUZ91Qurb9r5wlMJenrZzxX5M5U87Au1F7XCt7Awrg8lG/z?=
 =?Windows-1252?Q?wRvUqL4sTqmnOHuFgt7dvaZTwVNQwqWQ04wuoSCfaLYgMaEYQs3V1tmg?=
 =?Windows-1252?Q?++9RiuSWGu+VPadQR7KNyAP7b36t1zj/yZZAA2VRTWvBWScbUiOE8agy?=
 =?Windows-1252?Q?2jrnJUCs0YvlRQ6nqLg3ayK3kzaLDtN+KSKJPoSyzecjvWiEf+cFHiw9?=
 =?Windows-1252?Q?2gtf1eW7Bqark/4e6FJDzANHa7I4hvQ5oOFYh2/AJpXz/2HW5cSWkhX2?=
 =?Windows-1252?Q?rQmMOvutOnVNo4vFrnYj+73G86AD84M7QYsNgMbryFv8EXT1DP4bONcV?=
 =?Windows-1252?Q?+S97vuHi9tiiYFa8TdGdb24HFl79EdcxZFW/q2KYKPaGRe0wCmMSzd7d?=
 =?Windows-1252?Q?y0KQ1R/yvTq0r88gZzGSzYwLS2W/1v4QOeii0UOGL9YkopWCPxmM9iyy?=
 =?Windows-1252?Q?TT7Np6f52JMUHGg1K/VSACcldwcWmXERTu0FtNOwdtFIBUTGC/1x534v?=
 =?Windows-1252?Q?MtoDNRC92FXk4FCHFhcshiZ8qjbEAsdnrWUaOasfnf9mCkC0MTv+cSFr?=
 =?Windows-1252?Q?V+fGZNooe1/W3HcyDqlkVeqEFYDELw7pdtndEpz5x+vwPMZ+Vpi3mkwa?=
 =?Windows-1252?Q?n2QhEVB6KQJu19NX0x8Usy79rhLLoU0qyYudGkxxRvRyqEzAVHnGeGtx?=
 =?Windows-1252?Q?2/xUT3nbOY98IOuub/fd9Teu0BQho+CPODEbxHH6qWlTZ+FqAhfy8we4?=
 =?Windows-1252?Q?GXMn5Gp+Egkp71t4xSyGcrCWUCgVfZBGKmZE/t2m2gYfOq99fjPbOPxE?=
 =?Windows-1252?Q?eLgojALSGMptQ8P3VlNOfvx+8DJDGQsHnEeL6eUUlqFc8VnbFQwhmd/F?=
 =?Windows-1252?Q?dtG+A/6qx3juVpnup7U7qjyzDenPFppgj5gXYCtOrslbtg/Y5czEQBdB?=
 =?Windows-1252?Q?rrT7I6wzo+3IN8+8wJZMRuEQFVfYJES8HmYXqsxnDF85jPKyWXAGKKUm?=
 =?Windows-1252?Q?ljIaCdZiEkZgHI7nJt8g1QGPTrteiDMS?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4959df90-3f58-4ee5-cbe2-08dc74d298d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 11:31:43.5308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RIkfMogVc7AZm9JuC/f1olx48D49DwaPQnHzhbxK8FFJb59E72WyA5CA0kRM/pNcWNu3E2rO5EGS4KKfk0xlAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4910
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_043151_122501_355E1F44 
X-CRM114-Status: GOOD (  32.39  )
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
> From: Conor Dooley <conor.dooley@microchip.com>
> Sent: Wednesday, May 15, 2024 5:33 PM
> To: Andrew Jones <ajones@ventanamicro.com>
> Cc: Wang, Xiao W <xiao.w.wang@intel.com>; paul.walmsley@sifive.com;
> palmer@dabbelt.com; aou@eecs.berkeley.edu; luke.r.nels@gmail.com;
> xi.wang@gmail.com; bjorn@kernel.org; ast@kernel.org;
> daniel@iogearbox.net; andrii@kernel.org; martin.lau@linux.dev;
> eddyz87@gmail.com; song@kernel.org; yonghong.song@linux.dev;
> john.fastabend@gmail.com; kpsingh@kernel.org; sdf@google.com;
> haoluo@google.com; jolsa@kernel.org; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org; bpf@vger.kernel.org; pulehui@huawei.com; Li,
> Haicheng <haicheng.li@intel.com>; conor@kernel.org; Ben Dooks
> <ben.dooks@codethink.co.uk>
> Subject: Re: [PATCH v2] riscv, bpf: Optimize zextw insn with Zba extension
> 
> On Wed, May 15, 2024 at 09:19:46AM +0100, Conor Dooley wrote:
> > On Tue, May 14, 2024 at 03:37:02PM +0200, Andrew Jones wrote:
> > > On Tue, May 14, 2024 at 07:36:04AM GMT, Wang, Xiao W wrote:
> > > > > From: Andrew Jones <ajones@ventanamicro.com>
> > >> > > > +config RISCV_ISA_ZBA
> > > > > > +	bool "Zba extension support for bit manipulation instructions"
> > > > > > +	depends on TOOLCHAIN_HAS_ZBA
> > > > >
> > > > > We handcraft the instruction, so why do we need toolchain support?
> > > >
> > > > Good point, we don't need toolchain support for this bpf jit case.
> > > >
> > > > >
> > > > > > +	depends on RISCV_ALTERNATIVE
> > > > >
> > > > > Also, while riscv_has_extension_likely() will be accelerated with
> > > > > RISCV_ALTERNATIVE, it's not required.
> > > >
> > > > Agree, it's not required. For this bpf jit case, we should drop these two
> dependencies.
> > > >
> > > > BTW, Zbb is used in bpf jit, the usage there also doesn't depend on
> toolchain and
> > > > RISCV_ALTERNATIVE, but the Kconfig for RISCV_ISA_ZBB has forced the
> dependencies
> > > > due to Zbb assembly programming elsewhere.
> > > > Maybe we could just dynamically check the existence of RISCV_ISA_ZB*
> before jit code
> > > > emission? or introduce new config options for bpf jit? I prefer the first
> method and
> > > > welcome any comments.
> > >
> > > My preferences is to remove as much of the TOOLCHAIN_HAS_ stuff as
> > > possible. We should audit the extensions which have them to see if
> > > they're really necessary.
> >
> > While I think it is reasonable to allow the "RISCV_ISA_ZBB" option to
> > control whether or not bpf is allowed to use it for optimisations, only
> > allowing bpf to do that if there's toolchain support feels odd to me..
> > Maybe we need to sorta steal from Charlie's patchset and introduce
> > some hidden options that have the toolchain dep that are used by the
> > alternative macros etc?
> >
> > I'll have a poke at how bad that looks I think.
> 
> I don't love this, in particular my option naming, but it would allow
> the Zbb optimisations in the kernel to not depend on toolchain support
> while not muddying the Kconfig waters for users:
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=ri
> scv-zbb_split

In that patch, I think the bpt jit part should check IS_ENABLED(CONFIG_RISCV_ISA_ZBB)
rather than IS_ENABLED(CONFIG_RISCV_ISA_ZBB_ALT).

> A similar model could be followed if there were to be some
> optimisations for Zba in the future that do require toolchain support:

Though this model introduces extra hidden Kconfig option, it does provide finer 
config granularity. This should be a separate patch in the future, we can discuss about
the option naming there.

BRs,
Xiao


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
