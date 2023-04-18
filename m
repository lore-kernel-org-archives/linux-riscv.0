Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EADAC6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 19:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVVa/K2V1Y33y8Mz0GUmHFYpMZbeO9z7wfGdERbAT9w=; b=aEPrKP1TBJcUse1ZDPzdjLb34D
	Um+QqGvTSxofMIHCEFAFqBH5e+wA1AiziQphqOkjVOtgQrF6+/2j3fjviy4UsESGB/OrAWAER/V9W
	H2Js1te8p0AMR/tNzD9FizLOd6Z5carMCGGK4cClQqASrD4nVciG2MVYaM5BBW1ex+GIw8GMH1hey
	n0IraikZB6X3O6w015824IcKubJP8PviyZZtZ3cGMvMc5R+Okp+3vusKoscU57veDXw91htpqlt9U
	L8e73FU6CeZqfcPn6b7dZBJ3EDkom+jDlxpSf1Jnhp9SYKv9iKYd3w8XcdQACVBnkONgSoDP0Jqj6
	MmWVJEvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poqhP-0039cm-1k;
	Tue, 18 Apr 2023 19:09:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poqhN-0039cH-2C;
	Tue, 18 Apr 2023 19:09:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3719262F68;
	Tue, 18 Apr 2023 19:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D648C433A0;
	Tue, 18 Apr 2023 19:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681844944;
	bh=I0vnT8cHsMYExeNxLBzReJ4quXj9HyOpVTO+BVl/vOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Epbb9nuRqbfIeDmmsBgT8S8J8O2tL4aTJROrtxoFKr09H6PejyWm6SGd7yCmM6hOa
	 v5rIxBk/1FSp08d+pUGpvXAxHh8MHRffgfCP+XsIU6n206zcSY75SqxqC7TjAFmepK
	 jRuEn3TfPivI2LnWUwHHlp3vZ8NlhG1kOhy2Q0ZsBM+1KDfAPShj2C9/+qO8qF+gGs
	 RiHIip7Xc6kp3eLDBF06Eb1b2p/BE4PaDqJWPsY7znSfshCPVxmKA9OJ0zUKimxYsp
	 cQIor2FO5QOixGqpDZbkAkszlrrTyO8Cl4jI/06ugtOUzJHh7wC9lQJJCJXFTI57+u
	 f8j26fn2z4ZqQ==
Date: Tue, 18 Apr 2023 20:08:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: Re: [RFC PATCH 04/14] RISC-V: paravirt: Add kconfigs
Message-ID: <20230418-bonded-deduct-b771c133ccf4@spud>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-5-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230417103402.798596-5-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_120905_763226_A9C80AC6 
X-CRM114-Status: GOOD (  10.33  )
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
Content-Type: multipart/mixed; boundary="===============6940016130312770451=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6940016130312770451==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Zlx/hoANUd/2y6aN"
Content-Disposition: inline


--Zlx/hoANUd/2y6aN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2023 at 12:33:52PM +0200, Andrew Jones wrote:
> Now that we can support steal-time accounting, add the kconfig
> knobs allowing it to be enabled.
>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Surely this won't change even if the SBI spec proposal does, right...
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--Zlx/hoANUd/2y6aN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZD7qywAKCRB4tDGHoIJi
0j8UAP956lGa0T0gUM23Ky+KYcQ1L9iV5MArA6tshMOgnE+6iAD/Q/YzAhnmZHIv
hVaGqUFgDF2+G6KPEswcvpVgQPHslQc=
=2etM
-----END PGP SIGNATURE-----

--Zlx/hoANUd/2y6aN--


--===============6940016130312770451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6940016130312770451==--

