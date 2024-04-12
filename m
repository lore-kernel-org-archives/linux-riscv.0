Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7322C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 20:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7dZQ2pgNxMPpWyBVmM2y7JtiItqs9UWEdkxM/sKOH4=; b=FnGmfxujXyPYnV5GBqS67fMeBo
	WO/XGDK9fZTqGSQZuNr74/HnLUII1RqkoELJSzwbdOopCiHwWuEm1Pk8KEPBWQT/1LCI4+wsysLjE
	5dmfRFOa6ntgaKsScTm7R4zUHXrX0VLa/myjIrjJSnmlmMfUO+fdOWkfYb8jZNL1jlOAhNNhRtUM7
	Ol9qGWcQ3fpP+pl1CE2XK/OkHmtsFFzo6Lw8TfA6LysxWMLOD6DyV6aCcvYbbjqd74YQWYkXjz6CO
	sQdRsHo8rfEGCRoSnfRolj5EAJJT0Ek5muZ6TeO5P3xfoV34grMPMZN53cvVbC7Gs04YqksnAkcVI
	A/IO7SgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvNaW-00000001DFR-36X1;
	Fri, 12 Apr 2024 20:33:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvNaT-00000001DEJ-0ztp;
	Fri, 12 Apr 2024 20:33:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA12561695;
	Fri, 12 Apr 2024 20:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1358BC113CC;
	Fri, 12 Apr 2024 20:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712954007;
	bh=YQ2UKw4sariCXmZ/qJSMve/BQZtVmS5ZWlzN1dqap/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MttpEfVGcroBL6oEWqlTkdnkDxzRW5XoGbAKc5TKuHF+6y4aqdV5ucuP+AYZfTp8K
	 4ppufqNtlR5eecjFAluraMWcC+Qecd3oZyp0q1OMzyoicslfw+j42bn+Hb08wvM6D3
	 c1SxAEXs6qciuaK2Dap6U2O9no7Q8n3alWUbLY1kYhvvUkdJxIvfoYqilF9GH4H9dJ
	 AlA2X0ovSlEqhekqJrMx79EqMHop6E7f38aM/aMO1gDCpY4/K2sowDll/jprg7roXl
	 Fq/bZvY+TtrAy/phb4MYb4QstUD5UQeraxz5QuNsIj26skY0pPpO+lWBOaVEKjNrn5
	 EzJvEl8syoyZQ==
Date: Fri, 12 Apr 2024 21:33:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 07/19] riscv: Optimize
 riscv_cpu_isa_extension_(un)likely()
Message-ID: <20240412-eccentric-prune-a19dfc485748@spud>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-7-4af9815ec746@rivosinc.com>
 <20240412-aerosol-heritage-cec1eca172fb@wendy>
 <ZhlwpKuqVkQCr6u+@ghost>
MIME-Version: 1.0
In-Reply-To: <ZhlwpKuqVkQCr6u+@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_133330_111529_BD2C6BCE 
X-CRM114-Status: GOOD (  26.49  )
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
Content-Type: multipart/mixed; boundary="===============7798017618983786406=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7798017618983786406==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WYt3sBPHBU50LMpH"
Content-Disposition: inline


--WYt3sBPHBU50LMpH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 10:34:28AM -0700, Charlie Jenkins wrote:
> On Fri, Apr 12, 2024 at 11:40:38AM +0100, Conor Dooley wrote:
> > On Thu, Apr 11, 2024 at 09:11:13PM -0700, Charlie Jenkins wrote:
> > > When alternatives are disabled, riscv_cpu_isa_extension_(un)likely()
> > > checks if the current cpu supports the selected extension if not all
> > > cpus support the extension. It is sufficient to only check if the
> > > current cpu supports the extension.
> > >=20
> > > The alternatives code to handle if all cpus support an extension is
> > > factored out into a new function to support this.
> > >=20
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > ---
> >=20
> > >  static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu=
, const unsigned long ext)
> > >  {
> > > -	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_unl=
ikely(ext))
> > > -		return true;
> > > +	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
> > > +			   "ext must be < RISCV_ISA_EXT_MAX");
> > > =20
> > > -	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> > > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && __riscv_has_extension_u=
nlikely_alternatives(ext))
> > > +		return true;
> > > +	else
> > > +		return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> > >  }
> >=20
> > static __always_inline bool riscv_cpu_has_extension_likely(int cpu, con=
st unsigned long ext)
> > {
> > 	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_likely=
(ext))
> > 		return true;
> >=20
> > 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> > }
> >=20
> > This is the code as things stand. If alternatives are disabled, the if
> > statement becomes if (0 && foo) which will lead to the function call
> > getting constant folded away and all you end up with is the call to
> > __riscv_isa_extension_available(). Unless I am missing something, I don=
't
> > think this patch has any affect?
>=20
> Yeah I fumbled this one it appears. I got thrown off by the nested
> IS_ENABLED(CONFIG_RISCV_ALTERNATIVE). This patch eliminates the need for
> this and maybe can avoid avoid confusion in the future.

I think it just creates unneeded functions and can/should be dropped.

--WYt3sBPHBU50LMpH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhmakAAKCRB4tDGHoIJi
0pbtAP9jkxR3+Jersf36JhdRHz+EJKoRwl2CgWp+9OK6jzrMcQEA+Nbu0mlIiEoV
Dsowm8jCIeypptYWv/zWVcIHHTzErgc=
=WYNo
-----END PGP SIGNATURE-----

--WYt3sBPHBU50LMpH--


--===============7798017618983786406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7798017618983786406==--

