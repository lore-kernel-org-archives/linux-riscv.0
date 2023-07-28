Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4839CC001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 12:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z79rg9/AdIGQxjXvzbuG9FFK5iZ1RvBj7qnIN3cDcGQ=; b=be+qju2ASQRjXG
	Ww6R64gjqAdCbIAlm12SuDUg5aNX4rblxEdNQoDM4s/tTxWa7DSz/gtVuXjhwAg2v+t8TCdz9/GrU
	e85psvzhslDfJyD+uvAdMA9YMQRRXlVJ8+WzR1u4GQLX/GrQg0NLYKh0OHNuKrZeKFdVwjxo6kZEc
	1RVXqtrTCe/x8FCQynSQfA4Y2265AcAy4JVqNlK990Pd6e0uzYfP5NprQG65Fwh2v6GmCCPuq+OxJ
	WfMWefr1EnXYjzNiESRK9hC+iiAB/9ZEGi6ztdJ8S5mruUeYlfc3g4U0ZWtR2hgf3hG45fGIkFaFq
	lJGLTMS/2+ME/32OwDrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN1v-003S3t-0T;
	Fri, 28 Jul 2023 12:57:15 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPN1s-003RjF-0L
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 12:57:13 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso3471219e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 05:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690549026; x=1691153826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7TcuxbE1UmD9Aws4Vk4iwIGKsEWIhL1t3hDINkZP8BM=;
        b=MJq+yStd64RJULVR6xIyGKMfDvJY/8gPnfCgrWUJ2PGBeiEnLeBY+gxcUgbEZhMYah
         OOl137jgbX5DbfJSptbCfz75WzP42GHTgJBubqWJI0NfAuQ1YO7OrLLyzsaL+otn0o+P
         nkdb2Elzr3r+odfHe2sh9YYEDp1TnroP2YkvgHcGQjKjGOProLgadzRBGENGhEJS84Ys
         SRcPgU3Q4mDBytkFD1slMZEAJMtaQ5QjJ11MPABWQ6zph1XZL9nZVwOnwVPZYVIAHqDG
         frG6dXdhI57xX7QEE+Ct6rAmW2dENPQfYtjqlOo9lMP5InM6v3WXrkSSHBpmbIAaDPNd
         Wcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690549026; x=1691153826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TcuxbE1UmD9Aws4Vk4iwIGKsEWIhL1t3hDINkZP8BM=;
        b=ES/YdQGl1ZTZ06O4bdm9EhvWX8HpNHKSBwDnpqsSF0Ak8GWW2fGzLi6PZs4iIed7SX
         kac1WG59I7w2I26kOvbN3mZJ2G4nH6QJr7jx84XCCqzd/oSgPc5sksaoUym23LEcFVms
         vlMHYRi53yNktNE7sCGu0GdbMcD/bBsw2nZn04ma2Tr44noixYMagFgWVESivxf71SbI
         JVXtxBReKzZX5pm9945Jd0bIEXHOIlKEp/DdG9SxOMQI+VXHku5+edlOO59hnFr7mXcc
         8ULIIZD9kOQbcF78fq3dGD+3v09RneV5DhaLsVFrwDX0liUR6meqFGu5GoUWGzpOWWK5
         ufvg==
X-Gm-Message-State: ABy/qLZCjJv7Y05JCXMpdLwDBgOIzKvKexVWwiLhKvC1Fo/l15OY2dfQ
	foKJ2NyzeBB7UFdFM73mnfq7UQ==
X-Google-Smtp-Source: APBJJlGAVzKRZrbvPLrokCZ6PchUVUuxj0h7VwayM1HDhdl1TGZU2eHqQdxRs3d1Jy/+SVoWyEI0zw==
X-Received: by 2002:a05:6512:3d06:b0:4f8:4177:e087 with SMTP id d6-20020a0565123d0600b004f84177e087mr1909770lfv.47.1690549025552;
        Fri, 28 Jul 2023 05:57:05 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id w16-20020a50fa90000000b0052275deb475sm1774659edr.23.2023.07.28.05.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 05:57:04 -0700 (PDT)
Date: Fri, 28 Jul 2023 14:57:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] riscv: vdso.lds.S: merge .data section into .rodata
 section
Message-ID: <20230728-cec389a85a7dc8dcca803e06@orel>
References: <20230726173024.3684-1-jszhang@kernel.org>
 <20230726173024.3684-3-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230726173024.3684-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_055712_151135_D91CE4EB 
X-CRM114-Status: GOOD (  16.72  )
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

On Thu, Jul 27, 2023 at 01:30:23AM +0800, Jisheng Zhang wrote:
> The .data section doesn't need to be separate from .rodata section,
> they are both readonly.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/vdso/vdso.lds.S | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
> index d43fd7c7dd11..671aa21769bc 100644
> --- a/arch/riscv/kernel/vdso/vdso.lds.S
> +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> @@ -29,7 +29,13 @@ SECTIONS
>  	.eh_frame_hdr	: { *(.eh_frame_hdr) }		:text	:eh_frame_hdr
>  	.eh_frame	: { KEEP (*(.eh_frame)) }	:text
>  
> -	.rodata		: { *(.rodata .rodata.* .gnu.linkonce.r.*) }
> +	.rodata		: {
> +		*(.rodata .rodata.* .gnu.linkonce.r.*)
> +		*(.got.plt) *(.got)
> +		*(.data .data.* .gnu.linkonce.d.*)
> +		*(.dynbss)
> +		*(.bss .bss.* .gnu.linkonce.b.*)

Looking at other architectures, it appears the last three lines of
sections could be discarded, but I don't know enough about this to
state they should be.

Thanks,
drew


> +	}
>  
>  	/*
>  	 * This linker script is used both with -r and with -shared.
> @@ -44,13 +50,6 @@ SECTIONS
>  	.alternative : {
>  		*(.alternative)
>  	}
> -
> -	.data		: {
> -		*(.got.plt) *(.got)
> -		*(.data .data.* .gnu.linkonce.d.*)
> -		*(.dynbss)
> -		*(.bss .bss.* .gnu.linkonce.b.*)
> -	}
>  }
>  
>  /*
> -- 
> 2.40.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
