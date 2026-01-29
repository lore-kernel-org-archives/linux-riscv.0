Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42441D73E87
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 22:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yKMMmCcFfGpTMVq5FCgZ3AYmcLuYem7LCaeic1H+fTA=; b=rfD/MCCOABUB1E
	Po+3JF5tjZKZwDFEkw1TRvv+wEjjGlmTHvOfEXfaHRlbx1tl/prw5GXmlsLDF1CMOPB7yDmwp+zuv
	Lt0lPqUv4kJgML6hGoNn8nNpcIp52O0qTLeYMLlGcSu5M0pzkig4Uz53tjCoe4fiycnIhDWxxIcGA
	Du2U0d9AiSOkTxh7tmRNXan/+WxxnZA5VO1rkC1BMrjD5mDuwxMYBjo9iV7JXrx20Yak7PanckvDt
	5y2N4oR7an9e9wzcggylZfof9tNz/AwkNgEY8m6Z8scC2HEip9HjlDwuxB0tfA1067/nH9cxqh4r7
	aqCRTpLzl0WZ+RG7qGtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlahd-00000000kkc-2pkJ;
	Thu, 29 Jan 2026 22:41:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlahb-00000000kjk-3Cfg
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 22:41:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04DBE44377;
	Thu, 29 Jan 2026 22:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E11C4CEF7;
	Thu, 29 Jan 2026 22:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769726486;
	bh=0Cgvwko1h1R9ooOUPVRWvfyKzy4YXcZJFJeK7aS3gGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TjQySNhEktK8AivnEQwrXUmQquAClQmbacRI5eShSk3gBiLELRT/J9iUCcCVmtmov
	 YB0pVrvh9WDq2fXWvXWnd8hR9HOCGciPGhKTN/VzQ0Zybx2wzUuWdoNm1KocMbzzkD
	 bEUZOkSfqS8eDTPDVAfSp5ezGNY20RrDR/YjnM+R8qKqXxCCV5eFC3perOqeKASXti
	 axhfmyKuQzFZYNMbMVR5r5bwC0VEsX3yZDnn95lOlLy3j7zzTLLjwd3fAakqOi06is
	 GuQpGCbwKdsWKY1BS7Rflr521ZyFgiHpZH/FNOiSl4zvqIbZJtUg/Hk0p8pWIixicY
	 kGEOfRtf2blBg==
Date: Thu, 29 Jan 2026 15:41:18 -0700
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
Subject: Re: [PATCH v6 3/4] rust: add a Kconfig function to test for support
 of bindgen options
Message-ID: <20260129224118.GC844102@ax162>
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
 <20251230-gcc-rust-v5-v6-3-2ac86ba728c8@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251230-gcc-rust-v5-v6-3-2ac86ba728c8@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_144127_849500_E995ADCA 
X-CRM114-Status: GOOD (  14.63  )
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

On Tue, Dec 30, 2025 at 05:47:56PM +0100, Asuna Yang wrote:
> Add a new `bindgen-backend-option` Kconfig function to test whether the
> bindgen backend supports a given flag.
> 
> A subsequent commit will use this function to test for RISC-V extension
> flags.
> 
> Signed-off-by: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
> ---

Acked-by: Nathan Chancellor <nathan@kernel.org>

>  scripts/Kconfig.include | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index d42042b6c9e2..9954b8093fab 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -78,3 +78,8 @@ rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
>  # If you are testing for unstable features, consider testing RUSTC_VERSION
>  # instead, as features may have different completeness while available.
>  rustc-option = $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(RUSTC) $(1) --crate-type=rlib /dev/null --out-dir=.tmp_$$ -o .tmp_$$/tmp.rlib)
> +
> +# $(bindgen-backend-option,<flag>)
> +# Return y if bindgen backend supports <flag>, n otherwise
> +# For now, the backend refers only to libclang, so more specifically, this function tests whether the given flag is recognized by the libclang used by bindgen.
> +bindgen-backend-option = $(success,$(BINDGEN) /dev/null -- -x c --target=$(BINDGEN_TARGET) $(1))
> 
> -- 
> 2.51.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
