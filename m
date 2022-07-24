Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA15C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Jul 2022 15:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m8KYzQSqe9151jzKb37T58Cw79PfuYPuPESU45M5Kzg=; b=dJmpiJsN6YO8dw
	NHcWbTYusG4HvdRQB2gYtuG9pQxzihsHhJTg51CvSH5V6ssK368SQZgNFrgQgCzRtzbN+nPNDUNOt
	OjXdbSGrh7PMNjq3BYrNoZI4lJAnIxC/HuzSf29NNKnsifX/C/iz/k82f8Pyb3Jzv9or404hfBIOC
	QWyNJfqHE3QhDy7dVKk36EFy86CKwlsMA/X/roEvTPcSpVfdU7eseGNrQQNoJezHLykXXEH4wLPEZ
	08tvaWRYPFlSHt8IyCoigZvo6N6GhgK+ObqaIWauxBDlMUBhj9LFCDWeveDl8uoU7ImACaaJ3yBUn
	Xe9guWIy8qEl5AS31eKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFdRw-006sSe-Dp; Sun, 24 Jul 2022 15:23:20 +0000
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFdRr-006sPz-Fo
	for linux-riscv@lists.infradead.org; Sun, 24 Jul 2022 15:23:18 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0VKDkjNB_1658676187;
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VKDkjNB_1658676187)
          by smtp.aliyun-inc.com;
          Sun, 24 Jul 2022 23:23:08 +0800
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
Subject: [PATCH V2 0/5] Fixups to work with crash tool
Date: Sun, 24 Jul 2022 23:23:00 +0800
Message-Id: <20220724152305.1037212-1-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_082315_742318_CD4B117E 
X-CRM114-Status: GOOD (  10.27  )
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

I ever sent the patch 1 in the link:
https://patchwork.kernel.org/project/linux-riscv/patch/20220708073150.352830-3-xianting.tian@linux.alibaba.com/
And patch 2,3 in the link:
https://patchwork.kernel.org/project/linux-riscv/patch/20220714113300.367854-2-xianting.tian@linux.alibaba.com/
https://patchwork.kernel.org/project/linux-riscv/patch/20220714113300.367854-3-xianting.tian@linux.alibaba.com/

This patch series just put these patches together, and with two new patch 4, 5.
these five patches are the fixups for machine_kexec, kernel mode PC for vmcore
and improvements for vmcoreinfo and memory layout dump.

The main changes in the five patchs as below,
Patch 1: use __smp_processor_id() instead of smp_processor_id() to cleanup
	 the console prints.
Patch 2: Add VM layout, va bits, ram base to vmcoreinfo, which can simplify
	 the development of crash tool as ARM64 already did
	 (arch/arm64/kernel/crash_core.c).
Patch 3: Add modules to virtual kernel memory layout dump.
Patch 4: Fixup to get correct kernel mode PC for vmcore.
Patch 5: Updates vmcoreinfo.rst.

With these 5 patches(patch 2 is must), crash tool can work well to analyze
a vmcore. The patches for crash tool for RISCV64 is in the link:
https://lore.kernel.org/linux-riscv/20220718025346.411758-1-xianting.tian@linux.alibaba.com/

Changes v1 -> v2:
 1, remove the patch "Add a fast call path of crash_kexec()" from this series
 of patches, as it already applied to riscv git.
 https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=for-next&id=3f1901110a89b0e2e13adb2ac8d1a7102879ea98
 2, add 'Reviewed-by' based on the comments of v1.  

Xianting Tian (5):
  RISC-V: use __smp_processor_id() instead of smp_processor_id()
  RISC-V: Add arch_crash_save_vmcoreinfo support
  riscv: Add modules to virtual kernel memory layout dump
  RISC-V: Fixup getting correct current pc
  riscv64: crash_core: Export kernel vm layout, phys_ram_base

 .../admin-guide/kdump/vmcoreinfo.rst          | 31 +++++++++++++++++++
 arch/riscv/kernel/Makefile                    |  1 +
 arch/riscv/kernel/crash_core.c                | 29 +++++++++++++++++
 arch/riscv/kernel/crash_save_regs.S           |  2 +-
 arch/riscv/kernel/machine_kexec.c             |  2 +-
 arch/riscv/mm/init.c                          |  4 +++
 6 files changed, 67 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/kernel/crash_core.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
