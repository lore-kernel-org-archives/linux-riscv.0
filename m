Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C544ECD1288
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2024 16:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmpD9JniQCfS6d9j5pQzWTtEGf0pKiSUly6co2hgioU=; b=mb6jvDtcYBtE2z
	p/dcOXbDoKdvK3vr3HUkNIbYjktEjuhDNwV65/Wkbof8g3iWTiHReFmZVHfKGVYGLLDov9GTx5GLA
	y6Lpz8aZps4vQAVWcFA1f99xflvq1FBa/ZmEUQXFx0Np5+dGM9SEbiSaL9CagKOTc1mImlsG3PtzB
	HtoSVKOAbhzq4j9xl1hINislZHcItg9VwGM68j3m4sSxyr9X6stFsZBfatujhAzla3tLVJLW/xXil
	OyA0gX7iSDosaLhyHIO+utbCd/gJnwkzFaTIcfr+UYag5aXP87wlCfKgV63wlFv1gJwoWR0ryceRB
	cvt8znsQuS/g0S8NRq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrKys-00000008Owi-0C4c;
	Mon, 01 Apr 2024 16:57:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrKyq-00000008OvT-2pWM
	for linux-riscv@bombadil.infradead.org;
	Mon, 01 Apr 2024 16:57:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=a702SssXQ/FTdJU4yVp2ADGsa7Z9qQcd1JSSOPAmZB8=; b=okS1sZ/EPmXzavTrmbOh8ahAPj
	2wVY1iF4g3Z/Ld0mPLKVB8n04k8FH/IKMAWd2woMS/tYCNH5XfbmCp1DAS1SR/jy5hbP8Yn3XlVWL
	DUN/WmLiiGGiETNgQOzs/oebvItT0+VAH4mPalfu2M+xZGdR6V9T7hCWmlR/G8cuQkKDZBKbNdk+M
	+FVmW6cAGAz9tbkmkEy2muVEEcGtDUe+GuU0688HPt+wNjDne3b435v0mm/AvblUlWxN9NsvfPdHs
	Lg6ZexEiHZ5lMfKVF1IPBIHb1jY+O8gKpOtFuD9Qd10TvIABWl895BJAPUWBMucw4jIsPsx0xf3dk
	ro1JkqLg==;
Received: from mgamail.intel.com ([192.198.163.14])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrKyl-000000012OU-0sL7
	for linux-riscv@lists.infradead.org;
	Mon, 01 Apr 2024 16:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711990671; x=1743526671;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=a702SssXQ/FTdJU4yVp2ADGsa7Z9qQcd1JSSOPAmZB8=;
  b=miaWx0BdlDqDWmC/nf/hP8HaR2KulOIUZ6IrPSshCEc3jH2lmL0rM/Zj
   KXXRNgvDyUnA9h+8WIrkdjZE6nsmsVlbbROj/4EPV/NgVzyw38LEB8c2r
   tUeArjWsO4jeYvJrKn/D8q5npbC0TM6/I6ngtuB/la7/75fmI65WAYs8q
   WJnJWL7SrXVPNtrTdPnnKefOsNZflWhIM+6Ix664zCIKywX7yUfqrIQtL
   vafBEoqfGGLqp96BSzx6NJ5WiRCb/0otjJ/zR2BjZv8aLbsaZ7E9ExMac
   ZVDx95kB/jrD9CLGNAjMY+EV0UeIduKDvKkX7u8VDfRCBahJsY7hOQzY8
   A==;
X-CSE-ConnectionGUID: H8hNPCCDTy+tk5uNuJ5GPA==
X-CSE-MsgGUID: d+ZbxFTyThiPxyAYPzHpNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7336882"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="7336882"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 09:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="17809480"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Apr 2024 09:57:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 09:57:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 09:57:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 09:57:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkQO+VbZucTYRAlb6Qbwy0H4PWU8ItottPU65RNcw74K4oQ+94bTLsJtGgJJlsCaChfzn33R6wwKhXVuyeMWkumIN6vl4ZVdCqQud72L5wkIfz02I71PBZKZydcUIn6G8jIeCU9RdJX0CDBeEYiU7v+DDIsXhTWaNZNDd54AMyx8QIOguVtXtdexUClBFsWwLsUww443ZZxbKcoeStH+RjcyGYHLozFwhL1N4Cbgi8PsKx7g7flTML4OiFUkx0AGKtRhV0N8bcYm6CsOloNS3KRq1jOnn3q6DYstNpsKrfAgdv6Y+gARs+z8OpMkbpYRPbOAl9/1IfYqTiIQW5JOZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a702SssXQ/FTdJU4yVp2ADGsa7Z9qQcd1JSSOPAmZB8=;
 b=MMr2XhF+7EJ1PTp4z84Y2+lXva9lTGz8UEoSJU/oB1OZKfT5BLPOfgENdEG4pe+ay/P42VMA3ALO3EpFqOBXFggyPcb2KdE4SB3ZpdL9MqJnJ6mqoQqDD0McPYndEZvwWd8vVmCXE3i+SIqkUNyzJQpn/x+PaEFuPp2bdT6uWP8izmrUVQtbibfHtf/DKmljaVPQ6BMPfQrX/6bhz8y7XieywvltG5+qFSeir7kw8FqmWfijVYL5u8mH7lfjESHAxBJwaUqnhNbDy/SDGpOV1NEbvzIg6AKG1T1FUqZl6fqTzdR+TWuIE2KRgJj7AbZJZgbcSEykGo8bxq/ibeftVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by PH8PR11MB8288.namprd11.prod.outlook.com (2603:10b6:510:1c8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Mon, 1 Apr
 2024 16:57:30 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::fca9:7c00:b6d0:1d62]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::fca9:7c00:b6d0:1d62%5]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 16:57:30 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Haibo Xu <xiaobo55x@gmail.com>, Sunil V L <sunilvl@ventanamicro.com>
CC: "Xu, Haibo1" <haibo1.xu@intel.com>, "ajones@ventanamicro.com"
	<ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, "Moore, Robert"
	<robert.moore@intel.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren
	<guoren@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, Greentime Hu
	<greentime.hu@sifive.com>, Charlie Jenkins <charlie@rivosinc.com>, "Sami
 Tolvanen" <samitolvanen@google.com>, Zong Li <zong.li@sifive.com>, "Jisheng
 Zhang" <jszhang@kernel.org>, Baoquan He <bhe@redhat.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Chen Jiahao <chenjiahao16@huawei.com>, "Arnd
 Bergmann" <arnd@arndb.de>, James Morse <james.morse@arm.com>, "Russell King
 (Oracle)" <rmk+kernel@armlinux.org.uk>, Evan Green <evan@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>, Marc Zyngier <maz@kernel.org>,
	Anup Patel <apatel@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>,
	Yuntao Wang <ytcoode@gmail.com>, "Schofield, Alison"
	<alison.schofield@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	"Williams, Dan J" <dan.j.williams@intel.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"acpica-devel@lists.linux.dev" <acpica-devel@lists.linux.dev>
Subject: RE: [PATCH v2 6/6] ACPI: RISCV: Enable ACPI based NUMA
Thread-Topic: [PATCH v2 6/6] ACPI: RISCV: Enable ACPI based NUMA
Thread-Index: AQHacGqJQBWRJiNhuUyCbQKEpDrv+bFTKNEAgAAMuICAAJRPQA==
Date: Mon, 1 Apr 2024 16:57:30 +0000
Message-ID: <SJ1PR11MB6083B43290D216B1568642B0FC3F2@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <cover.1709780590.git.haibo1.xu@intel.com>
 <01cb5780041565784d459cd94a5c4f55eaa87739.1709780590.git.haibo1.xu@intel.com>
 <Zgpf0rqUSEZcSiAV@sunil-laptop>
 <CAJve8om9-cTtYKLmB0R=6Wwh5KQ9z+16AFR-tuUkJhJjbn0UEA@mail.gmail.com>
In-Reply-To: <CAJve8om9-cTtYKLmB0R=6Wwh5KQ9z+16AFR-tuUkJhJjbn0UEA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|PH8PR11MB8288:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 72tV3NX2AD6uemawyj46pdW1evTCN5oa4DOOosr/qu2meGUQB/nUQ5YXhDIEYX8XVGO+bX9+MaomugAF0o9Vf5gKrFcPjS+nLJsFgJIQsrEKbNMMZusEsP07X+DQ5mw8HCqBn1ZWUotc4Wxz0Pr0ozxLI7K7n73CQ4NaA2oh1l/qmYhN/Wy9/WNHURwWsYI/qUKjgyn6wzzLcMRELEJRp5jP7Wt1P4QOJz88QhR0gh6QpWOEQiLD9cAvt+4Fd1HlRm61kUSaI8dK6pItqSTjMop18OTPes1RfRNC/Q/vYBHi4NyLMExrvHf4CNZ+GO58qRRXYiEMo7BQ+8DTgsYR6rTcOOcGhT86AJ5gK2hvw0kW+aIN4dBWbssrz3EYCNMydZjVYJDwOF+yj4XVIQLrW9VpNwhWzCe5ZE4cQNpmxW6W/EniPr6wn3BHhQSL1bS1z5ckGqQyL/NKxsadae88ku2bKZjHv/A30dLulbOzzG5KPkLdV8+KiGvJDHV/KDGuong+qn86lKCCQeBom/DUfwxops78Ufl6tKAc6d8dL1SIOk07BxkAtp/KHk4ctigzegvX9cTWwAPAc9Y7VZdoCL4/K/O7/wH32rVt7HKt8q2lGvPdyJFaDChgN/MuhB7VLNjgViRB9ytU7hrCbKTlC/aBVBO+feFsQG7sfcWEcsQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WmdISzBNYUpWTXoxbjlkc1B6UTlCQVVVV3I4MG9RYWpQbWpPempwbWpudUJN?=
 =?utf-8?B?UGZTZk5uU1hXZFVUOUdadzBwTzRDNkF5VW4wTXlZVlJPbmdwQ05WZERpWTYv?=
 =?utf-8?B?eGZFYk5oZmIvbFJYRTdMdWYxQldnUkZ3bzkzc0xmUHJOQ0UwVzZzd2U0QVdQ?=
 =?utf-8?B?SkZ5N29LN1R2TDVUN2lPZ2dlMUUvQnUxNmplbEFwWkdQMjRFY2NUQnJKOUJX?=
 =?utf-8?B?WVZnSkhXRjZ3emhOemhhZUovYWxIZzJzWUZNNEVaY3Fqb1Jrb0NEV3VoMDlT?=
 =?utf-8?B?YU1pVHFwQjg1ZHNVdkUyK0J4ejN4L1dWaWM4TlJaQ1NXYnUrTXoyeER5VjRV?=
 =?utf-8?B?bzFUS0FjSnFRVEEwdFhMaHRBVHhWNStMUjNMZTNaTktaMWFNbmtuR0pEbUV5?=
 =?utf-8?B?QWM5KzVEdUZTdnRVYVVsb0docnRZN0V2WEFtWWVXMFp6eFo4c0wwZWdBQlMv?=
 =?utf-8?B?aEYwM00xMzhEKzY4ZXkrVTl1U1BjU3NDYm9sQ21nU2RoVGE4Z05zS3ZvUXIy?=
 =?utf-8?B?ZklKeHVuV0VFNTZLRjR4NS9xNGh2aXozVTAxOVlpbkFDNjM2d2xjdC9qNldU?=
 =?utf-8?B?QlVOK2F4bXpPN1Q1bkFlTHNkZnNUVFpMNHpIZ2I4SC9QQjVXUmZtWXZNRmdi?=
 =?utf-8?B?WVdNcXhvRHpFSUo4M2Jxak1RandmR251dVhUcXd6MmRBRklaN0l5cHFDSlVm?=
 =?utf-8?B?Z3RBRjVOejR0T0xFVVBlUVF6Qm5qWGpMNCs3NmtoTGJhVkNaaCtsYzFDVng4?=
 =?utf-8?B?a0dqcFZNME1XeWVBdzRuZjVnUTlZMmR4SkVYdnVPdERzbWx5OFF1NnhxWmh5?=
 =?utf-8?B?TFZkQVhLazNQK1dlSHEyQ09lWmdGdUIzT0YwK0ZsWVlVeWRKblpZME41T29a?=
 =?utf-8?B?RVR3SkZJcTV2V09VcDRoMmtqK0UvaFROVE5XMUVyZDE5eXZhMFpWSC8rcHVC?=
 =?utf-8?B?VDBvUmM4RkJsOEV5RC9iajNsamM3Nm1zUGN5ZTRqak5zemhzOElVQWhUUUsy?=
 =?utf-8?B?VmQyMmJZNkozK2hLcjRoUzRSVlYzVTM3YVRtMjVtYW9obzFQN3BrTzdyK01J?=
 =?utf-8?B?TCthbEV2K2ZjNTkwSWtFM3lwRUFwVkZJeVhBc0s4MXJtbEZ1eHEyVjB3N0ZY?=
 =?utf-8?B?T2VoMmluSXF4TnM1U2FjWi9nWGk3a2ZRdFpscXFML3ZwYXNacUw5YUVBNUg2?=
 =?utf-8?B?RTJETVdHdXhtV0o1b0NnQTh5MHN3eDMxeUZoNTkzbUxJTk8rdjZlNmxOZmt3?=
 =?utf-8?B?MDVLb1A3TGFKVUM2VmRseHJPV01xWUtaMjFOSTRXQmxZKzFoNkkxNVlpYSsw?=
 =?utf-8?B?QVlCYVZFRnFjY3FMaEI5dG9ob3Y2QUtMVHRuMXBnYjAzOWFZa0tlV3p1RFF6?=
 =?utf-8?B?d2owdC9sR0drclYrZEdycFNRVTdSZVB2UkFUdTQxODNYbk5IM1dKaUY3cXVK?=
 =?utf-8?B?SExlVFpYd0VDc0EyM2ZsY29KSWN2UDFydnZad1NSNUVTcFh4NzUwTkI4TGwr?=
 =?utf-8?B?QjJmbmo5RFBiaFhoYmQ5Tm1RNTNRdFlpeHFCb0d4SXpCU1FyazhJTTJhQlA4?=
 =?utf-8?B?Sk5uTzhiTEN3YktLSFJabUc1Q2xzYWJvM3YvMGNudTQ3am8rZXdoaXlqWnZK?=
 =?utf-8?B?NTVuaEsrdGhoRzFtTWg5alJZUUR4d0E2aFBwQUk0bDRUSFp1T2RxQ3BiOHlM?=
 =?utf-8?B?eENuU2xRWitjTU5UU1RDWFZXOUVGZ3FSTVVGRENaMGtwWEhuM1JPVnhsNHpP?=
 =?utf-8?B?T2ZSREs0MmJlSEthazFwTHBtSVAxVVUxRURHRkZUMmI0OWVrVW9ZTTVEOWdN?=
 =?utf-8?B?SzdjamVWaU85bCtHQmNxMzdSakpyS0Z0N0l3WEI0K0oyMFQvYm1Xc3dQcWd3?=
 =?utf-8?B?c0ZvY1pjZjd2T3lMckZmMVhsbTd6QUJ6TmlPR2VpV2NLQmhtMkxGVDNha1E3?=
 =?utf-8?B?bzRBYXZlL0locmlEMVA5djNUWWNwV3Qva3g4dFFnblVDaDhlNm5RSmNFNEoy?=
 =?utf-8?B?U243MFR5S0hrUS9yMnE1NzJmZXcrRWRtZ1poRnhtVWZXV2pjam5JVkRiSXNL?=
 =?utf-8?B?WTlTK0xZazljaHl2TFY1Z0R3b3JzRVlFU1dheVVhVGNtc0hhZ2dqN1FuZzA1?=
 =?utf-8?Q?Md0UN1yAZkGdn/xgUUborpjyW?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0beb6b21-fe4e-47a5-719f-08dc526cd196
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2024 16:57:30.5652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bLj7dv8lVCdkizGlF6VPNH8T77E9G+ea1UJ2bTKdfJ7P5EY05qdZ6ZhXbGIhqr3ocByQ/q8h8Wj1ZawlIc3e+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8288
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_175751_783878_DDA3F849 
X-CRM114-Status: UNSURE (   8.50  )
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

>> If the firmware didn't provide the SRAT/SLIT on ACPI based systems, then
>> there will be a message "Failed to initialise from firmware" from
>> arch_acpi_numa_init(). This is not specific to RISC-V. But I am
>> wondering why should it be pr_info instead of pr_debug.
>>
>
> My understanding is maybe it just wants to expose explicit logs to
> avoid any potential bugs from FW or Kernel.

There are lots of ACPI enabled systems that aren't NUMA (single
socket servers, desktops, laptops). Making this "pr_info()" would just
add noise to the boot on all of those.

-Tony
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
