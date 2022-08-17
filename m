Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B22C25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 16:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=49iXZvMVPKxp0PsfoxuzTxbbf9IqnhDpE4vntpv6lT8=; b=SpxNdc3t4l2wgZ
	0BKZG7JG/C8Y9Yyc26xBGY+wD80m3iXeKa4McS06N3JcNVr6Zk9ADoogbG4IfHZMoTtex8cpqWghr
	lubwQCUNVnfCDRSGfAkr1n572H5optrdEynmPv5zx0/rSAUrcDLQuqL0sYVqBWB5/BGnAoUjmG036
	LWjDwTl1o81IKutVC4zMuKyaLVtq45/11PmvVMJ5mREcFreLhco4P4EU4QpkJtkgLKhObrYRLsloq
	dmFkUEr3ffB5qdZqgta6/1XtHGtaWASxO5pDN3U3417hGYBA2xGqF18M1/n2rVyFth3VvDcRHm1qP
	qp7g6jP1IAccHCl8Mc6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOLfZ-003gQV-Kc; Wed, 17 Aug 2022 16:13:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOLfW-003gO9-Aw
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 16:13:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D4C48B81E33;
	Wed, 17 Aug 2022 16:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B8AC433D6;
	Wed, 17 Aug 2022 16:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660752799;
	bh=kXQNLS4CwMPiKcaeiXiEF6+1NRLEt3k8IA9vim983Jk=;
	h=From:To:Cc:Subject:Date:From;
	b=JneOmSwu4MkndSGmEfBm3JLuf37aATz+WYX+zZsypRYYknRqAJ4SwUBJvm8MkDAZt
	 asHwG4f/EkA3SkrE6HqOooxFTzSZ7XBq+76dkp+GdcLGETSAqGRE9F14gk5IjU0qm1
	 C6MVy5Bw+GIaSlNoEbg+/INn01IpTXb4gWJcTOBweniK6YkExd1EHIAeqPJY3aw7Ju
	 wu38BHQawUkfJbpggxqxYzgMQzmlXQvChYrPyBqQiSGnzEcBrZJk2j6gg1xfeWiz5y
	 xldRSPkjfV16eSB2gWrLQqi+fHxVkPRv0Q6BH1yU3tdtPsugFqR3/BZuos3bK9I+2J
	 nHlJ4M7fGLOhA==
From: guoren@kernel.org
To: xianting.tian@linux.alibaba.com,
	palmer@dabbelt.com,
	heiko@sntech.de,
	guoren@kernel.org,
	conor.dooley@microchip.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liaochang1@huawei.com,
	mick@ics.forth.gr,
	jszhang@kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 0/2] riscv: kexec: Fixup crash_save percpu and machine_kexec_mask_interrupts
Date: Wed, 17 Aug 2022 12:12:56 -0400
Message-Id: <20220817161258.748836-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_091322_562359_C93C117F 
X-CRM114-Status: UNSURE (   6.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Current riscv kexec can't crash_save percpu states and disable
interrupts properly. The patch series fix them, make kexec work correct.

Changes in v2:
 - Add Fixes tags
 - Remove extern from bool smp_crash_stop_failed(void)

v1: https://lore.kernel.org/linux-riscv/20220816012701.561435-1-guoren@kernel.org/

Guo Ren (2):
  riscv: kexec: Disable all interrupts in kexec crash path
  riscv: kexec: Fixup crash_smp_send_stop with percpu crash_save_cpu

 arch/riscv/include/asm/smp.h      |  6 +++
 arch/riscv/kernel/machine_kexec.c | 44 +++++++++++----
 arch/riscv/kernel/smp.c           | 89 ++++++++++++++++++++++++++++++-
 3 files changed, 126 insertions(+), 13 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
