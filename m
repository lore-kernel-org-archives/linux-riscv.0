Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00E9C3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 08:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCbVsKBIasCnwHyHPpzgEV9uTr+ucBqteZ/oC+gjZFk=; b=xMXOacOEXfHxIfqPEs7KnJQdk+
	UOJfdVpAPswJretlh3zvsT9Vl2Pvx0ie9nk53bHP2Iadam2Ni8nG7GoqwYStNv4k0ZsNphnN5vlAz
	PhNcKjTVL43+iHEJimGTHMt1WCqrnOnnvtf1z9Jhwx+KU51TQFL0clb6i3aykd0xrxoNNdI+JvzZf
	ZFcfm8hVid3iOwW5TGKMUSt73GaQjPwlZ/w3ziaXdfUUkOwI+Riwass3/WiTROG1lPeMzQCSW/Nt+
	zBJ5hDkw6QObEFgjo7gYiBJhv1rnMQ+WLRm7ILhCUJydyQ/8xakTqfk6WZOr3w3gf0pkfCCsuUOvE
	aLIzGh2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVort-00000008xkj-3jmp;
	Mon, 22 Jul 2024 08:58:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVorV-00000008xc3-1ITf;
	Mon, 22 Jul 2024 08:57:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C6C9601B9;
	Mon, 22 Jul 2024 08:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0CFDC116B1;
	Mon, 22 Jul 2024 08:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721638660;
	bh=5pdsAMvxf33KPLFdJQj2/+6yZV6fAT2tSKEZ5x9YW2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZHxO8XN+foJShMt2aKArXK1IdXRzJuQU27YCTJfFZwoQ7H7WCy+u8B9jpMyN4Efv1
	 0yLHsB6MMrCBmpo0ZPenUlRjMWqnJh1Y9wc2R2tD0Rva4o+1LslX8kXPiTv+MVae33
	 /8JuTUH2tJO4E1OweFMqLlLI3WblfWfg3JI2icKOLinTi0v7T9QoBdk0QchjJLeqwE
	 dxBRpwjbGqPp+bb+NIRUsCl5S6uDGSt5Km5nUfoWpkzN8mXi2qjxgrLJU7L6CfTXfb
	 JiyDmcT8gUs1CNjlwNzwaCMtGg8tmeq28UIbtrSDs0nIjnNel0R194B4XgVpFJKSUp
	 SfzKjLHHdmA3g==
Date: Mon, 22 Jul 2024 09:57:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v9 35/39] kselftest/arm64: Add a GCS test program built
 with the system libc
Message-ID: <875ccce5-69ab-4a43-b49c-977036df4173@sirena.org.uk>
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
 <20240625-arm64-gcs-v9-35-0f634469b8f0@kernel.org>
 <87plray8we.fsf@linaro.org>
 <a1ee93ab-2168-4228-a4e8-eab02c046bd3@sirena.org.uk>
 <87ed7qxrlb.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87ed7qxrlb.fsf@linaro.org>
X-Cookie: Everything you know is wrong!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_015741_422869_EEAB6FB9 
X-CRM114-Status: GOOD (  13.87  )
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
Content-Type: multipart/mixed; boundary="===============1757414528247916929=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1757414528247916929==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mfQxvhGMKqgo3PYf"
Content-Disposition: inline


--mfQxvhGMKqgo3PYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 18, 2024 at 07:28:32PM -0300, Thiago Jung Bauermann wrote:
> Mark Brown <broonie@kernel.org> writes:

> > Do you have THP enabled?  That still doesn't work (I'm expecting it to
> > be fixed with -rc1).

> I did have it enabled. After turning it off in the kernel config, the
> test does pass. But I see 30 lines of "INVALID GCS" in dmesg while
> running it. Is it expected?

Oops, that's a debug print left in by mistake but does indicate
everything's running well.

--mfQxvhGMKqgo3PYf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaeHvoACgkQJNaLcl1U
h9AI+wf/RBDATTODyaTvKOScU1coj20M1RS7G89cHABna4bQRQtFNmjI7sd2fLpl
JqGje1yPm1EVEweCnIKuP7DURmfjm7EYn+WqebEBO80n/p+2Md7qAy61du1uJEuV
MlqV44RmEi/pKozAa0EFjN5rS14u0w86Up9k0SJEBX+0SjpZrUWhpkUQyj+B90B7
WHY8XiMIv3UDvcI9oPowQAJuvIfM7hl8JD7njibxQX+fqex+DY0C1p0MOG8BQ0TM
9Y+eI9rkpz8eDXTN1Tcm5HnTlBn5UJhFsuWnyZSkJ2jVXSvvYSieik4QRH9U4rqj
tAPxlFXuzQeJGORQnqNCvINjO9Cc5w==
=RXC2
-----END PGP SIGNATURE-----

--mfQxvhGMKqgo3PYf--


--===============1757414528247916929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1757414528247916929==--

