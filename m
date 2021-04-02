Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB12C433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 04:19:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FC1F61056
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 04:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FC1F61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0BnPky3x2ywDhFalQM6C4MGrLya0QScfpziJR8CMtPc=; b=Abr4AE2YAA/U4L3r24buJir5T
	wrOijV9/YwW06Ykxmc3vSrXttz9wymXrBKcxh0SmAeQa6SHojJKlRLgRBLPej6+DJfIcXN5yzV7mP
	/OLzChkLctZLd+Y/3rubTCCQEdnFQBWDpeyjKKdki7gEynhq3Ebk1vSTPvoE77D0Kh4V2k+rcwhSg
	U0r7QsINy1PuPabm+fM/UYKeDDOPh0xLrpTNpn3XxWHRcLkqLWLKVZAkV8kslbvuOEIyODXmTn0go
	AZyCQ8VDFuXaUN/dMrZQyKyUuxIlWDt/W8zv90dnU4qGJp61Wrv5mIwatFfptGIkLwWWarZaENtfa
	xlaJYGs/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSBGk-00BuUl-SP; Fri, 02 Apr 2021 04:18:51 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSBGa-00BuTy-7K
 for linux-riscv@lists.infradead.org; Fri, 02 Apr 2021 04:18:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so3777964wml.2
 for <linux-riscv@lists.infradead.org>; Thu, 01 Apr 2021 21:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gEf69q7AWE2x1/Rq0Iy3chkYVF+eXWxDAEWrpJWIPb0=;
 b=BiN5pFW/O77DiJXd0zx2/X1iLpsaPL6JiRjeMEk1PTjCMe5IYyCVuNyE/BDjW9dIjZ
 uoHOhBWvf5BPD2vTlyDG6HjXQg07ebuyoMX1EfVMRxOK2GWLsjRPkz7J2sb+ef6//hgr
 pt4sNPV9i0Rtcuj5utnP8QuvOClSES26++sg+APEy0lcDT7xhN8CEVVgMN50DjD9YY2e
 QksmwcQnz+uOeY8ntNWTj8qV3MgiYDpoQ7WOn/sQqqbxBQTO9DtVbBi7GHOhks+t+0dp
 Rad0fUf0hiiSKPClQTyzzg5Se1Drv7oKzWSNbevXc+Kway8nQRGPGr+qfVqI9MneH2ff
 YWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gEf69q7AWE2x1/Rq0Iy3chkYVF+eXWxDAEWrpJWIPb0=;
 b=NSN/kJWqcnb7yrhhpXg32dZCOdfKFDjfr5SDhWyNI62E0dPmPcYY7dR4bNTmJglv3z
 bFbzUigoHRyFXGifOwk3+wpcPKp9COk3aVgAqHKXGcYHzXklK+ztXhCaUBTgPapiIJ++
 GMbalVo1DLuAMWgi2d0Msz/nDiRoPN8m1X5JNC5zWUTjhsuifdQzSiVbOIi5uPpWSukg
 MucjE0XqJuotpne8DmtEgWxFNEYf04sK1U3ZHoGt3C1MCX+50MgX9A3C0RcYUXjBR3SG
 06Tm0Br7CEYWGGfXwIFI5KFpcaIqEKUTXHHCoLiTVAPXcq4qOltQtjLuQbadsMhSpnTk
 Wbww==
X-Gm-Message-State: AOAM533Ay/ppgB/52GE8eWYYCdw1Js85Kf2A5NYA6lWloU+DaSUR13N9
 6LwK+OnDFTpoGNY8Zqo9nr1XoaVfNcXyyZFb1vgrCQ==
X-Google-Smtp-Source: ABdhPJygYb0Y34DkjFFMv58xpc9hYG+0m/JrspXVGLRPCjAU15Jzob3/DzPfO3yJZJFY3fTuzhjvnZTg71sUU9tB6Ug=
X-Received: by 2002:a1c:60c2:: with SMTP id
 u185mr10663309wmb.157.1617337118714; 
 Thu, 01 Apr 2021 21:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210401002442.2fe56b88@xhacker> <20210401002900.470f3413@xhacker>
In-Reply-To: <20210401002900.470f3413@xhacker>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Apr 2021 09:48:27 +0530
Message-ID: <CAAhSdy0mYFTwhPEHVU11yFzAwUMR_wZx3LtA0KF11wW=wNu_zA@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] riscv: module: Create module allocations without
 exec permissions
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com, netdev@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_051841_474852_91C24BB4 
X-CRM114-Status: GOOD (  17.45  )
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

On Wed, Mar 31, 2021 at 10:04 PM Jisheng Zhang
<jszhang3@mail.ustc.edu.cn> wrote:
>
> From: Jisheng Zhang <jszhang@kernel.org>
>
> The core code manages the executable permissions of code regions of
> modules explicitly, it is not necessary to create the module vmalloc
> regions with RWX permissions. Create them with RW- permissions instead.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kernel/module.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 104fba889cf7..e89367bba7c9 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -407,14 +407,20 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>         return 0;
>  }
>
> -#if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
> +#ifdef CONFIG_MMU
> +
> +#ifdef CONFIG_64BIT
>  #define VMALLOC_MODULE_START \
>          max(PFN_ALIGN((unsigned long)&_end - SZ_2G), VMALLOC_START)
> +#else
> +#define VMALLOC_MODULE_START   VMALLOC_START
> +#endif
> +
>  void *module_alloc(unsigned long size)
>  {
>         return __vmalloc_node_range(size, 1, VMALLOC_MODULE_START,
>                                     VMALLOC_END, GFP_KERNEL,
> -                                   PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
> +                                   PAGE_KERNEL, 0, NUMA_NO_NODE,
>                                     __builtin_return_address(0));
>  }
>  #endif
> --
> 2.31.0
>
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
