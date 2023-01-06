Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25877C5479D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 14:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eq6tzfZOZLM/hqxVzW7IOYsRFGIW4rJT6raLK568dAQ=; b=ZzXWCMJIhVPZcXgV5MVrK4KO+m
	9RDyxvLcJdgo7Z0/HgDxp+yn1opB3Kj5Zz/Bj1cOfQ1eDX4SywJVdqQzwUbmNyWgHoF/Yhy/UndDs
	hGLmRw8IvgWb7kJHxuVrfFVUFt03pIpwB3cTkYUtoiiNhZnk7vnWs2ZMfNeWUWduRmJ79kbo/udoT
	ECWUigSNEEge/OW5aUAl3D2L9iOswTT0cJ9wD2aRxtwZI2mOMiXhcfZ/dC8VUpYeF2X/k+5pKlDmx
	oirR+OPT0cZ8LWUN5aee3yGP1zMxZwWrvOeKn+Q47GIQoxWbr6Vd67UHuY2fZZvYhoj+j8qfsh991
	xC8Hu++A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDo8c-008z30-Im; Fri, 06 Jan 2023 14:56:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDo8W-008ys8-OQ
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 14:56:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 419E06170E;
	Fri,  6 Jan 2023 14:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A67BC433EF;
	Fri,  6 Jan 2023 14:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673016956;
	bh=PPDmazgEZ01ebgNmalD5od1eIyKxwPF3rKhIbhiNAqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o1bA37/yKmDPjlAE+szA+fQqL87AT59OSHfsyO1VIR/nD7vAhaCimeBBeAwyOBn8m
	 dCjlEfkX0/TlxGK7iCGS6DfPcFkNSdpzK6/uF83U6wPL4uWC25ouUKQ6WcFZ49kuHV
	 2cdZdKnELSXPa3Pd8kQd3DXkdtHkqh5Qc6jOyoJfjtGUlCQYcFUo3Ridm1xfjcsDHl
	 sxbg7XXeI6K0HTnVjJ8H9H/RfO2V3/bQSVGzcKzc589/4yIAeQvIdoy/bo9mD7MqiZ
	 GMQpi1VcQoHKyBvnRA9iAKluDQtAr73aCuMabIh9R9GT9Z1I5KqO9Ey1YlLTkLeB0L
	 Z6qDWGkPNA53A==
Date: Fri, 6 Jan 2023 14:55:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>, Ron Economos <re@w6rz.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	robh+dt@kernel.org, palmer@dabbelt.com,
	krzysztof.kozlowski+dt@linaro.org, zong.li@sifive.com,
	linux-kernel@lists.codethink.co.uk, sudip.mukherjee@codethink.co.uk,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>
Subject: Re: [PATCH] riscv: dts: fu740: fix size of pcie 32bit memory
Message-ID: <Y7g2d+3BtIJfy1IH@spud>
References: <20230106134456.265891-1-ben.dooks@codethink.co.uk>
 <422275a4-b082-2951-71f2-04f33e036438@linaro.org>
 <b64bfeff-e1e8-02d5-0a7d-c2a0a905da5e@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <b64bfeff-e1e8-02d5-0a7d-c2a0a905da5e@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_065600_961805_4C1BF1AD 
X-CRM114-Status: GOOD (  21.06  )
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
Content-Type: multipart/mixed; boundary="===============0701259987268127897=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0701259987268127897==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GXMosCl6DcniI18p"
Content-Disposition: inline


--GXMosCl6DcniI18p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 06, 2023 at 02:51:04PM +0000, Ben Dooks wrote:
> On 06/01/2023 14:07, Krzysztof Kozlowski wrote:
> > On 06/01/2023 14:44, Ben Dooks wrote:
> > > The 32-bit memory resource is needed for non-prefetchable memory
> > > allocations on the PCIe bus, however with some cards (such as the
> > > SM768) the system fails to allocate memory from this.
> > >=20
> > > Checking the allocation against the datasheet, it looks like there
> > > has been a mis-calcualation of the resource for the first memory
> > > region (0x0060090000..0x0070ffffff) which in the data-sheet for
> > > the fu740 (v1p2) is from 0x0060000000..0x007fffffff. Changing
> > > this to allocate from 0x0060090000..0x007fffffff fixes the probing
> > > issues.
> > >=20
> > > Fixes: ae80d514808557018e44190 ("riscv: dts: Add PCIe support for the=
 SiFive FU740-C000 SoC
> > > ")
> >=20
> > Don't wrap lines.
> >=20
> > >=20
> >=20
> > Drop empty line between tags.
>=20
>=20
> Thanks, will fix.

I wouldn't bother resending to fix that stuff, can be done on
application.

I don't have a PCI card handy to test with so +CC Ron, perhaps he can
give this patch a go.

I can give it a go next week though probably if nothing's come through -
although likely not with something like an SM768.

Thanks,
Conor.


--GXMosCl6DcniI18p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7g2dwAKCRB4tDGHoIJi
0mbtAQC7b2ZBykuymOVmjpi1QESGeEASXMZzc5aED6oKooGFIAD/WNpvTXpbNtFz
gFRSQ8HJkparZKaeKgVer8Fzbcd/qAo=
=VTlP
-----END PGP SIGNATURE-----

--GXMosCl6DcniI18p--


--===============0701259987268127897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0701259987268127897==--

