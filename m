Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B865CC10DC1
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 15:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M+q8LJ9IPAFCt3HU87TGdoZ0Kn47HyKAN7yN/ffWb7c=; b=4SKi5FFi93/coa
	Gw6VToCSOtHRCBl0GFAC/Krw1nXPCRb6cZ0Ncez0/RSsKW+FpFUNlD0dUcvaJPAxyRH2kTrhLCVI6
	u5LplcfKL3sK7nSMpzCTOEKNhm6f3s7Ggba//FhlBSnY99n+X3/3oM6TFwv43zjY13d9Zrvy4ALFD
	l2HpFRoXPd2aPQXIlFa89bBD4Ny13CY/ChBoGU6ddwAGiuNnJkQyH/4aSbiYJTQn/8azYHAqCEvPo
	IG276wP9Mgu/tsJZ+0OBmTUwUT3msTOYXcWNmm//Sp1Y0ZIwt587gw8RWsya4xfn6OxnRAgzh2G0c
	bbMawzJXsN68LsYkw/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBcV8-00Fqtr-1N;
	Fri, 08 Dec 2023 15:10:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBcV5-00Fqrg-2P
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 15:10:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6128B62486;
	Fri,  8 Dec 2023 15:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0427C433C9;
	Fri,  8 Dec 2023 15:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702048246;
	bh=HCvGsfz3Vdu/xFP3RmrxB/dHcXYV1Nvtry8yb2qqgWc=;
	h=From:To:Cc:Subject:Date:From;
	b=NGjLb6dCAeMjgRqiITyAjM8BpXvxxXmnQ7klcAIgJfgHOQOqZoizF0n1OQ27XFr7Y
	 GywSyKvoMwdu3vLwHMw8yxzdQnQALJIbcbe5yHV/5Zvdi6zI3hE2DUl3vDm9O/38ED
	 D0CLGQvEPTwwQDQCq2vvFPKa+sfYbAUnyY08d0c7UJPMghb3yYgeR7+UO/AS5tFDME
	 IdqTvz5bwvtbnCGca5msjARy4iSlfBIsAGloP0YLlEWgBXYR7Du7tuiBNAXl5h9OiE
	 +41pXxUqimy6zOi8NvUV9kuyqn72damP9IwFBTMAd2+eDdwGudz9y/wZNwdkZGEvki
	 3iqpExDEbNaqg==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	akpm@linux-foundation.org,
	alexghiti@rivosinc.com,
	catalin.marinas@arm.com,
	willy@infradead.org,
	david@redhat.com,
	muchun.song@linux.dev,
	will@kernel.org,
	peterz@infradead.org,
	rppt@kernel.org,
	paulmck@kernel.org,
	atishp@atishpatra.org,
	anup@brainfault.org,
	alex@ghiti.fr,
	mike.kravetz@oracle.com,
	dfustini@baylibre.com,
	wefu@redhat.com,
	jszhang@kernel.org,
	falcon@tinylab.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH] riscv: pgtable: Enhance set_pte to prevent OoO risk
Date: Fri,  8 Dec 2023 10:10:36 -0500
Message-Id: <20231208151036.2458921-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_071047_853195_0736E449 
X-CRM114-Status: GOOD (  11.70  )
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

From: Guo Ren <guoren@linux.alibaba.com>

When changing from an invalid pte to a valid one for a kernel page,
there is no need for tlb_flush. It's okay for the TSO memory model, but
there is an OoO risk for the Weak one. eg:

sd t0, (a0) // a0 = pte address, pteval is changed from invalid to valid
...
ld t1, (a1) // a1 = va of above pte

If the ld instruction is executed speculatively before the sd
instruction. Then it would bring an invalid entry into the TLB, and when
the ld instruction retired, a spurious page fault occurred. Because the
vmemmap has been ignored by vmalloc_fault, the spurious page fault would
cause kernel panic.

This patch was inspired by the commit: 7f0b1bf04511 ("arm64: Fix barriers
used for page table modifications"). For RISC-V, there is no requirement
in the spec to guarantee all tlb entries are valid and no requirement to
PTW filter out invalid entries. Of course, micro-arch could give a more
robust design, but here, use a software fence to guarantee.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/pgtable.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 294044429e8e..2fae5a5438e0 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -511,6 +511,13 @@ static inline int pte_same(pte_t pte_a, pte_t pte_b)
 static inline void set_pte(pte_t *ptep, pte_t pteval)
 {
 	*ptep = pteval;
+
+	/*
+	 * Only if the new pte is present and kernel, otherwise TLB
+	 * maintenance or update_mmu_cache() have the necessary barriers.
+	 */
+	if (pte_val(pteval) & (_PAGE_PRESENT | _PAGE_GLOBAL))
+		RISCV_FENCE(rw,rw);
 }
 
 void flush_icache_pte(pte_t pte);
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
