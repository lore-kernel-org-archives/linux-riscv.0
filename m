Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A59E6F096
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 00:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ruv+TZWLBG9lq3vRX0ecLDjXsy9/+5+fDkLo1xd14wk=; b=pggnPeihrNLKG6
	huFQRT/vzssmQaVzgL6IV0WToZvVgdIRInBBBfOCb4F71IwhNQraGPwDhvMSvyBfcxNp2hWPzIuAC
	agUOg2eJ6qHghe1EDxX6zm7F0YiSQiD5UyJFbmV72Dgp7lnhE8eD+R90g5rRowEcxlFNhKxEdCrKV
	v+bhHomHkFRET7X2XU3WWKziSW+c+4v2J8R4ca7SsfwwpX76p1wQ+H9PMXh0me2xY6JRYjiJwnsT6
	HW/xmTapyXaXwHW6AZZK4uklXklf7TdiTha4Do+0eQ09n57TrA7y1Hr56h++PEwAlxeSR0X+zA8rU
	+o6hI5ONyBGfBCf+1iuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t71hC-00000008Zxt-3Iwx;
	Sat, 02 Nov 2024 00:08:50 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t71h9-00000008Zvz-1u2A
	for linux-riscv@lists.infradead.org;
	Sat, 02 Nov 2024 00:08:48 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7ee6edc47abso280740a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 01 Nov 2024 17:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730506126; x=1731110926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aIhpdvnS8o3S/1rCndHZDuodqexaWU66HXZlQq3UlG0=;
        b=JjQhxAR30rbjfTwocmo+qw2T75uI18+ibslhhHl+5RKWnGtnNZWtSz3ksvvOnEmu/f
         kjCanvYGIaezM99SJMDZzEgBz9VRaboAdXeLKqUuVqF3g3MuQtHDWLTSkItl0QxFsIxz
         1npfbDRNfVYhB9FviO2zfJzVyC5A1PFTGZGWdEOP7jBVPe+zsq54jrSaKXQzDbXfTECo
         qLpAHgBcccAU8rhk6S1msT67vUd6nmVaQq8WNWxn7jlZm3WIKhCX04oYxyQdnkTMaeAw
         o1zyayjLZl7u2iYTsDQOLqaNmKEYR2kUTAbEw9UETGRMhRqUHCuWmTCKJy+CK/pLNUR0
         a44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730506126; x=1731110926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIhpdvnS8o3S/1rCndHZDuodqexaWU66HXZlQq3UlG0=;
        b=vadkrZhRIPlN1dJ9/3UI9ERRXN2e7EwjyYiMZt3rFupdhqTfIc5XJBzi6ddf/P/cNO
         ynlmDXs0TLGMUeDNCT7m2TSW2Uj7GlBoUYdAIkZVhVfY5E8krpbRJoLD8veJvJ3jHuEL
         9d7gACz2IWagS7bswua37IJyxTr+EE6Zl05t0DztIn0aFO/V3ulOkfUHB0+XbTZYZKCP
         OgPfF+4VkenmyklmmbwqrbjqXToVqQccLwOxz1oWTudEMwD2gy6Sz4CSlgHqYPGXxZxE
         ihTpBhnBjCTa/GtpGbsZlWbiIVu81x/qKH35bin19T133oy1cHJpx1M5hew5NofukuJ+
         H9gA==
X-Forwarded-Encrypted: i=1; AJvYcCX61hjuN+lnFaOeIuHVIF69wS4Z3qe0vp5DqRU9Cb1RHEtWbrEch2OLB69DQFngmsx9l6KuxSJgxCQ/yA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzojnckByrjqF9NgQx1X+3S9aIlf4uWhoQVKGtycLTdw8ccr/Jb
	s/5QneAYi1H/60y6nyxBUTetMAwXUWhhVgIc/JhgZvhl6KmwUP84kKzGOZBS1wI=
X-Google-Smtp-Source: AGHT+IGxRCScMcMwaEc4b8BuDdYdlI8xB6N08mWjuTEIlyzLl/T60XD5jgJmmZ/EAdywce+JIj7weg==
X-Received: by 2002:a17:90b:1d52:b0:2e2:991c:d7a6 with SMTP id 98e67ed59e1d1-2e94c2da7a7mr7437178a91.19.1730506125787;
        Fri, 01 Nov 2024 17:08:45 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fc00856sm5505749a91.54.2024.11.01.17.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 17:08:45 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 00/11] riscv: Memory type control for platforms with physical memory aliases
Date: Fri,  1 Nov 2024 17:07:54 -0700
Message-ID: <20241102000843.1301099-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_170847_527771_A2FE4422 
X-CRM114-Status: GOOD (  14.21  )
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


On some RISC-V platforms, including StarFive JH7100 and ESWIN EIC7700,
RAM is mapped to multiple physical address ranges, with each alias
having a different set of statically-determined Physical Memory
Attributes (PMAs). Software selects the PMAs for a page by choosing a
PFN from the corresponding physical address range. On these platforms,
this is the only way to allocate noncached memory for use with
noncoherent DMA.

 - Patch 1 adds a new binding to describe physical memory regions in
   the devicetree.
 - Patches 2-6 refactor existing memory type support to be modeled as
   variants on top of Svpbmt.
 - Patches 7-10 add logic to transform the PFN to use the desired alias
   when reading/writing page tables.
 - Patch 11 enables this new method of memory type control on JH7100.

I have boot-tested this series on platforms with each of the 4 ways to
select a memory type: SiFive FU740 (none), QEMU (Svpbmt), Allwinner D1
(XTheadMae), and ESWIN EIC7700 (aliases).


Samuel Holland (11):
  dt-bindings: riscv: Describe physical memory regions
  riscv: mm: Increment PFN in place when splitting mappings
  riscv: mm: Deduplicate pgtable address conversion functions
  riscv: mm: Deduplicate _PAGE_CHG_MASK definition
  riscv: ptdump: Only show N and MT bits when enabled in the kernel
  riscv: mm: Fix up memory types when writing page tables
  riscv: mm: Expose all page table bits to assembly code
  riscv: alternative: Add an ALTERNATIVE_3 macro
  riscv: alternative: Allow calls with alternate link registers
  riscv: mm: Use physical memory aliases to apply PMAs
  riscv: dts: starfive: jh7100: Use physical memory ranges for DMA

 .../bindings/riscv/physical-memory.yaml       | 101 ++++++++++
 arch/riscv/Kconfig                            |   3 +
 arch/riscv/Kconfig.errata                     |  20 +-
 .../boot/dts/starfive/jh7100-common.dtsi      |  30 +--
 arch/riscv/include/asm/alternative-macros.h   |  45 ++++-
 arch/riscv/include/asm/errata_list.h          |  45 -----
 arch/riscv/include/asm/hwcap.h                |   1 +
 arch/riscv/include/asm/pgtable-32.h           |  19 +-
 arch/riscv/include/asm/pgtable-64.h           | 178 ++++++++++--------
 arch/riscv/include/asm/pgtable-bits.h         |  42 ++++-
 arch/riscv/include/asm/pgtable.h              |  55 +++---
 arch/riscv/kernel/alternative.c               |   4 +-
 arch/riscv/kernel/cpufeature.c                |   6 +
 arch/riscv/kernel/setup.c                     |   1 +
 arch/riscv/mm/Makefile                        |   1 +
 arch/riscv/mm/init.c                          |   8 +-
 arch/riscv/mm/kasan_init.c                    |   8 +-
 arch/riscv/mm/memory-alias.S                  | 101 ++++++++++
 arch/riscv/mm/pageattr.c                      |  17 +-
 arch/riscv/mm/pgtable.c                       |  91 +++++++++
 arch/riscv/mm/ptdump.c                        |  19 +-
 include/dt-bindings/riscv/physical-memory.h   |  44 +++++
 22 files changed, 596 insertions(+), 243 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/physical-memory.yaml
 create mode 100644 arch/riscv/mm/memory-alias.S
 create mode 100644 include/dt-bindings/riscv/physical-memory.h

-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
