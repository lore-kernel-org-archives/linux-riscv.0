Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7727CCCD1A7
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Oct 2025 20:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=00ijz0RvIP7k0TQHQtChudNnHHipCaqucnvOJ+h4t04=; b=zMgR9iYn+1GF9e
	O88ouK6t2SgDmW9yfl9R31mcE+wEQTaglmfrpqsPst/YgdXigVIrCoO6YWcDM1fihAL05z/b2pVMT
	c/wjkuckU/n7811yNV1lZjHhTmfRxCUQpRi/lQwOkVvlbHVqsEfSZ4rZsWwsbbDhOSyXbq1Ef0nOU
	PaR9IwAun2HuIaS/WucZvBClvbdtae5SSWB30dloe2hVuh0eIFaswQjJOZDjDkXvOHvo8mR8Nk0+G
	5on4FhEa4hrVW/dRg9Ci2HPRHSjRYEAmonOJPqN9PXJHrWOmJ+jVmESHUWtTGkvCJIDgoHTWpm/4J
	MsHYZlg3gzCG8cisukiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAa4M-0000000BONp-2z6t;
	Sun, 19 Oct 2025 20:31:58 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAa4K-0000000BOND-3clJ
	for linux-riscv@lists.infradead.org;
	Sun, 19 Oct 2025 20:31:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=Rxhmdd8gp8A7Gb+pYCJhHhx5Sl0gdKNrP/+9/ZJldls=; b=RhsehRKliNXkvmY+pzSXAAZhNr
	Uhgu9UnxFr7auNNbebHxtH62y8F7pT5BN18VWJRxN1lZF/GceWfQKE1AjzpabNtYN4plYlgEXjDj/
	O1h1MUkf6ehL68nKoEK5ZpF+10Zqxee6lE32EUE+IzTGK5U01O8gPNQ2XyYCtVoZHDOO2/TpiZ1AU
	bwAW66gFrQJM441Fulwv7m3DBKMUqOpTopEMgRNjF7HWODu5/XLCLnhJ6z+s1IW2Bf3cBW5wgohhP
	Eqp+ZF5D1ql3mS7YIUwmd9D2XdOT30zMiW2JYyd8DAB4xN04s07xNwxTj16KMBGsd0IkXIwcTafNE
	kwXpKPWg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1vAYsK-00DYBe-1U;
	Sun, 19 Oct 2025 21:15:28 +0200
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
Subject: [PATCH v2 0/2] driver: reset: spacemit-p1: add driver for poweroff/reboot
Date: Sun, 19 Oct 2025 21:14:11 +0200
Message-ID: <20251019191519.3898095-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_133156_896396_1E31A9D3 
X-CRM114-Status: UNSURE (   9.81  )
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

This adds poweroff/reboot support for the SpacemiT P1 PMIC chip, which is
commonly paired with the SpacemiT K1 SoC.

Note: For reliable operation, this driver depends on a this patch that adds
atomic transfer support to the SpacemiT I2C controller driver:
https://lore.kernel.org/spacemit/20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com/

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
