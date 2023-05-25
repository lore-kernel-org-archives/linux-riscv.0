Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35A0C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 21:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UK8XnFK9nJCRCjuDy0Y3Gf5FHKynvDCJrokMPiK4JfQ=; b=tq9SZpDXFfqLtCAktIZ8psq7tk
	o2ocXF+zzPTGjzqKjXf+n5CVS1w9p1be/hFmC38Cl+eQrCLDwCVeZLxiN63LDtl/W/dHpjsq3jD17
	zd+wH97jYSIYeWSyONjCa3XQvl3k2fYPAAXJnEGcbE54+8oPz9GNB/CBd1C8UgSFJkVRGHbeuxCqy
	YbJjQVMx/wGe535IGY/o0R6vVv1Jn57V2RKK4JX4K3lS4pOc0HnQ3YbIquPgtTnVZ9L1LH5p/juTH
	1SBEkyGCR0CBI5xw8aHHxPEPMzmpVUjIwWHY5iuMg2lTITXBchORdd+UB2dVKd47wvMt0tGUr27VU
	ifuGk9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2IuH-000FSX-0Z;
	Thu, 25 May 2023 21:54:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2IuE-000FRR-2w
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 21:54:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4946760AC9;
	Thu, 25 May 2023 21:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FED8C433D2;
	Thu, 25 May 2023 21:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685051637;
	bh=gVTxJsQwsIf8+mM11Da4eHfeqmZHWo3HCP592A+RyWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TG8cQJttC7Fi6tepY7WR6mFizDK7/YFBKsIhEbU5TI1J6J800V3wcm7h8hmTzl/0f
	 1+D41sTM4Er00d+/NV435iYYp5UiIixyNmcsS+cdrgLZL4F0FnsDNitgemeC0yjaLa
	 sqg8rRuMpHOBgtsaGnF7Pr3CmnN4tGUt//KYHXMTAiKPVOavbgfMSH3YqzkSeah85o
	 I38e/wMMT67ySy1XCcEoxreFn69/S9xOAxp+vbCML3jpUk8fmWu/dp2P+r/23Uz65U
	 VQ8J9wEPFEj0wNTnDHUH878yEoyPFFiGyAQl/hX9/w4BCesCrEkfjoKpi9cBHqToTw
	 JAYoLt0yyKIBw==
Date: Thu, 25 May 2023 22:53:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: sifive,clint: Clean up compatible
 value section
Message-ID: <20230525-confined-swimmer-ac26871dc424@spud>
References: <40ff1fc7f5220db7d527c57ac4bad16c3945ae08.1683725179.git.geert+renesas@glider.be>
 <20230518-radiated-diligent-2eb1d1323037@spud>
MIME-Version: 1.0
In-Reply-To: <20230518-radiated-diligent-2eb1d1323037@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_145358_991832_EEC7FECD 
X-CRM114-Status: GOOD (  17.93  )
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
Content-Type: multipart/mixed; boundary="===============5561021968237545549=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5561021968237545549==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FUJhqpkh0YXZ673r"
Content-Disposition: inline


--FUJhqpkh0YXZ673r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 10:10:00PM +0100, Conor Dooley wrote:
> On Wed, May 10, 2023 at 03:27:24PM +0200, Geert Uytterhoeven wrote:
> > Replace the sentences in the description listing some supported variants
> > by comments on the individual compatible values, to ease future
> > maintenance.  While at it, restore alphabetical sort order.
> >=20
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Palmer has assigned this one to me on the RISC-V patchwork, any objections
> to me taking it via the riscv-dt tree? There's some other patches for a
> new platform thats almost read touching the file too, so (to me) would
> probably make sense to take.

Given the silence, I've picked it up. Scream and I can drop it again :)

Applied to riscv-dt-for-next, thanks!

[1/1] dt-bindings: timer: sifive,clint: Clean up compatible value section
      https://git.kernel.org/conor/c/1bd2339df1b5

Thanks,
Conor

--FUJhqpkh0YXZ673r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG/Y8AAKCRB4tDGHoIJi
0jqLAP0XDdSN6q73gVlptwD0sdH2ijo2bMlK1J8s7stO9a3b5wD+OMo+5aYHBUl+
gmDUGCSNim+iF6qG4mhv2HLcSEDQaAo=
=W+TV
-----END PGP SIGNATURE-----

--FUJhqpkh0YXZ673r--


--===============5561021968237545549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5561021968237545549==--

