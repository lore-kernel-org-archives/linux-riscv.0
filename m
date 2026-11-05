Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB809606A32C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 06:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ph3rjSjK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=EQsr1ssG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+CWSu4pdbYX3cXv99jD3HhW+eV+WfPSlCFMZ4U6W/p0=; b=Ph3rjSjKh+4gt5cd7VbIIQQcI2
	Eo8+VT0tS37+AUVs5ZPI3Q8iNdU9VZR+wkmiIfyyz7f/4IyNMlEp1CyyBryDy1c0MkJY8ncRTzDKJ
	ry5rAPwrhu3FIOYCKJuhZjiAFlkRw2JHZyAz9kIImcCcMG7ZLPMIrZUD6N3/OUJHmbiLSuVNwURVs
	7LfPPU0ARVhMYWC0rhT2cIf1FUHRl9l9vcyGu/qrZESm67bO7wgElyQITp+LYOIQ9WSDsWKs36Eg9
	6nMOAv5fy3ROwQD6fLcqUsmtRnlF6a43uH2cvUQccupGiZGfTzBy0ijq/P7hwEdTj+7mJ+Nnm2L/i
	F+l0o24w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOqiI-00000007v6Y-0eTN;
	Thu, 05 Nov 2026 06:12:42 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOqiE-00000007v4n-11Py
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 06:12:40 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso1089183a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 22:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793859154; x=1794463954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=86mQJyKlXA+m+CUFz+gI1B4tAIO9REzBudSQUtfJrm0=;
        b=EQsr1ssGqelRhA7S9v5/D3QFDDUP3QfJSHjJYU/PwvexBtwMQQN0gxBKDw1cYO7hIk
         XbhrhU5N+eMndo8mktlq4BPQTJFNsKvqi6N7O+W012taPuec/kW9fUTJI4k9CuuNaQxd
         pSJSSyim9uvMk+JvJbIItIpRJns7bQTRiIceZvyJVMtob616nvxt20gVOJTmBrOf9yeG
         ktHfFk1OFgeUZhcTtAis3tq3Hf2FVFbvd0lDFV7OEWK0xXujNIs5gNrG3FmKR8Ydg7hE
         I2OGjt7BwmfxZyKETw7g5f3lvQ0oytuQ1x5Ta7e2zDhVC6D4X+C5xMX3m6TtKjRmXTDY
         /XYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793859154; x=1794463954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=86mQJyKlXA+m+CUFz+gI1B4tAIO9REzBudSQUtfJrm0=;
        b=rEafeD+wblGpuqSpdtIDeXhaaGyHjgcDKvNhaG8fDzNyRfQIvCKYhzUGlAaUy3XYV/
         dbkLHfP1cVcw8J9fkSPFSK4aTlbdQofQlsdetshFQdwYeYCXQchREOlg76GYK5VQD+eN
         uoCdMNg/6L/OJbLTIu4xaOt5ijiCWfQxTOzXnKsvEPItH2rcrO5W3h2088DvqZMpxBvU
         IHrfmvPZI3ltIzjorJLETFAoIDnZSIYTdjcEbJBRlkugSWq29dwNupwca9KyX3kiwIII
         tJ5eeW/GlN5LNjAahaTlSYeyPRTXcrHzE6ZChGWro00jMEJfFr44D4EN+WlSJ8Ou3pYM
         A2Mw==
X-Forwarded-Encrypted: i=1; AKwUvBy047GSFXX8pHBXOLN2rWRUiPuMtZeY7FOws5HXRfIt5ZLAV9Vmplh66Wq1KLtPVfb0xqbqPqBthgOzPw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+AoPKQ39YiYsrCzyONnpCJCcctOGotECDFX+UoNVjZjJVjDRPL
	4PvYn2NQf3f9lI1CPUyjkpTI/nn+4V6uI1QRl7V36NKx016+CqZb4zCnvnCBxI0AoR0=
X-Gm-Gg: AYBFou3mvaUqxFAwc68G79lzovSBEcThOd7O6wM5MH/+dKCOBao4TldoFQB3OC+4pZP
	dBDlkFCMAA2RfWH1I9lUM4k6ooXwqc8XLwIZXuPqJRDKvbFV4Dje5QegZI2WxZXsRKznPtoc5n6
	Wr87Aeee7+/Qiqp4WmJeL3qDaLKnKc0KmpC8T0XCMkrlWazWLIdBsJpvjiV6NV9dn0gD33uwuyG
	f28m6UniygUm0p6vkBDe6al4QZqr0vheoldF2g+2/psDSfe4V9GRqCfU4yQlTLzLGbxa1cMVIG5
	bNoBSfPZUfOCvJyGzhv0bYwfSgRiZTz9MFQT4sZbUFN4X/AsAxEa05qBPI2qNeYllZB90d6BpKk
	xgX9ji6zWtCITeeIpgWTdCd3p3scm8RvWpHWs0dKCxUOYNSIiSaHL1F2+7yQIr5naEL+0ii+O0U
	pJK49Dy0rfUyq79azB2yX8+GDsNKDzF4RT+/alD2BbF+CJZKes/t0tYmV2KP3273D74C5qBb25r
	5OoaVHMJHg20r/PCT2CWHCpJqasjn7jQiid1i0MgmmXZViSLTEwaK5E3EYa5l3i9gSIK8eTFchq
	eCO5eCp8resj09cuNzhRe9RQUCxwpdkspUXBZtYjWQCcZEhEoGQq9lcFhx2EHJAORg==
X-Received: by 2002:a17:90b:3844:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3ae89814e4fmr15532805a91.30.1793859153687;
        Wed, 04 Nov 2026 22:12:33 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm2107528a91.5.2026.11.04.22.12.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 22:12:32 -0800 (PST)
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
Subject: [PATCH v2 0/5] mm: Simplify device DAX vmemmap optimization plumbing
Date: Thu,  5 Nov 2026 14:12:12 +0800
Message-ID: <20261105061217.13302-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_221238_683377_A219D9DE 
X-CRM114-Status: GOOD (  10.43  )
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

v2:
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

 arch/arm64/mm/mmu.c                        |  5 +-
 arch/loongarch/mm/init.c                   |  7 +--
 arch/powerpc/include/asm/book3s/64/radix.h | 12 -----
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 23 +++------
 arch/powerpc/mm/init_64.c                  |  2 +
 arch/powerpc/mm/mem.c                      |  5 +-
 arch/riscv/mm/init.c                       |  5 +-
 arch/s390/mm/init.c                        |  5 +-
 arch/x86/mm/init_64.c                      |  5 +-
 include/linux/memory_hotplug.h             |  8 ++--
 include/linux/mm.h                         | 40 +---------------
 include/linux/vmemmap-optimization.h       | 56 +++++++++++++++++-----
 mm/memory_hotplug.c                        | 16 +++----
 mm/memremap.c                              |  4 +-
 mm/sparse-vmemmap.c                        | 29 ++++++-----
 mm/sparse.c                                |  6 +--
 mm/sparse.h                                |  5 --
 17 files changed, 97 insertions(+), 136 deletions(-)


base-commit: dba8aba0a9a00ff781c03d82ae534fc6f8c2e263
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
