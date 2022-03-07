Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEAEC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Mar 2022 22:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZzGKGmrumrc3gOUYJxFrwMMfBebduJl/Xdqd9iSAZRw=; b=ka8w4NeSit9KMQ
	4c4uAu91u9zsi8TD1rDD2iln3PhjmEwh6JqO9p2TtqJci/fTirE1lMu3zrMQmxpkEP5/Sn7lt3bTx
	nQBTywn0qaVs7tLtp0PFosY0M23F1uxIZHrftEkwkXCO10mh0+fcqTQ6zxAw39b5qUtuQLSSZ16N4
	cCwYmOCn1na2WGJ4ijxcuLliceNUqNNFlNwzkFMjens9TL2Ya6B1F1jw5+FqVjDyNHCvdMhuV+vXi
	EaKIxgNnKstmkgT9q44HAXQmR6ExtQPwiGSiXkj5p6mui9zp64AKuPbTgb9Zyg1RUKueeVTpIjzi5
	lfUUsjyXiGZHCZcQwukg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRM7Y-001r9C-Uq; Mon, 07 Mar 2022 22:46:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRM7W-001r7h-AO
 for linux-riscv@lists.infradead.org; Mon, 07 Mar 2022 22:46:27 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nRM7T-00032M-7m; Mon, 07 Mar 2022 23:46:23 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, mick@ics.forth.gr, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 0/2] riscv: implement Zicbom-based CMO instructions + the
 t-head variant
Date: Mon,  7 Mar 2022 23:46:18 +0100
Message-Id: <20220307224620.1933061-1-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_144626_402928_2DBC93B6 
X-CRM114-Status: GOOD (  11.39  )
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

This series is based on the alternatives changes done in my svpbmt series
and thus also depends on Atish's isa-extension parsing series.

It implements using the cache-management instructions from the  Zicbom-
extension to handle cache flush, etc actions on platforms needing them.

SoCs using cpu cores from T-Head like the Allwinne D1 implement a
different set of cache instructions. But while they are different,
instructions they provide the same functionality, so a variant can
easly hook into the existing alternatives mechanism on those.


Heiko Stuebner (2):
  riscv: Implement Zicbom-based cache management operations
  riscv: implement cache-management errata for T-Head SoCs

 arch/riscv/Kconfig                   |  8 +++
 arch/riscv/Kconfig.erratas           | 10 ++++
 arch/riscv/errata/thead/errata.c     |  5 ++
 arch/riscv/include/asm/errata_list.h | 78 +++++++++++++++++++++++++++-
 arch/riscv/include/asm/hwcap.h       |  1 +
 arch/riscv/kernel/cpu.c              |  1 +
 arch/riscv/kernel/cpufeature.c       | 17 ++++++
 arch/riscv/mm/Makefile               |  1 +
 arch/riscv/mm/dma-noncoherent.c      | 61 ++++++++++++++++++++++
 9 files changed, 180 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/mm/dma-noncoherent.c

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
