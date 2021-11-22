Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E56C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Nov 2021 18:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nal/DYTtTLRVQj+vXvBGER1226svPuEf90PDQuKaThM=; b=BAGvqVRj8khIyg
	yJdJICaRWynWsC06W9PQsq87DeKgmcjt5WIGMmFXy/3fgUTieD2kvxYGZpCl8snp+dfYckbYu/zm8
	sQe+q97E2r0i49fi8uqbZ+PvFdgKAPVLhrBSOCyAlCl/y5fmF8Qt5XFLewNaXNLXslgIupNAfu57d
	HZoiN8OIzXlEUoNCH7pfLH9CMUcwgOidxEjiE8Ih18lUw2vghi29moZW4PmAHtAZEHyVN8jt5DWUr
	3FWcNd8swJJLx2j9mIWi/0r0ZXMOFLw4AQe1R54XExSk2F9EpR7f+1tIEBvEqVksBjww8CbbTfqvG
	3hrxa2wGXlF3iSBq92Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpE9J-00HMKn-2X; Mon, 22 Nov 2021 18:34:41 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpE8v-00HMFs-OU
 for linux-riscv@lists.infradead.org; Mon, 22 Nov 2021 18:34:19 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so425714pjj.0
 for <linux-riscv@lists.infradead.org>; Mon, 22 Nov 2021 10:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=StQJOV7P1DubencBikfQ5P5eKS4HNqG35jpX/cYWLE8=;
 b=WF0dbiwI+UrDbdpeYQddeMN0JXNnGDKakbEcpKhnYxnWdFwmOf97nBUGfKfk7Hh9/C
 qlPUWjeBCht6c2VPihzXoEqQ2EJjm/3fdkRROCpJGaj7dSV/FZDYadgaxs1BxaIkhuii
 hq5RJPZgCE1E0QArMTfA284mPKn2GxS6OOsuDYSReCMvapXrNrLA+JXKHXCw55w0gAGO
 Z7SWfulaA+SEIOnX1rTo4lMbSMjnwYLxc5VmJ+4jD7BZ9lVV0nmr77JZ5JD8bw7/OGtY
 8hwkbWphmks34+eOpa//15SoRFOcKtLEUcqv+czNXMkBYkKMmWqt74cO0452tAuYAdtz
 jMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=StQJOV7P1DubencBikfQ5P5eKS4HNqG35jpX/cYWLE8=;
 b=B9qBcNLRsuCixysd0Oe3JMx+T+IHXH+Gmrb+hndoFUOIeJ9VSFKABjXMWoJw7Y33qp
 yZYm0pwiaHDh5bmY00orICkwmVt9sKpQ1oIWCRE4evXRbj+SD5l0+Y/xi/j6iYJ9I6WO
 zOlNL2+0ijeJoG6nt5GgH9FYY6wutTj1OCn+aKi79Z2x0sms9pPC6GJRbEjp+4+eud7w
 cKaBnMfr96DfGu+M/BCxFtErhr/0ojc1GuSfzKZdyOsHtnw84/P/h29lIow/zSoVCaOA
 iOLpUM7HFC88eiKOl+a0k+lsvpayHK9B0QdJrw9FAJ4hjYXUHEoimKYcwsqFGOT4YzmA
 /vwg==
X-Gm-Message-State: AOAM530TcFnhzIjXwv0lHRIF49YbawlOOUehIWy5Mgx60yoOpdll2ZRV
 lICFxOUoWbDu0Ih3tJb1b6LPpQ==
X-Google-Smtp-Source: ABdhPJwFhG8Za12uJN84Tkp3zpRjT/Qxdf6p2sTfmwZAObV7GPADlbDlJt0l83EtC7aMKLKTNuC9Qw==
X-Received: by 2002:a17:90b:17ca:: with SMTP id
 me10mr32629953pjb.134.1637606056651; 
 Mon, 22 Nov 2021 10:34:16 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id c15sm8231647pjg.53.2021.11.22.10.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 10:34:16 -0800 (PST)
Date: Mon, 22 Nov 2021 18:34:12 +0000
From: Sean Christopherson <seanjc@google.com>
To: Adam Borowski <kilobyte@angband.pl>
Cc: Anup Patel <anup.patel@wdc.com>, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
Subject: Re: ERROR: modpost: "boot_cpu_hartid" [arch/riscv/kvm/kvm.ko]
 undefined!
Message-ID: <YZvipLmkQQZ3va8F@google.com>
References: <YZvP3AuTdEdje/IY@angband.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YZvP3AuTdEdje/IY@angband.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_103417_871511_FB510945 
X-CRM114-Status: GOOD (  21.57  )
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

On Mon, Nov 22, 2021, Adam Borowski wrote:
> Hi!
> With CONFIG_KVM=m and CONFIG_SMP=n, the build fails with:
> ERROR: modpost: "boot_cpu_hartid" [arch/riscv/kvm/kvm.ko] undefined!
> 
> An obvious fix would be to change riscv_cpuid_to_hartid_mask() from a
> static inline function to a real exported symbol

Amusingly, the !SMP version is buggy as it assumes the boot/only CPU is in the
target mask, which will not always be true, e.g. if a VM has more vCPUs than there
are pCPUs in the system, kvm_riscv_vcpu_sbi_ecall() can send in a mask without any
CPUs set.  Even if that's somewhat of a bogus use case, arguably a common helper
shouldn't have different semantics for SMP vs !SMP.

> but I wonder: is there a point in allowing such combinations that no one will
> test?

Eh, even if there is currently no known use case, unless the fix is really nasty,
there's no reason to actively prevent a potentially legitimate use case.  But it's
somewhat of a moot point as the easy fix is to use the SMP version for both cases.  

I think this would be an appropriate fix?


From f6510acd68feb90aa3ec393031cbcde725c52420 Mon Sep 17 00:00:00 2001
From: Sean Christopherson <seanjc@google.com>
Date: Mon, 22 Nov 2021 10:01:15 -0800
Subject: [PATCH] RISC-V: Use common riscv_cpuid_to_hartid_mask() for both
 SMP=y and SMP=n

Use what is currently the SMP=y version of riscv_cpuid_to_hartid_mask()
for both SMP=y and SMP=n to fix a build failure with KVM=m and SMP=n due
to boot_cpu_hartid not being exported.  This also fixes a second bug
where the SMP=n version assumes the sole CPU in the system is in the
incoming mask, which may not hold true in kvm_riscv_vcpu_sbi_ecall() if
the KVM guest VM has multiple vCPUs (on a SMP=n system).

Reported-by: Adam Borowski <kilobyte@angband.pl>
Fixes: 1ef46c231df4 ("RISC-V: Implement new SBI v0.2 extensions")
Cc: stable@vger.kernel.org
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
index b9620e5f00ba..6c5caf5eb906 100644
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
index 921d9d7df400..d0147294691d 100644
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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
