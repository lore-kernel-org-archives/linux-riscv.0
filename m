Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E37C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 07:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iBAiavzhSou36IJ1+Tp0pmoJ0GwrezD8TbkVBFlTaJg=; b=4zewlb3R5Yu38y
	DeEMrIRDrYdNusiXQHqilVGWqIftLXtWY+6ckyC4iX3jwEnvo+ZafQ1LvkY6aKxz9g5+8UeTrY3jf
	KiqdYi8uCOwksnpjEYiAET7WWNAwZhB8DohcH6R/MKhjPIscaM3aXAqNUgLWYr9coeJqpQRsFaFV8
	XFN5ZsIwHKhPoRxtxhrSWK4SrwGzSvz5vEJkHkUiKX3M4ymXiYNNY/B1Kff0BPwsXNjoUnWL2Zczd
	xIQlWhQXpaolkB587UVzx8NdQavM7Cw26E0i0NejOeb6IKW+9KRdLZQMaWdCN9rsI6tuWlNLvv8ud
	7HZLNlkS0xoJX/fmCMlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3gz-000000006hN-1oCK;
	Wed, 31 Jul 2024 07:24:13 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3gv-000000006gX-3i6q
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 07:24:12 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2eeb1051360so59066921fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 00:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722410648; x=1723015448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4XEkcH/k055fjEkxInfrnU37BtyQRrpfdUKb2KmHLI0=;
        b=WYPqCHsIyx1QSWE3NRm5GBE9nls/TWePUQtCUBIA8AlpyyuuE04qw49+XRusIl9Spl
         7Emr5oN+9YVforxlCqMWypKZdf+wJEVYsHbJWbOIeD0qCOOT+EMjrj7wJ0NnGkxheRgW
         G9Fw9T2yh5C2UMJpNh9PS0QEOshOUBClRd5WYBftedkhD/eAvEEN6Es5jEi8fgU2bWP2
         jRISWVIlEnf94H/7KtAamVmy82GdQBe3SJOpwKleR5N1r3iB/599cEk9mIds76TXmFwg
         zE57QzAfMuNevGpC13+dl6GNF5Xp5XuG3qGn5VO6kL5/XMcvq7iPORIOf0J0DAyqqvvk
         oeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722410648; x=1723015448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XEkcH/k055fjEkxInfrnU37BtyQRrpfdUKb2KmHLI0=;
        b=W9/xzrDyTMQXTV8N6RFo/mXWZlUHaZs6eWqDm7GI50R0pmBZ9PMdtxxrhfa/2v0LOm
         iFOJZWq7kOBarilowYnCY9Bui9h0TK4BrTqECFnYFvaj2844EeUeqyC0Zp5xD5+RGoLt
         FKTvKKw4ozkuKdhOpTRD7pI8BjngdwuJf+339sZuMdBxvvfFqHyUNlou6Fp0TWrTj/WY
         QWm0BUrnxr3VbR/qSVhZGOB3JWkOzanUYiq3f4A+3fLCoBWviWeCjEgcQdKBxCO+zCdH
         l6pkCC058LQjvfRofYm6NZ+jRHjXuFxuw85VN4RbGa7ZB7VUefZT5F43t8SiOMmP+p7m
         1xlA==
X-Forwarded-Encrypted: i=1; AJvYcCVF1W1EV9TffwtzrETUam0oBo4Sd2tAtqRplNv0MvyTS5hpToKxEXHy+K0RVce4eJHHGQ40c7H5zHNo5K8PQH75qJ3yBwRoAeXkTaatWyqO
X-Gm-Message-State: AOJu0YysORQSxFCqHhYhdOw7qhDuk9H8174mO2r7fYSlJjAxv6rgQU/h
	HDg+Rr8ct22rHTMcWgl00vhsrEZAbmZairvI51TWbUaWYBkz9jCnxHdpI+gkixU=
X-Google-Smtp-Source: AGHT+IFUu/TAKJpoCZRx6pt/JYQm0PBZfuQkxnnENTxesjAVIWWsosjIBVLI4RqCcJMR34ar/hYuOw==
X-Received: by 2002:a2e:9d87:0:b0:2f0:1bb6:dbce with SMTP id 38308e7fff4ca-2f12ee5af77mr90747341fa.41.1722410647587;
        Wed, 31 Jul 2024 00:24:07 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bac614esm10131295e9.24.2024.07.31.00.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:24:07 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 00/13] Zacas/Zabha support and qspinlocks
Date: Wed, 31 Jul 2024 09:23:52 +0200
Message-Id: <20240731072405.197046-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_002409_973936_5F3AC012 
X-CRM114-Status: GOOD (  20.26  )
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

This implements [cmp]xchgXX() macros using Zacas and Zabha extensions
and finally uses those newly introduced macros to add support for
qspinlocks: note that this implementation of qspinlocks satisfies the
forward progress guarantee.

It also uses Ziccrse to provide the qspinlock implementation.

Thanks to Guo and Leonardo for their work!

v3: https://lore.kernel.org/linux-riscv/20240717061957.140712-1-alexghiti@rivosinc.com/
v2: https://lore.kernel.org/linux-riscv/20240626130347.520750-1-alexghiti@rivosinc.com/
v1: https://lore.kernel.org/linux-riscv/20240528151052.313031-1-alexghiti@rivosinc.com/

Changes in v4:
- rename sc_sfx into sc_cas_sfx in _arch_cmpxchg (Drew)
- cmpxchg() depends on 64BIT (Drew)
- rename xX register into tX (Drew)
- cas operations require the old value in rd, make this assignment more explicit
  as it seems to confuse people (Drew, Andrea)
- Fix ticket/queued configs build errors (Andrea)
- riscv_spinlock_init() is only needed for combo spinlocks but implement it
  anyway to inform of the type of spinlocks used (Andrea)
- Add RB from Guo
- Add NONPORTABLE to RISCV_QUEUED_SPINLOCKS (Samuel)
- Add a link to Guo's qspinlocks results on the sophgo platform
- Reorder ZICCRSE (Samuel)
- Use riscv_has_extention_unlikely() instead of direct asm goto, which is way
  cleaner and fixes the llvm 16 bug
- add dependency on RISCV_ALTERNATIVES in kconfig
- Rebase on top of 6.11, add patches to fix header circular dependency and
  to fix build_bug()

Changes in v3:
- Fix patch 4 to restrict the optimization to fully ordered AMO (Andrea)
- Move RISCV_ISA_EXT_ZABHA definition to patch 4 (Andrea)
- !Zacas at build time => no CAS from Zabha too (Andrea)
- drop patch 7 "riscv: Improve amoswap.X use in xchg()" (Andrea)
- Switch lr/sc and cas order (Guo)
- Combo spinlocks do not depend on Zabha
- Add a Kconfig for ticket/queued/combo (Guo)
- Use Ziccrse (Guo)

Changes in v2:
- Add patch for Zabha dtbinding (Conor)
- Fix cmpxchg128() build warnings missed in v1
- Make arch_cmpxchg128() fully ordered
- Improve Kconfig help texts for both extensions (Conor)
- Fix Makefile dependencies by requiring TOOLCHAIN_HAS_XXX (Nathan)
- Fix compilation errors when the toolchain does not support the
  extensions (Nathan)
- Fix C23 warnings about label at the end of coumpound statements (Nathan)
- Fix Zabha and !Zacas configurations (Andrea)
- Add COMBO spinlocks (Guo)
- Improve amocas fully ordered operations by using .aqrl semantics and
  removing the fence rw, rw (Andrea)
- Rebase on top "riscv: Fix fully ordered LR/SC xchg[8|16]() implementations"
- Add ARCH_WEAK_RELEASE_ACQUIRE (Andrea)
- Remove the extension version in march for LLVM since it is only required
  for experimental extensions (Nathan)
- Fix cmpxchg128() implementation by adding both registers of a pair
  in the list of input/output operands

Alexandre Ghiti (11):
  riscv: Move cpufeature.h macros into their own header
  riscv: Do not fail to build on byte/halfword operations with Zawrs
  riscv: Implement cmpxchg32/64() using Zacas
  dt-bindings: riscv: Add Zabha ISA extension description
  riscv: Implement cmpxchg8/16() using Zabha
  riscv: Improve zacas fully-ordered cmpxchg()
  riscv: Implement arch_cmpxchg128() using Zacas
  riscv: Implement xchg8/16() using Zabha
  riscv: Add ISA extension parsing for Ziccrse
  dt-bindings: riscv: Add Ziccrse ISA extension description
  riscv: Add qspinlock support

Guo Ren (2):
  asm-generic: ticket-lock: Reuse arch_spinlock_t of qspinlock
  asm-generic: ticket-lock: Add separate ticket-lock.h

 .../devicetree/bindings/riscv/extensions.yaml |  12 +
 .../locking/queued-spinlocks/arch-support.txt |   2 +-
 arch/riscv/Kconfig                            |  64 +++++
 arch/riscv/Makefile                           |   6 +
 arch/riscv/include/asm/Kbuild                 |   4 +-
 arch/riscv/include/asm/cmpxchg.h              | 264 ++++++++++++------
 arch/riscv/include/asm/cpufeature-macros.h    |  66 +++++
 arch/riscv/include/asm/cpufeature.h           |  56 +---
 arch/riscv/include/asm/hwcap.h                |   2 +
 arch/riscv/include/asm/spinlock.h             |  43 +++
 arch/riscv/kernel/cpufeature.c                |   2 +
 arch/riscv/kernel/setup.c                     |  38 +++
 include/asm-generic/qspinlock.h               |   2 +
 include/asm-generic/spinlock.h                |  87 +-----
 include/asm-generic/spinlock_types.h          |  12 +-
 include/asm-generic/ticket_spinlock.h         | 105 +++++++
 16 files changed, 533 insertions(+), 232 deletions(-)
 create mode 100644 arch/riscv/include/asm/cpufeature-macros.h
 create mode 100644 arch/riscv/include/asm/spinlock.h
 create mode 100644 include/asm-generic/ticket_spinlock.h

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
