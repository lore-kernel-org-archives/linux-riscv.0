Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E209C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 03:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfuBHR7F8H7saWDk6bIlUPpBrwJQbc07l4/3s8Mki3c=; b=FEvcalmzySqPTl
	QatdHAr8Ve2F0Cj+9XkJPrlrXX/Vk3HyfM9YxMHuPIowakXiGuCtV6PNq2W/k1ZgH9ctjRC2WHWRx
	r/8Dfnzu9x5y8PDJphFZZ11/CCOmoFZVS0cI73ca74PDMmWfbwpPwvkxrCuZ5U+bhkFiNJhFFsK1V
	2M0L5T2cCebFewRVObxNKrNX5Lqy2LBWHfimnKVT825nUxNqWpPwQ00qLfSukOwD4cLe70KcBdY+0
	OdEut9cmQ0UL/mlMAFywD5QwxQktWTCTjmk5g99DWPAPJ6bci+64Ci5+zVNRoSzF3o+L362m8Vn27
	xB7z1xvIhrn+ntm60PGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpMjo-000jzt-EV; Tue, 23 Nov 2021 03:44:56 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpMjl-000jzK-OR
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 03:44:55 +0000
Received: by mail-wr1-x42d.google.com with SMTP id u18so36465872wrg.5
 for <linux-riscv@lists.infradead.org>; Mon, 22 Nov 2021 19:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=prwznrXYx9FivXvITlLw7CLoLZmuSVyES8AT5odxIYI=;
 b=5xkqb0Srh9HW2cGmAjMw/k8621P0nS5Xol4Wut4aWzRk0M1N1D5DMem+F9C9MArH0h
 Rv2nrncH79zJ680Zm/eIBFDEdu9IABBCtf6j2MANu0FviFQvMN9rZdmkoVVhso0I5c3n
 N8Hl9c/OQ1ZYynCCUhLBHkeVcDzzH6buwP8KMEAouNTiMmYoBUETfUbw+ktLQQZjasQK
 YMd1KV85JWJ/8EuXs2GuvO+0oVVTy9agvsQAVVzAkewCZxyuWIidU+Fxz8fH0DviECbh
 2jO/oE3jailGlq7GUJ5LPB71S4nnmFGzqo+C+6dHV44mWlLlQXhyeuoG8AePQ9+gR2Ly
 7n9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=prwznrXYx9FivXvITlLw7CLoLZmuSVyES8AT5odxIYI=;
 b=22AmcAqtWIJgkDArlii7Yo/V7f2uO3c4GjFwA77hItLJskM/f3mF8CQZSbOsV8nUcv
 S653hF3igjgMnjCHx2iiHjobuQH+MO/3v05uPj8lUCyY8CKanWWoo2aGFzcD1ZCLlHnK
 W61GyQRpZDiCldhP9/dD+ZT2+3SZ0T9w2P98hzvDC2tq5ELfjfqHbmQVK+Di0PBRsAZ9
 yhONeWHl4mPGljn6D51xc0OKcamwUUdP7tN4MJMTF/5PMiH6b8r1cc7YSbkXBNfj1I0J
 uCyFBmNWBmBBZE8p9Sl8a7qj30zKSOv9lpTlQd2L1lHkQ40EDUqsSlIRkVzQXvf9YM35
 /JVw==
X-Gm-Message-State: AOAM531MieIiJe7BI/yMj5vNmdsnExhC0dPVhOa6W1ZM4JleeuHsZEzD
 /aaoVW5D34ZuLqeBQsQgzDqPpb97cPs/o6lsBZLTLQ==
X-Google-Smtp-Source: ABdhPJwbO/w5z/3wD3ekcFIK1oSZgbGqncwHscSdr5bvFbKNmUUhZy7QC+PbD7hxLl/SwXJxZCTL1ySIMY4ZauFM+gc=
X-Received: by 2002:a5d:628f:: with SMTP id k15mr3327019wru.363.1637639092147; 
 Mon, 22 Nov 2021 19:44:52 -0800 (PST)
MIME-Version: 1.0
References: <20211123015717.542631-1-guoren@kernel.org>
 <20211123015717.542631-3-guoren@kernel.org>
In-Reply-To: <20211123015717.542631-3-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 23 Nov 2021 09:14:40 +0530
Message-ID: <CAAhSdy0LLu4o6uOB8t_Wv6jsOrrrSMx0pv1E1B5F679gan3i6g@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] riscv: Add early_param to decrease firmware region
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, atishp@rivosinc.com, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup.patel@wdc.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
 Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_194453_888942_26B7279D 
X-CRM114-Status: GOOD (  21.23  )
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

+Alex

On Tue, Nov 23, 2021 at 7:27 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Using riscv.fw_size in cmdline to tell the kernel what the
> firmware (opensbi) size is. Then reserve the proper size of
> firmware to save memory instead of the whole 2MB. It's helpful
> to satisfy a small memory system (D1s/F133 from Allwinner).
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/mm/init.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 920e78f8c3e4..f7db6d40213d 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -159,6 +159,15 @@ static int __init early_mem(char *p)
>  }
>  early_param("mem", early_mem);
>
> +static phys_addr_t firmware_size __initdata;
> +static int __init early_get_firmware_size(char *arg)
> +{
> +       firmware_size = memparse(arg, &arg);
> +
> +       return 0;
> +}
> +early_param("riscv.fwsz", early_get_firmware_size);
> +

We have avoided any RISC-V specific kernel parameter till now
and I don't think adding "riscv.fwsz" is the right approach.

OpenSBI adds a reserved memory node (mmode_resv@8000000)
to mark the memory where it is running as reserved. In fact, all
M-mode runtime firmware should be adding a reserved memory
node just like OpenSBI.

Regards,
Anup

>  static void __init setup_bootmem(void)
>  {
>         phys_addr_t vmlinux_end = __pa_symbol(&_end);
> @@ -224,7 +233,10 @@ static void __init setup_bootmem(void)
>         /*
>          * Reserve OpenSBI region and depends on PMP to deny accesses.
>          */
> -       memblock_reserve(__pa(PAGE_OFFSET), LOAD_OFFSET);
> +       if (firmware_size > PAGE_SIZE)
> +               memblock_reserve(__pa(PAGE_OFFSET), firmware_size);
> +       else
> +               memblock_reserve(__pa(PAGE_OFFSET), LOAD_OFFSET);
>
>         early_init_fdt_scan_reserved_mem();
>         dma_contiguous_reserve(dma32_phys_limit);
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
