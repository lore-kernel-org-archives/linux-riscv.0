Return-Path: <SRS0=53Iy=OY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A05C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 07:32:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B14F61029
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 07:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B14F61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X9/UapWcC+ddI45GK3jadfdzaWPWdM5OqipMtQeB/Ig=; b=lyi0cn1gXIGRkN
	hD8Ku6F2Rc2dIhMLtJ0jTIq9izH7Pz3htpU6liKByoMoM86FxhRYJeEDeHTiLSYwE97npLvL0lBLO
	9iX0hf/7m2D26sqaijgO0UnEXe4nCm/QZLrIJmnSrlblxAi2UyAo/9qiCN6RFmVy+X9dkuGXZGlIr
	cJEBFbEqol0Ag7P3BIaaXDbZX5irjzCimPLAkfrZI9z0+pYgaBm85qgvTkj0hZLrjEZanGW5MBpsK
	qQTP0ydGqclFPQNY0okmxZniozbTjRWWgccWq4rNIFwqWmMrCOyOGwzUp5MSScNnPOoxHFkRtVoOw
	l1fvkGbK69WSD7HHZIBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXIRy-005Ukx-Id; Mon, 04 Oct 2021 07:31:50 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXIRv-005UjB-Ry
 for linux-riscv@lists.infradead.org; Mon, 04 Oct 2021 07:31:49 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 08881402CF
 for <linux-riscv@lists.infradead.org>; Mon,  4 Oct 2021 07:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633332700;
 bh=yMz7a2U4h7tYNWu8HY/sX3yR4RwoKAQESOaigGzONNc=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=GRDTCJT1m4fZbKTsLeOHaP3WHDe4BrsXV8VT2ghTEEuQ3WjywQEPILgdrohlzDQs/
 SSQdJJYJkKZ2oMbn+Fbfhwp5WEibcZCo1yezaMbjO/Qsr9DoxfDI5LtqOEimDrpDKD
 YR0ScX2/13n3BaYooN5Z2OfKIYJkUTw2oJV+tQpHlJHtSV3j0/Z9sSxeTtkIaLHgPp
 L0F7EdFlunLfXAP3qHe44UCor6vFM5j5qLASEPjXmTrPttLyvpTfu25b/zWB4lyYpZ
 8w5an+sRnuDlAPjsoYuP1KGV7AT2sGJ6a/inKCRug8Es5xKRKU4jPNf/TkAz9jEE9S
 AjLic5mn+jLKA==
Received: by mail-ed1-f71.google.com with SMTP id
 m20-20020aa7c2d4000000b003d1add00b8aso16334908edp.0
 for <linux-riscv@lists.infradead.org>; Mon, 04 Oct 2021 00:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yMz7a2U4h7tYNWu8HY/sX3yR4RwoKAQESOaigGzONNc=;
 b=SQuo8A33IcWqIEHT1/rL/Xn3hf5hXU/qNBEPIN+iR0jaP/hh1uKpAGI9vvbk8JrJsK
 NSsBUdPbluDR1XnAYwUn+JF1h/s8+zO9bHQWururAcnGSBGmQSzBFDMslg2hTgPpim9T
 4Epxl5oQjVOEeXmMnTHdvTGdrJnR+pfPIPlWnV+iimZxsxHUNxZdAzeGuG7fa71JjWTS
 fCUEGA/iETRLpYwhOaVNvyC6tSTqnIlhW5ZPFzDu17qWvXr8k94x3xdoYbNng4datZeF
 ZaI/2iiWXrsUrpuGsmSWy0+eExFnli8W0Q6RnhlPIkDc9rh6imey1/jWVmU3yWpGybBa
 5VWw==
X-Gm-Message-State: AOAM5313AAriTz+u+0w/182phpR7m8i99IaDhFJK3m5fCiNcFfDe7Rjr
 8L1yMyBGkU655JWAUjAWK8CDComFYiYRZeUjIPoA9bxF39CNZaYCGZlMd85iAOOuvrEMqA32WU2
 ySzwse3q9fgKA9onZfIrZC4+tplipIiQztGgaYn0DTmPEHf09KyTsVNsNdbNskQ==
X-Received: by 2002:a17:906:ed1:: with SMTP id
 u17mr16035051eji.304.1633332699389; 
 Mon, 04 Oct 2021 00:31:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHAhKgffAcQ9Ok5Z/TiUwt7wu3AralX9OFoEmbqnI+tZ2U37Ef48COxQfqHUgegwirzhI9KM/V5gt3fvDAjXQ=
X-Received: by 2002:a17:906:ed1:: with SMTP id
 u17mr16035032eji.304.1633332699195; 
 Mon, 04 Oct 2021 00:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
 <20210929145113.1935778-5-alexandre.ghiti@canonical.com>
 <748a2c58-4d69-6457-0aa5-89797cb45a5c@sholland.org>
In-Reply-To: <748a2c58-4d69-6457-0aa5-89797cb45a5c@sholland.org>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Mon, 4 Oct 2021 09:31:26 +0200
Message-ID: <CA+zEjCv-2ONyXykRLP2dabELimYbbCmREP5v6DfeV5zk5T+zRg@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] riscv: Implement sv48 support
To: Samuel Holland <samuel@sholland.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <Atish.Patra@wdc.com>, 
 Christoph Hellwig <hch@lst.de>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Kees Cook <keescook@chromium.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>, linux-doc@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com, 
 linux-efi@vger.kernel.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_003148_089734_C20D79F3 
X-CRM114-Status: GOOD (  22.83  )
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

On Mon, Oct 4, 2021 at 3:34 AM Samuel Holland <samuel@sholland.org> wrote:
>
> On 9/29/21 9:51 AM, Alexandre Ghiti wrote:
> > By adding a new 4th level of page table, give the possibility to 64bit
> > kernel to address 2^48 bytes of virtual address: in practice, that offers
> > 128TB of virtual address space to userspace and allows up to 64TB of
> > physical memory.
> >
> > If the underlying hardware does not support sv48, we will automatically
> > fallback to a standard 3-level page table by folding the new PUD level into
> > PGDIR level. In order to detect HW capabilities at runtime, we
> > use SATP feature that ignores writes with an unsupported mode.
> >
> > Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> > ---
> >  arch/riscv/Kconfig                      |   4 +-
> >  arch/riscv/include/asm/csr.h            |   3 +-
> >  arch/riscv/include/asm/fixmap.h         |   1 +
> >  arch/riscv/include/asm/kasan.h          |   2 +-
> >  arch/riscv/include/asm/page.h           |  10 +
> >  arch/riscv/include/asm/pgalloc.h        |  40 ++++
> >  arch/riscv/include/asm/pgtable-64.h     | 108 ++++++++++-
> >  arch/riscv/include/asm/pgtable.h        |  13 +-
> >  arch/riscv/kernel/head.S                |   3 +-
> >  arch/riscv/mm/context.c                 |   4 +-
> >  arch/riscv/mm/init.c                    | 237 ++++++++++++++++++++----
> >  arch/riscv/mm/kasan_init.c              |  91 +++++++--
> >  drivers/firmware/efi/libstub/efi-stub.c |   2 +
> >  13 files changed, 453 insertions(+), 65 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 13e9c4298fbc..69c5533955ed 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -149,7 +149,7 @@ config PAGE_OFFSET
> >       hex
> >       default 0xC0000000 if 32BIT
> >       default 0x80000000 if 64BIT && !MMU
> > -     default 0xffffffe000000000 if 64BIT
> > +     default 0xffffc00000000000 if 64BIT
> >
> >  config ARCH_FLATMEM_ENABLE
> >       def_bool !NUMA
> > @@ -197,7 +197,7 @@ config FIX_EARLYCON_MEM
> >
> >  config PGTABLE_LEVELS
> >       int
> > -     default 3 if 64BIT
> > +     default 4 if 64BIT
> >       default 2
> >
> >  config LOCKDEP_SUPPORT
> > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> > index 87ac65696871..3fdb971c7896 100644
> > --- a/arch/riscv/include/asm/csr.h
> > +++ b/arch/riscv/include/asm/csr.h
> > @@ -40,14 +40,13 @@
> >  #ifndef CONFIG_64BIT
> >  #define SATP_PPN     _AC(0x003FFFFF, UL)
> >  #define SATP_MODE_32 _AC(0x80000000, UL)
> > -#define SATP_MODE    SATP_MODE_32
> >  #define SATP_ASID_BITS       9
> >  #define SATP_ASID_SHIFT      22
> >  #define SATP_ASID_MASK       _AC(0x1FF, UL)
> >  #else
> >  #define SATP_PPN     _AC(0x00000FFFFFFFFFFF, UL)
> >  #define SATP_MODE_39 _AC(0x8000000000000000, UL)
> > -#define SATP_MODE    SATP_MODE_39
> > +#define SATP_MODE_48 _AC(0x9000000000000000, UL)
> >  #define SATP_ASID_BITS       16
> >  #define SATP_ASID_SHIFT      44
> >  #define SATP_ASID_MASK       _AC(0xFFFF, UL)
> > diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
> > index 54cbf07fb4e9..58a718573ad6 100644
> > --- a/arch/riscv/include/asm/fixmap.h
> > +++ b/arch/riscv/include/asm/fixmap.h
> > @@ -24,6 +24,7 @@ enum fixed_addresses {
> >       FIX_HOLE,
> >       FIX_PTE,
> >       FIX_PMD,
> > +     FIX_PUD,
> >       FIX_TEXT_POKE1,
> >       FIX_TEXT_POKE0,
> >       FIX_EARLYCON_MEM_BASE,
> > diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
> > index a2b3d9cdbc86..1dcf5fa93aa0 100644
> > --- a/arch/riscv/include/asm/kasan.h
> > +++ b/arch/riscv/include/asm/kasan.h
> > @@ -27,7 +27,7 @@
> >   */
> >  #define KASAN_SHADOW_SCALE_SHIFT     3
> >
> > -#define KASAN_SHADOW_SIZE    (UL(1) << ((CONFIG_VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))
> > +#define KASAN_SHADOW_SIZE    (UL(1) << ((VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))
>
> Does this change belong in patch 1, where you remove CONFIG_VA_BITS?

Indeed, I fixed KASAN in this version and wrongly rebased the changes.

Thanks!

Alex

>
> Regards,
> Samuel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
