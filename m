Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC279C3DA41
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 18:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ss9GY9k5EN3PNu/KLMZ3nrn0EqG1xfUCfzUhH3ZH7aE=; b=Sjou7jesMyZYjzH9tJ/ocQKddh
	8ZGv+ZP7Z136haA4YsZekjCG2C5auBET+CQymi5U5wbpwWcdEsq8y6+usu3zfJ16sT4aJQNYzBC5e
	H38F49h3S3soExXJW5/LwDfxLuQhLxTusktgYkHl58p01IFYYFdalXp5bWd1O+9nH59gpHFLHdaWW
	8pt0vVDvG+j7VqPPBzGXo8NIgp+hvrnW8hd6hiW+/pmUVm3FEG5eUhGxk+nMABXRE9/kzffz08OFz
	n/YbpSf0XMavbNdLtVRKUl0jgPtGKee4oPQy1+io8/z4SvXpK45e3Wory9WZaZsS/lIHg2iPASZpA
	5CZF/C4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRc2K-0000000BPsF-1g4U;
	Wed, 10 Jul 2024 18:27:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRc20-0000000BPlB-3Ud7;
	Wed, 10 Jul 2024 18:27:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 70090CE13BB;
	Wed, 10 Jul 2024 18:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5056C32781;
	Wed, 10 Jul 2024 18:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720636023;
	bh=eRrtqZRqKI+Vs713ksZJJnhpC7362rwfU+pQUCdgXy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kBignoqFgMiQnAofIwr6TpBgYH9jPjzRaSC842ug8+rx6x5ll0CjTdOuNwKz+XNaU
	 NDvkrwV2QNWMtc2QwoU1ijOz5da9rUzzZ4Zm4X9y1ohMBoG7CVKn0v8dUDWTmbo5kp
	 qCrq3abaj3XVJlXugg7JTU4S4r1FduVMcT4Z37pYvXrQ+HC5Pfyh6axADebI74bLMd
	 mL+FCPzGJMJSDDh/UgJFPTRSJhQcGB2O3dEluBrE8THwZhBROKgdbzxw1XeKE8fCoR
	 WqmFYL3/Bn0OvLOJQI+kNsc03yBZkhbSjm+4JlasoCc+ZLBwTbq5WG/vpdgUXOB+/4
	 KqrO9fqPgf3Gw==
Date: Wed, 10 Jul 2024 19:27:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Florian Weimer <fweimer@redhat.com>
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
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	"Schimpe, Christina" <christina.schimpe@intel.com>,
	"Pandey, Sunil K" <sunil.k.pandey@intel.com>
Subject: Re: [PATCH v9 05/39] arm64/gcs: Document the ABI for Guarded Control
 Stacks
Message-ID: <Zo7SdDT_cBp6uXgT@finisterre.sirena.org.uk>
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
 <20240625-arm64-gcs-v9-5-0f634469b8f0@kernel.org>
 <87a5iph6u2.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
In-Reply-To: <87a5iph6u2.fsf@oldenburg.str.redhat.com>
X-Cookie: Your love life will be... interesting.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_112709_250304_9AAED8FC 
X-CRM114-Status: GOOD (  29.32  )
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
Content-Type: multipart/mixed; boundary="===============8589547820677059942=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8589547820677059942==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GNMZNZkOBV+voqRu"
Content-Disposition: inline


--GNMZNZkOBV+voqRu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 10, 2024 at 12:36:21PM +0200, Florian Weimer wrote:
> * Mark Brown:

> > +* When GCS is enabled for the interrupted thread a signal handling specific
> > +  GCS cap token will be written to the GCS, this is an architectural GCS cap
> > +  token with bit 63 set and the token type (bits 0..11) all clear.  The
> > +  GCSPR_EL0 reported in the signal frame will point to this cap token.

> How does this marker interfere with Top Byte Ignore (TBI; I hope I got
> the name right)?  The specification currently does not say that only
> addresses pushed to the shadow stack with the top byte cleared, which
> potentially makes the markup ambiguous.  On x86-64, the same issue may

Indeed...  Given that we use the address on the GCS as part of the token
on first pass I think we could get away with just using the address and
not setting the top bit, we'd have an invalid cap pointing into a GCS
page which shouldn't otherwise be on the GCS.  I'll give that some more
thought.

> exist with LAM.  I have not tested yet what happens there.  On AArch64
> and RISC-V, it may be more natural to use the LSB instead of the LSB for
> the mark bit because of its instruction alignment.

The LSB is already taken by the architecture on aarch64, the bottom bits
of the value are used for the token type field with no values/bits
reserved for software use.

> We also have a gap on x86-64 for backtrace generation because the
> interrupted instruction address does not end up on the shadow stack.
> This address is potentially quite interesting for backtrace generation.
> I assume it's currently missing because the kernel does not resume
> execution using a regular return instruction.  It would be really useful
> if it could be pushed to the shadow stack, or recoverable from the
> shadow stack in some other way (e.g., the address of the signal context
> could be pushed instead).  That would need some form of marker as well.

Right, we'd have to manually consume any extra address we put on the
GCS.  I'm not seeing any gagetisation issues with writing an extra value
there that isn't a valid stack cap at the minute but I'll need to think
it through properly - don't know if anyone else has thoughts here?

--GNMZNZkOBV+voqRu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaO0nMACgkQJNaLcl1U
h9CYNwf9FL92M924ZTMgdzdOGnvfj92Q8ImGFAmDoUP3IjVPivJTPYhDuY+GaQaY
hojzU0+/ygci8GNBa3kaJGdT2kzo4J6aMfzV8Lw5OFhjfZvg98gQbw+HeRVou0BB
trtAQLx/+CWEYHy1qXMPQ3jRHuINOT80L4T321NSPyd7rlSksPpZU/NqHmUI9iW9
MpODGOLfCOg2W3CrQMA8AT1F09NeC4fBr+XRq1f3PwskzNRz/DR89M1amdCG7bky
oOk/WAsSGY8RWuY7/GurREwf7vUc1akIFax3lqDscpCbSuZ89FcFfs6YEAUqgq86
qV5kGewLUdqaGwutNJRSCAV+QkJXjw==
=dJd9
-----END PGP SIGNATURE-----

--GNMZNZkOBV+voqRu--


--===============8589547820677059942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8589547820677059942==--

