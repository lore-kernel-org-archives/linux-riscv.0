Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4F5C38142
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 09:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OePEb+qHF8+I72Tp//xOdouYpXUc0Lb9LOs51RBk3og=; b=GqOs9N3Z3YaH4C
	NvU0UrFW2rN+QQPCjP7n3gu2s0RTjHWgkZz3tm9doGtZQcYsXqCa9JKCkra7aVhcHpHwh3pByBnxy
	XaGcvr3oUzexgzVhmiaFve0uxh388HwuWdkKxYHGI60HS2ywjio2ossfO6PL6GA88alSTbx40SMeF
	qMYRKOGXng7jdF0lIW+gSila6cjKraMpDNuGajDXDZN+YTej5bdNgkim40ZLIZlZ78pulcyDdJcPx
	3natZBdNtHGy6p2H9BESl5srswiWTKn/SUqszCouoUJJ9bbvOiea5d6ePcJwpPu+bgEqWrWJnt7n8
	2xfGuWdbyRZkoKRP4/zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJt8x-00GWbe-Bc; Mon, 23 Jan 2023 09:29:35 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJt8u-00GWal-H5
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 09:29:34 +0000
Received: by mail-wm1-x32a.google.com with SMTP id m15so8464175wms.4
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 01:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6i4/DPc3clho1bRJuBJWVhY/2WISVnxE9xJwLHy63OI=;
        b=hO5aZpDY4ENl9IWdTW3woDPtDZ4dsUEyVjT464rX2BSA25tYl0Oi1VJ4FSeOmHgjxS
         HUo0c5O7+8+DoPmnWxRxAwrc3eO4d/agpWf+Iy2RJh5hoA0IUzV7q1SnI4SBpOyYlJ5z
         qkCQE7AYvU5Yn8u6N133gPHBTeJl8aq4e56R1ntNvn/vY8mSmLO7g3rUG/nrSrShV0GU
         2Tis7CmieX9Da1GhuUzPk3Vl9qgBVK9yznTibbAPKNCFQaj8/e53NUYniODGAWsaY98w
         wqIeAMBmvcU8VKSrtDQYxJ4DT3RkNJsROatznlCCKtxbghJtehjz13fFUrF3gkuLVLS0
         NPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6i4/DPc3clho1bRJuBJWVhY/2WISVnxE9xJwLHy63OI=;
        b=qqzO4WtYSTWSQQ6+ZlM17jv3bhcOBltaJegWyuZqRe9mWuYPNuCYDhVLsFZV9d7XBC
         tT63b0QUjk+plIwtopmtzbEZIFEO+oVDiGgcvard+YBD0nOOX7cnS9QD9rGldpLS4LqQ
         RYqjFlLAXclC36QS1RYYKuquk9omTkrArBkcSd5JY+iMWERuC29mGRKBS4dFkgAjPHyd
         B3jUGF78gbznCkJyFFHd5LpQ3jn43ddUbVt+d1LTj/D+sDluzow+RYr2U33jlIbnMtNk
         jSB4XLQbGOtOLJ2pVHXZSTdX8Qp/T3VWjbsdaCBQj2Kuhs7YePQMsI8RpTrhGCIHPMmL
         2Usw==
X-Gm-Message-State: AFqh2krqgX58E5yJbC9ZEoZoTtyao/PfjaeIrxRyCo4aSys4aI4w4Bri
	5BWXEoikA93hPTPsajlcPLRjSQ==
X-Google-Smtp-Source: AMrXdXtqCE84xtsh9SqffI9Nun8+wVvG/L434n5lc/pRyKhwZ048Rt50MZxTPhaP7Rllg8LqItz9Ug==
X-Received: by 2002:a05:600c:1695:b0:3d3:4ae6:a71b with SMTP id k21-20020a05600c169500b003d34ae6a71bmr22314548wmn.2.1674466170281;
        Mon, 23 Jan 2023 01:29:30 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id n42-20020a05600c3baa00b003d96efd09b7sm11619340wms.19.2023.01.23.01.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 01:29:29 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] KVM: RISC-V: Fix wrong usage of PGDIR_SIZE to check page sizes
Date: Mon, 23 Jan 2023 10:29:28 +0100
Message-Id: <20230123092928.808014-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_012932_602066_D3F127F9 
X-CRM114-Status: UNSURE (   9.35  )
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

At the moment, riscv only supports PMD and PUD hugepages. For sv39,
PGDIR_SIZE == PUD_SIZE but not for sv48 and sv57. So fix this by changing
PGDIR_SIZE into PUD_SIZE.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kvm/mmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 34b57e0be2ef..dbc4ca060174 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -585,7 +585,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	if (!kvm->arch.pgd)
 		return false;
 
-	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PGDIR_SIZE);
+	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
 
 	if (!gstage_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
 				   &ptep, &ptep_level))
@@ -603,7 +603,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	if (!kvm->arch.pgd)
 		return false;
 
-	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PGDIR_SIZE);
+	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
 
 	if (!gstage_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
 				   &ptep, &ptep_level))
@@ -645,12 +645,12 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 	if (logging || (vma->vm_flags & VM_PFNMAP))
 		vma_pagesize = PAGE_SIZE;
 
-	if (vma_pagesize == PMD_SIZE || vma_pagesize == PGDIR_SIZE)
+	if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE)
 		gfn = (gpa & huge_page_mask(hstate_vma(vma))) >> PAGE_SHIFT;
 
 	mmap_read_unlock(current->mm);
 
-	if (vma_pagesize != PGDIR_SIZE &&
+	if (vma_pagesize != PUD_SIZE &&
 	    vma_pagesize != PMD_SIZE &&
 	    vma_pagesize != PAGE_SIZE) {
 		kvm_err("Invalid VMA page size 0x%lx\n", vma_pagesize);
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
