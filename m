Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC26CCA600C
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 14:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2feN9o0WRNDqLffnk6kIHQiN9bgaE5MTtZs5pay5unE=; b=gKcXWf+2UO2s3w0UjZGtOaD0FK
	XJ1BC8c8FBrTXDJ9VOCtg2NKyyla8HVV9QBsdnvKRTEOU+Y1UYBjw/zu1OC8/TqQxqOqCOq5uLjBv
	GF+u016EQ1Q8YBzZdmSwRTwHvYBF80B2uZyfIVTm3Nx9SsvrZAIUJllHxKFkB+xs5Tb/zzhUrc1ni
	VxbRBWtICfuFd6m7egErr7gpQT11EnYPvXhXWnWo9tsaXTlOiKIA2ZoluAa7ILRMsdPykrqD3fHGa
	ZGPiaQiArJOMbu2lMdGTrCGK3WJM0HV/9fogNNh9yGCtxGadF/OL5hb/1es2s2HB21xZQ36NTN7UR
	lAPs9DPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEorc-00000004W6d-002T;
	Thu, 08 Oct 2026 14:12:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEora-00000004W6X-1SVG
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 14:12:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B44E943DB4;
	Thu,  8 Oct 2026 14:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0723B1F00898;
	Thu,  8 Oct 2026 14:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791468769;
	bh=l2+Dw2sl5OPeSblngQFwY5OyEBVB0Z8ra9CpUyTrnOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bWoE9FP0wQV5OmBAi0qERMdgFHVZF6+BMd1JtPaH3LfzPH7DHx+jug8rzZMePt6Bo
	 8oWlSPigSVelqXtNLkl7FQS+Qnnr4U6A5o4mSdEdXrYQKO1RUnTFjlvghrDb+kHEld
	 EvZFNSkry6zzvz61wZpbqg9gfUvMKMY0SqMRvrjd88vCANKWkmIDquJAS7dqNLTETS
	 Q59psaqqxlaWzPVLvclAh5/RlI8m7hR6lpKf1TjI4KhqccH4w19Q5CUYNeRqU9NMy0
	 MSeiyzgbpRuAEkcJYg1W4bnHS8FKV2aaGafaRv/5QuRqzQrScqNwyGBB2zEhbrVAF0
	 HtYKJZyi0sgRQ==
Date: Thu, 8 Oct 2026 15:12:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] riscv: dts: anlogic: drop unused DR1V90 external
 clocks
Message-ID: <20261008-c59c47fb901176a0137497d9@squawk>
References: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
 <20261003-dr1v90-cru-dt-fix-v2-2-6e7d96612ac0@pigmoral.tech>
 <20261002-crimson-unwrapped-b067e86de38c@spud>
 <ar_wmUWEXgIzq1XM@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ar_wmUWEXgIzq1XM@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============3594485552393770885=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3594485552393770885==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PORdzqZiVWL//Jy/"
Content-Disposition: inline

--PORdzqZiVWL//Jy/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2026 at 01:57:45PM -0400, Brian Masney wrote:
> On Fri, Oct 02, 2026 at 05:33:24PM +0100, Conor Dooley wrote:
> > On Sat, Oct 03, 2026 at 12:28:40AM +0800, Junhui Liu wrote:
> > > The external CAN and watchdog clock inputs are not routed on the MLKP=
AI
> > > FS01, the only board currently supported. Drop the two fixed-clock
> > > placeholders from the common dtsi, as fixed clocks require a valid
> > > clock-frequency property.
> > >=20
> > > Both clock muxes select their internal parent clocks after reset, so
> > > the CRU operates correctly without the external inputs. Keep only the
> > > required oscillator input to the CRU.
> > >=20
> > > A board using these external clocks should define them in its own
> > > board-level dts and override the clocks and clock-names properties of
> > > the CRU node.
> > >=20
> > > Reported-by: Yixun Lan <dlan@kernel.org>
> > > Fixes: 7849521aaac2 ("riscv: dts: anlogic: add clocks and CRU for DR1=
V90")
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> >=20
> > Per the v1, Brian said he would rebase the clock tree, so I'll just
> > squash this into the original patch I think.
>=20
> It's already rebased, and dropped from the clk-next history.

 Cool. Note to self: 7,5 material, cos I don't have the headers to do
 anything with "riscv: dts: anlogic: add clocks and CRU for DR1V90"

 Cheers,
 Conor.


--PORdzqZiVWL//Jy/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasekzAAKCRB4tDGHoIJi
0jgcAQCV80DNHnZs3oA4mbKQsMOiguSK3pNNz515ouRmtabi8QD9Epi9eNek5bZS
tPAWl8KmezP6TImZIhyLE2yhXcBEIQM=
=Bhh6
-----END PGP SIGNATURE-----

--PORdzqZiVWL//Jy/--


--===============3594485552393770885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3594485552393770885==--

