Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB93C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 15:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aBQxWRFnkedwnKDvfu8JKeQ5m39epkCjcV0mO0MFjp4=; b=Tu3QMBKqa9dO5Y
	6ntDUyOIyq8isbgm7N85PxGJjYokxGrFDDDrcXmjNUmVKH1xxYG8AqFTiRZLgtnpOgxIUTQwJZ3+R
	j3hOMg+ny86cg/50x9Kc8lh7mvta8CxoAf6De4snw3Igu+fPn876vWG0zINOBGu8+q+Bw9yzEE0SI
	N8U1pEjYvDGxQA0Mc+W6AwbgF6yKjIwBAcQSj+VAloGhn+nXi0EWcM6EzT0w6IRCexUhS1RRrYJ19
	D84EKR4hADEKcmlR5FUVEX0UsUntg18N0aboj/J/hTorZOktvRF12u4x1EYGuhIRov7hWLy2kahuc
	Scsm1T5325o8F0pgaANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbl5E-001hhW-70; Tue, 05 Apr 2022 15:27:04 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbl5B-001hek-3o
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 15:27:02 +0000
Received: by mail-pf1-x435.google.com with SMTP id h19so12415885pfv.1
 for <linux-riscv@lists.infradead.org>; Tue, 05 Apr 2022 08:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kdycBsuX0g++/RcAqO3Nh9RpbFLdm52QoSaW2fF8jpA=;
 b=vWElyWYs5POabdNlTJG/H3Z8Mcd7e7W1xxw4ojO5DcfZmeJmBi4zgZ4udZCL5YkkJC
 gcfavDDrTarEbQoPO4Sdio+h9k3N6ADyEMGUi2aHg7GXp2palwloLsHgGZNrDlCbcL2x
 ar4hVSaUpOdRz3ORNcruxOquOe7N6t2NeatyyU3qjlHvvq9TbTKXi+s+9icEwa4BgjH9
 5FLHspkniaM0KwAJhgpa6Du4DK5nYVmJaiJmRAazUcC+uPIvQ5xOHHuogY1cNOTeyxSw
 vwjjpLCs1Q0xNLcF7g4oMhTJZaF7Drg3jNvA6UtPNtKESTPExorYtxrIBGkXbYKmJIcb
 WNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kdycBsuX0g++/RcAqO3Nh9RpbFLdm52QoSaW2fF8jpA=;
 b=7F1uog/CTNFfio/gQVajFn3pDkPAbP0olfY/V3GlwsqIcpEdp/9QjxMRCc7FHCrX/j
 HArhhm93n36+T+h+YuLIVZYRM3v0cMQH1fOMxOoyU0YW67hleoqgwQHHrwsE9qCyJ+oP
 /fu+GIqDzF2I4JNgFPAbf+bt0JRun8ocDm5Cf5HQI4A2q441YRnBuaZT9nRIBpaNCChI
 W4NjmiIpEnH8R8fIFMb4iRy8G2i7103xW+Hv4fqGswWpBi+CJp1/RBzyXJMx7AlbtamH
 v9DDnsj937uw5OydbboLL7ExnZk+KxdhSCiEPtZgDXY7THZ28pDzjdgvLhPKoxrvPzbg
 Xq+A==
X-Gm-Message-State: AOAM5312O2/PGVDm5jI2PoxBPIWvQNeFWN0PJseegS8FZ/HuSWDTLOvy
 PUbBEwnQxy95qxt/K9P++DcK9w==
X-Google-Smtp-Source: ABdhPJzrbX/Sddjrknw9Kh/d2WHnv7CItd5Pk7DXrwOfNDQD+F5B4NYZiMWJySrhddyqzsAOE88YMg==
X-Received: by 2002:a65:6813:0:b0:384:b288:8702 with SMTP id
 l19-20020a656813000000b00384b2888702mr3339475pgt.275.1649172413085; 
 Tue, 05 Apr 2022 08:26:53 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a17090ab79500b001ca3c46ba2fsm2737681pjr.24.2022.04.05.08.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 08:26:52 -0700 (PDT)
Date: Tue, 5 Apr 2022 09:26:49 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v2] RISC-V: configs: Configs that had RPMSG_CHAR now get
 RPMSG_CTRL
Message-ID: <20220405152649.GC4147585@p14s>
References: <20220405115729.1020889-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220405115729.1020889-1-arnaud.pouliquen@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_082701_186957_3EEB805F 
X-CRM114-Status: GOOD (  16.38  )
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

On Tue, Apr 05, 2022 at 01:57:29PM +0200, Arnaud Pouliquen wrote:
> In the commit 617d32938d1b ("rpmsg: Move the rpmsg control device
> from rpmsg_char to rpmsg_ctrl"), we split the rpmsg_char driver in two.
> By default give everyone who had the old driver enabled the rpmsg_ctrl
> driver too.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
> 
> This patch is extracted from the series [1] that has been partially
> integrated in the Linux Kernel 5.18-rc1.
> 
> Update vs previous version:
> - remove "Fixes:" tag in commit, requested by Mathieu Poirier in [2]
> 
> [1]https://lore.kernel.org/lkml/15be2f08-ba03-2b80-6f53-2056359d5c41@gmail.com/T/
> [2]https://lore.kernel.org/linux-arm-kernel/CANLsYky1_b80qPbgOaLGVYD-GEr21V6C653iGEB7VCU=GbGvAQ@mail.gmail.com/T/
> ---
>  arch/riscv/configs/defconfig      | 1 +
>  arch/riscv/configs/rv32_defconfig | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 30e3017f22bc..0cc17db8aaba 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -101,6 +101,7 @@ CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_INPUT=y
>  CONFIG_VIRTIO_MMIO=y
>  CONFIG_RPMSG_CHAR=y
> +CONFIG_RPMSG_CTRL=y
>  CONFIG_RPMSG_VIRTIO=y
>  CONFIG_EXT4_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 7e5efdc3829d..6cd9d84d3e13 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -93,6 +93,7 @@ CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_INPUT=y
>  CONFIG_VIRTIO_MMIO=y
>  CONFIG_RPMSG_CHAR=y
> +CONFIG_RPMSG_CTRL=y
>  CONFIG_RPMSG_VIRTIO=y
>  CONFIG_EXT4_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
