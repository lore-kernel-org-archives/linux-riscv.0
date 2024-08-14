Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BB9C52D7F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 08:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfXUvmBj9fILdR06ojLWYJIDd2SI3qiUfQhQAyCpfVU=; b=0AtOFGS5EXJS9A
	VlOOX69hqLBjZf3mG3J2dU+SmluRrj8d9ccDj//uEl3UodEs1mQ//E9KHhMFSQpGso19GTWpEMFuU
	+m/fewxip9cNxpkk9w5EgbduJSc8wN0aZRtk3azSo5jFKY+F9cX7gM+4iDaVvbJaduRtJw4/SCGhU
	o2aGB/a1ExMTA558yKXmXHDFtPJuxTOcLHw+uDnpk/++OaoS1Qgs1CoxMEqHz/Aa4zSIbCFPdf7f2
	YAuig4fq0d5GmmLSO9J2W3IAnW/N1vo+7VbbGwY/TwFys+w/6sN+gS+3eH/lqbm1W1T5I/roc5iCi
	1QsmTX2X5yFP/soZ/p9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se96Y-00000006BpH-0q7t;
	Wed, 14 Aug 2024 08:11:38 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se96U-00000006BnT-2TOi
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 08:11:36 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1ff1cd07f56so53160935ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 01:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723623093; x=1724227893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPBDT7aylVUsHOeEB1LM43PupNXpIhM1dDweQwhBYlQ=;
        b=NwUbprPcIKqJibh7uiq0b1Al+m49eY6VPUhP2vwvlfWgm8tTZpTXopSFbVxig6NjYP
         RgRT1fDQlwDbiMykOt+4DINq1vPWftLVTYqIt5CaUSXEIR9mP5V1GfT7pJFm4wbzPRgn
         nFebMdtW0qOH2IIaSRBEDSzTtHdmK2FEM+CmJIE7D4U33rBrbnHHc8FGY72/TfPLUSXs
         5Tc7ah8vD7J5QovN7Gz/r16jzrb/3Q5+UKDBAs2dTlrbzjFrUHuF6v4WbwJALmUHjVm8
         AdX0FxQyxXfeifmfkbRs7/pW/JBswrnGpr62Ij5gDS20tcBWy0IZn9TVKzR3EQKiEzmE
         xytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723623093; x=1724227893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPBDT7aylVUsHOeEB1LM43PupNXpIhM1dDweQwhBYlQ=;
        b=mga0w4y1t+fKEKpV0nChnlYwWfczv/X+JgMLOjKmYRElfEptl58kBX53OgKUd/jPb6
         qCm//oMzzgsLPqO4fsqqkXI3ZcH0uqLoNySpUrH8nX8DZ5kHRVd+fQITAU2dVM1vfsv2
         cjvxp9htlYLeeGpNAeOH1aI4jhKB/GxhTQpoPTn3XA535O9mC/XIjZdfAsXPkO1Uvxw/
         jOp7bwMF9uFUEKvoDQX0WRyhT6GIOyQ+lJLWMFnh28LOOOOGo0x4R7KIQWDOUpl1iYrw
         0zpDICDCMtJ7pxQk0RebDeGt1kpADZ73ATfGMnS2Wrk0uc9Yy+2h6xEZxiGODbiSTUiT
         5wVg==
X-Gm-Message-State: AOJu0YzIf8FCqkWCrHhBqvTw9QUt3vX9JyzQ96hTwFso0oRfaUh885b9
	CV3KgDESxfO3x3hCgHDRHQYpKk35EPBzuf+3E2cncEH/dzGa+vTuVIt8VkM3MppBBh6S0meXyEp
	tRFZPSPFCEp24eHvUONLfJe4qxvPB8Z44AHAn6gw8zauAuEbpB39i1+1xD3qFYVXDebm0rEApbP
	EYSk03UDmxKsiFahx6L+zdEM2NXj1TRUqRjfBSgREa/jBW12tCxi0jxdni
X-Google-Smtp-Source: AGHT+IEqqh03VoThtjgWPQLBrpFrEOpKeAi4wVz6y0BwfWNUlOLSmFDsplnBip1l0vDTl8VOYklDcQ==
X-Received: by 2002:a17:902:ec8c:b0:201:daee:6fae with SMTP id d9443c01a7336-201daee71b6mr9353495ad.48.1723623093101;
        Wed, 14 Aug 2024 01:11:33 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1a94d2sm24559955ad.127.2024.08.14.01.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:11:32 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	linux-kernel@vger.kernel.org,
	Deepak Gupta <debug@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Leonardo Bras <leobras@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH v4 2/3] riscv: Add support for per-thread envcfg CSR values
Date: Wed, 14 Aug 2024 01:10:55 -0700
Message-ID: <20240814081126.956287-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240814081126.956287-1-samuel.holland@sifive.com>
References: <20240814081126.956287-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_011134_688621_5EC14B43 
X-CRM114-Status: GOOD (  16.10  )
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

Some bits in the [ms]envcfg CSR, such as the CFI state and pointer
masking mode, need to be controlled on a per-thread basis. Support this
by keeping a copy of the CSR value in struct thread_struct and writing
it during context switches. It is safe to discard the old CSR value
during the context switch because the CSR is modified only by software,
so the CSR will remain in sync with the copy in thread_struct.

Use ALTERNATIVE directly instead of riscv_has_extension_unlikely() to
minimize branchiness in the context switching code.

Since thread_struct is copied during fork(), setting the value for the
init task sets the default value for all other threads.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/include/asm/processor.h | 1 +
 arch/riscv/include/asm/switch_to.h | 8 ++++++++
 arch/riscv/kernel/cpufeature.c     | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 8702b8721a27..586e4ab701c4 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -124,6 +124,7 @@ struct thread_struct {
 	unsigned long s[12];	/* s[0]: frame pointer */
 	struct __riscv_d_ext_state fstate;
 	unsigned long bad_cause;
+	unsigned long envcfg;
 	u32 riscv_v_flags;
 	u32 vstate_ctrl;
 	struct __riscv_v_ext_state vstate;
diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 7594df37cc9f..9685cd85e57c 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -70,6 +70,13 @@ static __always_inline bool has_fpu(void) { return false; }
 #define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif
 
+static inline void __switch_to_envcfg(struct task_struct *next)
+{
+	asm volatile (ALTERNATIVE("nop", "csrw " __stringify(CSR_ENVCFG) ", %0",
+				  0, RISCV_ISA_EXT_XLINUXENVCFG, 1)
+			:: "r" (next->thread.envcfg) : "memory");
+}
+
 extern struct task_struct *__switch_to(struct task_struct *,
 				       struct task_struct *);
 
@@ -103,6 +110,7 @@ do {							\
 		__switch_to_vector(__prev, __next);	\
 	if (switch_to_should_flush_icache(__next))	\
 		local_flush_icache_all();		\
+	__switch_to_envcfg(__next);			\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 0139d4ea8426..df3e7e8d6d78 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -922,7 +922,7 @@ unsigned long riscv_get_elf_hwcap(void)
 void riscv_user_isa_enable(void)
 {
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
-		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
+		current->thread.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
 		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
 }
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
