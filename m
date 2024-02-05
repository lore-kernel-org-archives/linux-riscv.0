Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C11C48295
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Feb 2024 12:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VdBwkwpOyOgKzFgzkDesQGllmoSdmQsBuouWA/hyEXo=; b=3y/9Edb9ULFc2x8Wr/dvjBtQdG
	Ra4jnp3J9hhXpnBD2XuMpw1eiF8khmeKH/vv9r/r55k1XD8kkjuIL7b+YV1++nO7Ah/noCStnZRJC
	6WDa+lX989bFtU8ltkASIQR6kGg++Fr4x4WHfuo3mDicKH2x396a4S+QWkPc4SsIrUeiWdGfVrbz3
	L3mhDBCqVHSp+Gcv53DokdRmEi8Q2ZLYS/WcRVx2IS0/idh+YSjqX/STKq691Qku5vnUNgfQYXXcG
	O+IpHZieYGAFueWDvIFAepd+DjGwgiidtcRQwUlIBiyl6BAoILkefIxAKmAu0Jyw5B/8cCSii1hIR
	EnS6FnmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWyCp-00000003EGc-0uzI;
	Mon, 05 Feb 2024 12:36:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWyCl-00000003EE5-3Pgs;
	Mon, 05 Feb 2024 12:36:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8D3B8CE0E3F;
	Mon,  5 Feb 2024 12:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E9CC433F1;
	Mon,  5 Feb 2024 12:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707136563;
	bh=W/gM23dRxGIQHhXX9oPXf9/doTEakFPicYrHGjQOU1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kiq7v3WH4BXjlBM5da8GhgVzNWrFmT69sXn2Z3kO+XSByinlTm+nldLGPza1A7/ZM
	 wYC2Gg9vCokYw5fDYx/qQEg2c+CFP8iw+xofOVbNYvnsXNedFxCGd3ufs6VxoNBeXH
	 50FKZLbJXyju+0fAQ40QoDCyBn6FtSNDMwDjUf/bYITVShxqCLWvtPS6T5UZsH074b
	 a0LHJ05ccHIX0vYhq4C9uU5ICN03IOzpsz9v1K8Bnll82Jt9fqjDRwilIiy+Cj6O2j
	 Bj2o/ErTqvL0oT0WwGQ3pMhdwKYHeSpKoUUHqRyRoHtoufMjdrU1igTNgB3FQOIkyG
	 /jdgN58UpyTUQ==
Date: Mon, 5 Feb 2024 12:35:53 +0000
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
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 13/38] KVM: arm64: Manage GCS registers for guests
Message-ID: <825d2b35-fa10-43ad-b3b3-b29a77f3fed0@sirena.org.uk>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <20240203-arm64-gcs-v8-13-c9fec77673ef@kernel.org>
 <868r3z6y6v.wl-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <868r3z6y6v.wl-maz@kernel.org>
X-Cookie: No solicitors.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_043608_213675_4D5C9FB5 
X-CRM114-Status: GOOD (  28.21  )
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
Content-Type: multipart/mixed; boundary="===============8801596091845590205=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8801596091845590205==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SWF5NMV/X92Kf8zP"
Content-Disposition: inline


--SWF5NMV/X92Kf8zP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 05, 2024 at 09:46:16AM +0000, Marc Zyngier wrote:
> On Sat, 03 Feb 2024 12:25:39 +0000,
> Mark Brown <broonie@kernel.org> wrote:

> > +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> > @@ -25,6 +25,8 @@ static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
> >  {
> >  	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
> >  	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
> > +	if (has_gcs())
> > +		ctxt_sys_reg(ctxt, GCSPR_EL0) = read_sysreg_s(SYS_GCSPR_EL0);

> We have had this discussion in the past. This must be based on the
> VM's configuration. Guarding the check with the host capability is a
> valuable optimisation, but that's nowhere near enough. See the series
> that I have posted on this very subject (you're on Cc), but you are
> welcome to invent your own mechanism in the meantime.

Right, which postdates the version you're replying to and isn't merged
yet - the current code was what you were asking for at the time.  I'm
expecting to update all these feature series to work with that once it
gets finalised and merged but it's not there yet, I do see I forgot to
put a note in v9 about that like I did for dpISA - sorry about that, I
was too focused on the clone3() rework when rebasing onto the new
kernel.

This particular series isn't going to get merged for a while yet anyway
due to the time it'll take for userspace testing, I'm expecting your
series to be in by the time it becomes an issue.

> > +	if (has_gcs()) {
> > +		write_sysreg_el1(ctxt_sys_reg(ctxt, GCSPR_EL1),	SYS_GCSPR);
> > +		write_sysreg_el1(ctxt_sys_reg(ctxt, GCSCR_EL1),	SYS_GCSCR);
> > +		write_sysreg_s(ctxt_sys_reg(ctxt, GCSCRE0_EL1),
> > +			       SYS_GCSCRE0_EL1);
> > +	}

> For the benefit of the unsuspecting reviewers, and in the absence of a
> public specification (which the XML drop isn't), it would be good to
> have the commit message explaining the rationale of what gets saved
> when.

What are you looking for in terms of rationale here?  The KVM house
style is often very reliant on reader context so it would be good to
know what considerations you'd like to see explicitly addressed.  These
registers shouldn't do anything when we aren't running the guest so
they're not terribly ordering sensitive, the EL2 ones will need a bit
more consideration in the face of nested virt.

--SWF5NMV/X92Kf8zP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXA1iYACgkQJNaLcl1U
h9Dczgf8Co+AEsFdqthpdeHca9wZHZrvIV4GyHYFYxQUc2QQcQF8l68f9qpa+7WU
wwyKL5wu1uARGynhBiI1rGQHAv8lBunf5D4wkD3kJ8X/AtB0wSRFutA2Q35fQDo3
HcJi94+8UvNTLtAgbLMmiyihG6PxVhpUfwA3SZCuun068j81Zcd1hX4hUlpuSEXr
hm5Hy73ooZ/T/F5OrYsxxUuEbTRWHYhPq+CXEhWhtyTK9wRAzDes+UK6rXdjfOmj
iFWAR4jYhFukgcENJvGgwKKvS1YUFxMABGAPJmIfjjX/3eVNriZDeh5DFHyrrp+R
LPixjIxkXqN9p1+ZfpiReAfH4T+wRQ==
=7b9C
-----END PGP SIGNATURE-----

--SWF5NMV/X92Kf8zP--


--===============8801596091845590205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8801596091845590205==--

