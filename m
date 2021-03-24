Return-Path: <SRS0=4Q7i=IW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F3AC433C1
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Mar 2021 15:21:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47748619F8
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Mar 2021 15:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47748619F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XiRJHGTN0nDpqcrvDsVXP2J1IQRiZZs07X17yhsFXKc=; b=RjO5I9B56l3HccWFEip9TVb3V
	TwqQQwdh7pdTjNG6J3VSFOp9p5QF+p+EXRdtlWxcruuF3RDsCTG6kmtQYX3tqx6t+rMzwFJL4lSgk
	xZ/VlAsXffAmZPgrdboJzNN89deRRWWBElWgS17ToL84vmmFxl2pqwwNboCZwVJqOUJX93EJFJDtO
	lBrucQsP1HC6EhOKW5kTvOhiXkug+9ZlJawb0Rk+t6IiL6z3ZAVX9sWzijod+HKZX2JR5vUpjKtJs
	F8II/7HAq1L5VX6+gyf5lHSU98aH1GgZviM7N7GjofXktVTjHLf2TSqulQiZI4Ga07vZXxe0Iyr3I
	VsrBYEpkA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP5K0-00HGRz-RU; Wed, 24 Mar 2021 15:21:24 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP5Jv-00HGQ2-CA
 for linux-riscv@lists.infradead.org; Wed, 24 Mar 2021 15:21:22 +0000
Received: by mail-lf1-x12e.google.com with SMTP id m12so32545144lfq.10
 for <linux-riscv@lists.infradead.org>; Wed, 24 Mar 2021 08:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3XcQtBW2pWb3U+df3ex1+Hhi50G51wTIprzcAH+EBJQ=;
 b=CDl64vzfljKg43qIelbz0cgBgakJdVgrQU91jH5/QDV5ZussvDriYPMSLrINiJzE9h
 fC6WnXJ5dNjcMeQh9E9PJmdPf7kSnO2kH8FwcQerVDRP9vyO8yqXubTzIJjQumFEsbiU
 dwN5vA/4omeE1nbR2sgTaU/VeKGpNe+ijGTo0uCQLOqBlOb2D73h6SUsS8cjw8epSuSd
 0KBXxutsRHn4qeJrz5spQHcN6sBIhizC4JdPKqTW01hx93uI2oFz13UUPFd5HgrvN3Fu
 p+WigmTCnUSPaFG/l5XEOZmf4JQtwtxQaUNVKpCy1QxSdHAy3OUXwZ8wC+BRfyiLJlmK
 V9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3XcQtBW2pWb3U+df3ex1+Hhi50G51wTIprzcAH+EBJQ=;
 b=tFtuNJ6VwGbOOfyoMvo7zSU8FrZ6PeKmFIYH4MiRA8yDI283bkgvguhjHNrUBQJqKh
 To7q716wroihzj8QyUbxSxT3sDqeu8zsEdb5V5aQ0w0tKf5gYWoZSJEeEwbqOoUKrX8V
 oQ7Sp68XHGqdbpzg0H1GJY2lyvDjBI8CxVgG/0l6K/He985wYSwWlJL7lz698kHh03q8
 Gys2JJ8Fh+AJNtBGIXaTuqSAbdt5lA2GTsiAJ3e2DikTkS99bxQqgOY7EUxupYSQACbt
 /TqQiJnq+zVVamrfpss2oXeMrYDWJPNb4BYlbs93QrgQkppVoPAU5FmQjgHLtMPSRChw
 jMZQ==
X-Gm-Message-State: AOAM530IcrLo1FjEtPh0kQX6prVbBr64Vp6fkclkvmZoZyBBFY5lBrYM
 u30Pwb68m0hZVCipziTk3JtEEFy2D9VqGW8hZFdqRA==
X-Google-Smtp-Source: ABdhPJwFHy/BR75zWE4kd73NiY96ZW993iszaMZ//vKc+0dkRh8vhv8zydS7tEGsS/+YcXIHE3UVELb7j70okvWkdBc=
X-Received: by 2002:ac2:5a0b:: with SMTP id q11mr2273174lfn.391.1616599278269; 
 Wed, 24 Mar 2021 08:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210324150312.20535-1-changbin.du@gmail.com>
In-Reply-To: <20210324150312.20535-1-changbin.du@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 24 Mar 2021 20:51:06 +0530
Message-ID: <CAAhSdy19Tpf1D0Q4V7CF0ZOvksHMXxA2fF3L3J2f_Ka8NZgVAQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Do not invoke early_init_dt_verify() twice
To: Changbin Du <changbin.du@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_152119_805942_B808B91C 
X-CRM114-Status: GOOD (  17.82  )
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

On Wed, Mar 24, 2021 at 8:33 PM Changbin Du <changbin.du@gmail.com> wrote:
>
> In the setup_arch() of riscv, function early_init_dt_verify() has
> been done by parse_dtb(). So no need to call it again. Just directly
> invoke unflatten_device_tree().
>
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  arch/riscv/kernel/setup.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index f8f15332caa2..2a3d487e1710 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -255,10 +255,7 @@ void __init setup_arch(char **cmdline_p)
>  #if IS_ENABLED(CONFIG_BUILTIN_DTB)
>         unflatten_and_copy_device_tree();
>  #else
> -       if (early_init_dt_verify(__va(dtb_early_pa)))
> -               unflatten_device_tree();
> -       else
> -               pr_err("No DTB found in kernel mappings\n");
> +       unflatten_device_tree();
>  #endif

The early_init_dt_verify() set he DTB base address in Linux OF.

When parse_dtb() calls early_init_dt_verify(), MMU is enabled but
we have temporary mapping for DTB (i.e. dtb_early_va).

After paging_init(), we have moved to final swapper_pg_dir so
temporary mapping for DTB does not exists anymore but DTB
is at same physical address so update DTB base address in
Linux OF by calling early_init_dt_verify() again.

Based on above, NACK to this patch.

Regards,
Anup

>         misc_mem_init();
>
> --
> 2.30.2
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
