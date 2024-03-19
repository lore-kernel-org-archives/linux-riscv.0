Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA27CCD11DD
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 21:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ilMoEC+uRHnhokm+vGp4faT+VMpuS66v+tw/+y045Ys=; b=NqCjY+LQ+cB7zX
	/tmPz+gjRrcKOeYDnxbrjPYkm2WMaKg3qjUPNIL5QPQG67/8Jg5z4bmPVAReUlG5pSKSGj9U4C0rm
	iB+JZFUh5kl8Q4v4cqupTkVKFmkqr1sFnErM3uMPsyjT+huSBsPyU2736hfPi/hiBeEiSX/InHFMU
	cOTgUX3OSHYW79fCL7EdoBMcV5roYOOoF2cx2z2kUd1ljjEmcvCD+nIkewJTZsElP6ykk8CnaT4qW
	//WDrp8mOwIAaWwzmlRiW2/ZokbeWB/cL6lK+4VQv1QSqzPWdEMIuuVU5Zvr1a/r8j1sATZHXSCf7
	4OZkAyZW1cWX6K/cO3uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmhUc-0000000EMlP-37PS;
	Tue, 19 Mar 2024 21:59:34 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmhUV-0000000EMh0-2LNY
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 21:59:28 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e6f6d782e4so4001062b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 14:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710885567; x=1711490367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5y8ITBc9KMnXCgtx77FHcE1LkP6cPCkee9IZD/0lAIU=;
        b=lHAyxCKEMomcOIHhpEQ5jzppiCLOx3dPcKOIYH3Is90u3z3TxTYlf3zNCuZqUmCOgu
         6Zplox9h6+eZW51+PsD5U1Hb2tFbi6tEb3UUKz2J15G2xlReOHXSBbJePQ4UeQsN/NWU
         xRoc70ic2ioYG7oNe0JfmrpyB9hx8esqYe23fTUZ/gv1SLIbTct570GRp1aRWvxv9ohE
         MbyaZYrDgUZBMBcgDtSZ5biD2M/8o0XR/uwEmkPbtTsMQ/B4jWTSll51d5XESUFz4cjZ
         GsBJsQ+Uctgp79cKSKVODm7t3LrKg6ROvOHkV90o1rKkvWcQaJwIhTgzO/OWHmzrlKgV
         lbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710885567; x=1711490367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5y8ITBc9KMnXCgtx77FHcE1LkP6cPCkee9IZD/0lAIU=;
        b=N0JMf436pCObpc7IV9VRaFcOJZXglnvK+vwROf1z4ULO1idU1A8fFtj6HYdTwgnZZ/
         a9YeEVeePm74XZI9fK3SZTfQPCGndXLMlnuc+CFGUpg+f35oXSDIxg1XrcMKv3rujA9J
         84/I2USgj/oygO5tNGctSLycf4/3P/nCH8n29HuHfe0DfOAxCgLaTVYrXe44DSCPvLDA
         8kuIlzbE4iKLHBSz8iTq0Wu3SLO7cUGnnOULc1OOEko3QdD8tEcMoDeR1YipW0hswAmj
         0nT9+DQHTCn/rph+c6mIIyZgn3WMmsHEJn9GtVOIR2I5PwYk0WXPqvQTSJauSRXdlTMK
         uaiw==
X-Forwarded-Encrypted: i=1; AJvYcCV7w7BLb+JgNpMLzKoGcUM9d3deQMzlxoTpJ25TYEdf1mCCjCUePjETTT7fUuVp3wAQPYVH0aYlZhkd3ToqzxcOWkK2Tw69ehKTbdrNjIhB
X-Gm-Message-State: AOJu0YycQDVF3mPU8QKTy9i1lHIBh+uhEVW86/OGCsAXlFI3jYpuvAkm
	2Xu7bEHDeRHOI8FHmteVzuJTL8jBdsYNCPa/haFAD2GavKOyyWz7LcPcQAdsNtI=
X-Google-Smtp-Source: AGHT+IHUdXawCkbimlLWn+n2NYwUpCHwdCxYmf1G6S225P30rVgH1guDbncjMramMLIp2vM31iLyBg==
X-Received: by 2002:a05:6a20:3942:b0:1a3:2f9e:b0da with SMTP id r2-20020a056a20394200b001a32f9eb0damr14091704pzg.23.1710885567124;
        Tue, 19 Mar 2024 14:59:27 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id z25-20020aa785d9000000b006e6c61b264bsm10273892pfn.32.2024.03.19.14.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 14:59:26 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	tech-j-ext@lists.risc-v.org,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alejandro Colomar <alx@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [RFC PATCH 8/9] riscv: Allow ptrace control of the tagged address ABI
Date: Tue, 19 Mar 2024 14:58:34 -0700
Message-ID: <20240319215915.832127-9-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240319215915.832127-1-samuel.holland@sifive.com>
References: <20240319215915.832127-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_145927_633247_349470A3 
X-CRM114-Status: GOOD (  13.27  )
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

This allows a tracer to control the ABI of the tracee, as on arm64.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/ptrace.c | 42 ++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/elf.h   |  1 +
 2 files changed, 43 insertions(+)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index e8515aa9d80b..3d414db2118b 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -28,6 +28,9 @@ enum riscv_regset {
 #ifdef CONFIG_RISCV_ISA_V
 	REGSET_V,
 #endif
+#ifdef CONFIG_RISCV_ISA_POINTER_MASKING
+	REGSET_TAGGED_ADDR_CTRL,
+#endif
 };
 
 static int riscv_gpr_get(struct task_struct *target,
@@ -152,6 +155,35 @@ static int riscv_vr_set(struct task_struct *target,
 }
 #endif
 
+#ifdef CONFIG_RISCV_ISA_POINTER_MASKING
+static int tagged_addr_ctrl_get(struct task_struct *target,
+				const struct user_regset *regset,
+				struct membuf to)
+{
+	long ctrl = get_tagged_addr_ctrl(target);
+
+	if (IS_ERR_VALUE(ctrl))
+		return ctrl;
+
+	return membuf_write(&to, &ctrl, sizeof(ctrl));
+}
+
+static int tagged_addr_ctrl_set(struct task_struct *target,
+				const struct user_regset *regset,
+				unsigned int pos, unsigned int count,
+				const void *kbuf, const void __user *ubuf)
+{
+	int ret;
+	long ctrl;
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ctrl, 0, -1);
+	if (ret)
+		return ret;
+
+	return set_tagged_addr_ctrl(target, ctrl);
+}
+#endif
+
 static const struct user_regset riscv_user_regset[] = {
 	[REGSET_X] = {
 		.core_note_type = NT_PRSTATUS,
@@ -182,6 +214,16 @@ static const struct user_regset riscv_user_regset[] = {
 		.set = riscv_vr_set,
 	},
 #endif
+#ifdef CONFIG_RISCV_ISA_POINTER_MASKING
+	[REGSET_TAGGED_ADDR_CTRL] = {
+		.core_note_type = NT_RISCV_TAGGED_ADDR_CTRL,
+		.n = 1,
+		.size = sizeof(long),
+		.align = sizeof(long),
+		.regset_get = tagged_addr_ctrl_get,
+		.set = tagged_addr_ctrl_set,
+	},
+#endif
 };
 
 static const struct user_regset_view riscv_user_native_view = {
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index 9417309b7230..90806024fed6 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -447,6 +447,7 @@ typedef struct elf64_shdr {
 #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
 #define NT_RISCV_CSR	0x900		/* RISC-V Control and Status Registers */
 #define NT_RISCV_VECTOR	0x901		/* RISC-V vector registers */
+#define NT_RISCV_TAGGED_ADDR_CTRL 0x902	/* RISC-V tagged address control (prctl()) */
 #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
 #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers */
 #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension registers */
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
