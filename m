Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7659BC48BDF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 17:47:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB72061009
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 17:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB72061009
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10hIeNQUDxKWrkJCtvl+0W5ToNKk8C36M0cSqpmGG/E=; b=MJNFZBgAkw3nme
	QJxWknFsq73h9xuxLnO4P0wnr4To5WwaGOfk+v+JUuVJFPA1Rw1zzEsHgCipdC1QykP1mGVBN+22C
	wzIDK4deuLgeAJ8KyEzcZFU4zYgsDgAe9q999ggFjBaA/L63TENaJfWoiMTwc0n5oyV0PkRax0vVt
	JohiZ1EMGSwl2rzy7bXPlk+yy49ppTZfsabeJzgTrlRzVLMEoiGPOsItfR6+vTg9BFKuXDZC7RBIJ
	9fecotsL2/Ca4NJfiaeexiliFo42F6v0OhC6chBlYdbIrm3+dXY91kOpncivqXnjvn0hf6kDeuwVe
	uF3QYsW62ylDC2MO6+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltD9m-001rFO-Ji; Tue, 15 Jun 2021 17:47:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9Bh-000ByJ-Rw
 for linux-riscv@bombadil.infradead.org; Tue, 15 Jun 2021 13:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=hwbhacSscetqLBTLgthyShGc1NVfqwfpItyjtKy47b4=; b=ZEbcE3tQP+jkkAKulSDu9qtPGg
 Z+B1XwkHZ8ijKYYg6EMQZsYo2gKhqzCNfSgNkiYm/0XolV8sHfq9+xDvbBb3Y60Y+rRfld/2Y98d9
 4Ti44jmJ7XHBYbVqSPTibOFnxRK0IOsGp4lBIUSUtfnMTzAQpf2mUgtN8LoC/IdqdlWtCh23jT2X2
 zsaANaqeRy9v9Ugu5Ih8UtuRgsAqYPsEpw0VaOlsQYBiP1Br6Wvj9K4AZ1bk5EzGVhdICbWvQPjh6
 4lxkC3HhvN8aWIYExCN4KI5KHAIqSOsIIpuT+LoGvGZe060n2i01AFDUoMseWi+/Mmc1NxEJU9Rv8
 ZG4mYJQg==;
Received: from mail-ua1-f49.google.com ([209.85.222.49])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt8ye-007uuk-Ov
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 13:19:45 +0000
Received: by mail-ua1-f49.google.com with SMTP id o3so659175uaw.5
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 06:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hwbhacSscetqLBTLgthyShGc1NVfqwfpItyjtKy47b4=;
 b=hmQf0rwkbwbob9M1k80ecyG1bfcWCO3tJqFKlNy46zCe2RfLalZZHuka5yesA28/U4
 Y5YnJQ/+nRV6PiNUQUImdN49OYD/1HsKab5uqKlUPlLne1LtoSeIzIvgMaMW8cW6pm1A
 cvKok3n4SFfXkWFpmaN4l4Ap6+z3zs9AuMXZbGRMJ8u5k/b3P2YJ7qkMDOiSGi6F4GH9
 P97+qf5HnsGqwbYvP6fg5PNtTmJFa9BgibGFBAuigHaTbgU7YoMAR2mrA7eLKQ886NuW
 6evEnpNKJ8kElwHPbEykyUFoDgo1fuQdU8Dd8aL/ZJoDZXszWOLK6b0DlPe+L6laZnPR
 LZMQ==
X-Gm-Message-State: AOAM5326DwJ4xShpnSgcOCk6CKEKtn1ikL5XygUaxGxelaiTpWpQXbsG
 /hoNN0LYTe4ZBb0s81xFoO7JieATf4FGslqnN8k=
X-Google-Smtp-Source: ABdhPJzx0IHLF5Qs1kLRoM3ndyDSsmRQ/L3tZsFxSpTdBz/sGirmBpBGoDZABz+NRthYCP5Pg+lEcqqowARL4/piAq0=
X-Received: by 2002:ab0:63d9:: with SMTP id i25mr17823298uap.106.1623763179009; 
 Tue, 15 Jun 2021 06:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210419005539.22729-1-mick@ics.forth.gr>
 <20210419005539.22729-6-mick@ics.forth.gr>
In-Reply-To: <20210419005539.22729-6-mick@ics.forth.gr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Jun 2021 15:19:27 +0200
Message-ID: <CAMuHMdW=23SPXwqcjD+30M_d0azdze2=ChZM-PF1brf9bCNtrA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] RISC-V: Add crash kernel support
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_141943_688164_A97C4CEF 
X-CRM114-Status: GOOD (  34.51  )
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

Hi Nick,

CC rob, dt

Thanks for your patch, which is now commit 5640975003d0234d ("RISC-V:
Add crash kernel support") in v5.13-rc1.

On Mon, Apr 19, 2021 at 2:56 AM Nick Kossifidis <mick@ics.forth.gr> wrote:
> This patch allows Linux to act as a crash kernel for use with
> kdump. Userspace will let the crash kernel know about the
> memory region it can use through linux,usable-memory property
> on the /memory node (overriding its reg property), and about the
> memory region where the elf core header of the previous kernel
> is saved, through a reserved-memory node with a compatible string
> of "linux,elfcorehdr". This approach is the least invasive and
> re-uses functionality already present.

This does not match
https://github.com/devicetree-org/dt-schema/blob/master/schemas/chosen.yaml#L77:

    $ref: types.yaml#/definitions/uint64-array
    maxItems: 2
    description:
      This property (currently used only on arm64) holds the memory range,
      the address and the size, of the elf core header which mainly describes
      the panicked kernel\'s memory layout as PT_LOAD segments of elf format.

Hence "linux,elfcorehdr" should be a property of the /chosen node,
instead of a memory node with a compatible value of "linux,elfcorehdr".

> I tested this on riscv64 qemu and it works as expected, you
> may test it by retrieving the dmesg of the previous kernel
> through /proc/vmcore, using the vmcore-dmesg utility from
> kexec-tools.
>
> v4:
>  * Rebase on top of "fixes" branch
>
> v3:
>  * Rebase
>
> v2:
>  * Use linux,usable-memory on /memory instead of a new binding

This part seems to have been removed in v3 and later?
Note that "linux,usable-memory-range" should be a property of the
/chosen node, too, cfr.
https://github.com/devicetree-org/dt-schema/blob/master/schemas/chosen.yaml#L85

>  * Use a reserved-memory node for ELF core header
>
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>


> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -653,6 +666,26 @@ static void __init reserve_crashkernel(void)
>  }
>  #endif /* CONFIG_KEXEC_CORE */
>
> +#ifdef CONFIG_CRASH_DUMP
> +/*
> + * We keep track of the ELF core header of the crashed
> + * kernel with a reserved-memory region with compatible
> + * string "linux,elfcorehdr". Here we register a callback
> + * to populate elfcorehdr_addr/size when this region is
> + * present. Note that this region will be marked as
> + * reserved once we call early_init_fdt_scan_reserved_mem()
> + * later on.
> + */
> +static int elfcore_hdr_setup(struct reserved_mem *rmem)
> +{
> +       elfcorehdr_addr = rmem->base;
> +       elfcorehdr_size = rmem->size;
> +       return 0;
> +}
> +
> +RESERVEDMEM_OF_DECLARE(elfcorehdr, "linux,elfcorehdr", elfcore_hdr_setup);
> +#endif
> +
>  void __init paging_init(void)
>  {
>         setup_vm_final();
> --
> 2.26.2

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
