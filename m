Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102FAC61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 13:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GcO9QgMFntCKReV2IUz/FyrmsI3KfluLC9U9svozXA=; b=d97QczfJE8zjNk4+K+39b+t6xb
	YiRmaEVFK851bZZdf/rfxPs9hhk1ZS/Ipcd73JZKith4WvqdEeYAxc5DNb410ywXac+3h9Uj/yl5L
	GykHKUgpVN5sjju4bOnNjYf5BS+TFAxEsBguJv0IeyUndio6bBO96fBPiGturCMAFklFnQZsk30BJ
	RK4vEU0TgUoW/BjMIlLXiF+3nyUiCl/gWGXEBkAkbGEFrCAz/6VT3aAzogAoCdfcMCnCKIV9weIc8
	Lip9T/o0MAzXNkL3pBUE3a4+1oTrR8ffqKgk1Hj6UFd2/ucDjvh/MawTrVdXBfQas+UA8biGyz2oG
	Lv/0l3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYPq-002eK8-Et; Fri, 24 Feb 2023 13:47:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYPl-002eJX-LA
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 13:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677246429; x=1708782429;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=svExHASrxBNfvjix3EUIil3k+3MWeqtRfQ/6FW19gl8=;
  b=jYdhiauFRdSMlN5pNseBXtihDmjOEjHRIskje31aFde0lJeDCC1Fx7fs
   TO+BSs+mbKl66aLNmUA+IK98iykRYHtOZM9QiFtts2XOUuy5T37bDn5lb
   LOxRTF3OMFYDPtevtd5rSxP/QHMKfL72VQQKbnktDmbsDvASIEf/qK08l
   iY80nQu8800ssDGr+cYT64s7p72zDvMMw3bQRSZ5+UDUyxtCNSVLUvvAV
   g3uqQEfxVqqzGUOAybCJCNkbLh9nPNJSSyUdnfjnUfRYeQBM5j6aB4UZe
   FZiNZR6HprmV72q/hKuiBqiAzCZsTt8CI8ylKd80o0+tJ+XfXykxR/uIB
   w==;
X-IronPort-AV: E=Sophos;i="5.97,324,1669100400"; 
   d="asc'?scan'208";a="138922874"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Feb 2023 06:47:08 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 06:47:06 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 24 Feb 2023 06:47:05 -0700
Date: Fri, 24 Feb 2023 13:46:38 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Changbin Du <changbin.du@huawei.com>
CC: Conor Dooley <conor@kernel.org>, <palmer@dabbelt.com>, Palmer Dabbelt
	<palmerdabbelt@google.com>, <linux-riscv@lists.infradead.org>, Steven Rostedt
	<rostedt@goodmis.org>, Changbin Du <changbin.du@gmail.com>, Palmer Dabbelt
	<palmer@rivosinc.com>, Hui Wang <hw.huiwang@huawei.com>
Subject: Re: [PATCH v3] RISC-V: Don't check text_mutex during stop_machine
Message-ID: <Y/i/vkcX5AEQ6qAm@wendy>
References: <20230215164317.727657-1-conor@kernel.org>
 <20230216113126.kio4uqovoo4p6ubm@M910t>
 <Y/iafgRdYtWCmQZ2@wendy>
 <20230224125857.dbsaj7mv2by66wm3@M910t>
MIME-Version: 1.0
In-Reply-To: <20230224125857.dbsaj7mv2by66wm3@M910t>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_054709_799277_BDA5E74D 
X-CRM114-Status: GOOD (  18.91  )
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
Content-Type: multipart/mixed; boundary="===============8339892660240952037=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8339892660240952037==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VFPawkrPNyUOHIDJ"
Content-Disposition: inline

--VFPawkrPNyUOHIDJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 08:58:57PM +0800, Changbin Du wrote:
> On Fri, Feb 24, 2023 at 11:07:42AM +0000, Conor Dooley wrote:
> > > > -	lockdep_assert_held(&text_mutex);
> > > > +	if (!riscv_ftrace_in_stop_machine)
> > > > +		lockdep_assert_held(&text_mutex);
> > > > =20
> > > >  	if (across_pages)
> > > >  		patch_map(addr + len, FIX_TEXT_POKE1);
> > > This misses this function.
> > >=20
> > > int patch_text(void *addr, u32 insn)
> >=20
> > So, with a corresponding rename to the symbol, does the following look
> > okay to you?
> >=20
> > diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/pro=
bes/kprobes.c
> > index f21592d20306..433b454e693f 100644
> > --- a/arch/riscv/kernel/probes/kprobes.c
> > +++ b/arch/riscv/kernel/probes/kprobes.c
> > @@ -27,9 +27,15 @@ static void __kprobes arch_prepare_ss_slot(struct kp=
robe *p)
> > =20
> >  	p->ainsn.api.restore =3D (unsigned long)p->addr + offset;
> > =20
> > +	/*
> > +	 * kprobes takes text_mutex, but patch_text() calls stop_machine and
> > +	 * lockdep gets confused by the context in which the lock is taken.
> > +	 */
> > +	riscv_patch_in_stop_machine =3D true;
> >  	patch_text(p->ainsn.api.insn, p->opcode);
> >  	patch_text((void *)((unsigned long)(p->ainsn.api.insn) + offset),
> >  		   __BUG_INSN_32);
> > +	riscv_patch_in_stop_machine =3D false;
> >  }
> hmm, why not just put 'riscv_patch_in_stop_machine' into patch_text()? Th=
en you
> just need to modify that function.

Right, I intentionally didn't do that as `riscv_patch_in_stop_machine`
skips the lockdep check, which we only want to do for codepaths we know
the lock will be held for.
I didn't want to put it in patch_text() so if users of patch_text() that
do not take the lock are added, they will be caught.

I'm probably just erring on the paranoid/conservative side of things!

--VFPawkrPNyUOHIDJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/i/vgAKCRB4tDGHoIJi
0lqsAP98Og38TawLecd4isIKUWt9ScuaPqELV1/+B0B6FFX75AD+IjZJfpX5oGCH
eW/2jvlLg+HWc/zM1fA/cHO7HS8dRAI=
=4K7W
-----END PGP SIGNATURE-----

--VFPawkrPNyUOHIDJ--


--===============8339892660240952037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8339892660240952037==--

