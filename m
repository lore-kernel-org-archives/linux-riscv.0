Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB009C55182
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 18:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8slerKpsL7d8tKAuuW3QgP0WsSFCHRez4w2w87JDQU=; b=HnvMCc/oBueU9P
	Q60OdSmP6h5PN3Rty9bW0T4I/bNfOa3TEdRdS/DrZ73MwZE7QUN2SoBUZrdr16tsZcdVgtnQFjDL6
	tuM/EaGkLCkGJELS1pPJ6Kzg8UGq9URV5nssow6uFwhzFIyUL8dvLho/zGCk8jV+trsDDsYeFbIyk
	wO1pAiKEqUMrhjovWzt6P96DMlU7m32+nmbrDe6pEgp1c+XgkYPV/HUSwT1uzIKn+CHlhSmyaeNPZ
	UZG8Ayu5gsKQ8YphKpbILHqqx+/CEUDD2z1J2PkQuG9hhClUMBYEGBmwCFv9oidmaprNiiejeZnV9
	kSSB/4KKC9aBvZyfMagQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqxB4-00000000M0r-3NYJ;
	Mon, 03 Aug 2026 18:14:18 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqxB1-00000000Lz1-1dCI
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 18:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785780856; x=1817316856;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4VEEqqAEjwd9lwggzzHnXzMS1oGFdzRulGQOX6SQYUM=;
  b=deWUbXVv5huLoeKwFUIAa2AYIWtva+1uM7mpIUUeGA98kzfFuIyx6Rm8
   O/YKo3c+mNp6XnE7YyFrQkAg8umVL+NsefSs/DzJJgyJwaZstARNJcz6K
   ExyBzy7Yg+TVdI6y+Pqwg+AcT138RQEk3V8uY+qIqHmBD0XRd5e8mX+/A
   KOrxlnFLyBwo20cIcAs/yEFjChT4bZsDHP3hOWA6A3bUz9bBx7dHskLK/
   l7yDYHpklUZ6d1hyj6/NjBhhocevd7g44c2QMh9M3IX1ezhFt9JN5EPRz
   ZBG3wOQP1nsh9OKx1Jg7XFzpO5GjviZ5PAJTacHyjRp0gXEFwM5UGoVaz
   Q==;
X-CSE-ConnectionGUID: ot5dbv/DTtCazPRr+ArUOw==
X-CSE-MsgGUID: 6KGK3+gzTvCrbW0koSMkEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="85302307"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="85302307"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 11:14:13 -0700
X-CSE-ConnectionGUID: V054y5eGTP2Aew7WTIHcDQ==
X-CSE-MsgGUID: yeRYKPGfT8CRGyWqGSvS/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="299509022"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 11:14:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 11:14:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 11:14:12 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 11:14:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Re/GXhd18LPmiTPctNPS3jqYojNUepWwZuRBAymXanXoji5optYvNavM7kQKvJpnDGybuMXpbY9GJaIJq/CedreSwNI15B3mKuhjHc4VzXm9eswi/8r9BKg9j1Xw5gHn6gHo7aghwh9lyRhnQ8LxrXCV8neId8s9Lbj6SrwG6hTPXKb/zBckcZ3y/XzSHaEzKrhI/f8arUUYsg0KVPHNYLaTExnvDeuKBXZZwND94RUsJ9tcvyUWQaLc3XiWfIBotJqHAaf1seTNkGy7pKzo5IUgDeJZ3Go0uKbTR2TdMfMAg6UiYik/EijGMF5SppLCVug05S5wb73xDnwhCQ7Pbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VEEqqAEjwd9lwggzzHnXzMS1oGFdzRulGQOX6SQYUM=;
 b=QVPPjYx40CCbBP+rr0vkWvEn+kjK5+gBJ7ozDYxDVchsqFaF4VExteSbKW6YHlKRff3BmdIhPHhHReq2N/7x/L5pqiGyfJNhrQiBVkJboduIOsxIGGozt/B3UbQuinY6uD0SnIxTk1AE6pE2hgUL+pCniVJhgC5yu/oJoNpWCSDzvkqfOwBmJZN4vqJdePionivwE2QMYJaubGLQq1xUV02nMtllTk4JTMjJijfI+QdV+i227t/f6S6J/Nf23AhaaASnInSQH37sNlGLTX8rCEGo4nK4wn3teEkknjoYjNFE9ALvlKAL1Sn8IqoI9RJmKLeCG/wR7vEbWAgEdGwNfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by SA3PR11MB069086.namprd11.prod.outlook.com (2603:10b6:806:532::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 18:14:10 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 18:14:10 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "shuah@kernel.org" <shuah@kernel.org>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"pjw@kernel.org" <pjw@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"mingo@redhat.com" <mingo@redhat.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "x86@kernel.org" <x86@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "bill.roberts@arm.com"
	<bill.roberts@arm.com>, "alex@ghiti.fr" <alex@ghiti.fr>, "tglx@kernel.org"
	<tglx@kernel.org>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 1/2] x86/shstk: support via prctl
Thread-Topic: [PATCH 1/2] x86/shstk: support via prctl
Thread-Index: AQHdH1qLic+v9tAIz0KjQXVrF57uc7aEfrSAgAghPQCAAAkbgA==
Date: Mon, 3 Aug 2026 18:14:10 +0000
Message-ID: <ccdeeca8fe9c6d3e0378891953ba9249557fea2a.camel@intel.com>
References: <20260714154740.140431-1-bill.roberts@arm.com>
	 <20260714154740.140431-2-bill.roberts@arm.com>
	 <33ac05a617a26b3d9c4a374d14a4f210bba0a991.camel@intel.com>
	 <51064f94-be8d-4901-845c-9f4a5e46a337@arm.com>
In-Reply-To: <51064f94-be8d-4901-845c-9f4a5e46a337@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|SA3PR11MB069086:EE_
x-ms-office365-filtering-correlation-id: 4c1d5c08-d25b-46f1-fa32-08def18b03ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|38070700021|921020|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: MMQxbz7v4cqICRo6mkI+rQt6bZ6YX4/Lwmhz/iIvTc3IJ8K8CRYeaQj4U80wquOpjPfeqOsnl5bZQ5N3LM2KzWEzLI1bmLKJBgdj5C5AF0kPkXoMZdfdMlSr61zpXi+59d5+Nguv7NJjTL8w/U5jLgY5IpKBc0u4WQBJwO58rwnWnS/IyNMVtqU2cafOT+0S6FIXvJ28TidZ3/rxiFkmU06vR6ROorUgQblBUcAuOnPFUGRXAEn4XYMRlZAoxRD/DJqMrjc92eqynFK6QzHzoGdPWECidOZtNKpShPcBvk2zjDr7l6ijI22X0kZpwqeDfhC8j643UYeOcGn70YQ6Ssmq0N8L5ZKfIxWnSchS/OXcJe5G0AVLb79An/nwQlwjcOJNOsCq9X0fIlm6vg/zpi5w+mvq4q03bah0timVTGRQ5WLL3qjHGfyeipKfDFeohe0nrCNdsPP/x0Y/rGfz7u+hlZOa53zlD7DoMnQcthavip2z0WJLUon5iFiilI/kY/0TQBqM+cxTNtNnTWgSLStBL3Xsosm+0hnDRR5pEFGTTqUFixrdY4W6bocRpbHugtpmWbEhDvGSzyQi5oGeqszZBlyrJophHrP2AYssSYedJuiJJLyo+5oTIi8Te1iGDt5srgmmMDMQKHmkdKXo8KlfODQ5k4wtBo21/m4Jn66GiBEzOx4abbQ3xtsB6VKt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(38070700021)(921020)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmc2NkNVcUx6OGVZTllBS2tPZEhZa3cvRXRHWCtDcWFEZ002SVBhWGxzcTB6?=
 =?utf-8?B?Tnl1Snh1dUN0YlZNZUdYWEoreXJmaWpjZk93TmRzbzE0K2hmelhYbTFGeno4?=
 =?utf-8?B?VUtyWjlLeHJzZFBldm1rTUZFMUFzbTJYNTN6UWRaUVlHUzZFRlJsYnNLUHNs?=
 =?utf-8?B?VkpQK3p2S0l4b2ROZ3FLOGFFTHY2K1BXSkczTDRvaHBlKzR1c1lRL3VxSTNF?=
 =?utf-8?B?OW5QdzJwWityR2VBSjZ1VklHV3NacnhXcW9vWVdQaXVKVlVsekowZFkxcHlq?=
 =?utf-8?B?Y0JhYWU5ZW5EL2NYaW03Q2ZyQ2Z4eWJvQzB3UytaRkIzNFF5RmIwdnVPVU8x?=
 =?utf-8?B?NTNZa05TT0xEd0FpMFlpY085QW5RaldxQk13RE9KWnQ5dDBZZzNjZms0NCt0?=
 =?utf-8?B?NEhnbnpPalVSUnRZTDlGc1h5aHhyTEdqeWdIRjhSVHNNWWxQa0NYaDVYeWRs?=
 =?utf-8?B?SjROZDFsTUtaMEZJcjhXM2pvZnhSTStzbEh2MUZHVnZtVXNjNE5GWmUwdno2?=
 =?utf-8?B?WmlmbW5OTEFyb29KWTA3UG9iNTQ4d2l3YkU5T3RrYi9mQ3RDL01oN2FkbEZY?=
 =?utf-8?B?RFBFWHNFUGZrakJTV0lTV1VMd0RMckV2MG41cW9rZFlNY3JRc0thRmRNNmxs?=
 =?utf-8?B?MzM1NXRtZXVEa0U5YzFraDBhVVVLcDVWQkd1Q3Q1Zi95QjZDMzVxSjQzWjV6?=
 =?utf-8?B?TFlFUi9mR0xLSGtpajhmSS9VclFLczBaekRYSmNMQm1wSDVhc21PNTNmRkRC?=
 =?utf-8?B?T2ZVNS9rekFpT0ExbmJYbEdselRNZzNVRVRDYnlaeUFnR1I5S2t3bWtpNHFS?=
 =?utf-8?B?b3VVMDIrN2RuZDVIRG0yTUlCamh2WlhLQ2F0NHhsUFBuVlE1ZjVqY3Y5Wk9Y?=
 =?utf-8?B?WjlRb2JTbUd1UFRnb2JBUHc5NjFEOGJYNTVoMUtHWHlMcjVuNW5PQ2tkeXd5?=
 =?utf-8?B?bGV3Mk43YXM0N0FpMnhWbXVFVXJxbGFhczRvVGNJeWpVTmdsQ0JPWmFPOVlX?=
 =?utf-8?B?bkR1SkZLTy9oNFd1SkFVNGdxVmk2NXJ2M0psYnlSZmd6UXM2M25KNDVqWGxi?=
 =?utf-8?B?VTE0WnZ4ZGFmTUlsdTFkN3lDSVRyVUZPaW9JNVl6Q1YvSHRVckc1OHBIdHlO?=
 =?utf-8?B?UzRES2dSZlBIMC80Z1hXWDhMY2xtWDJhWkdDMnA0WXJidHNvMjE5R3MzNGow?=
 =?utf-8?B?U0puMThDNHNZMFk2TWVnZTRycVd3SS9lZis3bmQ0NFd4cGpGbmVaTVFqcHY1?=
 =?utf-8?B?bG1heWozc3NKN05JeWFmUTArVW5HUWtaak1sZ25MWW9qZ1JjKzFNN2lTWURz?=
 =?utf-8?B?S1BrU2xIcHpxQWVQajZLSTlKbm1NY1kreEVhcndkN1lVa0FKWTFKVy80Y3RR?=
 =?utf-8?B?Sjg4ZHlEbmFzQTBmS214S2hTTlM1bzBZNm9WWlY2dFIzWUR6NlFNWXo1azdP?=
 =?utf-8?B?L1JiV3pqay8xYUowM2J1MTB6UUtaR2hYM2Q1RzY5M2Z4UjRWakhuWUp1ZjNZ?=
 =?utf-8?B?S2FHc3BCYlFYNDRoSUI3amh5ZjExb0l6RDk2bTU2cDZEaXNFekpLSFBlakRH?=
 =?utf-8?B?NVBFbWJjWmdWb0lsa0FvdnN5R01qRzhodzE0d1ZyNmY4ZFJab2ZNNjdlOGxh?=
 =?utf-8?B?TlB4VnRkUndEODZKcFBxcjB0MWdETXhQbENXMXVHaHRFa0RmcktpaTBpcEEz?=
 =?utf-8?B?V2lTZzRwSy9Mclg2YkpqTXBsc0hxaDZKQVBvaGZDaisyL2thVDFDS0g4WHlQ?=
 =?utf-8?B?NmhtOFd3MENuaHVaV3dmWHI5VTJGblJ4bGFuZXJvM0pPbWY5WWN5U2gxN1V4?=
 =?utf-8?B?WEhGZEErUHN1aGJKbk5JMDl4eDZjVkpMSkRDQW9ETERDb3RDa2YyV05WNXpI?=
 =?utf-8?B?SDJkb0Fzb20zaXdGaFFPdHd3eDE1eGdQZ3U2Yks2cklpRm9RbDBUSnFzV2Uv?=
 =?utf-8?B?ZlUzNmNNREpWcHlVdVErY09JRlpCeWNvN2ZSR2lRZ2FNMlNuSm9IMVg1Y1Vn?=
 =?utf-8?B?eFN6SnpoL1A5UDJDNGlLd29zUUN6OEZkaVdnMXpsZDVWWHJrVG1tdm5FTzVJ?=
 =?utf-8?B?ak5JOUtaaE9HaDZsZmJkdE5UWk1peGpBeVRjdTcxVWNsRTFHdHVWYTM5bm11?=
 =?utf-8?B?b1FyUzhoa0hWZWhpdXpyZ0Y5SHlvOTlSb2NhMDBySTFSdEpVYjNrL01VWjg1?=
 =?utf-8?B?aDRSdjcvNW1ScDZrRDB2MDV3R1NKekhPRWZYaDI3emo5N3hMU0ZublR4UjVV?=
 =?utf-8?B?UkpTNHYvQWlSaU9yN0lORjhaUXplUzlKYlFJV2J4UnZMeTl3dHZyQU9DWi9Y?=
 =?utf-8?B?RG0xemkxWUR2enZ6RUpWcGp4Sm9pOWV1eDlkODdmSlF1UFRqbnR0Q1R1RzEw?=
 =?utf-8?Q?68nTm4hBaNWnrbvY=3D?=
Content-ID: <036DE1F084B4624CBF68F103CC17C082@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OgxE2mFemrBrLhjGwI9Og5woQ3TE8k0UWD0UxYBZQ+gbt+WYYecFo7xrJI7y46BBj6cMKQImBW5a7WT3m66YsDXECQKV5kXBteo9PWTjuc+IzxDsq4miYa5HUupv2FFKek5LXZaa26RarbjLe3WCCi/iHYlU4gMHvrwkyaB4XhJZQDK4kr8oAbx0jfalTo1/C1EaVNwYBUOr8LhqgNhifcFmpdQIseLwqekR+WFa+8U18MvRPqgYZLyueIHl0InW6mXunJBGtZn65Frtq0AtLf9VOos8Qx5bei8R8/JwuCLcmplb721Sl7qEz4u148cX6Y1Il/+OIksCjdAqE6WzqA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1d5c08-d25b-46f1-fa32-08def18b03ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 18:14:10.1117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YNODfQ1aQrHOPaNfIADH/G2y2kPboY3ArT/x6skIjqQK6VkX/+ddI/70bnKjDWdvC2vkKtCxHjWl5stwhelbw4ygdW6CtoSzogZn3XQg0oY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB069086
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_111415_441406_D4460C2E 
X-CRM114-Status: GOOD (  17.53  )
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

T24gTW9uLCAyMDI2LTA4LTAzIGF0IDEyOjQxIC0wNTAwLCBCaWxsIFJvYmVydHMgd3JvdGU6DQo+
ID4gPiBNYXAgdGhlIGdlbmVyaWMgUFJfU0hBRE9XX1NUQUNLX0VOQUJMRSwgUFJfU0hBRE9XX1NU
QUNLX0RJU0FCTEUsIGFuZA0KPiA+ID4gUFJfU0hBRE9XX1NUQUNLX0xPQ0sgb3BlcmF0aW9ucyBv
bnRvIHRoZSB1bmRlcmx5aW5nIHg4NiBpbnRlcm5hbCBDRVQNCj4gPiA+IGhlbHBlcg0KPiA+ID4g
cm91dGluZXMuIFRoaXMgYWxsb3dzIHBvcnRhYmxlIHVzZXJzcGFjZSBhcHBsaWNhdGlvbnMgdG8g
dG9nZ2xlIG9yIHF1ZXJ5DQo+ID4gPiBzaGFkb3cgc3RhY2sgc3RhdGVzIHdpdGhvdXQgcmVseWlu
ZyBvbiBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgc3lzdGVtIGNhbGxzLA0KPiA+ID4gd2hpbGUgbWFp
bnRhaW5pbmcgYmFja3dhcmQgY29tcGF0aWJpbGl0eSB3aXRoIGV4aXN0aW5nIGFyY2hfcHJjdGwo
KSBjYWxscy4NCj4gPiBDYW4geW91IGV4cGxhaW4gd2h5IG5vdCB0byBpbmNsdWRlIEFSQ0hfU0hT
VEtfVU5MT0NLPw0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvZTEzNjI3MzJiYTg2
OTkwYjc3MDdkM2Y1Yjc4NTM1OGI3N2M1Zjg5Ni5jYW1lbEBpbnRlbC5jb20NCj4gwqBGcm9tIHdo
YXQgSSBjYW4gdGVsbCwgdGhlcmUgaXMgbm8gYW5hbG9nb3VzIG9wZXJhdGlvbiBpbiB0aGUgY29t
bW9uIA0KPiBmbG93LCB5b3UgbG9jayB0aGUgdGhyZWFkIGZlYXR1cmVzLCBhbmQNCj4gdGhlIGZl
YXR1cmVzIGFyZSBsb2NrZWQgaW4gcGVycGV0dWl0eSBmb3IgdGhlIHRocmVhZC4gSWYgeW91IG5l
ZWQgZmx1aWQgDQo+IGNoYW5nZXMgdG8gdGhlc2UgYml0cywgeW91IGp1c3QgZG9uJ3QgbG9jaw0K
PiBpdC4gSWYgaW4gdGhlIGZ1dHVyZSB0aGUgZ2VuZXJpYyBpbnRlcmZhY2UgZ2V0cyB0aGlzLCB0
aGVuIGl0IHdvdWxkIG1ha2UgDQo+IHNlbnNlIGZvciBzdXJlLg0KDQpwdHJhY2UgaGFzIGFzIHNw
ZWNpYWwgaGFuZGxpbmcgZm9yIGFyY2hfcHJjdGwuIFNvIHRvIHVubG9jayBmb3IgQ1JJVSAod2hl
cmUNCnVubG9jayBjYW1lIGZyb20pLCBpdCBuZWVkcyB0byBnbyB2aWEgYXJjaF9wcmN0bC4gSSB3
b25kZXIgd2hhdCB0aGUgb3RoZXIgYXJjaCdzDQp3aWxsIGRvIGZvciB0aGlzLiBJZiB3ZSB1bmlm
eSB0aGUgQUJJLCBpdCBzZWVtcyB0aGUgZ2VuZXJpYyBvbmUgdGhhdCBpcyBnZXR0aW5nDQppbXBs
ZW1lbnRlZCBpbiB0aGlzIHNlcmllcyBpcyBpbmNvbXBsZXRlLiBVbmxlc3MgdGhlIEFQSSB3aWxs
IGJlIHNwbGl0IGFsd2F5cw0KYmV0d2VlbiB0aGUgdHdvIHN5c2NhbGxzLg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
