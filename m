Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8349CC71153
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 20:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vD/B+AqgIaSeB9WfY6i9BlNsxzHjlA5rPYH7A0WOZ6E=; b=rapjdCaDwV3dXY
	DKBHfqKqK64FXNg4z9jx+zSFgsD3eF/kRsvx7W94xVrVWb5Vvcx9AOGhbjkiF44TsRL30FzncBTav
	uvv5B6stVeubzeZopAnUUGC+ig34nD2XDXjIqzh9hFUdnknI76lupRZ6yYIZE8LaV8+9KNCO6owaz
	4SGmdlmWyFLOxgw9czKgwFPopYl7knCPXzdF0K/55v5YrNhWe5tWdrfSu8j+ERg41nhH17qiLzHbO
	1ULKQAuIibiX7bbHke50dD4yh28/nFUxtWZtM/Lmcxa9i/9sIQ49WPkXbbAiOdIpRsnFlarGRdZC5
	nAvxN+c+4Gc2BxkoMdOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdG5m-004kU9-26;
	Mon, 04 Sep 2023 20:22:38 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdG5j-004kTb-1O
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 20:22:37 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-68c0d4cc3a4so1026760b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 13:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1693858954; x=1694463754; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sE+FlBZ0KYIiVYmRnx2Za3tZtM1vnyzitJj3+gSyToE=;
        b=X86y821Ea3cgwOyLTfVomKqsuFWzHlAp93xiHy3do7SRXc4eUsyZu7Vyq3wOvoTUPg
         9p9na2WGbA1AFoNShcQr8dE1QR5kUw9sG/DWSpLY0LDxuGXrU/NqcC4BNq8GaepF1RgQ
         utbY12ov7pIlm6CQaFsBIvkC70+E25Zmk7yajdRFyulypcglWtn2oMwYKclxeGU87SmM
         wLFnxtnuWhF1tzzojqkLdYhDuW5LyCommAKAb/LqoFLhF9WpetOCiv/WveAV6C+pMd2i
         p2gbWSub4SJh6yd1Ixq25Lts+sTCyYZaSRdn2ziYJgx8nraff1FRg4YuG2VF6wCgPRdo
         yEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693858954; x=1694463754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sE+FlBZ0KYIiVYmRnx2Za3tZtM1vnyzitJj3+gSyToE=;
        b=GA62fiZ3+lRzL/KTefH1Mx5nd9KqYGIBHSGMPIxszsKzduSlk8mK9JYfjvxjMZ2TRh
         73jbqmae0txikOrMfRbPzMQVrUfGpM2XBNGV5v6r2SGlmKZ9WoSa9GnOjq0+YjSuWcka
         ys6qjnaRWXtQY61dD8JvGFVJwieLDIYHDM+Z5/4mC7OJLlk9a11UECv3RvFV8/W0LxAI
         cAq9LwkE97bmr3Q15btD3VEiZSH8VnRgcjSCcWRommPTRQxsmjEb0kM7uZa/ELdI1zeR
         ah5g+dpA0hAx1104cSDoNoqxtfLoUXGCOqhbYA259jDQfmUUqL5az7YXyBMbecuZBbeU
         G2uw==
X-Gm-Message-State: AOJu0Yw2fasAU7MNLjiSZkqv9yrxK3k9ou5+cfHfOXlKU/sJiyDKyIhn
	MKTqNJq4tvJ/ayq9eJGd1V8IUA==
X-Google-Smtp-Source: AGHT+IHKDIdLfsv7nmFqSNCjsF2ZBWBdJsYxqF8mF/BfAWpu96P9iOb0N9jOCanVylwHFYXu1I1mqQ==
X-Received: by 2002:a05:6a21:6d9f:b0:13a:43e8:3fa6 with SMTP id wl31-20020a056a216d9f00b0013a43e83fa6mr10844133pzb.23.1693858954385;
        Mon, 04 Sep 2023 13:22:34 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:5de2:2323:20de:e26d])
        by smtp.gmail.com with ESMTPSA id u6-20020a170902e5c600b001b8b2fb52d4sm7894454plf.203.2023.09.04.13.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 13:22:33 -0700 (PDT)
Date: Mon, 4 Sep 2023 13:22:32 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: update T-Head memory type definitions
Message-ID: <ZPY8iB6BV9wXTqPV@x1>
References: <20230827090644.1318-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827090644.1318-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_132235_467968_6BBBB0A3 
X-CRM114-Status: GOOD (  16.75  )
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

On Sun, Aug 27, 2023 at 05:06:44PM +0800, Jisheng Zhang wrote:
> Update T-Head memory type definitions according to C910 doc [1]
> For NC and IO, SH property isn't configurable, hardcoded as SH,
> so set SH for NOCACHE and IO.
> 
> And also set bit[61](Bufferable) for NOCACHE according to the
> table 6.1 in the doc [1].
> 
> Link: https://github.com/T-head-Semi/openc910 [1]
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/pgtable-64.h | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index 7a5097202e15..9a2c780a11e9 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -126,14 +126,18 @@ enum napot_cont_order {
>  
>  /*
>   * [63:59] T-Head Memory Type definitions:
> - *
> - * 00000 - NC   Weakly-ordered, Non-cacheable, Non-bufferable, Non-shareable, Non-trustable
> + * bit[63] SO - Strong Order
> + * bit[62] C - Cacheable
> + * bit[61] B - Bufferable
> + * bit[60] SH - Shareable
> + * bit[59] Sec - Trustable
> + * 00110 - NC   Weakly-ordered, Non-cacheable, Bufferable, Shareable, Non-trustable
>   * 01110 - PMA  Weakly-ordered, Cacheable, Bufferable, Shareable, Non-trustable
> - * 10000 - IO   Strongly-ordered, Non-cacheable, Non-bufferable, Non-shareable, Non-trustable
> + * 10010 - IO   Strongly-ordered, Non-cacheable, Non-bufferable, Shareable, Non-trustable
>   */
>  #define _PAGE_PMA_THEAD		((1UL << 62) | (1UL << 61) | (1UL << 60))
> -#define _PAGE_NOCACHE_THEAD	0UL
> -#define _PAGE_IO_THEAD		(1UL << 63)
> +#define _PAGE_NOCACHE_THEAD	((1UL < 61) | (1UL << 60))
> +#define _PAGE_IO_THEAD		((1UL << 63) | (1UL << 60))
>  #define _PAGE_MTMASK_THEAD	(_PAGE_PMA_THEAD | _PAGE_IO_THEAD | (1UL << 59))
>  
>  static inline u64 riscv_page_mtmask(void)
> -- 
> 2.40.1
> 

Tested-by: Drew Fustini <dfustini@baylibre.com>

I applied this on top of:

 [1] riscv: errata: improve T-Head CMO
 [2] riscv: dts: thead: set dma-noncoherent to soc bus
 [3] RISC-V: Add basic eMMC support for BeagleV Ahead 

The BeagleV Ahead eMMC continues to function okay in ADMA mode after
this patch was applied.

Thanks,
Drew

[1] https://lore.kernel.org/linux-riscv/20230827090813.1353-1-jszhang@kernel.org/
[2] https://lore.kernel.org/linux-riscv/ZOIBQI3L4kP7c%2FT1@xhacker/
[3] https://lore.kernel.org/linux-riscv/20230724-th1520-emmc-v2-0-132ed2e2171e@baylibre.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
