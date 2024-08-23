Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF35C52D7C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 10:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMiiVNtHhzqPoaf6ZCHKhjldwydwvJQVF1eRngDnRbw=; b=hyu+CljZu8qIIHqmLT6mA6rnME
	aIioH0luo0W+gunaMJJTbDAYnJ8uWgjs6hvYgoRbNDXMJ09o2miJu3gZlHDdrLkj6J7IqMZde+8Vz
	3A/Sv9M5NxyzvO8S6/deCXMMmBYla5xunTyLDwdKzHsqXT1eqIjl0mSx/TNws8riH5tGdK5W5Gr06
	c/2AwY0wGqkzleCifYXOROkDZ0VtfYBFNfVZ0cUx6MwsLy9qzucrX9BZ5kNw7yQWgkGDkwRV7Gh33
	XXgq1WW4IkDg3uFpjBTWJTAMZdTw3mfdvagsDwLR+5zQdKAVv9IYX8q4Me63xKlm9nrGS6coTG8Su
	/9MkOG0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shRXy-0000000GLIv-469E;
	Fri, 23 Aug 2024 10:29:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shRU6-0000000GKNM-45MZ;
	Fri, 23 Aug 2024 10:25:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D95660C01;
	Fri, 23 Aug 2024 10:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73EFEC32786;
	Fri, 23 Aug 2024 10:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724408733;
	bh=sQqhNYedR1BK3builnVoyg4SxBnBW3yPxbGa623Z0Lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p85uLFPzRzTjF8TlOpeiA4rumcvxDEt5Fylq/9D05p3sIyY+055i0xe3zxSZLAoqN
	 QZHNkumhB+xPzgZ/sxTPyBYYrNrG8f5anr2pue94kpefrN+CCKb4iLhzMhRTBpSA0K
	 sVYCVfW5FfB2qLD+0FFI6UGF0ZbAxjh5/DQ4oH00TXYoDQs14NRelVjlKHMrBh/wqb
	 WIAQ2tuAChr2+JPT3qMr5aq++L4A6q4aPfN6kAHB7/S6XhE8E13elQ+Sv0HMTl8mQd
	 AV1ckfw3bNkrK34vkLNFaaA8WrSpMbnM/HArzMkeG+5njHE00+M1umnvsYvWZyPQyj
	 cpi/uhsdQGqjA==
Date: Fri, 23 Aug 2024 11:25:30 +0100
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
Subject: Re: [PATCH v11 25/39] arm64/signal: Expose GCS state in signal frames
Message-ID: <ZshjmuYcejbhaSBg@finisterre.sirena.org.uk>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
 <20240822-arm64-gcs-v11-25-41b81947ecb5@kernel.org>
 <ZshYTyNbveD7WMyJ@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZshYTyNbveD7WMyJ@arm.com>
X-Cookie: Your love life will be... interesting.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_032535_183441_E0742D45 
X-CRM114-Status: GOOD (  33.76  )
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
Content-Type: multipart/mixed; boundary="===============8390601702156403109=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8390601702156403109==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/CrZc0/PCTYKFxlL"
Content-Disposition: inline


--/CrZc0/PCTYKFxlL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 23, 2024 at 10:37:19AM +0100, Catalin Marinas wrote:
> On Thu, Aug 22, 2024 at 02:15:28AM +0100, Mark Brown wrote:

> > +	gcs_preserve_current_state();
> > +	gcspr = current->thread.gcspr_el0 - 8;

> > +	__put_user_error(gcspr, &ctx->gcspr, err);

> Do we actually need to store the gcspr value after the cap token has
> been pushed or just the value of the interrupted context? If we at some
> point get a sigaltshadowstack() syscall, the saved GCS wouldn't point to
> the new stack but rather the original one. Unwinders should be able to
> get the actual GCSPR_EL0 register, no need for the sigcontext to point
> to the new shadow stack.

We could store either the cap token or the interrupted GCSPR_EL0 (the
address below the cap token).  It felt more joined up to go with the cap
token since notionally signal return is consuming the cap token but
either way would work, we could just add an offset when looking at the
pointer.

> Also in gcs_signal_entry() in the previous patch, we seem to subtract 16
> rather than 8.

We need to not only place a cap but also a GCS frame for the sigreturn
trampoline, the sigreturn trampoline isn't part of the interrupted
context so isn't included in the signal frame but it needs to have a
record on the GCS so that the signal handler doesn't just generate a GCS
fault if it tries to return to the trampoline.  This means that the
GCSPR_EL0 that is set for the signal handler needs to move two entries,
one for the cap token and one for the trampoline.

> What I find confusing is that both restore_gcs_context() and
> gcs_restore_signal() seem to touch current->thread.gcspr_el0 and the
> sysreg. Which one takes priority? I should probably check the branch out
> to see the end result.

restore_gcs_context() is loading values from the signal frame in memory
(which will only happen if a GCS context is present) then
gcs_restore_signal() consumes the token at the top of the stack.  The
split is because userspace can skip the restore_X_context() functions
for the optional signal frame elements by removing them from the context
but we want to ensure that we always consume a token.

> > +	/*
> > +	 * We let userspace set GCSPR_EL0 to anything here, we will
> > +	 * validate later in gcs_restore_signal().
> > +	 */
> > +	current->thread.gcspr_el0 = gcspr;
> > +	write_sysreg_s(current->thread.gcspr_el0, SYS_GCSPR_EL0);

> So in preserve_gcs_context(), we subtract 8 from the gcspr_el0 value.
> Where is it added back?

When we consumed the GCS cap token.

> > +	if (add_all || task_gcs_el0_enabled(current)) {
> > +		err = sigframe_alloc(user, &user->gcs_offset,
> > +				     sizeof(struct gcs_context));
> > +		if (err)
> > +			return err;
> > +	}

> I'm still not entirely convinced of this conditional saving and the
> interaction with unwinders. In a previous thread you mentioned that we
> need to keep the GCSPR_EL0 sysreg value up to date even after disabling
> GCS for a thread as not to confuse the unwinders. We could get a signal
> delivered together with a sigreturn without any context switch. Do we
> lose any state?

> It might help if you describe the scenario, maybe even adding a comment
> in the code, otherwise I'm sure we'll forget in a few months time.

We should probably just change that back to saving unconditionally - it
looks like the decision on worrying about overflowing the default signal
frame is that we just shouldn't.

--/CrZc0/PCTYKFxlL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbIY5MACgkQJNaLcl1U
h9Bi+gf8CXq7dITB6mfDzRqVPcrdnIF0zDFjmHC8iIhqzkArOPeUrHuV8v1JvQKo
xxY+T75lyZYVhNmi/4AnCvx2NQ+73+wmg5ZJyg3MMYv67UP5A4Gk8cOO3DP4gNZp
GkinUu6g/33nKttu0Z8bNrylbmSVqqtFnh3Bzbv74LhYyKDe/dQ9CuCtZBEgjcQN
U3x2p8TYyhcqu6/7OkT7MNJtI825nOVxVQh2B4Rlfp0ea+z2UNkTocgU12qsyZRt
ew3ERI/4vdbAgPIIvqX5hmkLCEn6GNpyohGHm6LJ1BEZx3DGM9Ev6Q/ImtCMF+ty
5N4sxm/JaJbA6ExZyirRb8m7CyRISQ==
=OryW
-----END PGP SIGNATURE-----

--/CrZc0/PCTYKFxlL--


--===============8390601702156403109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8390601702156403109==--

