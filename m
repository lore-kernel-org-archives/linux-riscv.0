Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14536C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 23 May 2022 18:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxTbhaWbRlOgdMcmZpZkrmvcj57zjdN2tscF/6K6cxI=; b=SFb+Ir6B7C9SJu
	1Br/g6h2StUI2wvhyeAebrjKOTMdXndPW+alARsHCJuj2Zcv35ozvUbUs26uUj/FwAddEXiQP1fqw
	/KHt/9qQ5g/xkP1E1MvRLm7hP7Zqyd038c4bEHRmEHMIJ2yKCZaf+TbhsSmVANJhcxTCIPjEP7JVD
	fXTIIE0CeFkpw074TjZbVby9ZP9JvSaVF1FwrSiwvsNhxZpceikkiORd9Xhtft3ffPbKPpXewcVDn
	646bFN+Mz4BPy75eS89fp5XvEw7A4E8GWSMVI5WzFfthqT0vu3VUMN9JWokut3ykB4LFJKShp+EBv
	EKPOaI0P3/TANl86QQ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntD3R-005ZpC-2N; Mon, 23 May 2022 18:45:21 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntD3H-005Zm1-A9
 for linux-riscv@lists.infradead.org; Mon, 23 May 2022 18:45:12 +0000
Received: by mail-lj1-x234.google.com with SMTP id g16so18275410lja.3
 for <linux-riscv@lists.infradead.org>; Mon, 23 May 2022 11:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oOWZUBJqNcdlgAF3ozzceIWa1QLe3KoX8JwY9UNGHd4=;
 b=UstXh4WwiSYrL1ybcoTWRmyZsv9hEjc6PjZMBIKnBZP0zhT7iTun1KvXZ8H17U8qSH
 iz+7+bLHxdtL7wvkFkMIpdZu3lQ51hwOwKdx/wG4KzaJXykJmazsGwA7t4UGAtTePw/B
 mK+BUuXVrIeuhZNDEKPHGY+iv6YBe6R27v/utPWafsuvsLf2TmGu2ewgAfZSdKBowv4l
 LoP4BWbhRDtTjeIcpB3tIiVwfN42D2mxokpmBrGJMTT5Dd6TNpI3j9kQxH/bd3ESREMT
 XevvqDcVtKuqvXq0zcj3Z/G0wAyCfCELfimVoPf+6+u9hcQLdRX4KGz8yIs0FLopHIeq
 RhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oOWZUBJqNcdlgAF3ozzceIWa1QLe3KoX8JwY9UNGHd4=;
 b=OBV2xxuaERXmHH/oEhR43TC5RrDXqZQSBNxpM3hvqFXAeu407TUI8EcHzud4NtWsVh
 t2VVKP9FtqSQq7Uf53Xqw/8MnwSjiEs+ARQLRWVEcUYqhx3GsQgffQ1UtbmYG15vWYML
 TRmYQOyzT1dtO7wz5oshpWrPdS1IATQLv8fg7f5mFcDQh/B9ce+jucmjVWHjKQKH65fl
 ggUooQ5iKxlyduyUW+SZK1PwdqcuBdvGq+z+2XJ9H6xWB+pMY/HzudfKW7qF5pUzFeaL
 CMO+rQcJBsQOW25v9eE/4K0a2MJWixxQwcltY5HmqfJup8D8muK3BKNpSnXY1VjPND6c
 8Vaw==
X-Gm-Message-State: AOAM533PoJaQ8pk82fSuuARwLPlZoMJFK8j0KDeGQ3GMGT456+cRLhvy
 Dmc8wGPLFS42zwKf/RdKK3DYxPIrupJIVSwWTr9/jQ==
X-Google-Smtp-Source: ABdhPJyqr3CCsMipzHURp2FsSWTJB3upstez3xIYqCFafcp/ENDyuWVgPX2GXxQPyyXKkJMEh1xX8mg+wI61pNqucdI=
X-Received: by 2002:a2e:98cd:0:b0:253:df46:323e with SMTP id
 s13-20020a2e98cd000000b00253df46323emr9603557ljj.295.1653331503220; Mon, 23
 May 2022 11:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220523020209.11810-1-ojeda@kernel.org>
 <20220523020209.11810-22-ojeda@kernel.org>
In-Reply-To: <20220523020209.11810-22-ojeda@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 23 May 2022 11:44:51 -0700
Message-ID: <CAKwvOdkTjxNEmCTnuH5f41WB50ef6ErBM2Kp2zJ-t9q_5U8rBA@mail.gmail.com>
Subject: Re: [PATCH v7 21/25] Kbuild: add Rust support
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, 
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
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, linux-kbuild@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-um@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_114511_379708_95250F23 
X-CRM114-Status: GOOD (  18.39  )
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

> +choice
> +       prompt "Optimization level"
> +       default RUST_OPT_LEVEL_SIMILAR_AS_CHOSEN_FOR_C
> +       depends on RUST
> +       help
> +         Controls rustc's `-Copt-level` codegen option.
> +
> +         This flag controls the optimization level.
> +
> +         If unsure, say "Similar as chosen for C".
> +
> +config RUST_OPT_LEVEL_SIMILAR_AS_CHOSEN_FOR_C
> +       bool "Similar as chosen for C"
> +       help
> +         This choice will pick a similar optimization level as chosen in
> +         the "Compiler optimization level" for C:
> +
> +             -O2 is currently mapped to -Copt-level=2
> +             -O3 is currently mapped to -Copt-level=3
> +             -Os is currently mapped to -Copt-level=s
> +
> +         The mapping may change over time to follow the intended semantics
> +         of the choice for C as sensibly as possible.
> +
> +         This is the default.
> +
> +config RUST_OPT_LEVEL_0
> +       bool "No optimizations (-Copt-level=0)"
> +       help
> +         Not recommended for most purposes. It may come in handy for debugging
> +         suspected optimizer bugs, unexpected undefined behavior, etc.
> +
> +         Note that this level will *not* enable debug assertions nor overflow
> +         checks on its own (like it happens when interacting with rustc
> +         directly). Use the corresponding configuration options to control
> +         that instead, orthogonally.
> +
> +         Note this level may cause excessive stack usage, which can lead to stack
> +         overflow and subsequent crashes.
> +
> +config RUST_OPT_LEVEL_1
> +       bool "Basic optimizations (-Copt-level=1)"
> +       help
> +         Useful for debugging without getting too lost, but without
> +         the overhead and boilerplate of no optimizations at all.
> +
> +         Note this level may cause excessive stack usage, which can lead to stack
> +         overflow and subsequent crashes.
> +
> +config RUST_OPT_LEVEL_2
> +       bool "Some optimizations (-Copt-level=2)"
> +       help
> +         The sensible choice in most cases.
> +
> +config RUST_OPT_LEVEL_3
> +       bool "All optimizations (-Copt-level=3)"
> +       help
> +         Yet more performance (hopefully).
> +
> +config RUST_OPT_LEVEL_S
> +       bool "Optimize for size (-Copt-level=s)"
> +       help
> +         Smaller kernel, ideally without too much performance loss.
> +
> +config RUST_OPT_LEVEL_Z
> +       bool "Optimize for size, no loop vectorization (-Copt-level=z)"
> +       help
> +         Like the previous level, but also turn off loop vectorization.

I'm super not into having the rust optimization level differ from the
C optimization level.  This is just someone having too much fun
wrapping every compiler flag in a kbuild option.  Either folks wan't
smaller size or more optimizations. Allowing for RUST_OPT_LEVEL_S and
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE or RUST_OPT_LEVEL_3 and
CONFIG_CC_OPTIMIZE_FOR_SIZE is just wacky nonsense that's going to
make randconfig bug reports more confusing to tease out.
-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
