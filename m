Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA44FC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 05:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=cxvSeImW7bcwjTTlETdp/SKjY7CVHNqejWbaZGwDHu0=; b=kMSpTobnqJ/oJOQxp7djy46lz9
	pgHgM34V2IFIW9Xb+Lcv+5VUulSHJU345Jm+bvgsvY92RzshiE1dkdxxYhsFTpOIGfFT7pKecsVu7
	psmpZJgEJ77BJDP0yXMxQxF4d1sTbopqMc7bP4HpDUdUR/AGG7YBGoJdvK2QhXm/N/nvQuI9J3EV4
	qLIUKoKwgZHc/VJS7+GB67Xxxh0JvYP5atnsgUv4JQfKhaCnB2UX+I04XctgMyWo/C7iIhNBJRqk0
	kCGHZSNBPQJTiWBF/o9uc74eoiVIvHCWvQPNRuNY/xEmdfZFqMAdabqP1/3/k8ooYvSc66vJ6xOU2
	iqk9glMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEOvG-00020J-3O; Thu, 21 Jul 2022 05:40:30 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEOvD-0001T5-CU
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 05:40:28 +0000
Received: by mail-pg1-x52a.google.com with SMTP id e132so688887pgc.5
        for <linux-riscv@lists.infradead.org>; Wed, 20 Jul 2022 22:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=24WLm3F/pEKL6HqPEYvFFMa8L5OIGROgadJlOu++WLM=;
        b=KMyMNqxpl17A8Q/QFULg/+j9PJFBoVmwhC0O9OE332akVxeAQSiiePwJtoQAJMnM0B
         W3QHtjNHa5Tdx2wdk4vx9NQltxJczMIaIOY/NYOdrotiTgOk7LmRQcnh2HXYBoK+++cD
         /wNIDKpX8RQQatvJLt366/Vm1+0w6uGsL4MOKfpJCqVuK/KiqpJ329vamy+9C1z/+LnT
         yf3Ss6ggFw5bXIGiGqcPPiFSocrweZrWoBxF0wFJoFMLZc4cPm+rAgvjU65EC16UG1BW
         60K5+92Fa6NScpQLCRt3/abEF55xMARfJdbq7vaXHPbaOsUM/u00fBZgynZqKLHFngNJ
         vJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=24WLm3F/pEKL6HqPEYvFFMa8L5OIGROgadJlOu++WLM=;
        b=a9uFTaM+DCL9N+RtVCLB0hgqzHkvO9oV4D+qC7MGFGK/GLVPMOHkHWx9OWvREen1u5
         gYRA92wJZf9AoBLcvkjn00nLaqriKTaOVYxk7rvCKQXUhCtweULTrldnC75Faz6kV4bm
         1LHWwTH5NIWcmd7X8Kw6ukiVJKCjXDvl50poJjPgKONUP8npBCIO0AOBhHDq3p0NYtsk
         x42qKyTzOHGAjt8nqeVZxnxRjXaNHKPhGIe9Flrma/eXNR5u9EjTq0XKp+7D6OkT8Fsc
         /l9C2B8ar9j0n5oBRiF04svAHKbb2mVsHCxR51Vm8CBJVgXCf1JMAzrfWnM0dHnOFiUq
         e1BA==
X-Gm-Message-State: AJIora+jUa3jImLexMkJPKqvRXTbouC8hoqME6yKic5zF7r42Kn+OkdO
	WCTR7QfG0YmVPvLyPrQANvbBO+P/on8SOQ==
X-Google-Smtp-Source: AGRyM1uIe+Uww9SHPMIl46ySyaSvYF2dSO/oOFGChsXmbCLq6uV3ZSkBBGwpD62rL5YWws3EwdxiYw==
X-Received: by 2002:a05:6a00:14c4:b0:52a:c36c:1854 with SMTP id w4-20020a056a0014c400b0052ac36c1854mr41543603pfu.27.1658382017434;
        Wed, 20 Jul 2022 22:40:17 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id n7-20020a170903110700b0016bdeb58611sm594285plh.112.2022.07.20.22.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 22:40:15 -0700 (PDT)
Date: Wed, 20 Jul 2022 22:40:15 -0700 (PDT)
X-Google-Original-Date: Wed, 20 Jul 2022 19:47:37 PDT (-0700)
Subject: Re: [RFC PATCH riscv/for-next 2/4] riscv: export patch_insn_write
In-Reply-To: <20220529143315.3678563-3-andy.chiu@sifive.com>
CC: linux-riscv@lists.infradead.org, mingo@redhat.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, rostedt@goodmis.org, guoren@linux.alibaba.com,
  andy.chiu@sifive.com, greentime.hu@sifive.com, zong.li@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andy.chiu@sifive.com
Message-ID: <mhng-ca44b9c5-5470-4665-ba3f-9601860d6b95@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_224027_448029_A39B3280 
X-CRM114-Status: GOOD (  16.09  )
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

On Sun, 29 May 2022 07:33:13 PDT (-0700), andy.chiu@sifive.com wrote:
> So that we may patch code without issuing fence.i
>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/include/asm/patch.h | 1 +
>  arch/riscv/kernel/patch.c      | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/patch.h b/arch/riscv/include/asm/patch.h
> index 9a7d7346001e..327e99114d67 100644
> --- a/arch/riscv/include/asm/patch.h
> +++ b/arch/riscv/include/asm/patch.h
> @@ -6,6 +6,7 @@
>  #ifndef _ASM_RISCV_PATCH_H
>  #define _ASM_RISCV_PATCH_H
>
> +int patch_insn_write(void *addr, const void *insn, size_t len);
>  int patch_text_nosync(void *addr, const void *insns, size_t len);
>  int patch_text(void *addr, u32 insn);
>
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 0b552873a577..834855cfd0fb 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -49,7 +49,7 @@ static void patch_unmap(int fixmap)
>  }
>  NOKPROBE_SYMBOL(patch_unmap);
>
> -static int patch_insn_write(void *addr, const void *insn, size_t len)
> +int patch_insn_write(void *addr, const void *insn, size_t len)
>  {
>  	void *waddr = addr;
>  	bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
> @@ -78,7 +78,7 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
>  }
>  NOKPROBE_SYMBOL(patch_insn_write);
>  #else
> -static int patch_insn_write(void *addr, const void *insn, size_t len)
> +int patch_insn_write(void *addr, const void *insn, size_t len)
>  {
>  	return copy_to_kernel_nofault(addr, insn, len);
>  }

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
