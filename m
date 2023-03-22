Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34CFC6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 20:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aqcfpl1J7//HxFgSXHv4GsCM4SpX+uPDfOfHLvXtbWg=; b=GRiGP1Jl96yfGJ0oas+iylGQot
	qetOAFj2vSWs80TI+u9H30nS+kx5BRSgladEfiaWfDADhWUlMrtnhp8wgLFbU0P3a8n7pcDXoCAhG
	smdy3aMMT0rIRhZ64Qi/hZYVxxNkxFFdkzNTkwYBQHkqu9pzPY7guYoP+eNP/YIApAONKZ16R8hvs
	ucID+0Gs45D0rCPsIJ20IOwskWxeHaoxS6yEcLW4PuxdMVmr4oi/hvNx6v51H5evSVIyOZ74p9+xY
	9AZidezxTf0uw+hq6VXU3TE6Yt88D7I8m0v+ciH7UALID1562QLLcR74CyN6OBK9pSgaP63DUnLwg
	igEDs0xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf4ht-00HHlP-0d;
	Wed, 22 Mar 2023 20:05:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf4hq-00HHkv-1U;
	Wed, 22 Mar 2023 20:05:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8A94A622B3;
	Wed, 22 Mar 2023 20:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0523C433EF;
	Wed, 22 Mar 2023 20:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679515509;
	bh=EauZcUtzlD9EeZdsLygkybO3oSxqsW90p055J+MpsuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VECGmG74bccgZ4I4NQN5olkc4X3Grydc/t/WjnZjBGaZumR+zui6b7ry59O/NUDIQ
	 AdGPcGSGykW7A3ls4pSymjJfwKoi3l+lme5WaEQsuxy84gEPUdzA9WezFPAD7/aFdl
	 m8RkBUObMcUErGEE3La5OBaUeo78N/20tIzOPNTeQyuYts/YYjRdd5mXPdg5mkKbJ+
	 7+R3esVcZT0RMoHqu8VYFgS+FhNjwxuMQEyIQc8h9aM2LvabGsHXDobbh6bb1YnvB9
	 GFPoHIc9Vu9866yc0kyqrxjKuYrqToIn0t5gVNjz8+1YiSuXB+7TZsYoUueK/xaYKm
	 v5eSzCYWQzIuA==
Date: Wed, 22 Mar 2023 20:05:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	regressions@leemhuis.info, regressions@lists.linux.dev
Subject: Re: [PATCH] riscv: require alternatives framework when selecting FPU
 support
Message-ID: <ad445951-3d13-4644-94d9-e0989cda39c3@spud>
References: <ZBruFRwt3rUVngPu@zx2c4.com>
 <20230322120907.2968494-1-Jason@zx2c4.com>
 <20230322124631.7p67thzeblrawsqj@orel>
 <1884bd96-2783-4556-bc57-8b733758baff@spud>
 <20230322192610.sad42xau33ye5ayn@orel>
 <2a3b08ce-5ab1-41b6-ad58-edbeff7b1acb@spud>
MIME-Version: 1.0
In-Reply-To: <2a3b08ce-5ab1-41b6-ad58-edbeff7b1acb@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_130510_560869_3DD1A7A6 
X-CRM114-Status: GOOD (  19.71  )
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
Content-Type: multipart/mixed; boundary="===============2347646407430612359=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2347646407430612359==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J4ue+fmAfy7X0A4F"
Content-Disposition: inline


--J4ue+fmAfy7X0A4F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 07:44:13PM +0000, Conor Dooley wrote:
> On Wed, Mar 22, 2023 at 08:26:10PM +0100, Andrew Jones wrote:
> > On Wed, Mar 22, 2023 at 03:17:13PM +0000, Conor Dooley wrote:
> > > On Wed, Mar 22, 2023 at 01:46:31PM +0100, Andrew Jones wrote:
>=20
> > > > (It's tempting to just select RISCV_ALTERNATIVE from RISCV, but may=
be we
> > > >  can defer that wedding a bit longer.)
> > >=20
> > > At that point, the config option should just go away entirely, no?
> >=20
> > Ah, yes, and that makes the idea even more attractive, as we could remo=
ve
> > several ifdefs.
>=20
> I went and did the cursory check, it's not compatible with XIP_KERNEL so
> dropping the option entirely probably isn't a possibility :/

What I said is only now sinking in. We're now going to be disabling FPU
support on XIP kernels with this patch.
Well, technically not this patch since it wouldn't have built without
Jason's changes, but that doesn't seem like the right thing to do...



--J4ue+fmAfy7X0A4F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBtfbwAKCRB4tDGHoIJi
0pW5AP4sHlVNJzb8DmPK+viV8n2vJxaAVsOvy2tUnwmOz57/gAEAwQTj9bHJRivx
riPjP0SyuiPaqRz6C2g1689jApajxwY=
=3YZf
-----END PGP SIGNATURE-----

--J4ue+fmAfy7X0A4F--


--===============2347646407430612359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2347646407430612359==--

