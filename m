Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D18FC4167B
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 23:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oicrUN44CA9lDddnAsi0J/N8flkAAgWaG0Cqcij1Rb0=; b=YAsAFdcYHtfxC+
	k6f8zV2JrLUdjKMIo6LrWEOb7VBZoZcv/6YZj89LoqJKz2Ej60x1RsAxKXpmCoIWypwkzXYPc1l3Y
	aRegl2ktIYnEWUFgFPoC4Io95uRdC5zxkZKpEBbwTkpVqO3kYAzj3UddDvPpl0mzmnneJE47JW3xv
	u7sdmViFxWi4OaQ5lwrhaBGgCSBc5IdnzTy0b34bkgdlr1QHc1HOHLjfm43Ki6g1xlJvfUVUVspJn
	uz7JBXyuoaMiokesw8W6yUw4r6uYXAhV3s/OU1/j7nSIfJBzawTxuUwgTDWwePy7ELZE3rdF2YJAD
	tEUSPsLkzmxJ2fyjfBWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsV0-000vSY-2w;
	Sat, 28 Oct 2023 23:13:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsUx-000vRf-2a
	for linux-riscv@lists.infradead.org;
	Sat, 28 Oct 2023 23:13:45 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cc20df5187so12487135ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 28 Oct 2023 16:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698534822; x=1699139622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+YSC/hhoRjtMopBh7FLE1bSq2O3YdveY+o3Gj9D1j+k=;
        b=lnTj1uznk4cTTDcnopIvNE1E8PnXtdXIQWwzUu0xqXlW9kYCtc2onBmBaw2Abkubz9
         QAvSVs3mou3e6SBwLyVE0Bw2BLDOmNf8mjJ8BwkDhRjgu7DiC9ZXqJvG7qd8jUBEvAvV
         f48BBYPlDx34o6Gao8lsKXEdagnthXGSOMZat5fHOPtus1w+UsRDk5QirBDpQ64vIMTR
         tdC8PfeZAsttSry7NjLHLd81WrEfbja8hI27W9tCN/F6SdM8YZJW1CcIiEbYYxS1/vqJ
         8WTyV6vRfCOTbYRv1FrD42mKyqyl4dV/cEUvOUpx87fp3CCeEgolbt99EJPWMtpY3Vdx
         EqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698534822; x=1699139622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+YSC/hhoRjtMopBh7FLE1bSq2O3YdveY+o3Gj9D1j+k=;
        b=oyt4Xjp73CaCPnvAMEOAPHhBLbETRP6joZ0YSCr/jw4VlC5NNKzmQogzGirv2+DEfM
         BaMuAr8IsiAF64GsvPEBilpZf/kPZaY53OXwaNlp/1YYLrjR5Q+6viKgFJsQvN02nlw6
         Q7QQdAs7lESTWMZTL68Dnys8q1IQy7T1YGk7mo1uDN5CRumBw9wHUHjUy7jfQok8o7SG
         fyGC2n15eZONlEj/vmmi5Bmr/TvjRx4kudov8p0jcFZ2KkWouwVq20TMGTmk4z+juL3w
         dk35vlTaeOTQmygotzIa4OZKYI6hQARcbfukWjrS9cY3/DlnZmXtCxvdavfHaZBomG0f
         HlsA==
X-Gm-Message-State: AOJu0Yxu2zpwfqK7ulllB3BXTr6TKiR09MDIR7PG1JuIn6vs/dEVn20k
	l9BZjhWmPKf9yYfwlhxjzudfqQ==
X-Google-Smtp-Source: AGHT+IF0JBsKL86F5ZkzVy7xM0AKZ7eTjPFOs+Rl6fenaIpINViQpBDxNJRC+nKxa/+obzBqy2Feog==
X-Received: by 2002:a17:903:11d1:b0:1cc:f41:8f82 with SMTP id q17-20020a17090311d100b001cc0f418f82mr8777732plh.16.1698534821805;
        Sat, 28 Oct 2023 16:13:41 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001b8622c1ad2sm3679345ple.130.2023.10.28.16.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 16:13:41 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 00/11] riscv: ASID-related and UP-related TLB flush enhancements
Date: Sat, 28 Oct 2023 16:11:58 -0700
Message-ID: <20231028231339.3116618-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_161343_933741_EB7784A5 
X-CRM114-Status: GOOD (  10.81  )
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

While reviewing Alexandre Ghiti's "riscv: tlb flush improvements"
series[1], I noticed that most TLB flush functions end up as a call to
local_flush_tlb_all() when SMP is disabled. This series resolves that.
Along the way, I realized that we should be using single-ASID flushes
wherever possible, so I implemented that as well.

[1]: https://lore.kernel.org/linux-riscv/20231019140151.21629-1-alexghiti@rivosinc.com/
---
This series is based on v5 of Alexandre's changes, which I have included
here so the series can be built by the CI bots. I will rebase once his
series is merged.

Changes in v2:
 - Rebase on Alexandre's "riscv: tlb flush improvements" series v5
 - Move the SMP/UP merge earlier in the series to avoid build issues
 - Make a copy of __flush_tlb_range() instead of adding ifdefs inside
 - local_flush_tlb_all() is the only function used on !MMU (smpboot.c)

Alexandre Ghiti (4):
  riscv: Improve tlb_flush()
  riscv: Improve flush_tlb_range() for hugetlb pages
  riscv: Make __flush_tlb_range() loop over pte instead of flushing the
    whole tlb
  riscv: Improve flush_tlb_kernel_range()

Samuel Holland (7):
  riscv: mm: Combine the SMP and UP TLB flush code
  riscv: Apply SiFive CIP-1200 workaround to single-ASID sfence.vma
  riscv: mm: Introduce cntx2asid/cntx2version helper macros
  riscv: mm: Use a fixed layout for the MM context ID
  riscv: mm: Make asid_bits a local variable
  riscv: mm: Preserve global TLB entries when switching contexts
  riscv: mm: Always use ASID to flush MM contexts

 arch/riscv/include/asm/errata_list.h |  12 +-
 arch/riscv/include/asm/mmu.h         |   3 +
 arch/riscv/include/asm/mmu_context.h |   2 -
 arch/riscv/include/asm/sbi.h         |   3 -
 arch/riscv/include/asm/tlb.h         |   8 +-
 arch/riscv/include/asm/tlbflush.h    |  59 +++++----
 arch/riscv/kernel/sbi.c              |  32 ++---
 arch/riscv/mm/Makefile               |   5 +-
 arch/riscv/mm/context.c              |  26 ++--
 arch/riscv/mm/tlbflush.c             | 184 ++++++++++++++++-----------
 10 files changed, 186 insertions(+), 148 deletions(-)

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
