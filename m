Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3660C79FB6
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 14:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nA8twZ0MzT4qwzU71BrxMwsDEcYAsbQd87UCcp4pxy8=; b=IX04Nm2yFLtJ67
	rY/66pkGHHewhBKajPU8UqTkqGo3NdsqugCCK/kX2i2gk4Qk6WdLsgDhIa5OROt7LfV2dL4Egehlp
	DqbI2PANpmxxVBzzG9JqOWuha2k2i3vRHqJjlhUBpsJYXh37q/MVCLl/OYzxe4wbKp5yTGlSHEvyz
	6/1h723IBNuRco8/MIpSrhbYrbqhBlD/kd5O1/9VHI7yFczRCXzOPgpGdEkHVWmr0Sesdk02cwP9P
	SLfIv6y/X35Li9kyWVXV73KbbU9NwyCHWlj8B6qCptOojUUqU2Ae5XtbSaei6GOW6kYwR7+/K6xRD
	BnzGK8IQNvc85nmZeMrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JUb-0000000C1UI-02QW;
	Wed, 09 Sep 2026 14:41:41 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JUY-0000000C1TO-3jiS
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 14:41:39 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-3a33307ecd9so64274471fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 07:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788964897; x=1789569697; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tG9J5Co/VVYH+Cridb4B9lUnRMf0qj5TUZQIt0oEj84=;
        b=axX5czIgNEkRw+E0/Z9LVlHoEg1grWOwGZq/wmZVckltGIMMccpYRu6qEPEjBmCSno
         MKbsTesVu2bjxwj+D6dZns1y+nRuaVVD9C1gWkmevSDRfit8MV5bQ/TmaG9H/yc6NC1M
         tVTmLFM9eSoG9u5Uc+Zbj0xzXza44ChgjWs+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964897; x=1789569697;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tG9J5Co/VVYH+Cridb4B9lUnRMf0qj5TUZQIt0oEj84=;
        b=cOQPSeYME2jCy27n/e+WRgmCyqP52RUgS9VDkJ7GInpJ0z1WKsT4l89juFueyFsgkL
         +AzFcCYaj9UvfC8cGRFGvh+ES05JvoH1Mxesmvv4OvZjiEPQybTESXtBw4OP5mBZmhie
         t7PetQ7bRGrGv4DAVGpPqYizUgfJ7peKu0vR5ynfjB9su+XndsIgWfupnQL5UDZ0OtJF
         s/GtcjjAV9KDb55blVoeL/Fq0sjgKiEjNpdsk1QY6qgd900sEq9nVduGV3C3wqn02g4O
         Sjk2JrW4ucljqKv6L5NfUfnra8d4tiv7Q0SfHfj3hODH6dejpKqHf/rSbNRaQF7nDh26
         hiaA==
X-Forwarded-Encrypted: i=1; AKwUvBywBH8slbbM7Ul4YOvEXCFChquygGwUyV5lDqNz6pr3IJwsrRitE1KsA9VRGe+YlyyCGsiWbksH4gznwQ==@lists.infradead.org
X-Gm-Message-State: AFuF++ku5WDwD0tvW1UdzBib05GQVbgDFi8duLqzxukrgEjvpnDsGNux
	wMtcbJb5pm0EpN19v7k6T0RrGFNzoEZoCk2OLCGRYkO+E7PvfDLAYuAV7US2xt5+m6mJQyqFGmf
	jGFvttEs=
X-Gm-Gg: AYBFou13bL2RQw0MZTpA4K+Z1yVy8APYcUVgVYXhKc/KtDZwwnb6RBqfFDWkTi0WzdP
	ujS+6nCYHo89QBuV7CSi7xGSLg5a0ai5yyHIiJMEXABTgbNQMqYKiSlXPOZktXy5cbscNzfkiCt
	QzqipGr6AtXlvV5mZVvCh/Hds2KHOTuhl9o8O/LPYK4wGNnWSVh8uzTMUvsKlIoqknfFqg5MJvx
	48JrK4A/dr8r3s6EYvMjJM5xMlQlxEFW7pskIhlxfEaxuyASkDpnVbc9VsxiLc8mNUFl+C70WIq
	ba3QOqKt517vC6cYRjLWpAEqTpuBLV/AjoaeBK4zKSM3eLkI4FLBiAVCDOgXHfUarNA019Ipjur
	O9lNNaFUOw8+i5tKC9s/CYUZqAJxI1BNZTwurn9P4BSzn8FHqMqSAt5LMdjWVWP474iRuADqEFL
	eF+TG2NbZSkyY+6BUbRNCQExQcV9C7/hJ9zr/fAUIi9tb688TIODZ6PVP0oFLMbECX9dxtnNdC/
	1j4SLdJnUXeM4KEEArQQkF1HMd4hwQw81dv0ebJ8iGzE6+F
X-Received: by 2002:a05:651c:a342:b0:3a3:7681:6d5f with SMTP id 38308e7fff4ca-3a3768174b4mr43570321fa.23.1788964896587;
        Wed, 09 Sep 2026 07:41:36 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a464106771sm39619721fa.29.2026.09.09.07.41.36
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:41:36 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso5546492e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 07:41:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx9mbhIzd4wF0U52EL5wjgKGFPZWk9MCvU4cLKOgBO91mie2LD9n0St9T2TPuOcNxVqZxkdYO00cwsJYg==@lists.infradead.org
X-Received: by 2002:a05:6402:208a:b0:6a7:ee56:615d with SMTP id
 4fb4d7f45d1cf-6a7ee5662fbmr12667373a12.31.1788964533277; Wed, 09 Sep 2026
 07:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-4-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-4-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 07:35:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgryL8XqjFcO=EQwKdqNn51BANiv16QiqYKCUdXxDQBmg@mail.gmail.com>
X-Gm-Features: AcwNN1VOdEagBQA5D63IF5vfBaLV4II6ehpTsThafIib6q5kHaeURBrIxknkBpc
Message-ID: <CAHk-=wgryL8XqjFcO=EQwKdqNn51BANiv16QiqYKCUdXxDQBmg@mail.gmail.com>
Subject: Re: [PATCH 04/23] kallsyms: output binary data to speed output and
 kallsyms assembly
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_074138_959008_C125A6A2 
X-CRM114-Status: GOOD (  18.50  )
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

I'm finally going through this series, because I do care about build
speed, so I love the concept.

However, I haven't actually applied it and tried it, I'm just reading
the patches.

And this one triggered something:

On Tue, 8 Sept 2026 at 13:56, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> kallsyms generates an assembly file that consists mostly of .byte entries
> containing compressed names, token strings and name-sorted sequence
> numbers.
>
> For an x86-64 build with 158k symbols that is a 37 MiB .S file which takes
> 0.57s to assemble each of the two to three times it is built over a kernel
> build.

It strikes me that this is clearly a bit faster, but it still seems to
be not really fixing the underlying silliness of that code.

Wouldn't it be much better to actually create an object file directly?
Afaik, the *only* think we ever do with that kallsyms-generated file
is to immediately assemble it into an object file, because the actual
asm file is useless to anybody.

And we already require libelf as part of the build, and we already
kind of do things like that with gendwarfksyms.

Don't get my wrong: I think going through an asm file was very much
the right thing originally: not every architecture used ELF in the
first place, and when scripting things like this the current situation
makes 100% sense.

And no sane human wants to deal with this kind of grotty detail and
spend the effort on writing an ELF file writer.

But when there's a LLM that was used to find these things and help fix
them up, and it's something this mechanical and the result really
isn't ever human-readable and never has been, I feel like the obvious
step would be to just ask the little helper bot to switch the whole
kallsyms to using libelf-devel and writing an object file directly.

I don't think anybody has any deep emotional ties to the current
kallsyms code and that horrific step of the kernel build, do they?

               Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
