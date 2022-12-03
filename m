Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1952CC4332F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 21:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJ4IKxkqylO+OsaEDHbblnpInfDXYdEI9f8R9FYZPbY=; b=VbxM/0GNuZYEFk
	UD+e4idO24+EUezi6wSeF0Vcxs5T+KbowoSEFgUFAhKOi2Wt/7QMhljs5TcDZt1o2UqMmnl7GTtFu
	xhCyVhVcSxItFdRpmFHTrnnHF1oNFVOSDWc/d7MTuqcF2QdS1cV/TZ12SlSj8Te6EMIoZzN7YdHNm
	rdjVr42WC0gfSQUzatdVDVh5KslxMwl1+xxCxt4VOvSrZHU0mKYwOMastXobv+BNGZTZFk3DeOmEe
	kdAasxtQ5PaChz1juBCvc+YP/TIh1dsWpFwI0l+cJqHD5RBX6NZTy/HyA/11VbffXgARImPfuGW0t
	CxAukr8Ahkr/OHcn5Zcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1aU6-005UUB-NH; Sat, 03 Dec 2022 21:55:46 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1aU2-005USa-K8
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 21:55:44 +0000
Received: by mail-lf1-x135.google.com with SMTP id g7so12772232lfv.5
        for <linux-riscv@lists.infradead.org>; Sat, 03 Dec 2022 13:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wi3n+kVrXBjnnt2095tFaJL6C3hilfYYv1s6JmrGtDA=;
        b=DHnhbDCkwpaYJypY3u45GL2dEzYe9OvjwSsQnxfDZjvxD3L7Hic9IA1omRlPFl4HOA
         y5Npl2QD+K+SBQrgPu0iWtH3RyBdb6ie2rNBESeG016OKu+NatAzAfdBDsjSFlfGG4VL
         8oE1NDr/FUO6RjnbGsZ/Mtc3Emg2EakyUX0Zl83Nzd9cTxuof1HAI67ITbB9btJXahy2
         zSGHLbwJX7IbgNSKRCrVNFT+wMJRi1VcgRz/ENQFN0yBeLtCbHgPhfvsZfTqws+nuv/A
         MgnYYNJ4u0wY6khEwOoeCp0g0UzCZV5xj9TLGAzvJ+5Tvep7DHCzmIUus6LXjafXDHdp
         K9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wi3n+kVrXBjnnt2095tFaJL6C3hilfYYv1s6JmrGtDA=;
        b=4yEKzYFFxine9jUzu3BenG/DPnRz1FveFHvF+ed0k5Da21oBPt3PLRPDhAXdyFTH2i
         xGCFmytBj8VYJomvLUXFXeH1zRgEHAsoI7ct3DvGH+o3WaIKvnZx2a5frt4niImdmoTq
         rY29J3xHw91gKZJjfAT0PgPc8Yc6zrlJJmcWtRxQsoHqB2qxEAF+DbDDfCl0rumSJQ6z
         SQTAwLDO7H4yYzVxSksgWmaUa/WnnEtMczmbXN+cKo6waFMqRp6fb3xCYXlAywMGkurI
         UuoW7EmJr79ZmACIGLx5AAcByDsGKSVFrDYA1YEjEHV2o3UW9yAviGZdXLEUn9qAaeQR
         m+Kg==
X-Gm-Message-State: ANoB5pnAgPy76u4DT8qsCUYijAaQ3FHaZUqOtbZr8/452he1nDIvxJcS
	alNlyxSLmBPdZGKsuSwCG66S/JUlydo4tg==
X-Google-Smtp-Source: AA0mqf79CvR9u4+RKnhgFwjZy47L3B0GO+4w84mPLQDsLK2GAZaas1mlZKf1QyJngmadu1QfJzaPHA==
X-Received: by 2002:ac2:508d:0:b0:4a4:72b0:9a2b with SMTP id f13-20020ac2508d000000b004a472b09a2bmr24434251lfm.469.1670104540605;
        Sat, 03 Dec 2022 13:55:40 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id j2-20020a056512344200b004b4f2a30e6csm1537002lfr.0.2022.12.03.13.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 13:55:39 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: [PATCH RFC v2 2/3] riscv: ptrace: expose hardware breakpoints to debuggers
Date: Sun,  4 Dec 2022 00:55:34 +0300
Message-Id: <20221203215535.208948-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221203215535.208948-1-geomatsi@gmail.com>
References: <20221203215535.208948-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_135542_726146_64CC2DB5 
X-CRM114-Status: GOOD (  18.50  )
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

From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

Implement regset-based ptrace interface that exposes hardware
breakpoints to user-space debuggers.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
---
 arch/riscv/include/uapi/asm/ptrace.h |   9 ++
 arch/riscv/kernel/process.c          |   2 +
 arch/riscv/kernel/ptrace.c           | 188 +++++++++++++++++++++++++++
 3 files changed, 199 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 882547f6bd5c..e7a5e1b9ea58 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -77,6 +77,15 @@ union __riscv_fp_state {
 	struct __riscv_q_ext_state q;
 };
 
+struct user_hwdebug_state {
+	__u64     dbg_info;
+	struct {
+		__u64 addr;
+		__u64 type;
+		__u64 len;
+	}       dbg_regs[16];
+};
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _UAPI_ASM_RISCV_PTRACE_H */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index cd99bececed8..b66936b02caf 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -15,6 +15,7 @@
 #include <linux/tick.h>
 #include <linux/ptrace.h>
 #include <linux/uaccess.h>
+#include <linux/hw_breakpoint.h>
 
 #include <asm/unistd.h>
 #include <asm/processor.h>
@@ -148,6 +149,7 @@ void flush_thread(void)
 	fstate_off(current, task_pt_regs(current));
 	memset(&current->thread.fstate, 0, sizeof(current->thread.fstate));
 #endif
+	flush_ptrace_hw_breakpoint(current);
 }
 
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 2ae8280ae475..9bdc70ad7819 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -18,6 +18,7 @@
 #include <linux/regset.h>
 #include <linux/sched.h>
 #include <linux/sched/task_stack.h>
+#include <linux/hw_breakpoint.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/syscalls.h>
@@ -27,6 +28,10 @@ enum riscv_regset {
 #ifdef CONFIG_FPU
 	REGSET_F,
 #endif
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	REGSET_HW_BREAK,
+	REGSET_HW_WATCH,
+#endif
 };
 
 static int riscv_gpr_get(struct task_struct *target,
@@ -83,6 +88,170 @@ static int riscv_fpr_set(struct task_struct *target,
 }
 #endif
 
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+static void ptrace_hbptriggered(struct perf_event *bp,
+				struct perf_sample_data *data,
+				struct pt_regs *regs)
+{
+	struct arch_hw_breakpoint *bkpt = counter_arch_bp(bp);
+
+	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)bkpt->address);
+}
+
+static int hw_break_get(struct task_struct *target,
+			const struct user_regset *regset,
+			struct membuf to)
+{
+	/* send total number of h/w debug triggers */
+	u64 count = hw_breakpoint_slots(regset->core_note_type);
+
+	membuf_write(&to, &count, sizeof(count));
+	return 0;
+}
+
+static inline int hw_break_empty(u64 addr, u64 type, u64 size)
+{
+	/* TODO: for now adjusted to current riscv-gdb behavior */
+	return (!addr && !size);
+}
+
+static int hw_break_setup_trigger(struct task_struct *target, u64 addr,
+				  u64 type, u64 size, int idx)
+{
+	struct perf_event *bp = ERR_PTR(-EINVAL);
+	struct perf_event_attr attr;
+	u32 bp_type;
+	u64 bp_len;
+
+	if (!hw_break_empty(addr, type, size)) {
+		/* bp size: gdb to kernel */
+		switch (size) {
+		case 2:
+			bp_len = HW_BREAKPOINT_LEN_2;
+			break;
+		case 4:
+			bp_len = HW_BREAKPOINT_LEN_4;
+			break;
+		case 8:
+			bp_len = HW_BREAKPOINT_LEN_8;
+			break;
+		default:
+			pr_warn("%s: unsupported size: %llu\n", __func__, size);
+			return -EINVAL;
+		}
+
+		/* bp type: gdb to kernel */
+		switch (type) {
+		case 0:
+			bp_type = HW_BREAKPOINT_X;
+			break;
+		case 1:
+			bp_type = HW_BREAKPOINT_R;
+			break;
+		case 2:
+			bp_type = HW_BREAKPOINT_W;
+			break;
+		case 3:
+			bp_type = HW_BREAKPOINT_RW;
+			break;
+		default:
+			pr_warn("%s: unsupported type: %llu\n", __func__, type);
+			return -EINVAL;
+		}
+	}
+
+	bp = target->thread.ptrace_bps[idx];
+	if (bp) {
+		attr = bp->attr;
+
+		if (hw_break_empty(addr, type, size)) {
+			attr.disabled = 1;
+		} else {
+			attr.bp_type = bp_type;
+			attr.bp_addr = addr;
+			attr.bp_len = bp_len;
+			attr.disabled = 0;
+		}
+
+		return modify_user_hw_breakpoint(bp, &attr);
+	}
+
+	if (hw_break_empty(addr, type, size))
+		return 0;
+
+	ptrace_breakpoint_init(&attr);
+	attr.bp_type = bp_type;
+	attr.bp_addr = addr;
+	attr.bp_len = bp_len;
+
+	bp = register_user_hw_breakpoint(&attr, ptrace_hbptriggered,
+					 NULL, target);
+	if (IS_ERR(bp))
+		return PTR_ERR(bp);
+
+	target->thread.ptrace_bps[idx] = bp;
+	return 0;
+}
+
+static int hw_break_set(struct task_struct *target,
+			const struct user_regset *regset,
+			unsigned int pos, unsigned int count,
+			const void *kbuf, const void __user *ubuf)
+{
+	int ret, idx = 0, offset, limit;
+	u64 addr;
+	u64 type;
+	u64 size;
+
+#define PTRACE_HBP_ADDR_SZ	sizeof(u64)
+#define PTRACE_HBP_TYPE_SZ	sizeof(u64)
+#define PTRACE_HBP_SIZE_SZ	sizeof(u64)
+
+	/* Resource info and pad */
+	offset = offsetof(struct user_hwdebug_state, dbg_regs);
+	ret = user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf, 0, offset);
+	if (ret)
+		return ret;
+
+	/* trigger settings */
+	limit = regset->n * regset->size;
+	while (count && offset < limit) {
+		if (count < PTRACE_HBP_ADDR_SZ)
+			return -EINVAL;
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &addr,
+					 offset, offset + PTRACE_HBP_ADDR_SZ);
+		if (ret)
+			return ret;
+
+		offset += PTRACE_HBP_ADDR_SZ;
+
+		if (!count)
+			break;
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &type,
+					 offset, offset + PTRACE_HBP_TYPE_SZ);
+		if (ret)
+			return ret;
+
+		offset += PTRACE_HBP_TYPE_SZ;
+
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &size,
+					 offset, offset + PTRACE_HBP_SIZE_SZ);
+		if (ret)
+			return ret;
+
+		offset += PTRACE_HBP_SIZE_SZ;
+
+		ret = hw_break_setup_trigger(target, addr, type, size, idx);
+		if (ret)
+			return ret;
+
+		idx++;
+	}
+
+	return 0;
+}
+#endif
+
 static const struct user_regset riscv_user_regset[] = {
 	[REGSET_X] = {
 		.core_note_type = NT_PRSTATUS,
@@ -102,6 +271,25 @@ static const struct user_regset riscv_user_regset[] = {
 		.set = riscv_fpr_set,
 	},
 #endif
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	[REGSET_HW_BREAK] = {
+		.core_note_type = NT_ARM_HW_BREAK,
+		.n = sizeof(struct user_hwdebug_state) / sizeof(u32),
+		.size = sizeof(u32),
+		.align = sizeof(u32),
+		.regset_get = hw_break_get,
+		.set = hw_break_set,
+	},
+	[REGSET_HW_WATCH] = {
+		.core_note_type = NT_ARM_HW_WATCH,
+		.n = sizeof(struct user_hwdebug_state) / sizeof(u32),
+		.size = sizeof(u32),
+		.align = sizeof(u32),
+		.regset_get = hw_break_get,
+		.set = hw_break_set,
+	},
+#endif
+
 };
 
 static const struct user_regset_view riscv_user_native_view = {
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
