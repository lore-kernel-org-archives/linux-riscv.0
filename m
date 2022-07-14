Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02557C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 11:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IL9Ux7YvlWD1ifSNUHwUoSIp43bM5+gA8FZ9GjjSU1k=; b=z2c7GG/Pa6D6Ug
	rhrkhzeQ6UkEfs1tsbqRFwEoMrP5JTNW3GS72MAUZl1Otm792NfIL1zNeAy7kMmM0XLUsfCLxjPq2
	1QcqOFrP+hkYrKGnZIIv5MGqjN/FxEm81jEpZ8CBAxi49d6EqOG39NajNenSQ3hZveXdSm1mhCApV
	JhdmgyNRRq4iZ+Q3Ls6bSBdsOlILVACb/64PTQOmB2k0R2NzFK0BXiSanx2CLQWma1AwleU6mFvm8
	+0gjscS2MIBVsLPuMhPssHRcUR7Bt3jrkooZiOvoeWApLYabG/3lw9dMgWYGnwEB1eH6nVZaxFUhb
	QljZ4MuRr/G3eUr5BJhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBx5n-00DnjP-Uv; Thu, 14 Jul 2022 11:33:15 +0000
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBx5h-00Dnc9-Ml
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 11:33:11 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0VJJBi4t_1657798382;
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VJJBi4t_1657798382)
          by smtp.aliyun-inc.com;
          Thu, 14 Jul 2022 19:33:03 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexandre.ghiti@canonical.com,
	guoren@kernel.org,
	anup@brainfault.org,
	mick@ics.forth.gr,
	rppt@kernel.org,
	heiko@sntech.de
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	huanyi.xj@alibaba-inc.com,
	Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: [PATCH V3 0/2] Improve vmcoreinfo and memory layout dump
Date: Thu, 14 Jul 2022 19:32:58 +0800
Message-Id: <20220714113300.367854-1-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_043309_938581_A2E55147 
X-CRM114-Status: UNSURE (   6.96  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch series are the improvements for vmcoreinfo and memory
layout dump.

The first patch(1/2) is to add VM layout to vmcoreinfo, which can
simlify the development of crash tool as ARM64 already did
(arch/arm64/kernel/crash_core.c).

The second patch(2/2) is to add MODULES to memory layout dump.

Changes v1 -> v2:
 patch 1: add VA_BITS to vmcoreinfo as ARM64 does, not satp_mode.
          crash tool can read VA_BITS to determin the pagetable
          levels.
 patch 1,2: As MODULES area is only defined when CONFIG_64BIT=y for
            riscv64, so only use MODULES area when CONFIG_64BIT=y.
Changes v2 -> v3:
 patch 1,2: use "#ifdef CONFIG_64BIT" instead of "IS_ENABLED(CONFIG_64BIT)"
            when check whether MODULES area is available.

Xianting Tian (2):
  RISC-V: Add arch_crash_save_vmcoreinfo support
  riscv: Add modules to virtual kernel memory layout dump

 arch/riscv/kernel/Makefile     |  1 +
 arch/riscv/kernel/crash_core.c | 29 +++++++++++++++++++++++++++++
 arch/riscv/mm/init.c           |  4 ++++
 3 files changed, 34 insertions(+)
 create mode 100644 arch/riscv/kernel/crash_core.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
