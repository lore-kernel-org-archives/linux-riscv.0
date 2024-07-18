Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD72C3DA5D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 00:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U4DQwfrrSVPHhehvZ4r1tkJidKzRLZW64z0JBILMtXs=; b=OjA1lyDAzPStJm
	CItPG+N9K+drdBZDChVWPUmr+fmoUvh4AgQssLSElpyM83BWcJSwDZAOjp2VP9c9jou0hiCrDzW2b
	igKBBZNKB0OcWMo6UdPwOcMvqUZSeK3t3hqnngFai++H+2OGFCLUIzx0/dzx8kjtT62wNLfDJ0Ur6
	5PFGeZ9DovQcODh+rUBxqX9xdwOHFg7IobltCCU1V76obzTGMJz4jwA3hsnRT8IIXDQgYb0P3CMRm
	cVWtHfvhBTijNSTiAgvIqKRdERwmL2CWfSAEBvpwLX3IFgkuVtw0RTG7uscpx2yf1f4fBbnjLqERb
	9H8wwWB6q8+UlH7JjxmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUFJk-0000000FIGI-2V1Q;
	Thu, 18 Jul 2024 00:48:20 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUFJg-0000000FIEn-3ECH
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 00:48:18 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5b9776123a3so90397eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 17:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721263695; x=1721868495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yshoBMmTilnB7Tn31CojFxfms9fcaLBu92AZXjz1tU=;
        b=fEIbSon7afZUmLlaUmKIUR9L0E7vw8QjLhC1cZiDlghSP+jN7xxRVTz8jgv/YeJqRD
         VrnI1BxjSViB5xCYWUHq4R36jW3Eqa6LLBldpcIBNSUymiRerj54eVSa9ScCFShOJuFG
         2hjrU7cPsSP6RHUuckm4U2OFMeFebL4cgZJSi5o3IdjmpYsrj0gEXX1SBsCKUZJutRc1
         UqbSSzxqq/YQmnXVwjdy3cBBekaFnPoVgJTZ4vUy9D9HvQqZLAxqLKbx79/3YnRoHX1c
         w6b7g1HOBzZvcZpq55l9Ge8CFDuRpKQYbNkjyiv7Iucpe5JIijZq0dEbGNzxptxzQxla
         wjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721263695; x=1721868495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yshoBMmTilnB7Tn31CojFxfms9fcaLBu92AZXjz1tU=;
        b=vkSj+F5gTx91480dcoUWGWogXRaPH1af8Yd31jRVNzaIcbdu1m9zXrNC7auV04bYEb
         BrSjtANGIZ3B7VC7fANovNG/6FPDq8NpW/0nrErVq5wq2g2UbeyIQNUJL8XQov+SHG6v
         Vaz9Ns/Y8U6FE3x7pnqplidwM9mHC3Et7WVwCu8YCfHJe1vIVhCisPpJy4XSyokLDSxa
         1Gmp3hizXNPlOghy2L5CIDQvxKBPPn0pdKPZuOrO/L4gEN+YfjqKWH56RMUVTwFw170s
         3Fp7BHP33GoTjq1DgtFy48vyTNiGBLpQ3j7TfPLEfczDj1ETyrto06SGy3wKaClXRhBd
         Km7g==
X-Gm-Message-State: AOJu0YzSKjqCCrxmF8CAjPE0OI08Pf3RqF8WpzTS4QzK8Lvz4gvFXaVk
	3QVvFMS/rJvESQJrUIDbfZACqiceYlz/7I4UtQuMJungMp5ltqn5+ztMGUuX4amCSQO+rnRepkh
	nQKJvR87pTOGOMfdsHqsgGqccXfmz+OCfJnbz2b+9vWxFUJA/5Im4BO9SupfdpZsTskC3HQ7Bhm
	gLeq+hR+PwFgEOIb+2BIYPr2Ul76u8oRdRTExlkwHpeNK0+E/QIklC3uCC
X-Google-Smtp-Source: AGHT+IFRqJmu713tBVUOkgi8JXhj0gBme+e9qJOsn5K+mQGju57nj8Rza2na6vwCvpeIB6ToTiVXyQ==
X-Received: by 2002:a05:6820:3095:b0:5c6:9320:4f1e with SMTP id 006d021491bc7-5d41d0c0709mr4511184eaf.6.1721263695492;
        Wed, 17 Jul 2024 17:48:15 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e386d53e4sm5694300a12.70.2024.07.17.17.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 17:48:14 -0700 (PDT)
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
Subject: [PATCH v3 2/3] riscv: Add support for per-thread envcfg CSR values
Date: Wed, 17 Jul 2024 17:47:55 -0700
Message-ID: <20240718004808.2246354-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240718004808.2246354-1-samuel.holland@sifive.com>
References: <20240718004808.2246354-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_174816_834153_B13D3E01 
X-CRM114-Status: GOOD (  16.14  )
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
index 4efaf12b470e..43fdae953379 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -878,7 +878,7 @@ unsigned long riscv_get_elf_hwcap(void)
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
