Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1515E784BC
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 15:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yGj1En6gFcpbk6Sxu4NKj8kjWWyxzKpJXpvIoUhAEFs=; b=1P32tGOqqhYCwA
	eGCwmb4+Td6VwlD/GuXLQE2ozRJDZqUULogmkpEIYDN5kjbHRddeiJVBb4EYBOIawn5ebgmY35o3M
	h2rjidTpoW4kidadCOtQi4w2HMpOVWHAH9PBczwog8Tb0kD67Z+2nVW5qRrX3x1OuF53QvtpJFMgp
	py0eCKFyK8z0SZJFKvcSScf8gi2arNSyr5joWzN6sy2rAo3P2ufE7NwwYhyRmXZaA6wLr1lh+14NA
	5gexiaug2GsL9t5OkdgU9U3HY1JwsSuRBJTnycQEQwWgtYWR8FV3nsa1l8632y2C85bRaY9RFzEpl
	+B+vfZDLAj10T6qHkA1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKZG-00CwlC-1s;
	Mon, 02 Oct 2023 15:10:42 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKZC-00Cwif-1u
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 15:10:40 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4064867903cso66247515e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 08:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696259436; x=1696864236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BviuOqu94hunsSO/3Ul5WhMTTjDvZpGvaCCYOAqyBa0=;
        b=17qxy/E8hVehPs50g/ztUkaCxvR3ZVVV/jad9ayW3rX9B5g9UAX2qLJOnTThLzJdlX
         ry5tfP31riZIU/yRm5TrefJh5xZ0aFCEqvHiSZ2Ff+DDVUxBb+b1rHxI8jmUakdrxm0z
         JEJooU/Jr1XHMc0LRlLJDFyHV51DoVb0r7yK1bl8IvWzvcp8ABnjxj79WZSpOb0+U4/o
         SpKKqUa3Bgt4HfVDsa7XGYXWDPZam29k5d7ybIsdJQsVJjsaxkaaq9OR8KdU06pzcT/1
         BMSifqAJoD8KnoyAlWpAlPY3azs7CEiyI1ZqMs/LwfIuOJ6hH+No4SsChccl5sBMPxJO
         /uWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696259436; x=1696864236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BviuOqu94hunsSO/3Ul5WhMTTjDvZpGvaCCYOAqyBa0=;
        b=b+NKh13zxJIWnMzcBQHtnnR3goSMwF3OVBfVtgTpWDXX5rkLDk/1mEJCPtlaCsIy5t
         fKw6W7nHpCUdZTLm3aCKcloDSv8uuZgsFOtkZVzJMzFf20TQKq5xUqhn4eLzMrgoY9HY
         +i1CZB9ZWgIOA0Qo0pInOJfvry+2Dc/GfS/ql1KDIpI1dJks4M//UTKEe8BNJnL1h8Pe
         +qoGHN7uww34k7t6gJKDsQOiIm83Uq6fPAlSGesJ30PefcSiAhfKNT7ebQ06m1QnqjZU
         4+Csd/TR/OPrUytui1fPAp8IBxsMwBPY7A6KvaGq7Mk2A8a63ssgcu65npc4FQonUfjN
         YyZw==
X-Gm-Message-State: AOJu0YwelOvsBhHd9e/oH78yGD7WHOStGvUhPz1pcqvG/j1JPGTMG46V
	jPzULWyAoNMakqD+QeihZvyhHQ==
X-Google-Smtp-Source: AGHT+IFAtgaoRF40XzBvtOGWfYM9G4XzLkYMHt7t11y/gj67JLtREpQrgnLizsD6s7v4+vCjcvL7tw==
X-Received: by 2002:adf:ea8f:0:b0:320:1c6:628c with SMTP id s15-20020adfea8f000000b0032001c6628cmr11378844wrm.65.1696259436015;
        Mon, 02 Oct 2023 08:10:36 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id b16-20020a5d4d90000000b0031fba0a746bsm8493981wru.9.2023.10.02.08.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 08:10:35 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Ryan Roberts <ryan.roberts@arm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 0/5] riscv: Use READ_ONCE()/WRITE_ONCE() for pte accesses
Date: Mon,  2 Oct 2023 17:10:26 +0200
Message-Id: <20231002151031.110551-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_081038_821290_9A00C5DF 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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

This series is a follow-up for riscv of a recent series from Ryan [1] which
converts all direct dereferences of pte_t into a ptet_get() access.

The goal here for riscv is to use READ_ONCE()/WRITE_ONCE() for all page
table entries accesses to avoid any compiler transformation when the
hardware can concurrently modify the page tables entries (A/D bits for
example).

I went a bit further and added pud/p4d/pgd_get() helpers as such concurrent
modifications can happen too at those levels.

[1] https://lore.kernel.org/all/20230612151545.3317766-1-ryan.roberts@arm.com/

Alexandre Ghiti (5):
  riscv: Use WRITE_ONCE() when setting page table entries
  mm: Introduce pudp/p4dp/pgdp_get() functions
  riscv: mm: Only compile pgtable.c if MMU
  riscv: Suffix all page table entry pointers with 'p'
  riscv: Use accessors to page table entries instead of direct
    dereference

 arch/riscv/include/asm/kfence.h     |   6 +-
 arch/riscv/include/asm/kvm_host.h   |   2 +-
 arch/riscv/include/asm/pgalloc.h    |  86 ++++++++++----------
 arch/riscv/include/asm/pgtable-64.h |  26 +++---
 arch/riscv/include/asm/pgtable.h    |  33 ++------
 arch/riscv/kernel/efi.c             |   2 +-
 arch/riscv/kvm/mmu.c                |  44 +++++-----
 arch/riscv/mm/Makefile              |   3 +-
 arch/riscv/mm/fault.c               |  38 ++++-----
 arch/riscv/mm/hugetlbpage.c         |  80 +++++++++----------
 arch/riscv/mm/init.c                |  30 +++----
 arch/riscv/mm/kasan_init.c          | 119 ++++++++++++++--------------
 arch/riscv/mm/pageattr.c            |  74 +++++++++--------
 arch/riscv/mm/pgtable.c             |  71 +++++++++++------
 include/linux/pgtable.h             |  21 +++++
 15 files changed, 334 insertions(+), 301 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
