Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E15BC25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 15:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/H4jIobelH+G1Igq+x5tiDItIs0gGhjcDHzKEHGn2Uk=; b=s0s2wL0PzjyTKO
	lEJY+InsiBheW21RfVvJ0KOz829kCSbAz4CJUteA0qfO3pU2uVcKe0HhldSp/DPlbqSa1hhShQIwj
	zXv/fiHwVkJH/5JaFvti27iad+oPZ6tNqCmQFVmniw4fj0Op65epM6aw00V5Y7kOaETBJsuZ+WmN6
	rB3YgawYsz323k4bmaSsibTXLcMj+IyjIvEe3ly+3Tc4fG7+wSq8qqA4qyDQcRX53AQLlqcRUnGrE
	qeHwj0qyUcuuU76OKr71zTpEWFSCv0e2eJi9TF6m+mv7ewgWaJZBAbgfuH8k5ijC+i6OI3GsFrqfA
	HPKsrZo0rV9lSmP+INQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sByTl-00000001A6p-3zKh;
	Tue, 28 May 2024 15:11:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sByTa-000000019xr-178q
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 15:11:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42120fc8cbfso4112845e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 May 2024 08:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716909055; x=1717513855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k0AGpQFir7bYkY6Hm/qOL+w8L3+MGNDSpFH+GMgURdQ=;
        b=LR0ScoyaSHRnp/yt7cHV9aRFJECsGoO+b+ATU4111bnwNHBOLWy0Ei9UD01VfobEWt
         izG4REYmvpj42JewIX8hud13N43bBIMs2LlPCCDg7DPRhLh9YgLQ7RTw76EzU5LndTzB
         GG36RizI0V2Bh4KPs+sVT5hNXDrEugsPjbqL5ZZpPcfIRMvtflnV0odM9GUayDc/pP+U
         3KP6iNMaU2vppHQUIJX9kE6Wk3EMIPHBHRClc3hyuJ1gqnJNePtfn9AupKe+HylK61IY
         +spG1oAVwGPwWwYkA51hyg/PL5304CJBOtXDbTllkXs+fCsX1Rc1eaBmijsTnqrXg6dB
         wa0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716909055; x=1717513855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0AGpQFir7bYkY6Hm/qOL+w8L3+MGNDSpFH+GMgURdQ=;
        b=VoKb0+qyK01f+Yuc5XokfHD4yKDaYGBtmn3ObxtOpGyycjj79u6zad9MUlIg5GKOhg
         mjkU0vzwDjSpynX0xtRIcS9+s2UNVu3xv+mZKRuIB3gdL2Wvg3BIupUJhrFiyRnopAT4
         jwvBqjLmYBEe6oQunYmaSqbxIfmul3RQ1A+gdINoy0IWdGjalAXiOAdGVA+vqzfjIhh9
         ryqX1Ev6x5HjpYQfeu/TdFCmdRGC+/Xa9usQqQZY+3bbLdsKCe4VYtI3UfMczJj5DhDQ
         B3Mx+OCsxzZM4QNufWI2gXKS/VTtkwNJQwFAtBKJ50g8QfUrqqx+gOb1KNF68LOtlTnI
         GmhA==
X-Forwarded-Encrypted: i=1; AJvYcCVnmf1Uvd34KOJn2Y2B2U5xCGGrtWwDGsN17cfP+tWSLVM/4H99/fdeKeUCRm56dC60noP9GdINWQIZB7FqyUdSbhl8UbzlZaReGGVMiG0m
X-Gm-Message-State: AOJu0Yz58QNdf48WVjvYs7qaf5LRtf09DU0l4GfZJQlvAdq/ZgM1mUdU
	K9cQLpgyrDzXJQ5HJnzMI9pPs2SxUJBqywHXqYkVq36t3kRY1hnAjHCOqmrFNUvY4lGv6odrlm2
	l
X-Google-Smtp-Source: AGHT+IHwEZnGvgBLJ+odBijV5gGLQhEjsnEBuwZ3zDPr0k4TFSH0yVpvuN/r5/6VstbLixDjb6DW3w==
X-Received: by 2002:a05:600c:4703:b0:420:1fab:1798 with SMTP id 5b1f17b1804b1-421089fe2c2mr95474985e9.29.1716909054785;
        Tue, 28 May 2024 08:10:54 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35579d7da64sm12293475f8f.4.2024.05.28.08.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 08:10:54 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
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
Subject: [PATCH 0/7] Zacas/Zabha support and qspinlocks
Date: Tue, 28 May 2024 17:10:45 +0200
Message-Id: <20240528151052.313031-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_081059_278858_06F31F5E 
X-CRM114-Status: GOOD (  10.72  )
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

Alexandre Ghiti (5):
  riscv: Implement cmpxchg32/64() using Zacas
  riscv: Implement cmpxchg8/16() using Zabha
  riscv: Implement arch_cmpxchg128() using Zacas
  riscv: Implement xchg8/16() using Zabha
  riscv: Add qspinlock support based on Zabha extension

Guo Ren (2):
  asm-generic: ticket-lock: Reuse arch_spinlock_t of qspinlock
  asm-generic: ticket-lock: Add separate ticket-lock.h

 .../locking/queued-spinlocks/arch-support.txt |   2 +-
 arch/riscv/Kconfig                            |  35 ++++++
 arch/riscv/Makefile                           |  21 ++++
 arch/riscv/include/asm/Kbuild                 |   4 +-
 arch/riscv/include/asm/cmpxchg.h              | 114 ++++++++++++++++--
 arch/riscv/include/asm/hwcap.h                |   1 +
 arch/riscv/include/asm/spinlock.h             |  39 ++++++
 arch/riscv/kernel/cpufeature.c                |   1 +
 arch/riscv/kernel/setup.c                     |  18 +++
 include/asm-generic/qspinlock.h               |   2 +
 include/asm-generic/spinlock.h                |  87 +------------
 include/asm-generic/spinlock_types.h          |  12 +-
 include/asm-generic/ticket_spinlock.h         | 105 ++++++++++++++++
 13 files changed, 336 insertions(+), 105 deletions(-)
 create mode 100644 arch/riscv/include/asm/spinlock.h
 create mode 100644 include/asm-generic/ticket_spinlock.h

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
