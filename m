Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A8FE92725
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Oct 2023 18:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xU+tHbmWKJnIMydi2jQSEBz3jmMSmhAAB6FyGGnLxLM=; b=pWnde51z6ZovGi
	KLrqV5M9zzfP/I6ErW2yj3EjjSsNe1G+QbCOl+tOiV2R9HBGaGditWFQtpJ2Qk+hZ/muUJfapvuwJ
	FCyINoO27/YPnwsUZgy98wVEJ6PIDzpC5zLAbaSjZqFR7KLqVBimCnTZ/buk2dJw2NFzjMXKlYqD+
	Pn1edi/Rfq66iJTHqiMbQZ8v2xnjROgRwCgYQLB7I0E2v4a9BykH8xLU3JNxAU78uJYwwVNOV4wSB
	4AJWmCkHXk1Xy9woMBCbaFoxenzSd4zObrNmwVmzTuqoB0/QrgqVzXLI+CApsY++m7tVqdzSUtqyU
	/Yn3utKmC5liLXuC2tYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoSmu-004FrO-0R;
	Thu, 05 Oct 2023 18:09:28 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoSmq-004FnM-3D;
	Thu, 05 Oct 2023 18:09:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696529364; x=1728065364;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JLX5uMVfpOTiXzvFF7/v/ijQSUNBOSvRRxpVcLhbYOw=;
  b=gRNbhGWu6IohFBh7qFXHNWraOuEKtfjqKT4+j3+j4b9TD4EGfSik9JoB
   +s7VInPmZPBdcp/PV13x+5d+byDOfWfBXIurU+cLZoqkKPqz/e8GTBO2p
   pDI7O/3Fxx2XUi1klmn5htO/lJbLNLtBwuR4tMgK3yk8FtIUTYiFz85ej
   H2BkAGDGDUmC20eZXIgqlnA1PE+0ARHDbY1z8tpsAeLyavS6Pqd/K9P6I
   ZLHrFC4LiTtwTtifk6gC/95j2xXU4KOjD5QB0kreeseCwYeVaV7ikjiGN
   lAlmo6oci7VfvA9RssIhaxEfr4b52T1mnyaTiG+tn++ktd8KjBOsezapS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363854103"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="363854103"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 11:09:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="895545633"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="895545633"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Oct 2023 11:07:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 11:09:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 11:09:09 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 11:09:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQswGoy5eFunCZQ5A6fjWegnGrFVgZNSsC0TlRU4X1RavkJTEIF9NU2G70ENRAbP2XYt9O35PbAhZcURrmOFt7Esg650DKWYZpO+uvS/sia4orer8kVL61hKNH9GLCKPw50DGbBD9hHdIv3BTS1uFVNPXA8xESYNSzb4bgilcqPmEIXCFADQpUud/HpPB70lsHZ1jcT3fP77//ady/Rha0HbbVmPxfcZ0QU4VgiFqcvvoYcsOHHwLpGMm5RsKS/Joni74HpHhgjWLJHXHN5wfHuqZsWf2ImiHASPs+raNUvo7A2bY4KMhkTtWIhvWtQuMCufSjIZdvQUP1+MduYt+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLX5uMVfpOTiXzvFF7/v/ijQSUNBOSvRRxpVcLhbYOw=;
 b=fKsNd5Bfa2JR9Am0bnK13EZrA7+5S1cctRIL9ZlnF5kJEzYTkO/XBVlpvvXXWj8PFGJ1hdEq5x+L/3q5CYUQ/icJHTfjpldL5NkZsUidPUoH6ohQnqNN8RL2oKAqppUXKLVWFdLMPg+DQGHR0mNlihejXIKmGlXSMr9eHyCZ6tPevsfvnlZ6vLcGSR0he5HrSsWnsOSUoZeoH+E5iGqZuPJLEI6iUDyKZMlnQozZLdlyaHcrx20HMLyIoUMmlLQOrxyiUbOYawh6MiV0L6Ua7aRqFM4XtXHPih8kMTptceYF++3MoIejSJv8R42+gjhZqW7dvjj68v5Xn3ENd0X+Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SN7PR11MB6994.namprd11.prod.outlook.com (2603:10b6:806:2ad::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 5 Oct
 2023 18:09:07 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::56f1:507b:133e:57cf]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::56f1:507b:133e:57cf%5]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 18:09:07 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "rppt@kernel.org" <rppt@kernel.org>
CC: "tglx@linutronix.de" <tglx@linutronix.de>, "mcgrof@kernel.org"
	<mcgrof@kernel.org>, "deller@gmx.de" <deller@gmx.de>, "bjorn@kernel.org"
	<bjorn@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>,
	"nadav.amit@gmail.com" <nadav.amit@gmail.com>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"hca@linux.ibm.com" <hca@linux.ibm.com>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kent.overstreet@linux.dev"
	<kent.overstreet@linux.dev>, "puranjay12@gmail.com" <puranjay12@gmail.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "chenhuacai@kernel.org"
	<chenhuacai@kernel.org>, "tsbogend@alpha.franken.de"
	<tsbogend@alpha.franken.de>, "x86@kernel.org" <x86@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-parisc@vger.kernel.org"
	<linux-parisc@vger.kernel.org>, "linux-trace-kernel@vger.kernel.org"
	<linux-trace-kernel@vger.kernel.org>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "rostedt@goodmis.org"
	<rostedt@goodmis.org>, "will@kernel.org" <will@kernel.org>,
	"dinguyen@kernel.org" <dinguyen@kernel.org>, "naveen.n.rao@linux.ibm.com"
	<naveen.n.rao@linux.ibm.com>, "sparclinux@vger.kernel.org"
	<sparclinux@vger.kernel.org>, "linux-modules@vger.kernel.org"
	<linux-modules@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "song@kernel.org" <song@kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>
Subject: Re: [PATCH v3 03/13] mm/execmem, arch: convert simple overrides of
 module_alloc to execmem
Thread-Topic: [PATCH v3 03/13] mm/execmem, arch: convert simple overrides of
 module_alloc to execmem
Thread-Index: AQHZ6gIbIXJGUlk14kaIslF+Xg+n8bA438mAgAD+GoCAAOcMAIAA1RsA
Date: Thu, 5 Oct 2023 18:09:07 +0000
Message-ID: <b26d0a201bf631831a956450ebbccc3c16521133.camel@intel.com>
References: <20230918072955.2507221-1-rppt@kernel.org>
	 <20230918072955.2507221-4-rppt@kernel.org>
	 <607927885bb8ca12d4cd5787f01207c256cc8798.camel@intel.com>
	 <00277a3acb36d2309156264c7e8484071bc91614.camel@intel.com>
	 <20231005052622.GD3303@kernel.org>
In-Reply-To: <20231005052622.GD3303@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|SN7PR11MB6994:EE_
x-ms-office365-filtering-correlation-id: ad243a6b-a840-4e1d-95e9-08dbc5ce2a94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rB69I/qGTkNwaFzxfh26/PsqBDAY73O+y0/+r5jy72oIlhmI+gCnguHix0VfRpaDPhJz9yccuIWNMMnZ7RubdlnI3ewaw127QpibtfQgTAp+Lu79Wi1mjVNDlzAc5j0EKT/SePXOSuB2sPWO4KaGF3uLOVIgbrbfc1EFT59rnWHqNrDBQ83KjwTS3KUQcZ8eBs3GFhuLvKaB8o7iyM3xSLAUzkWIi0UZRGqJILKPJ4LO2GVZjrjnlXjmPZRZv9Pakaw6pNRW+UvsUi8BQ1/thluVFu9Jiugxpl1IV9n6Ltlnvc5NiyXVpybRpgUSjUbnL7gp6d7nj5qdU7JuJ9OU9pf6qSMiarsjP5/ZafRvNJmzP2lB5vxutpY0nbDkj99IhVEDBZKR4hHBVpj0WedhzWk8zu5PZj9JS5BykTp+wbtNmmCSVqUuu2lprSVw9LXoaw2evQYGr/hamYyyYB8jWVQaVNvMgSO/DkLc7XzLEwFNZi9YKv0ffuQ6pIpJWnUOfETnhgRi6r7h3wTEWkuTJL7CUifYbrYhmwWlHMKC7ln2ZBb9cWCJJcdZMYYbfBtT0EXUnYORr2mYHGzUwCbwH6tQz30DBH/5D7eH+U4Pp8RWSGJjdKmbNA4ErWGoBrLZmbnzHsaUfLTiEw7n+Skm2g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(39860400002)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(71200400001)(6512007)(6506007)(6486002)(82960400001)(122000001)(86362001)(38100700002)(38070700005)(36756003)(26005)(2616005)(64756008)(91956017)(7406005)(66556008)(76116006)(66946007)(66476007)(66446008)(54906003)(6916009)(7416002)(41300700001)(2906002)(5660300002)(8936002)(8676002)(4326008)(83380400001)(316002)(478600001)(309714004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXk2L0FDcFdoaVBoRG8rd2llVVdGcVEvbWw1R3BnRzVmeE43NVRjUFpkWXAv?=
 =?utf-8?B?WmJYdXVqYlNhZUtPWmhCQW5CanF6VGFLTXhXMm4vNy9OVURqS09mbDNSZVNm?=
 =?utf-8?B?YWpJOUJVTFRqZlBEVFVyRzFPSS9nMzl0K0ZFVk1vd1lpN0NCc1JISDNQdU54?=
 =?utf-8?B?UFd6VFYxT2dWOUtZdzlGQWlab0RXc1JwNFVxMloxekF2VmN6Vm5UVDc5NHdj?=
 =?utf-8?B?R1FsN1JhRGhmMjRoTWlMY0YrTitvdDdhNlFxc3h0cTFrb1ZhbWdwbnhTcVMv?=
 =?utf-8?B?cFg5V2FxbHJlTGQ0UklqbVRNQ0Z6aDVVSlVKaE1Wc1FmYWZCUXF3VERPUk91?=
 =?utf-8?B?THFaRXcrem1nbW5oaHhzMmxnVG1OL0FlVlk5M21lSnpsRlYwbDhUN3F1SlBr?=
 =?utf-8?B?V0lxNmdqWU5SYVg3eHNUVHZzdlhXdyszVEFaZjBwbHNqMUwveWIvb09RWVNZ?=
 =?utf-8?B?cmlkM1Z1dlJMRmJCZVJKR041MzdnUVFpMnVBYzQydC9ic2djMGkrYUZpZzFp?=
 =?utf-8?B?Q2Q4L3gwQkh0dFNIZmt0S0VJcWI0NXZlakhnU0NmT1RWalVueEJ5TlRZenNu?=
 =?utf-8?B?bFpPQTJ6bVNwTFAyOUNqajUwaVlyRHg1a29tZjRPZGFqRzZwZElGSmFNMVhB?=
 =?utf-8?B?K3VlUTdQN1grVlQwYXZpbGVCWit0WGMwOGdodG1NcU9aeGpqS3hHQnVEUE1D?=
 =?utf-8?B?ZnFQQ1Z2blVDWTliNDlUNlVNSGFheUpJbzJpeGlsQVF2V1lmVlpuWU5EWDVp?=
 =?utf-8?B?OUJibVlPWVRvUTFTSVNFLzl2Q3VMbEd1NEsxQndhSEFBejBrVlhzOVhkdjAr?=
 =?utf-8?B?TUJlODhHNHdWbmxUZGFIWkZmY24ybG9UZVVzMUVYQTVlZkpJQTZTT21ua0Nu?=
 =?utf-8?B?TkR5TGoxT0svemhKYUZTMHNiYkZGVmtKQmFQVE1FSE41Z2cwSVI0ZFM0ajRK?=
 =?utf-8?B?SGFUY2VKb0xEV1dPNDNDbUlmM3Z2WDc2Yk5KU1ZwNVhGSGtTbVdQTEthczRE?=
 =?utf-8?B?aHRjK2N2TG90ZE1TWWM5ang1clZ2am14bW5UMEpKckEvN3VxVWhCRGZJRUpH?=
 =?utf-8?B?cjdMcHVWeUZSVDdHT2lBWlZuYk56d3MreFQrQ2lRQWNMYUlqS2VIQmxhK2p1?=
 =?utf-8?B?RGFYOUt1ZmNUZ3pPb0pxVktVWHIxcmxMak16MWs1VkhqUkJpakJwVk1wOWVQ?=
 =?utf-8?B?aVdoTDl2YTM3WFRWTU92N2VMdXdtaUV6eEJvOC9qcWR0N0xlWWpZSTByeVZS?=
 =?utf-8?B?TmZnNUkvNjY5anVFcUU2WHlmZ2d2WUNsV04rMVE4YWVlZkFvTS96OUNYRjh5?=
 =?utf-8?B?dUQzd1ZETEo4ajNKR29MeEpTamdLcjZicnlYVG1oQ0g1WGkxR081aHR4bTBw?=
 =?utf-8?B?OFpnR25mTUJFY2xQelFWdHBWNy9qVVpPQzRxK0hNSmZYb0Z6TTB6ODgzVGpL?=
 =?utf-8?B?Z0J3UGFJcVRIdFQ4Tm5GNzFRL1EyZjU1czIzSElkS1YwRFhNVForUFNyZ3Yr?=
 =?utf-8?B?ZmlOTlEvS3NtZytNcUhieUVoZDNObndzT1VsUXU4U1ZtWklFdThPRGxvV1Mx?=
 =?utf-8?B?TzNib2I0WnoxQVNuZEpmZDBVdGJoQ29YSFNpOVA3alk4dk85aERYNEYxR1or?=
 =?utf-8?B?QTFxcTFtdGxlTnB5ZkQ2aXltWFVYMi8vMUtpa0FxTktESzhqb3lzTnZIY2cr?=
 =?utf-8?B?c3k3QVNpeDhnUkt5by9wc1kvZ2NhYVVjYXdpTFJ4Q2NTZHN5d2EyRkc1NHRq?=
 =?utf-8?B?d0xFMkFvRnVSWEd1WFJtMEFsRmxsclFOYkY5eUluQ1RBVHo0VFg1YTc1TjBZ?=
 =?utf-8?B?SFNsb2g2RDkrc005WktxWHhhU25ValM0czVNTzRYWmFEby9VSlVWUjRiSnNK?=
 =?utf-8?B?dzh1Q2t4amg4YjcrRy9pM2RmQW1aaGd3MFk1MVV0Rk5ua00ySlNHMXJGZFFY?=
 =?utf-8?B?eDJoM2w1ekhSd3lXZms4SjBOT3FraDRCdjJhaURhNnJydUM3M0U2dkdGZWpu?=
 =?utf-8?B?aFBNNGRFZittTDdxVXZidnM1aFRDdzdQS2Q1WFZ4VW1OcFVIVVJyR3NuSWR5?=
 =?utf-8?B?YVBGYk9oN0haMzdSc2h0WFk0M3A4TFVEVDAwODYxQTNHdnhkZzgxZjF2aHZw?=
 =?utf-8?B?dFNhVUR1dmU2aE5zRlBZZDhZOGFmMndYR3g4QkhzZFA5UVlmWlA5ek5yRDd3?=
 =?utf-8?B?Mnc9PQ==?=
Content-ID: <982D946EFFC8D64D8B47A9BC2373DD2A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad243a6b-a840-4e1d-95e9-08dbc5ce2a94
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 18:09:07.0950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QICt27AF2WB2L6z+lJdwYK4yEy17GZF+kHThrsBKbPN3+C/BBK0DAzVHN3IjwqFYZM4yeF9n6yJZRrWPYd5xgLsoR7QhOgcCWKz+3e36VA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6994
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_110925_101227_73204CC1 
X-CRM114-Status: GOOD (  32.84  )
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

On Thu, 2023-10-05 at 08:26 +0300, Mike Rapoport wrote:
> On Wed, Oct 04, 2023 at 03:39:26PM +0000, Edgecombe, Rick P wrote:
> > On Tue, 2023-10-03 at 17:29 -0700, Rick Edgecombe wrote:
> > > It seems a bit weird to copy all of this. Is it trying to be
> > > faster
> > > or
> > > something?
> > > 
> > > Couldn't it just check r->start in execmem_text/data_alloc() path
> > > and
> > > switch to EXECMEM_DEFAULT if needed then? The
> > > execmem_range_is_data()
> > > part that comes later could be added to the logic there too. So
> > > this
> > > seems like unnecessary complexity to me or I don't see the
> > > reason.
> > 
> > I guess this is a bad idea because if you have the full size array
> > sitting around anyway you might as well use it and reduce the
> > exec_mem_alloc() logic.
> 
> That's was the idea, indeed. :)
> 
> > Just looking at it from the x86 side (and
> > similar) though, where there is actually only one execmem_range and
> > it
> > building this whole array with identical data and it seems weird.
> 
> Right, most architectures have only one range, but to support all
> variants
> that we have, execmem has to maintain the whole array.

What about just having an index into a smaller set of ranges. The
module area and the extra JIT area. So ->ranges can be size 3
(statically allocated in the arch code) for three areas and then the
index array can be size EXECMEM_TYPE_MAX. The default 0 value of the
indexing array will point to the default area and any special areas can
be set in the index point to the desired range.

Looking at how it would do for x86 and arm64, it looks maybe a bit
better to me. A little bit less code and memory usage, and a bit easier
to trace the configuration through to the final state (IMO). What do
you think? Very rough, on top of this series, below.

As I was playing around with this, I was also wondering why it needs
two copies of struct execmem_params: one returned from the arch code
and one in exec mem. And why the temporary arch copy is ro_after_init,
but the final execmem.c copy is not ro_after_init?

 arch/arm64/mm/init.c    | 67 ++++++++++++++++++++++++++++++++++++++---
--------------------------
 arch/x86/mm/init.c      | 24 +++++++++++++-----------
 include/linux/execmem.h |  5 +++--
 mm/execmem.c            | 61 ++++++++++++++++-------------------------
--------------------
 4 files changed, 70 insertions(+), 87 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 9b7716b4d84c..7df119101f20 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -633,49 +633,58 @@ static int __init module_init_limits(void)
 	return 0;
 }
 
-static struct execmem_params execmem_params __ro_after_init = {
-	.ranges = {
-		[EXECMEM_DEFAULT] = {
-			.flags = EXECMEM_KASAN_SHADOW,
-			.alignment = MODULE_ALIGN,
-		},
-		[EXECMEM_KPROBES] = {
-			.start = VMALLOC_START,
-			.end = VMALLOC_END,
-			.alignment = 1,
-		},
-		[EXECMEM_BPF] = {
-			.start = VMALLOC_START,
-			.end = VMALLOC_END,
-			.alignment = 1,
-		},
+static struct execmem_range[2] ranges __ro_after_init = {
+	/* Module area */
+	[0] = {
+		.flags = EXECMEM_KASAN_SHADOW,
+		.alignment = MODULE_ALIGN,
+	},
+	/* Kprobes area */
+	[1] = {
+		.start = VMALLOC_START,
+		.end = VMALLOC_END,
+		.alignment = 1,
+	},
+	/* BPF area */
+	[2] = {
+		.start = VMALLOC_START,
+		.end = VMALLOC_END,
+		.alignment = 1,
 	},
 };
 
-struct execmem_params __init *execmem_arch_params(void)
+void __init execmem_arch_params(struct execmem_params *p)
 {
-	struct execmem_range *r =
&execmem_params.ranges[EXECMEM_DEFAULT];
+	struct execmem_range *default;
+	struct execmem_range *jit;
+
+	p->ranges = &ranges;
 
 	module_init_limits();
 
-	r->pgprot = PAGE_KERNEL;
-
+	/* Default area */
+	default = &ranges[0];
+	default->pgprot = PAGE_KERNEL;
 	if (module_direct_base) {
-		r->start = module_direct_base;
-		r->end = module_direct_base + SZ_128M;
+		default->start = module_direct_base;
+		default->end = module_direct_base + SZ_128M;
 
 		if (module_plt_base) {
-			r->fallback_start = module_plt_base;
-			r->fallback_end = module_plt_base + SZ_2G;
+			default->fallback_start = module_plt_base;
+			default->fallback_end = module_plt_base +
SZ_2G;
 		}
 	} else if (module_plt_base) {
-		r->start = module_plt_base;
-		r->end = module_plt_base + SZ_2G;
+		default->start = module_plt_base;
+		default->end = module_plt_base + SZ_2G;
 	}
 
-	execmem_params.ranges[EXECMEM_KPROBES].pgprot =
PAGE_KERNEL_ROX;
-	execmem_params.ranges[EXECMEM_BPF].pgprot = PAGE_KERNEL;
+	/* Jit area */
+	ranges[1].pgprot = PAGE_KERNEL_ROX;
+	p->defaults[EXECMEM_KPROBES] = 1;
+	
 
-	return &execmem_params;
+	/* BPF Area */
+	ranges[2].pgprot = PAGE_KERNEL;
+	p->defaults[EXECMEM_BPF] = 2;
 }
 #endif
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index 022af7ab50f9..7397472ffc39 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -1102,16 +1102,15 @@ unsigned long arch_max_swapfile_size(void)
 #endif
 
 #ifdef CONFIG_EXECMEM
-static struct execmem_params execmem_params __ro_after_init = {
-	.ranges = {
-		[EXECMEM_DEFAULT] = {
-			.flags = EXECMEM_KASAN_SHADOW,
-			.alignment = MODULE_ALIGN,
-		},
+static struct execmem_range ranges[1] __ro_after_init = {
+	/* Module area */
+	[0] = {
+		.flags = EXECMEM_KASAN_SHADOW,
+		.alignment = MODULE_ALIGN,
 	},
 };
 
-struct execmem_params __init *execmem_arch_params(void)
+void __init execmem_arch_params(struct execmem_params *p)
 {
 	unsigned long module_load_offset = 0;
 	unsigned long start;
@@ -1121,10 +1120,13 @@ struct execmem_params __init
*execmem_arch_params(void)
 			get_random_u32_inclusive(1, 1024) * PAGE_SIZE;
 
 	start = MODULES_VADDR + module_load_offset;
-	execmem_params.ranges[EXECMEM_DEFAULT].start = start;
-	execmem_params.ranges[EXECMEM_DEFAULT].end = MODULES_END;
-	execmem_params.ranges[EXECMEM_DEFAULT].pgprot = PAGE_KERNEL;
+	p->ranges = ranges;
 
-	return &execmem_params;
+	/* Module area */
+	p->ranges[0].start = start;
+	p->ranges[0].end = MODULES_END;
+	p->ranges[0].pgprot = PAGE_KERNEL;
+	p->ranges[0].flags = EXECMEM_KASAN_SHADOW;
+	p->ranges[0].alignment = MODULE_ALIGN;
 }
 #endif /* CONFIG_EXECMEM */
diff --git a/include/linux/execmem.h b/include/linux/execmem.h
index 09d45ac786e9..702435443d87 100644
--- a/include/linux/execmem.h
+++ b/include/linux/execmem.h
@@ -77,7 +77,8 @@ struct execmem_range {
  * each type of executable memory allocations
  */
 struct execmem_params {
-	struct execmem_range	ranges[EXECMEM_TYPE_MAX];
+	int areas[EXECMEM_TYPE_MAX];
+	struct execmem_range	*ranges;
 };
 
 /**
@@ -92,7 +93,7 @@ struct execmem_params {
  * Return: a structure defining architecture parameters and
restrictions
  * for allocations of executable memory
  */
-struct execmem_params *execmem_arch_params(void);
+void execmem_arch_params(struct execmem_params *p);
 
 /**
  * execmem_text_alloc - allocate executable memory
diff --git a/mm/execmem.c b/mm/execmem.c
index aeff85261360..dfdec8c2b074 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -6,15 +6,15 @@
 #include <linux/moduleloader.h>
 
 static struct execmem_params execmem_params;
+static struct execmem_range default_range;
 
-static void *execmem_alloc(size_t size, struct execmem_range *range)
+static void *execmem_alloc(size_t size, struct execmem_range *range,
pgprot_t pgprot)
 {
 	unsigned long start = range->start;
 	unsigned long end = range->end;
 	unsigned long fallback_start = range->fallback_start;
 	unsigned long fallback_end = range->fallback_end;
 	unsigned int align = range->alignment;
-	pgprot_t pgprot = range->pgprot;
 	bool kasan = range->flags & EXECMEM_KASAN_SHADOW;
 	unsigned long vm_flags  = VM_FLUSH_RESET_PERMS;
 	bool fallback  = !!fallback_start;
@@ -60,14 +60,18 @@ static inline bool execmem_range_is_data(enum
execmem_type type)
 
 void *execmem_text_alloc(enum execmem_type type, size_t size)
 {
-	return execmem_alloc(size, &execmem_params.ranges[type]);
+	struct execmem_range *range =
&execmem_params.ranges[execmem_params.areas[type]];
+
+	return execmem_alloc(size, range, range->pgprot);
 }
 
 void *execmem_data_alloc(enum execmem_type type, size_t size)
 {
+	struct execmem_range *range =
&execmem_params.ranges[execmem_params.areas[type]];
+
 	WARN_ON_ONCE(!execmem_range_is_data(type));
 
-	return execmem_alloc(size, &execmem_params.ranges[type]);
+	return execmem_alloc(size, range, PAGE_KERNEL);
 }
 
 void execmem_free(void *ptr)
@@ -80,9 +84,13 @@ void execmem_free(void *ptr)
 	vfree(ptr);
 }
 
-struct execmem_params * __weak execmem_arch_params(void)
+void __weak execmem_arch_params(struct execmem_params *p)
 {
-	return NULL;
+	p->ranges = default_range;
+	p->ranges[EXECMEM_DEFAULT].start = VMALLOC_START;
+	p->ranges[EXECMEM_DEFAULT].end = VMALLOC_END;
+	p->ranges[EXECMEM_DEFAULT].pgprot = PAGE_KERNEL_EXEC;
+	p->ranges[EXECMEM_DEFAULT].alignment = 1;
 }
 
 static bool execmem_validate_params(struct execmem_params *p)
@@ -97,46 +105,9 @@ static bool execmem_validate_params(struct
execmem_params *p)
 	return true;
 }
 
-static void execmem_init_missing(struct execmem_params *p)
-{
-	struct execmem_range *default_range = &p-
>ranges[EXECMEM_DEFAULT];
-
-	for (int i = EXECMEM_DEFAULT + 1; i < EXECMEM_TYPE_MAX; i++) {
-		struct execmem_range *r = &p->ranges[i];
-
-		if (!r->start) {
-			if (execmem_range_is_data(i))
-				r->pgprot = PAGE_KERNEL;
-			else
-				r->pgprot = default_range->pgprot;
-			r->alignment = default_range->alignment;
-			r->start = default_range->start;
-			r->end = default_range->end;
-			r->flags = default_range->flags;
-			r->fallback_start = default_range-
>fallback_start;
-			r->fallback_end = default_range->fallback_end;
-		}
-	}
-}
-
 void __init execmem_init(void)
 {
-	struct execmem_params *p = execmem_arch_params();
+	execmem_arch_params(&execmem_params);
 
-	if (!p) {
-		p = &execmem_params;
-		p->ranges[EXECMEM_DEFAULT].start = VMALLOC_START;
-		p->ranges[EXECMEM_DEFAULT].end = VMALLOC_END;
-		p->ranges[EXECMEM_DEFAULT].pgprot = PAGE_KERNEL_EXEC;
-		p->ranges[EXECMEM_DEFAULT].alignment = 1;
-
-		return;
-	}
-
-	if (!execmem_validate_params(p))
-		return;
-
-	execmem_init_missing(p);
-
-	execmem_params = *p;
+	execmem_validate_params(&execmem_params);
 }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
