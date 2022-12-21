Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997A4C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 14:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=teNUg19o2QXCwNItzS5J4z1BznS1X1HyOfdtUurTxuA=; b=mHEUp00zwiySkw
	3GpMmgRpLBvv85nxx0qiWxfLvNfmRpuCC59/NMiovGE8BbkK4t4QwziKmxOiqzxoP4YOXdJYs6fDE
	LpfM+mb/1BoUbnLL5ahfY9XyRYCnuOp+NH63e7ihn2hEdt7zrSYlrhSObvweqJcyEorT9xwsW2Mnz
	Is8ONpGvzZI2IYJnMhJKfCTmnewuTXfa9KKC+cFDR82K5/5b0G2RZETaupT4Huu38ax8YceWh7MNg
	rE7pVMJYrgmgeGBzQ5Iprk7ayg8+xx9kXNVq0iUchsqvtcOOEFpnh9ReKp9GG3R6Ifh2oYhTuFHgM
	Nd4cjF8VviVFKISOgUpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p802g-00FZXd-PA; Wed, 21 Dec 2022 14:25:58 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p800d-00FYXT-FJ
	for linux-riscv@lists.infradead.org; Wed, 21 Dec 2022 14:23:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso1568230wmo.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Dec 2022 06:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pHd3rehtJfdxGw9liVvNFHcBIni6Z85SwwxIj+0xI2s=;
        b=Rdsoz3upzbF0KnB5RMQeOiafL2CuQGOxPgVFaKN3yTg/y656JrD/yAoz2eNT/KouGG
         ECzmoDoug9ucNRY9BULO+DrZpmvpKGZLmKxG7nbWu5P0hSo2G7VJXU6Rdelud2+aJcm1
         9pzdU8Kl7Y/P2Zoa03cfGIlZgfjkWiWaHzp6KiPpenU3GxiPNgnFcwT/PJHoYC1R+k0D
         ogeKzhLTPEFwYt7PsPjj045vhM1eQ2jHX4VXV3jBQAi4UD/pj9qzw/TCBe/iyQ8zE7Xw
         NZrovzgb07r/oCvSmVMUdnGVfdAkdEkb7OpdtJaM8lYIdavk7GYPT5WMvuKrKvdJajFC
         yRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHd3rehtJfdxGw9liVvNFHcBIni6Z85SwwxIj+0xI2s=;
        b=DXE09phnsW2zxgzh2+yAktJuLD2dkZvrgWbsFxotcUIy8t+ERhCGLByUPZYQjtNdBN
         5rJ5O0BaW0O0+aBybG5Mi1RIQJMpd6DpcaeoTYB3WlMPJRFbkt2s+cUHkBHwmZjRwsAR
         8p/b1XDFOdswQNXdzAWi3pVJF1Now8RQoWJBho1WTEbqRkpQTcnVQ5WASDCZJxwHkXYI
         zbEeDF8QZ0x5rihA9BJ6dbkIGu0A8X19850ZTdBam2pc0ITt/IwX4SpN3YSJ24ht8V7J
         deY/r/3a11B67uSUu6i1YE4YFqdtBC6pSXE333yvW8Wqrykn5V9Yn1V2qvgVfpmpzlQX
         9NmA==
X-Gm-Message-State: AFqh2kqVSFVweltjcYs1OvFazwQ8zrtbjDx6+Wd9r4MRtwCb1O+GZe7W
	1G9h++Z/6cyygy7G18hvsXmo4VOIv2iHWCY6UOiXBQ==
X-Google-Smtp-Source: AMrXdXsB84kMk8mAXxtr/f9tZ0L/u3ul+lmOdS6DfXlM9ey8JK+C/2BS3j/slVxQM6a+wlCgKDAjV7cFTYERnjjjoNA=
X-Received: by 2002:a05:600c:3d16:b0:3cf:a80d:59cd with SMTP id
 bh22-20020a05600c3d1600b003cfa80d59cdmr137973wmb.5.1671632626854; Wed, 21 Dec
 2022 06:23:46 -0800 (PST)
MIME-Version: 1.0
References: <20221216162141.1701255-1-alexghiti@rivosinc.com>
 <20221216162141.1701255-5-alexghiti@rivosinc.com> <Y6MSxBaJU7JqfkJO@spud>
In-Reply-To: <Y6MSxBaJU7JqfkJO@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 21 Dec 2022 15:23:36 +0100
Message-ID: <CAHVXubgzac0gXNF2FVeUrCAnOe7U9QhAfj3nWd_jc0maaepN2g@mail.gmail.com>
Subject: Re: [PATCH 4/6] riscv: Fix EFI stub usage of KASAN instrumented
 string functions
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_062351_762379_8BC246E4 
X-CRM114-Status: GOOD (  40.45  )
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

Hi Conor,

On Wed, Dec 21, 2022 at 3:06 PM Conor Dooley <conor@kernel.org> wrote:
>
> Hey Alex!
>
> On Fri, Dec 16, 2022 at 05:21:39PM +0100, Alexandre Ghiti wrote:
> > The EFI stub must not use any KASAN instrumented code as the kernel
> > proper did not initialize the thread pointer and the mapping for the
> > KASAN shadow region.
> >
> > Avoid using generic string functions by copying stub dependencies from
> > lib/string.c to drivers/firmware/efi/libstub/string.c as RISC-V does
> > not implement architecture-specific versions of those functions.
>
> To the unaware among us, how does this interact with Heiko's custom
> functions for bitmanip extensions? Is this diametrically opposed to
> that, or does it actually help avoid having to have special handling
> for the efi stub?

I'm not sure which patchset you are referring to, but I guess you are
talking about arch-specific string functions:

- If they are written in assembly and are then not kasan-instrumented,
we'll be able to use them and then revert part of this patch.
- If they are written in C and are then kasan-instrumented (because
we'll want to instrument them), we'll keep using the implementation
added here.

Hope that answers your question!

Alex

>
> Also, checkpatch seems to be rather unhappy with you here:
> https://gist.github.com/conor-pwbot/e5b4c8f2c3b88b4a8fcab4df437613e2

Yes, those new functions are exact copies from lib/string.c, I did not
want to fix those checkpatch errors in this patchset.

>
> Thanks,
> Conor.
>
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  arch/riscv/kernel/image-vars.h        |   8 --
> >  drivers/firmware/efi/libstub/Makefile |   7 +-
> >  drivers/firmware/efi/libstub/string.c | 133 ++++++++++++++++++++++++++
> >  3 files changed, 137 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
> > index d6e5f739905e..15616155008c 100644
> > --- a/arch/riscv/kernel/image-vars.h
> > +++ b/arch/riscv/kernel/image-vars.h
> > @@ -23,14 +23,6 @@
> >   * linked at. The routines below are all implemented in assembler in a
> >   * position independent manner
> >   */
> > -__efistub_memcmp             = memcmp;
> > -__efistub_memchr             = memchr;
> > -__efistub_strlen             = strlen;
> > -__efistub_strnlen            = strnlen;
> > -__efistub_strcmp             = strcmp;
> > -__efistub_strncmp            = strncmp;
> > -__efistub_strrchr            = strrchr;
> > -
> >  __efistub__start             = _start;
> >  __efistub__start_kernel              = _start_kernel;
> >  __efistub__end                       = _end;
> > diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
> > index b1601aad7e1a..031d2268bab5 100644
> > --- a/drivers/firmware/efi/libstub/Makefile
> > +++ b/drivers/firmware/efi/libstub/Makefile
> > @@ -130,9 +130,10 @@ STUBCOPY_RELOC-$(CONFIG_ARM)     := R_ARM_ABS
> >  # also means that we need to be extra careful to make sure that the stub does
> >  # not rely on any absolute symbol references, considering that the virtual
> >  # kernel mapping that the linker uses is not active yet when the stub is
> > -# executing. So build all C dependencies of the EFI stub into libstub, and do
> > -# a verification pass to see if any absolute relocations exist in any of the
> > -# object files.
> > +# executing. In addition, we need to make sure that the stub does not use KASAN
> > +# instrumented code like the generic string functions. So build all C
> > +# dependencies of the EFI stub into libstub, and do a verification pass to see
> > +# if any absolute relocations exist in any of the object files.
> >  #
> >  STUBCOPY_FLAGS-$(CONFIG_ARM64)       += --prefix-alloc-sections=.init \
> >                                  --prefix-symbols=__efistub_
> > diff --git a/drivers/firmware/efi/libstub/string.c b/drivers/firmware/efi/libstub/string.c
> > index 5d13e43869ee..5154ae6e7f10 100644
> > --- a/drivers/firmware/efi/libstub/string.c
> > +++ b/drivers/firmware/efi/libstub/string.c
> > @@ -113,3 +113,136 @@ long simple_strtol(const char *cp, char **endp, unsigned int base)
> >
> >       return simple_strtoull(cp, endp, base);
> >  }
> > +
> > +#ifndef __HAVE_ARCH_STRLEN
> > +/**
> > + * strlen - Find the length of a string
> > + * @s: The string to be sized
> > + */
> > +size_t strlen(const char *s)
> > +{
> > +     const char *sc;
> > +
> > +     for (sc = s; *sc != '\0'; ++sc)
> > +             /* nothing */;
> > +     return sc - s;
> > +}
> > +EXPORT_SYMBOL(strlen);
> > +#endif
> > +
> > +#ifndef __HAVE_ARCH_STRNLEN
> > +/**
> > + * strnlen - Find the length of a length-limited string
> > + * @s: The string to be sized
> > + * @count: The maximum number of bytes to search
> > + */
> > +size_t strnlen(const char *s, size_t count)
> > +{
> > +     const char *sc;
> > +
> > +     for (sc = s; count-- && *sc != '\0'; ++sc)
> > +             /* nothing */;
> > +     return sc - s;
> > +}
> > +EXPORT_SYMBOL(strnlen);
> > +#endif
> > +
> > +#ifndef __HAVE_ARCH_STRCMP
> > +/**
> > + * strcmp - Compare two strings
> > + * @cs: One string
> > + * @ct: Another string
> > + */
> > +int strcmp(const char *cs, const char *ct)
> > +{
> > +     unsigned char c1, c2;
> > +
> > +     while (1) {
> > +             c1 = *cs++;
> > +             c2 = *ct++;
> > +             if (c1 != c2)
> > +                     return c1 < c2 ? -1 : 1;
> > +             if (!c1)
> > +                     break;
> > +     }
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL(strcmp);
> > +#endif
> > +
> > +#ifndef __HAVE_ARCH_STRRCHR
> > +/**
> > + * strrchr - Find the last occurrence of a character in a string
> > + * @s: The string to be searched
> > + * @c: The character to search for
> > + */
> > +char *strrchr(const char *s, int c)
> > +{
> > +     const char *last = NULL;
> > +     do {
> > +             if (*s == (char)c)
> > +                     last = s;
> > +     } while (*s++);
> > +     return (char *)last;
> > +}
> > +EXPORT_SYMBOL(strrchr);
> > +#endif
> > +
> > +#ifndef __HAVE_ARCH_MEMCMP
> > +/**
> > + * memcmp - Compare two areas of memory
> > + * @cs: One area of memory
> > + * @ct: Another area of memory
> > + * @count: The size of the area.
> > + */
> > +#undef memcmp
> > +__visible int memcmp(const void *cs, const void *ct, size_t count)
> > +{
> > +     const unsigned char *su1, *su2;
> > +     int res = 0;
> > +
> > +#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> > +     if (count >= sizeof(unsigned long)) {
> > +             const unsigned long *u1 = cs;
> > +             const unsigned long *u2 = ct;
> > +             do {
> > +                     if (get_unaligned(u1) != get_unaligned(u2))
> > +                             break;
> > +                     u1++;
> > +                     u2++;
> > +                     count -= sizeof(unsigned long);
> > +             } while (count >= sizeof(unsigned long));
> > +             cs = u1;
> > +             ct = u2;
> > +     }
> > +#endif
> > +     for (su1 = cs, su2 = ct; 0 < count; ++su1, ++su2, count--)
> > +             if ((res = *su1 - *su2) != 0)
> > +                     break;
> > +     return res;
> > +}
> > +EXPORT_SYMBOL(memcmp);
> > +#endif
> > +
> > +#ifndef __HAVE_ARCH_MEMCHR
> > +/**
> > + * memchr - Find a character in an area of memory.
> > + * @s: The memory area
> > + * @c: The byte to search for
> > + * @n: The size of the area.
> > + *
> > + * returns the address of the first occurrence of @c, or %NULL
> > + * if @c is not found
> > + */
> > +void *memchr(const void *s, int c, size_t n)
> > +{
> > +     const unsigned char *p = s;
> > +     while (n-- != 0) {
> > +             if ((unsigned char)c == *p++) {
> > +                     return (void *)(p - 1);
> > +             }
> > +     }
> > +     return NULL;
> > +}
> > +EXPORT_SYMBOL(memchr);
> > +#endif
> > --
> > 2.37.2
> >
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
