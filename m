Return-Path: <SRS0=Il0f=OB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29A3C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 06:04:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52A066113A
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 06:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52A066113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=SSToXi6PmEGyJ/DjOC3JPRkiX4FZG/+abA1hTuP64dU=; b=NzLmzG7i44ET3XXa73zv6UPggq
	IG8MPxKZ8e/3nlGMkhAvnJSdN/utfycAMGHIWulxukl6SOM89zALP5pTRVxXOALfgG8OyP9Gxo5Oo
	YecNcxLq0j/xIb5zfwunQZRN/1i8jDL6CMna6A5F3/JYgycW2LpFLg1sOs/H8t96wRJrqL0GvgfUB
	H21DYFH3nCPtVgppYZTkTkQhajmssmeTAZzY1GHcuze2ejXtzkgTA46H7gLqbnwSgsVwg0ZP8TIDr
	m7dcONP4rf/+EKdBSau4YYTy4BF/I8mpuA4EE1C8N0veA5mfrc3szxtAicZZrZXw/4oEdWAztmON0
	4mfF2xWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOw7T-00ELce-9Z; Sat, 11 Sep 2021 06:04:07 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOw78-00ELbt-Vf
 for linux-riscv@lists.infradead.org; Sat, 11 Sep 2021 06:03:48 +0000
Received: by mail-ot1-x333.google.com with SMTP id
 l7-20020a0568302b0700b0051c0181deebso5357612otv.12
 for <linux-riscv@lists.infradead.org>; Fri, 10 Sep 2021 23:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=UgmN2EKt/DWd47bpDffgHi1pS1L5lavVM0pPz8CK090=;
 b=vCfaQUquVMJLez8VluIXcmYq5CLLVqmr1dQOTPDIhd8I0yzMvs/JDiTFM98UYBxGUg
 DmHIxnz3QosYOqpRiQam+j70L3Lxba4McNaPDLEBE3VXz4TIUCNcawZeYhvlVxqbsbRv
 lMN/RaHrHe+kX3gktUvbMxTWwU+BpbsRxeMOoXifPg/HuZ0+byhEeVdZYt0kh23EVtI7
 tWeE/1HuwOLvIsRTzEktWh9cRzGU0uX9aIv8ctVZ6HBFyP8WLaunpUUvCWa5Kl1xshVX
 BeMZC09He9qcH1BubqxyLr+0+8dD6TQHJRLQ+rbnbglcN64lvpUAw+n17xrHXDsjxp3v
 PL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=UgmN2EKt/DWd47bpDffgHi1pS1L5lavVM0pPz8CK090=;
 b=QHmtXEDhnory45lxDnM3ut1XtZFNFxnaxVkID4oMMz7W/1ugUbNx6h+qkQoaXX01Pt
 FsrhtEPrqBcpT3jyiyNfLvZOQ40xW61R+TD+w9XDjOditk5oppbvswkCFVswhq3PMhCW
 N7jbdusMe5jMA5B+tUAugazhUwW4o9MDVtzuDRLAESDKd8Wq2maI8/Nvzw0JZFb+DotZ
 E4hl/lX6oywuBvGzQGxNA1pT6QcrMpyXAX49jo7oxjE3SpfEP5BBHDePvrH/zl/Kig+G
 4A5ojPOw/6LZnImK9oOZNBysKkuDMjbXkw7AGDmzfgNG5iCs6e4E3DYfS1/GpkX4gcMz
 EHtQ==
X-Gm-Message-State: AOAM530S0EkRQ1lE6nu1jEZIYH3QrW2qMCcIBPHhLvwIixyuQHfAfgvS
 gQS34iF6UmKrX0y2+ITWSbXxVmqBUn+SPjuCHjk=
X-Google-Smtp-Source: ABdhPJyRd0MIgayPgtVMdjDX8fX/kgXfIi474riYVHdu4gfC5dHSDQoTnGlH2JNIcxGY+lSY1ozCcA==
X-Received: by 2002:a9d:6a4b:: with SMTP id h11mr1126032otn.5.1631340224967;
 Fri, 10 Sep 2021 23:03:44 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id bf6sm247447oib.0.2021.09.10.23.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 23:03:44 -0700 (PDT)
Date: Fri, 10 Sep 2021 23:03:44 -0700 (PDT)
X-Google-Original-Date: Fri, 10 Sep 2021 21:53:28 PDT (-0700)
Subject: Re: [PATCH 1/2] riscv: defconfig: enable BLK_DEV_NVME
In-Reply-To: <20210812081027.9242-1-heinrich.schuchardt@canonical.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 xypron.glpk@gmx.de, ardb@kernel.org, 
 sagar.kadam@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, heinrich.schuchardt@canonical.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heinrich.schuchardt@canonical.com
Message-ID: <mhng-b162953f-839f-40e9-a643-34eef24ce8b4@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_230347_131030_A104C5D1 
X-CRM114-Status: GOOD (  15.93  )
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

On Thu, 12 Aug 2021 01:10:26 PDT (-0700), heinrich.schuchardt@canonical.com wrote:
> NVMe is a non-volatile storage media attached via PCIe.
> As NVMe has much higher throughput than other block devices like
> SATA it is a must have for RISC-V. Enable CONFIG_BLK_DEV_NVME.
>
> The HiFive Unmatched is a board providing M.2 slots for NVMe drives.
> Enable CONFIG_PCIE_FU740.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> resent on Palmer's request due to non-matching e-mail addresses
> https://lore.kernel.org/linux-riscv/20210726112511.78350-1-xypron.glpk@gmx.de/
> ---
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 1f2be234b11c..393bf3843e5c 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -39,10 +39,12 @@ CONFIG_PCI=y
>  CONFIG_PCIEPORTBUS=y
>  CONFIG_PCI_HOST_GENERIC=y
>  CONFIG_PCIE_XILINX=y
> +CONFIG_PCIE_FU740=y
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_BLK_DEV_LOOP=y
>  CONFIG_VIRTIO_BLK=y
> +CONFIG_BLK_DEV_NVME=m
>  CONFIG_BLK_DEV_SD=y
>  CONFIG_BLK_DEV_SR=y
>  CONFIG_SCSI_VIRTIO=y

Thanks, these are on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
