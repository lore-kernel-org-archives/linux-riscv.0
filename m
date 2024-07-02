Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBEEC3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 15:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REK4w8+2LRK9hXPoTV3Uxmj1QNqJyzzYRNdPv5eGfzU=; b=uHombvWBUVF2KlLV4QVi68Nd1B
	NYPEIynnUfI6GxciklLUikHBsctVkKH+0v2z7gERak/LA4hmeQqY8K9K1xfURO83107uInzSJg2oU
	klQRL+WZj3FYaApXdzH3SYi7qS6iJrLPbudFCALPeUn6zPCaF+on4254csRuO2AoYHakApUMvrVw4
	BIvLelhSbcMLSBti68tJ0IY+2LIM8XrFC9tr0REvTDRrD/Vbkj3oeaC/F5LgvkASAz2/9poVgjkW4
	z/kRZAKb2/uKjx4ZDKre+x4SdmUau952ZUd7WAgCFyE/XofNBDiTP1khgtzMyl4OSd25LSjzkmUH/
	+1JQZXiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOf1j-000000077yr-3Piy;
	Tue, 02 Jul 2024 15:02:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOf1h-000000077xr-0tBT
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 15:02:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 79A05CE0203;
	Tue,  2 Jul 2024 15:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D79EC116B1;
	Tue,  2 Jul 2024 15:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719932554;
	bh=ztMq901XmUFB1BuzPipFR04mykoZrcUnpHnDqCoR3FI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t6+rSvzrscxfKsOyntILw2yEyYa2bECDdGf8HrqfOaLd2CfPjD6pNgXxf1Sz06+/y
	 bUfdSoCvAj+/vSE+h6WNZNTQcuiWjCMkaWECQiUEsgRUah77RLElTzuF2vE3fV9TnF
	 hVaEE6xO1kF3aFfjX2OlS7SvitwVjgTRaxf+pMFtn2cChaSnEACOlovUfIhxu3JPyI
	 tz6DtPoo1KRfqCKVo199acbNJlcac8p7PWeTYIYd1SkfpdYF6u2FFNNoYGhy44+QQR
	 0b9PARwt0+91sxNI2XQnfHpW6aby7rUjQhAL0TdwdijM9bxzbgjUzEMbEraek696ev
	 8Ns5Tt3zJE4Dg==
Date: Tue, 2 Jul 2024 16:02:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ved Shanbhogue <ved@rivosinc.com>, Matt Evans <mev@rivosinc.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/4] riscv: Add ISA extension parsing for Svvptc
Message-ID: <20240702-reset-skirmish-74c6a30b41ad@spud>
References: <20240702085034.48395-1-alexghiti@rivosinc.com>
 <20240702085034.48395-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240702085034.48395-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_080237_451065_2E054B83 
X-CRM114-Status: UNSURE (   8.28  )
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
Content-Type: multipart/mixed; boundary="===============5325964355943749222=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5325964355943749222==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xgGaz+REe5RWb2vu"
Content-Disposition: inline


--xgGaz+REe5RWb2vu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2024 at 10:50:31AM +0200, Alexandre Ghiti wrote:
> Add support to parse the Svvptc string in the riscv,isa string.
>=20
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>


Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--xgGaz+REe5RWb2vu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoQWhgAKCRB4tDGHoIJi
0ifAAP9plyA2m/vt7qY20XZcvjGlyy0qgUy50Xu5Kixsyo4MeAEAuTY4Ovy1WMj+
EW0wPL8aWFktQf2DmAJj/JhJcA9QwwE=
=F09G
-----END PGP SIGNATURE-----

--xgGaz+REe5RWb2vu--


--===============5325964355943749222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5325964355943749222==--

