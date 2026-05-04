Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CE4CD3427
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 16:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OoZ5hSrLK6Cg0L/DiUEBc8MFXw4g990cPgY2BIBO4WY=; b=3j4Zto5i7wqeUV
	KYX+PpUX0nPTu/pVQAJ9+YsOJPv/h0up583VO56xZmonPOrxaCVmeGewj4YSa5QnoP4SE+erMOaVJ
	oTR1HqYS9aW/WP9FvskCuYn5oR1753AXpoOdBxEmtstuR34X0yYiCYjkF5oZSUVvvp6LCRQmqPl2C
	F/XXCPNxW7ZdChkPwvdot/5l75CukSZEP3pM71ubwyuBF4OA8XS2YK3RMMONHqQ1t67eBkiPwl8y5
	B9pWq8e5DbOhqGCS7ccOwFrECEzi6zJCDYj4jYwXh2wZk1Wg+8TZBXZSwNTomGsg90F0hUiMfcNsa
	gEkCekU7OzVE3KS/6Z5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJvoV-0000000Df72-43fV;
	Mon, 04 May 2026 16:06:31 +0000
Received: from mail-northcentralusazolkn190120002.outbound.protection.outlook.com ([2a01:111:f403:d111::2] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJvoS-0000000Df5O-3rdu;
	Mon, 04 May 2026 16:06:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iD3B5JTACz7ekYPqRn7WHWMMBvKI09SYbtzc900pD2VEjo/QdOaASPqdp3J5Vh3SxyOMGCi9UioNSpdY+OUqBoNDs9Qv/YgU9XZ24SBdNH+xzJ1a7h+FDLnH9bFwIUajVfDJp+MIf7jTHPMcfx6zvAz5ldztfIeQaMWVlaBreOEr0OtWe2j1+/DgJYNS8wpoTXNkALSTQaA7TIrme8P2r9lVgBPTaX87lfl4xrZQEIbEcyyumI1qT7ahg7snMXaXXCwCJgkcokD00anefkrz7W6bU56YZuUslJuhNhxNbeqsK6Gb9DobduUb8T1HpdTAC4qbt7whXDoVT23/5jceAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XW3GD0BjWqdZHY14hpMkeiboBrR6eErhqBbX5IezatA=;
 b=cKevq7NyOUMbFraeOgOJ+B+ljWiAJnjyDgfl/+BMKm8PWhQHg2oYQC6ZqNV0fgT8sAOcccIy1ULvtomKcXnO4QctCUlPXy4oVfT1VVEZcXxJ0srlYAdsiRN2KDjqXCQA6YNzQQZdMjA8jp3WES/MBo2TBcpTO0MPJE6D8b+/FFxRe4i0wjyoCKpYNQTJ9MxSKhtMuHidcJ0ehh1ZfEpFaTZNCOPL9FQO9G2LOVwvBpctm41Qp3ZtuXR364Zq1JDN7A5q5mD4vC8O3J6+2rOaJJrz1/iEaKQT8t+5K5bCh1AfH6nsav1hUxHhVgE27yGOtiz7COZktNn60kUmpQNHOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XW3GD0BjWqdZHY14hpMkeiboBrR6eErhqBbX5IezatA=;
 b=rQyQuFLtmxKzMbOcmAgiE5kQpZY7TqY7g/H+oxzE9YOCCqyE53L+1+8Cj4ipLaeEAEhNFn6kJxmS8XdfQuXsTRDqKx6wG4EIAIjT6gb4GpDXtgKKS7GcC9m4bIYFJTQHF4KFfs4Nf9e9MprkJab9EcI1zz+jkUX4aJxkOKxVYhNYOVIXWpYYi93xPvwaf0qFWqMt3Chu1YaMDjUyp17Rh/x+8KzOAAgne/6jHxkFwZmrONT5fUETl2LbfNvhG137Hg8k77c7GJHPhhwHc+I9iBhl2U8HxTrEG7FT+SbZNOOGWi5i6kZeSpsKy+7sX76wYjgsM76JzUCC0YqJ89dc5A==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by DM4PR02MB9167.namprd02.prod.outlook.com (2603:10b6:8:10c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 16:06:21 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 16:06:20 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Naman Jain <namjain@linux.microsoft.com>, Michael Kelley
	<mhklinux@outlook.com>, "K . Y . Srinivasan" <kys@microsoft.com>, Haiyang
 Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
	<decui@microsoft.com>, Long Li <longli@microsoft.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, Arnd Bergmann
	<arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>
CC: Marc Zyngier <maz@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sascha Bischoff
	<sascha.bischoff@arm.com>, mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "vdso@mailbox.org" <vdso@mailbox.org>,
	"ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>
Subject: RE: [PATCH v2 07/15] arm64: hyperv: Add support for
 mshv_vtl_return_call
Thread-Topic: [PATCH v2 07/15] arm64: hyperv: Add support for
 mshv_vtl_return_call
Thread-Index: AQHc0x7Gd+InXWMHLEisx/6viGrEn7Xyae9QgANsyoCACELsMA==
Date: Mon, 4 May 2026 16:06:20 +0000
Message-ID: <SN6PR02MB4157B99838CE7498933B2382D4312@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
 <20260423124206.2410879-8-namjain@linux.microsoft.com>
 <SN6PR02MB4157C147A1B915F9B45D3B74D4362@SN6PR02MB4157.namprd02.prod.outlook.com>
 <516a4e65-3a4d-4e09-b445-28cb740b5653@linux.microsoft.com>
In-Reply-To: <516a4e65-3a4d-4e09-b445-28cb740b5653@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|DM4PR02MB9167:EE_
x-ms-office365-filtering-correlation-id: 71c02e07-c72e-4160-1deb-08dea9f714f2
x-microsoft-antispam: BCL:0;ARA:14566002|15080799012|37011999003|41001999006|8060799015|19110799012|8062599012|12121999013|461199028|13091999003|51005399006|16051099003|55001999006|19101099003|31061999003|440099028|3412199025|102099032|13041999003|40105399003|1710799026;
x-microsoft-antispam-message-info: =?utf-8?B?MzJDRGNKYi93dXJHdUdoSk5pMUp4cGRvTHJSLzZ1WnRnVEhVOHhwOXcvMkFD?=
 =?utf-8?B?UU9ud2pxMkUyWThhK0kvWnZIUW5RWUF4SVA5eWJZNGNEYVhiQ3pWVzh4bVlP?=
 =?utf-8?B?UEljaTE0T2pqR2J0aEYvUldEenpleHZGVUY0RTBheVNFOG1uUmR1OHJmMGU5?=
 =?utf-8?B?bVQwL0ErZzJNK29lekYzbXFudDBZaFVaMER1bHd0UGFQRC9rM1Nacms4UmZa?=
 =?utf-8?B?SGQxYUJEd1hzQWM3cEwrS2x0SzVmUnVpNnBwK0RYTGgzdFNqcXZITHNGTzhQ?=
 =?utf-8?B?OGljaDlGTTlFbmJYRDYzbUtiaXBYK0FOWUdrVy9SbmIwTjZPem9HaHUxU1Fh?=
 =?utf-8?B?SFZwRlBGdXNPRlI2Z0VQK0k4U2xUSmF4ajZZMi9laXA1OGJhVW0zR3psMVY3?=
 =?utf-8?B?cmVKbzlpUUJKZ0VacTRROU82Z201RldkMFc1eEdZdFhVK0xLOEdmSXdkOGs3?=
 =?utf-8?B?WlAxUzNrU3RVT2xWMmsrT0RpL29zcXVqYkZJOVRUSEsvcnFtVkh2SzY0bWVl?=
 =?utf-8?B?Q3JlRmlKczU2bmJXZG9DbTZOREk1cWpFL0dwVTJMTnQza0oyb1N5TTVEUmE5?=
 =?utf-8?B?OU8waFBHdVljM0IvZmFYOVQ1S3g4ZS8ycGYxc052ZWl5RlY5U3hXZ3pvNUdT?=
 =?utf-8?B?UXBOeloycEZqNFU5elcwL0hjYVVxV3pZQ1FXUDlIMXJ4VzJJS0cyZDl2SzBz?=
 =?utf-8?B?SlROWmlaV2UySmczUll3c3FHVTBnY0RDYmNsa1ZUYXZUK09hekNReWN0b2Ex?=
 =?utf-8?B?K2hJMllBSXdkZk11RUxoK01PTG1JZXNob3ZZNnZ5RnJ3MWFSQTc0QjVNSER2?=
 =?utf-8?B?OHV4SGlCcWhiaUdtSlcyZmw3amlSZmJ4YXFSWTJiUk05VTMrM0xEV3ZISlpI?=
 =?utf-8?B?S0t1NGh4SEphUmx5eDlXcllSR3V3cTBTWnYxWXJncWxnRkhMY1J6RENCaTdu?=
 =?utf-8?B?Y2t6RWFubmV0Yy90aEhNOHVRcTdWQ1JPQXF3YlQvYVpaczRVd3dkcnVEWmZq?=
 =?utf-8?B?YWdqbzNxVWUwRXZ2VlpyVTRjVHdkN25aMHBrdVpDR2hnM3duUmhFQlR5K3hF?=
 =?utf-8?B?Z0EvTS9nMU1kZWZCWXZOSlVCb2lkeko4bURNZmlxcFpvQzVlU1Z2QW5QWTNm?=
 =?utf-8?B?aWtKVjV2VjQzV2I3MFd1VTNsaW5IbFZhWWlYU0lpOU1IalFoT0JyamhVam43?=
 =?utf-8?B?N2lqSXFtbFVRS09qQVRheWM4cEpLb1JhK0puSkgrOE0vc0RXVjgxWTZpK09j?=
 =?utf-8?B?eWRYZG9kdGYyMVR5OWVvOXdvditLZEVVaGhJUlpacGFybkYraXBVTVcyVERt?=
 =?utf-8?B?Q1RwVmhjMjZUTEw4WlFlNXNnVzNWK09NODFxYUtqd2owU1VWblZaU1Y0SUU0?=
 =?utf-8?B?V0t3UlVCSE5FT3pSSW1kYVpCcVo0YW9OMVZJYlJpdS80V0RMcXd2Y1dHZGdH?=
 =?utf-8?B?ZlJKazNBRitvYjBjR0FEMmlkbHdzY3RFWXZ2YlJ5bEhQbnVjV3BQQUJ2a28x?=
 =?utf-8?B?WW8yQ1VzZm5XaWppa0NKSE81OWwwUlN5ZU5iSjg1cGpEYVRYeUNNVU9qaVJy?=
 =?utf-8?Q?/sAtEPbvAFO3eTfN/7eO5avgiyj651weJmuta2/wEJiLRC?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHgxWW4xMkgwR1ZQNUVHamR5THVyNkZkYXc5amdRaWhCcU1na3NGbHA1R3hO?=
 =?utf-8?B?TkJFQ3dxQmRWRU0xYVRwRHltdWFmdWxtVUVMV1lpMWlYenNCdGtNU21PUWRZ?=
 =?utf-8?B?Qy85MEs2UFhEVHliRWt4cUtPU1V0NmZxWjlrL2ptQndraHQwY1ZuMTlIY3ZM?=
 =?utf-8?B?WmFJbWV6blpFL2pzSnluNnJqTGVFRThsZkJDZCtJMFBGTE9aTWxjMGVNZExB?=
 =?utf-8?B?dE9Wb1hiREZXckdZTmN5YVZSdG5Bc2dDUUozeENZdWRpcGlsUDlIWG0yMm4z?=
 =?utf-8?B?Z1JZdk9Sc1VEc09VTVdYOVJUNXhWakxSSXN6TzI3VEg5VkU4VDU1SkNmUEJJ?=
 =?utf-8?B?RHNiL0hIdDljQi9PQ0V2ZkREdjRLK0hOa3d1VHhhalNQSDJMMmJPdjg1alU5?=
 =?utf-8?B?dE1HclFRYTFURXBENVpMd05wSUZNRjlCNGxVaEtlZDdBczBuaHZaS2Zaell3?=
 =?utf-8?B?dWtDWHlvWUhUT0UxN2YzZEJGMnJRWjNzc0tuZkpYV3JSWFF4dC9mRUlSSUNH?=
 =?utf-8?B?UkhYN0VBU1ZzcXNTc2c5QXIxY2sybUU4VGlVK3VmNGVONmtKVEYyZkRLMTJ6?=
 =?utf-8?B?V09TS1Y2VnlhMHU4cjB4ZU44SC82NmFZVmRrYi8veUZub1hyeVcvdDhKSmlG?=
 =?utf-8?B?MlRNbnRXQjNiODBkNlFPeit6enhpNGlYa2NuWkVaMnVoK0VVcU5EUUdzUjg4?=
 =?utf-8?B?cFNuZUd3QzNLK29vUFZ1QVkwOXFnSmpMc2RDZDUvUkdEcTllcGEvaHc0WmJo?=
 =?utf-8?B?VXdlS09mTFFGZlpTZUc0R09sdm5FSWVwaXpBR1hhR3krVUVRWFVDZlZrbG1Y?=
 =?utf-8?B?YkpieTBRK1B2U2VSVVpVMzByYnlXOE8vRkh0blRyTURGRjVnYTlMcDNhdlhP?=
 =?utf-8?B?UTdOeEhnWFhGLzdXdGx0V1dXckpNLy9iMnRlVDR3cVVpd0UzZk9vTllqalRS?=
 =?utf-8?B?UDlxRlQybHdxWUQ5QXQ2b2NEWjJuY1lIb3RmVFBORDFnK3FaQ3luZG8vZlJo?=
 =?utf-8?B?aVIyMWxUb1ZwK2ZteW5PREdrbjlJS1FMRWg4RWsyMm5Vdk1lbmNoVFpoQ0Js?=
 =?utf-8?B?OGZHVEVtN09LMzJNbXg2YkZHK25pLysvTytSbEZ5Tk9vaEdYdkJvaVM5RlIy?=
 =?utf-8?B?NVg4MjVMTzJPdG01NTd1VWg4K2laTGJSZ1hicnRyaVJhanhGOCt3czdnUXZs?=
 =?utf-8?B?YnhLMCtXbEpRN09ITnlubFNwaTJNV1B3UFFDK2lNNFR3bk9KbEtjVWZXRUNh?=
 =?utf-8?B?NS9yTFFaVE5NSXpES01jTVJNU2l6VS9hMjg2SlltTlh6a1cxaGI3TzhIdmo3?=
 =?utf-8?B?bHJKM242M050VnMyaTMvUTB5RFBlS0FXc3NRemJVVmF2MERXWHFEYnVHN0tx?=
 =?utf-8?B?NEJ0UUwrWXUwSmVUa3lJOFo5YU1vVTI0RFNkWFZkcVVxVHdsZndpYTdqM3Jj?=
 =?utf-8?B?LzlIMDlSdkZKRlI4V1JGVHhMQXlwTTFDWGM3Y05RZE5tRFRhR01WRUJwaUpF?=
 =?utf-8?B?bWNSK0kxQ1cvelhkVUtHR3k0NzRuZjlHMk5xZG00d3dyRTU2ejFFOE0wbWdQ?=
 =?utf-8?B?c1I1WndsOW9IeXoyZUxTMTBvejEzamxjNndjNldzQ3FjdVo2dllhV21sMXl4?=
 =?utf-8?B?MURCVWFKTG05TnlzcHFCd042U1V0TWtqT2lWMTk4d0JRRWxRekRySWhtMzU4?=
 =?utf-8?B?LzdIU2pyS21iTFUxMGg1TERKSHBjQzFiK2tCc0doRzBDbEEvQnNxVDA2LzVZ?=
 =?utf-8?B?VW9BMzRQZVFVWXFzT084UVZXYitpNm82Zm83ejVTaWJGV25RRUc5ZEVOVllF?=
 =?utf-8?Q?OkwBgjzmTxe6pCCZdF04Fxr/E96u5Fu3D/VKU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c02e07-c72e-4160-1deb-08dea9f714f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2026 16:06:20.6537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR02MB9167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_090629_043268_24D333F9 
X-CRM114-Status: GOOD (  24.66  )
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

From: Naman Jain <namjain@linux.microsoft.com> Sent: Wednesday, April 29, 2026 2:57 AM
> 
> On 4/27/2026 11:08 AM, Michael Kelley wrote:
> > From: Naman Jain <namjain@linux.microsoft.com> Sent: Thursday, April 23, 2026 5:42 AM
> >>

[snip]

> >> diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
> >> index 08278547b84c..b4d80c9a673a 100644
> >> --- a/arch/x86/include/asm/mshyperv.h
> >> +++ b/arch/x86/include/asm/mshyperv.h
> >> @@ -286,7 +286,6 @@ struct mshv_vtl_cpu_context {
> >>   #ifdef CONFIG_HYPERV_VTL_MODE
> >>   void __init hv_vtl_init_platform(void);
> >>   int __init hv_vtl_early_init(void);
> >> -void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
> >>   void mshv_vtl_return_call_init(u64 vtl_return_offset);
> >>   void mshv_vtl_return_hypercall(void);
> >>   void __mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
> >> @@ -294,7 +293,6 @@ int hv_vtl_get_set_reg(struct hv_register_assoc *regs, bool set, bool shared);
> >>   #else
> >>   static inline void __init hv_vtl_init_platform(void) {}
> >>   static inline int __init hv_vtl_early_init(void) { return 0; }
> >> -static inline void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0) {}
> >>   static inline void mshv_vtl_return_call_init(u64 vtl_return_offset) {}
> >>   static inline void mshv_vtl_return_hypercall(void) {}
> >>   static inline void __mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0) {}
> >> diff --git a/drivers/hv/mshv_vtl.h b/drivers/hv/mshv_vtl.h
> >> index a6eea52f7aa2..103f07371f3f 100644
> >> --- a/drivers/hv/mshv_vtl.h
> >> +++ b/drivers/hv/mshv_vtl.h
> >> @@ -22,4 +22,7 @@ struct mshv_vtl_run {
> >>   	char vtl_ret_actions[MSHV_MAX_RUN_MSG_SIZE];
> >>   };
> >>
> >> +static_assert(sizeof(struct mshv_vtl_cpu_context) <= 1024,
> >> +	      "struct mshv_vtl_cpu_context exceeds reserved space in struct mshv_vtl_run");
> >> +
> >>   #endif /* _MSHV_VTL_H */
> >> diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
> >> index db183c8cfb95..8cdf2a9fbdfb 100644
> >> --- a/include/asm-generic/mshyperv.h
> >> +++ b/include/asm-generic/mshyperv.h
> >> @@ -396,8 +396,10 @@ static inline int hv_deposit_memory(u64 partition_id, u64 status)
> >>
> >>   #if IS_ENABLED(CONFIG_HYPERV_VTL_MODE)
> >>   u8 __init get_vtl(void);
> >> +void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
> >>   #else
> >>   static inline u8 get_vtl(void) { return 0; }
> >> +static inline void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0) {}
> >
> > Is this stub needed? Maybe I missed something, but it looks to me like none
> > of the code that calls this gets built unless CONFIG_HYPERV_VTL_MODE is set.
> > See further comments about stubs in Patch 8 of this series.
> >
> 
> Config dependencies would handle such cases, and this is not required. I
> saw similar stubs added in the code, so I thought this is a norm that
> should be followed, and not rely on config dependencies.
> I can remove it.
> 

Others might disagree with me, but I don't think it's the norm to add
stubs when they aren't truly needed. As you can see from some of my
other comments, I look for ways to eliminate stubs. Stubs are indicative
of a boundary between separately built components, and I generally
try to minimize the surface area of such boundaries. A large surface area
often means that the overall design could be improved by re-thinking
which code goes with which component.

Michael
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
