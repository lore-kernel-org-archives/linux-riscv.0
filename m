Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91BDCCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 18:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Veqe+ahYrIWC9K0dxyiwhhXraLdstOcjIx3YiUAH5dc=; b=ZnOfmtyHn0eVKc
	iUNLn5QXQ+H2uugg6z4DuVpT3PMtHzI6F/7RG4gKfYEVeanEQUh2kdpNkrDF0zou63Tqhs0mFO/nu
	uaJBpMF4KMmFadqzPNIahwix+Rt7AjP/e2N+u12kEWqapQOvnQ0iFQxUghfJfVQSvL7lF16NWUtKI
	854o3/Ptd1SLVp+Y/ZX3/Ct+uMAzFS75uMgE3hrIvfZ67TAHEBlI2LKzk/A2tKvI25F1QBTNX+dZg
	UJ6LfjI8dZY5QMfixdcdoCIerwkFG/Gcav8o8JI6R82vEngyRUBNontprYbAOl56wlyo+vEWyVxxA
	kxPmMGgse538xCUDRXUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMVw-0000000AGiW-1Vji;
	Fri, 24 Oct 2025 18:27:48 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMVu-0000000AGhE-15bd
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 18:27:47 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7a2852819a8so1083266b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 11:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761330465; x=1761935265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+FNd1iv84yj9fXEgDPRihJMKjMARO1OEmBeQEKgFEI=;
        b=iO0inii+E6CV9moWdCWKUjnnhNk85x0kyF/Z7GV0RNmxKlbwN25jgyCpdOIKtm2N5b
         2DBthXg/XXW4DSKSio3iibYc2awTKOEEekgKMuGFvTRlBV2NqgrEUDPnh2hTEgh9XNgK
         HFWdE+JFXLrDdNM8UBztyWKd+cYQR/rqJFItGlfWelWw7BcH3T1c/MYxpP04uZVn4/Fr
         SY+dMrBO7Z6v8vBFy26Wf358qbXWgwsWLl9Qyo+WSTdnbct6+34cCW/fJ8ph7pmYryy8
         l4BkcxlC5WIm+/r5MujIGOPPRZaLQdMfe+9YvKkenp4wDXeZ/n8D9C7angXrJS0zDffj
         7okw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761330465; x=1761935265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+FNd1iv84yj9fXEgDPRihJMKjMARO1OEmBeQEKgFEI=;
        b=YkoBNiTVO4NuECwtGgsxq0MItN2sn2WnBlyNsWPLqYeX0n7yUJXDjUm6OSm8KIc1JS
         v7BRf1xgMV/HQyUdylfLp2Qwuh8mz36ixNVyJco0qmGMc5+kdXlUb5FmJuP1NxXuvCA1
         dsZS/sdTPGOceNXun8j927OnnxNLALytCWQioKKDyvZsWwvwxIsFdzrxI5fGO7ommnc/
         yNOF8RKsFb/FU/EzzKLMHp/p3Q3+jS5u8pJ1Y0bLFY8sGqgOkeeXzm0G9fnNd/NLZhLM
         5vUBD8uxjDZiO4Hkr/bFQiFM+Yd6ed4q6KblQn14th/t4Dpm1ve/y7qpbuMpbuqBktZ5
         3XNA==
X-Forwarded-Encrypted: i=1; AJvYcCXRRurEma7825z+gzS0VtCNktx1fJXNynkqvSbvZwvhQyisrhOQNQGO3NjAzQq+BhDfwWTA+TEFxOrApg==@lists.infradead.org
X-Gm-Message-State: AOJu0YycS3CrVP7f/TI95V04plZbV6f5tt4lIF5Fx0yO5sruJaHHoFbI
	8DnSymD9WsNUUjb91WotNKdD6GbqQuEJirRasJWm4kvfhJXyx5aYbs1G
X-Gm-Gg: ASbGncuu5kARIq98n5dWuuHHe16kOzM1ZEkeIptwdP8ftf5r3nc2sDkc3nNmZTpsb5p
	6taT7D+U33LEsR7+KmOLPAipIuvqqpLUQPgMrAGgnMNTEMcKEqz5FWkb2I+F6INR5g9N9Gfxtxq
	6GT/4fiE1zJha3JTup+1HxWUAcbO1+wcuW5fJMWnDTPcOAMyVVN9G/ZcsNYBylo+ywK8aMBTYb9
	3VjnJ7oGXasUWhFlTl5vnW5On/gy+TTlG93TcrzZzPFUKVMpoWzWIccMDEP873610k8KoodZ7PB
	32IiqV5O1q9Qo+FA1LK1Khs+8mu1upPDl6i5Yd9gitFDrWEJUKS5lKva27bboabN8aX96DPkvtf
	RN1Cg8kFWYSOsqWOfhfeXcLYxDc+NAfT5GT/nChtpI5031baWamDqkFRflVqh/rMKCVFJkC3ih4
	MR58Ew1qXZIrJQffTN9+ph4m8ecek4HXM=
X-Google-Smtp-Source: AGHT+IHxEMLf7S4GtVSLpARiG/DBE2cBNDG4VltRWQgt5C51d+t0JTe3Qon0GX6lpPUzY6KiH2TeSQ==
X-Received: by 2002:a05:6a21:2d89:b0:339:352b:1aea with SMTP id adf61e73a8af0-33c5fbaaaf2mr10877285637.3.1761330465233;
        Fri, 24 Oct 2025 11:27:45 -0700 (PDT)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274ac3158sm6616572b3a.32.2025.10.24.11.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 11:27:44 -0700 (PDT)
From: Xie Yuanbin <qq570070308@gmail.com>
To: linux@armlinux.org.uk,
	mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	andreas@gaisler.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	qq570070308@gmail.com,
	thuth@redhat.com,
	riel@surriel.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	lorenzo.stoakes@oracle.com,
	segher@kernel.crashing.org,
	ryan.roberts@arm.com,
	max.kellermann@ionos.com,
	urezki@gmail.com,
	nysal@linux.ibm.com
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	will@kernel.org
Subject: [PATCH 1/3] Change enter_lazy_tlb to inline on x86
Date: Sat, 25 Oct 2025 02:26:26 +0800
Message-ID: <20251024182628.68921-2-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024182628.68921-1-qq570070308@gmail.com>
References: <20251024182628.68921-1-qq570070308@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_112746_312084_3D2006F9 
X-CRM114-Status: GOOD (  17.14  )
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

This function is very short, and is called in the context switching,
so it is called very frequently.

Change it to inline function on x86 to improve performance, just like
its code in other architectures

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
---
 arch/x86/include/asm/mmu_context.h | 22 +++++++++++++++++++++-
 arch/x86/mm/tlb.c                  | 21 ---------------------
 2 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
index 73bf3b1b44e8..30e68c5ef798 100644
--- a/arch/x86/include/asm/mmu_context.h
+++ b/arch/x86/include/asm/mmu_context.h
@@ -129,22 +129,42 @@ static inline unsigned long mm_lam_cr3_mask(struct mm_struct *mm)
 
 static inline void dup_lam(struct mm_struct *oldmm, struct mm_struct *mm)
 {
 }
 
 static inline void mm_reset_untag_mask(struct mm_struct *mm)
 {
 }
 #endif
 
+/*
+ * Please ignore the name of this function.  It should be called
+ * switch_to_kernel_thread().
+ *
+ * enter_lazy_tlb() is a hint from the scheduler that we are entering a
+ * kernel thread or other context without an mm.  Acceptable implementations
+ * include doing nothing whatsoever, switching to init_mm, or various clever
+ * lazy tricks to try to minimize TLB flushes.
+ *
+ * The scheduler reserves the right to call enter_lazy_tlb() several times
+ * in a row.  It will notify us that we're going back to a real mm by
+ * calling switch_mm_irqs_off().
+ */
 #define enter_lazy_tlb enter_lazy_tlb
-extern void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk);
+static __always_inline void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
+{
+	if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
+		return;
+
+	this_cpu_write(cpu_tlbstate_shared.is_lazy, true);
+}
+
 
 #define mm_init_global_asid mm_init_global_asid
 extern void mm_init_global_asid(struct mm_struct *mm);
 
 extern void mm_free_global_asid(struct mm_struct *mm);
 
 /*
  * Init a new mm.  Used on mm copies, like at fork()
  * and on mm's that are brand-new, like at execve().
  */
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 5d221709353e..cb715e8e75e4 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -963,41 +963,20 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
 	this_cpu_write(cpu_tlbstate.loaded_mm, next);
 	this_cpu_write(cpu_tlbstate.loaded_mm_asid, ns.asid);
 	cpu_tlbstate_update_lam(new_lam, mm_untag_mask(next));
 
 	if (next != prev) {
 		cr4_update_pce_mm(next);
 		switch_ldt(prev, next);
 	}
 }
 
-/*
- * Please ignore the name of this function.  It should be called
- * switch_to_kernel_thread().
- *
- * enter_lazy_tlb() is a hint from the scheduler that we are entering a
- * kernel thread or other context without an mm.  Acceptable implementations
- * include doing nothing whatsoever, switching to init_mm, or various clever
- * lazy tricks to try to minimize TLB flushes.
- *
- * The scheduler reserves the right to call enter_lazy_tlb() several times
- * in a row.  It will notify us that we're going back to a real mm by
- * calling switch_mm_irqs_off().
- */
-void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
-{
-	if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
-		return;
-
-	this_cpu_write(cpu_tlbstate_shared.is_lazy, true);
-}
-
 /*
  * Using a temporary mm allows to set temporary mappings that are not accessible
  * by other CPUs. Such mappings are needed to perform sensitive memory writes
  * that override the kernel memory protections (e.g., W^X), without exposing the
  * temporary page-table mappings that are required for these write operations to
  * other CPUs. Using a temporary mm also allows to avoid TLB shootdowns when the
  * mapping is torn down.  Temporary mms can also be used for EFI runtime service
  * calls or similar functionality.
  *
  * It is illegal to schedule while using a temporary mm -- the context switch
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
