Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B048C04A94
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 15:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0v6vaK9f46byuRjxOnXiLzOEZDFumjmW7kiMzC2jN4=; b=g6atr2qX4/QpBf5JEbhqpblJ73
	5Ee6MPp9tGpIv81hXBz8i3+sSsWpjsbDGga25ZYabUjL/ov3iCWocDHQtECPKExsg2HAbxcuSbYQf
	W0kjvSid2PC+li2twK6CUAr5E45xhAoePtybW5JSogDl5czh7usD0E37rxErVaFVmAhRheNkkFBmU
	E2TIGfq4N3PX8V/tcHEpzqHyKE4r4vKfSCx9uW0vpw+sjio+EsXeZb2kZXv5QZXr1vut0pNvREiVA
	J0f6sWCZbnkNpP0nHk/bsX/gLifTOtzvGJOMTiSegOwn3WGBXjcWgcoRHTJ0NVV9B1JwwnxGSlNKf
	eVkzB5HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTlD2-005Iu9-2x;
	Wed, 09 Aug 2023 15:34:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTlCy-005Isp-3C;
	Wed, 09 Aug 2023 15:34:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 05EA263E4C;
	Wed,  9 Aug 2023 15:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CAB4C433B8;
	Wed,  9 Aug 2023 15:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691595287;
	bh=dKpu3DrXlm0fcz/rfbAZnwwY50NvEJw3wKrHilJuxpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F+F3tEWJa1ouT3AAeoGwCGDIPVHr8mvewuF9Wv6D3my1b3McT3/boQUwB/4TbUk0B
	 kNoEtkqrlkQGWOLC+eAHPeWdquspwCEu1jOP2DLJPyKtjBxqre7G5Gt6s4ZyA+8FUj
	 ksjRNloIJXzwHov4xxKk0bR+odlEBkyc9WWw+8Q7LwINdLKAlMo8eHt7sgp2mo0zSP
	 6yf4N/N5mQgfkKZNTyeTdpVV8jY50VyORSbm56bg69m/U7esSLYFGhLNopS1fXoXH6
	 pZPiq1xcaVBJo5pvOVIcoNTdFhmai7aajMmEDmFbfAJtYhs4C5iTw2HYO9neLymlEh
	 iUgc170PfSA4g==
Date: Wed, 9 Aug 2023 16:34:38 +0100
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
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 03/36] arm64/gcs: Document the ABI for Guarded Control
 Stacks
Message-ID: <f4cec4b3-c386-4873-aa1d-90528e062f2a@sirena.org.uk>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-3-68cfa37f9069@kernel.org>
 <ZNOhjrYleGBR6Pbs@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZNOhjrYleGBR6Pbs@arm.com>
X-Cookie: Necessity is a mother.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_083449_120415_577D74EB 
X-CRM114-Status: GOOD (  44.91  )
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
Content-Type: multipart/mixed; boundary="===============7450974282444154700=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7450974282444154700==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k90euu3QCpA7JsXx"
Content-Disposition: inline


--k90euu3QCpA7JsXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 09, 2023 at 03:24:14PM +0100, Catalin Marinas wrote:
> On Mon, Aug 07, 2023 at 11:00:08PM +0100, Mark Brown wrote:

> > +* When set PR_SHADOW_STACK_ENABLE flag allocates a Guarded Control Sta=
ck for
>=20
> The 'for' at the end of the line above is not needed.
>=20
> > +  and enables GCS for the thread, enabling the functionality controlle=
d by

I find it a little clearer that it's a per thread stack here but sure.

> > +* PR_LOCK_SHADOW_STACK_STATUS allows any bit to be locked, this allows
> > +  userspace to prevent changes to any future features.

> I presume a new lock prctl() won't allow unlocking but can only extend
> the lock. I haven't looked at the patches yet but it may be worth
> spelling this out.

Yes, there is no unlock prctl() - the lock prctl() just lets you set
locks.

> > +* If GCS is disabled for a thread after having previously been enabled=
 then
> > +  the stack will remain allocated for the lifetime of the thread.

> Sorry if this has been discussed in other threads. What is the issue
> with unmapping/freeing of the shadow stack?

If something was in the middle of looking the GCS (eg, you're trying to
disable GCS during signal handling that preempted something that is
logging the call stack) and you pull the GCS storage from underneath it
then things will go badly.

> > At present
> > +  any attempt to reenable GCS for the thread will be rejected, this ma=
y be
> > +  revisited in future.

> What's the rationale here? Is it that function returns won't work?

We have to work out where to point GCSPR_EL0 when reenabling - at the
top of the old stack, where it was before, on a new stack?  It was
easier to just not support reenabling than to work out what the sensible
answer is when it's not clear that any real use case exists to inform
what makes sense.  We can add support for that later (you can probe by
starting a thread, disabling and trying to reenable) if someone does
come up with a use case.

The use case for disabling is a non-enforcing mode which logs GCS faults
and then disables GCS.

> > +3.  Allocation of Guarded Control Stacks
> > +----------------------------------------

> > +* When GCS is enabled for a thread a new Guarded Control Stack will be
> > +  allocated for it of size RLIMIT_STACK / 2 or 2 gigabytes, whichever =
is
> > +  smaller.

> Is this number based on the fact that a function call would only push
> the LR to GCS while standard function prologue pushes at least two
> registers?

It's actually based on bitrot that I'd initially chosen a smaller value
since it's likely that functions will push at least something as you
suggest, the patches now just use RLIMIT_STACK.  I'll fix.

> > +* When GCS is disabled for a thread the Guarded Control Stack initially
> > +  allocated for that thread will be freed.  Note carefully that if the
> > +  stack has been switched this may not be the stack currently in use by
> > +  the thread.

> Does this not contradict an earlier statement that the GCS is not freed
> for a thread when disabled?

Yes, it was meant to say when the thread is freed rather than when GCS
is disabled.

> > +* When GCS is enabled for the interrupted thread a signal handling spe=
cific
> > +  GCS cap token will be written to the GCS, this is an architectural G=
CS cap
> > +  token with bit 63 set.  The GCSPR_EL0 reported in the signal frame w=
ill
> > +  point to this cap token.

> I lost track of the GCS spec versions. Has the valid cap token format
> been updated? What I have in my spec (though most likely old) is:

>   An entry in the Guarded control stack is defined as a Valid cap entry,
>   if bits [63:12] of the value are same as bits [63:12] of the address
>   where the entry is stored and bits [11:0] contain a Valid cap token.

You have a draft version of the spec, this was changed and now there is
now a token field reserved in the low 12 bits of the register:

#define GCS_CAP_ADDR_MASK		GENMASK(63, 12)
#define GCS_CAP_ADDR_SHIFT		12
#define GCS_CAP_ADDR_WIDTH		52
#define GCS_CAP_ADDR(x)			FIELD_GET(GCS_CAP_ADDR_MASK, x)

#define GCS_CAP_TOKEN_MASK		GENMASK(11, 0)
#define GCS_CAP_TOKEN_SHIFT		0
#define GCS_CAP_TOKEN_WIDTH		12
#define GCS_CAP_TOKEN(x)		FIELD_GET(GCS_CAP_TOKEN_MASK, x)

#define GCS_CAP_VALID_TOKEN		0x1
#define GCS_CAP_IN_PROGRESS_TOKEN	0x5

#define GCS_CAP(x)	((((unsigned long)x) & GCS_CAP_ADDR_MASK) | \
					       GCS_CAP_VALID_TOKEN)

--k90euu3QCpA7JsXx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTTsg0ACgkQJNaLcl1U
h9AEfQf+Ka4G6z9Nm1kf+b/l5pKI+rrhbAQGaG8LsctIW9PfOqcL34gYTSwCEcFC
yc7FLvXwOykuy/dMOwhEPvohyCsS/fvouc1WLRs/T1Ur11kjMYjJaMnrLIafdJRC
AH7esh4KGfFfzcq6O2WaLjk/wSLVMF7ZemDSQJwb1zC8tACwL/ycJNx3xi/LgCjn
uegBSqenG7Ehp7OuPFBeZmfL1yMQ5g5GGrF3ga5swfXgxDmne+0X0pXCqoqyQURH
B/4075gZXjwuMcraFsVPFQEdlk4nZNl4BEEdV9IGHXKIBWe1qKOTIFc14Jvt3U5/
AhfIuxGumWGmrTlP/ZBjaZUJaMuFlA==
=LF8s
-----END PGP SIGNATURE-----

--k90euu3QCpA7JsXx--


--===============7450974282444154700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7450974282444154700==--

