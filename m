Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A082C79FB7
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 04:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o3+uRn8TmqhZronVqN+QWNZxw5M6EJCR5+hrvbcvocs=; b=EWFA4fk7UovgI8
	D0fzyBVnkUC5FSP8IcaYywokzkOtmO6G+3l9AIEm0Sn3jmCTSnN8XUBbwxSAUDG/fzc1jpCTssKFD
	JgmW9EhjtzPI8YAOutu7pqR7Dp4ql/4dCeKkZln1ISTRnyq1+GwjFbThVXvN2EJUw7+67x7Vtb1Z5
	pFMaTvP4or6Gip6ormWULS0kNHP10FEDAIWii9omZ1XU0GIGSdDp7bgUWbwEGmOMgulKaOnrmbgo1
	w1lMX72CfEAfkS8gIGecBbtjybOuqhMHS1fPZ43FQ8jir0Q+6r8I3lDgNdvtmu/g4LvPKFDJg5H7k
	D+p+aAPYRZIkxyX4PkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WGa-0000000DLk3-1tGy;
	Thu, 10 Sep 2026 04:20:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WGX-0000000DLjh-41XX;
	Thu, 10 Sep 2026 04:20:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E3029600D1;
	Thu, 10 Sep 2026 04:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D3C1F00898;
	Thu, 10 Sep 2026 04:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789014000;
	bh=PntnJdn7wAwHgF/WIFXSRem+NenOWRytScTjrxTXlZs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Wn885YSUx6EhO3wdOpSpXXaVKGNMMVKk3NXGiT+3dhCHXunvwHoaeTNzKDDW3muQM
	 /Cmsj5eUirNpEY3dKG84LypVVldgp8ycUb5GclC+HNgOZBIx25BcnnZZ6ooL+TrM8W
	 ypPM3MrB5xyy+G2FlPKMqGIiQDxFx4SiqjdV3TujYdzNAxUMP/lUMpPrI/2jAMgl83
	 +pHOdjO95VoBAFjWWOK6UZYfATvZloKCmfqYJrpJIcpG2C/QOGVBBCVELcZMdfH183
	 D1wFRvpw6XJiytJWUbJIMm7LbZC+3eWU/yaMRdA5l+KTNw94XCB2MRSSY88gBUUBcO
	 vQbfXevz6Wpeg==
MIME-Version: 1.0
Subject: Re: [PATCH 01/23] scripts/mksysmap: drop the MODULE_INFO() symbols
 from kallsyms
From: Nathan Chancellor <nathan@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
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
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260908-build-speedup-v1-1-5dc1ac01672d@kernel.org>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-1-5dc1ac01672d@kernel.org>
Date: Wed, 09 Sep 2026 21:19:12 -0700
Message-Id: <178901395288.3971858.7586978173036863863.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360; i=nathan@kernel.org;
 h=from:subject:message-id; bh=05GrEiERSxx2o6qsJloijB2A+3tAXcR6CUyQjUdQZFs=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmL9I/pB2VJsrxwyw7jEfNfx2DwuKTvg+mbj1WLq05uk
 m9bIrG1o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzkYwXDH0725eE50XvX/3pX
 +UkiXdfetfLJem2OqW/dzs87vFtIz56RYcNpyWmNGTvqNlSb3V3Q/Kcx55TZijNtD33WZT8+sD7
 jDC8A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

> Commit 3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")
> keeps .modinfo symbols out of System.map and kallsyms, which assumes unique
> IDs have a format like '__UNIQUE_ID_modinfo123'.
> 
> However, commit afb026b6d35c ("compiler: Tweak __UNIQUE_ID() naming"), sent
> in the same cycle, changes this to '__UNIQUE_ID_modinfo_123'.
> 
> As a result this regexp has never matched and every kernel since v6.18 has
> carried one kallsyms entries for every MODULE_INFO() declaration in the
> kernel whether the modules are compiled or not.
> 
> That's 5,810 entries for an x86 defconfig build and 15,200 for arm64.
> 
> On x86 defconfig that is 113 KiB of kallsyms tables and 32 KiB of bzImage,
> and every lookup walks past them.

Bummer :/

> Fix the pattern.
> 
> Fixes: 3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")
> 
> No measurable change in build time, the smaller tables are not on any path
> the build waits for.

I don't think this needs to be in the commit message, it could be below
the fold, since it appears to be a valid fix on its own. Agree with
Nicolas on adjusting the Fixes tag.

Is this worth Cc'ing stable for?

> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
