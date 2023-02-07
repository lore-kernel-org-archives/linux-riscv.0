Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E490C636CC
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 18:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PV3O85Wyvwex397iPoK3g2WaEk/x64FPUyJWTkj7Nk4=; b=sa0adUNgOtxSUFvlCbKcm2Y3jW
	r/jNrev4klaso1cvFEFf95lnC5VJU8+en8w7KkqSzWecFfK3SHTNLKhPoYZNRYxFLfW0MGh9NR3sL
	u4UCi/V4xJaJ7L6rDnBQNOi8/GdNNbBF6cR/iaMsba7rs81L9MXJfWjt7ErM68qKRIdvjzW+wXHbH
	i+jcwsmlRm/R8FZ0VKXaEB+tv3bV6BBxR1hpnZ5JTbrF0FR7Qlu3uvLAhhJyd5hFSElqFavtZuRfN
	e12typ/7QY1RlBY1t9Qz4OJ6991rYvhXbim9a/2ROTW4PyZcTvwe6rw8azIdu9r3fi80LBuVdNKYv
	cPr+v+uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPSx9-00D7lv-Ma; Tue, 07 Feb 2023 18:44:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPSx6-00D7kh-5Q
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 18:44:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83789610D5;
	Tue,  7 Feb 2023 18:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA75C433EF;
	Tue,  7 Feb 2023 18:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675795462;
	bh=RaD8bOb2fte5qBe2JPxiOX9a3nwNRlSBAu75aieyJBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPfly4QymoPJqqYUJBd3OTt/+C5rQ5OT4HODlrCRp4bNyv+h6vrIxXngGEC/d4kZI
	 lU2FD6isJPRCxtJ4YwuxsbADO8KuZTimWt5hJj/D4Msj85nS8lbXmpWN3rBVB7+OoG
	 sWU6XCoZXWLS8GyHUdNfj2MXLeJZtfotVJojAY3rBiIwZU4h08+FfNXDNdWXr2Y023
	 pdnSQ8/JReHKySMun53eADNPsIpxEpUUDDRv5XuWUVbRIBmdijlephs32wKD3khgTo
	 z8jCHMMeB4/gaq8j2X25YBihc2iWO0UQdKvrAppY3cmYGpaO6pwfR47YDxY/v1HPK9
	 O4kNshwCy3ayA==
Date: Tue, 7 Feb 2023 18:44:18 +0000
From: Conor Dooley <conor@kernel.org>
To: guoren@kernel.org
Cc: palmer@rivosinc.com, arnd@arndb.de, atishp@rivosinc.com,
	rdunlap@infradead.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: Cleanup rv32_defconfig
Message-ID: <Y+KcAiEV5iTG3SyX@spud>
References: <20230205133307.1058814-1-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230205133307.1058814-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_104424_310339_9FADD0EB 
X-CRM114-Status: GOOD (  22.78  )
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
Content-Type: multipart/mixed; boundary="===============4616447087308770083=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4616447087308770083==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gTE+h999HcA9Enua"
Content-Disposition: inline


--gTE+h999HcA9Enua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 05, 2023 at 08:33:07AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> Subject: riscv: Cleanup rv32_defconfig

s/cleanup/remove redundant/, cleanup implies that you're doing some
rework of the file IMO.

> Remove the unused rv32_defconfig file,

What do you mean by "unused"? (don't answer now, read on)

> which has been replaced by
> 'commit 72f045d19f25 ("riscv: Fixup difference with defconfig")'.

Replaced how? One shouldn't have to go look up that commit to see what
"replaced" means. Certainly from the subject it is not immediately
obvious what that commit actually does.

How about:
"Remove the rv32_defconfig file, which has been made redundant by commit
112233445566 ("blah") which introduced an rv32_defconfig .PHONY target,
that is prioritised over the file itself."

I would argue that there is still value in having an off-the-shelf 32-bit
config for people to base things on though, and being ignored by the
make target does not make it "unused" IMO.

I did check the before/after of running the make target, so:
Tested-by: Conor Dooley <conor.dooley@microchip.com>
Although, as you are probably aware, there are significant differences
between the .config generated by the file and by the rv32_defconfig make
target!

Cheers,
Conor.

> Also,
> remove CONFIG_32BIT in 32-bit.config, which CONFIG_ARCH_RV32I has
> selected.
>=20
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/configs/32-bit.config  |   2 -
>  arch/riscv/configs/rv32_defconfig | 139 ------------------------------
>  2 files changed, 141 deletions(-)
>  delete mode 100644 arch/riscv/configs/rv32_defconfig
>=20
> diff --git a/arch/riscv/configs/32-bit.config b/arch/riscv/configs/32-bit=
=2Econfig
> index f6af0f708df4..eb87885c8640 100644
> --- a/arch/riscv/configs/32-bit.config
> +++ b/arch/riscv/configs/32-bit.config
> @@ -1,4 +1,2 @@
>  CONFIG_ARCH_RV32I=3Dy
> -CONFIG_32BIT=3Dy
> -# CONFIG_PORTABLE is not set
>  CONFIG_NONPORTABLE=3Dy
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_=
defconfig
> deleted file mode 100644
> index 38760e4296cf..000000000000
> --- a/arch/riscv/configs/rv32_defconfig
> +++ /dev/null
> @@ -1,139 +0,0 @@
> -CONFIG_SYSVIPC=3Dy
> -CONFIG_POSIX_MQUEUE=3Dy
> -CONFIG_NO_HZ_IDLE=3Dy
> -CONFIG_HIGH_RES_TIMERS=3Dy
> -CONFIG_BPF_SYSCALL=3Dy
> -CONFIG_IKCONFIG=3Dy
> -CONFIG_IKCONFIG_PROC=3Dy
> -CONFIG_CGROUPS=3Dy
> -CONFIG_CGROUP_SCHED=3Dy
> -CONFIG_CFS_BANDWIDTH=3Dy
> -CONFIG_CGROUP_BPF=3Dy
> -CONFIG_NAMESPACES=3Dy
> -CONFIG_USER_NS=3Dy
> -CONFIG_CHECKPOINT_RESTORE=3Dy
> -CONFIG_BLK_DEV_INITRD=3Dy
> -CONFIG_EXPERT=3Dy
> -# CONFIG_SYSFS_SYSCALL is not set
> -CONFIG_PROFILING=3Dy
> -CONFIG_SOC_SIFIVE=3Dy
> -CONFIG_SOC_VIRT=3Dy
> -CONFIG_NONPORTABLE=3Dy
> -CONFIG_ARCH_RV32I=3Dy
> -CONFIG_SMP=3Dy
> -CONFIG_HOTPLUG_CPU=3Dy
> -CONFIG_PM=3Dy
> -CONFIG_CPU_IDLE=3Dy
> -CONFIG_VIRTUALIZATION=3Dy
> -CONFIG_KVM=3Dm
> -CONFIG_JUMP_LABEL=3Dy
> -CONFIG_MODULES=3Dy
> -CONFIG_MODULE_UNLOAD=3Dy
> -CONFIG_NET=3Dy
> -CONFIG_PACKET=3Dy
> -CONFIG_UNIX=3Dy
> -CONFIG_INET=3Dy
> -CONFIG_IP_MULTICAST=3Dy
> -CONFIG_IP_ADVANCED_ROUTER=3Dy
> -CONFIG_IP_PNP=3Dy
> -CONFIG_IP_PNP_DHCP=3Dy
> -CONFIG_IP_PNP_BOOTP=3Dy
> -CONFIG_IP_PNP_RARP=3Dy
> -CONFIG_NETLINK_DIAG=3Dy
> -CONFIG_NET_9P=3Dy
> -CONFIG_NET_9P_VIRTIO=3Dy
> -CONFIG_PCI=3Dy
> -CONFIG_PCIEPORTBUS=3Dy
> -CONFIG_PCI_HOST_GENERIC=3Dy
> -CONFIG_PCIE_XILINX=3Dy
> -CONFIG_DEVTMPFS=3Dy
> -CONFIG_DEVTMPFS_MOUNT=3Dy
> -CONFIG_BLK_DEV_LOOP=3Dy
> -CONFIG_VIRTIO_BLK=3Dy
> -CONFIG_BLK_DEV_SD=3Dy
> -CONFIG_BLK_DEV_SR=3Dy
> -CONFIG_SCSI_VIRTIO=3Dy
> -CONFIG_ATA=3Dy
> -CONFIG_SATA_AHCI=3Dy
> -CONFIG_SATA_AHCI_PLATFORM=3Dy
> -CONFIG_NETDEVICES=3Dy
> -CONFIG_VIRTIO_NET=3Dy
> -CONFIG_MACB=3Dy
> -CONFIG_E1000E=3Dy
> -CONFIG_R8169=3Dy
> -CONFIG_MICROSEMI_PHY=3Dy
> -CONFIG_INPUT_MOUSEDEV=3Dy
> -CONFIG_SERIAL_8250=3Dy
> -CONFIG_SERIAL_8250_CONSOLE=3Dy
> -CONFIG_SERIAL_OF_PLATFORM=3Dy
> -CONFIG_VIRTIO_CONSOLE=3Dy
> -CONFIG_HW_RANDOM=3Dy
> -CONFIG_HW_RANDOM_VIRTIO=3Dy
> -CONFIG_SPI=3Dy
> -CONFIG_SPI_SIFIVE=3Dy
> -# CONFIG_PTP_1588_CLOCK is not set
> -CONFIG_DRM=3Dy
> -CONFIG_DRM_RADEON=3Dy
> -CONFIG_DRM_VIRTIO_GPU=3Dy
> -CONFIG_FB=3Dy
> -CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> -CONFIG_USB=3Dy
> -CONFIG_USB_XHCI_HCD=3Dy
> -CONFIG_USB_XHCI_PLATFORM=3Dy
> -CONFIG_USB_EHCI_HCD=3Dy
> -CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
> -CONFIG_USB_OHCI_HCD=3Dy
> -CONFIG_USB_OHCI_HCD_PLATFORM=3Dy
> -CONFIG_USB_STORAGE=3Dy
> -CONFIG_USB_UAS=3Dy
> -CONFIG_MMC=3Dy
> -CONFIG_MMC_SPI=3Dy
> -CONFIG_RTC_CLASS=3Dy
> -CONFIG_VIRTIO_PCI=3Dy
> -CONFIG_VIRTIO_BALLOON=3Dy
> -CONFIG_VIRTIO_INPUT=3Dy
> -CONFIG_VIRTIO_MMIO=3Dy
> -CONFIG_RPMSG_CHAR=3Dy
> -CONFIG_RPMSG_CTRL=3Dy
> -CONFIG_RPMSG_VIRTIO=3Dy
> -CONFIG_EXT4_FS=3Dy
> -CONFIG_EXT4_FS_POSIX_ACL=3Dy
> -CONFIG_AUTOFS4_FS=3Dy
> -CONFIG_MSDOS_FS=3Dy
> -CONFIG_VFAT_FS=3Dy
> -CONFIG_TMPFS=3Dy
> -CONFIG_TMPFS_POSIX_ACL=3Dy
> -CONFIG_HUGETLBFS=3Dy
> -CONFIG_NFS_FS=3Dy
> -CONFIG_NFS_V4=3Dy
> -CONFIG_NFS_V4_1=3Dy
> -CONFIG_NFS_V4_2=3Dy
> -CONFIG_ROOT_NFS=3Dy
> -CONFIG_9P_FS=3Dy
> -CONFIG_CRYPTO_USER_API_HASH=3Dy
> -CONFIG_CRYPTO_DEV_VIRTIO=3Dy
> -CONFIG_PRINTK_TIME=3Dy
> -CONFIG_DEBUG_FS=3Dy
> -CONFIG_DEBUG_PAGEALLOC=3Dy
> -CONFIG_SCHED_STACK_END_CHECK=3Dy
> -CONFIG_DEBUG_VM=3Dy
> -CONFIG_DEBUG_VM_PGFLAGS=3Dy
> -CONFIG_DEBUG_MEMORY_INIT=3Dy
> -CONFIG_DEBUG_PER_CPU_MAPS=3Dy
> -CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> -CONFIG_WQ_WATCHDOG=3Dy
> -CONFIG_DEBUG_TIMEKEEPING=3Dy
> -CONFIG_DEBUG_RT_MUTEXES=3Dy
> -CONFIG_DEBUG_SPINLOCK=3Dy
> -CONFIG_DEBUG_MUTEXES=3Dy
> -CONFIG_DEBUG_RWSEMS=3Dy
> -CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> -CONFIG_STACKTRACE=3Dy
> -CONFIG_DEBUG_LIST=3Dy
> -CONFIG_DEBUG_PLIST=3Dy
> -CONFIG_DEBUG_SG=3Dy
> -# CONFIG_RCU_TRACE is not set
> -CONFIG_RCU_EQS_DEBUG=3Dy
> -# CONFIG_FTRACE is not set
> -# CONFIG_RUNTIME_TESTING_MENU is not set
> -CONFIG_MEMTEST=3Dy
> --=20
> 2.36.1
>=20

--gTE+h999HcA9Enua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+KcAgAKCRB4tDGHoIJi
0nFKAP9F+tE91zDrdwwNriyfwg5wRazXYpqr5Mb3kEuCyu639AD+Pwo99Rc22IXR
qNTlczwuPZ1R5nRjspo5RxI1y8IM9AU=
=/929
-----END PGP SIGNATURE-----

--gTE+h999HcA9Enua--


--===============4616447087308770083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4616447087308770083==--

