Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A07C61D85
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 06:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L+m0EYmJfyy+AQCYqKbJ2l6PN2EltmB2zEF8Rfu5oko=; b=chTKivtSWNz/nJ
	eF3z6Rc2470UIzeeKDK/lNAfxDRkKx3DV+BkAeYpy3iZx1LY8eyDjiHQLHF80UQnhQeRKMFsSIZxS
	W/YLW00JfsWrU0P4M4Wi3wxMtSCiQfz5ly+19oCiC35kBhPShPBHIFLTbn+lTm2HCtF6u/9OVjppx
	Gm7BAKlRHUlceRtBWkSaUdghfIXxhrlVcQh80PQRlMNC4LkzTZQsq9/PE3nbTlLwZIe/qPK/RoZVo
	+V4F9/7Nh+kK531s+QoKPYafFsOOe5y4QJMwlFLMDF7bH4VsNeazT7Lieaz31EQXYW5t5Fn8ZtIcW
	ihKUWsv5dZeboTNu2y7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r63eW-003xD5-2y;
	Thu, 23 Nov 2023 06:57:32 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r63eT-003xBR-2k
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 06:57:31 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6c10f098a27so490271b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 22:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700722645; x=1701327445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zo9GRhTooUc/KviZnnIa42NwX6MC9ytBHXrHIhQGMDg=;
        b=gs2OylNRJcCBxTjKoQ3Egi/nblx80GqXeTdxRHX9YqI5ZXMbjsK26vCjqys3Vius3x
         iYb0GyHEufnjxXrSpK/wC1pkw69ByzPQ3mJpu6GxMQqO54QUSQhtGu9NgayJVzNMFz6j
         zULXPkRBYi8lJS4DBejlHekPzjzJPeUSCwb5BJ26cCRqR4esRrwV9HQ0jXiOGKrQxwX2
         1rF8laeV0r8zAnK400wpRmMQI05u9a6H45sRLQdgNsaEdSHoWxBqz541zHsS8XGMhmLD
         sN6QGSsnpEErZgiaLvYrcPu/e1Yor2fPOVC4ZWzaowrNShUcKbu3h3qVucdeib5Ca4Ti
         E0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700722645; x=1701327445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zo9GRhTooUc/KviZnnIa42NwX6MC9ytBHXrHIhQGMDg=;
        b=LaZXD1cm2FCebgNvGogSc+RxCEqCPBCWSv+1NBHFN03TZ/omODI/enusdnimx2o5zi
         /zsv+cNTRQdFSxoZch/WXXlGdveRYjyhqcAWIkOsFG16O9AdjQ/qq40FTzX70/F3+FL2
         1CjTBp5wCEt5rYFkaIN1dNL2TtvdafhQfGAPXVGprrkmz4ZKeg8eT08Xk3+39UpLhpqL
         eyWF+hX4nbpFHleVeI7n52dDN/JlU/PCb4drh/moZBvD9+0Cj60jCM5JWgBmJEmHKl3d
         sLfazqGTskLthW48xJhVqqMr6E2s7koX79wrLdYTDHd252uv8jxGHFyBtv+xT+Gd60Q1
         LvFA==
X-Gm-Message-State: AOJu0YyiXdgbcTfO+8/ifNnfknaWC+TO13D9WYiA5eoPATrDBbXIiODC
	VG3OTmi18HzM+lRiE2MMtj3Egg==
X-Google-Smtp-Source: AGHT+IFC8CTJwQfCdcwwV65icXEzK+yHQwysBVFM0GjAc8siyhBsnU47kygIO6p8RgVConNr22R8sQ==
X-Received: by 2002:a05:6a00:1f08:b0:6cb:a431:2d75 with SMTP id be8-20020a056a001f0800b006cba4312d75mr5099452pfb.7.1700722645519;
        Wed, 22 Nov 2023 22:57:25 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([139.177.225.230])
        by smtp.gmail.com with ESMTPSA id w37-20020a634765000000b005bd2b3a03eesm615437pgk.6.2023.11.22.22.57.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 22:57:25 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: dengliang.1214@bytedance.com,
	xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	songmuchun@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH V1 00/11] riscv: Introduce 64K base page
Date: Thu, 23 Nov 2023 14:56:57 +0800
Message-Id: <20231123065708.91345-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_225729_893068_C56DFB1D 
X-CRM114-Status: GOOD (  19.19  )
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

Some existing architectures like ARM supports base page larger than 4K
as their MMU supports more page sizes. Thus, besides hugetlb page and
transparent huge page, there is another way for these architectures to
enjoy the benefits of fewer TLB misses without worrying about cost of
splitting and merging huge pages. However, on architectures with only
4K MMU, larger base page is unavailable now.

This patch series attempts to break through the limitation of MMU and
supports larger base page on RISC-V, which only supports 4K page size
now.

The key idea to implement larger base page based on 4K MMU is to
decouple the MMU page from the base page in view of kernel mm, which we
denote as software page. In contrary to software page, we denote the MMU
page as hardware page. Below is the difference between these two kinds
of pages.

1. Kernel memory management module manages, allocates and maps memory at
a granularity of software page, which should not be restricted by
MMU and can be larger than hardware page.

2. Architecture page table operations should be carried out from MMU's
perspective and page table entries are encoded at a granularity of
hardware page, which is 4K on RISC-V MMU now.

The main work to decouple these two kinds of pages lies in architecture
code. For example, we turn the pte_t struct to an array of page table
entries to match it with software page which can be larger than hardware
page, and adapt the page table operations accordingly. For 64K software
base page, the pte_t struct now contains 16 contiguous page table
entries which point to 16 contiguous 4K hardware pages.

To achieve the benefits of large base page, we applies Svnapot for each
base page's mapping. The Svnapot extension on RISC-V is like contiguous
PTE on ARM64. It allows ptes of a naturally aligned power-of 2 size
memory range be encoded in the same format to save the TLB space.

This patch series is the first version and is based on v6.7-rc1. This
version supports both bare metal and virtualization scenarios.

In the next versions, we will continue on the following works:

1. Reduce the memory usage of page table page as it only uses 4K space
while costs a whole base page.

2. When IMSIC interrupt file is smaller than 64K, extra isolation
measures for the interrupt file are needed. (S)PMP and IOPMP may be good
choices.

3. More consideration is needed to make this patch series collaborate
with folios better.

4. Support 64K base page on IOMMU.

5. The performance test is on schedule to verify the actual performance
improvement and the decrease in TLB miss rate.

Thanks in advance for comments.

Xu Lu (11):
  mm: Fix misused APIs on huge pte
  riscv: Introduce concept of hardware base page
  riscv: Adapt pte struct to gap between hw page and sw page
  riscv: Adapt pte operations to gap between hw page and sw page
  riscv: Decouple pmd operations and pte operations
  riscv: Distinguish pmd huge pte and napot huge pte
  riscv: Adapt satp operations to gap between hw page and sw page
  riscv: Apply Svnapot for base page mapping
  riscv: Adjust fix_btmap slots number to match variable page size
  riscv: kvm: Adapt kvm to gap between hw page and sw page
  riscv: Introduce 64K page size

 arch/Kconfig                        |   1 +
 arch/riscv/Kconfig                  |  28 +++
 arch/riscv/include/asm/fixmap.h     |   3 +-
 arch/riscv/include/asm/hugetlb.h    |  71 ++++++-
 arch/riscv/include/asm/page.h       |  16 +-
 arch/riscv/include/asm/pgalloc.h    |  21 ++-
 arch/riscv/include/asm/pgtable-32.h |   2 +-
 arch/riscv/include/asm/pgtable-64.h |  45 +++--
 arch/riscv/include/asm/pgtable.h    | 282 +++++++++++++++++++++++-----
 arch/riscv/kernel/efi.c             |   2 +-
 arch/riscv/kernel/head.S            |   4 +-
 arch/riscv/kernel/hibernate.c       |   3 +-
 arch/riscv/kvm/mmu.c                | 198 +++++++++++++------
 arch/riscv/mm/context.c             |   7 +-
 arch/riscv/mm/fault.c               |   1 +
 arch/riscv/mm/hugetlbpage.c         |  42 +++--
 arch/riscv/mm/init.c                |  25 +--
 arch/riscv/mm/kasan_init.c          |   7 +-
 arch/riscv/mm/pageattr.c            |   2 +-
 fs/proc/task_mmu.c                  |   2 +-
 include/asm-generic/hugetlb.h       |   7 +
 include/asm-generic/pgtable-nopmd.h |   1 +
 include/linux/pgtable.h             |   6 +
 mm/hugetlb.c                        |   2 +-
 mm/migrate.c                        |   5 +-
 mm/mprotect.c                       |   2 +-
 mm/rmap.c                           |  10 +-
 mm/vmalloc.c                        |   3 +-
 28 files changed, 616 insertions(+), 182 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
