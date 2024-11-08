Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D1FD5E15A
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 11:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HfZvMZDzhY6HaguaGbSbiT9xKwSB05YC7thFnj7w2KM=; b=Pbuys+/47cKkhA
	VDbIgWlW3pNwJ3Tk9UZABF3ylTf1bYSJif59CE58awE0XDtXx3c2y1x+N9pn3T3dc+o2I46Ky099b
	+7ZrPs1p3gs+JZ7cgdeQY+ojjCvJrIh7ff2IjLEwLORbbkY6TY+S6AAIub99E2zNDAYEuY45nDGUa
	jiNHyGBNtnn0YW4+JBMIOYZnLqMNVouBj+rhXhdJ7T38NVtFkPLEJINuGU80lKXmkGgtWauehKjeM
	rmHVjY6dfRUGU/I6ZdoXxJ2+VrqdpEwGVfKckCPIBxkRusAfZUUj3poxso/DftZXj4zthFTpDzuuh
	Ekc5i92z2xGbFGchnhMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9N8f-0000000ALEC-1gJe;
	Fri, 08 Nov 2024 11:26:53 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9MMI-0000000A91K-4BHL;
	Fri, 08 Nov 2024 10:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731062215; x=1762598215;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6LguJ8ZvOKph6sFm3jNXfhLcHZ18Yqwltu01LJj4YhI=;
  b=B0epm6pX4rqZRe6sP72tyenvJI4IeIMyy03ra+bYJV3uTdr8QxNzWkQO
   E2dAfiF22cgOy9fr6z7LLvxsIIbUaxvvxZoa5eYEyqocSeL/SVpsIYqX0
   jWs9GO6QmqI/nLAOmHPgTKb5jyexzsXzofV8++XdLI+L1Q53vwd5YGTrA
   O39ocVVCgH4THRWaSvxHp8jHZR2Gwuv4IjcZTih6NKGGp7JzRgW+KExuA
   2TyJNj4JgCxCI2Ui6DtWY0Br1HxoJoVn/PwodtsS8XIytWzmTYD9kgOhz
   cJGZhKPKiuqbI5d0YIxYtU1gs65tzFLte3+Fj6lOlqw2lhtKag2itUvOG
   w==;
X-CSE-ConnectionGUID: GvFWAFCPQYm7ewODjVOPCg==
X-CSE-MsgGUID: xylX0tE9RxenaicgWuQAsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53501704"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53501704"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 02:36:46 -0800
X-CSE-ConnectionGUID: fViin7tRTsyPCNZW7ykFTw==
X-CSE-MsgGUID: WSVWTlQjQnu95eOVVR+bRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="85603010"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Nov 2024 02:36:46 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 02:36:45 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 02:36:45 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 02:36:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IdCjm8yhYFHQMEvee+x5c9aCskFIF0fYs3b4vQ+veVZTYCgN8c5rvLSE5jzWHWu8XkKCX5vyWA9EUywPoFDgex6Bc6AacxcIgItQ7BlZ6cTCdZvu43bgGCg0qA4sF/2FOvdWAZ+hKPGeqiLqitBxsC5CVqWz60kgXTNMTEh3dmF3KrGhPOwPOAjJdqV7HxfV24JhXyz7kKLirwxFo4rBPfIqk31OJC9Bpu+TSbEmUWzrTFWZqEm7i3pyanAy/8gjn/JoUyf2gP/xXm4WHfeULCM+jpXluJaRKJ2WIeY+P59i/VU1sydfNpMqVtEZoQdbBKOdvvQ/Ms882jU9W60tEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LguJ8ZvOKph6sFm3jNXfhLcHZ18Yqwltu01LJj4YhI=;
 b=Rlnoh7K+Ln/9NpLoBOj+XMZaqgWbBdi5GjJ+IjpQhkVki6n3P3YJrRsfSuUGiwz1P1TvUhYrVgo99ErnBWaFZDk552HZwXTeTqu5p3bMEEk9NL9eoDDEK7vAUolzAQDIL16Py66ifAWFV73uBAw8K7flkf5CKaZt+3Dr0UPmBpiEmAL9vUtVmB6m+q1Dh4TTXLRbtu+Xawzjxhkh4rcSj4l5cS/3gg09xKALxXV6Gx+UBv0j7tfOtOuA20O+e1eScw3bamuYaEfWrtVHli4GzBMjXJwro6CWs41p7uqSWc07qR7Vif89jeQzFjhgq8vWm2nLleu8Uee8rzO9gGWVZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5750.namprd11.prod.outlook.com (2603:10b6:8:11::17) by
 MN2PR11MB4712.namprd11.prod.outlook.com (2603:10b6:208:264::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 10:36:42 +0000
Received: from DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::4df9:c236:8b64:403a]) by DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::4df9:c236:8b64:403a%4]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 10:36:42 +0000
From: "Reshetova, Elena" <elena.reshetova@intel.com>
To: "Manwaring, Derek" <derekmn@amazon.com>
Subject: RE: [RFC PATCH v3 0/6] Direct Map Removal for guest_memfd
Thread-Topic: [RFC PATCH v3 0/6] Direct Map Removal for guest_memfd
Thread-Index: AQHbKtKhCUbJUgt2lUeVsVW+MLeJCbKgnuYAgAAOfACAAOHOgIABC0kAgAANywCABCeKsIADtmyAgAKzXuA=
Date: Fri, 8 Nov 2024 10:36:42 +0000
Message-ID: <DM8PR11MB57505F62D149EF153F89B8BAE75D2@DM8PR11MB5750.namprd11.prod.outlook.com>
References: <DM8PR11MB57509ED04CB0730680735AC9E7512@DM8PR11MB5750.namprd11.prod.outlook.com>
 <7ad5d114-3d19-4c33-bb3c-7f8940ad114e@amazon.com>
In-Reply-To: <7ad5d114-3d19-4c33-bb3c-7f8940ad114e@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5750:EE_|MN2PR11MB4712:EE_
x-ms-office365-filtering-correlation-id: 31b4480e-d272-47ce-5f38-08dcffe13c52
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WG9hV3oxdFdNazZmNVBHODZleGJlUG95UVhaeXdVRVlmZXlGUys0dVJkRDdm?=
 =?utf-8?B?aTlvWS9ZZFMrWXZ4cFh2dDlmOUo3NEsxc1NPckVTUlRyQ1pWWUJzZzZta0ky?=
 =?utf-8?B?VmhYWnl2K3lYdS9nbHlONTZRaTg2T3VKNVJSa1FrMzA5c0d0cTN4T1pXZFNu?=
 =?utf-8?B?RkNzMUs4QXk1UE1XOTJiZmJaeW5wNlRnZm5RNGtMbzhoWERXNTBTQTF6NWEy?=
 =?utf-8?B?MExyeGRucFovbTh2Q2hBYkkyQlp5WGM3bTU5VzdRcVc2cjlXVCtsSXoxVlZC?=
 =?utf-8?B?RkNWTnhzMlRvQ3dEMmFmZDhlSHhhZCtGOXRJU3JsY09kbGJXRkloWWhCSEI5?=
 =?utf-8?B?T3d1U0o2ckFiekZJek9ZbXpXM3ZWSlcvOHBZRVJEdy9wL3k5MGdPOXBMTEIw?=
 =?utf-8?B?L2QzandXeFgwK3Eybncvc1JWS04vbGhZT3VnNHJJaE5GWWIraTB2K0U3VlZ5?=
 =?utf-8?B?TVJEbGhHOGZJcGxQYzVKMlZpcG9IbVpZZGR6M1JMWEJBblFsMVdnczVjWXpD?=
 =?utf-8?B?eFhpS280R2VDNFh3Q3ZiS0Y3S3lTUS9mYWNjaFlocDEvMHAvTm9wWjFmUzN1?=
 =?utf-8?B?QlMxT05XNmlLcGlyN01SU2ZQYU5VejJnQjNaUy91MVJXYkx3d3p4SXd1UjFk?=
 =?utf-8?B?d2tFMEhiSmVoM3NvY1J0SUVqdGdLa0ZJRzN1aFJmYWg3NWRMU2hGWUhBWVNs?=
 =?utf-8?B?Q3JYOVAvUjd4UXByZUFtOVRRMjY2bGdQNkZ4aHJJQ3pUOVRjdEVVL1NIRHdS?=
 =?utf-8?B?NjRUTkt6Y3BaRFR2SkZadmJPQ0o5U2pIQ2dER2x1Vkt0VjZnV3c1SjdVUkZo?=
 =?utf-8?B?Q21ETmNhWTJ0Q2RlNzRhNEpGOWdwT1ZFTEhWVktWZ0tMZTJTS1ZrZ0Z3L241?=
 =?utf-8?B?eW1RcFJ0UzJjK2lxWGY1Wmd3bi9qSHYrK2E4MGJaUkRBbGg3OXpDa25iMjJx?=
 =?utf-8?B?R3poV3Eza0hPSDBLSUYxaldReFFiQktsVXppd01vN1lxbkRKS2JFS05yQzRv?=
 =?utf-8?B?TXR4SE5vT09mcTVpWjEyWEZDeTdzYk5ObDh2YW1jQ2xVaFRlS3lGRDMwalha?=
 =?utf-8?B?Zis0Wnk3YXd0M0RpanJSa3VQTmJiTHMzUjZiS3NyRDIvaTFPczB1emlpcHBw?=
 =?utf-8?B?dFl0MzJHWVFITWZBV3hWUlpwR0svY1lTRU5UNTZZMytxcmZyY1M0NHFUczVp?=
 =?utf-8?B?bTNNamFOSkk2cTQyQjBOaXk3bUdGdlJOSGNvV3hxdkplM29vbWtuT0FCZU1E?=
 =?utf-8?B?WFRRV0tQQkM3d1pWU1R2SGFYaXpHLzFwcE9xSExWWFdSZXNOOFVBcE4zaUtB?=
 =?utf-8?B?RW03THMrZFA2U2QwY3NUclFrR3dsYmZ6UEtSMFVYREY0MWg1V0RrOVBCaFpj?=
 =?utf-8?B?dWs0dWhWc2Fnamw2Y3RkR3lnNFJrRTQxUGs5OFN1Z1pFOVY3Vm9MaFNra3kv?=
 =?utf-8?B?bU1HcUtZaDM2OFBYQ0FLdVBlamJja3VjenQyU0pFRGY2MEU0MlFPa3NFSlBC?=
 =?utf-8?B?VHhEdXkxaGgydzIzOStaRVp3VmtBVURkVUNORTNkcG93YWFNcVVRQXNaRkty?=
 =?utf-8?B?YU8rMDJMWGEvaFJlV2ZIbXRGai9uNzZMQ0M2YnBscUZnejBzU0lKbHFZa2ZY?=
 =?utf-8?B?Z3lwMFI0RG13aTFjYTJFdGtkWkNWWkJtaTRPK0ZuM3BOVWllbDA4R1lIU1JR?=
 =?utf-8?B?TUhHbFZsT2RwZmJOaXEzdHdmcUl3WVM0b3M5ZzRFRHpiK2lkdXZ3Q2ZYVXVr?=
 =?utf-8?B?SjJPV0FnN3F3OW42U2RJaGpTckFGZUREUjc2NkZ5U0hLMlpPUFoxL0o2Z0Er?=
 =?utf-8?Q?NBbUAJP0Ka7RL3tUqXykhB7126i8cxUdMNHIg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5750.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlFhaWIrc0t6UzBrZ3hVVmNDd1R6bUtHczNzRnUvaVo4R1E3SGdvdmlzVnFr?=
 =?utf-8?B?Z0ZyTm5YQU9Ga1Y0Y2JmWC9iNGFYWXNFVFVXai96VmtmUURyRzJaM1lGRlJ3?=
 =?utf-8?B?dlhMKzZneVZUWTU0d2Exbng4OUtoNWZ5MmZZdjc3andobzlTYnFTN1JQczMw?=
 =?utf-8?B?WXY4MWJXNU5IWS9HQ1lDem5oYmJTZkczeERhRE1OOXlaVGZFTWZYVEFVRDZx?=
 =?utf-8?B?cnVBQitobDQ2WkhBQnRVN0hzY1VpcE4xWXdtR2h4azE3U3JxTGY2aExXM1FH?=
 =?utf-8?B?MWRlZWVsZjlzVU16YzIxV0QwQVFqeG54QXBlODlUcHFvemtoblpIM2R3MFp3?=
 =?utf-8?B?TTNmQ2l2K3gzbDVtRXIxY0dlQ2Y5V2dEK3FQNjg4QURpQUhnZzNxa1ZvUktE?=
 =?utf-8?B?MkhqVVEwQkpVc1VGNWFzZXdkVDVabDZwMlgwN29RVUpQWVZpaXNORVJodGUx?=
 =?utf-8?B?Sjh3Y1J6bVpLakQrcXpBeWxRNEY5SEZZUTB6Y2lOclQvazdtb3FmdnNiSVpT?=
 =?utf-8?B?cWRtK0trSHVFOVRIdi8yQmxFZDZXbWFjamNjbklnWU9IdWozZVZ1RzEraS9w?=
 =?utf-8?B?ZW9KTEpHVkRrOWhDSmtFbUJ6MkRUYk9DbVQ5eDZSRWQ5VmdqN2NHMkppa2Iv?=
 =?utf-8?B?L0pDaVY2UTJrTnJNY3lpcTNQSm9KOGovWDMvRVNRc0RKYkdaMUdKNzJ3d3NZ?=
 =?utf-8?B?ZWZnNkxpTUpmZEpLN2VZcjM3WTMrakQrY1VsSThLZnR5S2VPdmNVS01VNnRp?=
 =?utf-8?B?a0dra0IyRitmQlB4TkFHVFBIR1c0ZzZsMkxJekZJMU5tUGdCV3JyTVRFV1NN?=
 =?utf-8?B?dXZaTVJTcEhNMWVNOEV1UzNHWm5rRVJsTm4zVjYxUFNjaEd3QjFjUUhXU3R0?=
 =?utf-8?B?Z1kwaktaSGZsNmNKd3hvNGRuRXNONzZocldrSGtsdXZWWTIrNU53andLUngz?=
 =?utf-8?B?NFlmb25vdGVoYXdXajA4d0c2cDFEL3AyUGsrLzVESk1SaG4yRWJmem94emFL?=
 =?utf-8?B?amFyakh6V3VrUVhrNGQ2UkdqN01QR1R2T0UvUXh1VG9lbjhtL3U5K1pBMVND?=
 =?utf-8?B?YlRpKzhrYmJRZkFsekU5b1QrS0Y1UGQ4aXlHT0dOaGVDZmlQRWtnUmV6TlA1?=
 =?utf-8?B?aVdHakRITEZrRlQ5aVl1VVkzeEVWZE9NcWZoaTQ4ZUpLZG16cVJCYWNJKzNj?=
 =?utf-8?B?aHFhWGRleWZGdURhMFcvWU4wWkFISW52RGoyUzMvdzlLang3T1YzZmcvMCtF?=
 =?utf-8?B?cWh5TW9hREt0M0hQeHhvR29KN2F6RE51YTBSaXBJanE3bnFHMEJjTlY1Y3Jh?=
 =?utf-8?B?OTFPc09mVG02QnAyRklSaWRKZGg5SzVESFpINDJKMmUyYWtIWHc1cHFSLzl5?=
 =?utf-8?B?ejg5eWgwdVlEUkNRK0dzV3pyWGl0QkJnMUowNWFoU2YxUFhOUzZMOW55UXlh?=
 =?utf-8?B?WGJaRURrS1RZakx2cHRRQWMrVE9uRjFpaVArZXFZYkIzNlF0V2ZFWURHNDRU?=
 =?utf-8?B?VEhQUFBYZ1ZmL2xrcWRRaytSZ3ZPUjAyNWNIMmRnTktvTzZvUWpHa0ttWkll?=
 =?utf-8?B?bUZLK0VEQzA2WHFuRS9aaTk5WndhbDh3bXVnN0JNQ3FiQUtFRTlQcTA0dWk4?=
 =?utf-8?B?cVMxKytBTlk5WTFaZFAvRThFc2FYQm03K2VlZ1gvQWlIYjlzcW4xZ1JyNUJw?=
 =?utf-8?B?ekQzVEQyb3RJdE50VGJ2Zk1FUlpZdVVtVXpsb1N4ZzFjTTdPSnlTdjM4cXox?=
 =?utf-8?B?TDZ5SGkyUEovNENzN0Y5cnh1MWZKQ3o2MjRSTGkzYjAwcThVMnFVNU1zL0pw?=
 =?utf-8?B?OThCaktwYm5BeWJ2elk5N1FGWTNtRGhSVVdHVWtwWEMzeWR5Ry9HWTJhTm5C?=
 =?utf-8?B?RXpnbHJDWUZlQU8rWDJOVjc1NzhTSitYMDB2Szd5WndkeU9Lb1I4L2xFMzEr?=
 =?utf-8?B?ai9HMUlVOW5ETys2cjdGN3V0Z2tFdkxETmFocjZMMlExRmRKMFpiMDdYc3NU?=
 =?utf-8?B?cG40SFhIY3VJODlHQ0JWZUEzZ3FKZlRqZU5lZDNRTTZ4dTVpcGpNN0FMdWNQ?=
 =?utf-8?B?MGl5Y2dOMXhFR1lObXBIYjlXYkhWRnk1WVJtTUpmZnh3SEg0Rk91VzlvWk01?=
 =?utf-8?Q?/mJbJZi1a882GqaBOC49xWoAe?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b4480e-d272-47ce-5f38-08dcffe13c52
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2024 10:36:42.3899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EdeU0rWfKJjEK6sRbtlgux7fZUxqaOQ0JZRNc5zOESJmrNPqwO5x+Oj8Fr/W3cYjxE3d6XOq2ZwlWj2lX5QMgptwbEX5PL0GRyenZ375CvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4712
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_023655_196396_3950199C 
X-CRM114-Status: GOOD (  11.18  )
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
Cc: "jthoughton@google.com" <jthoughton@google.com>, "canellac@amazon.at" <canellac@amazon.at>, "luto@kernel.org" <luto@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "david@redhat.com" <david@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kalyazin@amazon.com" <kalyazin@amazon.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "Hansen, Dave" <dave.hansen@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "kernel@xen0n.name" <kernel@xen0n.name>, "shuah@kernel.org" <shuah@kernel.org>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "mlipp@amazon.at" <mlipp@amazon.at>, "corbet@lwn.net" <corbet@lwn.net>, "will@kernel.org" <will@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "tabba@google.com" <tabba@google.com>, "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "roypat@amazon.co.uk" <roypat@amazon.co.uk>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, "jgowans@amazon.com" <jgowans@amazon.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "ackerleytng@google.com" <ackerleytng@google.com>, "xmarcalx@amazon.com" <xmarcalx@amazon.com>, "bp@alien8.de" <bp@alien8.de>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "seanjc@google.com" <seanjc@google.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "mhiramat@kernel.org" <mhiramat@kernel.org>, "Graf, Alexander" <graf@amazon.com>, "Annapurve, Vishal" <vannapurve@google.com>, "rppt@kernel.org" <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

 
> On 2024-11-04 at 08:33+0000, Elena Reshetova wrote:
> > This statement *is* for integrity section. We have a separate TDX guidance
> > on side-channels (including speculative) [3] and some speculative attacks
> > that affect confidentiality (for example spectre v1) are listed as not covered
> > by TDX but remaining SW responsibility (as they are now).
> 
> Thanks for the additional info, Elena. Given that clarification, I
> definitely see direct map removal and TDX as complementary.

Jus to clarify to make sure my comment is not misunderstood.
What I meant is that we cannot generally assume that confidentiality
leaks from CoCo guests to host/VMM via speculative channels
are completely impossible. Spectre V1 is a prime example of such a
possible leak. Dave also elaborated on other potential vectors earlier.

The usefulness of direct map removal for CoCo guests as a concrete
mitigation for certain types of memory attacks must be precisely
evaluated per each attack vector, attack vector direction (host -> guest,
guest ->host, etc) and per each countermeasure that CoCo vendors
provide for each such case. I don't know if there is any existing study
that examines this for major CoCo vendors. I think this is what must
be done for this work in order to have a strong reasoning for its usefulness.

Best Regards,
Elena.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
