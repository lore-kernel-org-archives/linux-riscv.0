Return-Path: <SRS0=NJ9D=AF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC04C433E1
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2020 09:03:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2093E20B1F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2020 09:03:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CInsC3tx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="CNSsQcuu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2093E20B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyVqkM40AiOsAg+j78MyxHfHdYwDl2AeAQXEconDUJw=; b=CInsC3tx39AJ0ntR5PG0dC+lI3
	86QRd17AjMGUUYmJetzqpz5GjM/ULHWNOv7gfKl6jn44mvLXr6OL/O86nQOr98QbShB2mI1SK6caG
	BgHse2HLvyMgY6O6JaLRFP+LJ5foYJtfWYxHxbErLVxcriP235nhU17QyhjJgzJTkcNzi3WAXdj+5
	zqwIItdfsLXeHJjq1FAIqt62m87XG/WnwGH1tdaS5ekxiGGrg+1UzTJ4tlJn4m1mD9PGrIzjoiBwo
	wQAsFtHag3LPC66Cz7A3v8ccnwdUYgXd5HtxwG7rKnHn7clYmqKEY+fKgiCQGErsjm6vx6YZF8Ful
	F5Sc//2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo1Jc-0001Cq-Ax; Wed, 24 Jun 2020 09:03:32 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo1Ja-0001Bd-IV
 for linux-riscv@lists.infradead.org; Wed, 24 Jun 2020 09:03:31 +0000
Received: by mail-pj1-x1043.google.com with SMTP id q90so419199pjh.3
 for <linux-riscv@lists.infradead.org>; Wed, 24 Jun 2020 02:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gKNJSJH3SZ7s7ZY0q11chWiPCztbqXJoTwSFOWOwg0g=;
 b=CNSsQcuuIGwLhEkgYiQPdmaAFo4ZfVKGzVEe55xFjnpR71t/Ywd+JdQugR3swayRFC
 l0/kz1bAJPcmDeLj7WdLn+GBQsdAZMKk7gRyI0jtDuPz+xhu3C8R3LS873Vgq058Ma/A
 wWcEW6AvJEaxoSMN8KmRcYaGS94pnex6fxRLM26qUp5cQHXiY5NOCX27COlnH+Tar202
 NmVaiwxJh+bimEHBDyQmwiaZnlwaYpwMKHU6aHCpMzxtKgAqyUr2Ha+ChMWO3elTS3wx
 HAnu7cFJ9A2qSHnx88eZfUlbPxaFXRAGzWODgN3sEPcDe6y7YEZ/9APZRwPmIAOKY3dw
 Duug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gKNJSJH3SZ7s7ZY0q11chWiPCztbqXJoTwSFOWOwg0g=;
 b=XmUS4kCO83Osw+xW8asXGavFgqK6uhoHJxOt+45bwiXb//XVCnN/uGmoMkz+GY9e3r
 7EdfGOxVfjwS+1CtKGE9QIQBcT4XMRS9lQhZk1yPlxuIGUK/JcqmE8FF9qW3JYCcORm/
 Di9JWkH5bsYijVktYSO/69/exZOqRUI+rqtfoC+5JAkPPDMcCdeRlDfagLdd1rHhR8Ks
 fMs5Tyd4ppb7U/ByeXPewcrSvn1/TZsU9DTSVNrp8MeNWq4sK+askfm2CY66vm85Gn9q
 80PHj4cy86vnOTeH0zVfo45wz3IAdL8CeFSJtBArBMtLf8YrZBxyoXI81GnVMKi4b+Jh
 xBCg==
X-Gm-Message-State: AOAM531AC/3glnjkMkQV9OUuF/fvU8ueNgGEAxbNr5h7hszyObI/XLuQ
 G//7brC/Oy0L0qaq8J1KKK0LuQ==
X-Google-Smtp-Source: ABdhPJylRi6vyu5/NoCH/pS0CM/oiFPlDLXN/6Yq2cgajLPQtbKymDeDQJfnp2CmE9t6NMDnFvtNRA==
X-Received: by 2002:a17:902:fe8b:: with SMTP id
 x11mr27271421plm.179.1592989407445; 
 Wed, 24 Jun 2020 02:03:27 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id v1sm8062046pfn.210.2020.06.24.02.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 02:03:26 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com, guoren@linux.alibaba.com
Subject: [PATCH v2 1/2] riscv: Support irq_work via self IPIs
Date: Wed, 24 Jun 2020 17:03:15 +0800
Message-Id: <283e048d23d124f390fbe9087addef1a7dce0027.1592989082.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1592989082.git.greentime.hu@sifive.com>
References: <cover.1592989082.git.greentime.hu@sifive.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Support for arch_irq_work_raise() and arch_irq_work_has_interrupt() was
missing from riscv (a prerequisite for FULL_NOHZ).

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/irq_work.h | 10 ++++++++++
 arch/riscv/kernel/smp.c           | 15 +++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 arch/riscv/include/asm/irq_work.h

diff --git a/arch/riscv/include/asm/irq_work.h b/arch/riscv/include/asm/irq_work.h
new file mode 100644
index 000000000000..d6c277992f76
--- /dev/null
+++ b/arch/riscv/include/asm/irq_work.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_IRQ_WORK_H
+#define _ASM_RISCV_IRQ_WORK_H
+
+static inline bool arch_irq_work_has_interrupt(void)
+{
+	return true;
+}
+extern void arch_irq_work_raise(void);
+#endif /* _ASM_RISCV_IRQ_WORK_H */
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index b1d4f452f843..554b0fb47060 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -16,6 +16,7 @@
 #include <linux/sched.h>
 #include <linux/seq_file.h>
 #include <linux/delay.h>
+#include <linux/irq_work.h>
 
 #include <asm/clint.h>
 #include <asm/sbi.h>
@@ -26,6 +27,7 @@ enum ipi_message_type {
 	IPI_RESCHEDULE,
 	IPI_CALL_FUNC,
 	IPI_CPU_STOP,
+	IPI_IRQ_WORK,
 	IPI_MAX
 };
 
@@ -123,6 +125,13 @@ static inline void clear_ipi(void)
 		clint_clear_ipi(cpuid_to_hartid_map(smp_processor_id()));
 }
 
+#ifdef CONFIG_IRQ_WORK
+void arch_irq_work_raise(void)
+{
+	send_ipi_single(smp_processor_id(), IPI_IRQ_WORK);
+}
+#endif
+
 void handle_IPI(struct pt_regs *regs)
 {
 	struct pt_regs *old_regs = set_irq_regs(regs);
@@ -158,6 +167,11 @@ void handle_IPI(struct pt_regs *regs)
 			ipi_stop();
 		}
 
+		if (ops & (1 << IPI_IRQ_WORK)) {
+			stats[IPI_IRQ_WORK]++;
+			irq_work_run();
+		}
+
 		BUG_ON((ops >> IPI_MAX) != 0);
 
 		/* Order data access and bit testing. */
@@ -173,6 +187,7 @@ static const char * const ipi_names[] = {
 	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
 	[IPI_CALL_FUNC]		= "Function call interrupts",
 	[IPI_CPU_STOP]		= "CPU stop interrupts",
+	[IPI_IRQ_WORK]		= "IRQ work interrupts",
 };
 
 void show_ipi_stats(struct seq_file *p, int prec)
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
