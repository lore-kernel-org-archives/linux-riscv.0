Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA661C02180
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 19:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=OZV3Sp/ryy+VjfUwEiEaMCbiBNRgsXCosWCv0caEiZk=; b=pyZ
	2tIOY4NV2BkQlLlBxEduRcReurUzVK+rpjSTlTBmNB/v29DbLqyekqhsLKVrHuaWUsbAgyK6+RHSi
	8qtU/ahKw/+cF+6+KBnXfFcFOX7rE3opxfRvYX9cdbSCS243lE3G75SlIwv9QiEeKulF7b5vWiqj2
	og31nMi0CQv6YXXuJvMvZTTh4f/ua9H/kikbTnNggdRnUUwp9ff2IOLBcCNOLBj22ieLPqQ0xWCl2
	yA/flvhDdZq8DyLfhf7z9tC/+tiIyWlrxVbkhoxUCPqvwi+UCk4Ky1bEAstBwDSp4v9XkFepMZkog
	XTIykS0d0RxmHb6I5j6HrIK0ZSmHhUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQNH-00000006R78-2XlM;
	Mon, 13 Jan 2025 19:45:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQHZ-00000006QNz-3r7t
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 19:39:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DACF0A4136B
	for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 19:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA907C4CEE1;
	Mon, 13 Jan 2025 19:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736797168;
	bh=EnQ6EzFguWB0qc0KuTyJ0DL23I/BuZggKv030ouBGe4=;
	h=Date:From:To:Cc:Subject:From;
	b=VP9NvslkGRGcW0vnVNIM848dvk5Eo9+lbMGS/3QOUI+jNNBUj1vRF2yuDFSR/Hnbx
	 4I9vNLvl+Qdl04wcMheXkthG5vtcICdvTXY5hAji59NXjP9GfG+kbal7iaNX36ekbY
	 nDwJ13JCmVzJ5suoLwUPXd25J1KtZ4GOagoW3+7Mvbr0mTRITuOfUAdI+IieDQtxpf
	 4UFKYcDkCkRupwmiL/SOVJwvrb9BRpm5HyeHXqKp+laH1mXEnfOlVxEzEy1lyFNlQy
	 3aK1a3nN6ryVlDvAVl8kRPPoDKrXRtZq1cxvMn5kG/YlG/RJpP6CFx2NazyApZ3Hi4
	 0qXFBtJmKsG6A==
Date: Mon, 13 Jan 2025 19:39:25 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V config for v6.14
Message-ID: <20250113-colt-retired-6f95df3dc197@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_113930_023327_BE389587 
X-CRM114-Status: UNSURE (   6.61  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4397786318628887111=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4397786318628887111==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DdzWTcn2EEeSzs1a"
Content-Disposition: inline


--DdzWTcn2EEeSzs1a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Another small one here, just a single patch.

Cheers,
Conor.

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-config-for-v6.14

for you to fetch changes up to e7177ecdd2b73de4e19a02794d29e6c5f06728ab:

  riscv: defconfig: enable pinctrl and dwmac support for TH1520 (2024-12-16 09:39:10 +0000)

----------------------------------------------------------------
RISC-V config for v6.14

One patch, from Drew, enabling drivers in defconfig for the th1520.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Drew Fustini (1):
      riscv: defconfig: enable pinctrl and dwmac support for TH1520

 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

--DdzWTcn2EEeSzs1a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4Vr7QAKCRB4tDGHoIJi
0jsXAPoDThgU02kgzlmj+aSswxThrEgeB7UrSdrrGW5O/T63awEA4YlMjz7bIZ5d
VW1Dq3cDo3KAkfouofmYlVeHtuh9Ewc=
=KE7m
-----END PGP SIGNATURE-----

--DdzWTcn2EEeSzs1a--


--===============4397786318628887111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4397786318628887111==--

