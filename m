Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA1FC3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 12:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=539HIj78fZj/jDCCuFpbZexezUZOW3Kv3aEoprf+5F0=; b=Q5OuWLcKBuiuR1np79KrD2lyE6
	WP/nt16ojYE4Un0+yKA7S5KtmHCjiVmtF68RkY1uHls0+yvl5mm68ItSNtY6cIOvKL2NdTuNaoXe6
	aLKQaUrtHE/howCq/akjcBw0N0M7qVzsrYbwKlSieX1tcyspjipfaIoUF2wgc+0eOPMnyo5A9RN+w
	DnOqC00/g4qkvsvl6jndVGafIrjVA+M0noV+CT5gC596eKTBGkhO+7midln0kW/oKlrAEOZCCl/PI
	h8PdNjJeXCYMpg8txIhjhgDWZw4XDQ/jEtD/qN/c7OhHmSGwCm+sxW5HhITU9IvQH+25MvvO4XvwH
	dVHqxOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEpz2-007kNU-2E;
	Sun, 17 Dec 2023 12:11:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEpyz-007kL3-1L;
	Sun, 17 Dec 2023 12:10:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9668ECE0AD7;
	Sun, 17 Dec 2023 12:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5D1C433C7;
	Sun, 17 Dec 2023 12:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702815053;
	bh=a66tj8N4PdZrRpj7zjYZM1VA5iyh24+UFASNVr20mZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JM+1W4373Z1/80Pnq7FohMDx2169u6iuvDaFZkGyYZG1opJrcS+EG0yJbBfKzGcyf
	 vumCk1ikMTEiF6e55LXu4Db2Z4LuM3vQ66x+cRHZ6VARJePslZP1urmKY/vLEEDJN/
	 N+uNd0Nznzv8pgRdRgXBNl/Bkk4wHOs5K9exveF/5H8an9xvZ4QjHAzDRFI2sXuA5g
	 gJzn6et7TaZrgFDg6IWGGndPZS1gkCR6QxYP80LbGG2LIp5arHpLKciEsJIuWtlR1F
	 e18EzhzLwndRx+QLdYYpdIm4OkEchJrpTKanvcOTUW99EkyjuGr5ZZUD4J+Buc3LOt
	 RVKUzeQiLtXAQ==
Date: Sun, 17 Dec 2023 12:10:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [RFC 6/9] drivers/perf: riscv: Implement SBI PMU snapshot
 function
Message-ID: <20231217-navigate-thirsty-03509850a683@spud>
References: <20231205024310.1593100-1-atishp@rivosinc.com>
 <20231205024310.1593100-7-atishp@rivosinc.com>
 <20231207-daycare-manager-2f4817171422@wendy>
 <CAHBxVyE3xAAj=Z_Cu33tEKjXEAcnOV_=Jpkpn-+j5MoLj1FPWw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHBxVyE3xAAj=Z_Cu33tEKjXEAcnOV_=Jpkpn-+j5MoLj1FPWw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_041057_831953_99085AD0 
X-CRM114-Status: GOOD (  46.51  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============1376586746079856011=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1376586746079856011==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XU9hTNRI3vOngvxn"
Content-Disposition: inline


--XU9hTNRI3vOngvxn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 16, 2023 at 05:39:12PM -0800, Atish Kumar Patra wrote:
> On Thu, Dec 7, 2023 at 5:06=E2=80=AFAM Conor Dooley <conor.dooley@microch=
ip.com> wrote:
> > On Mon, Dec 04, 2023 at 06:43:07PM -0800, Atish Patra wrote:

> > > +static void pmu_sbi_snapshot_free(struct riscv_pmu *pmu)
> > > +{
> > > +     int cpu;
> >
> > > +     struct cpu_hw_events *cpu_hw_evt;
> >
> > This is only used inside the scope of the for loop.
> >
>=20
> Do you intend to suggest using mixed declarations ? Personally, I
> prefer all the declarations upfront for readability.
> Let me know if you think that's an issue or violates coding style.

I was suggesting

int cpu;

for_each_possible_cpu(cpu)
	struct cpu_hw_events *cpu_hw_evt =3D per....()

I've been asked to do this in some subsystems I submitted code to,
and checkpatch etc do not complain about it. I don't think there is any
specific commentary in the coding style about minimising the scope of
variables however.

> > > +     /* Free up the snapshot area memory and fall back to default SB=
I */
> >
> > What does "fall back to the default SBI mean"? SBI is an interface so I
> > don't understand what it means in this context. Secondly,
>=20
> In absence of SBI PMU snapshot, the driver would try to read the
> counters directly and end up traps.
> Also, it would not use the SBI PMU snapshot flags in the SBI start/stop c=
alls.
> Snapshot is an alternative mechanism to minimize the traps. I just
> wanted to highlight that.
>=20
> How about this ?
> "Free up the snapshot area memory and fall back to default SBI PMU
> calls without snapshot */

Yeah, that's fine (modulo the */ placement). The original comment just
seemed truncated.

> > > +     if (ret.error) {
> > > +             if (ret.error !=3D SBI_ERR_NOT_SUPPORTED)
> > > +                     pr_warn("%s: pmu snapshot setup failed with err=
or %ld\n", __func__,
> > > +                             ret.error);
> >
> > Why is the function relevant here? Is the error message in-and-of-itself
> > not sufficient here? Where else would one be setting up the snapshots
> > other than the setup function?
> >
>=20
> The SBI implementation (i.e OpenSBI) may or may not provide a snapshot
> feature. This error message indicates
> that SBI implementation supports PMU snapshot but setup failed for
> some other error.

I don't see what this has to do with printing out the function. This is
a unique error message, and there is no other place where the setup is
done AFAICT.

> > > +             /* Snapshot is taken relative to the counter idx base. =
Apply a fixup. */
> > > +             if (hwc->idx > 0) {
> > > +                     sdata->ctr_values[hwc->idx] =3D sdata->ctr_valu=
es[0];
> > > +                     sdata->ctr_values[0] =3D 0;
> >
> > Why is this being zeroed in this manner? Why is zeroing it not required
> > if hwc->idx =3D=3D 0? You've got a comment there that could probably do=
 with
> > elaboration.
> >
>=20
> hwc->idx is the counter_idx_base here. If it is zero, that means the
> counter0 value is updated
> in the shared memory. However, if the base > 0, we need to update the
> relative counter value
> from the shared memory. Does it make sense ?

Please expand on the comment so that it contains this information.

> > > +             ret =3D pmu_sbi_snapshot_setup(pmu, smp_processor_id());
> > > +             if (!ret) {
> > > +                     pr_info("SBI PMU snapshot is available to optim=
ize the PMU traps\n");
> >
> > Why the verbose message? Could we standardise on one wording for the SBI
> > function probing stuff? Most users seem to be "SBI FOO extension detect=
ed".
> > Only IPI has additional wording and PMU differs slightly.
>=20
> Additional information is for users to understand PMU functionality
> uses less traps on this system.
> We can just resort to and expect users to read upon the purpose of the
> snapshot from the spec.
> "SBI PMU snapshot available"

What I was asking for was alignment with the majority of other SBI
extensions that use the format I mentioned above.

>=20
> >
> > > +                     /* We enable it once here for the boot cpu. If =
snapshot shmem fails during
> >
> > Again, comment style here. What does "snapshot shmem" mean? I think
> > there's a missing action here. Registration? Allocation?
> >
>=20
> Fixed it. It is supposed to be "snapshot shmem setup"
>=20
> > > +                      * cpu hotplug on, it should bail out.
> >
> > Should or will? What action does "bail out" correspond to?
> >
>=20
> bail out the cpu hotplug process. We don't support heterogeneous pmus
> for snapshot.
> If the SBI implementation returns success for SBI_EXT_PMU_SNAPSHOT_SET_SH=
MEM
> boot cpu but fails for other cpus while bringing them up, it is
> problematic to handle that.

"bail out" should be replaced by a more technical explanation of what is
going to happen. "should" is a weird word to use, either the cpuhotplug
code does or does not deal with this case, and since that code is also
in the kernel, this patchset should ensure that it does handle the case,
no? If the kernel does handle it "should" should be replaced with more
definitive wording.

Thanks,
Conor.

--XU9hTNRI3vOngvxn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZX7lSAAKCRB4tDGHoIJi
0l/hAP9YqJoyrNUc/htZ3H5eYM9OdIGG2sawQAN+P2IYsH66AAEAs/CkW1OYlLt3
zyWWLtE53KE6mH6LAp9FSYmcrAjDGA0=
=gtpU
-----END PGP SIGNATURE-----

--XU9hTNRI3vOngvxn--


--===============1376586746079856011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1376586746079856011==--

