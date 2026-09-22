Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BBBC982F1
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 04:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7uhHKUMHR9j7AWd/iYGYwElhczdSeWC0Vl1k14gWKi8=; b=1rwLbvsjpVneqn
	3ewhbMEzCn/TbQnF++wlf/UCMsxCclAD2CzMmtCH+lVEcT2EMwmMOMLzMQTiZir5XV80cepMH/2ej
	XqgPpRZ70lG7PPc/GSf22UVlPLVxeNGi+R4N83LSR0iW4lU0nM095W8Je51hvZk/9AE7ioZ6+HwO8
	IGKN5y+t5ON4cRPdrvKk8G5gQKHekzm7W8Vloc2Uh92d0G3bUibip3EnJiON4kKPtHuLd2hjQ1RXr
	K1S9SlYrUhn71pFmmK0fFaj6y2eUri+tQIWFp/wAuuuYuTzZNf6q2zJ4Cq6nQ0BfEuEMw7v5Or42U
	HMTWORXwjRxWDgP0rMOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rvi-00000004A8O-0tmM;
	Tue, 22 Sep 2026 04:16:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rvg-00000004A7t-3bJ4;
	Tue, 22 Sep 2026 04:16:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F42D44872;
	Tue, 22 Sep 2026 04:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0471F000FF;
	Tue, 22 Sep 2026 04:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790050588;
	bh=RqPZN4CQe2FjLfMYs6z6JAlBF3IuRy4nyatTd0khWuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AqZfjAj6n1aloLbaYNuH+qUMs6HuFlg2zq2c+COl1oIlvOOdFsofup6L1BojfFZG3
	 eDf7jHjlOH4Vpf2PN4SueTF6bRdX1PD25MO5skdlnCWPyYnJJkZFE07FeKAYfin4yJ
	 XzX5wMlTb2osMmCCLoZ6ixDabNJUq3SxyurfbFxoAcFWYJ2rvzsRps+mZm0tXVsHuh
	 m/3jF8AySYckadqyTY5pfx3pTvieXguUIgtsdWE94PET+HS5kbX0l9OdqusVapFV5D
	 u9oYzOmdi1z1acm15i6PEzdijE4SUwB/uf9cGzUAETBXJKg2qWIJrY6YfUav3ZqCJ0
	 o/KHFOjZijkkw==
Date: Mon, 21 Sep 2026 21:16:21 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
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
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 15/20] objtool: cache relocations, do less work,
 eliminate relocation hash
Message-ID: <arG07kfxJCmnVPY4@jpoimboe>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-15-9ecf4163ff36@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-build-speedup-v3-15-9ecf4163ff36@kernel.org>
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

On Thu, Sep 17, 2026 at 05:06:25PM +0100, Lorenzo Stoakes (ARM) wrote:
> This relies upon the entries within a section being sorted, which is the
> case for all sections supplied to objtool by the link step during the
> kernel build.

This is wrong (or at least actively misleading).  Objtool doesn't *only*
run on linked objects.  In some configs it runs on individual .o files.
And GCC doesn't sort relocs:

  Relocation section '.rela.text' at offset 0xc0d0 contains 724 entries:
      Offset             Info             Type               Symbol's Value  Symbol's Name + Addend
      ...
  0000000000005c50  0000009000000004 R_X86_64_PLT32         0000000000000000 _raw_spin_lock - 4
  0000000000005c65  0000009100000004 R_X86_64_PLT32         0000000000000000 _raw_spin_unlock - 4
  0000000000005c6d  0000019f00000004 R_X86_64_PLT32         0000000000000000 put_files_struct - 4
  000000000000004d  0000008f00000004 R_X86_64_PLT32         0000000000000000 __x86_return_thunk - 4
  0000000000000075  0000008f00000004 R_X86_64_PLT32         0000000000000000 __x86_return_thunk - 4
  00000000000000cd  0000008f00000004 R_X86_64_PLT32         0000000000000000 __x86_return_thunk - 4

(JMP target relocations are emitted in a second pass, for whatever
reason)

So the hash may actually be needed as a fallback after all.  Or some
other scheme.

Either way it's overkill to have more than a single fallback.  No second
fallback for "just in case".  Attempting to search an unhashed section
(DWARF) can just be a fatal error instead of the "just in case"
WARN+linear fallback thing.

> @@ -1168,19 +1286,26 @@ static int read_relocs(struct elf *elf)
>  				return -1;
>  			}
>  
> -			elf_hash_add(reloc, &reloc->hash, reloc_hash(reloc));
>  			set_sym_next_reloc(reloc, sym->relocs);
>  			sym->relocs = reloc;
>  
>  			nr_reloc++;
>  		}
>  		max_reloc = max(max_reloc, nr_reloc);
> +
> +		/* DWARF relocs are never looked up, so are not worth indexing. */
> +		if (is_dwarf_section(rsec->base))
> +			continue;

This DWARF reloc skipping is a standalone improvement, can you split
this out to another patch?

-- 
Josh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
