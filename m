Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75EBAC433E3
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 13:57:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41F89207BB
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 13:57:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hn+/EXhZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oTblXaxx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41F89207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YDKpAhafZOL1pKtdZxfmCS2LArECsr232zGVxvg340E=; b=hn+/EXhZchCWlgOdUrcOuLDCOM
	Mc4QWHfnHNuIadxIIMA0Pu/v13kZf62wExcV8SQFbZ366cvoDdMsdw/hm2M0F9i/up/OHpyjoKcvd
	Id2n4EytipYUTicX9x2o1QDEdQqKHYLV0qyYsRUQ+a7N+uKJvofXywY4s0dPO5nYEX3LL+HiezsAy
	zMy42vkq5agQVpR7SE4PW1FI89ZbidJyPwimNMQZDjKn447vhI8PEMq0Kla1sjrxoY8Ed4+1IJEKC
	BstWILa+pYQejKbK/Ep31AVIJnMHpfEiI51lvsMWX94cuaecd2jDYjx2WSNLEBGPcUQab0soALLzW
	wwt4QvBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jttWZ-00040I-Fd; Fri, 10 Jul 2020 13:57:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jttWX-0003zx-Ok
 for linux-riscv@merlin.infradead.org; Fri, 10 Jul 2020 13:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=B7pw9VB6Nltmz3Y300r/gUvA4/r7iQ5LJ7MRpv3euRQ=; b=oTblXaxxdMYgqzyWl/61AZfUDq
 Em+mmsEq18XABkt4HcXcqWCojruqtuYuxz6rz3NBC/ziJ4LGO/7YPle2SpO7EegE2OahG0RJozJDp
 cN2rl1cfIKXl8Mqrz0XeFQSpuKiMgg7sEZHL+zNVeV3nEdwB1msbLjIJefAgheb8Mz2Is7u+e8Xmh
 SVvKocawwCr6ZzS+T1LonpbkoIkdKnLTdtQxjaPg2tM0YXE99YPTrPxXryLHRWA1U3HO4lzRARAzo
 dLxfdpyGiAQP9HpENHCTYu0qkAeSfG2JOl+ysNpFHI5zuJ3oCZeObDLXAQY7MsDBbAST7AwT31I4p
 YvvW2EMg==;
Received: from [2001:4bb8:188:5f50:c70:4a89:bc61:2] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jttWV-0004gQ-6D; Fri, 10 Jul 2020 13:57:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: clean up address limit helpers
Date: Fri, 10 Jul 2020 15:57:00 +0200
Message-Id: <20200710135706.537715-1-hch@lst.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi all,

in preparation for eventually phasing out direct use of set_fs(), this
series removes the segment_eq() arch helper that is only used to
implement or duplicate the uaccess_kernel() API, and then adds
descriptive helpers to force the kernel address limit.

Diffstat:
 arch/alpha/include/asm/uaccess.h      |    2 +-
 arch/arc/include/asm/segment.h        |    3 +--
 arch/arm/include/asm/uaccess.h        |    4 ++--
 arch/arm64/include/asm/uaccess.h      |    2 +-
 arch/arm64/kernel/sdei.c              |    2 +-
 arch/csky/include/asm/segment.h       |    2 +-
 arch/h8300/include/asm/segment.h      |    2 +-
 arch/ia64/include/asm/uaccess.h       |    2 +-
 arch/m68k/include/asm/segment.h       |    2 +-
 arch/m68k/include/asm/tlbflush.h      |   12 ++++++------
 arch/microblaze/include/asm/uaccess.h |    2 +-
 arch/mips/include/asm/uaccess.h       |    2 +-
 arch/mips/kernel/unaligned.c          |   27 +++++++++++++--------------
 arch/nds32/include/asm/uaccess.h      |    2 +-
 arch/nds32/kernel/process.c           |    2 +-
 arch/nds32/mm/alignment.c             |    7 +++----
 arch/nios2/include/asm/uaccess.h      |    2 +-
 arch/openrisc/include/asm/uaccess.h   |    2 +-
 arch/parisc/include/asm/uaccess.h     |    2 +-
 arch/powerpc/include/asm/uaccess.h    |    3 +--
 arch/riscv/include/asm/uaccess.h      |    6 +++---
 arch/s390/include/asm/uaccess.h       |    2 +-
 arch/sh/include/asm/segment.h         |    3 +--
 arch/sh/kernel/traps_32.c             |   18 ++++++++----------
 arch/sparc/include/asm/uaccess_32.h   |    2 +-
 arch/sparc/include/asm/uaccess_64.h   |    2 +-
 arch/x86/include/asm/uaccess.h        |    2 +-
 arch/xtensa/include/asm/uaccess.h     |    2 +-
 drivers/firmware/arm_sdei.c           |    5 ++---
 fs/exec.c                             |    7 ++++++-
 include/asm-generic/uaccess.h         |    4 ++--
 include/linux/syscalls.h              |    2 +-
 include/linux/uaccess.h               |   20 ++++++++++++++++++--
 kernel/events/callchain.c             |    5 ++---
 kernel/events/core.c                  |    5 ++---
 kernel/exit.c                         |    2 +-
 kernel/kthread.c                      |    5 ++---
 kernel/stacktrace.c                   |    5 ++---
 mm/maccess.c                          |   22 ++++++++++------------
 39 files changed, 105 insertions(+), 98 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
