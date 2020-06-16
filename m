Return-Path: <SRS0=ePsx=75=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59007C433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2020 07:55:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AD1D206D7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2020 07:55:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vmvqn83O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AD1D206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x0UZS1344FZMJ9sVFAfBG3IhgSf2KKzqEk05E3yUoqE=; b=Vmvqn83OOz7tItN4sHST+4MVe
	6W6fDJrbRs5LF2F7V+8L79Q6MWzqCigZgBPw+AyX85M35CYwgDGo7YgBAwesa7Va9fI3OUFYjhIFu
	QX0myeXAf4+4PvU/DglZU47y+tapw8OaVeVMJWLyuuvjj4Y/cA5eXCSD8tDdy1QPK3ueVbKc8delh
	KbWE9m4/mjMNGRD/MXUlMTrnim17+fiz8avcjGNtY8AnPWr/MnLDqDzzWBOYF+ilo4iLmpqZLqpom
	cluIwuF61uU18cuyTqnk7uja1ty9N3Qzsaibahr5hajXE6gItUO6IGPELcX5/zNK4XEFc5vJolymR
	/M/JRw1tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl6RT-0008Po-BB; Tue, 16 Jun 2020 07:55:35 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl6RQ-0008P8-8b
 for linux-riscv@lists.infradead.org; Tue, 16 Jun 2020 07:55:34 +0000
Received: by mail-oi1-f194.google.com with SMTP id i74so18491251oib.0
 for <linux-riscv@lists.infradead.org>; Tue, 16 Jun 2020 00:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x0UZS1344FZMJ9sVFAfBG3IhgSf2KKzqEk05E3yUoqE=;
 b=tQIQkCn+4lO8mk8rQcpWT33DbILV+miKR3m5/Hu5kN3s5vHuLWgs9bmAFPFKGeeAgp
 Br4IWHR1kj7cN4gF77y2/GI9b/vb2e3NLVSXy/oRcBarxePNa1JCW9Fdgs99aj0p9E9u
 VqtDg4u2Lz42rz6wl4BGU39D4grtV+R30kugGcLr5/i5x+pWvz3onEZW5EKQwOHTmjdZ
 A9bgQfrwK06EDYYkxQF1o0+U3P097/+tiC/rQszXrTEjjv0ZF5dJPuAZzvKNwTs5jWG1
 6vXbEWWP7EwCXitv11qB6+wR0fpxzj9rOonzEPGR5Yf6VxUHpouVCInsRVakvft4RUZv
 PSRQ==
X-Gm-Message-State: AOAM533KwhHrtFmG4wWpxLN7sWbgc01tET9y8sq7Mbs9DWc3bHJHL+LL
 rtVNsZPLjgwVdZG1xBcZ5eVbhyA7qsnwnc3cUW0=
X-Google-Smtp-Source: ABdhPJwMnh9vOBm1ivYzGguW+ODZxfzPd6QA/5LfGE9ipyABVaPN48l1YV96vpeXAN8+8zfTbP7W4KvdyyhcLDM4QBY=
X-Received: by 2002:aca:849:: with SMTP id 70mr2295786oii.153.1592294130938;
 Tue, 16 Jun 2020 00:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200422172414.6662-1-ardb@kernel.org>
 <20200422172414.6662-3-ardb@kernel.org>
In-Reply-To: <20200422172414.6662-3-ardb@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Jun 2020 09:55:19 +0200
Message-ID: <CAMuHMdXZM7XYBt=2dJFJi+xxe2HOh43KzSkxGoMqaaC_kc_P-g@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] efi/libstub: Make initrd file loader configurable
To: Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_005532_302645_00C8FC32 
X-CRM114-Status: GOOD (  14.82  )
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
Cc: linux-efi <linux-efi@vger.kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Ard,

On Wed, Apr 22, 2020 at 7:24 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> Loading an initrd passed via the kernel command line is deprecated: it
> is limited to files that reside in the same volume as the one the kernel
> itself was loaded from, and we have more flexible ways to achieve the
> same. So make it configurable so new architectures can decide not to
> enable it.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Thanks for your patch, which is now commit cf6b83664895a5c7
("efi/libstub: Make initrd file loader configurable")!

> --- a/drivers/firmware/efi/Kconfig
> +++ b/drivers/firmware/efi/Kconfig
> @@ -124,6 +124,17 @@ config EFI_ARMSTUB_DTB_LOADER
>           functionality for bootloaders that do not have such support
>           this option is necessary.
>
> +config EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER
> +       bool "Enable the command line initrd loader"
> +       depends on EFI_GENERIC_STUB
> +       default y
> +       help
> +         Select this config option to add support for the initrd= command
> +         line parameter, allowing an initrd that resides on the same volume
> +         as the kernel image to be loaded into memory.
> +
> +         This method is deprecated.

So why the default y?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

