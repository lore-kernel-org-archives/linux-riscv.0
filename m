Return-Path: <SRS0=06uo=ND=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0C8C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 08:18:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F2F260F11
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 08:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F2F260F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HPhcCS1zfiY/yyVr+BnNgP4xVCGR6SSV3d2yWjtY83I=; b=UGTSU5RUuIT9K0
	Y9bEwhU2+G0AQ9pkk9kvyX6UAoXBmg/i21362HI6T8d4VcqWh6Z9nwp7sNznZxoRtKNtf/04fg50s
	M8a6qHTbO4x4fSLxpcg3wCvqap7uT996t/aySMZzIYc3j45OaWFvFw+yrMVgsJqGijgbgtHSrTH2y
	1hP9j58+JHHzdbyM8UK2H6hBDsSaSGqBqv1bilM2jJShwIFqfqG/OSedHyfIRLJbn98ooVWzWctR8
	W7s0+zlpBofMhMMH7DL38UKAmpaIQbVs8QOyIjfFPtNRP/ycLXSBlEp+wXFWgqu5Id+QPmTa5zNTU
	kwONXUpSKxB8lrdd8O/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE5v0-0096mE-6W; Thu, 12 Aug 2021 08:18:26 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE5na-0093zM-QN
 for linux-riscv@lists.infradead.org; Thu, 12 Aug 2021 08:10:50 +0000
Received: from workstation5.fritz.box
 (ip-88-152-144-157.hsi03.unitymediagroup.de [88.152.144.157])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 4C3FC3F240; 
 Thu, 12 Aug 2021 08:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628755838;
 bh=EVzl+nut4bcCX4uigrUTJ8PnzdgozJvsOugMGWOarh8=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=RpUcynQ/uhI+tBDZ4s/P0rbesGuim7FygsP8r/TOViYJr8beCNljLnsZey0yg7Dep
 wNBpNn3oza789LS2SZUJKuD3c3FniGaM1UieBIucuXT40bKdhpw9WPEcqnC9Mx+jWS
 q8kMF05AHSHvRBqDzM1C4qgZ23ySxvTtgw5O+0UXgDkNA/UOk9Qw4tHY0aWhvCqJkb
 pjYQn/syH9TVVN7G5EGTtMdlgM/gjb4n/KDl26kSynadyzi/S1IWVDQBPHeclU5zY7
 lTuMvHbMrb2oVBJUskyBQsGtkNb39bRd2EGiX0tmCzKYY6IbjotNsQkxG9Ak/tutre
 kThagDumEYb4w==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ard Biesheuvel <ardb@kernel.org>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/2] riscv: defconfig: enable BLK_DEV_NVME
Date: Thu, 12 Aug 2021 10:10:26 +0200
Message-Id: <20210812081027.9242-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_011047_054005_F31673A0 
X-CRM114-Status: UNSURE (   7.29  )
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

NVMe is a non-volatile storage media attached via PCIe.
As NVMe has much higher throughput than other block devices like
SATA it is a must have for RISC-V. Enable CONFIG_BLK_DEV_NVME.

The HiFive Unmatched is a board providing M.2 slots for NVMe drives.
Enable CONFIG_PCIE_FU740.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
resent on Palmer's request due to non-matching e-mail addresses
https://lore.kernel.org/linux-riscv/20210726112511.78350-1-xypron.glpk@gmx.de/
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 1f2be234b11c..393bf3843e5c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -39,10 +39,12 @@ CONFIG_PCI=y
 CONFIG_PCIEPORTBUS=y
 CONFIG_PCI_HOST_GENERIC=y
 CONFIG_PCIE_XILINX=y
+CONFIG_PCIE_FU740=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_NVME=m
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
 CONFIG_SCSI_VIRTIO=y
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
