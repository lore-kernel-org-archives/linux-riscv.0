Return-Path: <SRS0=aH+X=4W=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D0CC3F2D7
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2020 04:01:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E07AE208C3
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2020 04:01:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HYv87297";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8f1Lpzo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E07AE208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9VU+lVbHX0qAw8bXtTYx7XdwXh/+wKdP6K88dg5a7UM=; b=HYv87297TMG9Dc
	xPmS98y0VewEyxkS9LeULBe7UFK8+GddyGBEl1HQkiLzn7kPVNRPg51mEeug4yl00hNa29vAa3YYZ
	PmNxHf1HuoxQm7d7r2t9v6m4/jZPbLCLjVzpSeTkCo/ryxsalxZZ7nNkdWwbDyJgiF0RIyH8Ma2kd
	bXMrMUKBs7ilPINeWFJd8+IHJSZ9ewRBv3V+HLHhXLLnjCfQFAmvULD5A6YzVpZqe+N/Fpck4iJ87
	NWiStJIhBDs26vM41Fl5I6i8wcei97AOFtQbt+jKAfeO6yLkoA/yydlzo/DD+iSBrLD0XCqUfkckr
	8f5ippXjOxx08eHqxzVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9hhI-0000Ft-Hp; Thu, 05 Mar 2020 04:01:20 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9hhF-0000FQ-Ur
 for linux-riscv@lists.infradead.org; Thu, 05 Mar 2020 04:01:19 +0000
Received: by mail-lj1-x241.google.com with SMTP id 195so4467935ljf.3
 for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2020 20:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9VU+lVbHX0qAw8bXtTYx7XdwXh/+wKdP6K88dg5a7UM=;
 b=m8f1LpzoYDlsqPhFGG0BvlCvNoSoVC6VdZ+wMBtBZ7sIxYiA3QyplOfaFWVZVdoTEi
 iS+0bM+SdOGRNLGNrc+89EpUjiv+4YEv7Ht47ocfGFo9s3WSwwWJ/n9OKEZb1TlYzKek
 ZQJxY4D8/lOfjukIL4HuQZTE1Kv+OQZr0tCcAU8ladJb2WVB0UbMCrruHms/41KyyQiR
 T6PZXM01KDvH9tLYxktX/Pi98Ajf8VKpAhqA6ucQ6ufxa9Y8svUOXon8/reAGeqxKsKl
 uH7LkhJ5KWmwxj02gYMqgweVS/f8j/IcgHs4lFAo6VA8PzsIr6AJ5CDe1ipv7ll2YzDB
 Otkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9VU+lVbHX0qAw8bXtTYx7XdwXh/+wKdP6K88dg5a7UM=;
 b=ndD8Uz1OtLQyP208e5x9HWC5Qe+fhm/4TscaCrhh5kAPwJmthMbLkHNl4Y89XYgNCb
 X0CwEkbG7TMe0izFglouHkLtQagkiPIfdqQgvVodt7UcbFypCljC2D0qsa0KulGhZpHk
 5U+JfOVp/vRxlFcFsbTu4cvruy/ugzPbHOCE15ryqxVOVGTErqMoGlgnNMLtYrDISnzq
 dmvB2gCc5Jb4Eiv7xA8OdD2LVjI34Dio3axnVdEFsTc5/FSXjm529m9XC5FH1OfOzyvH
 cgKqJtrdiJNjbpmXdis4X/A4nqC8ZxxZGwa9MNe20SKUStri7JAgj5SBTfGWjcgP/KO7
 lMiw==
X-Gm-Message-State: ANhLgQ2uhAA740xVH0v2o1/klqn29+hNcYj8DSo6SuVDZW310HY33u0q
 rkPz0AL0z5DcwIIjt0YeWDEMRfao/Hq3SJV+PCc=
X-Google-Smtp-Source: ADFU+vtfwukAWL2WWaPv7EjY+eaP00v7NFT4qzt/7yJWqeGIKgBCWO1yg82W0W0UQAr2SSakpTQnbbixPieeNawRqVM=
X-Received: by 2002:a2e:b0c4:: with SMTP id g4mr3907216ljl.83.1583380875979;
 Wed, 04 Mar 2020 20:01:15 -0800 (PST)
MIME-Version: 1.0
References: <20200217083223.2011-5-zong.li@sifive.com>
 <mhng-6a94c49b-419b-4b5a-a11d-dda1fb0aa896@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-6a94c49b-419b-4b5a-a11d-dda1fb0aa896@palmerdabbelt-glaptop1>
From: Zong Li <zongbox@gmail.com>
Date: Thu, 5 Mar 2020 12:01:04 +0800
Message-ID: <CA+ZOyai1rUVttopEOGMjug8fM6YkV3c+WTstxD6YojdwMCmHzw@mail.gmail.com>
Subject: Re: [PATCH 4/8] riscv: move exception table immediately after RO_DATA
To: Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_200118_030831_03EC8B2D 
X-CRM114-Status: GOOD (  19.24  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Palmer Dabbelt <palmer@dabbelt.com> =E6=96=BC 2020=E5=B9=B43=E6=9C=885=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=888:58=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, 17 Feb 2020 00:32:19 PST (-0800), zong.li@sifive.com wrote:
> > Move EXCEPTION_TABLE immediately after RO_DATA. Make it easy to set the
> > attribution of the sections which should be read-only at a time.
> > Move .sdata to indicate the start of data section with write permission=
.
> > This patch is prepared for STRICT_KERNEL_RWX support.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  arch/riscv/kernel/vmlinux.lds.S | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinu=
x.lds.S
> > index 1e0193ded420..4ba8a5397e8b 100644
> > --- a/arch/riscv/kernel/vmlinux.lds.S
> > +++ b/arch/riscv/kernel/vmlinux.lds.S
> > @@ -9,6 +9,7 @@
> >  #include <asm/page.h>
> >  #include <asm/cache.h>
> >  #include <asm/thread_info.h>
> > +#include <asm/set_memory.h>
> >
> >  OUTPUT_ARCH(riscv)
> >  ENTRY(_start)
> > @@ -52,12 +53,15 @@ SECTIONS
> >       }
> >
> >       /* Start of data section */
> > -     _sdata =3D .;
> >       RO_DATA(L1_CACHE_BYTES)
> >       .srodata : {
> >               *(.srodata*)
> >       }
> >
> > +     EXCEPTION_TABLE(0x10)
> > +
> > +     _sdata =3D .;
> > +
> >       RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
> >       .sdata : {
> >               __global_pointer$ =3D . + 0x800;
> > @@ -69,8 +73,6 @@ SECTIONS
> >
> >       BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
> >
> > -     EXCEPTION_TABLE(0x10)
> > -
> >       .rel.dyn : {
> >               *(.rel.dyn*)
> >       }
>
> As far as I can tell this is OK: core_kernel_data() explicitly says that =
RODATA
> may or may not be between _sdata and _edata.  That said, I think we shoul=
d add
> __start_rodata and __end_rodata atomicly with this change (around RO_DATA=
 and
> .srodata).
>

OK, I'll move _sdata back. Actually, here I need a symbol to specify
the start address at writable data (RW_DATA), thus, I could remove the
executable permission of .data section (from this symbol), and make
.rodata, .srodata and __ex_table read-only at a time (from
__start_rodata to this symbol). So even if we use __end_rodata to wrap
.srodata together with .rodata, exception table still be excluded, and
we have no idea where is the .data section start address. Do you think
it would be OK if we use _data to specify the start address at
writable data? If it's OK, whether we still need to add __end_rodata
after .srodata?

