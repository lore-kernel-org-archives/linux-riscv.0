Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF70C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 12:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJ53xw9AL7b51V4vKxvtx8dGBYa+aKGyM/WttfehWyc=; b=OFisCVTN5U+CvmvpDBUxVzmIYT
	mcAwg/F46yWipOK5m8g/1YqkbWQEzzi/A+VK5WaQV4GFQOO4J/1U9T3A/UOoFlPqw0uaEjGpcT3To
	tXEn3ylOV1E8gsYXR4gVDJccya39jHzUD7j8Yhi0eQdfY2h3T2I324e/oi2mYAi258RwL/7Qsvxyb
	wgLizCDz8jL356Ld4ZZuT2HtrlvYeLgZ7gQMVoYK4BfOAdFU/pNgo7zgBmFhnqXixzHoBrdw84hKz
	zjG8Z3VmTpPLtDqVH4fbUt4+uc1k/1QxbUgRUBludLr0ZOn41z0HwfAAzSf6gMvbEC/B20WtZ39Y2
	ps+tywjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1SHM-00EUGX-LX; Wed, 15 Jun 2022 12:37:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1SHK-00EUG5-At
	for linux-riscv@lists.infradead.org; Wed, 15 Jun 2022 12:37:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E116F61965;
	Wed, 15 Jun 2022 12:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263F9C34115;
	Wed, 15 Jun 2022 12:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655296665;
	bh=4hVhluLtxcYUeJP9hL5fNVYu7o4eusq8ZzYiuhbcsyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hgB8i7Y1m4ufqgINiikVCDZ7wOPU8NETuK2NkgvQLCbj5qcjzVo28O9BrEz81PxAo
	 CXIyGUj4BnYOX8JD80e9kqbZ3JOAikM/mpIMAS6LdaFEErd6IXz7vNv1gSHxqUNJYt
	 IduEPhxN1zdc0VhNgb/JWlI1/q1TpOw16E8ZzQgKQdEHvRNQS+LJycBU+04hTLgXiT
	 DXdF3Dqm9eqivxyPh/sI2T7+MRlZkI2qmN3EeOjt4UYEg8wpJ5/+HIIbtWKIxKtvAC
	 xG7e0MutP0kzic/BOdbIauRKt1OHjEqaLecMfS+UmnOR6rbkzpOpJI0xyCVqYtVgpZ
	 2fuD5hdfF3csA==
Date: Wed, 15 Jun 2022 13:37:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Conor.Dooley@microchip.com
Cc: Daire.McNamara@microchip.com, Lewis.Hanly@microchip.com,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, dan.carpenter@oracle.com
Subject: Re: [PATCH] spi: microchip-core: fix passing zero to PTR_ERR warning
Message-ID: <YqnSlIcAadwxt1Q5@sirena.org.uk>
References: <20220615113021.2493586-1-conor.dooley@microchip.com>
 <YqnFLCbvrTxNbG1+@sirena.org.uk>
 <7eda95bd-c7f5-767a-fe88-9f7109467cd8@microchip.com>
MIME-Version: 1.0
In-Reply-To: <7eda95bd-c7f5-767a-fe88-9f7109467cd8@microchip.com>
X-Cookie: byob, v:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_053746_457359_807BF9DA 
X-CRM114-Status: GOOD (  16.78  )
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
Content-Type: multipart/mixed; boundary="===============4252987122308220805=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4252987122308220805==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x91oVE/PcPTtCJq8"
Content-Disposition: inline


--x91oVE/PcPTtCJq8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 15, 2022 at 11:57:37AM +0000, Conor.Dooley@microchip.com wrote:
> On 15/06/2022 12:40, Mark Brown wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > On Wed, Jun 15, 2022 at 12:30:22PM +0100, Conor Dooley wrote:

> >> -             ret = PTR_ERR(spi->clk);
> >> +             ret = !spi->clk ? -ENXIO : PTR_ERR(spi->clk);

> > I think you're looking for PTR_ERR_OR_ZERO() here?

> Maybe I don't understand, so let me explain what I think you're
> suggesting & maybe you can correct me:

> > -             ret = PTR_ERR(spi->clk);
> > +             ret = PTR_ERR_OR_ZERO(spi->clk);

> But if spi->clk is NULL, this will return 0 from the probe
> rather than returning an error?
> If that's not what you meant, lmk

Oh, hang on - what error conditions can clk_get() return 0 in?  The
documentation doesn't mention any...

--x91oVE/PcPTtCJq8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKp0pMACgkQJNaLcl1U
h9Cnkwf/frE4cXtVXU1qGhaIP40Lw1jlf28yAxuK+pWDkVTrMB/XYrRIx0IeJuhj
OOxtWWvD2LqknfmjqYULX2VTgLJ+AgD+bj2uDG2XFSW9nIE74WSte2jGPhAAlK1g
IreVpgy0HXSUBoTjse+YFpVaECTjWpVtcPLKOZrhuJT/r+OFMQYwvlBG3p1YcVmH
92C0k1tSsxv1ujR3UDNvyJUD2z8dbbD4ki8ouPntvyPlVovI3KTCl8C/Pc2rTVkt
aaBRO9bWDsvxVcgWgUqM1V8geOOdaxGQiXaAeytJsZKsHYPbIlJFr6189QPxtvVj
NBviWTjDtiPXjwEhAT/xnXRUGu9mOA==
=+HQB
-----END PGP SIGNATURE-----

--x91oVE/PcPTtCJq8--


--===============4252987122308220805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4252987122308220805==--

