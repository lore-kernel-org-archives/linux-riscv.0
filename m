Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4346CC04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 11:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HEDtzr4ppbnQ1XhgnPQhWqOiYmb8ea7MfIH88GPRMUA=; b=lUcVrlfoOC8HNX
	5IREUkmWy9goFJde/sL4AMrVKKE5bJP95sHXLPQnSoQSjigLkcybTTDLd0vKPzE95jjr4eILtChFz
	jIodoE7sb3Wtfg5na/5gGvELTfgiNW011nH5vUMT9AWhJaJUicSXd1kCeVouYF6bsqLCamiCO/ttf
	68aPKBJ6AXF6dv/Y64UGHTTEvMfemW3JyJI9EZuWLvlSt1pPWN4ZRKePPiDxJzufdi+TVw03UpBjI
	sfNktfuSX7Gkt4lpbnok4xE0O7gu2231fh3Y+qqUIH8zrq8VcXDFBR6CbzDvaZT2DG475xCcB69D4
	UO0tnZ+ChXYFVP6iJItA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fZ8-0000000FFXp-1v6v;
	Wed, 08 May 2024 11:34:30 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4fZ5-0000000FFVa-0PNG
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 11:34:28 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5210684cee6so2723962e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 04:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715168064; x=1715772864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7s2Jc0w0RwoJia0FRkNkBXydPtaseE14QqCOpfNooII=;
        b=eQ0KJYPs0gQAHqctoVvzeqlFxyt4eoi3klcRWGyTeY6GFUovZ1m+C8Pbcc2OIaikN6
         18/96R7xwhe0XIsxa1u7FcbnaoJlRxMjSkYtRw+1Z/lxNeNPZBAnOpYG2WEKQCCjzPBZ
         /1LFRa7iwU78mLw6smz2rMkNH/kabmRK/7OJcxeWd1JSRYVi1UwBgaskYUiLusVwlWlL
         8s/yEPqlX6U3Yz4H2mVSWdfozc4nRaZt0mW1Cj0larHmZ8DjagimJZpRpLz6oOU8Epw1
         FH47MYT+0mRUXrlKP5wdONsWqng7bOKSVHizsNWpHwYcKgesT8LyPSRR1uGToqOp/l6K
         Zffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715168064; x=1715772864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7s2Jc0w0RwoJia0FRkNkBXydPtaseE14QqCOpfNooII=;
        b=Flo4ueINvN6NXBz48V5ZoH1iJX/34+9JjjXyDhKatDyAc9CcOZCmROwuD5rHJ1cRfy
         QLvDOixDQ7MceqXyjWPslXwkG6MZdE+1OQFRZK0iiWD1Jqp3U96TX4s3HU4ifp6Wowl5
         z88828YDMFIybF2XfrZA6IqGoG9YR8Ck5wdWnOqjoYVrBI/Gx+GP5JQ6qox0qvHkbjlM
         Q9Jvs1kkWspSu0Lo1l67iScKu7lxHRk1SL0SsT3eWsDbtk6QA2Figu721krwzTQfITe4
         5/YWeGqb/OzXyjH+BhTUyeWHryBbSn/bAVFTYRHhTsj4HCAK7gdCtShkZeoj/MSFDesm
         OPww==
X-Forwarded-Encrypted: i=1; AJvYcCUdULQfRUNzuQg+X9DX4fjy6XQTskteYQEqT5W/9VJ+ccpRDx65I5q07rw6TdqQsPwaN55bRB6NAVL1J/8tszDPfpsleBGdF6n8cL+zN7BL
X-Gm-Message-State: AOJu0YzTjM6ZmdRJEKtIIRkDW+iruUsrdduxtnqH/uj5QDfCuyzzGQrv
	Fwdpbib8xra+GpHkS8W5/QcZyyDWVB1cZDjhvKCn7d9DEaJXplohdjkX1nA1mas=
X-Google-Smtp-Source: AGHT+IHQ0+1QRr9yi6sWcDZ0EGp5PxgqjX1SIZMCwr+oGXVeU6XovCaKI7Yf+LAxYXYIcWcDnNZqDg==
X-Received: by 2002:a05:6512:3493:b0:51d:7d4a:5e6e with SMTP id 2adb3069b0e04-5217c276f94mr1361793e87.3.1715168064446;
        Wed, 08 May 2024 04:34:24 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id z8-20020a05600c0a0800b00418db9e4228sm2001659wmp.29.2024.05.08.04.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:34:24 -0700 (PDT)
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
Subject: [PATCH RESEND v2 0/9] Merge arm64/riscv hugetlbfs contpte support
Date: Wed,  8 May 2024 13:34:10 +0200
Message-Id: <20240508113419.18620-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_043427_154134_5CD95339 
X-CRM114-Status: GOOD (  14.29  )
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
