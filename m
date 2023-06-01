Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D5BC77B73
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 02:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6i5JJPprZyXhozSYYU3r4FvbyA+VT8fcC3S9Y8xW/A=; b=yyRrvFC2wYDwtl
	a7KEMY1jRuB8NuM3QqLFvCbf77O/mxZlD5bU6Yxye7v1xOBvPWPn7n4jhv6bfILVu8F/LsufAln29
	HJisAUkanFfVA4pZJhRseA+1EDw5Q9JPGp+b/0tMy8X8PA7Xe9qGnedt2O54+GkRUdRVkNUN4wMZL
	xaCOf1wmdyraHkd72oIsePUbDG+3d1xFAq0QdiFCw97cAv+SwQPCloExuXaj1zEkIiWsWbT5DzisT
	0wkG2ks8oTQtXQPrCx9E4Cwt54d/6d14LiKZSDn6Og5YehtgfWf3Lt7XRkCVxZOcnhZs/ofpEQvxV
	/hMfQVF/RUl5xNcXUKAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4YPT-001kTC-17;
	Thu, 01 Jun 2023 02:51:31 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4YPQ-001kRr-0k
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 02:51:29 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-256797b5664so57695a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 31 May 2023 19:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685587872; x=1688179872;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QJvI42hzqEfLq+DDW1OxT0grFxR3mOlryj6N6dIoRA8=;
        b=BSgJOLNKhZW08Q5W2hVYZFOOYILOZsab5M9FRjNq9kNADqpxi+0yEasbwoPQ6C0RYD
         AEkZuY1Lhs0sZ+QMQ0sT3uB6hHd+//YLWvGQIDj1eyc19RJZOhVosve0y8PQfp/dXpnq
         FLwmUqCk0ZZMTo35hD81j8HljdTyAil05pPVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685587872; x=1688179872;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJvI42hzqEfLq+DDW1OxT0grFxR3mOlryj6N6dIoRA8=;
        b=S03FDQlF/pGBUZNII3qMzjl00l/lss12hZ72ZDM/onWS5J//+ux2Q/u358c+gZpfPW
         6SvDFTi/BeSVJNfG5LNg0AZfYGQiNgVehHBc9yNr9LHC5Qu39OhBhH2QtcGcdIVPaxzY
         bA1CHcHKxVn3qBvImoZU4O2FtGQyL0SeRejy4WFmJy3YPmMPkcVriDJEKSZIIFNUIq1G
         Nc07VL0GJFwK4IghKszLuXzLxFL2O75LDZPxqLPvcFpjhBMPaRJdDfyFUu3N5lzwvUOs
         uwI4zcQlBRerWVl+2eZNzlKhhSrkaBFDU5XxfbfdZGHFfWIIyiuHAJrDz9kOz4NtM/e8
         ZB4w==
X-Gm-Message-State: AC+VfDyYrX3kI48z/E3XofAzcj9swV1542v/I1hVTyuBaqzSQXo16eqN
	Jy++gGxCaAwNK4llXBvE2giDJA==
X-Google-Smtp-Source: ACHHUZ7PFFFjKduMvOqjuZYsP8C5LHYpM5N6RALb9qSn8RKP39imX2lcG+hpivB2yErAslXEfNFSPw==
X-Received: by 2002:a17:90a:db8a:b0:24e:688:30f8 with SMTP id h10-20020a17090adb8a00b0024e068830f8mr5009755pjv.49.1685587871737;
        Wed, 31 May 2023 19:51:11 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id oa14-20020a17090b1bce00b002500df72713sm257413pjb.7.2023.05.31.19.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 19:51:11 -0700 (PDT)
Date: Wed, 31 May 2023 19:51:10 -0700
From: Kees Cook <keescook@chromium.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Joan Bruguera =?iso-8859-1?Q?Mic=F3?= <joanbrugueram@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Alyssa Ross <hi@alyssa.is>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] riscv/purgatory: Do not use fortified string functions
Message-ID: <202305311950.EFFD6521@keescook>
References: <20230531003404.never.167-kees@kernel.org>
 <20230531-abruptly-settling-f9852f408dcd@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230531-abruptly-settling-f9852f408dcd@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_195128_275756_B6072A23 
X-CRM114-Status: GOOD (  25.65  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, May 31, 2023 at 11:37:20PM +0100, Conor Dooley wrote:
> Hey Kees,
> =

> On Tue, May 30, 2023 at 05:34:04PM -0700, Kees Cook wrote:
> > With the addition of -fstrict-flex-arrays=3D3, struct sha256_state's
> > trailing array is no longer ignored by CONFIG_FORTIFY_SOURCE:
> > =

> > struct sha256_state {
> >         u32 state[SHA256_DIGEST_SIZE / 4];
> >         u64 count;
> >         u8 buf[SHA256_BLOCK_SIZE];
> > };
> > =

> > This means that the memcpy() calls with "buf" as a destination in
> > sha256.c's code will attempt to perform run-time bounds checking, which
> > could lead to calling missing functions, specifically a potential
> > WARN_ONCE, which isn't callable from purgatory.
> > =

> > Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
> > Closes: https://lore.kernel.org/lkml/175578ec-9dec-7a9c-8d3a-43f24ff86b=
92@leemhuis.info/
> > Bisected-by: "Joan Bruguera Mic=F3" <joanbrugueram@gmail.com>
> > Fixes: df8fc4e934c1 ("kbuild: Enable -fstrict-flex-arrays=3D3")
> > Cc: Paul Walmsley <paul.walmsley@sifive.com>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Albert Ou <aou@eecs.berkeley.edu>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Conor Dooley <conor.dooley@microchip.com>
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > Cc: Alyssa Ross <hi@alyssa.is>
> > Cc: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: linux-riscv@lists.infradead.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> =

> Perhaps this is indicative of other issues in RISC-V land, but
> allmodconfig complains about this patch:
> =

> ../lib/string.c:17: warning: "__NO_FORTIFY" redefined
> ../lib/string.c:17:9: warning: preprocessor token __NO_FORTIFY redefined

Argh, thanks. My compile test clearly failed. I'll fix this up.

-Kees

> =

> > ---
> >  arch/riscv/purgatory/Makefile | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > =

> > diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makef=
ile
> > index 5730797a6b40..11f4c275f141 100644
> > --- a/arch/riscv/purgatory/Makefile
> > +++ b/arch/riscv/purgatory/Makefile
> > @@ -31,9 +31,9 @@ $(obj)/strncmp.o: $(srctree)/arch/riscv/lib/strncmp.S=
 FORCE
> >  $(obj)/sha256.o: $(srctree)/lib/crypto/sha256.c FORCE
> >  	$(call if_changed_rule,cc_o_c)
> >  =

> > -CFLAGS_sha256.o :=3D -D__DISABLE_EXPORTS
> > -CFLAGS_string.o :=3D -D__DISABLE_EXPORTS
> > -CFLAGS_ctype.o :=3D -D__DISABLE_EXPORTS
> > +CFLAGS_sha256.o :=3D -D__DISABLE_EXPORTS -D__NO_FORTIFY
> > +CFLAGS_string.o :=3D -D__DISABLE_EXPORTS -D__NO_FORTIFY
> > +CFLAGS_ctype.o :=3D -D__DISABLE_EXPORTS -D__NO_FORTIFY
> >  =

> >  # When linking purgatory.ro with -r unresolved symbols are not checked,
> >  # also link a purgatory.chk binary without -r to check for unresolved =
symbols.
> > -- =

> > 2.34.1
> > =

> > =

> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv



-- =

Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
