Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1609C2D0E4
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 01:05:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5115820B80
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 01:05:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cZ23Jdxl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="LIWg6Jh7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5115820B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cnoBkt4F1VBQV7hAXuh5Sw9N1QTyY+EbrxJ8nmI+/Vc=; b=cZ23JdxlWNpb4gVZazdGQlNZY
	3eGRRXn+U4EBT0eG5LEZ4Raf/IhJ9UDMvnQVJn1J1CS9OHfQ57IqCnYzJKT8O0fRVDsizlz/jMlnx
	sU+3yIFJo8fhDZbEEIbjSV7wS4OgTiRnnXOGzgDHEMnhLEb579n74G6czVjWsyc583CgNLX0/VWSf
	d0Q5Jc4v+jzojR7TJBNzXnWpi7WpX8czUzFvTqvrkpuGSKTuB4yMTN/1Mr4pi5Vj0ivHV3Kjql75+
	FTgNBjo16VVa9GgBO8htMIwamg1gIw/5Wz/d9MyzS3OYohiwEVNCryLC5lsENLoS7jEF66B6UjhVK
	ZE7h23zfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdNWo-0005as-VV; Fri, 13 Nov 2020 01:05:27 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdNWm-0005aV-M8
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 01:05:25 +0000
Received: by mail-pg1-x542.google.com with SMTP id z24so5735922pgk.3
 for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2020 17:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KIfDUcpgQLukCTUlGGpYpdoSftsRK2kFhecxA1sd1hE=;
 b=LIWg6Jh7ZjykDtBtTJRkWvN1BdZ7x+5a3bx6T2Zw/HSDC/Dj37410kaYS0/y0BdOkz
 NxfuKMbOrRtptDZ3gqqOpS9BNqTJwaTBCq7p1pOHH6XApsS6ccLN+EuNyGvc5tWB5t1y
 rDLz2Pn+3jAXvdZWPA5bcydT6qwVW+XLhKoAavSO9ggmmYf/+codktPVehDN2fEMW7xf
 GDYzT/HCZHaD3FlXHxnu1yFS6aJ2wBnnOHu6X5aViu/u0AtyBBTN4zPcJD5PCfY35cG0
 29sNCvqDoqT/aSqVYDVSU44awQ/EjDCiPAXPu98K/eCQKESmgW4GbZYpYxy8cNBe2maI
 cUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KIfDUcpgQLukCTUlGGpYpdoSftsRK2kFhecxA1sd1hE=;
 b=dTkD1EFijOHoyvgF+LkVW67gqn9jAZDSLL3wseobvXMTILUzXGfJU5gFsf0KT/IFBk
 2uyM6dDJj0t3XofqnzzA6LVptx+Mol5vqm42mpFbfB81MhgHP0DSK76VlZRmDH9ftTE6
 9nGpPDO2I1YQ9Joavq64x9Nw5/uRFdoWfBpK0Szl6wk3rpKc8mOvJ1dTAaNEPlYFtpuc
 OM+lJI6+WuhjkVxv/eWi4RTl3nEKlIKnPa0Wqqa7oqDHz4j3S/v3Ux+rFlzjauKRaJm3
 7OrltT0DuXw78IacVKrXAq6XeJTfzkXS6YlsgrJG1ocgKYRIMgFsxtbSN+nzJva0mAPL
 8J7w==
X-Gm-Message-State: AOAM531Xq6vs7nrzRpz3cfJbCW3YOFs/EmKvobftYFZdHkfgiL5Rbqo6
 1ICY6DnKUvpNerQ2W9xvl4dSkqvpnbtunOtOw143fg==
X-Google-Smtp-Source: ABdhPJxM1CSF3iJAHsWSDZIUBVZD+m+amh+kNvHu5KEupiMMVlCxSbhfwFwIwYj6pQj7E9R6vWpTpqpMkRm0SY2C+cI=
X-Received: by 2002:a63:b55e:: with SMTP id u30mr17459pgo.381.1605229520588;
 Thu, 12 Nov 2020 17:05:20 -0800 (PST)
MIME-Version: 1.0
References: <20201108203737.94270-1-natechancellor@gmail.com>
 <CAKwvOd=P2yFxkAXh9TUpJ=D5=jNnxnx7O5Nr3iTDeqV40UA19A@mail.gmail.com>
 <CAGG=3QVQTQsHhsb5cSEejZ=D4Gq60cz7kMfD8moXWeVU1odTdQ@mail.gmail.com>
In-Reply-To: <CAGG=3QVQTQsHhsb5cSEejZ=D4Gq60cz7kMfD8moXWeVU1odTdQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 12 Nov 2020 17:05:09 -0800
Message-ID: <CAKwvOdm-weMaWyAK-O80aC+Y21TTeKKvgXe4kLoD2Fq1forYcQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Explicitly specify the build id style in vDSO
 Makefile again
To: Bill Wendling <morbo@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_200524_766875_BCFC0C72 
X-CRM114-Status: GOOD (  30.45  )
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
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Nathan Chancellor <natechancellor@gmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 12, 2020 at 5:03 PM Bill Wendling <morbo@google.com> wrote:
>
> On Thu, Nov 12, 2020 at 4:53 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Sun, Nov 8, 2020 at 12:37 PM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > Commit a96843372331 ("kbuild: explicitly specify the build id style")
> > > explicitly set the build ID style to SHA1. Commit c2c81bb2f691 ("RISC-V:
> > > Fix the VDSO symbol generaton for binutils-2.35+") undid this change,
> > > likely unintentionally.
> > >
> > > Restore it so that the build ID style stays consistent across the tree
> > > regardless of linker.
> > >
> > > Fixes: c2c81bb2f691 ("RISC-V: Fix the VDSO symbol generaton for binutils-2.35+")
> > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> >
> > Thanks for the fixup!
> >
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> >
> > (I'm curious what --build-id linker flag does, and what kind of spooky
> > bugs that led to a96843372331?)
> >
> --build-id generates a unique "build id" for the build. It can use
> several different algorithms to do this. The BFD linker uses sha1 by
> default while LLD uses a "fast" algorithm. The difference is that the
> fast algorithm generates a shorter build id. This shouldn't matter in
> general, but there are some tools out there that expect the build id
> to be of a certain length, i.e. the BFD style's length, because BFD is
> more prevalent. The obvious response "well, why don't they just change
> the expected length?" is difficult in all situations. (Once an
> assumption is made, it's hard to backtrack.)
>
> You can add this if you like:
>
> Reviewed-by: Bill Wendling <morbo@google.com>

Cool, thanks for the context, and the review!

>
> > > ---
> > >  arch/riscv/kernel/vdso/Makefile | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> > > index cb8f9e4cfcbf..0cfd6da784f8 100644
> > > --- a/arch/riscv/kernel/vdso/Makefile
> > > +++ b/arch/riscv/kernel/vdso/Makefile
> > > @@ -44,7 +44,7 @@ SYSCFLAGS_vdso.so.dbg = $(c_flags)
> > >  $(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso) FORCE
> > >         $(call if_changed,vdsold)
> > >  SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
> > > -       -Wl,--build-id -Wl,--hash-style=both
> > > +       -Wl,--build-id=sha1 -Wl,--hash-style=both
> > >
> > >  # We also create a special relocatable object that should mirror the symbol
> > >  # table and layout of the linked DSO. With ld --just-symbols we can then
> > >
> > > base-commit: c2c81bb2f69138f902e1a58d3bef6ad97fb8a92c
> > > --
> > > 2.29.2
> > >
> > > --
> > > You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> > > To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> > > To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20201108203737.94270-1-natechancellor%40gmail.com.
> >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers



-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
