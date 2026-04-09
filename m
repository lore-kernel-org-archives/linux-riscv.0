Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D28EA3C4E
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 13:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ok1cWzSTH9/30GaYHEcAYIyY6irIODUDh+JGDl1GkdA=; b=aC+2+2Crp+aUQf
	i+9xu7eeSw0HMOXtZs18W+f7en/ZCaQkLQwvdbf9JvyFxoujbbFUOr+TWDDlmxahY1mgKfD6C406U
	6vbBmn8sWZ4oNM1eR8dZZY68K2WImgz+fLihPY83mW9w7P6T2Pau3BY9uaJhOl75x6ZC2YS3kw6sn
	bgeCMhq6b3ViZpLKmHKNwSG7uyiZ8l5pFZ5I7k3A7KIHvrTrlwuEcBo2VPEyHKhf0a68RdT11RTcE
	5WWWOmIzPLA+d7zuCbUJ2MDxe6izIbp2/b3CQPOPAaiYuBKXWxO9jmtdp9oaPeYovsh0WFEuAJoqb
	htn/z7aTC1EnwO4yGvzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApVU-0000000AWbm-2Gu7;
	Thu, 09 Apr 2026 13:33:16 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApVR-0000000AWaw-0EGY
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 13:33:15 +0000
Received: from hwang4-g16.. (unknown [183.241.38.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 1D9264048E;
	Thu,  9 Apr 2026 13:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1775741588;
	bh=Xpm2D5TcEuqLLAf1b+PWN88ZL4qdhmIG6N5Wd0zEWTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=jJET2GVNwxPO3Xa3Wykxn9DZvq+w8DyL5uqFBDPxJmyecEHHvMpolyucuacwYcW9p
	 Eb1BVtu9f0BYt5Az9C0J94dpJrScPHESBQh0vQAVHkms1994sbK7yEhAjF0Aqr5cVX
	 nY2uzX3omEPfEcPryWtOyvJuYEg5h7oLwHOuxe7eef62QmNT/HAzC/1l9l9KAiIbp2
	 r5dNM6qWxDGK5WTsC4i6Vk6eSSc0aFXZOppWKoFzxHrWxxi6dqK5hLwZBc3Ug3hEww
	 o4WRzfaJoKRmN58wdSObqyIJ9b6HQKUhYSGNtrIedX/XgkdZjDvvt9RqMWJwM3beAS
	 7CSVApIMBq2cCAh4OkLJE4jJ6CMXjyfYL9743tnn0vbYXCDPUG8NF/kebRwu3CYiXz
	 SanaasTAo2t5mvnBvbW7qynhcXHLCmoFNAg1TErdTcdQAwOnhGuu9Nem0fPmssTOGR
	 yg/gmVEXBoSxREfm6M1piYWUeocDcxLhR/qYmqBcBfk90omvl/UKLbz1MD03lpTi6r
	 a51KFT6s8DHeZ75WmShlj5NvsID5eLkr8FWIp0pzWC2hOe9iGeJXU75Uh9V2u9CRQR
	 gs0+wmT03XUPk0rQT25uwmVSL/x0l/zmLVjlXOHETfoASUVC1E9014SPA19cd6Za5S
	 KNlXEKg/u9HTiCpffDQ21KtI=
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
Subject: [PATCH 1/2] riscv: cpu_ops: Change return value type of cpu_is_stopped() to bool
Date: Thu,  9 Apr 2026 21:32:46 +0800
Message-ID: <20260409133247.76215-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_063313_478381_1AF2A558 
X-CRM114-Status: GOOD (  15.49  )
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
 arch/riscv/include/asm/cpu_ops.h | 2 +-
 arch/riscv/kernel/cpu-hotplug.c  | 2 +-
 arch/riscv/kernel/cpu_ops_sbi.c  | 6 ++----
 3 files changed, 4 insertions(+), 6 deletions(-)

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
index a0ee426f6d93..c240e9be9fba 100644
--- a/arch/riscv/kernel/cpu-hotplug.c
+++ b/arch/riscv/kernel/cpu-hotplug.c
@@ -57,7 +57,7 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 	/* Verify from the firmware if the cpu is really stopped*/
 	if (cpu_ops->cpu_is_stopped)
 		ret = cpu_ops->cpu_is_stopped(cpu);
-	if (ret)
+	if (!ret)
 		pr_warn("CPU%u may not have stopped: %d\n", cpu, ret);
 }
 
diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index 00aff669f5f2..a17b7576b77d 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -88,16 +88,14 @@ static void sbi_cpu_stop(void)
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
+	return (rc == SBI_HSM_STATE_STOPPED);
 }
 #endif
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
