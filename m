Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC121C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 10:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4H8Z4yP5d2alCZXi9neW+8hmv47qebeULL6nOELoNQ=; b=MgBPahh7uxzCkK
	F1mZq0gcI2bsu8GmbJyAZ5QmjDh2W/SMkxent9LnpEMe8uwhzAKel+o0ixg18Y7c2Fksu/SWup5rB
	o12Uf/+ah4VkSrLDZhx735vhSUEYnwXSA0asoFw/qSD3OMA7HBC2EdjVj3qhxdGj0ORtCLPJX6xYc
	ZAxXLVn2jBhd8Sydg5zfRUmxZ2dLV3R11CzaX214oo4SpajO60LATkjXjPRhECuckYMB5Irsd8oqz
	8niG1w4/UzMxc0+roXVzQeRzeG3tzftpCkv1zgoLHroxKwzukGXraKjyqA7v9fSVyQKXC+h3cvYEA
	T5tfmKyT2jYPp95PxzpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n29Uv-000eQW-5K; Tue, 28 Dec 2021 10:14:25 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n29Us-000eOq-Hg
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 10:14:23 +0000
Received: by mail-vk1-f170.google.com with SMTP id s144so10050011vkb.8
 for <linux-riscv@lists.infradead.org>; Tue, 28 Dec 2021 02:14:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W24YzS7gvKwvztwIMu0FSg1RWOYoxzVo3HaBbi+k4Wo=;
 b=VAYrNzOEI2fVEe15XfGNXxm7vm4Spv0O/uD6Os9sVcqnofvS0bfl+Si3RZ/EiSRHwT
 /eAnX9snCV3ihrD8V3V6ZiwVT1i1Ld9UvD0KnTXIQWCpNdRWvC4HkX1jN6+ze0me471+
 bcZypZepATAFKp0Dg/BRPLmkuQzpeQqAph0iI8GC7hScQmy8fVZbYVb4f4jkLhVT2lJu
 imzXsNGXcH5s4ehDHkfB9iHFHL2b6sO6Z5OLhgREY1eUivJwIGaKlcZArqgQBa/Lr1ff
 fFiS/MDkqUyIfo4ULcVahuYtXLvNfjjrBqSJ3yCMQ0k3pcFB58jnibtdejcUZDg/YiDJ
 93BA==
X-Gm-Message-State: AOAM5308mWqZdSbqIde9XDDE97UJbZMy5yvFMCZguVDL/fb/oJlyiI6O
 r28sX34bEXGeB7ldOWC1ua9/uCubmAsrGQ==
X-Google-Smtp-Source: ABdhPJwSgef1Ji6lCvBG694+Caw43f5clLj6NUOltbSQi/YVvEdxas9q1BNsGbZGIlrWv8sRth37bA==
X-Received: by 2002:a1f:1609:: with SMTP id 9mr6040664vkw.18.1640686459245;
 Tue, 28 Dec 2021 02:14:19 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com.
 [209.85.221.178])
 by smtp.gmail.com with ESMTPSA id q11sm2997295uaj.4.2021.12.28.02.14.18
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 02:14:18 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id s144so10049985vkb.8
 for <linux-riscv@lists.infradead.org>; Tue, 28 Dec 2021 02:14:18 -0800 (PST)
X-Received: by 2002:a1f:4641:: with SMTP id t62mr6390863vka.0.1640686458447;
 Tue, 28 Dec 2021 02:14:18 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-5-schnelle@linux.ibm.com>
In-Reply-To: <20211227164317.4146918-5-schnelle@linux.ibm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Dec 2021 11:14:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVBXBXSE8bQFNqxkbCASZKq25evHGXHjC6u7f3ktW4dpQ@mail.gmail.com>
Message-ID: <CAMuHMdVBXBXSE8bQFNqxkbCASZKq25evHGXHjC6u7f3ktW4dpQ@mail.gmail.com>
Subject: Re: [RFC 04/32] parport: PC style parport depends on HAS_IOPORT
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>, 
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, 
 linux-pci <linux-pci@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_021422_605937_F2F5BC80 
X-CRM114-Status: GOOD (  20.07  )
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

Hi Niklas,

On Mon, Dec 27, 2021 at 5:48 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> not being declared. As PC style parport uses these functions we need to
> handle this dependency for HAS_IOPORT.
>
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

Thanks for your patch!

> --- a/drivers/parport/Kconfig
> +++ b/drivers/parport/Kconfig
> @@ -14,7 +14,6 @@ config ARCH_MIGHT_HAVE_PC_PARPORT
>
>  menuconfig PARPORT
>         tristate "Parallel port support"
> -       depends on HAS_IOMEM

Why drop this?
Don't all other parport drivers depend on it?

>         help
>           If you want to use devices connected to your machine's parallel port
>           (the connector at the computer with 25 holes), e.g. printer, ZIP

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
