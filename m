Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176A2C25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 14:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/qlgg8k0ViOFL0MZr3VwmrGhCEHE2AqNde0Y7nR8cM=; b=Eb3idgCulD3z1P
	+y4FggGF79BuKRSH8WCooR25iZzBkSdZ9DCQMrN7o75DlQQQc0MGzIcP+P/HQ9hdX5CqeB2RvX8g6
	q5W+ZutIjm8NXNNZOad1LTI0suVR1Yf5ar5HCfmqM9ILR4C1kgyKLe08Dxkk1p+fMDpxvm0pQL9Lz
	39Rv/2N6IGezwO+qfi86VYE1a8Q/YTAEdJ59BLOT9CMgHQDYUocg8uClcon+5oKjDeKHrD1oFilP+
	7nxE+PBD8ocUsqKByf2q9opD7vM+OZPbiK5FvCuEwAHXt11Uj+pdkGWWaRfdO3w2mKjCR53FkqFAn
	4fT41rjdbwjCYjv6hFJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOKDe-002vF5-A4; Wed, 17 Aug 2022 14:40:30 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOKDa-002vAV-KN; Wed, 17 Aug 2022 14:40:28 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MQy0N-1o1xhu3Qnf-00O0vE; Wed, 17 Aug 2022 16:40:17 +0200
Received: by mail-ej1-f49.google.com with SMTP id gb36so24857899ejc.10;
        Wed, 17 Aug 2022 07:40:13 -0700 (PDT)
X-Gm-Message-State: ACgBeo2zrqol5c5PoMpNry9j+teTZoWNLtw1TG4vvVVS+sWXMeDqOCvv
	P9M1i+OBbYxlv1n/TBjjkdnGcS0B9nE2Bhs/DK4=
X-Google-Smtp-Source: AA6agR7iG7b/sKnfv3rtR0wMkiNVbuKu4gohq2MlJovs7t4zv9/h1/ech5e7m293ULb6jtgNsC4wsmH5KCjGWqjMolI=
X-Received: by 2002:a17:907:6da8:b0:730:8ed5:2df8 with SMTP id
 sb40-20020a1709076da800b007308ed52df8mr16850681ejc.75.1660747213344; Wed, 17
 Aug 2022 07:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220802015052.10452-1-ojeda@kernel.org> <20220802015052.10452-28-ojeda@kernel.org>
In-Reply-To: <20220802015052.10452-28-ojeda@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 17 Aug 2022 16:39:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0jqhGY9E85VC9gNem5q6-dWeq0H6-7bhJopinMnLtOKQ@mail.gmail.com>
Message-ID: <CAK8P3a0jqhGY9E85VC9gNem5q6-dWeq0H6-7bhJopinMnLtOKQ@mail.gmail.com>
Subject: Re: [PATCH v8 27/31] Kbuild: add Rust support
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
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
	linuxppc-dev@lists.ozlabs.org
X-Provags-ID: V03:K1:2lF9ChVccGiRDAjdMzgCKDfh0FsakxpU/D3HqvFgf7HE0FvRxca
 RKQzqhkAp98fEPBklSvLPpJCXtrHY0jrNIEddejw99sh4Y056MCbCKywEFtIl/ddn65J4+0
 c3CR7GcXfvdiFpG67l09sxjK1wXwLGxg6iKNeElpmQRKzMKp4BWCmdwIprSWJskuQjAyqIg
 FNOfzaAM38Nov0v581O+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:i/9h7cbZbs0=:ktcEl10LaZIdKEKnwM91C8
 3YoRMBx8aFtDGUJlQwDFMnveSdvRo1hE8HBwyoMSP01uMBBij2oBVgcmB0MB7h5GzZCv7F9kp
 /mGjC97Qwsi78UdZgCuF3IfSxzlLXvLPSxqUeXu5C4/cxGA5vXaPMkVjNknjZv++YzIoJJI/u
 CQ09eQhl46ZYj/h4+vxOas7H/Jgoax5qOnSbXcadEyrK1QDkN8TGqLSt9E7j7QXMJvwytGxER
 K3BmrumRJq9h8R+iH4DY9WCPiara5uWGNlmDBit1vbgnY2nFVmGSCY7FhCt/yJ5muRL2lvrr0
 5slBQyGvObJyYPU3tNSYDk1FrD7R7nAmWqJFTKtzxiuz8EncCqo+faVeOGDEN+FxZmb50ugl0
 ZeaKjBPyqcC3m+ZJIGhYplxuA802N4REz1O8NibaO+aTopJC2zPZ5IaZzxB8r5D5kjLUGYL5V
 F9EoqR7BH3vLPcM0F0qMytrSFOa/izTgp3ySX23YKxAWArrmoH1Re5DhRWI7xQiBJequZ8pCQ
 8o686gkI+6ch43aYKXFPEQkcR5SlzsHnD34rTYq+nqCSpGfhJaH0upa+fiY4F2+gO1ctdsukQ
 Rispu7bFcZZSZ1e6j1ThmQ++xfKF5MhxtCxVVkC58blNhKShvK2i6TrZdjZWCPEzHrMm5IXaP
 8Q/jmn8vmrADwyuX/Xb9sLoEtIPiM0tE5ztbnVzdsnnftoHTxkug9Mxhlcvzkn/p9RaI0kSJS
 wz9QqeBW3MtKB67YIjyFSHFPASkZLVNJtE6f3078xE41LZITkDC4AnJYlYmWEjGb71cAnyUdd
 KW8tj/SMQ+qT6pPAX9b6PatVwNaWYdWe4xyUkV+QsZdJhaL3XNQH4po/R0xFQ7FNlwitTeAfH
 /CLTHRn7iD51iljjHU8A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_074026_971619_CA4ED170 
X-CRM114-Status: GOOD (  13.91  )
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

On Tue, Aug 2, 2022 at 3:50 AM Miguel Ojeda <ojeda@kernel.org> wrote:
>
> +# These flags apply to all Rust code in the tree, including the kernel and
> +# host programs.
> +export rust_common_flags := --edition=2021 \
> +                           -Zbinary_dep_depinfo=y \
> +                           -Dunsafe_op_in_unsafe_fn -Drust_2018_idioms \
> +                           -Dunreachable_pub -Dnon_ascii_idents \
> +                           -Wmissing_docs \
> +                           -Drustdoc::missing_crate_level_docs \
> +                           -Dclippy::correctness -Dclippy::style \
> +                           -Dclippy::suspicious -Dclippy::complexity \
> +                           -Dclippy::perf \
> +                           -Dclippy::let_unit_value -Dclippy::mut_mut \
> +                           -Dclippy::needless_bitwise_bool \
> +                           -Dclippy::needless_continue \
> +                           -Wclippy::dbg_macro

Hi Miguel,

I tried enabling rust support in the gcc builds I provide at
https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/arm64/12.1.0/
to make this more accessible, but it appears that the command line
options here are not portable:

 /home/arnd/cross/x86_64/gcc-12.1.0+rust-nolibc/x86_64-linux/bin/x86_64-linux-gccrs
--edition=2021 -Zbinary_dep_depinfo=y -Dunsafe_op_in_unsafe_fn
-Drust_2018_idioms -Dunreachable_pub -Dnon_ascii_idents -Wmissing_docs
-Drustdoc::missing_crate_level_docs -Dclippy::correctness
-Dclippy::style -Dclippy::suspicious -Dclippy::complexity
-Dclippy::perf -Dclippy::let_unit_value -Dclippy::mut_mut
-Dclippy::needless_bitwise_bool -Dclippy::needless_continue
-Wclippy::dbg_macro -O -Cstrip=debuginfo -Zallow-features=
--emit=dep-info,link --out-dir=scripts/
/git/arm-soc/scripts/generate_rust_target.rs; mv
scripts/generate_rust_target.d scripts/.generate_rust_target.d; sed -i
'/^#/d' scripts/.generate_rust_target.d
x86_64-linux-gccrs: error: unrecognized command-line option
'--edition=2021'; did you mean '-frust-edition=2021'?
x86_64-linux-gccrs: error: unrecognized command-line option
'-Zbinary_dep_depinfo=y'
x86_64-linux-gccrs: error: unrecognized command-line option
'-Wmissing_docs'; did you mean '-Wmissing-braces'?
x86_64-linux-gccrs: error: unrecognized command-line option
'-Wclippy::dbg_macro'
x86_64-linux-gccrs: error: unrecognized command-line option '-Cstrip=debuginfo'
x86_64-linux-gccrs: error: unrecognized command-line option '-Zallow-features='
x86_64-linux-gccrs: error: unrecognized command-line option
'--emit=dep-info,link'
x86_64-linux-gccrs: error: unrecognized command-line option '--out-dir=scripts/'
make[3]: *** [/git/arm-soc/scripts/Makefile.host:157:
scripts/generate_rust_target] Error 1

I guess nobody has tried this so far. Would you think that fixing this is only
a matter for fixing the build system to pass the correct flags depending on the
compiler, or is this broken in a more fundamental way?

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
