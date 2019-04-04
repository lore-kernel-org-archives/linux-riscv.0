Return-Path: <SRS0=qC9n=SG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9296DC4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2019 05:52:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6232920855
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2019 05:52:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M8ClGr86";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Jt2ow9yw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6232920855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3ktLMVGZWBKhkWMGerfNhGWYNE6d4p+8UnZRzJqzt8U=; b=M8ClGr86eav/ts
	pOfpgNPI+rI0u9vELWCz2WZpXduBSabw0XkMuDDRRAIV9ohcAUPDAtyTfpkTq/HhhwNZ1zcOAgV21
	AGCsRt4lN8vcmTh/NCs3oeZEpmk/lkh2vCHykcNuQRAlRKQq32UCKu8TePjvFe/uPgD2zVyAetHPc
	yZYMq8FcFVyA9HCHBYtGk6D7dA7in8jA/ngaZVaQ8XvRKtmNeObyOqAdrH3crhU9t1OMCHo5y/73T
	1FqzZHXCm7MDi76erN7MQ9rJUsQ42o2Q3abA3L/YjJRfLcpm6Aij3B3wx0JI/WxWFwZGx0zAySTSG
	0FtZOeYKiMRn3k1h/+tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBvIR-0006M6-5R; Thu, 04 Apr 2019 05:52:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBvIJ-0006Df-MW; Thu, 04 Apr 2019 05:52:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YdGdDJHeCmQC+RW7k1h8mpRrLzlQKPKkXRLdFADEvXU=; b=Jt2ow9ywe8W3xZZcoFxlfoPvmP
 TE9dF13dLxs8otPQ3Mgxgy05xpbBubbLmr9BMn1fFnrSgdbP8yys63qUhvucQ68mLulCmnG04Czya
 G4jTbX27wRiueTL7FpLBOg5kPJY3hT2veEuTu+pIGzjvuWtoDTShUxv+uoOhsdI8eOjnvsOlKHKNd
 2yQm7jIuarihPPVzePp9YgaJxp50ZFCXunYbFuRyiqD6hcswkc2A/iCPK6Thbv+5Cco3Kk6ckzKPa
 M0oIYPMvRwUmhWYzfc8we5p0AubidX9yK4siMBExTlPjl2yIDAh1Lie5I2OcxHtHIKAVc1fXBIhsI
 T/ee3PiA==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBvIG-00038a-Dg; Thu, 04 Apr 2019 05:52:10 +0000
X-Originating-IP: 79.86.19.127
Received: from alex.numericable.fr (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D845CFF808;
 Thu,  4 Apr 2019 05:51:29 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 0/5] Provide generic top-down mmap layout functions 
Date: Thu,  4 Apr 2019 01:51:23 -0400
Message-Id: <20190404055128.24330-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_065208_476458_2E4192D7 
X-CRM114-Status: GOOD (  11.76  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Catalin Marinas <catalin.marinas@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 Russell King <linux@armlinux.org.uk>, Ralf Baechle <ralf@linux-mips.org>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Paul Burton <paul.burton@mips.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, James Hogan <jhogan@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This series introduces generic functions to make top-down mmap layout
easily accessible to architectures, in particular riscv which was
the initial goal of this series.
The generic implementation was taken from arm64 and used successively
by arm, mips and finally riscv.

Note that in addition the series fixes 2 issues:
- stack randomization was taken into account even if not necessary.
- [1] fixed an issue with mmap base which did not take into account
  randomization but did not report it to arm and mips, so by moving
  arm64 into a generic library, this problem is now fixed for both
  architectures.

This work is an effort to factorize architecture functions to avoid
code duplication and oversights as in [1].

[1]: https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1429066.html

Changes in v2 as suggested by Christoph Hellwig:
  - Preparatory patch that moves randomize_stack_top
  - Fix duplicate config in riscv
  - Align #if defined on next line => this gives rise to a checkpatch
    warning. I found this pattern all around the tree, in the same proportion
    as the previous pattern which was less pretty:
    git grep -C 1 -n -P "^#if defined.+\|\|.*\\\\$" 

Alexandre Ghiti (5):
  mm, fs: Move randomize_stack_top from fs to mm
  arm64, mm: Move generic mmap layout functions to mm
  arm: Use generic mmap top-down layout
  mips: Use generic mmap top-down layout
  riscv: Make mmap allocation top-down by default

 arch/Kconfig                       |  8 +++
 arch/arm/Kconfig                   |  1 +
 arch/arm/include/asm/processor.h   |  2 -
 arch/arm/mm/mmap.c                 | 52 ----------------
 arch/arm64/Kconfig                 |  1 +
 arch/arm64/include/asm/processor.h |  2 -
 arch/arm64/mm/mmap.c               | 72 ----------------------
 arch/mips/Kconfig                  |  1 +
 arch/mips/include/asm/processor.h  |  5 --
 arch/mips/mm/mmap.c                | 57 -----------------
 arch/riscv/Kconfig                 | 11 ++++
 fs/binfmt_elf.c                    | 20 ------
 include/linux/mm.h                 |  2 +
 kernel/sysctl.c                    |  6 +-
 mm/util.c                          | 99 +++++++++++++++++++++++++++++-
 15 files changed, 126 insertions(+), 213 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
