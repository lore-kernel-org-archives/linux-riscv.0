Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA907606A323
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2/i/sSVm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=BrbI1pek
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=b1wWUoTsxz4+Oa2mD4KlCB9dYFZjnkbhW76Xd/9JgnQ=; b=2/i/sSVmFlf9HeYQkDcNbKPIbm
	CbUoQ2C6BGBhOTPtRmoQyUPuctGYTY5bP2TnygIdnd8OqgUXXpGEDAMzg3xn83q/mP1fuP50i9ZX1
	wcoWKS7DmMIVPctYXxVdKX51Du9yHpI0LUfF+eHFlKMozPAN8g+nYtEAWWklx+JNl4cn1DArSIk0v
	9nM0siB5bQieByzbCXkIckSTyimRqGT8UAZAH8sFAY+BlfZnDj9AfYQo3eoEax7cN+NLy1KOXaDeK
	S/Wii5S2oUxqnURldgBN9yi4Q6xW9aOFu3J3nln0Gcbrn5D94RQug9LlOQDNutY9uruagNfpyRBWN
	1vnxV+Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnHX-0000000BpTX-1hJJ;
	Fri, 30 Oct 2026 14:08:35 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnHU-0000000BpST-329r
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 14:08:34 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2e60f9af6e6so7116535ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 30 Oct 2026 07:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793369307; x=1793974107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OGrdsvz70oET1GgEqFqkefkFXtM+kYm4wLwbKsNMt9o=;
        b=BrbI1pekzAKQ+q8CKC6tmVz81e6h1QG4jp3z7fvmC7WysHXzd1UgAVpEENxNr6nqn9
         f7cY3UksuAizHhT/naaHAoWUA9BuR4QNIYBULNIdifsjGABx8tPjgJ34XsDraXFnEcn+
         osCAlBzR6tzY33vFEsAR2k63EbTFP2E4BWo5dwCKlf4bRCKRuAk0jzawhduKcLXM9uFF
         TYrRDNlBBMAGvMfoGYqqom2LKm0xmBa0uh/qV208mHCNY8aNPXQt4Yfi0kY/J984nmnu
         6sDjsDa5RMJ/ikfHrIq4/UlbN8tvGDj395rt/P2OcQ5v4mDQyp/Q6WJIf9/+DW/b9oNI
         uT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369307; x=1793974107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGrdsvz70oET1GgEqFqkefkFXtM+kYm4wLwbKsNMt9o=;
        b=LRBl9+Lf8yXemHrSzjkiQo8AeP99NE3DG26pyJ4JAln3NHr3zHWxpXxUEVzCN4Fgj+
         gCfYv0b+dToXc6e/tVUPus1CeFJv3gqu8EXTeMKiw3DD52uUdE3VfEwyMl4p5ZeK68H8
         ylGmLWjZCECtBBP4lIH6IPqD2uQp++F7vRrZozJplR3w5BLAcUFa0a8nDQkIc3pwuzcK
         Yq+RUkjQXErvFFSI5mmqz+J4dlqRpNh/kGQI2Ek2rOv0LSP0P0hTQhCcXPwygtF68XbF
         EpnVxFKAxeuctZ26ep+/aIQ+cKXCVX1MkGPHipCPFMI28ERzZTAw6KadVdo8lRpZaVc1
         p0Fw==
X-Forwarded-Encrypted: i=1; AKwUvBzlicIwgBqMysCG8phTB75fzaH9c8ViVL6/Sy6Qy+/PfmSNjIVWh3F6FP1kS2DyEN6UQw/HgMtiAFIM2g==@lists.infradead.org
X-Gm-Message-State: AFq9FYI2s1R5X/ngNAJiCXm0Tbbnu8/b8m1jF81veF2Y0EVAgKTVDXn3
	dqdfl3yzEUI+G/xh5FFW02m6lSksWfY98uk4Iu5e1rfekuONeL7NgMj/TvgR4kAG6D8=
X-Gm-Gg: AYBFou3G551lkWqR0PhMmosZfkBBzFgpT/8OPkUb0w2QYbsm5XQBSm5q7VEkZBs43Ny
	4ZxdF/N16fhiEPUoHooyEAeBYuZh/klmcYY6phqzxn8EsPCSeq95uUpgJ/xmjro1qKTEf6o3I1P
	7XL0TOO22nUtpQWJy4IdaSbojLKBLY0AsEz6EHG1jxNRddyMj9zYCNPfYiIrJz8FNPnTX5592G4
	P7mzEqWVsKOW7d7SzxhMsFAJNldppuS0OW8nqdfcN5G6o5WMLy+mWcttnti0MihA4lT2r8UuuAo
	PEuJf7rhm0G1nl2EjO2qMt95v2t7o80t6T26Dz85lTm4jUNmXZZRzc6ax6uikPRScTXMYSxxjpY
	LjBSIsOu1sKM4rSywaZPKcyE5n+n2NJbFFwPMzGH358OjBt3cjlt9r43tPU3hRXX2srEOO2UODv
	DvmVxUBMF8+tPoZ+GR835EknTQMJpulSFj4kLZgZYA5Rdc0ZjiokSkkkotVL24Q12DHXdVj+D6+
	8D2hih8ZseytC76nwcnprcL+VqWm9Lz97I7dzlS3pNUD9meTSiJZnGhrbAlBCS9d89Fx0pmpE6S
	v1rJpBNK/THhfVABZhMYQG6Dix+DBL3n4KC8VGitAP9RjSwVPp4=
X-Received: by 2002:a17:903:24b:b0:2e3:1bb4:610d with SMTP id d9443c01a7336-2eb364f6800mr27744295ad.50.1793369307550;
        Fri, 30 Oct 2026 07:08:27 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3929b27bsm7601795ad.62.2026.10.30.07.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:08:26 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 0/4] mm: Simplify device DAX vmemmap optimization plumbing
Date: Fri, 30 Oct 2026 22:07:16 +0800
Message-ID: <20261030140720.1256062-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_070832_949695_0CF0B39B 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This series is split out from the earlier, larger series "mm: Generalize
HVO for HugeTLB and device DAX" [1]. While the parent series generalizes
vmemmap optimization across HugeTLB and device DAX, this subset addresses
a single, self-contained step: simplifying the device DAX vmemmap
optimization plumbing.

After device DAX was converted to section-based vmemmap optimization,
whether a mapping can be optimized is carried in mem_section, and the
architecture-specific population path can handle any remaining fallback.
The code still retains the DAX-specific vmemmap_can_optimize() helper, a
PowerPC override, and @pgmap arguments threaded through lower-level
vmemmap population and memory-removal interfaces. These duplicate the
section-order policy and keep otherwise generic paths coupled to
dev_pagemap.

This series removes that obsolete plumbing by consolidating the
optimization policy around memory-section metadata and simplifying the
generic and architecture-specific population paths. This also eliminates
dependencies that are no longer needed once the optimization state is
carried by the memory section.

This leaves the section compound order as the single source of truth for
vmemmap optimization and decouples the generic sparse-vmemmap and
memory-hotplug paths from device DAX.

This is another smaller step toward the broader HVO generalization.

[1] https://lore.kernel.org/20260513130542.35604-1-songmuchun@bytedance.com/

Muchun Song (4):
  powerpc/mm: make vmemmap_populate_compound_pages() static
  powerpc/mm: drop powerpc vmemmap_can_optimize()
  mm/sparse-vmemmap: drop vmemmap_can_optimize()
  mm/sparse-vmemmap: drop @pgmap from vmemmap population APIs

 arch/arm64/mm/mmu.c                        |  5 ++-
 arch/loongarch/mm/init.c                   |  5 ++-
 arch/powerpc/include/asm/book3s/64/radix.h | 12 -------
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 23 ++++---------
 arch/powerpc/mm/init_64.c                  |  1 +
 arch/powerpc/mm/mem.c                      |  5 ++-
 arch/riscv/mm/init.c                       |  5 ++-
 arch/s390/mm/init.c                        |  5 ++-
 arch/x86/mm/init_64.c                      |  5 ++-
 include/linux/memory_hotplug.h             |  8 ++---
 include/linux/mm.h                         | 40 +---------------------
 mm/memory_hotplug.c                        | 16 ++++-----
 mm/memremap.c                              |  4 +--
 mm/sparse-vmemmap.c                        | 34 ++++++++++--------
 mm/sparse.c                                |  6 ++--
 15 files changed, 54 insertions(+), 120 deletions(-)


base-commit: 5e6c45aaaf93343c7f8a1cde9797080238af5c1b
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
