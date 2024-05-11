Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16512C25B10
	for <linux-riscv@archiver.kernel.org>; Sat, 11 May 2024 01:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X7yNrPJsoD76BL2V0ClqtOpZkIgbeHKUYI13Nym5RX0=; b=QJFL3XHxbLF9AL
	jmPP59NgkmR7VB3rwVOzFRofC0mYAwAWoW9aFkREUyuMGUi6NF6cb+FYuEezAgeIWrFeBTvaeSfMU
	5N/k95SZAGdd7cCC1Je15v5ogywLSlhbLCLWsgfWaSwcEb6TtzqM+m06flrhMjlAqwzSZcYXwhPMr
	KIMWbqre84sjyJyU0qk5jwlrbGEn9iTrzF4nwX2y1TG8g/7hbO3Jo+k6rbo9Rvpzp57gKWXaTppli
	spTJu4t/E1+uZKEsVSdwBZB0h6q75AN34KyBott9Wis8tTf6z7L/7pgbMKUl3CHjfPA0W0GRTCZRa
	e8hWyQ1YE6Iq8DxuUUwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5bMR-00000006zPF-30kV;
	Sat, 11 May 2024 01:17:15 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5bMO-00000006zOZ-1aum
	for linux-riscv@lists.infradead.org;
	Sat, 11 May 2024 01:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715390232; x=1746926232;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5PTzYr/zMAQfcfgoe3DJspHWOjU+6tJzSsnBVB3YmXI=;
  b=mUetpy+73aszLR/tOP91FsnMJDgY9eR+1yo2y7G29z2/DyFS8YdATwub
   4uJrkXg0ebiNtRV1WB8ioOql1ckEG3UhYhhdIHltE4wN/7M2G4dQpw4JM
   J2IXHr1Vu0xGDMRwbx+veTKT3+OjGn9U/U3d3kSvzvr9AJ/5jQkAkR2tq
   DVnmMd6SGLqscbR2u7zNtkuA5MhgVMq0f4KRJg8B+YdY4FrVzCTa9vv2S
   0wYHrKH4+7HEDJrqmBF5V/Uh2WfesYw4ay+zldO73p/BGvo9Dhikd0mPw
   mQDTf6n6q64VxphvPagxE/AbS5bQqofeHNquinPVmIjbZogofWwZmWw9h
   w==;
X-CSE-ConnectionGUID: yk78u6TiTnChT+figYxSTw==
X-CSE-MsgGUID: kok04hRqSmGeAeHKaQehvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="14344273"
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="14344273"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 18:17:09 -0700
X-CSE-ConnectionGUID: ldpt4ZymTeOiapl5UqqoAw==
X-CSE-MsgGUID: W/r22RCZRtywZHrnbM4v7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="29797147"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 May 2024 18:17:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 18:17:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 18:17:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 10 May 2024 18:17:08 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 10 May 2024 18:17:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1sjcsoF6z750nbN+vWhoAycs6j/VLzHt4bIMnRNqTMuV9eOoLVk+eOw6IjC+/YOJSGrXaH6kjmwUzxeGtbFV9v01ZaciBRDRIflzK8YzilYBUN+W7Ib1EalIG5B4147d1xoReSo/1htgUj2lTnFAwErvSF41thMp6OK23wd0wlL+/xykdrS9biNSANhLYL9T8JS0qI+7I9GC/Fm6bwL5xE9ya8Irc4bv7O2y1QphSXrg6xdhXFBlBECKI7yTG+LJGilwlRjRnr+cjYTxN1BePvxCSnp35GpBl7By7QAAsjgCFmGm78ykCEbqqL+D1bJqgAcWSDtbMD3mvhFU4/7dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oA9wvVkSIyDvJRcmIXB9NFWj96/UWxVuOaqtXhLW2k=;
 b=jqLMEQA4sPOxQX0pT3sVtI1uUOE/tmgZVdMpIzcpeUoaw1ZzYbh5jE5ES7PpDaTc0u5nnDbLb6Ivo4TF0/pni7u4iba1hbWYkyRkPx/EZaKNjzIj9urinFN9eMmEMBTFULVXWcVAVl5ld0/zIwkD7qYrj63/WYvvPZ+r3U7Q7lE7+fyaegbZDRkp9nN8z1WV6FM/LVXlSR3jFgbH5mwq1iHPNAgzl7HtJA6YPk+fU9LYl82NGhbybOtrfDmQYlC72oHd1qnwOFVy2X39oW6zKSt2j3IZjg3gxl90QUKnsJa+YPkNrj3bXrSHd6OV79sIFoQO5qT8XCu83rdKxH3eTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH8PR11MB6610.namprd11.prod.outlook.com (2603:10b6:510:1cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Sat, 11 May
 2024 01:17:04 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840%2]) with mapi id 15.20.7544.052; Sat, 11 May 2024
 01:17:04 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: Conor Dooley <conor@kernel.org>
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
	<pulehui@huawei.com>, "Li, Haicheng" <haicheng.li@intel.com>
Subject: RE: [PATCH] riscv, bpf: Optimize zextw insn with Zba extension
Thread-Topic: [PATCH] riscv, bpf: Optimize zextw insn with Zba extension
Thread-Index: AQHaoGtgQt2dALTuk0aEsDxXE25q4rGQ+B6AgABIbUA=
Date: Sat, 11 May 2024 01:17:04 +0000
Message-ID: <DM8PR11MB57513749704B776A9E51151BB8E02@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20240507104528.435980-1-xiao.w.wang@intel.com>
 <20240510-essay-subwoofer-e055375ff1cb@spud>
In-Reply-To: <20240510-essay-subwoofer-e055375ff1cb@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH8PR11MB6610:EE_
x-ms-office365-filtering-correlation-id: b5938b18-efcc-4781-be34-08dc715811a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|7416005|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?Windows-1252?Q?pXARCVmF4pkpv4oGLZD1WYWFth8SIg7cf5dQIpCD4vn0uZTWwtnH4Hsg?=
 =?Windows-1252?Q?yZH3UjZGIB+pAVJNKa1mMw1tstitmhLAlq2VDvziJA5clS3IrsAM1uCN?=
 =?Windows-1252?Q?qyimSNAofXnd4D/YjQ14bXEdfnFVTsLtAd7nHatgRM0alFIpuOdQBaPv?=
 =?Windows-1252?Q?CrZnFLHdTJg4/NiboHX6+jKnV6k9tgaNIogYOu7M3UMIvhDCCTSGzcJI?=
 =?Windows-1252?Q?i/tdH345SRc4cNli3Zymn86TXzNUaghQjKfmuC3X8z99AXwMuuvMN0tx?=
 =?Windows-1252?Q?UHo9BmVtL7PDQPc+7U2dheqIqD9Yfz1YTLInUUCtSe/hC+1keZf57pP/?=
 =?Windows-1252?Q?s7wC9vavibXYGo4SLuNEbNapNS1S4H4xMMJHjpYlOWIwjDL9nLn9lLZr?=
 =?Windows-1252?Q?ySDDDuXxIJArrnmTw8ujaMrPmDTVBpZJsfK3FFQPCdFko1+UH7HqbjBa?=
 =?Windows-1252?Q?/TOx/iDm92IYStmHCS/kCmmUk50XhmU2XZGwTYGZ9Er6Yd72TJt0dMZZ?=
 =?Windows-1252?Q?Ik24DUihvamy/YKP41RTSii5Tygn3c78qOErddRglZEmRDx4x5wTWTqJ?=
 =?Windows-1252?Q?5Cr0gFsM/PFd0RCbYTGArYGo1ON8GIsQbWjSy8wxdigt/zNr5PxD+u0/?=
 =?Windows-1252?Q?oDt2hrYWgEip1E8M577/mx5LF30iOScNPyG2BUSC4/fItNiIn5cQaybL?=
 =?Windows-1252?Q?+aJDPoQVgwtWwy9PZH7vTBN8G/I14xlZeqcgKnGDlAZjdUH5PJYmlz3R?=
 =?Windows-1252?Q?g6x3NbGkK7WkWQdeVbAxpcMgDRmkMP5yVX2jv7QsRPcVDHaCkJ59uKUp?=
 =?Windows-1252?Q?tJZFgzgMrVmEZiPKc4rqa1r0WyPL/AkmfNJorheCMV0MeQPHZzFspf7y?=
 =?Windows-1252?Q?PLpFrdBidBhgl4WTvCpKgffpIHF3IwuPXJCBSKVcV0Q7WQqc0ooFR2iL?=
 =?Windows-1252?Q?+cEcK8DedTnv7cSVCMCF7tpoojRKHxi/DfSeb3x3i1hCpJvztw/Imwmf?=
 =?Windows-1252?Q?1Gm3nN7G33nqmAz1AFPO9HDQMwZulwZXLwoJ1R4MN0UdoWOcNuQ6F+W+?=
 =?Windows-1252?Q?eufRyq73CHb3nASn2UnSK653djCd+RfdTtWJzvRYb42qRGxhvhjlew4/?=
 =?Windows-1252?Q?0khrkDKFe5+BQ1TomNHhLWXNQ2jXZfyrVEkZiRZEglMmpk/urvyzMt9d?=
 =?Windows-1252?Q?4Ftcg1qt/weDUFDmp6MOHCVe7F4NasZIMan8cOAAugtbr234GooB8JQ5?=
 =?Windows-1252?Q?7as/b1wdeicLTgBns4p3rPkrLB8VA76PvPC2QZT2I1PvNMB+uIAxANZ8?=
 =?Windows-1252?Q?p1vyehMm2VfhSfrxzgtrQ1FMhUOKrMzrDW/eenwadkgEYcMbDuL0e1oR?=
 =?Windows-1252?Q?dX0Pdnz4JkUfLUDxmbTgRZ5Yp1GptCrjtVQ98fYDDfpvSxA6u3J+Wn/p?=
 =?Windows-1252?Q?ed0iymHjSu3LvwYCkElT9A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?aB05xWqxCFQL6p0UbF0KukuAxHTUh1XdM1cjt/VV3MZ+ih08BeOoQg2f?=
 =?Windows-1252?Q?Mqa06ZTfGYaQixJsOGImQp4QbUQwfEba+ExaoAeW3ThAap0h7lWiUUSc?=
 =?Windows-1252?Q?Y1Aqy7T5DMgaNYkLtOskJcYqm0b0YfmkrzC1pz9q/7/aXKj0mnl11B7p?=
 =?Windows-1252?Q?HKQIskKD15dVcvf7JG1AaIei0Ogp+sO5LkIUmlyxQbCGZxTXdMz7tqtg?=
 =?Windows-1252?Q?5kkQ+beTGxZLhbOzkRkZi8OMNEPLyrZo5qzz3hjPfvQx3y1PshzMsZsy?=
 =?Windows-1252?Q?LjkepcanMx5bFDPaBsju0XSSZ2aQLUcUCxkj5A/oTaYsrD6X+8MAoese?=
 =?Windows-1252?Q?WKEyGXjTHHvmhuDm8BlXdgO8z+IzQB9Vsdi1UlSzw9T4BwJHoQb3VjsM?=
 =?Windows-1252?Q?JBLrp879wCo0XoN1UIBMIBZ+4i2cy040mUah78OsCyoOlE8Hg9+/nbW3?=
 =?Windows-1252?Q?+fIjuF2hiXTp6RljcQA1Xr95ld5D4hWlL7XPdkfW94iK/5XEMsBIPwRt?=
 =?Windows-1252?Q?CURBzO1KuUqMnoHoaf1c0zOmkn2eP/FwHKSiVcZMzTVtgm2lyLCjKbha?=
 =?Windows-1252?Q?wCvXAYltIzVY9+ZxuZmE/FO+H12w9vdN0BzcTbDKWxRwJaOKaJC7UYP9?=
 =?Windows-1252?Q?TmBe7WDIdLQSEZHvZ5yXx6/tIhR0lXbD8Hva3dJ4hEnsvbeEJ6XnGKWR?=
 =?Windows-1252?Q?gxyOG+2i840dZwcf8esOb65NSEP6oECKt/CG55cJIz2NbkVOCo/0g/sJ?=
 =?Windows-1252?Q?53Rh46KGXgF18JsJR/geDxdaelnSmaSLFCiQuPMJdf71L10pyKGEmlou?=
 =?Windows-1252?Q?+8o64XDo802ZQw+2wZras/9dz+F+70etuP5LN+KNCXFjPvWxuM0cTBzm?=
 =?Windows-1252?Q?NpioCtA+rkjQ/CVrcwbq8n6hoq4eObCh5vRpClQo2UI1VfWdwV9S4hxb?=
 =?Windows-1252?Q?JkMkCNxSkywmli0ZNyO3RvIEnspcZzmVludgkwAUuk8qWG4C7AIjcPqR?=
 =?Windows-1252?Q?SMZRpMs7MXhe6mx48Hw3rEexqminRjW8r8Y4DfxZeYZXHbj99BldV9AL?=
 =?Windows-1252?Q?k0bdLQg1CIeY7SMXtCPsHkLTOKvqRDCMRyOOMbnG/PrFneT0g/UJTDca?=
 =?Windows-1252?Q?7uCE5OhCzUj/y2EMWH+wAtZfbvx6lFK0dzc6cr9Swarrf7WxqoCMUQts?=
 =?Windows-1252?Q?oSH/MeOFVeQ7T95yy5TO/rkns23QAQe/BZkBb4u4bC02uEC/4B3l91E0?=
 =?Windows-1252?Q?2jcetq9TGzVBu3MzbalFV8sE75291cAyTP+swsw1yqEv+N+rblpqMhw3?=
 =?Windows-1252?Q?I8PZREpwzaUlyecEaFt6XF4Y2enOAXkrtxsSN7Hf5Cf6x7mcxSNT4+aS?=
 =?Windows-1252?Q?PPGHGSMXKLSyt7XV0x08UO0JJxEgrKdox+fHQSRuAjMZi0Qlf2I9w0TX?=
 =?Windows-1252?Q?AhVUY6emcWUUOp+EyvAUng8rzRUIY13sZx+fj2zNAVAKWkEVgJdusDS9?=
 =?Windows-1252?Q?Vn0ofPV2hWhVioxxc1bhFsFAyLWNss6B4i69vitp6NlRxjHZx0+9AphG?=
 =?Windows-1252?Q?kVhYhMKFuzX5hNSFeVDRLR59GPFKrfoljS2dzj4ZKFxBuuE5AEjazR0n?=
 =?Windows-1252?Q?ORzn2tj8/Lc8KstLnDpySt4m9Vc9c8lynwWd2OA9GoLaG1j/yFQqedu2?=
 =?Windows-1252?Q?vSVPRqwHUqjaJ0xvIzqx41q5Bbo1TvvO?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5938b18-efcc-4781-be34-08dc715811a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2024 01:17:04.6793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4N+JrSk4WHZKH7UYV+EeDfAXUMVxiVP0b/cqkIpuy07o0ez8xuHelDvuxWg5JuLufIjcxGSgaWvZOkqcLegpAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6610
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_181712_496996_70756A47 
X-CRM114-Status: GOOD (  21.90  )
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
> From: Conor Dooley <conor@kernel.org>
> Sent: Saturday, May 11, 2024 4:56 AM
> To: Wang, Xiao W <xiao.w.wang@intel.com>
> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> aou@eecs.berkeley.edu; luke.r.nels@gmail.com; xi.wang@gmail.com;
> bjorn@kernel.org; ast@kernel.org; daniel@iogearbox.net; andrii@kernel.org;
> martin.lau@linux.dev; eddyz87@gmail.com; song@kernel.org;
> yonghong.song@linux.dev; john.fastabend@gmail.com; kpsingh@kernel.org;
> sdf@google.com; haoluo@google.com; jolsa@kernel.org; linux-
> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; bpf@vger.kernel.org;
> pulehui@huawei.com; Li, Haicheng <haicheng.li@intel.com>
> Subject: Re: [PATCH] riscv, bpf: Optimize zextw insn with Zba extension
> 
> On Tue, May 07, 2024 at 06:45:28PM +0800, Xiao Wang wrote:
> > The Zba extension provides add.uw insn which can be used to implement
> > zext.w with rs2 set as ZERO.
> >
> > Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> > ---
> >  arch/riscv/Kconfig       | 19 +++++++++++++++++++
> >  arch/riscv/net/bpf_jit.h | 18 ++++++++++++++++++
> >  2 files changed, 37 insertions(+)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 6bec1bce6586..0679127cc0ea 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -586,6 +586,14 @@ config RISCV_ISA_V_PREEMPTIVE
> >  	  preemption. Enabling this config will result in higher memory
> >  	  consumption due to the allocation of per-task's kernel Vector
> context.
> >
> > +config TOOLCHAIN_HAS_ZBA
> > +	bool
> > +	default y
> > +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zba)
> > +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
> > +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> > +	depends on AS_HAS_OPTION_ARCH
> > +
> >  config TOOLCHAIN_HAS_ZBB
> >  	bool
> >  	default y
> > @@ -601,6 +609,17 @@ config TOOLCHAIN_HAS_VECTOR_CRYPTO
> >  	def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
> >  	depends on AS_HAS_OPTION_ARCH
> >
> > +config RISCV_ISA_ZBA
> > +	bool "Zba extension support for bit manipulation instructions"
> > +	depends on TOOLCHAIN_HAS_ZBA
> > +	depends on RISCV_ALTERNATIVE
> > +	default y
> > +	help
> > +	   Adds support to dynamically detect the presence of the ZBA
> > +	   extension (address generation acceleration) and enable its usage.
> 
> Recently I sent some patches to reword other extensions' help text,
> because the "add support to dynamically detect" had confused people a
> bit. Dynamic detection is done regardless of config options for Zba.
> The wording I went with in my patch for Zbb was:
> 	   Add support for enabling optimisations in the kernel when the
> 	   Zbb extension is detected at boot.
> Could you use something similar here in the opening sentence please?

Agree with you. Yes, I would reword it in next version.

Thanks,
Xiao

> 
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
