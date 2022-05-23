Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F4FC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 23 May 2022 09:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NfOYKxNj4Tr+dz5Fu3F7vwf2XhStrUHxTm33LS5sp8g=; b=vcA7QOoLbqUW9Q
	crfL0j8gq2VEqOTeTHI8kGw89mmLI/aw62Tb0MBw9eUZubEf8Gfw/RcoO5O7HudP+oMi4bESK6JjZ
	mU705SFoGYFZV6MaWN4SRbhyg4fE/L8dpckX8lDdZ9fvTW0yD6JwdfhcSJ92cyFxhxZptcKtxK2ot
	+LHZ/rYQq6yLZTK7EUIKELmClvD2BB93/K1BXa7zPGW9gg3JBiPlUoB3Fz6iBCMDgOx8JCK0lXK70
	OIIj0kVAjxSaGPPknOM5SldPQnXcyf/zlWXxKckRrNRhIbGlujTHt89db2PEqrzV5S0ivS70ld8fJ
	fCOIudHfvzkWu9V2Pdhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt44U-002iwO-5E; Mon, 23 May 2022 09:09:50 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt3Fk-002Mhy-Kx
 for linux-riscv@lists.infradead.org; Mon, 23 May 2022 08:17:26 +0000
Received: from mail-yb1-f173.google.com ([209.85.219.173]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MnqbU-1nUV0t3Glm-00pHdU for <linux-riscv@lists.infradead.org>; Mon, 23
 May 2022 10:17:13 +0200
Received: by mail-yb1-f173.google.com with SMTP id q135so24047389ybg.10
 for <linux-riscv@lists.infradead.org>; Mon, 23 May 2022 01:17:13 -0700 (PDT)
X-Gm-Message-State: AOAM531D4RN3cKiT5zrXiK/iObbU4BGcu96eCaNGDUX0QFYZYt1RN7HK
 yFx6SEG3jptLgnZuKu9uCO5g/MYo9vORu4joIzY=
X-Google-Smtp-Source: ABdhPJwpBo10pOgBdqfC/NkZnjBYRstzV66KiRkOk2ZhvrzK49G4qlPbyegUfcvAyICBzxOuMbxaHVqbOn8oBK9jnSk=
X-Received: by 2002:a25:c747:0:b0:64f:62fb:f55e with SMTP id
 w68-20020a25c747000000b0064f62fbf55emr13378958ybe.106.1653293832593; Mon, 23
 May 2022 01:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220307140804.1400-1-jszhang@kernel.org>
 <CAK8P3a33aPwi0hBAyFREqM-BKVJwin=O9cOR4NzWPtr1j2pLiA@mail.gmail.com>
 <YoCMJhH9EP4+01pB@xhacker>
In-Reply-To: <YoCMJhH9EP4+01pB@xhacker>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 23 May 2022 10:16:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0dNbwyJm3Zq-H6MQDrEcTA+wu01VvSHtFVyBT2NtMRCQ@mail.gmail.com>
Message-ID: <CAK8P3a0dNbwyJm3Zq-H6MQDrEcTA+wu01VvSHtFVyBT2NtMRCQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: add irq stack support
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:ETMQ0ELg/6PB7bFqxs2o6hAG8eurGuLaVAOWbSuBWYg7q3zQt8L
 mjHTsV751oCbgyQi8fl8d+UfT3/doJXhHjzd/OHPBX1sLzJqhXOYbowvzDl30ZIuG67gh25
 e0OeYxIT6rrgsEipFVctYIiK6TdJ9/Rw/pjipIMxzxY93Dg0b8HiOUcJWypqFwEfYuvuerW
 yAo3sc/TBquknxNzeFTQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DvVcwkcHscM=:1+9+be9mBTZQsa5T2MEUJ2
 JxjvCDazDN9p3i15NNc7WSKhgllFkBmww2WhnlaXojQwewobVtym2fa3uhSWv6Wn2glhzEp6d
 WXNrLY6Zhij9Kdc/i9ygi7kI6s57GYX3KREJZElHfMlWx78A+BgSZ/njQciXF4LD7yF/P4BaS
 k+rL4z/LFtyNyRwKkDypvpNRiobDWVJ9OspZcDdYesnt4KsUikEes0i26x8TAXo0B96m916yg
 2szWGBks2hU6oNhClqotcZOPkoXgZX9/3rLNoK1tZlBZqdv+uDCMv9FEBARP1yKWN8rCxlTTk
 IAXXkudbtVB877SC7cRoNvS2TAB7WcODMfInbNYuk0xUN/9j1nJvuvm6c4RzenWsf9FCI19FV
 wtJv/UmbAYc+q4L5wd2Mkx67EcuDK4NHjNymBRqG207wCHz6n+yxgzSF4ASfUwK4ga4fnUg/L
 huxM3Td+tGfH1S+k9wVrtok28Kqt/+S6UpGOHfgxK7fYbSXLvv9qVlODKSrbdsJ6W4GwPb7fr
 sFqpJe2prBRDTKXEFfftE1MYawiluvU46G5mpkg8KWdBuUQgu6xBb/y5EiaqWax/900umm2g4
 RhZks478kpa1iDoizEkrXj+/OLB+FhjH1yZkSNhL+TIEKpvD0ZEDIwHc/YI7Ts3qQkwf/kf+L
 /kGGh8ZKFX2osoXX4q1TJg5JMkLSEM1cLx0blM8AKSFQvs3oZMkAatvU1LBuaGXZekhKJGvND
 4x9g/Mw1FnTY5HXXO0We94yPEkYxjwtKLNF50d8M8By+A6L5WCcMGqNLwTwwe68EHo7nOZX5G
 wJN57AwUzjLPwN/Bhz0IzwDnqYsK3eCgh6yuxMUUy/j0StfqsM2R2adlGGTzkw6P33vitnzna
 3Ncuiw2SRBIeLZOW5wBF0n8WrlQRmn921Vrxk+jdQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_011725_026197_E525D75C 
X-CRM114-Status: GOOD (  23.90  )
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

On Sun, May 15, 2022 at 7:14 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> On Mon, Mar 07, 2022 at 08:19:35PM +0100, Arnd Bergmann wrote:
> > On Mon, Mar 7, 2022 at 3:08 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> > > +2:
> >
> > What is the benefit of doing this in assembler? Is it measurably faster?
> >
> > I see that arm64 does the same thing in C code, and it would be best to
> > have a common implementation for doing this, in terms of maintainability.
> >
>
> Sorry for delay. The assembler code is mainly to cal the stack ptr then
> change the SP to use the stack, which equals to arm64 call_on_irq_stack()
> which is implemented in assembler too.

I understand that you need to be in asm code to switch the stack, it
just felt that the arm64 method is a bit easier to debug here.

I suppose being able to keep using generic_handle_arch_irq() is also
beneficial, so it doesn't make much difference either way.

> > > +       for_each_possible_cpu(cpu) {
> > > +#ifdef CONFIG_VMAP_STACK
> > > +               void *s = __vmalloc_node(IRQ_STACK_SIZE, THREAD_ALIGN,
> > > +                                        THREADINFO_GFP, cpu_to_node(cpu),
> > > +                                        __builtin_return_address(0));
> > > +#else
> > > +               void *s = (void *)__get_free_pages(GFP_KERNEL, get_order(IRQ_STACK_SIZE));
> > > +#endif
> >
> > On a related topic: is there a reason to still keep the non-VMAP_STACK
>
> irq stack is 16KB on RV64 now, vmalloc doesn't gurantee physical
> continuous pages, I want to keep the stack physical continuous
> characteristic for !VMAP_STACK case.

I don't understand. What is the benefit of having a physically continuous
stack? If this is required for something, you could still get that with a VMAP
stack by using alloc_pages() to allocate the stack and them using vmap() to
put it into the vmalloc range with appropriate guard pages.

I think we really want to avoid the case of missing guard pages around
the stack, and eliminate the part where the stack is in the linear map.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
