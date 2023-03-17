Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8240C76195
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 11:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iyNnzoXnL6fNs1NDzqiUvMEESqr8n6sTvZrT3A1ASZs=; b=hohgjOFchXordc5UIS0HQhvpXO
	AJ5b/pslNQefx6AAr6wAFOD2ajxr5oZCdEB5RCM7KTL7UphMjaa5esQ5oXWpXlQEWt3BnkTAtdekN
	wrAPSDhVgM/bewMOf4RDFG4cugpoiPmTCRvkY8260+S52up9RA0SlGlytLYzdQ83uWY+lOkeIoBXu
	a7beBAgQfLG//QGcaQOGfTRaJpu9tGbulcwu9Q7kpr67uRIrAla29WOeJ18YY4M2lcbLyBUdQS5og
	ZkHYBMEMLZzo0YVy3bPgQFTGpe4wnlHFbf1rebN/IODV+qJG73dSKekHHvNN1BX48w4q61R/0Potd
	lLvDjYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8PB-0025eW-2z;
	Fri, 17 Mar 2023 11:37:53 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8P7-0025Vx-1F
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 11:37:52 +0000
Received: by mail-pj1-x102f.google.com with SMTP id p3-20020a17090a74c300b0023f69bc7a68so400295pjl.4
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 04:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679053068;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LGkZTe2LulB28qkawijLyK0EfR01doQgW0M1klk25dc=;
        b=c6WEHsafIPK2QmGy33qPthwOZ0J16Np0FKUE1+/2qTSo9juwJy1TfEbvoKVfa7bGjb
         PtcsHWBZR9hqurlYc7eqR+8yG1M3J7YuLTeBA1QwMldLSrJbXA3JiVZU361LmOZMC0Zz
         Prot3b1epS0CCNSONPvGfsTBzlWWLWl1moDgXN2Ij6SmzG/4FcuaZY8yxAlAO4eQQ7yi
         OQ4hsJIFSkfkJ2x9VpzX9XlX2P0WJx3v27ZpkobqrmIedi4y+t2BEDM7cMVXZPeK3rA/
         NKR8z0mQLRaGtTvoaLloRtszbZDg7MrUxzKrx+kJ76xXeT9DFtdXQzeYyiIclVudQjh9
         Kxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679053068;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGkZTe2LulB28qkawijLyK0EfR01doQgW0M1klk25dc=;
        b=CBmJAl+5iejVLpkNw6bqUehoZne/TIYar0456n4JFqRLgSrsfaS98gXsEFfWS3Oe6E
         iSRfWIHE+y7iDqiLp8BAUJXTpJfejFguoGmtdvDqOnmwOkReQa1kzXgOVyTpl2XSvLhE
         fuVTwM3FllRinnjiPr2Ch3dkdqgkghLjoIxaeubndq89FB82G2fgO7CnafqVQ6YnCsyG
         7fM/K7k21OqK7tLpz3cA5Wxcd3SYjnj/LUmxREbGjXd/CV89eIOjf+9Gz307kmNVbbHE
         Kpk10mChQM1Dm+LHui5GP4RmBpFR1kCdsvtgnTIoFtLaqzyIRaP3ZZA/Ksh+YOLWDoEu
         T4Ig==
X-Gm-Message-State: AO0yUKXf2V8ey81pPOMomxM2ygBj86q5ZSf87o2st83HucN9nJIX3jPJ
	DbS6NzLzv8V13YaoCTdI8H3CkTZwTNlK7G6/eLvpBcf07AVboXRGzGqOi8jSgjozXL6Lc2NzO6N
	8AiXLZeN42fRlsXf1MRyob+zMJ5sB7X4rFrWOGGYwClmkIYfgdW1R4RbFqnp/I+E2rABjXRJiNw
	8k4mgfngW8M2bM
X-Google-Smtp-Source: AK7set+rsAE7NRf3j5TFzM76qy8V2Gww4CE2W3ZEiYitz+Hw+NnDEkHNMKgMQ+gHiipjh7SuU7b9oA==
X-Received: by 2002:a17:90b:4f81:b0:237:9cc7:28a4 with SMTP id qe1-20020a17090b4f8100b002379cc728a4mr7615208pjb.14.1679053068526;
        Fri, 17 Mar 2023 04:37:48 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n63-20020a17090a2cc500b0023d3845b02bsm1188740pjd.45.2023.03.17.04.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 04:37:47 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [PATCH -next v15 14/19] riscv: signal: Report signal frame size to userspace via auxv
Date: Fri, 17 Mar 2023 11:35:33 +0000
Message-Id: <20230317113538.10878-15-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230317113538.10878-1-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043749_434728_B6D71FC8 
X-CRM114-Status: GOOD (  22.11  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, Kees Cook <keescook@chromium.org>, Nick Knight <nick.knight@sifive.com>, Andrew Bresticker <abrestic@rivosinc.com>, vineetg@rivosinc.com, Al Viro <viro@zeniv.linux.org.uk>, Vincent Chen <vincent.chen@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Eric Biederman <ebiederm@xmission.com>, Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Zong Li <zong.li@sifive.com>, Heiko Stuebner <heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Vincent Chen <vincent.chen@sifive.com>

The vector register belongs to the signal context. They need to be stored
and restored as entering and leaving the signal handler. According to the
V-extension specification, the maximum length of the vector registers can
be 2^(XLEN-1). Hence, if userspace refers to the MINSIGSTKSZ to create a
sigframe, it may not be enough. To resolve this problem, this patch refers
to the commit 94b07c1f8c39c
("arm64: signal: Report signal frame size to userspace via auxv") to enable
userspace to know the minimum required sigframe size through the auxiliary
vector and use it to allocate enough memory for signal context.

Note that auxv always reports size of the sigframe as if V exists for
all starting processes, whenever the kernel has CONFIG_RISCV_ISA_V. The
reason is that users usually reference this value to allocate an
alternative signal stack, and the user may use V anytime. So the user
must reserve a space for V-context in sigframe in case that the signal
handler invokes after the kernel allocating V.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/elf.h         |  9 +++++++++
 arch/riscv/include/asm/processor.h   |  2 ++
 arch/riscv/include/uapi/asm/auxvec.h |  1 +
 arch/riscv/kernel/signal.c           | 20 +++++++++++++++-----
 4 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index 30e7d2455960..ca23c4f6c440 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -105,6 +105,15 @@ do {								\
 		get_cache_size(3, CACHE_TYPE_UNIFIED));		\
 	NEW_AUX_ENT(AT_L3_CACHEGEOMETRY,			\
 		get_cache_geometry(3, CACHE_TYPE_UNIFIED));	\
+	/*							 \
+	 * Should always be nonzero unless there's a kernel bug. \
+	 * If we haven't determined a sensible value to give to	 \
+	 * userspace, omit the entry:				 \
+	 */							 \
+	if (likely(signal_minsigstksz))				 \
+		NEW_AUX_ENT(AT_MINSIGSTKSZ, signal_minsigstksz); \
+	else							 \
+		NEW_AUX_ENT(AT_IGNORE, 0);			 \
 } while (0)
 #define ARCH_HAS_SETUP_ADDITIONAL_PAGES
 struct linux_binprm;
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index f0ddf691ac5e..38ded8c5f207 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -7,6 +7,7 @@
 #define _ASM_RISCV_PROCESSOR_H
 
 #include <linux/const.h>
+#include <linux/cache.h>
 
 #include <vdso/processor.h>
 
@@ -81,6 +82,7 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid);
 extern void riscv_fill_hwcap(void);
 extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 
+extern unsigned long signal_minsigstksz __ro_after_init;
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PROCESSOR_H */
diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/uapi/asm/auxvec.h
index fb187a33ce58..10aaa83db89e 100644
--- a/arch/riscv/include/uapi/asm/auxvec.h
+++ b/arch/riscv/include/uapi/asm/auxvec.h
@@ -35,5 +35,6 @@
 
 /* entries in ARCH_DLINFO */
 #define AT_VECTOR_SIZE_ARCH	9
+#define AT_MINSIGSTKSZ		51
 
 #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 55d2215d18ea..d2d9232498ca 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -21,6 +21,8 @@
 #include <asm/vector.h>
 #include <asm/csr.h>
 
+unsigned long signal_minsigstksz __ro_after_init;
+
 extern u32 __user_rt_sigreturn[2];
 static size_t riscv_v_sc_size __ro_after_init;
 
@@ -195,7 +197,7 @@ static long restore_sigcontext(struct pt_regs *regs,
 	return err;
 }
 
-static size_t get_rt_frame_size(void)
+static size_t get_rt_frame_size(bool cal_all)
 {
 	struct rt_sigframe __user *frame;
 	size_t frame_size;
@@ -203,8 +205,10 @@ static size_t get_rt_frame_size(void)
 
 	frame_size = sizeof(*frame);
 
-	if (has_vector() && riscv_v_vstate_query(task_pt_regs(current)))
-		total_context_size += riscv_v_sc_size;
+	if (has_vector()) {
+		if (cal_all || riscv_v_vstate_query(task_pt_regs(current)))
+			total_context_size += riscv_v_sc_size;
+	}
 	/*
 	 * Preserved a __riscv_ctx_hdr for END signal context header if an
 	 * extension uses __riscv_extra_ext_header
@@ -224,7 +228,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	struct rt_sigframe __user *frame;
 	struct task_struct *task;
 	sigset_t set;
-	size_t frame_size = get_rt_frame_size();
+	size_t frame_size = get_rt_frame_size(false);
 
 	/* Always make any pending restarted system calls return -EINTR */
 	current->restart_block.fn = do_no_restart_syscall;
@@ -320,7 +324,7 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 {
 	struct rt_sigframe __user *frame;
 	long err = 0;
-	size_t frame_size = get_rt_frame_size();
+	size_t frame_size = get_rt_frame_size(false);
 
 	frame = get_sigframe(ksig, regs, frame_size);
 	if (!access_ok(frame, frame_size))
@@ -483,4 +487,10 @@ void __init init_rt_signal_env(void)
 {
 	riscv_v_sc_size = sizeof(struct __riscv_ctx_hdr) +
 			  sizeof(struct __sc_riscv_v_state) + riscv_v_vsize;
+	/*
+	 * Determine the stack space required for guaranteed signal delivery.
+	 * The signal_minsigstksz will be populated into the AT_MINSIGSTKSZ entry
+	 * in the auxiliary array at process startup.
+	 */
+	signal_minsigstksz = get_rt_frame_size(true);
 }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
