Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD866E71D3F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 14:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JIMLpnNzrLPdsC4Ka4EYNvWctQAVT54y/e3H4n1Bc0=; b=fHkhHpbVcsZrPtmJA6uI4FImXC
	fHBptIUzO3D1ulkD5fZEzDhVxPw+hwkiKSGFqnMsYFiuwWl97lbHfNWCctlc+dvunr6WFGdIktoYD
	SFcV2A7UHEflJ45Jt+2lwP8TOn44dCLKNGZjFKtal6wlCjr9nfolDudZkiZ6Bqd9aZQkL3sljO0zA
	3epGY4RDuuYCnuD5lQIYMMjh1mz59pQaZoilRDf2W4TGlB3NPdzErM+HzMjBOTbteLM1YnhRGNqgT
	uv+3sjhcYHFqYEgdwvZ4iTqO7zvo8bcfdhgobjJXg9TIIW27es8jUs8ocX86HsH1f2Eqm9wbAf/vx
	9BqHgO7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmEGI-0082Hg-2O;
	Fri, 29 Sep 2023 14:14:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmEGE-0082Gl-2H
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 14:14:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7056CB81E9D;
	Fri, 29 Sep 2023 14:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC54C433C7;
	Fri, 29 Sep 2023 14:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695996864;
	bh=ssgQ4DcrH/d/Y+jEvzsOmpDXmXsE5fRXbAXnRqgGFOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=npMVbxDWkXnJ0AZ/ihiW4E4CWPHnPma+H6SHej/md4QeFTyyQggNcuIOyDV1WNlgz
	 csrzjxvpjOpM9/JsOvKMP0xu3u9dxELMt5Ez4gBczCJVYXX/1ZORK/tPa/+AD8n2i+
	 TUDS7ebJGzZAQysn6kimS8sJD60t5KRICZppv9vbRLM/Gc5hhJtpccDWe6mCJyCaKb
	 k/KgGwSFbSgumJm4sb4PioBzGesH2+4a77bkAUMI3CGv1eDuldkxNNPkdSqpkL6unX
	 1KaUj0QfaaNcpOSWU29N6GdQQjdfNsiBxaaHwigXE2HF8LWjXMLGJtNaEZoC4Rmvop
	 Nt/LpVSXKNfew==
Date: Fri, 29 Sep 2023 15:14:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 5/5] riscv: configs: defconfig: Enable configs required
 for RZ/Five SoC
Message-ID: <20230929-professed-imperfect-4b2ed9073e04@spud>
References: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230929000704.53217-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20230929000704.53217-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_071431_006709_E05262AA 
X-CRM114-Status: GOOD (  17.53  )
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
Content-Type: multipart/mixed; boundary="===============9223055968511960290=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9223055968511960290==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZzHljyrsO//eh7DR"
Content-Disposition: inline


--ZzHljyrsO//eh7DR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2023 at 01:07:04AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Enable the configs required by the below IP blocks which are
> present on RZ/Five SoC:
> * ADC
> * CANFD
> * DMAC
> * eMMC/SDHI
> * OSTM
> * RAVB (+ Micrel PHY)
> * RIIC
> * RSPI
> * SSI (Sound+WM8978 codec)
> * Thermal
> * USB (PHY/RESET/OTG)
>=20
> Along with the above some core configs are enabled too,
> -> CPU frequency scaling as RZ/Five does support this.
> -> MTD is enabled as RSPI can be connected to flash chips
> -> Enabled I2C chardev so that it enables userspace to read/write
>    i2c devices (similar to arm64)
> -> Thermal configs as RZ/Five SoC does have thermal unit
> -> GPIO regulator as we might have IP blocks for which voltage
>    levels are controlled by GPIOs

You might or you do?

Either way, this stuff seems fine to me /shrug

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> -> OTG configs as RZ/Five USB can support host/function
> -> Gadget configs so that we can test USB function (as done in arm64
>    all the gadget configs are enabled)
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/riscv/configs/defconfig | 52 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>=20
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index ab86ec3b9eab..1e81c865a271 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -36,6 +36,13 @@ CONFIG_SMP=3Dy
>  CONFIG_HOTPLUG_CPU=3Dy
>  CONFIG_PM=3Dy
>  CONFIG_CPU_IDLE=3Dy
> +CONFIG_CPU_FREQ=3Dy
> +CONFIG_CPU_FREQ_STAT=3Dy
> +CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dm
> +CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> +CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> +CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dm
> +CONFIG_CPUFREQ_DT=3Dy
>  CONFIG_VIRTUALIZATION=3Dy
>  CONFIG_KVM=3Dm
>  CONFIG_ACPI=3Dy
> @@ -94,6 +101,7 @@ CONFIG_NETLINK_DIAG=3Dy
>  CONFIG_CGROUP_NET_PRIO=3Dy
>  CONFIG_NET_9P=3Dy
>  CONFIG_NET_9P_VIRTIO=3Dy
> +CONFIG_CAN=3Dm
>  CONFIG_PCI=3Dy
>  CONFIG_PCIEPORTBUS=3Dy
>  CONFIG_PCI_HOST_GENERIC=3Dy
> @@ -101,6 +109,11 @@ CONFIG_PCIE_XILINX=3Dy
>  CONFIG_PCIE_FU740=3Dy
>  CONFIG_DEVTMPFS=3Dy
>  CONFIG_DEVTMPFS_MOUNT=3Dy
> +CONFIG_MTD=3Dy
> +CONFIG_MTD_BLOCK=3Dy
> +CONFIG_MTD_CFI=3Dy
> +CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
> +CONFIG_MTD_SPI_NOR=3Dy
>  CONFIG_BLK_DEV_LOOP=3Dy
>  CONFIG_VIRTIO_BLK=3Dy
>  CONFIG_BLK_DEV_NVME=3Dm
> @@ -123,8 +136,11 @@ CONFIG_VIRTIO_NET=3Dy
>  CONFIG_MACB=3Dy
>  CONFIG_E1000E=3Dy
>  CONFIG_R8169=3Dy
> +CONFIG_RAVB=3Dy
>  CONFIG_STMMAC_ETH=3Dm
> +CONFIG_MICREL_PHY=3Dy
>  CONFIG_MICROSEMI_PHY=3Dy
> +CONFIG_CAN_RCAR_CANFD=3Dm
>  CONFIG_INPUT_MOUSEDEV=3Dy
>  CONFIG_KEYBOARD_SUN4I_LRADC=3Dm
>  CONFIG_SERIAL_8250=3Dy
> @@ -135,16 +151,24 @@ CONFIG_SERIAL_SH_SCI=3Dy
>  CONFIG_VIRTIO_CONSOLE=3Dy
>  CONFIG_HW_RANDOM=3Dy
>  CONFIG_HW_RANDOM_VIRTIO=3Dy
> +CONFIG_I2C_CHARDEV=3Dm
>  CONFIG_I2C_MV64XXX=3Dm
> +CONFIG_I2C_RIIC=3Dy
>  CONFIG_SPI=3Dy
> +CONFIG_SPI_RSPI=3Dm
>  CONFIG_SPI_SIFIVE=3Dy
>  CONFIG_SPI_SUN6I=3Dy
>  # CONFIG_PTP_1588_CLOCK is not set
>  CONFIG_GPIO_SIFIVE=3Dy
> +CONFIG_CPU_THERMAL=3Dy
> +CONFIG_DEVFREQ_THERMAL=3Dy
> +CONFIG_RZG2L_THERMAL=3Dy
>  CONFIG_WATCHDOG=3Dy
>  CONFIG_SUNXI_WATCHDOG=3Dy
> +CONFIG_RENESAS_RZG2LWDT=3Dy
>  CONFIG_REGULATOR=3Dy
>  CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> +CONFIG_REGULATOR_GPIO=3Dy
>  CONFIG_DRM=3Dm
>  CONFIG_DRM_RADEON=3Dm
>  CONFIG_DRM_NOUVEAU=3Dm
> @@ -152,39 +176,67 @@ CONFIG_DRM_SUN4I=3Dm
>  CONFIG_DRM_VIRTIO_GPU=3Dm
>  CONFIG_FB=3Dy
>  CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> +CONFIG_SOUND=3Dy
> +CONFIG_SND=3Dy
> +CONFIG_SND_SOC=3Dy
> +CONFIG_SND_SOC_RZ=3Dm
> +CONFIG_SND_SOC_WM8978=3Dm
> +CONFIG_SND_SIMPLE_CARD=3Dm
>  CONFIG_USB=3Dy
> +CONFIG_USB_OTG=3Dy
>  CONFIG_USB_XHCI_HCD=3Dy
>  CONFIG_USB_XHCI_PLATFORM=3Dy
>  CONFIG_USB_EHCI_HCD=3Dy
>  CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
>  CONFIG_USB_OHCI_HCD=3Dy
>  CONFIG_USB_OHCI_HCD_PLATFORM=3Dy
> +CONFIG_USB_RENESAS_USBHS=3Dm
>  CONFIG_USB_STORAGE=3Dy
>  CONFIG_USB_UAS=3Dy
>  CONFIG_USB_MUSB_HDRC=3Dm
>  CONFIG_USB_MUSB_SUNXI=3Dm
>  CONFIG_NOP_USB_XCEIV=3Dm
> +CONFIG_USB_GADGET=3Dy
> +CONFIG_USB_RENESAS_USBHS_UDC=3Dm
> +CONFIG_USB_CONFIGFS=3Dm
> +CONFIG_USB_CONFIGFS_SERIAL=3Dy
> +CONFIG_USB_CONFIGFS_ACM=3Dy
> +CONFIG_USB_CONFIGFS_OBEX=3Dy
> +CONFIG_USB_CONFIGFS_NCM=3Dy
> +CONFIG_USB_CONFIGFS_ECM=3Dy
> +CONFIG_USB_CONFIGFS_ECM_SUBSET=3Dy
> +CONFIG_USB_CONFIGFS_RNDIS=3Dy
> +CONFIG_USB_CONFIGFS_EEM=3Dy
> +CONFIG_USB_CONFIGFS_MASS_STORAGE=3Dy
> +CONFIG_USB_CONFIGFS_F_FS=3Dy
>  CONFIG_MMC=3Dy
>  CONFIG_MMC_SDHCI=3Dy
>  CONFIG_MMC_SDHCI_PLTFM=3Dy
>  CONFIG_MMC_SDHCI_CADENCE=3Dy
>  CONFIG_MMC_SPI=3Dy
> +CONFIG_MMC_SDHI=3Dy
>  CONFIG_MMC_SUNXI=3Dy
>  CONFIG_RTC_CLASS=3Dy
>  CONFIG_RTC_DRV_SUN6I=3Dy
>  CONFIG_DMADEVICES=3Dy
>  CONFIG_DMA_SUN6I=3Dm
> +CONFIG_RZ_DMAC=3Dy
>  CONFIG_VIRTIO_PCI=3Dy
>  CONFIG_VIRTIO_BALLOON=3Dy
>  CONFIG_VIRTIO_INPUT=3Dy
>  CONFIG_VIRTIO_MMIO=3Dy
> +CONFIG_RENESAS_OSTM=3Dy
>  CONFIG_SUN8I_DE2_CCU=3Dm
>  CONFIG_SUN50I_IOMMU=3Dy
>  CONFIG_RPMSG_CHAR=3Dy
>  CONFIG_RPMSG_CTRL=3Dy
>  CONFIG_RPMSG_VIRTIO=3Dy
>  CONFIG_ARCH_R9A07G043=3Dy
> +CONFIG_IIO=3Dy
> +CONFIG_RZG2L_ADC=3Dm
> +CONFIG_RESET_RZG2L_USBPHY_CTRL=3Dy
>  CONFIG_PHY_SUN4I_USB=3Dm
> +CONFIG_PHY_RCAR_GEN3_USB2=3Dy
>  CONFIG_LIBNVDIMM=3Dy
>  CONFIG_NVMEM_SUNXI_SID=3Dy
>  CONFIG_EXT4_FS=3Dy
> --=20
> 2.34.1
>=20

--ZzHljyrsO//eh7DR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRbbuwAKCRB4tDGHoIJi
0oUWAQDEFgrLqWHwmNtRPP3fdgf0qPAGTqG2pKoks0K/CtjkIAD/RGWbDhSN0ofN
oXGkFKzf1k0ZLIum+eG+buAIwWjeTwc=
=p1UH
-----END PGP SIGNATURE-----

--ZzHljyrsO//eh7DR--


--===============9223055968511960290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9223055968511960290==--

