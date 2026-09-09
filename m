Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B25C79FB7
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 18:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGKbkNwmnDPiuJWBRAlJ3yaev78SxyoWXp20jnCtcF4=; b=vjCUxE1n2aUde2/7jygOe8Abyx
	8l9fjwLyTMUsDxg0laXTbbxqpBZi6Pk8lFF8GXY4iL2Xva4lXZTLj8bbB3jJJOdWvI53hPHi/Rerk
	bpbGNBRRUDQS+mjNwQPHlKRth3VFNMKBIGUHU8P+Ut/TEnRsBBjzutzHwh0e1R/NxFgpxzHAy8nPH
	yZxfm9AGPfJzMkQ8KQOmbucMPvz/3YmghnsEt6LEFwR0Dl45827dOW7gbrDJB/SVTogbmK+Y9u6h+
	UZfCbkpTFZeWg5ejRnGbywzES6jveHxnvSdDeIg/SAtSEormy8Djr4sdfjIwXhSn3zcE15YxrVdlv
	8jO8eGWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Mgc-0000000CaHk-2oHU;
	Wed, 09 Sep 2026 18:06:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Mgb-0000000CaHC-2e2w;
	Wed, 09 Sep 2026 18:06:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E61F5401D1;
	Wed,  9 Sep 2026 18:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D75F1F000FF;
	Wed,  9 Sep 2026 18:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788977174;
	bh=PR7LyVcB/OQaKWh0JIa9p8TXYdnREvEGvQ9Sz9YHWIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OighcUDSqngGJ9CNv9qk+KV5pxZ66xYNPMCTky//Dx35FhGvbB8pCGK+zRpjlShGl
	 YryPAbgZT3pGOP0FEc9/g8S6QmDUFje3Ruk8MjDwqwDGWjfCmk2sZZ99S6v7JRqQ/p
	 cbumgrKZ8yTtp2cvX/b/7NkVvHJ+ydTv45kzZYnyUDQ6e12sAqjeecDYgiZQi5yzOF
	 4fe0dHdLoO7p2JPsKHFV0vW6iCd/STFjrRTL7jPPpsUVvioUc0XGpH2mC2pa6hLhAq
	 yKmLmQ7bCvNH3VbLSYKIWiYkBqF6B0QKL6pAUkbLCv3GAFimRZjdrzr9Qxrj84md7g
	 mFKBUZep/4yDA==
Date: Wed, 9 Sep 2026 19:06:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Bill Roberts <bill.roberts@foss.arm.com>
Cc: Jesse Huang <jesse.huang@sifive.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-hardening@vger.kernel.org, linux-api@vger.kernel.org,
	dave.hansen@linux.intel.com, rick.p.edgecombe@intel.com,
	debug@rivosinc.com, andrew@sifive.com, kito.cheng@sifive.com
Subject: Re: Shadow Stack Locking Semantics between arch's
Message-ID: <522bcf96-499c-491b-aaf0-34e6bbd42929@sirena.org.uk>
References: <a1946d93-370e-4ca9-85d6-60b4a20ffd47@arm.com>
 <3bb672e0-7bc3-434f-904e-aa00394dd01f@foss.arm.com>
 <d20ccb74-69ed-45d7-a810-846904873588@sirena.org.uk>
 <0ef9f4ab-4c9f-4089-bed3-f7726ec97804@foss.arm.com>
MIME-Version: 1.0
In-Reply-To: <0ef9f4ab-4c9f-4089-bed3-f7726ec97804@foss.arm.com>
X-Cookie: Postage will be paid by addressee.
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
Content-Type: multipart/mixed; boundary="===============3430286441965781411=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3430286441965781411==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3cXrEZrAslfzFgWm"
Content-Disposition: inline


--3cXrEZrAslfzFgWm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 12:57:57PM -0500, Bill Roberts wrote:

> > > unsigned long locked =3D 0x2; // Kernel Task State -> LOCK WRITE
> > > unsigned long cur_val =3D 0x3; // Kernel Task State -> WRITE and SHAD=
OWSTACK
> > > ENABLED
> > > unsigned long new_val =3D 0x0; // Userspace Feature Change via syscal=
l ->
> > > DISABLE
> > > | x86-64 | risc-v | arm64 |
> > > | ---------- | -------- | --------- |
> > > | Works=A0 | Fails=A0 | Fails=A0 =A0 =A0|

> > I would not have expected that combination to work at all with the
> > prctl() (as opposed to arch_prctl()) interface TBH, if you've locked
> > write on you shouldn't be able to disable it.  The reason that works on
> > x86 at the minute is that for x86 you can only change one bit at a time
> > so the new value when disabling is effectively 0x2, not 0x0.

> Yes, this is exactly what I am pointing out. Implementation aside, is that
> the behavior we want?

It seems more helpful to support changing more than one bit at once.

> > I think for ABI compatibility RISC-V will have to continue accepting 0
> > as being equivalent to locking PR_SHADOW_STACK_ENABLE (or everything,
> > but it only supports that one bit right now).

> TL;DR - No users, lets fix it before risc-v lands the userspace side IIUC

Oh, that would be even better if we could do that!  Thanks for checking
the userspace situation.

> > > 3. riscv should return -EPERM vs -EINVAL

> > If you mean for arch_lock_shadow_stack_status() I think -EINVAL is a
> > sensible error code when the system or task does not support shadow
> > stacks, I'm not sure we should return -EPERM at all.  On arm64 we
> > support locking any bit, not just the ones that we currently know about.
> > This is for future proofing, userspace can lock unknown flags.

> No, I mean when setting a locked bit via prctl
> and=A0PR_SET_SHADOW_STACK_STATUS.
> Currently, the error codes for changing a locked bit:
> x86: EPERM
> arm64: EBUSY (Which we discussed offline about changing to EPERM)

Yes, I'll post a patch for that this week all being well.

--3cXrEZrAslfzFgWm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqhoBAACgkQJNaLcl1U
h9BQZAf+NudoLDPJlxzRoCSVqeb16MHSW4LVbZcxQP3o6kDklLpNPCi8oNdaNSa6
p+9kozMAe1v3hCalNkj835zwn83kzLH3w10KXbYWkMib4SoJHt0ejLcZCiKe3kjl
yfJ8IFCtQM/5WSZY//M6rZHOa1XDirsB+3ORsc2RgbR+0E7QjBj1C4Ch3wdDL1at
2eFP+aN2QeJ/7VsBk7s9bxwyOkeYZLFX7BSEP74uZQ5HQULOlDVioEkHsuFtWo4X
OjoyYDxMD2JaMEjPbcGG3uof5VVKJFE5onkID/khZ4U3a0xX8J/4GNT0C31q0Uj5
OtmSrWul8+KkNSSlj6QCIAyyDIK1BA==
=G+9c
-----END PGP SIGNATURE-----

--3cXrEZrAslfzFgWm--


--===============3430286441965781411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3430286441965781411==--

