Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DA6C83F26
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 20:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=loaKQiRXbdP8DQXgP8U4vUnxo06mPCvlWzF3mhOGuvs=; b=Sf+HLgK32CzAwK
	pIVfQYpVjtSllpQRRtWOdsSQI6JauYRuygNy8PIprHuhCEkyCYoasmx3dIuWtBPP3KIEIhPJfLDiR
	zkzRb17MP5LLMFMApJNQgD4jqI9VddRwRQ7OauB1ACLojLrfPAPx+kefNEfgBN0WYWhICNaLIA1h7
	iX8OvyoHKczOdWGVCkPkTPAC+Qb5KLD7uTKXkZSpyMpkWEjO9n5heYj6OY1CbFYIHpLzcPL0wsons
	++iKEiaLTLQgytIMyY9IDyveiT+822xvgdKu7cQuFAE+L7STCdDuwyEstcXjkoK1MRxVYd6rE7Qmy
	ej1Kj5W7pluO2r4yH9Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2rc-00000008QUX-206v;
	Thu, 24 Jul 2025 20:48:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2ra-00000008QUD-0Spf
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 20:48:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F7C344C0C;
	Thu, 24 Jul 2025 20:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A826C4CEF4;
	Thu, 24 Jul 2025 20:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753390105;
	bh=u9xpcw4a/you+H+16oHVm0t5GKpLjwCxq499Db9OVZ0=;
	h=Date:From:To:Cc:Subject:From;
	b=YIgzGMvfEc+lkJ8wrYWgj602zUqjOv6Z2PyOOr7zj6nijfTkbZF8AwVpxaYPraXEl
	 U6oHIMWujPUSsMyRvplQfdalvqHNAX0NSYKQAcBlmsNYXing7cwyt12AFQo4E4h74p
	 psd5zlOYDi1TM7gXRWb8jVyCZd+d/s1C61Palh2+EzTqYnrJChUOfJJhshK2utetgQ
	 18d4BbXaw/I0pcjPOgc5DA92E5WcsyKKs5rNXQde6cdLk+ZRfwpOqEfHvM34LGx6rB
	 0fivqvnZsKoApGCqHsQUizC6k/vK59cIW73An1GFVkJPoLUCIESFgwg6KJDlasiLf0
	 9ev5DGMy3o7GQ==
Date: Thu, 24 Jul 2025 13:48:23 -0700
From: Drew Fustini <fustini@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Subject: [GIT PULL] clk: thead: Updates for v6.17, part 2
Message-ID: <aIKcFzsCvvz0PCBW@x1>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_134826_170280_C6C70D30 
X-CRM114-Status: UNSURE (   9.25  )
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

Hi Stephen,

I'm sending this followup PR in case there is still time to include it
for your 6.17 PR. Yao Zi refactored mux clk registration which fixes an
orphan mux clk issue which would occur when booting with mainline uboot.

Thanks,
Drew

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-clk-for-v6.17-p2

for you to fetch changes up to 54edba916e2913b0893b0f6404b73155d48374ea:

  clk: thead: th1520-ap: Describe mux clocks with clk_mux (2025-07-22 15:40:54 -0700)

----------------------------------------------------------------
T-HEAD clock changes for v6.17, part 2

One more improvement for the T-HEAD TH1520 clock controller this cycle:

Yao Zi has fixed an issue where the c910 mux clk could end up as an
orphan in CCF when the bootloader reparents it to the c910-i0 mux clk.
The solution is to refactor the handling of mux clocks by embedding a
clk_mux structure directly in ccu_mux. This allows the mux clocks to be
registered with devm_clk_hw_register() without allocating any new clk_hw
pointer which solves the orphan issue.

This change has been tested in linux-next. The LPi4a still boots okay
without clk_ignore_unused and peripherals like serial, emmc and ethernet
are functional. The file /sys/kernel/debug/clk/c910/clk_possible_parents
now correctly outputs: "c910-i0 cpu-pll1"

Link: https://lore.kernel.org/linux-riscv/20250722080535.60027-2-ziyao@disroot.org/
Signed-off-by: Drew Fustini <fustini@kernel.org>

----------------------------------------------------------------
Michal Wilczynski (1):
      clk: thead: Mark essential bus clocks as CLK_IGNORE_UNUSED

Yao Zi (2):
      clk: thead: th1520-ap: Correctly refer the parent of osc_12m
      clk: thead: th1520-ap: Describe mux clocks with clk_mux

 drivers/clk/thead/clk-th1520-ap.c | 109 +++++++++++++++++---------------------
 1 file changed, 48 insertions(+), 61 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
