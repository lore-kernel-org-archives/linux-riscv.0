Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A93CCFA13
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 17:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0vbe4o30MpkpaHRLbq9Hiar9lxnyBJCcz/dDIozGztM=; b=kIY5+ripEwfpaE
	0lANSXMIPCqa7n3JzTCRZFwr2QMssL7Rj546DkZXWsYmO3ZUd2xfzrPYEhM5tH5zztB25jo8I/1+R
	fJVMZwPYFjs1upIQ5YgfEtR/x+sV7ikXMiyEATl9vIYUchXVn3twBjxi6MRzXQ4vZcwiT2M57ld1X
	VZl3J8+QOMxFDcO1h2OtKPmaXL5ia+bl+PxmmHdmz0PBYU++JNJvXZeNQFicP0ZO778xDyJ6+mYs/
	pYJHGw4bzyTOI8RFZVyfjM5gTWyqLo2lFnEhFGb3oVqMOaMgPTwKxlKg+vLBsj2hkVjPFTAS+9OtF
	roe80zAKIh2a5gcyUb1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHmgi-00000003JsS-0st3;
	Sat, 08 Nov 2025 17:25:20 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHmgf-00000003JrY-2PqR
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 17:25:19 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-29599f08202so21565025ad.3
        for <linux-riscv@lists.infradead.org>; Sat, 08 Nov 2025 09:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762622717; x=1763227517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TYL/KcboSr09KpEpWrRMXlQpJhItw5S/fTw0hxpRX4=;
        b=BXNoCfC+3+9ILyQ4nozPYAlTAI4lQLsgdGxLE803pS5Av1TX1xMNSaTrszH03kN001
         /5poY8t8751xG+a8guNtkReH38qHQS5l+kBIhTU3YVgqm6CzA9BJqp3Sz3UC+3DOo9Pd
         FHL+ztdCnWaRWzh1X3dppKqC//4VAsrdmaDm0MFexB8nqf8imOer0LsLftDFNM1ko4YB
         2xyDqRF6oQINNcZpPU3iP8vt54fx9UdtV1B9fCiHNlpwWoWHdZrJQHtizkbG69hLcNE0
         SwHGdVvXPLjdvJfApesP3lp+/fCUBzaT8FtPLrcA+mijE5/iC9Gp9DnZ7TuQfBNzNx9x
         FF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762622717; x=1763227517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2TYL/KcboSr09KpEpWrRMXlQpJhItw5S/fTw0hxpRX4=;
        b=d4zIYQnN6XSluhste7Ulm/LwsP+tPkyY21LJ9oWE279rQ2GtkNirYiFAqiiczbWgCv
         HTMmD5/laioR8Nzuo+ZnG/YoCErYrVLSxTiIILJRlbZVJfZcYkrnyn0ms4IMwRakNC/3
         yhwcu3j6np7zH6i6/Ziwc63e18KR8RZh/c1s9oV8vVndeQaY54j0iR7oz2TUbKsydB34
         G8OMRB2GZeogc+g8pRWMPRTU01QTD6oAZWnUNAIVnNqIC76lfOQMjDdiLcCm+5dfS3gN
         VOylPistFlN2DRJWxatNx7tB5W41W7djeO/AF2qE6nZs7HuvMA9dz20OA8KDUpQD3aD8
         KCKg==
X-Forwarded-Encrypted: i=1; AJvYcCUBPg34sl0lv91zqnx3wjXZayE80UDfWJvJyM0FwrPhrL3GfPzrbDbrcMPSSfH/oH8ZiA50XE2r+rS4aQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8ZuOMZ1tKuE454foU5u1czav/kmRf1ewYAW0ZP8xLKKQl+Xhi
	AGpMYYg3GRbrXdVvRZ6QaX81S31mmROyfSv3188xtrSZ2PpFGccPFdjg
X-Gm-Gg: ASbGncvj6rXCIcvlmuh5D8A/4W2m/Kozhs2GK9ZpgagZbfPxgY5DOOk273E+9cm90Tl
	RUXj3gHIzWxNfElNSwzj0zsGlb9UcI8DY9PpClI7ESO88tDpG+Gb77/QMuYKr74EGdhZCcgrMIb
	9IosvCmW5ESBiBKuGCfA44/lUAgehcqI1wE7YoxFhVn7d4fFIKUBRNQ8EHmV2+YEyZd8SiJUys4
	eyIGYgeAHQ8b8fKY9S5NCK/xsIIgwbi1AENbvX4YeffJ30NVqf+GmD4GehNfO655ikQnF7TteCo
	SuILryLpMQeS3Pt48B6zM3j6t/ZBAvkGxtsP3mrgcsBAR2WC1UDt7KlLLQYIM0XrmVEi9Tyb1f8
	t9irKc87/KIaKQq8D2Ighqf6VHsJ5ibIb+MnNtsL9OF/XxuDKRZQItGrOtM05ZKQNsgJzp7SXEV
	89An/TCJjMKi0rDJhrwawkWoHK
X-Google-Smtp-Source: AGHT+IGemHZA9SPXtNLFNdfrNqoZlItf/gue2FL3ckVQhHVRtlGuWtaylquJOH87biMGuXkZN384xA==
X-Received: by 2002:a17:90b:1b12:b0:338:3d07:5174 with SMTP id 98e67ed59e1d1-3436cb7cfbdmr4095192a91.5.1762622716706;
        Sat, 08 Nov 2025 09:25:16 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3436c3d7dddsm2769122a91.7.2025.11.08.09.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 09:25:16 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: david@redhat.com,
	tglx@linutronix.de,
	segher@kernel.crashing.org,
	riel@surriel.com,
	peterz@infradead.org,
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
	luto@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
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
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qq570070308@gmail.com,
	thuth@redhat.com,
	brauner@kernel.org,
	arnd@arndb.de,
	jlayton@kernel.org,
	aalbersh@redhat.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	max.kellermann@ionos.com,
	ryan.roberts@arm.com,
	nysal@linux.ibm.com,
	urezki@gmail.com
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev,
	will@kernel.org
Subject: [PATCH v2 1/4] Make enter_lazy_tlb inline on x86
Date: Sun,  9 Nov 2025 01:23:43 +0800
Message-ID: <20251108172346.263590-2-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251108172346.263590-1-qq570070308@gmail.com>
References: <20251108172346.263590-1-qq570070308@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_092517_620980_00FC692E 
X-CRM114-Status: GOOD (  13.89  )
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
which is the hot code path.

Change it to inline function on x86 to optimize performance, just like
its code on other architectures.

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
Reviewed-by: Rik van Riel <riel@surriel.com>
---
 arch/x86/include/asm/mmu_context.h | 21 ++++++++++++++++++++-
 arch/x86/mm/tlb.c                  | 21 ---------------------
 2 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
index 73bf3b1b44e8..263e18bc5b3d 100644
--- a/arch/x86/include/asm/mmu_context.h
+++ b/arch/x86/include/asm/mmu_context.h
@@ -136,8 +136,27 @@ static inline void mm_reset_untag_mask(struct mm_struct *mm)
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
 
 #define mm_init_global_asid mm_init_global_asid
 extern void mm_init_global_asid(struct mm_struct *mm);
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 5d221709353e..cb715e8e75e4 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -970,27 +970,6 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
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
