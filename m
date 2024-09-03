Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60FACD3439
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wVIyRS+07m6kCN9vkGsC5f+VTkO0kl2rlXPy387oJk=; b=yrgYumVnPCpE+d
	zsINcF12qYwVtaO6g+nJjDMuaxuFZgm58cas5dxGavrszP7wfdTMDJ7q4Yk/Ffc/LACyWtlogcOtU
	8yeAY+IXceyBC2zth33LExN/vr/r7Z5gvF1CUzr6jElWKVHa8O4SrdtyUiKN+HNBC+Ad4saTSPLMd
	eiE2KUSKeWwBqXoqtujIhcM0MNREZdfXHsIahSO1HHjJVtxsl80CSUXiuYRSUjoFIpqB9mP8DY896
	VbkhTR7a4S418OyGcokT5w2nK4gW4AK2R2VM9LbhzvM2mQUoBRkloL/V2v1MOlAKORnN2bY5MDrOK
	tG6dWJWMHD+AdWS1DMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slUVz-00000000Zj0-0cz2;
	Tue, 03 Sep 2024 14:28:15 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slUTK-00000000Ybc-207l
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 14:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725373530; x=1756909530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KI8GxIrOhxgLo51/oeYq13OvikInu2s7CKSV1thf5sQ=;
  b=kNt6kquP574JuvaY4y3hClIuCCSJ7MGss7QCTCpXT05Xzjc714pJbXTE
   o6m2HBDpVnVdp6OafVwd2sEVHMTjfWhmHH2pKnAbgbqetHK6qobtoOBWT
   sDufI+cT7fexHFohMKvcBumjfTj6P6hnbdQ9KvPCz5Bjpj6/uO8wjgLG2
   /u8VuK21skb5RSnnb1EGlajWSp5ycn6+lHSCFW77YsUEzVJwDwRajNcXU
   30M6jn6QDqKQD29xbZodPXOLctpz/iWl4DT80m+I8SaTFmXECwAdYLcUa
   F8MAQ09iMIVWTyq6gY7oLxJ8MzYCaAf0ApYEQt6GKw/7NzryA5MtftpBb
   w==;
X-CSE-ConnectionGUID: dIPJS0h2TOqZKorMcfm55Q==
X-CSE-MsgGUID: aLQ43t57RU6PK5HCTWnMEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23541359"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="23541359"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 07:25:30 -0700
X-CSE-ConnectionGUID: EhBQ2FULSAaj+xHeR4r97w==
X-CSE-MsgGUID: NZ1KZ83cRfqPprAfMd6fHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65658869"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 03 Sep 2024 07:25:27 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 5/7] RISC-V: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
Date: Tue,  3 Sep 2024 17:25:04 +0300
Message-ID: <20240903142506.3444628-6-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
References: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_072530_714141_85EE3687 
X-CRM114-Status: UNSURE (   9.28  )
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

The dependency handling of the Synopsys DesignWare I2C
adapter drivers is going to be changed so that the glue
drivers for the PCI and platform buses depend on
I2C_DESIGNWARE_CORE.

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 arch/riscv/configs/defconfig                   | 1 +
 arch/riscv/configs/nommu_k210_defconfig        | 1 +
 arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 0d678325444f..a644a798f602 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -157,6 +157,7 @@ CONFIG_HW_RANDOM_VIRTIO=y
 CONFIG_HW_RANDOM_JH7110=m
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=m
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_I2C_MV64XXX=m
 CONFIG_I2C_RIIC=y
diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index af9601da4643..87ff5a1233af 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -58,6 +58,7 @@ CONFIG_I2C=y
 # CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
 # CONFIG_I2C_HELPER_AUTO is not set
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 # CONFIG_SPI_MEM is not set
diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index dd460c649152..95cbd574f291 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -50,6 +50,7 @@ CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 # CONFIG_I2C_HELPER_AUTO is not set
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
 # CONFIG_SPI_MEM is not set
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
