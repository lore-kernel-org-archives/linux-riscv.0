Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E591AC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Feb 2022 21:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iA8nN+exYPdMFSRh/sXixihANe5JWVIxZX2g3vnIe9w=; b=SlVRQyK4HrY1iN
	xqWd3/cFDBVEUr+OKE/+7Hqt/MSGEmB5Ubcw4vaLfpC+HW9il/FhIsccN11y0XQZVgfGUHCw5nAOS
	aDjqgJzy8AGpMdhyEbv7deVJDwJwtJz+WBZnsB0fxJQDhQw6QnB6fTNFGvxsltTFIpKieD1zAis1c
	yQLpCuoRazeaxoKbTn8z+nBvB4/3yI4fRco8+FZnBqiPnW8dNEElmVVNHprdTSIBhr44pEu/7xPO8
	ue2yiPVOXIjlYaTfOAzvh23cjx90N2kvvTecB9gaNuq0o1lgvkDFoSBzscCYbGWxPeLqf/THfM11E
	AxMBAxUgNthVPzXGBvRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIdtv-008qJ5-IS; Fri, 11 Feb 2022 21:56:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIdtl-008qHG-Pu
 for linux-riscv@lists.infradead.org; Fri, 11 Feb 2022 21:56:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1F72261194
 for <linux-riscv@lists.infradead.org>; Fri, 11 Feb 2022 21:56:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE32C340EE
 for <linux-riscv@lists.infradead.org>; Fri, 11 Feb 2022 21:56:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="GItgWwO1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1644616567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wn24kWnhRMz7wCnTG05HI8Xbl+b42NDa3gFb52wsv9A=;
 b=GItgWwO1QeY+jNG8e9/iYC14OI0ihnghz5Pu4lUVhnz9rqa5ocZbuQD/oAq1SxAbtfh3qp
 p3FU4wkDpdxLYxnSY4z3WzQHhkYw4M7rJ4k5Txh3cSNFxIw67T1cO/qFT8Xpmmtg/+BSpr
 r3UW1fBFeDjkqqIqZGgPAhTboxwl0MM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e663730e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <linux-riscv@lists.infradead.org>;
 Fri, 11 Feb 2022 21:56:07 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id j12so6646894ybh.8
 for <linux-riscv@lists.infradead.org>; Fri, 11 Feb 2022 13:56:05 -0800 (PST)
X-Gm-Message-State: AOAM533gxb+S1C+hsidwHK1wSah6qAi0ou8OuBz9wSw5ySqWzrKGgpla
 Dgv3FGB9jrMLxA66CWVN3MLfYl3k/iOQ1Hxck08=
X-Google-Smtp-Source: ABdhPJyLM10LzwsaLFF87ZQ4YUx93mMzQV3dO/cqY5dqC5tAVZVk44GPnZhXNDL2xtDy3O4jiKmSiH43QZq5HY35AvM=
X-Received: by 2002:a25:dc14:: with SMTP id y20mr286266ybe.115.1644616564021; 
 Fri, 11 Feb 2022 13:56:04 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:888:b0:14e:cd6d:454f with HTTP; Fri, 11 Feb 2022
 13:56:03 -0800 (PST)
In-Reply-To: <CAHk-=wh+2jokbr4tpHA=ExebWKr=qp9RJ_uFrG2gYG4ChAjitg@mail.gmail.com>
References: <20220211210757.612595-1-Jason@zx2c4.com>
 <CAHk-=wh+2jokbr4tpHA=ExebWKr=qp9RJ_uFrG2gYG4ChAjitg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 11 Feb 2022 22:56:03 +0100
X-Gmail-Original-Message-ID: <CAHmME9pkhqjLtwn2kt5SkSWBQ9UW+2WLGL9momZUmY3L2wDryQ@mail.gmail.com>
Message-ID: <CAHmME9pkhqjLtwn2kt5SkSWBQ9UW+2WLGL9momZUmY3L2wDryQ@mail.gmail.com>
Subject: Re: [PATCH RFC v0] random: block in /dev/urandom
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>, 
 Eric Biggers <ebiggers@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>,
 Kees Cook <keescook@chromium.org>, 
 Lennart Poettering <mzxreary@0pointer.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Theodore Ts'o" <tytso@mit.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_135613_938244_AC3DF0B4 
X-CRM114-Status: GOOD (  26.82  )
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

Hey Linus,

One thing I should clarify is that the GRND_INSECURE stuff for
getrandom(2) is a bit of a red herring with regards to the primary
intent of this patch, which is making /dev/urandom, the old char
device, block waiting for entropy.

Right now, we have:

/dev/random = getrandom(0)
/dev/urandom = getrandom(GRND_INSECURE)

This proposal is to make that:

/dev/random = getrandom(0)
/dev/urandom = getrandom(0)

Along the way I also got rid of GRND_INSECURE, but arguably that
should be a separate patch. This here is mostly about making
/dev/urandom block.


On 2/11/22, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> When try_to_generate_entropy() doesn't work, I think you now removed
> the possible fallback for user space to say "yeah, just give me best
> effort". And you might re-introduce a deadlock as a result.
>
> Those systems are arguably broken from a randomness standpoint - what
> the h*ll are you supposed to do if there's nothing generating entropy
> - but broken or not, I suspect they still exists. Those horrendous
> MIPS things were quite common in embedded networking (routers, access
> points - places that *should* care)
>
> Do I have a constructive suggestion for those broken platforms? No, I
> don't. That arguably is the reason for GRND_INSECURE existing, and the
> reason to keep it around.

It sounds like you're proposing a middle way here, which would be to
just call try_to_generate_entropy() (the "Linus Jitter Dance" code) if
!crng_ready() in /dev/urandom and getrandom(GRND_INSECURE). That's
actually a pretty good idea. It wouldn't break anything and would only
make the situation better on most systems. I think I'll probably take
your suggestion there, as it seems uncontroversially to be an
improvement.

Revisiting the original proposal though:

> I'd be willing to apply such a thing anyway - at some point "worry
> about broken platforms" ends up being too weak an excuse not to just
> apply it - but I'd like to hear more of a reason for this
simplification.

The justification for always waiting for randomness and never
returning insecure randomness to userspace isn't so much about
simplifying the code -- this patch isn't very large anyway -- but
rather for simplifying userspace crypto footguns. After several
decades of endless user confusion, we'd finally be able to say, "use
any single one of our random interfaces and you'll be fine. They're
all the same. It doesn't matter." And that, I think, would really be
something. Finally all of those blog posts and disagreeing forums and
contradictory articles would all become right about whatever they
recommended. So the one side of this is, "misconfigured userspace in a
computer history museum might run into trouble." The other side is,
"everybody gets good random numbers always." Today's thread's new
addition to that old argument is that your jitter dance makes the
downside a heck of a lot less than it used to be.

What do you make of that line of thought?

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
