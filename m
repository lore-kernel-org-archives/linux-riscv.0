Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518B4EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 17:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gp7pE4cH/P7BV4s0ckVBNSm0ZrAkcOc21z/4pWB6qEY=; b=XmSlmpCnulQwUYKxJoMDI6EkAu
	Md5cLkgr2HlePgRuUMWh1jYL3FNNU6go5AL45pgU52qUsf+1noxKOjMVpRwlrNpQYtHzYgNqZ94tC
	XRnBvhVcikoEur8Q8N9zB8nxSuIpRrlLOE8Vn8QRf7A/OXgqVWQ7uuXANLTj5Hy8SQoYDMnAIt7a+
	pUx31cWEk3ulrqOHfnjHV1W+RyI19kn3WMwxuNwl+2HU+4WqRK02oGBrjDPYFz86KC+wPwQ8wESSK
	otHR1SnsZs9XlPL1fAi0kSTOGNAW8AP/pAqtInMYw5YuqABEOj+CVayVSA8eM+7JU9DqtJ8qXO0qx
	QW0o4TqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdDm-000gpR-1k;
	Wed, 12 Jul 2023 17:01:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdDj-000goy-0O
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 17:01:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9CC9261877;
	Wed, 12 Jul 2023 17:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB08CC433C7;
	Wed, 12 Jul 2023 17:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689181302;
	bh=W61o7LlkQs9LBIYjzHUJMBy72qDnWFS0/a8qJkXf2Fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M4J4H42OR/vtD+rw+wG1NQ6vEDrz8rXSySfrrPLrIUeoN4Ct2aPEuAjOwvaWRv3cW
	 aJpJmYYaiUoBOBEWGod9Vj5UcUS9Jpnhrh1jnK7lJ1dZIBIZLevH1E0muun1AfMPp0
	 NZvnUEEWhWG5FZNi/qjgIZUziApMhuQYsmtor+dQ1OXuNc68zMZng55dohedv2dWQJ
	 tRqa+mluwl9C5ERDwSrejHNbTQ+QBu+WlSJW+4t+5NuP9ZZSumjXCBfMYndqKB+FDm
	 NMEnBHPbyEg7iqHtKbHvCZ+yEYper6sgCEWs3nQthxV46vv2CSNymBgVVrX/r3IiWh
	 7tzLiibgRBjjg==
Date: Wed, 12 Jul 2023 18:01:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: xingyu.wu@starfivetech.com, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, p.zabel@pengutronix.de, kernel@esmil.dk,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	hal.feng@starfivetech.com, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 0/9] Add STG/ISP/VOUT clock and reset drivers for
 StarFive JH7110
Message-ID: <20230712-unsold-impound-02608d701dfb@spud>
References: <20230712092007.31013-1-xingyu.wu@starfivetech.com>
 <mhng-d3795910-5414-4555-bf3d-75ebe769ed2b@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-d3795910-5414-4555-bf3d-75ebe769ed2b@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_100143_221065_A10F9244 
X-CRM114-Status: GOOD (  15.95  )
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
Content-Type: multipart/mixed; boundary="===============5257237976780653213=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5257237976780653213==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YXK2FfLMDg7K1UTe"
Content-Disposition: inline


--YXK2FfLMDg7K1UTe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 09:50:37AM -0700, Palmer Dabbelt wrote:
> On Wed, 12 Jul 2023 02:19:58 PDT (-0700), xingyu.wu@starfivetech.com wrot=
e:
> > This patch serises are base on the basic JH7110 SYSCRG/AONCRG
> > drivers and add new partial clock drivers and reset supports
> > about System-Top-Group(STG), Image-Signal-Process(ISP)
> > and Video-Output(VOUT) for the StarFive JH7110 RISC-V SoC. These
> > clocks and resets could be used by DMA, VIN and Display modules.

> Happy to take it through the RISC-V tree if folks want, but IMO it's
> probably better aimed at the clock/reset folks.  Either way I'd want to g=
ive
> them a chance to ack/review it, so I'm going to drop it from my list.
>=20
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I had a look through it & I am generally happy with it - everything has
either an R-b from DT folk or Hal on the drivers.
I was going to propose the same thing as the PLL patchset - if Emil is
happy with it, then I intend sending Stephen a PR for the drivers &
bindings.

Thanks,
Conor.

--YXK2FfLMDg7K1UTe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK7ccAAKCRB4tDGHoIJi
0j6sAP42I2NRHZdpOyf2izUoUuaLCqoRMvx4DDBgBCweGvshWAEA7O4i3W5C2V/L
ndm2wUnu6OPIY1snKnd2INzwEwr2XwA=
=kp3i
-----END PGP SIGNATURE-----

--YXK2FfLMDg7K1UTe--


--===============5257237976780653213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5257237976780653213==--

