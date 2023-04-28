Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23F5C77B61
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 12:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cobBRV71fMPhUwPBN91/IXnVW1iOf1taRglut+gvUIY=; b=uFfrRLwRUIROB5
	pqnEuRGnJWKgG3S4j96xpXi7IApMdxoLJCYboZ2tfJIMpFQc8fU8BXOezzlSNczXtbCE33clvInF1
	8RU/sNqM+9kWqVuS0AcNlmhpMvIZiLAEAHbJ7+pnE4dFiw0bgbUslpgwHgPbiLYJrC1CG1jFe5Uti
	p36W3SaYgRD18AvnOLmZYuedSERkNRUCTMVlBFH/H+KbOilpYBOYt614iXAedta34gK85CSQ5owMs
	GsCSOeJzY9rPisA0ss1lTrQfbwVwD1UlRVf+GIqmmaegLoPeqT1wovGa6sZFkBiFDdVcyAkecRXSd
	yFBcaXpBD6DaVH+WKsMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psMo3-009X3W-0p;
	Fri, 28 Apr 2023 12:02:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psMo0-009Wzz-2r
	for linux-riscv@lists.infradead.org;
	Fri, 28 Apr 2023 12:02:30 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f315712406so57950455e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Apr 2023 05:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682683345; x=1685275345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+IhJdlbzPopAgcnIQcMyy0yuzqBnz1h8mDocxofWCY=;
        b=aLYgN7VlR46N9WcDi53goFnZv+vG6n3pLEhhSP9AnlnYDiiuuH7hkDMkrbFyl/q8IU
         QqyxBo3ttSlxPV99BPEA855FtbCjlLBq+2yUTvTQrQdE3zs6TkyppYM8+4iJm0cSlyTZ
         4kJvdtC6YfTYisDIciOvBeSXMzj6JftKhpHLkM7+dbEncXDxKStkW/Yeosa1Ci8x2Xew
         TRKfi2Xbgzs5uPExZM9N2S626aiDKkYDfPfeLt0iG40V81YMQo2BzohjA180oQd3gl9r
         zn5JUkkEJIGXv7OzhafPO6q+n3QKY7b0LRP/qIzGwu7mBU9lh01fnfzJTPUA2ueO4c+s
         Tysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682683345; x=1685275345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+IhJdlbzPopAgcnIQcMyy0yuzqBnz1h8mDocxofWCY=;
        b=hbdAZYhw3rjqudMe+CTieDjIbMiBxAgxCdGLdfRJTLdX6k4CPxnl5/WYZ/wpapPvG2
         Kx3+kZ3jHSfmDGoudEjy5Xd24JPPJ/26TAyrw0GfNmoHSmpCzN+ClC0jeIiuAfls7uF6
         RGvDfA1gF06akvVAkdFLqFgwPQQdKLFFvrXbpCCxwx4D2Kr2khGUJ5+OKYXVFvx0hd8T
         gDV0ZEYQPmPC3cuPNJtaC69SbjG42xT4N1e5Fghy/E08YxbI2ftv2zMnvdvXIsUweZzt
         bGQCmLHFKGfsA5GH3D2PCDHTF7eerLiVxMTCEDKlI5eba6/aZNWofINBlSyNVNMTl6pd
         y2Sw==
X-Gm-Message-State: AC+VfDxvWZ0uyZ18aoykIZnEX9z6YbXrg9TgPFzPeH+7VvN+AUozagrw
	+3Pt+JDuyk3HnwC3e6lyQHOcXjnarrkHFKp3KH0=
X-Google-Smtp-Source: ACHHUZ5VIm/9FvBnliMEeY0Op5aLkD+MKAJ4pG2os4QAW4erFcKj2zX2YCBI9BaqYR1JhwIUBX2zdw==
X-Received: by 2002:a5d:68cb:0:b0:2f0:2c3c:b858 with SMTP id p11-20020a5d68cb000000b002f02c3cb858mr6046924wrw.31.1682683344886;
        Fri, 28 Apr 2023 05:02:24 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id x8-20020a05600c21c800b003f2390bdd0csm15487607wmj.32.2023.04.28.05.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 05:02:24 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes 2/2] riscv: Implement missing huge_ptep_get
Date: Fri, 28 Apr 2023 14:01:20 +0200
Message-Id: <20230428120120.21620-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230428120120.21620-1-alexghiti@rivosinc.com>
References: <20230428120120.21620-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_050228_946061_3144196B 
X-CRM114-Status: GOOD (  11.79  )
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

huge_ptep_get must be reimplemented in order to go through all the PTEs
of a NAPOT region: this is needed because the HW can update the A/D bits
of any of the PTE that constitutes the NAPOT region.

Fixes: f2aeb0118ddd ("riscv: mm: support Svnapot in hugetlb page")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/hugetlb.h |  3 +++
 arch/riscv/mm/hugetlbpage.c      | 24 ++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index fe6f23006641..ce1ebda1a49a 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -36,6 +36,9 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 			       unsigned long addr, pte_t *ptep,
 			       pte_t pte, int dirty);
 
+#define __HAVE_ARCH_HUGE_PTEP_GET
+pte_t huge_ptep_get(pte_t *ptep);
+
 pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 #define arch_make_huge_pte arch_make_huge_pte
 
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 238d00bdac14..e0ef56dc57b9 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -3,6 +3,30 @@
 #include <linux/err.h>
 
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
+pte_t huge_ptep_get(pte_t *ptep)
+{
+	unsigned long pte_num;
+	int i;
+	pte_t orig_pte = ptep_get(ptep);
+
+	if (!pte_present(orig_pte) || !pte_napot(orig_pte))
+		return orig_pte;
+
+	pte_num = napot_pte_num(napot_cont_order(orig_pte));
+
+	for (i = 0; i < pte_num; i++, ptep++) {
+		pte_t pte = ptep_get(ptep);
+
+		if (pte_dirty(pte))
+			orig_pte = pte_mkdirty(orig_pte);
+
+		if (pte_young(pte))
+			orig_pte = pte_mkyoung(orig_pte);
+	}
+
+	return orig_pte;
+}
+
 pte_t *huge_pte_alloc(struct mm_struct *mm,
 		      struct vm_area_struct *vma,
 		      unsigned long addr,
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
