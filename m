Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B25EE49B2
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 12:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62IqKBME+sipyVbRKW7ILDeqXbayYVADkISFFeXj4Fg=; b=wpUgfnKI23iIP58104VBe4VMNx
	JjYalxWbXHFkbO6L3lF6GQ4u2gNmlFhSj2ilgdq/oGlO/8kOsYoC4SkN2B84t6elrkL2ZkifrSa7R
	uy02793hhHb51S4Wuf3jWUtWc08aiQ3NHc54Fp8ww7ff1basHlBDYky9/wzT6awBAYU1nJhQY1t8U
	hcbwotPmc8f1bVcSQzS3UmgqkIgYUYXcTSLW8jBjw/zj118v+WNE/s0ps0y/IAWPOLnXQz3zB/5xK
	nLBqQlH47btbzypxORXSlfnkDRtTJ5a92ppTFyjDZsziJHRxlxI+fqCneocyB4e3ctRK8UKVvnjSl
	x/qYSEGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYnKv-000a3y-1z;
	Wed, 23 Aug 2023 12:51:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYnKs-000a2x-0T;
	Wed, 23 Aug 2023 12:51:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 979A864570;
	Wed, 23 Aug 2023 12:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4984C433C8;
	Wed, 23 Aug 2023 12:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692795104;
	bh=aIGZdAZfibpwOhOBqgFa8nf151J9Hk7d7fWvjMeY4zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=khDVpCaQdQhHesYs9RGRpVlvH8eWo3qrAoJKrfl6rCMMNb3+VNdzi5pk2+Le8Y9ph
	 pjjFWBvFAjVLuMOHcw6ky5TwIBqzGIeijbo2SRxr602ZcPxbmBg0NBa4El+5f1jRbr
	 uQ8Gdwk7KGPF1ZuROilSORtcM8Q8jen2QoY/J5xt8KrtGhe6i09i87Gj80vGx+LwzA
	 Y4GMrP0i8eRT/b1xndfov0OxmF2Cz4oGiGH00guo7/YhFkDyuUKDLBQ8t5uExGCnkM
	 CfV0NIyavGSn7UdSBpuE5djPSMDymoFZn4E8QzB6e0N2EDt8dObvj+9ZSIZtzI6gMq
	 dbRiW9VbzcTqQ==
Date: Wed, 23 Aug 2023 13:51:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
Message-ID: <227e6552-353c-40a9-86c1-280587a40e3c@sirena.org.uk>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-3-68cfa37f9069@kernel.org>
 <ZNOhjrYleGBR6Pbs@arm.com>
 <f4cec4b3-c386-4873-aa1d-90528e062f2a@sirena.org.uk>
 <ZN+qki9EaZ6f9XNi@arm.com>
 <aaea542c-929c-4c9b-8caa-ca67e0eb9c1e@sirena.org.uk>
 <ZOTnL1SDJWZjHPUW@arm.com>
 <43ec219d-bf20-47b8-a5f8-32bc3b64d487@sirena.org.uk>
 <ZOXa98SqwYPwxzNP@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZOXa98SqwYPwxzNP@arm.com>
X-Cookie: Some optional equipment shown.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_055146_289693_5870F4A0 
X-CRM114-Status: GOOD (  32.73  )
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
Content-Type: multipart/mixed; boundary="===============2959719515256108171=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2959719515256108171==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UdmTiHBngnlr6cvp"
Content-Disposition: inline


--UdmTiHBngnlr6cvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 11:09:59AM +0100, Szabolcs Nagy wrote:
> The 08/22/2023 18:53, Mark Brown wrote:
> > On Tue, Aug 22, 2023 at 05:49:51PM +0100, Catalin Marinas wrote:

> > the what but not the why.  For example roughly the current behaviour was
> > already in place in v10 of the original series:

> well the original shstk patches predate clone3 so no surprise there.
> e.g. v6 is from 2018 and clone3 is 2019 linux 5.3
> https://lore.kernel.org/lkml/20181119214809.6086-1-yu-cheng.yu@intel.com/

Ah, that'd do it.  People weren't excited enough on about clone3() when
reviewing the shadow stack patches, I hadn't realised clone3() was so
new.

> > I do worry about the story for users calling the underlying clone3() API
> > (or legacy clone() for that matter) directly, and we would also need to
> > handle the initial GCS enable via prctl() - that's not insurmountable,
> > we could add a size argument there that only gets interpreted during the
> > initial enable for example.

> musl and bionic currently use plain clone for threads.

> and there is user code doing raw clone threads (such threads are
> technically not allowed to call into libc) it's not immediately
> clear to me if having gcs in those threads is better or worse.

Right, that's my big worry - I hadn't realised it was extending as far
as musl/bionic.

> one difference is that userspace can then set gcspr of a new thread
> and e.g. two threads can have overlapping gcs, however i don't think
> this impacts security much since if clone3 is attacker controlled
> then likely all bets are off.

Yeah, I think that's a "you broke it, you get all the pieces" thing. =20

> > My sense is that they deployment story is going to be smoother with
> > defaults being provided since it avoids dealing with the issue of what
> > to do if userspace creates a thread without a GCS in a GCS enabled
> > process but like I say I'd be totally happy to extend clone3().  I will
> > put some patches together for that (probably once the x86 stuff lands).
> > Given the size of this series it might be better split out for
> > manageability if nothing else.

> i would make thread without gcs to implicitly disable gcs, since
> that's what's bw compat with clones outside of libc (the libc can
> guarantee gcs allocation when gcs is enabled).

That'd create a pretty substantial divergence with the x86 patches if
they land this time around, there's not enough time to rework them now -
I suppose it'd mainly bite people implementing libc type stuff but
still, doesn't feel great.

--UdmTiHBngnlr6cvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTmANcACgkQJNaLcl1U
h9CieQf+MMgnojrsBIaDJI83Wq0C8xk7vAXbThpL0v56u9wjmEZMDh7EcY2ddq/2
JABAkm2liE7SLPjWQBEUUN0/IeeUmkf96mYK4WQlULgjiwfY47oi3jWUhZ6k9LhM
8pjyl1KON9bRNIrulNLtQVYAPXm7vhGBmR0BjziAHJsdoaxh/mFuY24eV8GU6M+g
3y8nYYgKNOAjB6E6//Acfg4jVvxYJGMdmVlJl4REhmre1EGrE2R3NAiKDJZ/sKGz
3F4rR/Opy2Sa/VQFqR1eyjhZEjZxVgbrBukhZV+ExyMSjPfagV2qok97yi7jIIXg
lRrBa8MwILXz0GiOAj9Xz5WDbjUsRQ==
=F2xx
-----END PGP SIGNATURE-----

--UdmTiHBngnlr6cvp--


--===============2959719515256108171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2959719515256108171==--

