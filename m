Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB630C19F4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 11:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HEDtzr4ppbnQ1XhgnPQhWqOiYmb8ea7MfIH88GPRMUA=; b=XK2ZCVL42osvfJ
	S0gZrTcKSPE1mhiUuX14O2d/5T9xeBwXSgdjjMC7mLO+XICcR1XmWx0iG58BB6hKqo4EqCbLMi05f
	1Wud/9+HihnkeMAb0fumZXYM4AgT5m7+UjCUJaKEC0DaoEH+4eCVpxAqf6TfLqqe7ZuwnFQ9ICy1x
	oosMBN+8GoDJzjcXryKOp4SHRyTi+DIJfD2+/k6iDWbOktw72ALnRDihmv1D7HvibMv7mP/VIBmSG
	jHOouDR1NcT91cQfQiWg1c7uDtsIwlM3AoEyUg+ulTP9R2O94s44VhH67bBq+JKJnFYGmkZplbJrN
	ZTcJ54ED1AeFYaIBMSug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fJu-0000000FAZ9-0yeR;
	Wed, 08 May 2024 11:18:46 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fJq-0000000FAVw-3ESr
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 11:18:44 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2e0933d3b5fso53218091fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 04:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715167117; x=1715771917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7s2Jc0w0RwoJia0FRkNkBXydPtaseE14QqCOpfNooII=;
        b=jjrQbhmu1atsqbOEx6YG5Xyx8B2dFyWMghnyl400/e4zWSGfJDAOAOIIMutxLY46Jp
         QbtnXAFMNkoVx3LGUXlDp+1kjCprMFhMoSCoPEVVXD6FbMtQzGJxsAGBo4N2+NVqwwwS
         JOQ3xPEv5YLNgZlLgsBhmBPUeTRxjgGPQIX69KoPqxBt+RTumkRGUOb5ivhPGFf4GrSq
         hcEd2amm7maV6kmpNrZcAKl7KGmquHjZdGewVVPvRPPC4OZ06CZAK94ntvYyJCSHGmbq
         AZjojWsW9wE9sPpd7fBbD7nBKGfrInUtPJRVOYOQdEpQBvqRk6zt2nrHZBcIS1gqTnzK
         NTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715167117; x=1715771917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7s2Jc0w0RwoJia0FRkNkBXydPtaseE14QqCOpfNooII=;
        b=b85RwgvGVZZND0OFgriGaHVlvJDWyPaln9R/LEIaAqR4z42g7SXN19NTbeGjkHW4Nd
         5gENca1PGGtv4KLaWiFnj4pK9puZX7q5qdy1iM34yo79uo88dnLSxFzZH6x2+06+fdyD
         WFbaq8lPh+IoGImy58jVDJl5kc1H23eGjbWf/bNjCuzxHYk+unaAGpI2OLf0svdtCcki
         TzeuDtjIX0MfjzFcAyuu6PeOoMV1R5gS/2RTJ+9cYs5xHilrwVJaMM5gXVR1jXi28b1i
         pTKxe+Er4pBqwLLLWKTYGKDAg+sInlQXpJ7givQDX4tZTkqBFgyxHubZXJ2cu/sF1lGn
         tZng==
X-Forwarded-Encrypted: i=1; AJvYcCWCH4RI+OWQe2PAPAG+Hh5PvMP1hcogxTAENtYwl4h7sGehx2LZZRIKGn9Tx95MW+zzO72IEw+fkjLBSIvqGmCsqnYCzT+7dHp7wA0sO1ia
X-Gm-Message-State: AOJu0YyxjF7N+j1IhnMm6ZNSFqDFHGA3D2ItOV+Ia0nSvRkWOZXQBIOO
	RuBLxnnUIEw7BWgQSuG6B9/b+taxMQ/fZXgOAdOFPYBE/zD0lt0FiUkHtxx2co4=
X-Google-Smtp-Source: AGHT+IE4qIFoqxTdkb49q/bY17UwLRoTIUg63kSAW3jbHy8RJOOcZA258spjIObf7gc4cKs2O6G04w==
X-Received: by 2002:a2e:4602:0:b0:2e0:3132:94d4 with SMTP id 38308e7fff4ca-2e446f7c72amr11638751fa.16.1715167116751;
        Wed, 08 May 2024 04:18:36 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id f21-20020a2ea0d5000000b002e123933dcbsm2422820ljm.120.2024.05.08.04.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:18:36 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 0/9] Merge arm64/riscv hugetlbfs contpte support
Date: Wed,  8 May 2024 13:18:20 +0200
Message-Id: <20240508111829.16891-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_041842_873814_E256ADF3 
X-CRM114-Status: GOOD (  14.54  )
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

This patchset intends to merge the contiguous ptes hugetlbfs implementation
of arm64 and riscv.

Both arm64 and riscv support the use of contiguous ptes to map pages that
are larger than the default page table size, respectively called contpte
and svnapot.

The riscv implementation differs from the arm64's in that the LSBs of the
pfn of a svnapot pte are used to store the size of the mapping, allowing
for future sizes to be added (for now only 64KB is supported). That's an
issue for the core mm code which expects to find the *real* pfn a pte points
to. Patch 1 fixes that by always returning svnapot ptes with the real pfn
and restores the size of the mapping when it is written to a page table.

The following patches are just merges of the 2 different implementations
that currently exist in arm64 and riscv which are very similar. It paves
the way to the reuse of the recent contpte THP work by Ryan [1] to avoid
reimplementing the same in riscv.

This patchset was tested by running the libhugetlbfs testsuite with 64KB
and 2MB pages on both architectures (on a 4KB base page size arm64 kernel).

[1] https://lore.kernel.org/linux-arm-kernel/20240215103205.2607016-1-ryan.roberts@arm.com/

Changes in v2:
  - Rebase on top of 6.9-rc3

Alexandre Ghiti (9):
  riscv: Restore the pfn in a NAPOT pte when manipulated by core mm code
  riscv: Safely remove huge_pte_offset() when manipulating NAPOT ptes
  mm: Use common huge_ptep_get() function for riscv/arm64
  mm: Use common set_huge_pte_at() function for riscv/arm64
  mm: Use common huge_pte_clear() function for riscv/arm64
  mm: Use common huge_ptep_get_and_clear() function for riscv/arm64
  mm: Use common huge_ptep_set_access_flags() function for riscv/arm64
  mm: Use common huge_ptep_set_wrprotect() function for riscv/arm64
  mm: Use common huge_ptep_clear_flush() function for riscv/arm64

 arch/arm64/Kconfig                  |   1 +
 arch/arm64/include/asm/pgtable.h    |  56 +++++-
 arch/arm64/mm/hugetlbpage.c         | 291 +---------------------------
 arch/riscv/Kconfig                  |   1 +
 arch/riscv/include/asm/hugetlb.h    |   2 +-
 arch/riscv/include/asm/pgtable-64.h |  11 ++
 arch/riscv/include/asm/pgtable.h    | 153 +++++++++++++--
 arch/riscv/mm/hugetlbpage.c         | 227 ----------------------
 arch/riscv/mm/pgtable.c             |   6 +-
 mm/Kconfig                          |   3 +
 mm/Makefile                         |   1 +
 mm/contpte.c                        | 272 ++++++++++++++++++++++++++
 12 files changed, 480 insertions(+), 544 deletions(-)
 create mode 100644 mm/contpte.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
