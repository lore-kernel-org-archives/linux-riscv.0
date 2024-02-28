Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9CBC5475B
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 23:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6fz8x2hu3BH8adt104eqoVB6XO/aoqYOaFT+tT5HdM=; b=A4Tk67pN/2gjGcNg4+3XykcUyC
	2cZCgtCCcPHVWoK7KKmEyCBfxouzdihFGzqL0LPXkIk6eOeYUQq+bjeFN1CIa60KtHW1OlV6+sjwE
	59WAE+z6HlmKjQFjNRGkQEYXLLre+RfIAOsESls3NOmsygR4Pg6BRQ23hkKtkfC34jVGTfsqh692o
	iPaCvhJLAsCCmdXdg/9iD2mUCHMHpgmjNDIlJEu8qpE2NUUGWNTqHhl+F5oP77St8o3JY/gSMfQd6
	WchRI6X4+zvm3dRr9NRaXSsBztlsY+pTKWC/eyac3OaD7pxXyszRt0ueZTuGlmidrNC4rKC/SgIx9
	K+ClJNaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfTPz-0000000BIHV-3tcn;
	Wed, 28 Feb 2024 23:32:55 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfTPx-0000000BIH1-0Teq
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 23:32:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 78172CE12B8;
	Wed, 28 Feb 2024 23:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E037BC433C7;
	Wed, 28 Feb 2024 23:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709163170;
	bh=qg4EozW7EL64gvikm5/4LJs+LZV9Wa0bJNmbBrHGl/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VeTWy+Dk3JGddAaCS2DnxpTwVNYuKnoV4dwTDdC3r3yWx6IZ1UGc7A9oe3gYKCkdi
	 oJU+aYN6HO2vElDYevRCxS7WbwZ1KQ+1pDAzBGQOzNI2m2Yl+WAoGbOZhkmyPCcP7O
	 po95UzFBxDTV1cY7+35E08ReOuK29hl+iCw91RVSIMjqpGhAL/5ANell0Y7w3/cBm4
	 WpsnyCX4F3yC0qrTLhT7giqkAXt27WxujMDyqvioytwjOZZyoxeA+gQ2ozNDqlxvO3
	 xDg3+9JBppaBGhsNqtDIjLB+91mTckjTGjZ859ATz11XNPYxD43Zg9GC6MN8Ccb/r3
	 1Mnhe1sNMy5lA==
Date: Wed, 28 Feb 2024 23:32:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, andy.chiu@sifive.com
Subject: Re: vector status when vlen doesn't match
Message-ID: <20240228-durably-anymore-19d6c7d79f43@spud>
References: <20240228-vicinity-cornstalk-4b8eb5fe5730@spud>
 <mhng-5f6c5913-f2a0-4a04-9904-fc360cab91c5@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-5f6c5913-f2a0-4a04-9904-fc360cab91c5@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_153253_535600_4E84D47E 
X-CRM114-Status: GOOD (  55.80  )
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
Content-Type: multipart/mixed; boundary="===============4517731943358082653=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4517731943358082653==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gBXhnTvGdFfNlZO1"
Content-Disposition: inline


--gBXhnTvGdFfNlZO1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 01:56:51PM -0800, Palmer Dabbelt wrote:
> On Wed, 28 Feb 2024 08:02:47 PST (-0800), Conor Dooley wrote:
> > Yo Andy,
> >=20
> > I was wondering if you could clarify something that came up today on
> > IRC.
> >=20
> > When we enable vector we check vlenb and if it doesn't match the kernel
> > is suppose to not support vector. We do this in a few places, the first
> > is in riscv_fill_hwcap():
> >=20
> > 	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
> > 		riscv_v_setup_vsize();
> > 		/*
> > 		 * ISA string in device tree might have 'v' flag, but
> > 		 * CONFIG_RISCV_ISA_V is disabled in kernel.
> > 		 * Clear V flag in elf_hwcap if CONFIG_RISCV_ISA_V is disabled.
> > 		 */
> > 		if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
> > 			elf_hwcap &=3D ~COMPAT_HWCAP_ISA_V;
> > 	}
> >=20
> > Why does this riscv_v_setup_vsize() failing have no impact? Because this
> > is called only once on the boot CPU, right? I feel like it deserves a
> > comment as to why.
>=20
> Unless I'm missing something, that first call can't fail: there's no
> previous riscv_v_size set, so there's nothing to trigger the failure.
>=20
> Might warrant a comment, though...

Yeah. I did write (or maybe moreso remodel) that function so I know it
only gets called on the boot CPU, I was just pointing out what is not
immediately obvious about that particular callsite.

> > But the main thing I was wondering about was the other time it is calle=
d,
> > in smp_callin():
> > 	if (has_vector()) {
> > 		if (riscv_v_setup_vsize())
> > 			elf_hwcap &=3D ~COMPAT_HWCAP_ISA_V;
> > 	}
> >=20
> > If this fails, we clear the HWCAP bit, but I am not immediately grasping
> > how this affects the rest of the kernel.
>=20
> I think it's actually a bug: we're not clearing the bit in riscv_isa, so
> this only ends up disabling the V bit in AT_HWCAP and thus doesn't do
> anything in the kernel.

Yeah, that's what I was getting at - I could not see how disabling it in
hwcap would make a difference either in the kernel or in hwprobe. I was
not sure if I was missing something in terms of the
userspace-using-vector side of things, but I was pretty sure that
hwprobe and in-kernel vector had this bug.

> > has_vector() just checks if the extension is supported by all cores on
> > the cpu using either an alternative or the extension support bitmap.
> > There are lots of sites in the kernel that use has_vector() as the
> > gating check (as far as I can tell), so if vlen does not match between
> > CPUs should we not be returning an error for has_vector()?
> >=20
> > The alternative that has_vector() relies on is patched before the non-b=
oot
> > CPUs are enabled, so we cannot modify the result once the non-boot CPUs
> > are in their callin functions and detect a vlen mismatch while at at the
> > same time using it in smp_calling(), so should this code be changed to
> > something along the lines of:
> >=20
> > 	if (riscv_has_extension_unlikely(v)) {
> > 		if (riscv_v_setup_vsize()) {
> > 			elf_hwcap &=3D ~COMPAT_HWCAP_ISA_V;
> > 			riscv_v_vlen_mismatch =3D true;
> > 		}
> > 	}
> > and then has_vector() becomes something like
> > static __always_inline bool has_vector(void)
> > {
> > 	return riscv_has_extension_unlikely(RISCV_ISA_EXT_v) && unlikely(riscv=
_v_vlen_mismatch);
> > }
> >=20
> > Probably there's value to be gained in static branches etc here, but I
> > was just trying to explain what I was getting at. Maybe I am missing
> > something though? I do remember talking about this back when the vector
> > patches were still in review.
>=20
> I actually don't think that alone fixes it: even if we make has_vector()
> respect the changes from the new CPU (whether we re-apply the alternatives
> or make a more dynamic check), we'd need to make sure the code that has
> already looked at has_vector() doesn't get scheduled on one of the
> shorter-VLENB CPUs.

Is it possible to have that happen given this is in smp_callin()?
I guess the concern is some sort of hotplug situations, given that a CPU
could be hotplugged into a fully running system with a vlen mismatch.

> So maybe the right answer here is to flip things around, and just refuse =
to
> enable CPUs that come in with a VLENB different than the boot CPU?  That =
way
> we could avoid being broken by systems that behave this way,

smp_callin() doesn't return an error to report a failure, but it does
have a completion. I suppose we would just return early from
smp_callin() so that the completion never gets completed, in turn
causing __cpu_up() to fail?

> if someone ends
> up building one then they can figure out how to make it work better.

Apparently the next gen sophgo product does. Not sure if people will wnt
to run across all the cores though, apparently they different by a lot
more than vlen.
A DT property would allow us to get the vlen info before the CPUs have
themselves been brought up. Apparently there are Zvl extensions for
this, but I'd rather just have a property like we have for the cbo
sizes if it comes to DT properties.

Cheers,
Conor.

--gBXhnTvGdFfNlZO1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd/CnwAKCRB4tDGHoIJi
0vs6AP47dUMLPnnTFeCtKzm8MISBIQRYiByxBvhyL36MAJwS8wD+PJwUxJW35WHH
YuWgaESWoYmOzx+as0mYKkFA2p7l0gQ=
=XZvC
-----END PGP SIGNATURE-----

--gBXhnTvGdFfNlZO1--


--===============4517731943358082653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4517731943358082653==--

