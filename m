Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EB7CD5BB1
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 12:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZMzrLIszJUs/rCBvD7/1whWeu4/wbxk973Sv2nBwoQ=; b=WKSE4hpk3UZHJm+0Uavcyfzkca
	YZkS3fZIQqdz/Z0wL3kjX7h6sgBNDmcMynN9/v7hRjwxzUzOd62VkMMPUHWNCO5RFLQ7eIhGDU9r1
	RZ5AAkRFmlNzLwjH0v4Vz21fbtQif9uR7QDiyfrkRS7g5apC7ligG5QG8q8GACBCqRYA0Xp5xXm8+
	TRT0L+lcHtGER0Z9AN9oElc4P6sY6+VCoB+0H1PpDvN1B7doYbrHBKDz+SGT037ocAptxXYbDmxiC
	wpty9xeFbr/0+zBN+WoyOW/nuK86nMUlgiAD3GczlgLZVnt+ReRWhe+Nmz6LaXWyZ7VYOozw9Nk/c
	+XxUHv7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPSy-0000000AtDp-0Ro7;
	Fri, 22 May 2026 12:59:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPSv-0000000AtDD-3HYM
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 12:59:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C29340D5C;
	Fri, 22 May 2026 12:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8721F000E9;
	Fri, 22 May 2026 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779454740;
	bh=dwSUWSNVkWQiU2Ps9u08I+NkEf0pbbAy9oZawlGfs7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AodPdG6kqN8TqpkCsUXCZOv+7MY36Qy89EI2xQcgUo7TTd0ky/v1q5VAVq0Rd/Ydu
	 cITFfow0zhLSKsnzAzwugCTevD9e61iLHD7wSV/7E9cXXL6vthpMGOF1BAza5cz4Ly
	 dA+PNm4ItVfQCaLWVDnnDEZQiwmgSPnG9Bgl8x27Bam0AZiMHeZjdOZeSXUtUq8Qzd
	 PB5u1OwvAsGdWrtLtD0AEi5k5q/sjGruk/fjypCTUtL8+NMBgCMBP5zqAotooArzgk
	 cvnnBfg3F0VjHR/2/tCB45NEP8/GQBm6+vcCOYYk01LCmbznedCj1MHyi9p9nIHZJB
	 pnQ5iX+nbJuQg==
Date: Fri, 22 May 2026 13:58:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	jinmei.wei@spacemit.com
Subject: Re: [PATCH v3 2/2] ASoC: soc-pcm: constrain hw_params when DAIs
 share the same BCLK
Message-ID: <be91aacd-2e02-45d8-9293-e9551f688c68@sirena.org.uk>
References: <20260518-i2s-same-blk-v3-0-2ba1c4f41db9@linux.spacemit.com>
 <20260518-i2s-same-blk-v3-2-2ba1c4f41db9@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <20260518-i2s-same-blk-v3-2-2ba1c4f41db9@linux.spacemit.com>
X-Cookie: Celebrity voices impersonated.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_055901_842276_507F128B 
X-CRM114-Status: GOOD (  10.39  )
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
Content-Type: multipart/mixed; boundary="===============3652098301364649752=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3652098301364649752==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sKTSFcLS+m+I2M8w"
Content-Disposition: inline


--sKTSFcLS+m+I2M8w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2026 at 02:21:09PM +0800, Troy Mitchell wrote:
> When multiple CPU DAIs on the same sound card share the same physical
> BCLK, add a hw_rule during PCM open that constrains the sample rate so
> the resulting BCLK rate stays consistent across all sharing DAIs.

> +	/*
> +	 * Protect the rtd list traversal.  No nesting: this callback runs
> +	 * from snd_pcm_hw_refine() which does not hold card->mutex.
> +	 */
> +	guard(mutex)(&card->mutex);

We have helpers for acquiring these mutexes which deal with some lockdep
issues using subclasses.  Either use those or provide whatever's needed
to have the equivalent thing in a guard.

--sKTSFcLS+m+I2M8w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoQUw4ACgkQJNaLcl1U
h9C7OQf+Jwocql2ZUuQWSU2AMaZmusiVEka81SMZdP6KS2iSwEL8pf6oWkxkCcTs
jnHnBGKwmPtnApfDY+mN2FmkMrFjUGf5p4Q21j4YoXYA9I3tnj84SAyxP75mZ8DD
c788haT1VvukP/xOi1aVmQAZDxrrZcM9c+bB4h1t1CPCSwFCTRs6Qy1Xunn971Kq
l2gLaQOZNdPAUZrnzwUBRZp3m7vfF+AYSeONZlLmKWSwlSmZ9srpCSB8dRwj+oqo
pKo6258W0y0dduExgblci93/+kft52DovE4X+RvJiYPi+dx+5A+5ir9nFbMvwNDZ
rabUYy1fGILu3GuPhD89+3KrXeAEbg==
=mDIW
-----END PGP SIGNATURE-----

--sKTSFcLS+m+I2M8w--


--===============3652098301364649752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3652098301364649752==--

