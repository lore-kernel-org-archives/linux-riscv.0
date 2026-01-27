Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A25D34093
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 15:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxYl/WGbEbI7EoU5/LYuHMi6X7INnmJb+6pY7KkXKNU=; b=b1IxpPj8h+r1MmVcoBOfJiQNwx
	K+znleUNrZ+99bDw/M3UVAIcZ1ty2aLQgJFqmCIaSuCdW+QuQxhPBNaW4y8xK9383ooUl097XgxWV
	2VRs4Ym5zWIpqLMYruQxxnzM54HvisoaGZLk2jLVY5GwWbS5scb3cL8gaWwBeylNK8Jn0isv49KP+
	KwQZhEh0eYjWBycWD03hcM95kob9QWdNjlKBYSXTka0V783u77253l/B/xBIdqQO2nKNqtdPoG6Ef
	kEPBCDEhNpXme51BW2VhXjWJSRfr7eNIgXundPxV/FLdcgaC1huImppACnmoAUXSOCY+sItoM51YK
	vsgbTtPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklGw-0000000EZcD-127x;
	Tue, 27 Jan 2026 15:46:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklGt-0000000EZbp-2IOT
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 15:46:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 58DEA600AD;
	Tue, 27 Jan 2026 15:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0710BC116C6;
	Tue, 27 Jan 2026 15:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769528786;
	bh=xnYN9Q0IFOodzxUZqshzGzPwYS+J6zEaW1r71nfonvs=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=KpSEjwuO2DLPWdws9KNxncFhQBmeJyWjiaRU57U9ZiSk/aOLAR3D5L6/VVjAWpdg9
	 SE0fR7mAwkFJK904YIMPBlQlMg5LkyelxCvqdOqcNpv8/qr/GEVEH2jIrU1X2yb45Y
	 kTJxY7mXgvrsTKEiRrJR9K1PQ+Fhf6ynU6oDfX7iFq9Rh8Y9zPTHQc64fnHB2oILta
	 ytkoWgrKHN7mOSfIIswb/OGOd53nQP/O7EYfu3Hj0/yM7Ajfo1FvQe4H7rqeRm38km
	 5vjGyDXOlswDn/FMxfFCbKvkAwzF/xHYYbr+m9y5rNn2oN7/hpccqbI+ngxUrxyP05
	 b3dRFXnXNOM1A==
Date: Tue, 27 Jan 2026 15:46:20 +0000
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
Message-ID: <82d338be-7522-4098-b58f-7759ac4a6897@sirena.org.uk>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-5-6ef787dc6426@gmail.com>
 <88ef974b-9fa8-490e-ba19-1fb31ca94342@sirena.org.uk>
 <aXjRx12yPA7QflaF@anton.local>
 <153acfd6-cb4f-48ee-82e0-0a18a4a1e9c7@sirena.org.uk>
 <aXjZoFi_fq3tzJFY@anton.local>
MIME-Version: 1.0
In-Reply-To: <aXjZoFi_fq3tzJFY@anton.local>
X-Cookie: I brake for chezlogs!
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
Content-Type: multipart/mixed; boundary="===============3427019736533191634=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3427019736533191634==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="251LqXcFPudUkTrO"
Content-Disposition: inline


--251LqXcFPudUkTrO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 07:30:27PM +0400, Anton D. Stavinskii wrote:
> On Tue, Jan 27, 2026 at 03:13:59PM +0400, Mark Brown wrote:

> > It's probably fine to leave the functional code as is but you should add
> > some comments to the mute function explaining waht's going on here.

> Sounds good. Will add comments and prepare v5.=20

Like I said in reply to the cover letter please send an incremental
change.

--251LqXcFPudUkTrO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml43csACgkQJNaLcl1U
h9A7+gf/aT6Tpy/f6zJBaTvksbxv5zRaptPM00kWLv33/krBq7KdJJ7dXCFCSABN
ygRt6v2QDSFwt9p5GfBTFzVDk+NqfbSy8SoCq8uvLN8bMHegR2//u8oY26kaJLan
kH35bpSDk/yPQJ2dq7d9uA4EuWHaj6QO8p8Mo8cBkz2L0gcaM94Qwr4tX8GEDbvL
JUf5G0ChfgHocxo7SE9mN1G2bKXw9CrHGr4mcpa0oUeXI3BvVLtm/74puZKbULE9
3aGOdaHMaPHtz//Di0ak9sF+g86EDESCOqgS5GeFurvySBUDjIPHrsiC38VBSU2O
FFcwKD1BZ/5pP0DNnqqVGE1UXefUwg==
=9wVx
-----END PGP SIGNATURE-----

--251LqXcFPudUkTrO--


--===============3427019736533191634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3427019736533191634==--

