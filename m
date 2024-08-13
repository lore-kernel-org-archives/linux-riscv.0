Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B728C52D7B
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 20:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+mmrHlQqpWf311wDNaWX9uUwj843novV7TKK4ZnLqA=; b=2QNGCV3DYsFRBFOEIABJg8td8z
	yn2oMLxSPVlhO2IAXfSXyceXu2HghlpeavM7XeO1Df/UXmZivpw0hRlN9J8wUnVy+I8BrKzjCUA3w
	Nv9r3Dpdko/oVFHNRfSpmYuT5akvNC2kSSOXqy/S5klJNY9+FGIoxBHisGkgrAFuyyuw7+zE5PQ6b
	fcV8/Gdsum7uWGy6c/2YpgDvkdZyjyzFSX7pS2j5z24lG8RAiy9M8iDkRlq6zaD+pVyQjetQM2WeI
	UABg3X2VssiXFDT1aN9PXXBhU8Sl3YLz/SL+vcQC3QNAqHOsaR2rca6679Z0FQ8glInVfUAO+ihPE
	r7P1Blfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdy6r-00000004sma-0Cn0;
	Tue, 13 Aug 2024 20:27:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdy63-00000004sW6-3kWb
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 20:26:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 68DFF6188C;
	Tue, 13 Aug 2024 20:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EBEFC32782;
	Tue, 13 Aug 2024 20:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723580783;
	bh=b9/65zj5W7y3m9K1QCNO8Q2g3pMkjwhzHfl+MK7Cowo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K4sXSiNPCVo7y/BPr6l8hxXBaYL6KYB+h7lNqhIkZIA9jp0PPFDkN9gqZoJptkIpU
	 d7hzLzPvW/LkfAcsk+4hpyCCYN58drw2GjpoFSMeTEhGUYlfyMEHGuhCmaIM8pUa9n
	 2yCooRZHutwLdY1vHfy1suN89TgQD9HzmXQ+lOWNEU9OrVLtg/U/TdVl9O/2/9UToH
	 MHBad5GvGmwbrbo/idefhcBI3tEAfSEUaBeMp7lkMMsY2BYc8NS29bX/I9aRlD8y7h
	 1Kmdb0V3OBWChGzRyRtb8bdM5Ci1rKqLEhD3hHevWE1by4Wb9OgFdEK9YZsQs3ZeTw
	 n5S74QBvLtXag==
Date: Tue, 13 Aug 2024 21:26:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: Add tracepoints for SBI calls and returns
Message-ID: <20240813-pony-truck-3e7a83e9759e@spud>
References: <20240321230131.1838105-1-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240321230131.1838105-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_132624_006757_2476AEF5 
X-CRM114-Status: GOOD (  14.44  )
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
Content-Type: multipart/mixed; boundary="===============0526356407305127545=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0526356407305127545==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bj7Z9XFSKFWYyR1t"
Content-Disposition: inline


--bj7Z9XFSKFWYyR1t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2024 at 04:01:25PM -0700, Samuel Holland wrote:
> These are useful for measuring the latency of SBI calls. The SBI HSM
> extension is excluded because those functions are called from contexts
> such as cpuidle where instrumentation is not allowed.
>=20
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

I seem to have bisected a boot failure on v6.11-rc# to this commit,
with a crash before the kernel ever gets to output anything - even on
the bootconsole. For one of these crashes I got the below (which is
actually U-Boots exception handler), but most of the time - nothing at
all. I'll try to decodecode that tomorrow and fish out a config, because
this is either config or toolchain dependant (I saw it in work, with a
slightly different config etc to what I have here).


Starting kernel ...
=20
Unhandled exception: Load access fault
EPC: 000000008020e09c RA: 000000008020e510 TVAL: ffffffff81cbf1f0
EPC: 00000000408a009c RA: 00000000408a0510 reloc adjusted
=20
Code: 3597 01a4 b583 1f45 5613 0035 9a61 95b2 (618c)
=20
=20
resetting ...
reset not supported yet
### ERROR ### Please RESET the board ###


Cheers,
Conor.

--bj7Z9XFSKFWYyR1t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrvBagAKCRB4tDGHoIJi
0pGvAP9I6enEyZuQa0f9l9fmEv9kvOLZTT1Q4nZnyq+/56u/4QD/dgond/OfEUDK
RHZ2lvKQTpBLAMMpK6ElrsJMJT9+LgM=
=2DeC
-----END PGP SIGNATURE-----

--bj7Z9XFSKFWYyR1t--


--===============0526356407305127545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0526356407305127545==--

