Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7768AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 21:37:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 460242075E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 21:37:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JJi+O+6i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 460242075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L3+Gn57G8VZMVdv0FS24PGdT/t9Ssndh/J/DNRyOZJ8=; b=JJi+O+6iaN7ewE
	j0l+/4JY4JgVU0VXtKZcSxTP0+A0bxqJ/vtEAvmbOsQyRvKJgmeuOmVRPtT5Q2RnijFIEjoSyN0GN
	Mr+3lkyvH+GxX3FAWTJGT83EX9hTR8t76BlQpuQPX00aVMrmN3ZU/bp+YgbUfclPiyHNdyMmt8cAn
	0xECNSdJynnKFlNUsWXL/WBtWm9DLSHwX9x9VR5sxdUiMWTGjlv8oj2A28v0vKyBwL4RqRwOLkzXn
	yudkc6tmiBnKsSVnj/OVey7BIh75matoQh+SB5le/ZjbOWLaxQ13Bq1pC8Bp8Q/lOPMUrMdcUoar5
	mgM8lqP38nQxjrnaPxLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9GEM-0001NC-9H; Wed, 27 Mar 2019 21:37:06 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9GEC-0001GM-OG
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 21:37:01 +0000
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <gunthorp@deltatee.com>)
 id 1h9GE3-0006DG-1s; Wed, 27 Mar 2019 15:36:47 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.89)
 (envelope-from <gunthorp@deltatee.com>)
 id 1h9GE1-0006CW-Pm; Wed, 27 Mar 2019 15:36:45 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Date: Wed, 27 Mar 2019 15:36:36 -0600
Message-Id: <20190327213643.23789-1-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, sbates@raithlin.com, palmer@sifive.com,
 hch@lst.de, aou@eecs.berkeley.edu, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH 0/7] RISC-V: Sparsmem, Memory Hotplug and pte_devmap for P2P
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_143657_297693_D71AD0B9 
X-CRM114-Status: GOOD (  13.32  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Logan Gunthorpe <logang@deltatee.com>,
 Christoph Hellwig <hch@lst.de>, Albert Ou <aou@eecs.berkeley.edu>,
 Stephen Bates <sbates@raithlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

This patchset enables P2P on the RISC-V architecture. To do this on the
current kernel, we only need to be able to back IO memory with struct
pages using devm_memremap_pages(). This requires ARCH_HAS_ZONE_DEVICE,
ARCH_ENABLE_MEMORY_HOTPLUG, and ARCH_ENABLE_MEMORY_HOTREMOVE; which in
turn requires ARCH_SPARSEMEM_ENABLE. We also need to ensure that the
IO memory regions in hardware can be covered by the linear region
so that there is a linear relation ship between the virtual address and
the struct page address in the vmemmap region.

While our reason to do this work is for P2P, these features are all
useful, more generally, and also enable other kernel features.

The first patch in the series implements sparse mem. It was already
submitted and reviewed last cycle, only forgotten. It has been rebased
onto v5.1-rc2.

Patches 2 through 4 rework the architecture's virtual address space
mapping trying to get as much of the IO regions covered by the linear
mapping. With Sv39, we do not have enough address space to cover all the
typical hardware regions but we can get the majority of it.

Patch 5 and 6 implement memory hotplug and remove. These are relatively
straight forward additions similar to other arches.

Patch 7 implements pte_devmap which allows us to set
ARCH_HAS_ZONE_DEVICE.

The patchset was tested in QEMU and on a HiFive Unleashed board.
However, we were unable to actually test P2P transactions with this
exact set because we have been unable to get PCI working with v5.1-rc2.
We were able to get it running on a 4.19 era kernel (with a bunch of
out-of-tree patches for PCI on a Microsemi PolarFire board).

This series is based on v5.1-rc2 and a git tree is available here:

https://github.com/sbates130272/linux-p2pmem riscv-p2p-v1

Thanks,

Logan

--

Logan Gunthorpe (7):
  RISC-V: Implement sparsemem
  RISC-V: doc: Add file describing the virtual memory map
  RISC-V: Rework kernel's virtual address space mapping
  RISC-V: Update page tables to cover the whole linear mapping
  RISC-V: Implement memory hotplug
  RISC-V: Implement memory hot remove
  RISC-V: Implement pte_devmap()

 Documentation/riscv/mm.txt            |  24 +++
 arch/riscv/Kconfig                    |  32 +++-
 arch/riscv/include/asm/page.h         |   2 -
 arch/riscv/include/asm/pgtable-64.h   |   2 +
 arch/riscv/include/asm/pgtable-bits.h |   8 +-
 arch/riscv/include/asm/pgtable.h      |  45 ++++-
 arch/riscv/include/asm/sparsemem.h    |  11 ++
 arch/riscv/kernel/setup.c             |   1 -
 arch/riscv/mm/init.c                  | 251 ++++++++++++++++++++++++--
 9 files changed, 354 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/riscv/mm.txt
 create mode 100644 arch/riscv/include/asm/sparsemem.h

--
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
