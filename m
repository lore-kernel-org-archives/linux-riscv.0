Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B208C677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 03:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hpTFooD3/1OXN2ufPu1fid7Y/FJPOSYRK7m8qEEeZ5I=; b=Xhmo6VdUa+2gnZ
	VqakMxjdJPkrnGmjcv3uUq+nrGmCBlaOv82l4nkqqd8b8nJgAQFcvO/JG43Oycs07/KDTHFxDkVka
	hmfCH0uawHYN720MDPRYwNT7EPl0bzst5Umzot80jO89LGgZMywFeUjhG9iZjCKnshiA073rTrL0M
	wR1Nx70TsIdPqIbG2hWXX8R03Or1lVXiWNsql8pZeQt9+oGCghIECmA4pOM+o5evc8/wGCUojDNdw
	qxEcKErzN0830HSzY1N/PBu03tZ80E7iP0iLypRC2fUknQRRQsrfA+59Ze0PhhE2jbFT9xCABUFrc
	+y/2rpJFlc9i+6eEwRnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBos-00000008iKo-0unl;
	Wed, 11 Jun 2025 03:08:06 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBlB-00000008i5b-2Sl0
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 03:04:18 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-72c27166ab3so4332287a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 20:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749611056; x=1750215856; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h0vMZ6RS4KZgXTPFZZwfCCY/cIIcHwyiQtEt00FbCAs=;
        b=jiNEiaxDxvyrsxqTNQMBfbCCzS0mgkcSVyHHSnE6Buf+p2Ad+S1J0sEbpNBGrLBr1e
         uhZ7d52r0MDAWZWWjNKA4ic6wzMmH93lHkppy/UNGLbY9egXYtdDuW7U3KGNNRAWOWdA
         GjOlGw9mTTj4Wo/zkMSqZt9bqEWQtXz04EmOJQQ4UI86bKeH/5dQxtVfAXzRi27uuYUo
         l+kmc5lzrNgBwyUa8wxN5/uvgqy6VLR78QSTleHEkkWfpfh8X/TZ/GdaoayzG0RJxtYI
         WGsv+KrRf45+4U4TikkrN+G00QY9nI0xnuQGs4aeQRm8wP7U+GXl+f/cxmK8qW8+WDww
         XJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749611056; x=1750215856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0vMZ6RS4KZgXTPFZZwfCCY/cIIcHwyiQtEt00FbCAs=;
        b=His0PUTMoGTMuplsloXHhGNahzMpN8mpNoX7A3BUFK4hc7wYNdCimiH5hHTdlD2tYB
         CBkKoyqyb9Zz27Vc0kLAVbtog348u70uR1U4JOISsMoHtvcvUFGBor4zjshCdPHuM7tA
         cjmWz0dQpEHKUXD63C1krWiADEVaEy7uy8ZNs87m2O5RdC8zePsnR/UTX2bhojdhLIZ6
         KzyHkg2Voyq9szhWhuMNc2LjzO+5zFzzBUz3ehu3KDsTg60FR2oVQJKaJ05cq6v7CKh+
         WZu2phNiZSnHEgcQkhEO6KsewJn9IFyjoNSS6UHaH2oHo4vaew7B1ZnT5ez1uXUWSuZM
         rDCg==
X-Forwarded-Encrypted: i=1; AJvYcCVHT+6b9VCAoqM8hboAu6tBu0DVqXxHZbC9zFayQp9bZ4nkTPtC1Cjcg75explAhrFcTskfPYGbVYZ1Cg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIk/jg48XVI/csJjZMsE0LOEXCBq+Hf8bf8E4DS2c8G9y/ic+d
	kXMiTWFNCqctWI8/bD60aS2+fxMYwAw71hoN6Gz2ndo9QST7zJrjBn2CIDg2iIH3o+xpsdaeWi5
	mNPhIWW530GkXVKi76SLjC2p0RZC4Wls=
X-Gm-Gg: ASbGnctDvp9JCUSB7l77+ulykkixYJ8llvTCcOW0D+cCsj0kP6cp00CHUAi52mNlJPN
	itxxAVsUM1AS4WrLtKYDRvzoyPjPqNAX8000koJ9/oN3NX1DzWdGEYPm9S7w52HXld3+/B1u6bZ
	m5joN4d5gR7qdBYwhMDNORw6QQPgio5Vw5VOTGFG3gmlbwK25ZrW82xW2NmVOi7O3EwKztAi+5h
	Ac=
X-Google-Smtp-Source: AGHT+IEvUsEISWdsBbdJKh0v2HGHrMV9/aTnXFIn2m1HfLsSUPoYUO446g2msReWU9yYxWavikvhooBoozIfxlox6UQ=
X-Received: by 2002:a05:6870:d189:b0:2c1:51f7:e648 with SMTP id
 586e51a60fabf-2ea99a3f908mr777187fac.35.1749611056568; Tue, 10 Jun 2025
 20:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250610101234.1100660-3-zhangchunyan@iscas.ac.cn> <mhng-8AD2A457-504F-4EF6-AB17-2CF316DFF6A0@palmerdabbelt-mac>
In-Reply-To: <mhng-8AD2A457-504F-4EF6-AB17-2CF316DFF6A0@palmerdabbelt-mac>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Wed, 11 Jun 2025 11:03:37 +0800
X-Gm-Features: AX0GCFsDnM8WxeSPLuep8sadI96fmUB9fnDpELth6QLXswhRYNm23160O-w3_Pk
Message-ID: <CAAfSe-sZLKCGdgHZjmAbwqsv0bUUkBcWeeXarMp7htRLCtArsA@mail.gmail.com>
Subject: Re: [PATCH 2/4] raid6: riscv: Fix NULL pointer dereference issue
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: zhangchunyan@iscas.ac.cn, Paul Walmsley <paul.walmsley@sifive.com>, 
	aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>, 
	Charlie Jenkins <charlie@rivosinc.com>, song@kernel.org, yukuai3@huawei.com, 
	linux-riscv@lists.infradead.org, linux-raid@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_200417_626755_89F692E4 
X-CRM114-Status: GOOD (  29.95  )
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

On Wed, 11 Jun 2025 at 06:00, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 10 Jun 2025 03:12:32 PDT (-0700), zhangchunyan@iscas.ac.cn wrote:
> > When running the raid6 user-space test program on RISC-V QEMU, there's a
> > segmentation fault which seems caused by accessing a NULL pointer,
> > which is the pointer variable p/q in raid6_rvv*_gen/xor_syndrome_real(),
> > p/q should have been equal to dptr[x], but when I use GDB command to
> > see its value, which was 0x10 like below:
> >
> > "
> > Program received signal SIGSEGV, Segmentation fault.
> > 0x0000000000011062 in raid6_rvv2_xor_syndrome_real (disks=<optimized out>, start=0, stop=<optimized out>, bytes=4096, ptrs=<optimized out>) at rvv.c:386
> > (gdb) p p
> > $1 = (u8 *) 0x10 <error: Cannot access memory at address 0x10>
> > "
> >
> > The issue was found to be related with:
> > 1) Compile optimization
> >    There's no segmentation fault if compiling the raid6test program with
> >    the optimization flag -O0.
> > 2) The RISC-V vector command vsetvli
> >    If not used t0 as the first parameter in vsetvli, there's no
> >    segmentation fault either.
> >
> > This patch selects the 2nd solution to fix the issue.
>
> This code is super fragile, it's got a bunch of vector asm blocks in
> there that aren't declaring their cobbers.  At a bare minimum we should
> have something like
>
>     diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
>     index 99dfa16d37c7..3c9b3fd9f2ed 100644
>     --- a/lib/raid6/rvv.c
>     +++ b/lib/raid6/rvv.c
>     @@ -17,6 +17,10 @@
>      #define NSIZE  16
>      #endif
>
>     +#ifdef __riscv_vector
>     +#error "This code must be built without compiler support for vector"
>     +#endif
>     +

Ok, I will add this.

Thanks,
Chunyan

>      static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
>      {
>         u8 **dptr = (u8 **)ptrs;
>
> because it just won't work when built with a compiler that can use
> vector instructions.
>
> > Fixes: 6093faaf9593 ("raid6: Add RISC-V SIMD syndrome and recovery calculations")
> > Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> > ---
> >  lib/raid6/rvv.c | 48 ++++++++++++++++++++++++++++--------------------
> >  1 file changed, 28 insertions(+), 20 deletions(-)
> >
> > diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
> > index bf7d5cd659e0..b193ea176d5d 100644
> > --- a/lib/raid6/rvv.c
> > +++ b/lib/raid6/rvv.c
> > @@ -23,9 +23,9 @@ static int rvv_has_vector(void)
> >  static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
> >  {
> >       u8 **dptr = (u8 **)ptrs;
> > -     unsigned long d;
> > -     int z, z0;
> >       u8 *p, *q;
> > +     unsigned long vl, d;
> > +     int z, z0;
> >
> >       z0 = disks - 3;         /* Highest data disk */
> >       p = dptr[z0 + 1];               /* XOR parity */
> > @@ -33,8 +33,9 @@ static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **
> >
> >       asm volatile (".option  push\n"
> >                     ".option  arch,+v\n"
> > -                   "vsetvli  t0, x0, e8, m1, ta, ma\n"
> > +                   "vsetvli  %0, x0, e8, m1, ta, ma\n"
> >                     ".option  pop\n"
> > +                   : "=&r" (vl)
> >       );
> >
> >        /* v0:wp0, v1:wq0, v2:wd0/w20, v3:w10 */
> > @@ -96,7 +97,7 @@ static void raid6_rvv1_xor_syndrome_real(int disks, int start, int stop,
> >  {
> >       u8 **dptr = (u8 **)ptrs;
> >       u8 *p, *q;
> > -     unsigned long d;
> > +     unsigned long vl, d;
> >       int z, z0;
> >
> >       z0 = stop;              /* P/Q right side optimization */
> > @@ -105,8 +106,9 @@ static void raid6_rvv1_xor_syndrome_real(int disks, int start, int stop,
> >
> >       asm volatile (".option  push\n"
> >                     ".option  arch,+v\n"
> > -                   "vsetvli  t0, x0, e8, m1, ta, ma\n"
> > +                   "vsetvli  %0, x0, e8, m1, ta, ma\n"
> >                     ".option  pop\n"
> > +                   : "=&r" (vl)
> >       );
> >
> >       /* v0:wp0, v1:wq0, v2:wd0/w20, v3:w10 */
> > @@ -192,9 +194,9 @@ static void raid6_rvv1_xor_syndrome_real(int disks, int start, int stop,
> >  static void raid6_rvv2_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
> >  {
> >       u8 **dptr = (u8 **)ptrs;
> > -     unsigned long d;
> > -     int z, z0;
> >       u8 *p, *q;
> > +     unsigned long vl, d;
> > +     int z, z0;
> >
> >       z0 = disks - 3;         /* Highest data disk */
> >       p = dptr[z0 + 1];               /* XOR parity */
> > @@ -202,8 +204,9 @@ static void raid6_rvv2_gen_syndrome_real(int disks, unsigned long bytes, void **
> >
> >       asm volatile (".option  push\n"
> >                     ".option  arch,+v\n"
> > -                   "vsetvli  t0, x0, e8, m1, ta, ma\n"
> > +                   "vsetvli  %0, x0, e8, m1, ta, ma\n"
> >                     ".option  pop\n"
> > +                   : "=&r" (vl)
> >       );
> >
> >       /*
> > @@ -284,7 +287,7 @@ static void raid6_rvv2_xor_syndrome_real(int disks, int start, int stop,
> >  {
> >       u8 **dptr = (u8 **)ptrs;
> >       u8 *p, *q;
> > -     unsigned long d;
> > +     unsigned long vl, d;
> >       int z, z0;
> >
> >       z0 = stop;              /* P/Q right side optimization */
> > @@ -293,8 +296,9 @@ static void raid6_rvv2_xor_syndrome_real(int disks, int start, int stop,
> >
> >       asm volatile (".option  push\n"
> >                     ".option  arch,+v\n"
> > -                   "vsetvli  t0, x0, e8, m1, ta, ma\n"
> > +                   "vsetvli  %0, x0, e8, m1, ta, ma\n"
> >                     ".option  pop\n"
> > +                   : "=&r" (vl)
> >       );
> >
> >       /*
> > @@ -410,9 +414,9 @@ static void raid6_rvv2_xor_syndrome_real(int disks, int start, int stop,
> >  static void raid6_rvv4_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
> >  {
> >       u8 **dptr = (u8 **)ptrs;
> > -     unsigned long d;
> > -     int z, z0;
> >       u8 *p, *q;
> > +     unsigned long vl, d;
> > +     int z, z0;
> >
> >       z0 = disks - 3; /* Highest data disk */
> >       p = dptr[z0 + 1];       /* XOR parity */
> > @@ -420,8 +424,9 @@ static void raid6_rvv4_gen_syndrome_real(int disks, unsigned long bytes, void **
> >
> >       asm volatile (".option  push\n"
> >                     ".option  arch,+v\n"
> > -                   "vsetvli  t0, x0, e8, m1, ta, ma\n"
> > +                   "vsetvli  %0, x0, e8, m1, ta, ma\n"
> >                     ".option  pop\n"
> > +                   : "=&r" (vl)
> >       );
> >
> >       /*
> > @@ -536,7 +541,7 @@ static void raid6_rvv4_xor_syndrome_real(int disks, int start, int stop,
> >  {
> >       u8 **dptr = (u8 **)ptrs;
> >       u8 *p, *q;
> > -     unsigned long d;
> > +     unsigned long vl, d;
> >       int z, z0;
> >
> >       z0 = stop;              /* P/Q right side optimization */
> > @@ -545,8 +550,9 @@ static void raid6_rvv4_xor_syndrome_real(int disks, int start, int stop,
> >
> >       asm volatile (".option  push\n"
> >                     ".option  arch,+v\n"
> > -                   "vsetvli  t0, x0, e8, m1, ta, ma\n"
> > +                   "vsetvli  %0, x0, e8, m1, ta, ma\n"
> >                     ".option  pop\n"
> > +                   : "=&r" (vl)
> >       );
> >
> >       /*
> > @@ -718,9 +724,9 @@ static void raid6_rvv4_xor_syndrome_real(int disks, int start, int stop,
> >  static void raid6_rvv8_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
> >  {
> >       u8 **dptr = (u8 **)ptrs;
> > -     unsigned long d;
> > -     int z, z0;
> >       u8 *p, *q;
> > +     unsigned long vl, d;
> > +     int z, z0;
> >
> >       z0 = disks - 3; /* Highest data disk */
> >       p = dptr[z0 + 1];       /* XOR parity */
> > @@ -728,8 +734,9 @@ static void raid6_rvv8_gen_syndrome_real(int disks, unsigned long bytes, void **
> >
> >       asm volatile (".option  push\n"
> >                     ".option  arch,+v\n"
> > -                   "vsetvli  t0, x0, e8, m1, ta, ma\n"
> > +                   "vsetvli  %0, x0, e8, m1, ta, ma\n"
> >                     ".option  pop\n"
> > +                   : "=&r" (vl)
> >       );
> >
> >       /*
> > @@ -912,7 +919,7 @@ static void raid6_rvv8_xor_syndrome_real(int disks, int start, int stop,
> >  {
> >       u8 **dptr = (u8 **)ptrs;
> >       u8 *p, *q;
> > -     unsigned long d;
> > +     unsigned long vl, d;
> >       int z, z0;
> >
> >       z0 = stop;              /* P/Q right side optimization */
> > @@ -921,8 +928,9 @@ static void raid6_rvv8_xor_syndrome_real(int disks, int start, int stop,
> >
> >       asm volatile (".option  push\n"
> >                     ".option  arch,+v\n"
> > -                   "vsetvli  t0, x0, e8, m1, ta, ma\n"
> > +                   "vsetvli  %0, x0, e8, m1, ta, ma\n"
> >                     ".option  pop\n"
> > +                   : "=&r" (vl)
> >       );
> >
> >       /*

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
