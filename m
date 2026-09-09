Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7580C79FB6
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 19:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Itt9hmrm3f/y9RRiw9pWQ7RbyM1NBw7NOwhn0iumfTo=; b=E3Jkp/rINnikZU
	lAnaJyuz9VMVIiD8/orNfbPODaHNg2eeTk1GiwnwRFG067zQjuzroGuLf/+iD6AIZYtagJh6VmQgB
	UCfYKqkK6fBsATvQgmKZicowk0ncEnBULGdrSmvtPePu/ajBWDQttcvxltWOohMLQfege4KdnSO26
	R5M2VkpSl9EMJ74iQ42+2yyQf2ay9eXjSY7Hz7HPNc/3BinitFASWyUVdNxzKNTg0SSt6iqd/6Ryf
	bcqrlWg0xfEk+YoulRRBlhJc51Jvd9DhhG18QAX7qvITWPVfAZgYVQ0R46eM9aS+XNWPUUM2o/uPf
	Y2h5Gxh4IVGtRHNiy2CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4OGk-0000000Cl9z-2nxR;
	Wed, 09 Sep 2026 19:47:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4OGi-0000000Cl93-3H4g;
	Wed, 09 Sep 2026 19:47:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 309E243CF0;
	Wed,  9 Sep 2026 19:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BDAD1F000FF;
	Wed,  9 Sep 2026 19:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788983260;
	bh=G7FTp6iVpcIdN5Xvcj9jVAhuUcfgpjxShTyjExlqApk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=RE+iRgypgtxiGH3q8JJskwl3TmdpMFavTXW4O087iWcLRDpCKuDZXaHFmXWekOnH9
	 ijGG1NEISpLVBfQUFK8npUZUJDiQ0Q3S7+LKVf+dbu3+7uIXKVriBmBMmaIdBsGby3
	 9XrHw9IyWegS+oMIT8/JU6XGRlO/cbB5cLOi3kkkGAAFszmS0cCBqQw1VucOINId3a
	 hDkCoHIXy7BRc1ix9OTYLpF3c1RooB8oRgnqGLjaGjg/1BdrEOVPZhyMTH3Qxc/YLp
	 z6nmAMsihmZ+dmGZ+5jTY4eiIMBmrGaG7kV0QtlV06t2xDMck6pPA25mesjpn9xH0Z
	 vWnQcn0cGaldQ==
MIME-Version: 1.0
Subject: Re: [PATCH 01/23] scripts/mksysmap: drop the MODULE_INFO() symbols
 from kallsyms
From: Nicolas Schier <nsc@kernel.org>
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
Date: Wed, 09 Sep 2026 21:47:18 +0200
Message-Id: <178898323844.67740.9621915831851570155.b4-review@b4>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=NizfhVOT/VvA2dUqB5NXjYFEK1DkfSANyvy3gAhNVwY=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqobfJ9BgDh91qnjAMpDNJucGv2ZXrlzPMYRjE7
 rNCrcRJCh2JAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCaqG3yQAKCRAHUgpwFiYS
 aZqOD/4sUOM2BAG5AdjrKij8kvmIBpqDDZ5E3rDYx/anFXwzCclat3h8vQwYItxXJ7fCEPjKQGr
 cDNy+7qBJY7uJ3ZKmcexTphtdfYupo20JRAZOFtsiP7x2gFJ0b4IIdoAMl4pd1PPQrAxkQ9W7/i
 blU9LungzgMmgQYrrnRs05DYz1+ZDOl6bG8oGb/EYjgw0kWHjc5bZTAur62d/ifmJJvQPkj55oc
 IS8ErGY8wxkBebMDMAFPhGA8GkcQ2TRffMmx2F/wUV6pIynpSlnmEVo8saZSUXAihCjTzieorK8
 XjNUssKIEUuOX0uYPjototEvLbfOv9dSVDTyLuX6Zij+X/3ASSRaxeEUyZyWVO0BEWfSvNG6q8V
 BPxXmdhq/KVyWyECZvekZe9Gqljcz2nEuaOpBCIB8HeeIsorSBDO+5+YPIG2cYoTfMkQeorT+ym
 kNCOhNKtY73TpuvviFSIrY1Elmf8A7A4EyFxjOEG6c/OtkdBMQxsD1qbUdrsHPekrwy6mPL7AYR
 ztWhiBZNfY9m3q2JSqljpgnntGUSUR3D/waRev+SuSgugkwOvEx1LB/QcBydMNEylydptY7b03m
 i463GkNGNWhgKZATvqr3lxYskg1t2yDQ+Bjd6S8XWmVzEaNMGfDi+jySiHpHX8jl3+NBuRoOceG
 AyVga/GJBPqKQTA==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F
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
> 
> Fix the pattern.
> 
> Fixes: 3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")
> 
> No measurable change in build time, the smaller tables are not on any path
> the build waits for.
> 

For consistency, it would be nice to have the 'Fixes:' trailer at the
beginning of the trailer block (that is: here.)

> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> diff --git a/scripts/mksysmap b/scripts/mksysmap
> index c4531eacde20..56a8b8bbdb37 100755
> --- a/scripts/mksysmap
> +++ b/scripts/mksysmap
> @@ -83,7 +83,7 @@
>  / _SDA2_BASE_$/d
>  
>  # MODULE_INFO()
> -/ __UNIQUE_ID_modinfo[0-9]*$/d
> +/ __UNIQUE_ID_modinfo_[0-9]*$/d
>  
>  # ---------------------------------------------------------------------------
>  # Ignored patterns

Thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
