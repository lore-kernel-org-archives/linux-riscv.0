Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1A4EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 09:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cun1NxIE/vw4J1zWAv5BMvfMwqtjymBAeHJxd3+jA3g=; b=uzO21GAjcAEmRNapsgxwXLCGdd
	gV9Rg6AruP84UBjVqO8xpfDdvaXC1h2r3EtGF/Ib0z+MTJnutqnoTEX3CR+xfPj142L1Sr3SXPCYI
	BeIYYkfbWm9VpUwa0eiIZ3pwUqDEMswiYBrRC5IuOLPwjT18v3GpXiCTpBCugAykkqqK2QsRs0+zW
	oicTOVqI0RmUmLcDwX6m0U/EJFMNTipvxR6CkDPoxw7f9qYAG93t0s3uj7uG5gZVILoqlONQpv06u
	iok3HcGAZY7i3nObNLf3yMOmnywkldZyfhj1yGJeGyHZMnWzUetlyNVEp6YLpRgYNS7osYVImGh4Z
	QELGkgMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMmVG-00DYF5-1h;
	Fri, 21 Jul 2023 09:32:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMmVD-00DYEC-2R
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 09:32:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2FFE36188A;
	Fri, 21 Jul 2023 09:32:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B70C433C8;
	Fri, 21 Jul 2023 09:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689931966;
	bh=YnSBdEfhfwyPTob8o+YeKHNKwCLCsg52ACNTrnl53hs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H0ylFNrTrB4uesmyrEKXEGkYMSZ2f8t8VdDglN/EMmvrD/imb5jEYlbzLKDabH5+k
	 sLUEs8LJMtB+j46r8tEMB8Dfjd6mrSWcoqSc3f79PGXKZPDRUH75FK4d1BZYK1KJ2C
	 vBO3bMEfuXUXaX6V4jmpgPv2maqFOAUQtpRbjBHNEU/Gz4m0c6S4czZd/XeowoVLWq
	 eoC3LGOjDKMXYyU74PYhZvIGjUavrYSVMdTjIt+zHIIRJBIe8yVnf1VaoN4oIJPjxM
	 ULEbUdd/8oX5q+2LaEZwAkuZcxzWL/i6KX/pzAgBekvwUVWvD9fpiML3QrIZIUhzjM
	 lCLdDM34zBPCg==
Date: Fri, 21 Jul 2023 10:32:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 0/9] Add STG/ISP/VOUT clock and reset drivers for
 StarFive JH7110
Message-ID: <20230721-copier-mystify-311b6367f5f8@spud>
References: <20230713113902.56519-1-xingyu.wu@starfivetech.com>
 <20230720-enjoyment-gestation-adb8baa9aaf1@spud>
 <8794c997-f371-70f8-2462-a6c677e7308c@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <8794c997-f371-70f8-2462-a6c677e7308c@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_023247_877658_3208E859 
X-CRM114-Status: GOOD (  21.67  )
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
Content-Type: multipart/mixed; boundary="===============7127183237721459137=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7127183237721459137==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Da+Ai98mJJBdPIk8"
Content-Disposition: inline


--Da+Ai98mJJBdPIk8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2023 at 02:41:56PM +0800, Xingyu Wu wrote:
> On 2023/7/21 0:32, Conor Dooley wrote:
> > On Thu, Jul 13, 2023 at 07:38:53PM +0800, Xingyu Wu wrote:
> >> This patch serises are base on the basic JH7110 SYSCRG/AONCRG
> >> drivers and add new partial clock drivers and reset supports
> >> about System-Top-Group(STG), Image-Signal-Process(ISP)
> >> and Video-Output(VOUT) for the StarFive JH7110 RISC-V SoC. These
> >> clocks and resets could be used by DMA, VIN and Display modules.
> >>=20
> >> Patches 1 and 2 are about the System-Top-Group clock and reset
> >> generator(STGCRG) part. The first patch adds docunmentation to
> >> describe STG bindings, and the second patch adds clock driver to
> >> support STG clocks and resets as auxiliary device for JH7110.
> >>=20
> >> Patches 3 and 4 are about the Image-Signal-Process clock and reset
> >> gennerator(ISPCRG) part. The first patch adds docunmentation to
> >> describe ISP bindings, and the second patch adds clock driver to
> >> support ISP clocks and resets as auxiliary device for JH7110.
> >> And ISP clocks should power on and enable the SYSCRG clocks first
> >> before registering.
> >>=20
> >> Patches 5 and 6 are about the Video-Output clock and reset
> >> generator(VOUTCRG) part. The first patch adds docunmentation to
> >> describe VOUT bindings, and the second patch adds clock driver to
> >> support VOUT clocks and resets as auxiliary device for JH7110.
> >> And VOUT clocks also should power on and enable the SYSCRG clocks
> >> first before registering.
> >>=20
> >> Patch 7 adds struct members to support STG/ISP/VOUT resets.
>=20
> BTW, I found this patch is not in the linux-next or clk-next.
> These STG/ISP/VOUT CRG drivers are 'incomplete' without this resets patch.
> I don't know what your plans about this patch and I'm just curious on it.

Oh. I mistakenly thought that this was a standalone reset controller
patch that Philipp could take, but now I see it depends on the=20
dt-binding headers added by this series.
Maybe you could resend it by itself, and Stephen could pick it into
clk-next?

Sorry about that,
Conor.

--Da+Ai98mJJBdPIk8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLpQuQAKCRB4tDGHoIJi
0pbJAQCJbQjvdBO4XPzRbydiA7oYCEaxC4D8InDZePLnMiemSAD+N05Kkic2KDd1
lVLWaU/WspQV+L72HjM//dmvcHQd/g0=
=Orl3
-----END PGP SIGNATURE-----

--Da+Ai98mJJBdPIk8--


--===============7127183237721459137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7127183237721459137==--

