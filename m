Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A087DC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 17:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=duluC0itcoks5kfb2oEUTlFStM8knpf8V8BgIsUXWmg=; b=j9Z70ignYyfzUJ
	wm5JnIMk3/Np/IfpXXphDaGdcLMdEOd2Sn6HDoCtqDUZtXOrQ590aXjsr9BubpOv9lHnIrqGaGQs6
	GDadPaRww/B2mT5kkW0acbdua5G8VSRmhG40W1cTcRQLIJ0kG2L7tkIHB3TH1jQK0+6KNLWl47Xnn
	6NwvmfT50y8VHEqsbXbVO6izOwwsJOBIFXOfg/ElnVk+ihQ+4ydoHhCfGOjcB678hKwC91AelPFTw
	tr/9KUl+3JfvACBtXMHBnRYaeC6bG7/uJFX2+zD63h14iqwnuZAp52IVbxY9RnlKig4FQlmSSncwQ
	g/eCxibMH3UldiUCB3BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxAek-00GLDy-5T; Mon, 21 Nov 2022 17:32:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxAWo-00GHSm-5F
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 17:24:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AACC5B810E7;
	Mon, 21 Nov 2022 17:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5425CC433C1;
	Mon, 21 Nov 2022 17:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669051455;
	bh=ITOwNpfu8qXwCaHtGeJVM+VyLpA0Z+2LYI12CiSpsIk=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=LcPBJ1wEzq2r4FWd5pmb73BK6DMKw68/GmxBtbM6CXo7Do7DxpEazEhi2XyH6ujgv
	 oDQ8QAMD4FVaqBKhCVKy+saD1GkMkzEfYAXdEwZVAdJzEyRgLu1XhMWS9EreWGfLWg
	 5z62WaQNoe3ssRlNPZx1aXpUE3LzKf++9oahohdPFct4yXGpxl4SHEI37IkUgvZZAe
	 Uiobf5ACnHijOVV9/N7ucu4rE8K/OlIRGpQyLguy2J9YyRjgqbPODEjY5nsGJmD/ws
	 ZzuJsBAi/VX4E3190jJ8fPtZ0XQAKER0maLe/gPyZeIIlPowAT9jb7t2AHzF0qb6QM
	 Ca4Sta9ecm6jg==
Date: Mon, 21 Nov 2022 17:24:11 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, conor@kernel.org
Subject: RISC-V SoC Drivers for v6.2
Message-ID: <Y3u0Oydiv2Wauda2@spud>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_092418_404437_D2DEEF56 
X-CRM114-Status: UNSURE (   9.13  )
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


Hey Arnd,

Same stuff applies here: lmk if there's something you'd rather see changed.
Perhaps you'd prefer to see PRs per vendor? Although I think that's less
likely to matter here than in the DT stuff. Again, I'll try to get the PR
out a bit earlier next time.

Not too much to see here, Yang Yingliang has added some error handling
to the setup of the driver that reports SiFive cache topology
information. I've put it on -next given how far we are in the release
cycle, feel free to put it on fixes if you disagree :)

Thanks,
Conor.

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-soc-for-v6.2-mw0

for you to fetch changes up to 8fbf94fea0b4e187ca9100936c5429f96b8a4e44:

  soc: sifive: ccache: fix missing of_node_put() in sifive_ccache_init() (2022-11-09 22:01:31 +0000)

----------------------------------------------------------------
RISC-V SoC drivers for v6.2

SiFive:
- add probe error handling to the ccache driver

----------------------------------------------------------------
Yang Yingliang (3):
      soc: sifive: ccache: fix missing iounmap() in error path in sifive_ccache_init()
      soc: sifive: ccache: fix missing free_irq() in error path in sifive_ccache_init()
      soc: sifive: ccache: fix missing of_node_put() in sifive_ccache_init()

 drivers/soc/sifive/sifive_ccache.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
