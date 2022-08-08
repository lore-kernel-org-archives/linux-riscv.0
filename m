Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EE0C25B0D
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 08:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J5e1Nalnzs+dzxV+zOE5ibUHSpOnVO6pFfVIw9C3FS4=; b=0wt6uVn0kpOw0D
	GPVM4M4szGpZp+8F9QsRrSQsp7GdnZqtc2yppQ2PA1qMkh2voWXELeltN94YtaAeICAhMDQ3OM+3l
	vWUriM4imJUiT5jU6osfcps09gRSz6ynkCLC3R5dImkwQScQ4SnfHlfx6++/P0/hW+Wm3bSxx0Zph
	EFBTl2RM9kOYTkq0OONVLFMVLU1WvuTVYwpu2cnqbQlRHCxnqIt7yDDeY5xzR3yuMs4f9W3ufghes
	4kfE9uA32lFzoGD70019ZhDv1vY4CfFjxreGuaRaOqVdBn+WkVlLvTd8/QzW2l5CiKwFsRyy61Mj/
	8MxEzgpR7myIkS3LLteQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxmF-00CIgZ-0r; Mon, 08 Aug 2022 08:06:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxmC-00CIfC-TL
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 08:06:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 48DEFB80DD4;
	Mon,  8 Aug 2022 08:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BABC433D6;
	Mon,  8 Aug 2022 08:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659945974;
	bh=oLo+n26XWd3Bl2frOxEyB9f9Z0LptPcBWpJCu34gpUM=;
	h=From:To:Cc:Subject:Date:From;
	b=NBP7I4zu+ChMiZAGQwQY7PKIZ8DPlfIGuoGznAOeyiMteNDhK+gfLR6Mr7LrP8ISY
	 1qdQUUJR0bBiLcrWuJkoOsHcQsuHRIpiwc+BC7DyZrEP76tgtH8UhKdXMS2wjkkkEe
	 mfTgsuVlDFv32dExH+oV+i/38Zu0zdnp2gDhlaSdOE7xLzX+dHNrOnPScWne+KQ27F
	 BBkAO0iJu9G/aMD6vHavoql34N0aznZpvpSlVQ3hS0419uX302t7Wy2YOd0bRonRII
	 W94+wdStPM+Bto628pRcRLb5WXqiuKgnGvjAJ8976SQ3SzCX3H7DYE7nXeIZFyELhv
	 Lz0oyICr+akOw==
From: guoren@kernel.org
To: tj@kernel.org,
	cl@linux.com,
	palmer@dabbelt.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	peterz@infradead.org,
	arnd@arndb.de
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH 0/4] riscv: Add basic percpu operations
Date: Mon,  8 Aug 2022 04:05:56 -0400
Message-Id: <20220808080600.3346843-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_010617_108157_6EC1A2D9 
X-CRM114-Status: UNSURE (   9.32  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The series try to add basic percpu operations for riscv. HAVE_CMPXCHG_LOCAL
would let people confuse with cmpxchg(64)_local, so make the name more
accurate (HAVE_CMPXCHG_PERCPU_BYTE). Last, remove RISC-V's
cmpxchg(64)_local definition because it's no use.

Guo Ren (4):
  vmstat: percpu: Rename HAVE_CMPXCHG_LOCAL to HAVE_CMPXCHG_PERCPU_BYTE
  arm64: percpu: Use generic PERCPU_RW_OPS
  riscv: percpu: Implement this_cpu operations
  riscv: cmpxchg: Remove unused cmpxchg(64)_local

 .../locking/cmpxchg-local/arch-support.txt    |   6 +-
 arch/Kconfig                                  |   2 +-
 arch/arm64/Kconfig                            |   2 +-
 arch/arm64/include/asm/percpu.h               |  33 ------
 arch/riscv/include/asm/cmpxchg.h              |   9 --
 arch/riscv/include/asm/percpu.h               | 104 ++++++++++++++++++
 arch/s390/Kconfig                             |   2 +-
 arch/x86/Kconfig                              |   2 +-
 mm/vmstat.c                                   |   4 +-
 9 files changed, 113 insertions(+), 51 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
