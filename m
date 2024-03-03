Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E85C48BF6
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Mar 2024 10:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihe7BG6IXvhDLOocGLX9oVx4NDVDWwXktKqE9aQcH1I=; b=s6fh9rP8/KZy03
	mHz5gMbhcHn8GqqiROtTXbrcxcUtGUGwrE0gnPZFADo6n/IDTWHq+9ZUsjZWizOb0xOYK3K+l1Htw
	i/YZGGDprAxLLOq5hagQ9NzkXSckxI371MgHvCd4gYaWuDQ79b7gmAz59xUoenCm6jz0UpPEFf7MJ
	k8qk87BFxHBf7yPdh7RDWWNOLGLGiD5gfbcOesiIkLNFPE3nHJgFIt64HSzl8RNLXHunevFmwhxrC
	IVuUSKEvd2VybwJw4AVnkrwM6chafRxVHIKK+tosUn4chEXBeVAzNROSG6UE98/wpRV4j5ors0KSG
	ledAUe4s2y78JVWQjV7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgjBm-00000005fdG-2yTd;
	Sun, 03 Mar 2024 10:35:26 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgjBj-00000005fbT-1DJC
	for linux-riscv@lists.infradead.org;
	Sun, 03 Mar 2024 10:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709462123; x=1740998123;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ONJfta5UFLgGgcy3jhGRbd3xt5dL0TzkXPLq0e4hcBo=;
  b=NRaZfhTNUTrp2azQZpQBktZh4h8+3vBkfGWMW1DaEwj9qotc7NiKh/IU
   yF7l6gZhtU5juffrOyyvDznXCNyGVj0x/9NLiKbkAsQis9ekABrWRjgnp
   W1WGCGZjnPWh06I+PIOix99D8Qpz7gld13WEUmNOPTJNkcDgNnMkxa5CS
   kpSjzE/kYN3/L1/D2c4Q8mCOJ9AmIScz3zsJzsGeUQ6kCSutg1JIvZjDn
   KCgcDAG0uoOLQqlL+9miOii9TVvbAhxC4Wm0+j5rAPjQ6SWfCm9k1++bg
   Z71PR22QPQaW1nmtyl8OvDCZ4xktiVf1mzCaZyNA83yBcC1+LNShD5vG/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="6912046"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="6912046"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 02:35:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="13377800"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Mar 2024 02:35:19 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 3 Mar 2024 02:35:18 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 3 Mar 2024 02:35:17 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 3 Mar 2024 02:35:17 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 3 Mar 2024 02:35:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=go4Gk6mLedDoJkKlWFVYVwpMT6ExvCAnPEb7SfmLYN39rI9d7TeT62jSCpA8fdGwLW7aEz7v79XXKemnZLYkg4eLu8S+8ZMNCyGZqQ84BpJVTeSQm3boSdPuqrUdeHxTV77xTJfg9yjSAIO6Kqb4EVEW8VmievF2FvPbxcofrmqMIreqSBzKSbaPuhUsn4U2TZnAXoJHb3o8JGBbZ/nMZsqXXkwtuavATuo4/i7kcS7tPRANU5PxgTcuMRj/R4Kn1hhfsyFZ4XyiNuUjelfbKf8zSvAqZ2bUmG1tast/aLjbDj4HJFhRzDEv0hJ72WoAoLLAkgcmznx/bmO7UNvDhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKMCYCMwe5jH/JXlq8z2xN8VPu1jhElFCWp4DuUGcnw=;
 b=egy9rxbWXc6cV33wNiQKKKMhfZLBW/ZsQoiaaP0QDwIz3Onti1W706hrhRB73Q4wH2uATPdNrsutdF7bymRummG0aSG0ZjavJEvhgBlianOmUr0aAET++yGBa0rMiH39H33HWcHfsHzOoSHtLA0Nq3I9DUecxkHWYRDatmzAD8mNMdJlHl3pjKJlLOSuoIq4llb202k5Si+PFv0OmyBhQtE1+xOuk68ylkomACJk5v3UirXln8tobVBZLrFRW5wXyU86Eug7cDtvXE5vMmzYDB27pu34iUXRZNsbEMezdkVChtQY4vHD9w2E3ufsEV226S7jEwtiUB3CpGsh8LLxsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CO1PR11MB5203.namprd11.prod.outlook.com (2603:10b6:303:98::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.21; Sun, 3 Mar 2024 10:35:15 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::7cad:cb8a:117e:9f96]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::7cad:cb8a:117e:9f96%4]) with mapi id 15.20.7362.019; Sun, 3 Mar 2024
 10:35:15 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>
CC: "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>, "heiko@sntech.de"
	<heiko@sntech.de>, "Li, Haicheng" <haicheng.li@intel.com>,
	"david.laight@aculab.com" <david.laight@aculab.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] riscv: Optimize crc32 with Zbc extension
Thread-Topic: [PATCH v2] riscv: Optimize crc32 with Zbc extension
Thread-Index: AQHaT/lFcNdutWI4S0qxGvecBrSKgrEmCrYA
Date: Sun, 3 Mar 2024 10:35:15 +0000
Message-ID: <DM8PR11MB57515FA819DCDF2DD1E56605B85C2@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20240126014439.1389033-1-xiao.w.wang@intel.com>
In-Reply-To: <20240126014439.1389033-1-xiao.w.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CO1PR11MB5203:EE_
x-ms-office365-filtering-correlation-id: 43dea5a5-0a72-4a4d-7b27-08dc3b6d9d42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tMgI0nRKMqR9W8tmUYvS2ww6ifvHKomFIJtPLwCOtRYdagPtOB/Kd6k3r34rGTwCCtNooVVmDsWud0juNDE3X3NlbfmJiqTnfFAVqSUlDlaKE5vse1QddHCvGaMc2uny/49h4/pBG+TN/JcBKdd8FJ72VBxPFGkkXWmeIWA6qdLJ7Wj3Ef3Ds6KZByhyJb2AjaMXgkgj1CYmDxSfZcWsbnjM2bhbh9HGO9ef68Ly4Lty2Z88dkevCuJQe6+GANbx4rQ7W6+426ekjLE8gqMm7vGAgQySPFrEZflQ9zyTnsSoPwZ48q4NMWOX0EacNQ4kTYvg8rtjNjA8wNA8ZOKyWy4DNAzXDIA+8rHafFxsUXWA9dNUpIlYGZwiTs0dAp75ZpZaSpdkxCk0lmHGsaSlLcb5mDu+BmPBPl/DWM6D+hzhGPrn0XsOSt4lq+qCWoKBg7Lk5/Q9WriAi/QVHFpIB+nr2TTGEwrBRmAySg/sa6+uAsx7lCILQzA+3CWhmirTI7Wk40gyco1zLhI9rUKFesIaIKhD6KwG1RX1oMzcANbdmrxNGcvifsRDpNSp+iBj90o13KCCEhVZ93CAnbn9y2WEIx/fFCx/qSEkPchLVJI79Qklwk+jKINGNeLEAsARmjo2USxNXco6WlHCK3AlGR16KdhsQH6a7Zr8CT56uFw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?gb2iaF3vmUNwMSRLw9hVIYHm6O9pj4Fmnroc2LGnnewLFi6fR5McwC4H?=
 =?Windows-1252?Q?XeMKBDjJD2I+w/cfm5b/Hsewnr6vCd/FuZcs290NePcgQhAFL56llloJ?=
 =?Windows-1252?Q?CnyPzqOqMKD/uXHITRxvlrtTmZ58XDZUyQDXcspWUchPH/Kf1e4k8TBQ?=
 =?Windows-1252?Q?lBHx03PD4GqtlzSpw9XB8QtTG5nLqAuSo0tD7VOPB4QE2jDKjWCvY1Zy?=
 =?Windows-1252?Q?+p3CxEoT+eCiIah8lja9IPzvcSumM7IaQyKS/prbcvpqv0sqyACEpAMP?=
 =?Windows-1252?Q?ySg732sWeJRweZNAAxQ43LfTim271bKaKtUL+RZaCUb2iO/TZWx9dmVq?=
 =?Windows-1252?Q?9lREy3MeYcH3Uv/+h+8ltKfpVqYXLj8daJKpvop9fV2QikU6IzjdqYOw?=
 =?Windows-1252?Q?QaWGqBZLdMse8ea/UNLUUyYtJ/L3FKsA/7SSulNecjZRU3QFH/MJYoba?=
 =?Windows-1252?Q?Ynstr6a5rJtfxBCdWHhKLnLRohh96qpIZn7rxw6PA/nPxpqTVvyMf+e7?=
 =?Windows-1252?Q?ub80IIgli1K1ZnUtC9j4nIiDYRi6ItqncUxBoXQXM7JykR4xL4UfLH4v?=
 =?Windows-1252?Q?m37FEYorzYB9CqIGbSNOlFZ55ksTL0H5cR2t6AqP3vzmnYMw5mUclUcV?=
 =?Windows-1252?Q?VB1OE7EIksdsQ11Tko2yb0jZgMP5+qEZQGiVC9DkoGkNyHtzM/nSfkt1?=
 =?Windows-1252?Q?0qN88MPQrC0NkDULL+EUs7DephKxvqY7XdVayYApAiO/wPPeXRJduzjV?=
 =?Windows-1252?Q?IVDg7cxSCbl629Q6Of+hgZsJ/1kbqGK7tau50+MjBJSXdxGsxQqPs16H?=
 =?Windows-1252?Q?MQaqFjOCS0T9L962vdCLt2hG2Itx/+gJkERA+VocbayTyjRMp7tQYkj8?=
 =?Windows-1252?Q?8J6fZ/1HZY/UnR+XtygtmQHbeYEPOsJ+HsbfyUnJ/qmpqXXoLf+AJXTs?=
 =?Windows-1252?Q?5rA+v9mSC8B9m+9SsqvdcWIKdwg7wYc+TCxvWB9DiTPW/GGBybkkX6Pp?=
 =?Windows-1252?Q?Tpzu6vCmoJTDLLxbaRUJ4iXUme5rIZUl3Rn1HFsglRe02EmnrHL+SoxC?=
 =?Windows-1252?Q?8yF5VZs4cOus3vfTz6L5Q5zN92XUS9tsqO23kxVsH4GrVEejcdS28FNe?=
 =?Windows-1252?Q?s4qZcU4abeZEDs77xP1Gh2PpQ6rVGR+a+ddjaHQY5hyFAuFKLUko+KDD?=
 =?Windows-1252?Q?PTa8HoonuUQbHYWWIPpte+vINsX1QiTEJ1Cj5uBY2agnuWuS9VNLMely?=
 =?Windows-1252?Q?Z9PLyVrjDzbhVq5q/eshJ1kLmNFHWh7xNmoTB6wehdYZ+3hNEinLywDh?=
 =?Windows-1252?Q?cuFmAYmyxBvzOKa0Iya/CqbZKe+Xcqaj0HISOIQsbQ0uC1HewPTrGn8z?=
 =?Windows-1252?Q?yRf2muR+s5SnGdAqFjeOWXGk7L2HJ/TFeYUkg047BRZSNe6sLyYrwMW6?=
 =?Windows-1252?Q?7M6UzS7Pfpo2dGhvRGoeiJYQAD417R17JpE/an/vCQdfqVdUGxFNRlyu?=
 =?Windows-1252?Q?XSC1lxjrEU5C9KDQBGTfJcOdrNx85NulpRDAo4XbAgV/d9c/U2iMHZ0F?=
 =?Windows-1252?Q?tpVzWxqFnGDKakmHBce4wUAwvqsiJe9fX+q1MDs4Nr1J0AWb8JNmk8bI?=
 =?Windows-1252?Q?SNNH/UlR9SU78Qg919WzQN63l4kaqr2MZECeg64rSabX0C/12HVfgumA?=
 =?Windows-1252?Q?SZAXg9xYJBW2LUoQ6qcU7HxnOOWBbZL3?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43dea5a5-0a72-4a4d-7b27-08dc3b6d9d42
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2024 10:35:15.5105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6hzB2DQn3piLnJH4bDlZWnT1XBCOSyPOg218rf8ZqduIX5BeruCaJt1eC9xxRfdA2WXZqaivRAUFFjQdYenhGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5203
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240303_023523_428496_D4113C92 
X-CRM114-Status: GOOD (  32.00  )
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

A gentle ping, any other comments or suggestions for this patch? Welcome any comments and ideas.

BRs,
Xiao

> -----Original Message-----
> From: Wang, Xiao W <xiao.w.wang@intel.com>
> Sent: Friday, January 26, 2024 9:45 AM
> To: paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu
> Cc: conor.dooley@microchip.com; ajones@ventanamicro.com;
> heiko@sntech.de; Li, Haicheng <haicheng.li@intel.com>;
> david.laight@aculab.com; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org; Wang, Xiao W <xiao.w.wang@intel.com>
> Subject: [PATCH v2] riscv: Optimize crc32 with Zbc extension
> 
> As suggested by the B-ext spec, the Zbc (carry-less multiplication)
> instructions can be used to accelerate CRC calculations. Currently, the
> crc32 is the most widely used crc function inside kernel, so this patch
> focuses on the optimization of just the crc32 APIs.
> 
> Compared with the current table-lookup based optimization, Zbc based
> optimization can also achieve large stride during CRC calculation loop,
> meantime, it avoids the memory access latency of the table-lookup based
> implementation and it reduces memory footprint.
> 
> If Zbc feature is not supported in a runtime environment, then the
> table-lookup based implementation would serve as fallback via alternative
> mechanism. To avoid the performance concern of unalignment access, we also
> use the fallback implementation to handle the head and tail bytes if any,
> the main body is accelerated by Zbc extension.
> 
> By inspecting the vmlinux built by gcc v12.2.0 with default optimization
> level (-O2), we can see below instruction count change for each 8-byte
> stride in the CRC32 loop:
> 
> rv64: crc32_be (54->31), crc32_le (54->13), __crc32c_le (54->13)
> rv32: crc32_be (50->32), crc32_le (50->16), __crc32c_le (50->16)
> 
> The compile target CPU is little endian, so there's extra effort needed to
> do byte swapping for the crc32_be API, so the instruction count change is
> not as significant as that in the *_le cases.
> 
> This patch is tested on QEMU VM with the kernel CRC32 selftest.
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
> v2:
> - Fix sparse warnings about type casting. (lkp)
> - Add info about instruction count change in commit log. (Andrew)
> - Use the min() helper from linux/minmax.h. (Andrew)
> - Use "#if __riscv_xlen == 64" macro check to differentiate rv64 and rv32.
> (Andrew)
> - Line up several macro values by tab. (Andrew)
> - Make poly_qt as "unsigned long" to unify the code for rv64 and rv32. (David)
> - Fix the style of comment wing. (Andrew)
> - Add function wrappers for the asm code for the *_le cases. (Andrew)
> ---
>  arch/riscv/Kconfig      |  23 ++++
>  arch/riscv/lib/Makefile |   1 +
>  arch/riscv/lib/crc32.c  | 226
> ++++++++++++++++++++++++++++++++++++++++
>  include/linux/crc32.h   |   3 +
>  4 files changed, 253 insertions(+)
>  create mode 100644 arch/riscv/lib/crc32.c
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a82bc8bed503..436fad3432a5 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -604,6 +604,29 @@ config RISCV_ISA_ZBB
> 
>  	   If you don't know what to do here, say Y.
> 
> +config TOOLCHAIN_HAS_ZBC
> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbc)
> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbc)
> +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> +	depends on AS_HAS_OPTION_ARCH
> +
> +config RISCV_ISA_ZBC
> +	bool "Zbc extension support for carry-less multiplication instructions"
> +	depends on TOOLCHAIN_HAS_ZBC
> +	depends on MMU
> +	depends on RISCV_ALTERNATIVE
> +	default y
> +	help
> +	   Adds support to dynamically detect the presence of the Zbc
> +	   extension (carry-less multiplication) and enable its usage.
> +
> +	   The Zbc extension could accelerate CRC (cyclic redundancy check)
> +	   calculations.
> +
> +	   If you don't know what to do here, say Y.
> +
>  config RISCV_ISA_ZICBOM
>  	bool "Zicbom extension support for non-coherent DMA operation"
>  	depends on MMU
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index bd6e6c1b0497..2b369f51b0a5 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -13,6 +13,7 @@ endif
>  lib-$(CONFIG_MMU)	+= uaccess.o
>  lib-$(CONFIG_64BIT)	+= tishift.o
>  lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
> +lib-$(CONFIG_RISCV_ISA_ZBC)	+= crc32.o
> 
>  obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
>  lib-$(CONFIG_RISCV_ISA_V)	+= xor.o
> diff --git a/arch/riscv/lib/crc32.c b/arch/riscv/lib/crc32.c
> new file mode 100644
> index 000000000000..4cd102572450
> --- /dev/null
> +++ b/arch/riscv/lib/crc32.c
> @@ -0,0 +1,226 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Accelerated CRC32 implementation with Zbc extension.
> + *
> + * Copyright (C) 2024 Intel Corporation
> + *
> + * Authors:
> + *     Xiao Wang <xiao.w.wang@intel.com>
> + */
> +
> +#include <asm/hwcap.h>
> +#include <asm/alternative-macros.h>
> +#include <asm/byteorder.h>
> +
> +#include <linux/types.h>
> +#include <linux/minmax.h>
> +#include <linux/crc32poly.h>
> +#include <linux/crc32.h>
> +#include <linux/byteorder/generic.h>
> +
> +/*
> + * Refer to https://www.corsix.org/content/barrett-reduction-polynomials
> for
> + * better understanding of how this math works.
> + *
> + * let "+" denotes polynomial add (XOR)
> + * let "-" denotes polynomial sub (XOR)
> + * let "*" denotes polynomial multiplication
> + * let "/" denotes polynomial floor division
> + * let "S" denotes source data, XLEN bit wide
> + * let "P" denotes CRC32 polynomial
> + * let "T" denotes 2^(XLEN+32)
> + * let "QT" denotes quotient of T/P, with the bit for 2^XLEN being implicit
> + *
> + * crc32(S, P)
> + * => S * (2^32) - S * (2^32) / P * P
> + * => lowest 32 bits of: S * (2^32) / P * P
> + * => lowest 32 bits of: S * (2^32) * (T / P) / T * P
> + * => lowest 32 bits of: S * (2^32) * quotient / T * P
> + * => lowest 32 bits of: S * quotient / 2^XLEN * P
> + * => lowest 32 bits of: (clmul_high_part(S, QT) + S) * P
> + * => clmul_low_part(clmul_high_part(S, QT) + S, P)
> + *
> + * In terms of below implementations, the BE case is more intuitive, since the
> + * higher order bit sits at more significant position.
> + */
> +
> +#if __riscv_xlen == 64
> +/* Slide by XLEN bits per iteration */
> +# define STEP_ORDER 3
> +
> +/* Each below polynomial quotient has an implicit bit for 2^XLEN */
> +
> +/* Polynomial quotient of (2^(XLEN+32))/CRC32_POLY, in LE format */
> +# define CRC32_POLY_QT_LE	0x5a72d812fb808b20
> +
> +/* Polynomial quotient of (2^(XLEN+32))/CRC32C_POLY, in LE format */
> +# define CRC32C_POLY_QT_LE	0xa434f61c6f5389f8
> +
> +/* Polynomial quotient of (2^(XLEN+32))/CRC32_POLY, in BE format, it
> should be
> + * the same as the bit-reversed version of CRC32_POLY_QT_LE
> + */
> +# define CRC32_POLY_QT_BE	0x04d101df481b4e5a
> +
> +static inline u32 crc32_le_zbc(u32 crc, const unsigned long *ptr, u32 poly,
> +			       unsigned long poly_qt)
> +{
> +		u64 s = (u64)crc ^ (__force u64)__cpu_to_le64(*ptr);
> +		/*
> +		 * We don't have a "clmulrh" insn, so use clmul + slli instead.
> +		 */
> +		asm volatile (".option push\n"
> +			      ".option arch,+zbc\n"
> +			      "clmul	%0, %1, %2\n"
> +			      "slli	%0, %0, 1\n"
> +			      "xor	%0, %0, %1\n"
> +			      "clmulr	%0, %0, %3\n"
> +			      "srli	%0, %0, 32\n"
> +			      ".option pop\n"
> +			      : "=&r" (crc)
> +			      : "r" (s),
> +				"r" (poly_qt),
> +				"r" ((u64)poly << 32)
> +			      :);
> +		return crc;
> +}
> +
> +#elif __riscv_xlen == 32
> +# define STEP_ORDER 2
> +/* Each quotient should match the upper half of its analog in RV64 */
> +# define CRC32_POLY_QT_LE	0xfb808b20
> +# define CRC32C_POLY_QT_LE	0x6f5389f8
> +# define CRC32_POLY_QT_BE	0x04d101df
> +
> +static inline u32 crc32_le_zbc(u32 crc, const unsigned long *ptr, u32 poly,
> +			       unsigned long poly_qt)
> +{
> +		u32 s = crc ^ (__force u32)__cpu_to_le32(*ptr);
> +		/*
> +		 * We don't have a "clmulrh" insn, so use clmul + slli instead.
> +		 */
> +		asm volatile (".option push\n"
> +			      ".option arch,+zbc\n"
> +			      "clmul	%0, %1, %2\n"
> +			      "slli	%0, %0, 1\n"
> +			      "xor	%0, %0, %1\n"
> +			      "clmulr	%0, %0, %3\n"
> +			      ".option pop\n"
> +			      : "=&r" (crc)
> +			      : "r" (s),
> +				"r" (poly_qt),
> +				"r" (poly)
> +			      :);
> +		return crc;
> +}
> +
> +#else
> +# error "Unexpected __riscv_xlen"
> +#endif
> +
> +#define STEP		(1 << STEP_ORDER)
> +#define OFFSET_MASK	(STEP - 1)
> +
> +typedef u32 (*fallback)(u32 crc, unsigned char const *p, size_t len);
> +
> +static inline u32 __pure crc32_le_generic(u32 crc, unsigned char const *p,
> +					  size_t len, u32 poly,
> +					  unsigned long poly_qt,
> +					  fallback crc_fb)
> +{
> +	size_t offset, head_len, tail_len;
> +	const unsigned long *p_ul;
> +
> +	asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
> +				      RISCV_ISA_EXT_ZBC, 1)
> +			  : : : : legacy);
> +
> +	/* Handle the unalignment head. */
> +	offset = (unsigned long)p & OFFSET_MASK;
> +	if (offset) {
> +		head_len = min(STEP - offset, len);
> +		crc = crc_fb(crc, p, head_len);
> +		len -= head_len;
> +		p += head_len;
> +	}
> +
> +	tail_len = len & OFFSET_MASK;
> +	len = len >> STEP_ORDER;
> +	p_ul = (unsigned long *)p;
> +
> +	for (int i = 0; i < len; i++) {
> +		crc = crc32_le_zbc(crc, p_ul, poly, poly_qt);
> +		p_ul++;
> +	}
> +
> +	/* Handle the tail bytes. */
> +	if (tail_len)
> +		crc = crc_fb(crc, (unsigned char const *)p_ul, tail_len);
> +	return crc;
> +
> +legacy:
> +	return crc_fb(crc, p, len);
> +}
> +
> +u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len)
> +{
> +	return crc32_le_generic(crc, p, len, CRC32_POLY_LE,
> CRC32_POLY_QT_LE,
> +				crc32_le_base);
> +}
> +
> +u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len)
> +{
> +	return crc32_le_generic(crc, p, len, CRC32C_POLY_LE,
> +				CRC32C_POLY_QT_LE, __crc32c_le_base);
> +}
> +
> +u32 __pure crc32_be(u32 crc, unsigned char const *p, size_t len)
> +{
> +	size_t offset, head_len, tail_len;
> +	const unsigned long *p_ul;
> +	unsigned long s;
> +
> +	asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
> +				      RISCV_ISA_EXT_ZBC, 1)
> +			  : : : : legacy);
> +
> +	/* Handle the unalignment head. */
> +	offset = (unsigned long)p & OFFSET_MASK;
> +	if (offset) {
> +		head_len = min(STEP - offset, len);
> +		crc = crc32_be_base(crc, p, head_len);
> +		len -= head_len;
> +		p += head_len;
> +	}
> +
> +	tail_len = len & OFFSET_MASK;
> +	len = len >> STEP_ORDER;
> +	p_ul = (unsigned long *)p;
> +
> +	for (int i = 0; i < len; i++) {
> +#if __riscv_xlen == 64
> +		s = (u64)crc << 32;
> +		s ^= (__force u64)__cpu_to_be64(*p_ul++);
> +#else
> +		s = crc ^ (__force u32)__cpu_to_be32(*p_ul++);
> +#endif
> +		asm volatile (".option push\n"
> +			      ".option arch,+zbc\n"
> +			      "clmulh	%0, %1, %2\n"
> +			      "xor	%0, %0, %1\n"
> +			      "clmul	%0, %0, %3\n"
> +			      ".option pop\n"
> +			      : "=&r" (crc)
> +			      : "r" (s),
> +				"r" (CRC32_POLY_QT_BE),
> +				"r" (CRC32_POLY_BE)
> +			      :);
> +	}
> +
> +	/* Handle the tail bytes. */
> +	if (tail_len)
> +		crc = crc32_be_base(crc, (unsigned char const *)p_ul, tail_len);
> +	return crc;
> +
> +legacy:
> +	return crc32_be_base(crc, p, len);
> +}
> diff --git a/include/linux/crc32.h b/include/linux/crc32.h
> index 9e8a032c1788..87f788c0d607 100644
> --- a/include/linux/crc32.h
> +++ b/include/linux/crc32.h
> @@ -9,7 +9,9 @@
>  #include <linux/bitrev.h>
> 
>  u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len);
> +u32 __pure crc32_le_base(u32 crc, unsigned char const *p, size_t len);
>  u32 __pure crc32_be(u32 crc, unsigned char const *p, size_t len);
> +u32 __pure crc32_be_base(u32 crc, unsigned char const *p, size_t len);
> 
>  /**
>   * crc32_le_combine - Combine two crc32 check values into one. For two
> @@ -37,6 +39,7 @@ static inline u32 crc32_le_combine(u32 crc1, u32 crc2,
> size_t len2)
>  }
> 
>  u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len);
> +u32 __pure __crc32c_le_base(u32 crc, unsigned char const *p, size_t len);
> 
>  /**
>   * __crc32c_le_combine - Combine two crc32c check values into one. For two
> --
> 2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
