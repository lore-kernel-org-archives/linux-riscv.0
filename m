Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6C0C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 19:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32cTJEGksMcWVvmEggaOZWK0rX/ZtcPzVIAHNl5Onbc=; b=b3I0hRzAjZRiq5kGNHuUeQq9Nj
	0c3GTgzIiR0Vr2J7UrzXXMv3z5o/1SYE7LsujWihtEA/6AkwfHR2QkxtEkmNl3ezLhrzuT0uRPWJQ
	pn2ZEBxXoov3D100xD3csogeQ3DhRlQr55QxF3E315nQqdcNOs50DreEg5qfwBtAZ8W/xSiDoxIBm
	5UecQoj5Ai5r9K5okCVp1NJBittphEYrrWcKcnZRsWx6k2S9QkfAc0Xxik5srywIKwgYQHeoHG4Ar
	nSuKGxfmYEl7x9QRrJx10oqA7BPy+McK6HfV+Co3ZHmbjkZwG1mVPg+kymLpWn6Jb4ah/bCV0a6Vz
	OH8X0ZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzjRO-00DzET-0k;
	Thu, 18 May 2023 19:37:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzjRL-00DzDJ-0m
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 19:37:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9DD6F651B3;
	Thu, 18 May 2023 19:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC741C433D2;
	Thu, 18 May 2023 19:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684438650;
	bh=48S/trYlbvuQ+ZXi8dbcQuCb+JDmr3PM3R6F8Gzah7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aqdy3kBpe8bJjnSZRCR472aUOMcwzytqj3lSAWroHLhrpFlgh5ghqRzISQzdgp8ts
	 cJjI4z+lZwNPZvgdPO+CEw4HjREH8r0BfH4lh411FBIA9IsUu9Q0lvXRWsbructKZE
	 INA2sWZM/UviEMVJdlsrATPU0/Apg7z3qYpmQV3bqXERJkKLogQS6WHeY8olKETEbd
	 7Wb0oi1XxwKifSGg+nnYzWw9ONs65qnahBdAQwWDuPZeW49hYxBPgQ6Q0oodeTSDSO
	 6yr+vQVwGFUSt8IPnMDB4P9i8fSREpTnNfIV5lTwre/lSw6KKPO1cWGNP+2L4/fOBk
	 6rTFLsFxAhF7w==
Date: Thu, 18 May 2023 20:37:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 2/9] dt-bindings: timer: Add T-HEAD TH1520 clint
Message-ID: <20230518-hardwood-walk-0c8d6400c131@spud>
References: <20230518184541.2627-1-jszhang@kernel.org>
 <20230518184541.2627-3-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230518184541.2627-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_123731_315189_A25184F6 
X-CRM114-Status: GOOD (  10.42  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Yangtao Li <frank.li@vivo.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============8032004259681611889=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8032004259681611889==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XE3hl1LmPqq7FBDh"
Content-Disposition: inline


--XE3hl1LmPqq7FBDh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 02:45:34AM +0800, Jisheng Zhang wrote:
> Add compatible string for the T-HEAD TH1520 clint.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--XE3hl1LmPqq7FBDh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGZ+dAAKCRB4tDGHoIJi
0qPZAP0c/P6VHu9vnZ6dZc+o9GzqiUhmQaEVMAWnHXkRnuG71AEAsfucwpiDftg1
kG6rm5BeQLmS42VK0mHti4Br27u4FAg=
=CdGE
-----END PGP SIGNATURE-----

--XE3hl1LmPqq7FBDh--


--===============8032004259681611889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8032004259681611889==--

