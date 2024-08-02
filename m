Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F92C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 15:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YDxOtc0+EsuaM3JEwC7WT9wn1RGC6dbalb3CF8uJpDc=; b=rNZH/D9kN2P/At
	N9YYUG58RySmJ7wQUke0FAragwnxkcFK7g0jaqzpcgbUxliieDnusRabsvsW9XYK0XtuwqAkzN2SJ
	aPCDMU+7GODj+QB3tuwW0nchxy92DGDt9QzvJz9mo4tg9ete8x5/smJdkgCOyw78QdY1ObeuLQdp6
	+UZvhkcXMABo8+kQyaFwmhFbAdW1Dhj8IjAlig0TM3V3vOqMuCuRvwAUUs7zbfwGJgDNcNfpGvTKZ
	5oUvypReNfEBwqPe/mj+nZ1DInasQx6MDg6bfTBprp4URETqQkKxKVKVJkiiRBieMXRcfBraNSTBE
	y7IgiGZ3VzsdOQy/LoGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZtzJ-00000009CSv-3TY1;
	Fri, 02 Aug 2024 15:14:37 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZtzH-00000009CRp-2rKb
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 15:14:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so73394225e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 08:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722611673; x=1723216473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hBY2jE6SQVLEJ2rTtvFkGo52n+rOy9A54yoDBcuOdIo=;
        b=FFxyleHzfUnhX9Kph/72mhsLWlhweAZSCmlInNvitXzzQ3qsJTNrXt3UO53xgFqj/b
         qkDcOgvE1NsbZ8+UtW2G/lrHCtSgMStHt7MuLslwc9RE6dr3G0UVub8adHQvLqPD8p4b
         T6CIzc8Y/STy6p7l+Ropz19gHPDfRLbgF1ApSca9YQIufG6mYJ93tG/xtNM/KQfSW4a0
         2ZpXIH1sc6FJOISFeXbcAOu3/zlbXfpO/rcUt1tT8OTd5lhyMyVJNrVzHYTRkBT8OYsh
         ZQ/XvxRMNN2/lLRX2Cxq1dUUaynBGgGEzLTm04vcPAML91Er84GGGZZPfyNkESoyRrW7
         JvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722611673; x=1723216473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBY2jE6SQVLEJ2rTtvFkGo52n+rOy9A54yoDBcuOdIo=;
        b=cIsVYyLYGI4nxS+5W4V7y7WXVEKURZ4km3ByCPBxpIVI+wx+tRN8h24ONnTq/dyXhV
         GBIPbOAr1LgznzPWkAYcOCzd/wjUdm5yxg/dgQcfrXc+tSHa4EQRPnAphi1Tc4Q575zA
         wpmKtVkBUt4XZotCQZbq5GitlzgZLuZgVe0yPTV8ZrZTCx0UeiwEkM6xUzkl0rFFpGjS
         /BPqzkeqWr/kGwZ+szgelNCVUvf0FIm62WIA7DeLeI1XBGfTuoq1jUxZpPGA8BtnnF9X
         ZiwjvIShOoSfGhfNnnsoPmIF/vM2lYxlD5xCebiPkBzPF9e/wp7lGkDKgyTmp/EcoWzU
         OC3w==
X-Forwarded-Encrypted: i=1; AJvYcCWzMyw/+3gL9k9XFWPkmds3XItFnwIWI4gQuj7pqcX4aa6+xz3rSxo8B80xthNUhnjqDD6UIQA5/qIHNu0TmeGtThSWlnG64wlMid8MKwUS
X-Gm-Message-State: AOJu0YzR6LYXVBtTgMd3fAjHJ5ATusE8zW7YS/DhvOrsaLDfc+Pe7N61
	JSvaOHtINXuKGUwJD6MXW1mb8FPluWcbuhjJiR+0jC1XvJ0itr5fccS2NOhPO3k=
X-Google-Smtp-Source: AGHT+IH4oAftIk88ByazbNx7M8aEqytLa2lIWzUyzNWyKW+yeSfszojodoNPHEIHeKtlRo8S+0ksYw==
X-Received: by 2002:a05:600c:3c84:b0:426:6ee7:d594 with SMTP id 5b1f17b1804b1-428e6af2443mr32146155e9.7.1722611673233;
        Fri, 02 Aug 2024 08:14:33 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282b8ad7f4sm98898355e9.11.2024.08.02.08.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 08:14:32 -0700 (PDT)
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
Subject: [PATCH v3 0/9] Merge arm64/riscv hugetlbfs contpte support
Date: Fri,  2 Aug 2024 17:14:21 +0200
Message-Id: <20240802151430.99114-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_081435_750219_96A47D82 
X-CRM114-Status: GOOD (  15.24  )
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

v2: https://lore.kernel.org/linux-riscv/20240508113419.18620-1-alexghiti@rivosinc.com/
v1: https://lore.kernel.org/linux-riscv/20240301091455.246686-1-alexghiti@rivosinc.com/

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
