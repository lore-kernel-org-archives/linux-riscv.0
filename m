Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224F9ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 19:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7iSPZ9lhRC5+P91P3LqCeQponjwvV7lsnZcKxH9oaM=; b=nKxnLwqD/2e74V
	IayGMt4Q1NrVrwN913ML/V2m/OXYbcOsI8uISsmmLgrHn85envuxdTHR78oTm65QNLnUTd20sz/si
	CWHySRAeqvnoQXUtYpZ91yBGLitu9hcsIUaxBfbsbhaDZBx+BKMSIV4VeTZtSnDmBrhrAodolySnC
	WGq31ieOQn957WE0r6akutMUxcXbFsy5LQmBxwxSRGs6FHVIB1hMWwLs8ovGLkCNOUijtkcoZC//o
	QjSI6BK8k0RNNK3gyDoOXm2vssYQVAPX8zDKlScAb5uDFHC+4jTJHs3HF3ir1ii2ocqkEygI87IEZ
	KZAwe8c305VF8cUA3VdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5hi-00CVJT-OO; Wed, 21 Sep 2022 19:48:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5hg-00CVHc-RB
	for linux-riscv@bombadil.infradead.org; Wed, 21 Sep 2022 19:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+2Y/W36PtIBBFhLsRM7jN1P/q6NhH3hMDNv7n9pXDHw=; b=G8GtY76ra2kL2lrQ/pLhX1Hhyt
	Tea5ZdrEICB/t0NsC9PE6BZDFLf3rKXxgeN86VRV7Sr0p2UQiZX7SBYnqHaw6X39/hDSIWPO9BcpA
	H1yH7YdKHcGtWQqm3Nv1zWcxjvY6VNHb8pddCeWMhYD7tVmBf2vy69sWvYAZWS24Sh8Y4aC5secbf
	NMkrl4qC0NrBkqrZo1VQbYxTExKnkcHuTqrVNr7PLJB5vyeq6yGmwYIPSZ0kdXLUJbOdMu12VLOLB
	98ByX3CLJ0KKByvuTpzkgter+Ym1ceAo6Ke74P5XTjCPKGBDdx5ORPp3EsRJux3U010IPXCGwOIBK
	yw8TnoIw==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5gb-00EkA4-Co
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 19:48:12 +0000
Received: by mail-pj1-x102c.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so15433255pjq.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 12:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=+2Y/W36PtIBBFhLsRM7jN1P/q6NhH3hMDNv7n9pXDHw=;
        b=v12v4cd24DpzZFCrYGAAAGPUX3DZrM7QEAakP9vZHLO7ZbnXJXWIZmgUz4ytKCSXJb
         P69z8bLBoDrdfKCJUxTci0YXxqwlLBgJ4Qhe+jTKPehgqBxf3Yv7EWdNsfx7v8lBy8Qv
         5/TkVqsrKLFRFXBaXTjnILNWZtJrL8iIGytAVr1U0WisfD5mLg2nk4nJMLWPvQcOIkGg
         W4qdFgNPEBT6lqV3ypGrwhY5dIbuEJR8Mo/p3WnaLwnxxkYR3Megw0IDFyt0g60CwDMY
         r2njZQVXXmpubh0CWDodNJAX7QGelECmFuxNSyUtExTuMQopGLP/G+hyp/wxBxAZh/ae
         4Xzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+2Y/W36PtIBBFhLsRM7jN1P/q6NhH3hMDNv7n9pXDHw=;
        b=kgoy2szKoiBc5B5eCd6+zhynDzcxB93YLydxhCNDcKHNPlj/QhWtYhLkLSKTRHzCD5
         VOlinbSron+0/YKbOt8MFuHPaCMLAQSc7YXFvvIHhq1r+rgBm5mzQJBN4OdHY1b6HwJq
         vBfKKTAy8KAzx4SHlROh481r4AX+eiAQ/1uTnCS7KE/bvdY+Iq6dqSuNkJBj73CI2M7b
         vpJRvmvds/TNGb60BRpznIupx8fxF6JsaFa1BdSwLpakwJ/PaORy0vpujB8f72lI2p94
         gAnGWEtIzP0s+jilxbnVBtVx+0uDvs9G3Z7LYsutHMx+BsAJ7jqqLsOrrOWcZIk462Jp
         i/bQ==
X-Gm-Message-State: ACrzQf3oeIH3Z30lDLoaxAcOeEi495E/ZHkZGd5tqjM5+3b7ad6I0/D3
	ZOJQ/MQyBXln4a9l8kBD+yTHrWqFmHz5Cw==
X-Google-Smtp-Source: AMsMyM4FEycaO/URZwhRGu0XrCmE2nlQ8HOTKnVKKHIHf0yPdugvR4gsE0So0s8Uzq/ZYGvNzJGe3w==
X-Received: by 2002:a17:90b:4c41:b0:202:78e9:472b with SMTP id np1-20020a17090b4c4100b0020278e9472bmr11453339pjb.207.1663789613640;
        Wed, 21 Sep 2022 12:46:53 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id o2-20020aa79782000000b0054aa69bc192sm2551057pfp.72.2022.09.21.12.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 12:46:53 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	jpalmer@dabbelt.com,
	kvm-riscv@lists.infradead.org
Cc: Greentime Hu <greentime.hu@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH 09/17] riscv: Add ptrace vector support
Date: Wed, 21 Sep 2022 12:46:21 -0700
Message-Id: <20220921194629.1480202-10-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921194629.1480202-1-stillson@rivosinc.com>
References: <20220921194629.1480202-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_204730_184890_B935EAE6 
X-CRM114-Status: GOOD (  20.35  )
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

From: Greentime Hu <greentime.hu@sifive.com>

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
index 2ae8280ae475..cce459ff551d 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -27,6 +27,9 @@ enum riscv_regset {
 #ifdef CONFIG_FPU
 	REGSET_F,
 #endif
+#ifdef CONFIG_VECTOR
+	REGSET_V,
+#endif
 };
 
 static int riscv_gpr_get(struct task_struct *target,
@@ -83,6 +86,64 @@ static int riscv_fpr_set(struct task_struct *target,
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
@@ -102,6 +163,16 @@ static const struct user_regset riscv_user_regset[] = {
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
index c7b056af9ef0..5a5056c6a2a1 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -439,6 +439,7 @@ typedef struct elf64_shdr {
 #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
 #define NT_MIPS_FP_MODE	0x801		/* MIPS floating-point mode */
 #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
+#define NT_RISCV_VECTOR	0x900		/* RISC-V vector registers */
 #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
 #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
 #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
