Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC913C83F27
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jul 2025 09:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=25VK/PMZkF0lfaYwnEXXSRSA+XU5OQfkpz7gNgGyOig=; b=YtPCjzPt/qEy15
	qgr4Bhf0zOzsJwky4pVxR71iuxyKtLTUg9JSedAHNQzrnRKLNvBOynh/2IJncZh/xqYY0zdEkqGrq
	hcP6ePKhbA6PMW/6JPtsTtoG0toPMhFHbrW4Yxj9AUtWW1QvNiIvQRsklw9jO+HTgU6R8RD/wDzyS
	LYzZR0vdw/LJx2dqcy8g9FBXBquXGc1Uj1m3E/Prw46IWBnOUHy1r6c0CemFTKMdyeLM7W/bqkSOK
	EM8qfFECM1gZ1MA0IKds8kupXpJG8P3zV9fdOgAW/mzNxUiTMgiR0YB8VrJ9Lizc/sQbLcdicMwEr
	xFHBC+6hFVlKnvDrmpkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud42K-0000000E6Qz-0oFG;
	Sat, 19 Jul 2025 09:39:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud42I-0000000E6Qp-3YWo
	for linux-riscv@lists.infradead.org;
	Sat, 19 Jul 2025 09:39:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA26960052;
	Sat, 19 Jul 2025 09:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D63C4CEE3;
	Sat, 19 Jul 2025 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752917956;
	bh=Knn7NXH/voJGn5E+ykscu72HfNFmEb0KB0P1KGSgnTg=;
	h=Date:From:To:Cc:Subject:From;
	b=rj8ba4ldkynIyCoccybi/Nkzyi3UgU867je3rksRn4nJYoGfK6YvqQlH7Ya3SOPMt
	 Y2a1PhZHPQlgHG49JxtCn+Dgf+cPhnv9PmnASTnLSXApQ9ngHCOrmkRniomHxSRp+5
	 dALdS0XXSzKNlxmeAEIEJrJK8xcgNuekfP8TBTZgVpg8nSM4aCepcpBNkNlf/XoL+C
	 xBO4tk6L4afXHvvQt4O2KB+qc3jZ0KoQP7nOji0Lx+dz9cW6CPr/ZMff+LtV3viMwH
	 Y9PMipAgqfjPGUIFlwTDfignoJgFTloIESH+8bEkW0fA63x7sSHnmsMLVNP+oQTh4U
	 jQ2LLLFYDSXCA==
Date: Sat, 19 Jul 2025 02:39:14 -0700
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V T-HEAD Devicetrees for v6.17
Message-ID: <aHtnwthmTpfkIBMr@x1>
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

Hi Arnd,

Please pull these thead dts changes. I've run W=1 dtbs_check and they
have been tested in linux-next.

Thanks,
Drew

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v6.17

for you to fetch changes up to c31f2899eab084b3557e9f9e10fc7898113ef18d:

  riscv: dts: thead: Add PVT node (2025-06-30 13:13:08 -0700)

----------------------------------------------------------------
T-HEAD Devicetrees for v6.17

There are several additions for the T-Head TH1520 SoC:

 - Add PVT node for thermal sensor which works with the existing Moortec
   MR75203 driver.
 - Add "gpu-clkgen" reset property to the AON node which allows the power
   domain driver to detect the capability to power sequence the GPU.

All of these patches have been tested in linux-next.

Signed-off-by: Drew Fustini <fustini@kernel.org>

----------------------------------------------------------------
Michal Wilczynski (2):
      riscv: dts: thead: th1520: Add GPU clkgen reset to AON node
      riscv: dts: thead: Add PVT node

 arch/riscv/boot/dts/thead/th1520.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
