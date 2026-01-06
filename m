Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9A4C2A073
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 06:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2OFgr1uKxESj4cGFB7xIocEX1xI5sDAOw3m2BnMVNg=; b=zptQUKHyK7aK6d
	fSqHJLwpPcsgfEp3HjCo+VP5CfC23cE8kggaiU5S82R3P9gdj27GoqXwPKEAMq9lHiXnxjDpFnbWr
	0UXse1MjA6Q3FqiD3gciaV9ckzW3bvLgy2r4sYawfEZgQVgXno5JqHPLczyJoOj/teNeiRCsryCYI
	KeG9lho7J7977ugEODxSfbML23xps7qwXGvTN7+QkEdrY2yCxUoJd8P1cpDo1qycxUhqkA/8e3I1E
	ktVvsKIwXdcC1o3EJQcc8e+SvF6ccIlHPs8aJKq2LymnabCsNlEotoLGOvQZJl4ORSf1Ct5dpNxRT
	sP9BgAMjthKges5UIl+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd0gG-0000000CTWX-1NJr;
	Tue, 06 Jan 2026 06:36:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd0gC-0000000CTW3-48d8;
	Tue, 06 Jan 2026 06:36:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B65240DD9;
	Tue,  6 Jan 2026 06:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65CAC116C6;
	Tue,  6 Jan 2026 06:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767681391;
	bh=rdREKMSltpuBRXrhF+R1a8MfGIPmnymt3Sxftd/Knsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3JAZfQTQkdf3Szw+a/pV9YfijdR5VYyedZ8Y6EdU3MWnO6UcihH1xnxeFDL1x09k
	 ZuoY6of7XUhlA3+YlMbCj1sUISpfaSaDiYIPWaDNs04OrAKL/rFfQrs73OU/8w0Kl2
	 tN6ULSVQtHvDFxYzKonJ6O4zblqc4nITcveRLbcvhNvaXZCCa4WYKx86yFx2eaUVF2
	 rgU+tOAD76DU2buz1IUO0oCZoA11dXmKVoQHu4XmEXiIQtHyLHF3xalYdx+IVPWyrD
	 nm+cR6SrwOhHH9zKliIG8/CYHUjE571e9edTX4FLKyzXL8KAvjz6s5pLAlRkHgwdT3
	 U863fAfhVXoKg==
Date: Mon, 5 Jan 2026 22:36:12 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>
Subject: Re: [PATCH 02/36] lib/crypto: aes: Introduce improved AES library
Message-ID: <20260106063612.GA2630@sol>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
 <20260105051311.1607207-3-ebiggers@kernel.org>
 <20260105074712.498-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260105074712.498-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_223633_049950_542B7B49 
X-CRM114-Status: GOOD (  12.18  )
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

On Mon, Jan 05, 2026 at 03:47:12PM +0800, Qingfang Deng wrote:
> On 4 Jan 2026 21:12:35 -0800, Eric Biggers wrote:
> >  extern const u8 crypto_aes_sbox[];
> >  extern const u8 crypto_aes_inv_sbox[];
> > +extern const u32 __cacheline_aligned aes_enc_tab[256];
> > +extern const u32 __cacheline_aligned aes_dec_tab[256];
>  
> __cacheline_aligned puts the array in ".data..cacheline_aligned"
> section. As a const array, it should be in ".rodata" section, so
> ____cacheline_aligned (note the extra underscores) should be used
> instead.
> You can also apply the same to crypto_aes_sbox and crypto_aes_inv_sbox
> while at it.
> 
> Regards,
> Qingfang

Good catch!  So the result is that MMU protection isn't applied to the
const data as intended.

I guess I'll change these to the four-underscore ____cacheline_aligned.

Though, I'm tempted to instead just do __aligned(SMP_CACHE_BYTES), to
stay well away from this footgun.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
