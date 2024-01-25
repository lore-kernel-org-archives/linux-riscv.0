Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC643C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 15:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y3HQZMyoGEzFpso18lISZ2NW1HHXlD11YkHtgF6SXLE=; b=Y0Rodalow/R9GF
	W4jvodoJT2DNHqT2ScEccIm9DyOu7zXAbxMqOHz9qYjLCwT2+OvneJtC/y+ALclOJoZjVgFELOj55
	kxZJKr/zqJloH2Ihar95nM36qw97mAyoiU5f0bEk9MTVW8GHBfBTjz5TU95aMYYhGf3WIO7WN1WbK
	Od+GWux5sXm0M5Kn/fqcJEwu8c5Abo4wtWzXMGg4kWweFPEok2p7H+HcL85LJoft6KECovKYWDzJX
	BW1Jtu6VOtheHwtiB9Y3s16zdHSkTTRICrCgQjjXMEUq/MTONh8LNcmXxpge8U/x+E25BR7cESA+/
	k/0HTFhjWc71gFihlIpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT1Ne-00000000YM4-07El;
	Thu, 25 Jan 2024 15:11:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT1Na-00000000YLP-2YLK
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 15:10:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B4159CE339E;
	Thu, 25 Jan 2024 15:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3394CC433C7;
	Thu, 25 Jan 2024 15:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706195455;
	bh=aiagvA75HtW5poT6xWiLeVnkWkTmbI5Tbf6wRBi0vHw=;
	h=From:To:Cc:Subject:Date:From;
	b=Ij1pUEAQqNLvjJQFRqvQCVYs/CBS9MkCzvkpTxre4q0x05oixWvMoB4acBW5xjCxU
	 rWNbwMb04w6sj36leFQHmm9IYNesSR8Hs8/3EvGy7ZWf61z0/i/7NcJZSGXlvUFlpZ
	 EM52ul/U0h7BqugeRktj6OFfeflFxBN/4oqNrBAjFMQcibapWIdttHHPl9IVz+TPO/
	 bAOXsB2FescT/oFQWxOZ5Ee7U9ZUgTHFqOes+UrO+2XFBRocCW2RUxHt9P3SkTJkYy
	 1rr5HnEdhdU0OK/p8PbpvLFCSdnzuYMT25ou4uslnTTA7t8d7iQi1+Zfv1wRDeUQHp
	 QDOJ+f4e+y4aA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2] riscv: mm: implement pgprot_nx
Date: Thu, 25 Jan 2024 22:58:06 +0800
Message-ID: <20240125145806.933-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_071058_864462_52B06856 
X-CRM114-Status: UNSURE (   6.95  )
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

commit cca98e9f8b5e ("mm: enforce that vmap can't map pages
executable") enforces the W^X protection by not allowing remapping
existing pages as executable. Add riscv bits so that riscv can benefit
the same protection.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
since v1:
 - rebase on v6.8-rc1
 - collect Reviewed-by and Tested-by tag

 arch/riscv/include/asm/pgtable.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 0c94260b5d0c..c931863bbd1a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -591,6 +591,12 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 	return ptep_test_and_clear_young(vma, address, ptep);
 }
 
+#define pgprot_nx pgprot_nx
+static inline pgprot_t pgprot_nx(pgprot_t _prot)
+{
+	return __pgprot(pgprot_val(_prot) & ~_PAGE_EXEC);
+}
+
 #define pgprot_noncached pgprot_noncached
 static inline pgprot_t pgprot_noncached(pgprot_t _prot)
 {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
