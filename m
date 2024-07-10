Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A03DC3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 22:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjIRKAr7bOURJuktnGfddHDJqqE/n8aJEmzhGXq9TIY=; b=MIxDDdwv9jUn06cd8hTThsnuzQ
	HFalkiy8s2bmLcbXk6Fa0k+v5wxyalQ3wi9Wb8FzrjogvkUrLlsy8KO6nw/WL+oz09rrPbCFEwaY3
	7ihMZH8XEaDtWjSy+Cuj3ItzO/K7EXbrKxvcy70clhxNTyLtp5FYn9beoCCzX1THhv4zOuBUd55y1
	Wcz5D2RbF6eYTxz5oHOVMXi0ceGM9Pdmy5B9zNXQKOmzuaDSmqO2HRdo0mGj3VEVvvS9Da+BRlZzU
	LncYU/IbWfqD1PjAcIv11/pSY7MKyo6/9ThrK6GH/VQOz7TuvXNwlwXT3GlM3IFTJqccc8u8KaVRY
	zzdJz/eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRfRf-0000000Bruh-0R9k;
	Wed, 10 Jul 2024 22:05:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRfRN-0000000BrpW-0IyY;
	Wed, 10 Jul 2024 22:05:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 40DB061A51;
	Wed, 10 Jul 2024 22:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46743C32781;
	Wed, 10 Jul 2024 22:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720649131;
	bh=Eu93rMUzk399cQ8hiVO2KE52oaiSsroTl8ghLIzLkfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OkQtx0YsVpapXk8nKor0mFxxgG/Sel10dpQi8Mi+udNtmWFH8kMBqVYpOwh4Hd57o
	 Fn1cjYbf21Au8EwCTMMoXlhwsSTLYn9lzqr1pgKMQ4gaNcRJRXZZQMHBu8LiVGWHGI
	 8nKQyBhir7wgr8l2dDteEUogPPp+0XXyFf9mRBsSGqCQ6BPAyGy9zpjKLrN23CPLjz
	 mrGlihLofkSTNkc0FSEniv9n+1JYFQuL2/0tzx7Hqx4md9CGzF26Kf5jWSEY7Ty7MQ
	 ZvhnAixRihlPWHfw+rBcJOiDFE38cp3xk6DMExk6qWoBPLPQdf09GcyH4+EeLUbq2+
	 2gzPUqbO088Tw==
Date: Wed, 10 Jul 2024 23:05:28 +0100
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
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v9 13/39] KVM: arm64: Manage GCS registers for guests
Message-ID: <Zo8FqFKQkuTv1r2M@finisterre.sirena.org.uk>
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
 <20240625-arm64-gcs-v9-13-0f634469b8f0@kernel.org>
 <86v81d2s5t.wl-maz@kernel.org>
 <Zo7B_sRyUyxv7xmO@finisterre.sirena.org.uk>
 <86ttgx2jba.wl-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <86ttgx2jba.wl-maz@kernel.org>
X-Cookie: Your love life will be... interesting.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_150533_270748_8AD92915 
X-CRM114-Status: GOOD (  43.47  )
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
Content-Type: multipart/mixed; boundary="===============3105025909649332208=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3105025909649332208==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O0du0pkUMxnEy6Qh"
Content-Disposition: inline


--O0du0pkUMxnEy6Qh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 10, 2024 at 07:28:09PM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:
> > On Wed, Jul 10, 2024 at 04:17:02PM +0100, Marc Zyngier wrote:

> > > > +	if (ctxt_has_gcs(ctxt)) {

> > > Since this is conditioned on S1PIE, it should be only be evaluated
> > > when PIE is enabled in the guest.

> > So make ctxt_has_gcs() embed a check of ctxt_has_s1pie()?

> No. I mean nest the whole thing *under* the check for S1PIE.

OK, increasing the level of nesting.  Got it.  Does that just apply for
the EL1 registers given that there's no _user S1PIE registers so no
existing check there?

Should we also be doing a similar thing for features that depend on TCR2
- currently that's just PIE but it'll grow?  Probably only when we get
more features rather than now since we don't currently check if the
guest has TCR2, just the system.

> > GCSCRE0_EL1 is for EL0 though, it ended up here mainly because it's an
> > _EL1 register and we are already context switching PIRE0_EL1 in the EL1
> > functions so it seemed consistent to follow the same approach for GCS.
> > The _el1 and _user save/restore functions are called from the same place
> > for both VHE and nVHE so the practical impact of the placement should be
> > minimal AFAICT.  Unlike PIRE0_EL1 GCSCRE0_EL1 only has an impact for
> > code runnning at EL0 so I can move it to the _user functions.

> Exactly. That's where it belongs, because we never execute EL0 while a
> vcpu is loaded. On the contrary, we can make use of a uaccess helper
> while a vcpu is loaded, and that makes a hell of a difference.

OK, to be clear here "it" is GCSCRE0_EL1, not GCSPR_EL1 and GCSCR_EL1
which are for EL1?

> And it makes a difference because it would allow the loading of
> EL0-specific context differently. We had this at some point, and it
> was a reasonable optimisation that we lost. I'm keen on bringing it
> back.

Ah, that'd be good - not only for the optimistation but also since at
the minute it's a bit unclear why there are separate EL0/1 functions.

> > > you want to make this register writable, here's the shopping list:

> > > https://lore.kernel.org/all/87ikxsi0v9.wl-maz@kernel.org/

> > In the linked mail you say you want to see all fields explicitly
> > handled, could you be more direct about what such explicit handling

> This emails enumerate, point after point, everything that needs to be
> done. I really cannot be clearer or more direct. This email is the
> clearer I can be, short of writing the code myself. And I have decided
> not to do it for once, unless I really need to. And as it turns out, I
> don't.

See below, to be clear the only bit I was querying here was:

| - you *must* handle *all* the fields described in that register. There
|   are 15 valid fields there, and I want to see all 15 fields being
|   explicitly dealt with.

TBH it'd probably good to have that whole list in the kernel somewhere.

> > would look like?  I see a number of examples in the existing code like:

> > 	ID_WRITABLE(ID_AA64ZFR0_EL1, ~ID_AA64ZFR0_EL1_RES0),

> This is clear: Everything is writable, and there are no bits here that
> are otherwise conditional or unsupported.

Ah, I think I see.  I would not have interpreted this as making
everything explicit, to me this makes all the writeable fields writeable
implicitly through them just not being mentioned.  For everything to be
explicit I would expect to see a direct, visible reference in the code
to every single field rather than something like we have here where some
of the fields are not mentioned directly.  The end result is an explicit
value but that's true for any use of ID_WRITABLE().

If my understanding is correct then were I writing the bit I quoted
above I'd probably just drop the "explicitly" from that bullet point due
to the handling of simple writable fields with ID_WRITABLE(), the key
point being that every field needs to be handled with the other points
enumerating the specific options for how each field might be handled.
Does my understanding sound correct?

> > which look to my eye very similar to the above, they do not visibliy
> > explictly enumerate every field in the registers and given that there's
> > a single mask specified it's not clear how that would look.  If
> > ID_WRITABLE() took separate read/write masks and combined them it'd be
> > more obvious but it's just not written that way.

> I don't really see what it would buy us, but never mind.

That was me trying to reconcile my understanding of you asking to make
everything explicit with the code as it is.  I suppose the advantage
would be documentation.

--O0du0pkUMxnEy6Qh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaPBaQACgkQJNaLcl1U
h9CfDgf9Hj4ORu0MQYC7C/o1bJG7/23dWcLbsWEReQjsF9FESFNxn/VmnbesRcD1
BShn5gjVprcOQokU/+w2py8ce3cKIl9K/238nc9ny+GvVPxoL3/F8o9GyrDGyXso
IeRw+jjwiYEIoc3ZF8b5foSxZkw+6043h5ELnTLLv78IlSM1E+E7lv8QysM8JjOX
zJc/G4s7mHk4Ohf9gjL7E13ni2Gy5Fhs7/Afkrz4IReeDNYeEhP4iiI0Ljg2E9XF
kr8rC5XenFN80dsZ5e5uhqg8SBzzHXk1kR69UpZnBM7jjhskJfy9xtzQbTkEjhL3
gA4J5POSV8LP8kFeG1MQkVwNU+a1Vg==
=mJl2
-----END PGP SIGNATURE-----

--O0du0pkUMxnEy6Qh--


--===============3105025909649332208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3105025909649332208==--

