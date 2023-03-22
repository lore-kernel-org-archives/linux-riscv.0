Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39635C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 18:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyEyPpdxNnq4AJxKIwr27cXzRfvnYKUsk63QT8IOaCE=; b=zzi6twcdhII4cGxRAqYChltaRV
	cwFG9r7QqMAWCA07xVQTTiirxCUMZKvkOOJZgD7PFsE0F5kQP3Ps8EJQGmL228ZOqKWkLmS0ms5Cr
	h5sFnuE2ov1SmL/83G5FSY2MVcgPHQCw7Wk0vJK/QcLUG7DarkoS5HLPM7wZCocK41X+LLvgkoviP
	wY/VaTgLysajwfPQfth+rKUBOf9H9ezvgKm8ODAkL/MS19Fhsw/SZrEHMc25Ou4Uj6eNub3reG8sq
	B4ByVNBqD47AUbJd0sfH+H/K3Swof9GNm6owuSVhbXRISCMZqxMV1ULsc7PVQD79hXEGZJjNCrwHq
	qVXAblsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf3Yq-00H4ux-2k;
	Wed, 22 Mar 2023 18:51:48 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf3Ym-00H4u1-2W
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 18:51:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 82ACDB81DA8;
	Wed, 22 Mar 2023 18:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A73C433D2;
	Wed, 22 Mar 2023 18:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679511102;
	bh=EHttEh6yxXxrUIBWgzA5oiNvBxxBhZB9e9/4ov+LfDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XfRKFEKfrThqNiROTnBwKYHtw+Fpi6ugZRRZqG3l1x/fsRsdC4gXQ33/0aESDhYl8
	 CBuXEtk2+egbzEbgirKSFs0rfp7LJfzwOtPL2Q8vg6u60nFQ3PQGEt7NJ1LNP3kS3n
	 ul3Uh3mtrVxqtDoddE9RsRJuwkqAT8RvXvQT5GVHgaeUu7Dxh/ni3uKyMqNLlqntC8
	 Hsi94Di5ZJZkr3Hf+yKdOiCo4Zigu+V3oFask4ZwtYr7Mp/aKZ0ajNPyDa2MT16+bV
	 95MHYaGWDAURaiFaFk4Q+oTWLOuFdpjVC3EGR75OaJRiN3D5r35VEFmAAhDW1WnR2E
	 h2ewgpQ52AWzQ==
Date: Wed, 22 Mar 2023 18:51:37 +0000
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
Message-ID: <bd80cf70-5545-4830-a4f4-7c4f79212f68@spud>
References: <20230217164023.14255-1-conor@kernel.org>
 <Y/ht1eHgtRrLxIhC@yilunxu-OptiPlex-7050>
 <Y/h1KFGSw13OabYw@wendy>
 <21bebf9d-eb27-5607-b0a9-274c46ef8aa3@intel.com>
 <Y/0r1aR6Wik2KYBd@spud>
 <cc6176cb-6792-ef11-f42a-d2d5b12d04b4@intel.com>
 <Y/01B4hCOs9JPfR8@spud>
MIME-Version: 1.0
In-Reply-To: <Y/01B4hCOs9JPfR8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_115145_100490_A88F5BAB 
X-CRM114-Status: GOOD (  50.03  )
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
Content-Type: multipart/mixed; boundary="===============8782303299359765897=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8782303299359765897==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FgRuE+/bPgbqLyAD"
Content-Disposition: inline


--FgRuE+/bPgbqLyAD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Russ,

On Mon, Feb 27, 2023 at 10:56:07PM +0000, Conor Dooley wrote:
> On Mon, Feb 27, 2023 at 02:42:30PM -0800, Russ Weight wrote:
> > On 2/27/23 14:16, Conor Dooley wrote:
> > > On Mon, Feb 27, 2023 at 02:04:36PM -0800, Russ Weight wrote:
> > >> On 2/24/23 00:28, Conor Dooley wrote:
> > >>> On Fri, Feb 24, 2023 at 03:57:09PM +0800, Xu Yilun wrote:
> > >>>> On 2023-02-17 at 16:40:17 +0000, Conor Dooley wrote:
> > >>>>> This patchset adds support for the "Auto Update" feature on Polar=
Fire
> > >>>>> SoC that allows for writing an FPGA bistream to the SPI flash con=
nected
> > >>>>> to the system controller.
> > >>>> I haven't fully checked the patches yet, just some quick comments:
> > >>>>
> > >>>> Since this feature is just to R/W the flash, and would not affect =
the
> > >>>> runtime FPGA region, I don't think an FPGA manager is actually nee=
ded.
> > >>>> Why not just use the MTD uAPI? There is a set of exsiting MTD uAPI=
 &
> > >>>> MTD tool if I remember correctly.
> > >>> A lack of interest in opening up the system controller to userspace!
> > >>> You're right in that the writing of the image can be done that way,=
 and
> > >>> while I was testing I used the userspace bits of mtd along the way =
- but
> > >>> for validating that the image we are writing we rely on the system
> > >>> controller.
> > >>> I'm really not interested in exposing the system controller's
> > >>> functionality, especially the bitstream manipulation parts, to user=
space
> > >>> due to the risk of input validation bugs, so at least that side of
> > >>> things should remain in the kernel.
> > >>> I suppose I could implement something custom in drivers/soc that do=
es
> > >>> the validation only, and push the rest out to userspace. Just seemed
> > >>> fitting to do the whole lot in drivers/fpga.
> > >> In case you haven't already looked at the new firmware-upload
> > >> support in the firmware-loader, I'll give you some references
> > >> here to see if it fit you needs. This would only support the
> > >> write (not the read) but it would allow the controller to do
> > >> validation on the write.
> > >>
> > >> The is the cover letter which shows a usage example:
> > >> https://lore.kernel.org/lkml/20220421212204.36052-1-russell.h.weight=
@intel.com/
> > >>
> > >> And this is a pointer to the latest documentation for it:
> > >> https://docs.kernel.org/driver-api/firmware/fw_upload.html
> > >>
> > >> The only current user is: drivers/fpga/intel-m10-bmc-sec-update.c
> > > Sounds interesting, I shall go and take a look. Just quickly, when you
> > > say it wouldn't support the read, what exactly do you mean?
> > > The only read that I am really interested in doing is reading the fir=
st
> > > 1K of flash as I need to RMW it, but I don't think that that's what y=
ou
> > > mean.
> > > Do you mean that I would not be able to dump the firmware using your
> > > fw_upload interface? If so, that's an acceptable constraint IMO.
> >=20
> > Yes - I mean that you couldn't dump the firmware image from userspace
> > using the fw_upload interface. The sysfs interface allows you to read
> > and write a temporary buffer, but once you "echo 0 > loading", there
> > is no sysfs interface associated with the firmware-loader that would
> > allow you to read the image from flash. Your controller actually does
> > the writes, so RMW in that context is fine.
>=20
> Ahh cool. I don't really care about dumping the firmware via such a
> mechanism, so that sounds good to me.
> I'll check out your approach, the immediate thought is that it sounds
> suitable to my use case, so thanks!

Taken me a while to get around to it, but thanks for your suggestion.
Looks like it is suitable for what I am trying to do, so in the middle
of working on another version of this using fw_upload.
The enum return codes from write are a little clumsy, but oh well, could
be worse I suppose.

Just one thing I noted (although I rarely pay much attention to/rely on
the driver-api docs when recent drivers exist as usable examples) is
that the docs for this stuff is a wee bit out of date due to some API
changes.
In the code example in this document:
https://docs.kernel.org/driver-api/firmware/fw_upload.html
firmware_upload_register() has fewer arguments than it does when you
look at the signature of the function in the documentation right below
it.

Cheers,
Conor.

--FgRuE+/bPgbqLyAD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBtOOQAKCRB4tDGHoIJi
0vEbAQDSmfFT1DQ/Pk7auDVcWj4C5E1dtcFcY5Al+msb3ok9JwD/RuO6ZvqpZ+fx
2BDz3ttFebCLxjpRK9+HxVOXaeDD0wk=
=Vitx
-----END PGP SIGNATURE-----

--FgRuE+/bPgbqLyAD--


--===============8782303299359765897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8782303299359765897==--

