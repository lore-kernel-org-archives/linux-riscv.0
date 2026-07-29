Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BF8C53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 13:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6cZN7JR4sHoa5IvluIPmmQbeq3Q2HRcO+VQexnlIphM=; b=QCFMLfeCYnaJMH
	puqWnI6uo/ZTLwDCxGU3Ij0cOYL4MUo/s2aWcJA0QhIB1Zr36dD12zYtUEML2Wh0irY5ipoHUvhtS
	wg9Lyd+6NM0RSNECdKphs2pkM6CJBlEqWmQxv0mbwLVhWtajHrlA8Jp46nZAyEzPhN6WHn2zBbpjj
	YzK7kMlFEPvgQN2zxj5LqjMbtGs7oVaahrFGwdREcwEbAYpUnlWtlv+0ndkpq97kLrhIYL3Tr3x9b
	m5+3d0pby6netptikjWy+NdPiSaeteHRws10UGWFkqYaHtk1uql/zSq94WOUhG2rCrSDU0+YkuhFZ
	aUwjKI9klQuSA22GzW8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4NW-0000000870R-1FTT;
	Wed, 29 Jul 2026 13:31:22 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4NR-000000086yk-1x2U
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 13:31:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785331877; x=1816867877;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CiAOjjzEW3QNAnRhpWU7cueWKRL575Hdcz0KFRNg7Rs=;
  b=CgzDKTkaO+fhBDqvcIRvcsyt9d6T3vKm03pMS1mcwNPDY+9PCybR+1qQ
   654pldOGav4KIclKxzyl+DFqyyTaE99FZu7PrG4pDy/2kfRv9PyBc2B1s
   VhPrpmXHICVVOfNNIbZiF9+hSsOpCDoZJ5nJC8/ruyz16nbktVkWoupx+
   o+inWwtzNFDvjhTZ1Y3XUZh9TQfVEQWetrAQRjiktThuEaU0taNpGUTmj
   2zZpxk52tVw1R6SGVsyVFmPU41ybc0rLqW+kSZUE64muXW+ofBu2je5BG
   4pRvk5CnrNLx0Lm2cfExhFDPihaDjGX8uLmG6Jhg8a+Vp+NV0tIJYuX/v
   w==;
X-CSE-ConnectionGUID: 8FHSs80BTeWXIOmPgaac+A==
X-CSE-MsgGUID: /8MO9+uvSMyM8sUFkCxuHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96295437"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="96295437"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 06:31:17 -0700
X-CSE-ConnectionGUID: 4asb4HI/RqWwiME2Vmiwsg==
X-CSE-MsgGUID: 13ScnopsTcqyctosVVuUUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="260636516"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 06:31:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 06:31:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 06:31:16 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 06:31:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qr18QT+KiDCL9TPzGGB19t2mb6a9WHihpnsplDkbL+OYti1eRXElwE0MU20d+UJmVN6LbNoen6PzIBuAWAU2BUZX0/ReRn5M0LRm72KxqyeNJsgG2n6hFjCltqzf5Gwn3SMWivIOvNFQwYAubPykOX/QNyCQ/cbFil+EIfTZa8PgWkAm8L7ZnOuN8f0JPpj/K+q1dIHZP4ercCZhRB90PU/IgaOKIj+pNSBCa84ZdF7h1gdrVMa9SStd+UTEq54UB4KJ/NLAb+H564I2U18zaz//b4+Rywoy3gvZolpu15JZiYyAmmU3CyeH5udNE8OXMvKEhJbq3vKEUK4oE+5etA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiAOjjzEW3QNAnRhpWU7cueWKRL575Hdcz0KFRNg7Rs=;
 b=TI4uHkDXvCXYY0bvMXjeuDwdWfsmduYGnnXiL0mWVRFIB7wA9MWUXLMe7HdfgmyCkZmkCBk89R/TvSWrCG6HFNQ0GFGyxC4reCAa5/BoCVlZX6/eRXzri2NlfMx5RwThEbTwtQc4PonVLElN/mI6Os4CElrHN9M8RIr1wXqSe8MsUcWe4M8D0bV4FupfdLJTp2hWKpkkhIYj7lmRNDEVaDR+grgr7YN4xd/1vAdS79U02Hn1FabEbnM2JfJzrR75bnrJYZV25++aCUUVxmOQXT95qfyHiq50NFluQyOl8xcOaSx7PfDrShrUIw7N7U3NIeJGmtx495UclCAj8HJsRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by PH7PR11MB6700.namprd11.prod.outlook.com (2603:10b6:510:1ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 13:31:11 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 13:31:11 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "pjw@kernel.org"
	<pjw@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "mingo@redhat.com" <mingo@redhat.com>,
	"alex@ghiti.fr" <alex@ghiti.fr>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"bill.roberts@arm.com" <bill.roberts@arm.com>, "shuah@kernel.org"
	<shuah@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 2/2] selftests/x86: add generic prctl shadow stack test
Thread-Topic: [PATCH 2/2] selftests/x86: add generic prctl shadow stack test
Thread-Index: AQHdH1qL4SpKscaul06RV7mPV6BHNraEfz6A
Date: Wed, 29 Jul 2026 13:31:11 +0000
Message-ID: <5c04899f405619f0bdde1f98e432e382f76a686b.camel@intel.com>
References: <20260714154740.140431-1-bill.roberts@arm.com>
	 <20260714154740.140431-3-bill.roberts@arm.com>
In-Reply-To: <20260714154740.140431-3-bill.roberts@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|PH7PR11MB6700:EE_
x-ms-office365-filtering-correlation-id: 86906534-8e72-4af2-a3e9-08deed75a793
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|38070700021|921020|6133799003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: OibqUIk6ndX0yG3usMxJjvqDi43N1jz/wXJrRHg804EXI0wfwowcT/7AUagQTqIgemmM60i0CJrdzNBXiyOueTPxdGNWXeybiHedKQx42iTfqT6UpCuPg49+wGqArbSjK4oTzH6dWwOJzrRKCo6ntEsLXMhZMztxiR+Vwn05DQrMi3X38KljBveS50GRLI3MZ+tzh9swi4aYJfKFnQXueZFDPmch63Iwvrn7pTPV7kZAo4VsCGUHY/J3GvwsA08E4JAhgP05XUICpIQbFhEgCU+6z4f1EvhfhDiXfRfDIKh+wVe00HQ8YVcMcuTtMutlcc5ccpwz6p8JHpD5viyPbpNUZzfBAuiGfJBlpvCvZV7Pb43KfCQiXb9XGmLR8rQKb0vTC0zzMkAY1EsF9/yET2ksVHbgVOwJA5d9hkbxOe6rHRIDlTzjwGrLEKJGGi18gw26qAxi9cQLVLTYfli/vkn2eh8U4oCwLZFFkOPe0n8cVKe/q3qJ+ToQx/njIOyeK1NCxsbv8Q4coGySxEchhVD+rQpnK31IfxZpymCW7X9slKHCdbKIsPI4p5fIVQECm6r6351uDoHxXVKfS1GPvI4Nn4DvFjt/h9evm1cytZU/0lXA4GMU+7BC515RyiA5h6cR0vSHPvVRiXEIBhYI8OXFpkKfvfneWtcqdeROA4v/Zwv5wmABuw2ezyYvsFQi+F6G+2L//E/a///F6WO77vNRwtPyisevWuro6Mukf11B1n+WOL99e6LNucD+AilU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(38070700021)(921020)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2hjOWxoaDI2Z3VGcjluVFlPemlRSHdFMFlHUUJkWHpuMTQ5TElmR0srR29T?=
 =?utf-8?B?MXFOSDhxOWd4cUV0RWxtV21NWXNUUkUwNG5DdkZOVzVYem0zRHlvSDZpQ21k?=
 =?utf-8?B?NGhQczcrUm9QRTVPSzJKTVlTR1Rpc2VEVkxFQUhCSE52RUtCMWppN0tBb3h3?=
 =?utf-8?B?dWZuRS9xbVFPWk5FZzJ6bDd3N3RLR0xtUVJoeVZ4Qml4ZG9ocnoyY0J4YVNZ?=
 =?utf-8?B?cmxvc2RDcGppb3ZiT0Q1NXF2THFTTThoZ0M2NUxaNC9QWlI0UXZoWlBsdnNJ?=
 =?utf-8?B?d0N4Tk1DWDZPMzl6YldObVNxUWdjNGg3TGNDMlRXU1ZCc3RWcy9iWmxreldu?=
 =?utf-8?B?WHB0dXU1N0I1MUlKb0sySnU0NUFKQlNQVFlzQy9McVRwS1FJUXQzeG54ajRn?=
 =?utf-8?B?MjBXOTJhVXFSM2g2YW5ja3c2NEErRldkOW1YUWV0bTdhKzJUK1d3blhpSUlO?=
 =?utf-8?B?T0h1L0hTNVRNbXlHazJoNVdxYlJ2RXhyN2J5eGxKWFVvYk9rOEsrWlNSaTBl?=
 =?utf-8?B?YUIraHI4eXJscStKa044NlJ3TGpFQm1NTTdTdmg0YW9mN3ZmV1NUWnRkTk1X?=
 =?utf-8?B?ZmI5VDVXaThkYTc1b2dST3p4N3JTNXFjNWo5aU9TOUdJeWNIdWdlQ1laWEk2?=
 =?utf-8?B?VXZPbWlvaGVFQ3RPbVZvUjZIb2JOSW9qaVIvMGRSVVliQmVrWGdQVm9UU1c3?=
 =?utf-8?B?OTc4WkpFd0NCUWFld0wycFlLS1lNUFY4d2pWdWsxcmJvTXVuSEEvU1FKdUZw?=
 =?utf-8?B?WWRYMitlTXU2TjFMVlYzYWMrY1QzODlGNFFpT0hBTWtLNVFGTjhGMlV4ZUVp?=
 =?utf-8?B?V1lpQ25BbVc1MGJnQkIxUzNIN01PdUZLMmtURTRLVEJ6SWNJODFMWG9CaGZw?=
 =?utf-8?B?dk1YUGt1SGJiUXdiVWpvK3VkY2hmcHJ1MG9aaG9zT283eFN0TzRra2dtSm4x?=
 =?utf-8?B?RGtvdXVldnlhT3kraHo1a3ZOOURGTjluS1RQZWNETDNueGhPR29sU1JyZmdY?=
 =?utf-8?B?SW5XSnhsMnpWWFg4MFYvejgxN3A5SkIzMVZERFdJZklnSm5HNk5OaCtSNDBG?=
 =?utf-8?B?ZURjYitRU3NoOC9hUmZ2T1RmbnIrTFF1VmJGZC8yZkcwbUNZR2dqR1dINmtN?=
 =?utf-8?B?NjJVOVBqYk5TbHpkRUFpZEFlcVpFaTU5cW11dkEyZkJ6MDlRelg5Q2llbVlX?=
 =?utf-8?B?KzdaODNFTElncll3bEJUOVBHTS9VZHBiZGt0UGhuU3VjMFVIR0VoWFJvandY?=
 =?utf-8?B?RnltVVVJd2svVnE1NXFEdHg0VlJrQ3Jiek5hcHpheWJ2ZVZtRERvb0dxN1hP?=
 =?utf-8?B?WkUyMWZ3eEhZTk0rb29WRVFJKzMzYzVMdjM5cnljYmVNcnBxSVA0LzZ2aTJx?=
 =?utf-8?B?YnFOOWdhS2RMamtWZDZtQnpNaklSVWthSDh3RDZmVGJHSmZ6akZYUGtMaytY?=
 =?utf-8?B?NXVudjRVQ08wMWpzWER1SGJUaEUraDhlQ2NpMHJtRWU4R2FKQlY3YkpkWkJ2?=
 =?utf-8?B?T096ZnorOHptamIyN3d3OUVRTkxUTUx1MjBCTU5rL1lVYXdudldyYU5OYi9K?=
 =?utf-8?B?RG5iekF2NFREWmRrN0xKQ3NRKys4OXU2eHpKa3FmSDlCYXY2QlZaZEN0UnNO?=
 =?utf-8?B?OWtlRjExRFplY2w1STRORGp5M1RHZC9rK0p3bnZodDI1SU1wWlcwUU91VzFO?=
 =?utf-8?B?RkkyaitNMlBJUWZGcEJKUW53bVVOZTFQSlVlOWJlZDZUblNiYjdLV1NHM0to?=
 =?utf-8?B?K242MEw4YXJnOEZSUStIMVhELzE0ZHlQSUczNWNNTVNJNEpaWmdoY3ZnbHhh?=
 =?utf-8?B?NEErQWhxdnNVNkN6Q284RTlmR2hCdnNTdXlZY25NN2Uyay9pQ1pIaTVrT3dJ?=
 =?utf-8?B?VjhaaFo3SU9uQVE1NVhkTDJuQ25wOXdmQ296cDZWaHlEVFFBMUN0UE16Q1B3?=
 =?utf-8?B?TERyZFMyejRUb1MrcU9Pc3FQT2UrTE5wdlZQMWRSajI2aVlYN1BtVTJDWU5q?=
 =?utf-8?B?bUMzOTNVUXFLL1Y5blVZdFVNSk9mWHFCdWdxSlFmWldTWlRpWmFUR2lBMWZM?=
 =?utf-8?B?N1dFQzBWTTVETW53ZjRweXNMeUxmRzlsUHBWV0lJeG5xYmMwTVBudW82cWpH?=
 =?utf-8?B?MHRvbjkwcW5xQnk2cG92ZmxuR1VxZ050Ky9nS3ROTFZWOGx6RDJHbU1xeUpQ?=
 =?utf-8?B?WlBpL1FmQzVRN3o3aGdza2ZsMTd4Y291eDFITFJzYVNTVUs1OSt4UVNZci9l?=
 =?utf-8?B?dzVwbXBIQTR6K2ltUk00VFVtZ01BQzlFSFluc2xnOTdzSVBGV3NoMmtWNjM5?=
 =?utf-8?B?MUxRTlFRNTkvSnJsZTdFRHhBTC9wQktMV2hPOWtDdjd5YUxIV1JlU0luTUFv?=
 =?utf-8?Q?fZOnSKBgUQlzucJQ=3D?=
Content-ID: <06843F9B19CDBA47AF16DD825A44856D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lrjHcs7jSZPfbUcVHcaFZ6pd+SMKOIh0qT8HG0Qk9TubLw5lTWDxY7qsMYEfc3UL/y0W20+yY+Gw8FfTyTFIQZy934GF+OCWDtivD3YFsVZkU1/ileb/oYNktLIsvjiGP4dCtrOW1qawRXQNjq/JrhMvDmQTqAQXgag4/bX/Ywzv2D6dr5rhhxwoBodY3NaO5C5nmXRrOAYYyIW0SJZBJAuIFwJz2u5JusWeFfgt3W3P70X1+ty5cWvNiRIjF6qNRsQ5bgWRhyEFY603hEGRaGJrHKo6w7N+ht+SxX8kn1Bf888KvRAMGe4ridDGt6GT0dr1zoQ3br3Un/ZtuQZjHw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86906534-8e72-4af2-a3e9-08deed75a793
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2026 13:31:11.1572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M3pUt243fUgpK/VGrU4NXOjqv6fQf57LkYIWLxb7qqAocfjK/j3+7/XjIB9bQ3JpFnKJVXJ3FQaoJocz/mlgIlItsyP643FUEARJgHb/tOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6700
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_063117_539352_A6AB8BDB 
X-CRM114-Status: GOOD (  11.27  )
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

On Tue, 2026-07-14 at 10:47 -0500, Bill Roberts wrote:
> diff --git a/tools/testing/selftests/x86/test_shadow_stack_prctl.c
> b/tools/testing/selftests/x86/test_shadow_stack_prctl.c
> new file mode 100644
> index 000000000000..9c9e2728a9f9
> --- /dev/null
> +++ b/tools/testing/selftests/x86/test_shadow_stack_prctl.c
> @@ -0,0 +1,3 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#define BUILD_PRCTL 1
> +#include "test_shadow_stack.c"
> --

Hmm, do we really need a full re-test for the different prctl routing?
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
