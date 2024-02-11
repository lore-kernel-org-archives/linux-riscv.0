Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDED1C4829A
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Feb 2024 08:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uZYu1rXHhcnuWxoAy/g4nl/iO/TUcK7vXtmII/sYVFY=; b=uqyTqC8m/niVII
	xsELFr0F+nOi0K8J+kDT+gkD0mVBtZ6xc/gIrIYayiW0ZqOH0b6TXCWH3ztIZcGe4CBT/aV++VV3h
	Ppec/wTrofgUhIW/Iy+CXxYKP6kabFSRZ2EliWv8OQhYqcJm7a5AXMQ3RAII6xKQIZxNBTHdRZKGU
	QGFYBBf/o9azR5RgMpWKzGOy67/jU8yr5gKoXwVwmdTgVs3cZpzuzrZnetBtZjqg+XMx8D5Juf1Gj
	a1FB5SW1hC+4eN3aPSo8XHVi5lNx0W2FBzI8szbvoze2xLGV9q8mSrn3q2Gvkqie8fbIIr2kbuwLh
	MxSzjtlOylNVeMLetSQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZ5KU-00000002Ve9-18el;
	Sun, 11 Feb 2024 08:36:50 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZ5KR-00000002VdI-1bXm
	for linux-riscv@lists.infradead.org;
	Sun, 11 Feb 2024 08:36:49 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4109f9afc1bso6865605e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 11 Feb 2024 00:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707640602; x=1708245402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WgK2rhF0MEavRxG1nB7KIKdfUxp0z+0YRkDvo4+DSAo=;
        b=IbCbvKa4OTULykMYgm/2NXQb2CtLEn67s4LYsY6FRYY/mgxGrsQBU3a+3YpuCX9dzS
         H1cLVEaj9iAsCD7puB4FOyc6Gn5v5z10Hy7UiTWLmE8eF7paClnZKKm0M4rAgfbPpOFJ
         OxzYlXOd/xaRr1a/lcCScqAuFndNJ/Yl4svbx8KkNN9XCSuUkGdhjmltOrmErMRyaSQE
         +wRnmZxQ4l1w3rhoP81tdHy46vYPVBbrXLL9sOiZvgALw6LFOnwEU5XvfYbie54GPAnP
         8YFqHgr7CdUrqcvNA3uA1+w5xKutTLo1GZTv34Y4F3lFrM6dG4sxw+DDUHSSqCiC/8mb
         TGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707640602; x=1708245402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgK2rhF0MEavRxG1nB7KIKdfUxp0z+0YRkDvo4+DSAo=;
        b=SZ4RQSk52mGxmUGLkyqa8R8b5lS/wIQkD0501cdfwLpuqWRSB0nImXLwutl43QZrHY
         J4hrAJkiGI6X4eaZEOjo0ApSmz8ch03smtjIgxx/Z5ICCA2HhA8dIaOLCWdOyOq7e3g0
         WB5YMbjtNzVhp+gl3wc7TKYeisnW0D6qt8mNe1hG/N+BZL3TXkkLJLK4x+xNV4xDjy9x
         Kods1E4iEHQTpCiBgQJVA7U/wjEzZRSxsZPWJBUoeHr/Za85Hrusk0zisCPLRv3Ja88R
         h6chcbOtrfoSWkgMEMYnF+9a85yPcJVuBgURhfBGGoBf2eClBmvm2C8x+wd9T+G0CkC2
         H0aA==
X-Gm-Message-State: AOJu0YzVdxEJeZiCHaPbtRcyJJz8nMdYZAhHeIIbOkRqyDWoi/RyFLpA
	S83Z1G5j7nmxAHDwRv2TYsopylaTtDuZPSfrnywEK5XMpdtnHktkwZrS7L4BNf8=
X-Google-Smtp-Source: AGHT+IF6J6ikEknPWNk0mkR0oXLiZIQqS80e+U5t4O1lcDADleZa9BZYSBIYhXb367ecZ3+J8anU9A==
X-Received: by 2002:a05:600c:1d11:b0:410:6a37:89c with SMTP id l17-20020a05600c1d1100b004106a37089cmr3067197wms.13.1707640601917;
        Sun, 11 Feb 2024 00:36:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWb/SQxYauRZY0HBr6Cqy/kvT5IVBu6SCA1i6zk+vNJoZLBmYvB4pbObUujZlCM/ql0Y8VwwIYxryM5ZBR7bhEG/2TbbpCyJ9TUucLRrsfFlysHXgALNR3L09EG46mqr1Hqq2EIyi6tO51SSzkEd6cnkKLIAzv6fcByNBkA136GJADRJhNhfCPkgQXNmRIwmx8ER1tK2YCmc0QVziEAqVh9jt0S6Ek3Cf4V56h78LPvyQ==
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id w6-20020a05600c474600b0040efc268713sm5321708wmo.26.2024.02.11.00.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 00:36:41 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH -fixes] riscv: Fix build error if !CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION
Date: Sun, 11 Feb 2024 09:36:40 +0100
Message-Id: <20240211083640.756583-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_003647_670329_00CE1EBC 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
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

The new riscv specific arch_hugetlb_migration_supported() must be
guarded with a #ifdef CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION to avoid
the following build error:

In file included from include/linux/hugetlb.h:851,
                    from kernel/fork.c:52:
>> arch/riscv/include/asm/hugetlb.h:15:42: error: static declaration of 'arch_hugetlb_migration_supported' follows non-static declaration
      15 | #define arch_hugetlb_migration_supported arch_hugetlb_migration_supported
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/hugetlb.h:916:20: note: in expansion of macro 'arch_hugetlb_migration_supported'
     916 | static inline bool arch_hugetlb_migration_supported(struct hstate *h)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/hugetlb.h:14:6: note: previous declaration of 'arch_hugetlb_migration_supported' with type 'bool(struct hstate *)' {aka '_Bool(struct hstate *)'}
      14 | bool arch_hugetlb_migration_supported(struct hstate *h);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402110258.CV51JlEI-lkp@intel.com/
Fixes: ce68c035457b ("riscv: Fix arch_hugetlb_migration_supported() for NAPOT")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/hugetlb.h | 2 ++
 arch/riscv/mm/hugetlbpage.c      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index 20f9c3ba2341..22deb7a2a6ec 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -11,8 +11,10 @@ static inline void arch_clear_hugepage_flags(struct page *page)
 }
 #define arch_clear_hugepage_flags arch_clear_hugepage_flags
 
+#ifdef CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION
 bool arch_hugetlb_migration_supported(struct hstate *h);
 #define arch_hugetlb_migration_supported arch_hugetlb_migration_supported
+#endif
 
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
 #define __HAVE_ARCH_HUGE_PTE_CLEAR
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 29c7606414d2..5ef2a6891158 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -426,10 +426,12 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
 	return __hugetlb_valid_size(size);
 }
 
+#ifdef CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION
 bool arch_hugetlb_migration_supported(struct hstate *h)
 {
 	return __hugetlb_valid_size(huge_page_size(h));
 }
+#endif
 
 #ifdef CONFIG_CONTIG_ALLOC
 static __init int gigantic_pages_init(void)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
