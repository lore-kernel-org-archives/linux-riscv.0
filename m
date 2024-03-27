Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A347C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 14:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aWd406K67EMxEdxy8IBQTNgMTBOBXZkxNiNjZkl2NG4=; b=e7n7z2+sh1lKdA
	vlDbqE5qsU+hc7Y9mpf6xW1eR8B6Pvwhfds6jya2LbtTKQwrTJF1vQqgy7uMdV24WpQEgUjixPVnD
	HeElnB70qipbNddcruXg1Px0NPcGCNLNlgaZiqPlLQZ5VZD5XbIuEQRZNmtphZmpaKv4qFVWMhvjL
	+NIc6NSt4/3mZKH3cffhwK712+kRLp0wOoMVfbKbdmlZPtnTEsMZC0I/+LJHCBBBugpjtBPpXZs/y
	+9eZpVD33zVRE5JTxgxrd4lPQBTymw1H3hBSeaqymG1DHu3o0vtDRjTppCc8nn5XkvoBdONq5S3kK
	q45a7ZYeHaCUmYGkEMwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUQl-00000009X0v-2FNj;
	Wed, 27 Mar 2024 14:39:07 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUQg-00000009Wxq-1fVM
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 14:39:03 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6e6b3dc3564so4860255b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711550341; x=1712155141; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CX4R+Xwg8EPDuDmOu6fTpyMUABBlNsMe2JkNvmUPcG0=;
        b=mirMQ5k3TesRMwvus7LMjaNhmcxwPerJLPowbzcplagIJcxC10ufMzOsTmw0TKsVek
         5shoMQnD5khEIWegHrmzCN7eXFSPao809z9LRG6h5nQ6cEMwsZv3VEGRpVCNIDfs6LEx
         NGLpaJRAtt7l8BfdNslsZVnMLmAaxv7NsNpp4/xhWhsKVNlW1P8kUwVkOOgVXr1X25ln
         UrrCZ82YgsPx/LMtDFApWI8liszoLEXs3k3FuXd0mZ35mvRshUZ5/8ED1OwgiRGDfLwM
         LDZl9FXqLoNYkAs9VZkpS/KjtcaiBVZVbHXJo3EZi3HfSommNsAXrOxBJY26mFgScoay
         2KnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711550341; x=1712155141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CX4R+Xwg8EPDuDmOu6fTpyMUABBlNsMe2JkNvmUPcG0=;
        b=dfnGDKPJFU4EqtEmGxgKJdiBXdidIQkdwwegaxP1+zx1WgljedinB2k3rOgKFEkm/V
         ASYgyoOSsXDuI3VSIhP/tHIlSYqIkw9ChPznh+t8HghebBRN84HfJBKd83r8KgMhNDPi
         Faxc5jNbCACvAlj3a4iFJ138ctPeGboYr1F2JJnmcSgXytPiKVB3gvILrVgH0zwaOzKk
         dexLnat7rPsHtg2uu4IMsRyxvR8z45cu2vdmHb3S2rKJcz4Efz1yEtT86BCSR/0Hi4D+
         O/i2t4sMaJukSW7HD0/+/9SpmIsj0hhZzJmOfskQ+QgOGhnsAi4qHGiVx20qlC+HnHsM
         1aMg==
X-Forwarded-Encrypted: i=1; AJvYcCV+M0waolkq5PEbS8s7uHIKtM+ZYoghauryaws9ESL+KDBy/HUhjSVWIU53a9EO10y/Tl67i6l2AZZFIE5vtKJUj43Fp1014WTXqmwlqDmf
X-Gm-Message-State: AOJu0YzESWPAmCZzf2lfy6HKTevrO0Rw2zwv2nZH0I9ogkrMoadNkdJE
	blpjeeHiQlUjcM45+8Mk3zwOw9xx6B3yCsQd+6R/S1fOrHe0v81s4jPHrr34U90=
X-Google-Smtp-Source: AGHT+IHMXSVzocfTbLPFCeWXlDDBHsFIPuhKsLa+03UHnxkz1iXp1UoEmxkJy62An1zGQQ/WMnk/XA==
X-Received: by 2002:a05:6a00:1808:b0:6e6:b320:5567 with SMTP id y8-20020a056a00180800b006e6b3205567mr5112095pfa.24.1711550341367;
        Wed, 27 Mar 2024 07:39:01 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id kt1-20020a056a004ba100b006ea98271e43sm7915574pfb.144.2024.03.27.07.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 07:39:01 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	David Laight <David.Laight@ACULAB.COM>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 1/2] riscv: Remove PGDIR_SIZE_L3 and TASK_SIZE_MIN
Date: Wed, 27 Mar 2024 07:38:12 -0700
Message-ID: <20240327143858.711792-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327143858.711792-1-samuel.holland@sifive.com>
References: <20240327143858.711792-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_073902_519715_DCDDF135 
X-CRM114-Status: GOOD (  10.90  )
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

TASK_SIZE_MIN is unused since commit 085e2ff9aeb0 ("efi: libstub: Drop
randomization of runtime memory map"). PGDIR_SIZE_L3 is only used in the
definition of TASK_SIZE_MIN.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 arch/riscv/include/asm/pgtable-64.h | 2 --
 arch/riscv/include/asm/pgtable.h    | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 221a5c1ee287..8c36a8818432 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -16,8 +16,6 @@ extern bool pgtable_l5_enabled;
 #define PGDIR_SHIFT_L3  30
 #define PGDIR_SHIFT_L4  39
 #define PGDIR_SHIFT_L5  48
-#define PGDIR_SIZE_L3   (_AC(1, UL) << PGDIR_SHIFT_L3)
-
 #define PGDIR_SHIFT     (pgtable_l5_enabled ? PGDIR_SHIFT_L5 : \
 		(pgtable_l4_enabled ? PGDIR_SHIFT_L4 : PGDIR_SHIFT_L3))
 /* Size of region mapped by a page global directory */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 97fcde30e247..f5cc8bcc7f8d 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -870,7 +870,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
  */
 #ifdef CONFIG_64BIT
 #define TASK_SIZE_64	(PGDIR_SIZE * PTRS_PER_PGD / 2)
-#define TASK_SIZE_MIN	(PGDIR_SIZE_L3 * PTRS_PER_PGD / 2)
 
 #ifdef CONFIG_COMPAT
 #define TASK_SIZE_32	(_AC(0x80000000, UL) - PAGE_SIZE)
@@ -882,7 +881,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 
 #else
 #define TASK_SIZE	FIXADDR_START
-#define TASK_SIZE_MIN	TASK_SIZE
 #endif
 
 #else /* CONFIG_MMU */
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
