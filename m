Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6F7E92723
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Oct 2023 18:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1aTkdqJGpxsHK08Xz2znOX/mOrWiI7im/iibnJtFDg=; b=iF9Wk7JkOw1oN+
	Ta24Y9MAstcYotqVp3gv8F2csuqe3kIljYVHg95c6QHA/PNUmEClSYUTOe4R9KTeTnPWBf07SD/zg
	PsRw+/5FkThymLguBu7uLqUz3l+oMY85koeVzU2lu8BEREz/DvvDuEcyLVVk1as5ImIR42kEclheP
	VE120I/+/wqjVAsyuwQOMaQ7Nv36XkbrKFvNDoge6BFZqqdZj6vvybwAB82YzLVfds46h1hTZQfFB
	ahEDDzqOmdYwJqxVa3lqZUd3bHNxH/IfVtuJjuBRZ6iU4FQqSjGEKWuJ1GrEq2N7PwOVBj3+s8c22
	r+ySV2QtFCTH9XsS0gtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoSpP-004GOV-0y;
	Thu, 05 Oct 2023 18:12:03 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoSpN-004GNr-0S;
	Thu, 05 Oct 2023 18:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696529521; x=1728065521;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yjuvDEzc0yJ7VGlB+qUTiqz14AdRBI2Hdffjv6nHtno=;
  b=gRn4N4IPkIVG2sQccMdbmOtQ8gCZupqZF0aNPzU2oV7HzzzUAVpWE36R
   H52b5QYBLo4NNPQ1x2lfR1Whdxl7CQbAAhjIN66LE/+RLVFYD5Q6X4BMa
   NkZ2iAr9sW43JW7pw1R4ziLI5qg9cJqfb2J775ABIdISDIo0fvHkQhxP1
   9pv8bSfqdELB63n97eBpxd048puCdKAdYT5LIxrt43xmJ6whg5hBcAvL4
   VUv/phXTauszA152zDPA7NnWUN0JJjbgRarO3uiQ5sxO0PWe2kE4+pM0p
   HRvVIl2pCTLqE5EIaci7UcLc6d+nu2c5W/EX0kNoUWsBvAR1giBDf5Vl5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="362934081"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="362934081"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 11:11:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="875645492"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="875645492"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Oct 2023 11:11:57 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 11:11:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 11:11:56 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 11:11:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eM3q/wesPJbtc3+VtWLhsOEjSYqHQHR+1kPaL9AZgILRKmZZnqWg7DT8ndpk5ZrVmQEOSDZix75Dgb2+B4cKkTkRgzw2KjJmGmkwPJhdcxrB6sduidhkgYmQTAfcsfLZwXv4SuR6kptFE4W44XiVpOq+qVWqAmYkNGDu4b+F9ZUk/S++wacf0llzrboSz0XyKa8TX9sbwkDNNkTkRiCI2B86soVzeDHxZt1PaDxr3Js2YbFocNQGhyvX7d/QdZOuyaw7LGQSmuE3l9H3TscL16HRMR/k3ygkdPUDSDthqfKcUagUyfvmKH/7WcfJyU/da3AvfgINTb7sYz8NYhDI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjuvDEzc0yJ7VGlB+qUTiqz14AdRBI2Hdffjv6nHtno=;
 b=csV+pf1VWrTZk5cphFOr3EjjqY+AkBcgW3LvJdsfTtaTmCGeWryBp5JUZL/pmGqYJ4j1t+HQfsicyso+YQOaK/83sIRRTv8j3KVI/czzTT9Apguno2+9N/ODl+hU5foKfMVJftIPpzH3xQ5qMAOuOwK0BxenyXHYBowqshVOwsrtIlePMBtL3v3OEeFgoYrBNzAcyiyGTLPN7x6/Y0rajgVX4h0MxHoH6HHoABlB15e9fwTalNNBxs+f+WcwB1JDAtWvAYv06U7Jnl+QVk2QthW7Lw4Hg6Sbyq6hllLSBN/2FSSyhYYQI0TBMfCGNAc4FpXJlnXKswjvet3O0mkTEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by MN0PR11MB6111.namprd11.prod.outlook.com (2603:10b6:208:3cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Thu, 5 Oct
 2023 18:11:49 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::56f1:507b:133e:57cf]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::56f1:507b:133e:57cf%5]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 18:11:49 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rppt@kernel.org" <rppt@kernel.org>
CC: "tglx@linutronix.de" <tglx@linutronix.de>, "deller@gmx.de"
	<deller@gmx.de>, "mcgrof@kernel.org" <mcgrof@kernel.org>, "bjorn@kernel.org"
	<bjorn@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>,
	"nadav.amit@gmail.com" <nadav.amit@gmail.com>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"hca@linux.ibm.com" <hca@linux.ibm.com>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "kent.overstreet@linux.dev"
	<kent.overstreet@linux.dev>, "puranjay12@gmail.com" <puranjay12@gmail.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "chenhuacai@kernel.org"
	<chenhuacai@kernel.org>, "tsbogend@alpha.franken.de"
	<tsbogend@alpha.franken.de>, "linux-trace-kernel@vger.kernel.org"
	<linux-trace-kernel@vger.kernel.org>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "linux-parisc@vger.kernel.org"
	<linux-parisc@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>,
	"will@kernel.org" <will@kernel.org>, "dinguyen@kernel.org"
	<dinguyen@kernel.org>, "naveen.n.rao@linux.ibm.com"
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
Thread-Index: AQHZ6gIbIXJGUlk14kaIslF+Xg+n8bA7mssA
Date: Thu, 5 Oct 2023 18:11:49 +0000
Message-ID: <ce82a562db208250526f21a21e54bfc5b85f167a.camel@intel.com>
References: <20230918072955.2507221-1-rppt@kernel.org>
	 <20230918072955.2507221-4-rppt@kernel.org>
In-Reply-To: <20230918072955.2507221-4-rppt@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|MN0PR11MB6111:EE_
x-ms-office365-filtering-correlation-id: 79a4e409-e6d2-4847-3c80-08dbc5ce8b7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DqSA+P3onQRNBSrX5mWGe8TcGlixjr5AwyJ/eMcHfWkzid6SkXSsXfDmQatZ+fiEGOpqzNpfB7pDcxOmJqdmJZim5fesbB8pGKcLbNkGBOjUUozWx4WcR8RkC+36p5ptNR9N/4ei3YkQzeEQOzwnnU9gIFkyfip9Ies5QaHuuWJ3q0nR0AWkubcX4vO6/dOmoTGyz2XL13+KyGVqpEkA64nnanI9Bw83cYYnIw5qMjg5kc1K+vCnHCjV/s6zrCXGj/8GUhmEQJns06i4wof0nSJzLhzZHivplDTdrzIERYd50845CEqkuSaNQPhzH0p6rj+jkjEVN4ulYquD3uDAChaEAOfbfnb9WCmPYA8fndcJUv51QUwatGoyPZDVLOJp9TSf5KNYESsXq/pUPHoUsdn06i81zpkpqphxrsoZas0JO3Kb+jweGAEs55vqAgjEhlj2JiupRzOHfgIwMpzrgzyGVuFBhgZrdw3fe+Jd5CsAyilmn4b/TsDzwRYgO3CVebhoiicUcD0zbqW3SHOhSFsuTsqwbVlVK58ds2eRKGX9AekjhPVo5Ao/aXXOYzIA8xSiJ0dGu8QKlhrhRJwAgC7fDRih2LWWJdZ6fSFOYvyufC+bLRfVEyNjKT2ndu+f
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(396003)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(7406005)(41300700001)(66556008)(8676002)(38070700005)(4326008)(8936002)(91956017)(54906003)(66446008)(38100700002)(316002)(66946007)(110136005)(66476007)(478600001)(5660300002)(64756008)(76116006)(71200400001)(82960400001)(6506007)(7416002)(4744005)(2616005)(26005)(122000001)(6512007)(2906002)(6486002)(36756003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VStPR1BQWTRxREpaamFYQVMxQ0tNZUZnVWs0b0Z4NGw0WlhRQ1lHWlFtUlhy?=
 =?utf-8?B?QjN3V1I0amw5SzVpTG9MM2RyUG1GYlh6dGxPc29qTDNibnJBK0hBb2lwZWl5?=
 =?utf-8?B?Q2V2NGVkcWJERWc3SVBRaVFMNWtIVXdCVko5Y2xDU21lV1lUS1R2ZTY0cnp6?=
 =?utf-8?B?THl2T2FrTjRmNmlJdEJVTFRGbE5tOTFiYzJSZnFEME9nTko3OFFRWWVpS2hj?=
 =?utf-8?B?a0t1UDV1T3B1Q1JGeFR5Q0lJV2FGMzJXWC9lZ09aT1JaUVFoVDlwQUo4QjJY?=
 =?utf-8?B?TlEvL2dTbTNNdmNYOGdkL2hsZWZPdXdZeTVVdmhidzRMZjM1Zm51aGNkY0ZP?=
 =?utf-8?B?SVJkZ0RPclNiWWlRMjFRY2ZWVUY5cWliUEc5VStHV1cxZzhTKzAzRnhLaSth?=
 =?utf-8?B?cG91OUFTSWorbHBJTjhQOFZUcktXbXlmL2FmcDlHeVlURUhmSmJTaFZtZWJy?=
 =?utf-8?B?NWtsd1ZwOVFrMFV1RzlIY3pVdnJVL2tYekJXSEpuUldMV1BLWUNZNnBjVHFQ?=
 =?utf-8?B?SE52MG5Sd0grMVdKaUlDOVgxa25aeTdCR3hVUytSa0c5SXk1N0NjYTFDNEw3?=
 =?utf-8?B?ZHJqUDdvZ3F4cDRFMHU3ZFFpWmlTcnFCYlQ5SjJKdzBxdW42dmsxeVRrWmZY?=
 =?utf-8?B?T2J6M1RDMzYwYmdzMjRQMFdxTmdVcEY0cUkyT1dFR3FPbzlJTHBLVXhBY2Z2?=
 =?utf-8?B?MFVGL3JFdmloV2ZSTDZkS0ZWVnFvMG5TOWE2azE0Z0wwcXhJYlhCcnA2TmxQ?=
 =?utf-8?B?bGJIeHZFcHFCV3luZUVRb2U4ZW9aU0tsWmh4ZGV6bmdIMEsvbDA4SXFXVU8y?=
 =?utf-8?B?M3I0RWNmWEhHbHBmZGNuYlJjMGtJQ2JqZExYTE1yR2ZpZkZ5K0RPeGptWW9y?=
 =?utf-8?B?WWRvUkMreGhmSVYxQnVuOVo4UWhBek9MME1hVEI2RGhrWWI0TXgyUExUL2ZU?=
 =?utf-8?B?ZVJDbUhsTGYrL1R0Z1lseXkxUHRqOFV0R3FJblJMNFU5bGxqSmlUMEU1UGNx?=
 =?utf-8?B?UGJhUFZuM2xXNmgvRWJ0OVdKVHd2aU96cnRJUGh3cUJ3OHhUUnZaNlFLRGNG?=
 =?utf-8?B?Zjd6eXZDZWFOSXM0OEYzYXkrKzAzZjNpYnAveTBUVHJCYnczckxMVXk5UFMy?=
 =?utf-8?B?RytNWVdCUnBIV1dMMy8rQkpKandzc0lJWWNNbWRQUTJMZFQrU0RvVzN3T0tE?=
 =?utf-8?B?ai9ZOHVlWE1leXN3Ukt3ZWFGaGhpbnIweUE4VkFzMm1xbDZmdVJ4Z3lqMVhY?=
 =?utf-8?B?WTlqdlNnTHZWT01TMHhSYlF2d0pWS252a1NPV3FHbWw5Z0MwcFY0Y21GbzRL?=
 =?utf-8?B?U3JXd25Bd1FLY3YvTUZQcWpaMExJTnFkZHcvQW1ZVnpwdENONmM2VnU5R0pQ?=
 =?utf-8?B?Wmw4T2F0dUVBYnFocWFEdVEwWWF4MFUwTHdrU09kTjhya0ZXeVNqYnl3b0Y2?=
 =?utf-8?B?dmFvbWZrMXVzeVR3WVBBOWIxakI1Q3ZEUVZJZ3NwZ2pQUWJoRFdTQzZUSnUz?=
 =?utf-8?B?eGJZRGxuMVY0dVRORGd2bit1Z1RWVUtBNWt4VlpNY3Z4bWtqQ1BKZ1lCZkpR?=
 =?utf-8?B?U0k1L0NhcWs2MXk0V0Z6cUU2bHJ3YlRlKzhhWDJHcEtQZ3R2OFBpc0FNeEtV?=
 =?utf-8?B?NUFZQSs3YkdzYWVwd2JQVS9zUVlDdVJHc0wvb2lqKzNsSlZmK3pHb0NYM09t?=
 =?utf-8?B?cDE4UEpKcjRYRlcrZnU3Z1pMaWNBNUpuYUh6U1l6UHpWTElKUGFsTzRVS2x5?=
 =?utf-8?B?emNMYXYyMHNDRm8yakJiQ3Vrb1VjRGd6Zm5SYXFLQ05IYkhCL0RUZC85TnZq?=
 =?utf-8?B?bHFnemxvZ2E5SUcreWs3NVlJMVZtT2hCM09KQThGK2MrcUZURlJJQWZlUURx?=
 =?utf-8?B?MFg5NDh6S2ZhVk5lZUVKSVpFLy9PVXdCR3AwWUtEbnpNaUNpTVNPSjBjcnB6?=
 =?utf-8?B?dXhzWnErVDRCOXdIVGZYd09BMi9TRnRTMVk5OTgzUEZEaVdGVnVBNitPaU80?=
 =?utf-8?B?NVd0QjRRV2EycG9ybm8wV2x5a3E0eGxQWUVOdzhJVS9BWXA3RTNSdjBsMjlF?=
 =?utf-8?B?MzVud05HQ0VmRDl1UkZHR1RxQlBmUGxrRE9sWGJnTUpvRWxPYmNMYjFGWnBU?=
 =?utf-8?B?ekkxdjNmOVJ3eXd4Mi9aM3F2dDlzTDVUN29pZ2l4Vkt1TXpTejBLa21RZWFF?=
 =?utf-8?B?bVE9PQ==?=
Content-ID: <02A3B455511F6F4589834950B9AC6B01@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a4e409-e6d2-4847-3c80-08dbc5ce8b7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 18:11:49.6587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: we+gHrJimaodpXrpsZfiNtWxQpFghB5bMBIprl72XUHWXPjKQbZsvelp0NtUcQdoRQq7sKZDIDOaKk8wJ3RvwKgo+ZPWW9EW4iIuKkKCmSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6111
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_111201_199308_9B872ACB 
X-CRM114-Status: GOOD (  10.97  )
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

T24gTW9uLCAyMDIzLTA5LTE4IGF0IDEwOjI5ICswMzAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+
ICsvKioKPiArICogc3RydWN0IGV4ZWNtZW1fcmFuZ2UgLSBkZWZpbml0aW9uIG9mIGEgbWVtb3J5
IHJhbmdlIHN1aXRhYmxlIGZvcgo+IGNvZGUgYW5kCj4gKyAqwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVsYXRlZCBkYXRhIGFsbG9jYXRpb25zCj4gKyAqIEBz
dGFydDrCoMKgwqDCoMKgYWRkcmVzcyBzcGFjZSBzdGFydAo+ICsgKiBAZW5kOsKgwqDCoMKgwqDC
oMKgYWRkcmVzcyBzcGFjZSBlbmQgKGluY2x1c2l2ZSkKPiArICogQHBncHJvdDrCoMKgwqDCoHBl
cm1pc3Npb25zIGZvciBtZW1vcnkgaW4gdGhpcyBhZGRyZXNzIHNwYWNlCj4gKyAqIEBhbGlnbm1l
bnQ6wqBhbGlnbm1lbnQgcmVxdWlyZWQgZm9yIHRleHQgYWxsb2NhdGlvbnMKPiArICovCj4gK3N0
cnVjdCBleGVjbWVtX3JhbmdlIHsKPiArwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBsb25nwqDCoCBz
dGFydDsKPiArwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBsb25nwqDCoCBlbmQ7Cj4gK8KgwqDCoMKg
wqDCoMKgcGdwcm90X3TCoMKgwqDCoMKgwqDCoCBwZ3Byb3Q7Cj4gK8KgwqDCoMKgwqDCoMKgdW5z
aWduZWQgaW50wqDCoMKgwqBhbGlnbm1lbnQ7Cj4gK307CgpOb3QgYSBzdHJvbmcgb3Bpbmlvbiwg
YnV0IHJhbmdlIGRvZXNuJ3Qgc2VlbSBhbiBhcHByb3ByaWF0ZSBuYW1lLiBJdAoqaGFzKiBhIHJh
bmdlLCBidXQgYWxzbyBvdGhlciBhbGxvY2F0aW9uIGNvbmZpZ3VyYXRpb24uIEl0IGdldHMKZXNw
ZWNpYWxseSBjb25mdXNpbmcgd2hlbiBtdWx0aXBsZSAicmFuZ2VzIiBoYXZlIHRoZSBzYW1lIHJh
bmdlLiBNYXliZQpleGVjbWVtX2FsbG9jX3BhcmFtcz8KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
