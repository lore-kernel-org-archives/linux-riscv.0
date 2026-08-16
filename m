Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FB2C5DF6D
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 07:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0X9875KWRnaNpIzGIyHH0dE2qOweaRY1YpIm/W7tPYA=; b=MfOKAZOtdEJIeW
	7LH+YyTaVU5/e7tkPI8gQwpE15KKtlF51ug6BGjoIR2YjXFy/+xR5QPuqYBcjQwe6bcpHEe/2/jGJ
	jQN3hR5/K652o9alGI1FSOxRYFeI7kKp7O6SgAMmLd4kRPBLPuhutd+hJy2eSqlk778TutUlOnz5I
	xeiDqavv8XqPcVBpGHqx9KWRvYizgUc38POmTv/BVi7e/ktLS6WWkg7L1LzpYxqEToseom5xtMi1J
	BSXg1F9ji5pdpTfLHKmrHmj2TDzNE47ijCxKMCxSMxpDiqIVOBq2WcgeJ2Gz2kS+9fDUFzsasjAFP
	nDUZuE/sVrQob9PHFmjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvUrl-00000004XcM-0YJK;
	Sun, 16 Aug 2026 07:01:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvUrj-00000004Xbw-40Cz
	for linux-riscv@lists.infradead.org;
	Sun, 16 Aug 2026 07:01:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6748160120;
	Sun, 16 Aug 2026 07:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26DF81F00A3A;
	Sun, 16 Aug 2026 07:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786863667;
	bh=4UTcja3qkQaBcJbDA3wKGz+X1tVOnwXVEanKk8tH76s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a/qZzLek3LA2KYN8J3cNK4mfzniQaCkmnd5sixczVuK9lNKuWCgJYvjIQzmJ3pHCn
	 RCqiohQiDp2YnD4dcoTN9mwTwzcSE+0M78CvexNM4BR4Y+ZA6oLTULXCAt4oJzyCv6
	 10ETy9jt3X5HCgG8l5UJlb3zYqmDe4fUhR3PfxFX/QsuWLdJk6LSWuJ7E+bmTXO1E0
	 dTO9SA/k6xpTggKkMQG9FJXLPoN2bF6eYbp1nkhcGMQpiQITpyeZV8Kz8vNGEDPozQ
	 GVrGklR/XnkrwNBJV/J75W6LUKojY3Fhtq2oI80swPuFmHObp00uObUlkXGOIkRBqp
	 wXlEJvPYcQTGQ==
From: Guo Ren <guoren@kernel.org>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	daniel.lezcano@kernel.org,
	anup@brainfault.org,
	hui.wang@canonical.com,
	samuel.holland@sifive.com,
	"GUO Ren (XuanTie)" <guoren@kernel.org>
Subject: [PATCH 1/5] riscv: smp: Move enum ipi_message_type to asm/smp.h
Date: Sun, 16 Aug 2026 07:00:45 +0000
Message-ID: <20260816070049.2097442-2-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816070049.2097442-1-guoren@kernel.org>
References: <20260816070049.2097442-1-guoren@kernel.org>
MIME-Version: 1.0
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

From: "GUO Ren (XuanTie)" <guoren@kernel.org>

The IPI message type enumeration (and therefore IPI_MAX) is currently
private to arch/riscv/kernel/smp.c.  Several IPI providers need to know
the exact number of IPIs that the architecture requires, so move the
enum into the public header.

This is a pure code movement with no functional change.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 arch/riscv/include/asm/smp.h | 12 ++++++++++++
 arch/riscv/kernel/smp.c      | 12 ------------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 0ecc67641b09..bed39fff1f8a 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -15,6 +15,18 @@
 struct seq_file;
 extern unsigned long boot_cpu_hartid;
 
+enum ipi_message_type {
+	IPI_RESCHEDULE,
+	IPI_CALL_FUNC,
+	IPI_CPU_STOP,
+	IPI_CPU_CRASH_STOP,
+	IPI_IRQ_WORK,
+	IPI_TIMER,
+	IPI_CPU_BACKTRACE,
+	IPI_KGDB_ROUNDUP,
+	IPI_MAX
+};
+
 #ifdef CONFIG_SMP
 
 #include <linux/jump_label.h>
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index fa66f9c97d74..8930b62b15e7 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -28,18 +28,6 @@
 #include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
 
-enum ipi_message_type {
-	IPI_RESCHEDULE,
-	IPI_CALL_FUNC,
-	IPI_CPU_STOP,
-	IPI_CPU_CRASH_STOP,
-	IPI_IRQ_WORK,
-	IPI_TIMER,
-	IPI_CPU_BACKTRACE,
-	IPI_KGDB_ROUNDUP,
-	IPI_MAX
-};
-
 static const char * const ipi_names[] = {
 	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
 	[IPI_CALL_FUNC]		= "Function call interrupts",
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
