Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C165CC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 18:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMnHv4niGKu8WZYxB6uHMiredYst7x1JhNRh/aRPAY0=; b=WREZ9oePe+rnZd
	oOmdU+pQ7pa476ViCYEaIIf0Rc7HKPicvNDehW3faFQCVXBza3J0FzaIDp+LPxGSZvMRZayahASlC
	/IgEtC6A8j47AUoX8gj2DLix2TYTU6pZ37VpaFhkFBqxun9Y6rMU0RzaoBIkAbTkIJV3xRriwy7fL
	9OqjFKssShZdK0vWjVS6q++rv8O4XO1J0SFLl/AIvsOilbXdcUilkEAXRtPauruX+rsdatg26Bc7E
	82rhN3SYHB03GPf+laVWHLikVqzmMNFgmGWKRgg94awZ7G1iOwMOZDgnCb6Qxyqaj5Jhmt5lybLPk
	bsvTJVox/f5UD2i3k+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhFND-00A6Cv-Ex; Wed, 20 Apr 2022 18:48:19 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhFN7-00A686-QE
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 18:48:15 +0000
Received: by mail-pl1-x62f.google.com with SMTP id j8so2592496pll.11
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 11:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=dGeAOCT6r5MCsaaONz+vK0DLEKteGUlMarNKYZRrUPE=;
 b=3DPUa2Vpp9GY71EMMBzT6vukuP1h7Mh1qSwctxVlOMqU2UrCl9zuFahzP1szIXX6JP
 +oGAyKYhhah/seZxnMyfudLk7ktQMOGReYKJAwqGSiWJomCJ6tV1k3jMPmrpTlPOtdQW
 kJRC/sx8oC23TRYHOJxOV0QJoQrwmZ0nlCC7vOzpxq3sjENQOgDOxC9U8MlJRYCijp3X
 XkACjOJY/fWnJpMHcU5hiv/g6rX4WMuwoudIiCd7VVJOnrLNQvI3lOfJlQ7+mItlv0ou
 VvWCbxS3lmCJH69vxwECf49ur9p2gkktQCU/g3ezMq4gFJAtIgzB5/OFWA4IP12tcw8N
 Apsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=dGeAOCT6r5MCsaaONz+vK0DLEKteGUlMarNKYZRrUPE=;
 b=2/hb0E4DHdnnhuKjfYRsJfQtUtfEKZ4wnqqo359x5SkQSwnMVLTSZQcD4hYXlDDMIe
 l0qS7A2mGqEWQjzbzDxXw5jCFfZ6H5b6q829/eBzdrHAPs03SYfk35tUZvn6hNqP66+T
 IF0C99WuarLWDdi3O5QtGReAsAqR67JZrjA/se9b3aYYd6wdOQ3ISav0mR8/z8yyvPbm
 xDFprXyZ88R3SBALNHLfoUdx6x9VkgIoUHIyac4HDMfpjnHigxMgVbl6ets+r7UqTdrC
 2GGgdMz0h8TZcDhGtOGwG08OxYCQPHxwdV18Zvw7KPm2gzTbdHv7ISp/LhYsIfe4e9/1
 It7w==
X-Gm-Message-State: AOAM532yPe15t8LIuXfdXrgxJbvRM+fi0u+w6bVGBZrH8vAAS05gPzYT
 ZSKpFsfDsz6sd8wK2zBIwxiTxQ==
X-Google-Smtp-Source: ABdhPJy51U92hAStdVI18w60yzTLPW9PlcbYe4Ark6awPA/Y9+hbDDPc6f0OMhgjrOvin5aqSs7Y0A==
X-Received: by 2002:a17:90b:4f82:b0:1d1:b8fd:7e36 with SMTP id
 qe2-20020a17090b4f8200b001d1b8fd7e36mr6060236pjb.194.1650480492240; 
 Wed, 20 Apr 2022 11:48:12 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 bc11-20020a656d8b000000b0039cc4dbb295sm19485492pgb.60.2022.04.20.11.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:48:11 -0700 (PDT)
Subject: [PATCH v2 1/4] RISC-V: Avoid empty create_*_mapping definitions
Date: Wed, 20 Apr 2022 11:40:53 -0700
Message-Id: <20220420184056.7886-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420184056.7886-1-palmer@rivosinc.com>
References: <20220420184056.7886-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, anup@brainfault.org, vincent.chen@sifive.com,
 guoren@kernel.org, 
 Atish Patra <atishp@rivosinc.com>, alexandre.ghiti@canonical.com,
 jszhang@kernel.org, vitaly.wool@konsulko.com, 
 gatecat@ds0.me, wangkefeng.wang@huawei.com, mick@ics.forth.gr,
 panqinglin2020@iscas.ac.cn, 
 rppt@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>,
 kernel test robot <lkp@intel.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, rdunlap@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_114813_927683_84079F1C 
X-CRM114-Status: GOOD (  10.54  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

At least one use of these, that in create_fdt_early_page_table(),
triggers warnings and should cause a real error (create_pmd_mpping()
ends up skipped on XIP_KERNEL).

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 677b9eb8810e ("riscv: mm: Prepare pt_ops helper functions for sv57")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/mm/init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 9535bea8688c..7bc9a21e29fb 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -567,9 +567,9 @@ static void __init create_p4d_mapping(p4d_t *p4dp,
 	create_pte_mapping(__nextp, __va, __pa, __sz, __prot)
 #define fixmap_pgd_next		((uintptr_t)fixmap_pte)
 #define early_dtb_pgd_next	((uintptr_t)early_dtb_pmd)
-#define create_p4d_mapping(__pmdp, __va, __pa, __sz, __prot)
-#define create_pud_mapping(__pmdp, __va, __pa, __sz, __prot)
-#define create_pmd_mapping(__pmdp, __va, __pa, __sz, __prot)
+#define create_p4d_mapping(__pmdp, __va, __pa, __sz, __prot) do {} while(0)
+#define create_pud_mapping(__pmdp, __va, __pa, __sz, __prot) do {} while(0)
+#define create_pmd_mapping(__pmdp, __va, __pa, __sz, __prot) do {} while(0)
 #endif /* __PAGETABLE_PMD_FOLDED */
 
 void __init create_pgd_mapping(pgd_t *pgdp,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
