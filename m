Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E7BC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 12:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tP4oHPqrYe9xLDevgZiUPl/YGJATkDCxo2+87lG7qzk=; b=xwhocUS7buw+8iew7WyrJBEtjJ
	MWF51JdId+VbeTgd24IUwaqjQWAPStYShfDNek8GYnsB4TBxtxaIfeHofAc7sMUi2+jExVAewmFHY
	uj0CfVJFHiXjULWusMpvoPtOC00dxy9FVRJNbRS4dKJHC9AlnjPo4dqg7I5cAucmV9o9iXaVeOJ9d
	GthnK/5abvBAESVS0xbVn+g8W2h00N9sTw/ozgVI14bQA/DldQzeBxoERLTeQMEoD3h/YYHIUKNJR
	ZIovwyzTtACBCH8nKkBKOZNkzhX4naPwWzda5i6jMbC3IIyiaRSnjdMUyGRZdB3HjkW/qw4khJRBM
	0QWFZ0tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8frx-00Ao2g-0X;
	Thu, 30 Nov 2023 12:10:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8fru-00Ao26-0T
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 12:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6B49E610FB;
	Thu, 30 Nov 2023 12:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA446C433C7;
	Thu, 30 Nov 2023 12:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701346209;
	bh=p1J/0ikNTrqptbAR2XxBCgc8ltrQEzzWP5Mk8ngM4uI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EAlKBklLAqdkH4XfzrpRSQIrLiABlL9tt/MeVbnIb25N5Kh5GkeyTVvqRngS7VW83
	 56sbh5NWaVD3Wq2AtWJ6IwMRMQ2U2M2Ld2DdJWSuz0bRRHzblQij9GC2e8ZuBDqMxC
	 cL2lXI0Klb5jX/fRdTBY0ojRoJcgf2NZf2BupwkaZyOMkscNW+pgjDisw+8YB77/+z
	 q1/DHpUc0U7rBkvwxeuh5W9OVEesDKkQmkiMlD1Ay8jA0K2e9UpQ+86Nk0ZMfuoPd9
	 tYWm9nL0fjtUfYaiUJuEc9GG8VmkjCXSiDvrX5epaVbCGZf6JZZsSgwtOc9p94rGQL
	 nB0x76x2IGz+g==
Date: Thu, 30 Nov 2023 12:10:03 +0000
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
Message-ID: <20231130-laborious-dwarf-6913457466ad@spud>
References: <IA1PR20MB4953C82499C5D81D2C6A020BBBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953F9D77FFC76A9D236922DBBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CAK9=C2WAv5jJBt56xBea268DeyUA+YvbU7i+ahVjueafCi-r6A@mail.gmail.com>
 <20231130-decibel-passenger-6e932b1ce554@spud>
 <CAK9=C2Vsx8ddpYiqUhvqnJpdb-FKeNhLz3PsVpSeEz4TeQHiEg@mail.gmail.com>
 <20231130-shower-award-3cd5f1bba5db@spud>
 <CAK9=C2WgN=3BjxS+nF2ibFQoquNwXfxr_UQv8Kbf1+e4Teyfcw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK9=C2WgN=3BjxS+nF2ibFQoquNwXfxr_UQv8Kbf1+e4Teyfcw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_041010_252039_EB99657E 
X-CRM114-Status: GOOD (  12.05  )
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
Content-Type: multipart/mixed; boundary="===============4488347187231883760=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4488347187231883760==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/EQWHXVT+7tBrA/1"
Content-Disposition: inline


--/EQWHXVT+7tBrA/1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 05:18:15PM +0530, Anup Patel wrote:
> On Thu, Nov 30, 2023 at 5:15=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:

> > > and add separate "riscv" prefixed DT binding for RISC-V mtimer.
> >
> > Do you know of any users for a "riscv,mtimer" binding that are not
> > covered by existing bindings for the clint?
>=20
> Ventana Veyron-v1 implements a mtimer per-cluster (or chiplet)
> which is compatible to "riscv,mtimer" (i.e. we have both mtime
> and mtimecmp MMIO registers).

Okay, thanks. I guess iff veyron-v1 DT support shows up (or other
similar devices) we can go ahead with a "riscv,mtimer" binding then.
I had thought that you guys were going to be using ACPI though, so
I guess the "other similar devices" applies.



--/EQWHXVT+7tBrA/1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWh7mwAKCRB4tDGHoIJi
0mnsAPwOJxP1SKjjaIbQZInh5XnG5Ta3y8YxHd/Psl7fzAGd+QEAruMpJX1VXjzE
vEq7ApAaXOnfVF9Bhq+Bw7f8pmKZngA=
=FDEk
-----END PGP SIGNATURE-----

--/EQWHXVT+7tBrA/1--


--===============4488347187231883760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4488347187231883760==--

