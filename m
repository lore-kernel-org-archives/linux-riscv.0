Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D93C10DC1
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 05:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nggd7Cyi8rpPxe/MsYnSvLPWOC23mjduUp6vBoLly5o=; b=4yPPWCuUW4uIGM
	paNm1ScHE+mDr8fofZDeeCtZPE1lASmzoc0NJ9teMnBFckuq7Fy9SdI0RugNrzPlWNy1fmuqZ7XMP
	FZSIa+1158LUNPNWaNVHwIKrIYIaqfIAiVPFH1NVk9JEcfLAGUqxIqrrUliE9ZcfRGo0Arae558rN
	sJR4MfklQRgG6IRkaqvu9lG2/SKkTFqC/DhlAIPsN/7itPgpe5CZVUKAcWPFDyri5P1XH5gdVLY+E
	Kcoaa6hsa7eOm8iWaZfBei7yg1xtqo6isN+RZOmb2RQ1l99zuqfOyJJknLJf+tkgWrDrs/Eu5V/wY
	W/E/kqHMd0t/QSHN1J7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTph-00Enoh-1Y;
	Fri, 08 Dec 2023 05:55:29 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTpO-00EnSs-2g
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 05:55:13 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1cfb30ce241so15688325ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 21:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014910; x=1702619710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kq9/CzymS2t6cI6IAaf6StcamgWHCvrnQt5+bd0vsJ4=;
        b=Dzh2WQ7oy9VFsC+B7FfQdc1x5/1QNszNPAuu2N99DNxEN8zYOWaJcgO3F0NJOjnKEA
         aUHVFYYBbnh4eND7fiHrX9w7Lm+uxEivf5odtsxTVkavqH1m/RzGRL7OBc0ZouH/tEPY
         qIKHfiihfnEVtArYhxW3ScBFIoa6gArQnC/Y7EBnLaIxRPTIWwsBviBwr+bKuC3IWRK7
         KqRt4Z8PAGkUXWzoRwbHXIytjevo7dsJ23AeWV7+xkuzYMm3EkZLbVA90C2VDvyYL+YX
         O4dGyV4PQzWu+HQrreN3Km/JkJuOR3YJumyfJ0UKdJDgRzUYG8VURCB96i+D9OkRoSt9
         63MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014910; x=1702619710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kq9/CzymS2t6cI6IAaf6StcamgWHCvrnQt5+bd0vsJ4=;
        b=jI6gnIrs4PXvGl6t4jXuaLBBnoPgZZNtn8UU6PZbtYlqVybqzcPwkENUyqusRgPGkR
         ufpXVh+OtdOta2jWHCyK81eN82Lteb3isWu8J6ldCuRuXEEZ5Banbly38sKlSxlaJw41
         eOOCwhPKXEx3nO/gbmIdrQnzb5KmYuufIugQ405L4DL74kIWjVTg7QDQkra3kpWvkU2q
         BuWKeFqVNFFu9Gzn2wVzgwOVFwuI35sE7IX9WpT6sp/YEk65aVOLvOo9GGCyJY73Oqhc
         71W7cfkgEIl2kXzEyEZnf/cSb/D0doIuAaWyf9eIMxBp3Jid0+41eIYbUPvR9H71gGyK
         EiIg==
X-Gm-Message-State: AOJu0YyEsUHeFBzsq26duLqFNxcHU/ZccLOnKbSiVj1KdFs5D/wJKbR+
	uia99i9rxhKBiS0JjCGaIsnztw==
X-Google-Smtp-Source: AGHT+IHV6F7Dn38rHWvZV+XaXS58Ch7TWuC4F5MVn7OmuYlLci2zlP9Fr0nUwpZzieoBTkpnbrTn6A==
X-Received: by 2002:a17:903:2290:b0:1b8:90bd:d157 with SMTP id b16-20020a170903229000b001b890bdd157mr4496557plh.26.1702014910345;
        Thu, 07 Dec 2023 21:55:10 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:09 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH 06/12] LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Thu,  7 Dec 2023 21:54:36 -0800
Message-ID: <20231208055501.2916202-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208055501.2916202-1-samuel.holland@sifive.com>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_215510_906076_46CB2DF1 
X-CRM114-Status: GOOD (  10.65  )
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

LoongArch already provides kernel_fpu_begin() and kernel_fpu_end() in
asm/fpu.h, so it only needs to add kernel_fpu_available() and export
the CFLAGS adjustments.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/loongarch/Kconfig           | 1 +
 arch/loongarch/Makefile          | 5 ++++-
 arch/loongarch/include/asm/fpu.h | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index ee123820a476..65d4475565b8 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -15,6 +15,7 @@ config LOONGARCH
 	select ARCH_HAS_CPU_FINALIZE_INIT
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT if CPU_HAS_FPU
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PTE_SPECIAL
diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 204b94b2e6aa..f5c4f7e921db 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -25,6 +25,9 @@ endif
 32bit-emul		= elf32loongarch
 64bit-emul		= elf64loongarch
 
+CC_FLAGS_FPU		:= -mfpu=64
+CC_FLAGS_NO_FPU		:= -msoft-float
+
 ifdef CONFIG_DYNAMIC_FTRACE
 KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
 CC_FLAGS_FTRACE := -fpatchable-function-entry=2
@@ -46,7 +49,7 @@ ld-emul			= $(64bit-emul)
 cflags-y		+= -mabi=lp64s
 endif
 
-cflags-y			+= -pipe -msoft-float
+cflags-y			+= -pipe $(CC_FLAGS_NO_FPU)
 LDFLAGS_vmlinux			+= -static -n -nostdlib
 
 # When the assembler supports explicit relocation hint, we must use it.
diff --git a/arch/loongarch/include/asm/fpu.h b/arch/loongarch/include/asm/fpu.h
index c2d8962fda00..3177674228f8 100644
--- a/arch/loongarch/include/asm/fpu.h
+++ b/arch/loongarch/include/asm/fpu.h
@@ -21,6 +21,7 @@
 
 struct sigcontext;
 
+#define kernel_fpu_available() cpu_has_fpu
 extern void kernel_fpu_begin(void);
 extern void kernel_fpu_end(void);
 
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
