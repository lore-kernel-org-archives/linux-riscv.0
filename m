Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1673C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 11:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEpj2SQTxRN3Nur5J+6ZPR2pv1ePcWIMKxJ2fHQNaLk=; b=BU4mCJglPOht2xCyvv3mz5aND2
	CZJtao2qMSHAhqqp1X59RW1niIizhKX55NXGIYR3pixYgySm873CqJ+TNSSWRi/IFWLhuWwOZxYKW
	qdnn2aGUtm5tZprHB5CoeVMjNhY7KHJNi93RPgzJPb4vgAE0gzvrNQE/D6T98p/t3Uk/FxSSHzKSS
	R/qMI8lB77gs/JygZdrH6vXM5wRWlG7BRFBszrwrn/4jOpdmaHjLj8tMMW2/3zXq0Y607oMi/ECi8
	dHbwApVZ/Sne/4q/HESKQ7MKUfjhYSdbniH4TpUOirQ10J6nc3DeVx8GGYRKM6X/S/UOQ5gsZx7sT
	Cvm9qUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8fTp-00Acbm-2d;
	Thu, 30 Nov 2023 11:45:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8fTl-00AcY3-0r
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 11:45:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 84BACB843DD;
	Thu, 30 Nov 2023 11:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B2EC433C8;
	Thu, 30 Nov 2023 11:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701344710;
	bh=JNkR9EjPBKE3T4ENiOD9ib+nug7CA6U/xJMJjrAqZps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dxOBkApolmVpqBeownjdXlvxdGTNt45FYzGD/5KNopyIJkGI6SbSI89qwP2IW6oHb
	 oyeHDFU2nNjv144vQJqBUbNt3vXq8dTi7NwpE1yqIQRWymMeF6f/EXOzc6YUwcqdLh
	 53e+ZCSS7YKG5PVi9MxWsQ1KbmY0mNkgoyDNPFLbqZsM13GVs6JdW/zVgb0IQAfE/t
	 xziNuSWTl6G1V5WADpSd/HhfZraf4ZJ+V1wBCrVst9wRKWW4zSua9yvf5exvYpTLPs
	 NJ0zulxtUWTq3Y9LPit6MBvPeK3X8BpK0r72yh2bU34rrot2/KKLWjfM2syd+OvwlV
	 4ZDfArrer9GYg==
Date: Thu, 30 Nov 2023 11:45:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: thead,c900-aclint-mtimer:
 separate mtime and mtimecmp regs
Message-ID: <20231130-shower-award-3cd5f1bba5db@spud>
References: <IA1PR20MB4953C82499C5D81D2C6A020BBBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953F9D77FFC76A9D236922DBBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CAK9=C2WAv5jJBt56xBea268DeyUA+YvbU7i+ahVjueafCi-r6A@mail.gmail.com>
 <20231130-decibel-passenger-6e932b1ce554@spud>
 <CAK9=C2Vsx8ddpYiqUhvqnJpdb-FKeNhLz3PsVpSeEz4TeQHiEg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK9=C2Vsx8ddpYiqUhvqnJpdb-FKeNhLz3PsVpSeEz4TeQHiEg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_034513_596962_F9641373 
X-CRM114-Status: GOOD (  41.41  )
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
Content-Type: multipart/mixed; boundary="===============5128013258372587674=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5128013258372587674==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VKYk05yx41tbUITR"
Content-Disposition: inline


--VKYk05yx41tbUITR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 04:51:32PM +0530, Anup Patel wrote:
> On Thu, Nov 30, 2023 at 3:27=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Thu, Nov 30, 2023 at 03:01:24PM +0530, Anup Patel wrote:
> > > On Sat, Nov 18, 2023 at 12:39=E2=80=AFPM Inochi Amaoto <inochiama@out=
look.com> wrote:
> > > >
> > > > The timer registers of aclint don't follow the clint layout and can
> > > > be mapped on any different offset. As sg2042 uses separated timer
> > > > and mswi for its clint, it should follow the aclint spec and have
> > > > separated registers.
> > > >
> > > > The previous patch introduced a new type of T-HEAD aclint timer whi=
ch
> > > > has clint timer layout. Although it has the clint timer layout, it
> > > > should follow the aclint spec and uses the separated mtime and mtim=
ecmp
> > > > regs. So a ABI change is needed to make the timer fit the aclint sp=
ec.
> > > >
> > > > To make T-HEAD aclint timer more closer to the aclint spec, use
> > > > regs-names to represent the mtimecmp register, which can avoid hack
> > > > for unsupport mtime register of T-HEAD aclint timer.
> > > >
> > > > Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> > > > Fixes: 4734449f7311 ("dt-bindings: timer: Add Sophgo sg2042 CLINT t=
imer")
> > > > Link: https://lists.infradead.org/pipermail/opensbi/2023-October/00=
5693.html
> > > > Link: https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.=
adoc
> > >
> > > The ratified Priv v1.12 specification defines platform specific M-mod=
e timer
> > > registers without defining any layout of mtime and mtimecmp registers.
> > > (Refer, "3.2.1 Machine Timer Registers (mtime and mtimecmp)")
> > >
> > > The "thead,c900-aclint-mtimer" can be thought of as is one possible
> > > implementation of "riscv,mtimer" defined by the Priv v1.12 specificai=
ton.
> > >
> > > If it is not too late then I suggest making this binding into generic
> > > "riscv,mtimer" binding.
> >
> > We could definitely reorganise things, it's not too late for that as
> > implementation specific compatibles would be needed regardless, so
> > software that would've matched on those will continue to do so.
> >
> > That said, does this platform actually implement the 1.12 priv spec if
> > there is no mtime register? The section you reference says:
> > "Platforms provide a real-time counter, exposed as a memory-mapped
> > machine-mode read-write register, mtime." It seems to me like this
> > hardware is not suitable for a generic "riscv,mtimer" fallback.
>=20
> Yes, the T-Head mtimer does not implement both mtime and mtimecmp
> so technically it only implements a portion of the ratified RISC-V mtimer
> chapter.
>=20
> >
> > Am I missing something there Anup?
> >
> > It doesn't even implement the draft aclint spec, given that that says:
> > "The MTIMER device provides machine-level timer functionality for a set
> > of HARTs on a RISC-V platform. It has a single fixed-frequency monotonic
> > time counter (MTIME) register and a time compare register (MTIMECMP) for
> > each HART connected to the MTIMER device."
> >
> > But I already said no to having a generic, "riscv" prefixed, compatible
> > for that, given it is in draft form.
>=20
> I am not suggesting T-Head timer implements aclint spec. Also,
> since aclint spec is in draft state it is out of the question.

I did not intend to imply that you were suggesting that there should be
one. I was just trying to clarify that I was not trying to bring back
the topic of a generic aclint binding applying here.

> My suggestion is to treat "3.2.1 Machine Timer Registers (mtime
> and mtimecmp)" as RISC-V mtimer defined by the RISC-V privileged
> specification and define "riscv" prefixed DT binding for this.

I'm not against a binding for that at all.

> This binding defines two possible values for "reg" property:
> 1) contains two items: a) mtime register address and,
>      b) base address of mtimecmp registers
> 2) contain one item: a) base address of mtimecmp registers
>=20
> The t-head mtimer seems to implement #2 whereas the RISC-V
> mtimer (Priv spec) aligns with #1.
>=20
> If we want to keep this DT binding t-head specific then
> we should remove option #1 (above) from this DT binding

This part is already the conclusion of one of the other "branches" of
this thread and is (AFAIU) Inochi's plan for the next version.

> and add separate "riscv" prefixed DT binding for RISC-V mtimer.

Do you know of any users for a "riscv,mtimer" binding that are not
covered by existing bindings for the clint?

Cheers,
Conor.

--VKYk05yx41tbUITR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWh1wAAKCRB4tDGHoIJi
0tTrAPoCJ+T+YM3dA7jbCLL4W/Awf+VDdj/J2pMkjJ5bKfCMygD/fEwJfrAvowq+
L64lkqtaXIQZsnBWYdOZ8jc/LJ8WkQ8=
=oCOP
-----END PGP SIGNATURE-----

--VKYk05yx41tbUITR--


--===============5128013258372587674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5128013258372587674==--

