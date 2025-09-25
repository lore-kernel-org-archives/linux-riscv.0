Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B5FCAC5A7
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 17:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjmgz7Y9TiX6NQJz01T6RrgVcYL2GEP9QU6XkmpO7a4=; b=1DLaXTB0rLrTkxfCkkwwAtJHEg
	ijyNs6ioXlohdbRpKyAnZIQ7+nsyRA7HrI70ejx4oGEzOxUEYOl48SMmCEfk0pd6952Yg83fzvL9K
	rMQ2wdVJgYenZMXVDs5QidgnHeObXqSkfA2egh7apqtNez58wovTKFBwCqCSy+LhVas7AZGBQa/GT
	1Wf+P2iTAXJe0mOx5C8y3ohejCsYG24WZBQag6pvUFpbhMjltgBfj0kSwclvJ83si+s8zgkrceRay
	X2lXPRc/mFViEVwPtpF7X3JKckTCxOs5vC86OLYSip/CvMOgljjAIfl6istrD2qFZ1Az/yWlzH4X9
	F1YfjyMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pTs-0000000BPRy-14ad;
	Thu, 25 Sep 2025 17:10:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pTq-0000000BPQf-3lCg
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 17:10:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 03C0B61191;
	Thu, 25 Sep 2025 17:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF419C4CEF7;
	Thu, 25 Sep 2025 17:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758820205;
	bh=q9Rq4/H4aaM/wf9aFUG2tSAvIqRjG0CUjxb7SNWmI3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kbWgcHmZnhxuMEtRTUmUs93JI0IYz2Z3HEnTvjy4KzYzdF1vPX4T6i5ei0jgCNWAW
	 Tcy6D1XJhe8s4m92hBsXas9C/L3aBtcs7Rx9Bj0Wcg44SRNdPZa1cG+xUD7pRdWBp2
	 1eU6ZsWa9EDshi40H217ep1tgmHWKTwYN5PN8FO+ptJ4gbzXOOixkyTYInChCpYtwW
	 dOa2X7DGVgoWv70DAmjIiae6shfCf40YmkxTaUY4hXtt8P+8/LLz/BWhRzd4UJ5fuK
	 1p4ZKmHDUYb4X+0S/uudSnEBUZL6gyx+fMwCwETjAXDpuipbJ1yHQ6IbWtmOnacs36
	 HKf+aXpQlsBXg==
Date: Thu, 25 Sep 2025 18:09:59 +0100
From: Conor Dooley <conor@kernel.org>
To: "fushan.zeng" <fushan.zeng@anlogic.com>
Cc: junhui.liu@pigmoral.tech, alex@ghiti.fr, anup@brainfault.org,
	aou@eecs.berkeley.edu, conor+dt@kernel.org,
	daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	krzk+dt@kernel.org, krzysztof.kozlowski@linaro.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, palmer@dabbelt.com, palmer@sifive.com,
	paul.walmsley@sifive.com, robh@kernel.org,
	samuel.holland@sifive.com, tglx@linutronix.de
Subject: Re: [PATCH v2 00/11] riscv: Add initial support for Anlogic DR1V90
Message-ID: <20250925-jaundice-uneasy-ff8b3b595879@spud>
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
 <20250925030650.35694-1-fushan.zeng@anlogic.com>
MIME-Version: 1.0
In-Reply-To: <20250925030650.35694-1-fushan.zeng@anlogic.com>
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
Content-Type: multipart/mixed; boundary="===============8151120199769711488=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8151120199769711488==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eu9584PsFdUWS5DG"
Content-Disposition: inline


--eu9584PsFdUWS5DG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 11:06:50AM +0800, fushan.zeng wrote:
> On Mon, 22 Sep 2025 20:46:30 +0800, Junhui Liu wrote:
> > This patch series introduces initial support for the Anlogic DR1V90 SoC
> > [1] and the Milianke MLKPAI-FS01 [2] board.
> >=20
> > The DR1V90 is a RISC-V based FPSoC from Anlogic, featuring a Nuclei
> > UX900 [3] core as its processing system (PS) and 94,464 LUTs in the
> > programmable logic (PL) part. The Milianke MLKPAI-FS01 board is one of
> > the first platforms based on this SoC, with UART1 routed to a Type-C
> > interface for console access.
> >=20
> > Tested on the Milianke MLKPAI-FS01 board with both the vendor's OpenSBI
> > and the not-yet-upstreamed mainline OpenSBI [4], as well as the vendor=
=E2=80=99s
> > U-Boot. Because the vendor=E2=80=99s OpenSBI is loaded at 0x1f300000, w=
e have
> > to additionally reserve the DRAM region 0x1fe00000=E2=80=930x1fffffff t=
o prevent
> > overlap if using vendor's OpenSBI.
> >=20
> > Notice: A "no4lvl" bootarg or dependency patch [5] is currently required
> > for successful boot on the DR1V90 platform, since the SoC hangs if the
> > kernel attempts to use unsupported 4-level or 5-level paging modes.
>=20
> Thanks first.
> Anloigc already has the open source SDK at https://gitee.com/anlogic/sdk,
> and will submit it to mainline at suitable time.
> The code should be a full feature version after lots of tests, not the
> modified and simplified version from Anlogic open source.

The nature of the upstreaming process will require what you have to be
broken down into multiple parts and be upstreamed at different times,
depending on how long components take to review. This is normal and
expected. Of course there should be through testing done, but I don't
think that what is in this initial patchset really requires much
testing - if it boots then it's probably sufficiently tested!

> And we hope that there won't be two different versions code of anlogic SO=
Cs,
> it may confuse customers.

If there's ever going to be complete upstream support for your device,
then there will be two versions, because looking at just the dts files
in the gitee sdk you linked I have noticed things that are not acceptable
in upstream. As others have said, you are not entitled to control the
upstreaming process for your device. The only way to have some control is
to submit patches yourself and to engage with the review process for other
components. It's in everybody's interest to keep differences with your
SDK to a minimum, but you need to accept that there will always be
differences because the upstream community simply has higher standards
than those in your SDK as well as a requirement for portable code that
you do not have.

> It is better that anlogic SOCs are long term maintained and supported
> by Anlogic officially in mainline and for customers.

It's only better if Anlogic submits better quality patches (no evidence
for that yet) or submits the patches more promptly than others (which
clearly has not happened here), and offers review commentary etc at a
higher standard and more frequently than a non-employee maintainer would
be able to do (there's no evidence for that so far either, given you're
trying to stall this patchset). Your claim seems to have no merit as
there is no proof that you'd do a better job.

Thanks,
Conor.

--eu9584PsFdUWS5DG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNV3ZwAKCRB4tDGHoIJi
0uaWAQCSkbVTTIbafxcfF96xk5lgaG5ln+YtgPuJtAGRusRBkwD+LaffLvZLIg1V
8qVEjLULVNOgXNHJOEiDL5yOwVweCAM=
=QmTb
-----END PGP SIGNATURE-----

--eu9584PsFdUWS5DG--


--===============8151120199769711488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8151120199769711488==--

