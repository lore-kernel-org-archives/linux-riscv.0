Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE566FF885A
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 16:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vlr61IwKnMHqwSDUext5EDpoNFbsFVNrGhL4qecmh9I=; b=Orm+Vk69c02ZQV
	ihmYvwNFbCOa6AWsmd7gzALvVsTAcIkRXa4jTNXvPhjuKjv2q8vvpxoqDVRx58LC+FHWKPw5l69vQ
	/H5WfH+JxOXVfG8tY7RVNpzfmdS8x6XK9ZvkPBqNcvpMTniPBoeLSup6KGEf79rZIIffAIQAZNL/n
	WN1Id4jLiAkJcK8xGOCtr0yj4nnknFgchsm7Wf1sougzuGVjtlhaeFy4zgg/QIfv/YXdPdsgU0SmP
	JJZbS60em7dwkkorF6+4yXDDSuK6WvKRw2L/fgKve2aJsghnAQQBV9gNDghkcMxmNSPldCmNOB1Yl
	fcbpCeWaKO8Kb/xewQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl34-00000001sJE-15Zx;
	Tue, 28 Apr 2026 16:12:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl33-00000001sIu-0W3N
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 16:12:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 260B460008;
	Tue, 28 Apr 2026 16:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EBDDC2BCB5;
	Tue, 28 Apr 2026 16:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777392751;
	bh=KRnGtmY468KGUtHl7CD7HwFCBx4A08AyJSMRArIQA8o=;
	h=From:To:Cc:Subject:Date:From;
	b=D0LH+T2RZh1bp2bP7EBSkX+UXm2fE34lPTwhSFAzV0dhpA2eenR4OMmE0hOiqwKf6
	 DaZk912kzflpix8NFBmbib6dbHivuDs/zK14MecJ2aPNmOT4siItHevHbam/D9anKW
	 v7pkHx51EaexP/su6XLbUuGe8mLv5Yta9Q6VPRKH+9Y86e/+mUROuLfghLgt/kwu6Q
	 UdWiI+Kr/RLFKsBItxNUS/oldvgQnZA2X7dijl/kcV3l5lnjUO4UI3i8djbDUHtald
	 +u62zJMPSkGGMrIEWulbeaMDuj3R+AGm+mLrfpnRjhJjo61lJW4wjLVmPTxc/hPCJQ
	 H38MDuYu4nRGA==
From: Conor Dooley <conor@kernel.org>
To: broonie@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] microchip core-qspi gpio-cs fixes + cleanup
Date: Tue, 28 Apr 2026 17:12:04 +0100
Message-ID: <20260428-plexiglas-smith-6ae4e9ba8abd@spud>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=879; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=OjL3jteOlXvTCBInxRMwdQR3kLR+lbu3YZfwpkULSkk=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkf7sSuMw79XdVzmrlE9LpMfXbTQnGb7/pT3/y1enBy0 +SD4s7xHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiIajojw6L1Uw48SBOYl1M3 nUV+W3+Q1nn31Ozius8FGRdX/PmlmMrIMPs0N2d6z93u3Z+eu7uJJF09IbgjUNNtXsvi7Rrfuhf 1cgAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

Hey Mark,

v2 here drops 2 of the cleanup patches, but keeps one that conflicted
with the changes made in the fixes.
Rebased as you requested.

Cheers,
Conor.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Mark Brown <broonie@kernel.org>
CC: Cyril Jean <cyril.jean@microchip.com>
CC: Valentina.FernandezAlanis@microchip.com
CC: linux-riscv@lists.infradead.org
CC: linux-spi@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (3):
  spi: microchip-core-qspi: control built-in cs manually
  spi: microchip-core-qspi: don't attempt to transmit during emulated
    read-only dual/quad operations
  spi: microchip-core-qspi: remove some inline markings

 drivers/spi/spi-microchip-core-qspi.c | 102 +++++++++++++++++++++-----
 1 file changed, 82 insertions(+), 20 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
