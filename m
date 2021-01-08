Return-Path: <SRS0=xmGS=GL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48C4C433E0
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jan 2021 16:37:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D30F239A1
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jan 2021 16:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D30F239A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=APyTvS6dkiumQOLNUXwhYpsrldrosnC+CDdhA66yM5s=; b=CccLs51psqBhusVO/lzk94zTF
	bVTrDABJ2jmNKDiWxAl+VqDPc/3eh8ktn2QBo1Ia7bGW0tGElMBDc6jwAS3WyPB8SrTehdDsapbYh
	jwrSP+NtGf94r841nNCZs0oRZMfNr7DANYf8zUJjg9WVHjtXJibWjchk1E55aJrrZHOlcha0LIdM1
	nNn6IoBJ0E2aWbRPA+nYbCkbZyL7COieUPfyNTQjyO2XimvdxPxeDqaIPgPVy22+gJlR5oUpXdQCr
	NDEn/FoGZZkRVYgA6RUaemnw7NYXtQpcXexPumdH263jpWv1Oyo7wo6KICoP4FhZ9e1qZNVynJd1X
	9UqtFuvDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxulB-00086m-CK; Fri, 08 Jan 2021 16:37:09 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxul9-00086A-1o
 for linux-riscv@lists.infradead.org; Fri, 08 Jan 2021 16:37:07 +0000
Received: by mail-oi1-f182.google.com with SMTP id q25so11923073oij.10
 for <linux-riscv@lists.infradead.org>; Fri, 08 Jan 2021 08:37:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fsHuSQ3GTZxMjJEmwO24GCCu52Rc1/vghc26oUB4atE=;
 b=eQVFMQD4xPfj+k3FOMs8s1sODYhHbIhFKljnIO05rJH94xOA624d/R3e9YYudfKz28
 Z2mtSuC5FmOWHDMmJuEmMqjPqtwtcda7HyaWkKDljTfLYlC0gn0aBhOY/IayXqQvPyFK
 s5Kz6XLM/smgOuoPubiYWDlZ7pUkXrZoesPlh+hYiRS1L6OzL+s3dcLLz0OQeuV9X1XZ
 bPBht8TE5U1l5mdXPgsKe7mY/AbWgVMShKbuUtRgg9aBKLhG98HYQuQaOcZIfuFG4YSt
 SnulpYcNy4vHb5eo4ctb9A3g+xu8FbUD5c10NJEF3Lxmsa8egrWHE2I8nXyqjcmjgJt5
 6kcA==
X-Gm-Message-State: AOAM532g1NefLbVPnEgDp+YUCQEgWSX0FqfqQxseqTV90ke08EyAWE11
 GMtZMDnuSnxbSmIXVrmnxy6jYLHUYnezE2fENSo=
X-Google-Smtp-Source: ABdhPJyqQnw/d81gIrXchM1AJcNpx7RVGBpSVN8xvdDbTTKjHXkd9QG9Tt6Gu8t4xbOMeNsbB3p1y+gMSGZf4CYYiZ4=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr2895845oia.54.1610123825974; 
 Fri, 08 Jan 2021 08:37:05 -0800 (PST)
MIME-Version: 1.0
References: <3ba42880e5b43fc238aac8d30da271516fb281ac.camel@gmail.com>
In-Reply-To: <3ba42880e5b43fc238aac8d30da271516fb281ac.camel@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Jan 2021 17:36:54 +0100
Message-ID: <CAMuHMdXFf4=7D_SLBgju2qaUzwC8dMkxq3zWDTmZ3AgWkBMQig@mail.gmail.com>
Subject: Re: [PATCH] riscv: Align on L1_CACHE_BYTES when STRICT_KERNEL_RWX
To: Sebastien Van Cauwenberghe <svancau@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_113707_121419_FDF3B59D 
X-CRM114-Status: GOOD (  14.46  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Sebastien,

On Mon, Nov 16, 2020 at 1:59 PM Sebastien Van Cauwenberghe
<svancau@gmail.com> wrote:
> From 5690c2f91d87a007babb13e2d2c9c45d1ff68b7a Mon Sep 17 00:00:00 2001
> From: Sebastien Van Cauwenberghe <svancau@gmail.com>
> Date: Mon, 16 Nov 2020 13:37:32 +0100
> Subject: [PATCH] riscv: Align on L1_CACHE_BYTES when STRICT_KERNEL_RWX is
>  disabled
>
> Allows the sections to be aligned on smaller boundaries and
> therefore results in a smaller kernel image size.
>
> Signed-off-by: Sebastien Van Cauwenberghe <svancau@gmail.com>

Thanks for your patch!

> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@ -27,14 +27,14 @@ int set_direct_map_default_noflush(struct page *page);
>
>  #endif /* __ASSEMBLY__ */
>
> -#ifdef CONFIG_ARCH_HAS_STRICT_KERNEL_RWX
> +#ifdef CONFIG_STRICT_KERNEL_RWX
>  #ifdef CONFIG_64BIT
>  #define SECTION_ALIGN (1 << 21)
>  #else
>  #define SECTION_ALIGN (1 << 22)
>  #endif
> -#else /* !CONFIG_ARCH_HAS_STRICT_KERNEL_RWX */
> +#else /* !CONFIG_STRICT_KERNEL_RWX */
>  #define SECTION_ALIGN L1_CACHE_BYTES
> -#endif /* CONFIG_ARCH_HAS_STRICT_KERNEL_RWX */
> +#endif /* CONFIG_STRICT_KERNEL_RWX */
>
>  #endif /* _ASM_RISCV_SET_MEMORY_H */

Since commit 19a00869028f4a28 ("RISC-V: Protect all kernel sections
including init early"), you also need (whitespace-damaged-gmail-patch):

--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -293,6 +293,8 @@ void free_initmem(void)
        unsigned long init_begin = (unsigned long)__init_begin;
        unsigned long init_end = (unsigned long)__init_end;

-       set_memory_rw_nx(init_begin, (init_end - init_begin) >> PAGE_SHIFT);
+       if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
+               set_memory_rw_nx(init_begin,
+                                (init_end - init_begin) >> PAGE_SHIFT);
        free_initmem_default(POISON_FREE_INITMEM);
 }

Else it crashes here without any kernel output.

Feel free to fold this into your patch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
