Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787DEC7EE2F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 21:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHpBUAjreBxcWKeeI7lpZ/bAv/Uj7MAh5qriQjIwifg=; b=w0H1g3HjBDnEf0CCngFR0BSrcs
	w1MdjETNg/8pVZfQWGMhpfWLrk/o1psCmC4FZHDkI8EnZoeqGJ1XDn/aemX/+dFzhAT70V/6nSGPJ
	ZeCVS1hrDp6nyCXaG6cxbKzI47xhQNhQvfC7XUGHBJ3JpUsGLh66nCi28Ehwz/PuBChuGbhoFBw/F
	IPnF8vGldLD8GN3/U4dZvihKNRnxi6NroPaE80PEmvcs8ls7EFjK8pwyfiOnRHIHsvOQTmo/U3a9E
	81eb+wOWJwYvQWC3Ju2cNYt9+76YKvSH+XDp6dsaY115Ubq69NhAxa0LzZZ5nKGcxP9WO/Xcjxx1i
	gkGuk2Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8p16-005UhJ-2d;
	Mon, 12 Jun 2023 21:24:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8p14-005Ugf-0R
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 21:23:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C8E261EA8;
	Mon, 12 Jun 2023 21:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFFEC433EF;
	Mon, 12 Jun 2023 21:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686605037;
	bh=Le3gA2ClE6ECL6WF9fV8Q54wWv/RXKwEzvYFXFKgqDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JzaWBe097VzKJvl0oBZkVur7A0DKcS4yn5zcvAcJUhnuXNZhfYLv/fpjG1HqJ246k
	 o9uvOq5NK6Ex58+pRdpTgDveEEWcqjdmHkPe6soCi+7qyCcs+cx+2z1njQCFAHPRoU
	 uffrFY/Oljmq0iF23XmmYHHfJ9J8Nty98dYeJ9625mRzqe3s5pz0DsaoNt3q/Y4T5G
	 L1LiDsOYM5vsrmS/jqTEF8Us+X4Xh4w4kkmMTxu5JiMiDLlkNCngJ/+MceOMvDfZVU
	 wW9cEVA6nRM2bb8GDSGcdWu10UuDOcdpScFsrgAfLatrZd9q4tLV8mt/oYAR+R7WtJ
	 SXMsqLe0lhR2A==
Date: Mon, 12 Jun 2023 22:23:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Sean Anderson <sean.anderson@seco.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>, palmer@dabbelt.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen <rick@andestech.com>,
	Leo <ycliang@andestech.com>, linux-riscv@lists.infradead.org,
	qemu-riscv@nongnu.org, u-boot@lists.denx.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230612-relic-fetal-1beeae3455aa@spud>
References: <20230518-thermos-sanitary-cf3fbc777ea1@wendy>
 <20230518-4050231ca8dbe93c08cf9c9a@orel>
 <CAAhSdy07Mg_JBF+4ucGFiWdBKh-Ass5G_aUWqBqTnDSFp7S=0A@mail.gmail.com>
 <20230518-hammock-doornail-478e8ea8e6a7@wendy>
 <f7c20090-220c-2805-86ba-b174a89f65b3@seco.com>
 <20230518-monkhood-dispersal-6749b1228b0d@spud>
 <20230530-duller-reset-a34ae111f207@wendy>
 <20230608191537.GA3233857-robh@kernel.org>
 <20230608-cobbler-giving-e0fac2185e11@spud>
MIME-Version: 1.0
In-Reply-To: <20230608-cobbler-giving-e0fac2185e11@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_142358_258911_D97F9460 
X-CRM114-Status: GOOD (  17.24  )
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
Content-Type: multipart/mixed; boundary="===============3013123389537938239=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3013123389537938239==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RnjcFuwrw0FxHlVc"
Content-Disposition: inline


--RnjcFuwrw0FxHlVc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Rob,
Before I press on with more versions...

On Thu, Jun 08, 2023 at 08:30:28PM +0100, Conor Dooley wrote:
> On Thu, Jun 08, 2023 at 01:15:37PM -0600, Rob Herring wrote:
> > On Tue, May 30, 2023 at 03:12:12PM +0100, Conor Dooley wrote:
> > > On Thu, May 18, 2023 at 10:42:34PM +0100, Conor Dooley wrote:
> > > > On Thu, May 18, 2023 at 02:30:53PM -0400, Sean Anderson wrote:
> > >=20
> > > > >=20
> > > > > Why not just have something like
> > > > >=20
> > > > > mycpu {
> > > > > 	...
> > > > > 	riscv,isa {
> > > > > 		i;
> > > > > 		m;
> > > > > 		a;
> > > > > 		zicsr;
> > > > > 		...
> >=20
> > I prefer property names be globally unique. The tools are geared toward=
s=20
> > that too. That's largely a symptom of having 0 type information in the=
=20
> > DT.
> >=20
> > For example if you had an extension called 'reg', it would be a problem.
>=20
> Per the current ISA rules, that'd not be valid. But then again, I do
> have trust issues & it's not like "reg" is the only property name in DT
> land.

=2E..you say "prefer" here. Is that a NAK, or a "you keep the pieces"?

--RnjcFuwrw0FxHlVc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIeM5gAKCRB4tDGHoIJi
0uzcAQDu/tJVEgDQEG2BFIFoTPaZznrjs1Il4oaLCWo/dTGTigEAtYV2jXPQafdF
DrSPBnySqez+fzXzA9+5KTRu5WWsKg8=
=Olcx
-----END PGP SIGNATURE-----

--RnjcFuwrw0FxHlVc--


--===============3013123389537938239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3013123389537938239==--

