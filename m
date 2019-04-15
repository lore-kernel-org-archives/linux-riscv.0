Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D231C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:57:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D05352073F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:57:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jd8CJ+Hk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D05352073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-sky.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=gq8DK2kgw6hVqNzrGwFyQVm9cFVUXlYLNBmdICajfoo=; b=Jd8
	CJ+Hk12cfQu6+nZzwqDQ9nUEroYrEPOJVp+53wnmZfE7Y2AiSFdKHD6+f4sAJSp9p0DmkQYsyd8pn
	FwFnbtgWlYl32ANPV4f6UEQz/PdTlGz1UZOSxIubrW7yhMJfUhiH8B3MUYEpu4dKtBKWgRR9smGbe
	iLxL2n1V4HlQWVZyHF919mNPiFG41UTIOn1KoACdIb7WWW5DniyCqhFNi9ruS959qpsbYnMYt0oZg
	VVUsY6gMa7b7nCrcLkuX0k47J721wtVVcNbQ6/bGXbjJyrNU0QD7O9L93BZwaBverkq6/e6D8/2FH
	HEBthlIwEg8kTZ8eLusVL0yLCsv5y6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFyMr-0007dw-Fr; Mon, 15 Apr 2019 09:57:37 +0000
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFyMm-0007SW-Kr
 for linux-riscv@lists.infradead.org; Mon, 15 Apr 2019 09:57:34 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07511862|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.504454-0.105798-0.389748; FP=0|0|0|0|0|-1|-1|-1;
 HT=e01l07423; MF=han_mao@c-sky.com; NM=1; PH=DS; RN=6; RT=6; SR=0;
 TI=SMTPD_---.ELbwotw_1555322247; 
Received: from localhost(mailfrom:han_mao@c-sky.com
 fp:SMTPD_---.ELbwotw_1555322247) by smtp.aliyun-inc.com(10.147.40.2);
 Mon, 15 Apr 2019 17:57:27 +0800
From: Mao Han <han_mao@c-sky.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] riscv: Add perf callchain support
Date: Mon, 15 Apr 2019 17:52:10 +0800
Message-Id: <cover.1555320740.git.han_mao@c-sky.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_025732_907912_A05E14FE 
X-CRM114-Status: UNSURE (   7.72  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>, Guo Ren <guoren@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Mao Han <han_mao@c-sky.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch set add perf callchain(FP/DWARF) support for RISC-V.
It comes from the csky version callchain support with some
slight modifications. The patchset base on Linux 5.1-rc4:
15ade5d2e7775667cf191cf2f94327a4889f8b9d

CC: Palmer Dabbelt <palmer@sifive.com>
CC: linux-riscv<linux-riscv@lists.infradead.org>
CC: Christoph Hellwig <hch@lst.de>
CC: Guo Ren <guoren@kernel.org>

Changes since v1:
  - simplify implementation and code convention

Mao Han (3):
  riscv: Add perf callchain support
  riscv: Add support for perf registers sampling
  riscv: Add support for libdw

 arch/riscv/Kconfig                            |   2 +
 arch/riscv/include/uapi/asm/perf_regs.h       |  42 ++++++++++
 arch/riscv/kernel/Makefile                    |   4 +-
 arch/riscv/kernel/perf_callchain.c            | 113 ++++++++++++++++++++++++++
 arch/riscv/kernel/perf_regs.c                 |  44 ++++++++++
 tools/arch/riscv/include/uapi/asm/perf_regs.h |  42 ++++++++++
 tools/perf/Makefile.config                    |   6 +-
 tools/perf/arch/riscv/Build                   |   1 +
 tools/perf/arch/riscv/Makefile                |   3 +
 tools/perf/arch/riscv/include/perf_regs.h     |  96 ++++++++++++++++++++++
 tools/perf/arch/riscv/util/Build              |   2 +
 tools/perf/arch/riscv/util/dwarf-regs.c       |  72 ++++++++++++++++
 tools/perf/arch/riscv/util/unwind-libdw.c     |  57 +++++++++++++
 13 files changed, 482 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/include/uapi/asm/perf_regs.h
 create mode 100644 arch/riscv/kernel/perf_callchain.c
 create mode 100644 arch/riscv/kernel/perf_regs.c
 create mode 100644 tools/arch/riscv/include/uapi/asm/perf_regs.h
 create mode 100644 tools/perf/arch/riscv/Build
 create mode 100644 tools/perf/arch/riscv/Makefile
 create mode 100644 tools/perf/arch/riscv/include/perf_regs.h
 create mode 100644 tools/perf/arch/riscv/util/Build
 create mode 100644 tools/perf/arch/riscv/util/dwarf-regs.c
 create mode 100644 tools/perf/arch/riscv/util/unwind-libdw.c

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
