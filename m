Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115D3C83F10
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 10:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hAvl0kfP7i7ujjcEMts0iNK/DgXbBczz2vNP26Qx81I=; b=Jq6NrWhBUpPDxJ
	gSWQY6wkZ06YYG1r0HVmgRTdM6TTWgG+dCmA9eEEcFM8+TMQvwth6Olxx839XShuJTtXxvGbrn2Ob
	2E239co4cCGnVeAAyzyVityK5C7CeNZb10Dn51+sRjj2kr4WaZ0fRFaN2IlqfS1kTW+FwzfoQjBct
	DdTTDLITrdfGYtyEHKNNh2h2HMMF1jLcHHMAVEeW6Sfm7io63bwDOJSryOmeseCCCssSPhoSxU/SG
	zyxRN2gmnkHOwFMMLMHPcYHe0KxNqn/kiEWAD98FsoKdHEUlfiZn0rCZWgVBBByvu7DjB5yn6O0/d
	Jg6e/54domDzuIi7zhDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaD6L-007whe-1I;
	Sun, 27 Aug 2023 10:34:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaD6J-007whJ-1m
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 10:34:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E921D6203E;
	Sun, 27 Aug 2023 10:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED788C433C8;
	Sun, 27 Aug 2023 10:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693132474;
	bh=e5QUzPSQpe5m0BHjZDjZtmHkd1XzzyDtkKMwZgcBzqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uOFIXMTuEDDZzHghgMd/2KXKH2+SLpeDrAJMYRyDEcBiCUuBsUygrfbCUjZqqe1Pe
	 jVDrug2/YNru5OmQ3LcYMMUOPFXI6AJbUx7madmz8SO2JUsaS+H4/d2F4XF91QZk6G
	 0/FCZxjRAlM0uF3//TsLN77lSdgAuv7bJW2B0brk05fk1Isbqtqj+jUkAY8q/EZUv6
	 TU+xKpTxrVyXr6HZSLiBJFaz0S1P/J1ANwgGzx2W9OItfKZBJLRxGxe6hCubsGoWhU
	 AY6btcJQ735GLEGFS9pHN2IIRIw1HhGbzlDF7CtyXHrVGHs83mI6y+qMkciGgStDTu
	 fjz5AyWEijx2w==
Date: Sun, 27 Aug 2023 18:22:44 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Palmer Dabbelt <palmer@rivosinc.com>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v3 2/3] riscv: dma-mapping: skip invalidation before
 bidirectional DMA
Message-ID: <ZOsj9HROczmyaS2L@xhacker>
References: <20230816232336.164413-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230816232336.164413-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230816232336.164413-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_033435_638248_35CDF5B9 
X-CRM114-Status: GOOD (  19.51  )
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

On Thu, Aug 17, 2023 at 12:23:35AM +0100, Prabhakar wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> For a DMA_BIDIRECTIONAL transfer, the caches have to be cleaned
> first to let the device see data written by the CPU, and invalidated
> after the transfer to let the CPU see data written by the device.
> 
> riscv also invalidates the caches before the transfer, which does
> not appear to serve any purpose.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> * No change
> 
> v1->v2
>  * Included RB and ACKs
> ---
>  arch/riscv/mm/dma-noncoherent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index 94614cf61cdd..fc6377a64c8d 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -25,7 +25,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>  		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
>  		break;
>  	case DMA_BIDIRECTIONAL:
> -		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);

The code could be simplified a lot since after this patch, the action
is always "clean".

Thanks
>  		break;
>  	default:
>  		break;
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
