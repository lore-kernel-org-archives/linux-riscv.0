Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E96CD73E87
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 22:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jc+W+e6idyKs4zkhNyc+/2yyEfyoag5MSQnALjIuTFg=; b=eK4hUWe68RoljC
	UlmOZJP2CXToBq7n1ix5UpJ0K5RQxeQ0pUCgDgsNDI9JP9g2Gxup/BI2cF7exuObTEwzNrzKaumuL
	6AyKEWETCx72VZaLQVKfCJRO4D4uXaqh5uOlzl0HfvtEyxLukmZvpUtHCVmsaeFbXEnrhLgs5T0tO
	dMB/utBhjAvB3EYBLZaB+tWqyNkf0sAZxOYaAORbWNVgLk7YnAHwpQWTwDAO4FQndbclLpdacx67y
	zX4g7Q9HD1mfk58yA7tlphOkq8j/i3fX4KpbMAj0G29K8kfgQURpZNT/GkgurwpqS7rNsfkO3G/uW
	ojbU4oRTERLbEEiLeW4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlac4-00000000k8R-0ehA;
	Thu, 29 Jan 2026 22:35:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlac1-00000000k7v-2dVO
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 22:35:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EA8DD41682;
	Thu, 29 Jan 2026 22:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76475C4CEF7;
	Thu, 29 Jan 2026 22:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769726138;
	bh=UkNX32KZtTbiUWsoCAvLwtloIiF3hbhWHYIeoQpDme8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k09VX/toJdFybVhpIQRAo1f8y9CbBEYErGzzsMQjRzVbSqvNBcSEBAVY8oPUivtXX
	 eopkMR1CT43PMYuUpbsjZMN3YVmv7zqh5JkSq4BOVI80zjWQORYC7tLqj0m79kS8IS
	 SzNVpo0JtqO2mLkbucoyiQUqAf+oKRagkGxOsaQM/EmF/5r19t1wc8ZiEjoDFO4MDr
	 Et19cFV2FQoGPxFYsm/v7jsdJtr92j3dJuhva40AFYk1ksrIj3yDj+tChSZWx97B9R
	 gv9yqQfF/lEwYGy4KjUPSoLy5uY1HLwj9WqcCv9Bo+HiegXEmV+6ZRPHA2WrjnlZU/
	 X2X+fxmCsMGAg==
Date: Thu, 29 Jan 2026 15:35:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
Cc: Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
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
Subject: Re: [PATCH v6 1/4] rust: export BINDGEN_TARGET from a separate
 Makefile
Message-ID: <20260129223528.GA844102@ax162>
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
 <20251230-gcc-rust-v5-v6-1-2ac86ba728c8@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251230-gcc-rust-v5-v6-1-2ac86ba728c8@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_143541_710252_27A0995B 
X-CRM114-Status: GOOD (  23.07  )
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

On Tue, Dec 30, 2025 at 05:47:54PM +0100, Asuna Yang wrote:
> A subsequent commit will add a new function `bindgen-option` to
> `scripts/Kconfig.include`. The bindgen backend requires the `--target`
> option for cross compiling, but variable `BINDGEN_TARGET` in
> `rust/Makefile` cannot be exported to `scripts/Kconfig.include`.
> 
> Therefore, move this variable to a separate new `Makefile.rust` file and
> include it from `scripts/Makefile` to make the exported variable
> available for use in Kconfig. Place the include in the `need-compiler`
> branch to avoid including it in irrelevant make targets.
> 
> Since the new file name is `Makefile.rust`, it matches an existing
> MAINTAINERS rule `scripts/*rust*`, so no modification to the MAINTAINERS
> file is needed.
> 
> Signed-off-by: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>

Acked-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Makefile              | 3 ++-
>  rust/Makefile         | 8 --------
>  scripts/Makefile.rust | 9 +++++++++
>  3 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 27ce077520fe..9754d7add947 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -718,9 +718,10 @@ ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
>  include $(srctree)/scripts/Makefile.clang
>  endif
>  
> +ifdef need-compiler
> +include $(srctree)/scripts/Makefile.rust
>  # Include this also for config targets because some architectures need
>  # cc-cross-prefix to determine CROSS_COMPILE.
> -ifdef need-compiler
>  include $(srctree)/scripts/Makefile.compiler

Not that it is a big deal but it would make the diff simpler if the Rust
makefile was added after the compiler one, both for alphabetical reasons
and it would not necessitate moving the comment (even if it mostly
applies just to the compiler include).

>  endif
>  
> diff --git a/rust/Makefile b/rust/Makefile
> index 5d357dce1704..2603b34f9833 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -385,14 +385,6 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
>  	-fzero-init-padding-bits=% -mno-fdpic \
>  	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
>  
> -# Derived from `scripts/Makefile.clang`.
> -BINDGEN_TARGET_x86	:= x86_64-linux-gnu
> -BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
> -BINDGEN_TARGET_arm	:= arm-linux-gnueabi
> -BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
> -BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
> -BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
> -
>  # All warnings are inhibited since GCC builds are very experimental,
>  # many GCC warnings are not supported by Clang, they may only appear in
>  # some configurations, with new GCC versions, etc.
> diff --git a/scripts/Makefile.rust b/scripts/Makefile.rust
> new file mode 100644
> index 000000000000..5c12b4b8c8b6
> --- /dev/null
> +++ b/scripts/Makefile.rust
> @@ -0,0 +1,9 @@
> +# Derived from `scripts/Makefile.clang`.
> +BINDGEN_TARGET_x86	:= x86_64-linux-gnu
> +BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
> +BINDGEN_TARGET_arm	:= arm-linux-gnueabi
> +BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
> +BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
> +BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
> +
> +export BINDGEN_TARGET
> 
> -- 
> 2.51.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
