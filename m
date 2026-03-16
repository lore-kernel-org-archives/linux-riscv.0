Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B32FF53D65
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 15:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8r4Yy0My2kBHBXVzbBpbjdMv/GI5eJkYBqc9ZA6+FuA=; b=xZNfTP1nrOpEIN
	SLVZRoGNtZcxvnXQxw5ZMhqyde3koqQi87Prswu93sYN1NPzZ75BxLY74n3I/TkDNw6N1embA/tjW
	t2QmR4lg1/HAKRKIh7qaaxMmMuGOB+EkgHnGhAjxexvBNCsyb6ffjJMNIn2VpXGHTj9iTCRDIjjLk
	ODZc9GTHjMJO7P0z9NAAWe87sKmjP33wItZwVGD9jVutb+xRFT7n+ICXu3hWO4HxGlu0VBfU0SolG
	JhpX39eQzmNE7f7jwlgfWy3IkYgNAAfKdpXDWEjxjzlYDrqZzzhb6bw7MVZm92C7LUodlcgTtRZ5h
	H6Q2mQRLm7Po4o5dSYJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29pj-00000004KmO-3EcL;
	Mon, 16 Mar 2026 15:26:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29ph-00000004Kly-3INv
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 15:26:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 999044086A;
	Mon, 16 Mar 2026 15:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56604C19421;
	Mon, 16 Mar 2026 15:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773674776;
	bh=f5yrzvJyKqNO0mx1A368jXTrlKXyBPupbgbIJWVdVDg=;
	h=Date:From:To:Cc:Subject:From;
	b=ovhzMWqk806ZgRSfbKVBcxktTp+WFCFPfQii4kiAXjB/7c60iC/cGW0GHW1LveMa0
	 w/GQbssWk9KmNuPvTBzHBcTD5l8BjYuvvusZgzfGltD1S1YLexZmxaFLWHSJknBZOb
	 qNcxmTgvrz/dsom3WZx91hP+Qcgdf47U7v+rm5W6ieJU0kj/+TjI/qiCdFP9PVoZ91
	 sIpBJT8ODkhe6zDwzJd1eKnmkGMDp6rdFGMrI2248Zckv6qoDbNcXanZFY8Gy6rPX6
	 Oakf0AgRspS14udOdoJv28RnnQOX3DrM/YXIw5YSg/O4eMMR0NHRV0kHi7iEw8PCz9
	 xcSh00OQLnp/g==
Date: Mon, 16 Mar 2026 08:26:14 -0700
From: Drew Fustini <fustini@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] clk: tenstorrent: Add Atlantis PRCM for v7.1
Message-ID: <abghFg5INVslFFcc@x1>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_082617_900104_56966796 
X-CRM114-Status: GOOD (  12.90  )
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

Hi Stephen,

This pull request introduces support for the Tenstorrent Atlantis RISC-V
SoC in the form of a clk driver, reset driver and the associated DT
binding. The reset driver was reviewed by Philipp, who agreed that it
could go via the clk tree. Brian reviewed the clk driver but there is no
review/ack from you. Please let me know if you'd like to see any changes
and we will post a new revision.

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git tags/tenstorrent-clk-for-v7.1

for you to fetch changes up to 23c8ebc952849b3ba47d04d0ec95daf5cc136061:

  clk: tenstorrent: Add Atlantis clock controller driver (2026-03-09 20:10:26 -0700)

----------------------------------------------------------------
clk: tenstorrent: Add support for Atlantis PRCM

Introduce support for the clock and reset controllers (e.g. PRCM) in the
Tenstorrent Atlantis SoC. 5 types of clocks are generated by the PRCM:
PLLs, shared gates and standard muxes. The reset controller is setup as
an auxiliary device of the clock controller.

Signed-off-by: Drew Fustini <fustini@kernel.org>

----------------------------------------------------------------
Anirudh Srinivasan (3):
      dt-bindings: clk: tenstorrent: Add tenstorrent,atlantis-prcm-rcpu
      reset: tenstorrent: Add reset controller for Atlantis
      clk: tenstorrent: Add Atlantis clock controller driver

 .../clock/tenstorrent,atlantis-prcm-rcpu.yaml      |  54 ++
 MAINTAINERS                                        |   4 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/tenstorrent/Kconfig                    |  14 +
 drivers/clk/tenstorrent/Makefile                   |   3 +
 drivers/clk/tenstorrent/atlantis-prcm.c            | 870 +++++++++++++++++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c         | 173 ++++
 .../clock/tenstorrent,atlantis-prcm-rcpu.h         | 103 +++
 11 files changed, 1235 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
 create mode 100644 drivers/clk/tenstorrent/Kconfig
 create mode 100644 drivers/clk/tenstorrent/Makefile
 create mode 100644 drivers/clk/tenstorrent/atlantis-prcm.c
 create mode 100644 drivers/reset/reset-tenstorrent-atlantis.c
 create mode 100644 include/dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
