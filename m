Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EB1CDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 14:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NCgCc2gjXby/8hOwcdYfNQrDzCB2b2+qoVcB7qIYvYU=; b=jn3sewyDkxsp0c
	oI+uohkFFUYgqlZEkGySU9+vRYQKyC4HRFxltunqWM2a0uqhQIaey0vXvJMljA3MOcxFrRGmAHSdc
	JECBkWMHAb/fUhqeLJaNYrMGxAzuAD5Wr0UhsxJkuPsuBKdtA1qpfDZjrCqfx5M+RAkvLE9d7no6q
	qj/+XAtp/G+uC+brHeghZom22Hl0ZT11KyyeKNYHqZVCfC02pVNIVbS5wOvZnQtgMLJC2bbqLWJTC
	YqPrXaC+E2DU1rE5eXTt5Px+W/ZbAjih+T/Oi6dfoA3xzkLyPQ43Ht+2CkE8sC1YhWAY3MwG14pFb
	U6PsVyAEh59aOvsN3alQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqx0k-001DUL-1N;
	Thu, 12 Oct 2023 14:50:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqx0g-001DTH-1W
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 14:50:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E22ABB82458;
	Thu, 12 Oct 2023 14:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDD7C433C8;
	Thu, 12 Oct 2023 14:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697122196;
	bh=WqvrIw3PkN3YYn1wVpzhO2s/Fo/gP7GkrtfWS3/rmZA=;
	h=From:To:Cc:Subject:Date:From;
	b=enA3mxvR1zssOjbMXwEkzY9UzGSeZWl8gFLi51c+AwxhAtznYQ+wxowCIkgqt5gCu
	 SerfeCocbYsySI2epiFJ4mrEWZN5FY9S6ql3+YOJlO2P+YnDesvFUL0aIiELNvIhPW
	 7/eh5/rZebfsGWqxsyNRvXSmvH8qPbT49rtiagODqPdOyuIaBxjt1f5jxLkbNsTXwv
	 gXuzIkLSbHF7y1SThaLtR95hjW7xTIPdcQovCr8Iqx8zEY0FvjZZx3AHNzukqY20JJ
	 xE/wAG61GALMnatOvFTjz+SvTEzRmJ+sABCXrE6y3VK97EWnpuM3eNNl0J6faSiyKl
	 F2i/sBbGz49eA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] riscv: errata: thead: use riscv_nonstd_cache_ops for CMO
Date: Thu, 12 Oct 2023 22:37:44 +0800
Message-Id: <20231012143746.454-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_074958_746936_6B99AD3B 
X-CRM114-Status: UNSURE (   9.89  )
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

since v3:
  - collect Reviewed-by tag

since v2:
  - collect Reviewed-by tag (but missed them in fact)
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
