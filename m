Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0EAC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Feb 2022 18:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ylXyvAdp50qLm+4SFcWyesHlTdbJJA9jBdbzyq0hddM=; b=4wiGO88h4Fbtmh
	/ykEbRpQ3IuxekR51V/eN9VlLuhyioq0yi5alDBCZNjTeuTqOPj3Quf6tZXmcEaerIOGYcwfW5EkC
	Db1lXuncVvYi47eIA10GqgQOqvrzqNxpVpLUW8H9rAM66SGLHMll6zevjalSmWC40C+idRrLSarx8
	HrUBYnfuKuEEGgVL249ZN/adUv1kP8CgGAZFGHfPuYq1XtRLdsYfdlc3OLsOIzsZPdUHZcwFZoszQ
	ptvyHbb5oJgTRiXHd4BMuuPizGHX8fgV24kxZI+YgwbyifpJnCNgskiuMyaZZzlxPQpngI/MF8/3a
	UUBGUTHExK8DM0FA7Snw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIxaI-00ANRs-Vj; Sat, 12 Feb 2022 18:57:27 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIxa6-00ANPI-Ra; Sat, 12 Feb 2022 18:57:16 +0000
Received: by mail-io1-xd2f.google.com with SMTP id y84so15462596iof.0;
 Sat, 12 Feb 2022 10:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PW5bHK7lbz8mAfQVLbpabS9JQmvxuuP5i13vS9JUmWQ=;
 b=n5D8bwCKZRUGpl68+OwDfJK+AQroTXijhLf+Ev2Dbodadyb6WRz6/fX9TzoLv5JY44
 vKXzGhsqvNG0b1NNUEa1R2yJntFRgZVvW8w2wrpRBfSWda7h6ZxvPtJrBrf7yYHVOrwG
 vAfadKq2gwnHNR05HepbxldrYBHyblxQyutjIhO/hkKuz8jVpizo184RCyuaFwUdEEMB
 gDMdiJYy6LOQ+V5N1zvv/KQitEvAl4D/B6TT8xoaot76ok9JaRjP2+PcQoyjgjVx3f6a
 lXTyQk2kypAbwHMmpvW3hdXfwbXpl8GXVhdG++7HxqqIr3Iu7+Tp6uJUOhRFTYsDQXUJ
 gPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PW5bHK7lbz8mAfQVLbpabS9JQmvxuuP5i13vS9JUmWQ=;
 b=Q2/QzbXEdXldkirHBIARk5C5Gav+qolpk/LrkLXM0jZMwoigY6s8jgPuHF9t/5JPH5
 67pWXcBH6MTpOckTAaGIuhCo0GRPbXAaDjMm1OVVkIkaxi7+INxVa6iuG4UHbSebMg7g
 uSyWuT9wuNAWtd84mcqhTAdx32gFyIcaFMOwycHhklb65mD8LeYmYH1SbaZUPrMO/88m
 fkA5LCUvtCHf4OS+WVZ34rhtO4XkZgPnCzMt4XJ78fsDRCc8VaPxEdYbvUvxW1BoIuer
 1mb7E95stYdN+wa5YBl4oRjpJ7D9MrZcLT11kUGJzUqDI8edYvc/Swy+9IhIHzHx/Ril
 3jxQ==
X-Gm-Message-State: AOAM533kjKiXrOcB/D/iu9MKX4zwAGpg3/mEMc3t/1QA7XP0usadSass
 z6QQZuzGkyYv6UiPHFaXkfHPC2Et0/hv/SyiJdk=
X-Google-Smtp-Source: ABdhPJzk7Y0eW6BAf4q+QY2CyD1I+LhA8kHRLDkHhRJc6kXcI3wPehj/4lCy3W2LRh5ctFx5JYUIvMk52bxjHJ2CH2Q=
X-Received: by 2002:a5d:941a:: with SMTP id v26mr3564701ion.64.1644692234068; 
 Sat, 12 Feb 2022 10:57:14 -0800 (PST)
MIME-Version: 1.0
References: <20220212130410.6901-17-ojeda@kernel.org>
 <0396e38b-f681-a035-b6ea-21127fdf5615@physik.fu-berlin.de>
In-Reply-To: <0396e38b-f681-a035-b6ea-21127fdf5615@physik.fu-berlin.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 12 Feb 2022 19:57:02 +0100
Message-ID: <CANiq72=U3A-5LfbOThPoex9PfFg+UsHuMY33nbtLH=aK=odh0Q@mail.gmail.com>
Subject: Re: [PATCH v4 16/20] Kbuild: add Rust support
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Antonio Terceiro <antonio.terceiro@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Boris-Chengbiao Zhou <bobo1239@web.de>, Boqun Feng <boqun.feng@gmail.com>,
 Borislav Petkov <bp@alien8.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Douglas Su <d0u9.su@outlook.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>,
 Dariusz Sosnowski <dsosnowski@dsosnowski.pl>, 
 Daniel Xu <dxu@dxuuu.xyz>, Gary Guo <gary@garyguo.net>,
 Greg KH <gregkh@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 =?UTF-8?B?TWlndWVsIENhw7Fv?= <macanroj@gmail.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Finn Behrens <me@kloenk.de>, 
 Michal Marek <michal.lkml@markovi.net>, Ingo Molnar <mingo@redhat.com>, 
 Michael Ellerman <mpe@ellerman.id.au>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Paul Mackerras <paulus@samba.org>,
 rust-for-linux <rust-for-linux@vger.kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Sven Van Asbroeck <thesven73@gmail.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 Wedson Almeida Filho <wedsonaf@google.com>, 
 Will Deacon <will@kernel.org>, 
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220212_105714_939984_BD061083 
X-CRM114-Status: GOOD (  14.48  )
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

Hi John Paul,

On Sat, Feb 12, 2022 at 7:27 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Is there any particular reason why this list excludes MIPS*, i386, big-endian
> PowerPC and SPARC targets which are already supported by the Rust programming
> language?

The variations we have so far were intended to showcase the Rust
support in several major architectures, rather than cover everything.
But as long as LLVM (& the kernel, i.e. ClangBuiltLinux) supports the
target (and as long there are no compiler/toolchain issues), you
should be able to try it.

> Are the arch/$ARCH/rust/target.json files everything that's needed for supporting
> the other targets?

Mostly -- there is also `rust/kernel/c_types.rs` and you may need to
tweak `rust/compiler_builtins.rs`, but not much more.

Note that for the target spec files, the short-term plan is to
generate dynamically the target spec file according to what the
architecture requests, instead of using these static files. Longer
term, we need a Rust-stable way to setup custom targets from upstream
`rustc` (though it is not clear yet how it will look, e.g. it could be
via command-line flags).

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
