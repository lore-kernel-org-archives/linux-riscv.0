Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9AACAC5BB
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 18:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FzAK2nMuALkeujVXmU4rSTkhMsuuRgZjKgQtlINHSQA=; b=YyfS4fp0rBQgMG
	63vqWa5pZwXAViqavEzyKsacZ0xDMk9VD51B7INuOAZ9eBLFKVLXUbaASPGGD02ayWN1ynrFEFJHA
	PjJXGbd+QsiNNFA6Bc15mYV+27Qi0a/0IOHt7kv/KAOrdBXtSp07Rb7zsBmOWAGj0c7SD3sC9JG+o
	53ZW3Xd/7oIbLV2zlquFL8JAZ0yP70Z5FLJl6SXBp/nxFCX1WKCTT6CtbHqxGiPMNNs+NtgMfy+YP
	7f7BsfRSMtBxKeyojRwjRj6rq0+zwZoso29UKyDfA1NTaQXxC9EKnyJ8kG7LpZT6GQnTHo2qSfGgz
	MR2oTKcnAMCnlLfoGCKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2DFp-00000003d4d-1Uzg;
	Fri, 26 Sep 2025 18:33:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2DFo-00000003d3k-07a1
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 18:33:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 76B0F61F2A;
	Fri, 26 Sep 2025 18:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DFEC4CEF4;
	Fri, 26 Sep 2025 18:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758911591;
	bh=1FEo+qjc2uVPZtPViZiq0sC5eXwLvDKqGoow+RAmhek=;
	h=Date:From:To:cc:Subject:From;
	b=FJIdnbNtGWpNcMaPMrA5nKAjR4qQNuEbY6hfgfzXPnBJxHz8/omC8jhIXzZgmvbou
	 fQrrqiDzxG37jvslR9rDdBGPnKDGs1jp2j+kbHsy+hmC9CLJ5g+uFo6vRSoU89fYCl
	 7EDdW46P55Zo3WvfuP4pR8Vf6P4b34Oli2XfFpaHw04vKqIxYeknvscjoEEI6etu8L
	 mhVEGqdU6fKpWhPqDFOfFOMpshCfCYMhjWdJNjKN0ng0INAGcvYl0rlOSZIgVS5ao3
	 QxjYViXvt5d2ECP+Brbxz7xR8shR0cZK81/+OY9pBZINmhBYxx+8qY9m1p2DGHKo64
	 EuYLXcT0vSqcg==
Date: Fri, 26 Sep 2025 12:33:10 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v6.17-rc8
Message-ID: <c6ef1683-9c29-cb02-4498-31fce8934d9e@kernel.org>
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

Linus,

The following changes since commit a03ee11b8f850bd008226c6d392da24163dfb56e:

  riscv: Fix sparse warning about different address spaces (2025-09-05 15:33:52 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-v6.17-rc8

for you to fetch changes up to e24108012ce9662d90093f91d5ffebcbf78da7de:

  MAINTAINERS: Update Paul Walmsley's E-mail address (2025-09-23 20:18:45 -0600)

----------------------------------------------------------------
RISC-V fixes for v6.17-rc8

Two small RISC-V fixes for v6.17-rc8:

- A race-free implementation of pudp_huge_get_and_clear() (based on the x86
  code)

- A MAINTAINERS update to my E-mail address

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Use an atomic xchg in pudp_huge_get_and_clear()

Paul Walmsley (1):
      MAINTAINERS: Update Paul Walmsley's E-mail address

 MAINTAINERS                      |  8 ++++----
 arch/riscv/include/asm/pgtable.h | 17 +++++++++++++++++
 2 files changed, 21 insertions(+), 4 deletions(-)

    text	   data	    bss	     dec	    hex	filename
12772113	6174050	 419253	19365416	1277e28	vmlinux.rv64.orig
12772113	6174050	 419253	19365416	1277e28	vmlinux.rv64
11725507	5994478	 404229	18124214	1148db6	vmlinux.rv64_nosmp.orig
11725507	5994478	 404229	18124214	1148db6	vmlinux.rv64_nosmp
11723502	4702754	 309629	16735885	 ff5e8d	vmlinux.rv32.orig
11723502	4702754	 309629	16735885	 ff5e8d	vmlinux.rv32
 2612497	 761072	 119048	 3492617	 354b09	vmlinux.nommu_virt.orig
 2612497	 761072	 119048	 3492617	 354b09	vmlinux.nommu_virt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
