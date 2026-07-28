Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A42C53219
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 09:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Cc:To:Subject:From:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=FGd6tRUlatp2hMNabzqfL5GxnqbHnXfuYF3d5BghfQs=; b=oex
	YOLEdshGrkJVMBmjsUY/HGC+pMTxCUqEc5KQ1Kt2tZ2399QaJxt+ks7BCdXtvRq8xz7yA3a4yUEvv
	qGQdBJ6ewEfrtTr9jPeGCxZbSSFp7IOlbHUKMcNVIO4cgqkIL+reirfiRk//hWVOIxmNNBZD4aX5p
	vD7+WpnPzFpiievqcP7RqHpnRoySLg87vzWuikE+Rpozy1VC7gQOe+3Pe+2DJtH22TQCbpUAjW1EL
	X5wDXsAMzMSyTgNz9blDxg9o19qA+ps+RuVcWOltPhq4XSaz0TzMY5zm9ILekPdmIOKUOBzzBrCTf
	WXgkYKgGps8Pik7F1JSH2whpNdJKEJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeOa-00000004s0i-3Zls;
	Tue, 28 Jul 2026 09:46:44 +0000
Received: from va-2-36.ptr.blmpb.com ([209.127.231.36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeOX-00000004ryo-3xFw
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 09:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1785231992; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=KXkW2kswpNmBLGg5YFI34Bp026KwgCYLjhZ26zXIDi4=;
 b=Bw8Iqz/9sls+1443s4/bg7+RfB69qeWPMuEXUU0tlHDr/zD/O6PdMj6E/QTxuAnwvx8mXU
 cuf4+L/GeqsczvJ3qWwau0dwG2otjb0q8b+DUpZbaU1P5o41auWztkF6OOgtosKCwTgg2t
 WUqQtTjZEB6tLhP7o38XSMJ+0HK+uOXprciv6ypDXrlrnlEIIh4n7RujHAIBEOzO8rRvJm
 RGiX6M9vX2Kz7flxOaGqWw3W/XuaUtR1cAGpaQjVOisvTlylrHOTfeIZzD6TXnzOJHKy3o
 k+7RnpBv9wg4+XJJr3tvmGXGS4eqOxzcwQ08WpOIay5QjLmbH7lkSXMbUfPIKw==
Date: Tue, 28 Jul 2026 17:46:21 +0800
Mime-Version: 1.0
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: [PATCH v2 0/6] Add workarounds for Picoheart erratas
Received: from G9WYR9K0VW.bytedance.net ([58.250.106.101]) by smtp.feishu.cn with ESMTPS; Tue, 28 Jul 2026 17:46:29 +0800
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-Mailer: git-send-email 2.50.1
Cc: <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<cuiyunhui@bytedance.com>, <yang.yicong@picoheart.com>
Message-Id: <20260728094627.94975-1-yang.yicong@picoheart.com>
X-Lms-Return-Path: <lba+26a687a76+fd1635+lists.infradead.org+yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_024642_186707_3B3AF80A 
X-CRM114-Status: UNSURE (   8.11  )
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

This series add basic errata framework for Picoheart SoCs for handling
upcoming Picoheart erratas. And add workarounds for the first two
erratas on our hardware. Also do some fixups and refactor in support
of the erratas.

Change since v1:
- factor out a common get_insn for reading userspace instructions
- fix the issue from reading instructions of a exec-only mapping
- cleanups and code style refinements per comments
Link: https://lore.kernel.org/linux-riscv/20260715084724.26578-1-yang.yicong@picoheart.com/

Yicong Yang (6):
  riscv: Make get_insn public for instruction fault handling
  riscv: insn: Set sstatus.MXR when reading userspace instruction
  riscv: insn: Support decoding of CBO instructions
  riscv: errata: Add init framework for picoheart errata
  riscv: errata: picoheart: Add workaround for cbo.clean errata
  riscv: errata: picoheart: Add workaround for AMOCASQ errata

 arch/riscv/Kconfig.errata                    |  34 +++
 arch/riscv/errata/Makefile                   |   1 +
 arch/riscv/errata/picoheart/Makefile         |   5 +
 arch/riscv/errata/picoheart/errata.c         | 238 +++++++++++++++++++
 arch/riscv/include/asm/alternative.h         |   3 +
 arch/riscv/include/asm/cmpxchg.h             |   2 +-
 arch/riscv/include/asm/cpufeature.h          |   8 +
 arch/riscv/include/asm/csr.h                 |   1 +
 arch/riscv/include/asm/errata_list.h         |  25 +-
 arch/riscv/include/asm/errata_list_vendors.h |   4 +
 arch/riscv/include/asm/insn.h                |  63 ++++-
 arch/riscv/include/asm/processor.h           |   2 +-
 arch/riscv/include/asm/vendorid_list.h       |   1 +
 arch/riscv/kernel/alternative.c              |   5 +
 arch/riscv/kernel/asm-offsets.c              |   6 +-
 arch/riscv/kernel/cpufeature.c               |  16 +-
 arch/riscv/kernel/entry.S                    |  14 +-
 arch/riscv/kernel/traps.c                    |   4 +
 arch/riscv/kernel/traps_misaligned.c         |  52 ----
 arch/riscv/kernel/vector.c                   |   6 +-
 20 files changed, 419 insertions(+), 71 deletions(-)
 create mode 100644 arch/riscv/errata/picoheart/Makefile
 create mode 100644 arch/riscv/errata/picoheart/errata.c

-- 
2.50.1 (Apple Git-155)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
