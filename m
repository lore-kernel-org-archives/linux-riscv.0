Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2221C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Feb 2022 21:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lIXJfmo6NSyqg3F+L5DsPJHavKbkvvt3eL5IcvHjrOQ=; b=cbuZuL4PplooWB
	4xz9sdwhmgwbwJ8jtnS92hJc/D0VIPYQ9zCdA0uyvLxs0FX9NPZYChNNSZ8icav4tAVcPJhrPAsfC
	OE6uh77fETbVzzTrTDFxmPBo8wiY7WeXRPmHygG0+rgjqm6WRYby3AkjZQux1EYdEbIFCikr5dmbQ
	HhJk1buf1OUFh7d9QqmZD90RwczEhjJAGypvlaSfN+xr0Yuq7Y+KhRw4P4+lrfqEWqzmOsC2QtlEn
	kyjxqe+sOcNGfIC6dYcBlfQtfsoG2L71EpWdNlHE8HY9GyLraXnoYWckErpVlswApaaqLYoN1Jg4D
	dqZt2y/ab5ANspd3vp1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIdUD-008nTR-Ke; Fri, 11 Feb 2022 21:29:49 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIdU6-008nT6-Av
 for linux-riscv@lists.infradead.org; Fri, 11 Feb 2022 21:29:47 +0000
Received: by mail-ej1-x631.google.com with SMTP id h22so7342316ejl.12
 for <linux-riscv@lists.infradead.org>; Fri, 11 Feb 2022 13:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XFzCG6U+gQcN35bNR5ygZp7My/pmsXpJOFlN4wA8faE=;
 b=Op5mHfi4lkpgsAXFUIEvOb892Ki9UfRvx6Wny8c8GnjgwctkidFgQ18OXWJf376jCc
 BL/WKzyG/HlMvQ5Fg9rMrnYrcCvA8WOcTMUhjWAiGuoPntTEWvfcefuEHsgqJwwQX7cW
 NOiWSj++f2uRrGtaz3ZiLzt4iZqukzsD9VZjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XFzCG6U+gQcN35bNR5ygZp7My/pmsXpJOFlN4wA8faE=;
 b=jkIuZGmHvnCkQWAd/k1n6+Rv5IAvH4UsA6n+6vcBSl1J4nZEiXCFrPSVmWd70GO8dA
 0HyZa/0uUsJtNE5MOQKecniQCAZ8Tk50XhnyX3/DAsA5F6dVEK6jprttrxL/AzB5M584
 rpUtGo8HctzxdMazKxL0M+diHLxttLVF498qaORofEvvLb0chIAVKqEBohr4Iukwu9He
 99EzqZHH9F5s/eq7kLdPZURyVSpIvjyPShlfyUH1lSZbaftdd4n9InhjKuOAe2zIkILw
 2kfFtSXg+xCtcN8SqeQf5vNzk9GD9GEefqs26HZU1N9/SaJjsYS0bkSm422Lb8nFFpqT
 uSmg==
X-Gm-Message-State: AOAM530X7imaSTyO5nZfVqxyK7ML0xQ1LOTJQMPZjne2dhPF/uVrYrAZ
 4Frc8GKFolu/BGIF2T88m1exoIw1oq1xTpJd0KE=
X-Google-Smtp-Source: ABdhPJyl1J6pYJG9KMNQMsqZznu76k4Hv/s1fiOBE5urvtJCS7I67JUrelo7ydwRDGLjG1fU4A+NDw==
X-Received: by 2002:a17:906:c154:: with SMTP id
 dp20mr2860211ejc.184.1644614980669; 
 Fri, 11 Feb 2022 13:29:40 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45])
 by smtp.gmail.com with ESMTPSA id v30sm768062ejk.11.2022.02.11.13.29.37
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 13:29:38 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id q7so17189928wrc.13
 for <linux-riscv@lists.infradead.org>; Fri, 11 Feb 2022 13:29:37 -0800 (PST)
X-Received: by 2002:a05:6000:1885:: with SMTP id
 a5mr2667962wri.193.1644614977325; 
 Fri, 11 Feb 2022 13:29:37 -0800 (PST)
MIME-Version: 1.0
References: <20220211210757.612595-1-Jason@zx2c4.com>
In-Reply-To: <20220211210757.612595-1-Jason@zx2c4.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Feb 2022 13:29:21 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh+2jokbr4tpHA=ExebWKr=qp9RJ_uFrG2gYG4ChAjitg@mail.gmail.com>
Message-ID: <CAHk-=wh+2jokbr4tpHA=ExebWKr=qp9RJ_uFrG2gYG4ChAjitg@mail.gmail.com>
Subject: Re: [PATCH RFC v0] random: block in /dev/urandom
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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
X-CRM114-CacheID: sfid-20220211_132942_427101_4B19D21A 
X-CRM114-Status: GOOD (  18.29  )
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

On Fri, Feb 11, 2022 at 1:08 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Maybe. And this is why this is a request for grumbles patch: the Linus
> Jitter Dance relies on random_get_entropy() returning a cycle counter
> value.

Yeah.

I think this patch is fine for architectures that do have that cycle
counter value.

Considering that the jitter thing has been there for 2.5 years by now,
and nobody has really complained about it (*), I think we can call
that thing a success. And on those architectures where
try_to_generate_entropy() works, removing the code that then does that
GRND_INSECURE makes sense. We just don't have any such case any more.

BUT.

When try_to_generate_entropy() doesn't work, I think you now removed
the possible fallback for user space to say "yeah, just give me best
effort". And you might re-introduce a deadlock as a result.

Those systems are arguably broken from a randomness standpoint - what
the h*ll are you supposed to do if there's nothing generating entropy
- but broken or not, I suspect they still exists. Those horrendous
MIPS things were quite common in embedded networking (routers, access
points - places that *should* care)

Do I have a constructive suggestion for those broken platforms? No, I
don't. That arguably is the reason for GRND_INSECURE existing, and the
reason to keep it around.

Long story short: I like your patch, but I worry that it would cause
problems on broken platforms.

And almost nobody tests those broken platforms: even people who build
new kernels for those embedded networking things probably end up using
said kernels with an existing user space setup - where people have
some existing saved source of pseudo-entropy. So they might not ever
even trigger the "first boot problem" that tends to be the worst case.

I'd be willing to apply such a thing anyway - at some point "worry
about broken platforms" ends up being too weak an excuse not to just
apply it - but I'd like to hear more of a reason for this
simplification. If it's just "slight cleanup", maybe we should just
keep the stupid stuff around as a "doesn't hurt good platforms, might
help broken ones".

               Linus

(*) Honestly, I think all the complaints would have been from the
theoretical posers that don't have any practical suggestions anyway

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
