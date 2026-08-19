Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB535C5B572
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 08:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ATHd/hlZJ7WmWZ0FU5yvHNyfPelxZwjfZ1/cr/1J52o=; b=OQ3KOG31j9wKSv
	O1byWLNyjUarwQv9HUXvIXgQnzkgPSJEuReDq6Jg7Idy6oZyIRLKSOA2OnlkPzE9Z/e2ltulfMeGe
	6HC9ytt61yBa7PmCEmzxh5EtAzqxrgdYDE0jfN6PnNnsPY8XAiMO2jrjJzsPjqcY/KeclQRxZkut/
	mDLg72d1/y0HTh7c7+P6pZwhjNZ1PpXGfHj5MMaLIYABFFgA7yZoXsUpb5oAp4HlETwQjHVv1FhOa
	T5f2oMuN/onwOZKLQMBJQfA5hpmxVEs/e6EUYKbRdtPI4RffKzwXw6Q8g6voboinCJV0cFcdc3HjN
	ivwtbfroLFbmeHCo49KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbPU-00000009Ht8-0qHA;
	Wed, 19 Aug 2026 08:12:32 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbPR-00000009Hs2-35NC;
	Wed, 19 Aug 2026 08:12:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HfS+ewTrYSphbObGuzP/RgPvbx7O9b41zYlm6vkq/vPGksWVGJrnz+gVj1Qr2dyWXn4R70qEAY3gzQGHXAEWFO8IhDNO4uoOb5AOQxEGn857AjSz+0zlvmG/ZYUfMZiiDa6KIqOLbDZm9iB5S2sFfuP0a2uCx7L9ZzCx/NggjDA7/f2LhWBDIAaOEKk32ntKR+7rJqSWy0qEclTnVKemqQZqwGdlSuIIkTDnjgx2IvQuVGcNTffpr56J0sLHGPUNj7JnQkMcRY7TgYzLyNyqibxaXAMWOdqsgE1Rq0MCRWJIF6DHOf7vYNPkO94zGy/9Fn3Qae6mdnnKIPWTiBQeLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d84hCATNqnUCsUt/1WDjP8LtD1u8eNmXIKR7OiNQFo0=;
 b=BQDNrsbZqqJHSxYmmZv+K31QGGbQIOrz4WPrN3gxVhssdFluwtqCBd347CsL6beQCqTXXc7V08JbGZYrcm469Qk3c4086Yvwv7YdaFwkI7y5alaMPaMqwxRIlXDd+CmE0VH9yQn0vplV+RBzgMdbBfg22eDPG0SnPK3834pYMb9QQsWs787cIByGttOhhRNxm3ob5GTF9URWEbDEKQrt3k7N9z5gCqpxLkaRIDoyjWr8CqPWPse6IuhC7ovzPjhh3nQe1v0w9PjLoCY/XQvpSL4DevNUQjTKk1bewdDz743ipSh44ZtvAbbFMScBSHjCiuKZD51pb7xo7kPWsUiSgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d84hCATNqnUCsUt/1WDjP8LtD1u8eNmXIKR7OiNQFo0=;
 b=trS+M/3+1UuFoHFDnAG5KK1O3hlYMw8+9RjteJDPP/QvYvDOH4JfgTBepxUxzt8/EJzzg3QCsYTkzF3wzBmukSuwLhHDDMIjghwD+KrVh3wpr0qcJOEN8z+0jSpuynJWuVk1I/xCwqp1Obe2Pej9Ob/EnyIr4ORvGC+b1qCG/Go=
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 (2603:1096:820:c7::13) by SEZPR04MB6432.apcprd04.prod.outlook.com
 (2603:1096:101:a8::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 08:12:09 +0000
Received: from KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3]) by KL1PR0401MB6196.apcprd04.prod.outlook.com
 ([fe80::f2ee:1e28:9022:99f3%3]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 08:12:09 +0000
From: Hongyan Xia <hongyan.xia@transsion.com>
To: Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>, Broadcom internal kernel
 review list <bcm-kernel-feedback-list@broadcom.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
	<chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Peter Zijlstra <peterz@infradead.org>, Juri
 Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>
CC: Jiazi Li <jiazi.li@transsion.com>, "virtualization@lists.linux.dev"
	<virtualization@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: [PATCH RESEND] sched: Convert paravirt_steal to new static key APIs
Thread-Topic: [PATCH RESEND] sched: Convert paravirt_steal to new static key
 APIs
Thread-Index: AQHdL7JurDcnsknKnUOaLMvw1Db+YA==
Date: Wed, 19 Aug 2026 08:12:09 +0000
Message-ID: <20260819081207.12150-1-hongyan.xia@transsion.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=transsion.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0401MB6196:EE_|SEZPR04MB6432:EE_
x-ms-office365-filtering-correlation-id: befa3bdb-2ae8-4060-d27d-08defdc990d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|921020|38070700021|6133799003|10067099003|56012099006|11063799006|18002099003;
x-microsoft-antispam-message-info: d8clx7CxpRAa7wDJWB7i0klecT0DiSo22kLcX70H82L7a4gg0NdJrkEtcqUOdNIwosLMHYe0XUNDBVs/NhktiHHwHtj2QkCeGcdpxFPmMls2XC9RBCwVVgm2ajs5N8t3HtkgZnqReAMJZyywnq5d0jTTwIpfpYfFgXawESMmAmNkzzsr1SLWruQ7f4Hk2+gqcd5wZgkTLPFyoTVtNCCeE8rKsrwkPQ31BzI78TZkhXdSB+Qv2V6DOz0VdMRgHa17lQgcC5jTj9HL5zCBF5b+12FstdHYISJnh6p7CPkpw0PGXa7NiXmP1lhk0Cl2/zUOUc/ZeqGsSdNNPinZUEnqGgBuDL/GTGURucPA1mkxl77PohNaXuFesP70S6swapKFVd2aT+VoEQYdsXzIn5yxpnQ3LsSWO7Fc+xKO8LPExZdQnyJ9jem0WSG83F+B83Ie70hWFEGgyqRY6S5LiLULNsU0/NgrnvnHMgYJxhCC26g8jo3Ffv2CpChLMP9NIUSb8FGN4UoTH7QbmzSE6GcDTXLUTUv0qYJu+CzmFq23IlmJzl2eYM4AtOdXj7ysaQh//Mp0+fAhaX5/P+B/UnDJMc/DsuUHCniw6UZr9PnCGl91OYWZ4VOnmhBFmx7mOMf9a6nXAGId+79AyywjQM0dRQPZ9qPDNMbk1vCFkup7X8dmcCn2LhK0EQgWh3hT8/YLc/DSTF3IvXgZTxQ6QS9Hi7dRtqbmxG/nWOWxynlfK9nqP7LJ7uQl5q4OJkn8mwKz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0401MB6196.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(921020)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Odxo+I8eXOuMeqm5vDHyLaZpOpKBP20/pEIg1Hlaiw95uP2SsGAv55wdQt?=
 =?iso-8859-1?Q?jlKFqPTVy5IDwLR2OYSi3i5HDYkolIrBk4IzV5padxa9xV7CmWgGu8URpP?=
 =?iso-8859-1?Q?t7052kutoeHqgA1aYkEDgSOr9KxClnZXitRKRR+QkprYVc4gIlrH1/ZNCk?=
 =?iso-8859-1?Q?PWgIhgJZrH6hxr3IP8KtAp6xqGQZa2kHkGp5YaobRA4BZAWweUmEYkfnps?=
 =?iso-8859-1?Q?e4G4RKGWuk0EpcOpebrPROUoK61gfIgZmnXEAOZn/Be+jA6ZFJlcmuB7YW?=
 =?iso-8859-1?Q?IHhAOyIlG9lDaGCEsjAzhbJo2okmJMaT/au92Emk9cZXd0TBntWM4nr9e/?=
 =?iso-8859-1?Q?sf9cY8FKxM5zzW473dLU5nEpYwVBsGo+tJ3JCZGdTuguYKFoVKx9oEU2A5?=
 =?iso-8859-1?Q?0QtCucd1NT3fgyKSuv9fu2+Pdx4mSjVdy31OGxiFA6UpL10WTM7j+dDp/b?=
 =?iso-8859-1?Q?9/ZXNREcScYt64xbi1xEjpuN47e7D82SiKnJtjhmFsfs3uRiUwvPBKbJF3?=
 =?iso-8859-1?Q?mrJv9+d3QcVv00QavF1CCPigmkmCgf9IYH11vuj5dUPCsrTXIND7+OlRhz?=
 =?iso-8859-1?Q?FfaS8JFp8x61NPINL+nUGHSwgFbufz8Jo3X8hDCHT1zaGAJYyrB0ExyNYi?=
 =?iso-8859-1?Q?XieQwJUVwVfiLk3lRnJ1qY/wJSxGAudDvy7SiUKbBbsqQQMZ4UKJDd9JSa?=
 =?iso-8859-1?Q?jRRcdwK+jcmnwrAIHSOrQilwj3BY3dshkpd8ZyAHNGG/7XFu70smJyiUQ0?=
 =?iso-8859-1?Q?wl6VgF0XPmtSI3PsxD4AyhWrZLjZ9y3Dx78c3sYI+/rdc2ReD6y8CZuDob?=
 =?iso-8859-1?Q?rIbA/ZNPmanTxBfjiYnXwGYg+4a1oUf7KizvVHz1EYrLcYX7qwBHVScYjT?=
 =?iso-8859-1?Q?xm71PHk7txJvONIV9gS4+3o7pVmN+E1XfBCpGgGtLoyYUF7nWMJyLQW3FA?=
 =?iso-8859-1?Q?79/iiIGV6/cy+J8cIvFL36LJxWN+7ohTFj1ZXLSxWuVi63fxGEDbR5Sx+O?=
 =?iso-8859-1?Q?CgRp8osfe3EIn9Rfp6OCs8lfIeoYykDcj/eJI6/F2Hks661vxFFxsHm9Jc?=
 =?iso-8859-1?Q?+F96FhqTOz2Mr7E9QRx/L2mSacCCzXmyhYRccypaYwrphTw6Ao12OGHnpG?=
 =?iso-8859-1?Q?k9leOs5rCL3+vknwnr25r1wmEhuTzZeWuAbZVhfIiAuoWc9VMOczjvLA5d?=
 =?iso-8859-1?Q?o9fL1xPyoS9YqdvmcYrLAhDF2EWkWXdzKt7MqeDDw5YsHHrlIigociDETA?=
 =?iso-8859-1?Q?VcxU2hKOvjHHzW+1qO5v0xXqOHdJZC8gZDmYK1s+YaZOSbPZiQDCCmemPT?=
 =?iso-8859-1?Q?YyPVgnGfnO4waCsIpSjtaJWAl5CIaI5T0rthGoLSQafPEU+Ett9d0YB9DL?=
 =?iso-8859-1?Q?IoNQtJUR1p5vHLr88Dno+vgnpvP/cMgVCiqBhveIsmVDPuolcMCI688H5I?=
 =?iso-8859-1?Q?anOB5/CIDLviX1uBhb3NKAAB9iCxjzSKFfggywHvZmJnhMBTX3UBtC4CDd?=
 =?iso-8859-1?Q?Da+6ipEMVhyemyHz3BMqdVt8CqGITjqM7APWVk3aaoDrQuYGn6l1p51MDS?=
 =?iso-8859-1?Q?Ydm1JUPePZn/y30L0hxz4JkoNuJtWGtUXqXlGWo/d/bc9qiK0dWPuVK9zW?=
 =?iso-8859-1?Q?vF1L9KW0r3hVibwZFfszwHNF/4GQ0HTZYWJK4quj6tiVgT7dih2DIuMtv2?=
 =?iso-8859-1?Q?G1gJSCEEQ3v+h99lggXlOS7nuTwplaUm2nWw7DExOEO9wGfl+WuCBitgRP?=
 =?iso-8859-1?Q?KIfUQxSNSigKdin9PzRYWMxH+/hM+j0Zr9ypkUpWbKuzrhoGTlDaf0uwAr?=
 =?iso-8859-1?Q?JYyUZT+kVg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6196.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: befa3bdb-2ae8-4060-d27d-08defdc990d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 08:12:09.3185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hahIfAI68GG4NH7OftBS1CZP1PWA2JXjn6x51ud59dJAgdzNyPwXHPNEGP9iVwarDN/dWZFuGQaIOxQqZF0lS26mGmSBp4GhxB4Us/HB+tE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6432
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_011229_965118_EB23BF69 
X-CRM114-Status: GOOD (  10.11  )
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

From: Hongyan Xia <hongyan.xia@transsion.com>

paravirt_steal_rq_enabled and paravirt_steal_enabled use raw static_key
APIs which are now deprecated. Use the new API instead.

No functional change.

Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
Acked-by: Juergen Gross <jgross@suse.com>
---
Changed in RESEND:
- Separate the original series into individual patches. They aren't easy
  to review as a series.

 arch/arm64/kernel/paravirt.c           | 4 ++--
 arch/loongarch/kernel/paravirt.c       | 4 ++--
 arch/powerpc/platforms/pseries/setup.c | 4 ++--
 arch/riscv/kernel/paravirt.c           | 4 ++--
 arch/x86/kernel/cpu/vmware.c           | 4 ++--
 arch/x86/kernel/kvm.c                  | 4 ++--
 drivers/xen/time.c                     | 4 ++--
 include/linux/sched/cputime.h          | 6 +++---
 kernel/sched/core.c                    | 4 ++--
 kernel/sched/cputime.c                 | 4 ++--
 10 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/kernel/paravirt.c b/arch/arm64/kernel/paravirt.c
index 572efb96b23f..30bf61d031eb 100644
--- a/arch/arm64/kernel/paravirt.c
+++ b/arch/arm64/kernel/paravirt.c
@@ -157,9 +157,9 @@ int __init pv_time_init(void)
 
 	static_call_update(pv_steal_clock, para_steal_clock);
 
-	static_key_slow_inc(&paravirt_steal_enabled);
+	static_branch_inc(&paravirt_steal_enabled);
 	if (steal_acc)
-		static_key_slow_inc(&paravirt_steal_rq_enabled);
+		static_branch_inc(&paravirt_steal_rq_enabled);
 
 	pr_info("using stolen time PV\n");
 
diff --git a/arch/loongarch/kernel/paravirt.c b/arch/loongarch/kernel/paravirt.c
index 10821cce554c..e8965a3f8082 100644
--- a/arch/loongarch/kernel/paravirt.c
+++ b/arch/loongarch/kernel/paravirt.c
@@ -308,10 +308,10 @@ int __init pv_time_init(void)
 
 	static_call_update(pv_steal_clock, paravt_steal_clock);
 
-	static_key_slow_inc(&paravirt_steal_enabled);
+	static_branch_inc(&paravirt_steal_enabled);
 #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
 	if (steal_acc)
-		static_key_slow_inc(&paravirt_steal_rq_enabled);
+		static_branch_inc(&paravirt_steal_rq_enabled);
 #endif
 
 	if (static_key_enabled(&virt_preempt_key))
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 1223dc961242..8dcbc4bb7025 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -852,9 +852,9 @@ static void __init pSeries_setup_arch(void)
 			static_branch_enable(&shared_processor);
 			pv_spinlocks_init();
 #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
-			static_key_slow_inc(&paravirt_steal_enabled);
+			static_branch_inc(&paravirt_steal_enabled);
 			if (steal_acc)
-				static_key_slow_inc(&paravirt_steal_rq_enabled);
+				static_branch_inc(&paravirt_steal_rq_enabled);
 #endif
 		}
 
diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
index 5f56be79cd06..9c13a6f1ea2a 100644
--- a/arch/riscv/kernel/paravirt.c
+++ b/arch/riscv/kernel/paravirt.c
@@ -116,9 +116,9 @@ int __init pv_time_init(void)
 
 	static_call_update(pv_steal_clock, pv_time_steal_clock);
 
-	static_key_slow_inc(&paravirt_steal_enabled);
+	static_branch_inc(&paravirt_steal_enabled);
 	if (steal_acc)
-		static_key_slow_inc(&paravirt_steal_rq_enabled);
+		static_branch_inc(&paravirt_steal_rq_enabled);
 
 	pr_info("Computing paravirt steal-time\n");
 
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 34b73573b108..f7ab9e7902cf 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -328,9 +328,9 @@ static int vmware_cpu_down_prepare(unsigned int cpu)
 static __init int activate_jump_labels(void)
 {
 	if (has_steal_clock) {
-		static_key_slow_inc(&paravirt_steal_enabled);
+		static_branch_inc(&paravirt_steal_enabled);
 		if (steal_acc)
-			static_key_slow_inc(&paravirt_steal_rq_enabled);
+			static_branch_inc(&paravirt_steal_rq_enabled);
 	}
 
 	return 0;
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index dcef84da304b..d3dcd64f22c2 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -1052,9 +1052,9 @@ const __initconst struct hypervisor_x86 x86_hyper_kvm = {
 static __init int activate_jump_labels(void)
 {
 	if (has_steal_clock) {
-		static_key_slow_inc(&paravirt_steal_enabled);
+		static_branch_inc(&paravirt_steal_enabled);
 		if (steal_acc)
-			static_key_slow_inc(&paravirt_steal_rq_enabled);
+			static_branch_inc(&paravirt_steal_rq_enabled);
 	}
 
 	return 0;
diff --git a/drivers/xen/time.c b/drivers/xen/time.c
index a2be0a4d45b0..a02d48a2aa68 100644
--- a/drivers/xen/time.c
+++ b/drivers/xen/time.c
@@ -169,7 +169,7 @@ void __init xen_time_setup_guest(void)
 
 	static_call_update(pv_steal_clock, xen_steal_clock);
 
-	static_key_slow_inc(&paravirt_steal_enabled);
+	static_branch_inc(&paravirt_steal_enabled);
 	if (xen_runstate_remote)
-		static_key_slow_inc(&paravirt_steal_rq_enabled);
+		static_branch_inc(&paravirt_steal_rq_enabled);
 }
diff --git a/include/linux/sched/cputime.h b/include/linux/sched/cputime.h
index e90efaf6d26e..694126411dfe 100644
--- a/include/linux/sched/cputime.h
+++ b/include/linux/sched/cputime.h
@@ -182,9 +182,9 @@ extern unsigned long long
 task_sched_runtime(struct task_struct *task);
 
 #ifdef CONFIG_PARAVIRT
-struct static_key;
-extern struct static_key paravirt_steal_enabled;
-extern struct static_key paravirt_steal_rq_enabled;
+#include <linux/jump_label.h>
+DECLARE_STATIC_KEY_FALSE(paravirt_steal_enabled);
+DECLARE_STATIC_KEY_FALSE(paravirt_steal_rq_enabled);
 
 #ifdef CONFIG_HAVE_PV_STEAL_CLOCK_GEN
 u64 dummy_steal_clock(int cpu);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5c07d53e43b5..84d090581a08 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -795,7 +795,7 @@ struct rq *_task_rq_lock(struct task_struct *p, struct rq_flags *rf)
 
 /* Use CONFIG_PARAVIRT as this will avoid more #ifdef in arch code. */
 #ifdef CONFIG_PARAVIRT
-struct static_key paravirt_steal_rq_enabled;
+DEFINE_STATIC_KEY_FALSE(paravirt_steal_rq_enabled);
 #endif
 
 static void update_rq_clock_task(struct rq *rq, s64 delta)
@@ -834,7 +834,7 @@ static void update_rq_clock_task(struct rq *rq, s64 delta)
 	}
 #endif
 #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
-	if (static_key_false((&paravirt_steal_rq_enabled))) {
+	if (static_branch_unlikely(&paravirt_steal_rq_enabled)) {
 		u64 prev_steal;
 
 		steal = prev_steal = paravirt_steal_clock(cpu_of(rq));
diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 06bddaa738e5..f16970ca81d0 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -255,7 +255,7 @@ void __account_forceidle_time(struct task_struct *p, u64 delta)
  * occasion account more time than the calling functions think elapsed.
  */
 #ifdef CONFIG_PARAVIRT
-struct static_key paravirt_steal_enabled;
+DEFINE_STATIC_KEY_FALSE(paravirt_steal_enabled);
 
 #ifdef CONFIG_HAVE_PV_STEAL_CLOCK_GEN
 static u64 native_steal_clock(int cpu)
@@ -270,7 +270,7 @@ DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
 static __always_inline u64 steal_account_process_time(u64 maxtime)
 {
 #ifdef CONFIG_PARAVIRT
-	if (static_key_false(&paravirt_steal_enabled)) {
+	if (static_branch_unlikely(&paravirt_steal_enabled)) {
 		u64 steal;
 
 		steal = paravirt_steal_clock(smp_processor_id());
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
