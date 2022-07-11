Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E26ECCA483
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 03:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZpgyQabXlE/aqY8iloYNNY8WZv1SR+qWTaK6kgZ2kPY=; b=0mbZAyAwiyponh
	w7sKXoUgGoESkXBB8e2/Cy2d2zD6yVed6Qqu2+rLCgZ5g6gPWpmA1izZHBMBKFc5ZahElC34yk32x
	IM/J0pUs652jVFRGrLKvBGX65iZfGmsQ8FqKM5ZfVuVDsqUSE62vGz+wmHogfGpU2bsBjjaYdXCuV
	9zGbG0nbO+IMCoCTrQRhYDpNE/1ewNe4Kl8ZHkruPoe+qYPNTtJkyzCtSrAnCMP98iIl4K204Yy0N
	5G94DwE3+aIJ4OixE55T8cPqJGguwgCrmFiM3Twh4yzFmpHT3aHOn/ZgbE8+bIctrlDHHh1UPdNEc
	r/1WulkjtF9lBC9asv1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAkNn-00Fh2h-06; Mon, 11 Jul 2022 03:46:51 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAkNb-00FgyC-CQ; Mon, 11 Jul 2022 03:46:40 +0000
Received: by mail-pl1-x62f.google.com with SMTP id f11so3408763plr.4;
        Sun, 10 Jul 2022 20:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qmBhjPhdel7Ory0h+LtHmaoT8CpQHwHtjRSzAczsGS8=;
        b=UY5oZcsZHFdGH9KcetDN8dqr2Mf0qiwqMqlLdkQ+0PNZPPWK8nytWfBrVg68lCyEAN
         jrVXhCD+p/9vhueaNcEswnstaaqhbi96KvKB1URC0IEAGTbb7bQ3L2sJKv8fP4/q3fdz
         qnhDuiRe5eJunmVyfmUC7y6G6huMy6rKKY2vpo7MUN+GN+8Yg69bDGSpiExtmJG6nmwc
         HGrj6W5Zy4EILKOUdTTBtFEUayRpo9P6vRZIShjByCsnQmdWy7cHknQIBwTn6y+6JaHt
         7Jslc7TiuDWWVL3D1WVwoeXWF4xp0s+zIBfTFhbW89tgNx9jEYuB6VyOj7QkOyyjH+tF
         MEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qmBhjPhdel7Ory0h+LtHmaoT8CpQHwHtjRSzAczsGS8=;
        b=mISGc/OkHQxql9CBF8zRHXzPTSagM1qnQPUX3cX6d4tTQaDBg0oDWJxAJFdHK9fchX
         tBS4/yDqdVM1fW64mexU8xG6h7HXHkzOK5EntDo1vxRf2mM4NE30uP2QX6EcryR+uoS4
         cJ9FoKakg0u0nK+akUsrrWoGFcsTscKaTPTJ+9AhhW/Vu7FmPP8DPR/JTLJ4P6fOncGn
         2Ty2KWkFaJhMgcGWhrCG85inOKahYZoVRiqhNC8k2/3LjHIajwYuynaITiwuMNcl0KEF
         Gyydt1kNkx3E1zcOw1GAlHunzaHlcusIyRLUl8LPg8syf95pBw/8NYeGfiPdKeoVBWGp
         JVzQ==
X-Gm-Message-State: AJIora+pEP5Hue5Btg+sagmiysWXCBlWNYCIa4TNQIsPjwLGek+udIk/
	evKtoagibH+rGTkSy9SS57Q=
X-Google-Smtp-Source: AGRyM1uXqBxzEnWgTK+S6bqpqoqltGNYamS7CTaFawotYp6lLuQkplQPx4DboSyk03U1rFf9/7Vqqw==
X-Received: by 2002:a17:90b:1b48:b0:1ef:a90d:eae1 with SMTP id nv8-20020a17090b1b4800b001efa90deae1mr15050227pjb.68.1657511198328;
        Sun, 10 Jul 2022 20:46:38 -0700 (PDT)
Received: from localhost.localdomain (47-72-206-164.dsl.dyn.ihug.co.nz. [47.72.206.164])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902eccd00b001664d88aab3sm3447949plh.240.2022.07.10.20.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:46:37 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	darren@os.amperecomputing.com,
	yangyicong@hisilicon.com,
	huzhanyuan@oppo.com,
	lipeifeng@oppo.com,
	zhangshiming@oppo.com,
	guojian@oppo.com,
	realmz6@gmail.com,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Barry Song <21cnbao@gmail.com>
Subject: [PATCH v2 0/4] mm: arm64: bring up BATCHED_UNMAP_TLB_FLUSH
Date: Mon, 11 Jul 2022 15:46:11 +1200
Message-Id: <20220711034615.482895-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_204639_447078_D1D73AB5 
X-CRM114-Status: GOOD (  10.98  )
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

Though ARM64 has the hardware to do tlb shootdown, the hardware
broadcasting is not free.
A simplest micro benchmark shows even on snapdragon 888 with only
8 cores, the overhead for ptep_clear_flush is huge even for paging
out one page mapped by only one process:
5.36%  a.out    [kernel.kallsyms]  [k] ptep_clear_flush

While pages are mapped by multiple processes or HW has more CPUs,
the cost should become even higher due to the bad scalability of
tlb shootdown.

The same benchmark can result in 16.99% CPU consumption on ARM64
server with around 100 cores according to Yicong's test on patch
4/4.

This patchset leverages the existing BATCHED_UNMAP_TLB_FLUSH by
1. only send tlbi instructions in the first stage -
	arch_tlbbatch_add_mm()
2. wait for the completion of tlbi by dsb while doing tlbbatch
	sync in arch_tlbbatch_flush()
My testing on snapdragon shows the overhead of ptep_clear_flush
is removed by the patchset. The micro benchmark becomes 5% faster
even for one page mapped by single process on snapdragon 888.


-v2:
1. Collected Yicong's test result on kunpeng920 ARM64 server;
2. Removed the redundant vma parameter in arch_tlbbatch_add_mm()
   according to the comments of Peter Zijlstra and Dave Hansen
3. Added ARCH_HAS_MM_CPUMASK rather than checking if mm_cpumask
   is empty according to the comments of Nadav Amit

Thanks, Yicong, Peter, Dave and Nadav for your testing or reviewing
, and comments.

-v1:
https://lore.kernel.org/lkml/20220707125242.425242-1-21cnbao@gmail.com/

Barry Song (4):
  Revert "Documentation/features: mark BATCHED_UNMAP_TLB_FLUSH doesn't
    apply to ARM64"
  mm: rmap: Allow platforms without mm_cpumask to defer TLB flush
  mm: rmap: Extend tlbbatch APIs to fit new platforms
  arm64: support batched/deferred tlb shootdown during page reclamation

 Documentation/features/arch-support.txt       |  1 -
 .../features/vm/TLB/arch-support.txt          |  2 +-
 arch/arm/Kconfig                              |  1 +
 arch/arm64/Kconfig                            |  1 +
 arch/arm64/include/asm/tlbbatch.h             | 12 ++++++++++
 arch/arm64/include/asm/tlbflush.h             | 23 +++++++++++++++++--
 arch/loongarch/Kconfig                        |  1 +
 arch/mips/Kconfig                             |  1 +
 arch/openrisc/Kconfig                         |  1 +
 arch/powerpc/Kconfig                          |  1 +
 arch/riscv/Kconfig                            |  1 +
 arch/s390/Kconfig                             |  1 +
 arch/um/Kconfig                               |  1 +
 arch/x86/Kconfig                              |  1 +
 arch/x86/include/asm/tlbflush.h               |  3 ++-
 mm/Kconfig                                    |  3 +++
 mm/rmap.c                                     | 14 +++++++----
 17 files changed, 59 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm64/include/asm/tlbbatch.h

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
