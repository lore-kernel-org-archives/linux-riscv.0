Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D8CCD343A
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 14:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N2DOxBY+k16dTEaqIsmdEQ6TTcr1Fw+2KzVFgCSlyuc=; b=xdxWqmjeMJ2LTk
	OX4BPkE3JGao2R9A4a1QW40rcCyv7iLRqkMP6neKSPc/VgNW8fUF61zYAJbGKFMjtu9o6tQ31DlV5
	Gvx+g7RyED5lDpMlAT/732eI6x/S3rb9+p9OH80rOAuToN5UwCbrnnPmiQg+3wuBn2nJUa+/+hV4b
	NEDGWFoc0IljVMP1NR4TAp+BQW8NGwQ6lZ3iuHoW2hgsj9y5VG+1dhAU1kbS4iGSuhDoEC1lXtHvt
	RBNTQt8m0Hk0gF2L1Y4cFdu25o2MBPah2QZSHfYJ4AwOXYbxK/bkkXSYF0ohPIFrkJp/ZecJklJ/u
	/vuXc4fTQL5TMwk9KQxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slUTA-00000000YZB-1Fqe;
	Tue, 03 Sep 2024 14:25:20 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slUT6-00000000YXU-3Yw7;
	Tue, 03 Sep 2024 14:25:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725373517; x=1756909517;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8oF38+wcTyCFFLJNltFe9UX5N5NexPR+hPC1BNLasBQ=;
  b=DsIVLegYVViNIuiYg9/WCZmLKOuHzfotosktNF6SPut08LjZiJYtyg1q
   3scZDOQdsWseZ+tlQtY1oQEIxHu9RryFLVCMfX9tW7OP6/ls9FvgEfop7
   goGJB12MycZXxPdqYRh5ORm1adSkb7oYw/PUPyLCshLusteO3PkayYPhl
   z6pe20Ho/ito6aZyQmuQTsoM55Ra9Jseb20K7PpFcJxZa5GLgAHymhD+d
   Lp835VqX5Pjetx1xnBEXb3QZaZUXHYpRjFz++Zr3xCu0/jIhaY0lufcqf
   RpXUQjU5XX1UYMAJy+ByuiAUWuHkB93jv5uQ+fb2nOY9ABdojwZz6KdK4
   A==;
X-CSE-ConnectionGUID: G2yEySJCTDCtIpuhV1WCxg==
X-CSE-MsgGUID: x6VtBidsTqSprX5hdfvp4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23541264"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="23541264"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 07:25:14 -0700
X-CSE-ConnectionGUID: rb+5gYZhQFG9CNAs2BREDQ==
X-CSE-MsgGUID: 3n4/huujQW21hYevl0+/+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65658762"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 03 Sep 2024 07:25:07 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	UNGLinuxDriver@microchip.com,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH v2 0/7] i2c: designware: Group all DesignWare drivers under a single option
Date: Tue,  3 Sep 2024 17:24:59 +0300
Message-ID: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_072517_137158_8AEDAC0A 
X-CRM114-Status: UNSURE (   8.99  )
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

Hi guys,

This is a proposal for Kconfig improvement regarding the Synopsys
DesignWare I2C adapter driver.

Changes since v1:

There was one driver that selects I2C_DESIGNWARE_PLATFORM in its
Kconfig which causes an error because I2C_DESIGNWARE_CORE is not
selected.

The drivers Kconfig I'm proposing that we fix by using "depends on"
instead of "select". There are also a number of defconfigs that enable
I2C_DESIGNWARE_PLATFORM that now need to enable I2C_DESIGNWARE_CORE.

The original patch:
https://lore.kernel.org/linux-i2c/20240830111222.2131172-1-heikki.krogerus@linux.intel.com/

thanks,

Heikki Krogerus (7):
  ARC: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
  ARM: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
  arm64: defconfig: enable I2C_DESIGNWARE_CORE with
    I2C_DESIGNWARE_PLATFORM
  mips: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
  RISC-V: configs: enable I2C_DESIGNWARE_CORE with
    I2C_DESIGNWARE_PLATFORM
  net: txgbe: Fix I2C Kconfig dependencies
  i2c: designware: Group all DesignWare drivers under a single option

 arch/arc/configs/axs101_defconfig             |  1 +
 arch/arc/configs/axs103_defconfig             |  1 +
 arch/arc/configs/axs103_smp_defconfig         |  1 +
 arch/arc/configs/tb10x_defconfig              |  1 +
 arch/arm/configs/hisi_defconfig               |  1 +
 arch/arm/configs/multi_v7_defconfig           |  1 +
 arch/arm/configs/pxa_defconfig                |  1 +
 arch/arm/configs/socfpga_defconfig            |  1 +
 arch/arm/configs/spear13xx_defconfig          |  1 +
 arch/arm/configs/spear3xx_defconfig           |  1 +
 arch/arm/configs/spear6xx_defconfig           |  1 +
 arch/arm64/configs/defconfig                  |  1 +
 arch/mips/configs/generic/board-ocelot.config |  1 +
 arch/riscv/configs/defconfig                  |  1 +
 arch/riscv/configs/nommu_k210_defconfig       |  1 +
 .../riscv/configs/nommu_k210_sdcard_defconfig |  1 +
 drivers/i2c/busses/Kconfig                    | 29 ++++++++++++-------
 drivers/net/ethernet/wangxun/Kconfig          |  3 +-
 18 files changed, 35 insertions(+), 13 deletions(-)

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
