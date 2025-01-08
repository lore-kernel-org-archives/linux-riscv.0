Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9193E77188
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 07:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UqHevdfEId3dqwLB0+yoDNhfkh1jqqGdLa+MdeLUgr0=; b=HOYSk3AWBSVocv
	wanK8l89vsP12ZpE3AwW043jMAWd7At2CLSI/3xmjXu650zysiFpuQu3NwkbCsXtKEj6SktCCwgj5
	qArAQOlnhFzBmU/qpRB4vJsjYDYwot3K7Rmk1/6b48EL09uZ+SZEnCWUNTFWebLi4qkNiyQ8s63uF
	2jRvz+CyoUx7C9aA4by2ISmd6OHgAoXKSFYF05/tVAZkLcjLABZaRUYJHVk2T6wAPnxnwhXWAGXp9
	5xDEOadL4e19+D/jXbikR1blMyIlU5naCs8dduDuH8ZWz1iSfqqYvr7vEYbXGn0XkJyLYyV1IP/Vv
	s+f+lDv/onNSLdS1bafg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQ3N-00000007KYq-03tt;
	Wed, 08 Jan 2025 07:00:33 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQ28-00000007K0I-2zzR
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 06:59:18 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso19474860a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jan 2025 22:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319555; x=1736924355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+oUJziA+3SIeve9hH8p/SUshEWFM4XR7pFGccDfjKoA=;
        b=Hp2r2ZDb0iQZvl44i9hhpy7ywxgkloDPIJqkqoayluwJ5duknWGDJZnkSS6wJ3AR7b
         ZYImgJcOY04unRKcxHjM+eDu3zG7yPfSzQ1bp7ii2IKV1gX5eSssJ7Uf+EE98+ItJ5qA
         mG0ue4D9AxbUuuYYBj279HifhvjD4MhheSJyJT6ZyUppCW0HmyNKz+iN1IuNcHY3Va0B
         sLyyBQ5pqQqmwSpK81a6JCkLwzLBv9btR9K+6YRRB4aeHtpLnGVRUG80N5Bv4eQRJoDq
         RS9rbq2CRpF85YjsuwzA9wlY1K0c4A8G7E8Xoi8ICECNjbFBN7dWjH1RAEpjvYK6Houe
         xIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319555; x=1736924355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oUJziA+3SIeve9hH8p/SUshEWFM4XR7pFGccDfjKoA=;
        b=vf3fdSpLCM3wyO83Z8tRYzJ90LoguDjsVWoYQtFh/THpwL2OPxst1b6LmMS7cTr7BC
         Awc7MOSLp/mXXdumcRYJmqdE9wB1oya5JGycAlO+6sIpeSf3pzbnHQudT1VNTei3k5OY
         Nrqgx5TkkOIXdaaAb93PBkFfeyDvsl311uxFx/tp8nezc9UAmcMrXI9rJ518f8J+adiq
         0RvajkP7uOfI5tw9iwz90fPyvOE9eDE4DqgAf70j9lPly0xvpd3vrx5P2iZysSn9+k9S
         lc2gZLNu+91YQPl4ZLkhKlg/KVRWV34OF7NO2qSKO4ks331gqiuC6hNQHHpN0sqsTu7U
         ktLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFBXCTAjvotRv9DTKWEt7548p8jafvJjyIyuJn6s37CTHziNM0culOIV1gsfCwXoV0Bk8LuAPNBwe99w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz78mvedYSzPyDhCNGcP+jNY+x27QRPWWuQnLK5Tgl5MQgrfaF+
	lhm+Zlcok6kbA1he6Lm7TMUpXapny6MdHYoF0TGquCMP0Sa39bfrpM8fN+G987w=
X-Gm-Gg: ASbGnctMWhn0e8s1b8/q6h01zhMohiyGRLtEsf7pOef1nKWk0QT23w/0lssSx97V9pt
	X8au4p1GZFr/PIAcE9gZj5fkXNhcJRYPAJN7AgBfdr1TtqovA6dYZ6aiCv3YGkWdV2Ez6Kka13E
	TDa4eMlnzPiVpfTe6AcJHJxK9Isqk+L/rl4cMdWetnITLq9JRnhN2xc0ykxnwCWrNEEfwOjyNXu
	0uKfGBzkQWFkqxITBMxct9LxvX2t4sQTsmyvKNUUYbByDx7xwHTAXUfHhC3IEt0IhOeH1zvmUUM
	2dWoUDH3QB1A8HbvkVL3f/R1nLI=
X-Google-Smtp-Source: AGHT+IF0KICf2IpNdbhCgJ/4FLwWodDPqZ+kJ6jQ+m3hTC2SCt6RG6Dd8PQChw/e3cG7DLZH3PR19A==
X-Received: by 2002:a17:90b:4d05:b0:2ee:f80c:6884 with SMTP id 98e67ed59e1d1-2f548f426ccmr2612187a91.33.1736319554907;
        Tue, 07 Jan 2025 22:59:14 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.22.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 22:59:14 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v5 00/17] move pagetable_*_dtor() to __tlb_remove_table()
Date: Wed,  8 Jan 2025 14:57:16 +0800
Message-Id: <cover.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_225916_771130_04B36A77 
X-CRM114-Status: GOOD (  18.17  )
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

Changes in v5:
 - cancel the move of p4d_free_tlb()'s location in [PATCH v4 06/15]
   (Alexander Gordeev)
 - fix the missing pagetable_dtor() in [PATCH v4 08/15] (Kevin Brodsky)
 - change the subject and description in [PATCH v4 12/15]
   (Alexander Gordeev)
 - remove the redundant __HAVE_ARCH_TLB_REMOVE_TABLE definition in [PATCH v4 13/15]
   (Andreas Larsson)
 - add "mm: pgtable: completely move pagetable_dtor() to generic tlb_remove_table()"
   (Kevin Brodsky)
 - add "x86: pgtable: convert __tlb_remove_table() to use struct ptdesc"
 - collect Acked-bys and Reviewed-bys

Changes in v4:
 - remove [PATCH v3 15/17] and [PATCH v3 16/17] (Mike Rapoport)
   (the tlb_remove_page_ptdesc() and tlb_remove_ptdesc() are intermediate
    products of the project: https://kernelnewbies.org/MatthewWilcox/Memdescs,
    so keep them)
 - collect Acked-by

Changes in v3:
 - take patch #5 and #6 from Kevin Brodsky's patch series below.
   Link: https://lore.kernel.org/lkml/20241219164425.2277022-1-kevin.brodsky@arm.com/
 - separate the statistics part from [PATCH v2 02/15] as [PATCH v3 04/17], and
   replace the rest part with Kevin Brodsky's patch #6
   (Alexander Gordeev and Kevin Brodsky)
 - change the commit message of [PATCH v2 10/15] and [PATCH v2 11/15]
   (Alexander Gordeev)
 - fix the bug introduced by [PATCH v2 11/15]
   (Peter Zijlstra)
 - rebase onto the next-20241220

Changes in v2:
 - add [PATCH v2 13|14|15/15] (suggested by Peter Zijlstra)
 - add Originally-bys and Suggested-bys
 - rebase onto the next-20241218

Hi all,

As proposed [1] by Peter Zijlstra below, this patch series aims to move
pagetable_*_dtor() into __tlb_remove_table(). This will cleanup pagetable_*_dtor()
a bit and more gracefully fix the UAF issue [2] reported by syzbot.

```
Notably:

 - s390 pud isn't calling the existing pagetable_pud_[cd]tor()
 - none of the p4d things have pagetable_p4d_[cd]tor() (x86,arm64,s390,riscv)
   and they have inconsistent accounting
 - while much of the _ctor calls are in generic code, many of the _dtor
   calls are in arch code for hysterial raisins, this could easily be
   fixed
 - if we fix ptlock_free() to handle NULL, then all the _dtor()
   functions can use it, and we can observe they're all identical
   and can be folded

after all that cleanup, you can move the _dtor from *_free_tlb() into
tlb_remove_table() -- which for the above case, would then have it
called from __tlb_remove_table_free().
```

And hi Andrew, I developed the code based on the latest linux-next, so I reverted
the "mm: pgtable: make ptlock be freed by RCU" first. Once the review of this
patch series is completed, the "mm: pgtable: make ptlock be freed by RCU" can be
dropped directly from mm tree, and this revert patch will not be needed.

This series is based on next-20241220. And I tested this patch series on x86 and
only cross-compiled it on arm, arm64, powerpc, riscv, s390 and sparc.

Comments and suggestions are welcome!

Thanks,
Qi

[1]. https://lore.kernel.org/all/20241211133433.GC12500@noisy.programming.kicks-ass.net/
[2]. https://lore.kernel.org/all/67548279.050a0220.a30f1.015b.GAE@google.com/

Kevin Brodsky (2):
  riscv: mm: Skip pgtable level check in {pud,p4d}_alloc_one
  asm-generic: pgalloc: Provide generic p4d_{alloc_one,free}

Qi Zheng (15):
  Revert "mm: pgtable: make ptlock be freed by RCU"
  mm: pgtable: add statistics for P4D level page table
  arm64: pgtable: use mmu gather to free p4d level page table
  s390: pgtable: add statistics for PUD and P4D level page table
  mm: pgtable: introduce pagetable_dtor()
  arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
  arm64: pgtable: move pagetable_dtor() to __tlb_remove_table()
  riscv: pgtable: move pagetable_dtor() to __tlb_remove_table()
  x86: pgtable: convert __tlb_remove_table() to use struct ptdesc
  x86: pgtable: move pagetable_dtor() to __tlb_remove_table()
  s390: pgtable: consolidate PxD and PTE TLB free paths
  mm: pgtable: introduce generic __tlb_remove_table()
  mm: pgtable: completely move pagetable_dtor() to generic
    tlb_remove_table()
  mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
  mm: pgtable: introduce generic pagetable_dtor_free()

 Documentation/mm/split_page_table_lock.rst |  4 +-
 arch/arm/include/asm/tlb.h                 | 10 ----
 arch/arm64/include/asm/pgalloc.h           | 18 ------
 arch/arm64/include/asm/tlb.h               | 21 ++++---
 arch/csky/include/asm/pgalloc.h            |  2 +-
 arch/hexagon/include/asm/pgalloc.h         |  2 +-
 arch/loongarch/include/asm/pgalloc.h       |  2 +-
 arch/m68k/include/asm/mcf_pgalloc.h        |  4 +-
 arch/m68k/include/asm/sun3_pgalloc.h       |  2 +-
 arch/m68k/mm/motorola.c                    |  2 +-
 arch/mips/include/asm/pgalloc.h            |  2 +-
 arch/nios2/include/asm/pgalloc.h           |  2 +-
 arch/openrisc/include/asm/pgalloc.h        |  2 +-
 arch/powerpc/include/asm/tlb.h             |  1 +
 arch/powerpc/mm/book3s64/mmu_context.c     |  2 +-
 arch/powerpc/mm/book3s64/pgtable.c         |  2 +-
 arch/powerpc/mm/pgtable-frag.c             |  4 +-
 arch/riscv/include/asm/pgalloc.h           | 69 +++++-----------------
 arch/riscv/include/asm/tlb.h               | 18 ------
 arch/riscv/mm/init.c                       |  4 +-
 arch/s390/include/asm/pgalloc.h            | 31 +++++++---
 arch/s390/include/asm/tlb.h                | 10 ++--
 arch/s390/mm/pgalloc.c                     | 23 +-------
 arch/sh/include/asm/pgalloc.h              |  2 +-
 arch/sparc/include/asm/tlb_64.h            |  1 +
 arch/sparc/mm/init_64.c                    |  2 +-
 arch/sparc/mm/srmmu.c                      |  2 +-
 arch/um/include/asm/pgalloc.h              |  6 +-
 arch/x86/include/asm/pgalloc.h             | 18 ------
 arch/x86/include/asm/tlb.h                 | 33 -----------
 arch/x86/kernel/paravirt.c                 |  5 +-
 arch/x86/mm/pgtable.c                      | 23 ++++----
 include/asm-generic/pgalloc.h              | 55 +++++++++++++++--
 include/asm-generic/tlb.h                  | 24 ++++++--
 include/linux/mm.h                         | 50 ++++++----------
 include/linux/mm_types.h                   |  9 +--
 mm/memory.c                                | 23 +++-----
 mm/mmu_gather.c                            | 20 ++++++-
 38 files changed, 211 insertions(+), 299 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
