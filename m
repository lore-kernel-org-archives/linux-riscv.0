Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1DBFF885A
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 16:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1kkn4JR4nHa5DnsnVxdrd/MI/CvBRQwI4zOthm1MBjE=; b=jKLByRDeR83X6u
	iVU0KnyXX2n1XviGrHO6UFfaFucxZFoKN9Hbx4lS5l2+22TI+aTTz3yPrFyc7zKcao1jb1Juo58Tn
	ccVBBBxmhKQ9Tf7t2OdkBGLfLUYQxKPsdaIq1jy6ofrV9FzY86Bz7ioqzopiltGQHHoHx/US0UCtb
	ORbnud7NpfHuP1ENZKYgq9h4YAJwgU3s2Ql+UF6Rt//w+DWeNUDMsvMI3tCFIRZN03whhcwGa9jOU
	PGTBa8AlXO/RBTsmVRXk9MsGdmwUUhMX+EORXgb1QZzpuQT9Xx08K2qFhtta32+iWrbEza+8rmqes
	Tkr3RnnH/X/f1RhHToLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJvoO-0000000Df3v-0wKV;
	Mon, 04 May 2026 16:06:24 +0000
Received: from mail-northcentralusazolkn19010016.outbound.protection.outlook.com ([52.103.20.16] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJvoL-0000000Df2X-1ol8;
	Mon, 04 May 2026 16:06:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVQdgXzkwyKwN9E9uYrjNXC2obHnp5TAbUb4UroaqngU2GSSDIztouFNfG65XShVMAZneHIeIWn4eJbsiDdaY85Zz6dZKwzenSFttEvdCiIaV1GRnFX3jd6I3dflw6V+8xEzB2Z2a93AXh1AeQ7qxnKWT5zdLMSdPFMqZRIdYM2YTlimHpHf6zYgZrJ8OkvHo+tcgaAeTVzdUImur/GApsMI0RaE0tcqpze+Vr7iWPq8oLIdp4HdxPaEZ8xwsZc+5Xt0SsW6Qaf8qvijwF3OoiydiLwunl5EjJosu21ANgZov1grlQ2WO3lWUN491L2mYDTcpI9WBtpNqiL9kjvOwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lMtkjlHN8ZcxffhICAz30pLEH/WiWvcqYPmcbJ71lw=;
 b=I0HkrWGtuypKliu/77tz/h6UGcZwCJ6G+HMDbwK93tJzkFCnPto1ht2PsdcVuhtwNb+MfJLqRzDwJCR2SPEnEvvRRnocnN1NkRmufpYxfWjL43jMl4k2SNf7rP4tRnhzVAoHmdZ3sv8yi1vkZ14TD+vY03p/m9w1QlTCmAFUlv16V6oBA0ozgHsmeZwXSeu2M3q7p9BUUpFgPH6A5eZbWA8FzsgDjIRWl1/y3Of+oNsinQYNyN0SRa1LE44924rVGu3L60Xe2CzWjJojrLHBnoTOOs6IKexxGB+l6/dMtITeelmNGEvUEvAWUNzTfC0oOTYN+WULi1lyDSUrCeI2Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lMtkjlHN8ZcxffhICAz30pLEH/WiWvcqYPmcbJ71lw=;
 b=EFSmVmSJO+2R3WakBdLBiAHA+BiOlF5co8ADfMOehFJhXv6QaUrBMtKArG7tO1NBpemVu5Mv18XB2yr/RL42IHuc+axNxhK7u9UUjlCbe/6OUYYQPmAuvLZqBZoWeWiirM+mSp5rrcZXZeceAZt07usaxfnnujmQZYQ6d0yShIcba7eHA8qBedCq2pDuqAqe6GlLOYK4U03xWC79sOYkpwfnnVXIZuURfP37pSeGhzLsPnypULQHRdsrW2/tboKyAe+TrcCnEVr8YFNErhNlKf3P+MjTkIeDcfgfTv0Y7op9cFHmJpKfHgGX5ywFWy7BPQAA86iOY70oHmJKakJrZQ==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by DM4PR02MB9167.namprd02.prod.outlook.com (2603:10b6:8:10c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 16:06:10 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 16:06:10 +0000
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
Subject: RE: [PATCH v2 09/15] Drivers: hv: mshv_vtl: Move
 hv_vtl_configure_reg_page() to x86
Thread-Topic: [PATCH v2 09/15] Drivers: hv: mshv_vtl: Move
 hv_vtl_configure_reg_page() to x86
Thread-Index: AQHc0x7PKig5dZReokG7sAarwbgXxbXyan2QgANsi4CACEKMcA==
Date: Mon, 4 May 2026 16:06:10 +0000
Message-ID: <SN6PR02MB4157AD364DE0755DE070D286D4312@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
 <20260423124206.2410879-10-namjain@linux.microsoft.com>
 <SN6PR02MB4157467FDBC0203C67A67042D4362@SN6PR02MB4157.namprd02.prod.outlook.com>
 <567cf73b-6a48-4fc3-b312-9be6d71e2f22@linux.microsoft.com>
In-Reply-To: <567cf73b-6a48-4fc3-b312-9be6d71e2f22@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|DM4PR02MB9167:EE_
x-ms-office365-filtering-correlation-id: 30ef6419-9c5d-4074-e8c9-08dea9f70ef7
x-microsoft-antispam: BCL:0;ARA:14566002|15080799012|37011999003|41001999006|8060799015|19110799012|8062599012|461199028|13091999003|51005399006|16051099003|55001999006|19101099003|31061999003|10035399007|440099028|3412199025|4302099013|102099032|1602099012|40105399003|1710799026;
x-microsoft-antispam-message-info: =?utf-8?B?OUl0cFAzQVo4Mk4xLzl4WTFiWmZtWHpCeU5xRG5yZVExVVd6WEVURW9DVkd6?=
 =?utf-8?B?MGE4L2hEd2Q3Y2pLUVY1TVUwS0hEM2xucnBMYzA5T1kxNzVpQ0ZsQkFCVDd1?=
 =?utf-8?B?ZGQwYWtuZ3dya0g2ZWxBdEhYcUJqNisrLzhjUWZ4TjJPVTRndXFYaEZLelRr?=
 =?utf-8?B?VWxZVTNzWjVFOXB0bHVWN0lhNWJvcGFIQVhtTExvbENiTmt4WlhqY2M4YVo2?=
 =?utf-8?B?ZkFHZUdZdXNaM1o4MDFXN2ZvSjdNM0VKSHc0aG55VnpjQXlFS1orSXFnYUZN?=
 =?utf-8?B?SWpXclpIUVNxWUE0bFAwbCtTaXJXNXFYOGtsUWsrNGlKRXVZU2RkNjBraUdW?=
 =?utf-8?B?ZHYyeEpCcHRuMlJBbXNFZXhLL081SUJkYjN4OTZaMWNkZmRCMFUrc0RzU3hs?=
 =?utf-8?B?SXh6Q0VaNDJQL1g4TlQvRUFMTUZYeGJqSGJ0WWRGTmF5ZU5kUHo0OXJCOHpt?=
 =?utf-8?B?aVBpaUVlbUtpREMycHRHWTNSbURPcHFXdm5UaGx0eEZSeHNkNlgwZHhQRDhm?=
 =?utf-8?B?cWRwZlpteTZVY2FwRDdNZlRtMDAya2tvOExjS2lUNGhyRnhpalRqZGRCb2NG?=
 =?utf-8?B?ZlpxYnJWbWQ5aVRqTHJzMEZ3MUhzODFrT3NlWTBKUFlwMG9nd2FFdjhldXQz?=
 =?utf-8?B?bXd6VHhVckljeUtoSkZwZTJ2anFPV0NMbkNsRSs2Ky9ENWZ5U0xQSFpTQ1VH?=
 =?utf-8?B?L00reTZTd1UzMnFYOVFKK2YyMitNcFh0MGVmeERqNWpNbUFpc2pjZVpUL25x?=
 =?utf-8?B?SG1ZMzNXdk9qblZ1YWZsYlRLSnFyKy9WRC8vVUhHaWU0RXltb3Z4ODhEcGhY?=
 =?utf-8?B?RFpQRTdzSUNETjc2ektlR2pBRVY5UmlSS1AvUTN3VzFjbFFYd3JKUTVRTmEz?=
 =?utf-8?B?REppSFpWNmY5dEZ6NzlUSThYb09CVWR5eUl5OWtjUXgzeVlKdDBEV241QWNE?=
 =?utf-8?B?dDBkUmZ4OW9Nd091NGsxVVFWQk5TQzN2eXM3T1pKa2xsQ0dZdWUxRTBRcFVW?=
 =?utf-8?B?RHJOV3lwZTlXTlpwUHJsVm9udTErOWZBREgwVW1hQXUwUXVDYjFobm1WN2dT?=
 =?utf-8?B?Mk9VOGlpeFIvaUVxUHZnNjA1eWpHWVFJci95UVltL2FXZkgrRGxLTUNOVVFD?=
 =?utf-8?B?M0F0YkM3V1VFU1cvY0lIVHlVRVdnd2h6dS8zMnovd0xFWCt1d0hrS3ZvcG1E?=
 =?utf-8?B?VSt2YU5YZzhSUTdNNXlrNU01YXc3U1lwaUxDTmNXUzdHZzdoMktQbEpQbnhz?=
 =?utf-8?B?aHRkdSt2SzloYTBWYnJraWxxc0RvWW43YWJyVjM4QmVYOW1ZVldnUHRvVEZW?=
 =?utf-8?B?RXM4UVkxc0t1aFVmS3JtQmRJZnJMcUR6OXYzakNJYmlLd0lPelQ4WVdaRkYx?=
 =?utf-8?B?WFFQWDNEWlN1VksyNlhPY0NnUUdyM2prSFNnWGFpSzRMK0lBdlJIdnpkZ2N5?=
 =?utf-8?B?YTh4aTZpSnFSSG9QM2xQYjRrWXF0WlY5c1NBd0hmUFhYYm9mTnpza21ieXJz?=
 =?utf-8?B?NlMvcWFIZktFR1F0bm5hSSthaUJicml3OEduTDgrd2JLYmc0U1JFaFhMUE9N?=
 =?utf-8?B?V0NCQkh2RTRyMXBFcXpYZTZUelAxN0xFS3RvWnpiZE1kYVZvQVVPQkJOY1BZ?=
 =?utf-8?Q?BwN0AF4d6Av+y5axTLkELWzuRRvh8egvk2bmDI3mJe5M=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGQ4Z3BnNnlLdVluWkhIQ0xpRnZqd29JSHZTL3EvNmwvL1hjL3p3SzR6SWRu?=
 =?utf-8?B?Rk9FR0NWK0s2WDBHVmIzN0hVVWhicmZqS2s4L0l1dFhKcWxtNjZUNkdrNEd6?=
 =?utf-8?B?YzRVTWVJNWhQYitJOHYyQjFoeko4YklEUzJnZHVZQlVCblVXMjVvTWJpK1RW?=
 =?utf-8?B?WVc1QjlvUjBFVXU5NEJrOUllNEZvd1A5bkRxU1dtcXI3cUFna3V3MVhoaExN?=
 =?utf-8?B?OE1qeXFnQmpJeWxpTm9BUVRSNWJtS0NMUmlHZ0hZMmx1UC8vMjUwdjFsUjNY?=
 =?utf-8?B?OHFMaWRqWUtaK0JDVFRqR0p0R1lvd2ZhTjgzNEVGanl3YlYxMjFKK05mRFNS?=
 =?utf-8?B?YW82QUd1R1VhVi9ydFhRQkZFZlZ0MVJHNjVKcXd6WUV4Z2FpdE4yQkpwc1Yr?=
 =?utf-8?B?VTFZY2VFQnhmeUZXc05FMnE1QUZzblN4cndWaW9GNHB4d1lENkk4Ky96M0t5?=
 =?utf-8?B?NE40VFc0NWdnRnp3YnJBRCtmaER6RHQ0K1NlZWRXZlR5R3l6R1dtVE8zbWU4?=
 =?utf-8?B?S2xKTFYyK0RQcmh6YU54RFg2ejBOc0t1ZHQ1VC9oNHg4dXpUZEsra0ZYYzlk?=
 =?utf-8?B?dzVkbWhXMWhkRW9DWnRmdXkycUdEc1h6elRTWDdVaHFSZ25rQ0tGSWYwMktX?=
 =?utf-8?B?QVhaTjkyQ0JVaDB6R0d6bXdFU0Q1VzlJMXJyWHFKSTNtc0FwcXNpVXpLSVFz?=
 =?utf-8?B?VE1YTitQUHZiTDlMWkJxbmNoc2FJWUtwU3ZSa3JQb0QyTHArV2wzVzNqY3ZK?=
 =?utf-8?B?aXlndllwU2xXZEVFN05hY0h2ekEyQlpVNmJmMXA0aE94c2YxMUZwK1g2cUVL?=
 =?utf-8?B?TkdzU0g1Y3RRQ1FNRHZoTFl6UFgvL1VwM091MWxPNHFjMkZGMEEzYVVkZ09C?=
 =?utf-8?B?NXMrZm01RDJIV1U0ZkdZemdjWGFHOUlwdWpTK3ZybnorQ2dzSThqTnJXK2Ji?=
 =?utf-8?B?YmNVMVlKUHArRERhSE1oRjBXaXQrbmFSM0FBNXJJWWRlb0l0NWNmdWplTlov?=
 =?utf-8?B?dUhvR0NPV3ovUHBPeDMvWUFLQ0pwRS9wZHJhSjhnQmRncVpza2k4YU1OQisz?=
 =?utf-8?B?VVRteWxmanNCU3NaZkFyWXJ6OTYyMWdwK0Jtb0dGQ0ZoeFA4MlVOQmV5R2VV?=
 =?utf-8?B?dVJIQ09wcTVSUUtoSDM4ZkZOd3V0RXFkYTlJUUNXODAwYkFPNXpLNWtnaWVD?=
 =?utf-8?B?bU1qSmc4ZXlZT2dSZkhjWERiWHFMRy9XTDd4SW1xUW5MWk1NM1NyNEFDQ3BK?=
 =?utf-8?B?eWc3TWlsYTI0cFdmcUhrMlh1L2RRbjAyNmxYdVVxd2FsWjY5YytyZzgzTyts?=
 =?utf-8?B?SkJZbUMwN24yNExwbm5mY2VsU1dpUUluemUzTVB0eHl5OGI0V3FuMXl0QUV6?=
 =?utf-8?B?Szh4SXFGNVlaSHBMMkl5WXhESXJZVWpZWUdXSktEdVRlZU1NdnpMU3U0a29p?=
 =?utf-8?B?T0lHSVdZVzdROEtCbnRjek9WL0trOEJ5eDNBdStTNndoYzRiMURUMUdhZ1dW?=
 =?utf-8?B?TVdMN3ErZGExL2luRGJFaUsrMWR3Nk12b0ZVT01CTnJ6WWlyWnNpS0VpKzl2?=
 =?utf-8?B?YS9OWTl0U3FET01UaWJuTHhJbmkrYWw4ZEg4YU1uUEVKaExxSXZIRGs2MnFW?=
 =?utf-8?B?dlhXN0JoaEhzUmh3Nk1uMWRyWFB5d1J0Z3FGNmZib0UreE9FQzJwK20wN2J0?=
 =?utf-8?B?T2c5UVVuL0Q5bTFEVXE5RGN0UDNGb2ZEZkFwK2VPWEJNWkVUOVYwUWJGWmxj?=
 =?utf-8?B?dVl6MEt4R2xzSjJRR0JJSHN3WloxRm5DVHZlY1ppdXVCQU5KMDRsNDd1NnJx?=
 =?utf-8?Q?XeOHr/T0Q4N4pGkRXzQdScJvAdMoGxFtt8qus=3D?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ef6419-9c5d-4074-e8c9-08dea9f70ef7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2026 16:06:10.4580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR02MB9167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_090621_566323_C8587EBE 
X-CRM114-Status: GOOD (  35.04  )
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

From: Naman Jain <namjain@linux.microsoft.com> Sent: Wednesday, April 29, 2026 2:58 AM
> 
> On 4/27/2026 11:10 AM, Michael Kelley wrote:
> > From: Naman Jain <namjain@linux.microsoft.com> Sent: Thursday, April 23, 2026 5:42 AM
> >>
> >> Move hv_vtl_configure_reg_page() from drivers/hv/mshv_vtl_main.c to
> >> arch/x86/hyperv/hv_vtl.c. The register page overlay is an x86-specific
> >> feature that uses HV_X64_REGISTER_REG_PAGE, so its configuration belongs
> >> in architecture-specific code.
> >>
> >> Move struct mshv_vtl_per_cpu and union hv_synic_overlay_page_msr to
> >> include/asm-generic/mshyperv.h so they are visible to both arch and
> >> driver code.
> >>
> >> Change the return type from void to bool so the caller can determine
> >> whether the register page was successfully configured and set
> >> mshv_has_reg_page accordingly.
> >>
> >> Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
> >> ---
> >>   arch/x86/hyperv/hv_vtl.c       | 32 ++++++++++++++++++++++
> >>   drivers/hv/mshv_vtl_main.c     | 49 +++-------------------------------
> >>   include/asm-generic/mshyperv.h | 17 ++++++++++++
> >>   3 files changed, 53 insertions(+), 45 deletions(-)
> >>
> 
> <snip>
> 
> >>   #if IS_ENABLED(CONFIG_HYPERV_VTL_MODE)
> >> +/* SYNIC_OVERLAY_PAGE_MSR - internal, identical to hv_synic_simp */
> >
> > This comment pre-dates your patch, but I don't understand the point
> > it is trying to make. The comment is factually true, but I don't know
> > why calling that out is relevant. The REG_PAGE MSR seems to be
> > conceptually separate and distinct from the SIMP MSR, so the fact
> > that the layouts are the same is just a coincidence. Or is there some
> > relationship between the two MSRs that I'm not aware of, and the
> > comment is trying (and failing?) to point out?
> 
> This was added as per suggestion from Nuno in my initial series for
> MSHV_VTL. If the reference in "identical to" is misleading, I should
> remove it.
> 
> https://lore.kernel.org/all/68143eb0-e6a7-4579-bedb-4c2ec5aaef6b@linux.microsoft.com/
> 
> Quoting:
> """
> it is a generic structure that
> appears to be used for several overlay page MSRs (SIMP, SIEF, etc).
> 
> But, the type doesn't appear in the hv*dk headers explicitly; it's just
> used internally by the hypervisor.
> 
> I think it should be renamed with a hv_ prefix to indicate it's part of
> the hypervisor ABI, and a brief comment with the provenance:
> 
> /* SYNIC_OVERLAY_PAGE_MSR - internal, identical to hv_synic_simp */
> union hv_synic_overlay_page_msr {
> 	/* <snip> */
> };

OK, so this union is not associated *only* with the REG_PAGE MSR
(though that MSR is the only current user). Instead, it is intended to
be a more generic description of MSRs that set up overlay pages. I
don't think I had previously noticed Nuno's comment on the topic.

Looking through hvgdk_mini.h and hvhdk.h, I see 6 definitions that
are exactly the same:

* union hv_reference_tsc_msr
* union hv_x64_msr_hypercall_contents
* union hv_vp_assist_msr_contents
* union hv_synic_simp
* union hv_synic_siefp
* union hv_synic_sirbp

There's an argument to be made for removing these 6 unique definitions
and using union hv_synic_overlay_page_msr instead (though "synic"
would need to be removed from the name).  I would not object to such
an approach. It's a small extra layer of conceptual indirection, but saves
some lines of code for duplicative definitions. The alternative is to drop
the idea of a generic overlay page MSR layout, and replace union
hv_synic_overlay_page_msr with a definition that is specific to the
REG_PAGE MSR, like the other six above. 

I could go either way. If we want to use a generic overlay page definition,
then that approach should be applied everywhere. With the current
state of your patch set, we're halfway in between -- the generic definition
is used one place, but duplicative specific MSR definitions are used other
places. That's probably the least desirable approach.

Michael
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
