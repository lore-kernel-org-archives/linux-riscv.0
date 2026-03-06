Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A321F01807
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 08:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yPcCIbbJyE5E1q/ES05NnxxtDCBTMp4LEHvgYnXZbtU=; b=2ujWYEEvtMFjHz
	d1EdnrCXfk0R5TrhlfjVLX565IH9Zz5wtHbbGGXyTTD/JtoLQGuw7eNcA7tw57LUUNl4YvNGqUNnr
	ttTfhxhb7Sp9yVUhWkCoXanLXMp31WO5Yg6dVgO62j8uNUonagsOTcNUDzKjBnrxyBQA5MYEtDrha
	W86nE7L5MkeO+be0TuOQvKAKOYrWDNe4EgQ790RC8MkmCqhc2d0q0EcNVCnF+qqtyBh0MZLdU5U+P
	00XjU4lxpSwgH2e7wca11TGP8oXInje42lANc/SbRIECWI6oArqonmD/aVOo61rvhJ5UeRn+Dyjwy
	oLWaJBufSszyHAJFBbGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQCc-00000003DP2-19cM;
	Fri, 06 Mar 2026 08:06:30 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQCZ-00000003DOi-3OFk
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 08:06:28 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2be1b5fe11cso5182971eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 00:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1772784386; x=1773389186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BwtPYkqes3sOFpm7m8BwfEN8L84UwN7cM3hNgMhWaAs=;
        b=Leo44s1seBl9KlSJK88+CUivAeI1fkzjSYY/Rxa+k4ZlwaPKa4wsAuqXV5mNTvSxG6
         3B0u2qB9gcY7UM+hWSjRwl6Tz1AG5G3VvBEe2r8PmlitUV5JWHNSOVg0C/oozDXtqA5R
         sQjtE9+g0TyuLnMCZDxoY/0YkBa/NijvGAfTIshVVoogxeXftvY8TfCswQSinlOSqm9x
         zGBsifJbAcakD1nbwZrIThPB53TnKbUFrwjl2Fw5dzKphoECmjhaSJ6GqpcglZrAMMgB
         cJlAMfzHeiMK1eR+tv8lyHLB4Uqegja9vwBE2IWfJ2M2B35Dcqg8HErrj8qFg5fLlz17
         MpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772784386; x=1773389186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwtPYkqes3sOFpm7m8BwfEN8L84UwN7cM3hNgMhWaAs=;
        b=SZ0EJ6wjS8w9gj8c2DaF3ZSTZmRrsCuTJgpqT62pQAmycgtjvRgRsrK5Q45QSiQsqN
         on1lUc6VgCXWMD7x5JHdb7ExJJRlYQ5HsVasU590Fxc/N3qt529zTQF24fP46o6w+qZw
         Bw46W+T2vlVmakaV4a3V/FqM77vxCpzvD8ea9QxbSQs0z2Qx/RSEPn3V/JE7sA28N5GJ
         6b3UEyDWI7ueYmMQd2PGi//DDM88deBQ2SXYIBGOJRE3gR93p+VgEwNbr8rEerUTbqbz
         038uHzltI1sIffzBgDGSk39jSY5CwwBm0POy4CTsEDUT1qWGDuwESm8dbTQgu9sEhkC8
         jugA==
X-Forwarded-Encrypted: i=1; AJvYcCWUAgzb1lh4eEqy5v/kXkeOrXov0niaheGArHt1lfZHLUjF+dOUEVK77crIuyTgGNTTqPVsHfZexsQvMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcSxtqrjUUNuaDZkXFRlOh7IsnTLZ/VTrgUhKZJVhnugNGEwLR
	uAvdq1hc8tvQ4Tsds+AiHiwtdvQk9+/R/KVQjRqTrWU2rKyhlQljal360HvkdOlaY78=
X-Gm-Gg: ATEYQzwp6QSryUxwCuL23K4UQd7eY6sEttBBDUpxsZYDL3f809/WZ0yttopSbzGoORj
	6kX1juVNT12f3aPEhBCzejde/sCOMI7DFexpq5YRRLhUftFz3RN/OATackvhDFwGvucpJVs5jEY
	gga933aSU838Nd8YTU+/eun1+b3IB0T8zMUzCHCDq7E44jLLtrjsP+TYlPG0xQPpH33rulraZml
	mvQ2QXkHnGJQWghV89hX60FFjj1clTQlDhXLYTqCE5Lwlj+3pU529L3ogm3xWDnAUxy4sh7FCqs
	cAdSVxErPs5wAGqrImPbby+lVgwvBTBq5vF7m8SHWix9JIVWslcgIBEJkWK0gyrLVD5ZOdP2OfT
	3r7ST4QRNA2ri8+rOmuS4SBm19Lp734k0XB5JrXyBm6CgWkCn9ck8AQJp3PerjuUYeAwQCFhGfW
	leVTfBga6o2aXRlUOeTSufvbBetbsRoQYO/qg=
X-Received: by 2002:a05:7300:fd18:b0:2bd:afdb:72d7 with SMTP id 5a478bee46e88-2be4dfd0250mr411636eec.3.1772784386170;
        Fri, 06 Mar 2026 00:06:26 -0800 (PST)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f82316bsm696067eec.7.2026.03.06.00.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 00:06:25 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	debug@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH] riscv: cif: clear CFI lock status in start_thread
Date: Fri,  6 Mar 2026 00:06:22 -0800
Message-ID: <20260306080622.3864367-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_000627_866970_B73CC53F 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

A newly forked process will inherit the lock status if it
does not clear the lock bits. Since the lock bits remain
set, libc will later fail to enable the landing pad and
shadow stack.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/include/asm/usercfi.h |  8 ++++----
 arch/riscv/kernel/process.c      |  2 ++
 arch/riscv/kernel/usercfi.c      | 12 ++++++------
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
index f7fa9d602aae..c4ab11378308 100644
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
index 6b3648256a0f..36bac478f1e1 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -164,11 +164,13 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
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
index a8530e6afb1e..a101e317fe5e 100644
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
