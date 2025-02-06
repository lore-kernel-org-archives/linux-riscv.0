Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD39C02194
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 15:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7+TSLHm+Ov4tVlY4qHip0Q59DgY7ZbpMpMQZZxeSj0M=; b=vHxOkT7+Eivw8K
	DocgXblDSsJWhEkfzms8093MEv0JEHa0qsCYQkkfxOANxNutvr2d8UDJr+6BiCwJ+ovTN3D+zJGUX
	u14V22oIvSkJjbtkolthNY7KTmWze3E8r/09OJ2VfAC5iHW1/bKQbx3xeAwP9BtuT1BNLhME97397
	4QnWj2BZHTjnWs81IzGQ+hNmCEWm3IAqjLPAjL19xrasj8hb+lIVJ6hjS6YtCaTblRz6UC2KDQ5bx
	w78Ar02BQwpmMN1hixdgXOdUqdtIuXt4bYrahnf+umvk0WZyYbiXA+39zM6tMwfI4xcvb+OgD1tCM
	RS6EVQlb814rpKIad+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3zr-00000006jmc-2rko;
	Thu, 06 Feb 2025 15:40:55 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg3zX-00000006jag-1Tbo;
	Thu, 06 Feb 2025 15:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738856435; x=1770392435;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FezyVjYZE8m9uhd5ZcpfOJRqXMGVrGh2veYjh3QLe64=;
  b=Hx3GwWz+PplQttKu79wHJoh4YzOPDdZdfuRrs3zGzgX2bkovVIV+rQ5S
   sBT9jVL5tN2ZlgrK0PaomSMZqyP8T6iomN4nWV4x2igapKte5aTXy1huh
   I/PAGnuM1jfcKyyLDT1nNKQ9OafyvDwCsIiM9lxbQnRTuPW7Bq6zY1Bn+
   Meaox4sLlKhgEfFW9CmpFAcKAc/9HKv60UwRYquT5U6nW2OvT8L8EY3Xi
   z+n/yScMEVcWHz6ipbZBbpWvOpbG0xR5ZebKwEg036Yn0bi3PKVjSfjx9
   yW0jUHzHyf/dWcSs11E8bs4kuif5w5aHSlcR2RRNbn8tY4e1ZtZysX6XV
   A==;
X-CSE-ConnectionGUID: OO4OSL63Rbuoa0E6MTZvcA==
X-CSE-MsgGUID: J6zNT5VwSUq1UT8Yj3oEmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27068078"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="27068078"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 07:40:33 -0800
X-CSE-ConnectionGUID: ACae1aZrQLeGkz96wlm2gw==
X-CSE-MsgGUID: JrbY9Z7+RSSD9psRSyAs3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="111771443"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2025 07:40:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 07:40:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 07:40:30 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 07:40:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzBTjieDyrgIBQmCD0seEwfCtt4AY4pyNFytrSP01wJ3y6T7U9QYoLRI5MTpWKPwaCbomh/MYAcRDxFLAi5055RhpmnMf9CSPaSqpX0IUtNiaf7/kWgz0CENpJ8xsQZR+mLAGOWzuPGcDU8NKpGoV3tEd8A78DMeadBC5Gv4Dyo74fDJY0++mQG6i3LQrWIGLcHYT+Oqk8QlIe3RpouyXembrEziJNqawZqZiIS3tUurEGslQ+nzd4INXPLdJYUiv7U8AvaQ3LgD8xzzeq2I2VNvFFro2PWvVJ0TlEbDenu04OVCJhZuFq7tZvotJqhT4rpWXlggpBMz/dI8p/rtrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKvFsTeewNxNzJvrw2sa3fNT8JGOeNE3CWB1C5VFBvE=;
 b=xQDELHugtb0ycYmkIyPiErAfZD7r9OIa9Y1ot4h3aUpV5wK2wHTl3PgV2ql9QeLUpENq1qepbcw2hKpsifvNaVtNGYa5ff053JMy26ikZ3roVYVXPRlbIgl8xBxHGDl/tEixWcfErhLr3w+vHbcL8kvAzXWLRtIyeJ0y7JHBZ4uXLHs8dz2Ag8mZPIUe3vt/hWn/fkXN/KsCxLpHmKX5tPxWn0G1R/yylvonJPK2MKzUIw0sXc3jt2F+q+f8lXO/bGErRT7XUOx9v8vLfYToTX+XR2YoDMijdCCSwEmT084+9FQQ3v/ejwPBlbC9l+224Uov5HCJGE8Ow19zdvv9dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6239.namprd11.prod.outlook.com (2603:10b6:8:a7::20) by
 DM4PR11MB7352.namprd11.prod.outlook.com (2603:10b6:8:103::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.12; Thu, 6 Feb 2025 15:40:10 +0000
Received: from DM4PR11MB6239.namprd11.prod.outlook.com
 ([fe80::244e:154d:1b0b:5eb5]) by DM4PR11MB6239.namprd11.prod.outlook.com
 ([fe80::244e:154d:1b0b:5eb5%4]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 15:40:10 +0000
Date: Thu, 6 Feb 2025 16:39:57 +0100
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
CC: <luto@kernel.org>, <xin@zytor.com>, <kirill.shutemov@linux.intel.com>,
	<palmer@dabbelt.com>, <tj@kernel.org>, <brgerst@gmail.com>,
	<ardb@kernel.org>, <dave.hansen@linux.intel.com>, <jgross@suse.com>,
	<will@kernel.org>, <akpm@linux-foundation.org>, <arnd@arndb.de>,
	<corbet@lwn.net>, <dvyukov@google.com>, <richard.weiyang@gmail.com>,
	<ytcoode@gmail.com>, <tglx@linutronix.de>, <hpa@zytor.com>,
	<seanjc@google.com>, <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<justinstitt@google.com>, <jason.andryuk@amd.com>, <glider@google.com>,
	<ubizjak@gmail.com>, <jannh@google.com>, <bhe@redhat.com>,
	<vincenzo.frascino@arm.com>, <rafael.j.wysocki@intel.com>,
	<ndesaulniers@google.com>, <mingo@redhat.com>, <catalin.marinas@arm.com>,
	<junichi.nomura@nec.com>, <nathan@kernel.org>, <ryabinin.a.a@gmail.com>,
	<dennis@kernel.org>, <bp@alien8.de>, <kevinloughlin@google.com>,
	<morbo@google.com>, <dan.j.williams@intel.com>,
	<julian.stecklina@cyberus-technology.de>, <peterz@infradead.org>,
	<cl@linux.com>, <kees@kernel.org>, <kasan-dev@googlegroups.com>,
	<x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <llvm@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 10/15] x86: KASAN raw shadow memory PTE init
Message-ID: <m5v4zoly67gqwzacoraqm7oyptwstj2ojira4qaz2bir7k6bxr@q5iuqozd6nnz>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <28ddfb1694b19278405b4934f37d398794409749.1738686764.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZfKQwNWbYEhk70ykT1+cnibCBnvZJrhAMvu_b0Y8xZTSg@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CA+fCnZfKQwNWbYEhk70ykT1+cnibCBnvZJrhAMvu_b0Y8xZTSg@mail.gmail.com>
X-ClientProxiedBy: DB9PR05CA0014.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::19) To DM4PR11MB6239.namprd11.prod.outlook.com
 (2603:10b6:8:a7::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6239:EE_|DM4PR11MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: 6692f986-8089-41ec-94a8-08dd46c489d4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nm83MVlXS1BML2pTR0ZiMk9FSEl0dDFXcHJHZjV3QW9ZYlNubThLVkowREpp?=
 =?utf-8?B?WlAyc3V2OXdieWQ0MmRBMy91a0RMV0NWKzZ3d3FwNXE2cElrMWJoaWJOWitK?=
 =?utf-8?B?bEdFWkFhM2lEVHdhTWxOZ3JIM2ZndjRGaEJGcnJISnJxVU9lU1NyNThJQ1FW?=
 =?utf-8?B?MFZVZkozcm90LzFTR3FxczhqN2tIVG5ORkRQQ2xZYTBEYlhJWXhGc01jR2g4?=
 =?utf-8?B?Q3hyZTJBZHFOWTVvR2ZmWU1sanBXOTRJaExRamRrR1h3c1F2R1VHQzZPTEFD?=
 =?utf-8?B?K1BoOHN4RHJOb0tOYThaK2g1VDl6d1V6U21WU3JxdTU4VDJHV041WXlwa3lS?=
 =?utf-8?B?ZW00Uy9RbzNaOWlmeHRYNEx2ejVzaFJzbmtFWUJ1WGxyMDFhUEFUakpWeFFk?=
 =?utf-8?B?QkNzRTJ4bkp2QzMxQm5xMFZ3V25xN3J6T1AyMWhjTjBOZXFEMmhGR2FHZ2c5?=
 =?utf-8?B?ZzgwQkdkcjM1RE1WMTU1MmV3REQvUHBoRnBiR2ZEenUxeXF5WDZxUU4yTmtO?=
 =?utf-8?B?Rzd6UE56dHovU2djSFN6MXZqM0RtMzhCcjZEYm9Ib3piRGltQ29xcmhCT3Y4?=
 =?utf-8?B?MzNGMGNQMjhvNVpXM2xIaHpQREhPdW9Nd1gzWmJ5K0IwRVUxbjJSVjRFalhO?=
 =?utf-8?B?ZTNyV0JtNWQ1TURTNktLbGlCQU9PVzN2eXU4YmNwbEJqZC9zdXBscHg5K092?=
 =?utf-8?B?Zy9ZaFVnWTR2S3pYc3JWOG9BZC8zTmVtazBtQ1JWMHdsc3RXQzZmWUNoelI4?=
 =?utf-8?B?SkFIN0FkL3dJWmxzb3orMm1Qb2lsaVBIQ3ZBSTV3emNlU2ZsTzNHbm1ibFIy?=
 =?utf-8?B?VTAxT2RNL1lJNEpJU0E2eVIyWkQxczVUZHNCaExSYTZPaW96NEU0Sm5RYU5k?=
 =?utf-8?B?T1NOUUhJc0VoUGpxaWFrZEMySVB0SmNESHN5eERyaDIwaWpmc1lmY1RWV3g0?=
 =?utf-8?B?ZGE0N2pHa2p3YWhoRUUrME9OalZqUWhsU0tKUjliTnRNcGl4OWZZc1V2cEhJ?=
 =?utf-8?B?Ym9oY1FwZkZGck9tWjZaYkxCbC9sc2pJWEZEbjlpdzd3bGRMcFVVTHQ2R1Ar?=
 =?utf-8?B?MVU1dnNQV0REb3hVRW4wb0dsMCtaTk1XZUM5dmVLc1BVUjRQU1hmbVFST055?=
 =?utf-8?B?UGhzN3EwZ1JkTDFzREdPVjVBcDNEVngvVGNyMEJDRGRtV1l0a25pcStoV1Ny?=
 =?utf-8?B?aS9CMUlUZWdocnR6Rmw2dXIvNzY2ajdBYmxSUEF3Y09GL3lzRUtyU3dzYitD?=
 =?utf-8?B?YnZhM21Yd0J3c25TWm94REw5QWlqcmZWdVFITU44MDN6VmZCQ0xCYlA4TExa?=
 =?utf-8?B?UXpVc1hMUGRia2hQQUlkcWZPMGY2TGluTGI3ZHk1ZTNNVFc1aW95TWJqWWxo?=
 =?utf-8?B?MUJHQXNWRDFPbXlDRExTN0poQVJnd1k0VHd6N1lGR29CTkZhdlFGeGNZbkUw?=
 =?utf-8?B?eXZRZ1oraUdqQjYxeWE1VGViYk93cGRJS2krQ01RWTJ0aFlMZVpMbC9ZdVV4?=
 =?utf-8?B?Q0RUeHplN013b21JZHdHZCticVJpVkw0d0Z0b3BITmlSOUFIamNicmRTQ3RD?=
 =?utf-8?B?b1dmU2Q4V3ZYdnVmeHowYVg1UldxdEI5WkdiQ1ZzSjVDZXZTYVVXYjVNUGZu?=
 =?utf-8?B?SHVwSmRZNHR3UGZHcEJmVjUxWWRzY2MwTVVjVmtFVmNpZkx0RWMxOE9pbURh?=
 =?utf-8?B?QWdnSGp5dXBlNzZWZWxvb1M1VGxGQ0FpdUlRRjYzMTlpd2x1WGpkSnVjbyts?=
 =?utf-8?B?akRGMWFIWFowMWRPR05Fa2ttWE4xUHkyRnAyQVBLSjh5d1BiK1ZOSzlhcEZI?=
 =?utf-8?B?WCsraTNENkQ1R1hkUndVZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6239.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFE3QitIcWswa0hBbjJkU3gySGxBTWl1NDJtVERHaEwxbXpWb2lXajNXVmJ6?=
 =?utf-8?B?c09nUzRQRDJYUCtZeGRWU3QxOTJ3dWpvakI3d1NmbDVHbk9henlja29VcXJ6?=
 =?utf-8?B?U1FvWWFteUhTUWI1ZjBSS1B0eEUzNlNXWnV2eUJwT3ZQZGF3dFpIRUw0cGxl?=
 =?utf-8?B?ZWZNcXpydXNRbVQvZzErblFZZFRBeloxNVlPcHlhVm1jdXFFUCtYOHh3NUFI?=
 =?utf-8?B?aFZUYnd1cWt0ZHBLZ3lUREllaVd4MTdrSHhjNXFhT013T2ZTTVdiRldpdi9U?=
 =?utf-8?B?TnB4RlY5LzhoM1dDbVdHcXZTWllsQVAyRjVITU1aWGFSUERJS3FibmZ2Y0Vj?=
 =?utf-8?B?TnZpaHNDUHhZdjZuNE9TaHRNTWxGYXh3dnk1Q2xMTEVpVEZGa0lERkk2RHRR?=
 =?utf-8?B?K0xsb3pkRE41VkxsSUhzaVFQa2wvVXhJMldlNW5tUHQwcHlHT1dsZHIwckZo?=
 =?utf-8?B?cWtrN1Z3NHBuRjRQem0rUlE5cWppM1doeWJ2MTU3MEphMVlXZU56RDc5NXVK?=
 =?utf-8?B?T2NOMHlqdCsvblFRMDJvNTUvOW5pUDJVQXZ6YkdQVTh0amlTQlE5RENTaWpl?=
 =?utf-8?B?MXk0Vk9aL1BOQmZYUjFDSkhnelpnbm9qWnp1ZERYR3dlT2ZTbGJFS2F3dGpX?=
 =?utf-8?B?RDYyU2JOdXBrUTJvYndCMjRDK3l3ak9Da3FhUlE5cW9BTmhnTEJlekNseWpz?=
 =?utf-8?B?ZHFjckZmNndtRG5wSzJzelVwS3l2VXVCcXpaeHk2YkR4WkNmT1NtbUVhM1Vq?=
 =?utf-8?B?UXBpWDd2WllKYi9YRGJsRVkyNXJlSVJ4TFAzTUZ0Sm56bTNOUTRNU0pqZXV1?=
 =?utf-8?B?NkpZcjJoazVzZ0Q0WDNqdUdpY2EzVnI5N09PV0ZjbERLL0R4dWI5U0lvamwv?=
 =?utf-8?B?bVplN21iWWVEeWtQS3NPVndkT2dhRG5idFd0NVpVcno0Tm0yQUUvU2tyaHNE?=
 =?utf-8?B?TmtvSlNTcWZyUzhiU0UxV0wvUGRoNi90S3lIN1RRWGRPNXVFZVQ2ZDU1SjZ6?=
 =?utf-8?B?dkV0ejUwZ0M5TUZ0b1dObnlpWGhZVDd4MFhVem0wNjF0QjFlUDJ2VDkyTkF4?=
 =?utf-8?B?UTZJTW1iK0YrR3dYdThQbmhYNThvcDR5S1FBbUNmL1AvM0dZZ0NYRzQ0OElN?=
 =?utf-8?B?YVF0K1lpZVRudzA2b1hRR1NJRmF5cTBZd2FBUWR2YllrL1dPc3Q2REd0NWtF?=
 =?utf-8?B?SkJMc1N5OW1qb0tvWGlwMHY1NXBWaUhjN1FIdktDTHRpZHpZNURYOUV0Nm5v?=
 =?utf-8?B?SjluWFk2MTJvbG1ySlFJMHdjVm9DOWwrZVIyM05ucFRCSC9LMC9mRFc2ekEz?=
 =?utf-8?B?YURHelA5L3hDWmdyTWphVG1ON0RxbmhUTGtHOGh2NUVNUGpDQ3hjTVlKenpw?=
 =?utf-8?B?MmZkS3VpZ0plZ09lUWQzK0k3MG5uN3RwY1FvUXR5SVRPRjJ1N2xINHhWTTVU?=
 =?utf-8?B?ZGtaNHE3dXBLQldmL2ZURkNLdDZhNGFLb0dDSVFTMzcxaEZCa203NnZGbE5T?=
 =?utf-8?B?K25UMUNMWVpYZlBROUlRL2NQbGxjTGw1NDJreE1GVGNFWDF0a1ZCNmp3aDNi?=
 =?utf-8?B?ZUFtUDN2MU1wSTFzMm5LSThvWWswNXhZajRLUC81SndnRERuV2YzcXFmeTI5?=
 =?utf-8?B?aWZUellPNHVpeEJyYVZEU2ZwRElWV2xmWG1rbERyOGJwWEZBUnhDZzJaMk5X?=
 =?utf-8?B?VDBHOUs1bUpZYXp1VEg5bmZob3VXcnFqcFJRcENRR044K1F3V2FvQksxcWE4?=
 =?utf-8?B?bkpXSHVFbGZIV0w4M3kyNW51KzBDd1BDNWRycTR3cGlOMjJNamNhK2tZUnNI?=
 =?utf-8?B?N2ZkMTNHelA3M0s4dlNYQWtORkZKeDRFbTV3eTY2U21zaGtvOWhpd3FBZGs1?=
 =?utf-8?B?TGluRjlQeTdqWlNha2NZakRZSUdBelV4V2l6TlRhS1NXajczcy9XODRtNUhG?=
 =?utf-8?B?SC80VzhXOUlSTXYzUVJtQ00vRHE1SVJFb0gzNFl0ZEV2cWJnOTl0b0Vzc0Fl?=
 =?utf-8?B?UnozYWJnQWUvRExRR2VaZzdBSGkybkpLeWdZUG5pZUJ1dS8ycThWWGQzSzJW?=
 =?utf-8?B?V0w4WjM4eDZvYUs5SnlFTUs1aUJwQ2xwN3RYZXR6Q21jTmV4WW5vZHJyWENM?=
 =?utf-8?B?eXVZdUV1MmtQdXROZUh4eDhTQXZKZTM1Ui96OXBHTWJGVkpVcmhteDNGUDZX?=
 =?utf-8?Q?bIPMvOOYA13hg0M60p8IWmk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6692f986-8089-41ec-94a8-08dd46c489d4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 15:40:09.8986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXEZsErCCoeRP3nMAmMiM0WRq3vk1drKMueS60Qu1j3sSmWV7Z/CLkMJWdMHUMcZ6mzomMum/bfC/R02JT8CUnFL+D3ycYUaqElZMvaLpNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7352
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_074035_451798_ADCCF602 
X-CRM114-Status: GOOD (  15.64  )
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

T24gMjAyNS0wMi0wNiBhdCAwMDo0NTo0OSArMDEwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToK
Pk9uIFR1ZSwgRmViIDQsIDIwMjUgYXQgNjozNuKAr1BNIE1hY2llaiBXaWVjem9yLVJldG1hbgo+
PG1hY2llai53aWVjem9yLXJldG1hbkBpbnRlbC5jb20+IHdyb3RlOgo+Pgo+PiBJbiBLQVNBTidz
IGdlbmVyaWMgbW9kZSB0aGUgZGVmYXVsdCB2YWx1ZSBpbiBzaGFkb3cgbWVtb3J5IGlzIHplcm8u
Cj4+IER1cmluZyBpbml0aWFsaXphdGlvbiBvZiBzaGFkb3cgbWVtb3J5IHBhZ2VzIHRoZXkgYXJl
IGFsbG9jYXRlZCBhbmQKPj4gemVyb2VkLgo+Pgo+PiBJbiBLQVNBTidzIHRhZy1iYXNlZCBtb2Rl
IHRoZSBkZWZhdWx0IHRhZyBmb3IgdGhlIGFybTY0IGFyY2hpdGVjdHVyZSBpcwo+PiAweEZFIHdo
aWNoIGNvcnJlc3BvbmRzIHRvIGFueSBtZW1vcnkgdGhhdCBzaG91bGQgbm90IGJlIGFjY2Vzc2Vk
LiBPbiB4ODYKPj4gKHdoZXJlIHRhZ3MgYXJlIDQtYml0IHdpZGUgaW5zdGVhZCBvZiA4LWJpdCB3
aWRlKSB0aGF0IHRhZyBpcyAweEUgc28KPj4gZHVyaW5nIHRoZSBpbml0aWFsaXphdGlvbnMgYWxs
IHRoZSBieXRlcyBpbiBzaGFkb3cgbWVtb3J5IHBhZ2VzIHNob3VsZAo+PiBiZSBmaWxsZWQgd2l0
aCAweEUgb3IgMHhFRSBpZiB0d28gdGFncyBzaG91bGQgYmUgcGFja2VkIGluIG9uZSBzaGFkb3cK
Pj4gYnl0ZS4KPj4KPj4gVXNlIG1lbWJsb2NrX2FsbG9jX3RyeV9uaWRfcmF3KCkgaW5zdGVhZCBv
ZiBtZW1ibG9ja19hbGxvY190cnlfbmlkKCkgdG8KPj4gYXZvaWQgemVyb2luZyBvdXQgdGhlIG1l
bW9yeSBzbyBpdCBjYW4gYmUgc2V0IHdpdGggdGhlIEtBU0FOIGludmFsaWQKPj4gdGFnLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBNYWNpZWogV2llY3pvci1SZXRtYW4gPG1hY2llai53aWVjem9yLXJl
dG1hbkBpbnRlbC5jb20+Cj4+IC0tLQo+PiAgYXJjaC94ODYvbW0va2FzYW5faW5pdF82NC5jIHwg
MTkgKysrKysrKysrKysrKysrKy0tLQo+PiAgaW5jbHVkZS9saW51eC9rYXNhbi5oICAgICAgIHwg
MjUgKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgbW0va2FzYW4va2FzYW4uaCAgICAgICAg
ICAgIHwgMTkgLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNl
cnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L21t
L2thc2FuX2luaXRfNjQuYyBiL2FyY2gveDg2L21tL2thc2FuX2luaXRfNjQuYwo+PiBpbmRleCA5
ZGRkZjE5YTU1NzEuLjU1ZDQ2OGQ4MzY4MiAxMDA2NDQKPj4gLS0tIGEvYXJjaC94ODYvbW0va2Fz
YW5faW5pdF82NC5jCj4+ICsrKyBiL2FyY2gveDg2L21tL2thc2FuX2luaXRfNjQuYwo+PiBAQCAt
MzUsNiArMzUsMTggQEAgc3RhdGljIF9faW5pdCB2b2lkICplYXJseV9hbGxvYyhzaXplX3Qgc2l6
ZSwgaW50IG5pZCwgYm9vbCBzaG91bGRfcGFuaWMpCj4+ICAgICAgICAgcmV0dXJuIHB0cjsKPj4g
IH0KPj4KPj4gK3N0YXRpYyBfX2luaXQgdm9pZCAqZWFybHlfcmF3X2FsbG9jKHNpemVfdCBzaXpl
LCBpbnQgbmlkLCBib29sIHNob3VsZF9wYW5pYykKPj4gK3sKPj4gKyAgICAgICB2b2lkICpwdHIg
PSBtZW1ibG9ja19hbGxvY190cnlfbmlkX3JhdyhzaXplLCBzaXplLAo+PiArICAgICAgICAgICAg
ICAgICAgICAgICBfX3BhKE1BWF9ETUFfQUREUkVTUyksIE1FTUJMT0NLX0FMTE9DX0FDQ0VTU0lC
TEUsIG5pZCk7Cj4+ICsKPj4gKyAgICAgICBpZiAoIXB0ciAmJiBzaG91bGRfcGFuaWMpCj4+ICsg
ICAgICAgICAgICAgICBwYW5pYygiJXBTOiBGYWlsZWQgdG8gYWxsb2NhdGUgcGFnZSwgbmlkPSVk
IGZyb209JWx4XG4iLAo+PiArICAgICAgICAgICAgICAgICAgICAgKHZvaWQgKilfUkVUX0lQXywg
bmlkLCBfX3BhKE1BWF9ETUFfQUREUkVTUykpOwo+PiArCj4+ICsgICAgICAgcmV0dXJuIHB0cjsK
Pj4gK30KPj4gKwo+PiAgc3RhdGljIHZvaWQgX19pbml0IGthc2FuX3BvcHVsYXRlX3BtZChwbWRf
dCAqcG1kLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBlbmQsIGludCBuaWQpCj4+ICB7Cj4+IEBAIC02NCw4
ICs3Niw5IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBrYXNhbl9wb3B1bGF0ZV9wbWQocG1kX3QgKnBt
ZCwgdW5zaWduZWQgbG9uZyBhZGRyLAo+PiAgICAgICAgICAgICAgICAgaWYgKCFwdGVfbm9uZSgq
cHRlKSkKPj4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4+Cj4+IC0gICAgICAg
ICAgICAgICBwID0gZWFybHlfYWxsb2MoUEFHRV9TSVpFLCBuaWQsIHRydWUpOwo+PiAtICAgICAg
ICAgICAgICAgZW50cnkgPSBwZm5fcHRlKFBGTl9ET1dOKF9fcGEocCkpLCBQQUdFX0tFUk5FTCk7
Cj4+ICsgICAgICAgICAgICAgICBwID0gZWFybHlfcmF3X2FsbG9jKFBBR0VfU0laRSwgbmlkLCB0
cnVlKTsKPj4gKyAgICAgICAgICAgICAgIG1lbXNldChwLCBQQUdFX1NJWkUsIGthc2FuX2RlbnNl
X3RhZyhLQVNBTl9TSEFET1dfSU5JVCkpOwo+PiArICAgICAgICAgICAgICAgZW50cnkgPSBwZm5f
cHRlKFBGTl9ET1dOKF9fcGFfbm9kZWJ1ZyhwKSksIFBBR0VfS0VSTkVMKTsKPj4gICAgICAgICAg
ICAgICAgIHNldF9wdGVfYXQoJmluaXRfbW0sIGFkZHIsIHB0ZSwgZW50cnkpOwo+PiAgICAgICAg
IH0gd2hpbGUgKHB0ZSsrLCBhZGRyICs9IFBBR0VfU0laRSwgYWRkciAhPSBlbmQpOwo+PiAgfQo+
PiBAQCAtNDM3LDcgKzQ1MCw3IEBAIHZvaWQgX19pbml0IGthc2FuX2luaXQodm9pZCkKPj4gICAg
ICAgICAgKiBpdCBtYXkgY29udGFpbiBzb21lIGdhcmJhZ2UuIE5vdyB3ZSBjYW4gY2xlYXIgYW5k
IHdyaXRlIHByb3RlY3QgaXQsCj4+ICAgICAgICAgICogc2luY2UgYWZ0ZXIgdGhlIFRMQiBmbHVz
aCBubyBvbmUgc2hvdWxkIHdyaXRlIHRvIGl0Lgo+PiAgICAgICAgICAqLwo+PiAtICAgICAgIG1l
bXNldChrYXNhbl9lYXJseV9zaGFkb3dfcGFnZSwgMCwgUEFHRV9TSVpFKTsKPj4gKyAgICAgICBr
YXNhbl9wb2lzb24oa2FzYW5fZWFybHlfc2hhZG93X3BhZ2UsIFBBR0VfU0laRSwgS0FTQU5fU0hB
RE9XX0lOSVQsIGZhbHNlKTsKPj4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgUFRSU19QRVJfUFRF
OyBpKyspIHsKPj4gICAgICAgICAgICAgICAgIHB0ZV90IHB0ZTsKPj4gICAgICAgICAgICAgICAg
IHBncHJvdF90IHByb3Q7Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2thc2FuLmggYi9p
bmNsdWRlL2xpbnV4L2thc2FuLmgKPj4gaW5kZXggODMxNDYzNjcxNzBhLi5hZjgyNzJjNzQ0MDkg
MTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvbGludXgva2FzYW4uaAo+PiArKysgYi9pbmNsdWRlL2xp
bnV4L2thc2FuLmgKPj4gQEAgLTE1MSw2ICsxNTEsMzEgQEAgc3RhdGljIF9fYWx3YXlzX2lubGlu
ZSB2b2lkIGthc2FuX3VucG9pc29uX3JhbmdlKGNvbnN0IHZvaWQgKmFkZHIsIHNpemVfdCBzaXpl
KQo+PiAgICAgICAgICAgICAgICAgX19rYXNhbl91bnBvaXNvbl9yYW5nZShhZGRyLCBzaXplKTsK
Pj4gIH0KPj4KPj4gKyNpZmRlZiBDT05GSUdfS0FTQU5fSFdfVEFHUwo+PiArCj4+ICtzdGF0aWMg
aW5saW5lIHZvaWQga2FzYW5fcG9pc29uKGNvbnN0IHZvaWQgKmFkZHIsIHNpemVfdCBzaXplLCB1
OCB2YWx1ZSwgYm9vbCBpbml0KQo+PiArewo+PiArICAgICAgIGlmIChXQVJOX09OKCh1bnNpZ25l
ZCBsb25nKWFkZHIgJiBLQVNBTl9HUkFOVUxFX01BU0spKQo+PiArICAgICAgICAgICAgICAgcmV0
dXJuOwo+PiArICAgICAgIGlmIChXQVJOX09OKHNpemUgJiBLQVNBTl9HUkFOVUxFX01BU0spKQo+
PiArICAgICAgICAgICAgICAgcmV0dXJuOwo+PiArCj4+ICsgICAgICAgaHdfc2V0X21lbV90YWdf
cmFuZ2Uoa2FzYW5fcmVzZXRfdGFnKGFkZHIpLCBzaXplLCB2YWx1ZSwgaW5pdCk7Cj4+ICt9Cj4+
ICsKPj4gKyNlbHNlIC8qIENPTkZJR19LQVNBTl9IV19UQUdTICovCj4+ICsKPj4gKy8qKgo+PiAr
ICoga2FzYW5fcG9pc29uIC0gbWFyayB0aGUgbWVtb3J5IHJhbmdlIGFzIGluYWNjZXNzaWJsZQo+
PiArICogQGFkZHIgLSByYW5nZSBzdGFydCBhZGRyZXNzLCBtdXN0IGJlIGFsaWduZWQgdG8gS0FT
QU5fR1JBTlVMRV9TSVpFCj4+ICsgKiBAc2l6ZSAtIHJhbmdlIHNpemUsIG11c3QgYmUgYWxpZ25l
ZCB0byBLQVNBTl9HUkFOVUxFX1NJWkUKPj4gKyAqIEB2YWx1ZSAtIHZhbHVlIHRoYXQncyB3cml0
dGVuIHRvIG1ldGFkYXRhIGZvciB0aGUgcmFuZ2UKPj4gKyAqIEBpbml0IC0gd2hldGhlciB0byBp
bml0aWFsaXplIHRoZSBtZW1vcnkgcmFuZ2UgKG9ubHkgZm9yIGhhcmR3YXJlIHRhZy1iYXNlZCkK
Pj4gKyAqLwo+PiArdm9pZCBrYXNhbl9wb2lzb24oY29uc3Qgdm9pZCAqYWRkciwgc2l6ZV90IHNp
emUsIHU4IHZhbHVlLCBib29sIGluaXQpOwo+PiArCj4+ICsjZW5kaWYgLyogQ09ORklHX0tBU0FO
X0hXX1RBR1MgKi8KPgo+UGxlYXNlIGtlZXAga2FzYW5fcG9pc29uKCkgYW5kIGthc2FuX3VucG9p
c29uKCkgaW4gbW0va2FzYW4va2FzYW4uaDoKPnRoZXNlIGFyZSBpbnRlbmRlZCBhcyBpbnRlcm5h
bC1vbmx5IGZ1bmN0aW9ucyAocGVyaGFwcywgd2Ugc2hvdWxkIGFkZAo+dGhpcyBpbnRvIHRoZSBj
b21tZW50KS4gSW5zdGVhZCwgYWRkIGEgcHVycG9zZS1zcGVjaWZpYyB3cmFwcGVyCj5zaW1pbGFy
IHRvIHRoZSBvbmVzIGluIGluY2x1ZGUvbGludXgva2FzYW4uaC4KPgoKT2theSwgZ290IGl0LCBJ
J2xsIHBhc3MgaXQgdGhyb3VnaCBhIHdyYXBwZXIuCgo+Cj5fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj5saW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj5odHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgotLSAKS2luZCByZWdhcmRzCk1hY2llaiBXaWVj
esOzci1SZXRtYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
