Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A26EC3ABBC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 17:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98uyPlFCH19J7JL7Jic6ifGeQkSKwG09KJ8joUqHSiw=; b=cQTL/MZOl93XCigdmOIalLoGr2
	XYdTkhSF4tclogPm+O7KqFNjPTzy5uSve4SomN3F4cDhEuq48ThOlQSRrjMGyuQAS7nutYfWFQOh7
	LibjbnIXvF8DiI4ZG+kr/VKkmn9FIRocQ5CZriBx3GDmv/3ovnr2xdmewag7+30nvOnveY+8jjpFV
	iIjC4xhiNlFi9ejbsfyxGE/BtZhTTn9sKjKnJpSIqSydOCYGpVxqjjCdDOe+CxlC0tEX+zjbF0EMR
	ju24myNdg0OK0ROInm6X81eAUjvdQNKK9zd1cpyW+21wz9YYXj85CTMiZ4F1YeWXALbAoSaM1uXqo
	QCdqhwVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRMg-00000004Pw1-2neF;
	Fri, 09 May 2025 17:18:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPAU-000000040a1-42vO
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 14:57:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E20F9447FE;
	Fri,  9 May 2025 14:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA72C4CEEE;
	Fri,  9 May 2025 14:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746802661;
	bh=2ULhiX/sx2ZhXn330YQk4+98fuJt2QBfaxpf96HwbhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qtOyIt7r63xVa2TFttLbLYvhxW/5E2kNkFc4HgmSapbfi7jbggZgcq5YqP3yC3DCT
	 ADIGRaLdWN5Cd3Ga4+CUSd9P1FJ6QnU+WG0oseq+H59A3UeRxB/WivhQAPs9eJBNM9
	 3q5QGUm/ju2FQJT3QqmXlvcWf8NYQTpIQqll3Qo78SihOzCANPTB2pZUksXpO11rli
	 T0+beAGs2FDsgRFnj41eloL6g+tj18BIu9fwkjhJmV1NoSObduVSYQaanA2pHC4K3j
	 06TFVSva+FZ7dvcajGbcBrlpRcnU1d4FmyZ8dn1YVr5SOV5Vev0xmo+zokVgcO03wY
	 Bh4s5Epe00t6w==
Date: Fri, 9 May 2025 15:57:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, tim609@andestech.com
Subject: Re: [PATCH v2 6/9] dt-bindings: cache: ax45mp-cache: allow variable
 cache-sets for Andes L2 cache
Message-ID: <20250509-anatomy-marry-a4e1513c613e@spud>
References: <20250503151829.605006-1-ben717@andestech.com>
 <20250503151829.605006-7-ben717@andestech.com>
 <20250506-clammy-punctuate-6cb07dd0e81e@spud>
MIME-Version: 1.0
In-Reply-To: <20250506-clammy-punctuate-6cb07dd0e81e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_075743_024151_B698A669 
X-CRM114-Status: GOOD (  15.90  )
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
Content-Type: multipart/mixed; boundary="===============9130942452829452385=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9130942452829452385==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xZGzDY3EIIpq4MLF"
Content-Disposition: inline


--xZGzDY3EIIpq4MLF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2025 at 05:23:21PM +0100, Conor Dooley wrote:
> On Sat, May 03, 2025 at 11:18:26PM +0800, Ben Zong-You Xie wrote:
> > The current device tree binding for the Andes AX45MP L2 cache enforces
> > a fixed number of cache-sets (1024). However, there are 2048 cache-sets=
 in
> > the QiLai SoC. This change allows both 1024 and 2048 as valid values for
> > "cache-sets".
> >=20
> > Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
>=20
> Applied, thanks.

You know what, I am starting to have second thoughts here. Why does the
qilai not have a specific compatible like the plic etc? I think you
should have one, and only allow the 2048 cache-sets there. I'm going to
go and drop this patch, and please do that for the next version.

Prabhakar, should we add a specific one for the rz/five too?

--xZGzDY3EIIpq4MLF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaB4X4AAKCRB4tDGHoIJi
0i+qAQC9iBtavy0hTp+A64DvVYTEh716pjoR6R6D8EMqDgbsuQEA5A0t5+8Bvqs3
WbNQu9XqKvPxbXPdDeX4CzuUZJ+1pQU=
=n5zh
-----END PGP SIGNATURE-----

--xZGzDY3EIIpq4MLF--


--===============9130942452829452385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9130942452829452385==--

