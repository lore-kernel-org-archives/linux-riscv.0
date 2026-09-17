Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EACC88E72
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 16:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NXvDVOGt94WT/CevI8iqe9WlP9uOfqliBiK+QIiuLPw=; b=YS/fZunw1Mz2Fb
	xq98xmueX6EuGBVdUVbnKe0J27kqCHSFppsiEH52A1lDFlPt3YF2byNGgQUgAHs2v5z6yNYJ1tYP7
	QyDciDJBnMgRExkF9V/FBTr+fkUNjWmY3Vl0E7hsQ/vIm2pTqkMJkge2Y1XAMkXHjjB+hUaKhFou1
	1pWjtdpZSgLnYEe/jTa3K/WVXy1fitzVwBe0U1wLRO6A8MmYgyvZgWmQ934ykkMO8iLF5Ll214F3O
	apyzDFf1vYn8TTamw3kR599F0H9C2/D6JcVqf9HQCyyILX/GkfbjrMx6f6RyFMj/lMj+Tg2GL5s1L
	PfUsPzxQd6/uTnJ/fhaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FLg-0000000C0JN-37Ux;
	Thu, 17 Sep 2026 16:52:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FLe-0000000C0IX-3g26;
	Thu, 17 Sep 2026 16:52:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 37E4960207;
	Thu, 17 Sep 2026 16:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76E91F00893;
	Thu, 17 Sep 2026 16:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789663952;
	bh=6HEIePW/GlQEOC8t0u6x4RNSCvywoj94H5Dv9GmwVto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ijR8wbuK+jfGWDzkXgnzvZ2zbZocAjn+YYg2G2izTt209ujOut6uhGYc+G6GX5lg/
	 Gsx7nEaWC8+EQEKcPf1WJmXyVbPnBLAl8/kbkIWc1ooxh/XzVfvd6j+MKv0rcsIFWt
	 XuLgs4GNdDKtxqsYTGzyNKMi+OoU5PuCMoK9PvI3mSPATlCkOAyuYNZSl+bntxvupf
	 9zaaJXZp7TakObvOzc7p4Uuk8jmTwCG6/Hb9i36amD6PLyhqI7RK6+RPeweQi0O37V
	 N185d8gTHUhEV7vlo36kgNPaz6aVZKuH3qa7AIrFO0Q/lOZq7CZxkaCdoYttrF8ICb
	 n6NPpwAvriCEA==
Date: Thu, 17 Sep 2026 09:52:32 -0700
From: Kees Cook <kees@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 01/20] kbuild: do not allocate .modinfo in vmlinux
Message-ID: <202609170950.480F90A28@keescook>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-1-9ecf4163ff36@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-build-speedup-v3-1-9ecf4163ff36@kernel.org>
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

On Thu, Sep 17, 2026 at 05:06:11PM +0100, Lorenzo Stoakes (ARM) wrote:
> -# .modinfo in vmlinux.unstripped is aligned to 8 bytes for compatibility with
> -# tools that expect vmlinux to have sufficiently aligned sections but the
> -# additional bytes used for padding .modinfo to satisfy this requirement break
> -# certain versions of kmod with
> -#
> -#   depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname prefix
> -#
> -# Strip the trailing padding bytes after extracting .modinfo to comply with
> -# what kmod expects to parse.

This comment still seems useful here (afaict the stripping is still
happening with the "sed"). Maybe better to leave it, or future readers
are left wondering what the sed is for?

>  quiet_cmd_modules_builtin_modinfo = GEN     $@
> -      cmd_modules_builtin_modinfo = $(cmd_objcopy); \
> -                                    sed -i 's/\x00\+$$/\x00/g' $@; \
> -                                    chmod -x $@
> -
> -OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
> +      cmd_modules_builtin_modinfo = $(OBJCOPY) -O binary -j .modinfo --dump-section .modinfo=$@ $< $@.tmp; \
> +                                    rm -f $@.tmp; \
> +                                    sed -i 's/\x00\+$$/\x00/g' $@

Otherwise, looks good. With the comment back (or rewritten):

Reviewed-by: Kees Cook <kees@kernel.org>

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
