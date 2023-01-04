Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE4AC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 10:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i78LL/Y3mWsKA75tHJvpGiB6P10jUuAGvPQJWuOHNGY=; b=ve+CYrL0uFw/Zq
	dNpCU2jCyCEm4RjI6E0fKZoBxGqGSM+Xj9mabvUvil9v4TNtQSSmH03ZZmUxbdpzOpHAf9PxYMfdn
	mowhWvabAPJpcBWzSCm8DPEsKPdn7k9LUnaVjYW0pMxpqrjLEBf0deRxm+/a7WRROyyopFjih5Zr2
	A4v5yD0HNHnHZAiwuJ9etkvUnob9vGtcdhDECObraHjeRqDURaxtKFrp7oTzTWwe3d8X2iQU2q15t
	sT/hG+Yd2RGC2fcN46NcIMFZDw74l0LWxsfBLTsEaK9cLCkyRDiLZWsUdL0BKdDp6swGoG5QlqtQN
	x7bYXtwcOZubAezDMRiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD0aW-008Hi5-3B; Wed, 04 Jan 2023 10:01:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzUF-007mvi-FJ
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 08:51:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 75CC5615E0
	for <linux-riscv@lists.infradead.org>; Wed,  4 Jan 2023 08:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94C8C433D2
	for <linux-riscv@lists.infradead.org>; Wed,  4 Jan 2023 08:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672822261;
	bh=BAa/Fb4Ybg4enWz1rxJLnXeOGBYh9ADpZmSkL1qRZg0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mgkhdwz9K/1kUcvSJSL2wWD5otFO4451IjcYtsMOZO6Ftoeijv3wDlAlAYfk+VHlq
	 LP4D+gTYwxTU0H0dOfwy+DDL1EVlnN7IiPb8Xfe56FUCwhyTUZZPsShuQJts5UQ7EA
	 XKIqvQjDDGWb+8fyQfOfZc2HKZu7ZAF4lIQ7i9AUjVQ/lk8LfNJgDDUKuScog885p6
	 YyhA5dU3apPaoESDuCV0owWErhIWkRBFHrhzMIqqm6+domJ//DRY+rFXUf9zQwEGQ0
	 O9CLkQOdJ8CLZ2W/I+xPcREc5vywt1Q4s6FHeZOg9rjOo92MlXMPfoSJyAjKgNTLtq
	 +uXEGb8iLrNYQ==
Received: by mail-ej1-f43.google.com with SMTP id tz12so80959767ejc.9
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jan 2023 00:51:01 -0800 (PST)
X-Gm-Message-State: AFqh2kqsPh9RfKVCulYMLA23a9VFRLmqhDZk9hiRmE7AjExGlV9dam8+
	oyFk7K6zki8jNZ4yO/8DE8Reayys8S5xXNi272w=
X-Google-Smtp-Source: AMrXdXuUiz5OOTTeQZ0iuBYxnbOgxe/GyCd9Zfk6syDioGxgdqEXRSkq0CPWwolmi8ZjVryTX9WR0edCVP+atSz0rJ4=
X-Received: by 2002:a17:906:66d8:b0:7c4:efcf:3bc8 with SMTP id
 k24-20020a17090666d800b007c4efcf3bc8mr5732010ejp.702.1672822260122; Wed, 04
 Jan 2023 00:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20230104074146.578485-1-uwu@icenowy.me> <20230104074146.578485-3-uwu@icenowy.me>
In-Reply-To: <20230104074146.578485-3-uwu@icenowy.me>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 4 Jan 2023 16:50:48 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSb4qEPHw8hy1ro+UMoyKQaoQESNGveSGLdPL=cXac8jQ@mail.gmail.com>
Message-ID: <CAJF2gTSb4qEPHw8hy1ro+UMoyKQaoQESNGveSGLdPL=cXac8jQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] riscv: use VA+PA variant of CMO macros for DMA synchorization
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, 
	Samuel Holland <samuel@sholland.org>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_005103_637679_2B3FB0D6 
X-CRM114-Status: GOOD (  18.79  )
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

On Wed, Jan 4, 2023 at 3:43 PM Icenowy Zheng <uwu@icenowy.me> wrote:
>
> DMA synchorization is done on PA and the VA is calculated from the PA.
>
> Use the alternative macro variant that takes both VA and PA as
> parameters, thus in case the ISA extension used support PA directly, the
> overhead for re-converting VA to PA can be omitted.
>
> Suggested-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  arch/riscv/mm/dma-noncoherent.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index d919efab6eba..a751f4aece62 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -19,13 +19,13 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>
>         switch (dir) {
>         case DMA_TO_DEVICE:
> -               ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> +               ALT_CMO_OP_VPA(clean, vaddr, paddr, size, riscv_cbom_block_size);
ALT_CMO_OP -> ALT_CMO_OP_VPA, is the renaming necessary?

Others:
Reviewed-by: Guo Ren <guoren@kernel.org>

>                 break;
>         case DMA_FROM_DEVICE:
> -               ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> +               ALT_CMO_OP_VPA(clean, vaddr, paddr, size, riscv_cbom_block_size);
>                 break;
>         case DMA_BIDIRECTIONAL:
> -               ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +               ALT_CMO_OP_VPA(flush, vaddr, paddr, size, riscv_cbom_block_size);
>                 break;
>         default:
>                 break;
> @@ -42,7 +42,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
>                 break;
>         case DMA_FROM_DEVICE:
>         case DMA_BIDIRECTIONAL:
> -               ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +               ALT_CMO_OP_VPA(flush, vaddr, paddr, size, riscv_cbom_block_size);
>                 break;
>         default:
>                 break;
> --
> 2.38.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
