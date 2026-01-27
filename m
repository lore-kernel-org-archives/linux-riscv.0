Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2913D25931
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 15:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQr1X0IRXfoA/sD/gTWQbMxjS19KGCqoqHC50fEdSOs=; b=b1VjPA66GSBPKq3DPfcOViCSww
	6VYUVOKtmKjyJgvl6aSWgjjpCfw5665DstsgA7pmEST/5N0skCJawTPSN1I7+O+Zpewfm2hlAEvPo
	nXR07u/PgbzaQMj2GEYJmnzbGtfvznSM2NBgp6nsohtoXStSabiPaCy1H3Uq1i2ZG9iZz/AgVjhtu
	rLgWNsMar7CPA6H3znwEdhOZJUcIEqmrstSQnCzMX/wL9PyPPbtX9MT/0f//xxr7AzhHo17BYdZE/
	sPQyyoUtv6mR8SMsN+2qN5MTv1U7osSi9bk4SRpJmohCVLMZYk0/4wGg4rzLxiuPxeJKenh4/O4Ds
	WcH79GAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkklg-0000000EW8J-2qFZ;
	Tue, 27 Jan 2026 15:14:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkla-0000000EW72-1fnU
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 15:14:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB87841686;
	Tue, 27 Jan 2026 15:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D4DC116C6;
	Tue, 27 Jan 2026 15:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769526845;
	bh=m3TPcHEBsfQWalMm0WnZmJSQ9jtV0YcHvN+I+5GyKcg=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=e6HCNZVCFeM8YX1tPMWcLW1EsiHYjkkwHqseYc4bv6Bxsmoy3ujng5Mi8tUfo/z+m
	 8HReDz5GJjv0zfInqcd1hGFeoGPapwIEudAb2x6Ld7sIppls0NCygGN8UUYgylHX0m
	 76kY5jTACLJPTP5Eye/yWZN0q+GDf1vyTm6jwa6w7NnKYbjnlRxupa5kbw/7IyWmeP
	 xofHAcWndO66DHnxhYIQP66RnvfqNpBgRF4muj8ziPmzjwNkkI8uZokWbRA57cJLVv
	 DIavMPNowsEypkBkLXA4uP6Rb9k8V0VDEGQx5jwMeoW5wermo7GwiEwA3eSDcSn77h
	 wrruRGaaFjNIw==
Date: Tue, 27 Jan 2026 15:13:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 5/6] ASoC: sophgo: add CV1800B internal DAC codec
 driver
Message-ID: <153acfd6-cb4f-48ee-82e0-0a18a4a1e9c7@sirena.org.uk>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-5-6ef787dc6426@gmail.com>
 <88ef974b-9fa8-490e-ba19-1fb31ca94342@sirena.org.uk>
 <aXjRx12yPA7QflaF@anton.local>
MIME-Version: 1.0
In-Reply-To: <aXjRx12yPA7QflaF@anton.local>
X-Cookie: I brake for chezlogs!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_071410_914796_C5D905EB 
X-CRM114-Status: GOOD (  19.50  )
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
Content-Type: multipart/mixed; boundary="===============8895307372346214942=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8895307372346214942==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TAPu9R6EF7VUDzRm"
Content-Disposition: inline


--TAPu9R6EF7VUDzRm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 07:11:24PM +0400, Anton D. Stavinskii wrote:
> On Tue, Jan 27, 2026 at 12:49:52PM +0400, Mark Brown wrote:

> > Nothing ever mutes the DAC so this is a bit redundant.  The mute should
> > probably be a mute_stream() operation.

> I'm not sure here. DAC mute feature was not implemented because I don't k=
now how
> exactly do that. The public documentation is very weak for my taste.=20
> This call added here to be sure that override flag is
> not set (override feature replaces the output by setting it to constant=
=20
> value and ignoring the input, so it is some kind of mute from my understa=
nding.=20
> So ensuring this off is needed be sure that DAC will output our I2S data)=
=2E=20
> What do you think will be better to do here?=20
> I'm sure that is needed, but may be better to move=20
> it to some early stages, like probe function.=20

It's probably fine to leave the functional code as is but you should add
some comments to the mute function explaining waht's going on here.

--TAPu9R6EF7VUDzRm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml41jYACgkQJNaLcl1U
h9DvQAf+OiroM7nH8QOX1NaSJVvy9B/1hfdynFnaK+SbJP/lMp8bM0VZfV1zbgKk
KEPUW6fk+OkycL5Qd9oiRuLf5BVb1CvzreYkv24xg/5f7b9tki+qc1NTwCVcCWU7
RdOaf/YEdLbOgpk2APDtn9AwrfKSVZcuNlSUMGyXnTEVGABbGgx2c3wDiqjts2cB
HyuOE4W82gMsLkP+QuBYIhuY8gyXg8kY7GFejrakOm89inTSOzR6hggArLzMOKY/
VhE12PZ/837kiUrlCjPceVMbOFbpLkciDe7fCb3e0YQabDSFzQbk8qjSDG2uZ06R
VPI5Qi3CG/KHSdnVE/nD0d/ARcsHMw==
=jGOT
-----END PGP SIGNATURE-----

--TAPu9R6EF7VUDzRm--


--===============8895307372346214942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8895307372346214942==--

