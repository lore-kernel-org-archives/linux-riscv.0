Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9A5C3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 22:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQYtZ2hnl8fsRusaRa/l2D2QAjEF+UeuT6vA25MiBV8=; b=FW1za4Pgpf8sfq
	te19okCv4LGR4lm2ZVuJrPzIee7nxH6tCsIJEbXDilml+us1ekqMWeXUXbe+a3s2Dn0U62HwsJfuP
	mhYzfRPx9frn/5B+hxjw/jyhzll6o7hAFgIH3VWO/Rbu8MRt2Cm0zrpx8OBw9n71dV2cWAzOGLqfq
	Mi62DQSVmR07BUXvETt2EFEn3krp6Vw5YcWA/FAdFrR/Qu6npWEpzkFrWgV1mOq5yeL8cm+g6pl8j
	nb5LU6d11yYmaeiugiC+4FIPRZs1b5qZCD3hlXwo8e7kwTs3fWTZYY3Y7HjjfOmAHcKskrhlI58Nr
	UdifPxv/WAI7mYpKXuLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDYJt-00FO1M-7P; Thu, 05 Jan 2023 22:02:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDV8E-00DiPu-5n; Thu, 05 Jan 2023 18:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BBHlHFjvBOpIfsbcY2ZKG4d9UzzxTv3MkxdumEwPTwM=; b=V8SEDixXnUYlAhVMmIXhPFziJk
	ecsYLVl8zE/PmdsAKea5rQPmAmwJbTSPoGMRCK04Z3uu042aHbJ97n8xTNp4e56gysEiN9+rOILYs
	3SOKFZ0h9Kig85B+QkeNOkRUTP0n6hD5hMHMPS7eg6mUKdkLI8y84cJlFqeL91zFppkn+dXEy4P/0
	JJYqbGSsrzhDI4PoUor6tekktKAR88lkokn0cinOZ7mvbyAbzMjmFkovQEC7c+oQJ9jSqBUBnKMgl
	TV3jhgpLmRgWeJ39anqQJqXIK0dTDIMmz6CNCHCtpSU3CgbG825mZJlp8iW36z91iZIr94kGFIiYa
	pkEE9T9w==;
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDQdT-001MLt-0R;
	Thu, 05 Jan 2023 13:50:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 397A5B81AE8;
	Thu,  5 Jan 2023 13:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C940C43398;
	Thu,  5 Jan 2023 13:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672926623;
	bh=9rsuUbz5CFNU3FwjG7vhE4crM2pZKjhb8A7QPVly1mA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sMNHJLA1AOuvHY4rKQLB05My6d9puPX+E16ZcLmQYery0xzrUtkasYGUUvZSw/2Gq
	 iP8FseZ8M+ZTiyBokv3MfF+UUnVR6GdBzMg1R+wIqcwCqhWdc9pqu7YKFhmuxUM/uI
	 RfZ9f8U4Vt07XRsdueVEO7W4zf0Uc781pkqLmYk/W+bQgZ/5XZs938GEhXCk3UXKSQ
	 RptMX4nmwUyj0pZdhCir3ZuMs3E7r5NrwqQ3TqAGGmsvLYlFtLTBrxYLPTdbYXMtL0
	 17Oi+YHcFv4pATeaiVhmhiUW/nZF4uAPDfc8ojr1giiRRAc6OlytnhbZOQSEp/Lk4C
	 615SVG6DEl1DQ==
Received: by mail-oi1-f174.google.com with SMTP id e205so31972482oif.11;
        Thu, 05 Jan 2023 05:50:23 -0800 (PST)
X-Gm-Message-State: AFqh2kqBN8XJbEvyr1mrZt/Pyp0+9txKRuDmSTsJOFwfo8EnnC88ic66
	O9JFIB25T/xCh+OUjClGd5HYGmX/i2x4hvvHomI=
X-Google-Smtp-Source: AMrXdXsQ8eHuE5T9wbS/TSFR1VCmUEYQReFWODFWTDVkrBErc+HlOKeIJraKJb0jPNiJNVbMRBUU85Biyah+tr4UtiE=
X-Received: by 2002:aca:3755:0:b0:35e:7c55:b015 with SMTP id
 e82-20020aca3755000000b0035e7c55b015mr2913154oia.287.1672926622568; Thu, 05
 Jan 2023 05:50:22 -0800 (PST)
MIME-Version: 1.0
References: <20221226184537.744960-1-masahiroy@kernel.org> <Y7Jal56f6UBh1abE@dev-arch.thelio-3990X>
 <CAK7LNAQ-MWhbiTX=phy3uzmNn+6ABZmi49D6d1n1-k-jxcQzgA@mail.gmail.com>
 <87fscp2v7k.fsf@igel.home> <CAMj1kXGD3wQUPsRhvD7bO9xBJ6NR=Z+y8wXmKSCs57Oeh3MzGw@mail.gmail.com>
In-Reply-To: <CAMj1kXGD3wQUPsRhvD7bO9xBJ6NR=Z+y8wXmKSCs57Oeh3MzGw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 5 Jan 2023 22:49:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNASX4oJO+ciA6RRW35qDgD+39iWDVhW0LX_eQne+PDBVgA@mail.gmail.com>
Message-ID: <CAK7LNASX4oJO+ciA6RRW35qDgD+39iWDVhW0LX_eQne+PDBVgA@mail.gmail.com>
Subject: Re: [PATCH v2] arch: fix broken BuildID for arm64 and riscv
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Nathan Chancellor <nathan@kernel.org>, linux-arch@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Dennis Gilmore <dennis@ausil.us>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
	Jisheng Zhang <jszhang@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_135023_264675_7330071F 
X-CRM114-Status: GOOD (  22.06  )
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

On Thu, Jan 5, 2023 at 6:27 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Thu, 5 Jan 2023 at 10:21, Andreas Schwab <schwab@linux-m68k.org> wrote:
> >
> > On Jan 05 2023, Masahiro Yamada wrote:
> >
> > > I do not understand why 99cb0d917ffa affected this.
> > >
> > >
> > > I submitted a fix to shoot the error message "discarded section .exit.text"
> > >
> > > https://lore.kernel.org/all/20230105031306.1455409-1-masahiroy@kernel.org/T/#u
> > >
> > > I do not understand the binutils commit either,
> > > but it might have made something good
> > > because EXIT_TEXT appears twice, in .exit.text, and /DISCARD/.
> >
> > I think the issue is that the introdution of a second /DISCARD/
> > directive early in script changes the order of evaluation of the other
> > /DISCARD/ directive when binutils < 2.36 is used, so that the missing
> > RUNTIME_DISCARD_EXIT started to become relevant.  As long as /DISCARD/
> > only appears last, the effect of EXIT_TEXT inside it is always
> > overridden by its occurence in the .exit.exit output section directive.
> > When another /DISCARD/ occurs early (and binutils < 2.36 is used) the
> > effect of EXIT_TEXT inside the second /DISCARD/ (when merged with the
> > first) overrides its occurence in the .exit.text directive.  The
> > binutils commit changed that because the new /DISCARD/ directive no
> > longer affects the order of evaluation of the rest of the directives.
> >
>
> Exactly. The binutils change mentions output section merging, which
> apparently applies to the /DISCARD/ pseudo section as well.
>
> However, powerpc was also affected by this, and I suggested another
> fix in the thread below
>
> https://lore.kernel.org/all/20230103014535.GA313835@roeck-us.net/


Thanks for the pointer.

(and sorry, I did not notice that thread, and missed to reply promptly)


Your fix will work globally.
I left some comments in that thread.




-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
