Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B97C83F34
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jul 2025 10:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P1jaYJrbBIAMb3k7Trw8dtcFh8hBZ25sooej/ZjUmPg=; b=u1yvwbATDUVMtS
	eP3OAX4oxgIAJ9Dj084P35eaA06OSGkDdsPLmPyDh8bqHPTb0kgUL3VXlSPGaGQjtXGJvAtYxwEAn
	bgB0M+mxo2tQiLVi5jr9hNINbDFbT3k5iMj2VfLP36Wmm37MG2oWFAvfaHRRy3o+uaomal0Iqqvuh
	LrlRQoYe94mB8f9/b9Pgd8Uom/e7iz+R9t0/VInpiGklJohbfwPhOScJOIeHwP0pRRsZTBbQRMBHE
	kFSe0qYu7vFP5N/8nfJIJYmOoNMbKCWm3fmxMgSOrNPmgc/06/L6O4CWJVPxilMmAoQepbYstruQl
	QMt/lCJlDZg274g9LWlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud4tT-0000000E8u9-42db;
	Sat, 19 Jul 2025 10:34:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud4tR-0000000E8to-36RW
	for linux-riscv@lists.infradead.org;
	Sat, 19 Jul 2025 10:34:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A15E65C41C8;
	Sat, 19 Jul 2025 10:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375DFC4CEE3;
	Sat, 19 Jul 2025 10:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752921252;
	bh=UxCO5WPTUXNu3CRP7Qky80cDRDWVGcte2oC0s342bx8=;
	h=Date:From:To:Cc:Subject:From;
	b=LW2XSfk2ypjEbdHplGvhJ+qFSlOBP+EyDPeHIyb9OXAwXWBLE3TjWz3htKKcbXjqL
	 7PsLfFsWUd7EtNMQvLE8kebe2MMlcIuInI5UA6SyuOelr1Kn7MnTRlaq/aXTAoa4X4
	 SUrG7Rw3Z4fX1QduaRx3JN94B3jxBwiOaSXVEBiHuURR6MN3Egn62yraXDZB0VwkAN
	 PK2KqKt3G9j4OIrmUHXCiP3YQoz+KPPrVt3KgRuK2F2XzCSFTM/RMo5aryOdHCz3ON
	 mXZs22XGNc3o6qosbeHlWGiy/bZETfh8WyuZR3FBgx+vHBr9ysXmzqmTN0YG0pHnez
	 nXIEwqx+UOR2g==
Date: Sat, 19 Jul 2025 03:34:10 -0700
From: Drew Fustini <fustini@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Yao Zi <ziyao@disroot.org>
Subject: [GIT PULL] clk: thead: Updates for v6.17
Message-ID: <aHt0ojYyO1OEZTmG@x1>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_033413_820207_43A2DBDF 
X-CRM114-Status: UNSURE (   6.23  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-clk-for-v6.17

for you to fetch changes up to d274c77ffa202b70ad01d579f33b73b4de123375:

  clk: thead: th1520-ap: Correctly refer the parent of osc_12m (2025-07-13 12:46:58 -0700)

----------------------------------------------------------------
T-HEAD clock changes for v6.17

Updates for the T-HEAD TH1520 clock controller:

 - Fix the parent data for osc_12m by referencing osc_24m by index.
 - Mark essential bus clocks as CLK_IGNORE_UNUSED to fix boot hang
   associated with the PVT sensor.

All changes have tested in linux-next.

Signed-off-by: Drew Fustini <fustini@kernel.org>

----------------------------------------------------------------
Michal Wilczynski (1):
      clk: thead: Mark essential bus clocks as CLK_IGNORE_UNUSED

Yao Zi (1):
      clk: thead: th1520-ap: Correctly refer the parent of osc_12m

 drivers/clk/thead/clk-th1520-ap.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
