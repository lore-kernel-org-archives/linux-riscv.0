Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27493EB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 17:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wnldVTUSy/zzEremKdxIvnTTz5B9uM9aYHJZl3DcPaM=; b=t+EDMPwCcu3q2P
	e2XgzUJX9BT+ASp+81CS5ol8Zu4m9df7SXx7WOvaydAmRkSQHCaBo/HcytPLJoxsjxJ4j/oSiHXO2
	EWIwJBsvzJhAWZIUSWKLXHLYq6d5+Oegt65iFF7kaWJE+NaO+1xiBMCEGHjHHSCn8pwAC5NiJ3Gks
	ZOIn3wZZiLTRZGKrcwnEOjkYQQaREHeaGEzR+PzC/v+Z/M5kcDxl9QoicOzdIF7y9tGGNEFudKjsv
	x2UXlSGwnnk9Ct5c/BsMzAcL4QdFNtxvEiqYdORzZa7P7P1LPZDOdQLBnk4pz2Y2VvE30ZCFj/ZXp
	aFc3fb+a/8t5uVG/JBvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL59x-00DDlA-2Z;
	Sun, 16 Jul 2023 17:03:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL59W-00DDeI-0w
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jul 2023 17:03:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C5A5860DD0;
	Sun, 16 Jul 2023 17:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8391C433C8;
	Sun, 16 Jul 2023 17:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689527001;
	bh=20Zikv72OY76YPWE++4/3jVTe/sLWDTAfsZqK7N92KQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Y7tUXlqTb2RTqjU/5X6XsYUAKr/1DDq7xMzby0BIFbpXmiQLOK8k8LS+kbQS/qrfJ
	 1SZysyfCHvFm1K/x5nW1nCrAkICcHzkrG7y8zmrTLEm733ySdb33bfCO+63pDhHivv
	 IpOeg2jLQhicVR/g7jrMR/bANwzH6CDbvmbRHErQeK589svbW0w4wqp0esok7DLphh
	 NKWMVyOTZtmkEcOMbMavx2rnEH3553pfJBQaOXqBy9aeJhqK2NYxL9U/Zysl2ml7pz
	 0s7csg7Xp0mVfYdatvdojnWSjKsoJJYIWbVVgTgTlQ6o5FnJeUml62SyglnrDg2fny
	 c/xR76ujLxVpQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] riscv: Reduce ARCH_KMALLOC_MINALIGN to 8
Date: Mon, 17 Jul 2023 00:51:45 +0800
Message-Id: <20230716165147.1897-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_100325_315351_2803C713 
X-CRM114-Status: GOOD (  16.06  )
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

Currently, riscv defines ARCH_DMA_MINALIGN as L1_CACHE_BYTES, I.E
64Bytes, if CONFIG_RISCV_DMA_NONCOHERENT=y. To support unified kernel
Image, usually we have to enable CONFIG_RISCV_DMA_NONCOHERENT, thus
it brings some bad effects to coherent platforms:

Firstly, it wastes memory, kmalloc-96, kmalloc-32, kmalloc-16 and
kmalloc-8 slab caches don't exist any more, they are replaced with
either kmalloc-128 or kmalloc-64.

Secondly, larger than necessary kmalloc aligned allocations results
in unnecessary cache/TLB pressure.

This issue also exists on arm64 platforms. From last year, Catalin
tried to solve this issue by decoupling ARCH_KMALLOC_MINALIGN from
ARCH_DMA_MINALIGN, limiting kmalloc() minimum alignment to
dma_get_cache_alignment() and replacing ARCH_KMALLOC_MINALIGN usage
in various drivers with ARCH_DMA_MINALIGN etc.[1]

One fact we can make use of for riscv: if the CPU doesn't support
ZICBOM or T-HEAD CMO, we know the platform is coherent. Based on
Catalin's work and above fact, we can easily solve the kmalloc align
issue for riscv: we can override dma_get_cache_alignment(), then let
it return ARCH_DMA_MINALIGN at the beginning and return 1 once we know
the underlying HW neither supports ZICBOM nor supports T-HEAD CMO.

So what about if the CPU supports ZICBOM and T-HEAD CMO, but all the
devices are dma coherent? Well, we use ARCH_DMA_MINALIGN as the
kmalloc minimum alignment, nothing changed in this case. This case
can be improved in the future.

After this patch, a simple test of booting to a small buildroot rootfs
on qemu shows:

kmalloc-96           5041    5041     96  ...
kmalloc-64           9606    9606     64  ...
kmalloc-32           5128    5128     32  ...
kmalloc-16           7682    7682     16  ...
kmalloc-8           10246   10246      8  ...

So we save about 1268KB memory. The saving will be much larger in normal
OS env on real HW platforms.


patch1 allows kmalloc() caches aligned to the smallest value.
patch2 enables DMA_BOUNCE_UNALIGNED_KMALLOC.

After this series:

As for coherent platforms, kmalloc-{8,16,32,96} caches come back on
coherent both RV32 and RV64 platforms, I.E !ZICBOM and !THEAD_CMO.

As for noncoherent RV32 platforms, nothing changed.

As for noncoherent RV64 platforms, I.E either ZICBOM or THEAD_CMO, the
above kmalloc caches also come back if > 4GB memory or users pass
"swiotlb=mmnn,force" to force swiotlb creation if <= 4GB memory. How
much mmnn should be depends on the specific platform, it need to be
tried and tested all possible usage case on the specific hardware. For
example, I can use the minimal I/O TLB slabs on Sipeed M1S Dock.

[1] Link: https://lore.kernel.org/linux-arm-kernel/20230524171904.3967031-1-catalin.marinas@arm.com/

Since v1
 - remove preparation patches since they have been merged
 - adjust Kconfig entry to keep entries sorted
 - add new function riscv_set_dma_cache_alignment() to set the
   dma_cache_alignment var.

Jisheng Zhang (2):
  riscv: allow kmalloc() caches aligned to the smallest value
  riscv: enable DMA_BOUNCE_UNALIGNED_KMALLOC for !dma_coherent

 arch/riscv/Kconfig                  |  1 +
 arch/riscv/include/asm/cache.h      | 14 ++++++++++++++
 arch/riscv/include/asm/cacheflush.h |  2 ++
 arch/riscv/kernel/setup.c           |  1 +
 arch/riscv/mm/dma-noncoherent.c     |  8 ++++++++
 5 files changed, 26 insertions(+)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
