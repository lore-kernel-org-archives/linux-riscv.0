Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91512CE7A96
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 15:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9Y4RfEpxyHKeMOtydJFH65eFm25dJuC/L7/8ZBmxO0=; b=pI6Jt+wA0s5E2VTIQ0VnaxmEUq
	nV8Gjr6TMsJJ633KqPtiv+SuH3hUu9qYu8/aTzw0X8/FfX2DMQkKli20Dqr79Lg3NNInIiG6Xxdx3
	x68wXRs9HY/GkaeWPSLyuFnQx/2CU/51pSBb7VvbsIEx3WjmXmbBWsjpheEKbjc8DV3/XNlceKTv3
	oWvNOdkmyRzbG4fVq1+98dw/ipGYG2zCXpBy3dIh2IAVlgnEYpNDBuGQqZiXNPNGvFvip3A3+moJ3
	O6KapBVR+92XVpxmCRRWBfjdOQXDpg/bKnGgVNxp6+GzsF1GX+qWRzWopQHAhOeLWJ3mJVhB44jEE
	NuDQpN4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkndz-00EZN7-24;
	Mon, 25 Sep 2023 15:37:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkndw-00EZL1-0I;
	Mon, 25 Sep 2023 15:37:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 88B9FB80E15;
	Mon, 25 Sep 2023 15:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98AEC433C9;
	Mon, 25 Sep 2023 15:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695656221;
	bh=sdp9WxT5Z2lgszPM/OOfMLde02C/QRjsq7FQxQAVDPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kMvMAYnGDkMci/OFXrlZQBynWf7Xu3y262IhqgtqarPYF0wtZM1Qhrze7YDZBP87x
	 kCDVM3ZWQGtIA1p7Yov4t41HZOMVIgQGcvF902U75NTndLm+WbT2Jktsgs4GkMBpZZ
	 wsK5ff2sFfTp0yP36eFg1hh/FF5GYggcJS2nPH9SqedleWW98UuMDOKDmcPKBd0/Bj
	 cCsJci0qKLnAT+Hqw/VqBRLIiaw3BxcKIHAGclKRKpgz3Fbyq5cx616joeDGx5tzRB
	 4D8Z2uS+TZVlcGDaJdgNCdWBPOYrIAPfqgoGX7uPozpscQJpQ2fzRPJdcJx934Wf3T
	 H1V0ek1Witmgw==
Date: Mon, 25 Sep 2023 16:36:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 0/9] KVM RISC-V Conditional Operations
Message-ID: <20230925-reappear-unkind-7f31acdd82de@spud>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
 <20230925-gorged-boxer-3804735e2d18@spud>
MIME-Version: 1.0
In-Reply-To: <20230925-gorged-boxer-3804735e2d18@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_083704_405618_76EAE673 
X-CRM114-Status: GOOD (  19.23  )
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
Content-Type: multipart/mixed; boundary="===============7153239999614526799=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7153239999614526799==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fr4n8SIpzVRReSlN"
Content-Disposition: inline


--fr4n8SIpzVRReSlN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 04:33:15PM +0100, Conor Dooley wrote:
> On Mon, Sep 25, 2023 at 07:08:50PM +0530, Anup Patel wrote:
> > This series extends KVM RISC-V to allow Guest/VM discover and use
> > conditional operations related ISA extensions (namely XVentanaCondOps
> > and Zicond).
> >=20
> > To try these patches, use KVMTOOL from riscv_zbx_zicntr_smstateen_condo=
ps_v1
> > branch at: https://github.com/avpatel/kvmtool.git
> >=20
> > These patches are based upon the latest riscv_kvm_queue and can also be
> > found in the riscv_kvm_condops_v2 branch at:
> > https://github.com/avpatel/linux.git
> >=20
> > Changes since v1:
> >  - Rebased the series on riscv_kvm_queue
> >  - Split PATCH1 and PATCH2 of v1 series into two patches
> >  - Added separate test configs for XVentanaCondOps and Zicond in PATCH7
> >    of v1 series.
> >=20
> > Anup Patel (9):
> >   dt-bindings: riscv: Add XVentanaCondOps extension entry
> >   RISC-V: Detect XVentanaCondOps from ISA string
> >   dt-bindings: riscv: Add Zicond extension entry
> >   RISC-V: Detect Zicond from ISA string
>=20
> For these 4:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Actually, now that I think of it, I'm going to temporarily un-review this.
=46rom patch-acceptance.rst:
| Additionally, the RISC-V specification allows implementers to create
| their own custom extensions.  These custom extensions aren't required
| to go through any review or ratification process by the RISC-V
| Foundation.  To avoid the maintenance complexity and potential
| performance impact of adding kernel code for implementor-specific
| RISC-V extensions, we'll only consider patches for extensions that either:
|=20
| - Have been officially frozen or ratified by the RISC-V Foundation, or
| - Have been implemented in hardware that is widely available, per standard
|   Linux practice.

The xventanacondops bits don't qualify under the first entry, and I
don't think they qualify under the second yet. Am I wrong?

--fr4n8SIpzVRReSlN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRGpGAAKCRB4tDGHoIJi
0sCZAP4z8BsgLxwoBX4uqM9+ElfBxRyrpaAFGTQYQ8wIudnC/gD/UlTsJGAk9D7P
mkPcRiNieVtPTyjuEBRE+7BKFBXBpAo=
=Ny2/
-----END PGP SIGNATURE-----

--fr4n8SIpzVRReSlN--


--===============7153239999614526799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7153239999614526799==--

