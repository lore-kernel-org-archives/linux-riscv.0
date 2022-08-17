Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FB9C25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 16:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bKlyjhll7vxOBdLNGfrgABiqE6JAoc5pqF8AomsSq60=; b=RQKMA6N6qc8cl6
	5DLe0SlQ/x8c03KGoLGi6SZnnKWo3MzEQkUd6C3fl/OrQmfFB/DWcwxhwIWt1HWJ6FJ71otdxiPX2
	dpHfEJb+4aM6rrz606Qb1S7b5liVRF3q9vTx5g1OSwihhTjd/J8puh0a7zo8oSN4wkAUEcKO/cnog
	ubQvLMETpw+K2THF+YIB9inxOkMVobqI17C9QHNVtgI50/RaOWwcshTX6T8BGuXa0KlbhBV37kBsG
	GPZUM0SXuozDuZfb1M5V0ta0xm0nY5TX+1E2zeMQn+rdeesExZjTYKTz+LuXFY3nnDt7Hc5OZxQP8
	KSgNAi3LLsHiztLDWg0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOLsv-003nj7-Jk; Wed, 17 Aug 2022 16:27:13 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOLst-003nfe-59
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 16:27:13 +0000
Received: from mail-ed1-f46.google.com ([209.85.208.46]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MIdaF-1o9nA10Rqn-00Eh1w for <linux-riscv@lists.infradead.org>; Wed, 17
 Aug 2022 18:27:08 +0200
Received: by mail-ed1-f46.google.com with SMTP id o22so18172378edc.10
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 09:27:07 -0700 (PDT)
X-Gm-Message-State: ACgBeo2GoKl6SeL5ROVYY8GR4Od/iKg5heaWx4btDD1pS+zr+0grgzI2
	DBtLmVIQ3CV0mRHrJo9o2bCL+AmzmEg2hG9LQgc=
X-Google-Smtp-Source: AA6agR6Zf7lY1qLm89sTihdpHsj0aQ4umr8ol/DRSTBvAYEQUmT2uPZZqvLUfFS8neOBi78/JbDKpYlk6svZGBrs0nY=
X-Received: by 2002:a05:6402:520e:b0:43d:df14:fbed with SMTP id
 s14-20020a056402520e00b0043ddf14fbedmr23980070edd.16.1660749886667; Wed, 17
 Aug 2022 08:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220802015052.10452-1-ojeda@kernel.org> <20220802015052.10452-28-ojeda@kernel.org>
 <CAK8P3a0jqhGY9E85VC9gNem5q6-dWeq0H6-7bhJopinMnLtOKQ@mail.gmail.com> <CANiq72nNucEhXAXkXSujnGkpQrkv3-Pcn7ua8N=2XB-suAjs9w@mail.gmail.com>
In-Reply-To: <CANiq72nNucEhXAXkXSujnGkpQrkv3-Pcn7ua8N=2XB-suAjs9w@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 17 Aug 2022 17:24:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2YuGsSJY2-=npqXMHXEr+zaF36iDrM+kP=9nS85FLpbA@mail.gmail.com>
Message-ID: <CAK8P3a2YuGsSJY2-=npqXMHXEr+zaF36iDrM+kP=9nS85FLpbA@mail.gmail.com>
Subject: Re: [PATCH v8 27/31] Kbuild: add Rust support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sven Van Asbroeck <thesven73@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Miguel Cano <macanroj@gmail.com>, Paul Mackerras <paulus@samba.org>, Gary Guo <gary@garyguo.net>, 
	Douglas Su <d0u9.su@outlook.com>, Borislav Petkov <bp@alien8.de>, linux-riscv@lists.infradead.org, 
	Will Deacon <will@kernel.org>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, 
	Ingo Molnar <mingo@redhat.com>, Wedson Almeida Filho <wedsonaf@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Antonio Terceiro <antonio.terceiro@linaro.org>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, linux-um@lists.infradead.org, 
	=?UTF-8?Q?Bj=C3=83B_6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Michal Marek <michal.lkml@markovi.net>, Daniel Xu <dxu@dxuuu.xyz>, David Gow <davidgow@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Dariusz Sosnowski <dsosnowski@dsosnowski.pl>, 
	linux-arm-kernel@lists.infradead.org, Tiago Lam <tiagolam@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-kernel@vger.kernel.org, Boris-Chengbiao Zhou <bobo1239@web.de>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Richard Weinberger <richard@nod.at>, Finn Behrens <me@kloenk.de>, Johannes Berg <johannes@sipsolutions.net>, 
	linuxppc-dev@lists.ozlabs.org, Philip Herron <philip.herron@embecosm.com>, 
	Arthur Cohen <arthur.cohen@embecosm.com>
X-Provags-ID: V03:K1:Q8aDWUUMahOXhWuwhdbgSKakT9K2OsOZ9v/a2zmb2UO7O5gJfFE
 73SN7diDQaq0a3Nr9G02lLj7TUog0eL/mXLQybcMRAm1Do39Gu+6oJeyTJjcrwdCFoOzH30
 YEBfYfrnuo7rd+9fNp/GwUBkItluDCozDMyPDB+i6Yo1qkiE5TPqbHaAIgAZaU9oF7ET/ln
 /IUTTjRJs1h+U7j64YkKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:suaEtsLNhUw=:MuP8A4vNwiEcHPC09NCG4m
 qRD/3nje68eAEZ80522B0mfN3H8kzMOPi6Idc3JvOGK9Pl4XqlekgAX9FQW7jVZttPkttQJC9
 Wf9649tKMMmZapPMaKYp41QdRIiDa/8y2JBWQ2czmgd6CcR44bMLDYrfb/RZtw7K1Cu4cic1D
 Idx+x4Ngeut45aWcAGxemfvwz1PO0p8GzmMBhIZZUXO+RQ01/UHCbouAKXKB7cz6NmZYeRuKD
 3F0ieT7fI43INszqbYiPau7b4rVd0sRrBlZ2GM4XxTU8PR6SHriYzNN0PladJhwqRqPGw7LDT
 RXCXWG2PwxWArJfp0MDg8Jkvh5p+VDBVXOjcKzpPTTjdgoDB5qZh9ep2aRZhKJ1gtf8/Ua4mM
 LuwhAiWfg3XthBft7kzP6kopM2vgigFMAeOqjMDM/fpDBf8O+nBAZJKp/4rDpcvRIyclg3SQN
 a8A3Kw6uNUIzCRbAY+SztZ0WgADyw64JpiWatdBM80qM8vqAxXW4QljAF2RS1iR9ma91N11KA
 uYQAqXyPLdyRRYPEJHza2mAmawPcire8hkc5GtYgxzIpXYVZuQTcCg6EupZVEMuVh8RGbqAox
 OCmDVUc1qstC55irJy6nJPVJnVACVUzjaL7avD89q9YouXBsXyXKLth9sXccU4tz0P8hki8pd
 i9nGi02WbW4E7PyE1x0xXm2GA7UxIRjANRI+YRue4IVZF6Xm9B1q6oEF88mFNtuJqP1CPSagF
 Hy9Ru4GWU2oqjqQR68JzWkSbWo1Uys1oYP74DwaxpZzAB9oGv4c5mbIRZYRwx0EUedROIYP3p
 xeBIvhjCHyJxcXWQWPXEJuaiRDPxKyXHhKG39v75Tq7+UpvelchX+FkRI6+v5lP+tFd1PsgAn
 vxkyLalI7OZnbWdxEpdw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_092711_528146_024AB14E 
X-CRM114-Status: GOOD (  35.40  )
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

On Wed, Aug 17, 2022 at 5:13 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Wed, Aug 17, 2022 at 4:40 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > I tried enabling rust support in the gcc builds I provide at
> > https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/arm64/12.1.0/
>
> Thanks for giving it a go!
>
> > to make this more accessible, but it appears that the command line
> > options here are not portable:
> >
> >  /home/arnd/cross/x86_64/gcc-12.1.0+rust-nolibc/x86_64-linux/bin/x86_64-linux-gccrs
>
> So you mean with GCC Rust, right? (i.e. we have "GCC builds" working,
> via compiling the Rust side with LLVM and linking with the GCC C side,
> but it is not intended for production or to be supported, even if we
> cover it in our CI, test it boots and loads modules etc.).

Yes, I meant GCC rust, with the contents of
https://gcc.gnu.org/git/?p=gcc.git;a=shortlog;h=refs/heads/devel/rust/master
merged into the gcc-12.1.0 release tag.

> > I guess nobody has tried this so far. Would you think that fixing this is only
> > a matter for fixing the build system to pass the correct flags depending on the
> > compiler, or is this broken in a more fundamental way?
>
> If you meant GCC Rust, then it is a bit too early for the compiler. As
> far as I now, they are working on compiling the `core` crate and
> supporting more stable language features. They are also researching
> the integration of the borrow checker, though we wouldn't need that
> for "only" compiling the kernel.
>
> Now, if they decided to focus on supporting Rust for Linux early on
> (which would be great), they would still need to work on the delta
> between what what they target now and what we use (which includes both
> stable and some unstable features), plus I assume infrastructure bits
> like the platform (target spec) support, the flags / `rustc` driver
> (though I would be happy to do as much as possible on our side to
> help), etc.
>
> (We privately talked about possible timelines for all that if they
> were to focus on Rust for Linux etc., but I let them comment or not on
> that... Cc'ing them! :)

Thanks for the explanation. My hope was that building the kernel
would actually be easier here than building the more complicated
rust user space.

The gcc cross-compilers on kernel.org are similarly easy to build for
all architectures the kernel supports because the complexity is
usually in picking a working libc for the more obscure architectures,
so I was naively thinking that this would work for building the
rust support across all architectures in Linux.

I tried one more step and just removed the unsupported command
line flags to see what would happen, but that did not get me any
further:

/home/arnd/cross/x86_64/gcc-12.1.0+rust-nolibc/x86_64-linux/bin/x86_64-linux-gccrs
-frust-edition=2021 -Dunsafe_op_in_unsafe_fn -Drust_2018_idioms
-Dunreachable_pub -Dnon_ascii_idents
-Drustdoc::missing_crate_level_docs -Dclippy::correctness
-Dclippy::style -Dclippy::suspicious -Dclippy::complexity
-Dclippy::perf -Dclippy::let_unit_value -Dclippy::mut_mut
-Dclippy::needless_bitwise_bool -Dclippy::needless_continue  -O
/git/arm-soc/scripts/generate_rust_target.rs; mv
scripts/generate_rust_target.d scripts/.generate_rust_target.d; sed -i
'/^#/d' scripts/.generate_rust_target.d
rust1: internal compiler error: Segmentation fault
0x7f37ee04b51f ???
./signal/../sysdeps/unix/sysv/linux/x86_64/libc_sigaction.c:0
0x7f37ee032fcf __libc_start_call_main
../sysdeps/nptl/libc_start_call_main.h:58
0x7f37ee03307c __libc_start_main_impl
../csu/libc-start.c:409
Please submit a full bug report, with preprocessed source (by using
-freport-bug).
Please include the complete backtrace with any bug report.
See <https://gcc.gnu.org/bugs/> for instructions.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
