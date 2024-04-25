Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19970C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 10:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=XMXgLc0OOsI2QCw8ERHwqoHeKxzGLZIL4p8vXZ2+3dU=; b=zV6Gz5IoNc9D6r
	HHi8buND4+GkQsZWShTvSfGomvlU8zwD9MedUe4wsQJjQ1M7GLMTycqZqWuLOIdQeFuSmaA8AAKe2
	mQr0aLuucEyTJzEJ049TgcwOjTTAz99Y/eI9hKHFvmNJUOgpmQ88xz4sU62xkxhozzK2ciVR07Xzr
	uDa811MlIMOn4LU2a0Yztae0QAz+uJDahQmHuxAnONMlMMwTE6zsbeT0t9yS4DUESqx22s6vBF3Qz
	nObYL7XfnuZfC8wF5OgpwZlPhGE5v+Ipwio9+zNOTO2ltv9XszNwTyz6WgAS8npbNUDos/fJGhEmq
	IAThsm60eJ7H/ZHATsoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzw3l-00000007m2M-1xk4;
	Thu, 25 Apr 2024 10:10:33 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzw3h-00000007m0i-0F05
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 10:10:31 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240425101017euoutp028d6c5f9c31844584b6bf9251c2f9fea4~JfiIMxcDL0959909599euoutp02J
	for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2024 10:10:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240425101017euoutp028d6c5f9c31844584b6bf9251c2f9fea4~JfiIMxcDL0959909599euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1714039817;
	bh=s64QxvFoZJ0DSQGtSmxzMMmywT2FDcW0C9/wAS5/lr8=;
	h=From:To:Cc:Subject:Date:References:From;
	b=UM88aM0MF9ED5S404YmCk4EUJfbuZn8HAMjRdxZFD1n6SNWKSm8+0ixULE6viL7kJ
	 SiMi11G+Kv1Je/lY+qdviRaqkl7OsokJJLTAUJ3Lbqh1fd5qu2E4tThWGvOy4hMtDE
	 CUuWP6PmozmkuiTxQQGZnVIDxjT9uWDSx2Oh2Iok=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240425101017eucas1p2ee3076183311b993d74f14d95beb251b~JfiH4zRUi1362613626eucas1p28;
	Thu, 25 Apr 2024 10:10:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id BE.AA.09620.90C2A266; Thu, 25
	Apr 2024 11:10:17 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240425101017eucas1p10f79f6e47e4c0a8e8083607a075767e0~JfiHe5MZN0744107441eucas1p17;
	Thu, 25 Apr 2024 10:10:17 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240425101017eusmtrp1dedbb2b5d1d168042ce9a86b8138c591~JfiHeXmb91472714727eusmtrp19;
	Thu, 25 Apr 2024 10:10:17 +0000 (GMT)
X-AuditID: cbfec7f5-d31ff70000002594-92-662a2c09de7e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id D7.D5.08810.80C2A266; Thu, 25
	Apr 2024 11:10:17 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240425101016eusmtip292425544993afe4754729d933e309a21~JfiHDC8FY0292602926eusmtip2h;
	Thu, 25 Apr 2024 10:10:16 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-riscv@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Emil Renner Berthing
	<kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] riscv: defconfig: enable drivers for Starfive VisionFive2
 board
Date: Thu, 25 Apr 2024 12:10:03 +0200
Message-Id: <20240425101003.1149068-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAKsWRmVeSWpSXmKPExsWy7djP87qcOlppBj+nyVhs/T2L3eLJmpmM
	Fts+t7BZrD1yl93i5eUeZou2WfwObB5vXr5k8Tjc8YXdo6PvH4vH5iX1Hn1bVjF6XGq+zh7A
	FsVlk5Kak1mWWqRvl8CVsXmeSMF7qYoLKzezNzA+FO9i5OSQEDCRWNm1namLkYtDSGAFo8Sr
	g3MZIZwvjBKLNmxmhXA+M0qcmDKFEaZl34yrbBCJ5YwSz28sYYdr+bhgCwtIFZuAoUTX2y6g
	Kg4OEQFlifn3XEFqmAXOMkq0bd3IDlIjLBAk8ezuXrCpLAKqElPWrAKL8wrYSzz5f4IZYpu8
	xP6DZ5kh4oISJ2c+AZvPDBRv3jqbGWSohMBcDonOReuYQJZJCLhIzL+WBNErLPHq+BZ2CFtG
	4vTkHhaI+nZGiQW/7zNBOBMYJRqe34L6zVrizrlfYFczC2hKrN+lDxF2lLj3YzrUfD6JG28F
	IW7gk5i0bTozRJhXoqNNCKJaTWLW8XVwaw9euAT1iofE4guNTCC2kECsxJNzlxgnMCrMQvLZ
	LCSfzUK4YQEj8ypG8dTS4tz01GLjvNRyveLE3OLSvHS95PzcTYzARHP63/GvOxhXvPqod4iR
	iYPxEKMEB7OSCO/NjxppQrwpiZVVqUX58UWlOanFhxilOViUxHlVU+RThQTSE0tSs1NTC1KL
	YLJMHJxSDUwrdFLK/p8z3csRGzi1RO5H4awU3wl+hgfP/+lJOTRzKXd2COcf9//XLjfI9htp
	8Hv7B+y7e1GXnePxdJ5jQlrTzl5RqnjepDKv6fk0MfZpqqcffnv0RcJD8dlZnmPO93wuLVB6
	kWJ8g+HHmZQ4Bofd6988aeT/UrSyp7W2apZws/YdwUUHGk4m9Pgvkt2eU8mSbvlf5lsSs3/f
	iWc//x97bsU4171umZy90ZvK7YyK18QuTv7TtFNp5xkvx99s4hGyuYHSYfobL+T90PZokWm6
	aXhdkL2scvuDDWu4/5xc+/eDRvjPzQFTZ7mvZFa7vTvHedMGhfal/ovu86XfcXeaN2Gm9bGd
	bYxPtcp7v01XYinOSDTUYi4qTgQAQgohZqMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGLMWRmVeSWpSXmKPExsVy+t/xe7qcOlppBi9+MVls/T2L3eLJmpmM
	Fts+t7BZrD1yl93i5eUeZou2WfwObB5vXr5k8Tjc8YXdo6PvH4vH5iX1Hn1bVjF6XGq+zh7A
	FqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXsXme
	SMF7qYoLKzezNzA+FO9i5OSQEDCR2DfjKlsXIxeHkMBSRon5zS2MEAkZiZPTGlghbGGJP9e6
	oIo+MUo8/XWGGSTBJmAo0fUWJMHBISKgLDH/nitIDbPARUaJXdtbmEBqhAUCJA7uvA82iEVA
	VWLKmlXsIDavgL3Ek/8nmCEWyEvsP3iWGSIuKHFy5hMWEJsZKN68dTbzBEa+WUhSs5CkFjAy
	rWIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAgM8G3Hfm7ewTjv1Ue9Q4xMHIyHGCU4mJVEeG9+
	1EgT4k1JrKxKLcqPLyrNSS0+xGgKdN9EZinR5HxgjOWVxBuaGZgamphZGphamhkrifN6FnQk
	CgmkJ5akZqemFqQWwfQxcXBKNTDN+z7ZKaTYyzjUxHm+9vWpG7yZ26qjgsU1P7PFl6UeOly0
	Pn/XaYeSR4HsnIYT9m5ZfvWRqGZuJutp5s87Jn6y/xpU9vP2K+P7zV8sNf0L70z5JZnD/6xU
	6crCpLyV6m4qs1Z/vS6070hIY8DrM4aJZ34/LihdfvPAGnWPgt5zl05aP1x6fmWZauQ+j32S
	b3JWN01wCmj+9ngTa5vRaWXB6K+3RVr0U3IqtR82fA3zcnjo3WdQs8fWTpjbletm6H4Vs5c1
	OmyZTwP5+79H3svLqPDcyLJj0uyi33yfP1pUlTL7v2/Y88Qk52GhJ+OeF8p1O+UtWo+eKBN3
	UE2fxs3SwTApwe5uzO9dLi+3eymxFGckGmoxFxUnAgAo9Ilj+QIAAA==
X-CMS-MailID: 20240425101017eucas1p10f79f6e47e4c0a8e8083607a075767e0
X-Msg-Generator: CA
X-RootMTR: 20240425101017eucas1p10f79f6e47e4c0a8e8083607a075767e0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240425101017eucas1p10f79f6e47e4c0a8e8083607a075767e0
References: <CGME20240425101017eucas1p10f79f6e47e4c0a8e8083607a075767e0@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_031029_772859_C0E8A387 
X-CRM114-Status: UNSURE (   9.63  )
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

Enable all drivers needed for Starfive VisionFive2 board to increase
build and test coverage. Most drivers can be enabled as modules to avoid
bloating the main kernel image.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/riscv/configs/defconfig | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 3cae018f9315..effa22bc2884 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -146,6 +146,8 @@ CONFIG_MICROSEMI_PHY=y
 CONFIG_CAN_RCAR_CANFD=m
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_KEYBOARD_SUN4I_LRADC=m
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_AXP20X_PEK=m
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
@@ -157,21 +159,31 @@ CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
 CONFIG_I2C_CHARDEV=m
 CONFIG_I2C_MV64XXX=m
+CONFIG_I2C=y
 CONFIG_I2C_RIIC=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_SPI=y
+CONFIG_SPI_PL022=y
 CONFIG_SPI_RSPI=m
 CONFIG_SPI_SIFIVE=y
 CONFIG_SPI_SUN6I=y
+CONFIG_SPI_SPIDEV=m
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_GPIO_SIFIVE=y
+CONFIG_CHARGER_AXP20X=m
+CONFIG_BATTERY_AXP20X=m
+CONFIG_AXP20X_POWER=m
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
 CONFIG_RZG2L_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_SUNXI_WATCHDOG=y
+CONFIG_MFD_AXP20X_I2C=y
 CONFIG_RENESAS_RZG2LWDT=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
@@ -185,7 +197,13 @@ CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_RZ=m
 CONFIG_SND_SOC_WM8978=m
+CONFIG_SND_SOC_STARFIVE=m
+CONFIG_SND_SOC_JH7110_PWMDAC=m
+CONFIG_SND_SOC_JH7110_TDM=m
 CONFIG_SND_SIMPLE_CARD=m
+CONFIG_SND_AUDIO_GRAPH_CARD=m
+CONFIG_SND_AUDIO_GRAPH_CARD2=m
+CONFIG_I2C_HID=m
 CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
@@ -199,10 +217,16 @@ CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
 CONFIG_USB_MUSB_HDRC=m
 CONFIG_USB_MUSB_SUNXI=m
+CONFIG_USB_CDNS_SUPPORT=m
+CONFIG_USB_CDNS3=m
+CONFIG_USB_CDNS3_GADGET=y
+CONFIG_USB_CDNS3_STARFIVE=m
 CONFIG_NOP_USB_XCEIV=m
 CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m
 CONFIG_USB_CONFIGFS=m
+CONFIG_USB_CDNS2_UDC=m
+CONFIG_USB_ETH=m
 CONFIG_USB_CONFIGFS_SERIAL=y
 CONFIG_USB_CONFIGFS_ACM=y
 CONFIG_USB_CONFIGFS_OBEX=y
@@ -223,18 +247,24 @@ CONFIG_MMC_DW=y
 CONFIG_MMC_DW_STARFIVE=y
 CONFIG_MMC_SDHI=y
 CONFIG_MMC_SUNXI=y
+CONFIG_MMC_DW=y
+CONFIG_MMC_DW_STARFIVE=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
 CONFIG_RZ_DMAC=y
+CONFIG_DW_AXI_DMAC=y
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_RENESAS_OSTM=y
 CONFIG_SUN8I_DE2_CCU=m
+CONFIG_CLK_STARFIVE_JH7100_AUDIO=y
+CONFIG_CLK_STARFIVE_JH7110_AON=y
+CONFIG_CLK_STARFIVE_JH7110_STG=y
 CONFIG_SUN50I_IOMMU=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
@@ -242,9 +272,13 @@ CONFIG_RPMSG_VIRTIO=y
 CONFIG_ARCH_R9A07G043=y
 CONFIG_IIO=y
 CONFIG_RZG2L_ADC=m
+CONFIG_AXP20X_ADC=m
 CONFIG_RESET_RZG2L_USBPHY_CTRL=y
 CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_RCAR_GEN3_USB2=y
+CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
+CONFIG_PHY_STARFIVE_JH7110_PCIE=m
+CONFIG_PHY_STARFIVE_JH7110_USB=m
 CONFIG_LIBNVDIMM=y
 CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_EXT4_FS=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
