Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643B7C4167D
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 14:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7GeGFMnnmo7VQXyRgyVhfZnmRApiBDch6GDT3Ncbug=; b=kMQd3Qs9RgX8BV9Jqvyf3KPUGg
	aGpqOh6rwukisZc92fxBwUlof/5Pa62eQY0dJpuP664xzekRx6lrpShU23Bzp5uNl9wMvFAB3mRDy
	6d7Y29XWXziYJdgN3WLSDGxUmtB1TLzFRBtApNhnyQeBcZyJtf3OV74JpJu7kTtjUaVPgk1dOb6J6
	ajxnVPCPi4vNd0o/Z3OXNe80oObBE1JzDK/diybhLjwFMYjULJHJ6JR1apT/4o+XWCuCmR77OfZgY
	+GMjIPP1iUpiEGCyKL2iQ8myukoFnxIRCVGmugvuu3rSq9AfFDt8uk3sUI8o8ej92zaRAxgB3wzwk
	jSk9PGqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDmRr-000Vtf-0i;
	Thu, 14 Dec 2023 14:12:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDmRo-000Vs5-2F
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 14:12:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2F7C06228F;
	Thu, 14 Dec 2023 14:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94130C433C7;
	Thu, 14 Dec 2023 14:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702563140;
	bh=kURWfUajABccOzK2w+kJIDkLS9dQkFuhmyqOgcPhtJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hvw/RmvahaG+vJo5uCzSEKnmWfsd+/U85LYZrRyvzhp6UKXlQ1yeeAuNFUnNwVRX4
	 faMVtWMdLfoiMbxF2UrVXJY9j5g7EGRj7vjWzPlvOd2/qJfcweIVDO/Zav9+pTLVT5
	 KD9paXFbuWHEl+qO3p45SWuYLD4ikogILu6GXApdBVB3b7LGz3QfULj3y0C6minr8W
	 TEqF32ejdsEb5MVuzWSx5I/PQQWzAxr3yu4zHXFIhLcpf/SiRDrb0ZZDGOXDtxCVWO
	 7tHe8IfSwKq/MQZZJt9moqTupXXNYjs5Iy82kL20rZlpRIwJ1lfr3BYJduNqMklMU+
	 u0vlaMrAMT8rg==
Date: Thu, 14 Dec 2023 14:12:15 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>
Subject: Re: [PATCH 6/9] dt-bindings: riscv: add Zacas ISA extension
 description
Message-ID: <20231214-plywood-little-4fc5f6866938@spud>
References: <20231213113308.133176-1-cleger@rivosinc.com>
 <20231213113308.133176-7-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231213113308.133176-7-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_061220_777146_471BE57C 
X-CRM114-Status: UNSURE (   7.88  )
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
Content-Type: multipart/mixed; boundary="===============3669356129647026705=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3669356129647026705==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WsH5yL1is2A3wdVm"
Content-Disposition: inline


--WsH5yL1is2A3wdVm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 12:33:02PM +0100, Cl=E9ment L=E9ger wrote:
> Add description for the Zacas ISA extension which was ratified recently.
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--WsH5yL1is2A3wdVm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXsNPwAKCRB4tDGHoIJi
0l8pAQDb06YZM3zu81dwFpDCL6dk+ww9ScWul2gsUo2Cm8U2NgEAjczxPKOsp6/v
ARmSuUG56RnA+IZRScFD0UD7oxDG8g0=
=SBUH
-----END PGP SIGNATURE-----

--WsH5yL1is2A3wdVm--


--===============3669356129647026705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3669356129647026705==--

