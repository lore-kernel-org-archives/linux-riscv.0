Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9518FC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 12:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KisMAIDdtRJBLY6MRBG1eev8XzmKN/+9/xZdPYJP78=; b=uJ8lYlMKSpBuQIDfXohus32MPz
	AwDuO0jNOMvTu7vef3XuUlDBmopUiVit3qSwS5t8RG06kutI/xZ+p9pEg+qVpsMCZVYHcIVhElvF5
	LVyc8fPrumJ+fPvJ4wDpMws4R5D9dZ0q/nq6JTjCUIMRVzqHAy2+dPuTXipILSgDPE/XAVJ6pfvM4
	lcfw7vrSGcq00zfWxWUO6UalzN7xw2kyhHru02ARaYeyww+n5NFQzpcC03hACMsSEFf239A63fFuO
	ykRzsdo/EA96vwdRdipxzOs5Vq7LbLwdRPvTLWpyOjA0PNi+ALyt3D/gsQ2mouJjw1chXDor2uFbm
	AFtgMl9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1SSl-00EXiM-Ud; Wed, 15 Jun 2022 12:49:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1SSi-00EXgy-HL
	for linux-riscv@lists.infradead.org; Wed, 15 Jun 2022 12:49:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DDDA96199F;
	Wed, 15 Jun 2022 12:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6ECC34115;
	Wed, 15 Jun 2022 12:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655297371;
	bh=n/hkxLWRuo5jyYf4FAUgEaA1BVrJd2Czge4XtJelj/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qj6YQSNKGJZ6a+adgoRSUFb4mC+naZNA9LBgxV4Y8CW9/nX6yNFtgtFL/pf3nkRN5
	 IJr9eyM2Cj4fqRRYl/rtf49sZiaVQCy0+wckzRIhLLnqt3EIDAyn668+1Cv3MW/UGr
	 28EchJqn9RIWxCmGt0zEMMk6XqWD8r8lQieBYh7/SImQvBNm5NnnwrD+1tNpnXfeaI
	 /o5ztXFa3TchU04uYEYKmHNilQja5DYYdz4KEPux81WCVHfJnBl+mC1ClqzVwhjZY4
	 ZM6f5e4w+QLwnLxM+/pUcwmkWuty57b6S6vFbavgoFRts5stS+2HZb3z72i/ipkozm
	 BaHVm90paq9ow==
Date: Wed, 15 Jun 2022 13:49:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Conor.Dooley@microchip.com
Cc: Daire.McNamara@microchip.com, Lewis.Hanly@microchip.com,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, dan.carpenter@oracle.com
Subject: Re: [PATCH] spi: microchip-core: fix passing zero to PTR_ERR warning
Message-ID: <YqnVVizga14qNxkt@sirena.org.uk>
References: <20220615113021.2493586-1-conor.dooley@microchip.com>
 <YqnFLCbvrTxNbG1+@sirena.org.uk>
 <7eda95bd-c7f5-767a-fe88-9f7109467cd8@microchip.com>
 <YqnSlIcAadwxt1Q5@sirena.org.uk>
 <630d60bc-1322-21a9-e4d1-3eb5af40f8a4@microchip.com>
MIME-Version: 1.0
In-Reply-To: <630d60bc-1322-21a9-e4d1-3eb5af40f8a4@microchip.com>
X-Cookie: byob, v:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_054932_652149_C034E3DD 
X-CRM114-Status: GOOD (  16.17  )
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
Content-Type: multipart/mixed; boundary="===============6319613278523035247=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6319613278523035247==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9H7xqTDlMSNY1TLZ"
Content-Disposition: inline


--9H7xqTDlMSNY1TLZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 15, 2022 at 12:42:27PM +0000, Conor.Dooley@microchip.com wrote:
> On 15/06/2022 13:37, Mark Brown wrote:

> >> But if spi->clk is NULL, this will return 0 from the probe
> >> rather than returning an error?
> >> If that's not what you meant, lmk

> > Oh, hang on - what error conditions can clk_get() return 0 in?  The
> > documentation doesn't mention any...

> If !CONFIG_HAVE_CLK, (without which it won't boot on the coreplex)
> but I don't think I can be sure that CONFIG_HAVE_CLK will /always/
> be enabled for other uses of the FPGA.

That's not an error, that's returning NULL as a dummy clock.  The
expectation is that the driver will proceed as though it has a clock.

--9H7xqTDlMSNY1TLZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKp1VUACgkQJNaLcl1U
h9D1lQf/TmAxegjzbw14zJim5lch4dpip3+EARf1XdRuoGvxVWeIfrUb08R9z9ke
k3jbrUT+FRSLKb6KedhVXfPVJJXJOo08oA4w2gxw0au6vNqcGD4rI27yWv81azM5
fB7HKV6r3kDwhQcK6yYkao7NltNw6XJKEBlcnnVifo2rekh+guvyFifPX/lP7OWm
jbMZXJG64MG1rzGuHAwoio0skpGjhXwov5D8yNEMLRjXj/JJd/9CV055P6LYYUsT
I/9006E56Rr8XrBD4uJ6W0QokbfP9bAtmHhfcA9R2h3k33+1ERs3QkcmIlOUw3pR
K1QGBayKlESUSDDKmUVS0sJS7MS6xA==
=euyr
-----END PGP SIGNATURE-----

--9H7xqTDlMSNY1TLZ--


--===============6319613278523035247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6319613278523035247==--

