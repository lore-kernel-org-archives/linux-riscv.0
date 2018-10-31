Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808DCC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 10:36:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02D6E2081B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 10:36:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z1hq3GZX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02D6E2081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kbUrIanjZ40y0SVggK6iUTy3VWc1OIJuaa6SYElypEM=; b=Z1hq3GZX8Ul3VX
	yN9jF+0+IAnMrAhTAA9D128G4ZcPZA7CWaZk1J2XSHjefaTBX5qthdGIJbraZMiE5w3ql4VC+a5J9
	tjyoF8C+MnTUyM6Yd62lywRr8gBpyuePUZI2GboquaU+EXxh3oERwpmxFLXYGMrAmMewJN4/FNMMc
	1tpKiLGO7NyCfZfMP8RDFGPa6JaTGaU4SKyDwpdFeIfl+Lp584NDy8TkzpUQTHWRJsLfd9iM7XAw+
	KGlDZ2sub3siIeKVuxA8Gam8jTuGdUDzFseIrg6MmEVvqveX84dTZLSL4NqrPUr68mAjjKxoMSCvc
	lzQY+A7NvtcdFDn6SutQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHnrH-0000il-1R; Wed, 31 Oct 2018 10:36:19 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHnrD-0000gv-Bb
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 10:36:17 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id w9VAaVRO095819;
 Wed, 31 Oct 2018 18:36:31 +0800 (GMT-8)
 (envelope-from vincentc@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Wed, 31 Oct 2018
 18:35:35 +0800
From: Vincent Chen <vincentc@andestech.com>
To: <palmer@sifive.com>, <aou@eecs.berkeley.edu>
Subject: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
Date: Wed, 31 Oct 2018 18:35:28 +0800
Message-ID: <1540982130-28248-1-git-send-email-vincentc@andestech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com w9VAaVRO095819
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_033615_645943_DD735E1F 
X-CRM114-Status: UNSURE (   9.31  )
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
Cc: zong@andestech.com, arnd@arndb.de, alankao@andestech.com,
 greentime@andestech.com, linux-kernel@vger.kernel.org, vincentc@andestech.com,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031103528.UGpH_GiF5onaMlO369CLRzZSM59kqpCX_aO230XfY1M@z>

  RISC-V permits each vendor to develop respective extension ISA based
on RISC-V standard ISA. This means that these vendor-specific features
may be compatible to their compiler and CPU. Therefore, each vendor may
be considered a sub-architecture of RISC-V. Currently, vendors do not
have the appropriate examples to add these specific features to the
kernel. In this RFC set, we propose an infrastructure that vendor can
easily hook their specific features into kernel. The first commit is
the main body of this infrastructure. In the second commit, we provide
a solution that allows dma_map_ops() to work without cache coherent
agent support. Cache coherent agent is unsupported for low-end CPUs in
the AndeStar RISC-V series. In order for Linux to run on these CPUs, we
need this solution to overcome the limitation of cache coherent agent
support. Hence, it also can be used as an example for the first commit.

  I am glad to discuss any ideas, so if you have any idea, please give
me some feedback.

Vincent Chen (2):
  RISC-V: An infrastructure to add vendor-specific code.
  RISC-V: make dma_map_ops work without cache coherent agent

 arch/riscv/Kconfig                              |   49 +++++
 arch/riscv/Makefile                             |    6 +
 arch/riscv/include/asm/sbi.h                    |    6 +
 arch/riscv/include/asm/vendor-hook.h            |   13 ++
 arch/riscv/kernel/cpufeature.c                  |    5 +
 arch/riscv/kernel/setup.c                       |    6 +-
 arch/riscv/vendor-nds/Kconfig                   |   29 +++
 arch/riscv/vendor-nds/Makefile                  |    1 +
 arch/riscv/vendor-nds/cache.c                   |   83 ++++++++
 arch/riscv/vendor-nds/include/asm/csr.h         |   32 +++
 arch/riscv/vendor-nds/include/asm/dma-mapping.h |   24 +++
 arch/riscv/vendor-nds/include/asm/proc.h        |   17 ++
 arch/riscv/vendor-nds/include/asm/sbi.h         |   17 ++
 arch/riscv/vendor-nds/include/asm/vendor-hook.h |    8 +
 arch/riscv/vendor-nds/noncoherent_dma.c         |  254 +++++++++++++++++++++++
 arch/riscv/vendor-nds/setup.c                   |   16 ++
 16 files changed, 565 insertions(+), 1 deletions(-)
 create mode 100644 arch/riscv/include/asm/vendor-hook.h
 create mode 100644 arch/riscv/vendor-nds/Kconfig
 create mode 100644 arch/riscv/vendor-nds/Makefile
 create mode 100644 arch/riscv/vendor-nds/cache.c
 create mode 100644 arch/riscv/vendor-nds/include/asm/csr.h
 create mode 100644 arch/riscv/vendor-nds/include/asm/dma-mapping.h
 create mode 100644 arch/riscv/vendor-nds/include/asm/proc.h
 create mode 100644 arch/riscv/vendor-nds/include/asm/sbi.h
 create mode 100644 arch/riscv/vendor-nds/include/asm/vendor-hook.h
 create mode 100644 arch/riscv/vendor-nds/noncoherent_dma.c
 create mode 100644 arch/riscv/vendor-nds/setup.c


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
