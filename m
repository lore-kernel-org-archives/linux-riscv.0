Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBDEC2BA18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 15:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cGk7r4/czbIuo3eFmIU2N2IzJol2es+/6fZUizihMk=; b=XYJywn9TrHO/k3eWo6IZN8igbT
	kiBluz7oQIx4m4hc3yzgYXhHHS8mjBJ/UZg6vwtx/Lo2Gt/h2RzOqth2YxhczGed1SVw1KMqBH8M9
	ygt4aqratsU8nsIceqjQ3p959PF6MJ6tFKh1KrBDVBJfAcigL6aSVokc4XnB4TdsE3MRbnh5R11jf
	CJB7INkg+Rbx88Z/C6g0Cs3E/ttpGFCPzicU/hf76ueraWdv04M0eyKiZG8VSxjGMwipq8aJnM6VA
	rd9D2hRKaI5LHakHMBEi8FqwcytNYGqeVkaFAkEkz+bPPRu8sN/A+Set13E8Hy0tjfz+gY6bmlPUe
	AxGVlifA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJaxA-0000000FeTX-1qCd;
	Tue, 18 Jun 2024 15:41:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJax4-0000000FeS2-1zci
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 15:40:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0F68BCE0E70;
	Tue, 18 Jun 2024 15:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D49DC3277B;
	Tue, 18 Jun 2024 15:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718725250;
	bh=PBBvM5f39oe5lUF+K9oON8xgoBZj4J0hB6vuUXqrQLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ddDwqEe2gkFMjXA4MyFBt1yGVnOByf9vxk0E0rkQ4fd0jWXlTvzDHbxGhlLl7Xw9D
	 EEUjsP1Prjoz8f4Xc+yWjzhMgkslAaTNUX2poZCVpUrTJySXSqa/ZUOd7R/QS83ZLF
	 BNzGt2QeemNKNVg45Q5jwawe4HoJpeAFOp8GXioveszJYbR0ZrSyIgpkfIIf3GEsy+
	 jxmORm3j8U5PUtrc4Ff+N8WlH0a7FezZ4bzTabZxVHUHms9jE0bLiBPg2HbvmdDteV
	 BcFFK3Pa1r0a2KXqpA+D9fSyDJmUx7qnAzF6vn7S5vRR3iHvu9xFtMC5OqGulmbcKS
	 qu2fJLklgyXpA==
Date: Tue, 18 Jun 2024 16:40:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/9] dt-bindings: timer: Add SpacemiT K1 CLINT
Message-ID: <20240618-backlands-flaring-f8b8b603868c@spud>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <tencent_2A51312A21F88DDB7C7D82A2DA8E8EE7B808@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_2A51312A21F88DDB7C7D82A2DA8E8EE7B808@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_084054_710241_AE8D464D 
X-CRM114-Status: UNSURE (   7.61  )
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
Content-Type: multipart/mixed; boundary="===============0424434101742118791=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0424434101742118791==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5X0OydBZoMElPKXW"
Content-Disposition: inline


--5X0OydBZoMElPKXW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 01:20:49AM +0800, Yangyu Chen wrote:
> Add compatible string for SpacemiT K1 CLINT.
>=20
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--5X0OydBZoMElPKXW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnGqfQAKCRB4tDGHoIJi
0pgEAQDITBy4C94fWL4Zq9cGY4dK9mpYG6qHmYAJRQiGswCVSgEAi0g3XPr0hKbi
Cv1izHT7Bm+ZfLed0aUww0mLqrERMQo=
=Ua7v
-----END PGP SIGNATURE-----

--5X0OydBZoMElPKXW--


--===============0424434101742118791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0424434101742118791==--

