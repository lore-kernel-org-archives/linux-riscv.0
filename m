Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D931FC72A8
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 06:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0dY4Ae2cdiRdAcptxurTQZpou18Fd5jijOyi7aNkRhs=; b=hDRfM2vyYZkHXL
	zzSVR3EiRLlOwh5pbN8YdNkb6d2wX80NfLX3G3GlZfoViXLVKUxpFVXFYzbb/PJ0Cz+IaWrLKIg7M
	bnhpdh92/mD2n87OSWihuLjuE7JUu/GgtWIoVfIswN0NHS3JSD9Dr8xH96ebWn7o1lXyjYNak4x/y
	NHaxJ6cUysne72EuJMBKx4MG3/EbdlWKc3DeBWsf9WQYy+IvZXFwWqcL5Nl0YRaJl9roEs0o5VGPk
	EiF6klMd3Pd2TwTOeR9W/AcvALwU+JE6vsvyflWSUTykzGagIyepTUktunDxPlbcICeN/Y9+QFlFV
	22TjPHRM+X2Gf6rbl0jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ZDT-0000000G9Tt-0xbu;
	Mon, 23 Mar 2026 06:56:47 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ZDQ-0000000G9TS-3URp
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 06:56:46 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2c0ea57fea7so4532129eec.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Mar 2026 23:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1774249003; x=1774853803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FEUgpMoi6RQXdkbzwH6UTh57axD9lljhqGUS+7Ma/Ts=;
        b=fvEhs1UTer2hG2kbKkaf28DdV14HBd2L7kYtFhffsilYSwZYEpvPANyup6dMpdgok6
         7+WpU6MV5gXqYVo2qbw5SH1GpuzAyjntO9iWGJmjosQENCMK21memlwF+d+BB4TU0NwW
         R2SzK/2UahLjbVJOVgShJMZgtQJxMGxC5D+ljKfUvzhJi1+zhsNNe9/mxps1DMSs1Me+
         GaDnpG7EYi7MKERumNoQc6/0dho+OryA8k0bHhCUD2/VzgW5LsDUx9yI0Q3TKUwjFoyg
         /3HXnJh8WNDqQXJo3qCOwUfGfi26Q6GNsDX/eLRsgCcm03Zs6WuyicBgfzH2MJdF1nA5
         Vivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774249003; x=1774853803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEUgpMoi6RQXdkbzwH6UTh57axD9lljhqGUS+7Ma/Ts=;
        b=H3TqN9KhhpGqXUtXBZAWChEZ0ywfY/o7hGb8ijAV26abIbvqCte9D8x4fvI492bCzT
         iHhrKbq4OjS1uYiGlzamndvHWqZ3SVaGmomkgQQ541ZDZIHZLR+K8KFIJD11YRqA2glk
         VP3AhBDE9SjmGoLvILzADZ+SqEl6ir9G1/DmqXoJf5IJF4uxi2i6Z6i/xnPb11C8Hsh9
         g3C0xM157utggXM8pmj/5XkAavUxygHHnppdM26gzcwQyMWUpazc4WUwJm37qZCUWJG9
         6MlpeLaq171/2ZQZ99FLfKU01svR282R+F3FFtfjUP/1nZRiEsyJ8PH+eADI4PY+lELI
         0UsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjiXNVF146tnb5VAgQYXxp8NyPYdz1fdlw0svGal/gXhNyKp2LB5u4Z4DqCpDuQ3hPtFxL0/I+yPmVCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjyJJR4I4Pb7FBFoUkjltUPSifTjuwpSuauwgrGp1T0H/0YI3N
	LRExN0KA6W6AXjo1mEanCAVB2mQrPKeupDJ8lKDQyPuHO9srqjj/Nro59S01Bz9J9AM=
X-Gm-Gg: ATEYQzzjZayfH6B05XmgY7+leVxGExBpuG48jbEm8RZN84IESJzq/9EZjGUDWngmZw3
	3rb0AzucgVoqcDwB+0X+fcGJl0MPuRWxt915K6CREIDvqAGCYfp7dwdFc/y3/lazhQuNAgMTq+O
	YAD09n67nzg7PKzJDfIqXR/zXAllVbTRjM2Bk9Xdl+hp4WteEuFyXkOLHjikAbLyKiZyKxQWcyi
	iniyOT41d2XqXYrxDFXkEssjne8nHJFum39Zy3ibaeKjdatDgAYtMadeHgHrQSztDYN2KLp9vsy
	g5QdHyNyQEQcZPDBX/4Q2Gy3bI7S7wLH2KhWLn1E6bqgv4HAK4hnZd2ueorbcJnM0ni+fwHxiw0
	2O6z2Jr6elkkPdpZ9pRpd+GH4/209ynNTjLSrgazIP7n1GHfgtWXhB5+Vinly7V9rQhm2z1P8Xu
	SxVJyRyR3q1RoK9jRe07qux1PnB8s76YzbFQib70SmT1DpHg==
X-Received: by 2002:a05:693c:3104:b0:2c0:c767:b6b with SMTP id 5a478bee46e88-2c10980a596mr4585216eec.32.1774249003306;
        Sun, 22 Mar 2026 23:56:43 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b31ebd5sm11766899eec.27.2026.03.22.23.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 23:56:42 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	debug@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2] riscv: cif: clear CFI lock status in start_thread
Date: Sun, 22 Mar 2026 23:56:40 -0700
Message-ID: <20260323065640.4045713-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_235644_900163_A88A7D35 
X-CRM114-Status: GOOD (  11.10  )
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

When libc locks the CFI status through the following prctl:
 - PR_LOCK_SHADOW_STACK_STATUS
 - PR_LOCK_INDIR_BR_LP_STATUS

A newly execd address space will inherit the lock status
if it does not clear the lock bits. Since the lock bits
remain set, libc will later fail to enable the landing
pad and shadow stack.

Signed-off-by: Zong Li <zong.li@sifive.com>
---

Changed in v1:
- Refining the commit descriptions as suggested by Deepak

 arch/riscv/include/asm/usercfi.h |  8 ++++----
 arch/riscv/kernel/process.c      |  2 ++
 arch/riscv/kernel/usercfi.c      | 12 ++++++------
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
index 7495baae1e3c..f56966edbf5c 100644
--- a/arch/riscv/include/asm/usercfi.h
+++ b/arch/riscv/include/asm/usercfi.h
@@ -39,7 +39,7 @@ void set_active_shstk(struct task_struct *task, unsigned long shstk_addr);
 bool is_shstk_enabled(struct task_struct *task);
 bool is_shstk_locked(struct task_struct *task);
 bool is_shstk_allocated(struct task_struct *task);
-void set_shstk_lock(struct task_struct *task);
+void set_shstk_lock(struct task_struct *task, bool lock);
 void set_shstk_status(struct task_struct *task, bool enable);
 unsigned long get_active_shstk(struct task_struct *task);
 int restore_user_shstk(struct task_struct *tsk, unsigned long shstk_ptr);
@@ -47,7 +47,7 @@ int save_user_shstk(struct task_struct *tsk, unsigned long *saved_shstk_ptr);
 bool is_indir_lp_enabled(struct task_struct *task);
 bool is_indir_lp_locked(struct task_struct *task);
 void set_indir_lp_status(struct task_struct *task, bool enable);
-void set_indir_lp_lock(struct task_struct *task);
+void set_indir_lp_lock(struct task_struct *task, bool lock);
 
 #define PR_SHADOW_STACK_SUPPORTED_STATUS_MASK (PR_SHADOW_STACK_ENABLE)
 
@@ -69,7 +69,7 @@ void set_indir_lp_lock(struct task_struct *task);
 
 #define is_shstk_allocated(task) false
 
-#define set_shstk_lock(task) do {} while (0)
+#define set_shstk_lock(task, lock) do {} while (0)
 
 #define set_shstk_status(task, enable) do {} while (0)
 
@@ -79,7 +79,7 @@ void set_indir_lp_lock(struct task_struct *task);
 
 #define set_indir_lp_status(task, enable) do {} while (0)
 
-#define set_indir_lp_lock(task) do {} while (0)
+#define set_indir_lp_lock(task, lock) do {} while (0)
 
 #define restore_user_shstk(tsk, shstk_ptr) -EINVAL
 
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index aacb23978f93..596662de82e0 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -163,11 +163,13 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	set_shstk_status(current, false);
 	set_shstk_base(current, 0, 0);
 	set_active_shstk(current, 0);
+	set_shstk_lock(current, false);
 	/*
 	 * disable indirect branch tracking on exec.
 	 * libc will enable it later via prctl.
 	 */
 	set_indir_lp_status(current, false);
+	set_indir_lp_lock(current, false);
 
 #ifdef CONFIG_64BIT
 	regs->status &= ~SR_UXL;
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 1adba746f164..9052171c1a8c 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -74,9 +74,9 @@ void set_shstk_status(struct task_struct *task, bool enable)
 	csr_write(CSR_ENVCFG, task->thread.envcfg);
 }
 
-void set_shstk_lock(struct task_struct *task)
+void set_shstk_lock(struct task_struct *task, bool lock)
 {
-	task->thread_info.user_cfi_state.ubcfi_locked = 1;
+	task->thread_info.user_cfi_state.ubcfi_locked = lock;
 }
 
 bool is_indir_lp_enabled(struct task_struct *task)
@@ -104,9 +104,9 @@ void set_indir_lp_status(struct task_struct *task, bool enable)
 	csr_write(CSR_ENVCFG, task->thread.envcfg);
 }
 
-void set_indir_lp_lock(struct task_struct *task)
+void set_indir_lp_lock(struct task_struct *task, bool lock)
 {
-	task->thread_info.user_cfi_state.ufcfi_locked = 1;
+	task->thread_info.user_cfi_state.ufcfi_locked = lock;
 }
 /*
  * If size is 0, then to be compatible with regular stack we want it to be as big as
@@ -452,7 +452,7 @@ int arch_lock_shadow_stack_status(struct task_struct *task,
 	    !is_shstk_enabled(task) || arg != 0)
 		return -EINVAL;
 
-	set_shstk_lock(task);
+	set_shstk_lock(task, true);
 
 	return 0;
 }
@@ -502,7 +502,7 @@ int arch_lock_indir_br_lp_status(struct task_struct *task,
 	    !is_indir_lp_enabled(task) || arg != 0)
 		return -EINVAL;
 
-	set_indir_lp_lock(task);
+	set_indir_lp_lock(task, true);
 
 	return 0;
 }
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
