Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2995CC001B0
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 16:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IR8QF9NakA6JGRIHNDe2CSDJn5PSYZzlsvxi7adsemQ=; b=XaTBVc7nmu+5Z1
	KZUXvj7mUsEv1W1SXoDlRV8lmo2qpKQB01dPCj69d7dctOQ99/tmxZYiUDdz573idvwhoR/rQqNqy
	+CLKQwniY/XbM8KbIAWAc9yxpApY66oeD6zRsUax5gQli9VYoRWdptCBopKMdp8dTS2akKf31P97j
	ybGS7kh+j28LClY2d4AP3OSGn/a4/vV5hLtSI/NRnycP/XXJ8YSubeHqvW0j0OtglUiNRV3Ce+gfd
	f0ufmTDi09bAkH7Cl85VNk0KTHHaZhN5lXw5Nx7GpJ6ZK9wIp5TZu9WSKyomtIGUAJMHsiYXHeAT2
	QfLPHLakH/0udSPPVWEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKM5M-006hYq-32;
	Fri, 14 Jul 2023 16:56:04 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKM5J-006hT8-0e
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 16:56:03 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b8b318c5cfso16125905ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 09:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689353756; x=1689958556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPykY2M+iBxgnfF3tLWI+OoGLznOreuMykVpzGzQM9M=;
        b=azZgM6AeXJmCDZjMcCvpOfGXYgGHNCAAPxNXV/uspW22hdXFA8MPuhazigJp0SbCJS
         8tx99+fKEiCI1J31eTc92ZC6uoPPCBIEWn85byNxcOtC1TFjaiCPLzerJL2mujp5NPfe
         tcQkn3YgmIUEukMMAzAC+lS3FOWn7t2WGAWBaQbDxJ7F45liY/U120jgK6dSI82+FFGs
         cKJ+9Jrz+roxSXvXdpvhnZk6b+RrV4+d7dKzXAd2+9hgjhFiAUVDWsWNow2J0tlknkrp
         iXnusxEZA6uchq9Zw64fmDJgWEo8vBJlNrD/7xa/Q9WtmFrZU5dJZpb8ZTdqxtsXQj5e
         IR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689353756; x=1689958556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPykY2M+iBxgnfF3tLWI+OoGLznOreuMykVpzGzQM9M=;
        b=NjNzf72Reqid6rP+ucTydxlhhkIZh/Io5O1bvWQzGJDBEfeSzJYZCtaf+xZ3b3KrK1
         fub84rF05AIwk0ScEV472jErnDBfD5U94UxnGldUHPQ8VEmUPptQWn2onIIlijlL3cJk
         oHfSht7jHKBOkIdAle2+RarEb1bBPmr66nWkEURNjNUQvSvuZTlnCqyPO7b1CH5wwEBJ
         GYyF97HsVIuQgxJU8XKtPxKmoSdXpkoHWMr4QqwjC+Tu0ncg9C4jF8x+Xni5ZEOvaAcE
         FPOSjWIuujepxHNL0SHZEMcMNI0B3THsncOLTfJodb3tlUZAHVG01dQsILehdvaQff1a
         O89w==
X-Gm-Message-State: ABy/qLaoKgY4mz1QpkY8wC59temqz93btK8BTVp3Zcuxkv2MvnRHbQFD
	snpp/ClSW+ykZJ8u7eWEZzQaTMxpeyMi6sDTIQE=
X-Google-Smtp-Source: APBJJlEDGSDEGOdKDXhmmtq/RjWdYGrULh2CJQYPjEZOW+WH3IqJ8qF98vsQhnn68tlVv8hSzAc2BA==
X-Received: by 2002:a17:902:e5c2:b0:1b8:4f92:565e with SMTP id u2-20020a170902e5c200b001b84f92565emr5737152plf.21.1689353756696;
        Fri, 14 Jul 2023 09:55:56 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id s8-20020a170902b18800b001b694140d96sm8008081plr.170.2023.07.14.09.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 09:55:56 -0700 (PDT)
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
Subject: [PATCH v6 1/4] RISC-V: mm: Restrict address space for sv39,sv48,sv57
Date: Fri, 14 Jul 2023 09:54:49 -0700
Message-ID: <20230714165508.94561-2-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714165508.94561-1-charlie@rivosinc.com>
References: <20230714165508.94561-1-charlie@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_095601_236530_1B688F16 
X-CRM114-Status: GOOD (  15.03  )
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
 arch/riscv/include/asm/pgtable.h   | 12 +++++++-
 arch/riscv/include/asm/processor.h | 46 +++++++++++++++++++++++++-----
 3 files changed, 51 insertions(+), 9 deletions(-)

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
index 75970ee2bda2..e13f5872bfe9 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -63,12 +63,22 @@
  * position vmemmap directly below the VMALLOC region.
  */
 #ifdef CONFIG_64BIT
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
 #else
 #define VA_BITS		32
 #endif
 
+#define MMAP_VA_BITS ((VA_BITS >= VA_BITS_SV48) ? VA_BITS_SV48 : VA_BITS)
+
 #define VMEMMAP_SHIFT \
 	(VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
 #define VMEMMAP_SIZE	BIT(VMEMMAP_SHIFT)
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index c950a8d9edef..14a5396eed3d 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -13,20 +13,52 @@
 
 #include <asm/ptrace.h>
 
-/*
- * This decides where the kernel will search for a free chunk of vm
- * space during mmap's.
- */
-#define TASK_UNMAPPED_BASE	PAGE_ALIGN(TASK_SIZE / 3)
-
-#define STACK_TOP		TASK_SIZE
 #ifdef CONFIG_64BIT
+#define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
 #define STACK_TOP_MAX		TASK_SIZE_64
+
+#define arch_get_mmap_end(addr, len, flags)	\
+({	\
+	unsigned long mmap_end;	\
+	if ((addr) >= VA_USER_SV57)	\
+		mmap_end = STACK_TOP_MAX;	\
+	else if ((((addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48))	\
+		mmap_end = VA_USER_SV48;	\
+	else if ((addr) == 0)	\
+		mmap_end = DEFAULT_MAP_WINDOW;	\
+	else	\
+		mmap_end = VA_USER_SV39;	\
+	mmap_end;	\
+})
+
+#define arch_get_mmap_base(addr, base)	\
+({	\
+	unsigned long mmap_base;	\
+	if (((addr) >= VA_USER_SV57) && (VA_BITS >= VA_BITS_SV57))	\
+		mmap_base = (base) + (VA_USER_SV57 - DEFAULT_MAP_WINDOW);	\
+	else if ((((addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48))	\
+		mmap_base = (base) + (VA_USER_SV48 - DEFAULT_MAP_WINDOW);	\
+	else if ((addr) == 0)	\
+		mmap_base = (base);	\
+	else	\
+		mmap_base = (base) + (VA_USER_SV39 - DEFAULT_MAP_WINDOW);	\
+	mmap_base;	\
+})
+
 #else
+#define DEFAULT_MAP_WINDOW	TASK_SIZE
 #define STACK_TOP_MAX		TASK_SIZE
 #endif
 #define STACK_ALIGN		16
 
+#define STACK_TOP		DEFAULT_MAP_WINDOW
+
+/*
+ * This decides where the kernel will search for a free chunk of vm
+ * space during mmap's.
+ */
+#define TASK_UNMAPPED_BASE	PAGE_ALIGN(DEFAULT_MAP_WINDOW / 3)
+
 #ifndef __ASSEMBLY__
 
 struct task_struct;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
