Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7946C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 13:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WeirCD12jGMfsNR6mFOv+guIamIdN8sHgNSeG70acEE=; b=pS9v+HJowNgYG8
	nJyVgu2QTRiKoNnPYWHimmO0/ZC19bSAvRlzjKJVs7Fan62EuTLjOI+Kfv3QdHqScrZXnIoLYwn5e
	ODJMDYtc7ndfajkQHyEmrC3d18E8URwDbBhdev91kZuQ4ggR3gIWN7qDrfbKhCzcJJsEwbFHIUTer
	SxL6sYyhowVJIUW01CjIgS505XALi8aJFScgsmi/29MR4ajJNf7qbvl5mr678/pKel23Y1SMFhGb+
	YFZNU4bZ7QNwxw1WqO5OgDHFvD1xsTM9J6q2zv5dbxzBR0S9hefKUOYLSla5EeIKqqmGgU1LVDXfJ
	p+jrhYsM8dMeXNqb4hiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox6vT-00DyuP-Vu; Mon, 21 Nov 2022 13:33:32 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox6vP-00Dyrm-QN
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 13:33:29 +0000
Received: by mail-wr1-x42c.google.com with SMTP id l14so993123wrw.13
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 05:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/AZ4ygC1zrywaVeDravJh+79FfEh+MWc17/2b5dHnFI=;
        b=HhtboEGdl6Fk3OyjFtdSC0vRkGcOtA6lwHK46rnl7KucXpugcql4jfN/z4U3fxStX5
         bH2McLqqFK3nsOSLPBvF+vJ3ohKVKs8lNsZH/eCMAFqxFobjfTG4JqClqhFOx4zH4zkf
         YUieQJu9wr5pqkoiA8EApI62I7leQpVCg3C4ZDAeVktkNG6pyeP1g5XtOtoOuCYvjHoD
         OS7b6M/xJeh+UC9q6IxqM8+ttR2lSzKHLt1mtpOWTwkX4hxwHUiN0G5+oPbdPwSJYq1j
         2eAGJs1PBNr+DoWhcmuOy8MuQzq8E1CjjzIvnFmN6mNLdA94eNB2AWory4BsJUyv5Gzp
         UErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/AZ4ygC1zrywaVeDravJh+79FfEh+MWc17/2b5dHnFI=;
        b=baJ5Aa0CRJVSglvXFj9NnCWXpsoP2pMA+TuiU6sewuVFxzBreU4iV8HGNa6zgU6kHn
         KCLaWgnNmwGtQJUUkBuZJZE98kw0taq5uaHHqQj79c7k4Hm6GpYnrhS68Dy8sMH2VS2q
         h/WSRRhRfy5NN9zydI3/b6z7Gi65aJJzYNwaGtuM5mBuJDEyBgJTfWI3bR0Wvf8eP+zD
         AOx9xG5v7HSKGGALhGMY8sWkTRm+NI2R/PaEwACLf0L9PwDZK+kV0sDqoONZYnecC/2c
         mphtpy8Jkg1S9cWp5njWBy7foD9Vaa5xWSwR28Sf7l728oXzFl4oQcRRt/0Iy0869HV6
         dWEw==
X-Gm-Message-State: ANoB5pl8q8E4EqFDBDbvLFYamNh1UMqzkX2FCh0ff7ht7Cj0CEtKggOy
	EQha+2yZklZky71INovDPfbFnP1RF8X7LJRT
X-Google-Smtp-Source: AA0mqf65U+hVaWTrA35GMU6HsufKw4fwTxCfsQNgEWiSbacZGQ1vytMt5Bep31zS425r88w5qPgkrg==
X-Received: by 2002:a5d:4577:0:b0:241:c9fc:71bc with SMTP id a23-20020a5d4577000000b00241c9fc71bcmr5324874wrc.317.1669037601244;
        Mon, 21 Nov 2022 05:33:21 -0800 (PST)
Received: from localhost.localdomain (lfbn-gre-1-201-46.w90-112.abo.wanadoo.fr. [90.112.163.46])
        by smtp.gmail.com with ESMTPSA id j18-20020a05600c191200b003c83465ccbfsm20332980wmq.35.2022.11.21.05.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 05:33:20 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: Sync efi page table's kernel mappings before switching
Date: Mon, 21 Nov 2022 14:33:03 +0100
Message-Id: <20221121133303.1782246-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_053328_090032_68E6D05D 
X-CRM114-Status: GOOD (  12.78  )
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

The EFI page table is initially created as a copy of the kernel page table.
With VMAP_STACK enabled, kernel stacks are allocated in the vmalloc area:
if the stack is allocated in a new PGD (one that was not present at the
moment of the efi page table creation or not synced in a previous vmalloc
fault), the kernel will take a trap when switching to the efi page table
when the vmalloc kernel stack is accessed, resulting in a kernel panic.

Fix that by updating the efi kernel mappings before switching to the efi
page table.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/efi.h     |  6 +++++-
 arch/riscv/include/asm/pgalloc.h | 11 ++++++++---
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/efi.h b/arch/riscv/include/asm/efi.h
index f74879a8f1ea..e229d7be4b66 100644
--- a/arch/riscv/include/asm/efi.h
+++ b/arch/riscv/include/asm/efi.h
@@ -10,6 +10,7 @@
 #include <asm/mmu_context.h>
 #include <asm/ptrace.h>
 #include <asm/tlbflush.h>
+#include <asm/pgalloc.h>
 
 #ifdef CONFIG_EFI
 extern void efi_init(void);
@@ -20,7 +21,10 @@ extern void efi_init(void);
 int efi_create_mapping(struct mm_struct *mm, efi_memory_desc_t *md);
 int efi_set_mapping_permissions(struct mm_struct *mm, efi_memory_desc_t *md);
 
-#define arch_efi_call_virt_setup()      efi_virtmap_load()
+#define arch_efi_call_virt_setup()      ({		\
+		sync_kernel_mappings(efi_mm.pgd);	\
+		efi_virtmap_load();			\
+	})
 #define arch_efi_call_virt_teardown()   efi_virtmap_unload()
 
 #define ARCH_EFI_IRQ_FLAGS_MASK (SR_IE | SR_SPIE)
diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 947f23d7b6af..59dc12b5b7e8 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -127,6 +127,13 @@ static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
 #define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
 #endif /* __PAGETABLE_PMD_FOLDED */
 
+static inline void sync_kernel_mappings(pgd_t *pgd)
+{
+	memcpy(pgd + USER_PTRS_PER_PGD,
+	       init_mm.pgd + USER_PTRS_PER_PGD,
+	       (PTRS_PER_PGD - USER_PTRS_PER_PGD) * sizeof(pgd_t));
+}
+
 static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 {
 	pgd_t *pgd;
@@ -135,9 +142,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 	if (likely(pgd != NULL)) {
 		memset(pgd, 0, USER_PTRS_PER_PGD * sizeof(pgd_t));
 		/* Copy kernel mappings */
-		memcpy(pgd + USER_PTRS_PER_PGD,
-			init_mm.pgd + USER_PTRS_PER_PGD,
-			(PTRS_PER_PGD - USER_PTRS_PER_PGD) * sizeof(pgd_t));
+		sync_kernel_mappings(pgd);
 	}
 	return pgd;
 }
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
