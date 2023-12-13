Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5D8C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 20:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0f8CD+X32h82w5SMoK6Xv3tCFR0YU/v+Ywg6buUP5j8=; b=S9rGeiDzIyLOt1
	fyyp+N3bAv4tr5VQYKVaSvp81+U8N9q/9gAe4cLkDzoU7aHTeNvQrGUL6nX1TtpCgWQSzTLhseTTj
	Q/XwC/erIpGpJwqgQnYn55Y1gNvpwgldq2CKrT/0XeUwQ7khz0fdN4Qoa3NStann36qIjC54hzgmm
	mUVecxEYJyToYoBj1TBBkym5mU8WQ3Xun9UtCU+u2Pd+2IsxetD62TslXgq9DQfiKvwendPw5rN1c
	q0Lluf5BrLNOZ7/9Ht1pl3HqTXowWEgIrL3W4peeA30mm6knOrHKwxZV2rUCmanknPsRAkZE2StJw
	kHRgTYOU2YuX1t0ltxZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDVs7-00FyST-2u;
	Wed, 13 Dec 2023 20:30:23 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDVs4-00FyQa-2P
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 20:30:22 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3363653e180so1719829f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 12:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702499417; x=1703104217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i+467Loz3LrvYEdXAV5s12LMqcUY9odwCyEv1IdVOvU=;
        b=p7iOXhAYcRxu67OsRPvsr+kURAnIY/p8j/pW3rYCiVsYPBlI5MO9BW/+v/uVy6ikC3
         IgSXFhFzXskwBJ/65lu6Q568HDMXWVAvJK9ohl4MQ2bc9lvjtlymlfHERR2JtH9tu4rw
         75IEANxgc+f78ghxhuFZq7TKQ7Xt4qteHQL45HePXHffeef7Xb5+VpLLsYX2YFBhPnGY
         C7tHWwiV25dTnGlwyYdTramaW4cuhB/IiOPq+4l1eYpYNaAsSfJT4alfns+s37JLY31c
         hZ7+fygkRyMHpG6K1TArmE5mVTTORx1MHGEWkl/atnNDpYFOJuXCShBzNUH8Klgnqs/C
         GXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702499417; x=1703104217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+467Loz3LrvYEdXAV5s12LMqcUY9odwCyEv1IdVOvU=;
        b=uLAnnuWkenjiVkBg0jRAfupbgnn27EaqpsriaLIKvdmNdhpVFcl0xa6mrCq1W0DPG0
         O3Qr8ePZzBqEOM51bTn2C2vg6d22u1FH+qB8hyARKohOJdYQUMCIpx6PnEeQ9U5iTg7M
         0ULNsXC/84vS2eku00DjHCTvdvbR942jg3c0xBuQUVc5mOwP3xX8cqo4fCwvvc6pFnWe
         KChNo/CddQLTTXMikSKX493RjDcBQaaBzxX88zbtxJqGUH4AuOPkrsn5bfpV5G5IkI4v
         zX6bS7Wg2ma3WJPWlQOCbSU7YrQOoAcNBe24jJ2eLz6qPsIW7jUxMUJuWQt7i5uQzqJm
         OlbA==
X-Gm-Message-State: AOJu0YzCpXpsoodp7yXbxpBCjQC5fQUz8IY5m9u+IJaZplUXr5Y4RHOI
	gq1fVRVoEOmpHoPbefEIqkhYGQ==
X-Google-Smtp-Source: AGHT+IGBLga6z9pG2jLj7Eh24QZCKuh/cAtflhfd+Zgtj1tOF9StAT24MMOv0TqcLPwKldvFFyI7jA==
X-Received: by 2002:a05:6000:10c1:b0:336:38ef:1e91 with SMTP id b1-20020a05600010c100b0033638ef1e91mr917003wrx.128.1702499416911;
        Wed, 13 Dec 2023 12:30:16 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id x10-20020a5d444a000000b00336371fafe6sm2945256wrr.16.2023.12.13.12.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:30:16 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Russell King <linux@armlinux.org.uk>,
	Ryan Roberts <ryan.roberts@arm.com>,
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
Subject: [PATCH v2 0/4] riscv: Use READ_ONCE()/WRITE_ONCE() for pte accesses
Date: Wed, 13 Dec 2023 21:29:57 +0100
Message-Id: <20231213203001.179237-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_123021_121276_071D1A76 
X-CRM114-Status: GOOD (  10.34  )
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

Changes in v2:
- Fix the kernel test report on arm32
- Remove the pte suffix patch
- Fix pud_offset/p4d_offset which were missing the use of accessors
- Rebase on top of 6.7-rc4

Alexandre Ghiti (4):
  riscv: Use WRITE_ONCE() when setting page table entries
  mm: Introduce pudp/p4dp/pgdp_get() functions
  riscv: mm: Only compile pgtable.c if MMU
  riscv: Use accessors to page table entries instead of direct
    dereference

 arch/arm/include/asm/pgtable.h      |  2 ++
 arch/riscv/include/asm/kfence.h     |  4 +--
 arch/riscv/include/asm/pgtable-64.h | 22 +++----------
 arch/riscv/include/asm/pgtable.h    | 33 +++++--------------
 arch/riscv/kernel/efi.c             |  2 +-
 arch/riscv/kvm/mmu.c                | 22 ++++++-------
 arch/riscv/mm/Makefile              |  3 +-
 arch/riscv/mm/fault.c               | 16 ++++-----
 arch/riscv/mm/hugetlbpage.c         | 12 +++----
 arch/riscv/mm/kasan_init.c          | 45 +++++++++++++------------
 arch/riscv/mm/pageattr.c            | 44 ++++++++++++-------------
 arch/riscv/mm/pgtable.c             | 51 ++++++++++++++++++++++++++---
 include/linux/pgtable.h             | 21 ++++++++++++
 13 files changed, 157 insertions(+), 120 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
