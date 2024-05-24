Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2D0C25B79
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 09:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3GYN18BR/fK5FMLGkVQGJXzq3rWhxqCO6N+wiLrUGw=; b=sqwPZ6FrLzoT1Z
	pKrgczZwv2paSCk4Wz3sBoev29aOT+snjn0zQ47oN5oV5uXiTc2NL5ueBKNQs2GbkP0zEAwqEda9U
	f1HSF1BLykcco/WiEpTM/S27oU+WZ8IY/Xr6cP4R2mB2OT7K5/GR7BJoLjeLZUzxD6TwAYMkkJKZE
	J96ujPhRUk2beDB24wKTK70E1coJO4d2AwDLFKvQFv44a4KHZu/EJQS9u8frpseHkMMXPRMeauYmt
	FzfnZuK+j/tPRbyKOkNgEodUWn3+nhDLfqbBKmmuT7+0QmCT+aGZcLva0hkTkFjFlPEcoBJMUh27P
	3/du+zMCgbSHl9yKKY0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAR2k-00000008ViI-1RcR;
	Fri, 24 May 2024 09:16:54 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAPxl-00000008LPo-0vVk
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 08:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716538062; x=1748074062;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0dbe8Y+YijKc/zSaKZPBI6aH5OjMrTyqLwdSKFSb51g=;
  b=UmWr1/ecRtTyeCtv6hXMWTMRBB351S2Y3YE1Pql1FABgxOJEieTYWFdS
   jNMmIZtxUy9IZ/9yL3j3G1uilVylnZrJYVFLB7IxeCubiMtIabOBZBOe8
   f2qdxFY38x+MoyicA2c5Ms+hQfZ6DzTepZJwjHTobKsN/61EfYcp59ioU
   rXoSiMmDVxQeEhYRFDrldKL/bYmjZwp4cKQVfWOfKc86dDfVsnnTA6+ti
   /IERbkTOvOHM3FB6eJwRlCLj6fhW7M7o4oNQtOQxyZPg0nd0jPrTOr2R6
   f1/PMu2xmdnfbZGq2RDQMMS7++gTI+tzfHWnrEr44tbZ9y3qz++mqnAtx
   A==;
X-CSE-ConnectionGUID: thwvlOkXQheY7XOKSxxEqw==
X-CSE-MsgGUID: UjI31LX1QbOfKbQvUET/NQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13020784"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="13020784"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 01:07:39 -0700
X-CSE-ConnectionGUID: ukW4zqDVSDWcYgkQiT0wPw==
X-CSE-MsgGUID: RGMpSa2kRg2cuO0utErIVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="33928726"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 May 2024 01:07:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 01:07:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 24 May 2024 01:07:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 May 2024 01:07:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOupgoLkDoomyV9i1fuTkA/2lhZAOzKiUAefqpHKUs037Ne8nu0n5jY0u6AlJ25TzLC0Buixci58ysWOgklaz6on3/s0GdnCiFgROktn7/eYPev+FZ5yKhMG9zl5emvDyy3vhlPSo8Pbbaety4JbxYdZEM2Mm6vRSODzc9K4ssKEirusGGY6LH3lGtc0wOznleW56Yto/EmMp7K14RHibCBQXIPjQfWMxIYHud2knSJP7ADIm5Gls38SUtJzCLB7AA2yqzyclj2+zvtBVcqaWJHPAy9F7+o6Qhb1VzFVDUgnTsIKJqPRGpmpE+Mx9o8cFymeZAtB40XRj6NLc8oM4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dbe8Y+YijKc/zSaKZPBI6aH5OjMrTyqLwdSKFSb51g=;
 b=HZuQORqAQnlUL8yLbg+w9zs6CjMAFXt6x2wYND252iDXMDHPadhL9UVL88jcgoEVFsO6tFHceFEfNtCVmH7PS5qpoBrINZe84nybLKM79P5vnkdwD7hLIMP5ZBijQC0EX7zjaiFuZwn8eEUhyDzniaM0vLl3zbE7IGFZxKWoQRZA3LMTIKzw9hy7NVRF11QJ/L+1seh+ugLCOXL4JVhiSVXmvgFmAM8GFEbKaRYZbPnG5p6924aq2TdVaQ68GvZxR0wc5GEpR+q1FyDQ7ykv5+T06ccHFBcA0zJ1OxTrErzQjYGePvyb2hrWG3FC4m9pVXTUn7jOWwPNkC2rZDvC/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BL1PR11MB5288.namprd11.prod.outlook.com (2603:10b6:208:316::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 08:07:35 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%4]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 08:07:35 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: Qingfang Deng <dqfext@gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Qingfang Deng
	<qingfang.deng@siflower.com.cn>
Subject: RE: [PATCH] riscv: hweight: relax assembly constraints
Thread-Topic: [PATCH] riscv: hweight: relax assembly constraints
Thread-Index: AQHarPW0mKA+dDLouUGCTB73Tx9JyLGlj16AgABXbQCAAB6Q0A==
Date: Fri, 24 May 2024 08:07:35 +0000
Message-ID: <DM8PR11MB5751FDDF4BC3E7B4C1822B9DB8F52@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20240523094325.3514-1-dqfext@gmail.com>
 <DM8PR11MB57515218B467E28FFDDB6703B8F52@DM8PR11MB5751.namprd11.prod.outlook.com>
 <CALW65jaHrd_AxhpouVm8rq6zTOPeRWMHv029k0cThVtTNDAaCA@mail.gmail.com>
In-Reply-To: <CALW65jaHrd_AxhpouVm8rq6zTOPeRWMHv029k0cThVtTNDAaCA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BL1PR11MB5288:EE_
x-ms-office365-filtering-correlation-id: 1970a34b-da02-4e9c-190f-08dc7bc8922d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?VmhOdStpUldObFArUFgrMi9jVHBBdkV4TW1oS25Ya3A4RW56eTBIWGZPRUhn?=
 =?utf-8?B?MWFxRWpEOHF3ZVIyWWUyY0pIWnk4cG1UMGpCZXduVEhjZ3RQU3lDdVBSd3Zq?=
 =?utf-8?B?NmE5ZW9KdFRnOHQ2T2pFUjRjWWZwVjRxU0xPenJyNWc5cWt1cG03NThBZnU0?=
 =?utf-8?B?SjJXK05Va2VKN1o3WmRXeEg1dXZ0STIvZzVzb0ErUFZqRkptdElKR0xzNnly?=
 =?utf-8?B?Q1ExNlk1VUZCRm9yRzVBbzl0RlBodkdHVU5CNERFbm1hTHE0cGFCeGFJQ3Bo?=
 =?utf-8?B?WEpGdzZGY2Y2ZmFLRktPWGpzZlB1dWY0cDR6YVVsTjFCMGhNeTZUaC9YYUlp?=
 =?utf-8?B?dGlyVU52Uld4SDhHbkxGK2M1bkt3WGllcEJ3Y2NoWVZKUWhudEpXY3VmS1Fp?=
 =?utf-8?B?MGZibTM5a3dCZ2czMkVLeG1LWnVhcHBHV0FTLzBXV2h0Q2J4OEVJUWJ0UHlB?=
 =?utf-8?B?cmQ3aVFYdVY2dkl5Vlp3ejRBOGhKdHN4QTV0S1hKUmJVcXFNZUNxQ0NoV29Z?=
 =?utf-8?B?SmhFdVljYitxWmF3V3pRdGZtL0JYUGFDVGZOcU8rMStMUE5nT2lzUFBVMEZ1?=
 =?utf-8?B?a1hNbkUrQ0x1VVVUem8rTk5MTStNckJsVXBMekx4dlpoSm5qYUdydWRKbmZk?=
 =?utf-8?B?NmNpVE11NFd5bWs4eDdsaUw0OVQwV2RsRzhsTXp4a2UzZXRsOGFER0NSS1Rt?=
 =?utf-8?B?L3Y2RWkyUmxDSmg5SFJITkJKb3lyNU9rZnNSRUNRLzJrQWhwYXdsdG9uZ3ly?=
 =?utf-8?B?WWdkeDc3U0lPRndyakNKaWdFTjlDeEFjZkpSU1EvK3ZCRVdzWjdqMHhLZVdE?=
 =?utf-8?B?dGowTWdzU25FTlNoSGp3Wm5KRmpYNWNSQ0E0Q0hQNDRVcnhCVzJTR21LZERN?=
 =?utf-8?B?ZkszS1hLbUVXQWwwUGZMQm1Da3hEVWI3Q0RhaE04V2dZLzIrdHdDR1FyMllI?=
 =?utf-8?B?WHgySWFQM0p4SGw4T09MRWM4TXkyczNZc0loSTJnWjcrQlozc3JRYllEU1BT?=
 =?utf-8?B?Y1B6cUQ4OGMvaHVvTGgwK0Z2K3dHRUZKUjV1TjgzcnhSaGJPYVJFMktJNk1j?=
 =?utf-8?B?Lzg5RTVaSkdoTzh6OE1NRTA1Uktiak9nK1RHN2t5eUdmMWlQL3FtaTF3aWRu?=
 =?utf-8?B?bGo5T1I1bDZNN2xxdFhjSDhjYm5uSnhCd011SndEVmc1eTRvbG96NVJnellX?=
 =?utf-8?B?ZlBES1p2RHdRaDNFVXFGTDY2ZHJXUGM4YzRkWTZyKzk4bXN6RjM4QVdYTXV1?=
 =?utf-8?B?R0s1aGdHbzZtWUxRS3NsSlFvb3pCNFJsakdYczJtS3FMRk1UWTJxTkw3ZkNs?=
 =?utf-8?B?Y1hMYWpOdExaYUtqN292VHUrOVRmQTVSSXhpYVZ5UFFBMFFKS3IzK2pHNFJR?=
 =?utf-8?B?THlqcEpYaE1uK0tYYnIxVUp4SURhWWp4WnlkWSsxQmlHbDhaaE41VHZGK0VT?=
 =?utf-8?B?YlNIcWJqMEluK0RzNTVGeGdpS1FaUUZYOU1pcUJxa2t5K3N0UUJGWjNmODNx?=
 =?utf-8?B?bVlOZGFLZ2QzTGsvYmJDTm1ETnNzdDJHVitnTVpsVGNXZ2VxNTdQVU9JdnBR?=
 =?utf-8?B?VUg0TUpDTzhOd1hOMWZCZ3I1L055QTc5WVZLNzlNT1hnRVZZWFpsam5wU1li?=
 =?utf-8?B?cGdaa056RG1ZOHRWcVdqVlEvV0I2R2RwUTQ1TDRlTUJNUzNucDlCd2U2QU5D?=
 =?utf-8?B?dEJCZUlDTGJqVTVOYWFMYU1IS25xUXg3RDdvNmJyaCtkMktGTEhMMmJGLzlQ?=
 =?utf-8?B?elI1ZmRZNGpGLzY4dEdRTVYwS21pekoyOC85SDFWTlY0UlJpUnA4QTRMMUN2?=
 =?utf-8?B?N21IUVkyMjZDLzhKRXBtUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkVFQS9TMERDNjhPaWhtRGNiQ0hycCtURE84S3NhUUpXZ1ZQN0ZCM2QxUzFX?=
 =?utf-8?B?Sk5FU1QyMkRtT1JUOFpsVHdZanpEWWNpbGpXL3ZRSVlZRzE5d1pTYjNMd3Ex?=
 =?utf-8?B?WGNLTnpnK0V2RFpTVTQxRmJzd0FnTm1jdnByTEltR2FCelFCaXhYMG9QYURw?=
 =?utf-8?B?Nk0vOFlyU0R0ZFNTSHRxK0ZEd2V6azg4NnBFWFJIdzRQcjkzcGNxMmY3Wjg5?=
 =?utf-8?B?eTd2SlBtRWI4WDFaWlVQcC82VzhHaWhwS0o4SmVPZkFWb1cvVWNjNUFRMjl2?=
 =?utf-8?B?UnNSWWZvKyt2a0Y2ald1angvSTVFd09aYy8rSE1zOVBzTGg3Q2JjYmN2clpu?=
 =?utf-8?B?VVlsMmdjdGlUM1ZHME9GcTVPeTZUMEduYUpnbHdnQVBKQVdHRTk3ZEFUclFu?=
 =?utf-8?B?SkhBZ05kekxEWnJSRVVULzg0UVY4R1FYVm1JaUxPd011MmdtSlhpOGRCcDhY?=
 =?utf-8?B?VmhSZGlSdU40by95eHBJdjdEeVVQWTZTMWhlWmpoZzFMdWtkY3VDZHlpYS9O?=
 =?utf-8?B?d0wrb281ZWNSRGxJT2t5NEovOUxrQWlCam9ST1kyVE5jcXkyZ2hFSUdxY3o5?=
 =?utf-8?B?VU5LTno1UHAvSEkxNldIT1VhT05qQ0FzRUdvV0NMM2tTS0M0Ri9Zemp1RjZC?=
 =?utf-8?B?RzdOSkRpcEJNYzBNK0UyUFhwSTlYNk1Md0xXZDdBZVZCU2xrOThCVCt6K2h4?=
 =?utf-8?B?TXhhYXNSbEZER2cwNnUveEQrSVAvejY0K0hMTUVXMWZyTmNvMXRiVUxYeW1G?=
 =?utf-8?B?clZRLzZZVTVjeU02ME9HWUw1UXN2YUdjT1ZOL2V5TnAra0FkOU1HZEZjTm9H?=
 =?utf-8?B?RVI0eDVCVlczd0x5WXcwU1NDVE9PMG83WWVwejMxZ3ZFMjEwbFNEcm90UWxO?=
 =?utf-8?B?Zzd4ejFBaXNtaCtqdm9Id1FCN01uVmI5bys3YXVMUWYvdWpHUm1FQVJDQ241?=
 =?utf-8?B?K1ZyakNnU0h4dTREclNlVnlZZW1IOHg0WFppS0QrZVdvSjVnM1pzR2pNeVNC?=
 =?utf-8?B?alFFVXRsL0tZcUt1b1RqVnE5aUt4TXlnZmRuYVpMblViOFJPRGloUHdQSTRR?=
 =?utf-8?B?cEJnaEVTNnpJaXUwUWlFendsZTJldU05d1JWbVNtSTNINnQ1dFlCT25qNXE2?=
 =?utf-8?B?TmZHNEZobnY4cUx1c2gveU84dWtqTHQ0WlU4Qml3dkNkNDdoQVVDVzJwWEIr?=
 =?utf-8?B?SW5rZnVuaFIrZDFCKzd2YTB6QUFGM0NvQjRYQnFRb2NpZE4yaUpNcjMwTlZ6?=
 =?utf-8?B?aUdjSlhtQnhiWlZtT0lGeTJuTEQvOWIzaHdmL3YvMmxQZEVRTG5lckxjUEtI?=
 =?utf-8?B?MTl5WGt3WlV4OUUxbkVCR2hUOUN0VVJlalV4TmU4T2ZlbU1TL1V6ZmdvZ0Nk?=
 =?utf-8?B?TzlLNTc3RHcxOGVPbGNEL1FLeUFxc3dHellSZzRnaDBKSlpxYUVQTUEzSTlZ?=
 =?utf-8?B?c2xZSFFsUjBaaGUvMmk5SjA3eDBMLzFpbkJTRDhrOERMYjlXc3AxSlVndXB0?=
 =?utf-8?B?U2tVaVZZMFhEQ3cwcFZmYkFENVYrTXA0czVJcFJWbEczKytQczF0MmZ6c2Yx?=
 =?utf-8?B?anNCSkpDaEF6Sk5jM3YxZmNaMzQ0MTlic0JSTEpOWWdmQTVCV0F6ZHUxWDJK?=
 =?utf-8?B?a2syaUx2eDJGeUZwMjh0WVBFMDl6dzU4U01BZFBWRVlTMWNIZHRMaHJLV0Qz?=
 =?utf-8?B?MmE4YXlSWitHa2pUaGZzeTJDUGR3NDd1cHowbFZRdW5taHFCOE5KU0hwZUIz?=
 =?utf-8?B?ZjFwMExXNkxtM1JXZldsRmdJaU8xclNVQWlQM2RxRGVVb2dhY3I1K0RHN0xs?=
 =?utf-8?B?N0hra2xURVRiazFwODJBYnhLVWovMEVmNzhjMWV4dnhDcmxLNXVvbkdsZFpR?=
 =?utf-8?B?M1oxQk9TOTVUdFJNT1NiWG1ma1ZtanpKUFpEY2NwN016RlJqeGlvdGdSRzRT?=
 =?utf-8?B?WWdwdjI0VUhCUnBVQ2RxMTdGU3VoYmpwbjBvTjJ2MkpPclEwbUM5NVBDOUpG?=
 =?utf-8?B?SjNHd2gzaXhFYk5QeWhWeEN5aW01eE1oUEtpWDFuQ1c3aDdQNVR5WktHSEEy?=
 =?utf-8?B?N2YvSmZveHo1Tno3YnhvZ0JveG1nTFV0Ti9hYWdEcFhsMzdCUXV2ZU5RZzJM?=
 =?utf-8?Q?ORGbvbXD9GJYv4/5Qe7rNsMMW?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1970a34b-da02-4e9c-190f-08dc7bc8922d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2024 08:07:35.5515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ls1clQSm62PhNSxchPz27UXznTXL2M+LazrkzuFcPBzeOOKreFRnwQwGmmdoNOJO4sjnCqIVePtN2dj6OfgRHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5288
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_010741_360187_366E0A65 
X-CRM114-Status: GOOD (  22.77  )
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUWluZ2ZhbmcgRGVuZyA8
ZHFmZXh0QGdtYWlsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBNYXkgMjQsIDIwMjQgMjowNSBQTQ0K
PiBUbzogV2FuZywgWGlhbyBXIDx4aWFvLncud2FuZ0BpbnRlbC5jb20+DQo+IENjOiBQYXVsIFdh
bG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+OyBQYWxtZXIgRGFiYmVsdA0KPiA8cGFs
bWVyQGRhYmJlbHQuY29tPjsgQWxiZXJ0IE91IDxhb3VAZWVjcy5iZXJrZWxleS5lZHU+OyBsaW51
eC0NCj4gcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgUWluZ2ZhbmcgRGVuZw0KPiA8cWluZ2ZhbmcuZGVuZ0BzaWZsb3dlci5jb20uY24+DQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHJpc2N2OiBod2VpZ2h0OiByZWxheCBhc3NlbWJseSBjb25z
dHJhaW50cw0KPiANCj4gSGksDQo+IA0KPiBPbiBGcmksIE1heSAyNCwgMjAyNCBhdCA5OjAy4oCv
QU0gV2FuZywgWGlhbyBXIDx4aWFvLncud2FuZ0BpbnRlbC5jb20+DQo+IHdyb3RlOg0KPiA+DQo+
ID4NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IFFp
bmdmYW5nIERlbmcgPGRxZmV4dEBnbWFpbC5jb20+DQo+ID4gPiBTZW50OiBUaHVyc2RheSwgTWF5
IDIzLCAyMDI0IDU6NDMgUE0NCj4gPiA+IFRvOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5
QHNpZml2ZS5jb20+OyBQYWxtZXIgRGFiYmVsdA0KPiA+ID4gPHBhbG1lckBkYWJiZWx0LmNvbT47
IEFsYmVydCBPdSA8YW91QGVlY3MuYmVya2VsZXkuZWR1PjsgbGludXgtDQo+ID4gPiByaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+ID4gPiBD
YzogV2FuZywgWGlhbyBXIDx4aWFvLncud2FuZ0BpbnRlbC5jb20+OyBRaW5nZmFuZyBEZW5nDQo+
ID4gPiA8cWluZ2ZhbmcuZGVuZ0BzaWZsb3dlci5jb20uY24+DQo+ID4gPiBTdWJqZWN0OiBbUEFU
Q0hdIHJpc2N2OiBod2VpZ2h0OiByZWxheCBhc3NlbWJseSBjb25zdHJhaW50cw0KPiA+ID4NCj4g
PiA+IEZyb206IFFpbmdmYW5nIERlbmcgPHFpbmdmYW5nLmRlbmdAc2lmbG93ZXIuY29tLmNuPg0K
PiA+ID4NCj4gPiA+IHJkIGFuZCBycyBkb24ndCBoYXZlIHRvIGJlIHRoZSBzYW1lLg0KPiA+ID4N
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFFpbmdmYW5nIERlbmcgPHFpbmdmYW5nLmRlbmdAc2lmbG93
ZXIuY29tLmNuPg0KPiA+ID4gLS0tDQo+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hcmNo
X2h3ZWlnaHQuaCB8IDggKysrKy0tLS0NCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2FyY2hfaHdlaWdodC5oDQo+ID4gPiBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vYXJjaF9od2VpZ2h0LmgNCj4gPiA+IGluZGV4IDg1YjJjNDQzODIzZS4uNjEzNzY5Yjlj
ZGM5IDEwMDY0NA0KPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hcmNoX2h3ZWln
aHQuaA0KPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hcmNoX2h3ZWlnaHQuaA0K
PiA+ID4gQEAgLTI2LDkgKzI2LDkgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB1bnNpZ25lZCBp
bnQNCj4gPiA+IF9fYXJjaF9od2VpZ2h0MzIodW5zaWduZWQgaW50IHcpDQo+ID4gPg0KPiA+ID4g
ICAgICAgYXNtICgiLm9wdGlvbiBwdXNoXG4iDQo+ID4gPiAgICAgICAgICAgICIub3B0aW9uIGFy
Y2gsK3piYlxuIg0KPiA+ID4gLSAgICAgICAgICBDUE9QVyAiJTAsICUwXG4iDQo+ID4gPiArICAg
ICAgICAgIENQT1BXICIlMCwgJTFcbiINCj4gPiA+ICAgICAgICAgICAgIi5vcHRpb24gcG9wXG4i
DQo+ID4gPiAtICAgICAgICAgIDogIityIiAodykgOiA6KTsNCj4gPiA+ICsgICAgICAgICAgOiAi
PXIiICh3KSA6ICJyIiAodykgOik7DQo+ID4NCj4gPiBUaGUgYWJvdmUgY29kZSBwaWVjZSB0YWtl
cyB2YXJpYWJsZSAidyIgYXMgYm90aCBpbnB1dCBhbmQgb3V0cHV0LCBzbw0KPiBpbnR1aXRpdmVs
eSwgdGhlIHByZXZpb3VzDQo+ID4gcGF0Y2ggbWFkZSBycyBhbmQgcmQgdGhlIHNhbWUuDQo+ID4g
VGhvdWdoIHJzIGFuZCByZCBjYW4gYmUgZGlmZmVyZW50LCBkbyB5b3Ugc2VlIHBlcmZvcm1hbmNl
IGRpZmZlcmVuY2Ugd2l0aA0KPiB0aGlzIGNoYW5nZT8NCj4gPiBPciBhbnkgYW5hbHlzaXMgZnJv
bSBhc3NlbWJseSBkdW1wPw0KPiANCj4gQnkgbWFraW5nIHJzIGFuZCByZCBkaWZmZXJlbnQsIHdl
IGNhbiBzYXZlIHNvbWUgYG12YCBpbnN0cnVjdGlvbnMuDQoNCk9LLCBJIGd1ZXNzIGluIHNvbWUg
Y2FzZXMsIHRoZSBvcmlnaW5hbCBkYXRhIG5lZWRzIGJlIHNhdmVkIGZvciBsYXRlciB1c2FnZS4N
ClRoZW4sIHdlIGNhbiByZWxheCB0aGUgYXNzZW1ibHkgY29uc3RyYWludCBoZXJlIGFuZCBnaXZl
cyBmbGV4aWJpbGl0eSB0byBjb21waWxlcg0KRm9yIG9wdGltaXphdGlvbi4NCg0KSXQncyBiZXR0
ZXIgdG8gc3RhcnQgdGhlIHBhdGNoIHRpbGUgd2l0aCAiIHJpc2N2OiBsaWI6IiwgbWF5YmUgeW91
IGNhbiBtYWtlIHRoZSB0aXRsZSBhczoNCnJpc2N2OiBsaWI6IHJlbGF4IGFzc2VtYmx5IGNvbnN0
cmFpbnRzIGluIGh3ZWlnaHQNCg0KQlJzLA0KWGlhbw0KDQo+IA0KPiA+DQo+ID4gQlJzLA0KPiA+
IFhpYW8NCj4gPg0KPiA+ID4NCj4gPiA+ICAgICAgIHJldHVybiB3Ow0KPiA+ID4NCj4gPiA+IEBA
IC01Nyw5ICs1Nyw5IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdW5zaWduZWQgbG9uZw0KPiA+
ID4gX19hcmNoX2h3ZWlnaHQ2NChfX3U2NCB3KQ0KPiA+ID4NCj4gPiA+ICAgICAgIGFzbSAoIi5v
cHRpb24gcHVzaFxuIg0KPiA+ID4gICAgICAgICAgICAiLm9wdGlvbiBhcmNoLCt6YmJcbiINCj4g
PiA+IC0gICAgICAgICAgImNwb3AgJTAsICUwXG4iDQo+ID4gPiArICAgICAgICAgICJjcG9wICUw
LCAlMVxuIg0KPiA+ID4gICAgICAgICAgICAiLm9wdGlvbiBwb3BcbiINCj4gPiA+IC0gICAgICAg
ICAgOiAiK3IiICh3KSA6IDopOw0KPiA+ID4gKyAgICAgICAgICA6ICI9ciIgKHcpIDogInIiICh3
KSA6KTsNCj4gPiA+DQo+ID4gPiAgICAgICByZXR1cm4gdzsNCj4gPiA+DQo+ID4gPiAtLQ0KPiA+
ID4gMi4zNC4xDQo+ID4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
