Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1BFC7EE3A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 19:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mX4K2eN+R6lTpZfNfqPgTOLT+ZAFwoEUPQLUAn/ySU0=; b=2v5M+8pHp0R2g/8zChOlwE4lEA
	idPHt1lL1Odd6opS9QhuD5mT5oXCeDJ6LwF6vsu2HMLhcAT7ezq5N2j+xgda3s1rFne+z+JBUUobR
	igiEgRHjMKuh3lb3a1qj1oTQ3sV37koI/Nf6rsMdYpWbNcD4zHTI7q5uZ/pcINr+apbttBF4Ci2kb
	xmgj7/dJgES3W0wkwsyalt7SHGEFOf/vprATNKEkDjnRQAX7Pro2kXUAmDSq27Q1TRO983trT8Otk
	yjsVpm4Vegvz0VdBpD9p2XyyQPiKrD0yxqgcO3gPPgmtPLugwd+0CeXW1DZsSRh1H9pBHK7ZNnpzg
	9EyFsFUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTn3c-00000003pVw-3DAQ;
	Mon, 23 Jun 2025 19:42:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjXU-00000003KJM-2Ssr
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 15:56:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C0112A52013;
	Mon, 23 Jun 2025 15:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF977C4CEEA;
	Mon, 23 Jun 2025 15:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750694215;
	bh=1Nx8tTVaDfGB6Pm4/tKLuefdVSnxExj9qww15xiKZcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IIQrAv9UP9HZT53CKDXfj8W/QAph8XrtHU+xsVmcOMpg1hxVwcS33vhhmSWpoBYDP
	 OhTCLzPLYNBG818iXii4xDfSdpmbJeUWQxX98Xoo1OFVCJeLTm34+N+4F2x5ZlTZyO
	 xNJwIQAkEEAsxRXDXFL8vxzjK34GoDNL/G0xbfvPDHkDt95tVszXH0cofADHgFCnzz
	 eD5HQsXZLPe7ID4Phpl/ebhehXBmpHU0EpF6KXM72tDhUil+aNM03XcXyxRS8KAp3O
	 FR/wc2/58+yvG7tsh05PrPa8/7+rJK50AcbGgUGGUd1ysop91Kc/L2Q675PM86qWeA
	 0RpRY4z84e3vQ==
Date: Mon, 23 Jun 2025 16:56:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: E Shattow <e@freeshell.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: memory-controllers: add StarFive
 JH7110 SoC DMC
Message-ID: <20250623-enamel-discourse-3d28517e01d4@spud>
References: <20250606130253.1105273-1-e@freeshell.de>
 <20250606130253.1105273-2-e@freeshell.de>
 <79d84bc5-1b39-433d-afc3-b6ca84f274f0@kernel.org>
MIME-Version: 1.0
In-Reply-To: <79d84bc5-1b39-433d-afc3-b6ca84f274f0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_085656_689493_BCB657FE 
X-CRM114-Status: GOOD (  12.01  )
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
Content-Type: multipart/mixed; boundary="===============1562158319808341845=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1562158319808341845==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5Qxs9Dmd5BdP9ygB"
Content-Disposition: inline


--5Qxs9Dmd5BdP9ygB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 08:45:04AM +0200, Krzysztof Kozlowski wrote:
> On 06/06/2025 15:02, E Shattow wrote:
> > Document bindings for the JH7110 SoC DMC as implemented in downstream
> > U-Boot driver starfive_ddr.c
>=20
> Heh, I totally missed "downstream"... We do not add bindings for
> downstream. We do not care about downstream, so I should not spend my
> time on this.
>=20
> Do not send code for downstream.

I think that's either an accident or poor wording, there's a user for
this in mainline U-Boot.

--5Qxs9Dmd5BdP9ygB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFl5QwAKCRB4tDGHoIJi
0vgEAQCzbZ9M4zBMrRABOtQpgL5FcDJGq7LODPdfsxgn4fgX7QEA0rrRewyTnlzb
OHOKsfAruqdRzwaMVc7+M2Ejd9x9SQQ=
=ily5
-----END PGP SIGNATURE-----

--5Qxs9Dmd5BdP9ygB--


--===============1562158319808341845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1562158319808341845==--

