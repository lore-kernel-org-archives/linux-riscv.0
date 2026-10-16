Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E54CC6B38
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 17:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AfBoghn7ae30E+Lv1kcGfwu/vGer2dbrwVEnWtAGtrs=; b=BQl6JtrXdMwML1
	aB3DtTKZtFlBRJvpxuGeTluNmhdQSPuNp9btKHTqRDEhKPu0LP8GLJpYA8qw2WnRw/ytdxb0uT03f
	LcNbcVj6Vhps+GwD6Ebymy1XXbP1UapS0OHhhXhbnXZ6sp2FGi+4WHz3DJ+cxp5AJNPe0w0kS3foz
	5swvNauUOWF9e9qxYIwwKXgXciDgc+PBpJ0b92gjRDBu4eytJflcVij7Zg4AFg7/V0oOq22REIGHl
	+RA0FPhLEZSf7aECQ/U1OdiElgDfE2Zby3JOOACkN4J3L7cAKSb0ESaFM4T5hQrmz7dMwxESgwR1K
	Net5C/At9oLPMacMX2jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlOB-00000003WHP-1l8z;
	Fri, 16 Oct 2026 17:06:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlO9-00000003WH9-1PMR;
	Fri, 16 Oct 2026 17:06:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D49060A6B;
	Fri, 16 Oct 2026 17:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601221F000C5;
	Fri, 16 Oct 2026 17:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792170396;
	bh=BSEXDWNORjZsXLCu9GysuRDNJRkpmKxIZz1Z4Vu8yyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dAEwm+Ll7zWYzg0O2/opPmRwyuEcN5vqyx3FOLNDe47i4s7xuUix1uZgX/dlo2aoM
	 gtUuBpX6Fvsl5QjvcsgAZ5oPtoDo+OMgyE8aK8spLzAERzLCaFNIJs6/Qvzl0qnuim
	 CshJT9OrW+ZwAkEtWFTxheF0/JtB2cxxYCtpVciK8lXHSLiNWUSX1zG+Hn6EYDT6Hz
	 MgQ0bQbHhTXuIQ+rz+pxCsR4iOPyrfRvk0p9omqb6aOluXTdX6TMvIUYLozs+lZt/Z
	 CMVPW48qhmbZqUwBF2LfXpAqSNHOd5zr0FRgTctbs4uLs/WeE4Pk21uIXN24Gk11u6
	 dZVi7zkFQbQoA==
Date: Fri, 16 Oct 2026 18:06:21 +0100
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
Subject: Re: [PATCH v4 14/22] modpost: emit module descriptors as assembly
Message-ID: <atJVYDgv8ejLoIrA@gremlin>
References: <20260923-build-speedup-v4-0-73128809a4a4@kernel.org>
 <20260923-build-speedup-v4-14-73128809a4a4@kernel.org>
 <b17e9924-ca92-4cdf-b5e6-54164039e09a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b17e9924-ca92-4cdf-b5e6-54164039e09a@suse.com>
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

On Fri, Oct 16, 2026 at 02:14:16PM +0200, Petr Pavlu wrote:
> This version looks mostly ok to me, from a modules perspective. Below
> are a few nits plus one more useful comment about handling
> MODULE_ARCH_INIT.

Ack thanks :)

>
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index 0fd43c8a89ea..9d96459e492c 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
...
> > +/* The equivalent of KSYMTAB_FUNC()/KSYMTAB_DATA(). */
> > +static void add_asm_ksymtab(struct buffer *buf, const struct symbol *sym)
> > +{
> > +	const char *name = sym->name;
> > +
> > +	add_asm_kstrtab(buf, sym);
> > +
> > +	buf_printf(buf, "\t.section \"___ksymtab+%s\", \"a\"\n", name);
> > +	buf_printf(buf, "\t.balign %d\n", KSYM_ALIGN);
> > +	buf_printf(buf, "__ksymtab_%s:\n", name);
> > +	add_asm_ksym_ref(buf, sym->is_func ? MOD_FUNC_PREFIX : "", name);
> > +	add_asm_ksym_ref(buf, "__kstrtab_", name);
> > +	add_asm_ksym_ref(buf, "__kstrtabns_", name);
> > +	buf_printf(buf, "\t.previous\n");
> > +
> > +	add_asm_kflagstab(buf, sym);
> > +}
>
> add_asm_kstrtab() and add_asm_kflagstab() are only called from
> add_asm_ksymtab() and their logic is fairly short. I suggest merging
> these functions.

Ack, done for v5.

>
> > +
> > +/* The equivalent of SYMBOL_CRC(). */
> > +static void add_asm_crc(struct buffer *buf, const struct symbol *sym)
> > +{
> > +	buf_printf(buf, "\t.section \"___kcrctab+%s\",\"a\"\n", sym->name);
> > +	buf_printf(buf, "\t.balign 4\n");
> > +	buf_printf(buf, "__crc_%s:\n", sym->name);
> > +	buf_printf(buf, "\t.long 0x%08x\n", sym->crc);
> > +	buf_printf(buf, "\t.previous\n");
> > +}
> > +
> > +static bool export_is_kept(const struct symbol *sym)
> > +{
> > +	return !trim_unused_exports || sym->used;
> > +}
>
> export_is_kept() is only called once from add_asm_exported_symbols().
> The condition can be inlined directly there.

Ack done.

> > +/*
> > + * The equivalent of:
> > + *
> > + *	__visible struct module __this_module __section(".gnu.linkonce.this_module")
> > + *		= { .name = KBUILD_MODNAME, .init = init_module, .exit = cleanup_module,
> > + *		    .arch = MODULE_ARCH_INIT };
> > + *
> > + * Everything not listed is zero, MODULE_ARCH_INIT included, except on m68k.
> > + */
> > +static void add_asm_this_module(struct buffer *buf, const struct module *mod,
> > +				const char *modname)
> > +{
> > +	struct this_module_field fields[THIS_MODULE_MAX_FIELDS];
> > +	const unsigned int nr_fields = get_this_module_fields(mod, modname, fields);
>
> The const qualifier can be removed from the nr_fields definition to
> match the usual kernel style.

Ack done.

> > +/*
> > + * The equivalent of:
> > + *	static const u32 ____version_ext_crcs[] __section("__version_ext_crcs") = { crc, ... };
> > + *	static const char ____version_ext_names[] __section("__version_ext_names") = "name\0" ...;
> > + *
> > + * for unresolved symbols.
> > + */
> > +static void add_asm_extended_versions(struct buffer *buf, struct module *mod)
> > +{
> > +	struct symbol *sym;
> > +
> > +	if (!extended_modversions)
> > +		return;
> > +
> > +	buf_printf(buf, "\n\t.section __version_ext_crcs,\"a\",%%progbits\n");
> > +	buf_printf(buf, "\t.balign 4\n");
> > +	list_for_each_entry(sym, &mod->unresolved_symbols, list) {
> > +		if (skip_unversioned(mod, sym))
> > +			continue;
> > +
> > +		buf_printf(buf, "\t.long 0x%08x\n", sym->crc);
> > +	}
> > +
> > +	/*
> > +	 * A symbol without a CRC was warned about above, and is skipped here
> > +	 * too so that the names line up with the CRCs.
> > +	 */
> > +	buf_printf(buf, "\t.section __version_ext_names,\"a\",%%progbits\n");
> > +	list_for_each_entry(sym, &mod->unresolved_symbols, list) {
> > +		if (!sym->module || !sym->crc_valid)
> > +			continue;
>
> This condition must match the logic in skip_unversioned(). It would be
> clearer to keep it only in one place by calling skip_unversioned() here
> and adding a "silent" parameter to the function.

Ack done.

>
> > diff --git a/scripts/mod/module-offsets.c b/scripts/mod/module-offsets.c
> > new file mode 100644
> > index 000000000000..a336dd47aa33
> > --- /dev/null
> > +++ b/scripts/mod/module-offsets.c

> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Layout of the structures modpost emits into *.mod.S, extracted from the
> > + * target headers as devicetable-offsets.c does for the device tables.
> > + */
>
> The second part of the comment, after the comma, is superfluous. It is
> expected that the various parts of modpost use consistent mechanisms
> where appropriate.

Ack done.

> > +int main(void)
> > +{
> > +	DEFINE(MOD_SIZEOF_LONG, sizeof(long));
> > +	DEFINE(MOD_PREL32_RELOCATIONS, IS_ENABLED(CONFIG_HAVE_ARCH_PREL32_RELOCATIONS));
> > +	DEFINE(MOD_FUNC_PLABEL, IS_ENABLED(CONFIG_PARISC) && IS_ENABLED(CONFIG_64BIT));
> > +
> > +	DEFINE(MOD_SIZEOF_struct_module, sizeof(struct module));
> > +	DEFINE(MOD_ALIGNOF_struct_module, __alignof__(struct module));
> > +	OFFSET(MOD_OFF_module_name, module, name);
> > +	OFFSET(MOD_OFF_module_init, module, init);
> > +#ifdef CONFIG_MODULE_UNLOAD
> > +	OFFSET(MOD_OFF_module_exit, module, exit);
> > +#endif
> > +#if defined(CONFIG_M68K) && defined(CONFIG_MMU)
> > +	/* MODULE_ARCH_INIT: the only architecture where it is not all zeroes. */
> > +	OFFSET(MOD_OFF_module_arch_fixup_start, module, arch.fixup_start);
> > +	OFFSET(MOD_OFF_module_arch_fixup_end, module, arch.fixup_end);
> > +#endif
>
> I feel it is a bit of a layering violation for modpost to know how
> individual architectures need to initialize module::arch.

Yeah that is kinda gross :)

>
> For now, this is probably ok. I would just remove MODULE_ARCH_INIT from
> include/linux/module.h and arch/m68k/include/asm/module.h, along with
> the comment referring to it in scripts/mod/modpost.c.

ack done.

>
> In the future, this could be avoided by having the m68k module support
> look up the .m68k_fixup section at runtime, as other architectures
> typically do for similar sections.

Yes, arch stuff should live with the arch-specific stuff.

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
