Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390DDCA5FE6
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 07:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OespJvKdi4NfllTm2uq87M9qM4q0BekSMFSCfrCXY78=; b=SVrp6P+nO/GFfR
	C5S085ZuRVO9IdouLn3Ddtjoqbv4NuHwcbHzdJMVQTbb7ad7F25hRUdljt/CkpFbF2utiX40228C2
	KuKhZSzEdKC2DUi06VRGUds8M/FXKIDv/KGHBRXyAr5XCvifupr4GUs/5Te5dXUebRenXlxrFPEBM
	ZF6R29cyRA6CghHeeQ8sLndzyMLjBENvcyY01t5uBzSo1yXho10wCbPMyqcqaAqlMQKrtBcUqX2ls
	DOi/GFXv6hpEBSdLAR41RQKANqZEbXuPO2B0R2Js4iw1MxX8OxG7QSIDQVkbT7+T+cp7amyKeG1c3
	RIVNUH/uP5YHBtG5tieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCu6L-0000000D7pT-0I5c;
	Sat, 03 Oct 2026 07:24:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCu6J-0000000D7pN-3y4X
	for linux-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 07:24:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A90B643926;
	Sat,  3 Oct 2026 07:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6696E1F0089B;
	Sat,  3 Oct 2026 07:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791012247;
	bh=qBQhcpU3YPW+HWB5pcDxjmSRN+TDMaWncOCUHprWPBw=;
	h=Date:From:To:Cc:Subject;
	b=M2E4KbC4DsJGkedsGQASuMGBrsvXMXnl7nAXUmXIx4Pb/+T44JwGYWWkoPN/sJ8Pc
	 DteCblJ5UXL6YjPVxuF0NMDMGbeujlNspdl29rDmYcf8wpMKXw+l9O2W9js+iURjUU
	 vhT50OeFGhLr4nLZV4UYZYoVYr0PwDjDt/VVSSHKJ2QB81YET/2BOGqLPq16KnphyZ
	 IEaAFiKt3rr2tcPe7+tPtuKCartysbyf+FS8RUy3S3lGeMcGn8DMurW2ENzHgY+w/K
	 p7rKQoz1zPOa0FvJ1kxW4uMV6fVWM/r3AU88OJzPuvAQpLK6morxLo6Q1Ip5hPXeEj
	 hfuzGmJIkWSfg==
Date: Sat, 3 Oct 2026 00:24:06 -0700
From: Drew Fustini <fustini@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Aamir Ahmed <elb12345@hotmail.co.uk>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Peng Fan <peng.fan@nxp.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: tenstorrent: Atlantis PRCM fixes for v7.4
Message-ID: <asCtllTmVqc1ZDBK@x1gen8.tail89d63.ts.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git tags/tenstorrent-clk-for-v7.4

for you to fetch changes up to c64b54ddb692c30b8fb139a2ead32eb4db7faef5:

  MAINTAINERS: Update RISC-V Tenstorrent SoC entry (2026-09-29 12:06:41 -0700)

----------------------------------------------------------------
clk: tenstorrent: Atlantis PRCM fixes for v7.4

Minor cleanups for the Atlantis PRCM driver:
- Set the onecell .num before the first store into .hws[]
- Only bump the shared gate refcount once the enable has taken effect
- Use regmap_assign_bits() in the plain gate op

Also update MAINTAINERS: add Anirudh as M: and change T: to kernel.org

----------------------------------------------------------------
Aamir Ahmed (1):
      clk: tenstorrent: Assign .num before accessing .hws

Anirudh Srinivasan (1):
      clk: tenstorrent: Fix refcount leak on shared gate clk enable failure

Drew Fustini (Tenstorrent) (1):
      MAINTAINERS: Update RISC-V Tenstorrent SoC entry

Peng Fan (1):
      clk: tenstorrent: use regmap_assign_bits() for conditional set/clear

 MAINTAINERS                             |  5 +++--
 drivers/clk/tenstorrent/atlantis-prcm.c | 35 +++++++++++++--------------------
 2 files changed, 17 insertions(+), 23 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
