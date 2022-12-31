Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1755DC53210
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Jan 2023 00:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kyBgIPfH2W1blKNLv7Q5brEc6SSORYr1pM5PgDEFSf4=; b=Mh5wmi6EiH65ya
	pZbMr9b+PCySzJHRJ37T7gMqZ3kqLUmkhVuqvDxjYY44T5juBpcpWJhqKbCbdzC9ulwwxJ/HrQ9dQ
	66J6AmJJ7bM/6UBMygcHMyFTny13XOoweUrXwUwhP/24L7tD0YkQqMgo4IDFe1c6BbPa5EJm1jJWm
	opHmE6Qm912cEbEZtdGRJ0471AoItLrdK9JnNAKfhjNARtjJJO9/Rjm2ApGAP7hVyHA6t9CAkR6kW
	BwHCtFNcyuUmKV4FSbK8rwx2W5WAlBO05pFRnvxq1XtwJDI8aPRoPIc8WodWJnsmGX5iG7FBxVCjZ
	P8wydeg8Orl3eb+jeQfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBlmm-00Birm-Nz; Sun, 01 Jan 2023 00:01:08 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBlRW-00BXu7-A2; Sat, 31 Dec 2022 23:39:12 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 993755C00A4;
	Sat, 31 Dec 2022 18:39:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 31 Dec 2022 18:39:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672529949; x=1672616349; bh=QB
	0PymlUuhvD0YEuPWlz6lqlgooYVVVb1wPf8p3kU9g=; b=mF7/eLNo7cgDlxZ+OT
	3b0hSjDuhnwTM6Vc1khPmNRba3CujmGTpHRkgNs0ukg1mtnz5o02UdcCASm5yVAm
	n3z8HXo/j7jDVPa04PE/gvv4t9kRFf7KiM78hbjxJMqywabjN/CMzxwZiT5JphzQ
	nkirFuG95QZTbTarSMNwkDDahZcK0PB200T9ZsoxsraEgCn1ASqvrEax4EWhxma6
	XhVZ4x8/Fzv5TxQz5J+PRfrksKvLDxSa8SZEoJxErh0Iqwb0+Q17gsl7t615P9mY
	3V3P4Ni8fL3s3UOgvgqcAausB4LJBjqyOeCssh2w8UuC+CYPPpuH2c30vfqOh+zO
	YGhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672529949; x=1672616349; bh=QB0PymlUuhvD0
	YEuPWlz6lqlgooYVVVb1wPf8p3kU9g=; b=FIIyJOoUW9nayuLPVqGBM8h7TVd0d
	kBS8gZFZQZNPIl9J2kWazprzHhLLmbs81dNV4VkYKoCzNChaehqOp//fcwOGLXc+
	1oM+fKhBoG8dwv2IBuE3DVV0owjIdiunMFUPZaGPlieQR26mHxCddJJcE/jTLFA+
	ZjxNrqPa1mV6f3bDMQAOwZI04S+7Eok/DMlxgP7yobYgRNlCz8dzXhrEhlM+/D6C
	xLBy1GQFsSKfJocsOV+1EQ5qoM8rZrJEC8ym8esTcPnmjfrUGfvTw1HKKott0zO5
	hHi4tpLubh+cMRWOY7izszJ0z0/YdV6VPLJPeZebWEOlCWd/AdlJQ5EEg==
X-ME-Sender: <xms:HciwY7o8RMSoNJ6ghH9f9jOlqHh9LYDMN1K3FSUDCgZlQ0RjjEi23Q>
    <xme:HciwY1oTC28M4eBeQXp5dq95-zqvgEno-YhX8UIkT_a5Ktv6GjDGAvocZpcSV4hsq
    omLg0VjWHEkKXEG5w>
X-ME-Received: <xmr:HciwY4NxchW7XBMcc_RO1cXIL9rXOnZRipLFPhAju3Hqwt9i7MUzX_v4_On_JsmURaMssELxlJ_6iIPHk86mkZ7BKLqax5ILRKtAHe4QWiw9clPWdtDMW_DJRjUWADb8xgFu9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieelgddufecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:HciwY-5yXXf028YOkGx8sSm1ccPHaEVHhz5tvvQuqY3y6b4hNNwY2Q>
    <xmx:HciwY66Ht1s_WXHNYqrGEH605AFuGkpyQQWaRH43T4Z5ALjzJYBGbQ>
    <xmx:HciwY2i1WWrgHRJzU2ea1ljYs1PTx1es22Hbig76qvAydXeqfeeyaA>
    <xmx:HciwY_NbLUPxa5JUnz8MWG_3OAUB5LuP8wrY86TAlUiYdBvpm3BmKQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 18:39:08 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v4 12/12] riscv: defconfig: Enable the Allwinner D1 platform and drivers
Date: Sat, 31 Dec 2022 17:38:51 -0600
Message-Id: <20221231233851.24923-13-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221231233851.24923-1-samuel@sholland.org>
References: <20221231233851.24923-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_153910_586546_C14C8A12 
X-CRM114-Status: UNSURE (   9.61  )
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

Now that several D1-based boards are supported, enable the platform in
our defconfig. Build in the drivers which are necessary to boot, such as
the pinctrl, MMC, RTC (which provides critical clocks), SPI (for flash),
and watchdog (which may be left enabled by the bootloader). Other common
onboard peripherals are enabled as modules.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v4:
 - Rebase on v6.2-rc1 + soc2arch-immutable

 arch/riscv/configs/defconfig | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 128dcf4c0814..d98d6e90b2b8 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -29,6 +29,7 @@ CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_STARFIVE=y
+CONFIG_ARCH_SUNXI=y
 CONFIG_SOC_VIRT=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
@@ -120,8 +121,10 @@ CONFIG_VIRTIO_NET=y
 CONFIG_MACB=y
 CONFIG_E1000E=y
 CONFIG_R8169=y
+CONFIG_STMMAC_ETH=m
 CONFIG_MICROSEMI_PHY=y
 CONFIG_INPUT_MOUSEDEV=y
+CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
@@ -130,14 +133,20 @@ CONFIG_SERIAL_SH_SCI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_I2C_MV64XXX=m
 CONFIG_SPI=y
 CONFIG_SPI_SIFIVE=y
+CONFIG_SPI_SUN6I=y
 # CONFIG_PTP_1588_CLOCK is not set
-CONFIG_GPIOLIB=y
 CONFIG_GPIO_SIFIVE=y
+CONFIG_WATCHDOG=y
+CONFIG_SUNXI_WATCHDOG=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
 CONFIG_DRM_NOUVEAU=m
+CONFIG_DRM_SUN4I=m
 CONFIG_DRM_VIRTIO_GPU=m
 CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
@@ -150,21 +159,32 @@ CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_UAS=y
+CONFIG_USB_MUSB_HDRC=m
+CONFIG_USB_MUSB_SUNXI=m
+CONFIG_NOP_USB_XCEIV=m
 CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC_SPI=y
+CONFIG_MMC_SUNXI=y
 CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_SUN6I=y
+CONFIG_DMADEVICES=y
+CONFIG_DMA_SUN6I=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
+CONFIG_SUN8I_DE2_CCU=m
+CONFIG_SUN50I_IOMMU=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_ARCH_R9A07G043=y
+CONFIG_PHY_SUN4I_USB=m
 CONFIG_LIBNVDIMM=y
+CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_EXT4_FS_SECURITY=y
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
