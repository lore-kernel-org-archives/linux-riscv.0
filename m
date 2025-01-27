Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72576C0218C
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 09:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G0jJmeR5p1G0gXB5EoZ1Wh69dqIytDFQT7oV/uuQyRU=; b=yefJdy+ODT7ZzN
	8iHER3DUHL8NxHwX6pV8TYdq8s6EDD5JuDlA5AaPWongQ0jp01GCNY8lZWTtCNTxS/D0K6mu46YvS
	JIit13pTuBLcg0022EYvWsMOFyPAklVniUkvsomK1bbjhDRaWubEGmdjX/DZTl13GmLWBNI9ZdHyy
	Byl8KFfAUzVHQ3NCXcHIpmwx43X0pfnXX/QWwOstjHZel9Vq/nP6TXWs5hTvjq9gu0tQrMvP+3sCm
	AK4V0eE/chpbnO9axAyxIBrnmek7FzlSfgrK5Wt+TvMBA1ImOMq8d1UhwfJD8UIHNMbTj2yZY895/
	3QJ80AVcljwz0cVl/ltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLWv-0000000214L-38Ms;
	Mon, 27 Jan 2025 09:35:41 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLWs-0000000213N-0xYG
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 09:35:39 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso3687473f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 01:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737970536; x=1738575336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=99dsnhY1LzkcB+OE/DdpiYwFKW0qeZkpr6pPy+o2sR0=;
        b=GA2fqWvttLMAMzsN1YPrZXk1YoSUUULB7nhS0jR1a+4jbt4oukgxy5d0yKPBEFoYSA
         5WNJBfXANJo8HG4K6ac/AYVTXeessDc+e2AGFkhyMMbWeyeN4RiTp/Zvwy/lPPiwbJgY
         eomNaJjB8zTrA7ALEaOmzHLPAiOuRdnzt1jn7AlB3sF4Zcz5LWLYHfpFluC+ZXZRYQT+
         6eC0MGSwF5ynRLP5qgPJuqu92YpcJ/2JeWznEfo37iXicZc2sfs/YhI5GfgQ+7tLTWxe
         qFYlrDmd3cqaLEcWh1ak7z4hTNm6P3EdVvR2cfC5DeYLzN/Xfhj2sjwHKSJl1NqQqfPS
         MYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737970536; x=1738575336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99dsnhY1LzkcB+OE/DdpiYwFKW0qeZkpr6pPy+o2sR0=;
        b=JQSAGuovSvtx6xfUWOUvOITK4n8wrxCi7zCmhWAWcbMMKQ4fuvYutkG7YFOH5K7Y+H
         3L/bej0JHb5Q86dvsksusxxzwIeyYLK4ZGwUom9YkUfpn8K1LFSuNBjU9uW4aSzvQnbm
         pI+kTcI560ujtJ/O40JfLgO2t7RaPF5B1hI5dqp5yf9sf70MRaCryx3oxLLN9BRan6oJ
         927f9qyyfJV2fXNugF2zL+Jr4mavde4scC4r3mu7DGgS6r7zBTqPlenFXXPBfUyWrFi2
         KYXnm3SKFqL2DYHAcjZIYjQuWVIoV1bzi7g851ZPdODDpPv3o8xq+/M7nOULKVkuf3e/
         fuAw==
X-Forwarded-Encrypted: i=1; AJvYcCXQBsUEYqI/kMQUI8Lxis9pzhkm6xjDOPa6kggo7Zaf0prNDwZwQaxB6ASFrxnquKm8W/cEJgUkUJ75OA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMZnC2fWzWlhUUQ3++8K2zcVFotOX4ZBZEFzAGrGTauTDF4Jt8
	Zn81mtcymMoqm0VCIChce6sbHyUEWQAbMBOHU1iRaMgB8H5toYr5fSObTPwuBEM=
X-Gm-Gg: ASbGncuA5ci/kXg8y9qmSzGYN+pu49rnNhObtDDpSMFfCGIkdmwRqaXsC0F8P4JbY22
	xNWTZVs6XVtXvTvpLAKBT5NJDRCIZqLv5XrAl4a4mgXZ+vfbbwJSVsb/jKbkBTp9G3qmojDunO7
	nUybKe1L83anWBh2l5mMn2AoRdvHL5roQeO8DuZOp1Rib0qmCW6nyUUV0SeBg1Z3eh1+dyg1VyC
	ba7Un4BPBWGAIi3jsdAz8p4jFsg7X7bjPV3vcin0zzcQCcYxpjKmL4+V9MCZNqmew0K6stn1knz
	KXVolQfn8F4WoSJWt/sNgmWEaOsVpmA=
X-Google-Smtp-Source: AGHT+IHetBDsQbvMNN5ryrSs+8A3PKMdEXMucor5Vs6JNUiGjFQ98aWxPnKL2bmORICT+TKVgyvyDg==
X-Received: by 2002:a05:6000:1786:b0:385:d7f9:f16c with SMTP id ffacd0b85a97d-38bf57be11bmr40573775f8f.46.1737970536102;
        Mon, 27 Jan 2025 01:35:36 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3e22:3e78:ce5a:32c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188a77sm10736513f8f.51.2025.01.27.01.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:35:35 -0800 (PST)
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
Subject: [PATCH v4 0/9] Merge arm64/riscv hugetlbfs contpte support
Date: Mon, 27 Jan 2025 10:35:21 +0100
Message-Id: <20250127093530.19548-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_013538_515773_9BEB5A63 
X-CRM114-Status: GOOD (  15.04  )
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

v3: https://lore.kernel.org/all/20240802151430.99114-1-alexghiti@rivosinc.com/
v2: https://lore.kernel.org/linux-riscv/20240508113419.18620-1-alexghiti@rivosinc.com/
v1: https://lore.kernel.org/linux-riscv/20240301091455.246686-1-alexghiti@rivosinc.com/

Changes in v4:
  - Rebase on top of 6.13

Changes in v3:
  - Split set_ptes and ptep_get into internal and external API (Ryan)
  - Rename ARCH_HAS_CONTPTE into ARCH_WANT_GENERAL_HUGETLB_CONTPTE so that
    we split hugetlb functions from contpte functions (actually riscv contpte
    functions to support THP will come into another series) (Ryan)
  - Rebase on top of 6.11-rc1

Changes in v2:
  - Rebase on top of 6.9-rc3

Alexandre Ghiti (9):
  riscv: Safely remove huge_pte_offset() when manipulating NAPOT ptes
  riscv: Restore the pfn in a NAPOT pte when manipulated by core mm code
  mm: Use common huge_ptep_get() function for riscv/arm64
  mm: Use common set_huge_pte_at() function for riscv/arm64
  mm: Use common huge_pte_clear() function for riscv/arm64
  mm: Use common huge_ptep_get_and_clear() function for riscv/arm64
  mm: Use common huge_ptep_set_access_flags() function for riscv/arm64
  mm: Use common huge_ptep_set_wrprotect() function for riscv/arm64
  mm: Use common huge_ptep_clear_flush() function for riscv/arm64

 arch/arm64/Kconfig                  |   1 +
 arch/arm64/include/asm/hugetlb.h    |  22 +--
 arch/arm64/include/asm/pgtable.h    |  59 +++++-
 arch/arm64/mm/hugetlbpage.c         | 291 +---------------------------
 arch/riscv/Kconfig                  |   1 +
 arch/riscv/include/asm/hugetlb.h    |  35 +---
 arch/riscv/include/asm/pgtable-64.h |  11 ++
 arch/riscv/include/asm/pgtable.h    | 156 +++++++++++++--
 arch/riscv/mm/hugetlbpage.c         | 227 ----------------------
 arch/riscv/mm/pgtable.c             |   6 +-
 include/linux/hugetlb_contpte.h     |  38 ++++
 mm/Kconfig                          |   3 +
 mm/Makefile                         |   1 +
 mm/hugetlb_contpte.c                | 271 ++++++++++++++++++++++++++
 14 files changed, 527 insertions(+), 595 deletions(-)
 create mode 100644 include/linux/hugetlb_contpte.h
 create mode 100644 mm/hugetlb_contpte.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
