Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371AEC982E6
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 14:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wd3eelIafa/9E6h0ldxTTnfOHKfy+x6RqzUE48+xCio=; b=PHMHcgCrJJZvCp
	CX/9a7kkqTRTVnIQsy26SsZFUxxjjl1k2d4cLxUmVH8PQvkqqMBBGoGr83JT+V073XQCRH2yZPASU
	l7ZWMEIDt5nD1BuXNfywJIUBGegfqAYE6731b0p2Z/qB2JsdDiJ/pDnKMl+zUvJRbOQItGqZFHo0u
	0Qfnvh+erKwp87QQ0sqH0j72i6SEMzJHnLfOceBN3azlOZtzAGtNdnkXL9zc/L2CS16BIMqg0OhJI
	VlPZJH28cTPSOyofgjiXsxKRu6ghdA6XgVCSX6Sxu8bnDNoWKFKPvgicfMZ/yxAndYk7W/ArBUPdE
	n3AYkDtDxRlVJ75bXrKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eeb-00000002Kw1-0XSK;
	Mon, 21 Sep 2026 14:05:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8eeY-00000002Kv6-1l0z;
	Mon, 21 Sep 2026 14:05:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D37D600C8;
	Mon, 21 Sep 2026 14:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4001F000FF;
	Mon, 21 Sep 2026 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789999553;
	bh=LItPg0eEICI8licPO1z3Hy7+q6MSXIvcWWOYjosZBio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R2JSulfRRKgDq4nWYVx/wIl9Lk3SBwlo74AheX2WFPr9LmiHUdQD371FGOawu1ayx
	 1fov8PWMy0WOGRmQcskYgxZbJk35Tc5V7ux+XrFi4gSBZZGAvJBe2cCFYnG8UQPF42
	 YXwi24ZQSEppcHTJI1jeGhhs+HQAhBDKTtRrZkVKjHluGrJPJOj9cPZjTsKqAB/Tvr
	 87EOuvi/P9sN43dlUwvDL2CSpwkyz5FdnjjK2kgrZjTrOTApEU3eVFvoZyZ4SXbId+
	 G/Nj72pOen1eumCXhi5oR3Xg6vDHRyeYQ5Slwdil1v1QqYwZoqeNaSKVci4EGpUnhG
	 WSoq5DaspTNkg==
Date: Mon, 21 Sep 2026 15:05:42 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 13/21] modpost: emit module descriptors as assembly
Message-ID: <arE5dDlwgEJxvjKn@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-13-39817ec5db23@kernel.org>
 <95baacfb-d8d9-4d2f-bc89-592df6f6f8e3@suse.com>
 <arEZrFmXeCO4hZpP@gremlin>
 <2b27bb4b-47e3-45ed-a26a-4b9de2b20542@suse.com>
 <arEnCzzQa9XDd4LT@gremlin>
 <58605613-8a43-40e7-a00a-b0d09f089ec8@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58605613-8a43-40e7-a00a-b0d09f089ec8@suse.com>
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

On Mon, Sep 21, 2026 at 03:50:06PM +0200, Petr Pavlu wrote:
> On 9/21/26 2:48 PM, Lorenzo Stoakes (ARM) wrote:
> > On Mon, Sep 21, 2026 at 02:36:30PM +0200, Petr Pavlu wrote:
> >> On 9/21/26 1:57 PM, Lorenzo Stoakes (ARM) wrote:
> >>> (note there's a v3 see [0])
> >>>
> >>> [0]: https://lore.kernel.org/linux-kbuild/20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org/
> >>
> >> Thanks, I missed it.
> >>
> >>> On Mon, Sep 21, 2026 at 01:25:09PM +0200, Petr Pavlu wrote:
> >>>> On 9/14/26 11:22 AM, Lorenzo Stoakes (ARM) wrote:
> >>>>> The sections were confirmed to be byte-for-byte identical to the C version
> >>>>> produced - each of .modinfo, .gnu.linkonce.this_module, __ksymtab*,
> >>>>> __ksymtab_strings, __kcrctab*, __kflagstab*, __versions,
> >>>>> __version_ext_crcs, __version_ext_names and their relocations - for all
> >>>>> 8,135 modules of a clang allmodconfig build with CONFIG_COMPILE_TEST off
> >>>>> and CONFIG_MODVERSIONS, CONFIG_EXTENDED_MODVERSIONS and
> >>>>> CONFIG_MODULE_SRCVERSION_ALL on, and for a sample built with gcc.
> >>>>
> >>>> Lowering the data to assembly loses debug information for __this_module,
> >>>> specifically that it has type `struct module`. It might be worth
> >>>
> >>> No, it keeps it - every module includes linux/module.h, and the extern
> >>> declaration of __this_module carries the type, so all of the stuff gdb
> >>> needs (e.g. ptype, p & field access), DWARF etc. is all there in the same
> >>> way as with .mod.c.
> >>>
> >>> Have confirmed locally.
> >>
> >> An extern declaration alone shouldn't cause its name and type to be
> >> included in debug information. They should appear only when the variable
> >> is referenced by some code.
> >
> > Ack yeah sorry my mistake, I had the LLM check that and should have known
> > better than to trust it without reviewing what it said (as I have done for
> > the most part for everything in this series).
> >
> >>
> >> Testing with a simple module that previously referenced __this_module
> >> only in .mod.c and in no other file, such as lib/test_module.c, shows
> >> that the .ko no longer contains debug information for this variable.
> >>
> >> I've verified this behavior with GCC 16 and Clang 19.
> >
> > Ack confirmed locally.
> >
> > Can put a fix in module-common.c.
> >
> > The LLM came up with a reference as an alternative:
> >
> > static struct module *const __this_module_dbg __used __section(".discard.this_module") = &__this_module;
> >
> > Would that work? Or should we go with your original suggestion? -
> >
> > __weak __section(".discard.this_module") struct module __this_module;
>
> With GCC, the LLM's suggestion produces debug information for both
> __this_module_dbg and __this_module. However, Clang only generates debug
> information for __this_module_dbg, so it is not quite what is needed.

Ack will go with your suggestion then, thanks! Will be applied to v4.

I am aiming for ~midweek for sending that that out to give people a chance to
respond and because it'll be based on other pending commits that need a bit of
time before they're in-tree.

I have added you to the cc-list so you should get mailed when I send it out!

Thanks for the feedback :)

>
> --
> Thanks,
> Petr

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
