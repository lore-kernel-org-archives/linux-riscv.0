Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DA8C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jul 2022 10:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xpBCCfUITkN6+Q6UBsu/Y9rrv2u+dCFowcd8tOZDK4E=; b=EZHTXSzAs4gUKP
	qHuNGmQ8PLwYa+BBmfQ1H78ub2GS84KHwnHMdWuTZB8xSXNE1Sl7NMCt/8CFsZbnp5tTgFYYPoSr6
	HJxCPe1Uf5uOnAEB8vYWbA1L2F3WwFM+qqL3+ss7FssPZ/TsKdSTkA9Zuj1xaUiSVzcnPZiW5Trjk
	JL/QU9HpZNZFH3VCCzshMjgDC/9U5FywyhzRv8LrjUgn2hdf51b/brODe6e84EIgR8ZD7mlS/3w9G
	Z+z8mM+rMnIQx7f2ehxyAH0S4ne+KHO+IHlIKtOechbcpGA0bao41B1vrP6cOl7B/QtgTmdsjj7ve
	wQv6zZlB+W6GfMpwIueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD1HK-006IoD-PZ; Sun, 17 Jul 2022 10:13:34 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD1HH-006Imq-Ak
	for linux-riscv@lists.infradead.org; Sun, 17 Jul 2022 10:13:33 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R561e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0VJXkPQD_1658052805;
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VJXkPQD_1658052805)
          by smtp.aliyun-inc.com;
          Sun, 17 Jul 2022 18:13:25 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	heiko@sntech.de,
	guoren@kernel.org,
	mick@ics.forth.gr,
	alexandre.ghiti@canonical.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	crash-utility@redhat.com,
	huanyi.xj@alibaba-inc.com,
	heinrich.schuchardt@canonical.com,
	k-hagio-ab@nec.com,
	hschauhan@nulltrace.org,
	Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: [PATCH 0/5] Fixups to work with crash tool
Date: Sun, 17 Jul 2022 18:13:18 +0800
Message-Id: <20220717101323.370245-1-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_031331_565322_EFF4CBCE 
X-CRM114-Status: UNSURE (   9.17  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

I ever sent the patch 1,2 in the link:
https://patchwork.kernel.org/project/linux-riscv/patch/20220708073150.352830-2-xianting.tian@linux.alibaba.com/
https://patchwork.kernel.org/project/linux-riscv/patch/20220708073150.352830-3-xianting.tian@linux.alibaba.com/
And patch 3,4 in the link:
https://patchwork.kernel.org/project/linux-riscv/patch/20220714113300.367854-2-xianting.tian@linux.alibaba.com/
https://patchwork.kernel.org/project/linux-riscv/patch/20220714113300.367854-3-xianting.tian@linux.alibaba.com/

This patch series just put these patches together, and with a new patch 5.
these five patches are the fixups for kexec, vmcore and improvements
for vmcoreinfo and memory layout dump.

The main changes in the five patchs as below,
Patch 1: Add a fast call path of crash_kexec() as other Arch(x86, arm64) do.
Patch 2: use __smp_processor_id() instead of smp_processor_id() to cleanup
	 the console prints.
Patch 3: Add VM layout, va bits, ram base to vmcoreinfo, which can simplify
	 the development of crash tool as ARM64 already did
	 (arch/arm64/kernel/crash_core.c).
Patch 4: Add modules to virtual kernel memory layout dump.
Patch 5: Fixup to get correct kernel mode PC for vmcore

With these 5 patches(patch 3 is must), crash tool can work well to analyze
a vmcore. The patches for crash tool for RISCV64 is in the link:
https://lore.kernel.org/linux-riscv/20220717042929.370022-1-xianting.tian@linux.alibaba.com/

Xianting Tian (5):
  RISC-V: Fixup fast call of crash_kexec()
  RISC-V: use __smp_processor_id() instead of smp_processor_id()
  RISC-V: Add arch_crash_save_vmcoreinfo support
  riscv: Add modules to virtual kernel memory layout dump
  RISC-V: Fixup getting correct current pc

 arch/riscv/kernel/Makefile          |  1 +
 arch/riscv/kernel/crash_core.c      | 29 +++++++++++++++++++++++++++++
 arch/riscv/kernel/crash_save_regs.S |  2 +-
 arch/riscv/kernel/machine_kexec.c   |  2 +-
 arch/riscv/kernel/traps.c           |  4 ++++
 arch/riscv/mm/init.c                |  4 ++++
 6 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/kernel/crash_core.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
