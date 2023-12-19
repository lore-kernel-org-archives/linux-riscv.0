Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3565AC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 18:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FYGwb4dCsujtGr5dt5LcIPuWv9AsjJn7LVUXs/ihVK0=; b=ohRpyikwp4gtPm
	NiX2kaFY86unWVYI2nshWT209xAv934IHpbPg+O57syGCZuEhUfeSMcl44SR6ep3/VQJ/hPvLv8Kx
	ek/phW5ziaSMe6gJERHiRNnNJRv3/7Wwjq3vtPVwLjcWgQ7OPXyVhTJnUlve5FotCz0/BZo4Ptqes
	eDqqQpYFM7bV1IfT1TR9v49f1/5Srkm4G6wfjKNhx7PZW3cyvgQDMW68HneSPqWb5rqG/31ET0XWD
	GPRQlVR45dnAmIo8pQr8qwoTZqtaTrj+v9o/ooZ/Jgt6CxnjoZRMR7cBf+r45/yr0P24HQqzJSxzi
	2+/77YZivLP4WL9XgLkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeRE-00F6ut-2D;
	Tue, 19 Dec 2023 18:03:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeRB-00F6sk-2n
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 18:03:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 33F18CE1AA3;
	Tue, 19 Dec 2023 18:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 248D2C433C7;
	Tue, 19 Dec 2023 18:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703009002;
	bh=UL2kffNuUbkPlnJBN+qpCzpP5kui14dRs7DZfONdDT0=;
	h=From:To:Cc:Subject:Date:From;
	b=Tx6P/DJjFhfS2hJiQefr5BQzr7JnNvODIRRy7UQlV7ksSfFMQfUEGi2O7ZYHnX46p
	 7zZWYPi/ssCCH0Z/Xb/HvTsstn+U5ywq4poEVpAPlmY6tUmyi39QY7UPJV0EdHJBJK
	 h0auiil7imG1WcV2nDuuziUeVKwCTF7BrLxBlSrcxkeJBHc6uElnSju2pnjNw0TYZp
	 I7zsC2VlkFB6MNWsigTWEybThY55+MS4U5/x/cM3+JUt6CUBm0K1KrUnhmeG94M1Ft
	 SCXWVZSV2TaN4upbjHB+1U/m0Kt3CkLh+nuKeRkxaQ0T4ePmCHdLqAh0Us6nZH2L+K
	 ncYMPB83i9ceg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 0/4] riscv: support fast gup
Date: Wed, 20 Dec 2023 01:50:42 +0800
Message-Id: <20231219175046.2496-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_100326_153928_F85753A7 
X-CRM114-Status: UNSURE (   9.96  )
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

This series adds fast gup support to riscv.

The First patch fixes a bug in __p*d_free_tlb(). Per the riscv
privileged spec, if non-leaf PTEs I.E pmd, pud or p4d is modified, a
sfence.vma is a must.

The 2nd patch is a preparation patch.

The last two patches do the real work:
In order to implement fast gup we need to ensure that the page
table walker is protected from page table pages being freed from
under it.

riscv situation is more complicated than other architectures: some
riscv platforms may use IPI to perform TLB shootdown, for example,
those platforms which support AIA, usually the riscv_ipi_for_rfence is
true on these platforms; some riscv platforms may rely on the SBI to
perform TLB shootdown, usually the riscv_ipi_for_rfence is false on
these platforms. To keep software pagetable walkers safe in this case
we switch to RCU based table free (MMU_GATHER_RCU_TABLE_FREE). See the
comment below 'ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE' in
include/asm-generic/tlb.h for more details.

This patch enables MMU_GATHER_RCU_TABLE_FREE, then use

*tlb_remove_page_ptdesc() for those platforms which use IPI to perform
TLB shootdown;

*tlb_remove_ptdesc() for those platforms which use SBI to perform TLB
shootdown;

Both case mean that disabling interrupts will block the free and
protect the fast gup page walker.

So after the 3rd patch, everything is well prepared, let's select
HAVE_FAST_GUP if MMU.

Jisheng Zhang (4):
  riscv: tlb: fix __p*d_free_tlb()
  riscv: tlb: convert __p*d_free_tlb() to inline functions
  riscv: enable MMU_GATHER_RCU_TABLE_FREE for SMP && MMU
  riscv: enable HAVE_FAST_GUP if MMU

 arch/riscv/Kconfig               |  2 ++
 arch/riscv/include/asm/pgalloc.h | 53 +++++++++++++++++++++++++++-----
 arch/riscv/include/asm/pgtable.h |  6 ++++
 arch/riscv/include/asm/tlb.h     | 18 +++++++++++
 4 files changed, 71 insertions(+), 8 deletions(-)

-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
