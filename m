Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3339EF34C4E
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 12:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yoIr7WN7uBa8kd878l+QrxWv2GYJ6ZaOhXy99GTfm94=; b=A95rtoXINpi5Vc
	+53Ispiv6HEj6H5MFm0IQq+REolSSaptHZUHxdGiOVE1t0QRf+Czbv46wXlqrlT1T66TkmP3r5/5O
	/YOACTx1GyyzRN2U+xeuaaEM9vIZOjCebG9bG6QSLAV/G2F6b2CHJvX8Va4CQMyatXVYJJN1dB7xx
	A7SQehLyDqtZ6DoisGqSk5ctTeqFT/b8b1hbjnt2F98glwzyQ6RIET1iuIiCKd56sdCfIzj8byA1N
	G19WL8b/HgDqYZpNldIbn64x7OQ9Qcwf9OStVZW2nSVCQSfK6JxcmhY375X/fP57nwTawo19XGcOP
	bxVSjtj8gTlfm31I+j5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGVv-0000000Ff9c-28bJ;
	Mon, 13 Apr 2026 12:35:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGVt-0000000Ff93-3Fqq
	for linux-riscv@bombadil.infradead.org;
	Mon, 13 Apr 2026 12:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=P6zzvTLN1JrRUNMR9aCambxors+jnMs+d47ckhID+zY=; b=Y0w+TNA9dgLhJtblnju20+1B1j
	8gpAlVdMcTop+hBmf84zljg43hLZGVJdnQViMtAnvAQhO1tgmXJwk8+bc7UX9MiYFC5XDp3T578Dt
	ZxOTqeURsncvuAUROYeRyqJEeY7EGJ7cipQrtoeuMrpOTyNzIA5OmHg1SNkviAy/eXpjRZAv0VXtu
	KGlWD+KHnrqmuLrnOQ3KC7/XYYUjD3y45KvFfWRL5FRBPDBJGgu1pb1fVfzq/jVVurGo40/uN6jMS
	R5xCKt6yDL5B8CYvNj90huMR8g+RCoub7zq9CPzlKAzXCQ5Rb9HRyi0wHhMxBe+AZ40BOxiU7TYqG
	XRDVrwyQ==;
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGVq-0000000GnHV-3eLn
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 12:35:36 +0000
Received: from hwang4-g16.. (unknown [183.241.38.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 80AD43FB0C;
	Mon, 13 Apr 2026 12:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1776083733;
	bh=P6zzvTLN1JrRUNMR9aCambxors+jnMs+d47ckhID+zY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=Pr+lJ0V6+00McCAmtrFZQefPKzgx2fSLPaou8CDY/0gUXo2Gqk1oOl+mj5p3Rj6J+
	 J18t9K+eOH13b1c8JrC3NZAxCZbbaOxbPIotF0WwXO1MbJgRmX8KIC5U8Rkgv1mPZe
	 RjO8x0jdIOvK5EiALcajXnDDfk3p0JMlFifk2XjEF9H3LsmIQHoR5jOfCuegMx3Vf2
	 /pxjH+94mPjYLPRZzSHhD+Z64VHKdLJI2rYSz22NgixAlPqz5IU4ZXfhY4DgF/XZxo
	 N5EomlRKQi1KFG6kAstZfSYcsc9F28bxItpYhrVrqiNWUxucnHRCvpZ8OCP97+UBHB
	 1zU1vzu/a5qrU4m2UM4PjGJm5gRk7a2DZVpLTAAW5OIWEWEfoIE9AmP/Z/ARbfNz0H
	 v8OteBkSNtsbQ/W4IQlJYqlPbkeu296HQOSYpZ3ROTTMrwf08QJ5xpe7n5ytrFnztk
	 X79uUY5ezL4wLAQAHckVKNuzouoioBX1zyi3I7643axEvIBKvyQMad1ql9yVRVqvhF
	 E3hfDeF9gJ8PPpZCk5Xyqey8Dpf9wifYMwcc88IvnKiKyPLduftM2x9RFynrdjqAJI
	 MkBMOY5QhdHvG8oMGYnVk+W69HmpdDpEJA6gqPvMIYdyXGd7Ll2nwq1nsQFzrlXQm9
	 7VvWh0vm3bRPJySwSp4udTvg=
From: Hui Wang <hui.wang@canonical.com>
To: linux-riscv@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	danil.skrebenkov@cloudbear.ru,
	ajones@ventanamicro.com,
	atish.patra@linux.dev
Cc: hui.wang@canonical.com
Subject: [PATCH v1 1/2] riscv: cpu_ops: Change return value type of cpu_is_stopped() to bool
Date: Mon, 13 Apr 2026 20:35:14 +0800
Message-ID: <20260413123515.48423-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_133535_005037_14979261 
X-CRM114-Status: GOOD (  15.85  )
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

In the original sbi_cpu_is_stopped(), if rc doesn't equal to the
SBI_HSM_STATE_STOPPED, it will return rc to the caller directly. But
there is a hidden problem, the rc could be SBI_HSM_STATE_STARTED, if
so, this function will report cpu stopped while the cpu isn't really
stopped.

Furthermore, from the name of cpu_is_stopped(), it gives a sense the
return value is a bool type, true means the cpu is stopped, conversely
false means the cpu is not stopped.

Here change the return value type to bool and change the callers
accordingly. This could fix the above two issues.

Fixes: f1e58583b9c7c ("RISC-V: Support cpu hotplug")
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
In the v1:
move the cpu status number printing from arch_cpuhp_cleanup_dead_cpu()
to sbi_cpu_is_stopped().

 arch/riscv/include/asm/cpu_ops.h |  2 +-
 arch/riscv/kernel/cpu-hotplug.c  |  4 ++--
 arch/riscv/kernel/cpu_ops_sbi.c  | 11 +++++++----
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/cpu_ops.h b/arch/riscv/include/asm/cpu_ops.h
index 176b570ef982..065811fca594 100644
--- a/arch/riscv/include/asm/cpu_ops.h
+++ b/arch/riscv/include/asm/cpu_ops.h
@@ -24,7 +24,7 @@ struct cpu_operations {
 				     struct task_struct *tidle);
 #ifdef CONFIG_HOTPLUG_CPU
 	void		(*cpu_stop)(void);
-	int		(*cpu_is_stopped)(unsigned int cpu);
+	bool		(*cpu_is_stopped)(unsigned int cpu);
 #endif
 };
 
diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
index a0ee426f6d93..3b9fa03f02a9 100644
--- a/arch/riscv/kernel/cpu-hotplug.c
+++ b/arch/riscv/kernel/cpu-hotplug.c
@@ -57,8 +57,8 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 	/* Verify from the firmware if the cpu is really stopped*/
 	if (cpu_ops->cpu_is_stopped)
 		ret = cpu_ops->cpu_is_stopped(cpu);
-	if (ret)
-		pr_warn("CPU%u may not have stopped: %d\n", cpu, ret);
+	if (!ret)
+		pr_warn("CPU%u may not have stopped.\n", cpu);
 }
 
 /*
diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index 00aff669f5f2..b6de2b2f8deb 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -88,16 +88,19 @@ static void sbi_cpu_stop(void)
 	pr_crit("Unable to stop the cpu %d (%d)\n", smp_processor_id(), ret);
 }
 
-static int sbi_cpu_is_stopped(unsigned int cpuid)
+static bool sbi_cpu_is_stopped(unsigned int cpuid)
 {
 	int rc;
 	unsigned long hartid = cpuid_to_hartid_map(cpuid);
 
 	rc = sbi_hsm_hart_get_status(hartid);
 
-	if (rc == SBI_HSM_STATE_STOPPED)
-		return 0;
-	return rc;
+	if (rc != SBI_HSM_STATE_STOPPED) {
+		pr_warn("HART%lu isn't stopped and the status number is: %d\n", hartid, rc);
+		return false;
+	}
+
+	return true;
 }
 #endif
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
