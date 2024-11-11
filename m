Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5843D3ABF4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 21:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iH02BX1409UoapaLbKov2zEa2ZOB5I/ecyQFcqHzoM4=; b=aUNdSWjhqQhgZj
	GSHEiRIyueCFGOuzekYHB3fB+ULcZ6emnY0zmwfiGlMlchUuJGMprQ7E0TJYBT62bUiXRvHTw8JzV
	pj81T7SeT0WTYKA+F4ftC4Z1k6MRpUz4sZ1jaU9Lrvwlo+jpStzANy8L20s9aCe6653WUxxWux1yr
	XkGWoF5STiWf3LoONqo51Q9eJ5MLfZp1s8tiR+wXS+wfpe9wr9DPkIhYO1UYLbTirnpZzshxPfcmH
	N1R4hg+5Out6C42+hnFqJQUk1gHE5tclzqyT6PU1HaZgcTgsN6GnZLWGXRJ8y28R8qhIiAWqIrj2A
	r7ql3AxA4fc+grwMK+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbbm-00000001IrU-3ez0;
	Mon, 11 Nov 2024 21:06:02 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbQ5-00000001Fdv-1jTS
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 20:53:59 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20cb47387ceso50804375ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Nov 2024 12:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731358437; x=1731963237; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ziaktb89WDbwUZ535GFbmTELWOQHyNOPVHZfKRHAH5o=;
        b=deBFEawZqO2gObzaf3Iwss3b1OXo7f2fk2N44jFovfF0uRZpKtl0wxUtwRu67PUCf9
         3SeMfz780dwGpkjHWJMnaLW19U7E+G0eOpKfXiwJJ4vnYUP9+zlLe6Wt3HMx4zYRpo3J
         MeOhDf2ZapjAs0dKWoWHWlTycivzuPbqf4rr1URd1gDdiZ209WIiuyUEcTP9xZwCUrmw
         nUFktNEBvs8W2zbB3/PjQvIMhXBRROtMCKDvIOFzG16KOZMfCS6uIuxIy/gv988wvc9J
         xuifiHaD0Ftfo81AUaYnZp/dNkpi3vmP1aLvSoc2+xI4NnrrAp6Y5QnX3O/bbGrbhy6s
         TuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731358437; x=1731963237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ziaktb89WDbwUZ535GFbmTELWOQHyNOPVHZfKRHAH5o=;
        b=dujCl/+f8R9c659kuv4F1NttP2Jmz6lW/HqM5Fw9ww2pk1g/m5bxGiAb1FBujtlmAp
         RhhOsXvw75a3ItxcL+WQlWqZOuHNtGwCl+J5RzzqM0aGtmjZ2h0BjY4MfY+TUkpKqmlK
         FMqMJGDQuSwMs54ywhHUjWwmc+WElYENxW+Sgafj4dOK0YKO8UU3OvpSAvRicxmVzmSe
         RVpiQ+i/m7GaN7RmAG0VA65ZCDoo3xryBs4NSKr1HXDD0zmbXOnk1Hx/UigRzSyLeFE0
         IHhQAUWgsLgXEvFaFcCujRSDzxpSMxnS3v8NzxSmc9r2YZvrSHbywK8W8s5KJnC0zpVx
         locg==
X-Forwarded-Encrypted: i=1; AJvYcCU8W37fidB+ubyQl9RgfP3QZMyNiMiGhljtXaYAxt5NpbNRy5JouXihIver2164/dj5IA0MO1q4Xu6Frw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQEPXET+meXR01pFmZlBwwotK1gFh6r3DY5NGiA2Pi0d6i6lx9
	WPp/s661REWxcF3F0YxQ4LbSqmxgsH861TMhGdGuAeDiy+EpEXunMw5V0qoTzqs=
X-Google-Smtp-Source: AGHT+IEyGabgVA75UQcsueBpJ7RpOtRzKc95ETC4lvjZRAohKnXlL6Ozkv/pWiQeL+cJUAE6GKxHGg==
X-Received: by 2002:a17:902:db0b:b0:20b:5b16:b16b with SMTP id d9443c01a7336-2118359cb22mr204360415ad.36.1731358436616;
        Mon, 11 Nov 2024 12:53:56 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd1534sm9059974a91.42.2024.11.11.12.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 12:53:56 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 11 Nov 2024 12:53:46 -0800
Subject: [PATCH v8 01/29] mm: Introduce ARCH_HAS_USER_SHADOW_STACK
MIME-Version: 1.0
Message-Id: <20241111-v5_user_cfi_series-v8-1-dce14aa30207@rivosinc.com>
References: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
In-Reply-To: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
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
 rick.p.edgecombe@intel.com, David Hildenbrand <david@redhat.com>, 
 Deepak Gupta <debug@rivosinc.com>, 
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_125357_507673_5C67459F 
X-CRM114-Status: GOOD (  14.57  )
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

From: Mark Brown <broonie@kernel.org>

Since multiple architectures have support for shadow stacks and we need to
select support for this feature in several places in the generic code
provide a generic config option that the architectures can select.

Suggested-by: David Hildenbrand <david@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
---
 arch/x86/Kconfig   | 1 +
 fs/proc/task_mmu.c | 2 +-
 include/linux/mm.h | 2 +-
 mm/Kconfig         | 6 ++++++
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 16354dfa6d96..fe6e9ece64b9 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1954,6 +1954,7 @@ config X86_USER_SHADOW_STACK
 	depends on AS_WRUSS
 	depends on X86_64
 	select ARCH_USES_HIGH_VMA_FLAGS
+	select ARCH_HAS_USER_SHADOW_STACK
 	select X86_CET
 	help
 	  Shadow stack protection is a hardware feature that detects function
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index e52bd96137a6..f57ea9b308bb 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -978,7 +978,7 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
 		[ilog2(VM_UFFD_MINOR)]	= "ui",
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
-#ifdef CONFIG_X86_USER_SHADOW_STACK
+#ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
 		[ilog2(VM_SHADOW_STACK)] = "ss",
 #endif
 #if defined(CONFIG_64BIT) || defined(CONFIG_PPC32)
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 61fff5d34ed5..2291c02c74d2 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -354,7 +354,7 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 #endif /* CONFIG_ARCH_HAS_PKEYS */
 
-#ifdef CONFIG_X86_USER_SHADOW_STACK
+#ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
 /*
  * VM_SHADOW_STACK should not be set with VM_SHARED because of lack of
  * support core mm.
diff --git a/mm/Kconfig b/mm/Kconfig
index 4c9f5ea13271..4b2a1ef9a161 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1296,6 +1296,12 @@ config NUMA_EMU
 	  into virtual nodes when booted with "numa=fake=N", where N is the
 	  number of nodes. This is only useful for debugging.
 
+config ARCH_HAS_USER_SHADOW_STACK
+	bool
+	help
+	  The architecture has hardware support for userspace shadow call
+          stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
+
 source "mm/damon/Kconfig"
 
 endmenu

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
