Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9920FC7EE22
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 09:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y5oHdYRO2DTVFDJzpuZu0hHQ9AniKCf1HimioIDFZFE=; b=eFOIzu40wOmVZq
	X/g8ACMa9rU7DSBZHBChCzVjlSj7J0Iro0K8t8DR7DltINQgpnjwn9EmBpSOjZoW926WXegLllt5Z
	FeYeygfHRm01lvX58PQTdBcREs9W5vkzi+s7II0vzHnjB8ppVjmKA9F+xD/KPhWOlisqez2XZQJEl
	ZYzG1ruwAXK1iIFM53lja/9bdla31Dn9Bp5X+5N8pcnkwul71LCv+MSmE4DZZnyldpXU1TkY2y1LI
	kufEYjkRo8RZKo/Wd+ifx5OOP8anU8vL6xlZJhfWI+USyOuaIUgGbP68MCQyIFoLf4NQQ2bAiYEhO
	Q4G/wCFQU9MGez4xielg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzaHf-00CUyT-0K;
	Thu, 18 May 2023 09:50:55 +0000
Received: from mail-dm3nam02olkn20824.outbound.protection.outlook.com ([2a01:111:f400:7e83::824] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzaHc-00CUxS-1w
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 09:50:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzJgkPLw5jkVmoF2sQbb5Uq9XWwIkyy0RdmCZ2DXD9SnfD9g1YgOkvjHKXG/FUH5kgT0PXTLQz1q/HJPc66I+ivPmIArDArCQipGVD6vnv91jKAw2oPE8/ZY3Rpkj8yTsWjfdN1XUQWL9TEDvRZiF4C903ah/XSA0pGg0Ot+crLqSlMHu73cSOelXxVSZfu7JYdYrozNZVkiGU5teSPU6N+ffNcitqRquB4dwrSoQpA+vT6rpK1DyXTiz3nXZs/oeXNNRwuDigTsE4eLYq96chzHbdp+Chou73es2H/2oxXDJ8Ov5EBooclaOwWPR4kxxaPkA5QDqMIV7pmASu0bIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0woHE/Eq5UA2QEFp7HmkD64t3+2CsD6ghZFf3G8k0bo=;
 b=VbfphyGD/zCpzUkWO0CMLwn+PkGOruNQ1JBOdokhn5wWQYdh3c4KF7hndqtLhyB2Mbc25IPjNDjnQnlOs6WYVll/ZmM1na/S2c/zATu0tYdyHFfG4vFeRQnEzLyIwHzzW/VE4W/O53QbckJ3FsBICBajBxAAQMiVSBrrRpyJ1SIMD1LDEacQKkCpqZC0VYQqXZHlMu+ZmhnoOE6ghvjOFx80vkMwkva88AO3pQpOxGdstEjJ+GxYgZtvVg0EbhJujwl1akDyntx2/kBaH2agxqc9Au0Q3XSUZoINYtXp5hJaJNi81fHP7VALUPO73INil2+T+FVLh39/c6PtOQLobA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0woHE/Eq5UA2QEFp7HmkD64t3+2CsD6ghZFf3G8k0bo=;
 b=bahUY7RehpEdgsa8KInTYsIyx6gB6YECkygFonxqcSkYotqRLuZlHiVzRqUpVVTTW9aYQKPlgWKEbJHC+hQoGjJcVO/Lit2rxuh6A1Y6Qjbe133d9affFvBegU9bV80w8jr084BOAIV9qvuEY6B1Fgo51MsGI57yebNG/EyuAjlwKHlCtDYzlN1Bg5kuGu74OLXRGPY7QUYtpe5vw4ishmrByYxVeXskoeyn8W8J/LE7yQsgAT9eLf4Hfls1T5yDDyX9FmF00S44Q424BG+dO9q9r2vpLKIWpCDmsHMaK7C4+t9Zz4S9llLcwqx+H65HXvyFkZc0l7LM0ymKBbKS4g==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MW3PR20MB3292.namprd20.prod.outlook.com (2603:10b6:303:52::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 09:50:46 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::4770:9e0f:7f59:1989]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::4770:9e0f:7f59:1989%6]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 09:50:46 +0000
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
Subject: Re: [PATCH V3] perf vendor events riscv: add T-HEAD C9xx JSON file
Date: Thu, 18 May 2023 17:48:27 +0800
Message-ID:  <IA1PR20MB4953FCC20C89F2659EB34896BB7F9@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <36fcef74ba3d21250f4c9605e691d1e2dac20ebb.camel@maquefel.me>
References: <36fcef74ba3d21250f4c9605e691d1e2dac20ebb.camel@maquefel.me>
X-TMN: [1wBBqvWDprwocJImEWmBtkEUkiiZCveOj7/85vUo5Io=]
X-ClientProxiedBy: BYAPR11CA0081.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::22) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:  <20230518094827.1629268-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MW3PR20MB3292:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df6638c-a8ba-4a23-4265-08db57855a59
X-MS-Exchange-SLBlob-MailProps: 	ZILSnhm0P3nvAoS/oQTVQZ1S7Y8lGJvUhsFQSadhUCMc/0+1A6DGi0EYMxQhae9jyPLLsL8hDKxHbVC+x5ngMG2oV4RW3kPr/Y1oLf6rScaHZLUdJ6f2mOmfm2+b7NmXG8XqmHRm89C/MgpPY9n73IPUCV6OY8EgUUfRaop7B3eJFYSvOVoT08QNWtcNByV4gDI5b7+Eu6DyLvFxx7lWaDUJkMId+9OSd/NJcTpBk+SydguInKj50/pXV252f/lutELTrXhITFz3C2vzLXBDY647YqGLOU+hTB4kgofZasQC++G+8yRsqUQgFP5gDi/5xz9WPhwJHDeOzvZL9bN4B0yDC217Yl51A23LXBm/FPx+bhaApG3Cz72REtXdzehVmP2FgbvPvdm26GARjyGbJ/Bu23Hsxo9QGpJOzoU8ighTbAh9Er0/GTmzyII6W9V0hbW4Q3/XpflE+e/F1pP+7qraB1aJowUop9kD77WuiekbL8NkyK+RFl5tjbZmf3vAFKfcHuclRrRHPsPBK9ccOtKxB9UqHis+oLNtNhZXjP5Dj+caCeU9TlOevx3c/7SOUl3NWo25JI6EUGwGHsmSblvh64UlaTdbyy29y/nVqmblDv2KRQKZE8lumvowietFA8CxEd+W9Av25EA+/GBINImMtUk6RViKbPBztkv/Mb+AKjEOLnj47qXVY1UQqifzmTrupTjpML1UyKtp9pZdGjQr+c9MmIwCXuZNxT1EQyGbicbQjpDBWJi3NRNWXOYyyhwwAWCUa/YV/emjc2TCbPgxpm+PpFIt
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	TflPddIAfuY0v5LPNQ/zdcjGroD12IO/Q/xUXkvp1ECuUA8l2xtu8zqMEMfeTTvU1bCmXV+gMiaC+1rE5JtkfxQ1BDnKLWHzjcMsxO+FNpE1dPBRjMzXQfkTJmxFNFDySsOlz7+/c6jaPislTWsJ5UHWTS4Gji5MjJvQJl6KSQpm1RhzYYeRom00CPhBwji8SldoGZPs3llG8YZ45djwUhbOboGGqNIV8E2R7gh1awbqFKlH8p72uaVU8+9iNgVgiiXHV/Z9Pa8Abfwt0+orzrwf3uZC45j3kuITbJpc01KDeGb34P024RdWvtFKdr4+Xh50SUEm0juxzJrffRX45q/K0CX8fYOUR4De0Xe03+H6bTRcM4noxdeqVBBd6WVtO41NHILh5dUCbbLQCqmYu8U4avzG6IuWNgIg7dlBBdjqG6yGIVa7B5mi5mfanC28jZnTrIlmsPpgOgZTL9QGPIanfpWeXiNpbpl1/8AJ9QFXQyJFC5Q8t39+QMETDm0Y+BNyFfU/h8eRbWhX0f13WBj5a3bQMxvKPHobSvTDGGrbbfVgT/IPzsQJTfFEIt+RtlLZDNipLlgWelmG7DFCfxMMb9gUXXX3T81ZhwrvuTH1PXiJEF28TtWtPzQ8HkWYucvFbg/7JmVFrghwFBU8sg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?g3lr/36YQBc1vsqEuK6mvRypgiGLrB9AtzvE42l/lC434uYd83bBeStvyqlj?=
 =?us-ascii?Q?Ge1Og1ugm+JI4w9wDmX8G2dfPnJDmqcW1Jr+wb/iRDWzLKNhNQ+faEhJz8wZ?=
 =?us-ascii?Q?OD1Cpw/lJdFb44a/7/2TThgLPoAf1BmgEBksAOwi22Nf+ftIVtWGvD7ca4oC?=
 =?us-ascii?Q?stSkXI8bA1jlvmAz/mYRgce3fSb530uzfPXwOLoj84Fl18HcSBhZuNUSrz7E?=
 =?us-ascii?Q?Upb+wgkkryqJTOlELKWQMQGctETd3hoSO3/tjWECqPCQ/OpBHeLCdbsGUHg3?=
 =?us-ascii?Q?mwAHoFnxtcNYBfFkWj0MOQ4ZV0aQJY8E19BJegIkJRfbLwxVX/XJ7MTf53U1?=
 =?us-ascii?Q?bEMXAXBBo5ThIaZY6Dmh7Rff970Do+2tC8ggp5oA1+jO02LLUyFVlcmCg0bl?=
 =?us-ascii?Q?cOGJj81YtpsFA3nEptGYzuE1NJ5HZoSxnqaZwJqvGq1q40KOCEq05H3GFcpH?=
 =?us-ascii?Q?Fqd6ozIC9ptCKqYLIX9S8jTZ2dvyD2MINTR3mhslXD8aajdN4fKFSzpVXfqI?=
 =?us-ascii?Q?0dKOM1C+Jq+iMiM9m1bDECF3LYe3XBO7fwrOC6KnCX3Q+oGtJ92EuRbiRERU?=
 =?us-ascii?Q?TGZcGqS9TTGMUwXYUUMuBlM1pPv/QouSCRgzD+EUFAVCH+VhkraUd30YREY2?=
 =?us-ascii?Q?JDazplN0jexj5OyRWQDdSea7/C2nCRpeHD/KUaaBSRgeoEOgSHFqEm/K49DV?=
 =?us-ascii?Q?Xe67sSNoG74nCHat5ahw8Dv19eT5ZiTw52h1ynZs2KnvhaqNNnPsqFXbOJ2q?=
 =?us-ascii?Q?Eyo6q3ZgtV8m5ooydT88v+HPaWt5oADYAVGpZYHFaRqNf7aLtStunnebleBQ?=
 =?us-ascii?Q?x3FyFL56Pe3pSMpidb2GmyjrZ0uG4/IaDR4HbVgi4G+wyBu+lr1RUmbfnxRS?=
 =?us-ascii?Q?L14nZXekjO9R1SSnN3ZjIWfY1LSY+kXkDLCo5bgV21ZpG349qOmC2MbxVZx1?=
 =?us-ascii?Q?aY2ILkmdpBAnNtx6dBlchb1/lFj947BA6FrDmVQjch6gwXEGYhiX6gi0JSn/?=
 =?us-ascii?Q?iRCROcl/6iMrHcnm0SlJan0UhatfWdgPrBS9ek6pQXwjHofDfgCLUQERKN5B?=
 =?us-ascii?Q?9QF0kA27NQl0Ch9u82QM+9TU0jZ0LGTuKLGwf64yr4Xm3JYHkT1qlU/0Cbqb?=
 =?us-ascii?Q?182G0o9dHaHxJaWL8yzBlSwXLitWvOi5d18OeQiZtBe+5xXnSv+DEntpJFw9?=
 =?us-ascii?Q?r4D6bx8QUT8jTcFMl08eZzjllAGXs+eFY9pYLRUpRA+VBV7gaIhsy3xFhi4?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df6638c-a8ba-4a23-4265-08db57855a59
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 09:50:46.4330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR20MB3292
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_025052_667316_17746BE9 
X-CRM114-Status: UNSURE (   8.70  )
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

> licheerv # perf record
> [  432.015618] watchdog: BUG: soft lockup - CPU#0 stuck for 26s!
> [perf:117]
> [  460.015617] watchdog: BUG: soft lockup - CPU#0 stuck for 52s!
> [perf:117]
> [  488.015616] watchdog: BUG: soft lockup - CPU#0 stuck for 78s!
> [perf:117]
> [  516.015617] watchdog: BUG: soft lockup - CPU#0 stuck for 104s!
> [perf:117]
>
> But that's not related to your patch anyway.

Same issue on c920, but it did not always occur.
Like a sbi issue for T-HEAD cpus.

> I am strongly against using "c9xx" wildcard, i would prefer declaring
> them separate (especially taking in mind that c920 is c910 with vector
> - AFAIK), but that's up to Arnaldo to decide.

AFAIK, there is no reliable way to distinguish c906 and c910 cores. And
the events of c910 and c920 are the same (according to the draft document
of the c920).

Anyway, I agree to let Arnaldo decide.

> Tested-by: Nikita Shubin <n.shubin@yadro.com>

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
