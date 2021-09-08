Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD307C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 08:38:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEE6961165
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 08:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AEE6961165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dcR8GmrBWd4BXPKU6NSj4BK3HB4XvNR4NerRLAKeIoo=; b=dxautiq62YooyY
	2DGUdyhcYq9/lkRgM8DvPlM0yuhFaCYR74kdiTrDUMeozcxaSM8SOR2+tCnGQZdEHO0wy5SwFE+iI
	RiOOKBhTsSzmB9/4fwdSadkKxkyY5CaxNivJwJ6QvS4ww+cp9SxZJe97cbAFhqCZoCVyNeTx7PBq5
	rguXhMGeNWKBAikBrYs79drzggyqJcbMsblN51esUxwzQ+ULqvzgyIv7QzV3484cDXtDrlNBTJnSz
	RCvKSaZXs0BO7M9Wa3CncTyETR3wp/zvVD85JwWS+eiRkgYFaLNnySRSgxR9QRA2MtKnhdBhQ0qj/
	J+st9JfMacdnHvafO5AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNt5x-006BeL-0t; Wed, 08 Sep 2021 08:38:13 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNt5u-006Bdf-Si
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 08:38:12 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso912537wms.3
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 01:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ILfedyfA7TPHqyBNZ/TjjapMKjWfHALaRNb6+vus4M=;
 b=Rq63Ukeo3zhZYJb8DfVPuJ+ZlafG0bW4jpUJ1nH3k2einUu+O2DnOkh+2CfpepE9J6
 XwQkWvMFO7wVfanY7uSCHAm5kgetmsk4r6nnx3ddUx5lWpBhVFBRn4od9nLyt9ECjaq2
 IEsndYP4HmZpynv/GMLu58l4z4j4pTKXwU5VblnNl4nF1tSFe80p215ojNzp0+lDLfyg
 p418iVjoASz1D43D2gmR2MIVpTFRyspYOLLrlMJrHNwlb61kWKxcL1L3Do4h/NOyH0ZW
 9viKhye+u9e4BuQdJMZsD1O+4NgOtmX3SDD2YVR/pjISSYrhrgpczfFW8KRjeM9lM9lI
 al+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ILfedyfA7TPHqyBNZ/TjjapMKjWfHALaRNb6+vus4M=;
 b=uVcFqSxC2BQs8ThTXePlr+s8YzMQyikK1FM/j2KWbYlr2keJWq2tWAV83HI++ziexu
 GAkWEiVf47n1GpGwt6GDXswvdEcmAixCfwFVa8ZW9UzhvtguwlRvv26TMoYKuRC5Hg02
 ysn4izkoTO29ds4vH9+AplZG4OLM+hV1eZavn9v16eR4nzNgYYpjZ5l0nPgMdVWe3bE0
 8tY3HI/uvS1J6076kRRNKkobn5Xu6raH4fAzHvWBuf3+WBfjjH/VCpSWjRFs5y49clCL
 tMFp2oRu/bf7VM5CU2a+eOOv56UIGIVgMNKO1zAOpHYtQdNgpaeD1eT8enRseVIGwDIU
 dD9g==
X-Gm-Message-State: AOAM533r/78tcFrqTJo7NyrasE63RuLBCg5FTg4pdcKQgUHY0Ek2wNqe
 +O9P1rJ88ScVhxINgHFIOfkmj5gpBoYdRVR2lVVd6g==
X-Google-Smtp-Source: ABdhPJwTLSIAXa5bFuTiTTMynzBXUStSpSK/LG8Y7aRLbOSUVFSSUxJSmAev5mr9BMod3NxrEem3HLc3DORSEKl0b4g=
X-Received: by 2002:a7b:cc14:: with SMTP id f20mr2288363wmh.137.1631090289364; 
 Wed, 08 Sep 2021 01:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210726112511.78350-1-xypron.glpk@gmx.de>
In-Reply-To: <20210726112511.78350-1-xypron.glpk@gmx.de>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 8 Sep 2021 14:07:57 +0530
Message-ID: <CAAhSdy2qXrb9pJENgq-iXpHJmHqn9gzSrfyZoVGN=zaK2DhsLg@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: defconfig: enable BLK_DEV_NVME
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atish.patra@wdc.com>, 
 Anup Patel <anup.patel@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_013810_967146_3331C22B 
X-CRM114-Status: GOOD (  13.97  )
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

On Mon, Jul 26, 2021 at 4:55 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> NVMe is a non-volatile storage media attached via PCIe.
> As NVMe has much higher throughput than other block devices like
> SATA it is a must have for RISC-V. Enable CONFIG_BLK_DEV_NVME.
>
> The HiFive Unmatched is a board providing M.2 slots for NVMe drives.
> Enable CONFIG_PCIE_FU740.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

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
> --
> 2.30.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
