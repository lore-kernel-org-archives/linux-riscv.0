Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2393C3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 06:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3rf4AA0VVdH7ejs89BKVdPNYp1t5xNmffaxWcO/sDko=; b=pf3keEZISCas9H
	fXHMAXttUKXm6QfpVZwxretBrAEzl9laBr+as3lK9PP2N+4LeHNpjYmuj5yiYjfKTnJC2OFIOh0Mo
	KdEUcWhjrLX9wUrKiigtOQoTjHqEim3gjwE5oMJDGy7OHQ9S7w6sGn5ZJbZpVUc0U9JygItRHi4gg
	Qohpl0W6zW1CBvzkpJG3wkG9wPsFoeF2a2ltWc6P9W+IWhR7+egKLOkaMw/xBnfM1W9GwHj9QTkja
	fNuE0LlGjlP+scYY1S4l6FZ7nIEcp1D4CIxxtWLOqlVNz4YPCYKSxxhrujQq21OJNhuUUI2LKeh3F
	Cg2DiyjrNbshgG3KiUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTy1F-0000000CnQM-2ubN;
	Wed, 17 Jul 2024 06:20:05 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTy1B-0000000CnNA-28ZD
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 06:20:03 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4266ed6c691so41413715e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 23:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721197200; x=1721802000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yhNEaA58GnjE0ZOg3aM00z4yK1KZNxci32RzU98eyS0=;
        b=HaadIT/x/1oem5tWv7oMP9eJVzxVqV/+L+yIIXBdaPbfxECCOtKSJJqxN8fHjoGkga
         rx5BUu7hO01j66/wDNwOx8JMgifRqyHbBYnfkTShIhRjAx4GFVAuGq/Terfy8V3eqH9u
         o8wZ7iWFEhdibj/QSBmneWmSt70bMFvOJ+GSuNX4k6AzvktBs0aMYKnUQqP8hVcAVY70
         sQZiRcC0WrcRJB9/bnbdVmUhD1zqO0zSCx14JhYJ/mVOJfYy+J7HBOf9oN1V3cuw14qw
         xrNt29QAH1WLvUZ81GbEpDZY/gGDaCZM8tjrYfPbXYbiIFh+wRLFoVr1JsPnFOTwsT0y
         SjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197200; x=1721802000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yhNEaA58GnjE0ZOg3aM00z4yK1KZNxci32RzU98eyS0=;
        b=lMfpyCc6lC0jWfrqYpeXeUK7PlQO01rnyHfu65/knjy8SjNmodvBs9JcT90RI3JPL0
         h7yF6h7UZS6clbBPUBCdbSx7kj+d8d5XwOYIDc97ggA9f44k+EMWcGaEi0//COcTB72k
         oI9DMIgpu976MXrbwPa8khT9r5lyG6gc7co8duYBLlK+8ukVXORnCmaQFBZwulPyfwMn
         qMxMg5VA6VFrWGiuvgCRH+RJEVA1XoVDLwW60lnax4P/OQoPd2gbieUYzoMqFNbAeanC
         6msdx0AGwQvy0ruGGQQ9Rc2HpYrqGzYu/AflcZPgZF+pF/QTYFW/WFlGSQH0d1QQQ7Tl
         iJ7g==
X-Forwarded-Encrypted: i=1; AJvYcCVJpU0ANTpN/14yjG6g8+i1QC88UxAkPnIkVTXpl5PghmYx+OZk56flcHMUjr2I63fw4RojjschTQO8qi2bK4h+Kmp6R3dZsXhggH6C2LSW
X-Gm-Message-State: AOJu0Yyg+EcjYd/SHR59oGag5aAE+AUoIQgkbaQ4t7WPP2HlmBfHQY43
	OyLY671uIELIOFBwZPB+oAr0zwfM0y4ADoTbYlfx0DbysBJToRAMXe+HohMNslQ=
X-Google-Smtp-Source: AGHT+IH2Ub3+EknL1gUx1NfUraNKSGCuOCbZvlC/zfL0v4oiDuPs02HhZpBSCOUPP41ekb0rzD3Bvw==
X-Received: by 2002:adf:ef4a:0:b0:367:f05a:8f6c with SMTP id ffacd0b85a97d-368317935f2mr456419f8f.57.1721197199838;
        Tue, 16 Jul 2024 23:19:59 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0f18bsm10755605f8f.117.2024.07.16.23.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:19:59 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 00/11] Zacas/Zabha support and qspinlocks
Date: Wed, 17 Jul 2024 08:19:46 +0200
Message-Id: <20240717061957.140712-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_232001_598746_0C8EC0FD 
X-CRM114-Status: GOOD (  15.13  )
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

v2: https://lore.kernel.org/linux-riscv/20240626130347.520750-1-alexghiti@rivosinc.com/
v1: https://lore.kernel.org/linux-riscv/20240528151052.313031-1-alexghiti@rivosinc.com/

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

Alexandre Ghiti (9):
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

 .../devicetree/bindings/riscv/extensions.yaml |  12 ++
 .../locking/queued-spinlocks/arch-support.txt |   2 +-
 arch/riscv/Kconfig                            |  64 +++++++
 arch/riscv/Makefile                           |   6 +
 arch/riscv/include/asm/Kbuild                 |   4 +-
 arch/riscv/include/asm/cmpxchg.h              | 173 +++++++++++++++---
 arch/riscv/include/asm/hwcap.h                |   2 +
 arch/riscv/include/asm/spinlock.h             |  39 ++++
 arch/riscv/kernel/cpufeature.c                |   2 +
 arch/riscv/kernel/setup.c                     |  33 ++++
 include/asm-generic/qspinlock.h               |   2 +
 include/asm-generic/spinlock.h                |  87 +--------
 include/asm-generic/spinlock_types.h          |  12 +-
 include/asm-generic/ticket_spinlock.h         | 105 +++++++++++
 14 files changed, 424 insertions(+), 119 deletions(-)
 create mode 100644 arch/riscv/include/asm/spinlock.h
 create mode 100644 include/asm-generic/ticket_spinlock.h

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
