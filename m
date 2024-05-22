Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491B0C25B77
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 06:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K0fqJRq2adLYNTD/BusRobhg56XQwv/YuAp1J4k17KQ=; b=r3ZGxT1DvisvcN
	7zjwOz8pI4OB1SYy7V7dOX7leLiuXZrKcbktXF6tF151zzRqEshFor+ZYaK5zu0jxv4x2231VFWXE
	nY+x1VY8QL0kD4gHzjbAXil9LVv9OvA4wm1oYpeIB41GQfqjarZz5Bu40WUxh7uYyHgM4sqScICAj
	jdbY61V90GKktUtkazvgPW6Lk7mRSL4oLOhpE0ULOuPsqsg4Ez2TienzzqbqE88uq5BNAtzlvI+5/
	BACJuC2Qnt65vgF0Xd6yM/RZREonf8iajyGNS+at5vEy45JAKIkjYjIwcCSuRZ0dbTiu3VgFq9gTe
	n0VaZfOP6xc/fbtz0DKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9fEE-000000025dj-0qIK;
	Wed, 22 May 2024 06:13:34 +0000
Received: from out0-218.mail.aliyun.com ([140.205.0.218])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9fEA-000000025bl-2imF
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 06:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1716358405; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=50gKTtI5/VbfrYUWsIwxZn0QXyXPTk7AsRcof412llE=;
	b=edz2wt0mTZRpbCGEtpe4nfBL8LT2SWtu8q0XszPF3PkL2go/EFOQn8prTGZhEiAGO/7uNNGqEBVNF4fmo8paMhWM+0kaMq/CTRg1O3YY9aJLVCrT4lgMp04u3e5Pj6ADMCd0A7J6A5J7GnsRy9I2YRUaTm4FwK8CIwC6KYQlGVI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R261e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033068161075;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.Xjzgxvc_1716358399;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.Xjzgxvc_1716358399)
          by smtp.aliyun-inc.com;
          Wed, 22 May 2024 14:13:20 +0800
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
Subject: [PATCH v4 0/3] Add update_mmu_tlb_range() to simplify code
Date: Wed, 22 May 2024 14:12:01 +0800
Message-Id: <20240522061204.117421-1-libang.li@antgroup.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_231330_847993_62983D71 
X-CRM114-Status: UNSURE (   7.27  )
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
batch update tlb in an address range and implement update_mmu_tlb()
using update_mmu_tlb_range().

After the commit 19eaf44954df ("mm: thp: support allocation of anonymous
multi-size THP"), We may need to batch update tlb of a certain address
range by calling update_mmu_tlb() in a loop. Using the
update_mmu_tlb_range(), we can simplify the code and possibly reduce the
execution of some unnecessary code in some architectures.

Thanks,
Bang

Changes since v3 [3]:
 - Add acked-by from David Hildenbrand (patch #2 and patch #3) - thanks!
 - Add reviewed-by from Lance Yang (patch #3) - thanks!
 - Move the general architecture update_mmu_tlb_range() from patch #2 to
   patch #1 (per David)
 - Update patch #2 commit log (per David)

Changes since v2 [2]:
 - Use generic architecture to implement update_mmu_tlb() (per Ryan)

Changes since v1 [1]:
 - Add __HAVE_ARCH_UPDATE_MMU_TLB_RANGE macro (per Lance Yang)

[1] https://lore.kernel.org/linux-mm/20240429103346.59115-1-libang.li@antgroup.com/
[2] https://lore.kernel.org/linux-mm/20240506155120.83105-1-libang.li@antgroup.com/
[3] https://lore.kernel.org/linux-mm/20240518074914.52170-1-libang.li@antgroup.com/

Bang Li (3):
  mm: Add update_mmu_tlb_range()
  mm: implement update_mmu_tlb() using update_mmu_tlb_range()
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
