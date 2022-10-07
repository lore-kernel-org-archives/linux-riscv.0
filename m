Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE8DC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Oct 2022 15:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rNvyXkRyQTxTRFgCs3PDzojJrRrVvqm176HnyJoeuuc=; b=UIV0OAPuWyv3T9
	aw2e/DUXGWeWNQTZxEADa0ua5XeSt7XtiSTM+InA83j0Or/u80DDojTJFqq6gyfrxQIzHtroII7e/
	B5UMn2C3FkfU6injL/HHVm9ZsKJO4FdezY4Z9wzoP5Z3TlP2VGkCzlWU2C+E53ERpSWUnHTMC79m7
	8tj5pWSirrH8SVhTDVKI7YTnrAiVRjWKIQLpZ9e8WsyeEZ8bvKMvcYMLYzWK7LqpzVmDLMvcvqF0h
	tMUmPEbqqBCvBa3eCSvtF11m3tR/5CyKTA5GjcN5a7ri0Va5uC8LPpfrmZQmICKiR/SX3jo5DCDWQ
	g/myPdo/canHJJWpD1lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogpYA-009YTJ-Pu; Fri, 07 Oct 2022 15:46:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogpY0-009YLe-Th
	for linux-riscv@lists.infradead.org; Fri, 07 Oct 2022 15:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665157560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jAXnJ0u7W03NIJPSLVmnFtjZEFHwdySA+neP8cndke0=;
	b=GLLbTF30azc1pZbTjBJ+4gRcsf8/pmPVSrSf5CB52IhH/CHfbDTRYFIlq3prEYPSG7zdRp
	8+o2Pz+w6CEL6NY1VwWyZqmdmuvdSZxzpqDLOCcUOKxer021CJS4DgjVaebJDS7379aJzI
	huG+Hjn8UjoX/49vWHHgF0y8g/LN7zI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-441-o--m3V1YNwmSHUCRYGsX0g-1; Fri, 07 Oct 2022 11:45:59 -0400
X-MC-Unique: o--m3V1YNwmSHUCRYGsX0g-1
Received: by mail-wr1-f70.google.com with SMTP id e14-20020adf9bce000000b0022d18139c79so1561012wrc.5
        for <linux-riscv@lists.infradead.org>; Fri, 07 Oct 2022 08:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAXnJ0u7W03NIJPSLVmnFtjZEFHwdySA+neP8cndke0=;
        b=BiK3kuj1QKU1jeruN7p43Hp52mlhPpuTaqu/Q00z22jrXCMb9rs9tsZ9SG/fToRiw7
         yIkaTzECvXKMMEaIp08jNd2GghjINsLaJer7zHSxDVUr41n65muIAoYrAqzg6SUCqLei
         qmlVtbDxFCj+MhplB6WqQIZ2o9jPN4LpWV5MN/X+oWGir67ypVFgG97CtbbVRsjh+DpT
         e9auoO3rD8EDesb251Ae187EapY/+FFeLM+TsB/8oICrphNeW9rxj644ealjhEo9SZ4A
         EPBo8Um4xGC27KCc7BsVhrMEp4B7GYYvUr41rxdZKs+loFrf+V/Cyf194qjihMpcGwZw
         TmoQ==
X-Gm-Message-State: ACrzQf1Lmc4zuNNRbiMpzgfJURRSQ6yzwvef9sQBKNYKuV2KKxd8S+kt
	wv+owrrUXENOzS33oKHh1XZ85bYHJ24CVUSiAZ9JNSM++hf9HHk3bTwhKm7W0wG2mfTQLdl1J8a
	Y1jbeV25cZ+fhTI4RIJpLJaiQAUTq
X-Received: by 2002:a05:600c:1d11:b0:3b4:7644:b788 with SMTP id l17-20020a05600c1d1100b003b47644b788mr4004368wms.114.1665157556407;
        Fri, 07 Oct 2022 08:45:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5EpDwoqxaA3kuqs1iO/JBIwLdmLfBJiR2SaBRc8PnLfbv3ObEmlrGj1DHjl4vmQIuUA923ig==
X-Received: by 2002:a05:600c:1d11:b0:3b4:7644:b788 with SMTP id l17-20020a05600c1d1100b003b47644b788mr4004355wms.114.1665157556194;
        Fri, 07 Oct 2022 08:45:56 -0700 (PDT)
Received: from vschneid.remote.csb ([149.71.65.94])
        by smtp.gmail.com with ESMTPSA id i18-20020adfb652000000b0022e38c93195sm2339428wre.34.2022.10.07.08.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 08:45:55 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	x86@kernel.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicholas Piggin <npiggin@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: [RFC PATCH 2/5] sched, smp: Trace send_call_function_single_ipi()
Date: Fri,  7 Oct 2022 16:45:30 +0100
Message-Id: <20221007154533.1878285-2-vschneid@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221007154145.1877054-1-vschneid@redhat.com>
References: <20221007154145.1877054-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_084601_061161_E2ED4CC3 
X-CRM114-Status: GOOD (  15.69  )
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

send_call_function_single_ipi() is the thing that sends IPIs at the bottom
of smp_call_function*() via either generic_exec_single() or
smp_call_function_many_cond(). Give it an IPI-related tracepoint.

Note that this ends up tracing any IPI sent via __smp_call_single_queue(),
which covers __ttwu_queue_wakelist() and irq_work_queue_on() "for free".

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/arm/kernel/smp.c   | 3 ---
 arch/arm64/kernel/smp.c | 1 -
 kernel/sched/core.c     | 7 +++++--
 kernel/smp.c            | 4 ++++
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 978db2d96b44..3b280d55c1c4 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -48,9 +48,6 @@
 #include <asm/mach/arch.h>
 #include <asm/mpu.h>
 
-#define CREATE_TRACE_POINTS
-#include <trace/events/ipi.h>
-
 /*
  * as from 2.5, kernels no longer have an init_tasks structure
  * so we need some other way of telling a new secondary core
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index ffc5d76cf695..937d2623e06b 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -51,7 +51,6 @@
 #include <asm/ptrace.h>
 #include <asm/virt.h>
 
-#define CREATE_TRACE_POINTS
 #include <trace/events/ipi.h>
 
 DEFINE_PER_CPU_READ_MOSTLY(int, cpu_number);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 60fdc0faf1c9..14e5e137172f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -81,6 +81,7 @@
 #include <linux/sched/rseq_api.h>
 #include <trace/events/sched.h>
 #undef CREATE_TRACE_POINTS
+#include <trace/events/ipi.h>
 
 #include "sched.h"
 #include "stats.h"
@@ -3753,10 +3754,12 @@ void send_call_function_single_ipi(int cpu)
 {
 	struct rq *rq = cpu_rq(cpu);
 
-	if (!set_nr_if_polling(rq->idle))
+	if (!set_nr_if_polling(rq->idle)) {
+		trace_ipi_send_cpu(_RET_IP_, cpu);
 		arch_send_call_function_single_ipi(cpu);
-	else
+	} else {
 		trace_sched_wake_idle_without_ipi(cpu);
+	}
 }
 
 /*
diff --git a/kernel/smp.c b/kernel/smp.c
index e8cdc025a046..7a7a22d69972 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -26,6 +26,10 @@
 #include <linux/sched/debug.h>
 #include <linux/jump_label.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/ipi.h>
+#undef CREATE_TRACE_POINTS
+
 #include "smpboot.h"
 #include "sched/smp.h"
 
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
