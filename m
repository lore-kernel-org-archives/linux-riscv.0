Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862FFC04AA5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 18:40:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53A7A208B3
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 18:40:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hnGtPGu5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53A7A208B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fY/XHH7O+zDpf61PvXkorxEIsb+rWc3LLD0tMEogUvU=; b=hnGtPGu5e3qjKs
	je+CB1rwqub+SNnn4zF/cyukeuZn4g5ce+uzQfhR9egJ4RUdWx+Y4iRJ/OyqN8Zt+v1N/LPYk30DM
	c/g9ukF5N/AH4TrqycsdWh5Fw7797+X5AwlNJ908fRhmDCM+ulDOJ25YeA2o87NvNmQFGrNthZ6+7
	DxrwLAAzYWvDm39c93qOhBjtSPpLjKOF9fhkKQu3RFZpxl3kiy1GtqijMUbC/XBj2OLQETjn4481V
	WjbNbrHQET5Y9ZWLJgwWy7xqs6uTnGVmZVCVT9Sd/82vbQBikRC5lcR5BAohRwPqqyzSmWoDISInz
	rnPqXmzQbhElAbXflvtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gC7n3-0006wU-9S; Mon, 15 Oct 2018 18:40:29 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gC77R-0008I2-B5; Mon, 15 Oct 2018 17:59:17 +0000
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <gunthorp@deltatee.com>)
 id 1gC77C-0002IH-3R; Mon, 15 Oct 2018 11:57:14 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.89)
 (envelope-from <gunthorp@deltatee.com>)
 id 1gC778-0002MY-Sf; Mon, 15 Oct 2018 11:57:10 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sh@vger.kernel.org
Date: Mon, 15 Oct 2018 11:56:56 -0600
Message-Id: <20181015175702.9036-1-logang@deltatee.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sh@vger.kernel.org, sbates@raithlin.com, palmer@sifive.com,
 aou@eecs.berkeley.edu, hch@lst.de, akpm@linux-foundation.org, arnd@arndb.de,
 logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v2 0/6] sparsemem support for RISC-V
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_105729_548532_A53DA30A 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Palmer Dabbelt <palmer@sifive.com>, Stephen Bates <sbates@raithlin.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015175656.WYiAEsJQm-h2WnCZcwHjmIMeC5Ak_WZu5Mgh1vJXjWw@z>

This patchset implements sparsemem on RISC-V. The first few patches
move some code in existing architectures into common helpers
so they can be used by the new RISC-V implementation. The final
patch actually adds sparsmem support to RISC-V.

This is the first small step in supporting P2P on RISC-V.

--

Changes in v2:

* Rebase on v4.19-rc8
* Move the STRUCT_PAGE_MAX_SHIFT define into a common header (near
  the definition of struct page). As suggested by Christoph.
* Clean up the unnecessary nid variable in the memblocks_present()
  function, per Christoph.
* Collected tags from Palmer and Catalin.

--
Logan Gunthorpe (6):
  mm: Introduce common STRUCT_PAGE_MAX_SHIFT define
  mm/sparse: add common helper to mark all memblocks present
  ARM: mm: make use of new memblocks_present() helper
  arm64: mm: make use of new memblocks_present() helper
  sh: mm: make use of new memblocks_present() helper
  RISC-V: Implement sparsemem

 arch/arm/mm/init.c                 | 17 +----------------
 arch/arm64/include/asm/memory.h    |  9 ---------
 arch/arm64/mm/init.c               | 28 +---------------------------
 arch/riscv/Kconfig                 | 23 +++++++++++++++++++++++
 arch/riscv/include/asm/pgtable.h   | 21 +++++++++++++++++----
 arch/riscv/include/asm/sparsemem.h | 11 +++++++++++
 arch/riscv/kernel/setup.c          |  4 +++-
 arch/riscv/mm/init.c               |  8 ++++++++
 arch/sh/mm/init.c                  |  7 +------
 include/asm-generic/fixmap.h       |  1 +
 include/linux/mm_types.h           |  5 +++++
 include/linux/mmzone.h             |  6 ++++++
 mm/sparse.c                        | 14 ++++++++++++++
 13 files changed, 91 insertions(+), 63 deletions(-)
 create mode 100644 arch/riscv/include/asm/sparsemem.h

--
2.19.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
