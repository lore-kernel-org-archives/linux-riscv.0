Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F1EC54E41
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 20:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1gPDJGrJmAMl4gMAicFr0LAuYtEconUK/yxRU///kGU=; b=npcNan3xU/XFqb
	RhJGxMtfDKy81Xzsh3oyjpPe0aae409ixZIAdHemMNsdG8JvBdqG1Nc2IRhJbsx3We/XyOWAGrCTj
	yJdQav7zWejXLVKi4wB93K9qeG2W6zKXn8i5mx9WOQsLKu7OAAFVVC10msCWyP+saEw8dU/r6UGSo
	rAKy4905QBsMbvanOHnDHwxGtzmkdjFYm74pJnFrkOs9/UKH8rKPjcwCtue2wsMxSgeZhhAWUDEPB
	13nEtPCjoY9wIQH0ZG/v4YBA+DJSenY9cvzq75DXmdlw9DDBMepyCxoDLxns+k9ZRgArKbdzhTU9e
	c/rOuXw8sZgeM00BM3tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf4Q8-00000006noI-48pD;
	Tue, 27 Feb 2024 20:51:24 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf4Q6-00000006nn2-0MyV
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 20:51:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-412a4848f0dso18718895e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 12:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709067080; x=1709671880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wS3Fbtccf2xLgZAcGdUt297LbB3kw/tfByr2NgsnNkM=;
        b=AJNV1x8Vn2PmP7HOfwH5IKf+N0YdUmUwr0vKndvidrDySLo6WtNKFL6UfQmBcuykRE
         eD7fdFbUP1jJCYHZqWTQFLynqiR0H6QCr608gIL/wYIcCJSpXAPAZpLTXvxBK8CARg9s
         y2KvsGOTjhnLGYfWaFhSA1BmdJSyIELepQ5Hl5W22OQoQw5yenQzrJKKPt1Tk1TSUEXx
         RQBv7hDqT3tH2Xz7AHkDwVAw71G+gzJBRSvDcjSnnDVlTYhMLCccOrQ5sNwy8vRRM1Jx
         A7uU/TxXkD6ZylzCg4RTalRrvEckWLXo513lfbhlGU9NAMHvKwOKyHyHhtXF7LVumRMv
         CBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709067080; x=1709671880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wS3Fbtccf2xLgZAcGdUt297LbB3kw/tfByr2NgsnNkM=;
        b=KpPHUYeLHUCyzlg+JJVZ+ghgBKrXYZ3moQAlxqcXJCD6j4ai5/ZZP1/2YFjzD/51Wk
         0y+T7vvluHg1wZlYPq2ZNs/DEOCgc9ktb9iWUo068HjB0qd9gNLhjJPed7Oj1X3ukI5K
         iMtY+TN9/lTbbdT4Xv+aJaRX+gevB5U1fgN1YpOqGa9l2LuZyf7mnrpFHFuYICk/SbDG
         oqfSgVorw+voHuoh+2TphxDxq4AYxo2m4Px37Y5NmOlsCsv1Yt1O85Mc2aQkMOre5JYd
         NUcPc902MIcS8kIQwkSxKTW3oWlqgW3yMvEsZm3K5+4fk2G6OiTxZk80XLHcsLZhCIV7
         jXtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaQFuq5YwSOfbZuLTJLm6a7egAlf4Jm9JZiE7oO/r+oqRZfjp7vWIlGY6oDzUsQR7SwujJdp9UekftGYT1dEdqgrqPAfyNUy8kn5itsiX7
X-Gm-Message-State: AOJu0YxoIDxfaaltnWk5dg9m4ORcfD3MvwbIaDcf01ER/MITRXo7MWRb
	yfp9wn5ZRF4w4umf5RqeCgQ3XVzlTM4WZaBXf4tdynnCIQFL04H0XR8i64B9Wl0=
X-Google-Smtp-Source: AGHT+IHzShpzx0Q/2mn+wkknfDNqSJfPuVlQTcePThpcQE0N9o+mPidgxMz5BYc0SI6qcOtmJFBdmQ==
X-Received: by 2002:adf:e582:0:b0:33d:f3c9:a526 with SMTP id l2-20020adfe582000000b0033df3c9a526mr1830243wrm.67.1709067080216;
        Tue, 27 Feb 2024 12:51:20 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v26-20020adfa1da000000b0033dfd3a8cd3sm35135wrv.30.2024.02.27.12.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 12:51:19 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes 1/2] Revert "riscv: mm: support Svnapot in huge vmap"
Date: Tue, 27 Feb 2024 21:50:15 +0100
Message-Id: <20240227205016.121901-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240227205016.121901-1-alexghiti@rivosinc.com>
References: <20240227205016.121901-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_125122_155840_62F87889 
X-CRM114-Status: GOOD (  13.64  )
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

This reverts commit ce173474cf19fe7fbe8f0fc74e3c81ec9c3d9807.

We cannot correctly deal with NAPOT mappings in vmalloc/vmap because if
some part of a NAPOT mapping is unmapped, the remaining mapping is not
updated accordingly. For example:

ptr = vmalloc_huge(64 * 1024, GFP_KERNEL);
vunmap_range((unsigned long)(ptr + PAGE_SIZE),
	     (unsigned long)(ptr + 64 * 1024));

leads to the following kernel page table dump:

0xffff8f8000ef0000-0xffff8f8000ef1000    0x00000001033c0000         4K PTE N   ..     ..   D A G . . W R V

Meaning the first entry which was not unmapped still has the N bit set,
which, if accessed first and cached in the TLB, could allow access to the
unmapped range.

That's because the logic to break the NAPOT mapping does not exist and
likely won't. Indeed, to break a NAPOT mapping, we first have to clear
the whole mapping, flush the TLB and then set the new mapping ("break-
before-make" equivalent). That works fine in userspace since we can handle
any pagefault occurring on the remaining mapping but we can't handle a kernel
pagefault on such mapping.

So fix this by reverting the commit that introduced the vmap/vmalloc
support.

Fixes: ce173474cf19 ("riscv: mm: support Svnapot in huge vmap")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/vmalloc.h | 61 +-------------------------------
 1 file changed, 1 insertion(+), 60 deletions(-)

diff --git a/arch/riscv/include/asm/vmalloc.h b/arch/riscv/include/asm/vmalloc.h
index 924d01b56c9a..51f6dfe19745 100644
--- a/arch/riscv/include/asm/vmalloc.h
+++ b/arch/riscv/include/asm/vmalloc.h
@@ -19,65 +19,6 @@ static inline bool arch_vmap_pmd_supported(pgprot_t prot)
 	return true;
 }
 
-#ifdef CONFIG_RISCV_ISA_SVNAPOT
-#include <linux/pgtable.h>
+#endif
 
-#define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
-static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, unsigned long end,
-							 u64 pfn, unsigned int max_page_shift)
-{
-	unsigned long map_size = PAGE_SIZE;
-	unsigned long size, order;
-
-	if (!has_svnapot())
-		return map_size;
-
-	for_each_napot_order_rev(order) {
-		if (napot_cont_shift(order) > max_page_shift)
-			continue;
-
-		size = napot_cont_size(order);
-		if (end - addr < size)
-			continue;
-
-		if (!IS_ALIGNED(addr, size))
-			continue;
-
-		if (!IS_ALIGNED(PFN_PHYS(pfn), size))
-			continue;
-
-		map_size = size;
-		break;
-	}
-
-	return map_size;
-}
-
-#define arch_vmap_pte_supported_shift arch_vmap_pte_supported_shift
-static inline int arch_vmap_pte_supported_shift(unsigned long size)
-{
-	int shift = PAGE_SHIFT;
-	unsigned long order;
-
-	if (!has_svnapot())
-		return shift;
-
-	WARN_ON_ONCE(size >= PMD_SIZE);
-
-	for_each_napot_order_rev(order) {
-		if (napot_cont_size(order) > size)
-			continue;
-
-		if (!IS_ALIGNED(size, napot_cont_size(order)))
-			continue;
-
-		shift = napot_cont_shift(order);
-		break;
-	}
-
-	return shift;
-}
-
-#endif /* CONFIG_RISCV_ISA_SVNAPOT */
-#endif /* CONFIG_HAVE_ARCH_HUGE_VMAP */
 #endif /* _ASM_RISCV_VMALLOC_H */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
