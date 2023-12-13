Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4B4C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 15:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMwzw3gQQIP9o2DcQIzce94Qbi/DEk1QLgkN/2bwTi4=; b=e1ypsHdR/JERDfMzlnmMOzSC6U
	tgYJEEjT1M6523/QE05DalAClATIH3sjucUOmAflXo72ScAV08uPEzWTxAb3NyAvVkDvT5C5gVHU0
	Pb7iibANjqTRmSKsNEbHZF8m73gIBp4sBx9OAoQMfSs/xSLob1TYUhU19SxKVYso7M5FHYgq4h8I8
	TEPHslxoxYUsfk+0ZNn9XQJ1ltFnNXC6CYhOuRMYz3IETf8/Jprwjjro9cDtFtlVC6nuG5E9vALe4
	s0hDB1GqE1c19RmTh1+oQPlbFEJb3TbRueNfB+xHGMBt64LGIqjU0XpsBtRZfzrbbQRvLzknx6Wxl
	GDCrtFtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDR9D-00FEBR-0U;
	Wed, 13 Dec 2023 15:27:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDR98-00FE8S-2g;
	Wed, 13 Dec 2023 15:27:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8773BB818D8;
	Wed, 13 Dec 2023 15:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF6CC433C7;
	Wed, 13 Dec 2023 15:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702481256;
	bh=GwC9beP1ZtHS6nJCGyO7jEKsu1mwjiMJgVNMTsy1Ks0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pB1wmD1H5k4eUMa3eMWOpaiXH2CEzZbEGWVtAw8BWDZslmG4E31qLvtQ+Aj9fAgaN
	 Em8i13DUbC/Y5UiOVi8WMmEHynRSF6uKag1V0bVdlB1c4em9HW4rPtnqmt8W0UaGu1
	 rGFLFLK/BDA4PGAxkH9ZDy32YKiRy6b8adWSXZeYofHoXYylvDiEEnXu7w9cDf4r/r
	 Rsq6ZvDWbV+KmsTgI4SQrsDHQo0vqvDyrP067y19dWebJEacztjqjFxLPfBKJaRylL
	 wuWOpmsNLO78Tg2rWtZfGB003DrP9+6xTmdwC5O2Nj9OT5qX897/VEogfhdLgMRB5d
	 ol3p8E8sQOW6A==
Date: Wed, 13 Dec 2023 15:27:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v5 07/16] RISC-V: Move T-Head PMU to CPU feature
 alternative framework
Message-ID: <20231213-prewar-poison-f2781b4a6e84@spud>
References: <20231213070301.1684751-1-peterlin@andestech.com>
 <20231213070301.1684751-8-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20231213070301.1684751-8-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_072739_008445_28FC1B5C 
X-CRM114-Status: GOOD (  10.73  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: multipart/mixed; boundary="===============3974010900108985963=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3974010900108985963==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6EDO+odeQnJiNPoS"
Content-Disposition: inline


--6EDO+odeQnJiNPoS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 03:02:52PM +0800, Yu Chien Peter Lin wrote:
> The custom PMU extension aims to support perf event sampling prior
> to the ratification of Sscofpmf. Instead of diverting the bits and
> register reserved for future standard, a set of custom registers is
> added.  Hence, we may consider it as a CPU feature rather than an
> erratum.
>=20
> T-Head cores need to append "xtheadpmu" to the riscv,isa-extensions
> for each cpu node in device tree, and enable CONFIG_THEAD_CUSTOM_PMU
> for proper functioning as of this commit.
>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--6EDO+odeQnJiNPoS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXnNXQAKCRB4tDGHoIJi
0owVAQCDfvO17i3JMSLu4ZZtfXLzMJWq4FB1/1qravLNyzJJvgEAi3b0Zqg0JhQ4
v8v858Iyqz0gSua8loF9qO9ppCpUpgQ=
=cK86
-----END PGP SIGNATURE-----

--6EDO+odeQnJiNPoS--


--===============3974010900108985963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3974010900108985963==--

