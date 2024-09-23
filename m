Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF98CF9C5B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Sep 2024 05:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:Mime-Version:To:Message-Id:Subject
	:Cc:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=02rYlEoOmqBvEsV29IncW0ZtkTK9HHmdbR385y/9P38=; b=AkZJjcR29s5JB2
	U8PpTcVBq/lxX7rb/RZWGipP7M5ApaSUvh6ubyOG/OZrCCgkZKThLYi9Fcb+la8C8+HwwhvXC62ia
	4Hq9UKq0xr51w+94IusoDG+ZVcs1KHdRKrTyWImWkQXnw1tnSv2IyL3m/D1HnOsnYoGhnMaaBdvW7
	mlUqB/e6YGpIV6Ry4Z3236+B1fC0aMKlAma8aa2cb5D9WMP4MZduk2ywTCXrrghd20Wy4zjqgpB0z
	z6/Czccjkku0Wl1Zskn6L1C84w/YTIm6Ns3DVJMM+2EWNcaeIVRQyfs3fMNFhkC8JG/U+m3yXwH+4
	YZFl1oLcIOWlOU4P9e0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssbmb-0000000GLnx-2PNm;
	Mon, 23 Sep 2024 05:38:49 +0000
Received: from va-2-11.ptr.blmpb.com ([209.127.231.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssbmY-0000000GLnS-1i7B
	for linux-riscv@lists.infradead.org;
	Mon, 23 Sep 2024 05:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1727069921;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=rm+jLD7LmwpSNEJzIkH2zPuhNPjw332z9klR4q5Peis=;
 b=WvK9YwamhENJOAv9wEI12+iDQ1UgArwnp5CO04Qt9o6UJsqUi/sNh1nhiKiJ3kN2EpCfgI
 PacPtqloPnQThRSjkRefpPt/p0FeBrU51WNR7fU89GjH9r1flDheeWITpLW6VfK83Ug0DX
 9ruw1Z63Thp8sOb3Na6u1bCgYWMV7ABR//pT765TfIHmwiQNj4K3qkjvH57emWiANeM0q/
 U2lLJAj2D+zHGil8HBHnrH3UfPRz4A6UU5YZPnv4AElxEU671YEzedpa3U3gWu3XgIZavG
 35iouyzQfPMD7FU4l/287gVG1wP4N3kPseFBzwe5zOBXWYgWEL6YorAtMNrKLA==
Date: Mon, 23 Sep 2024 13:38:06 +0800
X-Lms-Return-Path: <lba+266f0fee0+237347+lists.infradead.org+sandie.cao@deepcomputing.io>
Received: from roma-MacBookPro.. ([61.141.249.188]) by smtp.feishu.cn with ESMTPS; Mon, 23 Sep 2024 13:38:39 +0800
Cc: "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>, 
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH 2/2] riscv:configs:starfive:add framework config
Message-Id: <20240923053806.1586080-1-sandie.cao@deepcomputing.io>
To: "Emil Renner Berthing" <kernel@esmil.dk>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240922_223846_576148_6D72D421 
X-CRM114-Status: UNSURE (   9.93  )
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

Add config to support RISC-V Framework Laptop 13 Mainboard. 

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../starfive_jh7110_framework_defconfig       | 151 ++++++++++++++++++
 1 file changed, 151 insertions(+)
 create mode 100644 arch/riscv/configs/starfive_jh7110_framework_defconfig

diff --git a/arch/riscv/configs/starfive_jh7110_framework_defconfig b/arch/riscv/configs/starfive_jh7110_framework_defconfig
new file mode 100644
index 000000000000..512ac09184b7
--- /dev/null
+++ b/arch/riscv/configs/starfive_jh7110_framework_defconfig
@@ -0,0 +1,151 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_CGROUPS=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_CGROUP_BPF=y
+CONFIG_NAMESPACES=y
+CONFIG_USER_NS=y
+CONFIG_CHECKPOINT_RESTORE=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_EXPERT=y
+# CONFIG_SYSFS_SYSCALL is not set
+CONFIG_ARCH_STARFIVE=y
+CONFIG_SOC_STARFIVE=y
+CONFIG_SOC_STARFIVE_JH7110=y
+CONFIG_SMP=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+CONFIG_NETFILTER=y
+CONFIG_NET_9P=y
+CONFIG_NET_9P_VIRTIO=y
+CONFIG_PCI=y
+CONFIG_PCIE_STARFIVE_HOST=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_SPI_NOR=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_SATA_AHCI=y
+CONFIG_MD=y
+CONFIG_BLK_DEV_DM=m
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_R8169=y
+CONFIG_STMMAC_ETH=y
+CONFIG_DWMAC_DWC_QOS_ETH=y
+CONFIG_DWMAC_STARFIVE=y
+CONFIG_MICREL_PHY=y
+CONFIG_MOTORCOMM_PHY=y
+CONFIG_INPUT_MOUSEDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_DW=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM=y
+CONFIG_HW_RANDOM_JH7110=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_DESIGNWARE_PLATFORM=y
+CONFIG_SPI=y
+CONFIG_SPI_PL022=m
+CONFIG_POWER_RESET_GPIO_RESTART=y
+CONFIG_CPU_THERMAL=y
+CONFIG_WATCHDOG=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_AXP20X=y
+CONFIG_REGULATOR_GPIO=y
+CONFIG_FB=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_SOC=y
+CONFIG_SND_DESIGNWARE_I2S=m
+CONFIG_SND_SOC_STARFIVE=m
+CONFIG_SND_SOC_JH7110_PWMDAC=m
+CONFIG_SND_SOC_JH7110_TDM=m
+CONFIG_SND_SIMPLE_CARD=m
+CONFIG_I2C_HID_OF=y
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_UAS=y
+CONFIG_USB_CDNS_SUPPORT=y
+CONFIG_USB_CDNS3=y
+CONFIG_USB_CDNS3_GADGET=y
+CONFIG_USB_CDNS3_HOST=y
+CONFIG_USB_CDNS3_STARFIVE=y
+CONFIG_USB_CONFIGFS=y
+CONFIG_USB_CONFIGFS_MASS_STORAGE=y
+CONFIG_USB_CONFIGFS_F_FS=y
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_OF_DWCMSHC=y
+CONFIG_MMC_SPI=y
+CONFIG_MMC_SDHI=y
+CONFIG_MMC_DW=y
+CONFIG_MMC_DW_STARFIVE=y
+CONFIG_RTC_CLASS=y
+CONFIG_DMADEVICES=y
+CONFIG_DW_AXI_DMAC=y
+CONFIG_RPMSG_CHAR=y
+CONFIG_RPMSG_VIRTIO=y
+CONFIG_JH71XX_PMU=y
+CONFIG_CLK_STARFIVE_JH7110_PLL=y
+CONFIG_CLK_STARFIVE_JH7110_SYS=y
+CONFIG_CLK_STARFIVE_JH7110_AON=y
+CONFIG_CLK_STARFIVE_JH7110_STG=y
+CONFIG_CLK_STARFIVE_JH7110_ISP=y
+CONFIG_CLK_STARFIVE_JH7110_VOUT=y
+CONFIG_PINCTRL_STARFIVE_JH7110_SYS=y
+CONFIG_STARFIVE_WATCHDOG=y
+CONFIG_RESET_STARFIVE_JH7110=y
+CONFIG_STARFIVE_STARLINK_PMU=y
+CONFIG_DWC_PCIE_PMU=y
+CONFIG_IIO=y
+CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=y
+CONFIG_PHY_STARFIVE_JH7110_PCIE=y
+CONFIG_PHY_STARFIVE_JH7110_USB=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_AUTOFS_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_HUGETLBFS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V4=y
+CONFIG_NFS_V4_1=y
+CONFIG_NFS_V4_2=y
+CONFIG_ROOT_NFS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_CRYPTO_USER_API_HASH=y
+CONFIG_CRYPTO_DEV_VIRTIO=y
+CONFIG_PRINTK_TIME=y
+CONFIG_DEBUG_FS=y
+# CONFIG_RCU_TRACE is not set
+# CONFIG_FTRACE is not set
+# CONFIG_RUNTIME_TESTING_MENU is not set
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
