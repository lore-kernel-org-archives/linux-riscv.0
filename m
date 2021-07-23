Return-Path: <SRS0=o9Ga=MP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9598DC4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 15:17:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EDDC60F02
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 15:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0EDDC60F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z9qBWX3bd6wGRlssqXfcxh6xoaml2beapE2sfjc8fUo=; b=hNx36hxUOoR+hE
	caxWgehEG2ERTJCCOHTFxChxLpq+WWNBXFB90l/gFehMUkjBZuOq8SZKA3bZMeAW27c3cQclETYKL
	GIfmfQJqsRlWcbN0J2keFw/mICqZyzcC0MmQ/bdQelDAFsMzzhpjV/ivOc06oAwpPmGiArg4EarNR
	iX227hCNNG8KTy1GJV7xE42XcfhHYMpseDIgsTjUFB23mCCLcJhkrEn6PkaSBzH6OmMkt67nZWzR7
	BPVPQioS9x1uLx13YHdApPlhDPXAuoEIP2ogyQSW6k+WnBUOY0/zF/0G7PRlLvLKysrjgcmxxIVVk
	B6Eej7LuQKzkGJ3hOpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6wvf-0057AQ-T2; Fri, 23 Jul 2021 15:17:35 +0000
Received: from mail-ua1-f42.google.com ([209.85.222.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6wvS-00579D-DQ; Fri, 23 Jul 2021 15:17:24 +0000
Received: by mail-ua1-f42.google.com with SMTP id t26so626137uao.12;
 Fri, 23 Jul 2021 08:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sie/IxwBmILJtt5CfCHMRTqh7diZyseV1fFMGEm6yOk=;
 b=HXz0FglM0UqXDvNDt7zLsg2MLrO7KTha52H6Bw13l/ZR/JQ84yF3RRrgWzRLU2ocKv
 cFaPuluXYkMmJaRhSwSmgsjZotHM/rvwnmgoV5kxMt538Dxpzc988YwK+ILVCSYIpjoc
 zi7beyAyzPFhORKGAf7h8ri7rKncYxocm0Jx1xvuyPMv3CBV/SjOxt9fTUHH7FA+Bti0
 oSDGMaQspkhKfx+wCAK/jiIokRluBvzupG0w6UJyLeAB7aBGY3Y6ucjTpM3ryPA8PTxS
 JKaUVmyS9sm2MDUEIkS0aV43Wgxr/f69LFRgqModOKjhKXoPtHUS3APhynwwuCT0JiCw
 Y13g==
X-Gm-Message-State: AOAM532luFRg3uarN63+gb/1PhYm65NmkUw8YYF40LQ+lWPnLnfS7+dd
 DZfBgikhRZmX8iVEaeng3XKIW3whKu6GnCwhmwc=
X-Google-Smtp-Source: ABdhPJwjie6QeabkOjY7IEyTELcNhWlJ1IBBcsCliDIJ6B3GHGV6iAk2cW/JLMoH9H/oEu8zcHMlVqite6WQsRrTwGc=
X-Received: by 2002:ab0:2554:: with SMTP id l20mr5059882uan.58.1627053440203; 
 Fri, 23 Jul 2021 08:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <170e7daa55aced148b8e57827f7c8fc65a0a8c7a.1626266516.git.geert+renesas@glider.be>
 <mhng-8deebbc6-f8aa-40e3-9e00-e99f12eaac92@palmerdabbelt-glaptop>
In-Reply-To: <mhng-8deebbc6-f8aa-40e3-9e00-e99f12eaac92@palmerdabbelt-glaptop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jul 2021 17:17:08 +0200
Message-ID: <CAMuHMdUaQW_edTRAiLb8u+=UoVNkSsgedMVTt8=qPPQ59hrfmw@mail.gmail.com>
Subject: Re: [PATCH v4 06/10] riscv: Remove non-standard linux,
 elfcorehdr handling
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nick Kossifidis <mick@ics.forth.gr>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Frank Rowand <frowand.list@gmail.com>, Dave Young <dyoung@redhat.com>, 
 Mike Rapoport <rppt@kernel.org>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, kexec@lists.infradead.org, 
 Linux MM <linux-mm@kvack.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_081722_498751_DDA2C856 
X-CRM114-Status: GOOD (  35.63  )
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

Hi Palmer,

On Tue, Jul 20, 2021 at 5:43 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> On Wed, 14 Jul 2021 05:50:16 PDT (-0700), geert+renesas@glider.be wrote:
> > RISC-V uses platform-specific code to locate the elf core header in
> > memory.  However, this does not conform to the standard
> > "linux,elfcorehdr" DT bindings, as it relies on a reserved memory node
> > with the "linux,elfcorehdr" compatible value, instead of on a
> > "linux,elfcorehdr" property under the "/chosen" node.
> >
> > The non-compliant code can just be removed, as the standard behavior is
> > already implemented by platform-agnostic handling in the FDT core code.
> >
> > Fixes: 5640975003d0234d ("RISC-V: Add crash kernel support")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v4:
> >   - No changes.
> > ---
> >  arch/riscv/mm/init.c | 20 --------------------
> >  1 file changed, 20 deletions(-)
> >
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 269fc648ef3d84b2..4aa4b6a034086df6 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -829,26 +829,6 @@ static void __init reserve_crashkernel(void)
> >  }
> >  #endif /* CONFIG_KEXEC_CORE */
> >
> > -#ifdef CONFIG_CRASH_DUMP
> > -/*
> > - * We keep track of the ELF core header of the crashed
> > - * kernel with a reserved-memory region with compatible
> > - * string "linux,elfcorehdr". Here we register a callback
> > - * to populate elfcorehdr_addr/size when this region is
> > - * present. Note that this region will be marked as
> > - * reserved once we call early_init_fdt_scan_reserved_mem()
> > - * later on.
> > - */
> > -static int __init elfcore_hdr_setup(struct reserved_mem *rmem)
> > -{
> > -     elfcorehdr_addr = rmem->base;
> > -     elfcorehdr_size = rmem->size;
> > -     return 0;
> > -}
> > -
> > -RESERVEDMEM_OF_DECLARE(elfcorehdr, "linux,elfcorehdr", elfcore_hdr_setup);
> > -#endif
> > -
> >  void __init paging_init(void)
> >  {
> >       setup_bootmem();
>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>
> LMK if you wanted me to take this series, otherwise I'm going to assume
> it's going in via some other tree.

There will be a v5 of the series in response to the review comments.
But I think this patch can already be applied.

Thanks!

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
