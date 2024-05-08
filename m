Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00D0C04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 11:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GAiKgFktn9TFKrl0UlQM11KNO4rb7p0rpZWt+appgwI=; b=IdI02xQDKu1Cr7
	5wE57/5iu+W8gXDlgmPGLsam3fzAcZALnoF5feQFQRPrr4RWzNPWha2gQC1ZD3YyYK1as4CYT5RY2
	m3ZrU0uYiVHYeKQyks2wxkqrtvm4qswUM1HK9zfH6xrtrXoUbQO8cof52Ki07aikkqzaPZIZ2B1/1
	ep/r+CJyzigkUP2jQhKsbfYewijbLoi1Pw3r0a/YF/t0K849MhtZmj6tpe8Um9CvzjLUIio6QDrlx
	RlpA+sraaZoZYg7jCENKw20YF8RFBUGmXIVR3c4ZcFRGbH39ttu8WkDJGrVYU9GfA/ONVedIacLU6
	w2AWDNzigbU9PKPO8VNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fLg-0000000FBN5-2Vsb;
	Wed, 08 May 2024 11:20:36 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fLd-0000000FBL7-43wo
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 11:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715167234; x=1746703234;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/Jey5IN0YpzIOjRJrSBUQvLqyR/Y/yGBVTCbRVLIC68=;
  b=BQsMwcMKBEA1r1FvrTkw9ojfelCqYZioLUnBZC5ssZsX55nu7VoT7uca
   jB/Xtf0PMcbesuCYvYcfQlAd0vP6ypVKFTQRucdvFrNVoSlR9wZetvcNb
   XKzQ9kIEsG/qNWzje/juCHarCc3tm3Msfco2AKAjTxf0vu/YmBqVaC0RX
   PjKn0can9+mB9CI2TYN0HNwv5sTM3v4Q/agYBkClCUZMeWhNkJSZiSQHG
   uRiDfXTIhBweV6SNfXCMbwzMdySO2cagSeOYWfj7s+XT54kRoa5q6QIwz
   n/VH7Idr0aQnOi171a963tV8YTdfZuGRQgkZ3P6nbVmGqX29Ul5grsgpt
   g==;
X-CSE-ConnectionGUID: dz719x7bQVaz7q2oxKVfPg==
X-CSE-MsgGUID: 46RPgNf/TaeL5djLbl7xeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="14824675"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="14824675"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 04:20:32 -0700
X-CSE-ConnectionGUID: OFrR6qGoRTSVoZcl5DLJFQ==
X-CSE-MsgGUID: MLLgzuw4Qb+zWy50706Zvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="28908973"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 May 2024 04:20:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 04:20:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 04:20:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 04:20:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 04:20:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjv1MWUkjkLbRyUsJ5SMIubLwaW147jieF14O+DDVQy9fy6jdveLJoWoER4KXQQClFCGjAS+MoF1/DS23yJtjH0eBbis2AuABP9JJZlGrHfhDFNc3vLm7oMQS45lDzfJfo3vUaigPRUbOv9ZIl1saY8RQEaucwPsg0oEZbvvm5XKglmLdgdBvgHsNzuY4k0j1NokEN/jNcfMw+OX+nGfQcChTTYFfNxBE+nVtVEdos5g5MIthVhi8u2dG5XPsVVWJfGraZC2TEQyfbBzjQW99NMFWRzjfesuVZnYAfzgs+yZlFIoNYY0qLZxcUiEJ6Wybf3ZkRLmuxyQf4T/Mxcchw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Jey5IN0YpzIOjRJrSBUQvLqyR/Y/yGBVTCbRVLIC68=;
 b=K7otJVknumkDBonBNK35vP5tpmvZKRMy3enqMgYq1+gBIPabfjXzGUO6Q5bGshmO+ERo9zLDbxGhUzxiWQPrNL9GXWxFKyxW7+PsNXISTTtWcdsloN12vMtNXlg9Ca7trLFwRRC2yicGZCUS4IDqdStjllns3fA7C7oW+Ks4GBlU8xMshQ7KbHnVxigyfqAeLqyvEcqofniJBfWzD7egiiQH6U4c6s+068GUjV+ybiWmVeHoQ/fXAEkDw8UdIc6ANLKuu7LhI7d67oaCTQqicEKLYy0te5GnSkD0Q7YTfuaonMfud1IpdLk5X/T80Jai6G+VCFGztxELF1JD/1SLLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA2PR11MB5084.namprd11.prod.outlook.com (2603:10b6:806:116::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 11:20:23 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::abaf:6ba7:2d70:7840%2]) with mapi id 15.20.7544.045; Wed, 8 May 2024
 11:20:23 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: Pu Lehui <pulehui@huawei.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "luke.r.nels@gmail.com"
	<luke.r.nels@gmail.com>, "xi.wang@gmail.com" <xi.wang@gmail.com>,
	"bjorn@kernel.org" <bjorn@kernel.org>
CC: "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net"
	<daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>,
	"martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com"
	<eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>,
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org"
	<kpsingh@kernel.org>, "sdf@google.com" <sdf@google.com>, "haoluo@google.com"
	<haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, "Li, Haicheng"
	<haicheng.li@intel.com>
Subject: RE: [PATCH] riscv, bpf: Optimize zextw insn with Zba extension
Thread-Topic: [PATCH] riscv, bpf: Optimize zextw insn with Zba extension
Thread-Index: AQHaoGtgQt2dALTuk0aEsDxXE25q4rGLuImAgAF5qZA=
Date: Wed, 8 May 2024 11:20:22 +0000
Message-ID: <DM8PR11MB5751A0943E23FE46AC4B7D89B8E52@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20240507104528.435980-1-xiao.w.wang@intel.com>
 <6836eb5c-f135-4e58-987b-987ab446b27c@huawei.com>
In-Reply-To: <6836eb5c-f135-4e58-987b-987ab446b27c@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA2PR11MB5084:EE_
x-ms-office365-filtering-correlation-id: a16a01b1-0183-4430-53a2-08dc6f50da43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|7416005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?a1loWkhWM2VNZVdNS1UzNjRYSVovTTlaejdwelZJbnVFWk9hK2NOSU1ia05T?=
 =?utf-8?B?RnJDYzF2d09sV29SREhHWC82dTFuTXB4WDlLOFBkUTFGcGtMM1llemVSaG44?=
 =?utf-8?B?ZnRobDdTa05qRERmUjNLVWR2THVDajh1V3FuRHJ6T09mTFdmbWw3V0xsa3RR?=
 =?utf-8?B?Tnd5MTk3Qm90M1MvTkw4dDVTdWFkblcvS0xka2loVjcwdG5Bc1M0ZktGS0ho?=
 =?utf-8?B?bXArU2YxRDQ5TXZqTjlWcEFFYUdzTlh0ZWVTSmZSMGlmeGV4TEJ3OE1yYmJ5?=
 =?utf-8?B?MklQN1FCcytGWVE1ZVlDc0xBTnZOcHMwTDYrWkkrU3RIaVdhZXN3bmdWSzJs?=
 =?utf-8?B?QitMVFJNblY5U3BFd1FZdStYN0JDTmUva3BLcUh4S0hEcTBvNUlybHpmVVQ1?=
 =?utf-8?B?ME5FZTFOWC8yMHlWcVRaNSs4OEpGUUU4aGZiaVpyaC96ZjRZc09ZVUw4eUNF?=
 =?utf-8?B?bno0WjRjR29WSVgxdjk4RGN0VTY2cUlLVWFKaG1uYkpNOG9DUm5XT1ZkMlU3?=
 =?utf-8?B?MHUxOUw4YmEzVFoya0hqSXBUTmtZSU5XRVpxS1I5TG03QUFGeVd3dFdMbHU3?=
 =?utf-8?B?d05EMnRpd2xueVZuV1FQUG1tUHl4TVZ3RExvNE5YblJHQmJEV2RjMlg4NSth?=
 =?utf-8?B?azRQL3RWMWF1YTRuSXdQNFRBUTBwU3o0VFlvYVFROXFLdW5RbnpzVDJPdWhL?=
 =?utf-8?B?eTJtc3dsRlRQaE9NQTNyVlQ5cUJFdGdQalNZc24zeHFVRXREWWpRNjNPdS8r?=
 =?utf-8?B?c0JQYzlVYnBybFhtODUxUHJ1WUt4YVIwbjRrT05tOHp3SS9XcitpcWRPYmVM?=
 =?utf-8?B?UlhrMVNlUFZHNFhQdUREckdoZ1JrR0xnbjgwQldUY2ZRejM2bXdsclhvMHc1?=
 =?utf-8?B?MytvYUtNK2crV2czbGtHM2sxRzlFTWFtM3BNRFVtWXBTaElpdldSQURneGdv?=
 =?utf-8?B?RjVpVVZOSC9EL081cnVoZzlMNTExMFBrWlBScWJRSmIwaXRBaG9XRUdBdXp4?=
 =?utf-8?B?d2dMblhXY2hVQitVcFBxV1B0YVAveFdudmw1NEZaWGx3dHU4NTRVOTlwVm52?=
 =?utf-8?B?b3FYTU10S3ZKWmMvL1hwdnB5c0lDQ0lwTk42Um55ZU1TUEwxMWcyRjRsY0RI?=
 =?utf-8?B?Yy9iMzViR2FvVTNiR3N0VXlhUVlZUzJGUTQyNE02L3h6d0lKVUZsNjFBVWJT?=
 =?utf-8?B?M1pYMjRvVkhKRnZBUGJ4UTcrUkVCRnlzMjBIeFdjUGpwbkNRMS9qRkVNekFw?=
 =?utf-8?B?UFlUbW1Cdk9PQVB5SXdjUjFFNmMvbTI2UWVlZmlNQ25seHZtTm0wQ2RqSEI5?=
 =?utf-8?B?dk54QUl4ZTE0bVMyOXFJY3F1VFhCeWxrSDNXeGlrZGx5N3pvVkt6QnF6c2hm?=
 =?utf-8?B?elpkM2lrMGd2VDlPazBySFU4NU8wbHRUWGs5NzNSUyttUnV0TXZUVURsek1E?=
 =?utf-8?B?aXBjRTk3eHpCMVR4b1c4Y0lYaWFKUVhkNjdwRjJzNUNIWUpNK2FqNGV1V0gr?=
 =?utf-8?B?Y1pMdG1wMFV1bWh0eEkzd1gzY1dia0x0SzhGSDI0ZEliSU5kRk1reUdvcFBQ?=
 =?utf-8?B?ZVB6djk2MGd4TUZudG0vVG9qaG1SVCt5a2Z2SjdPdndxdk16WVA3NHBNTjR3?=
 =?utf-8?B?SVduRmp2dlF0QWpKa1h0T0pLOE4veEJOZWF5RGl0RXM5SFVyaFN2L3cvRVFQ?=
 =?utf-8?B?eDRGYnVTR0IrOWM4dFJDam90OTY0UDR5REFMREZYeTZtNlVBVml4b3JwYndS?=
 =?utf-8?B?WnEzZ1RROUpBRkdDVGVESWlZWWxlUnU2UVJ0QUJ0LzFSd3UxNk1JajFZZzhY?=
 =?utf-8?B?QkcxMW40NmFHc3VJaUtkQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(7416005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NU95cldQa1pndGZIRkpGbGZRdWN5c1ZKUTIvY3FTZHQ4dkNBQ2d4NUMyekxx?=
 =?utf-8?B?Mk9zK0l4SXNxTWswa1k3Qm9rWHZZdmFFajZEcVc1cGZYSkFacUkwOFh6QWNp?=
 =?utf-8?B?Z0hwVFBuZ0VZUllTbzVvMjRRUFJWQ0FLbFVUQlFIWHRjcW84bnBwemxsYnBI?=
 =?utf-8?B?Z09pVVoxak5lOVRyU052bGNYcytLalNpN25EVlVKMjczTURPQnR2ZCtXSHdT?=
 =?utf-8?B?R0dSTUFnaHQrbUdRRkFHYlRlZnk5YUxNQjFkZGdmRTg3YVBYb1N2Q0RyNThU?=
 =?utf-8?B?dkg3KzB3V3VJdm5vQWQ3S290UzdCQ20vTlJaSTA0M2hzSmEyQ00xZ1phNldV?=
 =?utf-8?B?M0lDRTB5cFRhNzZOaHNOcDk1TmxVWU5aTDdUS01qeXM0ZWpSNllKaVpHZkJL?=
 =?utf-8?B?b1VEVVlhU0JRT0o2bmFPZDNHRCt3cXQ2UERtTDdBa25xdDB4T1d6RCs2QWZ4?=
 =?utf-8?B?NGtaZlJMUVRYb0c4TEZ0cUErODM3c3JSTGR2cTRxVnNhdHRMV1VndHFVVnVp?=
 =?utf-8?B?cXZOQ0ZuOXVlaVVKY2wrUExlQm9GUFZYWDl1SG5PWGMyUzJZZElMVTBvSnh5?=
 =?utf-8?B?aFhLNTFRZkdDK1ArVWdtQXBOZGtwRGRnWFI0R0p4ajVYY1BlcHB5NnRtVjNl?=
 =?utf-8?B?RjBUOXREM2JCZU1tRTNLNUhaVTFHZmI4dTBaMS9JYVlnSnNnU1dBWnpnRE5n?=
 =?utf-8?B?cHIxZ2xwWTRsUkpxenhqR0JZazdIVU56Z0FtUXdwNW5PaHFQL3ZPb1dXV1kv?=
 =?utf-8?B?SFpQYnoxT01KYktwK2RuV1duMys1QTBRcTh1ZjFGS2VoR2dVbGhGYlFmcnhO?=
 =?utf-8?B?N0h1RjRZWUE4a3VKQWRlWVJqT1dpYzh2RSt6aEdRdE1yYnBkY3Q1MFpTeHoz?=
 =?utf-8?B?WUhQTytadVExMURlVm1iREtvTmdGVkR6TkVlNEFLcWFQUitWTFNnS1RseU9r?=
 =?utf-8?B?YzRKK0diNHpobmV5aU1vbDJQL0Nsd3E3dCtrSFI1ZmtNR2U3THZDZ2RWSVpP?=
 =?utf-8?B?MjgwOGRRTW5KQWlSRitjQjdmTmtzdE5oci95QWthNVQvMDkzTWFYN3BkOWhm?=
 =?utf-8?B?S0w5Ukk2MjNmS3RhaXkyZDFoUzk5RkMvcUZ3UEdqWjcvaWNTOTNmOG00OURJ?=
 =?utf-8?B?S1RKVTl0eE1ZWGpiRmNsY0NKU3ZuSVBWOWxCR1E0VmdKZ1BLQitkUTN2R29Y?=
 =?utf-8?B?WVZpZk5mV3V1ZDNRR0kvNnJqWDM2NHJKWjFYbWduTXcxTmMvUlRKTGxWZEFE?=
 =?utf-8?B?KzZkZjg1clp1eTZKQkcrMkRQR1M3ZVV4aW54MEZGSUZKN0xFM0tNaGZmeXk3?=
 =?utf-8?B?eXVETDVsOHRCMEViQzVUWlhEb1JpNXdva25RK1ZDWHp1TjV5c3JQS1ltTitQ?=
 =?utf-8?B?ek12WnNHWEo0SU5MV1RPK3k0YWk0dkdRMjZTN1V2Q081RFQ5MjlQRUVBckU5?=
 =?utf-8?B?VFVsanBRb0hpWGlNaGhkWHpraDBOYUxWejRVU2J1MHR6d1JSU2FFalBOOElk?=
 =?utf-8?B?M2p6RklORzU3d21KN08wVGlUNjNpVUE0K2NVSjFScThBUTBDSnBDcHVmRlJN?=
 =?utf-8?B?amE5Mmd1ckVMckdXWkNvbUF3aDdCaWh2eVNGVXM0WVlSQTg4WGIrMFJoaEM3?=
 =?utf-8?B?Q2p4UHdHeEU5ZkdvMjd4WWlOR0ZaZlJFdTN5V0tGdVFCMDJqVWhpYVZWbVVn?=
 =?utf-8?B?WitaR3d2SlJCdWdIaEJ1elg0U1JPUkhOamtHUHgraDlSKzluRWVvMHRUcHpn?=
 =?utf-8?B?dkprbDI5c3VaM2JEOWl6MmVZdDdpN2o1Wkl0Sit2SGFYbzl3YnA3WGZnd2Jw?=
 =?utf-8?B?YStzK2NlZG9vTFBueGhDSzZ4TkhZL0prckxYTTA2bG9uQXBtSE51dTJjZzJw?=
 =?utf-8?B?dEhhQWdmVnhQdURFYnFEMjRZdGp1d0NYdys1alN4MnZZejB0QWxCOUw1cmQz?=
 =?utf-8?B?ZjV4VDJqNmd2bGt4WUtJSVN4K2xraDByRDl3YUU1YU9EcHFEKzQrWGtZUE9D?=
 =?utf-8?B?RFhzVThVb2UyUEg1RzhzcjVPK0dPc1lPdFIrVGFvdGdiTXlTSm5DbGcraVBG?=
 =?utf-8?B?elJxQmVuVTBoeTdxeE5LWnZuYUVQWEQwcDVLV0pWTmVYYVRpMmdQbU9vQ0tP?=
 =?utf-8?Q?7HH+j1wjebcCUP3QaUcCPeqdS?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a16a01b1-0183-4430-53a2-08dc6f50da43
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2024 11:20:22.9554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uPFSUYmv116MW7JKQa+cE9IyrTIxNEXH3KAIh7P5G+7LdFXSp448/6jleFUhuOb6fAOFYEuZ/NYZ/lbv7Xzmlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5084
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_042034_092164_547C1236 
X-CRM114-Status: GOOD (  17.82  )
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
> From: Pu Lehui <pulehui@huawei.com>
> Sent: Tuesday, May 7, 2024 8:47 PM
> To: Wang, Xiao W <xiao.w.wang@intel.com>; paul.walmsley@sifive.com;
> palmer@dabbelt.com; aou@eecs.berkeley.edu; luke.r.nels@gmail.com;
> xi.wang@gmail.com; bjorn@kernel.org
> Cc: ast@kernel.org; daniel@iogearbox.net; andrii@kernel.org;
> martin.lau@linux.dev; eddyz87@gmail.com; song@kernel.org;
> yonghong.song@linux.dev; john.fastabend@gmail.com; kpsingh@kernel.org;
> sdf@google.com; haoluo@google.com; jolsa@kernel.org; linux-
> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; bpf@vger.kernel.org;
> Li, Haicheng <haicheng.li@intel.com>
> Subject: Re: [PATCH] riscv, bpf: Optimize zextw insn with Zba extension
> 
> 
> On 2024/5/7 18:45, Xiao Wang wrote:
> > The Zba extension provides add.uw insn which can be used to implement
> > zext.w with rs2 set as ZERO.
> >
> > Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> > ---
> >   arch/riscv/Kconfig       | 19 +++++++++++++++++++
> >   arch/riscv/net/bpf_jit.h | 18 ++++++++++++++++++
> >   2 files changed, 37 insertions(+)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 6bec1bce6586..0679127cc0ea 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -586,6 +586,14 @@ config RISCV_ISA_V_PREEMPTIVE
> >   	  preemption. Enabling this config will result in higher memory
> >   	  consumption due to the allocation of per-task's kernel Vector
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
> >   config TOOLCHAIN_HAS_ZBB
> >   	bool
> >   	default y
> > @@ -601,6 +609,17 @@ config TOOLCHAIN_HAS_VECTOR_CRYPTO
> >   	def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
> >   	depends on AS_HAS_OPTION_ARCH
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
> It would be better to add Zba's function description like Zbb.

OK, would add some description on next version.

Thanks,
Xiao

> 
> > +
> > +	   If you don't know what to do here, say Y.
> > +
> >   config RISCV_ISA_ZBB
> >   	bool "Zbb extension support for bit manipulation instructions"
> >   	depends on TOOLCHAIN_HAS_ZBB
> > diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
> > index f4b6b3b9edda..18a7885ba95e 100644
> > --- a/arch/riscv/net/bpf_jit.h
> > +++ b/arch/riscv/net/bpf_jit.h
> > @@ -18,6 +18,11 @@ static inline bool rvc_enabled(void)
> >   	return IS_ENABLED(CONFIG_RISCV_ISA_C);
> >   }
> >
> > +static inline bool rvzba_enabled(void)
> > +{
> > +	return IS_ENABLED(CONFIG_RISCV_ISA_ZBA) &&
> riscv_has_extension_likely(RISCV_ISA_EXT_ZBA);
> > +}
> > +
> >   static inline bool rvzbb_enabled(void)
> >   {
> >   	return IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> riscv_has_extension_likely(RISCV_ISA_EXT_ZBB);
> > @@ -937,6 +942,14 @@ static inline u16 rvc_sdsp(u32 imm9, u8 rs2)
> >   	return rv_css_insn(0x7, imm, rs2, 0x2);
> >   }
> >
> > +/* RV64-only ZBA instructions. */
> > +
> > +static inline u32 rvzba_zextw(u8 rd, u8 rs1)
> > +{
> > +	/* add.uw rd, rs1, ZERO */
> > +	return rv_r_insn(0x04, RV_REG_ZERO, rs1, 0, rd, 0x3b);
> > +}
> > +
> >   #endif /* __riscv_xlen == 64 */
> >
> >   /* Helper functions that emit RVC instructions when possible. */
> > @@ -1159,6 +1172,11 @@ static inline void emit_zexth(u8 rd, u8 rs, struct
> rv_jit_context *ctx)
> >
> >   static inline void emit_zextw(u8 rd, u8 rs, struct rv_jit_context *ctx)
> >   {
> > +	if (rvzba_enabled()) {
> > +		emit(rvzba_zextw(rd, rs), ctx);
> > +		return;
> > +	}
> 
> Looks good to me. It seems that Zba has fewer uses in rv64 bpf jit.
> 
> > +
> >   	emit_slli(rd, rs, 32, ctx);
> >   	emit_srli(rd, rd, 32, ctx);
> >   }
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
