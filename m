Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5E1C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 15:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMBh9NiYjlF8JpGM/fhZfuvIjh7s0UVkSLfgaZBbaVc=; b=KstilPrL+3KXMeNN3IbbTCXdjt
	LGu7YdK4wQmh0u6qr1XA9jlI4YsXOCmu8BWyjAXvxEdq7POsdn/uaLYo0c5eDmYXOmjdG5gpGivrn
	gD2G90z+UG2xw7tqhJnc7s7TrpydxQyhfc1fWmNTQplgb5Q1FJdeWcY63xM9xZQLcRDe6AbJD1oPE
	+ROSb9yPxFbCcndlGzeKREOLmBzdF5wJsffgu+rqKQENXRrf/j8WB50CQPOyLD2WsZsb9SbKuGEYi
	tPmKwZYBv2794ToSBqGZbHemz19a4+u2HsvHYc2Aedo8OGNeR2Jrqgzl8eta7A4t3Ga8caEXU0BbN
	zfU4tiKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg46i-00000001u5L-2nXl;
	Mon, 19 Aug 2024 15:15:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg45s-00000001teG-0tQ3;
	Mon, 19 Aug 2024 15:14:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC3AE60C4B;
	Mon, 19 Aug 2024 15:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33AF7C32782;
	Mon, 19 Aug 2024 15:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724080490;
	bh=S8xLhlX6RpZyNHWb7anPniOddgqkLHLd/F+Q/aXteFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lCYk6sauuzGZXdmOUXd2qTfJWvnED9bat34saswazgl+M63wcMrmkDGih3C8kQurA
	 Y2P6GJV0apLQodqEjQKA4tdHpmZayAUehizPYmJryKzc9k2pe7FjLLsB+nMt+yQu9h
	 6haqcAo1ROW4FSaTAo1ixtaogoPe/ZoVBT9tJrC3lFtzrBO+EUNak/Eatw3H2Lcpe/
	 c/nYpouIZebXmyZmxMOP8ewWLGfSRVwk2VIvLTWpC+zyPpx85rnhXiCbZ9E8XxLZ9C
	 WuivjB335AbSXgBL+2B1hZIrxM8FYBoq6IoTjhDAc4WPE3BbvP3auleWIgXw19OJYa
	 wCRcfVWJ45ZMA==
Date: Mon, 19 Aug 2024 16:14:41 +0100
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
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 18/40] arm64/mm: Handle GCS data aborts
Message-ID: <24d33455-d958-4f27-8a2c-4f237fc2bd29@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-18-699e2bd2190b@kernel.org>
 <ZsMNwAsAWr2IxFns@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZsMNwAsAWr2IxFns@arm.com>
X-Cookie: Interchangeable parts won't.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_081452_405736_2BDDAD3C 
X-CRM114-Status: GOOD (  19.31  )
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
Content-Type: multipart/mixed; boundary="===============8479219509371386431=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8479219509371386431==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ClE/UJ5laHl8PFo"
Content-Disposition: inline


--4ClE/UJ5laHl8PFo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 19, 2024 at 10:17:52AM +0100, Catalin Marinas wrote:
> On Thu, Aug 01, 2024 at 01:06:45PM +0100, Mark Brown wrote:

> > +static bool is_invalid_gcs_access(struct vm_area_struct *vma, u64 esr)
> > +{

> > +	if (unlikely(is_gcs_fault(esr))) {
> > +		/* GCS accesses must be performed on a GCS page */
> > +		if (!(vma->vm_flags & VM_SHADOW_STACK))
> > +			return true;
> > +		if (!(vma->vm_flags & VM_WRITE))
> > +			return true;

> Do we need the VM_WRITE check here? Further down in do_page_fault(), we
> already do the check as we set vm_flags = VM_WRITE.

> >       if (!(vma->vm_flags & vm_flags)) {
> >               vma_end_read(vma);
> >               fault = 0;

It looks bitrotted, yes.

> I was wondering whether we should prevent mprotect(PROT_READ) on the GCS
> page. But I guess that's fine, we'll SIGSEGV later if we get an invalid
> GCS access.

Yeah, that doesn't seem like a particular problem - the concern is
adding rather than removing GCS.

--4ClE/UJ5laHl8PFo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbDYWAACgkQJNaLcl1U
h9CIagf8CVGRJRPIYEL8OXtLlRDHe/BAx31NyJ8PnnV2H/LyZ/HkpxFqkEdopZ2W
SnomGLDZ/Sbry7VZUUVbO9QNmD/7UinwFR26WOigUY8aHtv/SDsMpx68OMvMPGtp
aOgTkLDZdZiL3OZbxsdYj24aQ2gywicEb/JxgcqYwclQvQn3geXt9wvBJIZvUqOI
f9ioaV7/pP5zWb35Kra+jjC2CUxouQ1ozkrxlJhyTT9VM3I4iefpf6eaGmgah7G9
n5vrIJWkdxaC4B8K/p+Uk/2LJYWdvOho+S1PnJPJloXX/3+dCvveT+3yVcEzT1z0
73smiFLb21oBkc5wjzRqiGDdQA7z3Q==
=d5gu
-----END PGP SIGNATURE-----

--4ClE/UJ5laHl8PFo--


--===============8479219509371386431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8479219509371386431==--

