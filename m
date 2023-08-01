Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028F0EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 08:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tJHKTS7N85ZUf9kXUWn7nhYK4zwgNMPr66+s6fmkC4g=; b=PIvQnyu7Dq5eLq
	d23JN7v4dVyJOSre/9QslrJEcvntTt/oy3xfovhoXYY2URZCGtdmVOSYoLwZ0c/CjRUrIor1jAIq7
	Bz7W5AtOCIrVsfuHXXCJ+hG+vkaNfsHMUNcQFkrampav6GBEKxTWXuKW8bEO8eoWPwPk3Uw28nq9c
	r11pr9yC6RG82pPz2DHmZMoOHc8OYVh3UoSQrVk6RbEzdj6TcAbHwqPGt+iDscjy7x66aU6JI6R8v
	hlyjTN6BYpGFQgHB7dFY5oizpl54lag6w/1uTk2z+P4CR1LdQEYk4meW17ZUIILwfzOItR02jZYVH
	CnuM2L6FUsMzKm7gKcUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQlAq-000hRK-2O;
	Tue, 01 Aug 2023 08:56:12 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQlAo-000hQH-24
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 08:56:11 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so59866575e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 01:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690880168; x=1691484968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdYxZtsdohXkJiEqvE1Q59ExwQkgmM2r74atDceIuW4=;
        b=P1QobXoccsE3+9czY0EpajvoT8IDASIi5MHnVOCPkE2PMZjb4NqJkp3pvl6huP8YRq
         inBiQsncpHkOkganYv8SrZAOd3CtSTRw0CEuM5zl62vwXj74EYJEKz1rWmjPNAGUwXcZ
         0T//g3rQxb50UzHNokVzEi/3Xp6BVR9XQED7mluE4W1zuOqwh31OFZ6aHgZa9eXfLMxk
         Ybdk6zmtonm5+VeE6xBp3pLoAkOzJzfiBcOkz9WrXEMNt9py7w/QriiUEhWdVim5+GYl
         oNYLzRRYgjWZYYev+98Hpz+c7VOxxXWdwErfKirkGLaiOfoY7c7Toqiek1j1aM9FuYjR
         xmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690880168; x=1691484968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdYxZtsdohXkJiEqvE1Q59ExwQkgmM2r74atDceIuW4=;
        b=RGdsCkUBxUsUsCQcJTN87CEQms6SE+sPQ1G2Q/mahrRbnGPakvoKReADGSGt715PJ/
         qCO5e6tx7hqt3cvQv3dOaxHwyA5ydojIiIGXVh88ThdWiMn/6bK0xT8QIR5QBATbdYXr
         hVu8iVWWScYFHi7gDVWDO7navksuhaVuJbrauZvsxcrbjdWbeWJhUqZf7m3eqIe7/oQa
         ABZlg9N5Sa4lFdV4RL8nUbO+b0J8z7kARpKVQiVlHi+TSm06hpovmws72HyAoiBEhxmZ
         PLTod/8n0PNPOBA/MpTd0qOzxHvaxOGnNpkm9T4/SVIoRL7KpBi55Hl4yKnZ0S4Mtl9i
         PYdA==
X-Gm-Message-State: ABy/qLauhHu1Af1vkjEHCcrkIYo5ZziUNjcWC5fdw/JtejyQnEryW7MX
	G/SsU0v/bJEtmp88p+4qF9bvrA==
X-Google-Smtp-Source: APBJJlG/YdSyO9mZdobMpVoP2KrhKuvsBSBkyDxEF7tvWdeyE2ucJPc2rpUQPp8XKp43TrymC0aSMA==
X-Received: by 2002:a7b:c4c5:0:b0:3fe:f99:1ba with SMTP id g5-20020a7bc4c5000000b003fe0f9901bamr1969783wmk.2.1690880168420;
        Tue, 01 Aug 2023 01:56:08 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id l12-20020a7bc44c000000b003fe215e4492sm4763826wmi.4.2023.08.01.01.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 01:56:08 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 2/4] riscv: Improve flush_tlb_range() for hugetlb pages
Date: Tue,  1 Aug 2023 10:54:00 +0200
Message-Id: <20230801085402.1168351-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230801085402.1168351-1-alexghiti@rivosinc.com>
References: <20230801085402.1168351-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_015610_682672_3518CED9 
X-CRM114-Status: GOOD (  12.37  )
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

flush_tlb_range() uses a fixed stride of PAGE_SIZE and in its current form,
when a hugetlb mapping needs to be flushed, flush_tlb_range() flushes the
whole tlb: so set a stride of the size of the hugetlb mapping in order to
only flush the hugetlb mapping.

Note that THPs are directly handled by flush_pmd_tlb_range().

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/mm/tlbflush.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index fa03289853d8..d883df0dee4a 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -3,6 +3,7 @@
 #include <linux/mm.h>
 #include <linux/smp.h>
 #include <linux/sched.h>
+#include <linux/hugetlb.h>
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
 
@@ -147,7 +148,13 @@ void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		     unsigned long end)
 {
-	__flush_tlb_range(vma->vm_mm, start, end - start, PAGE_SIZE);
+	unsigned long stride_size;
+
+	stride_size = is_vm_hugetlb_page(vma) ?
+				huge_page_size(hstate_vma(vma)) :
+				PAGE_SIZE;
+
+	__flush_tlb_range(vma->vm_mm, start, end - start, stride_size);
 }
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
