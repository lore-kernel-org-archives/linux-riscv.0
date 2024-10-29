Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB110D7494D
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 23:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzcpnI6J6mfrBicW6MSnr8G6saFrW7b5RminUtOdt/w=; b=4ROzLZ9jxRjM0g
	2fFKsasmKuEV6doB1iiGfENgT35ravaUMtuic+3l6bgLaktWB+0Mumup5yh41GVReASNQpyUjGxWb
	YL7JkSgJ2c8RU4VhxFqrObsCkkY5VRghyaN9jNI6GpaVINSSgQN0uMBBAw3a7PYwgqcwhwWB2jVi8
	GZ2/bQLZOYRYzS6PT9X0+IzBUnUuc5YLX5c0WKIsi5mt4CYbMeUOMLiwp8JFi6VKudFAhG3s++SgT
	pMuYOo2Uan5NaW+TZUlhjXO8uEdMafxhYxsxIvOo5JMXqoeYZdLABxj3tri47pOBRwEKeDTHrJj49
	+s97UMKKq0z+zmu2erxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vt9-0000000GDSq-0I6s;
	Tue, 29 Oct 2024 23:44:39 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vsx-0000000GDHC-0R7U
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 23:44:28 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7ea7ad1e01fso279375a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 16:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245466; x=1730850266; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCKzg74NjcYHO/B30bowh1owAHwLHbAhOOOeEQpeDk4=;
        b=HJFjzwYEjOkwG1EsnHhX4OH0B8qMnJ5Q5BBlvQujDAUpog2hzYsa3oz8jiyG7AQC/w
         8INFqFH/Xp+CjQmxjrhwklMv4iLeV36gJzPmDCQPLaChTTwU53UAdWdhdNNLGqodqpoV
         ihqQWLvNoi+ZCEl7r5kb4OEbU7JShLOOpeYP/ltu4OtA8rvyjtOvFjobacmvC564YKA4
         KdVuPMPEmpNLmbYifaIU869L2yRUjeY1xsA4GbRUTnrrhjNB6mfhtKspUIOnI2k58vy1
         W7sPa96dqdOzSo1niZ7pyN1zMWi6xGfnXSi6b7TL+Zg/tJEStPqduqZ1cMi9g+v04UGv
         /8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245466; x=1730850266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCKzg74NjcYHO/B30bowh1owAHwLHbAhOOOeEQpeDk4=;
        b=l1ZwQ2SfouOwDR0IHvZP3iZmlYRlXRgKzqKwjyNmxyAkGOO4it51WXQpZ4ULDjMkFf
         1dpzdl/cN0prTiFomfFSfvaE+Ca5AQRhDbiORrs8KMMsndWKRyLo8OAwhcaQXkLf2ePd
         +8wk3j2Nzybxzj80a7MRWrwJlQdl1dSQBbkwfR1vmqOjY+xwgCmXgbqCwAxj+ivlwBAb
         A7xvp2dtPjz4qp2kIz9kO53Dkex3DoMEw3DJuubIACkGE9Ab0lsSeJJgzNqecOE7+wRX
         lBfUY1jZ1d3zHNp1M6xBnQdOyYu/+E2cVdx4GKjPBBXQg/Fw+VVvzxeFCw5F8zguCaXK
         EVYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnMS82ANp3pMP1C4K2TJWhH//2nzl9uAK0D5oaGeKJrvTDTu+oCwFyJ4l37DreEqo+8jr7RInFXsZ3qA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2noFVFtdlGZhNaSRl5TWFCqzI0nMVxLmY5GhxdpmSyeyF0POW
	1iQ70xnUM0SfkebGBiofGtjUt6YCQeqcvrv27EqtcztGQ8tt76DnqERz2cGnSXo=
X-Google-Smtp-Source: AGHT+IHJh+1ZXsYwxslZQeQFaVaIosIBJ9byAeINs1Cby21LH+tx3YEEJESgsOz7GEIKZ2P3AAXg4A==
X-Received: by 2002:a05:6a21:99a0:b0:1d4:f7b7:f20 with SMTP id adf61e73a8af0-1db7ff5e5e7mr749841637.21.1730245465983;
        Tue, 29 Oct 2024 16:44:25 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:44:25 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:04 -0700
Subject: [PATCH v7 04/32] riscv: Add support for per-thread envcfg CSR
 values
MIME-Version: 1.0
Message-Id: <20241029-v5_user_cfi_series-v7-4-2727ce9936cb@rivosinc.com>
References: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
In-Reply-To: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
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
 rick.p.edgecombe@intel.com, Samuel Holland <samuel.holland@sifive.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_164427_199098_1F6EB8F0 
X-CRM114-Status: GOOD (  18.66  )
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
