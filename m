Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF57CFC518
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Nov 2025 12:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/pdED/iTUxuCEXzWaY4ukB57W+hrb1JT5ehO1elQoA=; b=1SdG9t3QlZFH4j
	y/A5GTKapYDdvrSkaN4t/IGgwVO9AcnkPuMH8F2yEg04lYCFTTAOwT25IOVESTOCdDMrkUd5+RBR2
	qpdSInSIzzKGDcKmS9ojHdIQ3L4DLO5o33p7rJRCzKpYFwMOdHVrd1ve9I9mG+aY5ZUTfnTrGEaK/
	F3gKs8KW1PXxdTH8W8XiDqLhp8hQUzIOS4OBR5QK+nSNiOyL265HSoShYdyvaR47wlf9Rj1Dyw48T
	QkZCxBwV+Rbrth1yUz9BxdT/kld1RmCsoyQCmVblBuZUA5PmyuBoMoWwIFBNuJ/8OJDzo0bIlnsmA
	YIMlRyaQdY7DcODRzcWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN95D-0000000AOvU-0VCy;
	Sun, 23 Nov 2025 12:20:47 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN95A-0000000AOuV-1Cyk
	for linux-riscv@lists.infradead.org;
	Sun, 23 Nov 2025 12:20:45 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-340ba29d518so2030141a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 23 Nov 2025 04:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763900443; x=1764505243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRiPIYfxAbeDZx56dDO7Yzut633E3UEGddHrba2VO58=;
        b=J1BP0J20QMv0TIpLSXRZ/X7tMvtYcN/HzgLfI516ZqlzDIJ6TFRRkah2IMeEYPB8Y9
         Rc3wUfEhcsxd2wJvbj4+3lkpUBtYO8MXBJVXFLaxzmL+0rvls+8Rdq0+YU+xELLdwciW
         CosOLQtXWBABPh2BbzpQfKsrZiE0u6BT1z/TXelnwBcWpS/n5REWHlLUtoMBdtx2Fk8G
         uwgDr7ZInOv8MUY7g7JLuoFAEuRGR5JXqjJdPKGt59/NwWiGRidFXCo1TW/YI83PSBLt
         ocAw29LkxDQEBJohVUHBUfzlOIJPvU5/0+0sitzYbM/Dg6YS4XidXaNoCZnqaYup3hcz
         olNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763900443; x=1764505243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uRiPIYfxAbeDZx56dDO7Yzut633E3UEGddHrba2VO58=;
        b=WvJX44im8QbbLaKtQi9vaIIOXlIFeMm6/t5ZmQRQAbkF3p/OJg+Qm0PRtFHvz80Lts
         z5YaHDdYvQ1ydc6cH6WfUyifSvvfsn0xnH1+cLoI461uKusudEeNaA5jKKRoXls5Fgn2
         WkU4TxAtXpLNs4z5gODphMt4z0AEM561ETIq1XqMWoGf/wfTeZdkQv2NfHx4Ac/mHTH1
         wQ+ge7PF4+Fg2jJknlu8mt5xIgPYV9ka1crdzbOv5hLPL1TFwzZHorW053dFVpWPONu2
         9ar8LW/VaNWDbGtGXem3CSLa2jf2vEFqrF1n+UEnvIxuJhlGxRJYi9+lpAGrF3LWBXoH
         W5bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuAzVs3ZzEIzCvePtjt0LckvTJZXpD7f23h+KKpJufBUguHPnvs3vrHAGC+WHcAAZkIUIa4nrXaDFfAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoIphV9/eCNZmEcFfLq+zCQ2mzoGFAVjSaPW8ziI8XwSGAoQMx
	ibv4j35mvRj0aU28p5K4JfH9p9j0fzXtXNJKQbFIpisjITR0z6RyfOey
X-Gm-Gg: ASbGncv8BWB4ya7JRbX/dAHKSCEbrSyanpn7aBJndZAwKNxPozxvvwt/OK/L82dq9Xf
	fEsb3RkzLiXrmMZ0ab800E1fedh7TTV8SzkBN4eJhw04hNM3etSZSkaoo95D16Hk6i6jqcTli0i
	HtWQR6bfkEJvprDay8/MNfqGP8I/6K/uGBI2v8cDnOjVTqd1RAAy6MzGXDs7UrEcLd4NeDj3Sg4
	BCbYebqorq1/b3JDcfBb0tiGjGLitvoXvAAqKmkt5GzpLB3X4yLAaFnMo7xqqzJwl0lySfpxEY+
	XdCkGEuuyMaX+1vRF/klaDr8MgLKV7loHHEuYoy8ig0AUzqrS/WYZcaf+sR1JGWOE9reKsrvLBX
	O+FWw0kmPdKEaGpcw0o1y26vEjDHRDOMJcp2e/hRqtVTz7axZsg5mK3ozQmSe8A9ldNhCFQUaDg
	cWHWyEz5I3/as/n2VthEpEpauE+dThGsKttVsWZA==
X-Google-Smtp-Source: AGHT+IE2OipiHB3l7nfaaOZz9AJR/rU+rtGLdqGSFKCc9D1xo2iRoaS3rmxvDNPBZM5K4JE+kKoccw==
X-Received: by 2002:a17:90b:50ce:b0:340:ec8f:82d8 with SMTP id 98e67ed59e1d1-34733e6ccdcmr8778976a91.12.1763900443106;
        Sun, 23 Nov 2025 04:20:43 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([45.121.215.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0b63aefsm11410178b3a.52.2025.11.23.04.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 04:20:42 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: tglx@linutronix.de,
	peterz@infradead.org,
	david@kernel.org,
	riel@surriel.com,
	segher@kernel.crashing.org,
	hpa@zytor.com,
	arnd@arndb.de,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	linux@armlinux.org.uk,
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
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	thuth@redhat.com,
	akpm@linux-foundation.org,
	lorenzo.stoakes@oracle.com,
	anshuman.khandual@arm.com,
	nysal@linux.ibm.com,
	max.kellermann@ionos.com,
	urezki@gmail.com,
	ryan.roberts@arm.com
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev,
	Xie Yuanbin <qq570070308@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v4 1/3] x86/mm/tlb: Make enter_lazy_tlb() always inline on x86
Date: Sun, 23 Nov 2025 20:18:25 +0800
Message-ID: <20251123121827.1304-2-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251123121827.1304-1-qq570070308@gmail.com>
References: <20251123121827.1304-1-qq570070308@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_042044_331813_9FF45047 
X-CRM114-Status: GOOD (  14.37  )
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

enter_lazy_tlb() on x86 is short enough, and is called in context
switching, which is the hot code path.

Make enter_lazy_tlb() always inline on x86 to optimize performance.

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
Reviewed-by: Rik van Riel <riel@surriel.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511091959.kfmo9kPB-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202511092219.73aMMES4-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202511100042.ZklpqjOY-lkp@intel.com/
Cc: David Hildenbrand (Red Hat) <david@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
---
V3->V4: https://lore.kernel.org/20251113105227.57650-2-qq570070308@gmail.com
  - Revise commit message: changing inline to always inline
V2->V3: https://lore.kernel.org/20251108172346.263590-2-qq570070308@gmail.com
  - Add `#ifndef MODULE` to fix build errors

 arch/x86/include/asm/mmu_context.h | 23 ++++++++++++++++++++++-
 arch/x86/mm/tlb.c                  | 21 ---------------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
index 73bf3b1b44e8..ecd134dcfb34 100644
--- a/arch/x86/include/asm/mmu_context.h
+++ b/arch/x86/include/asm/mmu_context.h
@@ -136,8 +136,29 @@ static inline void mm_reset_untag_mask(struct mm_struct *mm)
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
+#ifndef MODULE
+static __always_inline void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
+{
+	if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
+		return;
+
+	this_cpu_write(cpu_tlbstate_shared.is_lazy, true);
+}
+#endif
 
 #define mm_init_global_asid mm_init_global_asid
 extern void mm_init_global_asid(struct mm_struct *mm);
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index f5b93e01e347..71abaf0bdb91 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -971,27 +971,6 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
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
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
