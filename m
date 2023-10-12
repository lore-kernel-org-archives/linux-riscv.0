Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7309CCDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 14:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g+mNiWI56Iv0rwRL5W+1QiN6QyYkudkGu6ezNkIAMM0=; b=n6yXwrigASEsWk
	YeEfKDNMjgUifZ+bVcds2MhUMpGJE/0i0R58pvv0aI6n2gHg49z4t+L7vwSBUWTuk9WFvOp7cI4yB
	2Fb87IWqSlkOtVkS7g7HO9d0jHhuO6jsScHB/HrhVvEzcGuB/N9Xzt6ayCJtgupwIziBH+/YwXcx2
	+ZmSf1mJzyjaI68rPxGxjqLofRs9ni0X9stcBXaC/ORV0H9jJ509nLsuqS7OxBQ8XgD1A9+8wQ1uo
	Uj6BvluoOw3OiZPDam/GhITFB/8nix27oNEKP8skz5EJJStd+YiSrnlooXZLMWz39OD/7EKxiUV3v
	r6vF5gly6DV4FvdkXADA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqwen-001BA3-3C;
	Thu, 12 Oct 2023 14:27:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqwek-001B8j-2h
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 14:27:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D6A0DCE290F;
	Thu, 12 Oct 2023 14:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80AA1C433C7;
	Thu, 12 Oct 2023 14:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697120836;
	bh=FHPuVYx77onrE1BKDhkCrW4jZHv+uXzoeFVCq11iTOg=;
	h=From:To:Cc:Subject:Date:From;
	b=aYm5uNnSVfHV/ccqtOGe+9g1qSe83cQKd7D0+PJGwoe4v8O4Bo7daTpi2JeIT/a9S
	 NK9Mdu+ihT6zPnEuOct2hMPx2lmp9FbNLLcAhtu0lTX4l2AbfNtc/tgrU/+MT2YFby
	 v93vr4xpdUPQiKCgvS31J7njcy/4H5AzRtz/o2hL7o+O9/iMnOEOBEXn7r8WFqs7vv
	 Tx2PeRlHhx0LC+otsXW8t/pUu4s/Bb3k7r7LkbMf74uiKKGvFnf23izG8LG4/h4uR7
	 awXnLaQdWgR9CSHKGfMaJVtCwV8PfSVNvFJJx6+JqTZZpWIx+MZYDMWmKdutvpASED
	 slbReTrzJJFeQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] riscv: errata: thead: use riscv_nonstd_cache_ops for CMO
Date: Thu, 12 Oct 2023 22:14:54 +0800
Message-Id: <20231012141456.4078-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_072719_076681_77C80FD0 
X-CRM114-Status: UNSURE (   9.92  )
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

since v2:
  - collect Reviewed-by tag
  - fix typo

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
