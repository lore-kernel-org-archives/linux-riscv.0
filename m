Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A903BC021A5
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 20:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRKwbmU5qBvoQWc+V/8xtLYTXQbaV7ZdQ8JJQmB+HDc=; b=dV1ux4fSLusX4W
	RwsT2MvWpI0Y00mOhW7cxh8RK136ByyOaEy1bf2Wii3ybBlKVE6+5ASpi0H31Qgo3rYWJVo+LolR+
	91AuRR4dMmdcO23qaLIn0MAGxfuVPH2qsX6Z2PuG9NHBhM68P9btmRfrMAGoAhJ7jcn+nwF4yFYnS
	dzuqh5sweGKojgBPjGHUgHFfEIiW3WV4mZZlXajGdM6G+Lm5yY1gAzJHKL/ZyhEWgNrPjMwmK6AJm
	R8WrAFdL6U9jSKG6hUfhgHoYMwjDRtqG+xcHlJzcIVh3oe9QsnWb9FoEoQyjd3J1a2Qryoke4jueR
	6bYIL5obQL0dUxssYvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thaMp-00000001JfG-1uXO;
	Mon, 10 Feb 2025 20:26:55 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaMm-00000001JbP-3djJ
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 20:26:54 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21f55fbb72bso56897055ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 12:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219212; x=1739824012; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3DM8zy+WllPP0TujEXFZ0Ycc0zGrpNRrMRWPkPmGZc=;
        b=CRSmIkJR9NFqcOpRdPBaKZk3IRGIx7jKSHVG0GBDos8Mgt0j2iEngP5DJzyDYOshOE
         1XGa8BrM/x/MzRFEqLbozFsIW+Lrw7UgIdQ6yzDcLI3L9YWxOvdyTgPntglKK4j9HzfF
         CA2oHE4yQoZe3aSvvgYL59c2aq75yMOItVf83MNSxyJFhgYABT61xEMu+5vYqpsKeCCp
         ZKC9biQfEZBVnbrRvhA2Xk8wygsiiFAIWq1UwrRZA4kU4CqQxD7/jYKBtBd4a/ORqoeA
         9hil92ylhsqR/l/0/d9Gsefrx+6iWk7eP+uJkxum8YmRqczDHCvToE+VIlEOQEqhhrR0
         SPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219212; x=1739824012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3DM8zy+WllPP0TujEXFZ0Ycc0zGrpNRrMRWPkPmGZc=;
        b=DocP+fDFTzWClJ8msJsACNOcRLZyR9wnRH5zqT0lB3m+IG9Cectzu46Rno2HygOVn5
         MacXNLmL7b7AnkftyhFQkMOQRcb637axqwbdqjbXVlC36ZAr+Xt0l96C67hQVHLH1Dxp
         tYToLoljnW2oCsdkZKppolxUfXjA+b6iEPHTKbePrkoRYOsODBAqNAu7dxHtWlitW7A4
         b4u3r6k7ZF8uD+rKc5Pe5oXTQBzG33Bv8gZaVQa7EGRjXh/L32POQgkesqh4gH6xEQwm
         7qeOdr41aJuQMu5h1X+8K+tI3upXLq/mn4uL3ttny7KofvUruoWLi7EhYInIgV4R/EIs
         ck4A==
X-Forwarded-Encrypted: i=1; AJvYcCV6uTMiVMpsblaxMHEv2d2QSgi+7uOpTzpbwWkswoJpHDpTn+AeZfL573LJd5uGMF0TTgrGSFJxbfIQXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUJZyikkDMvjdDrDhEQE1oBvE7tQWd0m5rbqPYjcJcuCB0KrKs
	oSD2KT44YsNVPS3SSXu/ew5NlqgtxJYoKKk5gPmkyZQl9M11UBFsoFc8hSg34Oc=
X-Gm-Gg: ASbGncu8f4o9XrP3Zkcjdl/kSS/SG2OrYHwHuexEHElHFxrKFf6TFElzAJRi8Vc3ncb
	c786fG1to9qER7N2hUNeQGFK1KBgJjIGDnPcnID9jWxVQD0SMOuSjYB5MKEPil+ZTarYu2Fu6YC
	8dJwXTxsDSlhvZz3lcA9K8zR8XY1OaQbO1rBqRWpzZZC5azoadP5oqZC35epSS7PZwFySA5lxLF
	MueA0zDo122rqT3L6VdC681+paJjZhfs9NqyUQm2/0OJ84GzImppf+lopGlDbNgGIC5a8VC6hQT
	wiwT0xZZmYVCXd3K9WC6brsRVw==
X-Google-Smtp-Source: AGHT+IGtT2BfpGC+pxbWvm2Qtn55Phvbe3Ks/NAXxmbZaEXtXhWUE3SuxobC1K+zZICcAG0d87INng==
X-Received: by 2002:a17:903:32cb:b0:21f:dd1:8359 with SMTP id d9443c01a7336-21f4e6d2642mr247925115ad.29.1739219211966;
        Mon, 10 Feb 2025 12:26:51 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:26:51 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:37 -0800
Subject: [PATCH v10 04/27] riscv: zicfiss / zicfilp extension csr and bit
 definitions
MIME-Version: 1.0
Message-Id: <20250210-v5_user_cfi_series-v10-4-163dcfa31c60@rivosinc.com>
References: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
In-Reply-To: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_122652_937294_C50CA6A0 
X-CRM114-Status: GOOD (  10.53  )
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

zicfiss and zicfilp extension gets enabled via b3 and b2 in *envcfg CSR.
menvcfg controls enabling for S/HS mode. henvcfg control enabling for VS
while senvcfg controls enabling for U/VU mode.

zicfilp extension extends *status CSR to hold `expected landing pad` bit.
A trap or interrupt can occur between an indirect jmp/call and target
instr. `expected landing pad` bit from CPU is recorded into xstatus CSR so
that when supervisor performs xret, `expected landing pad` state of CPU can
be restored.

zicfiss adds one new CSR
- CSR_SSP: CSR_SSP contains current shadow stack pointer.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 6fed42e37705..2f49b9663640 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -18,6 +18,15 @@
 #define SR_MPP		_AC(0x00001800, UL) /* Previously Machine */
 #define SR_SUM		_AC(0x00040000, UL) /* Supervisor User Memory Access */
 
+/* zicfilp landing pad status bit */
+#define SR_SPELP	_AC(0x00800000, UL)
+#define SR_MPELP	_AC(0x020000000000, UL)
+#ifdef CONFIG_RISCV_M_MODE
+#define SR_ELP		SR_MPELP
+#else
+#define SR_ELP		SR_SPELP
+#endif
+
 #define SR_FS		_AC(0x00006000, UL) /* Floating-point Status */
 #define SR_FS_OFF	_AC(0x00000000, UL)
 #define SR_FS_INITIAL	_AC(0x00002000, UL)
@@ -212,6 +221,8 @@
 #define ENVCFG_PMM_PMLEN_16		(_AC(0x3, ULL) << 32)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
+#define ENVCFG_LPE			(_AC(1, UL) << 2)
+#define ENVCFG_SSE			(_AC(1, UL) << 3)
 #define ENVCFG_CBIE_SHIFT		4
 #define ENVCFG_CBIE			(_AC(0x3, UL) << ENVCFG_CBIE_SHIFT)
 #define ENVCFG_CBIE_ILL			_AC(0x0, UL)
@@ -230,6 +241,11 @@
 #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
+/*
+ * zicfiss user mode csr
+ * CSR_SSP holds current shadow stack pointer.
+ */
+#define CSR_SSP                 0x011
 
 /* mseccfg bits */
 #define MSECCFG_PMM			ENVCFG_PMM

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
