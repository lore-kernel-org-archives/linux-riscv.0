Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02669C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 24 May 2022 15:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+d+/St5JBvR0Q15VJFXNZuLnN06wQcPmgsaBr35dvc=; b=iQCNbLM2OCG/JI
	JRueXPcWLqoppmopdOiHj2kOCm/IOav8Zj9Ud6VcsoNbf3d7QHMS3ooD1swtgVGqm2cXFRYtNZfCi
	hnlrtHRkckIU4OPaa5evvLymfhDvCaB50JjEjNSkpwCh/EP2p+x8K1N/toIWHSWSb8zTk5fVnrMl2
	/TcWeq0FoSxp49FKYIlAqfiZS1txMUpTG/MiQRONeaAXvimzG2SaWRiyoRhtBmwD4E2AHJaQnXCZy
	OXZQojwiPIfOs2phXnRhEiBabKvKbYHd8NWTVdzMq3XdgnIHkb9aLl7ohIY2zXtY3VnvxWzBeMGkO
	rU8v15UVjAS4a88WsDdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntWCv-008Ni6-GD; Tue, 24 May 2022 15:12:25 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntWCk-008Nf6-Cw; Tue, 24 May 2022 15:12:15 +0000
Received: by mail-il1-x129.google.com with SMTP id z16so5843533ilp.5;
 Tue, 24 May 2022 08:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gu6XrP09brfzVASce66siSDhg75Ij5bF3a/2sse9FTI=;
 b=Gx5DLI2+S6FgASvjmxzOMLEBTLLzoAeOJHUNf3qse7ftzHJRZNKIGlYfA7vzGBgRTO
 qTgrr/QrMpssZBVPExxUekM5wFpDSCMG20g+mdIisIrrqbSj8j8ach4aeT+H+1CPDjcY
 ofuIYAFZ0a1ST0nZaCgMaH9g0s8MDKoG8WUVuGjlCh3vgQMUp8zwHIFKbe8dhL1HhQTe
 sZWf5vyTao7FwxYkNnBY5UxCjXGw7WvpGDwAKwR0hZcAz9ljJn2ttXMG4oHl2DC/BtQd
 krQkv/WkL/ceZkaPabiR+mwCrn4tbOibG9mbSGHQ9sK9s67DEn4CdB96hUXVE/XXsJbF
 NRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gu6XrP09brfzVASce66siSDhg75Ij5bF3a/2sse9FTI=;
 b=avA2gSSODvb61MBZbTW/w8U+Gl6SQUTWlp227TVKG0CiogdWvq/GoB5EbQheHuAEUl
 LUotHn6YNXcEHXdyoqUpsE+qUdGxkLjXESvqrkIh6wIC5eAzUZQ3acnaUp++z44xw4ZU
 iSgNeQQmcDwHvjpuS7BtNUSbILrqHQ54Y34LJywqJaHiglshvZPgmZZiaPCISF8e+fIy
 JxA9q5+gW511cq/Gwdu+B3Dpr3Ax11Jm8J/UUrq/GWICMj0TyAaPp+Sfclrh+5ba1GHM
 /dpzwSk2XUnpKoV0DpPukqJ62XqXaZaSLcm3CAeQmgamK50QolfEDk1Kay5ICBO0ubQ5
 KdfQ==
X-Gm-Message-State: AOAM532AfVMzcLsp/iOECz4vptcYSveQk6Nf6g5wn0+Pn7PUWmqLREYQ
 u3FhlbmQJydjnNp5Rdc+cDqNI/00Jwph9dHHXq8=
X-Google-Smtp-Source: ABdhPJxToNDnooDvM+F5z9jrpwZB87LsQbRXfl7xzsJlSJuT69wEeUzQA9y0IHhR27j6+JEjpMOS30/zFL5koffPamM=
X-Received: by 2002:a05:6e02:170b:b0:2cf:970f:6050 with SMTP id
 u11-20020a056e02170b00b002cf970f6050mr14549964ill.5.1653405130972; Tue, 24
 May 2022 08:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220523020209.11810-1-ojeda@kernel.org>
 <20220523020209.11810-22-ojeda@kernel.org>
 <CAKwvOdkTjxNEmCTnuH5f41WB50ef6ErBM2Kp2zJ-t9q_5U8rBA@mail.gmail.com>
In-Reply-To: <CAKwvOdkTjxNEmCTnuH5f41WB50ef6ErBM2Kp2zJ-t9q_5U8rBA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 May 2022 17:12:00 +0200
Message-ID: <CANiq72=QJsScPweqWO8w6t4wDKKd3ZWFkA6Dcto6qpJ8QcfgOg@mail.gmail.com>
Subject: Re: [PATCH v7 21/25] Kbuild: add Rust support
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 rust-for-linux <rust-for-linux@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jarkko Sakkinen <jarkko@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Finn Behrens <me@kloenk.de>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>,
 Wedson Almeida Filho <wedsonaf@google.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Sven Van Asbroeck <thesven73@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 Boris-Chengbiao Zhou <bobo1239@web.de>, Boqun Feng <boqun.feng@gmail.com>,
 Douglas Su <d0u9.su@outlook.com>, 
 Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
 Antonio Terceiro <antonio.terceiro@linaro.org>, 
 Daniel Xu <dxu@dxuuu.xyz>, Miguel Cano <macanroj@gmail.com>,
 David Gow <davidgow@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>,
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-um@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_081214_498631_34867929 
X-CRM114-Status: GOOD (  14.77  )
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

On Mon, May 23, 2022 at 8:45 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> I'm super not into having the rust optimization level differ from the
> C optimization level.  This is just someone having too much fun
> wrapping every compiler flag in a kbuild option.  Either folks wan't

I mean, `Makefile`s are not my favorite pastime... :)

> smaller size or more optimizations. Allowing for RUST_OPT_LEVEL_S and
> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE or RUST_OPT_LEVEL_3 and
> CONFIG_CC_OPTIMIZE_FOR_SIZE is just wacky nonsense that's going to
> make randconfig bug reports more confusing to tease out.

I think what is important is to decide whether extra levels, for C and
Rust, should be kept compile-able/maintained or not (I also replied in
the `-O1` for C thread [1]).

Note that the Rust side can be compiled as `-O0` or `-O1` at the
moment, which is something we do not have for the C side; thus having
only the C == Rust option means we will not have a configuration with
those anymore.

For me it is less complex to not have them, and I have not heard more
opinions on this, either for or against (apart from that thread
suggesting `-O1` for the C side), so if nobody else chimes in, I will
remove them.

[1] https://lore.kernel.org/lkml/CANiq72kySVvOQ7eqwe0Jzz3V0JTtrcqODHR9Ty4-sfDMdzP6XQ@mail.gmail.com/

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
