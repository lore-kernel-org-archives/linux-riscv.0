Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E3AC47422
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 18:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0INLr6+ju6vnBptw7cRIQdtfa3Qe3FtCLsjhxZFMeE=; b=2cxrDSsVprjNFfMpJ6et3rBlIf
	xBQKR8tqwGkpr6S3/7J8S9G3lphFTwTEuAoHUxA0sIVEUEn80hf32YE0EvH3qa3d4NeGEPhEx7vXa
	MYLabfKy0Gf1qz3iAb27YcVOflqoet/xa+tBSSfhiS3h2HDJu7QNB+PQ5X90aG/SuKkuisQPpYVdg
	ow30csl8siNr9KfrJri91OwxogFJgi9G4NRJL5BZ0yQSgo/zLedW2d3OgnDugJbC2hWQtNFXhVmyd
	bEXgZXarQutE73RbfTHlmvrXnGjfjVq0p+PaCaz4AMBHmnwUimAQRnIVEihVuO/xgXkBNmxPbO+Dr
	JVUldq6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT4it-00000001Pt2-2VNT;
	Thu, 25 Jan 2024 18:45:11 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT4ip-00000001Poe-3GhE
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 18:45:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C3EE3CE34C9;
	Thu, 25 Jan 2024 18:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85938C433F1;
	Thu, 25 Jan 2024 18:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706208303;
	bh=YOmQgkz1P+8Zi0uUakZsNY3tJ1wB079WwZ+pgQHgPOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W6tH+ufYN63e0ec9n24c1FtjKPLogyll3pPVDTlBw5IyIKQC21WfMzoutf7aFwp1Z
	 xe1NAaXx662qjwLMcjlFuhZjalF6dGCmXAC1FHFz0ddkNaiHUOfDhJM6x6DmmMmkUw
	 7S2cKN4hWcysnuC7LU/m2G6zl5xoPsA2LUzDZ6X2QgRaLeccd/2B/tBSEGFoXdT8Vc
	 NNsI2SDXMeBpu23AB23V7I3NydxCuDXf3g8idaSoTYDRd534DYw2vQHNfYHKMfd9gl
	 AdBHKLvMPFSwVsq8AlJP48Qc0Sf21tREDkJm1q+KjsG+y7BIQJy2bKH7eFVzDH2xSV
	 2m8nlYs+rsSkQ==
Date: Thu, 25 Jan 2024 18:44:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, corbet@lwn.net, aou@eecs.berkeley.edu,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, shuah@kernel.org, brauner@kernel.org,
	guoren@kernel.org, samitolvanen@google.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, waylingii@gmail.com,
	greentime.hu@sifive.com, heiko@sntech.de, jszhang@kernel.org,
	shikemeng@huaweicloud.com, david@redhat.com, charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn, willy@infradead.org,
	vincent.chen@sifive.com, andy.chiu@sifive.com, gerg@kernel.org,
	jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
	ancientmodern4@gmail.com, mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com, bhe@redhat.com, chenjiahao16@huawei.com,
	ruscur@russell.cc, bgray@linux.ibm.com, alx@kernel.org,
	baruch@tkos.co.il, zhangqing@loongson.cn, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, joey.gouly@arm.com,
	shr@devkernel.io, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 24/28] riscv: select config for shadow stack and
 landing pad instr support
Message-ID: <20240125-implement-coagulant-3058e743a098@spud>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-25-debug@rivosinc.com>
 <20240125-snitch-boogieman-5b4a0b142e61@spud>
 <ZbKkgNX7xfU5KO8X@debug.ba.rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <ZbKkgNX7xfU5KO8X@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_104508_292242_EB5910C0 
X-CRM114-Status: GOOD (  25.01  )
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
Content-Type: multipart/mixed; boundary="===============1314135437400175238=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1314135437400175238==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e/FrbnVtGEexHgLP"
Content-Disposition: inline


--e/FrbnVtGEexHgLP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 10:12:16AM -0800, Deepak Gupta wrote:
> On Thu, Jan 25, 2024 at 06:04:26PM +0000, Conor Dooley wrote:
> > On Wed, Jan 24, 2024 at 10:21:49PM -0800, debug@rivosinc.com wrote:
> > > From: Deepak Gupta <debug@rivosinc.com>
> > >=20
> > > This patch selects config shadow stack support and landing pad instr
> > > support. Shadow stack support and landing instr support is hidden beh=
ind
> > > `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wires up p=
ath
> > > to enumerate CPU support and if cpu support exists, kernel will suppo=
rt
> > > cpu assisted user mode cfi.
> > >=20
> > > Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> > > ---
> > >  arch/riscv/Kconfig | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >=20
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index 9d386e9edc45..437b2f9abf3e 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -163,6 +163,7 @@ config RISCV
> > >  	select SYSCTL_EXCEPTION_TRACE
> > >  	select THREAD_INFO_IN_TASK
> > >  	select TRACE_IRQFLAGS_SUPPORT
> > > +	select RISCV_USER_CFI
> >=20
> > This select makes no sense to me, it will unconditionally enable
> > RISCV_USER_CFI. I don't think that that is your intent, since you have a
> > detailed option below that allows the user to turn it on or off.
> >=20
> > If you remove it, the commit message will need to change too FYI.
> >=20
>=20
> Selecting this config puts support in Kernel so that it can run tasks who=
 wants
> to enable hardware assisted control flow integrity for themselves. But ap=
ps still
> always need to optin using `prctls`. Those prctls are stubs and return EI=
NVAL when
> this config is not selected. Not selecting this config means, kernel will=
 not support
> enabling this feature for user mode.

I don't think you understand me. "select RISCV_USER_CFI" will
unconditionally build it into the kernel, making stubs etc useless.
You're talking like (and the rest of your commit implements it!) that
this feature can be enabled in menuconfig etc. Having this select
will always enable the config option, rendering the choice below
redundant. Try turning it off in menuconfig.

Oh and if it were valid to have here, you put it in out of order. That's
an alphanumerically sorted list :)

Cheers,
Conor.


--e/FrbnVtGEexHgLP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbKsIAAKCRB4tDGHoIJi
0s4rAPwLj36cq4OCVYXidwGHQqrZUowdECj4uRLcWI43EFSS4AEAt/7J8GXw81Mv
lW2W0+1Wk7ntO8Qb5WDzqbK7NusmQwo=
=Mape
-----END PGP SIGNATURE-----

--e/FrbnVtGEexHgLP--


--===============1314135437400175238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1314135437400175238==--

