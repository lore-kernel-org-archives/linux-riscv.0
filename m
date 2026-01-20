Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA854D2ECF7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 14:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HE/ZyIByN3d2I6NU8oBpYMRDr56DfLf5tEdPjUr1qOs=; b=I/hIFXgD0JBTix
	6BUS6dmsaIX53cDEa5TWYdIClLqiB8TKx0WNNS/0W0+PEfJElNJPPXzkfgzkNMRCm353jMJojSf4j
	VSwd0RY11dftwMj+5yl89SO/uCawTlGelaXC6thE9DzTXBcRb+t/fa9bUmFzx3jUHKQywFAwzwmvD
	Qxu9g1CIh8pUhmA7mW1K5Or73rA5RA5Z2hNAPLFZYVXUK6rgOV4sFrRF6cs9GbTBgIijP0yyA9J70
	qcshszsRTyfY/Y8C5G9C5zPwsKG/J/kBQIT6E5emhQVOwTopKyU61rMflSNSxDCuTd/bywTDtUhkO
	XfGAH9nv1inpoZ7P12aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCgz-00000003ygx-48aw;
	Tue, 20 Jan 2026 14:26:49 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCgu-00000003yfJ-3Fzm
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 14:26:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768919204; x=1800455204;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JcK32a/K4Bc5DTjfgo4jpbmZhsGF6/j5Ko6r8eaGKR8=;
  b=ZIueK2Zz37U50/9xng5fDaqMV1uF5DE6H8BfCctiKJVSaRpAaahY28WO
   vJRYIN7DNEJzYOffo5ZPs9VvYU/Ev7XBouqbgVaR4JMPNQ4joJNov9Nqg
   q7gj+kEZS+0Yws0WpDQJGe8nI6PofwJIGhffhkBhp3RrbLHQCPc2qTicE
   +kOo1XTC3vgZqA4pNp7Kq2Ifa5vwqJpm9qDlUArYLendJFCHYjr28H9Iq
   9ddCjbDivrsLwJwkND+xie1Y9BGLhv7/L9nU1ayku5Pr7B1p3xFfOOjhr
   1CeVWFzO/gQAFMx+YbWBjt7Ms6sIIXtoJ8+MZ217FNLFSteIjLU4H65Zn
   A==;
X-CSE-ConnectionGUID: OpuY0g/LR4uOSrGr5D8Jxg==
X-CSE-MsgGUID: KzJE5NufRJ+1uUV9kD/x3Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 16:26:40 +0200
X-CSE-ConnectionGUID: Z7IJKOSBRGaaiEAxrI+bkQ==
X-CSE-MsgGUID: /rziLRduQLaA2dxB9YR0yw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces02_data.me-corp.lan with SMTP; 20 Jan 2026 16:28:38 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 20 Jan 2026 16:26:39 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	cfu@wavecomp.com,
	torvalds@linux-foundation.org,
	olof@lixom.net,
	aleksa.paunovic@htecgroup.com,
	arikalo@gmail.com
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vladimir.Kondratiev@mobileye.com
Subject: [PATCH v2 0/2] Support for Risc-V CPUs implementing LR/SC but not AMO
Date: Tue, 20 Jan 2026 16:26:22 +0200
Message-ID: <20260120-lrsc-only-v2-0-a522e640d27d@mobileye.com>
In-Reply-To: <DFSQIY6WV4U7.3B3RY31KE739B@garyguo.net>
References: <DFSQIY6WV4U7.3B3RY31KE739B@garyguo.net>
MIME-Version: 1.0
X-Change-ID: 20260120-lrsc-only-cc06422f5bb1
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_062645_310738_D435B459 
X-CRM114-Status: GOOD (  12.21  )
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

Primary goal is to support Mobileye eyeq7h automotive platform
based on MIPS P8700 CPU [1] having only "zalrsc" ISA extension but
not full "a".

Such platforms need userspace to be compiled with correct
"-march" flags to generate proper instructions for the atomic types
so there's not feasible to use universal userspace for it.
Thus there's no point to do same binary kernel suitable for both
"full A" and "LRSC only" platform types. Do a compile time
alternatives and require CONFIG_NONPORTABLE for this

[1] https://mips.com/products/hardware/p8700/

Patch 1 do most of work to provide compile-time LR/SC alternatives
        for the AMO instructions
Patch 2 adjust tests for reported CPU extensions compatibility with
        the code

Changes in v2: switch from dynamic atomic flavor resolution to
compile-time one.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
Vladimir Kondratiev (2):
      riscv: support ISA extensions "zaamo" and "zalrsc"
      riscv: more accurate check for CPU atomics support

 arch/riscv/Kconfig               | 19 ++++++++++++++
 arch/riscv/Makefile              | 16 ++++++++----
 arch/riscv/include/asm/atomic.h  | 56 +++++++++++++++++++++++++++++++++++++++-
 arch/riscv/include/asm/bitops.h  | 48 ++++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/cmpxchg.h | 18 +++++++++++++
 arch/riscv/include/asm/futex.h   | 52 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/cpu.c          | 22 +++++++++++++---
 arch/riscv/kernel/entry.S        |  9 +++++++
 arch/riscv/kernel/head.S         | 18 +++++++++++++
 9 files changed, 248 insertions(+), 10 deletions(-)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20260120-lrsc-only-cc06422f5bb1

Best regards,
-- 
Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
