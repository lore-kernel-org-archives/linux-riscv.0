Return-Path: <SRS0=q3DZ=MR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA856C65BA7
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Oct 2018 16:18:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C3322147D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Oct 2018 16:18:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dfNaFMXU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C3322147D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I7Ly8KgJ1Bs4tH6eiCNCkThFEb49EWUWPxGujquAGM0=; b=dfNaFMXU8mKpwh
	1Q80XlIRVPBekfeb4fjVS1b5ZZATIcCzILvzPYpaya0O5Ih2aai13ds+DAK6Oix8xC2Kb5Xylmwk9
	Ym3u+5S9Y25GqziztBbw+xPRZZ1eeW8v+lqwvJ71ecJVcGwLqsVK2ctVYfNgXVzdQ0ji7BPx1Z27H
	6h4RUlQwVrSvj0tef2t/OT9a/ye3rjtcpzRFf0ujrz2M6PwWVB/dqzueD3r9YxVzj0xZeiCiaOeDx
	yosuLjhodtAncoDAQ968oXXU2mYxjHPZm4H/GjX9ZrLeBDxRRcUKFO0V2jhfqNVYG3gabRgPPe8gE
	nTxSNiOHfZjOnXC2lwiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g8So8-0006FZ-L3; Fri, 05 Oct 2018 16:18:28 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8Sme-0005ee-MD; Fri, 05 Oct 2018 16:17:22 +0000
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <gunthorp@deltatee.com>)
 id 1g8SmS-0008D1-Iy; Fri, 05 Oct 2018 10:16:45 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.89)
 (envelope-from <gunthorp@deltatee.com>)
 id 1g8SmR-0000eV-S9; Fri, 05 Oct 2018 10:16:43 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sh@vger.kernel.org
Date: Fri,  5 Oct 2018 10:16:37 -0600
Message-Id: <20181005161642.2462-1-logang@deltatee.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sh@vger.kernel.org, sbates@raithlin.com, palmer@sifive.com,
 aou@eecs.berkeley.edu, hch@lst.de, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH 0/5] sparsemem support for RISC-V
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181005_091656_785024_8F55F394 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20181005161637.XLZRA5kaFMtTx9s6GKgmvGcOTiwgBru-vNrbCNJxwY0@z>

Hi Everyone,

This patchset is intended to implement sparsemem on RISC-V.
The first few patches are introducing a common helper used by the
sparesmem implementation in other architectures and the final
patch is the actual RISC-V implementation.

This is the first small step in supporting P2P on RISC-V.

Thanks,

Logan

--

Logan Gunthorpe (5):
  mm/sparse: add common helper to mark all memblocks present
  ARM: mm: make use of new memblocks_present() helper
  arm64: mm: make use of new memblocks_present() helper
  sh: mm: make use of new memblocks_present() helper
  RISC-V: Implement sparsemem

 arch/arm/mm/init.c                 | 17 +----------------
 arch/arm64/mm/init.c               | 20 +-------------------
 arch/riscv/Kconfig                 | 23 +++++++++++++++++++++++
 arch/riscv/include/asm/pgtable.h   | 24 ++++++++++++++++++++----
 arch/riscv/include/asm/sparsemem.h | 11 +++++++++++
 arch/riscv/kernel/setup.c          |  4 +++-
 arch/riscv/mm/init.c               |  8 ++++++++
 arch/sh/mm/init.c                  |  7 +------
 include/linux/mmzone.h             |  6 ++++++
 mm/sparse.c                        | 15 +++++++++++++++
 10 files changed, 89 insertions(+), 46 deletions(-)
 create mode 100644 arch/riscv/include/asm/sparsemem.h

--
2.19.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
