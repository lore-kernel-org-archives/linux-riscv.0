Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D3DC5516E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 09:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lWO5JuAvprj2NbPttEHJJuImamrU4K3lsLS7oINk0F0=; b=cOeJlqzNVBphlB
	5pOmsL/0q8IbtCbPQhv3sXWkULNl7lVSQscRXlesURMApUu/EuvQd2KR2vQxeq38D3zcuOBp0PLtG
	FAAIPDDSEZzGBofhsUyIhxlfccEqaWj3EBTAP+Ws7XoYTaeQ5W4J3f8HXIHpuoU3K/Uw4QFiOPaEP
	vVPZmw0KIk5vo62euKH4TVenY6u3u3GVyKWiUdq9Yl+1DIsJc1Bqfkhk4IDLqzH5xJ3GJPQI0Df9d
	compuhbgUGoz4chQOpH97gxZ2/apst1pCPGK9Q20MwbM7pI32GQlk1jOpJbDiV5N8I+M11gjIyd5V
	JfY6p2odsIGLtG1ZlrlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMnl-0000000DVNJ-2y8W;
	Fri, 20 Feb 2026 09:27:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMnj-0000000DVLY-03m6;
	Fri, 20 Feb 2026 09:27:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 116CC444B9;
	Fri, 20 Feb 2026 09:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE24CC116D0;
	Fri, 20 Feb 2026 09:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771579674;
	bh=NJPGvTmlDcLmtgZEyJBgLqYqr3TADL+hhrIydbb16zw=;
	h=From:To:Cc:Subject:Date:From;
	b=RU4q3K6dTajkeNAMGx5MkM68MOQQHw+mrUfNV5Nzof3hNgHHADZg8J4ZN28jLsmta
	 V+sMp+AuJkBCbLD9dOPlOLgirPzBEYsp8kPLFUlcEYOH+X2Cn09t39iCHEkYVnOAwb
	 quH4qTw//as3CZwFrxflIbJcFBINjaPTVrhcCWPQnuF9w9H17MSfYa9+RgFxA5+Wx3
	 O0otf8+dj9Un942DFEIE7tRSbwwhh2m3w6CQoFWhs2mC8XKdQ85J9/6m+4DXFX+Fik
	 g6CY1BxdLUQIAWFd9kRazbYgEAaIZ08jw1nbjUTH8lHvkQyY8U70XhFcoTn7Md89eY
	 BceCyzoQ0n9AA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org
Subject: [PATCH 0/3] use runtime constant to optimize handle_arch_irq access
Date: Fri, 20 Feb 2026 17:09:19 +0800
Message-ID: <20260220090922.1506-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_012755_090641_B5266BC2 
X-CRM114-Status: UNSURE (   6.76  )
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

Currently, on GENERIC_IRQ_MULTI_HANDLER or arm64 platforms, the
handle_arch_irq is a pointer which is set during booting, and every
irq processing needs to access it, so it sits in hot code path. We can
use the runtime constant mechanism which was introduced by Linus to
speed up its accessing.

Tested on Sipeed Lichee Pi 4A (riscv64) board, the perf sched benchmark is
improved by ~5.8%

Tested on Quad CA55 platform, the perf sched benchmark is improved
by ~6.5%

As for the GENERIC_IRQ_MULTI_HANDLER platforms but without runtime const
support, such as arm, csky, loongarch, microblaze and openrisc, there
should be no changes.

Jisheng Zhang (3):
  vmlinux.lds.h: add _handle_arch_irq RUNTIME_CONST section
  genirq: use runtime constant to optimize handle_arch_irq access
  arm64: use runtime constant to optimize handle_arch_irq access

 arch/arm64/kernel/entry-common.c  | 4 +++-
 arch/arm64/kernel/irq.c           | 9 ++++++---
 include/asm-generic/vmlinux.lds.h | 3 ++-
 include/linux/irq.h               | 4 +++-
 kernel/irq/handle.c               | 8 +++++---
 5 files changed, 19 insertions(+), 9 deletions(-)

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
