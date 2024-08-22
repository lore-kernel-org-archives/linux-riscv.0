Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F160C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 17:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpVUuSzaqdd43fEbt4qko+Endtg6VG7lI25tNWb0y90=; b=PuiaDIzjMPxjLQz5of2skLY2SV
	qSWFyX7cK39nOd7GTtJZtfDfCkUeyysr/rTqaDknS5ujGqNPSUOqbeXq9bSjAidlhlu9b/QPezuFF
	f7MVfXUnzprqa6aRHUTCQ746s43OI71lAhkCs/9W6wHczks8Rz0XI750jUJQ4VvQN62pqkdiXycfq
	LBFki+W7DWTOq3EqSE5nY1D17GMuFZSC8pV2DS9lr6eQPGLDaQbRWjPFiUy1XRXhvA57WbNdkvo84
	T8Gxx5JHlXJ0kiI2BCajMBRh01UPetkeRKj9149r5CUEvo1nYl6OIV1DiEJizb+jMP5fuI1yVGrtP
	D8Hhi7JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shBf2-0000000Do0i-2XyA;
	Thu, 22 Aug 2024 17:31:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shBeG-0000000Dnqk-3dMI;
	Thu, 22 Aug 2024 17:31:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B9C39A4049B;
	Thu, 22 Aug 2024 17:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85044C32782;
	Thu, 22 Aug 2024 17:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724347859;
	bh=NEmbbg8L2Bfrsg3LdNNpLmYp7+z/wYUOhdnFgomJAhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ikqtAQwtRrEpLzRohAGA+qNmOG+TVb1qThYeB20Y/Rk8LI7FU0VJET/gHeWL16BXq
	 QZJfX39NMfafJ1FzVkN4ltE2CZW3ItKeVYt8IycDgCeLLfuh0r2uRLDWZ04/PypHs6
	 s+MGNZPewB6jtWVhV7hrSdK3dA9ZJDHvvHhPAtsfxbo5lcriqWLIPch63YvNEb7bvj
	 mKT4+II0xSVQPbirmPqGpXOCJtrJ5BOwbz+S2JpDOkZcFSQI6txfB5pByPQr/Jo0Mu
	 8SvR/xM9sWHMARckle6xSHr228r6G6hj9zO2NXqWhsK7TG51FQwJDp+RQ7WZOdHsEf
	 rIBkFTrNQkZOg==
Date: Thu, 22 Aug 2024 18:30:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v11 19/39] arm64/mm: Handle GCS data aborts
Message-ID: <Zsd1zxJ1n5-_lpbx@finisterre.sirena.org.uk>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
 <20240822-arm64-gcs-v11-19-41b81947ecb5@kernel.org>
 <ZsdjbsDrMWgBU9Hj@arm.com>
 <Zsdq4ymaW0vQffH_@finisterre.sirena.org.uk>
 <ZsdzKrTbrolW0lHn@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZsdzKrTbrolW0lHn@arm.com>
X-Cookie: Your love life will be... interesting.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_103101_052524_FACBF7E5 
X-CRM114-Status: GOOD (  19.37  )
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
Content-Type: multipart/mixed; boundary="===============0848035494854181919=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0848035494854181919==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QBL8uS70EYGjHk3p"
Content-Disposition: inline


--QBL8uS70EYGjHk3p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 06:19:38PM +0100, Catalin Marinas wrote:
> On Thu, Aug 22, 2024 at 05:44:19PM +0100, Mark Brown wrote:
> > On Thu, Aug 22, 2024 at 05:12:30PM +0100, Catalin Marinas wrote:
> > > On Thu, Aug 22, 2024 at 02:15:22AM +0100, Mark Brown wrote:
> >=20
> > > > +static bool is_invalid_gcs_access(struct vm_area_struct *vma, u64 =
esr)
> >=20
> > > > +	} else if (unlikely(vma->vm_flags & VM_SHADOW_STACK)) {
> > > > +		/* Only GCS operations can write to a GCS page */
> > > > +		return is_write_abort(esr);
> > > > +	}

> > Yes, that should check for a data abort.  I think I'd formed the
> > impression that is_write_abort() included that check somehow.  As you
> > say it's to avoid spinning trying to resolve a permission fault for a
> > write (non-GCS reads to a GCS page are valid), I do think we need the=
=20
> > is_write_abort() since non-GCS reads are valid so something like:
> >=20
> > 	if (!esr_is_data_abort(esr))
> > 		return false;
> >=20
> > 	return is_write_abort(esr);
>=20
> We do need the write abort check but not unconditionally, only if to a
> GCS page (you can have other genuine write aborts).

tThat was to replace the checks in the above case, not the function as a
whole.

--QBL8uS70EYGjHk3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbHdcwACgkQJNaLcl1U
h9DRZgf/cfCggcnTIkzrBOCGpdBnnvrHenLxqYdUHuYxfAA/f/+OY6Ryiz7GiVVN
dsEg7gYHWwsk0cTwEgGm++++b84foIZ1WeBZ46XlkFKSK0McT1h01SxvUqi6bu3R
Mj62HWq2M43bg8tVzjIsNFMIZKxKg/8RJVKFsg0KTx/Y4JLXoJkLtplgh4eCuxh0
Xg0yYgmx4aE7JOYegrvzRVUuj0F6rT8Io3eU7LbdJ4GpP28wCf6jVymCjyhQOHav
sWHIP3j85jUutzI9HQAsfUt9BnT6GMnKfu16R9nOAdGgfc/XMzzW7lgzRJhLeroa
kebp1dN/8F8ek5AKqLqstfOmgDdTzg==
=+1Rr
-----END PGP SIGNATURE-----

--QBL8uS70EYGjHk3p--


--===============0848035494854181919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0848035494854181919==--

