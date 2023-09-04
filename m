Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181CFC71153
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 19:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JeVU5qqBsNBvqZo44Xyftheeq6CgL5RwqGxqdQ/3+O8=; b=ttVVZxiYYvRUj4
	pmvZe7SxOkKDJSBZxu+h6fh42HK8/j6xJzdIcXqDVjgRm1rVIepKjMyp6mdjURC9CUgzkqCAgt9bj
	mAHTaczqv7mJCXltDbwA/uMM+L0/EBJFXRrZ5Yjet5cKPhEIVrrn+CNkn8tyYhiIN41qHBWy03v1Y
	lRk961EHy8ZE95qS6aWpIdejv91YLQSTdvATmLhQ+FJd5FSGAgQrnAXKqCDz24d9MsMpe708tGuIQ
	7iXNuRQ0QRNDDmdVlt/gVhGmkGf0p5M2HgmaoTHvS1ikvvO9xJkSZj8eHnZy7I5miyfC8+EH2K1uq
	GzOd3xUVKdhPO+7R+C8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdFTz-004iAL-1T;
	Mon, 04 Sep 2023 19:43:35 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdFTv-004i9l-2U
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 19:43:33 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-56f84de64b9so1048966a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 12:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1693856608; x=1694461408; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rpgtqNc982jm6C77O91KC+VtBx5DYfDGNKAMWB7AFSc=;
        b=n9GzO3lqCW/IuWA66LXwjVbrmhBvYXCOWecPvKwXc1YO0H6Wnckhr6p2Ry3ibgfU3d
         6PU+VW5vWice9xFB4h308+oqcYe6dh3lUXfuRDj5z/xbx55m3TWTXq2DrsU2Mq35k8iv
         XcFOwjvbgM8fkLc/ifYrnx20Tmb4NXW9uAw+f8ez0CJwTUkQCysugxmC7CzeFm6be4w6
         k4vLq4VMu2H9DdG35WAM2z2FFwhKcML2NM18SRl+j3qpMERVz5K0humSkCCkLvUc7U5i
         s5uoSUa6VOentVRNXmX4NohRo3SNyFa6Y+M5u/GfrB8ZV0E2VOsNwBVXb5PdFwS12Pur
         rsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693856608; x=1694461408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpgtqNc982jm6C77O91KC+VtBx5DYfDGNKAMWB7AFSc=;
        b=PhgsSl4x2qVcMu4IX2NHPg/S4CguxE27zHznqPuRxwar1eJzcuxTzbjECCYN/LLDRx
         oQj6mH4TbAEjANtEQfcvTZ/hllfN4AltyxDVWS4fA01wOMuvIZzDHDGEDzRA4ULTXtgz
         6Ui5YVx49Hw6B9j79C2v7RLn56Dp6Aa1+UJNHdsrQBKstQ9hF9csFHp/JgDSsrQNx9OO
         gWDPUnzhQcFVMdurhPJi6QEU3uRF3FwURaIxLLVbui+3Ezv1UJO2pcQnnk+Z6i0/yRc8
         nnxf7nWUjAu7imtzfgfjHcD28u0oSf8u6KO1eT9/9ZuZ29o30rdh+w+MnvnSuUfvh1iH
         TdLw==
X-Gm-Message-State: AOJu0YyYy9jUPz9oilG4RVCLy7WbrjNSv4ZXf7X+w12fx8viZuulml1z
	0Wyu22QmG0htXvdHXABKL6zIbA==
X-Google-Smtp-Source: AGHT+IGfcS2SDfogz0dRFnKhjncd+2SLbW5sc2UgXzdJiBdlv5fZg3HB0wO/3nWY6uYOWCJ5JMOBXg==
X-Received: by 2002:a05:6a20:441c:b0:14e:2208:d62f with SMTP id ce28-20020a056a20441c00b0014e2208d62fmr17267240pzb.22.1693856608420;
        Mon, 04 Sep 2023 12:43:28 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:5de2:2323:20de:e26d])
        by smtp.gmail.com with ESMTPSA id y14-20020aa7854e000000b00687a4b66697sm7962611pfn.16.2023.09.04.12.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 12:43:27 -0700 (PDT)
Date: Mon, 4 Sep 2023 12:43:25 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 1/2] riscv: errata: fix T-Head dcache.cva encoding
Message-ID: <ZPYzXeYGyGCxJUuK@x1>
References: <20230827090813.1353-1-jszhang@kernel.org>
 <20230827090813.1353-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827090813.1353-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_124331_833334_D38F0492 
X-CRM114-Status: GOOD (  20.36  )
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
Cc: Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Aug 27, 2023 at 05:08:12PM +0800, Jisheng Zhang wrote:
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> The dcache.cva encoding shown in the comments are wrong, it's for
> dcache.cval1 (which is restricted to L1) instead.
> 
> Fix this in the comment and in the hardcoded instruction.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Tested-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/errata_list.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index fb1a810f3d8c..feab334dd832 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -100,7 +100,7 @@ asm volatile(ALTERNATIVE(						\
>   * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
>   *   0000001    01001      rs1       000      00000  0001011
>   * dcache.cva rs1 (clean, virtual address)
> - *   0000001    00100      rs1       000      00000  0001011
> + *   0000001    00101      rs1       000      00000  0001011
>   *
>   * dcache.cipa rs1 (clean then invalidate, physical address)
>   * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> @@ -113,7 +113,7 @@ asm volatile(ALTERNATIVE(						\
>   *   0000000    11001     00000      000      00000  0001011
>   */
>  #define THEAD_inval_A0	".long 0x0265000b"
> -#define THEAD_clean_A0	".long 0x0245000b"
> +#define THEAD_clean_A0	".long 0x0255000b"
>  #define THEAD_flush_A0	".long 0x0275000b"
>  #define THEAD_SYNC_S	".long 0x0190000b"
>  
> -- 
> 2.40.1
> 

Tested-by: Drew Fustini <dfustini@baylibre.com>

I applied this on top of the emmc series [1] and the dma-noncoherent dts
patch [2]. SDMA is now working with this patch applied. Before this
patch, the filesystems on the emmc were corrupted after mounting. It
makes sense that problem is solved by the correct cache clean
instruction being used.

Thanks,
Drew

[1] https://lore.kernel.org/linux-riscv/20230724-th1520-emmc-v2-0-132ed2e2171e@baylibre.com/
[2] https://lore.kernel.org/linux-riscv/ZOIBQI3L4kP7c%2FT1@xhacker/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
