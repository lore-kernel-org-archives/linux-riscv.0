Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1067C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 17:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=v2G9RtbXGKNmaV5IBaMxTJYomsWv7LgvUb3ump8FEU0=; b=ZBv
	xLiPmuWSa8grFr1/yPrOIkXsghgMrpdrNyKUGbFTozbm5F1IbtXvx9hZIbcGkrrYJ+7foIHf67C7M
	pSXWYnoUGnz1+YL9kiKyiqxsXKxF4i62I0PUJIFP5IWCdK/tNiFpU70RmwzRvT1sN1o4/35Muu0jo
	R7OkDB8OmpQYZKFcrJoBDIQKwXMXYATYdpAF2shpwvO45JNbRilFOK9xKN+NiD+nYvZPju8IaW5bJ
	lis1Tc0pIvRqkPsRuO/Ltzwy5fhuurPtao+tiXZMSTzczPsTSVF1iY0kASCzJdF2aryHaFPufEmlF
	ohnmYk9bUdzSVq53pwA2Vl4ITZBUjUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOLhJ-00895A-0C;
	Tue, 25 Jul 2023 17:19:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOLhG-00894d-0Q
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 17:19:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D22A161787;
	Tue, 25 Jul 2023 17:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6819C433C8;
	Tue, 25 Jul 2023 17:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690305580;
	bh=O5Pw1lMCmTaF0FJEZGABPlTx0Z3VjUfTcPHgD5G7FQ4=;
	h=Date:From:To:Cc:Subject:From;
	b=F061zw+XNQVIB9qDoZT6HJx8r9rLWquRokpun8aWQYn7HfPz4ut2l+yfl1jgwnqGp
	 cIzoVJCe0WC1r+kx2fQL9WY+peKdauFQYFt6BODTOSXEHMctqKx6why38oAqNnMV4C
	 fF6h85MxQgewcvfvwNOaVOqHIhnaNArtrF9n1GDEiC67pRmjir9Bnej11jQeWt4/2P
	 pBQpoYUxuIc/5NCzs0IlEBsHQBO8N+bLEcRlRn69FD424J8SdWX6ze/1gbMJrnHDD9
	 5YCKu2l2qxSdNBzmKQ9g9kkznlKqW6IXjsSl56O7LNAjJ09VR2D+sGOf43cdy97l1I
	 +HYqa0fu/UZYQ==
Date: Tue, 25 Jul 2023 18:19:36 +0100
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com, linux-riscv@lists.infradead.org
Cc: ajones@ventanamicro.com, evan@rivosinc.com, jszhang@kernel.org,
	apatel@ventanamicro.com, heiko@sntech.de
Subject: more /proc/cpuinfo & extension support related woes
Message-ID: <20230725-friction-enlisted-7acb7c3c03bf@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_101942_277557_EBFBCD28 
X-CRM114-Status: GOOD (  35.42  )
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
Content-Type: multipart/mixed; boundary="===============7151520551657987522=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7151520551657987522==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yTKXPFXtn6VY4A0r"
Content-Disposition: inline


--yTKXPFXtn6VY4A0r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

(I've only CCed a few people here, mostly those who were involved in the
riscv_has_extension_likely() stuff earlier this year)

I know using /proc/cpuinfo for extension detection is a bad idea, that's
not the point of this. We can go on about how it is bad, but people are
using it & we shouldn't knowingly lead them astray. For example, unlord
reported on IRC yesterday that, having built a kernel using a released
version of llvm, they were surprised to see illegal instruction
exceptions given /proc/cpuinfo had a v in the ISA string entry.

For most extensions that we support in the kernel at the moment, the
general flow is something along the lines of the DT etc gets parsed,
and then we set a bit if the hart supports the extension. For some
select extensions, that have additional properties in the DT, we perform
a check for those before setting the bit. Extensions that the kernel
does not understand get ignored as it does not know what to look for in
the isa string representation.

As a result, the kernel populates a list of neither the extensions
supported by the hart nor a list of the extensions supported by the
running kernel. Instead, its something awkward in the middle - a list
of extensions that a kernel built from this source code is aware of
available on this platform.

For the case where the system, but not the kernel, supports vector, we
do what looks like a weird dance*, where we set up vsize, but then mask
off the hwcap bit:

	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
		riscv_v_setup_vsize();
		/*
		 * ISA string in device tree might have 'v' flag, but
		 * CONFIG_RISCV_ISA_V is disabled in kernel.
		 * Clear V flag in elf_hwcap if CONFIG_RISCV_ISA_V is disabled.
		 */
		if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
			elf_hwcap &=3D ~COMPAT_HWCAP_ISA_V;
	}
	* riscv_v_setup_vsize() w/o a return check should be a NOP when
	the config option is disabled.

Note that only the hwcap bit is masked, but not the corresponding
extension support tracking bit in riscv_isa. I'd swear I recall talking
to Andy about how this could be problematic w.r.t. false reporting of
some variety, I'll have to go find it. It is (I think) the same for any
of the other extensions parsed from DT that has a Kconfig option that
must be set before userspace can use it, such as F & D.

Either way, this becomes problematic for /proc/cpuinfo, where we do:
	static void print_isa_ext(struct seq_file *f)
	{
		struct riscv_isa_ext_data *edata;
		int i =3D 0, arr_sz;
=09
		arr_sz =3D ARRAY_SIZE(isa_ext_arr) - 1;
=09
		/* No extension support available */
		if (arr_sz <=3D 0)
			return;
=09
		for (i =3D 0; i <=3D arr_sz; i++) {
			edata =3D &isa_ext_arr[i];
			if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
				continue;
			seq_printf(f, "_%s", edata->uprop);
		}
	}

The issue here is the call to __riscv_isa_extension_available() which,
with a NULL first argument, will use the riscv_isa bitmask that contains,
as described above, a list of extensions that a kernel built from this
source code is aware of that are available on this platform.

This also impacts riscv_has_extension_[un]likely(), which operates on a
similar premise. has_vector(), has_svnapot & has_fpu(), which are the
users of riscv_has_extension_[un]likely() don't suffer here, because when
their config option is unset, they resolve to `return -EOPNOTSUPP;` or
similar.

Other users of __riscv_isa_extension_available() I have not evaluated
yet, but there are quite a few, scattered in various places, including
kvm & hwprobe.

I think we might've just overused this particular bit of information for
various purposes & screwed ourselves a bit. There are a few main places
this information is used:

1 Figuring what exactly the hardware supports during boot. Evan has
  added per-CPU tracking of this, although the kernel is limited here to
  the subset that it knows AND further restricted by a call to
  riscv_isa_extension_check(). This we don't actually use yet after
  boot, but Evan has a user on the lists. This per-CPU tracking is then
  used to create and LCD set of extensions that drives
  __riscv_isa_extension_available().

2 Telling userspace what extensions are supported. However, by what? The
  running-kernel & hw combo? The hardware? I tried to read the hwprobe
  doc and couldn't tell. /proc/cpuinfo, as I already said, is a
  mixed-mess, but hwprobe should mean "this extension is supported by
  the hardware (or firmware) and you can use this without a concern",
  right? Evan's proposed per-CPU reporting here adds a third thing to
  the mix, but is intended to (AFAIU) represent the set of
  known-to-the-kernel extensions that each hart supports, regardless of
  whether the kernel itself supports them.

3 Setting dynamic code paths in the kernel. For example, if the hardware
  supports Zbb, patch in the string manip routines. This is distinct
  from telling userspace it can use the extension, since something like
  Zbb can be used by userspace even if the kernel doesn't touch it.

4 Telling in-kernel users what extensions they can use. This, I figure,
  is more along the lines of my theorised meaning for hwprobe.

I think for case 3, we are mostly okay. Either this sort of code uses
alternatives, that have an in-built config dependency, or the
has_whatever() stuff that has an alternative implementation if the
correct config option is not set.

For case 2, I think hwprobe is doing the right thing (for now) but
/proc/cpuinfo needs to be changed.

Case 4 probably needs an audit to make sure that nothing is going
awry. I'll go have a look through the users.

If other people think splitting this up a worthwhile endeavour, I'll
go write some patches. I do FWIW. Or maybe I am overlooking something
that makes this less of a problem than I think. LMK if so :)

Thanks,
Conor.

--yTKXPFXtn6VY4A0r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMAEKAAKCRB4tDGHoIJi
0j+8AQCrz0p7wZ9VqcCd3DSpK14dwr9TMec6lDzKfTI2NkY1iAD+IoHVvfte17EF
2ASi27bItWNLZrdzImsdEVjcuRNbpQU=
=cbS/
-----END PGP SIGNATURE-----

--yTKXPFXtn6VY4A0r--


--===============7151520551657987522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7151520551657987522==--

