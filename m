Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4CCE748ED
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Oct 2023 10:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HDZsILn3R5k+whMTyu0ctCJcRXaOqDa5jLp2yFjbwu4=; b=wmBL/iAaB9zusO
	mTZ3urmq7qJuTTab1PbjFoccS+kMnHE+Nxf/Eg515n8375LlPpfdrYs4At3aI6on5pVzcaQo+CcNv
	W3PFfFVlU9MSHQwZ5skqK8o9Px299Jxc4yxEj5PlgX8jIzDydzJUOhUKS05jZcnWLFERzT83+tDvn
	+QRVT4c58tDs92tDiU3G0Rt3W1GA0CihjjJrUgbCggJt+YlC+UiuLw6JHSFGqvO4o/16eBG9CXivg
	T8z2SRvHGhn2PrydwaKh04kgmMF6LbknJ7AVswonqp1nzrQxVbBUDpr12o7hKygwoJMefCGyYgCXB
	8NaarNFxlRu8k5id6h7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmtyF-00Ay3O-2q;
	Sun, 01 Oct 2023 10:46:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmtyC-00Ay2l-1M
	for linux-riscv@lists.infradead.org;
	Sun, 01 Oct 2023 10:46:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8B996CE0ADB;
	Sun,  1 Oct 2023 10:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDBFC433C8;
	Sun,  1 Oct 2023 10:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696157197;
	bh=Qc8baE61nIrx4p5gOOJ9fZRmaPcr5o9GjWZTqePwzB0=;
	h=From:To:Cc:Subject:Date:From;
	b=Ayp3oWp1d5Au2ddMvfCneg0I6IIFxFLxy+JL8OJuz5IfbY5NZ5xvxgw0/fMjYrQso
	 6MKCegM44n+W0L1Qdchy7QUMaxh+lPHklXt/DurQoQ8pvm5sHQ/fppnSzZBdDXs08A
	 DsL/TmlW3Jh33NuN/NOQRjhvJl8IchvFVqEf8J3CraMbh2SspqpoRqoaCNWGEYqJV+
	 toDnZYpoE1MZjrbYSnXwNusvQbQfD42zT7x3vswJdKXP5Ws65HlY24aEjAPkxsVeLh
	 RGgv9De+PksXIcHu4S41HGlvPv77ycILX0oTLE8rbgcXZD3pQ3RDFIHUVx55zommax
	 b7cUED9R6Iyvw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] riscv: errata: thead: use riscv_nonstd_cache_ops for CMO
Date: Sun,  1 Oct 2023 18:34:31 +0800
Message-Id: <20231001103433.3187-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231001_034640_656347_4B6D53DD 
X-CRM114-Status: GOOD (  10.01  )
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

Previously, we use alternative mechanism to dynamically patch
the CMO operations for THEAD C906/C910 during boot for performance
reason. But as pointed out by Arnd, "there is already a significant
cost in accessing the invalidated cache lines afterwards, which is
likely going to be much higher than the cost of an indirect branch".
And indeed, there's no performance difference with GMAC and EMMC per
my test on Sipeed Lichee Pi 4A board.

Use riscv_nonstd_cache_ops for THEAD C906/C910 CMO to simplify
the alternative code, and to acchieve Arnd's goal -- "I think
moving the THEAD ops at the same level as all nonstandard operations
makes sense, but I'd still leave CMO as an explicit fast path that
avoids the indirect branch. This seems like the right thing to do both
for readability and for platforms on which the indirect branch has a
noticeable overhead."

To make bisect easy, I use two patches here: patch1 does the conversion
which just mimics current CMO behavior via. riscv_nonstd_cache_ops, I
assume no functionalities changes. patch2 uses T-HEAD PA based CMO
instructions so that we don't need to covert PA to VA.

Hi Guo,

I didn't use wback_inv for wback as you suggested during v1 reviewing,
this can be left as future optimizations.

Thanks

since v1:
  - collect Tested-by tag
  - add patch2 to use T-HEAD PA based CMO instructions.

Jisheng Zhang (2):
  riscv: errata: thead: use riscv_nonstd_cache_ops for CMO
  riscv: errata: thead: use pa based instructions for CMO

 arch/riscv/Kconfig.errata            |  1 +
 arch/riscv/errata/thead/errata.c     | 69 +++++++++++++++++++++++++++-
 arch/riscv/include/asm/errata_list.h | 50 +++-----------------
 3 files changed, 74 insertions(+), 46 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
