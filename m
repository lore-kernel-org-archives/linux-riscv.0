Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C06FCC9A2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 00:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxEL6+t+Sbss5wHhCgeJJNAzuE3Ql2g6kUCn1hvRa8Y=; b=oiLW6POPLXL5K1y0yttjbCi8Fk
	VLnvRGKqvmwp/tY/0lhD+iMYMHbJ6mPXrs0ZxEVHuX/SFsd4AMclPBCDvJc4H8rMp9n9G5HUJ7tc5
	leDrcAhTQgXpoBPk5MeP6/Qdzo8IMBs5/1etB6pDClIbsTI1FoYGrK1FenFspw1gChHc+duSfOt4l
	zfhSMhyqkQ7WNvbZrHkdZ62zAaCMugy+vF9N4PCJ9WdgkdT7/bGqty1xoG/aUXY6olVh8IKdoLbB6
	83Yk50rMWIzVMCjbOmkNMLKnH2lj67vi505m0SlLK1Ip0BXpvDRODryQBWSmz5s/6VnXWrm2VXGIT
	tPRxn5/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkai-00000008Mo3-39kL;
	Tue, 10 Mar 2026 00:04:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkah-00000008MnC-1FM0
	for linux-riscv@bombadil.infradead.org;
	Tue, 10 Mar 2026 00:04:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JZ4enocr2Iaux0f+iqPmMDVxHO0+VFH8TDCns5aR9c8=; b=C4r2iQFnVvdHxyzdv4iQwJqAvw
	fo5Wiyaaxdd11Ch49hkD+ShOw0DBJudNYNDw5WirafTJ6rUuVJGX3dWC+1gH2+d6zvYIOqR+TJX1c
	GeGkiAxJ6/fG8kwWipQD7sgxlarzkJFkPoyiV2cRjT2FqeRicfIwfvluVOJUJ+AUsYCl+ot9k0EQH
	1sww2oWGvIQ8+CreNrfurzKySO1DoIfZfzSqNZwOYv4e6wOKkjs1RQsy3Uk4DDgN1T9lCuyLEGcNZ
	mHWiaJsqNUJLQp4olLZzINzgmjT3IP+BSdCNqGsnuk9PYRbM4lp3ddlxNd/tJJTA8nqTReIGeiuUH
	euNN9exg==;
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkae-00000006np9-23gv
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 00:04:50 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-8cd847b4b23so185384885a.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 17:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1773101086; x=1773705886; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JZ4enocr2Iaux0f+iqPmMDVxHO0+VFH8TDCns5aR9c8=;
        b=OxXotOARFuqDYCR0Y85jGLLtD2B78B3NalXhTcshXACWKbvQpablJ2pl/XZgsn9QV2
         FXJ/z1IOJECzZ1At6hzFx86P+zDsO4ZHKRjdvOaij05aEVVPgBuU5YfwQcMWbI9qhNmy
         sQYfB2QcfQ8PO6yy/PlAyHZCEG1zFtzLRK0ogpvy7s5B228Tm+HB8Ncl/EPC1/dlZKeC
         5yRqNNE6gxO6mcliuZxtKLuW1gQY5ws7H9KAjRvIs6cdN+zWUHDQdD2+q70BsXxMrQZO
         faFWqBMn+clXHQ1fmwe/dcAbp7L8p3opWAJ+spBZg74Pl3r5IuWbHu79LtNXbPLZkxXj
         QfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101086; x=1773705886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZ4enocr2Iaux0f+iqPmMDVxHO0+VFH8TDCns5aR9c8=;
        b=tqTf8L3KwKeufbH+fHvaAhxMmgcASbcEsr235/UHKgcdgRSzvkI06J7EhJBg5GlP0y
         Yru5lZYVbAx8aoiPAcrClkFenhnnE8FL3r+F3/LgEQWPChyB1xZTJGU0YFltgz6JiXq2
         Y5P4m6tY7HSyxXcFOXCqQS1wnnwZTsoNmwuDB2Nk6IfnBfLaQtRfvu73pjLo+cXO/f42
         4jI5YTimkN3ReoDrQZvkxFncBjZ8qwChJlgIy6vKqEgAGjA2eF9/kC2pevaPeWWCswil
         pDm3W75U1zcSvP7KO9LIWZPFw6HFMfnSBxWZP/cv+QBDwLv/ZCTUoBxfJrJYkwmq8KAF
         4G3A==
X-Forwarded-Encrypted: i=1; AJvYcCXFARTF9KrlsTO8tisVlYmdlFWMkz31L7WUIYc4hgk8W6OVNmoQriXIQdjjXZXCJJBAIpEpmb/UwyOmQw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3QA00l1VBZUgZXL/PbdD3s7/gu/Za5PUtx8H1dm7pThM5qb+c
	GXB5XnCAsa4evn4mocg1Plw8nmxZ0OTJSxPtYNya5U8D9dmDJ3eqq0qwkBRdiEN7zvw=
X-Gm-Gg: ATEYQzxRzaJQEJgok67bf7Jg429Zpp2A4n/2Sa5rMW0zG+xYiX++VsQmuoDEQcf24W0
	03W1UjkYthjvYzdfosxHIj9CbVrGPP67DRXWUmXzCbfWMNSjevSuI4iNNkD3pekcaOkVHB8F0j5
	9OjN9dWq935+QAsd87R4ZUadeFEaJw7zh4MWbGgYIVak9q5e+AEs1fw1gj3rXfJnwlpX/xO2GD1
	6fXbCM53/hb3NMVK17rUHVx/bMYU9vcBiyOVSOKiY8G4E0tF8rV8XqxyGMOH55uaOzY6Ks+iHlP
	XOBicO2kA+uwP6SZOArk86lGXpreNCojAXcUgXX9NdvIc8xwf3gKaYvIO68Z/whEopb66Bpfg4k
	RUqEPw3K4Fhq8oacJAlAjBuc9irP4i1G4H/VmHMp17LYCk7s4mTvrZMPT7hm/Jzh59RpRrWiVyk
	ZSopZ3T13hWGHkimKiQ37u1Br0ylW07rxA
X-Received: by 2002:a05:620a:4722:b0:8cb:4b07:c42f with SMTP id af79cd13be357-8cd6d512ccbmr1714595185a.82.1773101085607;
        Mon, 09 Mar 2026 17:04:45 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd7aec942csm509131885a.10.2026.03.09.17.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:04:45 -0700 (PDT)
Date: Mon, 9 Mar 2026 17:04:43 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Zong Li <zong.li@sifive.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: cif: clear CFI lock status in start_thread
Message-ID: <aa9gG-gh7eZdx-pW@debug.ba.rivosinc.com>
References: <20260306080622.3864367-1-zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260306080622.3864367-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_000448_589842_A47A69F3 
X-CRM114-Status: GOOD (  14.17  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 06, 2026 at 12:06:22AM -0800, Zong Li wrote:
>When libc locks the CFI status through the following prctl:
> - PR_LOCK_SHADOW_STACK_STATUS
> - PR_LOCK_INDIR_BR_LP_STATUS
>
>A newly forked process will inherit the lock status if it

Might want use term "newly execd address space" or something like that.

libc shouldn't be enabling cfi after `fork` or `clone`.
`exec*` are the ones which should have their slate clean and it seems
like `lock` status was not set to clear which this patch fixes. Thanks
for that.

>does not clear the lock bits. Since the lock bits remain
>set, libc will later fail to enable the landing pad and
>shadow stack.
>
>Signed-off-by: Zong Li <zong.li@sifive.com>
>---
> arch/riscv/include/asm/usercfi.h |  8 ++++----
> arch/riscv/kernel/process.c      |  2 ++
> arch/riscv/kernel/usercfi.c      | 12 ++++++------
> 3 files changed, 12 insertions(+), 10 deletions(-)
>
>diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
>index f7fa9d602aae..c4ab11378308 100644
>--- a/arch/riscv/include/asm/usercfi.h
>+++ b/arch/riscv/include/asm/usercfi.h
>@@ -39,7 +39,7 @@ void set_active_shstk(struct task_struct *task, unsigned long shstk_addr);
> bool is_shstk_enabled(struct task_struct *task);
> bool is_shstk_locked(struct task_struct *task);
> bool is_shstk_allocated(struct task_struct *task);
>-void set_shstk_lock(struct task_struct *task);
>+void set_shstk_lock(struct task_struct *task, bool lock);
> void set_shstk_status(struct task_struct *task, bool enable);
> unsigned long get_active_shstk(struct task_struct *task);
> int restore_user_shstk(struct task_struct *tsk, unsigned long shstk_ptr);
>@@ -47,7 +47,7 @@ int save_user_shstk(struct task_struct *tsk, unsigned long *saved_shstk_ptr);
> bool is_indir_lp_enabled(struct task_struct *task);
> bool is_indir_lp_locked(struct task_struct *task);
> void set_indir_lp_status(struct task_struct *task, bool enable);
>-void set_indir_lp_lock(struct task_struct *task);
>+void set_indir_lp_lock(struct task_struct *task, bool lock);
>
> #define PR_SHADOW_STACK_SUPPORTED_STATUS_MASK (PR_SHADOW_STACK_ENABLE)
>
>@@ -69,7 +69,7 @@ void set_indir_lp_lock(struct task_struct *task);
>
> #define is_shstk_allocated(task) false
>
>-#define set_shstk_lock(task) do {} while (0)
>+#define set_shstk_lock(task, lock) do {} while (0)
>
> #define set_shstk_status(task, enable) do {} while (0)
>
>@@ -79,7 +79,7 @@ void set_indir_lp_lock(struct task_struct *task);
>
> #define set_indir_lp_status(task, enable) do {} while (0)
>
>-#define set_indir_lp_lock(task) do {} while (0)
>+#define set_indir_lp_lock(task, lock) do {} while (0)
>
> #define restore_user_shstk(tsk, shstk_ptr) -EINVAL
>
>diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
>index 6b3648256a0f..36bac478f1e1 100644
>--- a/arch/riscv/kernel/process.c
>+++ b/arch/riscv/kernel/process.c
>@@ -164,11 +164,13 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
> 	set_shstk_status(current, false);
> 	set_shstk_base(current, 0, 0);
> 	set_active_shstk(current, 0);
>+	set_shstk_lock(current, false);
> 	/*
> 	 * disable indirect branch tracking on exec.
> 	 * libc will enable it later via prctl.
> 	 */
> 	set_indir_lp_status(current, false);
>+	set_indir_lp_lock(current, false);

Perhaps set status field to zero to prevent any future regression too.

>
> #ifdef CONFIG_64BIT
> 	regs->status &= ~SR_UXL;
>diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
>index a8530e6afb1e..a101e317fe5e 100644
>--- a/arch/riscv/kernel/usercfi.c
>+++ b/arch/riscv/kernel/usercfi.c
>@@ -74,9 +74,9 @@ void set_shstk_status(struct task_struct *task, bool enable)
> 	csr_write(CSR_ENVCFG, task->thread.envcfg);
> }
>
>-void set_shstk_lock(struct task_struct *task)
>+void set_shstk_lock(struct task_struct *task, bool lock)
> {
>-	task->thread_info.user_cfi_state.ubcfi_locked = 1;
>+	task->thread_info.user_cfi_state.ubcfi_locked = lock;
> }
>
> bool is_indir_lp_enabled(struct task_struct *task)
>@@ -104,9 +104,9 @@ void set_indir_lp_status(struct task_struct *task, bool enable)
> 	csr_write(CSR_ENVCFG, task->thread.envcfg);
> }
>
>-void set_indir_lp_lock(struct task_struct *task)
>+void set_indir_lp_lock(struct task_struct *task, bool lock)
> {
>-	task->thread_info.user_cfi_state.ufcfi_locked = 1;
>+	task->thread_info.user_cfi_state.ufcfi_locked = lock;
> }
> /*
>  * If size is 0, then to be compatible with regular stack we want it to be as big as
>@@ -452,7 +452,7 @@ int arch_lock_shadow_stack_status(struct task_struct *task,
> 	    !is_shstk_enabled(task) || arg != 0)
> 		return -EINVAL;
>
>-	set_shstk_lock(task);
>+	set_shstk_lock(task, true);
>
> 	return 0;
> }
>@@ -502,7 +502,7 @@ int arch_lock_indir_br_lp_status(struct task_struct *task,
> 	    !is_indir_lp_enabled(task) || arg != 0)
> 		return -EINVAL;
>
>-	set_indir_lp_lock(task);
>+	set_indir_lp_lock(task, true);
>
> 	return 0;
> }
>-- 
>2.43.7
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
