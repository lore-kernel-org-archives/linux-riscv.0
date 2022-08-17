Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E45C25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 15:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xU52CIw5UGTMYg5PlNV9b95AM32BoqApD+1KDS4k1w8=; b=tGOt3QA6WH/+aQ
	7LfGsMSix3FB7iUixZAlpDuWlxVk+ZImID+oFBsWo3EFIfIqW7mibQBTuL3whoVJ4/s+AADUPmSpJ
	9aHSF7F3p+eUHeIDpSUX6dFIHay8Wjw8pXP1rLzrR5xRmIx5nESXfR5GHuNJqTV6Q0u9Bq+avJQqi
	0275PYHhOaN99mKOQnaba2kIlNe8rIUAgjQVFFh5zs5uYjWrsunTiU52+5XxEKaatHqueWsiEh1YU
	waHLVt+WMOeTKvC4Dq6vjWGdkQ3mq7NEK0OJN2V3VvtfmRfuIuGrXlp6jz90KouoqUDnHJjJbemm/
	xHBwVuXZST7jE6cdEdyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOKjm-0039Tz-H4; Wed, 17 Aug 2022 15:13:42 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOKjj-0039RS-8G; Wed, 17 Aug 2022 15:13:41 +0000
Received: by mail-il1-x12b.google.com with SMTP id p9so7031532ilq.13;
        Wed, 17 Aug 2022 08:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=1Aw1dSa3JPytcA6jepz8LxW98jZGIVvGrbA5oXW6cF4=;
        b=QylPRZ7po85CmoykNUCyneM7mjy0jfxW6cm0tMG76VU+SEJs1TOHYjvUgCyJ5X34Ah
         29R7oZJhhLUIaE/wB+fpvInm0t+Qtil2d7DsxFJO50ROSKqBTc4hrnQGXwMIq6mca6hs
         54+kXi+r5dpmDFccUSfnuFBS3sWyt6leP9lY9G9/jXs02kwOe+87RXKykgBUvBdu+VxK
         zgC40tcbIxY+/ARk2CL5sgZZPmfoBBvLljwObz/HD90zb/2wCmgAigALmX3sUAZMaM6/
         yYvXO5L6d8RGEEhjCx/i99yVgYsx0VSd+Ea2XG0jsxBYGj9nUTR57UcZ9Som18Y15zyH
         eUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=1Aw1dSa3JPytcA6jepz8LxW98jZGIVvGrbA5oXW6cF4=;
        b=Lp3g1NfvseXnQOlzNBctEHEJIIVkGy32+pRcSG+Y8VdGuKGQnIzAfyEAkj1xvyM0Se
         ZEJk0g/ZHrppiuI0EbiwCUcRizRUnzh2WaG1GntR32YWNYmfp1O+KfyfthGAcFb2V9iY
         g0KTjzt+3N20vt97tCy/DMUpnOTm9YrRcQB02KE99a4Zkr+0hB3WTTQDPIraJJkimXRs
         VWhdnCuQvzJ/rxhi5Vql/zZK0AOfhPVcjro30Nl5BpomO4OeYl64D6NEt4G+2xmSXs7S
         n6T0pO4D/kWSRGmiEv/22Pxh4umFj2mcx9kbIw8zINmsRB5z7+HNshyUoByg0JtUEXMk
         FsOQ==
X-Gm-Message-State: ACgBeo2E3kTH47LAVR9Vfi8QDo0IxR5bA9oJYWPpVaMGMogPB8xk8aRI
	WQvCuBMjoeANTqvjLlkRgk1AF5WTNXFk6UN2FQI=
X-Google-Smtp-Source: AA6agR76oTCoP2K9omiY3xisTcRhkl/VGb6FFCKu/kjjdtf4CwkBwADBK/ZOKLvdnvOPta40wh5R8EYE/TiRBIyFijg=
X-Received: by 2002:a05:6e02:1522:b0:2e5:9e3c:a7c8 with SMTP id
 i2-20020a056e02152200b002e59e3ca7c8mr8021588ilu.237.1660749216849; Wed, 17
 Aug 2022 08:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220802015052.10452-1-ojeda@kernel.org> <20220802015052.10452-28-ojeda@kernel.org>
 <CAK8P3a0jqhGY9E85VC9gNem5q6-dWeq0H6-7bhJopinMnLtOKQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0jqhGY9E85VC9gNem5q6-dWeq0H6-7bhJopinMnLtOKQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 17 Aug 2022 17:13:25 +0200
Message-ID: <CANiq72nNucEhXAXkXSujnGkpQrkv3-Pcn7ua8N=2XB-suAjs9w@mail.gmail.com>
Subject: Re: [PATCH v8 27/31] Kbuild: add Rust support
To: Arnd Bergmann <arnd@arndb.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_081339_336909_5E3A9050 
X-CRM114-Status: GOOD (  23.19  )
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

Hi Arnd,

On Wed, Aug 17, 2022 at 4:40 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Hi Miguel,
>
> I tried enabling rust support in the gcc builds I provide at
> https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/arm64/12.1.0/

Thanks for giving it a go!

> to make this more accessible, but it appears that the command line
> options here are not portable:
>
>  /home/arnd/cross/x86_64/gcc-12.1.0+rust-nolibc/x86_64-linux/bin/x86_64-linux-gccrs

So you mean with GCC Rust, right? (i.e. we have "GCC builds" working,
via compiling the Rust side with LLVM and linking with the GCC C side,
but it is not intended for production or to be supported, even if we
cover it in our CI, test it boots and loads modules etc.).

Indeed, `gccrs` does not support `rustc` flags yet. I am not sure if
the GCC Rust team will eventually provide a driver for those like
clang does for e.g. `cl` -- I would hope they do, since many projects
would benefit from it, but maybe they plan to start simply by
modifying Cargo to call them as they need instead.

If they don't support it, we will have to map the flags on our side --
it should not be a big problem. However, see below...

> I guess nobody has tried this so far. Would you think that fixing this is only
> a matter for fixing the build system to pass the correct flags depending on the
> compiler, or is this broken in a more fundamental way?

If you meant GCC Rust, then it is a bit too early for the compiler. As
far as I now, they are working on compiling the `core` crate and
supporting more stable language features. They are also researching
the integration of the borrow checker, though we wouldn't need that
for "only" compiling the kernel.

Now, if they decided to focus on supporting Rust for Linux early on
(which would be great), they would still need to work on the delta
between what what they target now and what we use (which includes both
stable and some unstable features), plus I assume infrastructure bits
like the platform (target spec) support, the flags / `rustc` driver
(though I would be happy to do as much as possible on our side to
help), etc.

(We privately talked about possible timelines for all that if they
were to focus on Rust for Linux etc., but I let them comment or not on
that... Cc'ing them! :)

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
