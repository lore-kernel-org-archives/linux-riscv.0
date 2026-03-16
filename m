Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BE0F4644B
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 10:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hZxOoopZG1Of7mntf67IWwPDcgdkzYD4QHLYWEegNQ=; b=hhn1rrjG7SxTIBF4wEjyEfkH7V
	nPwEOwAg/erUzL5mD8sDOwXElPnBzqi2sA7/DISuXZgzJ0uYOGiS7+1WmrXrhNLf6U75643qdNm6N
	iC4yg+yr9asL8fp+D3jwf+1ndvy7+JAvNvmIkEUNcOmVR0o4vh3qXdkx/wwsdxVPtP6jrp/kUNlZC
	aGAFdEczMhDLmErbDOyiDzh+kGdf77uA8CyeaOXGfrrWuaogEwSUd9P91GH+JGGzvFM5TLCeTuRnG
	LzDc5/E+WzynELA9SI7IGGDZkiHxvJIfprwOVC/H/7fZJdR6Ew/zrBSiSgweHREbHwhKzQWM7TBhX
	Wzy/UK/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25fd-00000003mbQ-3wsr;
	Mon, 16 Mar 2026 10:59:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25fb-00000003mb2-0z7b
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 10:59:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BAEC438A6;
	Mon, 16 Mar 2026 10:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD2EC19421;
	Mon, 16 Mar 2026 10:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773658774;
	bh=8upfTfzEga/wd+znnJ2xeNS58mtIiD4DoeQde1PSlpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R7kET63pyrPOPrCL+XAp/IA6sZA/ks/ynbUvkRCCLc7XsN7DTmqvkgYa2xzBhNsfF
	 e8VdUJuZoBuVhpdhHRNWdGz1kpQizSx9OZLfq0UI7//mwXNu7IU9V+uU9U8iAEp8yd
	 lrx3uDmUmRCCu1QwFJdT9iLz+m9WbUeaUSp2MXs1bEkYznlQy3HZ9OEuKrl8DAMPHW
	 QruOH1eYA9IgM2pOEN4geaajQznKxKFZBaODif/fQVT5JLsTllpPmGgePpD0TIBW9t
	 rAWjf9FIYfqvcYbtaCzLQ4Qmfe/5D+8XrE6Sq+3/kJACVhqgo14kYHtCKxpFB5I4pG
	 LP8zS6ziOcQnw==
Date: Mon, 16 Mar 2026 10:59:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 3/4] soc: microchip: add mpfs gpio interrupt mux
 driver
Message-ID: <20260316-verify-revise-c0ad49fc208e@spud>
References: <20260311-tasting-friend-eae39148fb96@spud>
 <20260311-vigorous-steadfast-04afdcc9e524@spud>
 <CAD++jLnXBW7FDdGRt3rN5Up6GdRvu-Ywsg8jfepjEf4rBjPQ6A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD++jLnXBW7FDdGRt3rN5Up6GdRvu-Ywsg8jfepjEf4rBjPQ6A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_035935_584005_85C09A72 
X-CRM114-Status: GOOD (  19.49  )
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
Content-Type: multipart/mixed; boundary="===============2470332704398683864=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2470332704398683864==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QXaUuu184siEMQsu"
Content-Disposition: inline


--QXaUuu184siEMQsu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 10:27:15AM +0100, Linus Walleij wrote:
> On Wed, Mar 11, 2026 at 4:18=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
>=20
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > On PolarFire SoC there are more GPIO interrupts than there are interrupt
> > lines available on the PLIC, and a runtime configurable mux is used to
> > decide which interrupts are assigned direct connections to the PLIC &
> > which are relegated to sharing a line.
> >
> > Add a driver so that Linux can set the mux based on the interrupt
> > mapping in the devicetree.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>=20
> We need a piece of accessible documentation that clearly defines
> the difference between an IRQ mux and a hierarchical IRQ chip.
> If only a post on people.kernel.org, just something to help people
> to know when to use which approach.

I'm guessing you're not looking for looking for me to be the arbiter,
but I'd say that the muxing aspect is pretty important!
On a serious note though, the lack of anything in the hardware to do
masking etc is key, it'd have to be nothing more than a register that
determines routing.
That said, even the simplest mux should be an irqchip if reconfiguration
after probe is to be supported.
That'd make the delimiter "a simple mux that you set at probe and never
touch again"?

--QXaUuu184siEMQsu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabfikAAKCRB4tDGHoIJi
0iH1AQD6gzraxUf7eLDOoP3278COj/NHaSEqGeXofXCDYLB/5QEAvW8u94Fe+EsL
O7bkMtDdhKjZLKlM/VuSILf90VqvnAQ=
=1Nzk
-----END PGP SIGNATURE-----

--QXaUuu184siEMQsu--


--===============2470332704398683864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2470332704398683864==--

