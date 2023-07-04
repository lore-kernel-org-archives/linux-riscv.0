Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69274C001B1
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 16:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNrhYrwULkkcfvm5RQF5gOnrwa3Bn/3uH9f6YnJ3bOg=; b=EzKgV8SceZFFuoarvYVsmwb66i
	xAMPz0quIWc2xHCZ/k4Ie3hEwooe6JO9k87FC5UWleayR5YeFV85DgHdjO3UXa6sfUSebphs8ZrEy
	U/S2CeIvUS8FiTOBoXJg5d2gelkPGD/xBxuq1VBQorDP08I7fr5ZQhQr1iDCpSbx6GwAv9oZ5N2oK
	aKKWkhEx2nNNEful7cDt65WmAS/EdyoCyIZcB/RbqF/EcLQ+EZEluKBXUrvTMhM/LbxCogKnUppg1
	H/LTgKV/saRR5oMPgYud+Sov1YrAZNZoTa7WF11enkU6wttFS1iwiStw17/3aD8f1CffXXMw6UERF
	/x1sWARA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGj5p-00DqkU-0n;
	Tue, 04 Jul 2023 16:41:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGj5l-00DqjG-32
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 16:41:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4511C61302;
	Tue,  4 Jul 2023 16:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613CEC433C7;
	Tue,  4 Jul 2023 16:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688488888;
	bh=SVPdblX3YDY55Q6UtjLbYsorf7soz2DR4bHIEBjDZIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aHi9lr8nVm6HF0BJ5YxREUODkaqRgT+8dw/G9LRK/hK9Rhku7NT5RIFrHDn3prkoB
	 KHJMZR7UjrV8oMT6KtiNxyQ0rd3c14XgOXshImtCHcikHEEqi4UFaCRRL7tFX8xOh0
	 Q/UJP9W9bIVC1GxQMcBXE+6TtES6HCSNR7tdg217QUu01jVJ20TYimWzjIM97juGMW
	 3H3y+yRh61P/sgTBwSLyeRjp5G3jM3Ll1OqhZ02r1jIc+/tWQ4daLD5n3YtdjMA8PT
	 2cyw06urNulmdbk1bCMaiWEC2Qn4ADLd8PWQD2+YjgGCPplxYr2wEqc6xYA0McJem4
	 4lU946xl2yEFg==
Date: Tue, 4 Jul 2023 17:41:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Ziv Xu <ziv.xu@starfivetech.com>
Subject: Re: [PATCH v4 2/3] spi: cadence-quadspi: Add clock configuration for
 StarFive JH7110 QSPI
Message-ID: <9de02a94-8043-4355-8925-99e0d1ffb713@sirena.org.uk>
References: <20230704090453.83980-1-william.qiu@starfivetech.com>
 <20230704090453.83980-3-william.qiu@starfivetech.com>
 <20230704-gooey-lair-2bc45bbd163c@spud>
MIME-Version: 1.0
In-Reply-To: <20230704-gooey-lair-2bc45bbd163c@spud>
X-Cookie: Memory fault - where am I?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_094130_017411_EB5AEE76 
X-CRM114-Status: GOOD (  17.05  )
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
Content-Type: multipart/mixed; boundary="===============1533859533575601386=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1533859533575601386==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L4GnaeX8yK5XFQS4"
Content-Disposition: inline


--L4GnaeX8yK5XFQS4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 04, 2023 at 05:36:03PM +0100, Conor Dooley wrote:
> On Tue, Jul 04, 2023 at 05:04:52PM +0800, William Qiu wrote:
> > Add QSPI clock operation in device probe.
> >=20
> > Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> > Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202306022017.UbwjjWRN-lkp=
@intel.com/

> These Reported-by tags don't seem correct, given they were reports about
> this patch, not the reason for it - but did you actually check that you
> fixed the errors that the patch produces?

Yeah, the Reported-bys that LKP sends in response to on list patches are
a menace, they just generate noise.

> This particular one seems to complain about a hunk that is still in the
> patch & the CI running on the RISC-V patchwork is complaining about it.

I'm surprised that builds cleanly anywhere...

--L4GnaeX8yK5XFQS4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSkS7IACgkQJNaLcl1U
h9Cwygf+Lj0XeLehyPuY28oqR7nq3BMn39mQIj5yXEW09p/l4CZZw5/nQLPSE4Jm
AczOgbi3beJiQmLD3L3d8BAO8JIHTbTJB+KB45GTL9TAUi35rENRnvQ58BEbC3dw
hGRSzWT4MB6NnwWwB5JncAEACtqgigOD5JVivb11GC6+XmH2A5q4FUP3ZtQpM7Yu
XoD8W7cWHhwFz0K/kLW8R/zSjp3F16C0yl3hZaOyuYvfPO4KqBBjnByCpazTyVFp
bdBGgDDW5slxkRAQco2hUBvqyV6zOdqQv5FXPmw7regtL3fn0OnGMjs3p1jZ0Tdn
Kep9GeD7snkKgqCTvEMXpTvpjBgE6Q==
=dkuj
-----END PGP SIGNATURE-----

--L4GnaeX8yK5XFQS4--


--===============1533859533575601386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1533859533575601386==--

