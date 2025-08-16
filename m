Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C86CA0EE6
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 09:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=33Pc/376U6gxZTZ0BvsmclGI2DMKGiba6yF4HO+SE8k=; b=MbRp28TtH2M3RB
	vHii3EYgILxSF0sOZG95I8wbNIeUAFtia0jjFLSl1O/4cOvoAuQdtHwdqIdPuTGeNdA+J7YL6PE//
	A3MfHfzDJH0zpKVwO2oFKbU8ZdKIBWf33yl9777I7fq+EDVoWUMB2sCRH8tr4UUOIOIjnCttcMn3j
	PA2RxEJf31WDbwygOg8YWt3IT9eebWTj/sUBPHrdiAoVApKsWvLue7P94s+Je5eXFHUaoatzP837g
	PJ68ihVPPmQOv1I/cdXMljRFOZGZpo1NBCewHB+nraWowx8i4kbgddehATzx8AatA9dhL2/PwCQR5
	jxT0lQoGSyn7JVVKwVsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCxN-00000004N1O-3Mos;
	Sat, 16 Aug 2025 09:12:09 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCwr-00000004MyW-01Xt
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 09:11:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755335492; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SHB+yKqKj3znfyW4qsXKvi0RIZ0ujnDNddLFa1dG4IW4VOlFrJ4EJ8VfzHt5qNshxpRcUDZjPVRKNu41FM5Y5YcSPc+RdO2xpZg6AhZmpcbQFBmkAYMoPUqrVzaJ4/uM15pVYydJC4l1XZVo/VpuogASWlo0cx/e3740bpT3w7w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755335492; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RK3+SKipm275XQslhB+Q0sSWLYBre0x6UlqY2Qv7VME=; 
	b=DGryvI/nUIK9vrh4yL8cn/wdPC+iS+Mf5sEEpn3c51k4igovGpKFqwK+PVflRT3WYY382/vnzjPgCaaOsJzQiVzUuGIwbc3FzqNaCUj079P61qJaXngsq5LN6+mAAmXUQVFPo7OJx9QA8CjMZYIHT3ynr+zCNrcr34n0cfa8xLA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755335491;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=RK3+SKipm275XQslhB+Q0sSWLYBre0x6UlqY2Qv7VME=;
	b=NjlEWXzxLZW2tVHMo5m4ZURN/7Lhb9UudEj7Caup9Ex90Wks41iQka0dpUbfKC2q
	PZq0syHnMn7KfjeAgVVFTJVtdYYJJdiLJ1Xh79WoNTy5AO9e1QlPpAcN/ULtENP4aSM
	MyU363etz1HftOqhm6UXgm+Fqt/3CK5jygyK0yheR0ItyqdkzbyMhbOby42YULtPyvu
	c3Nc5EktLKtuQyOuDf3yyVp1qrCzFuX2rvuH423Wte8iIR9ABa16lYGXtx2Q4Zh7+h1
	ZWTx8pRwqvvyKK4NGNWl5iIpmaZQyqlcwuJF+vdM9CyEKjoS46y4mlabUEQ+PVoAn9C
	ZITq5wAbCA==
Received: by mx.zohomail.com with SMTPS id 1755335489822449.85694866578626;
	Sat, 16 Aug 2025 02:11:29 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v3 0/4] clk: thead: Changes to TH1520 clock driver for disp
Date: Sat, 16 Aug 2025 17:11:09 +0800
Message-ID: <20250816091113.2596048-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_021137_106885_41FB2828 
X-CRM114-Status: UNSURE (   7.33  )
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

This patchset is my changes to the TH1520 clock driver, mainly for
supporting the display controller.

The first patch is previously a dependency of this patchset before v3,
but a rebase operation in v3 changed it and it's now pulled into this
patchset.

The 2nd and 3rd ones are functionality additions, with the first one
adding support for enabling/disabling PLLs (for DPU PLL) and the second
one adding support for changing DPU dividers.

The 4th one is to address hang issues met when testing the DPU driver
w/o clk_ignore_unused command line option.

The patchset is rebased atop the padctrl0 parent fix patchset (which
contains refactor of ccu_gate) at [1] in v3.

[1] https://lore.kernel.org/linux-riscv/20250816084445.2582692-1-uwu@icenowy.me/

Icenowy Zheng (3):
  clk: thead: add support for enabling/disabling PLLs
  clk: thead: support changing DPU pixel clock rate
  clk: thead: th1520-ap: set all AXI clocks to CLK_IS_CRITICAL

Michal Wilczynski (1):
  clk: thead: Correct parent for DPU pixel clocks

 drivers/clk/thead/clk-th1520-ap.c | 153 +++++++++++++++++++++++-------
 1 file changed, 121 insertions(+), 32 deletions(-)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
