Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C84C77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 09:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IituJD1+qeGsMg60wy5ogF36ObViAKgLqC9KDA7K2Ng=; b=I4n8BX4m1/M+Qd
	js4jF8GnmcfIxLja+oWEZlt6r5xqp6otfX9nOxwAWo/v9U5iCpbo7aIbl+lKifj2+vLsEomDbnmOc
	cMa+SByOtLtn5wYuqzrfBGgrdO+E4y3LbFTZvXvv52CSF444Zu5CXNIEFTwjBQog667I4m/R8tybx
	I91c5xIA6aW9Ky/LOsCPiRsv7zH8qa62HwxeJVRjTQex7Au6ufOJEwkjV5djVo+86R43AC0KjXYHe
	VJLQaWQHe1wuptR/3a9EumaziZaxyC7uBIblSXMye9jRsy1zJ5JCA4wSh1ZekHKZgc9pUt40sjfm6
	P1MJpWI5kXAdvwCiD2bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyrCk-00574X-2r;
	Tue, 16 May 2023 09:42:50 +0000
Received: from mail-co1nam11olkn2080c.outbound.protection.outlook.com ([2a01:111:f400:7eab::80c] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyrCh-00572f-3A
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 09:42:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYrrSRAqzBGlRNI4U3GDLSV8iORLY/u3ZKaa7Depha6aBCfsWhsl11hWdm28DHuXD7AqHjUn8U9O030lIxbPXxASMK+IqE0JeU+yp9JnrOaFEI8gJbBYNtqJuYOQmq5wWpz15U9UEErJqA7sNlliX8vDed++ldyhO7YuYukFFGuD5PCLz/yJ2wWVy17pjA5WKLq6gV7Koh7JvNxs2gVnmRmqaYSBF1f+tm6Vd6hv39xiyjakUVCszGeEEeo5/kHHekBLcY5/pdplcI6GzwhLaKTEAcTZwLPsUifx7p8ov69BYpHxXcXYCpdzmZijbFUJ3LweaujJWnDklZpzHF96Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFZdocQRitI01/AWfUHi1cD40UPKy29ov9k7Cmf+eFY=;
 b=lAWk5dwYwf39iKOogHJXNz8mBCC1EkVhXRjpQMGhtjINSCvaJlExMf0k+6bLQ7dSzaQbGRKGEoWObOqD7Ky9jNC3lBQjuQct5W9kYyO78DTOy9DoMEObG3CYflMrmu+gPZC6cBrMJrxmQBbcrISk1XP8hcG5OM0kJkiLg+OeBwTpV7ty/PAeEIKPmH6NIRwxSmW1cS6dLvW8Q4X+nRWzTOusaoBsRP/9Uf/vEmL3TLhYA/A/yFFeezx7/bK5g+Xb4c0hkY+ojbt8ylqUFeqmozLP+3LyVP6tQmYsifD73hKrfSbAVVX+UvhkzRxT7PPVHgFfe5U4ivFrnKgQvG7ptA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFZdocQRitI01/AWfUHi1cD40UPKy29ov9k7Cmf+eFY=;
 b=Ld73qTJyRzGaVdogBjiaoaWMSGkBbXbZuKAMLkaZIRdWSv+ehsVliduIW6EPzUIr0wi7+Y14hRL7sv8sVwSXEmMMM80ipKRfvILQZCfQJgombwDIkui1bvKKmHJFQiv3t1oTT3J0SvQWY3t3izvl0fR5j0Ws/LTyPkAqo/inizBoyUPnjzKcllcJg5XAHq3UQ+0aO8szzYVU6VovYk9ewVkbp9VpjkqErvVuJC8FkBzXvn/wJE3Q9yQnkdcMSLmOngP9mpvxGtmvyzcvNsjbD17oR6i4WUJJjAImvlOrCnwfAK/9xZf1k0sz5ckI0YL9HTJh9MqEipWWh3qR1Ki7Zg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH7PR20MB5331.namprd20.prod.outlook.com (2603:10b6:510:1b9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 09:42:43 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::4770:9e0f:7f59:1989]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::4770:9e0f:7f59:1989%6]) with mapi id 15.20.6387.021; Tue, 16 May 2023
 09:42:43 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nikita Shubin <n.shubin@yadro.com>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] perf tools riscv: Allow get_cpuid return empty MARCH and MIMP
Date: Tue, 16 May 2023 17:43:54 +0800
Message-ID:  <IA1PR20MB49532515E0DD00227B7CE5F3BB799@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <680f2d5d146a38083a28198f1a8a3694654bf8f8.camel@maquefel.me>
References: <680f2d5d146a38083a28198f1a8a3694654bf8f8.camel@maquefel.me>
X-TMN: [KTMYoXkzNQnqOAG9mA9ZAKcFZfc1lHPRQmoUzpUq3go=]
X-ClientProxiedBy: SG2PR01CA0188.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::10) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:  <20230516094354.481410-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH7PR20MB5331:EE_
X-MS-Office365-Filtering-Correlation-Id: b77afd6c-c6be-436b-1c4b-08db55f1e585
X-MS-Exchange-SLBlob-MailProps: 	AZnQBsB9Xmro6QgSszs9gMsEKU0pMqlkCd9zMssbJtRA99IicgUtL18L+jSFQb3cyCNXKEhxCrMMYpJgEEohLZPAqB6Cp/CJWnWM0JWQ7mCrYxOipWauDKc/bS5yLQsLXj3hIOlzg63K9YIkLRAf9sNuPYm629D0jOzUcMQsCecjvRoPEawPT5roAldB7qo4DE1Fq1oGt2xIqLkN4yaDdVl5mBOHiBgnE2BlgKjNeoXpA/5KpVk0dYu6uLEW/LZ/rtiCnxPfJcMRLKh3Xzauh7GlHcn0EtlaeKO/Hm1QSPCYomJRQFJtj1N7k/wHyIz4081MC0N4iU5fz2Lv5D6cy9hCZK5SpDTQVt2WSgX047IHa/Jb7Pnm/2ObNW/E4zbebNMRoIqR4SBG/KgfKnJLMOW4/vAG/JmyHrzKNIcPp/KYtNn6qX83zjAV408OBpnH6sclNLMT82LNukBI4fhenLXkZtuzJVOSinMwVHgLPLoBRiOHVghNKSN0ucV0oeWGdRoUbOMUsy5N2ZhuF+mFkN6sGpIncIQxrjMsDfGL6JPN+ByKsLRIdsKYIrltMOHs1+pRlmNVuTdt/byP8C95WYCeB1VRDd/U66mqTTztbg/GNRDm02KMeqoqB7K7u9dox+Lycs2kqz1FAAfYBIeyU1I8uo69kM9O7s+lTj4b1qaYd0HwMF200mw4Pl7ETh2rOHgRbd3wRWxipJflmLPVKmi45d98IJnssGy98GHkIxj20RkXzOs/AKFPZ55sCtQEq+C/f1czQH8=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	pjdYJFznOoTfY1SX5y+gMoVzXo+Ph5Ao3tJ86Kwu8FG57nlz6vAakV2rIhSY3OcA+DkDqx59lT0i+4GMQZ7ekcyfSMVvtnbuj6eQQi6N6/WAT28GRclKAJWD2Q+qEozyxEigyRiJxd7Mc0fdBbUj8cq+KP1pioWr+9DJwjyJQxzqLfjOcxe7DYMaFA0MtgWVEz1xWrXsJxfujbkuE1ur3T9CHWWpuWE1JE9d8IApyjOlME92Xd7nAtJum6V9JE9DbcWV8QH5lffpo0wCYOShWxGPVJzPmMkg0duGqe1mM4xx+uP6pmjBYT9G5zxtiC2BfFOp/YhhMlNQO2Op24uTdY2RzaODewDySJc9Tc1is+3w7Fb/eyWkkGAs+NPNAqEQ0qrpQzBavdbTUVzN/R3jGBJ9t9dDMAV9sWXzCf5nFWupkEIhBm//pWcDkBvIopXTlSkEOu/Faw5U76w4qMzxcjiU+aAezOF4ucWs4N4W2NrwEIU3bnm3gxb66PC2gH/0JPBFm1FN97iOdKieLAtvS7DJZ1Z+DtWIP3cAeODxDes/ymXUDtoAIkB+9keNJg+OrcKPV0jAnSwUbHTaa74ULjdIHNliUxWI04K2MJy0yNo+V2aPBF85ihAuNOB1EoIALnE6Mzu1CJhp9giy1P+3YA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?WvAGS19bI5yL0oG1+mth4z93uWHRVNPsGf2w4FOCKdKFA8mjJ4izlV1eimFT?=
 =?us-ascii?Q?oyRz/JHk82ZEgJ81QXnu672emKMoXgl++Mn8soawwdlnicDg7UMDBzfdJhpD?=
 =?us-ascii?Q?4F5DGrweZEcR0LF84pSOw7ta1sw7KPLYZ9A091Pl+/uFeMM4FqkMdEGWJ4EH?=
 =?us-ascii?Q?P0Txg2ox39tHcMZgjF/nKuldZ3Ql1IxmNWG/7Qg+J4diMTAXzDfnKbDZQxbt?=
 =?us-ascii?Q?CsbVmkd4sPL15JX8VNjmmbtinUPeVxe7aPe8QyE0NTc+0tvS1IP2RbRmVuoq?=
 =?us-ascii?Q?t8dpFxH9FvSwuoUEiXNo1j0er03MfInXGrAraFrP/eOPQAEIivpQx43jHOaK?=
 =?us-ascii?Q?HS9PJqs48wvOQU+XjNUq9Bsdsm4PRJpl2Miukw9JEdsVPeQu20i6ZYs5LftQ?=
 =?us-ascii?Q?RZQGLaVxduw8fy+zHVGRqp4aabOgM5zCqowclGmJi71DDnmDafRkQvVg7CXQ?=
 =?us-ascii?Q?4Mtk3Dx7aHSA47M0XXGaQ/w01d91Mm7HbhAuv3qP6GCss++gQGNsIWjIxwc4?=
 =?us-ascii?Q?AY9moOdEOUFux0iyWSOKPwIc4IOgIr+nw9xvTJiTdJ7fXy255xh7mqg6mAzA?=
 =?us-ascii?Q?U58hksJVk6fbdlY+o7+ep+W++snU0xEohZ0xt5X2plsaAzO6pnqtO0geyTd3?=
 =?us-ascii?Q?gxjRfW+IMDyXBvOpGbknnIgMpDsnWtRss86jL5FhSY0a4MCI7DGnSZ3nDrUv?=
 =?us-ascii?Q?4i6ymQWxbcULi/3H4sCLHqgmQhHiEMCV17EaDlsIJUhyOy5k/4rEvPhKYSPc?=
 =?us-ascii?Q?o1VmExrrs7vriclMfrkjqiQ59xw+H+W6rZKhrCb5IGaeFvaXLXBgwe5rEVkI?=
 =?us-ascii?Q?us8+LSfXSjl1DByrhh29Bi34y2KROlwXeuTi4SZ7j2YLYXlnb1gxx8OM9Pdp?=
 =?us-ascii?Q?U26A+qh2zIJpEIdqbw1mnfEgdcu5Q1NOVw/hfF66c59eptpzag1VbBvNY/Ld?=
 =?us-ascii?Q?iIG3V59GDbA2oeipTgqpletKpPYmQdAFUnKcCFxjlmcDTZa+NrYghvJh3k5Q?=
 =?us-ascii?Q?XiyQGUY9Za0llfIhkRPLM+yxaeefd7PZiROZyRQ6iBkLM7Y9xVZjBqazv+ye?=
 =?us-ascii?Q?fUVKyu9q8QxqVENjz2u2qFYTLUn1aVKbTVO2W8f76E4ZD8dHC+zUi7lRZ1e7?=
 =?us-ascii?Q?F03/+n4TwYUHw+wpUq9pumQdPLbhYFJCLTpJJ2BHb0QZ2f3ihTQpK+h+ZCfe?=
 =?us-ascii?Q?ByJXdDZP8O7HkBJp0T78EIhDwoqgV0mklNaae5Tv/MagB7dl3QL/bbagnYI?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b77afd6c-c6be-436b-1c4b-08db55f1e585
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 09:42:43.1309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR20MB5331
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_024248_023549_22B47B08 
X-CRM114-Status: UNSURE (   9.71  )
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

> > The T-HEAD C9xx series CPU only has MVENDOR defined, and left MARCH
> > and MIMP unimplemented.
>
> According to the docs you can still read them, but it's hardwired to
> 64h0.
>
> How it's supposed to distinguish c906 and c910 for example ?

It is unnecessary to distinguish c9xx, their event index is compatible.
The dtb and opensbi will final decide which event can be used.

> What does /proc/cpuinfo shows on c9xx ? Why can't we use zeroes ?

The content is as follows.

processor     : 0
hart          : 0
isa           : rv64imafdc
mmu           : sv39
uarch         : thead,c910
mvendorid     : 0x5b7
marchid       : 0x0
mimpid        : 0x0

The `mvendorid`, `marchid`, `mimpid` are the same across allwinner D1 (C906),
T-HEAD th1520 (C910) and the sophgo mango (C920). It seems T-HEAD use MCPUID
CSR to store CPU info. But this is not standard and not shown in cpuinfo.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
