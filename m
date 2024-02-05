Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5365CC48292
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Feb 2024 16:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dgO5s9bIuardsLtW5r5S/UXBZIZ8G+i6u6oo6ugBEk=; b=zs+Ld0uoPngDew5A1kyjW8Z2cY
	DIA0eA3TgABJINMulA9QuZ8tba5r70ykliO/WsY8zTPLjL/XEpq4fnzmFLCsmikwsEwsGpyYphWhv
	3U52hM8DeAkDFloWeTz3SrV3cuzOSU84HjWNNVDKJA4xPTspoIt4ZY4A8QsQjhaTUsReK68ebj3QT
	ugCUtipCVRS/xvxdfKqc45HT5W3jOJUgWvpcQ/8/Jq70ODoLWoUPa1zaSxdbiNqRCTlB8vsdsmynq
	Bh96j/bOD+cwXl5x8ypq8T1gzTgtXEM2VJE4sDRzeC6nV7tru6gv0tU6PCnTfK+wIMOYPbFOfAJht
	8ou47J0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2Ih-000000043Ho-0Rbt;
	Mon, 05 Feb 2024 16:58:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2Id-000000043Go-3acS;
	Mon, 05 Feb 2024 16:58:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D941C6118C;
	Mon,  5 Feb 2024 16:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42EE0C433C7;
	Mon,  5 Feb 2024 16:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707152306;
	bh=9FpafEGlyrNhPgZJkrgRLS7U6aCYTe6Poar4f0Fu86c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jdAa96kD60IeV9lxQp0ubdqOgUSHcdsjtge2WP6mvoDwpwOe+Rw7nwcU7ORKlVlgr
	 8Z6UYcfu0rXRgY6H147qPvpixPmJkpZDmWrIwgKeNqmHE5Dyf5eNNmQ5bBvWaONUZO
	 0/G6+v/VmTdZm/r0jhWTvEEg+oGSkpJiB3YYAtdV41ad/d4EyHHPk7vnDwmNhbZO9W
	 xGQCvUQAyZvm+DIKz7D+cBrAtQbQgXkRRwM6jx1tMc0pifYl3BcJGyd0M/p6YJjmTK
	 m/3/iDifHMb1SIEd4HlIJDGTt/kOZPRgXRKA/sGbloE3oJcO4SJAp50Cw6wGa0iRnt
	 6WaVOdTjOW2yA==
Date: Mon, 5 Feb 2024 16:58:20 +0000
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
Message-ID: <ZcETrPAFFfgAy/PT@finisterre.sirena.org.uk>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <20240203-arm64-gcs-v8-13-c9fec77673ef@kernel.org>
 <868r3z6y6v.wl-maz@kernel.org>
 <825d2b35-fa10-43ad-b3b3-b29a77f3fed0@sirena.org.uk>
 <8634u76i36.wl-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <8634u76i36.wl-maz@kernel.org>
X-Cookie: You might have mail.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_085828_010745_B7592391 
X-CRM114-Status: GOOD (  49.04  )
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
Content-Type: multipart/mixed; boundary="===============1802434337774964932=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1802434337774964932==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CPooLl9HGmOME8a3"
Content-Disposition: inline


--CPooLl9HGmOME8a3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 05, 2024 at 03:34:05PM +0000, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:
> > On Mon, Feb 05, 2024 at 09:46:16AM +0000, Marc Zyngier wrote:

> > > We have had this discussion in the past. This must be based on the
> > > VM's configuration. Guarding the check with the host capability is a
> > > valuable optimisation, but that's nowhere near enough. See the series
> > > that I have posted on this very subject (you're on Cc), but you are
> > > welcome to invent your own mechanism in the meantime.

> > Right, which postdates the version you're replying to and isn't merged
> > yet - the current code was what you were asking for at the time.

> v1 and v2 predate it. And if the above is what I did ask, then I must
> have done a very poor job of explaining what was required. For which I
> apologise profusely.

To be clear it's what was asked for prior to the switch to the
forthcoming switch to the parsing idregs scheme, I haven't pulled in
your idregs work yet since it's being rapidly iterated and this is an
already large series with dependencies.

> > I'm
> > expecting to update all these feature series to work with that once it
> > gets finalised and merged but it's not there yet, I do see I forgot to
> > put a note in v9 about that like I did for dpISA - sorry about that, I
> > was too focused on the clone3() rework when rebasing onto the new
> > kernel.

> > This particular series isn't going to get merged for a while yet anyway
> > due to the time it'll take for userspace testing, I'm expecting your
> > series to be in by the time it becomes an issue.

> Right. Then I'll ignore it for the foreseeable future.

Actually now I think about it would you be open to merging the guest
context switching bit without the rest of the series (pending me fixing
the issues you raise of course)?  If so I'll split that bit out in the
hope that we can reduce the size of the series and CC list for the
userspace support which I imagine would make people a bit happier.

> > > > +		write_sysreg_s(ctxt_sys_reg(ctxt, GCSCRE0_EL1),
> > > > +			       SYS_GCSCRE0_EL1);
> > > > +	}

> > > For the benefit of the unsuspecting reviewers, and in the absence of a
> > > public specification (which the XML drop isn't), it would be good to
> > > have the commit message explaining the rationale of what gets saved
> > > when.

> > What are you looking for in terms of rationale here?  The KVM house
> > style is often very reliant on reader context so it would be good to
> > know what considerations you'd like to see explicitly addressed.

> Nothing to do with style, everything to do with substance: if nothing

The style I'm referring to there is the style for documentation.

> in the host kernel makes any use of these registers, why are they
> eagerly saved/restored on nVHE/hVHE? I'm sure you have a reason for
> it, but it isn't that obvious. Because these two modes need all the
> help they can get in terms of overhead reduction.

Ah, I see - yes, they should probably be moved somewhere else.  Though
I'm not clear why some of the other registers that we're saving and
restoring in the same place are being done eagerly?  The userspace
TPIDRs stand out for example, they're in taken care of in
__sysreg_save_user_state() which is called in the same paths.  IIRC my
thinking there was something along the lines of "this is where we save
and restore everything else that's just a general system register, I
should be consistent".

Am I right in thinking kvm_arch_vcpu_load()/_put() would make sense?
Everything in there currently looked like it was there more due to doing
something more complex than simple register save/restore and we weren't
worrying too much about what was going on with just the sysregs.

> > These
> > registers shouldn't do anything when we aren't running the guest so
> > they're not terribly ordering sensitive, the EL2 ones will need a bit
> > more consideration in the face of nested virt.

> The EL2 registers should follow the exact same pattern, specially once
> you fix the VNCR bugs I pointed out.

Great, that's what I'd thought thanks - I hadn't checked yet.

--CPooLl9HGmOME8a3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXBE6sACgkQJNaLcl1U
h9AxYAgAgiMyW4DrBuI2SbKKpBxTNqFWS6hwvL/pz27nGc2T9cgR2P2ODSG3A9Cv
MJh2K7irI4JHl/jj/8GLJLH5IVMOVyVYPtTxauHvCVu+I6RM92hSfVey9I7clK40
Lxhri2n3D8Tj89RvRi90LvEgM0pJKqGBYYpc+lZBuUVhpsHDx1rwBsuMmryxpbyX
U9xvwhFc+lNUfrCUYIVp0VThb8QBJzBYs0SSVyM1ggHARaP+t64DzE+vrtI9h5QN
CQo6qN+H0ojTvx9E0MGZhqBPtNnGOs3jafSq88emxX431D+3kZSJwY4npbfFNQd3
Il677REj9RoCNO5cSTKMWWb27EzOxg==
=xxbo
-----END PGP SIGNATURE-----

--CPooLl9HGmOME8a3--


--===============1802434337774964932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1802434337774964932==--

