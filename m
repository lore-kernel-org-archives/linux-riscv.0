Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B8DC4167D
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 13:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DDDIbqquvOrgT2D9pYvuKg/1GyARa4UROqOgNSX7FPY=; b=bYw/3xT0vEwC92
	BtzSUgzAySGtNb7jXl6unvfTnOtEaYasZ/jup154M7Cbo2jbFsjg2kpdnXW+VGu4ybz2dfS4pC9Qi
	WGzCTVd8i+5Da6t7lVN3jZddqHXEGRl4BZextJJudQAQtCzR/ZkM+RT77flBBrspt4yPUY7E89xY5
	cZvfoOnNyg3TFUXnt2JWn1C63wIwVApoh/Yeaw4klp19JmyAUPti39Dy9xMfhDzTVcUbnv/m96Ask
	/yn6sp12udHNAmpL1RXw5EYydCtjKogHSAt/ULHqEnP0BiLdTQuhOZc4xVYRQYkEc1Jdh7hGC3HTG
	tuW/blj9UgrRsZkfUGfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxSMI-003PeD-0K;
	Mon, 30 Oct 2023 13:31:10 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxSMD-003Pbv-0w
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 13:31:08 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c50fbc218bso61671371fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698672662; x=1699277462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cFAyygTf1wEzmKUuixPjgxrlB1EH/ZEG0d5M9D9G9l4=;
        b=RztAWY4l+1vgo1e+5VQQSk09SxN23GoI6KJQN8GLPqF/0gSFLrsn9Sov4tmP3wLTCs
         QUPAni45J3ErY7Y+GMk7bRcT5d8LLFzcnNhKMt7FtS3Xf/o9dXTpynIi1kwjTbjq0MBY
         M4Z1j+DDZkIbv0ObXaGK5s9HJmgk766+t1T9skKfPJN/8zL3cnCRJbJrTmgNvUPk3sHC
         AR5nruq9sNw/PJMUdImq5KtcB7iMx5zzz9vL9oSGO+KHk8xpVLF+7Fa/Jm4Gw3KOnm7M
         yqE8IGZDIZJRwtPRpiAdzxrObvcLrjoxId7jyb7PeVcmwrwAr+0m7jVShgb6UMMWZBH+
         T5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698672662; x=1699277462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFAyygTf1wEzmKUuixPjgxrlB1EH/ZEG0d5M9D9G9l4=;
        b=nsu5gZwl3m7nhSSAIXaECdzqolzTSxFgaS/g+TTgeieVQ21RN7/s3GVpYtDjekk3Xr
         ehIwl+pbP+ZDZxmDnUKJis5ByEDULVN4TgekRrLALkhBoKuZjXq9kZqM1ynxA8pUaZd2
         Ot7tdD0hAp/g2LaO/zNK2VCzu8BCyulCYTPxWk+x8Vj5XHX8sbnzX9VjFqonS5X2kuOw
         fmHevFC55gAofg/wPTBql/Xf3WT1ck7cK4Nk/EpUbfqRNEWK5IDd254GuKKwb7MiSUv5
         PYAUsnNcCPxT3p17c9rN1X9k3rCGhfr1eEn2iTKQ468f005zz+iPzH2RTPh/Hq7FQfKX
         DaCg==
X-Gm-Message-State: AOJu0YxTsnxOgcGfDTmccjIgLwZVGoMInSMKCVX++yLPUDohTlNS+3Ny
	TW8ZpybpK9biK6DLKh97d8D6Fw==
X-Google-Smtp-Source: AGHT+IGp3Flp6e8u4wQXKFFe94N4J3LW0CdDXYSPeu5D/05PAkg9EMs3NFgFQ+aCgOk5cp4xvQIWmA==
X-Received: by 2002:a2e:a48d:0:b0:2c5:2357:c659 with SMTP id h13-20020a2ea48d000000b002c52357c659mr7665145lji.38.1698672661824;
        Mon, 30 Oct 2023 06:31:01 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id iv8-20020a05600c548800b003fefaf299b6sm9383887wmb.38.2023.10.30.06.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 06:31:01 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>,
	Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v6 0/4] riscv: tlb flush improvements
Date: Mon, 30 Oct 2023 14:30:24 +0100
Message-Id: <20231030133027.19542-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_063105_542887_79850B85 
X-CRM114-Status: GOOD (  13.12  )
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

This series optimizes the tlb flushes on riscv which used to simply
flush the whole tlb whatever the size of the range to flush or the size
of the stride.

Patch 3 introduces a threshold that is microarchitecture specific and
will very likely be modified by vendors, not sure though which mechanism
we'll use to do that (dt? alternatives? vendor initialization code?).

Next steps would be to implement:
- svinval extension as Mayuresh did here [1]
- BATCHED_UNMAP_TLB_FLUSH (I'll wait for arm64 patchset to land)
- MMU_GATHER_RCU_TABLE_FREE
- MMU_GATHER_MERGE_VMAS

Any other idea welcome.

[1] https://lore.kernel.org/linux-riscv/20230623123849.1425805-1-mchitale@ventanamicro.com/

Changes in v6:
- Remove ifdef SVNAPOT, as suggested by Samuel
- Fix usage of u16 which could overflow, as noted by Samuel
- Use cpu_online_mask, as suggested by Samuel
- Move static_branch_unlikely(&use_asid_allocator) test, as suggested by Samuel
- Add TB/RB from Prabhakar and Samuel, thanks guys!

Changes in v5:
- Fix commit message s/flush_tlb/tlb_flush thanks to Samuel
- Simplify NAPOT mapping stride size handling, as suggested by Samuel
- Add TB from Prabhakar
- Add RB from Samuel
- Remove TB/RB from patch 2 as it changed enough

Changes in v4:
- Correctly handle the stride size for a NAPOT hugepage, thanks to Aaron Durbin!
- Fix flush_tlb_kernel_range() which passed a wrong argument to __flush_tlb_range()
- Factorize code to handle asid/no asid flushes
- Fix kernel flush bug where I used to pass 0 instead of x0, big thanks to Samuel for finding that!

Changes in v3:
- Add RB from Andrew, thanks!
- Unwrap a few lines, as suggested by Andrew
- Introduce defines for -1 constants used in tlbflush.c, as suggested by Andrew and Conor
- Use huge_page_size() directly instead of using the shift, as suggested by Andrew
- Remove misleading comments as suggested by Conor

Changes in v2:
- Make static tlb_flush_all_threshold, we'll figure out later how to
  override this value on a vendor basis, as suggested by Conor and Palmer
- Fix nommu build, as reported by Conor

Alexandre Ghiti (4):
  riscv: Improve tlb_flush()
  riscv: Improve flush_tlb_range() for hugetlb pages
  riscv: Make __flush_tlb_range() loop over pte instead of flushing the
    whole tlb
  riscv: Improve flush_tlb_kernel_range()

 arch/riscv/include/asm/sbi.h      |   3 -
 arch/riscv/include/asm/tlb.h      |   8 +-
 arch/riscv/include/asm/tlbflush.h |  15 ++-
 arch/riscv/kernel/sbi.c           |  32 ++----
 arch/riscv/mm/tlbflush.c          | 181 +++++++++++++++++++-----------
 5 files changed, 144 insertions(+), 95 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
