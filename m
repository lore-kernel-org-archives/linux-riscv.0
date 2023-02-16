Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B51BC636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 18:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hv4eKNGkgCljaec9suN0Z3eJqvMiTt+hPWRsWk8r31k=; b=nkMpVU0iF0O2BAAYGyVlU66vyX
	zZHCBoVQ1hwC61GSAjoKSTqtIouSswEJO0mXfb/wpw3zKh3jpQeVcYBS18FiYBl0BJRkmpLq+NGht
	DKwGVlaecI9ib7VKRvAROfyX05KOfGZjN73WiF2gd0dNkHcgC9vdcGrC/hH36oFaP7bYni6vigqmT
	8zHHeDI1G6YPIp2YxA+xiB/T3z7loe/mnKwaiUqJHLzwR+lnQsMcDdj9eGAgjxNEKBp86/a6qx0b1
	4WYnf/MzONzOV4Nf0HxXj+y36mo5BQD11rGOkPajWF8d5gXf+pLxWnqluEVTkmKvTR6rMhn/z66Sv
	o1U80QUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSjL9-00Ba2C-6o; Thu, 16 Feb 2023 18:50:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSjKz-00BZzm-Az; Thu, 16 Feb 2023 18:50:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id ACE43B82951;
	Thu, 16 Feb 2023 18:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DCEAC433D2;
	Thu, 16 Feb 2023 18:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676573430;
	bh=AImnf+2dqdDiUhTA+4XLQG6ccdNzGaAOj2rHAnNmR9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cwn2YrfskMK7b8K/KimZBAxY/yyMR/7dHYwkZ62/Ai0XU+LFgqyfNyyeGPdpBVD/z
	 L5tR6ut4sU5d0mPmnlz4O3RGW1dEEEeJyiVGZcmuEcDFtLfUYmMsbc7TzqPoodANtP
	 hlNgL9cbxXz3nPmhgZoJsHw8Cy5xVuoVntsQFQ6gUp4p8vv50rlYukm/+dJLWsXO4+
	 +BG8W2lJu5PqVhOQHPmkCR52mXRI0bIV8ckrCigczowbjO0Q2bcMVpdbKMbf+/eUYw
	 MWuW3ALreFOeCyBrbqK6ki6aic8OAe4gScHw7OhlSTUzSD/6Vqo+dHijYTR0D/n+rN
	 58PVJwgvIXBGA==
Date: Thu, 16 Feb 2023 18:50:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	daire.mcnamara@microchip.com
Subject: Re: [PATCH 04/12] soc: sifive: ccache: Add non-coherent DMA handling
Message-ID: <Y+567t+kDjZI+fbo@spud>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-5-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20230211031821.976408-5-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_105033_542506_37E54DA0 
X-CRM114-Status: GOOD (  15.22  )
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
Content-Type: multipart/mixed; boundary="===============7280368432041129954=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7280368432041129954==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dCe6axd58RjANF5F"
Content-Disposition: inline


--dCe6axd58RjANF5F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Emil,

+CC Daire

On Sat, Feb 11, 2023 at 05:18:13AM +0200, Cristian Ciocaltea wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> Add functions to flush the caches and handle non-coherent DMA.
>=20
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> [replace <asm/cacheflush.h> with <linux/cacheflush.h>]
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---

> +void *sifive_ccache_set_uncached(void *addr, size_t size)
> +{
> +	phys_addr_t phys_addr =3D __pa(addr) + uncached_offset;
> +	void *mem_base;
> +
> +	mem_base =3D memremap(phys_addr, size, MEMREMAP_WT);
> +	if (!mem_base) {
> +		pr_err("%s memremap failed for addr %p\n", __func__, addr);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	return mem_base;
> +}

The rest of this I either get b/c we did it, or will become moot so I
amn't worried about it, but can you please explain this, in particular
the memremap that you're doing here?

Cheers,
Conor.


--dCe6axd58RjANF5F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+567gAKCRB4tDGHoIJi
0isoAQCgGCQCl64HiPsxg1E4/GDsGMTIJGdrEEQIXQCaEdTjeAD9Hv8l410SaOFy
q5SvBa8IxUyuUjr2p8ixdFb2JfHoEAk=
=7P7u
-----END PGP SIGNATURE-----

--dCe6axd58RjANF5F--


--===============7280368432041129954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7280368432041129954==--

