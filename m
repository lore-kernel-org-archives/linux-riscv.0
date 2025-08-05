Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D991CC87FD1
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 17:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omq4n5eHwvVuA9kH3g1Gm7kVnWKFI8jBZhVbhXM9hBQ=; b=lm8JbEa4sAyACeC/ahoz52dZkf
	+87yR1vkb3Q7vv6uX50KniUAOHGdrEVYqwWiAaLV2aDAywCqcD0M8DWw48bhgcvcwJxYDboo+fyto
	bj6Ca32oLURT40cZ0OMi8EVdYNYBL3xTwz+YvX72yuCp/i2RLAPaGQe9MhMKK2ZeWxvIoUBRaQco2
	+FEtGOBG70sk1CjuGzngGBNANfMLiOUNA9DM4EIALw//1eTyvQHfy2X/y9inFFsUndIr8vhxfWWid
	JG88OZTK+bG44RwbHRVWuYAuV0JXfFIzmq0YzJQOo7K/KyGzEzNA9+nSEKVB5GtltVu8btGhndRhq
	Fzcc3Nsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLj9-0000000DSbR-1oN5;
	Tue, 05 Aug 2025 17:45:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLEY-0000000DOnN-1zGZ
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 17:13:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B838A44C45;
	Tue,  5 Aug 2025 17:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFFE6C4CEF0;
	Tue,  5 Aug 2025 17:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754414033;
	bh=kFLtP7kLi6TZXaFEe1UXPz9zTqnkNWTqbzGcM1j1sPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mzsjP5ciz19VA8OYXPXGI3ps14D5SxS7bD9pxYQPAycE7Y4pHpSw4SS0UcE7MZLJK
	 T0nkWr8PsG/9TjOF1GRpxVkvzT7db4zoXaZdRtioihy15x5sVlSB8Bs7VFkS4USG+H
	 Jh8TXTGLuuhc2eWztbTmwYGT/92FpvmiC7XnpNWVLkRkIATERWrsm+4LumZ0x/SisN
	 2Gugtnz8V8UuBGzMQgNBJ2r7eA4Qo27++wMMC4E07nPsGl+UN4J0Ds/hvhUs0pb2M1
	 GPJCs5jNFr05si0U+WdLxZcTfZde5GzbWAjEOalxyRTUAQY34FeGxmnKczRm4z5JzF
	 8oifLKq6fY5+w==
Date: Tue, 5 Aug 2025 18:13:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Cc: sboyd@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 8/9] clk: divider, gate: create regmap-backed copies
 of gate and divider clocks
Message-ID: <20250805-slit-scrunch-e19f8afec16d@spud>
References: <20250623-levitate-nugget-08c9a01f401d@spud>
 <20250623-spleen-rambling-8bd898f2788e@spud>
 <f059ef8e-1834-4d21-bb17-8670cf7cd90f@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <f059ef8e-1834-4d21-bb17-8670cf7cd90f@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_101354_535504_78BF8B42 
X-CRM114-Status: GOOD (  16.45  )
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
Content-Type: multipart/mixed; boundary="===============7501828835193955285=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7501828835193955285==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M9zeZAJc7XAA2HBY"
Content-Disposition: inline


--M9zeZAJc7XAA2HBY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 01:23:49PM +0200, Gabriel FERNANDEZ wrote:
>=20
> On 6/23/25 14:56, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Implement regmap-backed copies of gate and divider clocks by replacing
> > the iomem pointer to the clock registers with a regmap and offset
> > within.
> >=20
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Hi Conor,
>=20
> Excellent patch, thank you! I really needed this and will be using it.
>=20
> I would also be interested in having a similar regmap-backed implementati=
on
> for the multiplexer clock.=C2=A0 Do you have any plans to work on this as=
 well?
> If not, I=E2=80=99d be happy to propose a patch for it, with your agreeme=
nt.

The only types of clock my driver needed were gate and divider, so those
were all I focused on. I don't really have a plan to implement more,
particular given the lack of feedback here means that I don't even know
if what I have done is what Stephen wants. The rest of your comments
seem reasonable, and I'll try to implement them in a new version.

--M9zeZAJc7XAA2HBY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJI7ywAKCRB4tDGHoIJi
0sR1AP4zQnrLebu8U863VAtOFHm+6M8gEW/WnUp3VMypOqgoIAEA6d9iEeY01BHW
S8o+uJeKAfF5/WvpbXoU0kZQT2osNwQ=
=urpw
-----END PGP SIGNATURE-----

--M9zeZAJc7XAA2HBY--


--===============7501828835193955285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7501828835193955285==--

