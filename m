Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9465AC77B60
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=5zplOStOoFCaqJaerhSbgqOW0lU/voTvqif9DH7JL2A=; b=KvCxOn5EI0KXRtS0M0Tv6eMgEo
	F1DEPUQJlNU0pIE1PDe8wOdPSHCFyoW8pKOIPKKBQygVV1vvolot6NyF4KWtPKC5YXhvozjpPmCK9
	0PAqLiazQH7U8pdYa4/JiKoBsXqYnP92I63Qf2pmfpzq31JyMMKxHotwkj726Db/6y2Q1cbUR7Lsx
	BMNTwiCkwK06vq/V9GM/Ka5stEICgtY5NZEa8BL67NUUlZp8s3MNGUMZjPrOy4C+4lbQ7amzw4N1J
	+TVEW2lGSop/8nF5F6n5LxOuaScRGkXu9jhbEW3C66OFlCUNUcgFvxnIFV/gdu5kutRFVtOHekTHX
	jrJAyIiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prg8P-004Ciw-24;
	Wed, 26 Apr 2023 14:28:41 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prg8M-004Chx-1p
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 14:28:39 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1a92513abebso75425635ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682519314; x=1685111314;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2zxN+51kTmRRhvTkz8C5RRZ+SlcUGbzZqD2x7sZii6Y=;
        b=ihewYFMvT/hjTDnt4kDa4P/YQEexZP+hDKO3d6JWJ8RwltrnIqxaakuDnhfv8EOP9q
         2XTZQV/mmxqzBNBLtLfwPTAaXFNNYP+kKLchZlJv/tFW9po685xiEAzvFM7xrUEL0xz1
         2rw6MeynYACVQ+pDkeSDP5afmi+vL/HHWSvTDWeR+g44ZK/salcTXzMQ0D5SmIcVJrCf
         d/hx2UmhSpN4htF/4Ec9N8vXosJ272hEasAq/dS9c3mqT2Uh7vAK+P0Aaspx1hyW5kmC
         C8TquSa/wqlmHoQU7iPrym//np/Scogt8klch2qQtOLCn7+pgGY2z4mYR6CdkR5cqAbW
         sO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682519314; x=1685111314;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zxN+51kTmRRhvTkz8C5RRZ+SlcUGbzZqD2x7sZii6Y=;
        b=ZPRjVDtxhGm0jTy9IqxZWnQIIn6XN/Yos4y9nXFMRbnbM7DqgXLoJniWoL5ftBUHD2
         fXFAu52w+gzVfHz/vTXF2dUvvg+h19qPu7jCcZsRf+FIGqclKatE+sg/+/6oxWFawvzt
         XoRA+P1ph4loaW2fVmQQRiro8IjKADsMzifqo8qk5+yAX/YMfXE+MtbjFcdiex/7cJp6
         0iqGh6KsERPt08NqZH1d7iFh0/z4PIZ/aUYjThJZOEpaT/J2/Z97CNVPMjL3jyAZqj0T
         etx/1oxysGzdG/9mEeDwc5N0ZqoZTHFZXhy/tpOSJ5kyZh44DoydNi7+N6sj+cpxGYjU
         462g==
X-Gm-Message-State: AAQBX9eCBX9xjfBwDD/2JR+rSOANb9uH1po0q7YEdcXB7G/O3E0wYHfG
	9J6afQ1ZmBMaFIbBFSJLP05IDnQAtNKAE6VwWX0=
X-Google-Smtp-Source: AKy350YR1Bl5RHXjM9s5lsJGEYu5apz6QLx/fMwtQiLLB/BN/jzx/1QiSynUTfY19XWsRTH/8nuD/w==
X-Received: by 2002:a17:902:d4c6:b0:1a1:cc5a:b04 with SMTP id o6-20020a170902d4c600b001a1cc5a0b04mr27183794plg.3.1682519314628;
        Wed, 26 Apr 2023 07:28:34 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id iw3-20020a170903044300b0019a5aa7eab0sm10043570plb.54.2023.04.26.07.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 07:28:34 -0700 (PDT)
Date: Wed, 26 Apr 2023 07:28:34 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Apr 2023 07:28:31 PDT (-0700)
Subject: Re: [PATCH] dmaengine: xilinx: enable on RISC-V platform
In-Reply-To: <20230426074248.19336-1-zong.li@sifive.com>
CC: vkoul@kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, zong.li@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-cdb02a07-40f9-4424-b3cf-938247588537@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_072838_609278_916D60D7 
X-CRM114-Status: GOOD (  16.57  )
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

On Wed, 26 Apr 2023 00:42:48 PDT (-0700), zong.li@sifive.com wrote:
> Enable the xilinx dmaengine driver on RISC-V platform. We have verified
> the CDMA on RISC-V platform, enable this configuration to allow build on
> RISC-V.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  drivers/dma/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index fb7073fc034f..816f619804b9 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -695,7 +695,7 @@ config XGENE_DMA
>
>  config XILINX_DMA
>  	tristate "Xilinx AXI DMAS Engine"
> -	depends on (ARCH_ZYNQ || MICROBLAZE || ARM64)
> +	depends on (ARCH_ZYNQ || MICROBLAZE || ARM64 || RISCV)
>  	select DMA_ENGINE
>  	help
>  	  Enable support for Xilinx AXI VDMA Soft IP.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
