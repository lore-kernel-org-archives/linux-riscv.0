Return-Path: <SRS0=HnHo=DJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2993CC4363D
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2020 10:12:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6378206FA
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2020 10:12:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x/8D6jWq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="y2hruMmY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6378206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1X1voSo9taALKsuD1p0CJ0rA2dnwE2y3fxL6F+Qwea0=; b=x/8D6jWqRB540+d4pUOE721oZ
	wgsMqjWLG2FGrn24FgsYJSLmqn8gS116AWMm82J+3rt4HONpDh9IpVu66XOeEo43AdTFOg6qGDU2j
	epPymxCuKJJJRdahq7kwhfjMPv75Ihv4GqXYMHWviRSF7RY5fz39hwdD5r9zOx0z1+5btEEbWYXF6
	wVGhxfowZYspWthpmAOzhC7Ia4TIFlKPilHnh8i+PjJKZqPqG3oDa6k/Vc19LvNGCwV+N8UZxFExj
	9tuVAF0RB0TaRAB9OLf9MMhNVf65ZoajL7pYCqSNgC5PNMiSDLIaWPz/aDlSv8sJ2c6khjC0nhQiu
	y42Tk8HrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOI3Q-0002KX-J3; Fri, 02 Oct 2020 10:12:44 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOI3O-0002Js-UA
 for linux-riscv@lists.infradead.org; Fri, 02 Oct 2020 10:12:43 +0000
Received: by mail-wr1-x441.google.com with SMTP id k15so1154347wrn.10
 for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2020 03:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k5KRvAGud7PfkCWHujyApubuLJ/cgvQYNI0N2x1lnqs=;
 b=y2hruMmYXIlqAurcpMRZPPZNpXgjSi/RI0w3h33GlMuh4lvCpzpjNUa1vK7VmGkNsi
 2nNCylsCh2UaXdWx1xG5zNL5pa63YNRSMk5/krYCBINvB2mhY+QP7lJ8EX8AGWakJ+zI
 o2MVf+xTi9URdTa3nw8KNUkUHy70aE8AXjFpXD5DUG/R5uyp9dfjnMeeVmH/7n8IIdHz
 q17cAqlyd35srRYwaRzOVw+KaSfjv51QC9g1pRM9SZtdYfgHKd3WjFzSBv5mriwRo2M2
 K1TjrZo7O4fumuNFvLy6KpOiRAnSRTW72SQi5WtYe1XsKtsnH++UdX+7o9lEoDWlplWt
 VWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k5KRvAGud7PfkCWHujyApubuLJ/cgvQYNI0N2x1lnqs=;
 b=eBm4vgUdL3Ply4BY/wPOyR4j+vRY7Cn9symaGQbJKlmjVb+RYSlN3OfZ8C/ABGfUpP
 sk6b6pWrKeUUg98WConHo83OI4WkskzWbdIc9SQtGFFL/K2UjYScj+6JOYtvdoLWbJOS
 6fS+PccPDVZgs9WIsHjbHz77WyQqVkF/wJGu2gsnA3rJE6uNKwXmumbsKPdMEJjiRclN
 7P5cRGjkjUcG+cOf5ZlD4wAZ9vnCLV8dM9v3zf6iDruADd8MsK1wf6fljzEXItQ/IDL7
 SGtN/EP6kuaL4zgl0siYjN6J/v+lcxWg1tPXMfA0On9coGxmkttP84ipEOhCMEaISZBG
 VnQQ==
X-Gm-Message-State: AOAM530ORcqnEOfkjH/atA9pCjhNXuMSChWghwxqykOD/9FXGx34gIRq
 0CrOTgrWeUwrqlXD/T71OWP2WtuVzZ8jPGtv3EgE5UgPd8dF0w==
X-Google-Smtp-Source: ABdhPJzZ9Sz18Pa+tPT+RQ66vm2EyUfR0eZjMK5UfCoxFcX/40FOLqWXiMQrpdhTD/SrXITGPZ6RNkhJ2+4ISKdbTkY=
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr2289641wrp.390.1601633561729; 
 Fri, 02 Oct 2020 03:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201001190557.2860741-1-atish.patra@wdc.com>
In-Reply-To: <20201001190557.2860741-1-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Oct 2020 15:42:23 +0530
Message-ID: <CAAhSdy2bw-htb5_3Yz571=_Z_JKYDGCaiVv3Dh7EPvFQZPKmOg@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: Remove any memblock representing unusable
 memory area
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_061242_982364_D1B0BC13 
X-CRM114-Status: GOOD (  20.50  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Oct 2, 2020 at 12:36 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> RISC-V limits the physical memory size by -PAGE_OFFSET. Any memory beyond
> that size from DRAM start is unusable. Just remove any memblock pointing
> to those memory region without worrying about computing the maximum size.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
>
> ---
> Changes from v2->v3
> Updated comment as per Mike's suggestion.
> ---
>  arch/riscv/mm/init.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index ca03762a3733..564e0be677b7 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -146,8 +146,6 @@ static phys_addr_t dtb_early_pa __initdata;
>  void __init setup_bootmem(void)
>  {
>         struct memblock_region *reg;
> -       phys_addr_t mem_size = 0;
> -       phys_addr_t total_mem = 0;
>         phys_addr_t mem_start, end = 0;
>         phys_addr_t vmlinux_end = __pa_symbol(&_end);
>         phys_addr_t vmlinux_start = __pa_symbol(&_start);
> @@ -155,21 +153,18 @@ void __init setup_bootmem(void)
>         /* Find the memory region containing the kernel */
>         for_each_memblock(memory, reg) {
>                 end = reg->base + reg->size;
> -               if (!total_mem)
> +               if (!mem_start)
>                         mem_start = reg->base;
>                 if (reg->base <= vmlinux_start && vmlinux_end <= end)
>                         BUG_ON(reg->size == 0);
> -               total_mem = total_mem + reg->size;
>         }
>
>         /*
> -        * Remove memblock from the end of usable area to the
> -        * end of region
> +        * The maximal physical memory size is -PAGE_OFFSET.
> +        * Make sure that any memory beyond mem_start + (-PAGE_OFFSET) is removed
> +        * as it is unusable by kernel.
>          */
> -       mem_size = min(total_mem, (phys_addr_t)-PAGE_OFFSET);
> -       if (mem_start + mem_size < end)
> -               memblock_remove(mem_start + mem_size,
> -                               end - mem_start - mem_size);
> +       memblock_enforce_memory_limit(mem_start - PAGE_OFFSET);
>
>         /* Reserve from the start of the kernel to the end of the kernel */
>         memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
> --
> 2.25.1
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
