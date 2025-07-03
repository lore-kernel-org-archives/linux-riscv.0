Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6BCC83030
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/Za7nucWNLMxXxcV/ZVJ2+JdlEvyW3SUCrE0Iuu7lb0=; b=3AxfDOMpMVm/l7
	tydBWS26APLQSI9nXt7kpd/4Wyp5yzLpiA60nx/1qw6IbNC7MdUK6CyedGdIjqHbEsQLzVs5xa8bm
	BtoH4FR0m3RnR3IZxTpRo3yKvHahM7LKKlR98fmQ38TZNtKMtcFU+/gdpsw7XD+kOP35md9Qu2Knt
	q/dNZ2fdLbxS0LpEHEZclUS4qW57YoWR+LyaAIOnoBYxwbNjC6Xb5yBjYzUyTrGoKAxKjcjFpno7s
	pNZRwXYYSTQNN4bowHygqfSDRBoN+FKwcgZFd6U7pgF5ejQOSRu0u3P3xKip49mYzdQmNBMuGQnp/
	4PO50ZNgiUEU8FA+wK2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzf-0000000CTM7-0ZWN;
	Thu, 03 Jul 2025 20:57:19 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLhs-0000000BnKl-25ys
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 15:18:37 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6725734206E;
	Thu, 03 Jul 2025 15:18:34 +0000 (UTC)
Date: Thu, 3 Jul 2025 15:18:23 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Immutable tag between SpacemiT's reset and clock trees
 for v6.17
Message-ID: <20250703151823-GYA312602@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_081836_557196_FA071DCD 
X-CRM114-Status: UNSURE (   6.91  )
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

Hi Philipp,

Please pull the following change into the reset tree. This
allows you to apply the patch 5 of the SpacemiT reset driver [1].

Thanks,
Yixun Lan

Link: https://lore.kernel.org/r/20250702113709.291748-6-elder@riscstar.com [1]

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-reset-binding-for-6.17-1

for you to fetch changes up to 25a59e813cd2ca728047f657d64f9b29480be393:

  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets (2025-07-03 22:16:08 +0800)

----------------------------------------------------------------
RISC-V SpacemiT Binding for 6.17

- Reset DT Binding for K1 SoC

----------------------------------------------------------------
Alex Elder (1):
      dt-bindings: soc: spacemit: define spacemit,k1-ccu resets

 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |  27 +++-
 include/dt-bindings/clock/spacemit,k1-syscon.h     | 141 +++++++++++++++++++++
 2 files changed, 162 insertions(+), 6 deletions(-)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
