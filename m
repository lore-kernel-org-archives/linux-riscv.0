Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9847CC25B4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 19:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fYdqjrMLd68Zk1dHbFmYeD6A0TVi3pMnjecDXy6rGZw=; b=gu7LUTPLl1TnZo
	KkqWZw3+tA+1/feStFk3bnPhRi1SStQ2x4AuWwAUS7jZvDRnC+W6NSpU3E5D0fg46gqhUQgbkuNod
	+jH97LwTbOCPCoAeRy3oDOXJGmhsz3SoGSDVWdtqkmLH30SuWMuPrrWdOY0kPwpqXDlOywBIRZ09L
	V7tyXCSAkg2p5xa0gMGfNDNLBtrTfaV7tzFDIAvP/Pmo8bCAzNWZS28dw/ofzUaG9Cs7E35+C9GXq
	ROOoHMMxfkH3Ix9k7f68IM1bMoRLmArUd+LmzUCbi3uW2RCG9qDCx68LQg3tI236GzUnctjKOCl36
	0y+DRNKw0j1II4mGzBHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mpT-0000000Ggw4-3Yx7;
	Wed, 08 May 2024 19:19:51 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mpF-0000000Ggoc-2mog
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 19:19:43 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2e43c481b53so1562981fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 12:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715195973; x=1715800773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K1uKlYjMTe4xfHBkLhM4fwrAS4H0Wd2FQ2UyNN+YPgM=;
        b=XlPDjKUSVDei4dQlD6NiL1elef5XeQGeUFo15sXIN9tzkPd30og+QyjN3ns0VwAiW2
         B1nYr/HWVaFQ/GaY1/VscMn5WDvHtfUIQH/NeJ7pkrsBjGeS+fkCrRmVyzpUfRn51Xe6
         7rKcGP9sOooAJIwqMkJrzPKT44Z/MmFtwBNGiM/bRecMBaA2Ajjx/KAcv0bfpx1zAOBh
         olmZ6Q4eMfrTR5Dw0ecsaHkfoWAlI++83HslwALPuggyCMhLXLqssI6ndQnsObgi1DKX
         4rN5DHxVzvENImGyh2eyV3INaOvtT10b66sG4i9ldAVw+0YJ+gw4p34A8nIzfUtDs/1+
         FHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715195973; x=1715800773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1uKlYjMTe4xfHBkLhM4fwrAS4H0Wd2FQ2UyNN+YPgM=;
        b=pTE23B63ozf20GHEg4gSYBsW3quEIgEKPkYc+8OZgl/Syvx0/hELevOKfzfI8eCdeB
         KX/x47HbIQjrQd6ZawUfO+ERclQ3BHOe8HaMhysgp2YLOCelim+41a7rpJcDG9ixDAId
         Alt6CnZHQVM7Y85NJznd2zYZACb9VZGaNF+BxG9TF6+2DCrLkxlDLHpTeYQ+UnxezrT0
         nkZgFmXgY1fkwp16Z4oip2ghJd5p4QUsbSIPvO130e5KuDDfd8+nzgbPDb9Kw5NB3CLx
         osu619FStIdIxhmOV++CpEEDJdPGSvQXj+faV6E/n2bzHV1RQzLAahvnr8fFfXLTK35v
         8OLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkVPe2Xz+nBCTN/gkS+v7Sj+W+c7bhITQKLTCXok2HOW/xAxScjGuLYnRSd/jwC0Uv1TNBlsSTPa66VtpbTPwy5NQUXXQFp57Q2++U1zM9
X-Gm-Message-State: AOJu0YyGokXwSltCjcqDeX6Ac2131QbQqW9thuAuIPBJ1CUE+FPFSU4T
	GoAX9ZBSl9maZFtRRXxqJebsJve7UWeOnxMqWBTcwF1ldjYArxyUtVCbNlwSKyE=
X-Google-Smtp-Source: AGHT+IHeP5I15KzeyyHS9QyEylQJKB8BxwDLerdVkeWn4X1OoVdiknVfTODJicHq4kG+uWiKxO6g7A==
X-Received: by 2002:a2e:81a:0:b0:2e0:12f1:f827 with SMTP id 38308e7fff4ca-2e4479a2ca4mr23591601fa.43.1715195973157;
        Wed, 08 May 2024 12:19:33 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f88110f3esm32622515e9.29.2024.05.08.12.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 12:19:32 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Ryan Roberts <ryan.roberts@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 00/12] Make riscv use THP contpte support for arm64
Date: Wed,  8 May 2024 21:19:19 +0200
Message-Id: <20240508191931.46060-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_121938_182952_C684822F 
X-CRM114-Status: GOOD (  14.04  )
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

This allows riscv to support napot (riscv equivalent to contpte) THPs by
moving arm64 contpte support into mm, the previous series [1] only merging
riscv and arm64 implementations of hugetlbfs contpte.

riscv contpte specification allows for different contpte sizes, although
only 64KB is supported for now. So in this patchset is implemented the
support of multiple contpte sizes, which introduces a few arch specific
helpers to determine what sizes are supported. Even though only one size
is supported on riscv, the implementation of the multi size support is to
show what it will look like when we support other sizes, and make sure
it does not regress arm64.

I tested arm64 using the cow kselftest and a kernel build with 4KB base
page size and 64KB contpte. riscv was tested with the same tests on *all*
contpte sizes that fit in the last page table level (support for PMD sizes
is not present here). Both arch were only tested on qemu.

Alexandre Ghiti (12):
  mm, arm64: Rename ARM64_CONTPTE to THP_CONTPTE
  mm, riscv, arm64: Use common ptep_get() function
  mm, riscv, arm64: Use common set_ptes() function
  mm, riscv, arm64: Use common ptep_get_lockless() function
  mm, riscv, arm64: Use common set_pte() function
  mm, riscv, arm64: Use common pte_clear() function
  mm, riscv, arm64: Use common ptep_get_and_clear() function
  mm, riscv, arm64: Use common ptep_test_and_clear_young() function
  mm, riscv, arm64: Use common ptep_clear_flush_young() function
  mm, riscv, arm64: Use common ptep_set_access_flags() function
  mm, riscv, arm64: Use common ptep_set_wrprotect()/wrprotect_ptes()
    functions
  mm, riscv, arm64: Use common
    get_and_clear_full_ptes()/clear_full_ptes() functions

 arch/arm64/Kconfig               |   9 -
 arch/arm64/include/asm/pgtable.h | 318 +++++---------
 arch/arm64/mm/Makefile           |   1 -
 arch/arm64/mm/contpte.c          | 408 ------------------
 arch/arm64/mm/hugetlbpage.c      |   6 +-
 arch/arm64/mm/mmu.c              |   2 +-
 arch/riscv/include/asm/kfence.h  |   4 +-
 arch/riscv/include/asm/pgtable.h | 206 +++++++++-
 arch/riscv/kernel/efi.c          |   4 +-
 arch/riscv/kernel/hibernate.c    |   2 +-
 arch/riscv/kvm/mmu.c             |  26 +-
 arch/riscv/mm/fault.c            |   2 +-
 arch/riscv/mm/init.c             |   4 +-
 arch/riscv/mm/kasan_init.c       |  16 +-
 arch/riscv/mm/pageattr.c         |   8 +-
 arch/riscv/mm/pgtable.c          |   6 +-
 include/linux/contpte.h          |  37 ++
 mm/Kconfig                       |   9 +
 mm/contpte.c                     | 685 ++++++++++++++++++++++++++++++-
 19 files changed, 1056 insertions(+), 697 deletions(-)
 delete mode 100644 arch/arm64/mm/contpte.c
 create mode 100644 include/linux/contpte.h

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
