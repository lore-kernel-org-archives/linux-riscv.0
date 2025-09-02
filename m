Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91592CA1005
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 08:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDIGn3kT9PtSp1jkk03jMOdXm//8fY5sq09lofVn2Bw=; b=IIWz5CskBD51+9pxpNF4hALvA4
	Pm6W5iGX966ZJbj9H0bPIPQZGxoEGCSSmvlszTtGwYgBkMuPbk2xd/LMDOHr2P0mNzYlz58IAdUXs
	KY5UyFdKAJWrZsYEY5HNirEd1iAmb4gAMDAvuM9QH8hskGF5o8kthR1ajVkHIjrSZhHm2P8Wif3Py
	M0Zy8dGyL/Ov8zQGl1SKAiMZSngKHTXjE1CEjrzGutTAlpXld+W6aRltWbr1Kt6vQroLqA8MsuUQX
	SsfNEE3faOEiQ3ipmoP5H35JrcIXMAwzReTtpY9sSAm4JHBx6HU62v8saauqiSjI4U819ofR6DUtn
	WDs8PvoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMhm-0000000GAfl-0LO0;
	Tue, 02 Sep 2025 08:49:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMQq-0000000G3rA-2V8d
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 08:32:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EA8F40196;
	Tue,  2 Sep 2025 08:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A782DC4CEED;
	Tue,  2 Sep 2025 08:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756801920;
	bh=BwvrsUILXXQB7764p4DzmtJB/r81NX9Scwk2zl5D/7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cPj/femy7sIQIdSlmj2vBKdGlpv5IexFe9S1iVHOlzAYUJJvx7KAHlpPAV9z0QjnH
	 3Ga/ZNM4lW0cZ3jC5Gxf979DQ5eDD5OiyRGEy987huKdVx3st/ohCMmryizb3+quyh
	 ATovauMRiCZJ3fd10qAtj49h3Wv02O4CEHeGBGqV6QujsYhib4L+7YslB6IF4mYKHX
	 gs9WVMG+Y50TZyfnLaSFyVrQ5J4xM61bvtWcSc0bFpb/6AIe8Jw97Ao3Qvi291i2ky
	 LBhsBN3cgF7a0EZdbWT56lg/CiQ0wZ7MsfjnR/BuKqKBDsEA7hbpl5oD8GVv7Ss4Sg
	 WlbRKNnmcgmhw==
Date: Tue, 2 Sep 2025 09:31:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Valentina.FernandezAlanis@microchip.com, Conor.Dooley@microchip.com,
	Daire.McNamara@microchip.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, robh@kernel.org, krzk+dt@kernel.org,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1 5/5] riscv: dts: microchip: add a device tree for
 Discovery Kit
Message-ID: <20250902-affair-scrambler-2771df16372e@spud>
References: <20250825161952.3902672-1-valentina.fernandezalanis@microchip.com>
 <20250825161952.3902672-6-valentina.fernandezalanis@microchip.com>
 <2b1eb8fd-2a64-4745-ad93-abc53d240b69@kernel.org>
 <bb5b0d71-41b1-48a0-82fc-bdb362cc3db1@microchip.com>
 <0d90eeb4-e6ac-459c-a6b1-26368f102e0e@kernel.org>
MIME-Version: 1.0
In-Reply-To: <0d90eeb4-e6ac-459c-a6b1-26368f102e0e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_013200_730161_C4436E96 
X-CRM114-Status: GOOD (  15.77  )
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
Content-Type: multipart/mixed; boundary="===============2124130046599417626=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2124130046599417626==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sBKmyEoEsZN8MIqu"
Content-Disposition: inline


--sBKmyEoEsZN8MIqu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2025 at 08:22:02AM +0200, Krzysztof Kozlowski wrote:

> >>> +     refclk_ccc: cccrefclk {
> >>
> >> Please use name for all fixed clocks which matches current format
> >> recommendation: 'clock-<freq>' (see also the pattern in the binding for
> >> any other options).
> >>
> >> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml
> > The fabric dtsi describes elements configured by the FPGA bitstream.=20
> > This node is named as such because the Clock Conditioner Circuit CCC's=
=20
> > reference clock source is set by the FPGA bitstream, while its frequenc=
y=20
> > is determined by an on-board oscillator.
> >=20
> > Hope this clarifies the rationale behind the node name.
> No, because there is no style naming clocks like this. Neither proper
> suffix, nor prefix. Use standard naming.

So you want all fixed frequency clocks to be named "clk-foo" when
"clk-<freq>" is not suitable? Fine if you do, but I didn't realise that
it was required and haven't been keeping an eye out for it.

--sBKmyEoEsZN8MIqu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLarewAKCRB4tDGHoIJi
0t4LAP92WccRzBcu/OA343s5xK/k5BKq3m3GuOrSMLTqipOI/wD/UEFyYz9GTEOx
AKa0iN/M4nMy/nu7o/1nvvh0ixfi7gY=
=2RWY
-----END PGP SIGNATURE-----

--sBKmyEoEsZN8MIqu--


--===============2124130046599417626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2124130046599417626==--

