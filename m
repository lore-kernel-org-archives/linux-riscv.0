Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E2BCA1002
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Sep 2025 19:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S9QLA9ui+meRcxr3am/ZrMbSjYoEH58Mu8OZ40gq61o=; b=GaTl2Usp1inhJ9
	97yLVs17U03ecB4koouT6lNrgVfHrO+6pjYALaTCeNIb95IX+GmvmowMJvzpBCZhQ5ENOeBVQHh9z
	q53Du0vxWFSoLp/HG4peOlKYsB4js5wWkByT8BtC3O/7V/Le4gzu0N6w3pzIodvqIi2BmhxvlKyRJ
	O9AyXvPgVizZqR6S7v37WxnThSX/hhHZve6r6RZC6Ewhw9JmQGTVLYA8LqZ6ciTpUXyne8/OHCbPz
	abORP0/YWN0ZFm8li162DZKh/5Q+Odx6MDW6U64ZiKYKKAxOLSfWH0+uVUyZEahfG2+YqMl1V8T0y
	JeAXiulg/wLVJyAmWIYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuyXr-00000008MO5-3Ry7;
	Sat, 06 Sep 2025 19:25:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuyO0-00000008LWT-2XXY
	for linux-riscv@lists.infradead.org;
	Sat, 06 Sep 2025 19:15:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 05BE160374;
	Sat,  6 Sep 2025 19:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD96C4CEE7;
	Sat,  6 Sep 2025 19:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757186143;
	bh=XOwKVqtcDN9k49oRYkZUzZnxSFvtc1z2zGDKWcxVwjM=;
	h=Date:From:To:Cc:Subject:From;
	b=HaTRfP0kXVAUlsc6FZ3zqW7nlDOh7zgiy4DkAhm44KE91VFS0XCE9ZvNhotvxwcKv
	 Vw4AKa5gX3wKmS/s0BKSaINpc7bVFO+qbVDgm4R6JelSOuWXKevQb2h8aFUL55bSl7
	 +cZ5B04PB3nAQqwTDPC6glf8tZQKpmyJqBybjuVaG7kv7SpNwOuG/A+7uhwk6wgvJa
	 GGxmU+GO2ccDmW9KNMCDhOfUaOvBSP0mZ+l3X/2o+iWpf/O2aFX85nMBVjNEvW1FM6
	 IQyo7V/ux7ZI/vxr3UyyVtCF9yjEX5gVcWo0cYU5X4nwRIZpl1k9ynzzqgOH+oXhil
	 DrYytDbQi5uIw==
Date: Sat, 6 Sep 2025 12:15:41 -0700
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V T-HEAD Devicetrees for v6.18
Message-ID: <aLyIXR1G9DUzwGWc@x1>
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v6.18

for you to fetch changes up to dfa743da83ab7ba51ec5692d5939ba1bab4b78c1:

  MAINTAINERS: Add RISC-V T-HEAD SoC patchwork (2025-09-06 11:05:03 -0700)

----------------------------------------------------------------
T-HEAD Devicetrees for v6.18

Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEAD
TH1520 SoC used by the Lichee Pi 4A board. This node enables support for
the GPU using the drm/imagination driver.

By adding this node, the kernel can recognize and initialize the GPU,
providing graphics acceleration capabilities on the Lichee Pi 4A and
other boards based on the TH1520 SoC. The display controller and HDMI
output are still a work in progress.

Also included is a MAINTAINERS patch that adds an entry for the T-Head
SoC patchwork.

Signed-off-by: Drew Fustini <fustini@kernel.org>

----------------------------------------------------------------
Drew Fustini (1):
      MAINTAINERS: Add RISC-V T-HEAD SoC patchwork

Michal Wilczynski (1):
      riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node

 MAINTAINERS                           |  1 +
 arch/riscv/boot/dts/thead/th1520.dtsi | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
