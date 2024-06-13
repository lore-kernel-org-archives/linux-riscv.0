Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840C1C27C6E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 14:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9vJ+kaHIp4fu9xxvr8GCsy1u2BPQZVVwyjVXMc/N5g=; b=Ql3Bd/3UvF1PXeFbzU6XXXV7to
	6TvSI3bnjdFR5+bgQi4MonGTFj2YQvfdHC8OjqY1+wZVZS/JeMX86QlkWGAPZ9DdJGMxEgm1RTi91
	Dw+nk5lLlF1Et0v2teJhIm1d1X9lJvnStMjlzpgjIHr6LlGivxWPHPTIZdai2i3uUmdMEWy3TSSmW
	FLNBJu8DlsQ24vQGERdxV7354c30adFeNlI+1eumQmHBIzIS6cftEdVKOku2HvdBispxZMJ71arbm
	MjXXwzmFjrchdZU4y52m9c4eVRakZHT2lsoy5foXpSFdxLbe+vRVa49cGk7KyvftQFIOGDxQ3V8SO
	Zhgqf7mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHlgo-0000000H0fa-0zvy;
	Thu, 13 Jun 2024 14:44:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHlgl-0000000H0eb-0UYt
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 14:44:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 94A40614DB;
	Thu, 13 Jun 2024 14:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A282C32786;
	Thu, 13 Jun 2024 14:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718289870;
	bh=yWSohq+9rzlktRl57vGSLSRf01m1OZRSVju2Mkb1OEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r976s8pP9rjrr7ALu3lQ5TJkega+RsnW2+KqzXAeqDnaHB4R69lsHN3XC4Xq1nwhf
	 MotP/XQVdSzxRtALOPdnvavj7wHt/z2r5q29SFY+80QMmhziwH+UUZmLHxf/fejIy/
	 BDcnBAGgwIii1kns9zAxsMdcyFofik0Y+ZfunmRb9EyNybwoSEVYeUtAOTZZ89JHpn
	 PTOz6PSpQlsabiTx/xYD7vPIUYbTQsn3+aFNmKACNaZbqRwvGES0Ujkwd2kmjMQktn
	 DjEhgvs/S2ZV46YLsMFaAjkQaDqOoASlFj9BvQjgeTd8nXEpMFlvc2f+bomhgM2cLe
	 VL+Ffx0QlqWng==
Date: Thu, 13 Jun 2024 15:44:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <20240613-award-dubiously-49252229b020@spud>
References: <20240609-support_vendor_extensions-v2-0-9a43f1fdcbb9@rivosinc.com>
 <20240609-support_vendor_extensions-v2-1-9a43f1fdcbb9@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240609-support_vendor_extensions-v2-1-9a43f1fdcbb9@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_074431_296456_2563BB85 
X-CRM114-Status: GOOD (  11.61  )
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
Content-Type: multipart/mixed; boundary="===============7404046554570401316=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7404046554570401316==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m/3ptYUdWpWGnqQv"
Content-Disposition: inline


--m/3ptYUdWpWGnqQv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 09, 2024 at 09:34:14PM -0700, Charlie Jenkins wrote:
> Instead of grouping all vendor extensions into the same riscv_isa_ext
> that standard instructions use, create a struct
> "riscv_isa_vendor_ext_data_list" that allows each vendor to maintain
> their vendor extensions independently of the standard extensions.
> xandespmu is currently the only vendor extension so that is the only
> extension that is affected by this change.
>=20
> An additional benefit of this is that the extensions of each vendor can
> be conditionally enabled. A config RISCV_ISA_VENDOR_EXT_ANDES has been
> added to allow for that.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--m/3ptYUdWpWGnqQv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmsFygAKCRB4tDGHoIJi
0h5fAQDeYsSVtPQVBHXjvECQRibHazGog0hdC8ToeSy3Svxj+QEA+ANOFwkbAuZq
Nz2CAa9yaR4rlEda/iWTRhGgXvTvKgQ=
=NpFb
-----END PGP SIGNATURE-----

--m/3ptYUdWpWGnqQv--


--===============7404046554570401316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7404046554570401316==--

