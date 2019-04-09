Return-Path: <SRS0=aw4H=SL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E5DC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2019 16:44:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 761132133D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2019 16:44:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uiCxgEqo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="j3xji1JK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 761132133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=zyCRDA03uzJq85D/inpDCy8lvKlbOje5KJy9EdQOH6Y=; b=uiCxgEqoo0nGkY8nR00FCh2L7
	7/fDpaoDVVu2rrTWqnJw+OkH1qpzkP4vJ10F5+o9S/5/w7Knw+l6Ud+5Fg7qAsOTNnDTThegHVQK3
	0yQCjrjtDswmyaftQtJjYM4tqLeOxcucg4iw2FZT5IzJYQQThXyrNuU0RICU1K8SYItbQQLcebxVz
	TOSeYkMZrqskTyRNhKxE78ioPt8SNd9Nql4MyO9SNjVPubWlOPp4+HjFTZ8Fh3DiefZsI0CBrh4GZ
	irJVabQrTqZh0gMlRObChmCBitTdPcln2HOd18vN2b6YIBQyGiSZ2QDKa9t15XZUvUV9UzKsAmc4O
	jLlGhrwZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDtqw-00035s-9g; Tue, 09 Apr 2019 16:44:06 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDtqt-00035M-NI
 for linux-riscv@lists.infradead.org; Tue, 09 Apr 2019 16:44:05 +0000
Received: by mail-pf1-x443.google.com with SMTP id e24so10022050pfi.12
 for <linux-riscv@lists.infradead.org>; Tue, 09 Apr 2019 09:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=xgN3naQXpVOCILTavuLanLOPpb06iUfQezeZYDzCD6g=;
 b=j3xji1JKVYHEwoR6E0rbHe3Hj04GjCJXFF7pfIzoaOlkvkekdYPOt4HkqLUdJLhp6N
 fyEFeHimBpCaGazM/FvGovg5FzvmyLxj6xB4eO0ptLYUpdn1ogU5ecrT0mGI0DaFY76h
 w+/mfqHj3nJO3YeR5vJfjxB02Qxkqu4a0lZcNZjZj7xYnTuu51kM88+nwGmUuW9WrGqf
 KJcdVc8GnLnr/sCSyiFUDvNCA2RPiTdU4oFON6DXIBaDx0a+jFfj2zhMLxXWVLiN9XBo
 DCV17mWabJ8lUxw/ZxkWvQdksbrnQENklBjjA1WfRcDyvWgvDLGolZLSlMhTClZ/egrK
 29KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=xgN3naQXpVOCILTavuLanLOPpb06iUfQezeZYDzCD6g=;
 b=kwk2wPhx9mG/kqQrX/x5LG0GJDamrsbWhRJC8tIa6r0+YgQ2U7JI4n8k6YhErQPWcn
 Qnoquqco9d0oVyWFdn/3A3vDlYTkUo1L/L/UF/VKDyMl3BZANW0QTOB2Geiigcpbs0iF
 Rw+sawPe7kMZJ0eqvIkdZPAtd4UjAWNCuRDx5PvCAao+Po0MnNLwqj0+OV8SQn2YmpdZ
 PGnhXDH2Q09UlJwBCm9J15vcbtSUicaarfzXn5Wt2EpBYdkl3JD7jNdA643ihBXqrgL3
 Ep/REqMV1lZsIr1T1iRP3TAcOWL4N91J0uy9w78fUIbFrA3I/iaiQMb6e2Pj/Uy47zQU
 ObAA==
X-Gm-Message-State: APjAAAV4dvf3fTAhOFXQxmjyasArX5QDOClKueiXS4+2V/e2sfIzIOz+
 2DpShLgfEV32KQSi5nkuJBDluA==
X-Google-Smtp-Source: APXvYqx8XDsDzi6W8CPGNC0ffD5U3kx5WCbkvmcn7IhbqHuxj4wXpfgTwn7gkO9mxFGVq0iP5CJHtA==
X-Received: by 2002:a63:4f52:: with SMTP id p18mr35313644pgl.333.1554828242739; 
 Tue, 09 Apr 2019 09:44:02 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id b63sm92422918pfj.54.2019.04.09.09.44.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Apr 2019 09:44:01 -0700 (PDT)
Date: Tue, 09 Apr 2019 09:44:01 -0700 (PDT)
X-Google-Original-Date: Tue, 09 Apr 2019 09:43:56 PDT (-0700)
Subject: Re: [PATCH 1/3] RISC-V: Add separate defconfig for 32bit systems
In-Reply-To: <20190312220752.128141-2-anup.patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-02f905c7-fb28-4997-9769-2cb88c581881@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_094403_822516_B7F59546 
X-CRM114-Status: GOOD (  15.62  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 12 Mar 2019 15:08:12 PDT (-0700), Anup Patel wrote:
> This patch adds rv32_defconfig for 32bit systems. The only
> difference between rv32_defconfig and defconfig is that
> rv32_defconfig has  CONFIG_ARCH_RV32I=y.

Thanks.  I think it makes sense to have this in 5.1 so I'm going to take it 
into the next RC.

>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/configs/rv32_defconfig | 84 +++++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 arch/riscv/configs/rv32_defconfig
>
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> new file mode 100644
> index 000000000000..1a911ed8e772
> --- /dev/null
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -0,0 +1,84 @@
> +CONFIG_SYSVIPC=y
> +CONFIG_POSIX_MQUEUE=y
> +CONFIG_IKCONFIG=y
> +CONFIG_IKCONFIG_PROC=y
> +CONFIG_CGROUPS=y
> +CONFIG_CGROUP_SCHED=y
> +CONFIG_CFS_BANDWIDTH=y
> +CONFIG_CGROUP_BPF=y
> +CONFIG_NAMESPACES=y
> +CONFIG_USER_NS=y
> +CONFIG_CHECKPOINT_RESTORE=y
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_EXPERT=y
> +CONFIG_BPF_SYSCALL=y
> +CONFIG_ARCH_RV32I=y
> +CONFIG_SMP=y
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
> +CONFIG_NET=y
> +CONFIG_PACKET=y
> +CONFIG_UNIX=y
> +CONFIG_INET=y
> +CONFIG_IP_MULTICAST=y
> +CONFIG_IP_ADVANCED_ROUTER=y
> +CONFIG_IP_PNP=y
> +CONFIG_IP_PNP_DHCP=y
> +CONFIG_IP_PNP_BOOTP=y
> +CONFIG_IP_PNP_RARP=y
> +CONFIG_NETLINK_DIAG=y
> +CONFIG_PCI=y
> +CONFIG_PCIEPORTBUS=y
> +CONFIG_PCI_HOST_GENERIC=y
> +CONFIG_PCIE_XILINX=y
> +CONFIG_DEVTMPFS=y
> +CONFIG_BLK_DEV_LOOP=y
> +CONFIG_VIRTIO_BLK=y
> +CONFIG_BLK_DEV_SD=y
> +CONFIG_BLK_DEV_SR=y
> +CONFIG_ATA=y
> +CONFIG_SATA_AHCI=y
> +CONFIG_SATA_AHCI_PLATFORM=y
> +CONFIG_NETDEVICES=y
> +CONFIG_VIRTIO_NET=y
> +CONFIG_MACB=y
> +CONFIG_E1000E=y
> +CONFIG_R8169=y
> +CONFIG_MICROSEMI_PHY=y
> +CONFIG_INPUT_MOUSEDEV=y
> +CONFIG_SERIAL_8250=y
> +CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_OF_PLATFORM=y
> +CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
> +CONFIG_HVC_RISCV_SBI=y
> +# CONFIG_PTP_1588_CLOCK is not set
> +CONFIG_DRM=y
> +CONFIG_DRM_RADEON=y
> +CONFIG_FRAMEBUFFER_CONSOLE=y
> +CONFIG_USB=y
> +CONFIG_USB_XHCI_HCD=y
> +CONFIG_USB_XHCI_PLATFORM=y
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_EHCI_HCD_PLATFORM=y
> +CONFIG_USB_OHCI_HCD=y
> +CONFIG_USB_OHCI_HCD_PLATFORM=y
> +CONFIG_USB_STORAGE=y
> +CONFIG_USB_UAS=y
> +CONFIG_VIRTIO_MMIO=y
> +CONFIG_SIFIVE_PLIC=y
> +CONFIG_EXT4_FS=y
> +CONFIG_EXT4_FS_POSIX_ACL=y
> +CONFIG_AUTOFS4_FS=y
> +CONFIG_MSDOS_FS=y
> +CONFIG_VFAT_FS=y
> +CONFIG_TMPFS=y
> +CONFIG_TMPFS_POSIX_ACL=y
> +CONFIG_NFS_FS=y
> +CONFIG_NFS_V4=y
> +CONFIG_NFS_V4_1=y
> +CONFIG_NFS_V4_2=y
> +CONFIG_ROOT_NFS=y
> +CONFIG_CRYPTO_USER_API_HASH=y
> +CONFIG_CRYPTO_DEV_VIRTIO=y
> +CONFIG_PRINTK_TIME=y
> +# CONFIG_RCU_TRACE is not set
> -- 
> 2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
