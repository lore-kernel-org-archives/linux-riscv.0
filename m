Return-Path: <SRS0=Il0f=OB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744B9C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 09:22:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F06461245
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 09:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F06461245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VLFJG/SWjs5SAl9zIOP3BhSVWtm5pN6A9B5zEzSW2KQ=; b=hGctCRPkc5zMdn
	3e41ArRR1HuXdbwhy6oXekVppqoI11hDC+gapqUWDRrqalSSMNkHVEutS78r1M2e1PsSl5sexWwWC
	6bvA8TQnqyVQZfn7yQ3oQcpWylMhHDPtWzWp7a5rhWcYckD24W8lspkx+D/PApP9H1q7hsvNcg7to
	d4EEnllwreUdA9lssc9+dbT9I7mAUPXG97uZVpedlaR5hgkWzn5xFvPnvSJk24szJVRdbrZNsoyev
	IuuXvJPzguUoaNETLzuVa5K6qGvn2vaGCettjJxXqG83017opUf7Ykj2M0gZ3oBxwLCHAF84fl3Rl
	DP3Lm7JGpHtdS92+lV7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOzD0-00EayY-De; Sat, 11 Sep 2021 09:22:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOzCw-00Eaxo-Ly
 for linux-riscv@lists.infradead.org; Sat, 11 Sep 2021 09:22:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74DD260F9D;
 Sat, 11 Sep 2021 09:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631352117;
 bh=rLs6lXO4ezLXi1eMDGtuAGxJsksCVO9gqYP0VT8AEb0=;
 h=From:To:Cc:Subject:Date:From;
 b=VdNXLhQ/7cpD/rchd5lgkiUVZc/YpZPes8flZgcn0HwgdZkG6jYWNywM6XovNp4me
 KdI5jc9ghU0lE2x4sC9BHrltJiVFgA1PEV0RWYoeoXHfJIAxECbbCvGnYgqm1BKXhw
 XR+0dY0S5WRNT0KIGHU/Q4TTgGCC0tJ6qoG4R/I6bLmLrMYjFSIiUlqGh27SAQ0sMF
 gsvTZ1VPxXiFuZE9HFb6xty3N+Cpn6cbh6MbWkx9PguQ2jM4QZM157oIrHkFyLaY4n
 ojYw7F6FC/CN3SlLtB/f6RTYKRg2D8wsbValeeuw8A6CL+2tHkcZh0gL6EIBrvfbRb
 ta4Zu8MYAM4bw==
From: guoren@kernel.org
To: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 guoren@kernel.org, christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
 hch@lst.de, liush@allwinnertech.com, wefu@redhat.com, lazyparser@gmail.com,
 drew@beagleboard.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 heinrich.schuchardt@canonical.com, gordan.markus@canonical.com,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V4 0/6] riscv: Add PBMT & DMA for D1 bringup
Date: Sat, 11 Sep 2021 17:21:33 +0800
Message-Id: <20210911092139.79607-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210911_022158_806110_FDE7F7E7 
X-CRM114-Status: GOOD (  13.61  )
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

These patches are a continuation of "riscv: Add DMA_COHERENT support for
Allwinner D1". In this version, we rebase on Atish's Global dma pool
patchset, and it has been tested on qemu and our hardware platforms.
But we append "select DMA_DIRECT_REMAP" in RISCV_DMA_NONCOHERENT, so not
sure it would affect Atish's hardware platform.

We still use riscv_dma_cache_sync_set, not the alternative code. I agree
the alternative framework is better for performance in dma ops. Maybe
Atish's next version of the patch would use it.

The custom PBMT implementation is moved into errata and add
apply_errata_setup_vm() in setup_vm prologue. Hope it could be approved.

You can follow the D1 fedora wiki[1], try the latest kernel with the
patchset.
[1] https://fedoraproject.org/wiki/Architectures/RISC-V/Allwinner#Build_Linux_Kernel_for_D1

Previous versions:
V3: https://lore.kernel.org/linux-riscv/1623693067-53886-1-git-send-email-guoren@kernel.org/
V2: https://lore.kernel.org/linux-riscv/1622970249-50770-10-git-send-email-guoren@kernel.org/
V1: https://lore.kernel.org/linux-riscv/1621400656-25678-3-git-send-email-guoren@kernel.org/

Atish Patra (2):
  RISC-V: Support a new config option for non-coherent DMA
  RISC-V: Implement arch_sync_dma* functions

Guo Ren (3):
  riscv: pgtable: Add custom protection_map init
  riscv: errata: pgtable: Add custom Svpbmt supported for Allwinner D1
  riscv: errata: Support T-HEAD custom dcache ops

Liu Shaohua (1):
  riscv: soc: Add Allwinner SoC kconfig option

 arch/riscv/Kconfig                       |  13 +++
 arch/riscv/Kconfig.erratas               |  11 +++
 arch/riscv/Kconfig.socs                  |  15 ++++
 arch/riscv/configs/defconfig             |   1 +
 arch/riscv/errata/Makefile               |   1 +
 arch/riscv/errata/alternative.c          |  23 +++++
 arch/riscv/errata/thead/Makefile         |   1 +
 arch/riscv/errata/thead/errata.c         | 108 +++++++++++++++++++++++
 arch/riscv/include/asm/alternative.h     |   4 +
 arch/riscv/include/asm/dma-noncoherent.h |  19 ++++
 arch/riscv/include/asm/fixmap.h          |   2 +-
 arch/riscv/include/asm/pgtable-64.h      |   8 +-
 arch/riscv/include/asm/pgtable-bits.h    |  46 +++++++++-
 arch/riscv/include/asm/pgtable.h         |  30 ++++---
 arch/riscv/include/asm/vendorid_list.h   |   1 +
 arch/riscv/mm/Makefile                   |   1 +
 arch/riscv/mm/dma-noncoherent.c          |  66 ++++++++++++++
 arch/riscv/mm/init.c                     |  28 ++++++
 mm/mmap.c                                |   4 +
 19 files changed, 366 insertions(+), 16 deletions(-)
 create mode 100644 arch/riscv/errata/thead/Makefile
 create mode 100644 arch/riscv/errata/thead/errata.c
 create mode 100644 arch/riscv/include/asm/dma-noncoherent.h
 create mode 100644 arch/riscv/mm/dma-noncoherent.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
