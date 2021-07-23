Return-Path: <SRS0=o9Ga=MP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B39AC432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 21:41:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FA3A60EB6
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 21:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FA3A60EB6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iU4IGCM3+0MyM9sEMEZE+0CdH8SuK1A+iboIU6SAwR4=; b=d0UCFqDLWyKUfh
	VgqKKlp1G5Et+zOfv5PBk1Bz60y91MQJZoq5bSeMmNvhFCymRYw4h+OLtayF2T3MG1ZmWbwmMibdJ
	FNphKA+FxQvHiC0Jdo7PRVeu+MOcEHNuNzxgGVBl7pr6ZpqgbV37pIt0gI8zKHNGw52QE+zQ8bgZ8
	vpgbSwjTOQ27z8bw+4eIKW0AzwuVtD4LDlrzG8x8C6g0Nap69L+N206uwVvz4/PoWZUtfw6ZbNa7C
	z7wZDKqB5zIMyxW49SFOEKgEexYMfgHahF8Goa1LZMaXePpoGh7NElfFgA0R1+K+ebepWpqMcprJk
	7KGyhs7PoxgEPeqgqIIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m72uO-005zKR-PC; Fri, 23 Jul 2021 21:40:40 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m72uL-005zHa-U0
 for linux-riscv@lists.infradead.org; Fri, 23 Jul 2021 21:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1627076437; x=1658612437;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mh2H2AqgX7zCMJmvVV14kJPveSdfSaOx1iNS29W3dS0=;
 b=pdi2rQco2DN+TIiF+HWl4UxFqjBXsV8nqPiJZMm1oulxoym+CsPrLtTk
 XBha+JqKKtygBRCnQ0WniOwEpyJswMkFxTi1qveKhKaw7tB4Y6xSkpbmS
 Ygq1/AwJC8Wje6Nehm4j8LQ1d1DkUvqeX8kXnaFk+j+gjUDxPK65ZpeV9
 gluLIW0bZlpCA3AnQr2bhUC8gRiNePCUvXOZmR1e6gt2IJxgklkwUwg24
 b3deV5ah7gjgzt6pZmVuuF8j8X1cIjJIwTdqP8Subxpe43aWNZWR+f0NO
 nMaR2olJMLf5PHYVPz/gyPWfCehxHaHkxEFjmpOA3FKlOVJT+O66MgslH Q==;
X-IronPort-AV: E=Sophos;i="5.84,265,1620662400"; d="scan'208";a="279198448"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jul 2021 05:40:34 +0800
IronPort-SDR: ZeVOsG9BV/bo/pXlGKeu2JRVCb4a8RR9JLrYqgjsFO4zWubJR0wIFnrXJVmHJPiOi3KBwf9qdA
 Nsrad+/q+xqkcrAz/ZxcLkJH8fLQNMdpS1uPwIYEXpWyd9kwmIxPqS+cuprkdwKNvACrapEk+t
 A2aNRPFIcC3C3Ha0EWM+4ulIxnk6RsgUIqNe839ulurSM14Y+RO159sVzmn5AXVxml9J8o0Vca
 jI9X4icneeTfHDIKGCp0xMN4z0SIiQySbqAVJZKftvBS8HC8AhqYGfAdgVBbV/cPGJJ2z/kaZT
 2WoTt8E/Pes1ag8Lvhq8iiT8
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 14:18:24 -0700
IronPort-SDR: S4LhvUQ74NR2pVUEi2iTWK2rF8yj17ZaeIV3WL/BXkS6QFGmU8kh/4TeJIUSHlFaNwOsG1NQAn
 xppqY2Z9lrhrzfXSczZj+czih/cqibkinofktm7F6aEhMYJnPYQWxN/sknVi5xcjOpJVosupM2
 O42MX0dNi1Y+YMpbypuzOq4wGPiD/5HaOupgAhHRmSXp+gEce2HrJ/hdPg24Yln6P6Cbd2XCa6
 c1XNQeTqq0mai1j7h7sDxqR9fQFKgHDHx+clem2xb0gcj9Mh5q3l6kf8xgR9idp/ttiMgjWziv
 /HY=
WDCIronportException: Internal
Received: from ucfbox21.ad.shared (HELO hulk.wdc.com) ([10.225.167.4])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Jul 2021 14:40:35 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christoph Hellwig <hch@lst.de>, devicetree@vger.kernel.org,
 Dmitry Vyukov <dvyukov@google.com>, Frank Rowand <frowand.list@gmail.com>,
 Guo Ren <guoren@linux.alibaba.com>, iommu@lists.linux-foundation.org,
 linux-riscv@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Tobias Klauser <tklauser@distanz.ch>
Subject: [RFC 0/5] Support non-coherent DMA on RISC-V using a global pool
Date: Fri, 23 Jul 2021 14:40:26 -0700
Message-Id: <20210723214031.3251801-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_144038_086956_825FA3DE 
X-CRM114-Status: GOOD (  19.79  )
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

RISC-V privilege specification doesn't define an IOMMU or any method modify
PMA attributes or PTE entries to allow non-coherent mappings yet. In
the beginning, this approach was adopted assuming that most of the RISC-V
platforms would support full cache-coherent IO. Here is excerpt from the
priv spec section 3.6.5

"In RISC-V platforms, the use of hardware-incoherent regions is discouraged
due to software complexity, performance, and energy impacts."

While some of the RISC-V platforms adhere to the above suggestion, not all
platforms can afford to build to fully cache-coherent I/O devices. To
address DMA for non-coherent I/O devices, we need to mark a region of memory
as non-cacheable. Some of the platforms rely on a fixed region of uncached
memory that is remapped to the system memory while some other modify
the PTE entries to achieve that.

The patch3 solves the issue for the fist use case by using a global
pool of memory that is reserved for DMA. The device access the reserved area
of the region while corresponding CPU address will be from uncached region
As the uncached region is remapped to the beginning of the system ram, both
CPU and device get the same view.

To facilitate streaming DMA APIs, patch 1 introduces a set of generic
cache operations. Any platform can use the generic ops to provide platform
specific cache management operations. Once the standard RISC-V CMO extension
is available, it will also use these generic ops.

To address the second use case, Page Based Memory Attribute (PBMT) extension
is proposed. Once the extension is in good shape, we can leverage that
using CONFIG_DIRECT_REMAP. Currently, it is selected via a compile time config
option. We will probably need another arch specific hooks to know if the
platform supports direct remap at runtime. For RISC-V, it will check the
presence of PBMT extension while other arch function will simply return true
if DIRECT_REMAP is enabled. This is required as arious different config
(DIRECT_REMAP, GLOBAL_POOL) will be enabled in the defconfig so that a
unified kernel image can boot on all RISC-V platforms.

This patch series depends on Christoph's global pool support series[1].
Tested on Qemu, HiFive unleashed and beagleV. This series is also available
at [2]. 
This series also solves the non-coherent DMA support on beagleV but requires
additional beagleV specific patches[3] which will be upstreamed soon.


[1] https://lists.linuxfoundation.org/pipermail/iommu/2021-July/057266.html 
[2] https://github.com/atishp04/linux/tree/riscv_nc_global_pool
[3] https://github.com/atishp04/linux/tree/wip_beaglev_dma_nc_global

Atish Patra (5):
RISC-V: Implement arch_sync_dma* functions
of: Move of_dma_get_range to of_address.h
dma-mapping: Enable global non-coherent pool support for RISC-V
dma-direct: Allocate dma pages directly if global pool allocation
fails
RISC-V: Support a new config option for non-coherent DMA

arch/riscv/Kconfig                       |  8 +++
arch/riscv/include/asm/dma-noncoherent.h | 19 +++++++
arch/riscv/mm/Makefile                   |  1 +
arch/riscv/mm/dma-noncoherent.c          | 66 ++++++++++++++++++++++++
drivers/of/of_private.h                  | 10 ----
include/linux/of_address.h               | 12 +++++
kernel/dma/coherent.c                    | 49 +++++++++++++++---
kernel/dma/direct.c                      |  7 ++-
8 files changed, 152 insertions(+), 20 deletions(-)
create mode 100644 arch/riscv/include/asm/dma-noncoherent.h
create mode 100644 arch/riscv/mm/dma-noncoherent.c

--
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
