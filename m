Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B76C25B77
	for <linux-riscv@archiver.kernel.org>; Sat, 18 May 2024 07:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uThxxk/biqZ2vBfXFl92COnuWTlJ7KukeubdzcFgBog=; b=KxsutGALznyZBz
	3z+iGNDuP3fKDB8lQ3IZu0YU8rkJPrzwSS9VbbOifIhp1uURNsnu1pKziXM/8GAMKc90Y1YfilohC
	IVJYAoJYmhEExTadCqCLQITvDU0Htn4Pyi8HD4vWTgpqLS0Iusn3ZrlZs4jk81YyLexvHZ3e+NIRV
	W8ady0YDcJLz70c2jVyWq6Xrrsmi5D5o0Gx7M/x1IcAp57iTPAl3z+d3uwRovYd/gsSY8rdKL4yFi
	k5RrWSRRH0YOR8LODMbP2wwPnhAa70r9wNhXEPLtOj1VafbgPj7p6lesYFq9cjtJBDaGVdgFBTguf
	zQp4k5n3HzPWYsBRRt6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8ErD-00000009ix5-3A2G;
	Sat, 18 May 2024 07:51:55 +0000
Received: from out0-206.mail.aliyun.com ([140.205.0.206])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8Er9-00000009isL-1YID
	for linux-riscv@lists.infradead.org;
	Sat, 18 May 2024 07:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1716018695; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=GQ8XlBmX7iG6Cx7KU2H5vSERCOEK8rIAF03pf3vdLkg=;
	b=0dcyiLFC2zql6jJtan25xhQ+Z/jI7/b/bYg5dlrsMst1A9CP+QcuCju/vmSQU29Y2k3iAszzCFfsB3KUocgJMNOHM3GrJ69Rl0ti5xZOC27rLl4/cg3qb7YLpOT0qJW4kou9YRplkXunPkg/aVKxE3vpYDfLur2yu7zz2TZjfzM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067116;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.Xg9HuaJ_1716018692;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.Xg9HuaJ_1716018692)
          by smtp.aliyun-inc.com;
          Sat, 18 May 2024 15:51:33 +0800
From: "Bang Li" <libang.li@antgroup.com>
To: akpm@linux-foundation.org,
	chenhuacai@kernel.org,
	tsbogend@alpha.franken.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com
Cc: <linux-kernel@vger.kernel.org>,
   <linux-mm@kvack.org>,
   <loongarch@lists.linux.dev>,
   <linux-riscv@lists.infradead.org>,
   <david@redhat.com>,
   <ryan.roberts@arm.com>,
   <ioworker0@gmail.com>,
   <libang.linux@gmail.com>,
  "Bang Li" <libang.li@antgroup.com>
Subject: [PATCH v3 0/3] Add update_mmu_tlb_range() to simplify code
Date: Sat, 18 May 2024 15:49:11 +0800
Message-Id: <20240518074914.52170-1-libang.li@antgroup.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_005151_571112_FE051153 
X-CRM114-Status: UNSURE (   6.33  )
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

This series of commits mainly adds the update_mmu_tlb_range() to
batch update tlb in an address range and refactor the update_mmu_tlb().

After the commit 19eaf44954df ("mm: thp: support allocation of anonymous
multi-size THP"), We may need to batch update tlb of a certain address
range by calling update_mmu_tlb() in a loop. Using the
update_mmu_tlb_range(), we can simplify the code and possibly reduce the
execution of some unnecessary code in some architectures.

Thanks,
Bang

Changes since v2 [2]:
 - Use generic architecture to implement update_mmu_tlb() (per Ryan)

Changes since v1 [1]:
 - Add __HAVE_ARCH_UPDATE_MMU_TLB_RANGE macro (per Lance Yang)

[1] https://lore.kernel.org/linux-mm/20240429103346.59115-1-libang.li@antgroup.com/
[2] https://lore.kernel.org/linux-mm/20240506155120.83105-1-libang.li@antgroup.com/

Bang Li (3):
  mm: Add update_mmu_tlb_range()
  mm: Refactor update_mmu_tlb()
  mm: Use update_mmu_tlb_range() to simplify code

 arch/loongarch/include/asm/pgtable.h |  4 ++--
 arch/mips/include/asm/pgtable.h      |  4 ++--
 arch/riscv/include/asm/pgtable.h     |  4 ++--
 arch/xtensa/include/asm/pgtable.h    |  6 +++---
 arch/xtensa/mm/tlb.c                 |  6 +++---
 include/linux/pgtable.h              | 11 ++++++++---
 mm/memory.c                          |  4 +---
 7 files changed, 21 insertions(+), 18 deletions(-)

-- 
2.19.1.6.gb485710b


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
