Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972BDC7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GmcuXV4paia85jh6ESDfkcmNN0UfP9dF4EV0gE7Swv0=; b=vKITMx0Fsa8cR0PVoMz+Pnn5h7
	OMNsMun2FA2RY1ZVMQzNU2T7GKNie/2nP+n8gbEwTa5X+WCpx4+jmwwcFuc5FyGg2O+TKxVftvXrK
	hgTYKjG1UhDzXUcgXdnunSLi1kRubvHk4io41KAAyQ/ePu5YsuTwXbWBVWwKX/H34mIO12XALgQOz
	6LiSwJ/3blo/Hd8Ct7gXVnCX2yGKtcASzPaAcd8mo4o/vmKBWd1XMf8SZTlnImP7VZUq5x+LMkaQ+
	xi9PxnNV1h/PkUtgYD1sMtRqju7wikqCLxZ13stw49rPiL4NtleU0oTyypmyon8We4EX3P2UxoyF1
	hGmwSMKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbTY-003EGX-BA; Fri, 24 Feb 2023 17:03:16 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbTU-003EAC-Oj
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 17:03:14 +0000
Received: by mail-pl1-x636.google.com with SMTP id ky4so153316plb.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 09:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AlKKel+cEzUa4nWulxqzQ6V6S4zBsnEjdcY3a0TOoBk=;
        b=PFkVseWH6FYDa2QPWImXVwfI6wbxmjaZhktQRlb5siMyemaCYGewGR989TRUVx9Nrf
         ZwUmEbPlA77eMOEnn0vSv7867SRLP2mpv5NxOgWu3oGja/szg9NTHy+7b6WoL3WNemLT
         ShazTTf/SYmncboXMu1h55Cs5iFosxdwprx/HHutV4Hh+/Z923km2ncgeeBb2qVZ3Uc6
         bytRzD3cQX5CqmGZ5rnMoPWzijAWdDpnoC0FLVcx96y6McA/cRSo8YAb9e7LsPnNGV9+
         XVQrYfSTbaXxYu6sV0OD4xhI234l9vPuEN3dV9JwgOsC+GqFHxv6d9eAwory042ZgMYJ
         DqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AlKKel+cEzUa4nWulxqzQ6V6S4zBsnEjdcY3a0TOoBk=;
        b=BWaMXP8QWVOXtwpwqNmYFv4KF9130beLav4TCzZ+I8nHD8wFfY4ooKZ2mFs3k4hk+5
         iVfihVbpSxtPiDJL0T4KViQCIBX400zkJma1HO35e0XcHdJ29FF+ruGE7v7txEhflOEn
         TX1NmgZ5gAlgY7j1my2zO004pBfJtYcfkjX0Tq7zObeTlLAmqeysoFUXSDNVJ0AcucTm
         bO70g/U6fhA5dikWeHnTJE+LmXmY5WlIf10rFMM9c70rnP709/iMZir4LMwjgdBjZR/4
         usn8YfGqLE0V0Ely4oUmYBaKnqcqd8/6PR90j7rp8NbGONjQnFh0WxLM4eNNiAyjX/8n
         GTjw==
X-Gm-Message-State: AO0yUKVknaC9N9aXSwKrS9cx1V7TAHs4qWWk7gXRJSuCHW6dZLAdQotQ
	fx3fvRewpwVp5pegBsuKG8/tLtCsyBBxLXWdQki2RAlmHlxauZLwOvdqDMiSjcTV6OZFtF8t97U
	PGKy1p2uZa6HF3Tq5dgxm8gWl4ibEIfMEnX+Joz0KtIz4WZgVx/yhQcP5TKaxU09y99IDlrTp2j
	fzQZwk9bEMYQ==
X-Google-Smtp-Source: AK7set9uimFJXh/iOMry0tS54oA8/EwH5nN2iSDih6nh3Z8BSKitt4coCFXsd5HOnF67hJpXpp+rZg==
X-Received: by 2002:a17:903:1208:b0:19a:eb93:6165 with SMTP id l8-20020a170903120800b0019aeb936165mr19452666plh.22.1677258188637;
        Fri, 24 Feb 2023 09:03:08 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902b60c00b0019472226769sm9234731pls.251.2023.02.24.09.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:03:08 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [PATCH -next v14 14/19] riscv: signal: Report signal frame size to userspace via auxv
Date: Fri, 24 Feb 2023 17:01:13 +0000
Message-Id: <20230224170118.16766-15-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230224170118.16766-1-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_090312_861043_823B98F2 
X-CRM114-Status: GOOD (  22.38  )
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
index fb187a33ce58..2c50d9ca30e0 100644
--- a/arch/riscv/include/uapi/asm/auxvec.h
+++ b/arch/riscv/include/uapi/asm/auxvec.h
@@ -35,5 +35,6 @@
 
 /* entries in ARCH_DLINFO */
 #define AT_VECTOR_SIZE_ARCH	9
+#define AT_MINSIGSTKSZ 51
 
 #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 76c0480ee4cd..aa8ee95dee2d 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -21,6 +21,8 @@
 #include <asm/vector.h>
 #include <asm/csr.h>
 
+unsigned long __ro_after_init signal_minsigstksz;
+
 extern u32 __user_rt_sigreturn[2];
 static size_t riscv_v_sc_size;
 
@@ -195,7 +197,7 @@ static long restore_sigcontext(struct pt_regs *regs,
 	return -EINVAL;
 }
 
-static size_t cal_rt_frame_size(void)
+static size_t cal_rt_frame_size(bool cal_all)
 {
 	struct rt_sigframe __user *frame;
 	size_t frame_size;
@@ -203,8 +205,10 @@ static size_t cal_rt_frame_size(void)
 
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
@@ -225,7 +229,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	struct rt_sigframe __user *frame;
 	struct task_struct *task;
 	sigset_t set;
-	size_t frame_size = cal_rt_frame_size();
+	size_t frame_size = cal_rt_frame_size(false);
 
 	/* Always make any pending restarted system calls return -EINTR */
 	current->restart_block.fn = do_no_restart_syscall;
@@ -320,7 +324,7 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 {
 	struct rt_sigframe __user *frame;
 	long err = 0;
-	size_t frame_size = cal_rt_frame_size();
+	size_t frame_size = cal_rt_frame_size(false);
 
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
+	signal_minsigstksz = cal_rt_frame_size(true);
 }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
