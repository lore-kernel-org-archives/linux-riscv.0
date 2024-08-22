Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C8AC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 16:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSwZCGpZRCKNEbiICln1Yj1KyhHuVNUpL7Z1ecrVezo=; b=K81wp6ZVjFPwVmIPhJql8fxd6E
	L3Pnx+oXgBAJBv14diyDBAk04muKWvOABNtL5CTEwrfAF9/xlfUaDF0AgTDK8URM5UzjXoj36ReJY
	LT7JuGThsxg7/FsNkPnZRGPVCWyANUb+nEzG48BlZrInrxoKlF+6WD0jDv3APlLvJnd++mLQRa3aw
	V9Tt1r6j+lUWM+yNBOEhKOT8chrfOXMsXZgkHgjRfRLnzCPt9qv89WPxguZBcGM30Skc+lMPA9B4P
	GHWYLjNfNKvjyr3y0CnJyktFv13XptmQEOVAmPQQsRfmkHEyBEMVpNB8VPgH2msFrMf1HtN1osyZx
	VyhKbEwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAw0-0000000De9M-3vRn;
	Thu, 22 Aug 2024 16:45:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAvC-0000000DdpR-3CAv;
	Thu, 22 Aug 2024 16:44:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D303ACE0B7B;
	Thu, 22 Aug 2024 16:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80409C32782;
	Thu, 22 Aug 2024 16:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724345064;
	bh=5nVMn4LkuuoZiKq1lrBVs6QotPTnawufcHvhIzc/8+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pF/ody/9/o+/aOJwArsMCPFpQwT0EV8UZiSyMkWuRkDtaA9zA98X+68GNesul+qdI
	 j359/Vz+Gg/HlVhmwMmcZDq+MII6ZkB1sdpS+muocrnk+e0OetqMq6OMevkFZ1wlxw
	 rJjRMNbBUPb0hCeLZmKDpONpxkKiB4/L1XTe4iir3IjqZ+wS5gH/zukRsz1HNYuV/A
	 L0BeUNIgcvmdLlyd6iSWGzrpfaaUh5HgC27f/N/wW7ML7feQU/1eiGe0y6HbmsDWuP
	 3Y10FUYq+KJSsnWRAfZrVTfTipSHpXYxMFaMZ/BuKVufWhHKBlEVXQWq6Vosu32jb/
	 3WGuBDHl/XkYg==
Date: Thu, 22 Aug 2024 17:44:19 +0100
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
Message-ID: <Zsdq4ymaW0vQffH_@finisterre.sirena.org.uk>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
 <20240822-arm64-gcs-v11-19-41b81947ecb5@kernel.org>
 <ZsdjbsDrMWgBU9Hj@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZsdjbsDrMWgBU9Hj@arm.com>
X-Cookie: Your love life will be... interesting.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_094427_164802_5B4EE107 
X-CRM114-Status: GOOD (  16.85  )
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
Content-Type: multipart/mixed; boundary="===============5364777795674965386=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5364777795674965386==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="coW1UanIXdwHEo32"
Content-Disposition: inline


--coW1UanIXdwHEo32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 05:12:30PM +0100, Catalin Marinas wrote:
> On Thu, Aug 22, 2024 at 02:15:22AM +0100, Mark Brown wrote:

> > +static bool is_invalid_gcs_access(struct vm_area_struct *vma, u64 esr)

> > +	} else if (unlikely(vma->vm_flags & VM_SHADOW_STACK)) {
> > +		/* Only GCS operations can write to a GCS page */
> > +		return is_write_abort(esr);
> > +	}

> I don't think that's right. The ESR on this path may not even indicate a
> data abort and ESR.WnR bit check wouldn't make sense.

> I presume we want to avoid an infinite loop on a (writeable) GCS page
> when the user does a normal STR but the CPU raises a permission fault. I
> think this function needs to just return false if !esr_is_data_abort().

Yes, that should check for a data abort.  I think I'd formed the
impression that is_write_abort() included that check somehow.  As you
say it's to avoid spinning trying to resolve a permission fault for a
write (non-GCS reads to a GCS page are valid), I do think we need the=20
is_write_abort() since non-GCS reads are valid so something like:

	if (!esr_is_data_abort(esr))
		return false;

	return is_write_abort(esr);



--coW1UanIXdwHEo32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbHauIACgkQJNaLcl1U
h9A+Rwf/dhRu5UsqpoCA6/xq9A0Cnab5ynXnvR1EzbaEJwCP9rNRs+GxUHMjS602
nhOn9hOMoiPZGQf6EXx1EQEKVTrRMdcKY6xmuJMvanSHbsVrmiYd/O9gy1dfNkSM
TDmxmZ7Xc0G+qStZRZgpooJVDlbVRaCux4cNvKFjYcDX3wVF2Liq1NrHD3xrfelV
vIRbUgCxo+LVDAkpsO/OOc1EK99EzOcV2xAnCddVDud02JsIW+KsG4/9MvW1YIJP
NfpjBpbB/8mwaQfrssODC3R5By97ak392CJHPuTEhr6ymNONeJyVtB9c/2UiROsd
A+w312rp0+u9/cY9Ul958kpl56JVdw==
=+JCX
-----END PGP SIGNATURE-----

--coW1UanIXdwHEo32--


--===============5364777795674965386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5364777795674965386==--

