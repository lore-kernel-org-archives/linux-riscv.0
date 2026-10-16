Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4230CCA462
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 12:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8mjOFZcBwpKc3U8cLXkniff0qcmtl6iOrU5S/8/LZCY=; b=0hjMnuPy6zd4oc
	rUeUTW0EO/u0eilC8toHDmYAOrbQuVD5Cpr88v9MIbxF9vqzdIaGpdabUp4Zkh3+jsLg8Gf9e/MsO
	i91NvTo6cfCJeg4DezHZSCZWpctugWWKYs1Fjr6Dg87G/Hy/M4CGOLlaXcRjvzRepziuScA63PPuI
	6lbzAichMr7ux69oVpyWULv+jCMtVB/nl6Te0DBqJZT9/SRNFqPA1e8hS0YmzA4ecUO0mxkADH+sm
	jPVtCi+dWLKTBfQyldAL+rm7lyUKbqB4Ry6RN46ZMxpcH7+J4ss0/Eh1rLwG4aAKj5yxVVe7l31LL
	RtnK0aUgks0/zCG+A/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHgpN-00000002pgJ-2Aq2;
	Fri, 16 Oct 2026 12:14:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHgpM-00000002pg5-2ETS
	for linux-riscv@bombadil.infradead.org;
	Fri, 16 Oct 2026 12:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=O+NQOhqzv2YbuUrbjrP3YSMvBckVI+bztNOXhDG1B+k=; b=nKpfJV0tIFmz3128vVU5SeBkTQ
	PW8PDt3h7pr5N2E6Tr5cdoYn6GuC8BBA5zFyu/Y6PEF1uXjKoR4HY6AQExORlHsUDiASEPsw+ze7s
	DZhNAllrz2UU+VCrpkoLL0ADgovuI3cl64ilZDbgHWOrPIL9bxvPGZZu6gmtHj9quHHwI8FXz6uxc
	R99l7UNml0Kj3krUjEKEBU4TsqQd1klKVAlowybPV81ZD7f8YPk/hP7kC6H8VheWPe9t2YocjxSGb
	1cwgab5hlAq5i6ggrYJ4OaRLxxuzLg39g/tjgxFJ4zMatZJqdpjkund2evu7/7NjA8PvGseUKzGJw
	0yBcl1+w==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHgpI-00000001TCR-2HAq
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 12:14:23 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1240169f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2026 05:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792152859; x=1792757659; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O+NQOhqzv2YbuUrbjrP3YSMvBckVI+bztNOXhDG1B+k=;
        b=VCCa+oJrv5JZAjXuvM0SSA1F5dNTDj1gjsYVOX0ZU7cVaxBVXTI11AYWjCiGa+apaM
         VLU7hMXu/26L/xuaFL/NYl5EbDsisF/y06HMN/u5A8VtBHwnjfIv/SQnRi7vIjOX/8Gj
         kYOSfP4ECr0qPyVNyix5PHmgZF84U9mfMK0qWzOegFNZmxWiUMvoT1CEcaWWsNQYD9MA
         yGFfgjEFJrEPq3ukE4sgm4+qG+ZivCudmcZTVcCFxaAGF+9jGkwIYPCJo4GCqYYuv07V
         l1k23xFVs32vGc7entwJ964C0gk27JLfNIyikRiTjXhkBc/UWkIyqTm6m/fex/K5Y8Os
         2zwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792152859; x=1792757659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O+NQOhqzv2YbuUrbjrP3YSMvBckVI+bztNOXhDG1B+k=;
        b=U76fAPMnnGjpn8pvQI9zsVESRDd3ZRRQykbgh4dl1QzwlQillCpSKkmIA1h0Y3pjTU
         7LIaPcZ+KFD4COr8vtGPx1ftMACIrOpac2M2SxPKnK3Ms+3GIybY5Q7ez3ofGPMbx3xO
         pNKXSflhh9OUR1cSE5bP2TFhiGWx1FZ/5TqdZBT/rCWrtArwxvQmvDZS3L0x2THIK/Ac
         k4VSqMfecaqINw1cH1S2o4ZO60CiOOZviDy4hQvHRJvE3rNn+XuV9CelrSf7cgA0bir3
         RAMArC2O07kpMBVUx6nRuzO6fk8XmYpP5eJs1h/kqoyxb9DjOZiUpKlCFkeqmriy6U2/
         G+WA==
X-Forwarded-Encrypted: i=1; AKwUvBzVsqWlsp4JjAKy0c5bZruwJ55trODkcosBglEF20rGaxKChd852C2f0uLrpXILna5x01fx7TnE+RqFUg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKBf1Y/4yLyWFlO3CoDYwaQZ/lfMV3hSYeEsG8V2avLs8M/KJWF
	htWx/6cpmbOHZ/zHmj4tZ8jWrzdJtehum9XEKrw38xygQCgNNCmHAwMK1p2ypWDHvDs=
X-Gm-Gg: AYBFou3c/6fCYpLJvSAg2J4mfybxenR/FJUSHVcgIAWusO+cQ/htH1ZhUlJ0ba0Tw4J
	aK/afxiJgPEADnDjk6Vaict9UETfi8j6YlESIaPXd2AxEndSM4jX4JVo/X8ycEMZbHPUw5Nkvpt
	0sAOFxdgPkmeqNMp0eHDIL8x/Zrxhb7VgbRjHj8E1twfPBHgaNPfrBchCZIzhjP6hVi817za/rN
	gqF1M2HtFQ/H5/FYVRzjYs8BjyfmudIWzFoG5nR82PanZpQYyE4hL9ijyX9KxGMJffNXYw9dNG3
	AzTdaVAdIXtA62nLZbiAEgk7Gb7MXhxoUobgA+3ZvzO6b931+8G/VEbVs6YTMDHKAS2hrizzEfE
	zxUF9hcipbMU9sUthcSqy5/UE1H9kGSe9L8aaAfwNnaBsSRO+DMjx0mAsbPSwa5+CWATG+/WmFG
	aBbR2T1Kvek2mmey7e/MUAfHeqe0dhz9jHBqbzC2ohhVB1+psrpdRtXByyKbgpLYcp0LTGIt98K
	hCsCt94noHZF4WtOYvrPDpnyRGt2rF/Ttg=
X-Received: by 2002:a05:6000:2686:b0:48d:f3a4:610b with SMTP id ffacd0b85a97d-48df3a462bcmr12096973f8f.25.1792152858574;
        Fri, 16 Oct 2026 05:14:18 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd50d080sm4940009f8f.53.2026.10.16.05.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:14:17 -0700 (PDT)
Message-ID: <b17e9924-ca92-4cdf-b5e6-54164039e09a@suse.com>
Date: Fri, 16 Oct 2026 14:14:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/22] modpost: emit module descriptors as assembly
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-hardening@vger.kernel.org
References: <20260923-build-speedup-v4-0-73128809a4a4@kernel.org>
 <20260923-build-speedup-v4-14-73128809a4a4@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260923-build-speedup-v4-14-73128809a4a4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_131420_782311_DFFA9B92 
X-CRM114-Status: GOOD (  43.28  )
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

On 9/23/26 7:18 PM, Lorenzo Stoakes (ARM) wrote:
> modpost generates a descriptor for every module in the form of a
> <module>.mod.c file with .modinfo strings, the __this_module descriptor,
> exported symbol tables and (with CONFIG_MODVERSIONS set), the CRC of
> imported symbols.
> 
> These files are compiled like any other kernel C file with all of the
> -include preamble, as well as including linux/module.h, header dependencies
> generated by fixdep of a few hundred headers, an objtool run and if LTO is
> being performed, a link is performed to generate native code.
> 
> On an x86-64 allmodconfig build 11,189 *.mod.c files are built, each
> taking ~0.24s of CPU time to compile, and module finalisation as a whole
> 6,300 CPU seconds, or 64 seconds of wall time when run over 128 threads.
> 
> It also generates ~1.3 GiB of *.mod.o.cmd files that every subsequent build
> has to read back.
> 
> Avoid all this by emitting the descriptors as assembly instead.
> 
> The layout required (size and alignment of struct module, struct
> modversion_info, the module's name offsets, init, and exit fields and
> whether the architecture uses PREL32 ksymtab references) can all be derived
> from scripts/mod/module-offsets.h.
> 
> The fields of __this_module are emitted in offset order rather than
> declaration order, as CONFIG_RANDSTRUCT shuffles struct module so the name,
> init and exit fields can land anywhere.
> 
> An assembly file avoids all of the issues previously mentioned so this
> conversion results in a very significant performance win on kernel build.
> 
> As a consequence of this change, since module-offsets.c includes
> linux/module.h, scripts/mod is now built after the generated headers in
> prepare0, rather than before.
> 
> Also update .gitignore and make clean to handle .mod.S files, but keep
> .mod.c files there to ensure that users do not end up with untracked
> changes/dirty trees after the change takes effect.
> 
> The sections were confirmed to be byte-for-byte identical to the C version
> produced - each of .modinfo, .gnu.linkonce.this_module, __ksymtab*,
> __ksymtab_strings, __kcrctab*, __kflagstab*, __versions,
> __version_ext_crcs, __version_ext_names and their relocations - for all
> 8,135 modules of a clang allmodconfig build with CONFIG_COMPILE_TEST off
> and CONFIG_MODVERSIONS, CONFIG_EXTENDED_MODVERSIONS and
> CONFIG_MODULE_SRCVERSION_ALL on, and for a sample built with gcc.
> 
> What differs is what the compiler added around them: the __UNIQUE_ID_*
> locals, the KASAN constructor for the .mod.c globals, and on x86 a
> .note.gnu.property that the linker already drops from any module containing
> an assembly file and the loader never reads.
> 
> None of these have any impact on the build, however.
> 
> The assembly carries no debug information, so in order to keep describing
> __this_module in each module's debug information, define it weakly in
> module-common.c too, in a section which the module link discards.
> 
> x86_64 kernels built with gcc and clang, with CONFIG_MODVERSIONS,
> CONFIG_EXTENDED_MODVERSIONS and CONFIG_MODULE_SRCVERSION_ALL, were booted,
> every module and an external one loaded and unloaded, and the srcversions
> checked against modinfo, i386 and arm64 defconfigs (gcc and clang) and a
> ThinLTO build were also built as part of testing.
> 
> An x86_64 CONFIG_RANDSTRUCT_FULL build with clang, which places the name
> field after init and exit, was checked the same way and produces the same
> .gnu.linkonce.this_module sections and relocations as the C version.
> 
> On the x86_64 allmodconfig with clang 22, "make modules" with every
> *.mod.o and *.ko deleted goes from 64.5s (6,306 CPU-s) to 28.5s (518
> CPU-s).
> 
> A consequence of this change is that the make jobs are now so small that
> make cannot dispatch them quick enough, however the next commit in the
> series addresses this issue.
> 
> This impacts clean and no-op builds with a large number of modules most
> noticeably.
> 
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 allmodconfig, no-op make, gcc        12.7s     2.3s    -10.4s (-82%)
>   x86 allmodconfig, no-op make, clang      13.9s     2.8s    -11.2s (-80%)
>   x86 allmodconfig, clean, gcc            342.6s   306.6s    -36.0s (-11%)
>   x86 allmodconfig, clean, clang          340.1s   290.2s    -49.8s (-15%)
> 
> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

This version looks mostly ok to me, from a modules perspective. Below
are a few nits plus one more useful comment about handling
MODULE_ARCH_INIT.

> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 0fd43c8a89ea..9d96459e492c 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> [...]
> +/* The name and namespace strings a ksymtab entry refers to. */
> +static void add_asm_kstrtab(struct buffer *buf, const struct symbol *sym)
> +{
> +	buf_printf(buf, "\t.section \"__ksymtab_strings\",\"aMS\",%%progbits,1\n");
> +	buf_printf(buf, "__kstrtab_%s:\n", sym->name);
> +	buf_asciz(buf, sym->name);
> +	buf_printf(buf, "__kstrtabns_%s:\n", sym->name);
> +	buf_asciz(buf, sym->namespace);
> +	buf_printf(buf, "\t.previous\n");
> +}
> +
> +/* The equivalent of SYMBOL_FLAGS(). */
> +static void add_asm_kflagstab(struct buffer *buf, const struct symbol *sym)
> +{
> +	buf_printf(buf, "\t.section \"___kflagstab+%s\", \"a\"\n", sym->name);
> +	buf_printf(buf, "__flags_%s:\n", sym->name);
> +	buf_printf(buf, "\t.byte 0x%02x\n", get_symbol_flags(sym));
> +	buf_printf(buf, "\t.previous\n");
> +}
> +
> +/* The equivalent of KSYMTAB_FUNC()/KSYMTAB_DATA(). */
> +static void add_asm_ksymtab(struct buffer *buf, const struct symbol *sym)
> +{
> +	const char *name = sym->name;
> +
> +	add_asm_kstrtab(buf, sym);
> +
> +	buf_printf(buf, "\t.section \"___ksymtab+%s\", \"a\"\n", name);
> +	buf_printf(buf, "\t.balign %d\n", KSYM_ALIGN);
> +	buf_printf(buf, "__ksymtab_%s:\n", name);
> +	add_asm_ksym_ref(buf, sym->is_func ? MOD_FUNC_PREFIX : "", name);
> +	add_asm_ksym_ref(buf, "__kstrtab_", name);
> +	add_asm_ksym_ref(buf, "__kstrtabns_", name);
> +	buf_printf(buf, "\t.previous\n");
> +
> +	add_asm_kflagstab(buf, sym);
> +}

add_asm_kstrtab() and add_asm_kflagstab() are only called from
add_asm_ksymtab() and their logic is fairly short. I suggest merging
these functions.

> +
> +/* The equivalent of SYMBOL_CRC(). */
> +static void add_asm_crc(struct buffer *buf, const struct symbol *sym)
> +{
> +	buf_printf(buf, "\t.section \"___kcrctab+%s\",\"a\"\n", sym->name);
> +	buf_printf(buf, "\t.balign 4\n");
> +	buf_printf(buf, "__crc_%s:\n", sym->name);
> +	buf_printf(buf, "\t.long 0x%08x\n", sym->crc);
> +	buf_printf(buf, "\t.previous\n");
> +}
> +
> +static bool export_is_kept(const struct symbol *sym)
> +{
> +	return !trim_unused_exports || sym->used;
> +}

export_is_kept() is only called once from add_asm_exported_symbols().
The condition can be inlined directly there.

> +
> +/* The exported symbols and, with modversions, their CRCs. */
> +static void add_asm_exported_symbols(struct buffer *buf, struct module *mod)
> +{
> +	struct symbol *sym;
> +
> +	list_for_each_entry(sym, &mod->exported_symbols, list) {
> +		if (!export_is_kept(sym))
> +			continue;
> +
> +		add_asm_ksymtab(buf, sym);
> +
> +		if (!modversions)
> +			continue;
> +
> +		if (!sym->crc_valid)
> +			mod_warn(mod, "EXPORT symbol '%s' version generation failed, symbol will not be versioned.\n"
> +				 "Is '%s' prototyped in <asm/asm-prototypes.h>?\n",
> +				 sym->name, sym->name);
> +		add_asm_crc(buf, sym);
> +	}
> +}
> +
> +/* Zero fill up to the offset. */
> +static void asm_skip_to(struct buffer *buf, unsigned int *pos,
> +			unsigned int offset)
> +{
> +	if (offset < *pos)
> +		fatal("__this_module field at offset %u overlaps the previous one\n",
> +		      offset);
> +	if (offset > *pos)
> +		buf_printf(buf, "\t.skip %u\n", offset - *pos);
> +
> +	*pos = offset;
> +}
> +
> +/* A non-zero field of __this_module: its offset and the name or symbol in it. */
> +struct this_module_field {
> +	unsigned int offset;
> +	bool is_name;
> +	const char *value;
> +};
> +
> +#define THIS_MODULE_MAX_FIELDS	5
> +
> +static int compare_field_offsets(const void *ptr_a, const void *ptr_b)
> +{
> +	const struct this_module_field *field_a = ptr_a, *field_b = ptr_b;
> +
> +	if (field_a->offset != field_b->offset)
> +		return field_a->offset < field_b->offset ? -1 : 1;
> +
> +	return 0;
> +}
> +
> +/*
> + * The fields of __this_module which are not zero, in offset order. The order
> + * is only known from module-offsets.h, CONFIG_RANDSTRUCT shuffles struct module.
> + */
> +static unsigned int get_this_module_fields(const struct module *mod,
> +					   const char *modname,
> +					   struct this_module_field *fields)
> +{
> +	unsigned int nr_fields = 0;
> +
> +	fields[nr_fields++] = (struct this_module_field)
> +		{ MOD_OFF_module_name, true, modname };
> +	if (mod->has_init)
> +		fields[nr_fields++] = (struct this_module_field)
> +			{ MOD_OFF_module_init, false, MOD_FUNC_PREFIX "init_module" };
> +#ifdef MOD_OFF_module_exit
> +	if (mod->has_cleanup)
> +		fields[nr_fields++] = (struct this_module_field)
> +			{ MOD_OFF_module_exit, false, MOD_FUNC_PREFIX "cleanup_module" };
> +#endif
> +#ifdef MOD_OFF_module_arch_fixup_start
> +	fields[nr_fields++] = (struct this_module_field)
> +		{ MOD_OFF_module_arch_fixup_start, false, "__start_fixup" };
> +	fields[nr_fields++] = (struct this_module_field)
> +		{ MOD_OFF_module_arch_fixup_end, false, "__stop_fixup" };
> +#endif
> +	qsort(fields, nr_fields, sizeof(*fields), compare_field_offsets);
> +
> +	return nr_fields;
> +}
> +
> +/* Emit one field of __this_module, returning its size. */
> +static unsigned int add_asm_this_module_field(struct buffer *buf,
> +					      const struct this_module_field *field)
> +{
> +	if (field->is_name) {
> +		buf_printf(buf, "\t.ascii \"%s\"\n", field->value);
> +		return strlen(field->value);
> +	}
> +
> +	buf_printf(buf, "\t" MOD_PTR_DIRECTIVE " %s\n", field->value);
> +	return MOD_SIZEOF_LONG;
> +}
> +
> +/*
> + * The equivalent of:
> + *
> + *	__visible struct module __this_module __section(".gnu.linkonce.this_module")
> + *		= { .name = KBUILD_MODNAME, .init = init_module, .exit = cleanup_module,
> + *		    .arch = MODULE_ARCH_INIT };
> + *
> + * Everything not listed is zero, MODULE_ARCH_INIT included, except on m68k.
> + */
> +static void add_asm_this_module(struct buffer *buf, const struct module *mod,
> +				const char *modname)
> +{
> +	struct this_module_field fields[THIS_MODULE_MAX_FIELDS];
> +	const unsigned int nr_fields = get_this_module_fields(mod, modname, fields);

The const qualifier can be removed from the nr_fields definition to
match the usual kernel style.

> +	unsigned int pos = 0, i;
> +
> +	buf_printf(buf, "\n\t.section .gnu.linkonce.this_module,\"aw\",%%progbits\n");
> +	buf_printf(buf, "\t.balign %d\n", MOD_ALIGNOF_struct_module);
> +	buf_printf(buf, "\t.globl __this_module\n");
> +	buf_printf(buf, "\t.type __this_module, %%object\n");
> +	buf_printf(buf, "\t.size __this_module, %d\n", MOD_SIZEOF_struct_module);
> +	buf_printf(buf, "__this_module:\n");
> +
> +	for (i = 0; i < nr_fields; i++) {
> +		asm_skip_to(buf, &pos, fields[i].offset);
> +		pos += add_asm_this_module_field(buf, &fields[i]);
> +	}
> +
> +	asm_skip_to(buf, &pos, MOD_SIZEOF_struct_module);
> +}
> +
> +/*
> + * An unresolved symbol without a module is not versioned; one without a CRC
> + * cannot be, so warn about it.
> + */
> +static bool skip_unversioned(struct module *mod, const struct symbol *sym)
> +{
> +	if (!sym->module)
> +		return true;
> +	if (sym->crc_valid)
> +		return false;
> +
> +	mod_warn(mod, "symbol '%s' has no CRC!\n", sym->name);
> +	return true;
> +}
> +
> +/* One struct modversion_info: the CRC, then the name padded to the end. */
> +static void add_asm_version(struct buffer *buf, const struct symbol *sym)
> +{
> +	buf_printf(buf, "\t" MOD_PTR_DIRECTIVE " 0x%08x\n", sym->crc);
> +	buf_printf(buf, "\t.ascii \"%s\"\n", sym->name);
> +	buf_printf(buf, "\t.skip %zu\n", MOD_SIZEOF_struct_modversion_info -
> +		   MOD_OFF_modversion_info_name - strlen(sym->name));
> +}
> +
> +/*
> + * The equivalent of:
> + *
> + *	static const struct modversion_info ____versions[]
> + *	__used __section("__versions") = { { crc, "name" }, ... };
> + *
> + * for unresolved symbols.
> + */
> +static void add_asm_versions(struct buffer *buf, struct module *mod)
> +{
> +	struct symbol *sym;
> +
> +	if (!basic_modversions)
> +		return;
> +
> +	buf_printf(buf, "\n\t.section __versions,\"a\",%%progbits\n");
> +	buf_printf(buf, "\t.balign %d\n", MOD_ALIGNOF_struct_modversion_info);
> +	list_for_each_entry(sym, &mod->unresolved_symbols, list) {
> +		if (skip_unversioned(mod, sym))
> +			continue;
> +
> +		if (strlen(sym->name) >= MOD_NAME_LEN) {
> +			/* Only the extended table can hold it. */
> +			if (extended_modversions)
> +				continue;
> +
> +			mod_error(mod, "too long symbol '%s'\n", sym->name);
> +			break;
> +		}
> +
> +		add_asm_version(buf, sym);
> +	}
> +}
> +
> +/*
> + * The equivalent of:
> + *	static const u32 ____version_ext_crcs[] __section("__version_ext_crcs") = { crc, ... };
> + *	static const char ____version_ext_names[] __section("__version_ext_names") = "name\0" ...;
> + *
> + * for unresolved symbols.
> + */
> +static void add_asm_extended_versions(struct buffer *buf, struct module *mod)
> +{
> +	struct symbol *sym;
> +
> +	if (!extended_modversions)
> +		return;
> +
> +	buf_printf(buf, "\n\t.section __version_ext_crcs,\"a\",%%progbits\n");
> +	buf_printf(buf, "\t.balign 4\n");
> +	list_for_each_entry(sym, &mod->unresolved_symbols, list) {
> +		if (skip_unversioned(mod, sym))
> +			continue;
> +
> +		buf_printf(buf, "\t.long 0x%08x\n", sym->crc);
> +	}
> +
> +	/*
> +	 * A symbol without a CRC was warned about above, and is skipped here
> +	 * too so that the names line up with the CRCs.
> +	 */
> +	buf_printf(buf, "\t.section __version_ext_names,\"a\",%%progbits\n");
> +	list_for_each_entry(sym, &mod->unresolved_symbols, list) {
> +		if (!sym->module || !sym->crc_valid)
> +			continue;

This condition must match the logic in skip_unversioned(). It would be
clearer to keep it only in one place by calling skip_unversioned() here
and adding a "silent" parameter to the function.

> diff --git a/scripts/mod/module-offsets.c b/scripts/mod/module-offsets.c
> new file mode 100644
> index 000000000000..a336dd47aa33
> --- /dev/null
> +++ b/scripts/mod/module-offsets.c
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Layout of the structures modpost emits into *.mod.S, extracted from the
> + * target headers as devicetable-offsets.c does for the device tables.
> + */

The second part of the comment, after the comma, is superfluous. It is
expected that the various parts of modpost use consistent mechanisms
where appropriate.

> +#define COMPILE_OFFSETS
> +#include <linux/kbuild.h>
> +#include <linux/module.h>
> +
> +int main(void)
> +{
> +	DEFINE(MOD_SIZEOF_LONG, sizeof(long));
> +	DEFINE(MOD_PREL32_RELOCATIONS, IS_ENABLED(CONFIG_HAVE_ARCH_PREL32_RELOCATIONS));
> +	DEFINE(MOD_FUNC_PLABEL, IS_ENABLED(CONFIG_PARISC) && IS_ENABLED(CONFIG_64BIT));
> +
> +	DEFINE(MOD_SIZEOF_struct_module, sizeof(struct module));
> +	DEFINE(MOD_ALIGNOF_struct_module, __alignof__(struct module));
> +	OFFSET(MOD_OFF_module_name, module, name);
> +	OFFSET(MOD_OFF_module_init, module, init);
> +#ifdef CONFIG_MODULE_UNLOAD
> +	OFFSET(MOD_OFF_module_exit, module, exit);
> +#endif
> +#if defined(CONFIG_M68K) && defined(CONFIG_MMU)
> +	/* MODULE_ARCH_INIT: the only architecture where it is not all zeroes. */
> +	OFFSET(MOD_OFF_module_arch_fixup_start, module, arch.fixup_start);
> +	OFFSET(MOD_OFF_module_arch_fixup_end, module, arch.fixup_end);
> +#endif

I feel it is a bit of a layering violation for modpost to know how
individual architectures need to initialize module::arch.

For now, this is probably ok. I would just remove MODULE_ARCH_INIT from
include/linux/module.h and arch/m68k/include/asm/module.h, along with
the comment referring to it in scripts/mod/modpost.c.

In the future, this could be avoided by having the m68k module support
look up the .m68k_fixup section at runtime, as other architectures
typically do for similar sections.

-- 
Thanks,
Petr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
