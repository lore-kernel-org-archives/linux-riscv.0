Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69596C48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 17:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JPZrVIfJs99ddxAxJvU3YGHbh/aF/6sip8grj0kM6M=; b=Xu6LFYNNzwEDG5SqVjUS6FgUIP
	EHpPSvf2h3YH2y/p5zRLLtEzfZjeCTt1DlbS4mx6SqzJ7NtL9F2q/3loXCUuwgCVAfedFKTzenjwO
	YpP44jJIM7amxdsWSak/2IaxZ+T2upPD5/QU7uMn4Kjh3opXXSPjFlHdon0srpiMxShTl/DxJfpwg
	IBYdCxs3ONfL/mnjzX8ZO7oIugm1DM9jTAWbpYjgFSSxZqFsyJFylf540xzb+QcZh5qm8qKa5a1YJ
	UfGHkSRutGMNKXWThJRcjUoTeva85Aq9a6ZMMaxtF4Y17kVPqG5RsLEko2ghk2GfR8J8LwQeKlN1N
	dFCbusIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfjlS-0000000EOfE-2esu;
	Thu, 29 Feb 2024 17:00:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfjlP-0000000EOdn-18jb
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 17:00:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 43B66CE1B1B;
	Thu, 29 Feb 2024 17:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA7F9C433F1;
	Thu, 29 Feb 2024 17:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709226004;
	bh=PsmNWvgMO8+Tys0w7eoxchJVlxT9fbOIk+ZzPkdoL3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IeXV11nnz+V4Jzj1cRldGfIoCGbh6L6jSxw0RgaCg9u3rBcM/q+fD6cjWnI4wCZ4W
	 gymGVSeMH7xn5aafKbp5JBH8t86m5laxyYnuQUkk03DBNN+8q1R2ofzeD+xDDVPyoA
	 7wTAemrJXh3lT4ZtiRn29joBI3t69giScTAVqjjb7IDL8g/BRi1OrPMXM2v4cHGH8z
	 Ge0ZlV7SmKpQfnnyhonUDINm5UEcGRLMGd3ADQxNLS1fKYTo1EEUs4Sg7hHYA2aBco
	 8sNp34ekpW6zDcWuYBrDGOfwEUWrUjlEAAefoQzOeB2IGbL/qKrMKNfhGJJKHmmgjE
	 mX1LHK/iHnt8w==
Date: Thu, 29 Feb 2024 17:00:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Subject: Re: vector status when vlen doesn't match
Message-ID: <20240229-luster-visa-b839b4cf93e9@spud>
References: <20240228-vicinity-cornstalk-4b8eb5fe5730@spud>
 <mhng-5f6c5913-f2a0-4a04-9904-fc360cab91c5@palmer-ri-x1c9a>
 <20240228-durably-anymore-19d6c7d79f43@spud>
 <CABgGipXE2yroy6YwDEybx1d8UBoASa6HdGbkLP25O8AHSKpQwQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgGipXE2yroy6YwDEybx1d8UBoASa6HdGbkLP25O8AHSKpQwQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_090007_695665_16A4456A 
X-CRM114-Status: GOOD (  78.98  )
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
Content-Type: multipart/mixed; boundary="===============2858144764098841969=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2858144764098841969==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2Yt1atQ3LGbnubgx"
Content-Disposition: inline


--2Yt1atQ3LGbnubgx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 09:32:56PM +0800, Andy Chiu wrote:
> On Thu, Feb 29, 2024 at 7:32=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Wed, Feb 28, 2024 at 01:56:51PM -0800, Palmer Dabbelt wrote:
> > > On Wed, 28 Feb 2024 08:02:47 PST (-0800), Conor Dooley wrote:
> > > > Yo Andy,
> > > >
> > > > I was wondering if you could clarify something that came up today on
> > > > IRC.
> > > >
> > > > When we enable vector we check vlenb and if it doesn't match the ke=
rnel
> > > > is suppose to not support vector. We do this in a few places, the f=
irst
> > > > is in riscv_fill_hwcap():
> > > >
> > > >     if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
> > > >             riscv_v_setup_vsize();
> > > >             /*
> > > >              * ISA string in device tree might have 'v' flag, but
> > > >              * CONFIG_RISCV_ISA_V is disabled in kernel.
> > > >              * Clear V flag in elf_hwcap if CONFIG_RISCV_ISA_V is d=
isabled.
> > > >              */
> > > >             if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
> > > >                     elf_hwcap &=3D ~COMPAT_HWCAP_ISA_V;
> > > >     }
> > > >
> > > > Why does this riscv_v_setup_vsize() failing have no impact? Because=
 this
> > > > is called only once on the boot CPU, right? I feel like it deserves=
 a
> > > > comment as to why.
> > >
> > > Unless I'm missing something, that first call can't fail: there's no
> > > previous riscv_v_size set, so there's nothing to trigger the failure.
> > >
> > > Might warrant a comment, though...
> >
> > Yeah. I did write (or maybe moreso remodel) that function so I know it
> > only gets called on the boot CPU, I was just pointing out what is not
> > immediately obvious about that particular callsite.
>=20
> Yes, this call can't fall. Ok, I'll update the comment.

Thanks.

> > > > But the main thing I was wondering about was the other time it is c=
alled,
> > > > in smp_callin():
> > > >     if (has_vector()) {
> > > >             if (riscv_v_setup_vsize())
> > > >                     elf_hwcap &=3D ~COMPAT_HWCAP_ISA_V;
> > > >     }
> > > >
> > > > If this fails, we clear the HWCAP bit, but I am not immediately gra=
sping
> > > > how this affects the rest of the kernel.
> > >
> > > I think it's actually a bug: we're not clearing the bit in riscv_isa,=
 so
> > > this only ends up disabling the V bit in AT_HWCAP and thus doesn't do
> > > anything in the kernel.
> >
> > Yeah, that's what I was getting at - I could not see how disabling it in
> > hwcap would make a difference either in the kernel or in hwprobe. I was
> > not sure if I was missing something in terms of the
> > userspace-using-vector side of things, but I was pretty sure that
> > hwprobe and in-kernel vector had this bug.
>=20
> hwprobe still reports the hardware has Vector. Shouldn't this be ok
> because hwprobe reflects what is supported by the hardware? I think
> we'd need another bit in hwprobe to reflect the value in hwcap though.

No. The hwprobe test was never whether or not the hardware has vector,
given has_vector() does not actually represent that. Rather,
has_vector() should only return true when the running kernel on hardware
that supports vector is capable of supporting vector.

> Userspace context switch code is gated by VS =3D=3D 0. I am not sure if we
> need something more obvious.

Could you point me out where exactly this is happening? Also, what is
"VS" in this context?

> The in-kernel vector part was not well-considered. It sounds ok for
> the non-preemptible vector. Userspace won't be able to execute any
> user vector on a non-symmetric vector platform.

How does the kernel prevent this?

> So all in-kernel
> vector code doesn't have to save/restore userspace vector registers.
> The task executing non-preemptible in-kernel vector code has no chance
> to be rescheduled on other cores during vector execution. So it should
> be fine as long as multiple parts of kernel_vector_{begin,end}() do
> not assume using the same vlen. Most vector code doesn't assume
> running on a particular vlen (vlen agnostic), so ideally it should be
> safe.
>=20
> Parts of the kernel blindly assume riscv_v_size !=3D 0. Those should be
> changed. However, race conditions may happen if userspace is already
> up and running at this stage (cpu hotplug?). We must not reschedule a
> userspace process which is actively executing vector to a core that
> runs in a different vlen.

> It is not possible to execute the preemptible vector in a
> non-symmetric vector platform. This should be gated by failing the
> allocation of kernel_vstate.datap.

It sounds to me like the kernel does not currently do this?
However, I don't think we should even get as far as a failed allocation,
given we _know_ far before any in-kernel vector users appear whether or
not we have identical vlen across all CPUs.

> > > > has_vector() just checks if the extension is supported by all cores=
 on
> > > > the cpu using either an alternative or the extension support bitmap.
> > > > There are lots of sites in the kernel that use has_vector() as the
> > > > gating check (as far as I can tell), so if vlen does not match betw=
een
> > > > CPUs should we not be returning an error for has_vector()?
>=20
> No, has_vector() still returns true because it is backed by
> alternative and determined during boot.

In case you misunderstood, I know how has_vector() works - I was
suggesting a change to its behaviour.

> > > > The alternative that has_vector() relies on is patched before the n=
on-boot
> > > > CPUs are enabled, so we cannot modify the result once the non-boot =
CPUs
> > > > are in their callin functions and detect a vlen mismatch while at a=
t the
> > > > same time using it in smp_calling(), so should this code be changed=
 to
> > > > something along the lines of:
> > > >
> > > >     if (riscv_has_extension_unlikely(v)) {
> > > >             if (riscv_v_setup_vsize()) {
> > > >                     elf_hwcap &=3D ~COMPAT_HWCAP_ISA_V;
> > > >                     riscv_v_vlen_mismatch =3D true;
> > > >             }
> > > >     }
> > > > and then has_vector() becomes something like
> > > > static __always_inline bool has_vector(void)
> > > > {
> > > >     return riscv_has_extension_unlikely(RISCV_ISA_EXT_v) && unlikel=
y(riscv_v_vlen_mismatch);
> > > > }
> > > >
> > > > Probably there's value to be gained in static branches etc here, bu=
t I
> > > > was just trying to explain what I was getting at. Maybe I am missing
> > > > something though? I do remember talking about this back when the ve=
ctor
> > > > patches were still in review.
> > >
> > > I actually don't think that alone fixes it: even if we make has_vecto=
r()
> > > respect the changes from the new CPU (whether we re-apply the alterna=
tives
> > > or make a more dynamic check), we'd need to make sure the code that h=
as
> > > already looked at has_vector() doesn't get scheduled on one of the
> > > shorter-VLENB CPUs.
>=20
> I agree that flipping off the alternative for has_vector() could be
> dangerous at this point.
>=20
> >
> > Is it possible to have that happen given this is in smp_callin()?
> > I guess the concern is some sort of hotplug situations, given that a CPU
> > could be hotplugged into a fully running system with a vlen mismatch.
> >
> > > So maybe the right answer here is to flip things around, and just ref=
use to
> > > enable CPUs that come in with a VLENB different than the boot CPU?  T=
hat way
> > > we could avoid being broken by systems that behave this way,
> >
> > smp_callin() doesn't return an error to report a failure, but it does
> > have a completion. I suppose we would just return early from
> > smp_callin() so that the completion never gets completed, in turn
> > causing __cpu_up() to fail?
>=20
> I agree disabling the entire vector or fail bringing up the cpu is the
> safe way though.
>=20
> >
> > > if someone ends
> > > up building one then they can figure out how to make it work better.
> >
> > Apparently the next gen sophgo product does. Not sure if people will wnt
> > to run across all the cores though, apparently they different by a lot
> > more than vlen.
>=20
> The vector patchset assumes running on an SMP system. Supporting
> non-symmetric vlen or non-symmetric isa may require some efforts.

Supporting non symmetric extensions is actually not that hard, depending
on what the variance is - we already support enabling the intersection
of what all CPUs support. Supporting something like that for vlen
though, I agree.

> > A DT property would allow us to get the vlen info before the CPUs have
> > themselves been brought up. Apparently there are Zvl extensions for
> > this, but I'd rather just have a property like we have for the cbo
> > sizes if it comes to DT properties.
>=20
> Yes, perhaps having a DT property is the first step to go. Because we
> can prevent race set/get-ing riscv_v_vsize in such case.

I think it is the second step. The first step I think is making
smp_callin() fail if vlen doesn't match, since that can be applied as a
quick fix to avoid issues on systems that have different vlens and would
also prevent an issue on a non-DT system.

Cheers,
Conor.

--2Yt1atQ3LGbnubgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeC4EQAKCRB4tDGHoIJi
0qzhAQCnrvNXh2rN6VswecRR1WfskhTVQj0joLIdqaRPxABdkAD5AQu9rkdZObyQ
TerDgp++yyovFoIcR19l8tvE7pXZyQA=
=8MBM
-----END PGP SIGNATURE-----

--2Yt1atQ3LGbnubgx--


--===============2858144764098841969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2858144764098841969==--

