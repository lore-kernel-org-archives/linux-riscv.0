Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28533C5B572
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 18:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vhb14igLmZdk14W2Anu+OfWMNb8E5WbW9V58yJ2mBEs=; b=l5h4szopqqWBP9
	77FqloUo4m8WC07hpiLoZB7/8vlKP+qIUBtG62m0AfeBHrvLTvZCNlN/cygybVJxtDNtfR2MLHnvt
	eQIp563cHir3figDJmVQaFfjnirl99noohB9f8jydKQ/3igF8cz4wWe865JLiSTyCDlsy1TcDDUej
	VWO0j3xmNHlWzGp4lx7IPdPMnhGN/dpDMN1gZeTEYG3jxrfUFNxhyCKvIpNYIBOu0gK5SJQ1EBXOe
	V27PTW+yj063OZE3V/17kqRT+HkUX5MHrdfPE++wS6/Wj4gparI8OWvimUQlRZAi/SqAjURgIDOPb
	UNgFwcFkdfNfzkuYjoew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDj2-0000000Gngk-2qT8;
	Wed, 12 Aug 2026 18:30:52 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuDj0-0000000GngD-1zmB
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 18:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786559450; x=1818095450;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nS3gp/kbM6sLiYmmQDjdsOu6R+pZyLa3CO4hmxZDRno=;
  b=KiBwUqvRN4PAopNaYC/83LoUvVWopz07O6qquXLZ+8F2Qjmplz66c/0d
   f8LDiqJT9L7+mXz+Cw4nV9oLYVswWhtmhewLC4/7SDSmmqG6qGROWolqF
   hiz0EFHEyYPsYvBbNBrpBCVfrAJ2d8MOT9+RDWG3Dqy9xXnZp9ACzeMgP
   0SOYG0aA4eYkis2rhR599Qo6nurT8MiQLWwtk30+bQqhFNa7qPChoeDc2
   W7YNTNm95P2bnp4UqlsvInE2xhvI5dGHw0j/nhhWvifegoL5SPwYkHUd7
   soo5WdjnVExehewoWJl0eX+P9w1HrmFHjK33oEQDRR4zGoVKOIXo03dns
   w==;
X-CSE-ConnectionGUID: iaL88lWcRymWk6F2E4LJLw==
X-CSE-MsgGUID: Ru27h6R3QiG4NOtXTRjJhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87004298"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="87004298"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 11:30:39 -0700
X-CSE-ConnectionGUID: bsGOieQPRumRtHOZY3EWdQ==
X-CSE-MsgGUID: KyKMx2TFQ6ChZtQY6bIp7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="259887869"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 11:30:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 11:30:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 11:30:34 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.69)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 11:30:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvUz06JfEduoCJyPlt7W+FIfxlv8eVYDLUP9WyD02yYcQW1TQwbxRli9Wb9HoDgsYY5oytYStKhyOaG4Ea+Zo3KMcMT0F9eZ5xDfDQC8S/MKGvXfgyosURg/nBR29gvMfZFcCoajvZE6f5ok/bMPqUySmGNPlDNErwqJ33XEBC7mchyvyfetJIrz9R9hY+/G6rKVKTKo6yBNigTYTBMmwP7RwQBzAXBhu7qxn15YLnt3T9v34UhJKIU18QgN0BU7HfGAe6Rv5owZl5IkSEt14iiCPrAUpO3DCiQoj16xby1T6Y9m0ZKrzNV44+k1fuFTSPfQsFpY5/wEGnF7KRrk7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nS3gp/kbM6sLiYmmQDjdsOu6R+pZyLa3CO4hmxZDRno=;
 b=zNmImYxxCd+HmK478wKCgzGECSBXhcEvU3rmy1Gec1PSado3jeWUJGLFQI+qErYNktF/1J4WFwlLZIMQu9Mw9j50a8R+v29PKtUd4RId64wEVnkdGS6tSnd05S+imglYne4PpqxB+nd9UVYjo0KcxclWC9C7NwY/1sErnrn1jrucU5WBQyLAJb6qnFCvELTzzAFqpzxgtANV9sZqeKxciCKZm/rQh3Y5Xqe/UaFBfNUJ2m3PYMPtavqOwqCUSKHj88l/HxQoAR5A1TZhpoNtv+snXpDKkSefmbNQ0xb74pzT+F7/ZUnwgbRA+mqUx0ZHNAv//ZJpEZH+5KX2uzaIHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by DS4PPF2D9C959A2.namprd11.prod.outlook.com (2603:10b6:f:fc02::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 18:30:31 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0315.014; Wed, 12 Aug 2026
 18:30:31 +0000
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
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] selftests/x86: add generic prctl shadow stack test
Thread-Topic: [PATCH v2 2/2] selftests/x86: add generic prctl shadow stack
 test
Thread-Index: AQHdKn7SE+Xr2vVKf0C3DnrhuX9GuraatLkAgAAIkIA=
Date: Wed, 12 Aug 2026 18:30:31 +0000
Message-ID: <ca8465e2e006d31a4fc728707cb679f25a3fa7f2.camel@intel.com>
References: <20260812171940.1046116-1-bill.roberts@arm.com>
	 <20260812171940.1046116-2-bill.roberts@arm.com>
	 <c5d5c26c-eaa3-4fd3-891b-808b6efe3c25@arm.com>
In-Reply-To: <c5d5c26c-eaa3-4fd3-891b-808b6efe3c25@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|DS4PPF2D9C959A2:EE_
x-ms-office365-filtering-correlation-id: 06206fbb-53f6-4d0a-5008-08def89fcab1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|56012099006|38070700021|11063799006|4143699003|10067099003|921020;
x-microsoft-antispam-message-info: uHrbMCiRL4w8G9L+LlFgZJbP9fRJC+Let4HU40Ysl7N9+O7dj7zA0MT8WaBgLFCcMvpU+7xP1EiA0OBjOWEcESe5YdOBGr8ruPPeVqGBRMDdpG7Aq+h8p1YXVx56LPrnFWUoAIJ/Rrdltaz7gJaSOUgUINOQILoTpPIWfL3gY69OuD8619eHwRV5audVUcDJKs2WkIHUUfopEQ2+A4gvlorZjYgxWrj9Q6G3wmULe83Ul/K7npcO8DMWvw7wM31f2hDLPX5r3dt5zZYvfQ/iJ1mPKXEL/EruMw0EcYzjqmATED53YchtAff3+8F8zpjrfDQZeqmuvIhQSu2tJKMMgm0t2Ahz+g5Xcqab4zX1tbnEX9HdwoKVsgfXj2rXKw9oO19L6F8S5ceMji/tL089et/oNFuxacUIjPj4ILbqrg6hLOe8UyQ1Veqr/ayMI4Ns9GuhSlii6GD+oWZO+yjpyj5PrijgBqFIL8NXhTJ8ft/4XQBayagih23NOG/wNf968LKKVL3I6im2Tk/AWkM6F62d33wjJ1/eTLvtHo6UEBgeIqEYLuNY8PmjO1A5d/qWIFqm/puRKbJ1ST+sPYzpLXdGP6+e/6AcEldFJn1nXyylUxsE7UEwR5m3yevTsdANYFYV62JdbUBxrDhVZjegZKtutwsP85Uk7bSHNmP+P+oqoONQjq0KR2NRbTqiVXMQlp23fytwVOKsC9dgPVVOBnTxiebgZhIZlem+VtiTGTg3YGkbAKHPX7um8U7gSsFb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(38070700021)(11063799006)(4143699003)(10067099003)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azZIN3hWaC91bHV5Zm1TYXl3cGo2OEMvZ0ZIamNRWXlKdDNBNnlzYVd0cndu?=
 =?utf-8?B?SDMxNDVMK09peklseUpaVjVrYnhKRS9GSlJOd1pqbEJVUE5uZWE1MDhWdDRu?=
 =?utf-8?B?ZHlTb0h2TE9wdjlObG05YnVCYUdGZXZ5dHdZYlhXdW85a3haR25qMVRSOFhS?=
 =?utf-8?B?TGM2OTFGWkkxYkFBS0RFN2xxQkhrY1pUQ1NCZVBQbnNmajJrT2s0YVVDRWc0?=
 =?utf-8?B?bmxaRElPcFZDcUdWZkRUWlJxYTBKTlJid0xUc1JDTFRCNCs1NkJ6N2VJSUxL?=
 =?utf-8?B?ZWgzWGlWa3EzaTdwazh6eEMyWlgxbC9aV0ZzZ2k0eDFvb2pRS2FrRmh2VlZm?=
 =?utf-8?B?cTlHeUoxMTZ5aGMyRldZUVJOcTBsQW5uNXJkVFk3b0xvR1FPdS9MUG9GNUVJ?=
 =?utf-8?B?ekpVZW1mRDNYZjk5ekZwZDBXN1c1YnYvZzFab3ZrUmJKWnpIMDYyWWpPczdi?=
 =?utf-8?B?M2l5RmY3bm1XRlRsaFJxajFFT1lMcUpOVFhmMFBwdVkwVXJWZFEvNjdKWVB1?=
 =?utf-8?B?SXF1MEZiQlFidktrVVR4Z2I1Q1RtUmNEVndkZmpxTFV4Y2dZUmcyVzFoZTBy?=
 =?utf-8?B?VTZEcnJHZGl4UG5QMUdWSnZvczJRbFlOeDRUWnpFVCtLSmluU1FmeTU3azNQ?=
 =?utf-8?B?MVJBTGFpYUdRNXJ2c2JmQlJ5bXV0bGNLSXVDUVZSQ3ZwNEhucjBjNVBpMDF5?=
 =?utf-8?B?czZUcGtyajk0WFI4VHMvNUtxWnoyTWRBWVlQbk5vQndUVUxITGZjU0NOVytQ?=
 =?utf-8?B?QW5tWFlhRHk3QnFzWHNqbUhzMlRzSjBHQXZraS9CU1JaQ2dwVHFLLzRqaGNo?=
 =?utf-8?B?OHJ4ZTNWN0k2OE5mZ2g4ZXpSRU1TTW5MaUQ2M3ZZREtpVEYzaWh2ZVQyMHhI?=
 =?utf-8?B?QnNvNG1JN2lOd1VzY2pldjZVZm5tajFobmt6bnhnSHpoRlp0R2V0V1ZJNktr?=
 =?utf-8?B?a0crZEdjTEt0cEZRQVlsRmprZTFQUTZHS2VraW5Oa01ma1FBbkY5bTdiV0xk?=
 =?utf-8?B?OUo1RG05b0RkM3hHbzFuczdWK290NkZveU9zcHJWcFc3MEdOZkV1blI2bDhT?=
 =?utf-8?B?SFViUDFZS3JtSW54WnNMOGMxL1hTZXlhZFk2aDFoVTVTSGR5L0p4c0VZZXhn?=
 =?utf-8?B?dktlR0ZHUy9Id3dTSWg1VGF4ajh0dythTTJReFFxMkNlUWQ5T1FuZWFqZ3NM?=
 =?utf-8?B?YmYxaFJwODBSTTZRV1NvWlZ3N3N1MmJyNXFpc2xSOS9KQWRWOC9MVy9EVHFQ?=
 =?utf-8?B?VzhMUERnRURJOVhPaFJjQjFvZnM2OUtpMkxxdkJMalQ3bXlianZ2N1FIcG5T?=
 =?utf-8?B?UExXSys3ejZCU2hiaVVQZ0NlWUJrT1hvMU8zYWM5aHI2ZWJYc1NVMmQvMlZ5?=
 =?utf-8?B?aVVKU3dUT2hvZEt4RHFOWjg3S09kbGpPTVFsc2VsVDRQT0c0N2xJS2JYTHlS?=
 =?utf-8?B?OWtPZlBhZGcwVjl6QUhJSlUxczlhdkNBR2dnMFFwSVc2Q0I2SmVKNGsyNU1z?=
 =?utf-8?B?b05NbmNGU1hFVU9YTnIrTmdEL0FtdnNWUFQzbmY4cEdxSTBVdFBYSVg1Wmth?=
 =?utf-8?B?NzF5RjBPVThEOXh1bnVaTmswSXNvN0hKTjZ1SVcwOUNwVC9tcEU1QW9Nb3N5?=
 =?utf-8?B?RXM2dWRjTTBoVnh4ZjlEOWx2Z3greFlqa2p2d3A2TXhkNkNEMjlzWGw1TzRL?=
 =?utf-8?B?aGFyZjJ5V3I5VTRqNGd0VkQyQndvdXJHRXJUWEtZUTM2MG9ZU1I2c2g0NDBH?=
 =?utf-8?B?VlBHWUZrN2NRUDE0bjVpY0JNdzJzZGpNYjVIWjJQekJRbERvTmtGMHppZm9F?=
 =?utf-8?B?a1FhL0MzMUxiTUJNL3VJOTlkbjJTWlZNZ2VhMWVsS3FCZXZUVTlpcm5LYTRY?=
 =?utf-8?B?RDJubFFIOFVYSzIwb0RyaVRQcnB4K0lQL2NSSHZJS0dBR2JZNGRBamUydGFT?=
 =?utf-8?B?YmlxVHZ3YlVhbTlJSUJTRXk1K1IyQTFkRjE2Y1RpdHNJVE5hdFhzOWk3Qkdv?=
 =?utf-8?B?K2xlRVhuRnJ6OVRqcGZCNStFSjJKVkg0eHRaNElLYnQxc3B2bnF0enZpSG5h?=
 =?utf-8?B?UnQzeEdselkvenNJUVZMbjV5ZFc1SXdrSTYvU1FUYmJadFFPVWRienJockg1?=
 =?utf-8?B?bkJISTcyOU1RMnFjZUpiMDExSTNDdmZybHl3SVh2RmhDVWdubFBwQUZKRlNr?=
 =?utf-8?B?Y1BRK3dnbDBFK1VqSDlodGVRQnlGWnR4S0tVNXMwam5Xdm1YNmVyYk5kVWRM?=
 =?utf-8?B?TnVyd3VIdnM2VUF2RHduRGliRG8waVY5TUtoVmJQd0dRYWpVK2Z1RFVXTFow?=
 =?utf-8?B?cEVJYU5kMHY1d3VkRTMxRnFJSVFSbFFXSjExU010T003TlhEUWZXeExzZkFS?=
 =?utf-8?Q?bYf3gYZdEMKDcClg=3D?=
Content-ID: <3514039914F55B41A35576693E9C47F6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PSDPrmYIfysYRz6dkRL+XeEwt9bs+AnAiX4bl1LJ2eQlk8Mn/74DHLU/OFAUhMAFw9QAJwmS92lkVinq1IEOEkP3evyM1o3HTo0F01sQKajoCr0jBkww699gZl1pAhyCIP9l+yDNIF1uchvR2rpuHhWJka9y+LY5X1ExlXo3WHnQge1ZTbyZ/RqTjx85a8OjESusdy+iksRbK6yRhDSKGwqX2tEVUdMidWlvhwIhuD9sBEPW7f6IVE4db1A4cDQpyjRS8fxBT7fPkggGnvE73vPWStYUX/1MUzIn6ExnrEZUO/c9FxgjkJ7emSp6GNIXJz6gmuDvk478WDtUcQvTyA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06206fbb-53f6-4d0a-5008-08def89fcab1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2026 18:30:31.6705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /3QifaX+enRTLu1bOOr32WYObdTNWx9iJSBFXHGQCh8cN2RhfLFzVzEAJm5s3x9msIP714o7tbayCX9UCI8Gz7GxIrgTb0jMpCUo3k8ftgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2D9C959A2
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_113050_567041_15648F0B 
X-CRM114-Status: UNSURE (   8.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 2026-08-12 at 13:03 -0500, Bill Roberts wrote:
> > +}
> > 
> > 
> > Nack'ing my own patch, Sashiko found a few useful things to fix.

Please trim the mails. That was a lot of quote to search through.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
