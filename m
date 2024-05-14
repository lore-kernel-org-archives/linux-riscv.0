Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0AAC04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 18:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdwAkuFiASLCiGEqZ4lFwDo26E0fONWjxoKMUjdkbqQ=; b=jlzyhkXsu+nQr2quUNOT05Pzqn
	ZI4dbZ3fw0gVxP12WgqOg63V6DXXdqHOSeoTZQnsiRVpITHYtKXjEBT13HMcqPbxmqFEdH80t3Dmu
	hEwci2EX6r6CJ1y8v6VFkGVEY+LxJvM5pWTBGqHBgOnjDF/hOzkmR506crT5t3JHRj402sB+xe2TJ
	S3qRJiHH8aaSnK/q2yczSm/ZBKpFCZFJroaSX5Wfwr3gpAgdKN1H6rqmYtr7iZmujqJi6hXbhT/JD
	TvnLdqgrbBxXNTpD4PzxjxKOAKDhuraX5wIlfOdWRFNTD1m8qVAR1xXIPWFhfvnjTJULPaQrcKf47
	YTWzj4jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wZK-0000000GmYh-2l0U;
	Tue, 14 May 2024 18:08:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wZI-0000000GmYL-1CTO
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 18:08:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA761612BB;
	Tue, 14 May 2024 18:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A479C2BD10;
	Tue, 14 May 2024 18:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715710083;
	bh=cbX8GqhX/BZI3INfM/Qv8VnQNKKluIjMW+Q960sJgIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bf+h40iITMx+HMtakGjF+9/YfDsjyy3kaM12Pw5oEzoF/GFsHCcnobcK+YEvcmzRu
	 4BAXjZo4SPdALOQA0C9akfuAMtTGrCANEisUMKSQooeQUyZ10O762N/Met+qyYaoPC
	 ZNs1KMvP0iFny8JsH33SrFy7w8lKQVkK0/NJz0xcrVTp2r6hE1323/Ag7GymrxHC0v
	 kKStIuEm386j/r5cVmvaV4pTAxkJydn5sfIctAyIwn1t9NycTBHWSaRimfq9MQF1ib
	 hwGg1IwC8GgcQ68RQiqC58txx+xQaPiRKE1VJU1fGyG6kDsx/lD2FJCs2wxc7THcvg
	 mv4uWYbZjWhEQ==
Date: Tue, 14 May 2024 19:07:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 0/2] Add notifier for PLL0 clock and set it 1.5GHz on
Message-ID: <20240514-congenial-smother-1e4b0fc6a5df@spud>
References: <20240507065319.274976-1-xingyu.wu@starfivetech.com>
 <20240510-unfounded-syrup-d1263d57d05a@spud>
 <NTZPR01MB0956D48361098E8AA4B3930A9FE02@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
 <20240511-unbiased-dainty-ccb5ece9b1b9@spud>
 <NTZPR01MB0956A7393097129D3CD048EB9FE32@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <NTZPR01MB0956A7393097129D3CD048EB9FE32@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_110804_438535_0528A960 
X-CRM114-Status: GOOD (  37.84  )
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
Content-Type: multipart/mixed; boundary="===============2396585106851126264=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2396585106851126264==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ICN+M2oef3F7o4Ka"
Content-Disposition: inline


--ICN+M2oef3F7o4Ka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 07:40:02AM +0000, Xingyu Wu wrote:
> On 11/05/2024 20:19, Conor Dooley wrote:
> >=20
> > On Sat, May 11, 2024 at 03:02:56AM +0000, Xingyu Wu wrote:
> > > On 11/05/2024 05:05, Conor Dooley wrote:
> > > >
> > > > On Tue, May 07, 2024 at 02:53:17PM +0800, Xingyu Wu wrote:
> > > > > This patch is to add the notifier for PLL0 clock and set the PLL0
> > > > > rate to 1.5GHz to fix the lower rate of CPUfreq on the JH7110 SoC.
> > > > >
> > > > > The first patch is to add the notifier for PLL0 clock. Setting the
> > > > > PLL0 rate need the son clock (cpu_root) to switch its parent clock
> > > > > to OSC clock and switch it back after setting PLL0 rate. It need
> > > > > to use the cpu_root clock from SYSCRG and register the notifier in
> > > > > the SYSCRG driver.
> > > > >
> > > > > The second patch is to set cpu_core rate to 500MHz and PLL0 rate
> > > > > to 1.5GHz to fix the problem about the lower rate of CPUfreq on
> > > > > the visionfive board. The cpu_core clock rate is set to 500MHz
> > > > > first to ensure that the cpu frequency will not suddenly become
> > > > > high and the cpu voltage is not enough to cause a crash when the =
PLL0 is set
> > to 1.5GHz.
> > > > > The cpu voltage and frequency are then adjusted together by CPUfr=
eq.
> > > >
> > > > Hmm, how does sequencing work here? If we split the patches between
> > > > trees it sounds like without the dts patch, the clock tree would (or
> > > > could) crash, or mainline if the clock changes there before the dts
> > > > ones do. Am I misunderstanding that?
> > >
> > > Oh, I think you misunderstood it. Patch 1 (clock driver patch) does
> > > not cause the clock tree crash without the patch 2 (dts patch), and it
> > > just provides the correct flow of how to change the PLL0 rate. The
> > > patch 2 is to set the clock rate of cpu_core and PLL0 rate, which
> > > causes the crash without patch 1. Setting cpu_core rate is to avoid c=
rashes by
> > insufficient cpu voltage when setting PLL0 rate.
> >=20
> > So is the problem in the other direction then? My dts tree will crash i=
f I apply the
> > dts change without the clock patch?
>=20
> Sorry, I tested it and it could not crash using only dts patch. It can se=
parate the
> patches and use it individually.
>=20
> > Additionally, what about U-Boot? Will it have problems if the dts is im=
ported
> > there without changes to its clock driver?
> >=20
>=20
> It is not apply to U-Boot. In the U-Boot, the PLL0 rate should be 1GHz to=
 for GMAC
> and PMIC to work. But now the PLL0 rate should be 1.5GHz in the Linux.

There's a push in U-Boot to move devicestrees to use "OF_UPSTREAM",
which means importing devicetrees directly from Linux and using them in
U-Boot. I don't really want to merge a patch that would present U-Boot
with a problem if the VisionFive 2 moved to that model there.

Cheers,
Conor.

--ICN+M2oef3F7o4Ka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkOofgAKCRB4tDGHoIJi
0ufXAP9Uh+ZzbT/spgRCgoklThu+gutedLdqt2wyY4s4A/w6HgD/UbHkgmXSa+SY
yCs4XmyR6wDsGVSfXZlZ8fhpLfp/FAI=
=qwt+
-----END PGP SIGNATURE-----

--ICN+M2oef3F7o4Ka--


--===============2396585106851126264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2396585106851126264==--

