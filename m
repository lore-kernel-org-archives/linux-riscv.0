Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B08BC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 16:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuxVIKjsEFnp9zFBSLJTjuw6uVKt9QC30mTENj3mTY4=; b=uhZb2wjt54vajQbGPQG/+4aSK5
	Ae+Y0JYyWzoXhFbyrFDSopemYZR6um927yChvPV+BWZIDSTNKzLoXruBkt6ShJerrYlXReV2/08X2
	aPlHtwAKaGv/gJepWlNmmuTlbRjr0De2dtonf30qt6oedOiqO0VnSBOc4GbNtIm1DP012kMFiWslM
	s9WcgRqGSXAYqQzGRJdFYVD3cvZC13jM/CN9gP+YYkPA+LtR+9lAdLl0OU5vxrJTjzfaK2q1GpyMR
	jGtDjcvvHEdmqUO00k6u92khKjF0FA/puwTgwEyEbBC/KjWqiTk/OjU4lWLUMm7R/IYEVQ5O0tyZD
	cLKMhfDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Odg-0000000DIOg-08KA;
	Fri, 26 Apr 2024 16:41:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Odc-0000000DINF-2e74;
	Fri, 26 Apr 2024 16:41:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1BC40CE1B1E;
	Fri, 26 Apr 2024 16:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A804AC113CD;
	Fri, 26 Apr 2024 16:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714149684;
	bh=k1HP50/EGRsUos+ckzgu46eFkX2MgzeubV1KZsHe06A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jv3UJZBI8EoQD+MY42q6VH09SsEWWd86AtEWK6oq2dbKKL/e4hjPAgFOKJVhMJb0D
	 ab0cUjJurgPmRoYwy6jUnWb4pgALss3IOkwhRj2k9ZEii5h0JSzoRYqyzh+6cQxhmS
	 ZmQ8EOvuuUMqSqkrOC7Y45dMBoF4YBKqgOBJ+pTk9CjB/vHCkejVWD47er79laTXFK
	 shybO0cUNhpwWUDcaD0gpO+7ycX7ftLcqppMQVQ0UUTZD7/IcE2Z/dEoKbwkGSI9uZ
	 mTOqN/kNmkgeZaMajFaYM4ILOWADLr+FLfiI77m04kLzGoBQDMkFprvIvDV8tnoCX0
	 t534ELXVIfd3w==
Date: Fri, 26 Apr 2024 17:41:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, anup@brainfault.org,
	atishp@atishpatra.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	christoph.muellner@vrull.eu, heiko@sntech.de, charlie@rivosinc.com,
	David.Laight@aculab.com, parri.andrea@gmail.com,
	luxu.kernel@bytedance.com
Subject: Re: [PATCH v3 2/6] dt-bindings: riscv: Add Zawrs ISA extension
 description
Message-ID: <20240426-cogwheel-levers-948f454caa7e@spud>
References: <20240426100820.14762-8-ajones@ventanamicro.com>
 <20240426100820.14762-10-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20240426100820.14762-10-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_094128_870582_D8604377 
X-CRM114-Status: UNSURE (   7.75  )
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
Content-Type: multipart/mixed; boundary="===============5164577523575604915=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5164577523575604915==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6r9tvAN/HBvHKqJ2"
Content-Disposition: inline


--6r9tvAN/HBvHKqJ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 12:08:22PM +0200, Andrew Jones wrote:
> Add description for the Zawrs (Wait-on-Reservation-Set) ISA extension
> which was ratified in commit 98918c844281 of riscv-isa-manual.
>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--6r9tvAN/HBvHKqJ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZivZLgAKCRB4tDGHoIJi
0tnVAP95swoPxTiUUB+e1S5YEyOC7kzvWJ+sufF+uu4Vca84zgD/YgIAtt5fP8z/
L2jhiF5CyTzyCR7zuNLSwkcta5XVEA0=
=z0CS
-----END PGP SIGNATURE-----

--6r9tvAN/HBvHKqJ2--


--===============5164577523575604915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5164577523575604915==--

