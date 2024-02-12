Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815CDC4829A
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 03:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cN0cyqalxU7GdWG1kODH3ogTayBeU1OQZqbHsdKZuBc=; b=n+GLrGHXNrpM+M
	5wskQJH4IdHHMCwZwIlPyOlBvOAoGRH5eNaI6qF5rPjLMpjAI1L9wXV2+EbL2hrvYgPxDvJZyNGDT
	AVKlBMMLHy0zUQ8GPkobtF4WADiciUy3EIJdPJVU0NB5wKGFva4x27GW6LSFtf10hcyqJlOAMlI7v
	vYVucI2WAiWFiXP3J6tRUv/PfSXP6A/N2U+8cuWKX2mRXOWC7FbdPe2CC7zeao9e+6vNDkPIqu0ER
	X3/Rt/hQOwwD6YbjWox81sYPCRIRmzLsZhlcn1lwbbE9O47dF+F0pjQ7ugvRX/o5oYrjXtKn17Kbz
	+Cg9Ob9XSguxkP1829og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZN1L-00000004GC1-0F4T;
	Mon, 12 Feb 2024 03:30:15 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZM1u-0000000488e-3XSB
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 02:26:48 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d71cb97937so25876195ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 Feb 2024 18:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707704806; x=1708309606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wExfnkW+ofqoMhPp98EXVpYHYdKKuq8sVv8wNwYyPSY=;
        b=Vp+GrWJFviW6DWQGMYmyq7I7Go2EM3oSWiGT8mF/ZRNe6kUuJhZaN9hQrUaKzS5WId
         H+v13EiXvwEZmHmRmadVuG270R6x2h1aBfYnHwY9Bx/refL+2/Fsr2HoAtsx2EpQieKl
         nIK0vxFPZrGpT0GFjd8NPUEk+i1jtM37FMB5i4gza+HiUxvTpAcAQoDHUFHMMgUTNFIR
         8g3lzHXVUX5e1YeeLFnaSn98kUXFPwBR1qaY9w9p/uoGYlc1BNy60svhp7o61uI//Ku1
         JDHSNMryXm2qLEyZq2FwOlI4Kl4ZuMb1Jil3MtvPJeTErXdb0zFGL2auw0btQ38U/ug4
         boBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707704806; x=1708309606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wExfnkW+ofqoMhPp98EXVpYHYdKKuq8sVv8wNwYyPSY=;
        b=RMoLfFtFyJ6XkWA/0lbvzMumTq/XNBsAsc0APKN0QxcGg4UIL0vHVa2fSyZdL3fhWG
         UUewG/BTJeD5G7+dpRbLkF3XoEpgUTuy5AYSi0eph3PEujdPHDDnoEfpCFdmylGgfraU
         a3u/YvvKHxiDZvnL6uv1RysMcumwrK/2HsMGBQbQjruPasFf/Heiv/46/gCx0VZEQLON
         ZgGIo7dp54O2csvSMFRIc7oB60mVmYh8ZAOd2n5jh9KkTcPGbLDNaJQ6obS497a8Lh1o
         PZLhPm8md0uBHNM80OuNfDFv+pdPLvERD2UbehpCabfPQ9KLlsHPySOT826ZYqoEYX0Q
         1WZA==
X-Gm-Message-State: AOJu0Yx4uc2piWVqfKeMcY43cfPd+k8zGB+MlPk0NhenCV92/oYYaZxz
	L3UxsfzyQHR7dPIgenJA6bPIp4cnbrAafh7sr1Q8qgblhfftcLREjUPLH8a4sS8=
X-Google-Smtp-Source: AGHT+IHsgEpxMWwncMmYnfnphnuqCxyUZrn2Q+KaKaF3ptByDMIbIw9fJf2oX3fuYh82MqOr5OfRDA==
X-Received: by 2002:a17:902:eccc:b0:1d8:e2af:f7a3 with SMTP id a12-20020a170902eccc00b001d8e2aff7a3mr4928995plh.60.1707704805691;
        Sun, 11 Feb 2024 18:26:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPOvgu3XozXDl5roe3CqjO7iyXASdEDHaHVU0+Ex493nHL6cFs8XhrJP3Nw6Jml5gLkIEGeMHeoGP+fR19E/IMBqsvBbVPKMFYcWiMVNcMGCFbDcaB4j71OWOlEiJZGk8nvSUzQNGobocCBcSIqBwO4/N7dqTUK21uJVKTzKcqsUMsVj0F76zf4Z3xuUTR
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id mg8-20020a170903348800b001da27cbcf5dsm1719624plb.228.2024.02.11.18.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 18:26:45 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Jones <ajones@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	stable@kernel.org
Subject: [PATCH -fixes 2/2] riscv: Save/restore envcfg CSR during CPU suspend
Date: Sun, 11 Feb 2024 18:26:15 -0800
Message-ID: <20240212022642.1968739-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212022642.1968739-1-samuel.holland@sifive.com>
References: <20240212022642.1968739-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_182646_906521_F8FB88C0 
X-CRM114-Status: GOOD (  14.64  )
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

The value of the [ms]envcfg CSR is lost when entering a nonretentive
idle state, so the CSR must be rewritten when resuming the CPU.

Because the [ms]envcfg CSR is part of the base RISC-V privileged ISA
specification, it cannot be detected from the ISA string. However, most
existing hardware is too old to implement this CSR. As a result, it must
be probed at runtime.

Extend the logic for the Zicsr ISA extension to probe for the presence
of specific CSRs. Since the CSR number is encoded as an immediate value
within the csrr instruction, a switch case is necessary for any CSR that
must be probed this way. Use the exception table to handle the illegal
instruction exception raised when the CSR is not implemented.

Cc: stable@kernel.org
Fixes: 43c16d51a19b ("RISC-V: Enable cbo.zero in usermode")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/csr.h     | 23 +++++++++++++++++++++++
 arch/riscv/include/asm/suspend.h |  1 +
 arch/riscv/kernel/cpufeature.c   | 23 +++++++++++++++++++++++
 arch/riscv/kernel/suspend.c      |  2 ++
 4 files changed, 49 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2468c55933cd..daff95feb817 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -542,6 +542,29 @@
 			      : "memory");			\
 })
 
+#define ALT_CSR_READ(csr)					\
+({								\
+	unsigned long __v;					\
+	__asm__ __volatile__ (					\
+		ALTERNATIVE("li %[v], 0", "csrr %[v], %[r]", 0,	\
+			    csr << 16 | RISCV_ISA_EXT_ZICSR, 1)	\
+		: [v] "=r" (__v)				\
+		: [r] "i" (csr)					\
+		: "memory");					\
+	__v;							\
+})
+
+#define ALT_CSR_WRITE(csr, val)					\
+({								\
+	unsigned long __v = (unsigned long)(val);		\
+	__asm__ __volatile__ (					\
+		ALTERNATIVE("nop", "csrw %[r], %[v]", 0,	\
+			    csr << 16 | RISCV_ISA_EXT_ZICSR, 1)	\
+		: : [r] "i" (csr), [v] "rK" (__v)		\
+		: "memory");					\
+	__v;							\
+})
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_CSR_H */
diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
index 02f87867389a..491296a335d0 100644
--- a/arch/riscv/include/asm/suspend.h
+++ b/arch/riscv/include/asm/suspend.h
@@ -14,6 +14,7 @@ struct suspend_context {
 	struct pt_regs regs;
 	/* Saved and restored by high-level functions */
 	unsigned long scratch;
+	unsigned long envcfg;
 	unsigned long tvec;
 	unsigned long ie;
 #ifdef CONFIG_MMU
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c5b13f7dd482..934090270ae5 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -954,6 +954,27 @@ void riscv_user_isa_enable(void)
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
+static bool riscv_cpufeature_probe_csr(u16 csr)
+{
+	bool ret = false;
+
+	switch (csr) {
+#define PROBE_CSR_CASE(_csr)			\
+	case _csr:				\
+		asm("1:	csrr zero, %[csr]\n"	\
+		    "	li %[r], 1\n"		\
+		    "2:\n"			\
+		    _ASM_EXTABLE(1b, 2b)	\
+			: [r] "+r" (ret)	\
+			: [csr] "i" (_csr));	\
+		break
+	PROBE_CSR_CASE(CSR_ENVCFG);
+#undef PROBE_CSR_CASE
+	}
+
+	return ret;
+}
+
 /*
  * Alternative patch sites consider 48 bits when determining when to patch
  * the old instruction sequence with the new. These bits are broken into a
@@ -974,6 +995,8 @@ static bool riscv_cpufeature_patch_check(u16 id, u16 value)
 		return true;
 
 	switch (id) {
+	case RISCV_ISA_EXT_ZICSR:
+		return riscv_cpufeature_probe_csr(value);
 	case RISCV_ISA_EXT_ZICBOZ:
 		/*
 		 * Zicboz alternative applications provide the maximum
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 239509367e42..fe544f12a5c5 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -15,6 +15,7 @@
 void suspend_save_csrs(struct suspend_context *context)
 {
 	context->scratch = csr_read(CSR_SCRATCH);
+	context->envcfg = ALT_CSR_READ(CSR_ENVCFG);
 	context->tvec = csr_read(CSR_TVEC);
 	context->ie = csr_read(CSR_IE);
 
@@ -36,6 +37,7 @@ void suspend_save_csrs(struct suspend_context *context)
 void suspend_restore_csrs(struct suspend_context *context)
 {
 	csr_write(CSR_SCRATCH, context->scratch);
+	ALT_CSR_WRITE(CSR_ENVCFG, context->envcfg);
 	csr_write(CSR_TVEC, context->tvec);
 	csr_write(CSR_IE, context->ie);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
