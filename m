Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C29C369C9
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 17:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7ol91qCJfqPD2xclGIw+YDIp2pRH9Uci/lDAKYLOvA=; b=x66UaA+HGNJNEk
	AnnFyAfaeaQwICdr9NDvRFxI1tc6TV64gVivoH3DgQuxUDxhkgSzAbZH8EbXGe47Ckxb9DKTIlyBt
	xf38EZdIDfUqNbDFMAXgnyH2LSGwS+kZPFRHh3aTCrIiiY8TfOfMSlw8G4SReu3vaIVPZcqakgMsR
	b9IfCOOP2q62e8FY/cC/3l5bYpoC+trQhKIBsqadsrH4UIQ3Xd/wTIWZQHeoK9I+uRJ0cXFeeCMx+
	617pQkc2Q3elASsIGu0tMzM8GCrJe+86M+019FayWD3ERkAVB3QEY60AVu4MDEQYKzlmQq1wikIJM
	mRThnWvh+QPL3C+t+dBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SvP-0000000DpKX-01v1;
	Thu, 17 Apr 2025 17:21:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Sja-0000000Dma1-48rN
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 17:09:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 396445C547F;
	Thu, 17 Apr 2025 17:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51871C4CEE4;
	Thu, 17 Apr 2025 17:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744909746;
	bh=aXl1F7DYGZK/3+f9nUBSaSrK3fpSv8lUhV4sdPl1Pzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=by+shk2pyqFJi+oU8vs4I6gsrXz3huX4Z9IWciIC6ih2uPa6SHpEsEEPCAodQvdLg
	 ugshnCu9bMRvUWjP2sOA4TGQbNtmN9wnnEK6P80HzEdeDOVmsnqx+Gz8mRfXTMfL6g
	 OHsN+ebMBW2CDMz/Ud8cWVuxMv9cwnajxiy7D2S6zD6Q63Gm5P51HaE1uf2LmUp+CO
	 KF/n7h2PfNE+2BrIE82RrEmMNqruQ/AIaGTDsGLBbxkD/Jy4Rs1swBWhECQaiguYSN
	 Y0r5XkaTlb+sEYNa3gfO42r0JRDj7rCLmkIc6S2wYGtzmmYedOUWfOmKrD4jGYiaEE
	 /aDFiuUcgpEXw==
Date: Thu, 17 Apr 2025 10:09:02 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Subject: Re: [RFC PATCH] crypto: riscv: scalar accelerated GHASH
Message-ID: <20250417170902.GC800@quark.localdomain>
References: <20250417064940.68469-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250417064940.68469-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_100907_131317_4CC7A12A 
X-CRM114-Status: GOOD (  10.63  )
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

On Thu, Apr 17, 2025 at 02:49:38PM +0800, Qingfang Deng wrote:
> +static __always_inline u64 riscv_zbb_swab64(u64 val)
> +{
> +	asm (".option push\n"
> +	     ".option arch,+zbb\n"
> +	     "rev8 %0, %1\n"
> +	     ".option pop\n"
> +	     : "=r" (val) : "r" (val));
> +	return val;
> +}
> +
> +static __always_inline __uint128_t get_unaligned_be128(const u8 *p)
> +{
> +	__uint128_t val;
> +#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> +	val = *(__uint128_t *)p;
> +	val = riscv_zbb_swab64(val >> 64) | (__uint128_t)riscv_zbb_swab64(val) << 64;
> +#else
> +	val = (__uint128_t)p[0] << 120;
> +	val |= (__uint128_t)p[1] << 112;
> +	val |= (__uint128_t)p[2] << 104;
> +	val |= (__uint128_t)p[3] << 96;
> +	val |= (__uint128_t)p[4] << 88;
> +	val |= (__uint128_t)p[5] << 80;
> +	val |= (__uint128_t)p[6] << 72;
> +	val |= (__uint128_t)p[7] << 64;
> +	val |= (__uint128_t)p[8] << 56;
> +	val |= (__uint128_t)p[9] << 48;
> +	val |= (__uint128_t)p[10] << 40;
> +	val |= (__uint128_t)p[11] << 32;
> +	val |= (__uint128_t)p[12] << 24;
> +	val |= (__uint128_t)p[13] << 16;
> +	val |= (__uint128_t)p[14] << 8;
> +	val |= (__uint128_t)p[15];
> +#endif
> +	return val;
> +}
> +
> +static __always_inline void put_unaligned_be128(__uint128_t val, u8 *p)
> +{
> +#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> +	*(__uint128_t *)p = riscv_zbb_swab64(val >> 64) | (__uint128_t)riscv_zbb_swab64(val) << 64;
> +#else
> +	p[0] = val >> 120;
> +	p[1] = val >> 112;
> +	p[2] = val >> 104;
> +	p[3] = val >> 96;
> +	p[4] = val >> 88;
> +	p[5] = val >> 80;
> +	p[6] = val >> 72;
> +	p[7] = val >> 64;
> +	p[8] = val >> 56;
> +	p[9] = val >> 48;
> +	p[10] = val >> 40;
> +	p[11] = val >> 32;
> +	p[12] = val >> 24;
> +	p[13] = val >> 16;
> +	p[14] = val >> 8;
> +	p[15] = val;
> +#endif
> +}

Please help properly optimize swab*() and {get,put}_unaligned_* for RISC-V
first, before considering random hacks like this.

https://lore.kernel.org/r/20250403-riscv-swab-v3-0-3bf705d80e33@iencinas.com
is working on swab*().

> +		/* Multiplication (without Karatsuba) */
> +		t0 = clmul128(p_lo, k_lo);
> +		t1 = clmul128(p_lo, k_hi);
> +		t2 = clmul128(p_hi, k_lo);
> +		t3 = clmul128(p_hi, k_hi);
> +		mid = t1 ^ t2;
> +		lo = t0 ^ (mid << 64);
> +		hi = t3 ^ (mid >> 64);

There is no need to explicitly XOR 'mid << 64' into lo and 'mid >> 64' into hi.
Take a look at how arch/x86/crypto/aes-gcm-*.S do it.

Also, since this is only doing one block at a time and does not use Karatsuba
multiplication, the single-step reduction would work well here.  See
aes-gcm-aesni-x86_64.S.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
