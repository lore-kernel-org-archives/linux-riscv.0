Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580DECCD184
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Oct 2025 06:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mIBWza8k4hVag4Ndx1TX/dAyGmbtiqJoH7jlA3gWwoE=; b=i48igoegaqH3nv
	HevzwK6JZiMMaiqpqM5NYWfKmIC+zI2r39X6HI5+53leLfOaWlxpGOQWHI8T0BvLp0sa3orbqyooR
	9BKJ7tGJNQuS8XfyjtdcED2TYgCs+J6SuoJl6luViwVj1thVwDKcO2cfDXFNLCyzDHgshNlB6HeE8
	3SXCG9wQuznVsQz49IC9tcOGn+NnJSQyykSOYLRwJ+DBFoCSGPrQSBGr79Se+8/mxfdCi1vWMNY+c
	u9ehYXjwFVJpZ1CBEP48Y5RnNcVmFNh4hZaQIGugBuMTE80OaPKVeh0aPyRGnr6K1YeNxTwW3d+GG
	MZLhQgBj1lmUAUOBvrGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vANFk-0000000AlF0-3VKg;
	Sun, 19 Oct 2025 06:50:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vANFi-0000000AlDE-0ICZ
	for linux-riscv@lists.infradead.org;
	Sun, 19 Oct 2025 06:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A755140A5D;
	Sun, 19 Oct 2025 06:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F25C4CEE7;
	Sun, 19 Oct 2025 06:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760856630;
	bh=EdgpjTa5vPTpdpYEzLk3B3e9bf5d6qYFWAfS+EwNqnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cl0KoSN24WldfEYSRSfu5lozmGJAVE9xioGE6C+PBBseYSuE/7hgf2KbKvxu1nAfq
	 +AnxTaK9VaE7xdn62r2Zk9oFnNMs7lSpecdggsfr9Z5mfbyraggVUnrWZwla30ASHd
	 TTQUKVBXbjDXmyKfOdXMojvKQKorenot/jpefXad8wpoUyJQ/gWBwcSUSTx6MlFUkq
	 O4BqR0RMnSAfMnvUpkN7wKJhQIsaUmfqwAekVS20NwyN/940rzzKb69Mu6Ni7vQrxn
	 4PzVEO7y+ixH5H5iambi/6vum/20jOqyGoZB3A2tTRPyBtt8DjbzWrov4g4xwvEbN2
	 ljhF5KLlm27vA==
Date: Sun, 19 Oct 2025 02:50:21 -0400
From: Guo Ren <guoren@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 03/17] csky: Add __attribute_const__ to ffs()-family
 implementations
Message-ID: <aPSKLRnWUAVSGQjF@gmail.com>
References: <20250804163910.work.929-kees@kernel.org>
 <20250804164417.1612371-3-kees@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250804164417.1612371-3-kees@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_235050_170008_68D53364 
X-CRM114-Status: GOOD (  18.28  )
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

On Mon, Aug 04, 2025 at 09:43:59AM -0700, Kees Cook wrote:
> While tracking down a problem where constant expressions used by
> BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
> initializer was convincing the compiler that it couldn't track the state
> of the prior statically initialized value. Tracing this down found that
> ffs() was used in the initializer macro, but since it wasn't marked with
> __attribute__const__, the compiler had to assume the function might
> change variable states as a side-effect (which is not true for ffs(),
> which provides deterministic math results).
> 
> Add missing __attribute_const__ annotations to C-SKY's implementations of
> ffs(), __ffs(), fls(), and __fls() functions. These are pure mathematical
> functions that always return the same result for the same input with no
> side effects, making them eligible for compiler optimization.
LGTM.

Acked-by: Guo Ren <guoren@kernel.org>

> 
> Build tested ARCH=csky defconfig with GCC csky-linux 15.1.0.
> 
> Link: https://github.com/KSPP/linux/issues/364 [1]
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
>  arch/csky/include/asm/bitops.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/csky/include/asm/bitops.h b/arch/csky/include/asm/bitops.h
> index 72e1b2aa29a0..80d67eee6e86 100644
> --- a/arch/csky/include/asm/bitops.h
> +++ b/arch/csky/include/asm/bitops.h
> @@ -9,7 +9,7 @@
>  /*
>   * asm-generic/bitops/ffs.h
>   */
> -static inline int ffs(int x)
> +static inline __attribute_const__ int ffs(int x)
>  {
>  	if (!x)
>  		return 0;
> @@ -26,7 +26,7 @@ static inline int ffs(int x)
>  /*
>   * asm-generic/bitops/__ffs.h
>   */
> -static __always_inline unsigned long __ffs(unsigned long x)
> +static __always_inline __attribute_const__ unsigned long __ffs(unsigned long x)
>  {
>  	asm volatile (
>  		"brev %0\n"
> @@ -39,7 +39,7 @@ static __always_inline unsigned long __ffs(unsigned long x)
>  /*
>   * asm-generic/bitops/fls.h
>   */
> -static __always_inline int fls(unsigned int x)
> +static __always_inline __attribute_const__ int fls(unsigned int x)
>  {
>  	asm volatile(
>  		"ff1 %0\n"
> @@ -52,7 +52,7 @@ static __always_inline int fls(unsigned int x)
>  /*
>   * asm-generic/bitops/__fls.h
>   */
> -static __always_inline unsigned long __fls(unsigned long x)
> +static __always_inline __attribute_const__ unsigned long __fls(unsigned long x)
>  {
>  	return fls(x) - 1;
>  }
> -- 
> 2.34.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
