Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E61C48297
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Feb 2024 14:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4rGQUgOfVSR03uaKwqLxMGTWTPJHARmDrhXn9yndDY=; b=UUBaCUIwmw6eN+GWkZ2aybI011
	AJfkU7yg6ZJL84/j7VmDXeAcaVvAnZ+qfLZ3seMMrn6l7Le5+MDDwUKnuliysaPCnP4QxkT5ytVSa
	gbVvPXhqmN1aktmGT0UbK1omMhiDuB336SeXnhknRciw8UuCcDaYhIuFeBg4U4YxOBCNJ/DTZh6sR
	XRS44TEywFYUxtXkHFdQi4846p2dNrges2ioY3tGp8iGH9Y/N/3geMjXW0F+XgDLneV/n6rUBIrBb
	u8DxBkCOEBrZ82EiQgQ1hIw6XUgZA45OioZQwPLlAlm57QYrKrrTk+DuhMy1dVH8JDJuLojbrspTk
	gEZBtfIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXMIb-00000007qJS-38gd;
	Tue, 06 Feb 2024 14:19:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXMIY-00000007qIz-3tjH
	for linux-riscv@lists.infradead.org;
	Tue, 06 Feb 2024 14:19:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E28561549;
	Tue,  6 Feb 2024 14:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C92C433C7;
	Tue,  6 Feb 2024 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707229181;
	bh=1MnTEbxeUsGA7HMcn2eRPHhXYWih9ZllJehloa4wpsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W38Z4H0qdYqSxhn84T7haOHArqaXgeHjfaoKy44OX19ZDhSftyULq0r/FMg70Ayyg
	 e7xwz0dqu7rFdptm5oHyeXQbqIlKCTw2IHPb8ifn0IWhpuVUdjUtd1/vqHYHiskKus
	 emdg0gItkGetPQPwjMbX3W3fHloS4plorEAOZb4jp8m6WWubTwO7C7KUNEfmuWtWJd
	 zDY6/0HI6/GQqpBuO8do0WL0/4o+XXYwSsg8BKoJsCU5N+SjQ257MPnim1lXkUHSj8
	 ZK/ph766zwqJpWxF6v4UD+bEzWaUrTNjU17rOna6yYGAL3WbiXN7oAf1vGxX8Vd7MR
	 Shtxv60zYzbrg==
Date: Tue, 6 Feb 2024 14:19:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: can: mpfs: add missing required clock
Message-ID: <20240206-parole-cinnamon-2fe369f6ca74@spud>
References: <20240122-catty-roast-d3625dbb02fe@spud>
 <20240122-breeder-lying-0d3668d98886@spud>
 <20240122-surely-crimp-ba4a8c55106d-mkl@pengutronix.de>
 <20240122-cruelly-dainty-002081f0beb2@spud>
 <20240122-smokeless-ion-63e4148c22e5-mkl@pengutronix.de>
 <20240122-uncoated-cherub-a29cba1c0035@spud>
 <20240122-pogo-reputable-b1d06ae1f1f1-mkl@pengutronix.de>
 <20240130-narrow-lyricism-8b25baac7bb2@wendy>
 <20240130-fragrance-disinfect-22cc1911bf48-mkl@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20240130-fragrance-disinfect-22cc1911bf48-mkl@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_061943_069802_8EB09893 
X-CRM114-Status: GOOD (  25.32  )
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
Content-Type: multipart/mixed; boundary="===============1533072780432927790=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1533072780432927790==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5oAuP6RxMdm00jg7"
Content-Disposition: inline


--5oAuP6RxMdm00jg7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 02:01:09PM +0100, Marc Kleine-Budde wrote:
> On 30.01.2024 12:11:44, Conor Dooley wrote:
> > On Mon, Jan 22, 2024 at 04:31:32PM +0100, Marc Kleine-Budde wrote:
> > > On 22.01.2024 14:56:09, Conor Dooley wrote:
> >=20
> > > > I think we already had this discussion on v1, where I said that the
> > > > binding requires the clocks to be in that order, regardless of whet=
her
> > > > or not clock-names is provided. You feel more strongly about it tha=
n I
> > > > do, so I will add them when I get around to sending a v3.
> > >=20
> > > Yes, this discussion sounded very familiar to me, never mind. Keep it=
 as
> > > is, and let's get this binding and the CAN driver upstream!
> >=20
> > BTW, I didn't see an ack on this nor do I see it in linux-next (yet).
> > Are you expecting the patch to go with the rest via the clock tree,
> > via the DT tree or will you be taking it with CAN stuff via netdev?
> >=20
> > I can resend this one patch with a netdev appropriate subject prefix
> > if you like.
>=20
> Feel free to take the whole series via the clock tree.

Okay, I've gone and applied all of the binding and driver patches to the
branch we will send to Stephen. Thanks!



--5oAuP6RxMdm00jg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcI/9gAKCRB4tDGHoIJi
0kHUAP0e+rt2LDSpTC952WOfj4vXNDY3wh2XgO1MsZQXw131LQEA1UPbV0N5gf+J
ALoxbvkmhHo0E10iiUy+SgrU+qL5yAM=
=rlvY
-----END PGP SIGNATURE-----

--5oAuP6RxMdm00jg7--


--===============1533072780432927790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1533072780432927790==--

