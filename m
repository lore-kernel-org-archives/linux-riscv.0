Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4B6CA1017
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Sep 2025 19:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4oPAIQ7FsoqMO3n0HXHc8l0cv37kwi20+uAXGEG/85Q=; b=iVH/mMuz0S2Udd
	R9fpSsQOIsrP0+RbCO89aS8RrM06hY5G7vjtYbvjbBxoULSdoX44Z5aXyzSxI/vuf9+PaNGzYfRMc
	iuWlJEOGkNpMfM3MTTn0URIMHMc4zocvRfOv++3b2sMKYDUJxbsWXgV9haIewHsTY2+RMTcbuFuDo
	wsYO926vaBfyUZURf71AntTQwPkT5olwgXXHLmXm/gxO4QLH3QhB1ge7qJE2kVTl368DyMNN3Jh58
	pStPySBH9ENoE3xx1N9J8WkYO1UFP5cJcqBuqVi6+8S1oZ5dAccpihNnMhh64Dzc40e23GKRoDUWf
	HUFT+ckuI0Nl01LiA51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuyXr-00000008MNr-0sIT;
	Sat, 06 Sep 2025 19:25:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuyLK-00000008LKH-0NvM
	for linux-riscv@lists.infradead.org;
	Sat, 06 Sep 2025 19:12:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CA6F60373;
	Sat,  6 Sep 2025 19:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF72C4CEE7;
	Sat,  6 Sep 2025 19:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757185976;
	bh=QHY0+QhCJ0gde/ktx4tvJbgsXT6QCzobFLcyaTfoVhI=;
	h=Date:From:To:Cc:Subject:From;
	b=Ijb25Xr3nxmCzkM9SHloRJmes2F0WpNk+nFMs4keCuthT9bvUq0ck8ODZMQMiB0Gp
	 O2ZPVAccI4xifo71rjyV0SGo9y9UUOEV+Ev3EbxQo4+5+1mGLIpkfl3GBEGLRR/o4M
	 +ga2xcx9X8Zoiiq9P1CqPQEuaKZ2rPppFCSDeU3Na7eWTmlw1dVxGjDSZ3ssfUDfbO
	 iiGfCaPzZgRLdVHz2W5b4QZ1vl/F9R5Ke8vmdiQqbe3cxjBCVBM0bOgO54uPP2gz7Z
	 dWoXEnd1JntsOhkU9wZQy1JO82CP9bsg7NDqaCyd7ZKxQNCCYbaq4D/rt2cdNzR//5
	 CBWRnKYpzkPMg==
Date: Sat, 6 Sep 2025 12:12:55 -0700
From: Drew Fustini <fustini@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Subject: [GIT PULL] clk: thead: Updates for v6.18
Message-ID: <aLyHtxrU4mGFfnFs@x1>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: linux-kernel@vger.kernel.org, Michal Wilczynski <m.wilczynski@samsung.com>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-clk-for-v6.18

for you to fetch changes up to c567bc5fc68c4388c00e11fc65fd14fe86b52070:

  clk: thead: th1520-ap: set all AXI clocks to CLK_IS_CRITICAL (2025-08-18 14:58:23 -0700)

----------------------------------------------------------------
T-HEAD clock changes for v6.18

Updates for the T-HEAD TH1520 clock controller:

 - Describe gate clocks with clk_gate so that clock gates can be clock
   parents. This is similar to the mux clock refactor in 54edba916e29
   ("clk: thead: th1520-ap: Describe mux clocks with clk_mux").

 - Add support for enabling/disabling PLLs. Some PLLs are put into a
   disabled state by the bootloader, and clock driver now has the
   ability to enable them.

 - Set all AXI clocks to CLK_IS_CRITICAL. The AXI crossbar of TH1520 has
   no proper timeout handling, which means gating AXI clocks can easily
   lead to bus timeout and hang the system. All these clock gates are
   ungated by default on system reset.

 - Convert all current CLK_IGNORE_UNUSED usage to CLK_IS_CRITICAL to
   prevent unwanted clock gating.

 - Fix parent of padctrl0 clock, fix parent of DPU pixel clocks and
   support changing DPU pixel clock rate.

All changes have been tested in linux-next.

Signed-off-by: Drew Fustini <fustini@kernel.org>

----------------------------------------------------------------
Icenowy Zheng (5):
      clk: thead: th1520-ap: describe gate clocks with clk_gate
      clk: thead: th1520-ap: fix parent of padctrl0 clock
      clk: thead: add support for enabling/disabling PLLs
      clk: thead: support changing DPU pixel clock rate
      clk: thead: th1520-ap: set all AXI clocks to CLK_IS_CRITICAL

Michal Wilczynski (1):
      clk: thead: Correct parent for DPU pixel clocks

 drivers/clk/thead/clk-th1520-ap.c | 503 ++++++++++++++++++++++----------------
 1 file changed, 292 insertions(+), 211 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
