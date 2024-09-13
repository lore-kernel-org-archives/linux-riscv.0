Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340F2FC6172
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 20:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdl8qhArjKWdDmrFGDvE0PTtctgj2Ch9jW3sVoCpZd8=; b=XvaA8SdaBXK5hMUQCWi+M4PkkX
	gnpXSxJ6O9YNN/SXJFywoYZBN6Ld7bqKT5Qrnul9XNgv8Gv6COjKZXPejD0+7BN16kGSpBjIpeDzH
	ctziwSq9FQ0wJfG61ZM73bFGwCPsiXQjxYGnpwcAHyrCkS55qjqztMsyVezBkIzIhmSmbXJ7vBjvk
	dCmv0iAaUfE8LswwRGzrK3jW4uX3QxCooydXwH+uvovvKCAKgjHsIiKMaL7/rXQwTKdGKAd1d1U3I
	uAe9CZcsgdi9smpy5L1LYYfXFZmKv9gTHSXf92vWcgY9/vDSKqWV4fhQYgUbF3kG6zYhdAwE28OaF
	av2Le/Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spDK6-0000000H73C-1omi;
	Fri, 13 Sep 2024 20:55:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spDK3-0000000H713-3kLj
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 20:55:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5462FA45930;
	Fri, 13 Sep 2024 20:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44C4C4CEC0;
	Fri, 13 Sep 2024 20:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726260918;
	bh=aopswYxzXj27YTJCMD2U69tvjPOb1vRJvbOIEzxXm5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X8H/D0Jz1dIbUFqfZt0x1TopUD28Jmg0HSxymL5pM1RGOq7KnGMYdxkLs6oOQ51WF
	 JkGeuq+ehOg8KwUmbJsA+CDovbNpdf709XuunXepqhh1vwxKu37noAEMUECjQHBGCJ
	 HbSdWiD/HhZJOntuHrskCRFflI3HSYB41ML2sQE/rhmkw5/DBfDlSqHjjf/PvgZSSv
	 0zdy1stfwg9w2xIUeHQTUfSXkh5yy1Ns0yS1h5vQg1TcHUtAAvLhUB/P2swFs5E643
	 vihvlLxTkCLQ8YxkzjojJvo9rgY1HfQi2B7EL4rn5z9HGd8mDUi/xYQda9LjXp9IKw
	 L/HDUYE9zZATg==
Date: Fri, 13 Sep 2024 21:55:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Juhan Jin <juhan.jin@foxmail.com>
Cc: linux-riscv@lists.infradead.org, peterz@infradead.org,
	jpoimboe@kernel.org, juhanj2@illinois.edu, alexghiti@rivosinc.com,
	samuel.holland@sifive.com, palmer@dabbelt.com,
	ajones@ventanamicro.com
Subject: Re: Is RISC-V Static Call worth implementing ?
Message-ID: <20240913-spearfish-feeble-4c0032f37484@spud>
References: <tencent_24E1437DFC1D2BB7528A2A28D503C8033107@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_24E1437DFC1D2BB7528A2A28D503C8033107@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_135520_005051_1BAA5434 
X-CRM114-Status: GOOD (  10.38  )
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
Content-Type: multipart/mixed; boundary="===============2552264077598168619=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2552264077598168619==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QqpRhOTcaGbBCead"
Content-Disposition: inline


--QqpRhOTcaGbBCead
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 03:05:33AM -0500, Juhan Jin wrote:
> Hi folks,
>=20
> I=E2=80=99m interested in implementing Static Call for RISC-V, and I want=
 to
> know whether it is worth the efforts to implement Static Call for
> RISC-V.
>=20
> Does the aforementioned benefits merit a RISC-V static call implementatio=
n=20
> (especially inline)? Or are the benefits so negligible that it=E2=80=99s =
simply not=20
> worth the effort to do a RISC-V implementation?

Pretty sure we've talked about wanting it before - Samuel, Alex, Drew
Jones or Palmer might remember best what exactly we wanted it for
however, as I do not.


--QqpRhOTcaGbBCead
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuSmsgAKCRB4tDGHoIJi
0sl/AQDIwiYUFnBIzSsSid5+oW+9yL/OVKoQ+CIBA9FPQFwFDgEAtnu8Suqqd+VS
zmun8I3E4owtbVNlM+QA/rjtwq7prg4=
=u/AW
-----END PGP SIGNATURE-----

--QqpRhOTcaGbBCead--


--===============2552264077598168619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2552264077598168619==--

