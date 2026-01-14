Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFB6D30CF2
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 00:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MtEP1OcFxpRUBOu0/bGl6hGZnzUsMvDJv05VWdcJ46I=; b=V0OwSvv/xVEfeF
	n17l/7OTD22/trqVDDWAoVycmmlsjpGfNR7a34h3bKDttUaOsgRb7bMdrUDgZhXuZV4mEVVv+8nAN
	a0ZgEPjS4l6dJPANIvDX9MGk+kTQAO7QJqWyFKQ/RudeDHLiTbVjgMBSyyr6WUPulYIt6uKErc+fu
	2XHQA8XFzV2o+v+FBkhbR/TT4jbecsivLJXy1wdEZuAgUnaXdVdHcdumfDXEpi6NBzqeQR2FXUIe9
	T4GaC9Gfd9y8ditQc9iNoPVQlYgJzWVHZdPolxBI6agGHF5GVyVYHWLfITrwkhyLzjCn2R8n/KKj2
	S7ipZMaCQCj4G0rNlVgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfoKk-00000007t9w-35RJ;
	Wed, 14 Jan 2026 00:01:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfoKi-00000007t9b-03J9
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 00:01:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BBC8A4177F;
	Wed, 14 Jan 2026 00:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254C0C116C6;
	Wed, 14 Jan 2026 00:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768348914;
	bh=W4YTayVf5TSDAo17cT/laWi8gi0U4yzOg65DXbHoELs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ahdkftaFqK4uMfGQdz/e2IHOoadYaTllC2J5d9XW8nQ1p3xYdPdQL6zj56xTNqfCL
	 j5DuRiACpVcwieg2H0K2Cm53iU9WFhdFrYRnwkNQ+RfPwHWFPLDXsuwfUoUqpGjmYR
	 xPTxEWPM9a6W1vkPt5NS7NFomqBhSrnp1r4FEU7IOLdMqEXjTOVitHarLpgCI9I+Gq
	 AeHqSEatU5Gx9zrTjfOTavEpB4Gy3qlvUe8iVOBXOt68yFC4JR1pwVB6AiuXU1ANvb
	 377JEOoXpUHs5ZXvY1J49dhF1c+upxhHZSC7Hpw1nHEs0WqrNcuwGTGYA5c4sR7VyC
	 vYhD0Vro8LMZQ==
Date: Tue, 13 Jan 2026 16:01:51 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, kees@kernel.org, andy@kernel.org,
	akpm@linux-foundation.org, martin.petersen@oracle.com,
	ardb@kernel.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, samuel.holland@sifive.com,
	linus.walleij@linaro.org, nathan@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 01/14] lib/string: extract generic strlen() into
 __generic_strlen()
Message-ID: <20260114000151.GB2178@quark>
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
 <20260113082748.250916-2-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113082748.250916-2-jiangfeng@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_160156_092657_DB134EFE 
X-CRM114-Status: GOOD (  19.86  )
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

On Tue, Jan 13, 2026 at 04:27:35PM +0800, Feng Jiang wrote:
> To support performance benchmarking in KUnit tests, extract the
> generic C implementation of strlen() into a standalone function
> __generic_strlen(). This allows tests to compare architecture-optimized
> versions against the generic baseline without duplicating code.
> 
> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
> ---
>  include/linux/string.h |  1 +
>  lib/string.c           | 10 ++++++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/string.h b/include/linux/string.h
> index 1b564c36d721..961645633b4d 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -197,6 +197,7 @@ extern char * strstr(const char *, const char *);
>  #ifndef __HAVE_ARCH_STRNSTR
>  extern char * strnstr(const char *, const char *, size_t);
>  #endif
> +extern __kernel_size_t __generic_strlen(const char *);
>  #ifndef __HAVE_ARCH_STRLEN
>  extern __kernel_size_t strlen(const char *);
>  #endif
> diff --git a/lib/string.c b/lib/string.c
> index b632c71df1a5..047ecb38e09b 100644
> --- a/lib/string.c
> +++ b/lib/string.c
> @@ -412,8 +412,7 @@ char *strnchr(const char *s, size_t count, int c)
>  EXPORT_SYMBOL(strnchr);
>  #endif
>  
> -#ifndef __HAVE_ARCH_STRLEN
> -size_t strlen(const char *s)
> +size_t __generic_strlen(const char *s)
>  {
>  	const char *sc;
>  
> @@ -421,6 +420,13 @@ size_t strlen(const char *s)
>  		/* nothing */;
>  	return sc - s;
>  }
> +EXPORT_SYMBOL(__generic_strlen);
> +
> +#ifndef __HAVE_ARCH_STRLEN
> +size_t strlen(const char *s)
> +{
> +	return __generic_strlen(s);
> +}
>  EXPORT_SYMBOL(strlen);

A similar problem exists with the architecture-optimized CRC and crypto
functions.  Historically, these subsystems exported both generic and
architecture-optimized functions.

We've actually been moving away from that design to simplify things.
For example, for CRC-32C there's now just the crc32c() function which
delegates to the "best" CRC-32C implementation, with no direct access to
the generic implementation of CRC-32C.

crc_kunit then just tests and benchmarks crc32c().  To check how the
performance of crc32c() changes when its implementation changes (whether
the change is the addition of an arch-optimized implementation or a
change in an existing arch-optimized implementation), the developer just
needs to run crc_kunit with two kernels, before and after.

I suggest just doing that.  In that case there would be no need to
export the generic implementations of these functions.

(Also note that *if* the generic functions are exported, they probably
should be exported only when the KUnit test is enabled.  There's no need
to include them in the kernel image when the test isn't enabled.)

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
