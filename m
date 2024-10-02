Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C80CEACF3
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 18:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EelL9UEtoALiOtXD3kfEZNO9boBYQkkRfXrtBXeDUQo=; b=myb1fKPnUNmWQlBhEqvhGFm873
	Jm4SPCjRXbx0OL82RN4Jv3HhbsXXnG/pKHLUbacU5vuw581VPXiDjBcyvgqfhYTpVbNDjxs1NQyH2
	D/5b4OjCSsIStxF2tZjzT8EZ0DnZcrW33oMPGyUxsxpSwFiFKewa5BZWM2buXLYbLtz2GYXLnynPz
	ng9nZXKm8AsbvT5rXL39Sje7ULsmU6ALq4AAA+GrDtut8B/aCifCiBuFNXVx7F1MddZBWKNdNMBIu
	cTJhs3JOQqDeELtsOzAi9QTmY6Xi/ZvkXGOpvMXME8wEkMQAwIDc5uiGZCPqA46rkJk5tbuEeUvra
	JZZf7mog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw42j-00000007A64-3E8J;
	Wed, 02 Oct 2024 18:25:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw41R-000000079n5-3oQN;
	Wed, 02 Oct 2024 18:24:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AAAC65C118D;
	Wed,  2 Oct 2024 18:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4524BC4CEC2;
	Wed,  2 Oct 2024 18:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727893464;
	bh=Xn5r/F/y3n+IVpjGqNQ5xxlIqpNtWX913WJmrs1pThE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HpLyxwDchSeqF4R9rk9zqytwWCTBbpujg7WnOnXPszioolkSCIFdMKzkLWZeF4ohP
	 PssFFutZ0TqK/qn3q51d9EEuAw1pmYyCIWQjcAmufjUCC0l618/rZcYNJWnnizCg2G
	 1CNq7+MXFCmw+6MEaE1iTjnB6QQMMH8g2IbrGHBviaxXC3DKarwixTHZrjcuZIVaF8
	 uykmFydsc/VUQbPXgNyiEqKDEo6UDITxmpz1IbAxb3J0yd96UH6KQ5fJ2jmwinS3Lh
	 bV3306MvladnEqvxq3o8HLRZ428Zey8544gcd+Ycx/nCEeiynVhb3l2MR99n+DXhMT
	 0AeL/bD/KzbNQ==
Date: Wed, 2 Oct 2024 19:24:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
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
	David Spickett <david.spickett@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v13 16/40] KVM: arm64: Manage GCS access and registers
 for guests
Message-ID: <37fbc082-6bda-46e3-9ee7-9240b41f26fd@sirena.org.uk>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
 <20241001-arm64-gcs-v13-16-222b78d87eee@kernel.org>
 <86bk0373nq.wl-maz@kernel.org>
 <86a5fm7b4i.wl-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <86a5fm7b4i.wl-maz@kernel.org>
X-Cookie: Know Thy User.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_112426_059309_6D08C555 
X-CRM114-Status: GOOD (  14.78  )
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
Content-Type: multipart/mixed; boundary="===============4483670969004620510=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4483670969004620510==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f644fc4VKEnWPPLA"
Content-Disposition: inline


--f644fc4VKEnWPPLA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 02, 2024 at 04:55:25PM +0100, Marc Zyngier wrote:
> Marc Zyngier <maz@kernel.org> wrote:

> > > +	if (!kvm_has_gcs(kvm))
> > > +		kvm->arch.fgu[HFGxTR_GROUP] |= (HFGxTR_EL2_nGCS_EL0 |
> > > +						HFGxTR_EL2_nGCS_EL1);

> > Why are you still allowing the GCS instructions when GCS isn't
> > enabled?

> Scratch that, they are NOPs when GCS isn't enabled, so there shouldn't
> be any need for extra traps.

They are, though really they should UNDEF if GCS isn't there (which I
had thought was what you were referencing here).  Equally we only have
traps for a subset of GCS instructions and it's not like there aren't a
whole bunch of untrappable extensions anyway so it's not clear it's
worth the effort just for that.

--f644fc4VKEnWPPLA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb9j8sACgkQJNaLcl1U
h9AOWQf8DFoVOjrYp2ocafOH0wTbI6Jawr1ucPRjwYcn5sAGuTLywrEihNxOR42y
l62ygvYkYtUWpgViQZqrQznNkYbdxg7O6dnvc4ywKu0iWo1KPVJFT0At7NZp6Pxy
z8z/9OOYjxelIy33541t+XgjS3MxR3LA2PJSZd7ZOd4sHZMl7t1oLNi/s9HV0LAK
/xkcFEkwnX1y0EndbVnntD9crF+J0pBIuO1z3wtywncxixscc0PgM3e1mvmTmYu6
k62weouXEqlaiF5DZ6hHH4iHj8mPMYlnmvEz6Dsiev6PWcCm2hYrKiIO44ThjQJU
OggiVTV8pqPtukHW/VmVN/VFPC5k6w==
=YDrc
-----END PGP SIGNATURE-----

--f644fc4VKEnWPPLA--


--===============4483670969004620510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4483670969004620510==--

