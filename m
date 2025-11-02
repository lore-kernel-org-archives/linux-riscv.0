Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97726CCF9E3
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Nov 2025 23:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vpkdgSx822iLpD3C+2BCuDYrlp9QTiJfdrHdQ74F9UE=; b=ZMVt3a+mZ2X+Mc
	DwywMQ5DzSDS5arqdi086vYRwmm7tNjoIGhJNmWkf5CUvKNlA7SQZ2oPT8g2BczlsDXaBeQKTCFat
	BN8xWA5/K7jdXcMTjVrwq2/nDjuKTfOo37IHuv00IsQriJzpqCfPURR/08WwolNX+5ovtTla/vqA1
	xIjCYyeknj4UFTOKm6Mv2apzW/cjvEM0n+lVdu5vzpW0zuvnUzwNEIbn56JJSh9Y+3P07OFc+IZ7J
	glyrwPNHim5HUMTPYET47pjqlg1O+oM3ybSB7mZyT6AXky688/vvaeYfpLIXBuKEq6w9T+P00Wr2c
	JXDlnmHUVfKbqu2f2L8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFh7R-00000008ulc-3kw6;
	Sun, 02 Nov 2025 23:04:17 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFh7O-00000008ukJ-0PKn
	for linux-riscv@lists.infradead.org;
	Sun, 02 Nov 2025 23:04:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=0rN/IbAVtI1MLMhGfl/KVAMt/bd2mDCGlXcVuloPPUE=; b=th/uZL9g4MyQj/WGDr2kXpBCFj
	gVPV+kDCjHo5toWCTtppAGC3rB6NfBewBlFy0In4OzgfDtEbk85tdeqHiWp4IrTmKYB/dfIRWWyId
	hHnv5E2sVeCRGvlulFKegtBjAd5OMz0HFeaUx3U0f/Iy3ee3+nEoSUCGMK5JwjtbRi03TGZD3KjKD
	2nSsHGgQw1L2UN8kGy4j/4O6OkrXK9rbxLW0QV1uZ9MsXr1PhhZM7CHqvlAGPXZzE75+zbSMzwyI0
	rvyakE4e4b+yGuukmjVO1u4Sqny7Gn7Dmu6tERHQ5MYUPX8ySEtP9nhFoHY00tu6pHsZzdhWghF4J
	XCYWaRYA==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vFh7A-00000006eMG-0JNf;
	Mon, 03 Nov 2025 00:04:00 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE:Keyword:riscv),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit)
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v5 0/2] driver: reset: spacemit-p1: add driver for poweroff/reboot
Date: Mon,  3 Nov 2025 00:01:58 +0100
Message-ID: <20251102230352.914421-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_150414_566621_1A157335 
X-CRM114-Status: GOOD (  10.38  )
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

This adds poweroff/reboot support for the SpacemiT P1 PMIC chip, which is
commonly paired with the SpacemiT K1 SoC.

Note: For reliable operation, this driver depends on a this patch that adds
atomic transfer support to the SpacemiT I2C controller driver:
  https://lore.kernel.org/spacemit/20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com/

Changes between version 4 and version 5:
- Change default to "MFD_SPACEMIT_P1"

Here is version 4 of this series:
  https://lore.kernel.org/spacemit/20251026224424.1891541-1-aurelien@aurel32.net/

Changes between version 3 and version 4:
- Replace the "select" by a "depends on"
- Remove outdated Reviewed-by

Here is version 3 of this series:
  https://lore.kernel.org/spacemit/20251021201451.1013640-1-aurelien@aurel32.net/

Changes between version 2 and version 3:
- Allow building as a module
- Remove outdated Acked-by and Tested-by
- Collect Reviewed-by

Here is version 2 of this series:
  https://lore.kernel.org/spacemit/20251019191519.3898095-1-aurelien@aurel32.net/

Changes between version 1 and version 2:
- Rebase onto v6.18-rc1
- Use dev_err_probe() to simplify the code
- Fix indentation of patch 1
- Collect Acked-by and Tested-by                                                                                                                                                                                                                                                                                                     
Here is version 1 of this series:
  https://lore.kernel.org/spacemit/20250927220824.1267318-1-aurelien@aurel32.net/ 


Aurelien Jarno (2):
  driver: reset: spacemit-p1: add driver for poweroff/reboot
  mfd: simple-mfd-i2c: add a reboot cell for the SpacemiT P1 chip

 drivers/mfd/simple-mfd-i2c.c             |  1 +
 drivers/power/reset/Kconfig              |  9 +++
 drivers/power/reset/Makefile             |  1 +
 drivers/power/reset/spacemit-p1-reboot.c | 88 ++++++++++++++++++++++++
 4 files changed, 99 insertions(+)
 create mode 100644 drivers/power/reset/spacemit-p1-reboot.c

-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
