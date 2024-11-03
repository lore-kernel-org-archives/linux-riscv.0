Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65717D11101
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Nov 2024 14:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3FNptlP5+8Wz5AeuuumfrA1Z50pPHs2Y5tCY1EC8sV4=; b=eTs0a4EnzJocXX
	9NCuqOREmvu+it/B8EEdFFemK0AJEAzzhDvc6DFaeIEtcNtsdjocW8FpWZ/FUeUlhguTZCzsilrq7
	5lHy6JpBh+cbqQy2yngoMsQ6mxa1k/FZrqeja8gZa4MM93oBzikGam0L4DnPyOo/ThRPXQWAoghXA
	7v5/zI1ggTkb+HaAgllReezIf1OspXkv0Wwd+/2Kdx7JvqHhIjz+RA4vNP7U2XG/XB/9K4hEkgzHT
	KoR7rVGh28v5R3glU7783vtrIGTa6mge8CODPyxk8NT81F5UArKqWNU04z01tl6itaTDHT7DAzyGc
	ivIimllC4bDbZZd4Z6IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7bxQ-0000000BYzQ-3iyB;
	Sun, 03 Nov 2024 14:52:00 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7bxN-0000000BYyy-4Bpo
	for linux-riscv@lists.infradead.org;
	Sun, 03 Nov 2024 14:52:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso29172055e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 03 Nov 2024 06:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730645516; x=1731250316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jSppsV7RjjZ1bmxB7W4Mk7Rcpn8dl6Te+yVP1IF48lU=;
        b=Wqz8/PTtg5BgQCm6/DonZTnOZ2Hv9q4CUWMQwA03SCgiBYFQStT2LU9ngoq9rdzKpi
         rYkB7kade7K1XIE29oEEOVGFdeiu8n9HcmaKcEgPK2NQrBxdAh7ELG2yUmn4R3UB2VEH
         fElX5HNAkp0pXP2jPi/I8yWdexPAbl05l1Xih4culBDCh6qSMTq4BWANlq6XAGHEVXMi
         rC5IkUjux2VpaNEg3Mj4Q0ZaZjIx0GQ0t+4/qsyIrwIp0VfYglp5c5vcrpFqnyrz1gdm
         P8rAzbNMQDVfHi/o82DzJtkn8P7pSrPF2Q9o2x8LBljVhFheJOnBwzaOy0RWn5WrV6Iw
         EzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730645516; x=1731250316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSppsV7RjjZ1bmxB7W4Mk7Rcpn8dl6Te+yVP1IF48lU=;
        b=wgdvZgCE/56Q8hd0PsA1ebvLfmDV+mKdXg/gkKF31mq0bgjtEQWPn0vXRdBFdnvQxJ
         e2kYntUyNORcFom9XkYiS2/TOSrfxpn3kqa84Edg+HIM6aomp3ki28uRAu2PmgMvmny4
         IwiAfSALjdAd5Bk1pwbBMpF9wQk8fJSEM5PK/9ddY4bwJz6fN8fV9DDfH2nQKsTI9NfZ
         G3qo4iNelpscFydHFK+FRgetERWotaHntlROPsFs/0DEMjuGTMEpkYrnN3uF3CSDtA/8
         mj51dgnY9qRKkVY1jgi5NycBFBxz83GZpDcaJ+bvqzB/GtqpkbP7DJn6Rob3ScPJOY07
         1Cuw==
X-Forwarded-Encrypted: i=1; AJvYcCXTa6KVzIAI0VsscQe9S4p9TUcOnmcSM05fcWiCVPGe4Lum/Suxw1x7ZnBQiSsxO18hvtgIWFq+mLW3/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNo42/8R8SPbWgAnN6szwuojOyfAsxVKQVU1cz/+/kahjLI+5R
	bj3qzYTUCsdGoFQL0CImqg5S4JQgFFN7XvKzk3LyjtqwcxVVKLCnG1FF7TeXkyQ=
X-Google-Smtp-Source: AGHT+IGjt4U1xHUBvFYLYj0RtN3f0C6NSRnAyUSDbBhxom+UAElrEQDK6qLbjN9NN9sklRU9XdiWmA==
X-Received: by 2002:a05:600c:450d:b0:431:5ba1:a529 with SMTP id 5b1f17b1804b1-4328324b343mr76830645e9.14.1730645515598;
        Sun, 03 Nov 2024 06:51:55 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd91093csm159829025e9.15.2024.11.03.06.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 06:51:54 -0800 (PST)
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
Subject: [PATCH v6 00/13] Zacas/Zabha support and qspinlocks
Date: Sun,  3 Nov 2024 15:51:40 +0100
Message-Id: <20241103145153.105097-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_065158_330689_3FA6B59F 
X-CRM114-Status: GOOD (  19.75  )
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

v5: https://lore.kernel.org/linux-riscv/20240818063538.6651-1-alexghiti@rivosinc.com/
v4: https://lore.kernel.org/linux-riscv/20240731072405.197046-1-alexghiti@rivosinc.com/
v3: https://lore.kernel.org/linux-riscv/20240717061957.140712-1-alexghiti@rivosinc.com/
v2: https://lore.kernel.org/linux-riscv/20240626130347.520750-1-alexghiti@rivosinc.com/
v1: https://lore.kernel.org/linux-riscv/20240528151052.313031-1-alexghiti@rivosinc.com/

Changes in v6:
- Rebase on 6.12-rc5
- Fix comment about macros (Drew)
- Add RB from Drew

Changes in v5:
- Remove useless include in cpufeature.h and add required ones (Drew)
- Add RB from Drew
- Add AB from Conor and Peter
- use macros to help readability of arch_cmpxchg_XXX() (Drew)
- restore the build_bug() for size > 8 (Drew)
- Update Ziccrse riscv profile spec version commit hash (Conor)

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
 arch/riscv/Kconfig                            |  69 +++++
 arch/riscv/Makefile                           |   6 +
 arch/riscv/include/asm/Kbuild                 |   4 +-
 arch/riscv/include/asm/cmpxchg.h              | 286 +++++++++++++-----
 arch/riscv/include/asm/cpufeature-macros.h    |  66 ++++
 arch/riscv/include/asm/cpufeature.h           |  61 +---
 arch/riscv/include/asm/hwcap.h                |   2 +
 arch/riscv/include/asm/spinlock.h             |  47 +++
 arch/riscv/kernel/cpufeature.c                |   2 +
 arch/riscv/kernel/setup.c                     |  37 +++
 include/asm-generic/qspinlock.h               |   2 +
 include/asm-generic/spinlock.h                |  87 +-----
 include/asm-generic/spinlock_types.h          |  12 +-
 include/asm-generic/ticket_spinlock.h         | 105 +++++++
 16 files changed, 567 insertions(+), 233 deletions(-)
 create mode 100644 arch/riscv/include/asm/cpufeature-macros.h
 create mode 100644 arch/riscv/include/asm/spinlock.h
 create mode 100644 include/asm-generic/ticket_spinlock.h

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
