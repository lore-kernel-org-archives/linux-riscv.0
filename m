Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760EFC64ED8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 22:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8bIAfSry7zNYAkd6ApGovngcd+fYyKIjzPKF1rkmfw=; b=KYa6V98t5MHqm0tdEIJyruE566
	dkA/Nd7hWDkEYm2TpjH0NYZeTS+ckmMRUxdB1gk6GKIrR7BOKe9wFr4wXoHUf5h3CABkUNdKcXZLT
	iEEqDKjsHzVKJX5v1BqiFCOsVSq0DsB8FSIhW3f4X1Lv5Oh5uy9sdXbBgA5lLwCiTA8tNAe8IN/gP
	18Li7Nsu28K0Xc6WjO+XnLUW4NyAhRRZDoq5CYl1aAFiqmxEydA86IacWejLmdlO1QV3GM8ELtxX1
	Ce/AxirqdPidU/+IAGjEykMoDp1ZoELJ6/U3KE8Iuq/nCE1w3C+DR4zNP0MrOQ9evmMi5n6XHtudL
	eDWCkBlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWlns-00BPgk-MU; Mon, 27 Feb 2023 22:17:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWlnp-00BPg6-Rc
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 22:17:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 71C4E60B71;
	Mon, 27 Feb 2023 22:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441BCC433D2;
	Mon, 27 Feb 2023 22:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677536218;
	bh=OLAhKikfvMU2wuyCBxDcxu9OcxDIG7wn+gzFNNSS2LA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rEzRzUKrj3jDGruk+xEddZcrntXRp0kq+4nj9UXPm7blo6WDX+rqljA9ROsFXSOiz
	 owg9O0VO4rIRmWwzRktjQ5R/8QVUCsIQXAl43Un/SiKJsPhdODRnHwl9nHbMe5ZBDQ
	 OmnxGWP1383XZtkoQkJD8umtbcQlqUlovpOmk9GaGZJWadQhGJ9EB1nJwx9XxSfDTB
	 mofhfiTLX9YEFC/A9cLaOKyOugQLmVsqcbC1m3+N+GNYai1EW8UnY+8noWib9BrXx9
	 SoVQD90gg6G9GZOEw4fncF4LixN2SsQz7bsq9LAvxdDSmY3K1SPRN0doamIugrb3lM
	 lx8cePZAguxPA==
Date: Mon, 27 Feb 2023 22:16:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Russ Weight <russell.h.weight@intel.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
	Tom Rix <trix@redhat.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org
Subject: Re: [PATCH v1 0/6] PolarFire SoC Auto Update Support
Message-ID: <Y/0r1aR6Wik2KYBd@spud>
References: <20230217164023.14255-1-conor@kernel.org>
 <Y/ht1eHgtRrLxIhC@yilunxu-OptiPlex-7050>
 <Y/h1KFGSw13OabYw@wendy>
 <21bebf9d-eb27-5607-b0a9-274c46ef8aa3@intel.com>
MIME-Version: 1.0
In-Reply-To: <21bebf9d-eb27-5607-b0a9-274c46ef8aa3@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_141701_991607_8966A492 
X-CRM114-Status: GOOD (  35.65  )
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
Content-Type: multipart/mixed; boundary="===============2734801326657035367=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2734801326657035367==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oZi0E9zvZH+0qkiw"
Content-Disposition: inline


--oZi0E9zvZH+0qkiw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Russ,

On Mon, Feb 27, 2023 at 02:04:36PM -0800, Russ Weight wrote:
> On 2/24/23 00:28, Conor Dooley wrote:
> > On Fri, Feb 24, 2023 at 03:57:09PM +0800, Xu Yilun wrote:
> >> On 2023-02-17 at 16:40:17 +0000, Conor Dooley wrote:
> >>> This patchset adds support for the "Auto Update" feature on PolarFire
> >>> SoC that allows for writing an FPGA bistream to the SPI flash connect=
ed
> >>> to the system controller.
> >> I haven't fully checked the patches yet, just some quick comments:
> >>
> >> Since this feature is just to R/W the flash, and would not affect the
> >> runtime FPGA region, I don't think an FPGA manager is actually needed.
> >> Why not just use the MTD uAPI? There is a set of exsiting MTD uAPI &
> >> MTD tool if I remember correctly.
> > A lack of interest in opening up the system controller to userspace!
> > You're right in that the writing of the image can be done that way, and
> > while I was testing I used the userspace bits of mtd along the way - but
> > for validating that the image we are writing we rely on the system
> > controller.
> > I'm really not interested in exposing the system controller's
> > functionality, especially the bitstream manipulation parts, to userspace
> > due to the risk of input validation bugs, so at least that side of
> > things should remain in the kernel.
> > I suppose I could implement something custom in drivers/soc that does
> > the validation only, and push the rest out to userspace. Just seemed
> > fitting to do the whole lot in drivers/fpga.

> In case you haven't already looked at the new firmware-upload
> support in the firmware-loader, I'll give you some references
> here to see if it fit you needs. This would only support the
> write (not the read) but it would allow the controller to do
> validation on the write.
>=20
> The is the cover letter which shows a usage example:
> https://lore.kernel.org/lkml/20220421212204.36052-1-russell.h.weight@inte=
l.com/
>=20
> And this is a pointer to the latest documentation for it:
> https://docs.kernel.org/driver-api/firmware/fw_upload.html
>=20
> The only current user is: drivers/fpga/intel-m10-bmc-sec-update.c

Sounds interesting, I shall go and take a look. Just quickly, when you
say it wouldn't support the read, what exactly do you mean?
The only read that I am really interested in doing is reading the first
1K of flash as I need to RMW it, but I don't think that that's what you
mean.
Do you mean that I would not be able to dump the firmware using your
fw_upload interface? If so, that's an acceptable constraint IMO.

Your interface also circumvents us (Microchip) defining yet another
method for interacting with the FPGA, since from my nosing around,
everyone seems to do something different.

Cheers,
Conor.


--oZi0E9zvZH+0qkiw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/0rvwAKCRB4tDGHoIJi
0r+IAP4wAN2eZl5ZZIhcWD47ZvM5gRJMjwQZYIsh50e8WJnPeAD/Spa80AeaY4RT
237fwTSQ7qtB3Ui47ifyETMLaC9V+wA=
=mVqh
-----END PGP SIGNATURE-----

--oZi0E9zvZH+0qkiw--


--===============2734801326657035367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2734801326657035367==--

