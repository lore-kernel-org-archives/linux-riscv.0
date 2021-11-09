Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF772C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:52:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACB3561055
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ACB3561055
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qStUerEOZ5sYBijKNNS4e5/8SJUlrnRzwZnXqi8YNyM=; b=g/v4XG99llPIFJ
	CeCzxPLAAhqcNHroCBLTrmaNBhvzOa2zOYRx4wK1LGilOlN7WFIjzbKVvlzCwYnUc0+zf9qmqncqS
	IpYNqhGgvNQQap+/w57PeDz4nuq3iLt2NXeVbjkSI7/MWdokErtbZdCGWuwJAqeD+AhR8Uhw8UvO4
	lj1rwuPsHQZZhvFC8WYI6sCAttGDS2Ub2u29Y2/Tfdruqet/fEK/GWDtFoLde3SLCzcNKNqIUxL1u
	p8vgn04ncRYYg1zhjJK2lYPVTMKtG/ISp5ZeKs/3pBS+pKtVnoqAl11J5FXFV9X8CEO5lwuICVR1A
	Rz9NkWpCb24VzXZWqm0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNnv-001L3s-Uo; Tue, 09 Nov 2021 09:52:36 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNkG-001JXm-Jg
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 09:48:50 +0000
Received: by mail-pl1-x636.google.com with SMTP id o14so19935487plg.5
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 01:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pSiPeFKJFYMukSt/z6kM3xPQTQJ5rRNs0AebXPpOAjY=;
 b=mSA9WxR92Ql2MISDabj0bHJAFDZkUwT81JIEMYpKz8W+M9Pvp4uemjF3gyefJwCwq8
 Kx1kFXqDifT6/VW4sp7c1AepBIViPr1K2bGXhDuhia0TqwSJUAOUeu2ORw2HSSoYczyM
 2HFCiI2ts6M0itgnhM7GS8YdbOsK3wx5zj1ICg6w4a9n9ruNhB5Qpe65mvi2WA6KlGiF
 xPT2A6QVPHSDVLKNKfhvNSzsCe5HpccBhPxYcQnyJvXT3PjwcC/JoAAUMBjVnj6DuRQ0
 DSNNMBU7lBWr8kSELDsK30/YoTrw6FaxXRSdw/ZzXzMzNzi1DmBQfw+FXh/ZcdJLwdkq
 h4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pSiPeFKJFYMukSt/z6kM3xPQTQJ5rRNs0AebXPpOAjY=;
 b=Q+gPdvdqiuCWeIjnELooQbBcCt+XEvaknA02rlNGky5JtSSsxaxMPGvKHkmZgNbWX6
 DrUzSGU83pjA9c2RxxCNFzEykSaHSCAzLeK6/dmEb3Ijbp0locnyFfSF9CPgbRur2kOR
 rGhW2tyYU0eBd7/5PZeCjJFcKrKg6ud+DfpT9cJpT62Ah36+Z7v1mV2ZhnPdyJln+20H
 Yz2b+N0viA5KZW0t/3nwo2ipzpZ5kO0xyJYfUOe0OjVSR7mIUf7OrztdaWCsY//8W3mt
 ms4L2oHnL7SP+6mUZgC5NSfUmtUNQidlQ3MulXVpQn0s4OguQsRX38oawin5r735SeHs
 jlhQ==
X-Gm-Message-State: AOAM531KW7vRDJbEaahE7BNDAIeejyq9uHHlW3RtvUd/RiNcISIF7FXP
 jZpZPdv4xoCL6kBehpBmKdagDw==
X-Google-Smtp-Source: ABdhPJz8akHZDC0DyGdU9dXjy40jmh/F9jnTOnvxVLFrUHgHis/guw3yw0u0i2lRfbwPFu+DWpXRwg==
X-Received: by 2002:a17:902:c20d:b0:142:1009:585d with SMTP id
 13-20020a170902c20d00b001421009585dmr5659968pll.83.1636451327530; 
 Tue, 09 Nov 2021 01:48:47 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id cv1sm1940511pjb.48.2021.11.09.01.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 01:48:47 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v9 10/17] riscv: Add ptrace vector support
Date: Tue,  9 Nov 2021 17:48:22 +0800
Message-Id: <2b593b387db3e7e3f9612fe76893b20d9b9e23a9.1636362169.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636362169.git.greentime.hu@sifive.com>
References: <cover.1636362169.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_014848_696112_51D47344 
X-CRM114-Status: GOOD (  19.50  )
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
 arch/riscv/include/uapi/asm/ptrace.h | 14 ++++++
 arch/riscv/kernel/ptrace.c           | 71 ++++++++++++++++++++++++++++
 include/uapi/linux/elf.h             |  1 +
 3 files changed, 86 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index bd3b8a710246..c3760395236c 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -83,11 +83,25 @@ struct __riscv_v_state {
 	unsigned long vtype;
 	unsigned long vcsr;
 	void *datap;
+	/*
+	 * In signal handler, datap will be set a correct user stack offset
+	 * and vector registers will be copied to the address of datap
+	 * pointer.
+	 *
+	 * In ptrace syscall, datap will be set to zero and the vector
+	 * registers will be copied to the address right after this
+	 * structure.
+	 */
 #if __riscv_xlen == 32
 	__u32 __padding;
 #endif
 };
 
+/*
+ * To define a practical maximum vlenb for ptrace and it may need to be
+ * extended someday.
+ */
+#define RISCV_MAX_VLENB (16384)
 #endif /* __ASSEMBLY__ */
 
 #endif /* _UAPI_ASM_RISCV_PTRACE_H */
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 9c0511119bad..0bc11a70090c 100644
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
@@ -85,6 +88,64 @@ static int riscv_fpr_set(struct task_struct *target,
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
@@ -104,6 +165,16 @@ static const struct user_regset riscv_user_regset[] = {
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
index 61bf4774b8f2..60c5b873a8f6 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -432,6 +432,7 @@ typedef struct elf64_shdr {
 #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
 #define NT_MIPS_FP_MODE	0x801		/* MIPS floating-point mode */
 #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
+#define NT_RISCV_VECTOR	0x900		/* RISC-V vector registers */
 
 /* Note types with note name "GNU" */
 #define NT_GNU_PROPERTY_TYPE_0	5
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
