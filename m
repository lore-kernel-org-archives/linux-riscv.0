Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C81D6CFAA
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 00:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfL6woFF0wTDk4aBME/Z7FRLDPQ6iDaDPo0uGfqiNgo=; b=tFofJogNt4Pmeq
	jx6D6+takGTZEHe6JtO+HcAVQd0uZNkqMOfWwmodeHn8+9eMgsTq7w2iivJqCuI6s1T/BGvk46weU
	39lE/zIEmrUYqYnRiEROf8RAOmew/PmSgAKFuo+9G+j1CeGdDuEcjtQnAXv2tqZ+WgPJ5ENH6+znR
	8kQ/m1zOvuBxCCRL9XYklyAq+zxmJB3cTugTH9yVk/5jKaysJt3TU9/RnN+E5/TM2hr1TW1AlBT/Q
	PTPpMHN0lQ/vRpS4yj/oBIU25wcJDplwlKQczIucJzUzhWMPcV4rDaHKOIytWymje7na/Wz0lJEVb
	3HiJQOOuoarInYze9APQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj4c9-00000007ugq-0FrY;
	Fri, 23 Jan 2026 00:01:25 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj4c6-00000007ugS-3MZk;
	Fri, 23 Jan 2026 00:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769126483; x=1800662483;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jwM4DUcK4DQsqwCydbiO4MyEHNJz65wN7gwAZplNs14=;
  b=nfB++E6txaip1UDBpTnuUyAEtamjg75C0o+t/yqmObqjbtrPIW9xCGOh
   HCEfnSj66FtzFjm3d14DXGz8Db4dRnYzNvI1k4Yy09Ln3cqdvrD6y7FmU
   TCjalE8xuBbnhQOLfOEDDxcTlUw+P7SmszDzMjyDvAed7c9Tegut9pJfL
   Uqj6nbN6dMJaLOPeGcEitLRzagftiv7DIleGA4d8NcACmke3yRisEy4E0
   ETgz2vWOjNDBB+TGBsa0LLD2TVdNpxV1dOaKXLvQfny1km5DqigPHDbJK
   hb8xyBiMLpEsN/rBEsVLuqNV0hBebv99IVq4YsbGxMTXgPenebh0yItRG
   Q==;
X-CSE-ConnectionGUID: At1/fUi7RoWowcJ8zZcpAQ==
X-CSE-MsgGUID: 2YC7hLWcSEOF2nVXq1GvSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87955704"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="87955704"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 16:01:21 -0800
X-CSE-ConnectionGUID: pND+2rXPTNCD4jv9JKlFiA==
X-CSE-MsgGUID: w6SOJqVmTamab/pwsdXmew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="207204808"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 16:01:21 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 16:01:20 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 16:01:20 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 16:01:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/IXL481BNubQjeClh+Wt18CNLFNVO8deoXw5TjQ3MrguWxsY6E/tzhd+ISsLa40zQKOF5vMhxM+GXbZa5zODRb15OPzpkGoFUViMZdgSNRVclNaX3DoKvn8F3gU/oQ6cGBfp/irlPUVTDJTLkiW8JWad1rOnA2N5gs7uqHYkeF3YMWouRSepq3vU+jrquMnbvtfYN0kAic6OtV+dtXb/Ehu3fuxP0XCBMDwZz/j9+gzobzwNzetHzeidAX2wTTCU75tWgpLT7nfdMpE19SOsH0sNBlQFY2F+NfYPBft3Ub1li00NFKaDafnkJlBkYgtJTeCW0sAKVogTTz4hJg+wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwM4DUcK4DQsqwCydbiO4MyEHNJz65wN7gwAZplNs14=;
 b=ULxjajzDVDubDRKvQJu2bD0nsHtNcOLuOsEH1fAQ7Z5LVXWUrHcnf/o27xQMsEPo/uAH96C0pihbY6hFN9xP8d/3ahkFCR9Fi2l16MaHy6xdnnXjjv+TDo+hCJoHzOn5zaIO1wbGJ3BamRCNhGqxnMTaZxCVUMLC0toKHCwsv0AKYOu/l3u8HT4UkDpcphXmIc81nrLtLx1fgI7kqvdOYPt5pFcMLy1+LP2tLk4XAJolWoFz/VfFE6RfUStAJPHHHquavRHpf99+/vHQDqx7ENzmZ3lT9UcD3hSyJPlIzV7wuGTiojdZALSsgofBeoefCIDDyAqTBdrUR8o2dk1pdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by PH7PR11MB6055.namprd11.prod.outlook.com (2603:10b6:510:1d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 00:01:10 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65%6]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 00:01:10 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "ackerleytng@google.com" <ackerleytng@google.com>, "Annapurve, Vishal"
	<vannapurve@google.com>
CC: "david@kernel.org" <david@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "jgross@suse.com" <jgross@suse.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "surenb@google.com" <surenb@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "riel@surriel.com" <riel@surriel.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "x86@kernel.org" <x86@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "thuth@redhat.com" <thuth@redhat.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "maz@kernel.org" <maz@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "ast@kernel.org" <ast@kernel.org>, "peterx@redhat.com" <peterx@redhat.com>, "alex@ghiti.fr" <alex@ghiti.fr>, "pjw@kernel.org" <pjw@kernel.org>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "willy@infradead.org" <willy@infradead.org>, "wyihan@google.com" <wyihan@google.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "jmattson@google.com" <jmattson@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "luto@kernel.org" <luto@kernel.org>, "haoluo@google.com" <haoluo@google.com>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "coxu@redhat.com" <coxu@redhat.com>, "mhocko@suse.com" <mhocko@suse.com>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "song@kernel.org" <song@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "kernel@xen0n.name" <kernel@xen0n.name>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "jthoughton@google.com" <jthoughton@google.com>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "Yu, Yu-cheng" <yu-cheng.yu@intel.com>, "peterz@infradead.org" <peterz@infradead.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "hpa@zytor.com" <hpa@zytor.com>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "shuah@kernel.org" <shuah@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "prsampat@amd.com" <prsampat@amd.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, "shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "itazur@amazon.co.uk" <itazur@amazon.co.uk>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "dev.jain@arm.com" <dev.jain@arm.com>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "jackabt@amazon.co.uk" <jackabt@amazon.co.uk>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "andrii@kernel.org" <andrii@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "derekmn@amazon.com" <derekmn@amazon.com>, "xmarcalx@amazon.co.uk" <xmarcalx@amazon.co.uk>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "kalyazin@amazon.co.uk" <kalyazin@amazon.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "jackmanb@google.com" <jackmanb@google.com>, "bp@alien8.de" <bp@alien8.de>, "corbet@lwn.net" <corbet@lwn.net>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "jannh@google.com" <jannh@google.com>,
 "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kas@kernel.org" <kas@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>
Subject: Re: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from direct
 map
Thread-Topic: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from
 direct map
Thread-Index: AQHchnGR8zlgd593vU675Y8ML/1Q0bVT2boAgAE04ACAAAZHAIAJWwcAgAAOpYCAAFa7AIAAFOEA
Date: Fri, 23 Jan 2026 00:01:09 +0000
Message-ID: <f4f2a0297e38ac45e4438342ac2c882b91544acb.camel@intel.com>
References: <20260114134510.1835-1-kalyazin@amazon.com>
	 <20260114134510.1835-8-kalyazin@amazon.com>
	 <ed01838830679880d3eadaf6f11c539b9c72c22d.camel@intel.com>
	 <CAGtprH_qGGRvk3uT74-wWXDiQyY1N1ua+_P2i-0UMmGWovaZuw@mail.gmail.com>
	 <8c1fb4092547e2453ddcdcfab97f06e273ad17d8.camel@intel.com>
	 <CAEvNRgEbG-RhCTsX1D8a3MgEKN2dfMuKj0tY0MZZioEzjw=4Xw@mail.gmail.com>
	 <ee9c649eed3893d852c3d20fb96bdc4904b7c295.camel@intel.com>
	 <CAEvNRgEz0+ic9uvcsWYqWgR5EV=TfY0SAGC39zAL+n19SoBXmw@mail.gmail.com>
In-Reply-To: <CAEvNRgEz0+ic9uvcsWYqWgR5EV=TfY0SAGC39zAL+n19SoBXmw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|PH7PR11MB6055:EE_
x-ms-office365-filtering-correlation-id: 22eaa99e-48d1-4305-ffa5-08de5a1283c9
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?T0I1QU9SQkpQZDV0UjNlQzJzdXg3Sk54bFpNcytiMkNHT2UvQ1hNUm5pTHFh?=
 =?utf-8?B?TU9ScmZUVHI1MVlmallLZmovWGdFbWlXanZrRkNIT29qT1ZFWHVSbnhRNVoz?=
 =?utf-8?B?MVI1dUZwcHhzRGZSUWE3S2RZVHR4Tm1hdk9KTE40cjhwWTZNMDlRakpGRXJZ?=
 =?utf-8?B?UjBhYzFQTnNjRGhkbFVadzRRS1V5OHJPQ2Y2NFJJRk8xU2hHZlRMa1A4cXhS?=
 =?utf-8?B?NERQbHJvc1oyeGZ0SEV2eitJVEtvdGpWTjVXTXpscUhDOWRhcjQzbXYyUkxx?=
 =?utf-8?B?SHkzbWZ6NkRDblNPekhxL2FaT0J5dzVHQzZrMFZKUVdIc2Zucnh6R3R2QlJr?=
 =?utf-8?B?MEg4cDl5dFZEMHZkN1k4N2FVTmxWdkplbGtDY2djMFdtaFd5SVVIdDQ3ZUdR?=
 =?utf-8?B?RWlzNnNycTBFNERYaS8vYnRmVkQ1WnZXd1ZvdURvNnZwRHhWWXpKaUtQclNr?=
 =?utf-8?B?aHY2QVZtNGZ1Y0xwT3ZzWHBnam5Jb29TQ2l2VTRMcVFnSDQzMGhBTDE0aDJt?=
 =?utf-8?B?NFhxV3MzQXVCekdsNUZGNERqc25ETDBBQ1ptNm5Zclk5OWs0bUtaOFEwR2E3?=
 =?utf-8?B?MDVMVVFPS0ZZNUZUbXh5L2ZzYUlQMTErUmtJQitjZmdLcFRYNzFmT2VpU1Nk?=
 =?utf-8?B?b29CeEdkejRmdXNFWE9KSk40SWROSGxXRThjN1JxOHI5TVl5b1RqOU1lbW9O?=
 =?utf-8?B?bXMvM01FWldkV09BRnZVK2pwUXVoemNFblhvZHN4UmxuY0VVL1IxVE1BNWxP?=
 =?utf-8?B?SE1RTi83L001VVh4a1ZFQk5FSFNlaWdmbHM4L1JhUWpMcHQ0RENrYS9rM0dv?=
 =?utf-8?B?Ny9BTWxVYWZPMUFZdU1nUGhOZVZYMWFWbGJCNkJNbUNnSlhudlVlc095Vzcz?=
 =?utf-8?B?OFBNRUN0ODQrdEl2c1BDb2NuanNJWXZJbEpGT3Q4Y0s1RktBbk52aVRvRnpi?=
 =?utf-8?B?MDZKZC83bU1ERjdGREtxR2tVQnJJeVA5QWd0MmhFV3VhSnpmVnEyRGtrQ1Nr?=
 =?utf-8?B?ODVvQy85cFJzN0I0b2xRbHdaZXcwUUJaS0M2TGh1cFZHQ21NL3k3OFJxa1lF?=
 =?utf-8?B?eEpJMTF0UEx2SGIvaVlsSkdOR21PbmhQOXBjNm84Uk92djdvcTJpOHpSTVBK?=
 =?utf-8?B?b0hmQkE1RDJpN0FoaXBqOTdyKzU3SlZzZnBmZ3MwMm5ma1E3M1Bjbmt1OENu?=
 =?utf-8?B?UUpEVWU2MmpONUlkbXpIY3c0aTRuVmsrZ1NnbHU3dlZLbEp4Y0ZWM3NHSWNZ?=
 =?utf-8?B?NGwyenZ3anVMRjRxWjBjUEdkSDQyckZ1Wk1ZYnhDMUFwVkFYQTRvOUcwblBr?=
 =?utf-8?B?dmVZcXlxeEJNRGZEemlkaGFHK09YVHp0NlpYYVc0S1JxSVJ5TWcvbUJPanBQ?=
 =?utf-8?B?UUV6cSsxUHdyVVcwZjRLeWtCenRuYk9KVWEzMnNLSndyekRuZy9zcXJqaTlw?=
 =?utf-8?B?TC9QTGVBNVJRMmJNTEtYdWozc1hjS0txYmxpbWNNNythZnh5UTU5b3huUm5Q?=
 =?utf-8?B?bXhYM3JmMjJpZ09rTCt4Q1JNZDRWY3pXYW5sVEhHUkh3c0lYdlFDZnh3NE1O?=
 =?utf-8?B?Z2QrT3MzUTNEMmNkY1FQOVBKcnZ2WW1FazlFRmxwSER6aEw1M25rUWtGSnpR?=
 =?utf-8?B?K3I1bzMva3RVQjVWMWhsbUVGcmRWV2JlU0loYksrbW5KNm9UdGtCSEl1WmJq?=
 =?utf-8?B?V3gzOTdDQVVnbkYxNWFWRjNIek55MzFqYUV5Tk13ZG53eCtSR05EcjVaZFRu?=
 =?utf-8?B?UDRzRG1MV1dZaG5pZ3MxMWQzenBuaHRSUTFsTnhueW5STEhsMTE2MVRlamtn?=
 =?utf-8?B?dTZxUHNzUjM3NmxQUW8vRC9qbFY1Mk1oYzhXdjZoZkZjakFWNVRMVzVFbjgy?=
 =?utf-8?B?d2hMT3FFWng4QkdwODZ3VjBKcWFDOTdzQnZvQU9yL3h2bFZTSzdyRG9QWXdY?=
 =?utf-8?B?RlFjZUVqSXMvZ1A2VFZUOWI2TWkwOVVqTkNLNGRNS3NZMnNXcFN2bExQRS9a?=
 =?utf-8?B?bm1DTkFITC9RYjMzMVJ2encyeHJSN0dES1Z5NmFEWjd2UCtpWnZ1OWs0eDUy?=
 =?utf-8?B?TDNicWJ3aFBKeElVdUhuVTlBNkVqL2xVVkJYRFJSb1lsL0I2M3NheEYwMDc5?=
 =?utf-8?B?VEJDU2w5Mi93OE1LbkQwZ0c5dUpsZkJndXc1Y0lSNmVYS3FDN2xIWEdPNWV1?=
 =?utf-8?Q?d32HLQiU+oe7oaKXRoDbiqc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVdrWXBqZE1wakZrdTU5VmNETDRUTzBqOER4NkZDSGdMTzNJQW0xNmpEOENr?=
 =?utf-8?B?aVoyUTdwcFdCT0h6RTRERE5CQmpPM3pYUmptTHJHUHpaOWVXb0ovZTA4dUZU?=
 =?utf-8?B?bVdicHAwZVZtTzhvOWM5QW1mZXc4aFRDREtUVkxNWEExNTdoeElCUHM5SUpB?=
 =?utf-8?B?a0lURE1RdVJDWTd5MmR5SlQvMVRRM3o0ejFJUWRhWktvZFBYdlVDenhEVndt?=
 =?utf-8?B?SVdCUG1XVEVDNHE4ZGVWS3JrSElYUU5vdmVCWEpnMUpueFovYmp4VDhxYVQr?=
 =?utf-8?B?R0UwY0gxNkE5YytWKy9vS0JsVEt0WmZRcHpTUEVrNzlOT3l6dFVkSkFCQnZv?=
 =?utf-8?B?c3VBL2ZkR3RuRmg1ajRNMUZZYWYvaVRuNkRkVXdJbDhyMWl1elc3SHVIZEpr?=
 =?utf-8?B?MTJWZlBDWFg5MUtsTnNIVi9IS2tpOVRzRGRvNkpyQXFURWttVlJWeERTbEM4?=
 =?utf-8?B?NXNyc2tMYzl1T281TFVqVno2c2RVeHBTb1RkYk9HcWZ4WW5rS2daSVhWTEFG?=
 =?utf-8?B?MG0rd0xrQndHcFZOaDNmUUdVbFFSaFYrRjc5SDhmK0w1amUvS3UzenlxY2Zx?=
 =?utf-8?B?blZIK3A2ZFFsU0k2Z3VoV3c5elBJaGtGbnBkUllzQUZLaGdzQnhTODh3QnNF?=
 =?utf-8?B?MWN6THBwekFlaEhRTkVJd2VsWFh1a0VTcUpocTNpejMrS3RJbm5IcFpOZkdL?=
 =?utf-8?B?Yk9CSnRNS1Z6V2F6TTFqdTFLckhLcGF5TUNwYXpHTURCVzF4QTVwdGF6ZzZO?=
 =?utf-8?B?U3FGRHBFbEo1aEpVcDlpRUZmL2p4WGVvN3Ewa3lxWlB0SWFsYy9XTnoySm1v?=
 =?utf-8?B?amx3L25QdXZldHdzYzg5dm5INERtR2pQd3EvMlk1MG1KcGpDaXNuN2YzREJK?=
 =?utf-8?B?d2kwYWZMOVJRcmo2S1lPVjc1RFhFZFRJSlRackUyTlJBYTBjRkVxRlBNaStZ?=
 =?utf-8?B?SDhlWjNVTE1FaUhzN0V5Q3NuOUNvSjZGRTcrU2JqbVZoN1NMQm5HZUprS2Jt?=
 =?utf-8?B?T0I2Qk1mMXI1d3hwV0pnZEJwZ3kyY0w2TmdNTmxyS3F2L290ZEtqeGx6MExs?=
 =?utf-8?B?U0hVaUYwUmY0M3QvRkpTalZmOTRRT3Zhc1o3bTU1NnRveHljczJiNHNOakhM?=
 =?utf-8?B?R1Q0c1h6OW92dkM2YzFuNXZFMzA4SlVtbkFxNEFyc2hML1AzOG5jdkkra29o?=
 =?utf-8?B?bWNYcThOS3ErZHMxbnFURytOR0NheFQ2WmtHbHhtSzFwakRJUHlTdGdQV3B5?=
 =?utf-8?B?Wis0VXNFTlI1UE5XZ0FrcTkyd2J3OXJBYm43NGtwV0tIbVFlU0J2TG1RZ0t4?=
 =?utf-8?B?ZVFlNUZhdEliTVR2bi9nZVMrSzJZRGwxZWt5aDFrSEttNDRseWpJVG1hRDl6?=
 =?utf-8?B?OHpra1FtNjkxU2NXNkV6Ulpxa1BEQm4vVmlSQzRHVmVHcTVINTN6anUxUFBU?=
 =?utf-8?B?aXZIZGdtWEh0b2ROKzQyNDd1L2ZNcEhkMmxGbFNNZFBNNWVNZjJqaGk1ZW9N?=
 =?utf-8?B?VnUvRERhQjZwZ3BUTi9sVUd4SXhkL2xSM2VJbzV4QzkySnR5aDY2QVZFWHl3?=
 =?utf-8?B?UmN5dGIwVEdZeXRqR1BWYWJqcGZxcDF6NU1jcWJSYU9sSzBRVnZRaWk1SGVI?=
 =?utf-8?B?eFZTZlp3ZzJJZkhxdmFUWU5aNzBCNWJodGZPQ2xac251ZlVOYkdTTmxzeWJa?=
 =?utf-8?B?TElOcmJId0tFcFpIK05lNTdPRlU5dzg4MlZ5Yk5mbThjNzU2U1VLbitGR1JX?=
 =?utf-8?B?dnJTTlFCWitITmtsemJhbTEvTFdLeEVBMmt3a0lndUo3ZkZpcm9sK2lPbXpC?=
 =?utf-8?B?N0MvT2wxS2E4MjZTYjZoTW9TL2Zyc1lHczlqbTR6eUhkV3g1RVhpTzFMb1Z2?=
 =?utf-8?B?RTdVcDlYVC84djkrbGxJQ2RmQk45a1F2b3p0MEdsellJS2tuK1VXMThaYWEr?=
 =?utf-8?B?SnE2bURVdGZMN1Ava0lIQmxTanBqZ2c3dXlOMy85RFRlRkhKV2t5M3lOVmJx?=
 =?utf-8?B?bWZ5NlRPM2phTjNwRm9vNGM4OU1XUEpGUDBRVm14R1FLU1hQU0R0d1NEQlZE?=
 =?utf-8?B?VHlTNWdjRDY0WS9HRGtLUys2YlpYVmJRUjdMT2NaNEVuemdwMjhhQ1dsMTZh?=
 =?utf-8?B?VE8rLzY0YVNDK25BN0J1SWlHVFFMYmlJM3dzZENEQXphY1hkQ1g2U1JrU3lw?=
 =?utf-8?B?czViZ1l6d1JJTFVjT0tKckZXZHh3U0djSzUrL0c3cE1YUmFUb0JPT1RmSnpZ?=
 =?utf-8?B?SFBua1hBUE9uMmtPQnRTRk9oQXl2VE9DY2M0Q21RWkhkTktpRk9yUW9FV1c0?=
 =?utf-8?B?RzNXclJFMktORjhwQkMrU2NnNDV2NEE4YWQxclBMZVJMSDdBK2dQRUFncHhq?=
 =?utf-8?Q?hPirf10cks7xpdNw=3D?=
Content-ID: <9CA612D8BB907C4A97A7366E118BAD22@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22eaa99e-48d1-4305-ffa5-08de5a1283c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 00:01:10.0052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 23YE2Au/D66BTfa5hAG9U6jXbmJczmxPYPxWvSsUFX5fJQo2iZp5WQCU8SOg++FhpU+9O98xQta7DUZ5gC9GQyWI+u5oIMhrPCn9tKeVYK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6055
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_160122_912944_64C97DE1 
X-CRM114-Status: UNSURE (   4.05  )
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

T24gVGh1LCAyMDI2LTAxLTIyIGF0IDE0OjQ3IC0wODAwLCBBY2tlcmxleSBUbmcgd3JvdGU6DQo+
IA0KPiBUaGVyZSdzIG5vIHVzZSBjYXNlIEkgY2FuIHRoaW5rIG9mIGZvciB1bm1hcHBpbmcgVERY
IHByaXZhdGUgbWVtb3J5DQo+IGZyb20gdGhlIGhvc3QgZGlyZWN0IG1hcCwgYnV0IFNlYW4ncyBz
dWdnZXN0aW9uDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9hV3BjRHJHVkxyWk9xZGNn
QGdvb2dsZS5jb20vwqB3b24ndCBldmVuDQo+IGxldCBzaGFyZWQgZ3Vlc3RfbWVtZmQgbWVtb3J5
IGJlIHVubWFwcGVkIGZyb20gdGhlIGRpcmVjdCBtYXAgZm9yIFREWA0KPiBWTXMuDQoNCkFoIQ0K
DQo+IA0KPiBBY3R1YWxseSwgZG9lcyBURFgncyBjbGZsdXNoIHRoYXQgYXNzdW1lcyBwcmVzZW5j
ZSBpbiB0aGUgZGlyZWN0IG1hcA0KPiBhcHBseSBvbmx5IGZvciBwcml2YXRlIHBhZ2VzLCBvciBh
bGwgcGFnZXM/DQo+IA0KPiBJZiBURFgncyBjbGZsdXNoIG9ubHkgaGFwcGVucyBmb3IgcHJpdmF0
ZSBwYWdlcywgdGhlbiB3ZSBjb3VsZA0KPiByZXN0b3JlIHByaXZhdGUgcGFnZXMgdG8gdGhlIGRp
cmVjdCBtYXAsIGFuZCB0aGVuIHdlJ2QgYmUgc2FmZSBldmVuDQo+IGZvciBURFg/DQoNClllcywg
anVzdCBwcml2YXRlIHBhZ2VzIG5lZWQgdGhlIHNwZWNpYWwgdHJlYXRtZW50LiBCdXQgaXQgd2ls
bCBiZSBtdWNoDQpzaW1wbGVyIHRvIHN0YXJ0IHdpdGgganVzdCBibG9ja2luZyB0aGUgb3B0aW9u
IGZvciBURFguIEEgc2hhcmVkIHBhZ2VzDQpvbmx5IG1vZGUgY291bGQgY29tZSBsYXRlci4NCg0K
SW4gZ2VuZXJhbCBJIHRoaW5rIHdlIHNob3VsZCB0cnkgdG8gYnJlYWsgdGhpbmdzIHVwIGxpa2Ug
dGhpcyB3aGVuIHdlDQpjYW4uIEtlcm5lbCBjb2RlIGlzIG5vdCBzZXQgaW4gc3RvbmUsIG9ubHkg
QUJJLiBJIHRoaW5rIGl0IHdpbGwgbGVhZCB0bw0Kb3ZlcmFsbCBmYXN0ZXIgdXBzdHJlYW1pbmcs
IGJlY2F1c2UgdGhlIHNlcmllcycgY2FuIGJlIHNpbXBsZXIuDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
