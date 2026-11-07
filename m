Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A3F606A32D
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 04:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i7Yf5LDG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Z6mXwWRR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IzfDOBLlH80oaIll9+Et12uGwVyhR2GfSA1HkEqo/Vc=; b=i7Yf5LDGQmqb1d1esW/uIWHi6N
	mXWhmCHGK9SJVor7FDIoM6mDkpvODDUQt4MZevmIop1XSeaORJj8ZObzFssW+MEFkPfSDZ63JG+3v
	qOG+WaveVmj+JAmhtLK44el3fsUDdVGWEshnVuKq3cG+Ar2GL5rVAz9dEiBUQZN6EL0yJUqmHPzvI
	78DsBuFbXqZMo9zQWZLWw7usc8WCW4sMQ0oxsK186qJ6Sl6hwcDhGueK1pCi6laUYpufmENyqKo7f
	j/oE+EvLFRfUAgDx251sjaH8KtdJ0HXDM4noyeJETE29Zp752Dx1izQ66DQwmXYZ21A3w6EuA9nyA
	AJAg4+6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPY62-0000000EBxk-3HOC;
	Sat, 07 Nov 2026 04:32:06 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPY5x-0000000EBwG-1yVw
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 04:32:04 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cc147d86bebso163421a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 20:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794025917; x=1794630717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tMJYIXC5HK/L92Fsjcvgr4iGfrMwtNzZGIshDMxf8u0=;
        b=Z6mXwWRRP+a3TYu6WNdL09X8y8ZvTjaQR8xlhguFl87+PXUxUAGl1Bb+I6YtW0rMxN
         qYZFHo/IFbQWhdSBfloqhwVzn9XwHxciIY1P573yd0cidlc4Ly5PCh3g8RvfTem2/atU
         8jvoxGwV0yTxS6+UnR2F66EQ/hvNft9sp5IH7Sm8LALVZJFF6aNWElRRGbg8TsjOGNwF
         NG6/eZh/7STzcP84oDp508f7vNPbjJ+x8496RgCeLlSYe/u6uOggarpVzquLL2rfHw1M
         7vlXkBJjkvBZHsl2g2mZOjc2iW+zcNO76uxeB6TTzAgs8GaNyXjntJUQqCaMjoYsRqTt
         F83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794025917; x=1794630717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMJYIXC5HK/L92Fsjcvgr4iGfrMwtNzZGIshDMxf8u0=;
        b=SDnNHF92R5qbdCOoe2c6Pe4ZbooRb/mxoj95/XV7SOdHgVx5Ahtj0Hdf9osfPANRws
         jBkINJ0/y0D6pPsaXlmRriuZxh6RgHycY2XfnjE1L1CXXgk8DML7FaUZ2WMNhHXywimB
         jNW4pm/Iir8dZqss5EkFs8TYWd5O12RBE26roFpTsTTYKR9BY8rCBgclQvax4171qVIY
         qYClaYaIyx5V3zYls/0JYRa2DT+ZxvtfyoatYLC3KWwHwVTh0b8OaIZOGrxVle5lzN7u
         94cIGxZutQ8G2bWtOWZKeb30aT1LkH9iiWY5wRcGRlxgSVtCJfQILTKGUakV+54VYpkX
         N6eg==
X-Forwarded-Encrypted: i=1; AL+hErF1/LHM8/2T4MtB6w9IYD8GWsFZjX4nk5jJQx8HY2pkaJ2URV7Wt1rQQzgBhsZ43Fy/i++fO1hIyT9lyA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+RpvoYrNrSvWQoSYbdZMbVBspQ3Bz/AYR4qQtsrhRgnhReoPLk
	UmTgLwAt5mq5rhn2CmDLYznqmAr3mAsKRYptLcKT6NkLe0Orsz6mMe8RFq4rSqZ2Zew=
X-Gm-Gg: AYBFou0TN05vEjKfEmmK84yQwocRzx6TKM6jkyaETJXTKvcAZpLxXO82Rk5qfxVsz3a
	X4G4/7vDRYB985OAv6w0nJ8+gfFejNsXUAfvaip+f3eW4imiDNrB4x2dwdM+AMHeeOqRuMHi6Uh
	zXYymERzD+yBeD7vBHiPDhJMiu5nsFLirwqUpRlAdgB8G51YIlT4NS4jRFheP5xusUzezMDwczA
	x2h43QnDBL48ryCgtQyTT3AYRTAzt6J7dzuaWPAP0AU0EdXWiKoxgyQSMqSLouQzLuh1ly6xIqz
	dQUM/TqBz01YrakurV9akyRL0pj6x7zbRR2QoQv/dOVsJhVCykx1yLSM+jHf7+ozdeWqdDqVMHr
	k4Mx9dIdsjjwiPUPDRPt/EVlEhXhaZp3uetVOwl1HiTtbW/3VRa+6FIjfg+hhU+NRAH3Kaw5FEd
	yiOa5mqe21fXtjqP5cJrpvlYtYqzTWMQyn+7YnyBFWl88jd16wd92J0cSatX3GszOunZZC143fp
	dIrGBZdAKYkfbli5QLDRvumlI9b0H/Xp6QM+xPZ1XymMAujEBafxsUX6KolN2so8fLLi4YJuN0+
	AeVYRrkqrgt33Ptg1FrUgKmE09rZHlmkm528aTSPF21n9hx6vdQPH1ZgSOlU
X-Received: by 2002:a17:90b:3c0a:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3b1060a6be4mr758538a91.13.1794025917280;
        Fri, 06 Nov 2026 20:31:57 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10584b66bsm1578451a91.14.2026.11.06.20.31.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 20:31:56 -0800 (PST)
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
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 0/5] mm: Simplify device DAX vmemmap optimization plumbing
Date: Sat,  7 Nov 2026 12:31:17 +0800
Message-ID: <20261107043122.25650-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_203203_501075_61E574C8 
X-CRM114-Status: GOOD (  11.35  )
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

v3:
- Rebase onto mm-new at 684242af7090.
- Move section_vmemmap_optimization_disable() out of line to fix the
  LoongArch header-order build failure (reported by Sashiko and the
  kernel test robot).
- Keep section_vmemmap_optimizable() in mm/sparse.h and leave the
  vmemmap_optimizable_order() relocation in patch 4.
- Tighten the disable helper checks to require one aligned memory
  section.
- Collect Reviewed-by from Lance Yang.

v2: https://lore.kernel.org/20261105061217.13302-1-songmuchun@bytedance.com/
- Rebase onto mm-new at dba8aba0a9a0
- Add section_vmemmap_optimization_disable() and use it for PowerPC,
  LoongArch, and altmap fallbacks.
- Add a LoongArch patch that keeps device DAX vmemmap optimization
  disabled while leaving HugeTLB HVO unchanged.
- Ignore section compound orders that cannot be optimized.
- Add direct vmemmap-optimization.h includes for architecture users.

v1: https://lore.kernel.org/20261030140720.1256062-1-songmuchun@bytedance.com/

Muchun Song (5):
  powerpc/mm: make vmemmap_populate_compound_pages() static
  powerpc/mm: drop powerpc vmemmap_can_optimize()
  loongarch/mm: disable device DAX vmemmap optimization
  mm/sparse-vmemmap: drop vmemmap_can_optimize()
  mm/sparse-vmemmap: drop @pgmap from vmemmap population APIs

 arch/arm64/mm/mmu.c                        |  5 +--
 arch/loongarch/mm/init.c                   |  7 ++--
 arch/powerpc/include/asm/book3s/64/radix.h | 12 ------
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 23 ++++-------
 arch/powerpc/mm/init_64.c                  |  2 +
 arch/powerpc/mm/mem.c                      |  5 +--
 arch/riscv/mm/init.c                       |  5 +--
 arch/s390/mm/init.c                        |  5 +--
 arch/x86/mm/init_64.c                      |  5 +--
 include/linux/memory_hotplug.h             |  8 ++--
 include/linux/mm.h                         | 40 +------------------
 include/linux/vmemmap-optimization.h       | 31 +++++++++------
 mm/memory_hotplug.c                        | 16 ++++----
 mm/memremap.c                              |  4 +-
 mm/sparse-vmemmap.c                        | 46 +++++++++++++++-------
 mm/sparse.c                                |  6 +--
 16 files changed, 89 insertions(+), 131 deletions(-)


base-commit: 684242af7090928ada5e48fd40a0f3a539b3fd5b
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
