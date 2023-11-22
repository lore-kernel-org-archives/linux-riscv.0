Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B145C61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 00:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZm/hUvx6RcE2fKnyYRHsDB9NnoY1HXK4yKfe70Q83w=; b=O/jtJ9XFHr1rsyYXzEDiokp4fK
	9uwsa6jOPTehNbRkxAwp/cr9pDOVozy7P/W7GLPWzmP06dhPp7ZnY4fVhDHpc2tJnDcjBVnRFA00n
	nuSJUtMG93/34HodyNZQA7q79jAbTs7R8UE8jULfDMob0EFQ8MlxPp3e0MfeDCXiPUw9Do/KvDWQP
	yGrv3zt0gYfPXR77ABpplF3v1ixGBC4o8Kfh5EjVe/JidyZegrM3pVD60wCBv5P55+fB7G0AT0KD7
	JYVd+YKAA/kv0vHAYkeFcT21QxMDSacnFJ+eW0NAfaLVmMunsaU40BhENCG3ObkENgOFW+YVx1lNN
	jQEVyQPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5anh-000JOJ-0v;
	Wed, 22 Nov 2023 00:09:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5and-000JNd-2w
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 00:09:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B6C5B61B9C;
	Wed, 22 Nov 2023 00:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B62B0C433C7;
	Wed, 22 Nov 2023 00:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700611740;
	bh=XP0Ti5bzZmRxGtLvrHdPvZXj310v2JlFISCYGAueOCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g6BP8JxTYnZNuTdWQ0ilNPaM0nvIoZfP1mv1NaW/bbX3fiz2eaQEgK9mYaYpFZkr7
	 B8ja7h3aazFN8tWB3wxM1yE+SzZsJ7jQ6qKcZK7FZ/uRSq1KLwFYrEq4a/ENTmPpTe
	 2o44bSy7FDteSt5fd66SE6mY9t4wLtqv6HfafA4K31s0AqfftCQprZywmYHvMw0WzM
	 4rFMWWV6ut0Q6JBcJqsxkBxwAEiUDwC3831cRu06lc4qE6wHUHsM9dqn8JnRlybXAD
	 Ig6hKUj+Bq6ktEjc6DnA6ZFyjtDLO1HhzfskTVJJr+AOo0Cm1K2V4ov6kdQGUuiDib
	 vJe5/UkWYDdeA==
Date: Wed, 22 Nov 2023 00:08:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	Albert Ou <aou@eecs.berkeley.edu>, Ian Kent <raven@themaw.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sven Joachim <svenjoac@gmx.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Remove obsolete rv32_defconfig file
Message-ID: <20231122-filled-overbook-8fa65f286f07@spud>
References: <20231121225320.3430550-1-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20231121225320.3430550-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_160902_057025_5CAF96B0 
X-CRM114-Status: GOOD (  15.69  )
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
Content-Type: multipart/mixed; boundary="===============2715021458333484073=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2715021458333484073==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ceUMyEnms5bFHysl"
Content-Disposition: inline


--ceUMyEnms5bFHysl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 02:53:18PM -0800, Samuel Holland wrote:
> This file is not used since commit 72f045d19f25 ("riscv: Fixup
> difference with defconfig"), where it was replaced by the
> 32-bit.config fragment. Delete the old file to avoid any confusion.
>=20
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

I'm pretty sure Guo Ren sent the same patch a year ago.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>=20
>  arch/riscv/configs/rv32_defconfig | 139 ------------------------------
>  1 file changed, 139 deletions(-)
>  delete mode 100644 arch/riscv/configs/rv32_defconfig
>=20
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_=
defconfig
> deleted file mode 100644
> index 89b601e253a6..000000000000
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
> -CONFIG_AUTOFS_FS=3Dy
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
> 2.42.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--ceUMyEnms5bFHysl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV1GmAAKCRB4tDGHoIJi
0n/eAQDsLWwyNd18syfK0mWM5g7h+fRUoccgskPAM1qaAI0TQwD/T4TE1pO96qXe
Kr32scsicS39+CWwvLzYante4ushaQk=
=P+3C
-----END PGP SIGNATURE-----

--ceUMyEnms5bFHysl--


--===============2715021458333484073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2715021458333484073==--

