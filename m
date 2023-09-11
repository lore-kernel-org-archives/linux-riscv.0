Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA6BEE57DF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 12:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Htg8+LNjwjtnXPMCiVIRtrIg15pR4rsAmbyq+ORMV6A=; b=jefC4HV8+TY8xRPNEOaMLu7qDE
	TrrxFpBlPuRbITFrT4vA70XMarRvvm4GTuo7ZXFaWCBSJ9CScPrBUUekoVf1nEZhZp4KGxE/HBpxK
	+r8Feh07X87H05h1QxJxlABgosvClPvs/rVDGygzgs7Cg3+9k9cnOH8YJ5pmswi7ZAyOfZwHCezD7
	PuB96sdL/zS7VEe0NAhumMuZ1NAQ/ngTnIbzuYg43LyDwTPtwLXnFEKqRKUhXhpVTvOGOAcQMCrXy
	q63d4yH+tZYe1jdvlS4Smu/IVVWkEkFvJmMr084bLEoZFAhbcIZlOYtfXYPtvx5GDNeH22CksuucS
	Lcx1VEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgQA-000WSY-10;
	Mon, 11 Sep 2023 12:53:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgQ6-000WRr-1h
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 12:53:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694436818; x=1725972818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F18RZdFWM4GMQROAAbnXFN2k3b4JLezGGc1Iq3gZ/zs=;
  b=Qof1Tn7Drz2q5pJBs19D48KXqtndp0XKgs3tlMDifP76PS338MECL1dh
   WAHlq0xoY3413x9Ban2Nz06RWbaUnazYlREVnPkuBmtj1XKmChE9bgUO/
   1qKK+RKn5M6v6RiuoxrUBr45xcjSm0pgbL5P3aoOzKMQW9X0Vc4LY5wIs
   alLHvVcJ7epXnzlDZzBDE5eowV9oDvRZx9VFc4sRm/n1U0h0ZCh0wvmKN
   AYNlxz6QqdgDcbFHFnpb7ym6k0CXbBo7aatj6c+g8BcbjrzPCiaQut6Wf
   mUyNOChpsyMtz9EqSSWL0V/8fxR2hJ87nCpUURCYcLOA4q9/UidAVnyzp
   A==;
X-CSE-ConnectionGUID: rGMnXp3/ScCh2he0ZE8W7g==
X-CSE-MsgGUID: +aT+43DkQw6jnFnRFXnEkQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="asc'?scan'208";a="3979966"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Sep 2023 05:53:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 11 Sep 2023 05:53:19 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 11 Sep 2023 05:53:14 -0700
Date: Mon, 11 Sep 2023 13:52:59 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Guo Ren <guoren@kernel.org>
CC: Conor Dooley <conor@kernel.org>, <paul.walmsley@sifive.com>,
	<anup@brainfault.org>, <peterz@infradead.org>, <mingo@redhat.com>,
	<will@kernel.org>, <palmer@rivosinc.com>, <longman@redhat.com>,
	<boqun.feng@gmail.com>, <tglx@linutronix.de>, <paulmck@kernel.org>,
	<rostedt@goodmis.org>, <rdunlap@infradead.org>, <catalin.marinas@arm.com>,
	<xiaoguang.xing@sophgo.com>, <bjorn@rivosinc.com>, <alexghiti@rivosinc.com>,
	<keescook@chromium.org>, <greentime.hu@sifive.com>,
	<ajones@ventanamicro.com>, <jszhang@kernel.org>, <wefu@redhat.com>,
	<wuwei2016@iscas.ac.cn>, <leobras@redhat.com>, <linux-arch@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<kvm@vger.kernel.org>, <virtualization@lists.linux-foundation.org>,
	<linux-csky@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 00/17] riscv: Add Native/Paravirt qspinlock support
Message-ID: <20230911-nimbly-outcome-496efae7adc6@wendy>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910-esteemed-exodus-706aaae940b1@spud>
 <CAJF2gTRQd_dNuZHNwfg3SwD0XERaYXYUdFUFQiarym40kpxFRQ@mail.gmail.com>
 <20230910-baggage-accent-ec5331b58c8e@spud>
 <CAJF2gTS8Vh5XdMUcgLA_GJzW6Nm3JKHxuMN9jYSNe_YCEjgCXA@mail.gmail.com>
 <20230910-facsimile-answering-60d1452b8c10@spud>
 <CAJF2gTSP1rxVhuwOKyWiE2vFFijJFc2aKRU2=0rTK9nDc8AbsQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTSP1rxVhuwOKyWiE2vFFijJFc2aKRU2=0rTK9nDc8AbsQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_055338_626978_9DA27B88 
X-CRM114-Status: GOOD (  38.18  )
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
Content-Type: multipart/mixed; boundary="===============0656841607564287292=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0656841607564287292==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GbfQjpg1lIhwJuEz"
Content-Disposition: inline

--GbfQjpg1lIhwJuEz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2023 at 11:36:27AM +0800, Guo Ren wrote:
> On Mon, Sep 11, 2023 at 3:45=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Sun, Sep 10, 2023 at 05:49:13PM +0800, Guo Ren wrote:
> > > On Sun, Sep 10, 2023 at 5:32=E2=80=AFPM Conor Dooley <conor@kernel.or=
g> wrote:
> > > >
> > > > On Sun, Sep 10, 2023 at 05:16:46PM +0800, Guo Ren wrote:
> > > > > On Sun, Sep 10, 2023 at 4:58=E2=80=AFPM Conor Dooley <conor@kerne=
l.org> wrote:
> > > > > >
> > > > > > On Sun, Sep 10, 2023 at 04:28:54AM -0400, guoren@kernel.org wro=
te:
> > > > > >
> > > > > > > Changlog:
> > > > > > > V11:
> > > > > > >  - Based on Leonardo Bras's cmpxchg_small patches v5.
> > > > > > >  - Based on Guo Ren's Optimize arch_spin_value_unlocked patch=
 v3.
> > > > > > >  - Remove abusing alternative framework and use jump_label in=
stead.
> > > > > >
> > > > > > btw, I didn't say that using alternatives was the problem, it w=
as
> > > > > > abusing the errata framework to perform feature detection that =
I had
> > > > > > a problem with. That's not changed in v11.
> > > > > I've removed errata feature detection. The only related patches a=
re:
> > > > >  - riscv: qspinlock: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
> > > > >  - riscv: qspinlock: errata: Enable qspinlock for T-HEAD processo=
rs
> > > > >
> > > > > Which one is your concern? Could you reply on the exact patch thr=
ead? Thx.
> > > >
> > > > riscv: qspinlock: errata: Enable qspinlock for T-HEAD processors
> > > >
> > > > Please go back and re-read the comments I left on v11 about using t=
he
> > > > errata code for feature detection.
> > > >
> > > > > > A stronger forward progress guarantee is not an erratum, AFAICT.
> > > >
> > > > > Sorry, there is no erratum of "stronger forward progress guarante=
e" in the V11.
> > > >
> > > > "riscv: qspinlock: errata: Enable qspinlock for T-HEAD processors" =
still
> > > > uses the errata framework to detect the presence of the stronger fo=
rward
> > > > progress guarantee in v11.
> > > Oh, thx for pointing it out. I could replace it with this:
> > >
> > > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > > index 88690751f2ee..4be92766d3e3 100644
> > > --- a/arch/riscv/kernel/setup.c
> > > +++ b/arch/riscv/kernel/setup.c
> > > @@ -310,7 +310,8 @@ static void __init riscv_spinlock_init(void)
> > >  {
> > >  #ifdef CONFIG_RISCV_COMBO_SPINLOCKS
> > >         if (!enable_qspinlock_key &&
> > > -           (sbi_get_firmware_id() !=3D SBI_EXT_BASE_IMPL_ID_KVM)) {
> > > +           (sbi_get_firmware_id() !=3D SBI_EXT_BASE_IMPL_ID_KVM) &&
> > > +           (sbi_get_mvendorid() !=3D THEAD_VENDOR_ID)) {
> > >                 static_branch_disable(&combo_qspinlock_key);
> > >                 pr_info("Ticket spinlock: enabled\n");
> > >         } else {
> >
> > As I said on v11, I am opposed to feature probing using mvendorid & Co,
> > partially due to the exact sort of check here to see if the kernel is
> > running as a KVM guest. IMO, whether a platform has this stronger

> KVM can't use any fairness lock, so forcing it using a Test-Set lock
> or paravirt qspinlock is the right way. KVM is not a vendor platform.

My point is that KVM should be telling the guest what additional features
it is capable of using, rather than the kernel making some assumptions
based on$vendorid etc that are invalid when the kernel is running as a
KVM guest.
If the mvendorid etc related assumptions were dropped, the kernel would
then default away from your qspinlock & there'd not be a need to
special-case KVM AFAICT.

> > guarantee needs to be communicated by firmware, using ACPI or DT.
> > I made some comments on v11, referring similar discussion about the
> > thead vector stuff. Please go take a look at that.
> I prefer forcing T-HEAD processors using qspinlock, but if all people
> thought it must be in the ACPI or DT, I would compromise. Then, I
> would delete the qspinlock cmdline param patch and move it into DT.
>=20
> By the way, what's the kind of DT format? How about:

I added the new "riscv,isa-extensions" property in part to make
communicating vendor extensions like this easier. Please try to use
that. "qspinlock" is software configuration though, the vendor extension
should focus on the guarantee of strong forward progress, since that is
the non-standard aspect of your IP.

A commandline property may still be desirable, to control the locking
method used, since the DT should be a description of the hardware, not
for configuring software policy in your operating system.

Thanks,
Conor.

>         cpus {
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
> +              qspinlock;
>                 cpu0: cpu@0 {
>                         compatible =3D "sifive,bullet0", "riscv";
>                         device_type =3D "cpu";
>                         i-cache-block-size =3D <64>;
>                         i-cache-sets =3D <128>;
>=20
> --
> Best Regards
>  Guo Ren

--GbfQjpg1lIhwJuEz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZP8NqwAKCRB4tDGHoIJi
0ldAAP9GGcetHG7gYZ4HG1QKhxMohQaaxgboYx7iHBroM1TWOQD/ZjZA5Wijf1OK
1IInfX9naDCgcUU+DJfxo1FhU6ifVAA=
=zWg1
-----END PGP SIGNATURE-----

--GbfQjpg1lIhwJuEz--


--===============0656841607564287292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0656841607564287292==--

