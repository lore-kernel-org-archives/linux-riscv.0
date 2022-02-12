Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23BEC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Feb 2022 18:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqZod6rzQ9P4AIxb/+5ToVngQ5l/1hzncs8DpTuhU14=; b=KQPQZAovlInA1q
	IESvmqKAnbUy4tvG8WPKfFlrxy5meDrEos7S7U+pmscdLpwe0/N/MIk8ojv5/vc7Wd4bt/Rfn4xmD
	MI7jkS6SW6YfcBp8zFH14utr/4+Hcyzm8wIViYT7Q9sYjdGQiqS0LLgRdnACH2swvuwzRSMePargX
	KAl8NIOxB/esXY29YQOkI6VtRPHUfWU27EUpp6baXxxTQg5SsVrpuOyNc0QdYMc7BBScsjZbtOxcP
	P9DByS4wLX3oQCji8RzC9TyP5i8jrUbzKOsfSRDrrCtUvGKKBsDhubgjIwsXscwXTEItkf/5RuAqM
	N0Ygm5lTYivgEjuNqQng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIxCF-00ALqZ-2Y; Sat, 12 Feb 2022 18:32:35 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIxC2-00ALmF-Vp; Sat, 12 Feb 2022 18:32:24 +0000
Received: by mail-io1-xd33.google.com with SMTP id c188so15299920iof.6;
 Sat, 12 Feb 2022 10:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ZU/xBo4v5syghhPRoThoLn4tvhr/EqUMFObZCi2t6k=;
 b=Kd9daEZTG01vUunj9KpOq4Tlqe0AR4jwzTryhBoDOCJdLk42Frgjx5QOJZwOdTvdN+
 5w6brYZzwx55wGfNgrwE5v2ZviNe+FwzOcEXZPCCTgxQWcbXWgChRoh9HLPVEVDETjmk
 d9NsqcqbTXHDOtZwjLE4n7UUOIUFvneVQT9KKksB5OsjSpk+CJtKwm0ffErWL3d2MpWN
 On531QRK/Woo9hRSZ7uKcmAR96JfoYJd8xqRGQzqkPPWOgOCuepjsbD/2jefhJ/MmnQc
 IukF4P2PM+zgNqEx4bpvhAl9Kl8kSD/iYMM6o+K44UEiQElLwa5b9FHlYd9VVslmOe1J
 G1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ZU/xBo4v5syghhPRoThoLn4tvhr/EqUMFObZCi2t6k=;
 b=sBg72BCMg9qLwLXmZzUEDRgPffa1tc7DZJeMiUPxoXgIsOBp8XiAErSybenVP+0Y0o
 beKYc90u9RPvmXC3S+AzN3B1eIya5RH1u4n1BWWnfdAb3P4KtGskLTAN+1bk/up2Ayv6
 5PQEI3elzmuQGdaBdv0dsspNHSXXkp33Eq0bDiGnispAm2wDduydX4/+MsDR0PbWad0e
 xs1R5WCy2pLYE+2aJptaDOzbeuCru36y23q+HZhyQpK3RzMS6FnZwLE/pBIFqtrcdD2N
 s85KqPfQD5RdJVQnLQidjAXu7CZ5O/h5A+JpkLwowAHcl2KRXJ/DQ2PuzkVNAgkuGi30
 d4Tw==
X-Gm-Message-State: AOAM531nOjc+Hdmi4zm9Z22+7wD0cCtriAd9/oTxJcw0GvOGweO7OWn9
 HLmCOAUW3DTVQQWBxOSlk/8tpblDsSgIup+vtvo=
X-Google-Smtp-Source: ABdhPJxhKfrcH+lK8uelMajrMeOApGW6jMfAwT6cR0dIvA+JEuKlkp7IRqBjao43DlOrigol+LGAzUNojko+nvrOueg=
X-Received: by 2002:a05:6638:4105:: with SMTP id
 ay5mr4155184jab.186.1644690741790; 
 Sat, 12 Feb 2022 10:32:21 -0800 (PST)
MIME-Version: 1.0
References: <20220212130410.6901-1-ojeda@kernel.org>
 <20220212130410.6901-17-ojeda@kernel.org>
 <YgfBUhYdLXA46kOX@shell.armlinux.org.uk>
 <CANiq72nMhUH1s0HMeLb+hfp5=u3h20ryC4uqAgB1Znuq52e=Pw@mail.gmail.com>
 <Ygfd82QN/wmSmlHa@shell.armlinux.org.uk>
In-Reply-To: <Ygfd82QN/wmSmlHa@shell.armlinux.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 12 Feb 2022 19:32:10 +0100
Message-ID: <CANiq72mdru-MyP_QoRSpKu1bhB8v5sZNs8mvGdWsJp7NfXE+bQ@mail.gmail.com>
Subject: Re: [PATCH v4 16/20] Kbuild: add Rust support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 rust-for-linux <rust-for-linux@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, 
 Finn Behrens <me@kloenk.de>, Adam Bratschi-Kaye <ark.email@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Sven Van Asbroeck <thesven73@gmail.com>, Gary Guo <gary@garyguo.net>, 
 Boris-Chengbiao Zhou <bobo1239@web.de>, Boqun Feng <boqun.feng@gmail.com>,
 Douglas Su <d0u9.su@outlook.com>, 
 Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
 Antonio Terceiro <antonio.terceiro@linaro.org>, 
 Daniel Xu <dxu@dxuuu.xyz>, Miguel Cano <macanroj@gmail.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220212_103223_048113_E80E177C 
X-CRM114-Status: GOOD (  26.94  )
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

On Sat, Feb 12, 2022 at 5:19 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> Right, so why made it dependent on CPU_32v6 || CPU_32v6K if ARMv7 is
> supported? What about CPU_32v7? What about CPU_32v7M?
>
> I think it would be saner to use the CPU_V6, CPU_V6K, CPU_V7 and maybe
> CPU_V7M here - even bettern to select "HAVE_RUST" from these symbols,
> since I'm sure you'd start to see the issue behind my "HAVE_RUST"
> suggestion as it means having four symbols just for 32-bit ARM on your
> dependency line.

To support arch variations properly we also have to configure the
compiler via filling a target spec on the fly, but so far we only have
a few static variations as an example. This is one of the missing
parts of the arch support. I will let you know when we have something
ready.

> Interestingly, it does not list arm-unknown-linux-gnueabihf, which
> is the "tuple" commonly used to build 32-bit ARM kernels.

I see it there (Tier 2).

> Probably because people incorrectly think it's required or some other
> minor reason. As I say:

In that case, we should remove them and warn about those instances,
assuming the preferred style is to not have it.

> so using the argument
> that there are "500+ instances" and therefore should be seen as
> correct is completely misguided.

I did not use any such argument.

> I mean, if we end up with, e.g. a filesystem coded in Rust, that
> filesystem will not be available on architectures that the kernel

As long as that filesystem is an optional feature (or as long as there
is a C version), it should be fine.

> supports until either (a) Rust gains support for that architecture

For this, it would be ideal if entities behind some of the
architectures could support LLVM & ClangBuiltLinux, or the GCC Rust
frontend, or the GCC backend for `rustc`.

For instance, Arm is supporting both LLVM and the Rust project.

> or (b) someone re-codes the filesystem in C - at which point, what
> is the point of having Rust in the kernel?

Having a C version of some system does not mean a Rust version would
not offer advantages. In fact, we are adding Rust precisely because we
believe it offers some advantages over C, for both end users and
maintainers.

(Please see the RFC [1], previous discussions, etc.)

[1] https://lore.kernel.org/lkml/20210414184604.23473-1-ojeda@kernel.org/

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
