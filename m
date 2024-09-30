Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE546CE8347
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ykTq6xyclEQItDIttphhdmCA2V/PjzdeToiLL3mcFE=; b=kuzKKyvKoJv32Jgsw0W169pRek
	51sUbPov9K7D1O7L1HZOfmW+yxZ1GA2y0ReUFjfa/zKSkWV7mTKvcE8CR4telAe26LDTr17WAzm1I
	nCQoPL4WXYqvbslyoO4gtqSjZSbQvuLm31lF/ksy8J5dEMd0jJb3ZnjFcvbC9+ZOJ1QYPrpKl/7c4
	DW2hDevMDPmAncUb0ul0Y+bqNYsV1WAQobyqr7GCEFK9RuIYTFQfoNV5P6EFvPwySCvYLtEXcjrIG
	MKMkHHFAPIffn2XtwS5FWefAh2D0EsPh1iJVIqr6dj/MfulyOhj3P4frt9MaJDVs7BgDGW2yi/6Tt
	A0wkxplA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHAd-0000000HTIi-2jw4;
	Mon, 30 Sep 2024 14:14:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svGtC-0000000HPgP-3eGU
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 13:56:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 88CD3A425B5;
	Mon, 30 Sep 2024 13:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D16C4CEC7;
	Mon, 30 Sep 2024 13:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727704597;
	bh=30NRGciFseMG6N93v1AGJlHJgDFYXppiGH3pl4yPVmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gy/sIJZPJEMVZ6DUdpwMWiGXhzqjz/ZnXbd/KmR4OT7m2hpqg0qXpvVEFWBZsISpG
	 d38jzm8a7GrBr4BPoPbt4rNq3nEiQIEAEKs2q7RJRpjT5L5rIJspmfK5NbxES++JOe
	 EySB5iN8yw8ElrI0Q6coqOv6KD3HdngTTT61c1KB3+Z2lNm79pxVEoCzzfUkWaw/SP
	 bkYewUeUmUxy+8b0ESzczObsd+VHjKh04IcY0W4PTZIj2BSF19LjKyCI7KHurcvOwr
	 Yt6jZLM/zG5exmr8xI6RUDkukey75j4cf+L9cS7HpJo+/mT6wZXvaiupjZpl23z0Nv
	 U7vCmKSrutetA==
Date: Mon, 30 Sep 2024 14:56:32 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [linux][PATCH v2 18/20] dt-bindings: interrupt-controller:
 sifive,plic: Add PIC64GX compatibility
Message-ID: <20240930-flashcard-pediatric-98e9f5840ba2@spud>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-19-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240930095449.1813195-19-pierre-henry.moussay@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_065639_001047_F888CC8A 
X-CRM114-Status: UNSURE (   9.97  )
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
Content-Type: multipart/mixed; boundary="===============5434256069358813404=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5434256069358813404==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NcogEg1qfug/E1k0"
Content-Disposition: inline


--NcogEg1qfug/E1k0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 10:54:47AM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> As mention in sifive,plic-1.0.0.yaml, a specific compatible should be used
> for PIC64GX, so here it is.
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--NcogEg1qfug/E1k0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvquEAAKCRB4tDGHoIJi
0phxAQDv1/ocSlJFG3Wbb3BrbFvRTascd5cVGFJFD/sQy8o08QEAoHHsHlMeyfk8
FXkvbGxJnyxKymhOXgPuYFjYiq3/LQk=
=YfCP
-----END PGP SIGNATURE-----

--NcogEg1qfug/E1k0--


--===============5434256069358813404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5434256069358813404==--

