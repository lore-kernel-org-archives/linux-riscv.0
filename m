Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB01DC77B60
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 20:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7AcQXKZGkndqyNep2bR8R1o7gJlGVUqayMkajUAq0Q=; b=z+1UHz2PZTKH9SGovoeEvvmI6X
	T6DwFOhctQEbP6q67OntG0v4QJNCxRQmpIkfIur/M8WMcUgc7csO4JMuYtiylugGZD/YJZmJYzh6p
	9yowTpcjg/WqXJwAeJ/W4ZbJpBCyHTKdEQhGCxx+k/RM2ZXYeifeCSCNEEROfy5FOLsm8sye3cGn8
	CemGvjoTWcOYro9A39Euw2EinJvBYDpVkI61VqMrc1s/IaVRu3p277wIAjaMACBn6xloPjqDcJCqu
	l0wpaaTu50YSpMgCxYuQoIsafcR5EFvVFJJV5jXm4XubG50eaNxq5jUJaF6soYbAJMS4JYJv4FW78
	M00J3j/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psUsv-00BkZr-0U;
	Fri, 28 Apr 2023 20:40:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psUss-00BkZR-1Y
	for linux-riscv@lists.infradead.org;
	Fri, 28 Apr 2023 20:40:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F138461485;
	Fri, 28 Apr 2023 20:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5354C433D2;
	Fri, 28 Apr 2023 20:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682714401;
	bh=kRkwhFw9tUt9pvZtFhcCkpceLR2nAirWUbPFJXxQbJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G4dI+QfqK3Jv6oLxF4ejC13xXL1fgemqhUJA52PReaBILgKz5eLEsm7K+fW3PibgS
	 UJADqsAMZe05FvsqIWbhb5swXeFKOE2zkMrPVYRc0J9aBCyGIkRZWFCZkqg01Qk70N
	 nP3YpsPZwgZXkD39QL+OS5aTzt0Om/wn84ySqSzUekF2pvFZRT1PFe7p4JMmOik0Eg
	 VIXnzVQAnhSoiNWs9uyAcQV8iYKP5YMqRK/KUNsHecgj7xK3mkvbkLnN69mUEkrZmX
	 mYEXU3K8jXyEjdVmLA4zX8SKdE2uYI3RMB4b/X3SktdpzKyM9VwaPbEK2zqpVs+cvv
	 pA1b9Z00lMvvA==
Date: Fri, 28 Apr 2023 21:39:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes 1/2] riscv: Fix huge_ptep_set_wrprotect when PTE
 is a NAPOT
Message-ID: <20230428-shriek-thyself-72c092b26834@spud>
References: <20230428120120.21620-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230428120120.21620-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_134002_560283_7CE49462 
X-CRM114-Status: GOOD (  12.86  )
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
Content-Type: multipart/mixed; boundary="===============3038100051322500322=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3038100051322500322==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fGjaU7WWIijtn1nI"
Content-Disposition: inline


--fGjaU7WWIijtn1nI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 02:01:19PM +0200, Alexandre Ghiti wrote:
> We need to avoid inconsistencies across the PTEs that form a NAPOT
> region, so when we write protect such a region, we should clear and flush
> all the PTEs to make sure that any of those PTEs is not cached which would
> result in such inconsistencies (arm64 does the same).
>=20
> Fixes: f2aeb0118ddd ("riscv: mm: support Svnapot in hugetlb page")

For both patches I get:
Commit: 0146c955ff59 ("riscv: Fix huge_ptep_set_wrprotect when PTE is a NAP=
OT")
	Fixes tag: Fixes: f2aeb0118ddd ("riscv: mm: support Svnapot in hugetlb pag=
e")
	Has these problem(s):
		- Target SHA1 does not exist

This particular one is 82a1a1f3bfb6 in riscv/for-next.

Cheers,
Conor.

--fGjaU7WWIijtn1nI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEwvHQAKCRB4tDGHoIJi
0oIYAQDf7qmbUTaa1HnSmVfONfqLSCzj+CzQkZfHpn01h+Kb/wD+NpXUXVSHkCin
5fZlaVwD9P+kj3OpuLKWYyg/4xPAKAg=
=eSUs
-----END PGP SIGNATURE-----

--fGjaU7WWIijtn1nI--


--===============3038100051322500322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3038100051322500322==--

