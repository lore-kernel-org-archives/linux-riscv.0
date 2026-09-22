Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6F3C98302
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 16:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Umq/4VJ04FOfkQadQuCIFZD3MSmgIjp5wz7dVDEqS+c=; b=xzpfFx/Gwb+srk
	UPApxD/46CpzOP1GMVNdISZx/+vo14kBDOgU0FbgITbTKz0OstvVZwXG7hV90njmJ1r/FZ6jZARol
	HfOBeeTrMQdMiwCbJVDggYdO0klA0m3sAl6K8yL+nZ0zc3ef7YgcJnGyhtSvz4JEDV1M5spX3QSvS
	0wHpLJY11rdHbnhvD8+9Vg+FZhvY/rZACyMeE+OWYvcqH2NktvmvjkXmXaDV8qrwolAoVbxVVZuCt
	M7cOXpC/nJc02P82V30JT5bxoYmZZnEujW+JL1LSFhskcmo8AHaBJZ3YykaW3NsihTQ9yn0i7RUrC
	izGpfrq+Q+uVpVu1bqKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93iH-000000066kB-2v4R;
	Tue, 22 Sep 2026 16:51:25 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93iE-000000066jQ-14lW
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 16:51:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790095882; x=1821631882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fGiglEN3TOjrBIOoGTytjdZYEyUEau76cDHZLPe2Ij4=;
  b=RzJ4Bi6zOV2LtkavWxuZ88K1XmuCe3D8zOoEGHTkLfNADAlRN96WNlAI
   gojABEC3/IH83UApAHSLpg+xq36oq6CGSO6J4aVzm1bVhdz5c6gLsiOI3
   7XfO9NM1z8sOyR66NABQfx/7WeLB1Iu5H0Z5dL8Z/LPCUE9pQM2WpMzJJ
   k5HV187k1kCCPWGdSA+6UAD+c6wbSdhC7ozC0lxmAqDgIN7ylpi6Z9503
   nl+Sj2tEDbrLH4jfj5hn5SU58nMvaI4aOdc/SELG9tNUsXl2wZAH+9+eM
   vTsVZb/Xpfrst29uoedbnN8BJMjXqHSV2VU3ve77y4F592AXuhlTnRrME
   w==;
X-CSE-ConnectionGUID: 6AkKslBrTnm2F3f6ymj7bw==
X-CSE-MsgGUID: szAyK2RwSteSwoxjKhovFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="108218266"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="108218266"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 09:51:18 -0700
X-CSE-ConnectionGUID: RBeJXeu2TtCLdhQMhPfPCQ==
X-CSE-MsgGUID: cKf4QG6CRJuoknGwE/LbAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4229338"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 09:51:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 09:51:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 09:51:18 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 09:51:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJJGPI02KN46xb845oPtQCvtTy1aDBMiek/hB2tSZtE2TPnftNb0Wj61GVpSKtyhUzngk4+yBHVwTLgVY4FI4ouPfsdHByG/GelMqjZDdj0DXXbd995hWbKdAgrEtL2p2460ey5TaUc25662S2e0G/stbxUu9SbhJqx87sEQxRM/777JYNYaRxBv+HwHyesmazGrVAkfA1rSYf96ZvGD59ikNyx8RWqVtZeexr6Jk0jeU0UgEyScj/qA4dCPG63KGfcqCc25v0m4ydKBBwrAOvc5QzaSjWl+dtZhVWzgZYQdqRagFDLbxaWEozvf19mtLbLPW8XyQufWJRAdaCh4Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NdMB4NGTVY2KmqORSzEPtOS7a8ymON1hyXPxUNfhkc=;
 b=uRKcSu+rGQvBqbbw9DBg7dnge55veuLvrOLaSRx83KccO/HIfA1stHTo1iPG72+hrdrzEDYRBpX+LLA+HrDnjX2tJbQOYsMg+O8ZzV4Nt3Kj/MzRKz8XRqGPP1Q02OjFppxPgsVWZh6BBqM1yTItUx9BorRLEOpUjNovr4xIA8SBN3N3C1dkD02f/hrOvNbvHyLdoGNba30SopS5uVB5QpkVkIdn057IoDFCycvGxwTGr3wdfoHUGUHnX50Zwx1nYK8nwcJs6KujsINwMGNJOoR13OSVDTByBKMDOp13tJrMeD+izHJy7eDgMi5NNTaO9F6jLMPiFvhmdbSBYP70Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by SA3PR11MB7979.namprd11.prod.outlook.com (2603:10b6:806:2f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 16:51:14 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 16:51:14 +0000
Date: Tue, 22 Sep 2026 09:51:11 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, <babu.moger@amd.com>,
	<baolin.wang@linux.alibaba.com>, <ben.horgan@arm.com>, <corbet@lwn.net>,
	<cuiyunhui@bytedance.com>, <Dave.Martin@arm.com>, <fustini@kernel.org>,
	<james.morse@arm.com>, <jgg@ziepe.ca>, <joro@8bytes.org>,
	<kevin.tian@intel.com>, <palmer@dabbelt.com>, <pjw@kernel.org>,
	<reinette.chatre@intel.com>, <robin.murphy@arm.com>, <shuah@kernel.org>,
	<tomasz.jeznach@linux.dev>, <tony.luck@intel.com>, <wangzhou1@hisilicon.com>,
	<will@kernel.org>, <xiaqinxin@huawei.com>, <yuanzhu@bytedance.com>,
	<zengheng4@huawei.com>, <zhangzhanpeng.jasper@bytedance.com>
CC: <x86@kernel.org>, <iommu@lists.linux.dev>, <linuxarm@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Resctrl and I/O
Message-ID: <arKx__kOPe4B5gDW@agluck-desk3>
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:332::8) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|SA3PR11MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: e0a37c3c-3d20-4c99-0c00-08df18c9b66d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|6133799003|18002099003|3023799007|921020|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: pAc1gRQwJ1p3e+cD25P4/x8hsSnoCaNHyhI5G2PW4ThRAUWrYPfKSAq9lx8uHzTpdzY1TjSxv0hIqRue74OItUNwiG7m2unmkombXQgVgNEnz2MgsKSWc0Rxt0FPWBv8u1tyUDMG+L4Ar4Pwe8Ykq4lx7aUUAeTreEa38Sg7rVpkrD6G19qQr6XUzfj49omxQ94qT8A5nYC99ds4sgHy0SuJZhHQUbxHknv2Lu9wB1W/O78GrxnW71TvSmqbnrmsiFABwuf+2NkgAOtBa+yT/CoPze/lfWNeJ/hEYFSoHJlWBePx69z///IVykru5PJ3iaQjyFo9YEb6LN8JUWm4PsflsYooKc5l93S/VBPa2gj/t8tx//8QV+JhQaTI4PwRrkAKpXvWnxAKOmjN1cw/++IX3PDjmB+6JZP54QH1gSjRmTZiHEjp0/x4xZ5PdQYX9j/VJty/QYrus+OhYUF4zowLipKCv8BBJKgSoz0QUivDTmAZYy8sdv9bHXP8p5HeY47XvcVfCJNzAsg2H5Np3HkgWm4Hkqw0jvSeh3/OX3zY1Vwkeq+ARmqR37WWh0FazLEfOOKb3nf14ep/9iO2DxJb4JRCxqdPHmSjyDLnn12GTXUs5itAleFY0SIbOm0HwyiKf3LORS58KE2oo2baCcndlZYP8tXdNrw+egZksulgZcvnB0LcfwVRVgkqaiYd3hLE1Ms0Yg84Nxc2mRXmzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(6133799003)(18002099003)(3023799007)(921020)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n+3aWEplWuWJ8Gz2PuSqcGr2HsHnnOo28r6IEHKpaanL2hqPN/9FGZ/if5tT?=
 =?us-ascii?Q?xhKtRMUO1yfPx9OUPCeZsf4zdiQyPlTrrDGWTA40hjdb6IV0sTYK7vjngJ9e?=
 =?us-ascii?Q?UO6qC7J61iF613O34pGh3nfiW5M87wOqaNAce3YSB3XBTaL7rfSnXRhHJHkO?=
 =?us-ascii?Q?D2co2/LuViX/DSFF+WWP6z4mOfFIdrKz0Vhev8BiRGFQ/3qC8GP8HhRa2opZ?=
 =?us-ascii?Q?rrv3n8K43BvGCU+oVbNtx/wvEgNvH3KThQjR/7aNrOOsL2Sjt8kpHE8y9W6y?=
 =?us-ascii?Q?WSf6R000GHKW8NCUMAvuduvV1gufFtHo/FlcwoK+OemaifQpV/8n44aoXZiM?=
 =?us-ascii?Q?tRUghXevXOK5zywQdx1uThgu5sbRDskh+pI8wAZT3+niMnxedHf0BgOg0LmQ?=
 =?us-ascii?Q?6D8XEkjBjgYMo+e1auiLb1q8I6GQYmLfQbJnxHRZEWpIH0qkIXA9seymSouC?=
 =?us-ascii?Q?7qgiVZHSAavm43VLJpF9YIRDX0Mxy7dpRMs3ikBfGL+jnKP3LVqmetGsyTs7?=
 =?us-ascii?Q?7EZN1oX7TdhYNAh/sMAj5ZidIWn+WG1uTvtKymp/zZE7UAV0C9FXswpdStY2?=
 =?us-ascii?Q?40rsPWjqyLZZjjA5FpIIcF5VtVXX+2fg4cshA2NwABNi4/zNxq4c4uT5YpNr?=
 =?us-ascii?Q?mE3IPBHYQSpDXw452gRKbRj1sOvbVkP9ro0J1z+3wUINulE9+aRFYlAbdiL9?=
 =?us-ascii?Q?+nB3fgTdKgowxHlnjm7ReUPwCMzmRGI3Z7uJYWZB9DkV6qulqTHdDAYA+Xtb?=
 =?us-ascii?Q?DCMEOU2vReiBEonUiN041hAwIp9VuPKaApnf5OdD84Um1Of+bEuwn2GmDpDB?=
 =?us-ascii?Q?wPmh8uPEl7tq7ovR8e9BIC7qOWNQdwSY45VBdYovPLkLp/T5tfWbm/Yy5Ytm?=
 =?us-ascii?Q?aHpsiE/J6Rp/kxyoMdVIgWhcawXTy5Rnj6SU5a6dCSGdmGh/eCfhqjm+D6AJ?=
 =?us-ascii?Q?zKZcHuur1CA8XAazPekyVTGJIqZ2TnadQCruZKBsNF7bUEJCROO8fLSemXjo?=
 =?us-ascii?Q?fJD9mKyJTB1LFO5VvKb3YayJlLR/O8EXYatouBRnSTV3PIBpHF4+Le3vdEcG?=
 =?us-ascii?Q?y246ve4ZXBBO6GFo1rtxy4UqbOvyo5NKr4KU2WyCGfuYVvlEONW3fA9LNn8D?=
 =?us-ascii?Q?lSHeaOj9Jb9IQS/HbGcqiqdkM2QiP6g+6ks/ipziEKNcO0tOwGURf/VDyPQH?=
 =?us-ascii?Q?fkAAhAXHJfuHktEGHS1cF4pc5L9mKgHj1W8XOfWc5WXRkH9lTbYr4rMAlF5+?=
 =?us-ascii?Q?7GbKSJCiAHoRWuS/Hc2oWBdCwaoqVxvWmKHGFJs1bfw7P9pbkaChRWNTKcjg?=
 =?us-ascii?Q?l2hYPsEyGPjGXRJ0PM0X26og8jEbNP1qoB4ZA3COP7LvsozBcb6bJ/M6aFJD?=
 =?us-ascii?Q?RzhS4wShpQ6WeTc1B/Fexj+xjZPBtuX++72LBDDiBbg46xlleByX5ABscrbv?=
 =?us-ascii?Q?6JzX7Tc71TiKksBmYSS5H1qvj/IifWl1labjkjuYYLS16VfkcvNWsN8JpYGy?=
 =?us-ascii?Q?bu4Yh/LdE81qULguoBAcsxYAl7vmmlEWyqg0by0A0ctuXZdIxlqMk73Sr4rV?=
 =?us-ascii?Q?7Vh7+pZK2KQkYZONGXozFzWavhbnkanUwEbCz8qJ2S5tqx6qnuc0AbMe4ZQp?=
 =?us-ascii?Q?dgsglz53DsVvqWCjrDbJ2gQDfFIf4p0/6plqpdlomAT8KN1VxKUmqUYpfvfk?=
 =?us-ascii?Q?3kUSBuDDzfQojfLd65wTOR26EcYO1dui30kPFqP5Y0vg2EnsrUujXWcWp+mt?=
 =?us-ascii?Q?qJPqHVTW3Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: qffDPunE5ofdfwr/LF6LscFvAX9B+rDjs2LRd3+zympXu3o+TlBzg9b1Nt5vl5gHGoavP7dqobiraYw6HwfttGAYGYrlLLabRwGmTrLGKgfF+CZt5RyGU8g3loG0E9vyHPFE038JZtJP3M6GZNwU+FTVzrMB876GU1sLWtSZCv7xhl2ecfZvzpJ/GMVoq4MhgTEJUI1l8ZPLbdz935f/5uRXxGBCKfeqEAYx6SOp8kpb4+ngn+C6GXvtE8KB2pMfXrNNgqNBPnwnngRNQI7ia95l/qno1gDbPP8xDjbmafJG7QXu0ObmJ+CkhHaC+2AcmuxwCnT8zMsbTlsV3xebgw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a37c3c-3d20-4c99-0c00-08df18c9b66d
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 16:51:13.9948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVo9/MFdVIy+E0ufPFHSBPSu3SS4znwV6UtFuP1G5AsZjNmtpw6f5t4aFPXglQqSWSTrWC8Nk6qSzYobTbm9nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7979
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_095122_322265_558F389E 
X-CRM114-Status: GOOD (  11.37  )
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

Patches for ARM[1] and RISC-V[2] are both at RFC status.

They appear to be based on similar h/w capabilities where architecture
specific tags can be added to transactions from I/O devices by the IOMMU
servicing the device. Device enumeration is handled outside of the resctrl
file system.

ARM docs say "the device name is the one listed under /sys/kernel/iommu_groups/<id>/devices/"

RISC-V says architecture specific device tokens are "devices or device groups"

In both cases assignments are made with:

	# echo {device} > {group}/devices

So now I'm looking at the capabilities of Intel RDT hardware. I'm ignoring
the implementation on the Granite Rapids CPU, and looking at what is described
in the RDT Architecture Specification[3]. Here are the highlights:

1) Enumeration is split between two ACPI tables. IRDT enumerates device groups
and provides MMIO addresses to assign CLOSID/RMID to each group. ERDT provides
MMIO addresses to read event counts for RMIDs and to configure cache allocation
bit masks and memory bandwidth limits.

2) All I/O monitoring and control is with respect to I/O caches, not to the L3
caches that legacy RDT features operate on.

3) The number of RMIDs supported for I/O is lower (maybe considearbly lower)
than the number supported for CPU monitoring.

4) Monitoring events are I/O cache occupancy, total i/o bandwidth, and i/o miss
bandwidth.

5) Current revision (1.4) of the specification doesn't include details of
I/O memory bandwidth control (The "IBAD" subtable of ERDT is reserved for this).


Fitting this into resctrl
-------------------------

RISC-V description of "architecture specific device tokens" sounds great.
I'll have to find some ares of /sys to provide the mapping of tokens to
"device groups". There's no association with IOMMUs, so this will be some
other path in /sys. Perhaps under /sys/firmware/acpi since the data comes
from ACPI IRDT table.

Need an info file to tell users the format and source for device tokens.

I'd like to avoid limiting resctrl monitoring of CPU activity due to the small
number of I/O RMIDs. Perhaps don't include a "devices" file or mon_data/{i/o
events} files in resctrl group directories when rdtgroup::mon::rmid >=
num_io_rmids? But that feels clumsy.

Domains are based on I/O L3 cache instances. So a new rdt_resource with
new line in the schemata file for IOL3 cache masks per domain. In the
future when there are I/O MBA controls, new line(s) for those too.

-Tony


[1] https://lore.kernel.org/linux-iommu/20260901140802.1215508-1-xiaqinxin@huawei.com/
[2] https://lore.kernel.org/lkml/20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com/
[3] Linked from the bottom of https://www.intel.com/sdm under "Related Specifications", or
direct link: https://cdrdv2.intel.com/v1/dl/getContent/789566?erpm_id=1158389_ts1790091453223

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
