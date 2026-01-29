Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD53D73EA8
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 23:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GVXrEas6ZGuzYrT/Cf9Bi8aLbQRBw6XolHpua7rh5u0=; b=AA97gxfBQu5wl/
	rA6GXr5KFzEaGhcPQ1RhGVxyF2EKG9B4Rn0EYOJ9GGiwkuVd+g3+Pnu9nmsbYN9oQslu4yCKr+awp
	YQKLT0CYCOcPWLbizrO/5NVqMp89nDHeVvRCDCd4+1BOWtbzXBmZ4T2S7n/7fgmZW99Wyh0Y/O7wG
	/db8JQXNtyiuB3j7Ixehpt0dTUeVIUMBDAop5YMK2/KyWuyPjib2FgShluqWBwf4nmVQZQoUOcyc+
	n1zlCRqFfLfaPlZtH6ex3ps8qau7EAZh9q5P+OAndWw2aBolIQvteFraC47bzbYQCCOqAKScQZTCV
	otmEt1BdZBRB0o6NMyIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlbOU-00000000mVH-1pA2;
	Thu, 29 Jan 2026 23:25:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlbOS-00000000mUw-2H1W
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 23:25:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6D544419E;
	Thu, 29 Jan 2026 23:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C9AC4CEF7;
	Thu, 29 Jan 2026 23:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769729143;
	bh=3+xik+/x6pFcQMFxG5QqN5mR1gL6yX1jrYgnP2VQ1dA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LgXJgQCduBviX6Pf5XMfcb9aW6ykHIkhl0Z6Zjlkw96jyKTrpGQwQA8tuDCuq6bmL
	 rZ9RavnLNAyBE2rnhO1yAIoE7K0XaC3jPEBLk6gqw2A9HkBV1oZ7x/hijwzaR5urQE
	 qVwBpVXIp00grEZzG0WdscxJ+dtgADy1weesMNqVq2q07mYMrMScyQzvoBYt1FbVQK
	 tb/MuuVq58SjwOeMt+nsTJRB+V/oAeYWkZpxwgM4xegcVT4tQIftjzWCtRqC/0Aj7b
	 Eqn2khyMx/cJdgbqR3TWoXRiRKLOywiAQETfK/IPsskVw3VSiw9tz2rE2cSS9vyR9n
	 6QCROt0qaTMfQ==
Date: Thu, 29 Jan 2026 16:25:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Charalampos Mitrodimas <charmitro@posteo.net>
Cc: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>,
	Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor@kernel.org>,
	Mingcong Bai <jeffbai@aosc.io>, Han Gao <rabenda.cn@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Jason Montleon <jmontleo@redhat.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 4/4] RISC-V: handle extension configs for bindgen,
 re-enable gcc + rust builds
Message-ID: <20260129232535.GD844102@ax162>
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
 <20251230-gcc-rust-v5-v6-4-2ac86ba728c8@isrc.iscas.ac.cn>
 <87v7gk8r5x.fsf@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87v7gk8r5x.fsf@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_152544_623602_B2AA1B92 
X-CRM114-Status: GOOD (  13.10  )
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

On Thu, Jan 29, 2026 at 01:49:56PM +0000, Charalampos Mitrodimas wrote:
> I'm under the impression that the `!RUST ||` guard here doesn't
> actually prevent the `$(bindgen-backend-option,...)` call from being
> executed. `$(...)` shell expansions should happen during the textual
> substitution phase, before symbol dependency evaluation occurs, check
> documentation at kconfig-macro-language.rst lines 228-229.
> 
> I did this test:
>   $ cat /tmp/fake_bindgen
>     #!/bin/bash
>     echo "[BINDGEN INVOKED] $(date '+%H:%M:%S') args: $@" >> /tmp/bindgen_calls.log
>     # Call real bindgen
>     exec /home/charmitro/.cargo/bin/bindgen "$@"
> 
>   $ make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- BINDGEN=/tmp/fake_bindgen defconfig
>     HOSTCC  scripts/basic/fixdep
>     ...
>   *** Default configuration is based on 'defconfig'
>   #
>   # configuration written to .config
>   #
> 
>   $ linux git:(master) rg CONFIG_RUST .config
>   ...
>   283:# CONFIG_RUST is not set
>   ...
> 
>   $ cat /tmp/bindgen_calls.log
>   [BINDGEN INVOKED] 15:44:44 args: --version workaround-for-0.69.0
>   [BINDGEN INVOKED] 15:44:44 args: ./scripts/rust_is_available_bindgen_libclang.h
>   [BINDGEN INVOKED] 15:44:44 args: --version workaround-for-0.69.0
>   [BINDGEN INVOKED] 15:44:44 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64imv
>   [BINDGEN INVOKED] 15:44:44 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32imv
>   [BINDGEN INVOKED] 15:44:44 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zabha
>   [BINDGEN INVOKED] 15:44:44 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zabha
>   [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zacas
>   [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zacas
>   [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zbb
>   [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zbb
>   [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zba
>   [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zba
>   [BINDGEN INVOKED] 15:44:45 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zbc
>   [BINDGEN INVOKED] 15:44:46 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zbc
>   [BINDGEN INVOKED] 15:44:46 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zbkb
>   [BINDGEN INVOKED] 15:44:46 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zbkb
>   [BINDGEN INVOKED] 15:44:46 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=lp64 -march=rv64ima_zicsr_zifencei
>   [BINDGEN INVOKED] 15:44:46 args: /dev/null -- -x c --target=riscv64-linux-gnu -mabi=ilp32 -march=rv32ima_zicsr_zifencei
> 
> So, CONFIG_RUST not set, yet bindgen was invoked. Not sure if that is
> intentional though.

While I have only recently adopted Kconfig, the section you pointed to
in kconfig-macro-language.rst makes it seem like this is expected. I
read that to mean all shell commands are going to be evaluated and
effectively turned into "y" and "n" before dependencies are evaluated.
You can test this with something like:

if RUST

config RUST_FOOBAR
    def_bool $(bindgen-backend-option,-obviously-not-supported)

endif

added in init/Kconfig and running your fake bindgen.

While this is obviously a little wasteful, I suspect this drastically
simplifies the shell commands part of Kconfig for no change in runtime
behavior.  The way that the dependency is currently written ensures that
either the result of bindgen-backend-option matters for the sake of
saying an extension is fully supported by the toolchain (when Rust is
enabled) or it does not matter (because Rust is not enabled).

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
