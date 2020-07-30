Return-Path: <SRS0=rfC7=BJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8794C433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2020 00:25:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4A292074B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2020 00:25:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BV42XNUS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Y2pB+3dU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4A292074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jXMRXGgT2gtVAzTy1MIzZw3bGf8va/1kzMQ5J1W51S4=; b=BV42XNUSbKruS3mJ9XtZIDamlK
	ZwErJGzQVif2vK9nyAk0D0jUEp3rg1sRoNAiPxOO9k5B0dYXuS1Wt2aFw9ZgH6c38ZB8fioUYrxeh
	mU4rRpx0Caq5l7GbGdE+5SbmKCRQpXFYi3Gm2/GruIOjCNotIJDtt8/As7KTCzMcmN4yhP32gHfn0
	5f8Mdmq7Z3+SnKDMHV3b8hDJPsDthGGGbM81YO7SByP/CDwPCJdPWMKUHb6hlKQ3oPtoAqQTEs8sG
	PghdejOGCHmsCAPq23iUpDivXoOhnslIT6IGMxmDaAdJJozCAS8v2Zp631RQOqBLB48vIdvTJmNPy
	jSWh8Obg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0wOG-0002sJ-J8; Thu, 30 Jul 2020 00:25:44 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0wOE-0002rR-3W
 for linux-riscv@lists.infradead.org; Thu, 30 Jul 2020 00:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1596068742; x=1627604742;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eZTfMgiK2vEeMZsD5lwwoP2zVvgB9NQ0c2HdLF8qwXA=;
 b=Y2pB+3dUzYNKIH4Hgm1u3Jp/I1YIZ7S4rrTOkSR3m8UQBJ51RVNpUmA+
 4IXZ2GYjl89lzljzuRWFK+JKURpnjs8dEzupuQ5u8TP/mMMqzi+HX4tQp
 hDk6rloMmIAJAjtqCbHDwDnrJN4hXGjhFCcSAaEDulT8/7faUPzj80Jva
 e9n21+CBsudezvw3p8EVlVs86BwvuQ5KJoZdC0dTIeZrZ8qHEa6kv64gT
 4zSEQK5IqfEjbsnOvuyd5laAwvcqVce4f8uJP25loY7XFjtYV15s69ulQ
 W8Z1Nsw2OLEe75h+mcMtn61qgCocQS60TBa6REGRTSQanjabr2+K7Q0QK w==;
IronPort-SDR: 1Oltbrw0YIeY7mfmS7+3EFdw8Mj5GRe6W2E+f/JGnt1TDa1gCzZ96FKAw1g3nhBg0hK31iMIaQ
 1NRyP9GXTL52+WDe/y0YQ+y8DdtQTGcMUxdo44sVBSn1x0fnjbmJwa/u8V7THQ9zdO06l7rARn
 77QhmOhyyui/pzWUtVwVb8ZY/7Yt7gOodDR2j0Z0jo+MMHl94SDY06ZC2JuSOpIvkScZkkfiCx
 O4bL5kSK+an3rv6NAS3bXElm5xBaU0G/ZfnPP0d7OPCo2ySDd+SR1d4RPuEgvx1wAA+5tieRIS
 G70=
X-IronPort-AV: E=Sophos;i="5.75,412,1589212800"; d="scan'208";a="148012915"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Jul 2020 08:25:40 +0800
IronPort-SDR: CYONn8SP59f2fBAdzin8kOYHRgd3+EMXRqbzJyCgT5+hQDd0tcIyDpbJtA70T2mwM7tss1qw4G
 uJGdOKsN6WWN7Wh8pK0jvIwAvRD1V+nf8=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 17:13:09 -0700
IronPort-SDR: 6UJWOZcUcSr7TfQqXrqD26zZiC1kzKQxJVo8FI0jW1AO2FT4vnNLnamB+KCsFFg/X6LmkZwDOT
 CyVema/uVjpw==
WDCIronportException: Internal
Received: from jpf009043.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.210])
 by uls-op-cesaip02.wdc.com with ESMTP; 29 Jul 2020 17:25:40 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: Fix build warning for smpboot.c
Date: Wed, 29 Jul 2020 17:25:35 -0700
Message-Id: <20200730002535.17335-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_202542_388714_5D92AC92 
X-CRM114-Status: GOOD (  13.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following warnings are reported by kbuild with W=1.

>> arch/riscv/kernel/smpboot.c:109:5: warning: no previous prototype for
'start_secondary_cpu' [-Wmissing-prototypes]
     109 | int start_secondary_cpu(int cpu, struct task_struct *tidle)
         |     ^~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/smpboot.c:146:34: warning: no previous prototype for
'smp_callin' [-Wmissing-prototypes]
     146 | asmlinkage __visible void __init smp_callin(void)
         |                                  ^~~~~~~~~~

Fix the warnings by marking the local functions static and adding the prototype
for the global function.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/smp.h | 3 +++
 arch/riscv/kernel/smpboot.c  | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 40bb1c15a731..6dfd2a1446d5 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -40,6 +40,9 @@ void arch_send_call_function_single_ipi(int cpu);
 int riscv_hartid_to_cpuid(int hartid);
 void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out);
 
+/* Secondary hart entry */
+asmlinkage void smp_callin(void);
+
 /*
  * Obtains the hart ID of the currently executing task.  This relies on
  * THREAD_INFO_IN_TASK, but we define that unconditionally.
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 4e9922790f6e..c09fbdf924b1 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -106,7 +106,7 @@ void __init setup_smp(void)
 	}
 }
 
-int start_secondary_cpu(int cpu, struct task_struct *tidle)
+static int start_secondary_cpu(int cpu, struct task_struct *tidle)
 {
 	if (cpu_ops[cpu]->cpu_start)
 		return cpu_ops[cpu]->cpu_start(cpu, tidle);
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
