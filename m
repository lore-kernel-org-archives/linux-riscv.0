Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1437ACD129C
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 00:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iua9f9BO+FW/oorm2c6v1CumCgjupBtcHhxlEa0Ijw4=; b=izpFb9BCS2oxMA
	Sn5Y4csWqZmFhy7jU31s6FRsJlKN2JURDs5QgqqmAVFx4QRsmXCY4CESngvKhQowRnN8zI6Mi3L8i
	V/VBNAu7jXu49b7FKIikK/vLZZzweeAWfAtzaYKPnckYj04KJrsBm9DlnkvCYH2f1un23tvi/47mM
	oSmjw/Plj9NqUcuUrcFDE/4iQOWgTr/kFPjbEtbcsjh71x44TS6/YmdrueGkUn3hWy+a8qCAP5ZXv
	YYoEsX5mYt5kcrCIqvSmOaCSqqY61YcvZqLpvqYIgk8LqtYUrIFjb/Z3/aFRxoVDGnts1+JHX5q/w
	0dvi241eeKjTqf8rLsvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsBIK-00000000oR5-3nnF;
	Thu, 04 Apr 2024 00:49:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAG6-00000000amI-1ou0
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Apr 2024 23:43:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LYjXbKsZWObysa039N5fpdCtqQMANxENOQ8uS4k07nc=; b=jM1B1j/uGGEum4Q9ty9nvzcvTx
	soRJOtWYJoS8WyM7H1hRPhZX3ZTnx84dsGlZY5O9w0MNSahrhFhxoyAfpthnM50dhzGezky7C0yEt
	arkfu0pOl556oryWjt7L4RH84Ckl+wjC3Hg1teJNQbiC9pu7WbcjGyrxA+6cN0j/eoeknu/ZCFBFN
	nK3wSKzq/Kn8nEI3rNYaxhAXuBFiI5YeIVLR3rQqzn0bxRNfYYT+heuOuMlxvEat7xXsNkb69poQC
	6S3dqL/Wgow4/c2kQZKRY0yEjhgiGw7gVz+hkZ8cgGUoKWgat9TTmGKjnISzJElTUtJDa8TPR22Us
	J6zlapwg==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAFw-00000004Tzn-4AoO
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:43:08 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1e0edd0340fso3359335ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187746; x=1712792546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYjXbKsZWObysa039N5fpdCtqQMANxENOQ8uS4k07nc=;
        b=OABWBO6qC+cSF8O5P0HXdcLLpGcSO3AqxpWjS4APiznM95YtIRlLDwLKdCJeKMNnHw
         91i3eVzG3ROiOdSLZxDrR8oj1lHlMcm9dAY+hUZgZYSkj6bOAj6aqJN202A196WPfmIE
         oN+5PYczI3dpi1zXqFnBHxM6wtL97aRHIN9ZXEO6Rm46D3yKC9g/NIJTxDNURyY3DFfU
         ETZVNeU/0glr2y8KQfW/JZurhsmu6sT7XFenRlQdxaRXEiYRe+N0+f8F+3g0xxeXzYqy
         EqvoOebdMape1de3CBiCfBHHdM77be7rG93Uf3S98YglHhJ7D0aJcsiFgogxjlVu/zt3
         NdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187746; x=1712792546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYjXbKsZWObysa039N5fpdCtqQMANxENOQ8uS4k07nc=;
        b=QEO3mAfJjmC08pu7trp9Qeypp/Ew5SRx3s3faDQAv9LuiJppTxf7ySGz1P32monX4s
         0q/eGkF5ruO4ZpXExvAeY2MIOMTJJUbFu+pYJvKWlQQPVP0wq30P04OqDnKoTglqCApg
         j+8Yx7me6y4/OoLJi75SqIZ1M9Vjhto9fqLBThN8oOD3tFc4HQOqxUzJjUlcGcXSUzZb
         bZ99mkOj4grjMFkt573VOVH+67JxtVDNXOmAd2N4EZSFVzU3LDmrRoI3mwubvUuHTvMw
         p6ue52g1gIKxlp+NEuonloNhhQntWzDRPZ1eOVQiurNMHRqSeWuB60SVFNOx3QLvxsJa
         Gwiw==
X-Forwarded-Encrypted: i=1; AJvYcCUbm0tGtj+/rB6BTSvVTZzcU10gMAhCmUKuOGEcLNCDdHNdHQM6FYbiqNfB2tDD5MMo7IWS8y7lAWMCU1+XUzh6swk3DSpVkG3pIcjvyrfh
X-Gm-Message-State: AOJu0YxDh1QfY8510r5k08RyvKXvnK3d84by2xxICpV8rDwCTMMksr+3
	1Lk3UygKDsjbHt9D+srB4M8GGyDZix0ydOYtoW4u1F7NWMQGl9cJZvIqSWfuH/I=
X-Google-Smtp-Source: AGHT+IGqtyBuB5j2we7P/N7XV7ZwjjMEdcimxTlF2S48pW5kJG8K4vLP5TYFGyEOra5BjXZZI2wVPA==
X-Received: by 2002:a17:903:244d:b0:1e0:e85b:3389 with SMTP id l13-20020a170903244d00b001e0e85b3389mr1058260pls.3.1712187746310;
        Wed, 03 Apr 2024 16:42:26 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:42:17 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	conor@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	corbet@lwn.net,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v3 18/29] riscv: Implements arch agnostic shadow stack prctls
Date: Wed,  3 Apr 2024 16:35:06 -0700
Message-ID: <20240403234054.2020347-19-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_004305_135321_6236D007 
X-CRM114-Status: GOOD (  22.03  )
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

Implement architecture agnostic prctls() interface for setting and getting
shadow stack status.

prctls implemented are PR_GET_SHADOW_STACK_STATUS,
PR_SET_SHADOW_STACK_STATUS and PR_LOCK_SHADOW_STACK_STATUS.

As part of PR_SET_SHADOW_STACK_STATUS/PR_GET_SHADOW_STACK_STATUS, only
PR_SHADOW_STACK_ENABLE is implemented because RISCV allows each mode to
write to their own shadow stack using `sspush` or `ssamoswap`.

PR_LOCK_SHADOW_STACK_STATUS locks current configuration of shadow stack
enabling.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/usercfi.h |  18 +++++-
 arch/riscv/kernel/process.c      |   8 +++
 arch/riscv/kernel/usercfi.c      | 107 +++++++++++++++++++++++++++++++
 3 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
index b47574a7a8c9..a168ae0fa5d8 100644
--- a/arch/riscv/include/asm/usercfi.h
+++ b/arch/riscv/include/asm/usercfi.h
@@ -7,6 +7,7 @@
 
 #ifndef __ASSEMBLY__
 #include <linux/types.h>
+#include <linux/prctl.h>
 
 struct task_struct;
 struct kernel_clone_args;
@@ -14,7 +15,8 @@ struct kernel_clone_args;
 #ifdef CONFIG_RISCV_USER_CFI
 struct cfi_status {
 	unsigned long ubcfi_en : 1; /* Enable for backward cfi. */
-	unsigned long rsvd : ((sizeof(unsigned long)*8) - 1);
+	unsigned long ubcfi_locked : 1;
+	unsigned long rsvd : ((sizeof(unsigned long)*8) - 2);
 	unsigned long user_shdw_stk; /* Current user shadow stack pointer */
 	unsigned long shdw_stk_base; /* Base address of shadow stack */
 	unsigned long shdw_stk_size; /* size of shadow stack */
@@ -26,6 +28,10 @@ void shstk_release(struct task_struct *tsk);
 void set_shstk_base(struct task_struct *task, unsigned long shstk_addr, unsigned long size);
 void set_active_shstk(struct task_struct *task, unsigned long shstk_addr);
 bool is_shstk_enabled(struct task_struct *task);
+bool is_shstk_locked(struct task_struct *task);
+void set_shstk_status(struct task_struct *task, bool enable);
+
+#define PR_SHADOW_STACK_SUPPORTED_STATUS_MASK (PR_SHADOW_STACK_ENABLE)
 
 #else
 
@@ -56,6 +62,16 @@ static inline bool is_shstk_enabled(struct task_struct *task)
 	return false;
 }
 
+static inline bool is_shstk_locked(struct task_struct *task)
+{
+	return false;
+}
+
+static inline void set_shstk_status(struct task_struct *task, bool enable)
+{
+
+}
+
 #endif /* CONFIG_RISCV_USER_CFI */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index ef48a25b0eff..3fb8b23f629b 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -145,6 +145,14 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	regs->epc = pc;
 	regs->sp = sp;
 
+	/*
+	 * clear shadow stack state on exec.
+	 * libc will set it later via prctl.
+	 */
+	set_shstk_status(current, false);
+	set_shstk_base(current, 0, 0);
+	set_active_shstk(current, 0);
+
 #ifdef CONFIG_64BIT
 	regs->status &= ~SR_UXL;
 
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 11ef7ab925c9..cdedf1f78b3e 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -24,6 +24,16 @@ bool is_shstk_enabled(struct task_struct *task)
 	return task->thread_info.user_cfi_state.ubcfi_en ? true : false;
 }
 
+bool is_shstk_allocated(struct task_struct *task)
+{
+	return task->thread_info.user_cfi_state.shdw_stk_base ? true : false;
+}
+
+bool is_shstk_locked(struct task_struct *task)
+{
+	return task->thread_info.user_cfi_state.ubcfi_locked ? true : false;
+}
+
 void set_shstk_base(struct task_struct *task, unsigned long shstk_addr, unsigned long size)
 {
 	task->thread_info.user_cfi_state.shdw_stk_base = shstk_addr;
@@ -42,6 +52,23 @@ void set_active_shstk(struct task_struct *task, unsigned long shstk_addr)
 	task->thread_info.user_cfi_state.user_shdw_stk = shstk_addr;
 }
 
+void set_shstk_status(struct task_struct *task, bool enable)
+{
+	task->thread_info.user_cfi_state.ubcfi_en = enable ? 1 : 0;
+
+	if (enable)
+		task->thread_info.envcfg |= ENVCFG_SSE;
+	else
+		task->thread_info.envcfg &= ~ENVCFG_SSE;
+
+	csr_write(CSR_ENVCFG, task->thread_info.envcfg);
+}
+
+void set_shstk_lock(struct task_struct *task)
+{
+	task->thread_info.user_cfi_state.ubcfi_locked = 1;
+}
+
 /*
  * If size is 0, then to be compatible with regular stack we want it to be as big as
  * regular stack. Else PAGE_ALIGN it and return back
@@ -268,3 +295,83 @@ void shstk_release(struct task_struct *tsk)
 	vm_munmap(base, size);
 	set_shstk_base(tsk, 0, 0);
 }
+
+int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
+{
+	unsigned long bcfi_status = 0;
+
+	if (!cpu_supports_shadow_stack())
+		return -EINVAL;
+
+	/* this means shadow stack is enabled on the task */
+	bcfi_status |= (is_shstk_enabled(t) ? PR_SHADOW_STACK_ENABLE : 0);
+
+	return copy_to_user(status, &bcfi_status, sizeof(bcfi_status)) ? -EFAULT : 0;
+}
+
+int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
+{
+	unsigned long size = 0, addr = 0;
+	bool enable_shstk = false;
+
+	if (!cpu_supports_shadow_stack())
+		return -EINVAL;
+
+	/* Reject unknown flags */
+	if (status & ~PR_SHADOW_STACK_SUPPORTED_STATUS_MASK)
+		return -EINVAL;
+
+	/* bcfi status is locked and further can't be modified by user */
+	if (is_shstk_locked(t))
+		return -EINVAL;
+
+	enable_shstk = status & PR_SHADOW_STACK_ENABLE;
+	/* Request is to enable shadow stack and shadow stack is not enabled already */
+	if (enable_shstk && !is_shstk_enabled(t)) {
+		/* shadow stack was allocated and enable request again
+		 * no need to support such usecase and return EINVAL.
+		 */
+		if (is_shstk_allocated(t))
+			return -EINVAL;
+
+		size = calc_shstk_size(0);
+		addr = allocate_shadow_stack(0, size, 0, false);
+		if (IS_ERR_VALUE(addr))
+			return -ENOMEM;
+		set_shstk_base(t, addr, size);
+		set_active_shstk(t, addr + size);
+	}
+
+	/*
+	 * If a request to disable shadow stack happens, let's go ahead and release it
+	 * Although, if CLONE_VFORKed child did this, then in that case we will end up
+	 * not releasing the shadow stack (because it might be needed in parent). Although
+	 * we will disable it for VFORKed child. And if VFORKed child tries to enable again
+	 * then in that case, it'll get entirely new shadow stack because following condition
+	 * are true
+	 *  - shadow stack was not enabled for vforked child
+	 *  - shadow stack base was anyways pointing to 0
+	 * This shouldn't be a big issue because we want parent to have availability of shadow
+	 * stack whenever VFORKed child releases resources via exit or exec but at the same
+	 * time we want VFORKed child to break away and establish new shadow stack if it desires
+	 *
+	 */
+	if (!enable_shstk)
+		shstk_release(t);
+
+	set_shstk_status(t, enable_shstk);
+	return 0;
+}
+
+int arch_lock_shadow_stack_status(struct task_struct *task,
+				unsigned long arg)
+{
+	/* If shtstk not supported or not enabled on task, nothing to lock here */
+	if (!cpu_supports_shadow_stack() ||
+		!is_shstk_enabled(task))
+		return -EINVAL;
+
+	set_shstk_lock(task);
+
+	return 0;
+}
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
