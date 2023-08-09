Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89729C04FE2
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 01:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lL1a/AIkC9YJPmcTYPnxWgZRb73yG0Uf31G/6G9txrk=; b=hr8/DmWU9x3QHD
	mQ2OU5qcplJOuMyB2oP6LtmF+RaxYc9i9CR16vvb6lRXSak3PuyVBjP6T22o6oor9AQreB5FE0vmO
	1h6Vt0Ab+V7e68M1VV/1BHKGu2F0TXXAg4QyZ2F5VQFaPPghmVdF9Ga3Fkkj+dz5fqZbLX7BlmA6E
	gTDEjH+/HcErXSquDHGxqihAJgij6cV/2rca03wPdN4zMn1D0O92HTGqYtzo3E8rWUkBtuxLWOuoV
	o7Xuc2cx+PpzgkR2+HomdAxXvujP3BCgW9tK02IfzmdEPTwwc9NmpZAyhTUDQdYGnlZ++OAHHTXao
	vJcf4lK5JkwVgV2aoTIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYNv-003q5F-1t;
	Wed, 09 Aug 2023 01:53:15 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYNq-003pzd-3A
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 01:53:13 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bbc06f830aso3346195ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 18:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691545988; x=1692150788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lS9t1IQslP2lZOcFIMMBEvL86hG9xRW12aLXbO27oNk=;
        b=Z+OB3UIxb6UJl4LqG4lOl8uoEklqlYBf9fFwC0SMsGtkHV738p4LE/eBRuGJp3a7UL
         wiCEXG/nMIuiiOQ7dHYWcDcYDiZ0ZcWXZQ1pgmZ/9o7/7EIhMFgNACuq5EWyHaQJ3Z7E
         G6kwf7AbrVK8ofW7juhqT77yDPEbZow9W3sjyhQnYVmRcEDxZmUSGarbtD1I7I3ufInS
         hpDnZmswCg7wHzP7gZzoJ4bbO4uBGnuWGbFO0kEtksOZCBlotH47BAkIcT5zEnw+UIYM
         X6/5ndgr/c496H7frfwd+bRtqm0VeHE4I0TmM4v7PHuRHDwdflAx5jyymiQ36NBcmSnr
         I07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691545988; x=1692150788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lS9t1IQslP2lZOcFIMMBEvL86hG9xRW12aLXbO27oNk=;
        b=IA6Ds05iaQLyMA7SnthBDzCjJuAALkCaNQqShqZIPg8WFErJ3NnEdo+bW+TGA1IT2P
         U1u0qsDTwTu6MOxCjX8jzmWXf+naYnSkNNzGJysm5sJVhvmG+Yavt+lxF6dGKWjQbK8y
         rnswpPFqqtl8+u9LFRVcMCeSen/oReEER7tI7I260VbIHtvRMHxxlFbwbPFq9jLPKq4Z
         H2SJIZMh+em0Yp/9aHrAc30fiFbMML9ERo69Y4Zbgx93YQxK1JTd7I/FnQLP8lFB3yaK
         qoJxzmz4oAssZqDOiSqyqlQbutOZSd0VL+BLbr44YavH3ogznCjYBSPzDPk0Ozcg1cYY
         YpaQ==
X-Gm-Message-State: AOJu0YxLlfE5FbkjfNd4wo3G3W29psHhFl+OvSHujsKG5MZBxEjyC60h
	e+e/XwRHIakCgi/X21ZXxpfvYK+VmcCSYiuvtFQ=
X-Google-Smtp-Source: AGHT+IFhoPRNUuepUsmxYmygopTPVe56v5cNvHLyHa5Ol8fKT1Rsk8P+vvViBz+AASwbOoRW+3rwYA==
X-Received: by 2002:a17:902:d491:b0:1b0:3ab6:5140 with SMTP id c17-20020a170902d49100b001b03ab65140mr1838365plg.4.1691545987885;
        Tue, 08 Aug 2023 18:53:07 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id bj7-20020a170902850700b001b87bedcc6fsm9657591plb.93.2023.08.08.18.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 18:53:07 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: charlie@rivosinc.com,
	conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@rivosinc.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	konstantin@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	mick@ics.forth.gr,
	jrtc27@jrtc27.com,
	rdunlap@infradead.org,
	alexghiti@rivosinc.com
Subject: [PATCH v9 1/4] RISC-V: mm: Restrict address space for sv39,sv48,sv57
Date: Tue,  8 Aug 2023 18:51:07 -0700
Message-Id: <20230809015110.3290774-2-charlie@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230809015110.3290774-1-charlie@rivosinc.com>
References: <20230809015110.3290774-1-charlie@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_185311_029363_A7F28269 
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

Make sv48 the default address space for mmap as some applications
currently depend on this assumption. A hint address passed to mmap will
cause the largest address space that fits entirely into the hint to be
used. If the hint is less than or equal to 1<<38, an sv39 address will
be used. An exception is that if the hint address is 0, then a sv48
address will be used. After an address space is completely full, the next
smallest address space will be used.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/elf.h       |  2 +-
 arch/riscv/include/asm/pgtable.h   | 21 +++++++++++-
 arch/riscv/include/asm/processor.h | 52 ++++++++++++++++++++++++++----
 3 files changed, 67 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index c24280774caf..5d3368d5585c 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -49,7 +49,7 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
  * the loader.  We need to make sure that it is out of the way of the program
  * that it will "exec", and that there is sufficient room for the brk.
  */
-#define ELF_ET_DYN_BASE		((TASK_SIZE / 3) * 2)
+#define ELF_ET_DYN_BASE		((DEFAULT_MAP_WINDOW / 3) * 2)
 
 #ifdef CONFIG_64BIT
 #ifdef CONFIG_COMPAT
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 75970ee2bda2..2611c1324a7c 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -63,8 +63,27 @@
  * position vmemmap directly below the VMALLOC region.
  */
 #ifdef CONFIG_64BIT
+#define VA_BITS_SV32 32
+#define VA_BITS_SV39 39
+#define VA_BITS_SV48 48
+#define VA_BITS_SV57 57
+
+#define VA_USER_SV39 (UL(1) << (VA_BITS_SV39 - 1))
+#define VA_USER_SV48 (UL(1) << (VA_BITS_SV48 - 1))
+#define VA_USER_SV57 (UL(1) << (VA_BITS_SV57 - 1))
+
 #define VA_BITS		(pgtable_l5_enabled ? \
-				57 : (pgtable_l4_enabled ? 48 : 39))
+				VA_BITS_SV57 : (pgtable_l4_enabled ? VA_BITS_SV48 : VA_BITS_SV39))
+
+#ifdef CONFIG_COMPAT
+#define MMAP_VA_BITS_64 ((VA_BITS >= VA_BITS_SV48) ? VA_BITS_SV48 : VA_BITS)
+#define MMAP_MIN_VA_BITS_64 (VA_BITS_SV39)
+#define MMAP_VA_BITS (is_compat_task() ? VA_BITS_SV32 : MMAP_VA_BITS_64)
+#define MMAP_MIN_VA_BITS (is_compat_task() ? VA_BITS_SV32 : MMAP_MIN_VA_BITS_64)
+#else
+#define MMAP_VA_BITS ((VA_BITS >= VA_BITS_SV48) ? VA_BITS_SV48 : VA_BITS)
+#define MMAP_MIN_VA_BITS (VA_BITS_SV39)
+#endif
 #else
 #define VA_BITS		32
 #endif
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index c950a8d9edef..3e23e1786d05 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -13,19 +13,59 @@
 
 #include <asm/ptrace.h>
 
+#ifdef CONFIG_64BIT
+#define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
+#define STACK_TOP_MAX		TASK_SIZE_64
+
+#define arch_get_mmap_end(addr, len, flags)			\
+({								\
+	unsigned long mmap_end;					\
+	typeof(addr) _addr = (addr);				\
+	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
+		mmap_end = STACK_TOP_MAX;			\
+	else if ((_addr) >= VA_USER_SV57)			\
+		mmap_end = STACK_TOP_MAX;			\
+	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
+		mmap_end = VA_USER_SV48;			\
+	else							\
+		mmap_end = VA_USER_SV39;			\
+	mmap_end;						\
+})
+
+#define arch_get_mmap_base(addr, base)				\
+({								\
+	unsigned long mmap_base;				\
+	typeof(addr) _addr = (addr);				\
+	typeof(base) _base = (base);				\
+	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);	\
+	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
+		mmap_base = (_base);				\
+	else if (((_addr) >= VA_USER_SV57) && (VA_BITS >= VA_BITS_SV57)) \
+		mmap_base = VA_USER_SV57 - rnd_gap;		\
+	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
+		mmap_base = VA_USER_SV48 - rnd_gap;		\
+	else							\
+		mmap_base = VA_USER_SV39 - rnd_gap;		\
+	mmap_base;						\
+})
+
+#else
+#define DEFAULT_MAP_WINDOW	TASK_SIZE
+#define STACK_TOP_MAX		TASK_SIZE
+#endif
+#define STACK_ALIGN		16
+
+#define STACK_TOP		DEFAULT_MAP_WINDOW
+
 /*
  * This decides where the kernel will search for a free chunk of vm
  * space during mmap's.
  */
-#define TASK_UNMAPPED_BASE	PAGE_ALIGN(TASK_SIZE / 3)
-
-#define STACK_TOP		TASK_SIZE
 #ifdef CONFIG_64BIT
-#define STACK_TOP_MAX		TASK_SIZE_64
+#define TASK_UNMAPPED_BASE	PAGE_ALIGN((UL(1) << MMAP_MIN_VA_BITS) / 3)
 #else
-#define STACK_TOP_MAX		TASK_SIZE
+#define TASK_UNMAPPED_BASE	PAGE_ALIGN(TASK_SIZE / 3)
 #endif
-#define STACK_ALIGN		16
 
 #ifndef __ASSEMBLY__
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
