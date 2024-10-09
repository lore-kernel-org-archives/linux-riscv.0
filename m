Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221FDCED61E
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 07:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LWMLMl5A/wv7T8LItKBTxMJPQxzW24kToy5QWm1d7Y8=; b=rFfranda22i920
	t4jzmCHgBeaY7Cv6Yn/XTnvQl8ku26qjoh4EwqqZnCm+fYwDeyzpmI/EgmGUbTxm8OGpvcTIIHfP0
	b/wNQtVO3j59DOifedqs2ixSyDt89VFmjrUUm2MZRj69TDNPiQ5fp71fJExnixArrYZBZNMiLprym
	9aUttzki9TDflR/A4u7w7i+HqarU4HMykIbr4JBoBG8CZudDlAEQbpL5akYiy+iVILnL5BaX6Jdzs
	WwkxdGQoN6mirKvhTJoSa10WXJAGLVjjHSmvwLoIwfMPwos0xiVUq1soVjnaDWfdWYfRrrgaleALK
	VaTkNg+PZGNwMT31R8dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syRYh-00000008KYb-1Iia;
	Wed, 09 Oct 2024 07:56:35 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syRPE-00000008IpT-0Jwx
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 07:46:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 995451C0002;
	Wed,  9 Oct 2024 07:46:42 +0000 (UTC)
Message-ID: <250e1e5d-5110-414f-abbd-fb002e715f32@ghiti.fr>
Date: Wed, 9 Oct 2024 09:46:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] RISC-V: disallow gcc + rust builds
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Jason Montleon <jmontleo@redhat.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
References: <20241001-playlist-deceiving-16ece2f440f5@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241001-playlist-deceiving-16ece2f440f5@spud>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_004648_729269_A3C77747 
X-CRM114-Status: GOOD (  16.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Conor,

On 01/10/2024 13:28, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> During the discussion before supporting rust on riscv, it was decided
> not to support gcc yet, due to differences in extension handling
> compared to llvm (only the version of libclang matching the c compiler
> is supported). Recently Jason Montleon reported [1] that building with
> gcc caused build issues, due to unsupported arguments being passed to
> libclang. After some discussion between myself and Miguel


I have just added "[2]" here as it seemed to be missing.

Thanks,

Alex


> , it is better
> to disable gcc + rust builds to match the original intent, and
> subsequently support it when an appropriate set of extensions can be
> deduced from the version of libclang.
>
> Closes: https://lore.kernel.org/all/20240917000848.720765-2-jmontleo@redhat.com/ [1]
> Link: https://lore.kernel.org/all/20240926-battering-revolt-6c6a7827413e@spud/ [2]
> Fixes: 70a57b247251a ("RISC-V: enable building 64-bit kernels with rust support")
> Reported-by: Jason Montleon <jmontleo@redhat.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>
> Palmer, this is yours to take.
>
> CC: jmontleo@redhat.com
> CC: ojeda@kernel.org
> CC: alex.gaynor@gmail.com
> CC: boqun.feng@gmail.com
> CC: gary@garyguo.net
> CC: bjorn3_gh@protonmail.com
> CC: benno.lossin@proton.me
> CC: a.hindborg@kernel.org
> CC: aliceryhl@google.com
> CC: paul.walmsley@sifive.com
> CC: palmer@dabbelt.com
> CC: nathan@kernel.org
> CC: ndesaulniers@google.com
> CC: morbo@google.com
> CC: justinstitt@google.com
> CC: rust-for-linux@vger.kernel.org
> CC: linux-riscv@lists.infradead.org
> CC: llvm@lists.linux.dev
> ---
>   Documentation/rust/arch-support.rst | 2 +-
>   arch/riscv/Kconfig                  | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
> index 750ff371570a0..54be7ddf3e57a 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -17,7 +17,7 @@ Architecture   Level of support  Constraints
>   =============  ================  ==============================================
>   ``arm64``      Maintained        Little Endian only.
>   ``loongarch``  Maintained        \-
> -``riscv``      Maintained        ``riscv64`` only.
> +``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
>   ``um``         Maintained        \-
>   ``x86``        Maintained        ``x86_64`` only.
>   =============  ================  ==============================================
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 22dc5ea4196ce..76843584960c2 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -177,7 +177,7 @@ config RISCV
>   	select HAVE_REGS_AND_STACK_ACCESS_API
>   	select HAVE_RETHOOK if !XIP_KERNEL
>   	select HAVE_RSEQ
> -	select HAVE_RUST if RUSTC_SUPPORTS_RISCV
> +	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG
>   	select HAVE_SAMPLE_FTRACE_DIRECT
>   	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
>   	select HAVE_STACKPROTECTOR

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
