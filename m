Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58817C83F28
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 20:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c7soMP+G44zDDFyu0/v8mwV0KhHBOymYzCwf6oAk2y8=; b=EyTA19wAGScZqE
	RHU2t3yr16XHEv5A9tuJNajq/j7vsFGb8SEEsJYPVo80tnH+ZrMsreiOHuMe3ef6wtyQmvWIq3Yxd
	jDFd7r31FA1L3TzlUYOMPJ6zPry0MUVSlNvShKp7cELvCQaD+/MxWKuqrMieGqv8SQSb9rQN//VTk
	yzaKWDStkVmBe2ywS+PWbztDFLlZuTr8VRpA8wfVOW9BpX9cqlJeSw+SW4cOC+moZu2DRElCpUBjY
	VewejcoC/R6QCb9uuMWFN4eJcd4xW4NvS0iYa8jzx2STZgpdcpeGiKWucXvKxf5bbJF6NhWJIoyMn
	3yQLkjL8fFr2ZKe3XySQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKeN-0000000FoPr-209a;
	Fri, 11 Jul 2025 20:47:19 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJhP-0000000Fg57-33At
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 19:46:25 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7490acf57b9so1920597b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 12:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752263183; x=1752867983; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/zH7pR/lYDXTCsVz0jr8PjmlJlgvFu5fq+fqB2fhJ8=;
        b=FvxoqLNFXRN45B4G8eMLR/oZNzIcj/xslTrfP535CIxakUed9Z7fY/VqK/5DIB8UkJ
         Y8OUTay65Eh++64WndWxOw6Py1vbp4kxhZd+b2TWJdmal5x7RJYcuPOrPGDlD7oynsep
         viWdsImwzNbo5WMdDiZHitAVFvI5uCKGuxbhop0r3ns+5vmmwurTetAcNYiTgvubvNAI
         z9rnXk39aQJ8E4T9ev7LUs2Z8yGKIAO6om9jXbVxZPrxQEpTGtD/S9uJb6+34IbQ8iqt
         3SmagDYeYRZligGPD9SJnBfH8z2X0oKRP2TL4T8pJxkpEmB8zwKl9naPK6qSfS4whMhi
         o31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752263183; x=1752867983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/zH7pR/lYDXTCsVz0jr8PjmlJlgvFu5fq+fqB2fhJ8=;
        b=g3Zi6jySwOyKlSxMT95CS6YGkzoAGqjcDXGT0XExfRDISFPk01MaI67lrTDgesqrN3
         pDW2V2cCIEw5Q8s+V8SMlYi+AE22JvBvIyA4SVoE8eiDTffcids80RR3niW6hP46K0yE
         Yy69dkGM/td2MMIy3I+N/AxqdWppLYOeC4b8S+65xQULqJ6z8xT+t2qGD5hMKEgSJuXs
         j1imftInngMEhTvN3MTNCPAaTvjJ6LLimDmFYc11SPcw/95S6xslT+JSpLbW/Wqu4NZX
         s7k+qZXzWh263N0UYcM/luBujodjnfNVLZ0dC8PYTGvStuF5Es+f8fAZUUf5VwHZFDRh
         wTCg==
X-Forwarded-Encrypted: i=1; AJvYcCWtVzXjkcFJ/OEWQnaXprKeMKkI08x85RBBwPyHxk3+8MiIvJlpgG7LjoR2kg6e7w7m1+6zfXQrHRbX+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKO3sRqkAUu0Aq3VHJiNN8cjC45Hkl0t1rrKRQTqwhzc7NgVJj
	U5wqioX8+h38q7LYWYOsnZdagcYaConvDrj3t3weYrlWl1eZDG8dVi+LXSfMdJYVsvE=
X-Gm-Gg: ASbGnctz1bmvPyJcA1K4DmCP/XTeHCNTbCVylAPa2U4/RlZ9hh4MkMgfPiVimGf+BWz
	P7TAmz35i3w6uDkUMNYRjnwg5Zfc+lSQ8+EQKmcW6KZxmK1XiOsbqA+JYXIS7ACcjfxDVrO5HkI
	ZkdZ0Jv3s4UWYS9iD+417IupqZuGgf75JkIlJdWojwZGAZuon+JFgmsraYNJaVkvIkyWhf9K8TF
	kJM3upfd2jDmOFwGI1wnKIV8Nh/0G2fgHJEOXD9YHeaJZnQtmaNUqdCi+V687Xna6FerfJ+DkMW
	jTyta53svT7Og1yoj3eX9hAsGBN1azKqsUnLSNlVP1yrvyYEMgk74mxg1tikL4YZ+4Cecl+NJzb
	Pk1QRqEXWTb2ta0Y/AMFxrCFSc8UnxZm3
X-Google-Smtp-Source: AGHT+IFyimWgTP5VaqUhTlIlPAVe2LYBX0T5vTTsCW0gESMJyXnfxn+vG6S6gJBxf49Htp5zG0wCCw==
X-Received: by 2002:a05:6a20:9f4d:b0:220:9e54:d5cc with SMTP id adf61e73a8af0-23120a0397bmr8606330637.31.1752263183164;
        Fri, 11 Jul 2025 12:46:23 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06995sm5840977b3a.38.2025.07.11.12.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 12:46:22 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 11 Jul 2025 12:46:08 -0700
Subject: [PATCH v18 03/27] riscv: zicfiss / zicfilp enumeration
MIME-Version: 1.0
Message-Id: <20250711-v5_user_cfi_series-v18-3-a8ee62f9f38e@rivosinc.com>
References: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
In-Reply-To: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250711_124623_807967_8858DA40 
X-CRM114-Status: GOOD (  15.31  )
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
index 9430dc198caa..c5c01efba3e7 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -156,4 +156,16 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
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
index 743d53415572..d38136672650 100644
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
