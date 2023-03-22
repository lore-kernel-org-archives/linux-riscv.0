Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31E7C6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 22:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqr7NyqjlY6+CbAmnyfaU7uPny3aX3BFkz6STLFKxek=; b=N1ZlveTRQZjiwsS5A8v4i0MI6G
	0PjconoePf7CMN5fBjsmHk9WvfNQq67p1qq0DmgIB0oLsFgkCtlm48vsoRNoTzxYwy0fSdTRBOBBN
	U1SIcktGqyis3fBYZWHGQJnLYpOoxnt054dq/O5ik9OFO2EKwUQ7hDhKBYZHXZwl0gg0LO2e+arUu
	1Ynyb2lymxm/waclcR9H4TWG1wO8HVxPKTf8WAZ+C9s9dC3C5DutPEuCPDbCnZ8AOtHL+nqudAd/A
	G1xxiQJYq2ul3kYVQqDnTC9KZ4Kl9Yc1iPhQIv92/3tEo+1nz1Temtbn8NhnLolij2IuPxqIO7AQK
	57uqvR9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf6Xk-00HYRf-2R;
	Wed, 22 Mar 2023 22:02:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf6Xh-00HYR7-1R
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 22:02:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BA78DB81E22;
	Wed, 22 Mar 2023 22:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF116C433D2;
	Wed, 22 Mar 2023 22:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679522566;
	bh=hcMZNp9Ksh0riZoo4Yt+LZltGdkzddZrrKlsdq6SSFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SBeFLN+n+5IqXTMSRZF99iAhYSZN0+Ozu3ryCbzt6WCEDt4I+X1bWCEK/0N548dPQ
	 x70PHNbkMmZBHS9Hod1NOld73/3AJcpG4jEN41y1wfIkwYBF0MbM0XLBdpXDdxEkyv
	 LIzhWK4RML4OZXokBhd2Dydd3S+qwp2M9QvP/wnZs4XGvvV4tSqkRyij7RiY2fey4N
	 y736dbmlQE9Bx8Iv+qSoyI7QDMJIxNxZXQiVZIPV+9d5Dm5+dh+eAqYZcym6yT16A3
	 lvou2VM80uY7v66X9hwQt2qOeNua8XA5P6Lht/1sYQXgGpFL5RwQtQiZvukk9IsJkI
	 IMSy7dvbzwppw==
Date: Wed, 22 Mar 2023 22:02:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 19/21] riscv: dts: starfive: Add initial StarFive
 JH7110 device tree
Message-ID: <60359574-8bce-40f2-99db-6d81f6e6c5c3@spud>
References: <20230320103750.60295-1-hal.feng@starfivetech.com>
 <20230320103750.60295-20-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230320103750.60295-20-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_150249_789509_DD4C70E5 
X-CRM114-Status: GOOD (  13.73  )
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
Content-Type: multipart/mixed; boundary="===============1435403941034794597=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1435403941034794597==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LDF26h45g5RnUqDq"
Content-Disposition: inline


--LDF26h45g5RnUqDq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 06:37:48PM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> Add initial device tree for the JH7110 RISC-V SoC by StarFive
> Technology Ltd.
>=20
> Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---

> +		S7_0: cpu@0 {
> +			compatible =3D "sifive,s7", "riscv";
> +			reg =3D <0>;
> +			d-cache-block-size =3D <64>;
> +			d-cache-sets =3D <64>;
> +			d-cache-size =3D <8192>;
> +			d-tlb-sets =3D <1>;
> +			d-tlb-size =3D <40>;
> +			device_type =3D "cpu";
> +			i-cache-block-size =3D <64>;
> +			i-cache-sets =3D <64>;
> +			i-cache-size =3D <16384>;
> +			i-tlb-sets =3D <1>;
> +			i-tlb-size =3D <40>;
> +			mmu-type =3D "riscv,sv39";
> +			next-level-cache =3D <&ccache>;
> +			riscv,isa =3D "rv64imac_zba_zbb";
> +			tlb-split;
> +			status =3D "disabled";

Jess pointed out on IRC that this S7 entry looks wrong as it is claiming
that the S7 has an mmu. I didn't go looking back in the history of
u74-mc core complex manuals, but the latest version does not show an mmu
for the S7.

--LDF26h45g5RnUqDq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBt7AAAKCRB4tDGHoIJi
0qDMAQCIGeIN/1mCb1Q1snEUZqE//3UatgEEoP8CxHntNWLrTQD/XTmZpvTZFpwX
3ByenbwoM1VkdniTFBdF5mZUoMNZQgY=
=8Oss
-----END PGP SIGNATURE-----

--LDF26h45g5RnUqDq--


--===============1435403941034794597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1435403941034794597==--

