Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C48FCA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 05:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C7ZRgRg6KngabxTHwB1b6f3Z2OMvcMQ1jmajnI3FJHg=; b=lYSpxZ4lYGk8Co
	RYyL6/zXdcxKfachdSnCe0Qy+7A5wZCUlvqKPIGJhlHfpAKo4xBC5zQkU/Syan3qKk6f0bRYTURJg
	j/xoEZvtADqWZ2HQmAksvb54qn3s3sg66yLoCSScAR6d6TOtSyGAsOOQe34x4iNbpjGBP76kX+jw/
	isxe6vcYUUdaXqqPcd7BqQEqNBcU5GG5OlLso/yhrbr+Kb4OHgk9qcZXNl2e9/Q2uXIGvbXqO8q6P
	90l97Z18pMx7Y6RDvMeGe6lz3YudBGTSElvqjMyJoyb3mZRRspfqyhO0bZogtZL7GskBBHS/2VHVM
	Ut0jr80dnCQJjD0XtNjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhnC-00000009uP5-40fJ;
	Tue, 12 Aug 2025 05:43:26 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhnA-00000009uOj-1KPY
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 05:43:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1754977396; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BrBGm/vA4NzG7o7uj5qjFNzDvDw74Kmterqa2XgiiCV2Ho1W4tlrgiERdmGuXls+AGbR3V5UvXGfhBJvKRTeR5MbzO5ga/i2pdmMfVUhwDObPf56Ez0c6cswE1THgC03TP0dAEW4ZwGKaOxoYYQFcULrBh/9BWsd9dVpZTq101w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754977396; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pA524d/aKpZyY20fSlZrDb9/G4WDB7CsquWn7adUTYc=; 
	b=n/mdmUFuumwC68cdBL2WocQOVOfclfkDGDV6WA359thzGSWpzsGKzzVyPTvleumAoCRcxomhopVpgN5v+p0pQq/o8IaYfL98zy2rfx6V1ugD28IEqko1UniZ8PCoQFduBVj/iX8+1PQRYG7ZorbJnIOGHsw8hui6CdodAjFES6k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754977396;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pA524d/aKpZyY20fSlZrDb9/G4WDB7CsquWn7adUTYc=;
	b=A+1wIpONbt6KdAeW2suguNZ5G+FXc24a7PTbFjOCPIcrWTLFv+mVKK8fS67ydlzw
	CMvwCoQQbyJDfbG6IqK6IGdDzMlN6OS5YKNqCMz2pZGAjHpbjLE+N35W5MDq2iK2/04
	YsdaInTGFCsVzYZusnD/J2Q8A4mNoK2nQHfMeEloQUCQ5WYw6V8jZI+/dufXBp1RKPG
	UaG3DJmLDoCPcJpQokWD7C1b3E14JlOcBoDNtoi8P5FSgj38m6YXlbjwj+BzUaqhtCt
	fyW3mmA3sh3nSIiiRsUeIKEWla6e3WJ5N44qgLthSL5brQookr/cDAkTUfbKZzogmhv
	xlsNMVxKTQ==
Received: by mx.zohomail.com with SMTPS id 1754977393951539.500568194191;
	Mon, 11 Aug 2025 22:43:13 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 0/4] clk: thead: Misc changes to TH1520 clock driver
Date: Tue, 12 Aug 2025 13:42:54 +0800
Message-ID: <20250812054258.1968351-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_224324_541932_937EE8A2 
X-CRM114-Status: UNSURE (   7.59  )
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
supporting the display controller (the first 3).

The first two are functionality additions, with the first one adding
support for enabling/disabling PLLs (for DPU PLL) and the second one
adding support for changing DPU dividers.

The 3rd one is to address hang issues met when testing the DPU driver
w/o clk_ignore_unused command line option.

The 4th one has no relationship to display, and only exists for my need
to change an arbitrary GPIO (well, GPIO3_3, the one controlling the fan
on Lichee Pi 4A) with gpioset.

This patchset has a dependency (a 0th one) [1].

[1] https://lore.kernel.org/linux-riscv/20250809-fix_clocks_thead_aug_9-v1-1-299c33d7a593@samsung.com/

Icenowy Zheng (4):
  clk: thead: add support for enabling/disabling PLLs
  clk: thead: support changing DPU pixel clock rate
  clk: thead: th1520-ap: set all AXI clocks to CLK_IS_CRITICAL
  clk: thead: th1520-ap: fix parent of padctrl0 clock

 drivers/clk/thead/clk-th1520-ap.c | 174 ++++++++++++++++++++++++------
 1 file changed, 143 insertions(+), 31 deletions(-)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
