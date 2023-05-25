Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54986C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 21:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8ClAuu68c/FDGtYEwHFvUzhQWFTkTUmAZhFwj7r4CU=; b=Icfz+kQ+62f6Hf+UzR1CJK2XFZ
	E3LvQb7qZNBK0eZHsNO3k9kht0jZhgKgTw7lUzI/gUYKVsjRcuIkSjZHx3uFlnkikpt5pivtdnj3D
	bsiG9lGOOer3w9BgizZxP3H46XbDm5ULblSpS5/OIZmf9khVJsA6+mWfEyK3ZehlE1mf0E9ihX7Zt
	zy5TL59wuAWjo0m1qcpjfO5j0Qh2BpIZSZWXTVckWdZQJ90KCuwIvt+yS/Z0QdsRSS7y3ysf1R9XJ
	J7r7svqD9cw/Wdwqltc99P2gnNo1eGpS6np79T0WkFREZoLq1/puLlOMHTssGixXfSPQyOCGGHsWf
	pPO+pkKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Ivc-000Fh1-10;
	Thu, 25 May 2023 21:55:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Iva-000FgU-0p
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 21:55:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CF36864B74;
	Thu, 25 May 2023 21:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092ADC433EF;
	Thu, 25 May 2023 21:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685051721;
	bh=IgD7xJ1lA+7Cr5PgL3YBlO1IxdEO/OuNhvvPdqnlKxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ss71CwgdAXO3cm4O1DSbwTa1VhUPeCg/3xhmhPBy8sk8F85uXVRXvOIbFNA8YdhWt
	 5IL6XMpG0bweXFZThN23VyFcWTHLzi4qyrCHQe46y1rhq4PDgolIU+NuJ5nUzFeEsq
	 4AFT6qCAYQah7FaAIxtICAovZMqzHZPUSDABMVbV+qoDplLt2Xh/HXINbos3tGNZt4
	 LlnOOMYWaLOEJQieePPRXrUF5nWpE7v3pCp45+DYepfUjtwXw8khDrjHyrR80o0TzS
	 XHo+ITROLIRhocrGnHJmLB1J4E90Sq175S+SqmjCnmE14c3xlTtDOl0JBEVc2Jrxi9
	 U/JxyK5tLu6SA==
Date: Thu, 25 May 2023 22:55:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: sifive,plic: Sort
 compatible values
Message-ID: <20230525-upper-racing-a77b28c675f1@spud>
References: <9cbf54da1ace03d7a45f28230fd99954d8c0d141.1683725029.git.geert+renesas@glider.be>
 <20230518-landless-reoccupy-efd52921a51e@spud>
MIME-Version: 1.0
In-Reply-To: <20230518-landless-reoccupy-efd52921a51e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_145522_335628_486268E6 
X-CRM114-Status: GOOD (  17.43  )
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
Content-Type: multipart/mixed; boundary="===============8496397992448575108=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8496397992448575108==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S5kQZEC6MB10FqOH"
Content-Disposition: inline


--S5kQZEC6MB10FqOH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 10:12:11PM +0100, Conor Dooley wrote:
> On Wed, May 10, 2023 at 03:26:00PM +0200, Geert Uytterhoeven wrote:
> > Restore alphabetical sort order of the supported SiFive-compatible
> > values.
> >=20
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Palmer has assigned this one to me on the RISC-V patchwork, any objections
> to me taking it via the riscv-dt tree Marc? There's some other patches for
> a new platform that's almost ready touching the file too, so if you don't
> mind I'd like to grab this one.

Given the lack of objections, I've picked it up. Happy to drop again if
that's not okay.

Applied to riscv-dt-for-next, thanks!

[1/1] dt-bindings: timer: sifive,clint: Clean up compatible value section
      https://git.kernel.org/conor/c/1bd2339df1b5

Thanks,
Conor.

--S5kQZEC6MB10FqOH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG/ZRAAKCRB4tDGHoIJi
0uW0AQCfnKCmslrgIr0P1M8dZpov5SsIGUXTSLn6GE0QicZD4AEAn/qXuOQg5tvM
PUXHkTvj3S1bKB5s/qpE1NB2lmE7bQU=
=3WbE
-----END PGP SIGNATURE-----

--S5kQZEC6MB10FqOH--


--===============8496397992448575108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8496397992448575108==--

