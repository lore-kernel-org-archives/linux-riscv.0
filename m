Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E7DCCD193
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 18:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1N8BJEivOeUsxJq3qCmkxOGm4n7pOgxWJ3snUjFDO3U=; b=DOisVOavOp63QOdmgbeJseMijw
	OxY/uXaT4bduPL2BqK9KOaWLbON9xQPyFqSdJtNUjdr6hGKV39jws94pRKAll4veM7EQAHtZ7OZlA
	FWXB36ZhlwBh4en0FuUSTtMv9MTjOVTuMVPoDg2EqO3doOQT/TYqbA4tMKI5sEbJx5F9lhC2VfiOM
	MViJN0vjmzJwuXCwpKeDBNNG5V4Gaqa81hWePXH7sXfU2k10Sgm0Mqe3Yga3EhkPoix9FCLtMh+rA
	LlWHJfBPFyaaiD6OsHo3pY7lOG+L1gaw2KO81lcHJ5M5vx4m07NYj80dECeZZbbkxBo5gD7Ooc8eH
	6+5pq1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC05P-00000007Eco-1O5t;
	Thu, 23 Oct 2025 18:30:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC05N-00000007EcE-2AL0
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 18:30:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB7A761191;
	Thu, 23 Oct 2025 18:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9430C4CEE7;
	Thu, 23 Oct 2025 18:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761244252;
	bh=4FMfhKfwT45zNZYWzsFfHSI11HycY9Zq+anG78kko6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n8kh5zRdhJ8DfNXO+pXijXPP16eIKBATNaSTTwiBFAxn9OS6noJRgaeBoCnOom4QP
	 2+Dq4jNtITFcanQIZ//0gbrUnkGrdf2K7y6+PGo+CNShe3uiN29vmhWJtM6+eOmpuY
	 WT6JIfO45BRUmhm5mNCZr/iO80fNGjbTIAFGa2awQ94FLsr7VVYcVJE2hHaD+3oBjn
	 ieSPZD2n64i50ERiYGpEjQlRvsToTaJgenqLfouNVgmvT+ZpyapzK4V6nUwsb0wgin
	 rVm5pLztevxcCZtvnZIgAO401tIas/DjvqsBaxfLmWlnsNukE80qnpS21O181ltuIs
	 2eI85t5rQWAZw==
Date: Thu, 23 Oct 2025 19:30:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: michael.opdenacker@rootcommit.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <emil.renner.berthing@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] riscv: dts: spacemit: add Ethernet and PDMA to
 OrangePi RV2
Message-ID: <20251023-lizard-sharpie-70f2a000327f@spud>
References: <20251022201807.1474789-1-michael.opdenacker@rootcommit.com>
 <20251022201807.1474789-2-michael.opdenacker@rootcommit.com>
 <f8a55f89-2612-49e3-88c6-acb523ac74d3@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <f8a55f89-2612-49e3-88c6-acb523ac74d3@iscas.ac.cn>
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
Content-Type: multipart/mixed; boundary="===============7615336085577531645=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7615336085577531645==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZhGqk7lYBtXKeshE"
Content-Disposition: inline


--ZhGqk7lYBtXKeshE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 01:58:22PM +0800, Vivian Wang wrote:
> Thank you so much for the patch and testing results. Only some nitpicks
> follow.
>=20
> On 10/23/25 04:18, michael.opdenacker@rootcommit.com wrote:
> > From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> >
> > The OrangePi RV2 board ships two RGMII ethernet ports.
> > Each has an external Motorcomm YT8531C PHY attached, the PHY uses GPIO
> > for reset pin control.
> >
> > Enable PDMA for the SpacemiT K1-based SoC in the OrangePi RV2 board.
> >
> > Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> > CC: Emil Renner Berthing <emil.renner.berthing@gmail.com>
> > CC: Yixun Lan <dlan@gentoo.org>
> > CC: Vivian Wang <wangruikang@iscas.ac.cn>
>=20
> Firstly, it is usually spelt "Cc:", with one upper-case C and one
> lower-case c.

I don't think this matters at all, the git tooling at least doesn't
care.

> Secondly, "Cc:" should not be necessary in the patch/commit message.
> From Documentation/process/submitting-patches.rst:
>=20
> =A0 =A0 If a person has had the opportunity to comment on a patch, but ha=
s not
> =A0 =A0 provided such comments, you may optionally add a ``Cc:`` tag to t=
he patch.
> =A0 =A0 This tag documents that potentially interested parties have been =
included in
> =A0 =A0 the discussion.
>=20
> If you look through the git logs of Linux, Cc tags are really not a
> regular occurrence except those marking patches as suitable for
> backporting to stable.

If people want to handle CC lists by putting it in the patches (it's
what I do when I have no cover letter) just put them after the --- line
and git send-email will still pick the CCs up but they won't end up in
the history.


--ZhGqk7lYBtXKeshE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPp0VwAKCRB4tDGHoIJi
0hv0AP9BsJs+SKApne1B/5qPw5tzPqgF8dkrHmZDpyswXTvZ1AD8CSR4yC0q1TNO
+DjxnBOkx44cBcpZmewCQVdDbx2apAo=
=RpiQ
-----END PGP SIGNATURE-----

--ZhGqk7lYBtXKeshE--


--===============7615336085577531645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7615336085577531645==--

