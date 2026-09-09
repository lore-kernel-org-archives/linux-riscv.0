Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3D5C79FB7
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 15:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wsQxeataSgI1hIEvQc+pqas0ebTroZiokhjJXMC/YGE=; b=LpH1fxKKMaGBU+
	EU6Ey+SQvVhAkp93H7CfxvW/KxB1LFjkogWHaxV1vAOlkwKEVZWpr09TklmbBu1XOwJ39i5xFk1HB
	lL6S0GHAlb0OaftydksuvK5FoQnWkU3m0jP/9xRRLs6xI2Oy63mazQRjugr82EfJ4Ar7A1LwXgUAV
	T/6qK+w2zqMnsrEak661mqi0qe0n/Y2BGhQGwNpiAQlXqSqzF9QWm9a9RCWZdoBtz21C4rNOicmrr
	VsREn/z1Ys9noJ/2Dlk6zeYifyM5dtcWAn2nvWkoxLdvKVs5E5kX7V1Z8Icvh5LCZTG8ThlROhSXa
	9HAcomTwA+B/k+V9WK3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JtV-0000000C5er-2yfQ;
	Wed, 09 Sep 2026 15:07:25 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JtS-0000000C5e6-3K6G
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 15:07:24 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f70553dso56662966b.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 08:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788966441; x=1789571241; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JHU6Yr48iRYl83IyQpODgW1j4SilTECHHS/aRaqSbs=;
        b=WCQjfutKubyHjumYCWVED5AiDMt4BppqjYTHGuyhY6S7HaFiGQlSb08CUB84yusVMG
         cbcNoFlXv7vQwETvIwBrQvFPALCMgk2+RE96HzwYWw91X1V/VZmtiH5KYq3jUp2fW5zr
         Ubl+0+QbFFIPz/ghki9N0LM1dZ4pqnsvVTHDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966441; x=1789571241;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9JHU6Yr48iRYl83IyQpODgW1j4SilTECHHS/aRaqSbs=;
        b=Wr3twPTNMmZVUILCipi90WXMZYxAAD8GNAb+sQ2MTQ5Z3SWJXe4fpQ1HJLDnBChTO+
         MlNfk7vl84bzWR0dYCjuzWh1RNgGBI3Nj+fDCsRvKoW9myor726r7tUaKOdNolivgBPk
         xeJnIQ+BKLKlXgb+BoVw/v/1teSo8M1qFUzAKnIZ/ebAWQwTdSM4NkykQwLFyc12VeAa
         AXXtLVPZ8y8ydru+YUYjW+Aci/XxYmSR8QQ7EHDT2Oc9oAO20Jsqlnu0anWiUflxDltG
         +ncbU+siap3OfNMNIv7QuxdRTxg4Tq8jy+h5j7Uj4okyXHTu/Z3eyjIAXZ1hB5E70ia3
         Lwbg==
X-Forwarded-Encrypted: i=1; AKwUvBwnefgK6ECRvX9q+vVQJKg5gbpxjD7NgRjqmJjY2t7XBWVr6x0p92R6w3oXPJOO67sspaJry7b75EUejg==@lists.infradead.org
X-Gm-Message-State: AFuF++m6mncVvjV4KiktTBncZjEIkfa/hurb+s7gLgVYmUf4Vv/ILUpF
	j7kSvCUjTYVGhAbDObi0EDcxqKWNMQcsGk5qZodj9+jZvVZqjTDIqzPZRrd5wIkjL9kn9SyFyXe
	fTiOcQ5ZCwm1e
X-Gm-Gg: AYBFou27FVjHkLBDXQf+kKN/Xobvhr4xHOgV1KcjT5xU1morclA/k0NUTP+29YL1xz0
	6rYMqGu+QPJthkC1emjJzIV7VeYrrG1QVJachpBMI+EOUXTSS86e0TYVXU3pnlkP1J6n9MnpCsG
	N1tL8HQpbQvVS4dyWjuuAsPNF2PLcxI9nqg6pF02JDdcLWDtK6eLcM2kbDxAAohVhV85lvb3euZ
	m1u/KjYW7zhsWkz1lnXDkbxikUc0jYPBfzvcKUVpfbaPkwSjnqc5orVh4DZAOien3k4/EINv9U2
	v9QppAL9gLGvjvmrOqx+HHSC91dt3ZXIrO7FG5HBbFv8WhyUkAufxOc1IkFxHChUWiVUto7hn8l
	+JxaCl2He8XL7qjKn/s2LIFX3yzfPbABPnXPRKHtJlWBaSlK/TWCp50r1vN/IB2OIcST2Marzhz
	AQurKXUNQU7RhOjMR675hqLOhp4vEIA4twTaFvMQ6aQA5233LCuFgvPjKt5ZaTb9iUNQSEK5mCH
	49CmT16W0QHVdkYBe8Y7U2NbLK+ywEQBxw0ZDp3
X-Received: by 2002:a17:907:3909:b0:c25:23d:5295 with SMTP id a640c23a62f3a-c29419f58bcmr65764466b.17.1788966440646;
        Wed, 09 Sep 2026 08:07:20 -0700 (PDT)
Received: from mail-ed2-x10.google.com (mail-ed2-x10.google.com. [2a00:1450:4864:33::10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c28e9aec296sm506608766b.28.2026.09.09.08.07.20
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:07:20 -0700 (PDT)
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a6249b76a8so521944a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 08:07:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx4iEWjDfcJ2T7SFbgTuSvFKb06NmF2XNaHgeCEjocbSzf8DaDD2Rc+DqjT3VfyF6qfkVr7TyxgX0h9rA==@lists.infradead.org
X-Received: by 2002:a17:907:728f:b0:c25:8e4f:6d84 with SMTP id
 a640c23a62f3a-c2941868b12mr66185066b.2.1788966011712; Wed, 09 Sep 2026
 08:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-15-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-15-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 07:59:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgAWpVHmR74jC7sbSJGQEHyaaN0awNfSz_SjPv3VGSYYA@mail.gmail.com>
X-Gm-Features: AcwNN1XmVo334b1UP-lcj3CPx7zvteJ2HddEJqKkfbem-zQh2qUu9HycJHabLtk
Message-ID: <CAHk-=wgAWpVHmR74jC7sbSJGQEHyaaN0awNfSz_SjPv3VGSYYA@mail.gmail.com>
Subject: Re: [PATCH 15/23] modpost: emit module descriptors as assembly
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
X-CRM114-CacheID: sfid-20260909_080722_856689_9E45CC14 
X-CRM114-Status: GOOD (  20.20  )
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

On Tue, 8 Sept 2026 at 13:58, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> modpost generates a descriptor for every module in the form of a
> <module>.mod.c file with .modinfo strings, the __this_module descriptor,
> exported symbol tables and (with CONFIG_MODVERSIONS set), the CRC of
> imported symbols.
>
> These files are compiled like any other kernel C file with all of the
> -include preamble, as well as including linux/module.h, header dependencies
> generated by fixdep of a few hundred headers, an objtool run and if LTO is
> being performed, a link is performed to generate native code.

This kind of triggers the same reaction as the kallsyms code: I think
not including <linux/module.h> is probably the biggest win in this
all, and precomputing the offsets of the (few) structures that modpost
uses then makes the whole end result fairly trivial in raw asm.

Fine.

BUT.

You end up with things like this instead:

> diff --git a/scripts/mod/module-offsets.c b/scripts/mod/module-offsets.c

where it generates a header file for those asm scripts so that the asm
generation can do things like

        buf_printf(buf, "\t.size __this_module, %d\n",
MOD_SIZEOF_struct_module);

etc.

But I - again - get the feeling that this is all going through AS as a
silly way to generate an object file, and that there really isn't any
obvious advantage to that side quest.

Becuase no human ever wants to see that asm file, and it's no more
legible than generating the object file directly would have been.

So I get the feeling that it would again be more natural to just
generate the object file directly when all those files really end up
being are a few symbol definitions and a couple of fixed structures
(is there anything but the magic "__this_module" thing and the modinfo
unique ID thing?)

And again - I feel like nobody sane would want to write that code. I
certainly don't. But if this was at least partly automated anyway,
going that extra step might not be all that horrific.

I'll also be honest: part of why I do these suggestions is that I do
think it would be faster to skip the intermediate assembler step, but
a big part of it is that I don't love the random turds our build
creates. Getting rid of the *.mod.c files would be a cleanup of our
strange build.

             Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
