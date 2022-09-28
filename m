Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FA9C32771
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Sep 2022 16:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TINJXrRIWEfSyY2Dx+UqJNX9JrhwLYcZojANLbERV/w=; b=xYk1V4PTOOGihS
	E6NKOoAYR3iIs1Df8uiNBwn1e/+AdZy7cafBpWbrxoHM3m7rAxIoGNj9t82rGqxiS+V66HIt0eH4b
	ZpaBI8Nxs9a9jTKs5eEBDiPD4M44zr0P52YPha/p4x9ZxwaktwVyWiCuhc3+PFIy9UbeWKWh4yckb
	rd/ZmzC2nATTuVzscrLWJuGIPK04ZkPURBFT/ZLoQKCVVFme7tEV33KH2YEL3FksKgxwVFb/myTcQ
	c467UeOpWxNFrdS4EWCN3nXCWPrBYucowcJMpSr/t2n3NK1gtfoHKGHfXM/fLv+8WPOjT0EegWdVJ
	oiVdO28suPt7h9Funb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZwK-00H7gW-HU; Wed, 28 Sep 2022 16:29:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZwH-00H7fx-Q7
	for linux-riscv@lists.infradead.org; Wed, 28 Sep 2022 16:29:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9E1D961E82;
	Wed, 28 Sep 2022 16:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E79C433D6;
	Wed, 28 Sep 2022 16:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664382576;
	bh=tpBUC9hhQD7B15KOfDZ4rr1SiSXoskPPTUl47ZCo5oQ=;
	h=From:To:Cc:Subject:Date:From;
	b=YKLHSpjDBxMn1yfsb6+ScMCaS0LAJ9dXL7WH3Zuw5FjBjJ5Ws79gFGu0767j0B4ks
	 9G5r6U1rVBA3X9cuUInPSPXATzbOLbhdQixCbyk9L/1QR5uDc8dmTOjBJAxFJVeorQ
	 6vhZGQzho9mCJkajRqTy8gGtNz1lPIsJ+SII3t98TJ+pT3Aa1C2bFST7frXEMRC9Er
	 /qlOg9AxTSjev3BHq1aVBXMc+JNB4Kp4PtoXbvmCVwyGS0ZUG6bFz89r1h3n8aEihh
	 Lwe0qipt6ZSen/TJ1w+QQa9+UvemHCXb1ekf/V/uF7gk2kI4NNlbFQOpR1wfR0HRGk
	 lsUT80DL0V5Aw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 0/4] riscv: entry: further clean up and VMAP_STACK fix
Date: Thu, 29 Sep 2022 00:20:03 +0800
Message-Id: <20220928162007.3791-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_092937_923548_B8D5F40D 
X-CRM114-Status: GOOD (  12.17  )
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

I planed to do similar generic entry transaction as Guo Ren did[1], and
I had some commits in local. Since Guo has sent out the series, I
dropped my version and just provide those in my local repo but missing
in Guo's series. However, this doesn't mean this series depends on
Guo's series, in fact except the first one, the remaining three patches
are independent on generic entry.

[1]https://lore.kernel.org/linux-riscv/20220918155246.1203293-1-guoren@kernel.org/T/#t

Since v1:
  - consolidate gp saving/restoring in mcount-dyn.S as well
  - avoid non-trival memory waste if NR_CPUs is large
  - collect Reviewed-by tag.

Hi Guo,

I only added your reviewed-by tag to patch1, but dropped tag for patch3
and patch4 because the patch changed a bit.

Thanks

Jisheng Zhang (4):
  riscv: remove extra level wrappers of trace_hardirqs_{on,off}
  riscv: consolidate ret_from_kernel_thread into ret_from_fork
  riscv: fix race when vmap stack overflow and remove shadow_stack
  riscv: entry: consolidate general regs saving into save_gp

 arch/riscv/include/asm/asm-prototypes.h |   1 -
 arch/riscv/include/asm/asm.h            |  65 ++++++++++
 arch/riscv/include/asm/thread_info.h    |   4 +-
 arch/riscv/kernel/Makefile              |   2 -
 arch/riscv/kernel/asm-offsets.c         |   1 +
 arch/riscv/kernel/entry.S               | 154 +++---------------------
 arch/riscv/kernel/mcount-dyn.S          |  58 +--------
 arch/riscv/kernel/process.c             |   5 +-
 arch/riscv/kernel/trace_irq.c           |  27 -----
 arch/riscv/kernel/trace_irq.h           |  11 --
 arch/riscv/kernel/traps.c               |  31 +++--
 11 files changed, 104 insertions(+), 255 deletions(-)
 delete mode 100644 arch/riscv/kernel/trace_irq.c
 delete mode 100644 arch/riscv/kernel/trace_irq.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
