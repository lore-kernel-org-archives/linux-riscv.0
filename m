Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA02CEACE6
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 16:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMwrS7YsPTQWgpKxFzkmU4uVdlkOLELJsC3cRRRFrHI=; b=GcPrfEB4EeJRiy
	fccMR+cCD8FJR3ikPdZFApKhaQACKovOJt8SFS9TMz5Se42LfWK3ynXklzRkn12CMX24lHqFTfCcu
	pXMIRzopxUJwCMUioEj22spWwqmM9aWuNdmFhul7lYdQo/J6v4WhvF9EL8NwC5SClWFge8l4JP5fn
	SB5Gnwc6gxcfQef4uhVEHkGbBmKysAeyQEoMyBVWWa9MI3QO9WI14ky37UduFwiRDH6tu+UNI8iMh
	WbG44bqoxY/pQiuvMEHT9g2XDpfTs4IrPrwEiwP7rLnCRFrzMNc/XKWCYKdV6WjWtxHpZBFzCCUY/
	9XkRsyOaHAUaItEFtg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svfbY-00000003VNR-03A1;
	Tue, 01 Oct 2024 16:20:04 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfP5-00000003Qsh-0l8d
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 16:07:12 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20b95359440so19011875ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 09:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798830; x=1728403630; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VSJycIfYc39uVmA0S5cW1xf7lSeeHj3Up0tXaB++17w=;
        b=xet8qYH6mrR3UkHvbmYy6kjTHrjKcLex11XeuSaEofscOx+bnp1b20QzCnH+HOac/z
         1qKxue7GbvWJU5H69xb3DEHZgGNKvV99y3deMJTap0MosUpVkWn5Exx0nxTCfYkVd3tu
         9JShqI9zt2CUH3r69pj0IOqDmNTx6JQAagKr5ANiOtTE81bGkc0QMyPh8ZGXmFtWDipE
         wr1fXom4WliRM6IeVYBZA6KfRubeENJS8lXbmmZsiaRY+qq5x476vmJAuqnsfAQKfZMg
         bGJ63NWgvsEnawMLI8dQQCJ8O/HBeh5jJ1OR/xVa7xEE7zjZ7UIep2/25chIQfTXKA/W
         idmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798830; x=1728403630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VSJycIfYc39uVmA0S5cW1xf7lSeeHj3Up0tXaB++17w=;
        b=WrTkRUlVALEpQ06X1EQPL5IPlKKu5G/w2ucNVNmvk3DsfURNOdKE9SQtNC3y4/blV4
         Fjsfo/uZyA+dv2D8YK3McitRRB9djEHBSr0aOJ4qu5pzccGcKWCL0b434Fb71/65rPXL
         ytTHkYewo3PIQ9qOvaBjpJSKzxgnok7by57vU63VxpgzEtRyxfb3gv2sR3j6vZSHGrTi
         u/FWeiOUt0jnhhWwYyNNchQgt8LU50XmeH5Nt2VZ036+s+CchtmlnG1smfRRtnCQFLLq
         frCEY5dK21QIR+lTh8/6QgsscnD2ZNT8xXBIgOUlYWWZGH5C0fLKxWs/0oX/JA/UDKUq
         jXUA==
X-Forwarded-Encrypted: i=1; AJvYcCX+0LoJMmGj5nRju8C4ZaXGmSicybxgffcClO+vQnP5OGjSG19mEFB05THskzDx5qPRI9RNY7iAB9PkUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvscFc1MA490XVnGGDo1NwTfWTwWhXdUzWlKbKp/H0nHAFa3wJ
	tGRTBcvpbotecuaGr/mYFN0xEo+CY9QMrbaHIozfXixvak4S/LbKftAbYTmxsbY=
X-Google-Smtp-Source: AGHT+IGbxpnW+Ks2YnlHYSaDv2y1WnPDZfQCABjl0RJSI6vizw9vnR0BiVry5CQxYrybXmS518wotA==
X-Received: by 2002:a17:90b:1bc4:b0:2e0:a77e:8305 with SMTP id 98e67ed59e1d1-2e18496a8c7mr191491a91.39.1727798829693;
        Tue, 01 Oct 2024 09:07:09 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:07:09 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:09 -0700
Subject: [PATCH 04/33] riscv: Add support for per-thread envcfg CSR values
MIME-Version: 1.0
Message-Id: <20241001-v5_user_cfi_series-v1-4-3ba65b6e550f@rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
In-Reply-To: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241001_090711_290070_2051CA86 
X-CRM114-Status: GOOD (  18.69  )
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
 arch/riscv/include/asm/switch_to.h   | 8 ++++++++
 arch/riscv/include/asm/thread_info.h | 1 +
 arch/riscv/kernel/cpufeature.c       | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 7594df37cc9f..dd4a36ff4356 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -70,6 +70,13 @@ static __always_inline bool has_fpu(void) { return false; }
 #define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif
 
+static inline void __switch_to_envcfg(struct task_struct *next)
+{
+	asm volatile (ALTERNATIVE("nop", "csrw " __stringify(CSR_ENVCFG) ", %0",
+				  0, RISCV_ISA_EXT_XLINUXENVCFG, 1)
+			:: "r" (next->thread_info.envcfg) : "memory");
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
 
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index ebe52f96da34..e494871071da 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -57,6 +57,7 @@ struct thread_info {
 	long			user_sp;	/* User stack pointer */
 	int			cpu;
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
+	unsigned long envcfg;
 #ifdef CONFIG_SHADOW_CALL_STACK
 	void			*scs_base;
 	void			*scs_sp;
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index e560a253e99b..c0986291696a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -923,7 +923,7 @@ unsigned long riscv_get_elf_hwcap(void)
 void riscv_user_isa_enable(void)
 {
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
-		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
+		current->thread_info.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
 		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
 }

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
