Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6CCC25B5F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 May 2024 15:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WZT093MJuvSEd80kDOXv5ozkP71DmxfkoslSZyIqVME=; b=dIYkFADuRL72Ry
	Hdif0S3RYj+PodUtnuNMt1M0pb91bQGUwt5Row4xy1M4/AF/G1cPK90qglE+FZgLmMN7RvOIguSYC
	YPpEbP9DNv3tpZ6f7K8jZPGttD96Ag55TSAhL+PsmzSFjUFdiSovp4+cw1aBt3OSlevU/67U687Ur
	gupLtqalhG1HYF4p1R8LmCYQADNiNE5VCTys4oUl0QzcwJc2dhPgdLKrOzZAGk3SPPhBfk0Yvtr1k
	K731vaxrUuMRWwidDfZ0tqFKLZXEyDP38fAGnjaw3i43Xl8XMSG3USrR08bzxMS+dP0Yjrznsrst9
	ji81gK9NUnJ4QYTgqbFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s40dW-00000007w9I-0WrS;
	Mon, 06 May 2024 15:52:18 +0000
Received: from out0-196.mail.aliyun.com ([140.205.0.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s40dP-00000007w06-21mH
	for linux-riscv@lists.infradead.org;
	Mon, 06 May 2024 15:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1715010723; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=j6/KtEs6TFeoK8UWIq9uFemS/8A9ve6yI0uusmjA3lY=;
	b=k4qVmTjizJ5w6IMTzG7bZuZi8CN77NVk7iXSrHCwJVy/lWLFVvtL0KnpuQciezugxczmuj1yF10/7LzrNF/RQTaiLL3NJhsQmvw4WYDgVkUNC5pqTrTAG0PJh0WMLwKJ/GHBgzTdXEEFzamoi4tb0wn0KA4+Z4YYumqahxRmHyI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R581e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047204;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.XThas7i_1715010719;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XThas7i_1715010719)
          by smtp.aliyun-inc.com;
          Mon, 06 May 2024 23:52:00 +0800
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
Subject: [PATCH v2 0/5] Add update_mmu_tlb_range() to simplify code
Date: Mon, 06 May 2024 23:51:15 +0800
Message-Id: <20240506155120.83105-1-libang.li@antgroup.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_085211_822516_9ED60D99 
X-CRM114-Status: UNSURE (   6.26  )
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
batch update tlb in an address range.

After the commit 19eaf44954df ("mm: thp: support allocation of anonymous
multi-size THP"), We may need to batch update tlb of a certain address
range by calling update_mmu_tlb() in a loop. Using the
update_mmu_tlb_range(), we can simplify the code and possibly reduce the
execution of some unnecessary code in some architectures.

Thanks,
Bang

Changes since v1 [1]:
 - Add __HAVE_ARCH_UPDATE_MMU_TLB_RANGE macro (per Lance Yang)

[1] https://lore.kernel.org/linux-mm/20240429103346.59115-1-libang.li@antgroup.com/

Bang Li (5):
  LoongArch: Add update_mmu_tlb_range()
  mips: Add update_mmu_tlb_range()
  riscv: Add update_mmu_tlb_range()
  xtensa: Add update_mmu_tlb_range()
  mm: Add update_mmu_tlb_range()

 arch/loongarch/include/asm/pgtable.h | 4 ++++
 arch/mips/include/asm/pgtable.h      | 4 ++++
 arch/riscv/include/asm/pgtable.h     | 4 ++++
 arch/xtensa/include/asm/pgtable.h    | 4 ++++
 arch/xtensa/mm/tlb.c                 | 6 ++++++
 include/linux/pgtable.h              | 8 ++++++++
 mm/memory.c                          | 4 +---
 7 files changed, 31 insertions(+), 3 deletions(-)

-- 
2.19.1.6.gb485710b


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
