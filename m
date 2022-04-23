Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD6DC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Apr 2022 02:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=76nM08OEiPG/9IjhY4vtxGbGDbUTXPRm/YKNgP+GbOk=; b=KYvH/IyjHa5IpdTNHtP2n3sEDM
	+MEtoAjyINGiubEogK92NDiazWlFt11b0SJFE1OU9uOXTcoQcXbhBw8QHVYsBs1iE5aT4HAY2Askp
	8dM7FypQOwJpLkCXKKfXCng/g+jujvRbdKEuYR54iqdSb1drkfYboxca4Ydf3yYV6xsrihmP6nhvf
	EZrRfHxVIEZrcR0A8+Z8o9t6tTjhvAct4srKCKgIrMym26FRGZJIqQjc5L33+V1XBxGrIxiMRsdip
	+MB+Cwgg7pA3QkhlTvDOaMXUEZJWocOUqelWQY3BR2lEOapdafdxyFo6jddv5QB8VTr7diIHvk8UV
	czVZH4yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni5iL-003Ixa-Eg; Sat, 23 Apr 2022 02:41:37 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni5iI-003Ix2-Se
 for linux-riscv@lists.infradead.org; Sat, 23 Apr 2022 02:41:36 +0000
Received: by mail-pl1-x636.google.com with SMTP id d15so266688plh.2
 for <linux-riscv@lists.infradead.org>; Fri, 22 Apr 2022 19:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=REmfpzw1xMslNBXNKTYCRBYBhCFLFRCkqr4sRav5rgY=;
 b=4WeFBWPm+HwABfSRIIkgJWStFSAErKQ/PmL1rmQcC8lm1M4HPRnhWaTMlxULv/SJGz
 ZgQ+tx/5aektTp0kYDf9FspiE/y5Zv7s8DUB6Esf1qL39NDJqj3bXDRhACiW3YnolmTB
 P+qGJIIMZ8W9gNEo+ngQg63rzScAPaKDmbLMZ2pcxKUvkNQR1PB0iuJc+ZmFhJqek+Jt
 TJYj3VMtSZFbSsbpRAu9X7+MqLSBKd5OKX8QYOQQIWMVV4CSO2spuqMfg2Nsi0wCxfpT
 dRfP1s9+4hfKrzJYg+TxTWs1NHV8mfHUa9Uv5mFJKQ94O/WpZ44cF+dHvqMg9aYA3Um/
 MTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=REmfpzw1xMslNBXNKTYCRBYBhCFLFRCkqr4sRav5rgY=;
 b=6vqI9+UDHWx8lT7hRDR4DpdxF7nl995kVOyUiEeFUeJrkYjUaHZzj193fKwPL9Ls7o
 ZJZ2zuK19PCFg24dY2o/tpEDZsDAVQcJ5i5IMTiaRSg5CIqfHhnSgCHYdXACt8/wukMI
 J+Ue9JjTEedkybNNf4gAvexSs8OMAx4mNK8CDqP0nlyhkRM6rQv68ca0Kf/QO4qysp+N
 ldXxKZ9rsuCvPNc8tF6nP2M5nMedprAzOBefmu6zP2dx1TaoIPVbv6SbnlZlwodz1NmK
 PPa/Z5VX+9ZujQ29Uuvaz43vW26CZkKHQ3jF36GIJYv65Srn9p6k78CkouDUHR9+dYAS
 +n/w==
X-Gm-Message-State: AOAM531VqjkITu8n/9m9wnsaIBoR1QF64Y+0205O/qDj7ZLoCrpyYfyF
 OekNn3bHrXeBqtnno/ugoWQHTw==
X-Google-Smtp-Source: ABdhPJzTDUsXmUPRCkNu/YoxmSMlqJ3ANNR0+ezB3YEc/HXUrEK20xXuSZtgCWqoud9K1+OVziq2Cg==
X-Received: by 2002:a17:903:18f:b0:15a:1cc6:48f5 with SMTP id
 z15-20020a170903018f00b0015a1cc648f5mr7521584plg.161.1650681691627; 
 Fri, 22 Apr 2022 19:41:31 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 ch10-20020a056a00288a00b0050a51a95e91sm3614749pfb.201.2022.04.22.19.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 19:41:30 -0700 (PDT)
Date: Fri, 22 Apr 2022 19:41:30 -0700 (PDT)
X-Google-Original-Date: Fri, 22 Apr 2022 19:26:44 PDT (-0700)
Subject: Re: [PATCH] RISC-V: configs: Configs that had RPMSG_CHAR now get
 RPMSG_CTRL
In-Reply-To: <20220404090527.582217-1-arnaud.pouliquen@foss.st.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
 bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 arnaud.pouliquen@foss.st.com, 
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 anup@brainfault.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: arnaud.pouliquen@foss.st.com
Message-ID: <mhng-540193db-7721-4cd3-935a-be485b4af058@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_194134_965448_BEEC79DF 
X-CRM114-Status: GOOD (  16.45  )
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

On Mon, 04 Apr 2022 02:05:27 PDT (-0700), arnaud.pouliquen@foss.st.com wrote:
> In the patch 617d32938d1b: "rpmsg: Move the rpmsg control device
> from rpmsg_char to rpmsg_ctrl", we split the rpmsg_char driver in two.
> By default give everyone who had the old driver enabled the rpmsg_ctrl
> driver too.
>
> Fixes: 617d32938d1b ("rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl", 2022-01-24)
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
> this patch is extracted from the series [1] that has been partially
> integrated in the Linux Kernel 5.18-rc1.
>
> [1]https://lore.kernel.org/lkml/15be2f08-ba03-2b80-6f53-2056359d5c41@gmail.com/T/
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

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
