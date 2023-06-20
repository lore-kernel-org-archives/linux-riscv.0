Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E67BEB64DB
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 18:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iPXymcnZSXWe+67TPVvRf9XhksI+78v3bwbSEFFgZU=; b=Y/lbygUswT85YQnJFkahH8Qb13
	XCC9I98eU+zbAEb18pL7boF7za3aNQhPrW7njacuIcLUY2H6pZuB/k1RiOEqLrKkzjVptGg+YVzOL
	9/cOYqgqahhVdHxty/n6fHSbgeUI0aGjFpxS0UfH/7FYcQuZfHNptZOL++w6CZxy+yko4aRB/B+eJ
	4VeB73ZtDQiCxvw2ttWMSdlFFchXHY8hc0Amy2iwuKuvTxyx10SFh9/ESJE4TRwwyctoPF+blVuei
	TWoVIaaHzIybIwxUNl9oL97mYi+xuT0iYz2DtAkesObS/7THfTcyRcKTAkPq0wfzFjhV/Taf4PC/b
	Q0qnRp/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBfsZ-00C1dv-0B;
	Tue, 20 Jun 2023 18:14:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBfsW-00C1dM-2P
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 18:14:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 256D96135B;
	Tue, 20 Jun 2023 18:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78B2C433C0;
	Tue, 20 Jun 2023 18:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687284895;
	bh=o75Tf+Qcfifa+fs1Ou+3lX8Ua0X9iXBYdNjivarGk0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q+9ER6Lz9phRbPMEhhY2vVnjxBaId3vSv9ok5Ok5CBN0y9cOqwmB/VEZeylmr/iBM
	 7trPLmSMuLwvsNe1KipkTMQmWJvgqxeCHIzAWYnia+07zV31AeAj2cp8WsH3FlX8Od
	 YTFuUfbRoLIrTr9Ogs1QD1w4iehqmopnGiLcg9Z8CAgYt41Q1/1lHysc7t5RzZ/l3H
	 od4xQZir+iw/samUxckgJOwrzJCVlB3msuBM+mmQtg1MQcOCtfQpnYDPKFS57cFfrv
	 PDmJakK4IupM1vKaD975Z3wPix4U3RP4iMSo9HeKtjj1xMwUQUSQLyQVnzmkl8IyA5
	 Qiz0FAOD7/LCQ==
Date: Tue, 20 Jun 2023 19:14:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] dt-bindings: riscv: cpus: switch to
 unevaluatedProperties: false
Message-ID: <20230620-darkish-coherence-bd19ceda0b56@spud>
References: <20230615-creamer-emu-ade0fa0bdb68@spud>
 <mhng-9b234a44-e770-48a9-8a7b-d71a9ed671e7@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-9b234a44-e770-48a9-8a7b-d71a9ed671e7@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_111456_850472_657C94FB 
X-CRM114-Status: GOOD (  16.59  )
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
Content-Type: multipart/mixed; boundary="===============6101457263096061803=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6101457263096061803==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kMoWClvT2oye9axn"
Content-Disposition: inline


--kMoWClvT2oye9axn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 10:00:14AM -0700, Palmer Dabbelt wrote:
> On Thu, 15 Jun 2023 15:50:13 PDT (-0700), Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Do the various bits needed to drop the additionalProperties: true that
> > we currently have in riscv/cpu.yaml, to permit actually enforcing what
> > people put in cpus nodes.
> >=20
> > Changes in v2:
> > - drop patches 2 -> 5, they're now standard in dt-schema
> >=20
> > CC: Rob Herring <robh+dt@kernel.org>
> > CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > CC: Paul Walmsley <paul.walmsley@sifive.com>
> > CC: Palmer Dabbelt <palmer@dabbelt.com>
> > CC: linux-riscv@lists.infradead.org
> > CC: devicetree@vger.kernel.org
> > CC: linux-kernel@vger.kernel.org
> >=20
> > Conor Dooley (2):
> >   dt-bindings: riscv: cpus: add a ref the common cpu schema
> >   dt-bindings: riscv: cpus: switch to unevaluatedProperties: false
> >=20
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

> LMK if you wanted me to pick these up?

That was my hope, please do!

Cheers,
Conor.

--kMoWClvT2oye9axn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJHsmwAKCRB4tDGHoIJi
0lcPAP9PDTzDfzslpFVPTTffz4JXBBY5mQkfPxlJ6jYCbBwguQD/dVMiOZobbFOx
gEHEevW9MOni34UbfMfQdTEzZADtDQg=
=BIXk
-----END PGP SIGNATURE-----

--kMoWClvT2oye9axn--


--===============6101457263096061803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6101457263096061803==--

