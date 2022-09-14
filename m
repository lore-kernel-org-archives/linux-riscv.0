Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29A1C6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Sep 2022 14:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3qsMTcg+k1uAuKX1lKBdOVNxBHMrW7QqHerFJHkb+AU=; b=KnYeqbKUqhs8Xk
	03ZBnSZzjt7a4E4MXgF4g4fbYjyExIsZv+Fxjq8A0b3iR7Dwxl7zthQCmxyVEq17J80TDNCmsnjIM
	H4gos8zZ4x20kJ52haKfU7inmuXglAl3NkvoaZVVXVEzKyFKX2BbUbK9H6bO4irP0X+tyAC9MTVHC
	8t6UzkuUKBZGDSuVOIGHvO/e223y6cKRE0oEK5B9d2fo7U8MlFtbVcEpWYlS96uTXrrExv4KZziHZ
	b3XVb9/mvWve8S2TDOrJ24/KsdUHh075hOBW+vAMNvyHxNTFRO5g4DUJM605N9sa02k5U+F22mBqI
	NzwPM2tXJeOFVxAFhPnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTf5-002iHm-Da; Wed, 14 Sep 2022 14:46:47 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTey-002i2U-Jc
	for linux-riscv@lists.infradead.org; Wed, 14 Sep 2022 14:46:45 +0000
Received: by mail-lj1-x22d.google.com with SMTP id j13so3827007ljh.4
        for <linux-riscv@lists.infradead.org>; Wed, 14 Sep 2022 07:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=yFBebUCwSPXUndDmnx4ILtpDNEt+w0pNgkUchyqlY/4=;
        b=Z9BPJduIlc//T0Vt1PB01Yb6n0lwgEbV/STvSyKC30h179kN4wwpsaGVdouCDqAzRh
         9hM16pq7R/rS6hVil3iR1xgD3StLW1n37F9S5B1kqdf80XNjIOGlw1BGwNaJeWImrGBM
         aHTzNHHPDOafUqPk1RLQc8JlQDEEEyBZDXipm6jzIEzi7vpOprHKwOSmGE5T7LfEVN8P
         BG3QUqS/MTcP5wcptoyChKIucsXzJbFKRJq8/0YOP3UyTgFwf0LSnX9aC0sPGgq4A6u3
         j3Vshi4S7wir4IVfWTNR/NNWW+zdjAKv0QpWBbW6y05X3N9dAUBJPCSSdmqwaBfTPC4e
         Y8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yFBebUCwSPXUndDmnx4ILtpDNEt+w0pNgkUchyqlY/4=;
        b=OSp12r6IJVZD6VDXs2a/X3jVm1yYfUqXPCIaELzHYMYV/GgPZc/2bWPS11fmfiviqD
         YU2iaGfeAYtVg90kewJww6cBog1od86aioZmoKACbFQLlkm28MSq3bo+7sGCq8+7v+H2
         /hSYm1wZ+rvz/MhymY3c8Yp+RQmfz2hbnHCYhVwJgSUElb6uR8Wrp0Ky8udfnpRtJTfL
         0rA5yk0ido287ZJIlS8FleWgIrvr/NM76HZdQVo4bD9RUp0eMfMi21CUeuvImNmCOI/n
         yjlSi8nyxrqy/JRnOzYzA2WL13FH08+NvdSKWetJfPpKBRwkNtuSu/EaXhsAof2BAh2e
         Mf5g==
X-Gm-Message-State: ACgBeo24rVpn9Z1Cg4P7B6VwY54IhfegUEi1eK1CqegMXgNi2s29OYxv
	KhTBRjs4tv7clmwDG+IScjIxfrrugpYvM5y7SGJuUg==
X-Google-Smtp-Source: AA6agR4uFhBmrwZpIzLOs556mUpo4kdWdjtQRwBsK0Pps9EVQyik6QkJDY7BUahqZyXHXm4Pr8XKEcXLkRKPWUrdr+U=
X-Received: by 2002:a2e:8917:0:b0:26a:a520:db52 with SMTP id
 d23-20020a2e8917000000b0026aa520db52mr10469617lji.289.1663166797764; Wed, 14
 Sep 2022 07:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220914143648.74022-1-heiko@sntech.de>
In-Reply-To: <20220914143648.74022-1-heiko@sntech.de>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 14 Sep 2022 20:16:25 +0530
Message-ID: <CAK9=C2V+4bn_xi-u0Z0TLmtir02em66PBS2tcaD9DCXKxqxzhA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: move riscv_cbom_block_size to the correct #ifdef block
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@rivosinc.com, linux-riscv@lists.infradead.org, nathan@kernel.org, 
	mail@conchuod.ie, atishp@atishpatra.org, ajones@ventanamicro.com, 
	anup@brainfault.org, conor.dooley@microchip.com, 
	kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_074640_675311_5A1FAE25 
X-CRM114-Status: GOOD (  19.94  )
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

On Wed, Sep 14, 2022 at 8:07 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> riscv_cbom_block_size is used by all current non-coherent dma operations,
> not only the zicbom variant. So move it over the block also containing
> the riscv_noncoherent_supported() prototype.

At the moment, only non-coherent DMA operations use riscv_cbom_block_size
but soon we have other parties using it as well. For example, the RISC-V PMEM
support and KVM RISC-V Zicbom support.

I am not sure if this is the right thing to do.

Regards,
Anup

>
> Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/include/asm/cacheflush.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index a89c005b4bbf..5c16d901d3da 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -43,13 +43,13 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
>  #endif /* CONFIG_SMP */
>
>  #ifdef CONFIG_RISCV_ISA_ZICBOM
> -extern unsigned int riscv_cbom_block_size;
>  void riscv_init_cbom_blocksize(void);
>  #else
>  static inline void riscv_init_cbom_blocksize(void) { }
>  #endif
>
>  #ifdef CONFIG_RISCV_DMA_NONCOHERENT
> +extern unsigned int riscv_cbom_block_size;
>  void riscv_noncoherent_supported(void);
>  #endif
>
> --
> 2.35.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
