Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32F8C44514
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lVk5hsuk+XVup2H3xJy3cW/owjrDgK6q8MpaJ9lYYAo=; b=mZMfBlw0aAQYol
	TMVWbBhwUwB1bqx11AT3nS9F965wft1+MmbTzouGQ+PUjArHx1+uI5zg1ETgZyP8jb3rEItwF9XOq
	VGPOAFlmQWW/pKiGPtozw1Xb/Jk9/PGariQqn7zUz8MomNlJxOs/EDFOu5ukCvN3b1RpNHpObZ3wD
	/Lk8zmBaIKc3EA8xo1gi1bXV99wNF/tQbcgNPvqyOzertTbirj3l6gGozJtV6JIqZHpnmIWx5Zuls
	3Ra80Of+z9iYo4KmzeijjQ7qJ0xFe2eEnz7iDQOy3SPvfVLiyJSTlb9Zmsbs3d3G+atEYWEQyvEGF
	GOd9b7KaCf4sscWBBCfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLQN-0000000HHnR-0QOu;
	Thu, 16 Jul 2026 12:42:47 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLQL-0000000HHm4-1PbU
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:42:46 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8487b7b4066so6756930b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2026 05:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205762; x=1784810562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SXHE9RUaBpTIzBZsLxmZxoZ7/zzqOF995lpxXageMRM=;
        b=ZSlz/rydIG3nxH2Ac0zHhjeSzaBJ3ccyhBe/EcBXUhFiHfsqpo/MX//1z++V47vN0Q
         jAJmy2cSQPYetzd9ATulIUkc8lxqfO11FOEkwhZq/dZVjKKu6c2C1sef0TauXleXmzxG
         SFcH9ubNULyVgY+E8Jz3Tz5eN5+t8BHPiYbKpitvFjp6p69FiljOXmhcrB/hUAqGA1Ib
         nlTcS27JBqXoH2/yCd40F3Ygga5O+NudB0o1qDHEApaCp98dGnOIaBCBBBjDFy/dXkMG
         203qDQx+PolmlhakE6fKZ+oVHmuCbSNUux0SmWNmUHmMBn+utMsneB/tKXn7K1rBz6N/
         c1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205762; x=1784810562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXHE9RUaBpTIzBZsLxmZxoZ7/zzqOF995lpxXageMRM=;
        b=QOI1j9eqO74D9HE2MxwCshq9gpSjiUGMYUGrBGM2fP9MOFQLdq0pvc2J6+URq1Jr0B
         Hih2R/UaSn977JABHT/ev85emhveFFCnRr+ArJ+MSBTmjbaVAbuRAqiBGX+FFZTqtfUR
         d7KI0Q3XJV2hfzljSJU/4EZNp1ZOXZioq0fvaV8Xr4qW9wWW1yfDKNqYcp+YTsK1aSWV
         zyCZy2cqW6IlRl0PcvkBo/mwJd6/LTrXMa/JYtN0gVGedTyskygFqKwoHJDJe+AlfBGJ
         ZzHtGQIIaKtrJZIUtEssp+d5CeQL6y8FYezCTNqNFVB4EZ7iZqQEhM3lm4EHBY4UEk0E
         jg/g==
X-Gm-Message-State: AOJu0YzDReMIwAGZBVRpTVMngv4R62nIJYc0Im+wudLGB0p7aati6DWY
	PG3nAxEr53V+vrbBomJYQhfUYKPkoTH/9w5LJKKiej1cKk3iOJm8irO7w+YW6EQ4u4SNpb2drXt
	bygepRf4=
X-Gm-Gg: AfdE7clOkzZw9Ea7q/c9bkh51sHXuOiLN0ou+z/tX9N/O4DG0ncZe5vl9EJzw9Ff5pl
	ysYNQ3gvhZ4CelTv3Jf3I5AoENfL3SfRuttr8s8tSJqmYiexO9gaXQqT72Up6d47tHSZq4oeI5x
	IXvAxLVvK/0qssiemFuieqlnbYnta/Sh8QpDILCTAhw10MLPh1sCRY+yFP8+UIpR8uN3szYMeFO
	hDkEMqXEAUI9WmJKm2t4DWAtHzNInQsKT/oVNIlolJrqHmWtmK1RuVkPiwc6ugtpLbEkNEaOV0z
	xk8VTidORHfR2TX25Bgbs/kq1LhUblBKUd2wVZTjDMGPZQRDP9FjWyJzg45wX6BTD3v5WbauCoN
	+EI/xB74eDxo99kaSB4etcATOUgY2HbUrGRnBPq3Z1WiawpAyd3x3AUfeREaR7CWIOpXTU++u6E
	gS//mBBKLWa517f2tHUwXTGGA=
X-Received: by 2002:a05:6a00:815:b0:847:7f38:27c6 with SMTP id d2e1a72fcca58-84a672b4789mr6422956b3a.50.1784205761835;
        Thu, 16 Jul 2026 05:42:41 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.42.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:42:41 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 00/15] riscv: add Svnapot PTE folding support
Date: Thu, 16 Jul 2026 20:41:35 +0800
Message-Id: <cover.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054245_385837_0BBEAF01 
X-CRM114-Status: GOOD (  10.09  )
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

Svnapot can encode a naturally aligned 64KB range as a single folded
PTE block. This series adds the RISC-V MM support needed to use that
encoding for suitable user mappings while preserving the generic MM view
of PAGE_SIZE PTEs.

The series starts by adding raw PTE helpers and switching architecture
page-table users that must see the encoded page-table entry to those raw
helpers. It then introduces Svnapot read-side and update helpers for
folded PTE ranges. Later patches make the generic PTE batch and leaf-size
interfaces work with the raw encoded view where required, avoid redundant
A/D aggregation and TLB flushes, optimize mprotect() for Svnapot ranges,
and request 64KB executable folios when Svnapot is available so text
mappings can benefit from lower iTLB pressure.

Dependency:
  - This series depends on the prerequisite RISC-V patch posted at:
    https://lore.kernel.org/all/20260618064406.14508-1-cuiyunhui@bytedance.com/

Changes in v2:
  - Rework the v1 7-patch series into 15 smaller patches: split raw PTE
    helper introduction from the architecture-user conversion, and split
    Svnapot contpte handling into read-side and update-side pieces.
  - Add the generic MM helper changes needed by folded Svnapot mappings,
    including folio-batch comparison flags, raw-entry leaf-size queries and
    fast-GUP-specific lockless PTE helpers.
  - Make the RISC-V pte_batch_hint() implementation honor folio batch
    flags, and preserve Svnapot leaf-size semantics via __ptep_leaf_size().
  - Add follow-up fixes and optimizations that were not in v1: avoid
    redundant A/D aggregation, avoid Svnapot consistency checks in
    ptep_get(), avoid A/D aggregation in fast-GUP, remove a redundant TLB
    flush, optimize mprotect() for Svnapot mappings, and request large
    executable folios when Svnapot is available.

Yunhui Cui (15):
  riscv: introduce raw PTE helpers
  riscv: switch arch page-table users to raw PTE helpers
  riscv/mm: implement Svnapot contpte read-side helpers
  riscv/mm: implement Svnapot contpte update helpers
  mm: extend pte batch and leaf-size helpers
  riscv: make pte_batch_hint() honor folio batch flags
  riscv/mm: preserve Svnapot leaf-size semantics for page-table
    consumers
  riscv/mm: avoid redundant Svnapot A/D aggregation
  riscv/mm: avoid Svnapot consistency checks in ptep_get()
  mm/gup: add fast-GUP specific lockless PTE helpers
  riscv: mm: avoid Svnapot A/D aggregation in fast-GUP
  arm64: mm: avoid contpte A/D aggregation in fast-GUP
  riscv/mm: remove redundant TLB flush in napotpte_convert
  riscv/mm: optimize mprotect for Svnapot mappings
  riscv: mm: Request large exec folios for Svnapot

 arch/arm64/include/asm/pgtable.h |  25 +-
 arch/riscv/include/asm/kfence.h  |   4 +-
 arch/riscv/include/asm/pgtable.h | 480 +++++++++++++++++-
 arch/riscv/kernel/efi.c          |   4 +-
 arch/riscv/kernel/hibernate.c    |   3 +-
 arch/riscv/kvm/gstage.c          |  25 +-
 arch/riscv/kvm/mmu.c             |   4 +-
 arch/riscv/mm/Makefile           |   1 +
 arch/riscv/mm/contpte.c          | 804 +++++++++++++++++++++++++++++++
 arch/riscv/mm/fault.c            |   4 +-
 arch/riscv/mm/hugetlbpage.c      | 135 ++++--
 arch/riscv/mm/init.c             |   8 +-
 arch/riscv/mm/kasan_init.c       |  16 +-
 arch/riscv/mm/pageattr.c         |  12 +-
 arch/riscv/mm/pgtable.c          |  52 +-
 include/linux/pgtable.h          |  71 ++-
 kernel/events/core.c             |   2 +-
 mm/gup.c                         |   6 +-
 mm/internal.h                    |  39 +-
 mm/mincore.c                     |   2 +-
 mm/mremap.c                      |   2 +-
 21 files changed, 1542 insertions(+), 157 deletions(-)
 create mode 100644 arch/riscv/mm/contpte.c


base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
