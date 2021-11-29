Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DD4C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 21:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:
	Mime-Version:Message-Id:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=QY8enAJ8M76ouR/dHhUllxnhFj7RJOWtf7+jAsoR5yI=; b=tD9
	7FQZx8hPJ4mWF0G1dEcTrlMrDP37Z/YXqH3XTj7etrmXOKQP1YBnN7remJGyFIa6+cwJWaTumhxul
	DI1Tlx2yhD/+43pWzso/KsrNBMvpyo7kRd+wT/vENBRDF1ylho56KxtEiejYxrLSaJMekvQld7RLV
	yDTuL4AXO1i9aCqsnbcSd8XSa9aXGbwi9WSBsh1bLoJFg1nKGMVPiYjzsV5q54rXhmsfhRVSJBTdj
	WB7tU5N5DIT/BkQ+qcc5gCrwjHbhdvUQRlogS04h3uItQsgCbRZA+4ZYOuB55AZZCRivbiLBedJrA
	4sjjsX+EyafbeqyoOb5axATbC2T3ANw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mroRC-002oy4-A7; Mon, 29 Nov 2021 21:43:50 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mroR9-002owG-Hd
 for linux-riscv@lists.infradead.org; Mon, 29 Nov 2021 21:43:48 +0000
Received: by mail-pf1-x44a.google.com with SMTP id
 y5-20020a62b505000000b004a804839861so7706001pfe.7
 for <linux-riscv@lists.infradead.org>; Mon, 29 Nov 2021 13:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:message-id:mime-version:subject:from:to:cc;
 bh=b5JgGPuCh2TG2LeGhuIYMGHt9KrJcP9PayR5x1TbleE=;
 b=NqITDenw5tWBTTe/aJQQIYNa0EDTIYcmwjphFL29klLEgI7fBVy4wkD4I7M9PbTQcy
 o7/n3j771KMetpsvOEH5OyLxO7cyVLIx9QeFZj6meeJnFZBsp4tumOmrYlajP1g4J3mJ
 ZxnYbYofpe8GFzxVrIHH5oPmRwO20oHwJgnUMHMR6fX1ViA+4zRv9mPly9pikf31wnDQ
 GK7nJsXdFFwligJAJdLd0WSkO3Bb8BGyUJSuyQVMemxFY+RlEf5nlh1c90leGkI++/63
 65pUidHcfG8vZmSZMKN8Md3+o8NYCrVbAjTxDGAIUaZhUxLm9teuGe4lFcUJIvQri11E
 3scQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:message-id:mime-version:subject
 :from:to:cc;
 bh=b5JgGPuCh2TG2LeGhuIYMGHt9KrJcP9PayR5x1TbleE=;
 b=wtsgJVWZiy8El141rPxtK0xODtqYbEyKjqkckhVDz4KHLKJ2CW38GnBRtmqEfS3zxP
 3Zb19kHwkwpUW9UvpnZIENu9UEhoy2Z8Hln+RBh/Yj9+hZ+yFE7RaMac1jnr4BSLG23R
 U/dQXvT443u0OHnLn25FyRjUo9iQ1FPUPOcUjaA0diu1Rq8rZgFvhoyaZ8vOb7MT4XUT
 oMURyVPm8wvOvOmzv70sWvyePcsysuefsM/U9t7e9ds+izehATHTIwVzElohj0+4xDWB
 f8rEg3S46TOFj2Y0oNHapqO7Z6s2bbU4e8SlroQIsgVgDF7ch9aWxAXNWo8deD4OVB3k
 XiHA==
X-Gm-Message-State: AOAM53121RZj0O6Ze/mpwd1d/HUpDebglR5g74Fpitfce/89zjUP5/Si
 o5vBS8SjALWMHXL+cE3LKvb1zDaR87g=
X-Google-Smtp-Source: ABdhPJwPLKTWfxNp/8QG3imQd7zu+NgkwNkw0OX0ECtjDwjzBoTxcpS4Ckrk0j+awWix360nv6y/HmiBssQ=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:90b:3889:: with SMTP id
 mu9mr836244pjb.160.1638222224720; Mon, 29 Nov 2021 13:43:44 -0800 (PST)
Date: Mon, 29 Nov 2021 21:43:42 +0000
Message-Id: <20211129214342.1221766-1-seanjc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH] RISC-V: Use common riscv_cpuid_to_hartid_mask() for both
 SMP=y and SMP=n
From: Sean Christopherson <seanjc@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Adam Borowski <kilobyte@angband.pl>, Anup Patel <anup.patel@wdc.com>, 
 Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_134347_613071_17A62D2B 
X-CRM114-Status: GOOD (  11.95  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Use what is currently the SMP=y version of riscv_cpuid_to_hartid_mask()
for both SMP=y and SMP=n to fix a build failure with KVM=m and SMP=n due
to boot_cpu_hartid not being exported.  This also fixes a second bug
where the SMP=n version assumes the sole CPU in the system is in the
incoming mask, which may not hold true in kvm_riscv_vcpu_sbi_ecall() if
the KVM guest VM has multiple vCPUs (on a SMP=n system).

Fixes: 1ef46c231df4 ("RISC-V: Implement new SBI v0.2 extensions")
Reported-by: Adam Borowski <kilobyte@angband.pl>
Cc: stable@vger.kernel.org
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/include/asm/smp.h | 10 ++--------
 arch/riscv/kernel/setup.c    | 10 ++++++++++
 arch/riscv/kernel/smp.c      | 10 ----------
 3 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index a7d2811f3536..62d0e6e61da8 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -43,7 +43,6 @@ void arch_send_call_function_ipi_mask(struct cpumask *mask);
 void arch_send_call_function_single_ipi(int cpu);
 
 int riscv_hartid_to_cpuid(int hartid);
-void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out);
 
 /* Set custom IPI operations */
 void riscv_set_ipi_ops(const struct riscv_ipi_ops *ops);
@@ -85,13 +84,6 @@ static inline unsigned long cpuid_to_hartid_map(int cpu)
 	return boot_cpu_hartid;
 }
 
-static inline void riscv_cpuid_to_hartid_mask(const struct cpumask *in,
-					      struct cpumask *out)
-{
-	cpumask_clear(out);
-	cpumask_set_cpu(boot_cpu_hartid, out);
-}
-
 static inline void riscv_set_ipi_ops(const struct riscv_ipi_ops *ops)
 {
 }
@@ -102,6 +94,8 @@ static inline void riscv_clear_ipi(void)
 
 #endif /* CONFIG_SMP */
 
+void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out);
+
 #if defined(CONFIG_HOTPLUG_CPU) && (CONFIG_SMP)
 bool cpu_has_hotplug(unsigned int cpu);
 #else
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index b42bfdc67482..63241abe84eb 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -59,6 +59,16 @@ atomic_t hart_lottery __section(".sdata")
 unsigned long boot_cpu_hartid;
 static DEFINE_PER_CPU(struct cpu, cpu_devices);
 
+void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out)
+{
+	int cpu;
+
+	cpumask_clear(out);
+	for_each_cpu(cpu, in)
+		cpumask_set_cpu(cpuid_to_hartid_map(cpu), out);
+}
+EXPORT_SYMBOL_GPL(riscv_cpuid_to_hartid_mask);
+
 /*
  * Place kernel memory regions on the resource tree so that
  * kexec-tools can retrieve them from /proc/iomem. While there
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 2f6da845c9ae..b5d30ea92292 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -59,16 +59,6 @@ int riscv_hartid_to_cpuid(int hartid)
 	return -ENOENT;
 }
 
-void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out)
-{
-	int cpu;
-
-	cpumask_clear(out);
-	for_each_cpu(cpu, in)
-		cpumask_set_cpu(cpuid_to_hartid_map(cpu), out);
-}
-EXPORT_SYMBOL_GPL(riscv_cpuid_to_hartid_mask);
-
 bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
 {
 	return phys_id == cpuid_to_hartid_map(cpu);
-- 
2.34.0.rc2.393.gf8c9666880-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
