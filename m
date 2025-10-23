Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D075CCD1BF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 13:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pX9U0onxIUOReY06kdtEWG8FMGLqLXZzNxzZivA4kAM=; b=hBZCJWfnMui7kh
	q4snmk6mtGkBPS0I+eWwSeOqM5mfIuhF4u42cedcwNvgztmENaH9i0Qz9YdW/GUHU7k5bpohr7Erh
	+Ra3aL8dd5L/8ylJkS+FBXeaTY9i+zDGkTdIezsPlX/jnaF9Oe4m12BKyiLkbo6Dd1QQ1PGPYZalV
	cLnrL802qCuRBFlxA00HvCrWJ/yYDfEtKnPahxjsTA8rf2JQ4iGemcW78yHg1hlMqV+2+V/KN1x3A
	+85oUM06NWMF9noDWM2HRgWmjZ/qMsrQK7SZbyo2sPGWvN3dBq2KSVmnMIjxeEwTXipYrqHHq2xrW
	u92jbjjsyRxSWzK1jvEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvK6-00000006MsS-22yW;
	Thu, 23 Oct 2025 13:25:46 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvK4-00000006MpZ-0oSu
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 13:25:45 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b608df6d2a0so694679a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1761225943; x=1761830743; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njWxpRWfJB7aZ6YZP/EJ8dyU7DPEUOfUxx+ytpaopVc=;
        b=OdA8+0LvCebWEI/EsaxSiUTHRUlCbEoJ1Wpe629iYu+BTXp6gMbVoLh3EB2Sx147FD
         b6wTFUPLaUbtExmbmx2mauyoEhVwx0lq2Ylhlqj+HD1qb3Ui/OnGQPmNnCQSH7a7vBU9
         Wd9sgYgr3fqXFOXsX7KTAfODtfmw2scWzeOhP22ZRnEhgZiXSlI2b+aPm0hQVT0wc0CE
         LVV5ctwcyI+IwAvWbgCasuE/b3kJtxDXfUs8JNExXDMoaPbMOVGnjmzqF1aybvNUsMpw
         PULUntZUrwr0+fe8moHfSVxO5+TObITLRUTliGq7/IDePeWAjYWIhe/OBw9s0GE096Ko
         Kx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761225943; x=1761830743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=njWxpRWfJB7aZ6YZP/EJ8dyU7DPEUOfUxx+ytpaopVc=;
        b=DcGmLWQmPOwj4U/Ts+vqLIubolHoNp02tqG18SoId092xKWv5g5qLdbsqIMcnWhk38
         FW0guok6ZyRiG4acLdO74pubeDZPK+9cveeuQ2agN0xGkbOSHxgKsfReD2y5QhG9jPai
         E67TYvuDMxomJJ2hQeBrvR7znjo13qqBIAfy2Fpue7PHDnVcqS43XNgHz35fVwwHWjfY
         4dd28xjLIb8rgERC9V9HpsFb8PStjnu8/aiZWaD3EuLHPX9JdhfKKGDJvK52GEd636Fp
         ikRsjUShVl93aOMRM2kG3BY/AxAJaglFm8DxLIraoSomLJ/cKCO1pbZMz77WVJ5SN5Pj
         BzGA==
X-Forwarded-Encrypted: i=1; AJvYcCWhjMdP8oUJj/u2EkPaAQOQdD6MyZIZYVd5ZDUMADsZVTDv+RMf2tn0+JVTJruAlbGSPlNYO3wnmj3uow==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWqzAwzABFozqlzyulHrrFhcIP2WADSMtPo29UA9LMkREYlEF5
	JPQyRr/hcc2v4xtZSMG/FS4ZTWChAFTU5dQTS3/JFLV7+FiAFYGcyjimFdhLiDzAmmI=
X-Gm-Gg: ASbGncuw4K75ICcF2QcE7x27+grqR/3mA+pGQbJi7ICLHschvTt3OgdUFOiRPUuAd0Z
	HNv/GfpFOeZtU1Vc8vUNj5tu3Z7jrF886lRFxb7ElSyG4dfU0Jm4V0A5oE/KxRswqXpmvpU/Xoa
	n/F4TDnlRYYPB39l6fDi56f2SRD7cJCGXNGmwJKjC3rGusdXbiqy6h6JEqRzDKhqQPhA7TD+U25
	UQrgTvz5lsvWKPtxEdDpE6FyDgSostU8eKsIqeAtqzybTziMKqc8SPZpngCawCyGEtYDNvxQThf
	GEcB2FYbwtRgUIGvo3g/x77zaaYvuv5KjfJPgI2UE/e/pk6BumgR5OAQlpErjCIe1v0EHobS+no
	it8nmx3wE3WJSm8NAuHDrEmgVn9BS9CbSg3IzaL7r8kCMRDUBJFFt6crPPoax4rpamYSRxA2hHC
	QU3qdBsEuaCQ==
X-Google-Smtp-Source: AGHT+IFvP4Q1thZhdrlkQ+O5ai3McG5WbONbV5748++FuQG+JO3GJT99MXV1Kz1R345XNoIb4pOrLQ==
X-Received: by 2002:a17:902:f691:b0:290:a32b:909b with SMTP id d9443c01a7336-290cbb49987mr324468245ad.44.1761225943304;
        Thu, 23 Oct 2025 06:25:43 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e23e4b3sm23432035ad.103.2025.10.23.06.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:25:42 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 23 Oct 2025 06:25:32 -0700
Subject: [PATCH v22 03/28] riscv: zicfiss / zicfilp enumeration
MIME-Version: 1.0
Message-Id: <20251023-v5_user_cfi_series-v22-3-1d53ce35d8fd@rivosinc.com>
References: <20251023-v5_user_cfi_series-v22-0-1d53ce35d8fd@rivosinc.com>
In-Reply-To: <20251023-v5_user_cfi_series-v22-0-1d53ce35d8fd@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_062544_264922_C34B90EA 
X-CRM114-Status: GOOD (  15.01  )
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

This patch adds support for detecting zicfiss and zicfilp. zicfiss and
zicfilp stands for unprivleged integer spec extension for shadow stack
and branch tracking on indirect branches, respectively.

This patch looks for zicfiss and zicfilp in device tree and accordinlgy
lights up bit in cpu feature bitmap. Furthermore this patch adds detection
utility functions to return whether shadow stack or landing pads are
supported by cpu.

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h | 12 ++++++++++++
 arch/riscv/include/asm/hwcap.h      |  2 ++
 arch/riscv/kernel/cpufeature.c      | 22 ++++++++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index fbd0e4306c93..481f483ebf15 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -150,4 +150,16 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
+static inline bool cpu_supports_shadow_stack(void)
+{
+	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
+		riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS));
+}
+
+static inline bool cpu_supports_indirect_br_lp_instr(void)
+{
+	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
+		riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFILP));
+}
+
 #endif
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index affd63e11b0a..7c4619a6d70d 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -106,6 +106,8 @@
 #define RISCV_ISA_EXT_ZAAMO		97
 #define RISCV_ISA_EXT_ZALRSC		98
 #define RISCV_ISA_EXT_ZICBOP		99
+#define RISCV_ISA_EXT_ZICFILP		100
+#define RISCV_ISA_EXT_ZICFISS		101
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 67b59699357d..5a1a194e1180 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -274,6 +274,24 @@ static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_cfilp_validate(const struct riscv_isa_ext_data *data,
+			      const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_USER_CFI))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int riscv_cfiss_validate(const struct riscv_isa_ext_data *data,
+			      const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_USER_CFI))
+		return -EINVAL;
+
+	return 0;
+}
+
 static const unsigned int riscv_a_exts[] = {
 	RISCV_ISA_EXT_ZAAMO,
 	RISCV_ISA_EXT_ZALRSC,
@@ -461,6 +479,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
+					  riscv_cfilp_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfiss, RISCV_ISA_EXT_ZICFISS, riscv_xlinuxenvcfg_exts,
+					  riscv_cfiss_validate),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
