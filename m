Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D01C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 14:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJXy8mWmILqwn3BGrB86HP9Q7ueSFo26HdIsrFo1Mhs=; b=49VTEWVgEhqCFP
	F+lZilNhpZd560EWtrKh6O7hqssvLW9heiLjfHROE16+QOM3nMzuqB+wdQeR8mDXyhApS5slnUgg0
	04ggIhOtGyK+x3zUEuQlc4TRZSeAsdbk1iSYdLLaiZUIPiDY/H7LIWz1MpJC0p3ka3D8t+W0mcza2
	opWuwnRkW2bUprjk4oMwlayMJd+dMcHkI2ASyNR0HYTJoYh5T+Pmuoq5qTYTUFY9AK2Yp5yTxd6CZ
	6DjlxkfDLI4AKpbzcHRFedFXlXGPF/wZE/puEItOvFZceO9+ClqXTwA4QW/cSqRA6A9sqPZJrpVeG
	lw/wu4m/LkmQRQ1Bojjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJcJO-00FfJL-5W; Mon, 14 Feb 2022 14:26:42 +0000
Received: from mail-vs1-f44.google.com ([209.85.217.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJcJK-00FfIV-QC
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 14:26:40 +0000
Received: by mail-vs1-f44.google.com with SMTP id g21so6289285vsp.6
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 06:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+D9TDb8zgo7SYyd9U66f/5PMXdHiP4mRfXaTW0S+zdU=;
 b=PfbZF0PzI1DwEFgyU9JuSkJEWSlZdYAlFP6fM7IgeuXjse6F4XWSwgYm0czP4VoDxg
 p2CcQzPA8oKUkaYVcE+w30+lQjGWavemoPYK8exgag5/W1rQiYPq0XROePDIUSCvzfbv
 Ab9EER7GBSU1yIbkp/fwm0M//K6++9HvecVqk9bB+ptGQzAIDnWqR/2Y6A2C2fIcxu4b
 mWoIyOpbmzEgYIE7yt+sxe0kN0h60/UQfIZ45Iv69l70WwW8SIeBbrW1PYMMxf9xkVXy
 ojOGmTN6uhFWLgeaqABvD00wIQx9+Ll3+Put4YaJX4ru8FUrNYpb+Qj+z8RCJmCrYc8Q
 tl/g==
X-Gm-Message-State: AOAM532w0R1FEYy33CHpEMc+hW9bMFbE6DaGiQJou2D9bd32/+b4htCx
 v3KH+KkncfgOHtUG5NKybuTmX8AgHz8yXQ7e
X-Google-Smtp-Source: ABdhPJxML5XtP5N0hqMkkoVEeM6mSm8jjx6PMs1NW0Ubrj2Rn3e0D5vlCxuXibj9/wibP+sGf/TmBQ==
X-Received: by 2002:a05:6102:e8d:: with SMTP id
 l13mr2280846vst.87.1644848797582; 
 Mon, 14 Feb 2022 06:26:37 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50])
 by smtp.gmail.com with ESMTPSA id r26sm3166138uaw.12.2022.02.14.06.26.36
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 06:26:37 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id 4so5492155uaf.0
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 06:26:36 -0800 (PST)
X-Received: by 2002:ab0:384c:: with SMTP id h12mr3670905uaw.122.1644848795466; 
 Mon, 14 Feb 2022 06:26:35 -0800 (PST)
MIME-Version: 1.0
References: <20220211210757.612595-1-Jason@zx2c4.com>
 <fcab986b-d0bd-c798-de17-266abcdc7da2@gentoo.org>
 <CAHmME9ooEbgiv3DRk87ei+rUoVNMJthY7UuG_xCgm=kfMZAajw@mail.gmail.com>
In-Reply-To: <CAHmME9ooEbgiv3DRk87ei+rUoVNMJthY7UuG_xCgm=kfMZAajw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Feb 2022 15:26:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXDj+BVCs4Syg39vjnHGKcwJnCgDxrGoOiEFM_T4ojwPg@mail.gmail.com>
Message-ID: <CAMuHMdXDj+BVCs4Syg39vjnHGKcwJnCgDxrGoOiEFM_T4ojwPg@mail.gmail.com>
Subject: Re: [PATCH RFC v0] random: block in /dev/urandom
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Joshua Kinard <kumba@gentoo.org>, LKML <linux-kernel@vger.kernel.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>, 
 Eric Biggers <ebiggers@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>,
 Kees Cook <keescook@chromium.org>, 
 Lennart Poettering <mzxreary@0pointer.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Theodore Ts'o" <tytso@mit.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_062638_871425_2B74BCB0 
X-CRM114-Status: GOOD (  25.52  )
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

Hi Jason,

On Mon, Feb 14, 2022 at 3:05 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Sun, Feb 13, 2022 at 12:06 AM Joshua Kinard <kumba@gentoo.org> wrote:
> > The R6000/R6000A CPU only ever existed in systems in the late 1980's that
> > were fairly large, and I don't think there is a complete, working unit out
> > there that can actually boot up, let alone boot a Linux kernel.
>
> So from what you've written, it sounds like MIPS is actually not a problem here.
>
> So the only systems we're actually talking about without a good cycle
> counter are non-Amiga m68k? If so, that'd be a pretty terrific
> finding. It'd mean that this idea can move forward, and we only need
> to worry about some m68k museum pieces with misconfigured
> userspaces...

I'm afraid you missed one important detail.  You wrote:

> On every platform, random_get_entropy() is connected to get_cycles(),
> except for three: m68k, MIPS, and RISC-V.

The default implementation in include/asm-generic/timex.h is:

    static inline cycles_t get_cycles(void)
    {
            return 0;
    }

Several architectures do not implement get_cycles(), or implement it
with a variant that's very similar or identical to the generic version.

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
