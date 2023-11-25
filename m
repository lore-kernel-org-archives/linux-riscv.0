Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D0AC61DF7
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Nov 2023 06:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8hhOoCvCTAjFsmRzc3keWdbgEFrsSDLs8Horwpky//k=; b=ultPhkcIm/9c7u
	Bzo4rKfvjmxRL0Ku+Jgpv8kOTz/xzwK4Iv52s4JS/u6yL7Mo6mk73nJdeYa9xJ/RYENyfTrBAPNbH
	KEZo9mBERxxaMgkM3Ruk01CuT6F4ZeOTmprdbA0Siy5Jd7nGClE2lKEaLYycjxVNBYWuXjy69XDRB
	wKLb/0A2B7qk639mGx8B2JqFv4CxpvpfrCxGx5ML7yi8DGlk7ylAi0R7BWwtnHiWzPU6oqNUrLhFD
	9pGGtAfMXnveq/uk6wewos/8OxlkEzlD8nZPP8Qsl9X4J+aozur5ci55zRFSfdR+mJzhe7VjYqnX/
	Gao6/jln0tdfxwyXgkmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6mJS-008hVL-0W;
	Sat, 25 Nov 2023 06:38:46 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6mJO-008hUi-15
	for linux-riscv@lists.infradead.org;
	Sat, 25 Nov 2023 06:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700894322; x=1732430322;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IXFBoxFXBtMc80h1d6/q+oeMzCcUDVVAQBDgoO/3dy0=;
  b=Xnmj7IxaGYMkubI6esUysqVMkm27sRrU3iIKwfO+6lzVB55M6Y0M69XR
   mdNxPTlVb4/3gmvPgYRZ5PJIn401Bn9D8DEqM3zQryd2FTYFvPO2VQQ+3
   kyQfYLyBRaeMBdalw/KwpzYsGommcDoFhRFWe5zm255VZROpRpr+JdzmN
   jeoYeEgV/9Vy7j4pFZ+uzA2gRwxDzPvxg9vC4V2ZMp3Od56MTA+lrKzd0
   IfhU15/fY8o66UQFtsV701fiqblCcad7yncAja8PM1bS+SWEFMjNRN8uC
   jlm+Tu0xDlRylXAj+G/C13H7S8beZE0MvWL2zaBVBjwvCyGUcmSLE5gtP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="5728754"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="5728754"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 22:38:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="911615192"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="911615192"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Nov 2023 22:38:37 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 24 Nov 2023 22:38:37 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 24 Nov 2023 22:38:37 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 24 Nov 2023 22:38:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOwiui/XXVKq5Oa73Ow/wYDrqI5Ga6F7mjC2JWWKgTo/6E0mlCJIT5j21RlonUyxPcQ3XJ1dK575zx48YputiHJxk5UFNSJZCO/KKfSLqfZPY/TmcZOSkxR/dJNXvVcUosX00ocQnhHogZVZoK/dn71HsIOFqKOWZD1R9eFSXQ7l1uR4jgd4DopglMnsnPHy941YslZit4ufqKjOkom5HGbJluGQ9yxArV1VmNtQvC2NrU5gnXxiXbeiK5mfX385Ug2wSVcFBlyDQJ+/KponKHR5hoi/qFqwn1gpTaaXsLDZqOa6ccIHbJWLt8RIBArCW6Hb9kkE4tKDoijPpRVTbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXFBoxFXBtMc80h1d6/q+oeMzCcUDVVAQBDgoO/3dy0=;
 b=bv07C2+DjJE7gVZd8Y4ydwb52hsqmVesDRA3DGzG6sdWgGFmrn6mG5i6OSDeipyAOORkUCgo4SHjK9oY0Y0R87XSgOLUzNC3XlKQueCGwLcj5un4QLSJu6TZRnTZV852Djbt843DAOi3VsdMT8D8I8ygd/iq5N3OcdmCM75zbEgqdxAw8YrcHYPJR20IoQyMB/aDUK5dRZEkEHxl007/WKoEXbK+FdrrDUVtLYdzccwXiURpyhi0oNgAS8kNNxHC4BRu6qHxFj8PMKsp7jrnoNtn/sWkhVvwjH8N7fWUC8LHTEXWDNbXyx+r63tA35lk48nmeZbSCTEsGvQ1YtPXHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM4PR11MB6264.namprd11.prod.outlook.com (2603:10b6:8:a5::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.24; Sat, 25 Nov 2023 06:38:33 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.7025.022; Sat, 25 Nov 2023
 06:38:33 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>, David Laight <David.Laight@aculab.com>, "Evan
 Green" <evan@rivosinc.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v11 3/5] riscv: Add checksum header
Thread-Topic: [PATCH v11 3/5] riscv: Add checksum header
Thread-Index: AQHaGZz9ffOuNJ7RfECBYl54jfwiyrCKoFjw
Date: Sat, 25 Nov 2023 06:38:32 +0000
Message-ID: <DM8PR11MB575199D2693923C5A538457EB8BFA@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20231117-optimize_checksum-v11-0-7d9d954fe361@rivosinc.com>
 <20231117-optimize_checksum-v11-3-7d9d954fe361@rivosinc.com>
In-Reply-To: <20231117-optimize_checksum-v11-3-7d9d954fe361@rivosinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM4PR11MB6264:EE_
x-ms-office365-filtering-correlation-id: fa2f1691-e4c1-4654-40b9-08dbed8124de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rG6Y9FGqptfnuAsU9aghHOrBsCLPIb7b1RaP3fL+H7GsDozx50Mtk5CwtmxTfeABM/QVUdWO7HQujN/JuusAjpdPupZZtA5civ5zW6/LCCL/bxZkCEzsek3kd1wJiaaNvRk0SKgc2KXd6W8mgOols5xa3ICDmswf2exMHDDN6sfqrWjwr2iIpoaFmpWzfYC1oMTzFKtMY71tt8Lq6I/iv4kFmVoXJ8Ejk9c36IDnM4teNtw9AJctHvsVn0UoSe42IBHSO0mPIiCFTuIDDkgz7XYairECyQAipsf3qyWSjqbokh6tGMWUYpsw6FaOlTe8yEDl6Y4y2YmtgJgR0gn7C4FP6e5P/Xwxl7UpyEK/CAsbYV8NF0BtotJbNOZU3X5z94F7EzI3HnqVM9DvIpQoY2xwCfrZJCQWqe4oKTfab1XkhIkKWc+mMCQQ6phDZtdrd6S0x6R3FHZIfE48YA5wtVoXTEdtNVOCVxofB0lIK3y2DEfibK5PJhi7PjETQY5K0TjxC32ezWIW7f5wE0wCy/pkJWk5AvJsfAke1Fk6gdl9aQVANbyDX2ySurxmouP5UKQQS3ygMhu1JztX57kyVIvbpyMaxRPYBJM9hqbJUHFfe/kEK5xnwV5SpVQ1eSwc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(376002)(39860400002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(76116006)(66476007)(66446008)(64756008)(54906003)(316002)(52536014)(66556008)(66946007)(8936002)(8676002)(4326008)(478600001)(110136005)(7416002)(86362001)(5660300002)(2906002)(41300700001)(71200400001)(33656002)(122000001)(38100700002)(7696005)(6506007)(53546011)(9686003)(83380400001)(26005)(82960400001)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWNvZ2g4N3hPUFNUeHhIOC82Z2pNSHg0VW42dS9xRDdVd1BYbE9qdWliMlZI?=
 =?utf-8?B?RGdIem03S0g0ejZiZlhpcFZCRFEwcWc2U2hhMVdZQmlpTUxTMU1zYnBFc1NY?=
 =?utf-8?B?bDJ5VFRpTG1tVWo0RkM0VlYvZ2lhNXp0MVR2RUtnZTQzTGxaUzRCL25KUzRn?=
 =?utf-8?B?dU01ZkNSV0xVT2FadThocklFbTVQQmJpdGliOVhHU05tdE9henY0SlJZTUV2?=
 =?utf-8?B?bTlLQUVVWkY0Mm13aHNUZHp0V3NQMGxPYnJYQmI5ckpKNjhqOGF0U1Bla2Yz?=
 =?utf-8?B?RmIrYzlmZFpEaXdEM21oKzNvTWtHWlRFYk9NRDVCbXRLWXhheFdkYThQaXNE?=
 =?utf-8?B?b0xJWU9LK3NqOW1EandidktLUFYwaWd5SG8raVh4OW45LzdGeGZMZmdmdmFQ?=
 =?utf-8?B?REZic3kyZE8xcTdaTklMTVpsTmxGYk9PMGJodm5Od3cxSFcxT0k3UXRDeFhC?=
 =?utf-8?B?d3NwL04yVlNOUFNYOGZMR1dzS2cvREUzNWkramxEYnM1cFllMURwNUhrbW9N?=
 =?utf-8?B?VlNqcVo1bDM1QkJuQ2xXTVRIcGZXZ3JiaWxBM09OVC9waUZlanpEbnNWTjFD?=
 =?utf-8?B?cjFkMjN1b3RrVGUvWGRRNDB6bmhxbVJkdWJMR1VSWmVib2xmVmE5S3BGMWxx?=
 =?utf-8?B?MjhOZks1UlRvRUdJcmFrOG5Fdm5DdDdURWJlYzFHN0NCYmFDK2VzTmx0WXUy?=
 =?utf-8?B?dHY2R2hXK05OL3Z2UTVnTkVVZnFsajhDMjZqb1R2WTJzbUNFYlg5RUVNeit4?=
 =?utf-8?B?QldYTGpqajlDNExXbEJBQWJRL1JrcXAyajc1empYVGdlOUVheFJWNFo5Z21G?=
 =?utf-8?B?L3lFY0J3L2lmWVJOQk5lTGlwbTRZRmY5WURydGQ0Vk12VnNxZG5mUXlTSXVQ?=
 =?utf-8?B?TXJyNzB1eDNTVk83UEpOOUp6TnJKSGVWNTk1UEsyM0gwbGNvYldUR01nSXVp?=
 =?utf-8?B?d2xVSDhES3JLNmNrYnY4eEV5RVZ3OE1zdllQeUVTN1lWcEw3ODM1R1JjMmwv?=
 =?utf-8?B?NVpIWFJCVUNpL0NnUHlMcm1meXNYeEs3bHY4Q1pQeDVrU1FlL2l2b3c2MTR0?=
 =?utf-8?B?WnZ0TEdHbDFqWHloV1FwNVZEKzE2djJUWU9ZRlk0VHNkQW9wNG41Vk5SNnhP?=
 =?utf-8?B?cXQ1VGkzZFF1T1cxeU5HNmIxVXZnWnBrRndPZURVWEJFOXYxeS9LeStXdmFp?=
 =?utf-8?B?TDdwVWZrYTN2RldncTRzVStXdWM1YW10RDUvWThRYlVVRisyZXVCOWdHaVcy?=
 =?utf-8?B?K1RPbUlqOWhmSWdiRTNqeW5WY3BsTFZrQ2duNDRFaWVUYXpTTFhJclp6WVJX?=
 =?utf-8?B?WDA3bHd6dlBQNklHK3Vkd3RmbCtnUGx6d2JDOTNyUFFTQmlvU2l1eE5ONHRm?=
 =?utf-8?B?WXEyTlloWVFCTDRVdVRYQ05hUTNiTTVpeVRMb2hraVhuSkgzN0c2azZtdzNU?=
 =?utf-8?B?ekVQaVdXa3ZkeTllbTF6Y1c2T2VTUHlUSWJIRVoxZmNERjJyNHMyTlEwZmFI?=
 =?utf-8?B?d1d5UWcxaUVOd3NONTZKSmhvWlR3dm9nRWNEa0dDdWI2dGJ5K2s3WkZqSVFF?=
 =?utf-8?B?Nk5VQ243YXVvTjBKeGlFWk9oWDhZN09QVERNaVQ5NExpaWRXRTVmYXNDYmx1?=
 =?utf-8?B?QjJQZGRLV21QWi8rN3M3MUxhQjlKMnNjRnFNeGRNU1dFVlNKS05sZlRCQk9C?=
 =?utf-8?B?RkxidzI0VlFFcXE5bk53WVlvMWVzMkhZMWhEQ0pYL1E4eGQxN2ZIMXRuOFlI?=
 =?utf-8?B?Q3F5L0sxb2hXeDMreFJmdUxOYitwQlFEN3dqeUpiWGNWUVlUeWp6YlNERkxL?=
 =?utf-8?B?NjNXa2dqRkdFZzlZK3kzTFlRQUJOcEVxUU8zQjkwcko0dVdyNDRiSFhqRlZZ?=
 =?utf-8?B?WWE1V2VtMEJqNEdCZ2RybzZTRlNDTkRXL2ZTSzRtYWlEaVF2KzBkT1RxWGZC?=
 =?utf-8?B?YkFXZm5qUmh5Ty9OTzZrbHZoTGpORCt3K0I0NnNxeXd5WHhaL0l3K284U2Rm?=
 =?utf-8?B?cHM5SngwZitMaXNlUGc3QkIxRHpzRXdqMkZXZ2pGRW1VREdVMVQ3U1lxUkpL?=
 =?utf-8?B?RDVGa3JMSE9SajUyL1NVWDFaNWtZeFJKMEZ1cFdHSGxENnhCS2xRM3pkN0lX?=
 =?utf-8?Q?hQK9gVLH8ylbQvZDuY7rKvmNZ?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2f1691-e4c1-4654-40b9-08dbed8124de
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2023 06:38:32.7965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ks12yLkdYIJb2Z2UPhLWhte4aAcYTOYxzEOFH06xOU/YpJVbuZuixst5OLtMbhc52zmr7Bfqs4UdIZ/vXsbG7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6264
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_223842_507804_E5CDCFBB 
X-CRM114-Status: GOOD (  25.11  )
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
> From: Charlie Jenkins <charlie@rivosinc.com>
> Sent: Saturday, November 18, 2023 5:28 AM
> To: Charlie Jenkins <charlie@rivosinc.com>; Palmer Dabbelt
> <palmer@dabbelt.com>; Conor Dooley <conor@kernel.org>; Samuel Holland
> <samuel.holland@sifive.com>; David Laight <David.Laight@aculab.com>;
> Wang, Xiao W <xiao.w.wang@intel.com>; Evan Green <evan@rivosinc.com>;
> linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> arch@vger.kernel.org
> Cc: Paul Walmsley <paul.walmsley@sifive.com>; Albert Ou
> <aou@eecs.berkeley.edu>; Arnd Bergmann <arnd@arndb.de>; Conor Dooley
> <conor.dooley@microchip.com>
> Subject: [PATCH v11 3/5] riscv: Add checksum header
> 
> Provide checksum algorithms that have been designed to leverage riscv
> instructions such as rotate. In 64-bit, can take advantage of the larger
> register to avoid some overflow checking.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/checksum.h | 82
> +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/checksum.h
> b/arch/riscv/include/asm/checksum.h
> new file mode 100644
> index 000000000000..2fcf864186e7
> --- /dev/null
> +++ b/arch/riscv/include/asm/checksum.h
> @@ -0,0 +1,82 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Checksum routines
> + *
> + * Copyright (C) 2023 Rivos Inc.
> + */
> +#ifndef __ASM_RISCV_CHECKSUM_H
> +#define __ASM_RISCV_CHECKSUM_H
> +
> +#include <linux/in6.h>
> +#include <linux/uaccess.h>
> +
> +#define ip_fast_csum ip_fast_csum
> +
> +/* Define riscv versions of functions before importing asm-
> generic/checksum.h */
> +#include <asm-generic/checksum.h>
> +
> +/**
> + * Quickly compute an IP checksum with the assumption that IPv4 headers
> will
> + * always be in multiples of 32-bits, and have an ihl of at least 5.
> + *
> + * @ihl: the number of 32 bit segments and must be greater than or equal to
> 5.
> + * @iph: assumed to be word aligned given that NET_IP_ALIGN is set to 2 on
> + *  riscv, defining IP headers to be aligned.
> + */
> +static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
> +{
> +	unsigned long csum = 0;
> +	int pos = 0;
> +
> +	do {
> +		csum += ((const unsigned int *)iph)[pos];
> +		if (IS_ENABLED(CONFIG_32BIT))
> +			csum += csum < ((const unsigned int *)iph)[pos];
> +	} while (++pos < ihl);
> +
> +	/*
> +	 * ZBB only saves three instructions on 32-bit and five on 64-bit so not
> +	 * worth checking if supported without Alternatives.
> +	 */
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> +	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +		unsigned long fold_temp;
> +
> +		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> +					      RISCV_ISA_EXT_ZBB, 1)
> +		    :
> +		    :
> +		    :
> +		    : no_zbb);
> +
> +		if (IS_ENABLED(CONFIG_32BIT)) {
> +			asm(".option push				\n\
> +			.option arch,+zbb				\n\
> +				not	%[fold_temp], %[csum]
> 	\n\
> +				rori	%[csum], %[csum], 16		\n\
> +				sub	%[csum], %[fold_temp], %[csum]
> 	\n\
> +			.option pop"
> +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
> +		} else {
> +			asm(".option push				\n\
> +			.option arch,+zbb				\n\
> +				rori	%[fold_temp], %[csum], 32	\n\
> +				add	%[csum], %[fold_temp], %[csum]
> 	\n\
> +				srli	%[csum], %[csum], 32		\n\
> +				not	%[fold_temp], %[csum]
> 	\n\
> +				roriw	%[csum], %[csum], 16		\n\
> +				subw	%[csum], %[fold_temp], %[csum]
> 	\n\
> +			.option pop"
> +			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
> +		}
> +		return csum >> 16;
> +	}
> +no_zbb:
> +#ifndef CONFIG_32BIT
> +	csum += ror64(csum, 32);
> +	csum >>= 32;
> +#endif
> +	return csum_fold((__force __wsum)csum);
> +}
> +
> +#endif /* __ASM_RISCV_CHECKSUM_H */
> 
> --
> 2.34.1

Reviewed-by: Xiao Wang <xiao.w.wang@intel.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
