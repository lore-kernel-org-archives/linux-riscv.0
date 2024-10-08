Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3148ACF042A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 22:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TSeHC7GYWrkpOuLoInKwK6XxMWj3k5cX8Z0FnGMDbYo=; b=uF6pi2GLv/79v3
	H3YSC9JrjCLWaDvxLJbrdTSqlJBWMSFYqIhldC4n69GLsuLlD7zsOgLqrYOZrGr4DhX08NGp9Uchq
	y9MhyLQHuqu4ps4C+U61GgaMMh1xZVtcP++7G7q0KzOpY7wm3CGWsNqyb4xkOm1N1i7582Qzqe/BT
	Ojp1JrCUw4kbygmTpYGWM8NLCe51RjXw0JtLREQ9aK83mRv7+xMNzjbyF9gLh2IIt3Pt0LLKVz2DX
	nvP+A5ZPDMadhXA+9mTM/oX1keMPgCX003QIVJsjWNC5YUJv/nSPa6dEtglpZ+yDA3qrH1aw/bAaS
	MvF0ErOXl6Cn1t2jMY4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syIqF-00000007INy-08Zc;
	Tue, 08 Oct 2024 22:38:07 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIq8-00000007IGz-0Ecd
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 22:38:04 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71dec1cf48fso3808383b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 15:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427078; x=1729031878; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmcYgz7XnLLJto60RpG9fxf/3nbG0BDRV+8az326H18=;
        b=17xPcVqANUBbHXW2R6wnIykZ7T8HetK5pcFUBga7bxqvzKjr+KOHHQOPQMuwy/DhaG
         qmzC2HQ3JNL9yewNrafwjOgpUdNmCs0oE2gv2UjW79io14N3RcjA/hf2LKs6GyEURN7t
         7gSuF5A9nyTrKAxKdgPoOlO0yo+bdHL2kBkVFTRXBBr+r1cRUrv1ckogMPpFo7Drsgx+
         o68GoY5LPDQ/XaFGYVZyGsR5C5oFwnLpipclvg0xmTfxC5ykjcev5RKXgeELjhl36a24
         6YWlOOH1oCUQuAQj9WGg/jATt3/BhZYKqmBG46d9taVxkbpoRoKUB5H9XxKMC2lOXs9A
         Emjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427078; x=1729031878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmcYgz7XnLLJto60RpG9fxf/3nbG0BDRV+8az326H18=;
        b=O07uEjU0nnQSkwEjAX7Bydl4RUD12GtEkskYAMFZVT1uIgo6Xuemyd5jPyporu3KAp
         Cnl1h2PqV9bi5YLAe5O4B8tl0spNGGz93CBTZBJ0q6B4LsDeZwOBlk3Kgm4DqzDWEmbV
         LKivVthaUhV4uNDm+1iqNqEp/zlG2622q/JZ0w30KIEROEZaKL2L7sUSkDmGPKermcR4
         0jMzvio9AxwbVb02v1flPzXABuIr1es6lc3R9rpJ1zgOqs6uCkLXiTkMLZNOBx/M6Owq
         uaWJTHSTN/IyMX0kupXNNif6ZXtpU8h26orC3khGHkR97PtrwyFrgcb2EXpO/Cv9jTWy
         vpGA==
X-Forwarded-Encrypted: i=1; AJvYcCV5PhXlOQ77qRAZphWLogy/rrrjq8ewE5XAGHw7mUnVDowTdjxDDZl+LFj9XuTXXokM3RB1sQ0oDXcRLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YylFmq73UJ0udT/SKg8KSLmk2D/5Vph0bE0KhZE8KUq0hfcwNP5
	mG3GrxeDlax7X5jQxhtfWEeR/SN3Oq4PmvQ9vlacdZGTpnOznAfRMpCqXs1bsak=
X-Google-Smtp-Source: AGHT+IErKskUpIBiFKlwdYnNS9we5iBG5psWxaDz48JOAw5L1P7wN1gzBxCeW201xTOm4LwBlfF9lQ==
X-Received: by 2002:a05:6a00:816:b0:71e:19d0:2988 with SMTP id d2e1a72fcca58-71e1db85912mr671554b3a.14.1728427078379;
        Tue, 08 Oct 2024 15:37:58 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm6591270b3a.45.2024.10.08.15.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:37:58 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 08 Oct 2024 15:36:46 -0700
Subject: [PATCH v6 04/33] riscv: Add support for per-thread envcfg CSR
 values
MIME-Version: 1.0
Message-Id: <20241008-v5_user_cfi_series-v6-4-60d9fe073f37@rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
In-Reply-To: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Andrew Jones <ajones@ventanamicro.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_153800_269888_8C04E715 
X-CRM114-Status: GOOD (  18.68  )
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

From: Samuel Holland <samuel.holland@sifive.com>

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
 arch/riscv/include/asm/processor.h | 1 +
 arch/riscv/include/asm/switch_to.h | 8 ++++++++
 arch/riscv/kernel/cpufeature.c     | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index efa1b3519b23..c1a492508835 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -102,6 +102,7 @@ struct thread_struct {
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
index e560a253e99b..27bafc5dd62d 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -923,7 +923,7 @@ unsigned long riscv_get_elf_hwcap(void)
 void riscv_user_isa_enable(void)
 {
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
-		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
+		current->thread.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
 		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
 }

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
