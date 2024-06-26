Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4A1C30659
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 13:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dhDIA1WxETRL+evcu+EK/AjWgJCc0+62VKWKWcSBZEQ=; b=NA38CuXoJ+xVYz
	5fuVxlt6fMWY1srLnEY45wE75UAhCBv2uMN1sHQANKaElcFvwGTI5L/qmCOP+vxkvAx7ELWPEuVoH
	/dyqdBiUDDFBf6fOgr+2rLidPnUuJI0qqazQs+0AUKGQvRmuV55iRj/w7YVtuY5fqFpWeF6ww0OCp
	+dObFnjbnV3EBnDojimtpv8J5MLiRq/GQEdvEEnrKQyWzwdTA5LST0IpbbrqigOC1To1UaK5yweEQ
	SD3T2C+CQ5ucBC+0MG9zNW0B4GRY1Qj9JXuha8yjl8wKcmjyxzOzNvYR4Dr43zq9GmKgf7huevYvb
	Wl5E0Khaw8cfK393IahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSJj-00000006qMr-2D30;
	Wed, 26 Jun 2024 13:04:07 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSJc-00000006qIo-3iPQ
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 13:04:04 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-424a2dabfefso18569935e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 06:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719407032; x=1720011832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oqhKGXxgVQtpDeDxTmBY0GRGK3b9WQJ4D/NdPeAScP8=;
        b=x/SR7jGvL4NewIygy7BiE5wW159YssmZFdmm7E6Fay0YFf7Plk9shiMrDBNpX34/sd
         l+Nbp5wi6rGtZWr9Sx8/mUbftfFHoUDzL+KjV4Hs/m2yDu3dd8hogjzOC/e0b5Q1Jr8K
         RttaksyLyiBT9IJ0eP3vpkDuTkOo40EjXSa9lkg59aGub7JtthpZOw/DL7QTUBUTdRcL
         wD/4MytT7hNkkqbA5WgPg+93zhiHyu2h8mBcbz/c0JfeE3KGVSGRWPo1hmDKC+riD9BN
         taEiHYixTh2dfCWdQk90nPmXx9ndXqyLt/MmVSSo2YePzwbUfwv5pBan1IkVUNNLL3zI
         csqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407032; x=1720011832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqhKGXxgVQtpDeDxTmBY0GRGK3b9WQJ4D/NdPeAScP8=;
        b=HyjJhMP/ojPla6EQHKUhf7Vguw+Xue0cFs81UmMkQ0vLfKMhttiW2RtDP5ScxbnJch
         0sPR46V6S/I7o38V9U+B22zKrqKFln99m7DUU7jdGmrb+3wvIGW83p2JF1vn4gSFZagH
         c3kbI4/2a4lHnmhMEILA+3e8O3YrG3uNjHpFfzfiv2JLgl+r3j6hahzJyeFu1q5qsvjl
         hQK3DnLNaa340A4Y/3M6ZOAswuePCeS+nqGfaUw09SVXZuNq/SQzN2m5iEHjHAKY4CVm
         uOMhGAEHWY+JZbwtobZWsXw4BfavAMQ6e0EIb6/GPrvBVzBTk0XdmM8B8B3r0GTId2Gm
         dujQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8WrCfeDJLawRQHwXcj5AvJOQa3E7nboXX/akAN/bMJneVNXUcqYLv/wrDTDH0S5rdJcchHT7zh1ZiU/W+p2VJc5DwUVOZUfg1dPyf/L6d
X-Gm-Message-State: AOJu0Yxhj+fF10oPlspALDlIo0999FYAtjkxZ/HRkU3eCF4Hg4dYjunV
	qj/RYEKxj8Tuuui+8g5qcxA/U1PN6oIr63YCLc49kUAY9ajCLkXkZwBGz1Vp8fQ=
X-Google-Smtp-Source: AGHT+IFiGsTX5vLxkPVO8Non2VspNfMgpq8c+JsPLrp7qPkiUj2K82s1dz1d1WmsbRzVRpIzAgp9+g==
X-Received: by 2002:a05:6000:174a:b0:364:29ce:b14e with SMTP id ffacd0b85a97d-366e96777a8mr7130622f8f.69.1719407031793;
        Wed, 26 Jun 2024 06:03:51 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663ada0bdesm15693877f8f.113.2024.06.26.06.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:03:51 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
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
Subject: [PATCH v2 00/10] Zacas/Zabha support and qspinlocks
Date: Wed, 26 Jun 2024 15:03:37 +0200
Message-Id: <20240626130347.520750-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_060401_524194_F07FAFAC 
X-CRM114-Status: GOOD (  14.64  )
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

Thanks to Guo and Leonardo for their work!

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

Alexandre Ghiti (8):
  riscv: Implement cmpxchg32/64() using Zacas
  dt-bindings: riscv: Add Zabha ISA extension description
  riscv: Implement cmpxchg8/16() using Zabha
  riscv: Improve amocas.X use in cmpxchg()
  riscv: Implement arch_cmpxchg128() using Zacas
  riscv: Implement xchg8/16() using Zabha
  riscv: Improve amoswap.X use in xchg()
  riscv: Add qspinlock support based on Zabha extension

Guo Ren (2):
  asm-generic: ticket-lock: Reuse arch_spinlock_t of qspinlock
  asm-generic: ticket-lock: Add separate ticket-lock.h

 .../devicetree/bindings/riscv/extensions.yaml |   6 +
 .../locking/queued-spinlocks/arch-support.txt |   2 +-
 arch/riscv/Kconfig                            |  45 +++++
 arch/riscv/Makefile                           |   6 +
 arch/riscv/include/asm/Kbuild                 |   4 +-
 arch/riscv/include/asm/cmpxchg.h              | 188 ++++++++++++++----
 arch/riscv/include/asm/hwcap.h                |   1 +
 arch/riscv/include/asm/spinlock.h             |  39 ++++
 arch/riscv/kernel/cpufeature.c                |   1 +
 arch/riscv/kernel/setup.c                     |  21 ++
 include/asm-generic/qspinlock.h               |   2 +
 include/asm-generic/spinlock.h                |  87 +-------
 include/asm-generic/spinlock_types.h          |  12 +-
 include/asm-generic/ticket_spinlock.h         | 105 ++++++++++
 14 files changed, 385 insertions(+), 134 deletions(-)
 create mode 100644 arch/riscv/include/asm/spinlock.h
 create mode 100644 include/asm-generic/ticket_spinlock.h

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
