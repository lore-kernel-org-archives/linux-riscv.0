Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0903C25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 17:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8YMhmD9OXyu/K32PQ+vCICDyi6QBwmHztioJuM0D6bY=; b=PDDDeC1bxJWXbAANeO6w74BlVY
	EnuJsItMj3UwUtdXIkSGWmk0hbDbppmMSE7uKQf6oyNNS/9zMGrITGPkb3601v2F0LR/5OX6xTsQN
	9M6cEDxwDdJTWz9PAWqDdaO01pr98k0SAP20GDD3rN8PsbQU5epDGjW/ma6QTWwEcy5o7AjUjfxMF
	B/G8lsSTrKFBTWUotoWMAIt3T2Zspw/FNdZo9pFs+EuRUqLsHtMHF25MbZkuHgeyqF07dfDK8nfXM
	h31VXdO00sbWic5im92qsBUF6RNegjtkNfpQadRZEiwtqCJ5mlbN4T4HwmgUTXbIHi65w/H9wVkob
	/iWjZd3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD666-0000000B0u4-1Paa;
	Fri, 31 May 2024 17:31:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD662-0000000B0tP-2ISU
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 17:31:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D1426CE1B26;
	Fri, 31 May 2024 17:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8966DC2BD10;
	Fri, 31 May 2024 17:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717176674;
	bh=ugKsI1n0ps5BfECIOYx/A6IymgUIGBxwn3EHv/Id8mE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rGf8CKyHFijgLDSqYePnQ5BCTYnBTXCTIR7yFEJknvnNOQ/hdxJ2qZAs0M7kcsxLm
	 pk76gkHxefmIVBYIrtYbxwMb5x2CbUZ7sqalM1gvrqc4uMBNY+Z7fH1UBhsXarwcxp
	 FTLaEWHCxtKiJzjjNd0CIsJJe+3tiWuqjfkoRefwjTFy3PCs6UTm7hi4YqP1XzHG1g
	 eaJ/meSnXuj1Li4yDdzDFHZ0XctqhnbxhWTcPCLffmGOaXdTeCkPH2pEnFnBHvLe51
	 10OondmOCzovC/AY9gpGpxUzdQJSI2OuorxHNORYMDnuHTBbAoNMtyYN5NLjetfX7A
	 OEaogdLCfTaBg==
Date: Fri, 31 May 2024 18:31:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
Message-ID: <20240531-uselessly-spied-262ecf44e694@spud>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240531162327.2436962-1-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_103119_019625_C8A35026 
X-CRM114-Status: GOOD (  14.64  )
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
Content-Type: multipart/mixed; boundary="===============9146099775300677852=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9146099775300677852==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xt66x2nsbKVBAiZs"
Content-Disposition: inline


--xt66x2nsbKVBAiZs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 12:23:27PM -0400, Jesse Taube wrote:
> Dectect the Zkr extension and use it to seed the kernel base address.
>=20
> Detection of the extension can not be done in the typical fashion, as
> this is very early in the boot process. Instead, add a trap handler
> and run it to see if the extension is present.

You can't rely on the lack of a trap meaning that Zkr is present unless
you know that the platform implements Ssstrict. The CSR with that number
could do anything if not Ssstrict compliant, so this approach gets a
nak from me. Unfortunately, Ssstrict doesn't provide a way to detect
it, so you're stuck with getting that information from firmware.

For DT systems, you can actually parse the DT in the pi, we do it to get
the kaslr seed if present, so you can actually check for Zkr. With ACPI
I have no idea how you can get that information, I amn't an ACPI-ist.

Thanks,
Conor.

--xt66x2nsbKVBAiZs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZloJXQAKCRB4tDGHoIJi
0q+NAQDg7dQm4yIuqIpJJUx6xVHNdm7QHRH1oZhb6KTvKdauPAEAjlDPmXth3suH
EyUEa4xRA2F6Bpo7l3BF2i0FndH74gw=
=J8qv
-----END PGP SIGNATURE-----

--xt66x2nsbKVBAiZs--


--===============9146099775300677852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9146099775300677852==--

