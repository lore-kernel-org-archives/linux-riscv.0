Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34DCC0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 17:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/zCF9lKyQH7DrdhkeV+5IgEWIc5EjuZyfCqDB57MVo=; b=nGddN+LcKdM1nhNvcg2HR/vtU2
	c5rhwP577idIFbj5hOFtnSj0JyW+Js2gzj8r/nW7a9633uaUJ80FYccAqNyuHr63mIaCxKlA5dGYx
	wcdV8+SPbHtf/wNgQMZuhRC9nE1IikU+Lc+oycuA2y5eXlSUjfoWiyAV4X7pn/BrUhy0dlnfq0GZ/
	2RRI9+ZqDJcBI95Sl1n28KmoXSs7kzxD48KMHIG53ev7boXRgByVxzdAQR/UlvLyX4gdJubzAXamo
	PIC3bmzxwkbtDu4ELbB++FBFhYrZNCQVTyc3zFHkotYpQK8sHrAwOfgNJ4ECg8Dc7dbAYGQpHr96v
	z4TMVTxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOihu-00BDdA-0D;
	Wed, 26 Jul 2023 17:53:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOihp-00BDcL-2B
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 17:53:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B283D61C03;
	Wed, 26 Jul 2023 17:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61964C433C7;
	Wed, 26 Jul 2023 17:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690394028;
	bh=8DjIEhh9DKwxjK9sTvdof7w016JYE3o4Jhf4rvmOQ+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SSwZdi14bcsG8mK1whHYPKsw7fmTT8OnYhY6dKZ50nFlfRFr1NXSReaM4gbO7DNKg
	 Rtmdq/esr9DN/93Q0VFllllKbsnVWXtJOEeXfWUsVp31uc/GBZJDt0djGopQfaWkSi
	 fekH62KyLjZsTGrEiVYfM3DRWRES0gfc2b7i5hz3OKG003DUoU7hJ8bMkwcXb5NC7I
	 0t83Pehg7rfqNwaX7VHeAdxHAMz1zHH1rpMknhfyT27aQ244CFXGfsXZMYsQGxwJqw
	 OTkmzFYqnOd+UeDEmI4ZeDUf9QWc9qA6BaWLBxrtFmqucm4R6rLrajINPtCCOo5gbR
	 Q/WF8qPFd6nWg==
Date: Wed, 26 Jul 2023 18:53:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, jszhang@kernel.org,
	apatel@ventanamicro.com, heiko@sntech.de
Subject: Re: more /proc/cpuinfo & extension support related woes
Message-ID: <20230726-coronary-monologue-fa2c0e28c98d@spud>
References: <20230725-friction-enlisted-7acb7c3c03bf@spud>
 <20230726-44005036239541a139fe7b2e@orel>
 <20230726-ransack-life-8b71c7c0542b@wendy>
 <20230726-cab7c446f0a1f6de93e1e819@orel>
 <CALs-Hsur65B079vhpSne_db1x7-RW-KpLCe4wRvJHuDGtGC_zw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-Hsur65B079vhpSne_db1x7-RW-KpLCe4wRvJHuDGtGC_zw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_105349_828902_91F930C6 
X-CRM114-Status: GOOD (  91.41  )
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
Content-Type: multipart/mixed; boundary="===============8033983446331699340=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8033983446331699340==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tk+U0rVMGlgCDvO/"
Content-Disposition: inline


--tk+U0rVMGlgCDvO/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 10:18:26AM -0700, Evan Green wrote:
> On Wed, Jul 26, 2023 at 5:55=E2=80=AFAM Andrew Jones <ajones@ventanamicro=
=2Ecom> wrote:
> >
> > On Wed, Jul 26, 2023 at 11:41:05AM +0100, Conor Dooley wrote:
> > > On Wed, Jul 26, 2023 at 11:04:39AM +0200, Andrew Jones wrote:
> > > > On Tue, Jul 25, 2023 at 06:19:36PM +0100, Conor Dooley wrote:
> > >
> > > > > (I've only CCed a few people here, mostly those who were involved=
 in the
> > > > > riscv_has_extension_likely() stuff earlier this year)
> > > > >
> > > > > I know using /proc/cpuinfo for extension detection is a bad idea,=
 that's
> > > > > not the point of this. We can go on about how it is bad, but peop=
le are
> > > > > using it & we shouldn't knowingly lead them astray. For example, =
unlord
> > > > > reported on IRC yesterday that, having built a kernel using a rel=
eased
> > > > > version of llvm, they were surprised to see illegal instruction
> > > > > exceptions given /proc/cpuinfo had a v in the ISA string entry.
> > > > >
> > > > > For most extensions that we support in the kernel at the moment, =
the
> > > > > general flow is something along the lines of the DT etc gets pars=
ed,
> > > > > and then we set a bit if the hart supports the extension. For some
> > > > > select extensions, that have additional properties in the DT, we =
perform
> > > > > a check for those before setting the bit. Extensions that the ker=
nel
> > > > > does not understand get ignored as it does not know what to look =
for in
> > > > > the isa string representation.
> > > > >
> > > > > As a result, the kernel populates a list of neither the extensions
> > > > > supported by the hart nor a list of the extensions supported by t=
he
> > > > > running kernel. Instead, its something awkward in the middle - a =
list
> > > > > of extensions that a kernel built from this source code is aware =
of
> > > > > available on this platform.
> > > > >
> > > > > For the case where the system, but not the kernel, supports vecto=
r, we
> > > > > do what looks like a weird dance*, where we set up vsize, but the=
n mask
> > > > > off the hwcap bit:
> > > > >
> > > > >   if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
> > > > >           riscv_v_setup_vsize();
> > > > >           /*
> > > > >            * ISA string in device tree might have 'v' flag, but
> > > > >            * CONFIG_RISCV_ISA_V is disabled in kernel.
> > > > >            * Clear V flag in elf_hwcap if CONFIG_RISCV_ISA_V is d=
isabled.
> > > > >            */
> > > > >           if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
> > > > >                   elf_hwcap &=3D ~COMPAT_HWCAP_ISA_V;
> > > > >   }
> > > > >   * riscv_v_setup_vsize() w/o a return check should be a NOP when
> > > > >   the config option is disabled.
> > > > >
> > > > > Note that only the hwcap bit is masked, but not the corresponding
> > > > > extension support tracking bit in riscv_isa. I'd swear I recall t=
alking
> > > > > to Andy about how this could be problematic w.r.t. false reportin=
g of
> > > > > some variety, I'll have to go find it. It is (I think) the same f=
or any
> > > > > of the other extensions parsed from DT that has a Kconfig option =
that
> > > > > must be set before userspace can use it, such as F & D.
> > > > >
> > > > > Either way, this becomes problematic for /proc/cpuinfo, where we =
do:
> > > > >   static void print_isa_ext(struct seq_file *f)
> > > > >   {
> > > > >           struct riscv_isa_ext_data *edata;
> > > > >           int i =3D 0, arr_sz;
> > > > >
> > > > >           arr_sz =3D ARRAY_SIZE(isa_ext_arr) - 1;
> > > > >
> > > > >           /* No extension support available */
> > > > >           if (arr_sz <=3D 0)
> > > > >                   return;
> > > > >
> > > > >           for (i =3D 0; i <=3D arr_sz; i++) {
> > > > >                   edata =3D &isa_ext_arr[i];
> > > > >                   if (!__riscv_isa_extension_available(NULL, edat=
a->isa_ext_id))
> > > > >                           continue;
> > > > >                   seq_printf(f, "_%s", edata->uprop);
> > > > >           }
> > > > >   }
> > > > >
> > > > > The issue here is the call to __riscv_isa_extension_available() w=
hich,
> > > > > with a NULL first argument, will use the riscv_isa bitmask that c=
ontains,
> > > > > as described above, a list of extensions that a kernel built from=
 this
> > > > > source code is aware of that are available on this platform.
> > > > >
> > > > > This also impacts riscv_has_extension_[un]likely(), which operate=
s on a
> > > > > similar premise. has_vector(), has_svnapot & has_fpu(), which are=
 the
> > > > > users of riscv_has_extension_[un]likely() don't suffer here, beca=
use when
> > > > > their config option is unset, they resolve to `return -EOPNOTSUPP=
;` or
> > > > > similar.
> > > > >
> > > > > Other users of __riscv_isa_extension_available() I have not evalu=
ated
> > > > > yet, but there are quite a few, scattered in various places, incl=
uding
> > > > > kvm & hwprobe.
> > > > >
> > > > > I think we might've just overused this particular bit of informat=
ion for
> > > > > various purposes & screwed ourselves a bit. There are a few main =
places
> > > > > this information is used:
> > > > >
> > > > > 1 Figuring what exactly the hardware supports during boot. Evan h=
as
> > > > >   added per-CPU tracking of this, although the kernel is limited =
here to
> > > > >   the subset that it knows AND further restricted by a call to
> > > > >   riscv_isa_extension_check(). This we don't actually use yet aft=
er
> > > > >   boot, but Evan has a user on the lists. This per-CPU tracking i=
s then
> > > > >   used to create and LCD set of extensions that drives
> > > > >   __riscv_isa_extension_available().
> > > > >
> > > > > 2 Telling userspace what extensions are supported. However, by wh=
at? The
> > > > >   running-kernel & hw combo? The hardware? I tried to read the hw=
probe
> > > > >   doc and couldn't tell. /proc/cpuinfo, as I already said, is a
>=20
> It should be the running kernel & hw. The _BASE_BEHAVIOR key had the lang=
uage "
> user-visible behavior that this kernel supports", but we probably
> should have also mentioned that in keys like _FD.
>=20
> > > > >   mixed-mess, but hwprobe should mean "this extension is supporte=
d by
> > > > >   the hardware (or firmware) and you can use this without a conce=
rn",
> > > > >   right? Evan's proposed per-CPU reporting here adds a third thin=
g to
> > > > >   the mix, but is intended to (AFAIU) represent the set of
> > > > >   known-to-the-kernel extensions that each hart supports, regardl=
ess of
> > > > >   whether the kernel itself supports them.
> > > > >
> > > > > 3 Setting dynamic code paths in the kernel. For example, if the h=
ardware
> > > > >   supports Zbb, patch in the string manip routines. This is disti=
nct
> > > > >   from telling userspace it can use the extension, since somethin=
g like
> > > > >   Zbb can be used by userspace even if the kernel doesn't touch i=
t.
> > > > >
> > > > > 4 Telling in-kernel users what extensions they can use. This, I f=
igure,
> > > > >   is more along the lines of my theorised meaning for hwprobe.
> > > > >
> > > > > I think for case 3, we are mostly okay. Either this sort of code =
uses
> > > > > alternatives, that have an in-built config dependency, or the
> > > > > has_whatever() stuff that has an alternative implementation if the
> > > > > correct config option is not set.
> > > > >
> > > > > For case 2, I think hwprobe is doing the right thing (for now) but
> > > > > /proc/cpuinfo needs to be changed.
>=20
> Will we break userspace by doing this? Or is the argument something
> like: in old kernels we falsely reported extensions that no one could
> possibly use since the kernel didn't support them. So we know by
> removing them we're not breaking anybody, since there was no way to
> successfully use the info.

Yeah, that's my logic. Can't break userspace if it would break itself by
acting on the information.

> > > > > Case 4 probably needs an audit to make sure that nothing is going
> > > > > awry. I'll go have a look through the users.
> > > > >
> > > > > If other people think splitting this up a worthwhile endeavour, I=
'll
> > > > > go write some patches. I do FWIW. Or maybe I am overlooking somet=
hing
> > > > > that makes this less of a problem than I think. LMK if so :)
> > >
> > > > Here's a summary of my thoughts, which probably aren't adding anyth=
ing new
> > > > to this
> > > >
> > > >  - The kernel needs per-hart bitmaps expressing what extensions are
> > > >    supported for each given hart.
> > >
> > > We sorta have this. The per-hart bitmap is a bitmap of extensions that
> > > have defines in hwcap.h (an understandable limitation) and for which
> > > riscv_isa_extension_check() passes.
> > >
> > > >  - The kernel needs a bitmap expressing the LCD of extensions acros=
s all
> > > >    harts.
> > >
> > > Again, we sorta have this. It's all of the per-hart bitmaps, bitwise
> > > ANDed.
> > >
> > > >  (The two bitmaps are clearly expressing the intersection of what's
> > > >   supported by a hart and what the kernel is aware of, since the ke=
rnel
> > > >   must allocate the bits.)
> > >
> > > Right. With the exception of the riscv_isa_extension_check(), that we
> > > currently apply to Zicbo{m,z}.
> > >
> > > Getting ahead of myself a little, but I wonder if we should remove the
> > > riscv_isa_extension_check() stuff from from the code that sets the
> > > bitmaps & instead have it as a separate stage, which would align our
> > > bitmaps with what you suggest here.
> >
> > You touch on this later, but tracking "non-filtered" extensions may not=
 be
> > useful. riscv_isa_extension_check() drops the tracking of extensions wh=
ich
> > have incomplete descriptions. Zicbom with no or a bad block size descri=
bed
> > is really no Zicbom at all, for example.

Right. So there'd have to be two stages of filtering I guess. Firstly on
bad ACPI/DT configuration & then later on Kconfig options etc.

> >
> > >
> > > >  - Extensions in DT/ACPI that the kernel is unaware of get ignored =
by
> > > >    the kernel and not exposed to userspace (if the extensions are f=
or
> > > >    U-mode and U-mode has another way of determining their presence =
to
> > > >    use them, then good for U-mode)
> > >
> > > Sure.
> > >
> > > >  - The kernel will combine information from one of the two bitmaps =
listed
> > > >    above with other information, such as config information, to dec=
ide
> > > >    when / if an extension should be used by the kernel and/or expos=
ed to
> > > >    userspace
> > >
> > > Right. This bit (or rather two bits, since I view the kernel and
> > > userspace bits here separately) is where we are falling short. I think
> > > hwprobe's limited users do the right thing, but we're not doing this =
for
> > > /proc/cpuinfo. For the in-kernel users, grepping shows some suspicious
> > > looking things, but how many are problematic I do not yet know. As an
> > > example, does
> > > static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
> > > {
> > >       u64 henvcfg =3D 0;
> > >
> > >       if (riscv_isa_extension_available(isa, SVPBMT))
> > >               henvcfg |=3D ENVCFG_PBMTE;
> > >
> > > work correctly if the SVPBMT Kconfig option is disabled?
> > > From a quick check, `isa` here is set from the host ISA
> > >       /* Setup ISA features available to VCPU */
> > >       for (i =3D 0; i < ARRAY_SIZE(kvm_isa_ext_arr); i++) {
> > >               host_isa =3D kvm_isa_ext_arr[i];
> > >               if (__riscv_isa_extension_available(NULL, host_isa) &&
> > >                   kvm_riscv_vcpu_isa_enable_allowed(i))
> > >                       set_bit(host_isa, vcpu->arch.isa);
> > >       }
> > > so if the check passes for the host ISA, it'll pass for the guest ISA
> > > too, so henvcfg will end up with the PBMTE bit set. I just haven't yet
> > > checked what the outcome of this will be, but I figure not good?
> >
> > As long as KVM doesn't depend on the rest of the kernel having the
> > extension enabled in order to support the guest's use of it, then the
> > extension can be safely exposed to the guest kernel, even when the
> > host kernel has opted to avoid its use. Indeed, even if the host
> > kernel was compiled without the support of the extension as a
> > workaround for errata, exposing the extension to the guest isn't
> > horrible, as the guest kernel may want to experiment with the broken
> > extension or choose to workaround those errata in another way.

Okay, interesting, sounds like it is not a problem. That was one of the
only cases where there was an interaction with a Kconfig option that
was suspect.
To be quite honest, I am not sure why we even have a config option for
Svpbmt. I think it could be axed and hidden from users, with the
alternative always built in where possible. Where possible meaning
64-bit kernels that use an mmu & are not XIP. Only one of those is a real
constraint AFAICT.

> > > > (it'd be good to have a consistent API for these types of
> > > >    checks which combine extension presence with other information)
> > >
> > > I figure the best option might just be to make the
> > > __riscv_isa_extension_available() into this to avoid disruption? The
> > > vast majority of users of that function want to know whether or not it
> > > is safe to use the extension on that hart, not whether the hart itself
> > > supports it. In fact, outside of Evan's per-hart stuff in /proc/cpuin=
fo,
> > > do we have any users that would even want an API that checks the
> > > "unfiltered" versions? I'll have to check the users to answer that I
> > > think.
>=20
> So the idea is to add stuff into __riscv_isa_extension_available()
> that filters out extensions if their corresponding Kconfig isn't
> enabled?

Nah, my thought is to not even touch the function itself, just change
how the bitmap it uses when NULL is passed as the first argument is
constructed.

> My worry would be that in the future we're going to add
> knowledge of an extension but then forget to add a hunk here to
> disable it if the Kconfig isn't enabled. I guess for extensions that
> are entirely unusable if the Kconfig is disabled, we can call it an
> "oops" and fix it with the same rationale as I described above. But if
> we ever did this with an extension that was partially usable from
> userspace we'd be stuck with it. Maybe I'm speculating too much.

If we retroactively add a Kconfig that partially removes the extension
=66rom userspace, we'd have to default it to enabled anyway for
olddefconfig's sake. Forgetting to add the check entirely has an easy
solution: enable the config option if you want to use the extension.
(Maybe that's a bit harsh, but I think it is valid...)

> > > >  - The kernel will expose sanitized extension information to usersp=
ace.
> > > >    S-mode only extensions do not need to be exposed and extensions =
that
> > > >    require kernel support should only be exposed when the kernel is
> > > >    willing and able to support them. Additional properties of exten=
sions,
> > > >    such as block sizes, also need to be exposed (exposure is done t=
hrough
> > > >    hwprobe)
> > >
> > > It gets extra messy too when the prctl etc get involved. What do you
> > > report in /proc/cpuinfo's isa field when RISCV_ISA_V_DEFAULT_ENABLE is
> > > set to disabled? It would have to respect the sysctl, right?
> > > Ditto the prctl, which will interact "nicely" with things like Google=
's
> > > cpu_feature library that parses /proc/cpuinfo.
> > >       https://github.com/google/cpu_features
> >
> > Sigh...
>=20
> The V prctl is kind of a special case though, isn't it? The way I
> understood it is as a workaround for breaking userspace ABI by adding
> the V registers to the signal context. So we're not expecting
> individual applications to worry about how the prctl is set, init sets
> it to say "I've recompiled the world and vouch that apps can handle
> the larger struct". I'm hoping we can mostly ignore the prctl()'s
> interaction with V.

How these things work isn't something I am too good on. Would it not be
tripped up by running an otherwise non-vector userland with one program
that wishes to turn vector on for itself? IMO, using this cpu_features
library in this case is a horrid idea where you keep the pieces :)

The sysctl I am more interested in.

> > > > I think we have most/all the above already, but the audits you've
> > > > volunteered to do would be welcome, along with maybe documenting
> > > > it all somewhere. Then, after that, all that's left is the "what to
> > > > do with /proc/cpuinfo and hwcap?" question.
> > >
> > > > Can we simply freeze
> > > > what extensions are exposed through them and mark them as deprecate=
d?
> > >
> > > hwcap is already limited to the single-letter stuff, and is already
> > > disabling things like F, D & V if the config options are not set.
> > >
> > > But for /proc/cpuinfo, that is sorta where I was wondering if we shou=
ld
> > > go, but hwprobe isn't a replacement for "casual" checking of what
> > > is/isn't supported, so it may be premature. Certainly, leaving people
> > > without an easy way to check by eye what extensions are present seems
> > > overly painful.
> >
> > I guess it depends on the purpose of the easy check. Is it to see
> > what's supported+enabled by the kernel? Or what's supported by the
> > platform, but may or may not be useable? Or just what's usable for
> > U-mode? Maybe we need a sysfs extension listing where each extension
> > node has subnodes providing their current status (enabled, disabled,
> > etc.). Then lscpu could be taught how to use that information to
> > output different listings depending on the user's needs.
>=20
> I can see people making an argument for keeping it closer to what the
> hardware has, rather than "understood and enabled in the kernel", for
> cases like reporting hardware info of a fleet being managed. Maybe
> there are analogies over in the Intel/ARM world we can use to see what
> the exact expectations of /proc/cpuinfo are (eg do they report
> features in /proc/cpuinfo even if the Kconfig is off?).

I'm not sure. I can do some checking :)

--tk+U0rVMGlgCDvO/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMFdpwAKCRB4tDGHoIJi
0l2gAQCTO6F0GEcaauphxVt8V8epRHqK1uG/QQaZG03pVRMpKwD+M6sFAPs/iprN
a1JMnLEEIBUe5AK7M8VbCIUyd2wwZwU=
=4Rsc
-----END PGP SIGNATURE-----

--tk+U0rVMGlgCDvO/--


--===============8033983446331699340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8033983446331699340==--

