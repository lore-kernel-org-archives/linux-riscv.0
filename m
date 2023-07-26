Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36B6C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 10:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpgjK4Qvq/MEAZjHj8hCr1qdgsro+SrT+oC1e4R9G2U=; b=AW/D3rScmthBTfJyYpzTu5BWTr
	w0j4s86LQPkGEHzIljpAm2bpr0lMJhdWy50aczUyVTMKZVKPLxENh3tdQR4BO6CZ4bdAx1fP2zlWe
	goIFY2jove7rEd0Fh5aLyg4SJXWd+U2iLj4Q71AZJdOQN1n6maBQVurDFAFtZsdAnzfp5FqAk5zZz
	KcpZ/XWi+UbvCwxMcWemdruVOHRHSUNVrpXofnwXyE2xGjWMnAEER0yB+uEarxzefVYxlhe0D6vZj
	2B421NH/3HetZbsDRHGke0Hpjmx4YZTaRwED2gbWy4f6pdOpqk7pqbnW69TVVIoAq8Qj5y6mtWF1n
	376j7otw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOby1-009vLy-1A;
	Wed, 26 Jul 2023 10:42:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qObxw-009vKD-2q
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 10:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690368120; x=1721904120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q64+fdVTOxuP6DJ+1iA+DMze6QLOo1wUlCCQZ0p75EE=;
  b=ifRL85JeVXIjbKNxFYn2rPL8NKg0ddfzkGYhgJvVRR5s66YxXCbecfR5
   p2csAYgzstjGP8Hmoj46U7d0fgD2BTaT/xIFbvQr+Oe5PUyHKPGmjMMpW
   qzd9/NeDlxMp0CNnt0iTk4uokVWgSmf138bUINTSJO/a0m8glbmLgHkqe
   FxXotJrAA3FnpToirlSTa35gqoOnoB3zsHRCBC+AW7clg08SKa4yoVnEC
   T4M5fEVBHYlBJ4BX+Y+ncdVkRFSLnKxxpZFCFzSIZTQjZcEzPh1cjLwJg
   +xlczQFqMLl1laQOVV0FgtFNYk0d8b6vw2SA/qTeiLMiQfpwvIJVPhwZ1
   w==;
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="asc'?scan'208";a="225293993"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jul 2023 03:41:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 26 Jul 2023 03:41:41 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 26 Jul 2023 03:41:40 -0700
Date: Wed, 26 Jul 2023 11:41:05 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <evan@rivosinc.com>, <jszhang@kernel.org>,
	<apatel@ventanamicro.com>, <heiko@sntech.de>
Subject: Re: more /proc/cpuinfo & extension support related woes
Message-ID: <20230726-ransack-life-8b71c7c0542b@wendy>
References: <20230725-friction-enlisted-7acb7c3c03bf@spud>
 <20230726-44005036239541a139fe7b2e@orel>
MIME-Version: 1.0
In-Reply-To: <20230726-44005036239541a139fe7b2e@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_034201_002953_D4DFFDC1 
X-CRM114-Status: GOOD (  81.28  )
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
Content-Type: multipart/mixed; boundary="===============6271403205131419224=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6271403205131419224==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lAjgwLTiznLZQ7i4"
Content-Disposition: inline

--lAjgwLTiznLZQ7i4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 11:04:39AM +0200, Andrew Jones wrote:
> On Tue, Jul 25, 2023 at 06:19:36PM +0100, Conor Dooley wrote:

> > (I've only CCed a few people here, mostly those who were involved in the
> > riscv_has_extension_likely() stuff earlier this year)
> >=20
> > I know using /proc/cpuinfo for extension detection is a bad idea, that's
> > not the point of this. We can go on about how it is bad, but people are
> > using it & we shouldn't knowingly lead them astray. For example, unlord
> > reported on IRC yesterday that, having built a kernel using a released
> > version of llvm, they were surprised to see illegal instruction
> > exceptions given /proc/cpuinfo had a v in the ISA string entry.
> >=20
> > For most extensions that we support in the kernel at the moment, the
> > general flow is something along the lines of the DT etc gets parsed,
> > and then we set a bit if the hart supports the extension. For some
> > select extensions, that have additional properties in the DT, we perform
> > a check for those before setting the bit. Extensions that the kernel
> > does not understand get ignored as it does not know what to look for in
> > the isa string representation.
> >=20
> > As a result, the kernel populates a list of neither the extensions
> > supported by the hart nor a list of the extensions supported by the
> > running kernel. Instead, its something awkward in the middle - a list
> > of extensions that a kernel built from this source code is aware of
> > available on this platform.
> >=20
> > For the case where the system, but not the kernel, supports vector, we
> > do what looks like a weird dance*, where we set up vsize, but then mask
> > off the hwcap bit:
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
> > 	* riscv_v_setup_vsize() w/o a return check should be a NOP when
> > 	the config option is disabled.
> >=20
> > Note that only the hwcap bit is masked, but not the corresponding
> > extension support tracking bit in riscv_isa. I'd swear I recall talking
> > to Andy about how this could be problematic w.r.t. false reporting of
> > some variety, I'll have to go find it. It is (I think) the same for any
> > of the other extensions parsed from DT that has a Kconfig option that
> > must be set before userspace can use it, such as F & D.
> >=20
> > Either way, this becomes problematic for /proc/cpuinfo, where we do:
> > 	static void print_isa_ext(struct seq_file *f)
> > 	{
> > 		struct riscv_isa_ext_data *edata;
> > 		int i =3D 0, arr_sz;
> > =09
> > 		arr_sz =3D ARRAY_SIZE(isa_ext_arr) - 1;
> > =09
> > 		/* No extension support available */
> > 		if (arr_sz <=3D 0)
> > 			return;
> > =09
> > 		for (i =3D 0; i <=3D arr_sz; i++) {
> > 			edata =3D &isa_ext_arr[i];
> > 			if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
> > 				continue;
> > 			seq_printf(f, "_%s", edata->uprop);
> > 		}
> > 	}
> >=20
> > The issue here is the call to __riscv_isa_extension_available() which,
> > with a NULL first argument, will use the riscv_isa bitmask that contain=
s,
> > as described above, a list of extensions that a kernel built from this
> > source code is aware of that are available on this platform.
> >=20
> > This also impacts riscv_has_extension_[un]likely(), which operates on a
> > similar premise. has_vector(), has_svnapot & has_fpu(), which are the
> > users of riscv_has_extension_[un]likely() don't suffer here, because wh=
en
> > their config option is unset, they resolve to `return -EOPNOTSUPP;` or
> > similar.
> >=20
> > Other users of __riscv_isa_extension_available() I have not evaluated
> > yet, but there are quite a few, scattered in various places, including
> > kvm & hwprobe.
> >=20
> > I think we might've just overused this particular bit of information for
> > various purposes & screwed ourselves a bit. There are a few main places
> > this information is used:
> >=20
> > 1 Figuring what exactly the hardware supports during boot. Evan has
> >   added per-CPU tracking of this, although the kernel is limited here to
> >   the subset that it knows AND further restricted by a call to
> >   riscv_isa_extension_check(). This we don't actually use yet after
> >   boot, but Evan has a user on the lists. This per-CPU tracking is then
> >   used to create and LCD set of extensions that drives
> >   __riscv_isa_extension_available().
> >=20
> > 2 Telling userspace what extensions are supported. However, by what? The
> >   running-kernel & hw combo? The hardware? I tried to read the hwprobe
> >   doc and couldn't tell. /proc/cpuinfo, as I already said, is a
> >   mixed-mess, but hwprobe should mean "this extension is supported by
> >   the hardware (or firmware) and you can use this without a concern",
> >   right? Evan's proposed per-CPU reporting here adds a third thing to
> >   the mix, but is intended to (AFAIU) represent the set of
> >   known-to-the-kernel extensions that each hart supports, regardless of
> >   whether the kernel itself supports them.
> >=20
> > 3 Setting dynamic code paths in the kernel. For example, if the hardware
> >   supports Zbb, patch in the string manip routines. This is distinct
> >   from telling userspace it can use the extension, since something like
> >   Zbb can be used by userspace even if the kernel doesn't touch it.
> >=20
> > 4 Telling in-kernel users what extensions they can use. This, I figure,
> >   is more along the lines of my theorised meaning for hwprobe.
> >=20
> > I think for case 3, we are mostly okay. Either this sort of code uses
> > alternatives, that have an in-built config dependency, or the
> > has_whatever() stuff that has an alternative implementation if the
> > correct config option is not set.
> >=20
> > For case 2, I think hwprobe is doing the right thing (for now) but
> > /proc/cpuinfo needs to be changed.
> >=20
> > Case 4 probably needs an audit to make sure that nothing is going
> > awry. I'll go have a look through the users.
> >=20
> > If other people think splitting this up a worthwhile endeavour, I'll
> > go write some patches. I do FWIW. Or maybe I am overlooking something
> > that makes this less of a problem than I think. LMK if so :)

> Here's a summary of my thoughts, which probably aren't adding anything new
> to this
>=20
>  - The kernel needs per-hart bitmaps expressing what extensions are
>    supported for each given hart.

We sorta have this. The per-hart bitmap is a bitmap of extensions that
have defines in hwcap.h (an understandable limitation) and for which
riscv_isa_extension_check() passes.

>  - The kernel needs a bitmap expressing the LCD of extensions across all
>    harts.

Again, we sorta have this. It's all of the per-hart bitmaps, bitwise
ANDed.

>  (The two bitmaps are clearly expressing the intersection of what's
>   supported by a hart and what the kernel is aware of, since the kernel
>   must allocate the bits.)

Right. With the exception of the riscv_isa_extension_check(), that we
currently apply to Zicbo{m,z}.

Getting ahead of myself a little, but I wonder if we should remove the
riscv_isa_extension_check() stuff from from the code that sets the
bitmaps & instead have it as a separate stage, which would align our
bitmaps with what you suggest here.

>  - Extensions in DT/ACPI that the kernel is unaware of get ignored by
>    the kernel and not exposed to userspace (if the extensions are for
>    U-mode and U-mode has another way of determining their presence to
>    use them, then good for U-mode)

Sure.

>  - The kernel will combine information from one of the two bitmaps listed
>    above with other information, such as config information, to decide
>    when / if an extension should be used by the kernel and/or exposed to
>    userspace=20

Right. This bit (or rather two bits, since I view the kernel and
userspace bits here separately) is where we are falling short. I think
hwprobe's limited users do the right thing, but we're not doing this for
/proc/cpuinfo. For the in-kernel users, grepping shows some suspicious
looking things, but how many are problematic I do not yet know. As an
example, does
static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
{
	u64 henvcfg =3D 0;

	if (riscv_isa_extension_available(isa, SVPBMT))
		henvcfg |=3D ENVCFG_PBMTE;

work correctly if the SVPBMT Kconfig option is disabled?
=46rom a quick check, `isa` here is set from the host ISA
	/* Setup ISA features available to VCPU */
	for (i =3D 0; i < ARRAY_SIZE(kvm_isa_ext_arr); i++) {
		host_isa =3D kvm_isa_ext_arr[i];
		if (__riscv_isa_extension_available(NULL, host_isa) &&
		    kvm_riscv_vcpu_isa_enable_allowed(i))
			set_bit(host_isa, vcpu->arch.isa);
	}
so if the check passes for the host ISA, it'll pass for the guest ISA
too, so henvcfg will end up with the PBMTE bit set. I just haven't yet
checked what the outcome of this will be, but I figure not good?

> (it'd be good to have a consistent API for these types of
>    checks which combine extension presence with other information)

I figure the best option might just be to make the
__riscv_isa_extension_available() into this to avoid disruption? The
vast majority of users of that function want to know whether or not it
is safe to use the extension on that hart, not whether the hart itself
supports it. In fact, outside of Evan's per-hart stuff in /proc/cpuinfo,
do we have any users that would even want an API that checks the
"unfiltered" versions? I'll have to check the users to answer that I
think.

>  - The kernel will expose sanitized extension information to userspace.
>    S-mode only extensions do not need to be exposed and extensions that
>    require kernel support should only be exposed when the kernel is
>    willing and able to support them. Additional properties of extensions,
>    such as block sizes, also need to be exposed (exposure is done through
>    hwprobe)

It gets extra messy too when the prctl etc get involved. What do you
report in /proc/cpuinfo's isa field when RISCV_ISA_V_DEFAULT_ENABLE is
set to disabled? It would have to respect the sysctl, right?
Ditto the prctl, which will interact "nicely" with things like Google's
cpu_feature library that parses /proc/cpuinfo.
	https://github.com/google/cpu_features

> I think we have most/all the above already, but the audits you've
> volunteered to do would be welcome, along with maybe documenting
> it all somewhere. Then, after that, all that's left is the "what to
> do with /proc/cpuinfo and hwcap?" question.

> Can we simply freeze
> what extensions are exposed through them and mark them as deprecated?

hwcap is already limited to the single-letter stuff, and is already
disabling things like F, D & V if the config options are not set.

But for /proc/cpuinfo, that is sorta where I was wondering if we should
go, but hwprobe isn't a replacement for "casual" checking of what
is/isn't supported, so it may be premature. Certainly, leaving people
without an easy way to check by eye what extensions are present seems
overly painful.

Cheers,
Conor.

--lAjgwLTiznLZQ7i4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMD4QQAKCRB4tDGHoIJi
0p0NAQDfYQrZCk+wevL4DAHaiCl6IQrwCvaBs0leP+ZOOH+FMwD/VrYrS265w9Ye
k+i4dkhN6BeEvwwZPBK8SoARkGW6VQg=
=Yrth
-----END PGP SIGNATURE-----

--lAjgwLTiznLZQ7i4--


--===============6271403205131419224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6271403205131419224==--

