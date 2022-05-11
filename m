Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A64C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 08:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I4DM4ft+SF6gWGTp/I48LB8cOAku6R5JLEVICe6cmq4=; b=fskLtu1q8roEu5
	mHmHArgk+LogSoBc5FKZSsexOer83aUnOtV7XXIBz/X0mDJOFSRdTaU/+utNMct2deSxw89ULYC+j
	qyO1IgwGAPh65V3VKMBxUAirH/qNUNmBj6U348FJPWJ2LK7LHC7FH2UHh2wOaKBe/gR9SYkkMTWgh
	aB17fvAms83jbshVMUZcmfXWTd8WGGXJmjYiAGVphMAhh8gDMRtrgaEHNhnrUFAH2dM8mQ6cRp9HR
	OsWB/arLhVhla235nNSeE8xVKopiYBEDsXBJtrlSH7TuRWvnMbb0Ag0d07ZJaq/su6cu8A+bHs3CL
	ZMr8Lsg9IRDF7dLpvyIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nohlF-005xad-Rl; Wed, 11 May 2022 08:31:57 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nohl4-005xOy-1x
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 08:31:47 +0000
Received: by mail-pf1-x432.google.com with SMTP id a11so1388149pff.1
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 01:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
 :references; bh=hn9a0/YIZzR3pf/XVlEiVrwG/Xe5Ymt+E9Xn6o6kKJM=;
 b=KIPMNaSvgyCbpsbGTq8d2mWXUto29HB+ZCEjfgcJ5KcgD2LiZxHLHCkSel9nGFEsyx
 eZ2jkyCn/Z2XTf1Y8TxPRhlAZvyxtpLW//MXf4FtyuinEWaVckfOp08GzRcMRdGYt8O0
 ZXzDROyJEnE4pBy3QQdrCkCF6mWdVNNah9ICken2EGT5rGV0B7Nn1v1ZMx2TapOq7hCK
 kUBeCKzLSC2VI5s/s6WIsPX0rlbeJIwyjiCjJjI+Ia8mFDpjZ0Cd2H+FaluqLmVdfzjE
 F84cvF3uM7gN9/pEWvggRVqkXuGPt6chyKZ7YngU3hlSFmG9ch35Q0aRloeECr+Zlz1d
 W9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=hn9a0/YIZzR3pf/XVlEiVrwG/Xe5Ymt+E9Xn6o6kKJM=;
 b=LZdiwmm3pE7qu6aazqRW76aOZUQ8VA6zKt+0fY8JLnbAqpoa1nXCa3+/jqvjptrsF4
 jz5OKDEMl+SLm6UHMX9qz87gqV3kig/j+1mC9+V+Jbhbp4+Rui19MRuqa+mcY9IeMwul
 xAFMvEYptjbJnoXEa/OjhovysAS6dCaisJ/2ZmzNJ8upWi4OWKGgyTDARH55exSWeM4P
 vfdzbEqICsWRdmQkL9ytfI/Fsn+37X4IK4PukoX7kGIgkLCMvjnMKYQS2ysL/QBeSHyH
 Sue3SmPvd6yjMTSkNiUXy83CoCbhf/024u3SHkkPZlI+VJ2spFRMWhqc4G7duxIRs621
 4ciQ==
X-Gm-Message-State: AOAM5332LGDUKcc/Xy/2UpeCyOARyLaA1Aq3D0lHG/yJ5Mh5LYfycO1r
 EnZgG1YiTIOacIruNymh0hXBgw==
X-Google-Smtp-Source: ABdhPJxp+ISq3NZJ3C2Q/F96qDWvW8mSZfGkeL0XXlKA3QTGQuIjYnlS+xXGaaee3syOfYi3VlYuvw==
X-Received: by 2002:a05:6a00:2310:b0:505:a8ac:40e7 with SMTP id
 h16-20020a056a00231000b00505a8ac40e7mr24183433pfh.11.1652257903964; 
 Wed, 11 May 2022 01:31:43 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net.
 [59.124.168.89]) by smtp.gmail.com with ESMTPSA id
 m10-20020aa7900a000000b0050dc7628170sm1020202pfo.74.2022.05.11.01.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 01:31:43 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v10 09/16] riscv: Add ptrace vector support
Date: Wed, 11 May 2022 08:31:19 +0000
Message-Id: <33d5a0f0e3a689831be52d3cfcf4720115edb868.1652257230.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_013146_147873_8D5EC67D 
X-CRM114-Status: GOOD (  19.75  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch adds ptrace support for riscv vector. The vector registers will
be saved in datap pointer of __riscv_v_state. This pointer will be set
right after the __riscv_v_state data structure then it will be put in ubuf
for ptrace system call to get or set. It will check if the datap got from
ubuf is set to the correct address or not when the ptrace system call is
trying to set the vector registers.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/uapi/asm/ptrace.h |  6 +++
 arch/riscv/kernel/ptrace.c           | 71 ++++++++++++++++++++++++++++
 include/uapi/linux/elf.h             |  1 +
 3 files changed, 78 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 6ee1ca2edfa7..2491875be80d 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -94,6 +94,12 @@ struct __riscv_v_state {
 	 */
 };
 
+/*
+ * According to spec: The number of bits in a single vector register,
+ * VLEN >= ELEN, which must be a power of 2, and must be no greater than
+ * 2^16 = 65536bits = 8192bytes
+ */
+#define RISCV_MAX_VLENB (8192)
 #endif /* __ASSEMBLY__ */
 
 #endif /* _UAPI_ASM_RISCV_PTRACE_H */
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 793c7da0554b..6f5d88220c84 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -26,6 +26,9 @@ enum riscv_regset {
 #ifdef CONFIG_FPU
 	REGSET_F,
 #endif
+#ifdef CONFIG_VECTOR
+	REGSET_V,
+#endif
 };
 
 static int riscv_gpr_get(struct task_struct *target,
@@ -82,6 +85,64 @@ static int riscv_fpr_set(struct task_struct *target,
 }
 #endif
 
+#ifdef CONFIG_VECTOR
+static int riscv_vr_get(struct task_struct *target,
+			const struct user_regset *regset,
+			struct membuf to)
+{
+	struct __riscv_v_state *vstate = &target->thread.vstate;
+
+	/*
+	 * Ensure the vector registers have been saved to the memory before
+	 * copying them to membuf.
+	 */
+	if (target == current)
+		vstate_save(current, task_pt_regs(current));
+
+	/* Copy vector header from vstate. */
+	membuf_write(&to, vstate, RISCV_V_STATE_DATAP);
+	membuf_zero(&to, sizeof(void *));
+#if __riscv_xlen == 32
+	membuf_zero(&to, sizeof(__u32));
+#endif
+
+	/* Copy all the vector registers from vstate. */
+	return membuf_write(&to, vstate->datap, riscv_vsize);
+}
+
+static int riscv_vr_set(struct task_struct *target,
+			 const struct user_regset *regset,
+			 unsigned int pos, unsigned int count,
+			 const void *kbuf, const void __user *ubuf)
+{
+	int ret, size;
+	struct __riscv_v_state *vstate = &target->thread.vstate;
+
+	/* Copy rest of the vstate except datap and __padding. */
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, vstate, 0,
+				 RISCV_V_STATE_DATAP);
+	if (unlikely(ret))
+		return ret;
+
+	/* Skip copy datap. */
+	size = sizeof(vstate->datap);
+	count -= size;
+	ubuf += size;
+#if __riscv_xlen == 32
+	/* Skip copy _padding. */
+	size = sizeof(vstate->__padding);
+	count -= size;
+	ubuf += size;
+#endif
+
+	/* Copy all the vector registers. */
+	pos = 0;
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, vstate->datap,
+				 0, riscv_vsize);
+	return ret;
+}
+#endif
+
 static const struct user_regset riscv_user_regset[] = {
 	[REGSET_X] = {
 		.core_note_type = NT_PRSTATUS,
@@ -101,6 +162,16 @@ static const struct user_regset riscv_user_regset[] = {
 		.set = riscv_fpr_set,
 	},
 #endif
+#ifdef CONFIG_VECTOR
+	[REGSET_V] = {
+		.core_note_type = NT_RISCV_VECTOR,
+		.align = 16,
+		.n = (32 * RISCV_MAX_VLENB)/sizeof(__u32),
+		.size = sizeof(__u32),
+		.regset_get = riscv_vr_get,
+		.set = riscv_vr_set,
+	},
+#endif
 };
 
 static const struct user_regset_view riscv_user_native_view = {
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index 7ce993e6786c..b4e8d7dde15b 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -436,6 +436,7 @@ typedef struct elf64_shdr {
 #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
 #define NT_MIPS_FP_MODE	0x801		/* MIPS floating-point mode */
 #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
+#define NT_RISCV_VECTOR	0x900		/* RISC-V vector registers */
 
 /* Note types with note name "GNU" */
 #define NT_GNU_PROPERTY_TYPE_0	5
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
