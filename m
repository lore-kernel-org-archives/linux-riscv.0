Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A83C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 05:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=6Sr9sVGaPxrgiksY6j20FwuwLwA13aYOhsM/ujZXKmg=; b=1M/PpF32MkVByuLBv9oCor+eN9
	ZT7dZkfDmKg9FXWonCsgop67PZ4fV2wVwdClCAdFlgxoVAEBKloi2SI+MKHYfilnY6nWozhVWAALx
	jCnfRou/z8pd5JrnwXN6sJhYJZHBG/AJBBEdWf3/0fKsfmYofAWu7iELrzrwv/RUMNHTwkansjgkd
	0KWOr9s5uii26F5um2IjFwe1iIJojig6BEyIdYfiE6ulql9aLRE0woVTxZeV2UjofDn+X5Ev/vOEX
	Kk4o1YM/c5LPxkA+nwjvWDhfXlsVj6U9g01VRTszpoKCY9MtPPip49t5HHkqqVSNJjGPBa506PxNa
	8Vn2LTRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEkri-00018D-Es; Fri, 22 Jul 2022 05:06:18 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEkre-00016h-UZ
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 05:06:17 +0000
Received: by mail-pj1-x102e.google.com with SMTP id p6-20020a17090a680600b001f2267a1c84so5519298pjj.5
        for <linux-riscv@lists.infradead.org>; Thu, 21 Jul 2022 22:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=OeAEb6m+vs0K6TzHjVslsYokInaDYI8paxIh3nITk2s=;
        b=gq+gjVuI5oEnVYfLfTDvZ5ntscQruzWfR+vpir7zzrcoEkUPIhNkSjLtSMxcmNvAeS
         Qc1AD5vrX4HYm90PTx+rBgxImMOO1y6QF8aruimcURW4LCaOWztk7okO3kWQuh8Jzrmt
         c6zlCdjE6MMrbx8ELpZ5OAAtHvx0yVD14ctnJmslpj/kmEtHVPYQ0E8NgkykV+yzOuxv
         JFn3FazakyKEAEeu33yg+Gz6Wf6vagJ/rq/4IeALnfxutbI1tVo07IZzYX1vve1Fpnau
         xF/SgF7SA7lnmzNDi85YN29lSwNkZdZ22NHdf0XZuBdWX5LDsZAXFurLAD5igdRWEyw7
         U2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=OeAEb6m+vs0K6TzHjVslsYokInaDYI8paxIh3nITk2s=;
        b=uDtqrhqO4T6c+i89KPIR5Q4ptySY6gSe3/zYMBZIepQIVYmBTFjSuZeuqc2tBEkbLk
         jUUcDI/8FQ0kYcrEEJn9TWkBmTIjJ6OViE/vmkhAjjqxjWMcqKKU3F0O6W3ARmBinKMC
         ZyZWr0/VGrMLobbk3xJMha03IqiepRgKtZQL8NtFFGgTE05k3+uJiMpq6I+vEIoXIyPD
         oGHFnaAk5apOc6lwhQk7zO5IgY9CUVc4FOkTAjJg/eFCx8y5Y8rABYEQaTzefdJ010IU
         38tyg9KKXm57zXzpbAuBF1tDRS4O0ygPW7cgPqcnzcPh1qNi5peDX5SFH5TxhQ2R2ycE
         INaw==
X-Gm-Message-State: AJIora+yTBiPB6XKXxb1orO6ZYFyKFzQKzQd4+Sson6tTLdF1BskvTu4
	Itc3a6/Mugmppqjxz2lpVxHMRg==
X-Google-Smtp-Source: AGRyM1uPEXgg7OPeYTjBfySXHjjqcKW7dS4wxQPOLqobukl0wOIqeNB8TKUO70OkdT9OUMvWx69ezg==
X-Received: by 2002:a17:902:7fc3:b0:16c:78aa:88b0 with SMTP id t3-20020a1709027fc300b0016c78aa88b0mr1729015plb.81.1658466373179;
        Thu, 21 Jul 2022 22:06:13 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id mm3-20020a17090b358300b001ef95232570sm4455917pjb.52.2022.07.21.22.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 22:06:11 -0700 (PDT)
Date: Thu, 21 Jul 2022 22:06:11 -0700 (PDT)
X-Google-Original-Date: Thu, 21 Jul 2022 22:06:09 PDT (-0700)
Subject: Re: [PATCH 1/1] riscv: enable Docker requirements in defconfig
In-Reply-To: <20220608000251.55271-1-heinrich.schuchardt@canonical.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>, guoren@kernel.org,
  mchitale@ventanamicro.com, arnaud.pouliquen@foss.st.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, heinrich.schuchardt@canonical.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heinrich.schuchardt@canonical.com
Message-ID: <mhng-679f197d-77a0-4dc5-9523-f7b88a22b30b@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_220615_251316_6DD1B2AB 
X-CRM114-Status: GOOD (  24.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 07 Jun 2022 17:02:51 PDT (-0700), heinrich.schuchardt@canonical.com wrote:
> The defconfig kernel should be able to run Docker.
>
> Enable the missing settings according to [1].
> make savedefconfig eliminates CONFIG_STACKTRACE
> which is enabled by default.
>
> Many of the settings are also needed to run a defconfig kernel
> on default distro installations or to run snaps.
>
> [1] https://github.com/moby/moby/blob/master/contrib/check-config.sh
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> Cf. [PATCH] arm64: Enable docker support in defconfig
> https://lore.kernel.org/lkml/20220606140103.32779-1-vincenzo.frascino@arm.com/
> ---
>  arch/riscv/configs/defconfig | 65 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 64 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 0cc17db8aaba..d4fffcd3cc05 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -6,8 +6,18 @@ CONFIG_BPF_SYSCALL=y
>  CONFIG_IKCONFIG=y
>  CONFIG_IKCONFIG_PROC=y
>  CONFIG_CGROUPS=y
> +CONFIG_MEMCG=y
> +CONFIG_BLK_CGROUP=y
>  CONFIG_CGROUP_SCHED=y
>  CONFIG_CFS_BANDWIDTH=y
> +CONFIG_RT_GROUP_SCHED=y
> +CONFIG_CGROUP_PIDS=y
> +CONFIG_CGROUP_FREEZER=y
> +CONFIG_CGROUP_HUGETLB=y
> +CONFIG_CPUSETS=y
> +CONFIG_CGROUP_DEVICE=y
> +CONFIG_CGROUP_CPUACCT=y
> +CONFIG_CGROUP_PERF=y
>  CONFIG_CGROUP_BPF=y
>  CONFIG_NAMESPACES=y
>  CONFIG_USER_NS=y
> @@ -28,9 +38,11 @@ CONFIG_KVM=m
>  CONFIG_JUMP_LABEL=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
> +CONFIG_BLK_DEV_THROTTLING=y
>  CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y
> +CONFIG_XFRM_USER=m
>  CONFIG_INET=y
>  CONFIG_IP_MULTICAST=y
>  CONFIG_IP_ADVANCED_ROUTER=y
> @@ -38,7 +50,43 @@ CONFIG_IP_PNP=y
>  CONFIG_IP_PNP_DHCP=y
>  CONFIG_IP_PNP_BOOTP=y
>  CONFIG_IP_PNP_RARP=y
> +CONFIG_INET_ESP=m
> +CONFIG_NETFILTER=y
> +CONFIG_BRIDGE_NETFILTER=m
> +CONFIG_NF_CONNTRACK=m
> +CONFIG_NF_CONNTRACK_FTP=m
> +CONFIG_NF_CONNTRACK_TFTP=m
> +CONFIG_NETFILTER_XT_MARK=m
> +CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
> +CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
> +CONFIG_NETFILTER_XT_MATCH_IPVS=m
> +CONFIG_IP_VS=m
> +CONFIG_IP_VS_PROTO_TCP=y
> +CONFIG_IP_VS_PROTO_UDP=y
> +CONFIG_IP_VS_RR=m
> +CONFIG_IP_VS_NFCT=y
> +CONFIG_NF_LOG_ARP=m
> +CONFIG_NF_LOG_IPV4=m
> +CONFIG_IP_NF_IPTABLES=m
> +CONFIG_IP_NF_FILTER=m
> +CONFIG_IP_NF_TARGET_REJECT=m
> +CONFIG_IP_NF_NAT=m
> +CONFIG_IP_NF_TARGET_MASQUERADE=m
> +CONFIG_IP_NF_TARGET_REDIRECT=m
> +CONFIG_IP_NF_MANGLE=m
> +CONFIG_NF_LOG_IPV6=m
> +CONFIG_IP6_NF_IPTABLES=m
> +CONFIG_IP6_NF_MATCH_IPV6HEADER=m
> +CONFIG_IP6_NF_FILTER=m
> +CONFIG_IP6_NF_TARGET_REJECT=m
> +CONFIG_IP6_NF_MANGLE=m
> +CONFIG_BRIDGE=m
> +CONFIG_BRIDGE_VLAN_FILTERING=y
> +CONFIG_VLAN_8021Q=m
> +CONFIG_NET_SCHED=y
> +CONFIG_NET_CLS_CGROUP=m
>  CONFIG_NETLINK_DIAG=y
> +CONFIG_CGROUP_NET_PRIO=y
>  CONFIG_NET_9P=y
>  CONFIG_NET_9P_VIRTIO=y
>  CONFIG_PCI=y
> @@ -57,7 +105,15 @@ CONFIG_SCSI_VIRTIO=y
>  CONFIG_ATA=y
>  CONFIG_SATA_AHCI=y
>  CONFIG_SATA_AHCI_PLATFORM=y
> +CONFIG_MD=y
> +CONFIG_BLK_DEV_DM=m
> +CONFIG_DM_THIN_PROVISIONING=m
>  CONFIG_NETDEVICES=y
> +CONFIG_DUMMY=m
> +CONFIG_MACVLAN=m
> +CONFIG_IPVLAN=m
> +CONFIG_VXLAN=m
> +CONFIG_VETH=m
>  CONFIG_VIRTIO_NET=y
>  CONFIG_MACB=y
>  CONFIG_E1000E=y
> @@ -105,7 +161,11 @@ CONFIG_RPMSG_CTRL=y
>  CONFIG_RPMSG_VIRTIO=y
>  CONFIG_EXT4_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y
> +CONFIG_EXT4_FS_SECURITY=y
> +CONFIG_BTRFS_FS=m
> +CONFIG_BTRFS_FS_POSIX_ACL=y
>  CONFIG_AUTOFS4_FS=y
> +CONFIG_OVERLAY_FS=m
>  CONFIG_MSDOS_FS=y
>  CONFIG_VFAT_FS=y
>  CONFIG_TMPFS=y
> @@ -119,6 +179,10 @@ CONFIG_ROOT_NFS=y
>  CONFIG_9P_FS=y
>  CONFIG_NLS_CODEPAGE_437=y
>  CONFIG_NLS_ISO8859_1=m
> +CONFIG_SECURITY=y
> +CONFIG_SECURITY_SELINUX=y
> +CONFIG_SECURITY_APPARMOR=y
> +CONFIG_DEFAULT_SECURITY_DAC=y
>  CONFIG_CRYPTO_USER_API_HASH=y
>  CONFIG_CRYPTO_DEV_VIRTIO=y
>  CONFIG_PRINTK_TIME=y
> @@ -137,7 +201,6 @@ CONFIG_DEBUG_SPINLOCK=y
>  CONFIG_DEBUG_MUTEXES=y
>  CONFIG_DEBUG_RWSEMS=y
>  CONFIG_DEBUG_ATOMIC_SLEEP=y
> -CONFIG_STACKTRACE=y
>  CONFIG_DEBUG_LIST=y
>  CONFIG_DEBUG_PLIST=y
>  CONFIG_DEBUG_SG=y

Sorry for being so slow here.  I don't have any issues with this as a 
concept, but it makes a handful of my test configs panic on boot.  Seems 
like something is tripping up a kasan failure.  I guess it's kind of 
arbitrary to call that a regression, as I'm sure it's just uncovering 
some issue that already exists, but turning something on in defconfig 
that panics with kasan is going to have a bunch of fallout.

It looks like BLK_CGROUP is the problem here, so if you're OK with it 
then I'm happy to take the rest of these.  I put that over at 
kernel.org/palmer/linux/riscv-docker_no_blk_cgroup, if that's OK I'll 
cherry-pick it onto for-next.

There's almost certainly a bug here that warrants fixing.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
