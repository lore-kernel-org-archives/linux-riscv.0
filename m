Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D19CDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 05:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jUJGYqk5kQWEMlBGORiuxtaQ8bQWnEa6/tmzpK+3kEI=; b=EZFZDol8jDNzr3
	blxCXo+ThkpQNBXc2eJ7UfqR7osYJTg0qvN7xxc/ccznw9Md82nqaW4BwykV7S7eYTaZ2gQa/kN2u
	IBvt8oNzlK/Mwbi2zXOa4oA5TnGZgLNznFA5HJh5b0a9dIgJtWaFH4JOHVMBOudvunKQ2In5YRWNJ
	LD+/LrH2W5q/m++J2BKNAeeE2CTElF2Ua4XQlGyg1GHlpfuob+w17a8XF2p3kjkfWqOTojxhk5sW8
	gcidLecpZvGLn8Ucv/rupudw2U2GTfXFLD+KivHCULmTF/+1Oa99uFdGoCq/jsppURr4rXtObJWmj
	czrMsU7wS1LVCmt8CzYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsGSQ-008Qft-06;
	Mon, 16 Oct 2023 05:48:02 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qsGSM-008Qdv-36;
	Mon, 16 Oct 2023 05:47:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Greg Ungerer <gerg@linux-m68k.org>,
	iommu@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-m68k@lists.linux-m68k.org,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Jim Quinlan <james.quinlan@broadcom.com>
Subject: fix the non-coherent coldfire dma_alloc_coherent v2
Date: Mon, 16 Oct 2023 07:47:42 +0200
Message-Id: <20231016054755.915155-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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

Hi all,

this is the next attempt to not return memory that is not DMA coherent
on coldfire/m68knommu.  The last one needed more fixups in the fec
driver, which this versions includes.  On top of that I've also added
a few more cleanups to the core DMA allocation code.

Jim: any work to support the set_uncached and remap method for arm32
should probably be based on this, and patch 3 should make that
selection a little easier.

Changes since v1:
 - sort out the dependency mess in RISCV
 - don't even built non-coherent DMA support for coldfire cores without
   data caches
 - apply the fec workarounds to all coldfire platforms with data caches
 - add a trivial cleanup for m68k dma.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
