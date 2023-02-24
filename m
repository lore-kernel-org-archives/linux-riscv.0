Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D521C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 14:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXlzMVwlfncrm2LCdAe7+H7vPgvcR2IbqgZjvM0qGb4=; b=QodcHQIKHaU7ms
	V6Aq9VMXvaXf4snXxmb42pGhiLjYele5vxMxLJVP+h3AkvBRDwwiaEdPjMl6XyOS+2171zhLvv2bp
	LKEVAMU78A2brc4e7MaJijsbX6YzSmBt0o5/FabY3e73Qp8d5ylKxAEDu7FfF5N9ujW+ChZ7eR3sr
	1UwLcwMMrmWcU8dyU96wS2AQCoFm3NTEeadQ3RnMN1Zs+DICvGY47TFX3h6hRG+pSDDWC89z7i7fU
	ELMZKpp4GFxpmCulof9AJQZ/o5jn7svErzFzQA5Pt6qyE1llIXejdCpwomtqyeZFKojtPSo6d2skb
	ZD29WIvboDcctOyaHHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZVh-002pMf-Nf; Fri, 24 Feb 2023 14:57:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZVf-002pLr-IP
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 14:57:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1111F618EA;
	Fri, 24 Feb 2023 14:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D587C433EF;
	Fri, 24 Feb 2023 14:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677250636;
	bh=BX7ubvR3+x0sfXaoE8k2EQZkDXcr72I1hlLKxFfUneM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LeQAyzUcx24i3ueMY7iYVCIa0WNjPNOdR2O9fKOX1Zw2ZioO/R0gDk8e4oc8g1Cvj
	 FxSMJc0ZD84wdrZMaGSJHxOEhX2i0A3F1/CzWSIf0EpCEP7LoqN2Bq2I2hLN9xyH4Z
	 S0rbr3SZAFB8DuO+TiQON/aD0nYjHLe6jn2JQZaEvlcf3XLSipn96yH68a+vD3ViXb
	 QXOSRBREy4zXA1dbb+bpYd4pXYyDOmGJ+E0il+5z6x3VKBm0E0rsWkX8ivUqz9lJRR
	 HFf0ngDbQYWzhbSk6ovc9LY+bnVvtNoRsPmb1TVo2pCiTab1TKvAejr4+H/pD7zJEn
	 QkfMmKNjAIHhA==
Date: Fri, 24 Feb 2023 07:57:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [RFC RESEND 2/2] RISC-V: enable building the 64-bit kernels with
 rust support
Message-ID: <Y/jQSUpXH5XwQTqg@dev-arch.thelio-3990X>
References: <20230224135044.2882109-1-conor.dooley@microchip.com>
 <20230224135044.2882109-3-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230224135044.2882109-3-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_065719_723657_E56A6919 
X-CRM114-Status: GOOD (  19.23  )
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

Hi Conor,

On Fri, Feb 24, 2023 at 01:50:44PM +0000, Conor Dooley wrote:
> From: Miguel Ojeda <ojeda@kernel.org>
> 
> The rust modules work on 64-bit RISC-V, with no twiddling required.
> Select HAS_RUST and provide the required flags to kbuild so that the
> modules can be used.
> 32-bit is broken in core rust code, so support is limited to 64-bit
> only: ld.lld: error: undefined symbol: __udivdi3
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/rust/arch-support.rst | 2 ++
>  arch/riscv/Kconfig                  | 1 +
>  arch/riscv/Makefile                 | 3 ++-
>  3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
> index 6982b63775da..197919158596 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -15,5 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
>  ============  ================  ==============================================
>  Architecture  Level of support  Constraints
>  ============  ================  ==============================================
> +``riscv``     Maintained        ``rv64`` only.
> +============  ================  ==============================================
>  ``x86``       Maintained        ``x86_64`` only.
>  ============  ================  ==============================================
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 81eb031887d2..73174157212d 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -115,6 +115,7 @@ config RISCV
>  	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_RSEQ
> +	select HAVE_RUST if 64BIT

Just a small drive by comment, you have 'if 64BIT' here...

>  	select HAVE_STACKPROTECTOR
>  	select HAVE_SYSCALL_TRACEPOINTS
>  	select IRQ_DOMAIN
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 76989561566b..0d6fc4e25221 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -29,8 +29,8 @@ ifeq ($(CONFIG_ARCH_RV64I),y)
>  
>  	KBUILD_CFLAGS += -mabi=lp64
>  	KBUILD_AFLAGS += -mabi=lp64
> -
>  	KBUILD_LDFLAGS += -melf64lriscv
> +	KBUILD_RUSTFLAGS += -Ctarget-cpu=generic-rv64
>  else
>  	BITS := 32
>  	UTS_MACHINE := riscv32
> @@ -38,6 +38,7 @@ else
>  	KBUILD_CFLAGS += -mabi=ilp32
>  	KBUILD_AFLAGS += -mabi=ilp32
>  	KBUILD_LDFLAGS += -melf32lriscv
> +	KBUILD_RUSTFLAGS += -Ctarget-cpu=generic-rv32

but also add KBUILD_RUSTFLAGS for the !64BIT case. Seems like one of
those can be removed.

>  endif
>  
>  ifeq ($(CONFIG_LD_IS_LLD),y)
> -- 
> 2.39.2
> 

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
