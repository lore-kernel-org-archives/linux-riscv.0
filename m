Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27A3ECD999
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 20:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nOnr6/WpzOj9oePmIQoOtV0M57RjrB36zxsXLnGP+/4=; b=m7s5zA8vrAHRYs
	SohM6HbS398pGvgbm77nrSe7tmXAmmM/eLwdo0YMOewzo86DhIyH6/xEHaAsw+WAlGoepM3IabGkX
	ZuXukJshyRALlxRDtjYsu4gAqFRo6fw5qr5SOheiCqfcxm6rsGkbyO76hTlmQnbdhUDGoRdtcHGCc
	0n0pY8xybL7XCA+iBbxhwF5oRu5pdRxe7Ut/VK7rhihTV6pXp3zZ9hlT0utGX08NJJVaA3z9+9inQ
	+ltyPhoyt8jrLaPMzhUy+UyBGOmYh//Mv2nQJs5koJlvI1h4t8qd1LoRlUYAUZNo3DgLOzJ07NspM
	ShhIqFHETro2Yv5aPsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo60o-0000000ATXZ-3hFi;
	Thu, 05 Feb 2026 20:31:38 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo60m-0000000ATXC-2Uck
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 20:31:37 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2b6a868ad45so150768eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 12:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1770323493; x=1770928293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HzClJnGlt44P2yPmX0JZiLGOhhHGcwbrHUAf8MpuC/U=;
        b=U4TokL+9hrlmiW+GBI59AYBASWtJ0wfhcudwlNqrPuurQCKDuJ7ixsC1QUfs4RaU/Z
         qptF94VZkyPgjRPl9AvmtRMG3ajRk5aNVrJfnYyBF8n8n9PAEI1H/B7NifQy1C1q7Bvt
         0b07Zn2OYehhMXFc1l2hrWr/JHvYqB2qRbrcJyPFdQ6aFDfy5AIyO6NzuGwNP2N6BNK5
         g2ZDyrXpzT8CuUgMqfFbZJanJliQlKNIk7A+fFcEPWk95TqleZNuswXeD8sV8JJrQskv
         XooWotI/qEYze9BLL1ByU+30sMVjivdaxzQhbLvhilyXrkBQm/YM5lXGH1ONGhMh41lZ
         dRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770323493; x=1770928293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzClJnGlt44P2yPmX0JZiLGOhhHGcwbrHUAf8MpuC/U=;
        b=oE/ugkNApwudwxvoNRtg/dSoXm9yei0Km2eei8yLhgjW3BlwMScyNqOAJhdZ9dDgYN
         i5+wYmZXjBeEXf0WdMSqUry+C8YhM008jJK/LkcxBn/wycl1t+57lv8DpyEFkKQf0UCo
         +O4ZAhEbqewiAGOQm5l7GMF+T31Awji4qpS6M4tIimHPW3OfAqWb1MuZLFDHwAoqhG2Y
         lAynArVcCuMe3u2zPtf7BmTBUAItWgsQXmsArVqH5S9De6QjbyiA/HIA11T2uhr0WBDb
         kfqMWPLHQivPqRn+UoVs7NoH/Vc2H4iclrkbjOhXu/LjnJR1kcAMXO2eKfpHIkWHjhvw
         BUkw==
X-Forwarded-Encrypted: i=1; AJvYcCVD4MYJc16t1J1V1bakrjB+nXS6KBkoGJ8r9HePjn/HY60hOMUCu0nyet2lt2C7kG5kSgiK5rbdU6GeLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxgOzdN+wEe/c9xwKx4TVN+s5JQ5ftkB8408ite56JCv4CRyE8
	AjDogPTBc9znPKdzJADlUtNxJ/Wzp4bXg80zCIHdFN9DYb6Mx7n12VbS05l+zhlcxCM=
X-Gm-Gg: AZuq6aLupB4AVmvu7aouZDbUINMqstGkGts7DTutELAhV/FJztQCOraPgG+BlJ7Eqfx
	ifzdqXSdIwBDP6T58GfitVqUXOZ6V+eharZWblNhjMo7i6maG5bVCDmGNuU/TX9h60Qnbq+pVNN
	mhI4gtuTNcALrd+GtDqytWipZgwU5wVr0ANZ7bsY65akSK8sp3eVammrf0cug02mRzgfI5P4og8
	3m9O/1Cc5JUyeYAS97Y0d95XXE213uTKUBapKbBVQDaCgxc1mX7eSDlmJUUiln59Fh2vqJaMg7H
	M8CTga2I9AOLw7uPMY0ZZ0kOQ+02xjGUYXHFYwAudMG6rwWLNwZMwNEwt91hjSPHp9tXnyGo/ej
	eWAMwqDVf301ZUAFQZyszlcKdVo/wZlOBQSLwk85aE0WyiWtDEG9p8qGh2brz4Z2z0Z7Mle6sb0
	4VvMNs/+/V0hXoIj1K/8aN1Udz7K23WWE=
X-Received: by 2002:a05:7022:525:b0:11b:862d:8031 with SMTP id a92af1059eb24-12703e57c21mr139517c88.0.1770323492651;
        Thu, 05 Feb 2026 12:31:32 -0800 (PST)
Received: from telecaster.lan ([2620:10d:c090:400::5:5887])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855ad9a42sm401177eec.1.2026.02.05.12.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 12:31:32 -0800 (PST)
From: Omar Sandoval <osandov@osandov.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: linux-debuggers@vger.kernel.org,
	kernel-team@fb.com
Subject: [PATCH] riscv: fix vmemmap and vmalloc offsets in /proc/kcore
Date: Thu,  5 Feb 2026 12:31:20 -0800
Message-ID: <5273041dacfde780bbc917660537783c354e0598.1770323325.git.osandov@fb.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_123136_777844_C183F768 
X-CRM114-Status: UNSURE (   9.74  )
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

From: Omar Sandoval <osandov@fb.com>

kc_vaddr_to_offset() maps a kernel virtual address to its file offset in
/proc/kcore. The default definition is (address - PAGE_OFFSET). However, on
RISC-V, the vmemmap and vmalloc regions are below PAGE_OFFSET, so the computed
offsets for those regions are negative and wrap around to a large u64:

  # readelf -l /proc/kcore
  ...
  Program Headers:
    Type           Offset             VirtAddr           PhysAddr
                   FileSiz            MemSiz              Flags  Align
  ...
    LOAD           0xffc0000000002000 0xff20000000000000 0xffffffffffffffff
                   0x0040000000000000 0x0040000000000000  RWE    0x1000
  ...

When userspace applications like drgn attempt to read from that offset, it
overflows an loff_t and results in EINVAL.

Fix it by defining an alternate kc_vaddr_to_offset() that masks off the
high bits, which is what x86-64 does, too.

Fixes: 07037db5d479 ("RISC-V: Paging and MMU")
Cc: stable@vger.kernel.org
Signed-off-by: Omar Sandoval <osandov@fb.com>
---
Based on Linus' tree as of 8fdb05de0e2db89d8f56144c60ab784812e8c3b7.

This method doesn't work for riscv32 since VA_BITS == BITS_PER_LONG
there. But, I think riscv32 can get away with the wrapped 32-bit
integers as long as userspace is using _FILE_OFFSET_BITS=64. I don't
have a riscv32 userspace environment available to test it.

Thanks,
Omar

 arch/riscv/include/asm/pgtable-64.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 6e789fa58514..a52d60dd80fc 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -403,4 +403,7 @@ static inline pte_t pmd_pte(pmd_t pmd);
 static inline pte_t pud_pte(pud_t pud);
 #endif
 
+#define kc_vaddr_to_offset(v) ((v) & ((1UL << VA_BITS) - 1))
+#define kc_offset_to_vaddr(o) ((o) | ~((1UL << VA_BITS) - 1))
+
 #endif /* _ASM_RISCV_PGTABLE_64_H */
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
