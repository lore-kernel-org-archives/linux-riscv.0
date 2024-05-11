Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A52FC04FFE
	for <linux-riscv@archiver.kernel.org>; Sat, 11 May 2024 12:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAnvQcErRHaVEUBSYlS77bqOEZHSScHiBZLBpsiyJLg=; b=YLHBnrEnq9Zsol0kIYbF4IswEb
	3mt9jXXUV6ZSFpa1aKw/EONk2iDX/s5NGahZZc309ojY+kjjbXSp4ct7NiQJXHyejv3vvOdoyvI0T
	R+0ht+3gJKii9HB4TrfJz6vq0QNKDb6BDHqpZpF9+DHtrsq6l3StLjnlRsUpqrugys+QMaN78BysS
	Kf3IMFj9KxmRxm64S1tuUztWyF5FVINhYTemsNK1oFCiWqcbTvPtlwazX+ReyIzyCed8Dw3tGKqdU
	1supEx6mp9KHP+D+q25o0E/3KnUActt0XeBLsECgUqX8G3jBLRRIkVJ+7yLn3Jb6s+KXPiS5cZhix
	iW0KFrmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5lgg-00000007sgM-1wfv;
	Sat, 11 May 2024 12:18:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5lgd-00000007sfm-48H6
	for linux-riscv@lists.infradead.org;
	Sat, 11 May 2024 12:18:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC0976098A;
	Sat, 11 May 2024 12:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6E7C2BBFC;
	Sat, 11 May 2024 12:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715429926;
	bh=s+M9h0DBUQzIAjC8URttvL4W46/RRLRnAX+0HaoiRJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G/6ke5/c5OoLeBvn2RdkJkBy6iB8OiTNKb0NMyf8j5FtnDl4Yi5PjTaeUlns3cIOp
	 mC5LT+b2P1SfMZabSGhbeeSB2J6uAMA+iSNSG3ZmBgFxD+o2trHRZ8KPQ7oa7BnyWA
	 V2Q5v4i37XtvluH9ctWIHl+3+pP6HwwuGIwD8BQ06HLfIeFDKoiC0INjMt3E/bzjWT
	 /Uljpo7zyXJTsJfKeciN8Tp6IWA07Jg9FPZmLm6XjAotY0gL9XmENG2bOZMi1OC7Us
	 Dp5ykq3/v6KyKbw2UfxA09dYJ4nVTrtXVCivfQ7DzH+T+WzS3KcMMB7TgVonkJ+6DO
	 kXByUnWWnbvsA==
Date: Sat, 11 May 2024 13:18:41 +0100
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
Message-ID: <20240511-unbiased-dainty-ccb5ece9b1b9@spud>
References: <20240507065319.274976-1-xingyu.wu@starfivetech.com>
 <20240510-unfounded-syrup-d1263d57d05a@spud>
 <NTZPR01MB0956D48361098E8AA4B3930A9FE02@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <NTZPR01MB0956D48361098E8AA4B3930A9FE02@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240511_051848_153142_002C8A7E 
X-CRM114-Status: GOOD (  27.54  )
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
Content-Type: multipart/mixed; boundary="===============6088666371328672822=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6088666371328672822==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="333ws8b+xrVh64Qn"
Content-Disposition: inline


--333ws8b+xrVh64Qn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 11, 2024 at 03:02:56AM +0000, Xingyu Wu wrote:
> On 11/05/2024 05:05, Conor Dooley wrote:
> >=20
> > On Tue, May 07, 2024 at 02:53:17PM +0800, Xingyu Wu wrote:
> > > This patch is to add the notifier for PLL0 clock and set the PLL0 rate
> > > to 1.5GHz to fix the lower rate of CPUfreq on the JH7110 SoC.
> > >
> > > The first patch is to add the notifier for PLL0 clock. Setting the
> > > PLL0 rate need the son clock (cpu_root) to switch its parent clock to
> > > OSC clock and switch it back after setting PLL0 rate. It need to use
> > > the cpu_root clock from SYSCRG and register the notifier in the SYSCRG
> > > driver.
> > >
> > > The second patch is to set cpu_core rate to 500MHz and PLL0 rate to
> > > 1.5GHz to fix the problem about the lower rate of CPUfreq on the
> > > visionfive board. The cpu_core clock rate is set to 500MHz first to
> > > ensure that the cpu frequency will not suddenly become high and the
> > > cpu voltage is not enough to cause a crash when the PLL0 is set to 1.=
5GHz.
> > > The cpu voltage and frequency are then adjusted together by CPUfreq.
> >=20
> > Hmm, how does sequencing work here? If we split the patches between tre=
es it
> > sounds like without the dts patch, the clock tree would (or
> > could) crash, or mainline if the clock changes there before the dts one=
s do. Am I
> > misunderstanding that?
>=20
> Oh, I think you misunderstood it. Patch 1 (clock driver patch) does not c=
ause the
> clock tree crash without the patch 2 (dts patch), and it just provides th=
e correct
> flow of how to change the PLL0 rate. The patch 2 is to set the clock rate=
 of
> cpu_core and PLL0 rate, which causes the crash without patch 1. Setting c=
pu_core
> rate is to avoid crashes by insufficient cpu voltage when setting PLL0 ra=
te.

So is the problem in the other direction then? My dts tree will crash if
I apply the dts change without the clock patch?
Additionally, what about U-Boot? Will it have problems if the dts is
imported there without changes to its clock driver?

Cheers,
Conor.

--333ws8b+xrVh64Qn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj9iIQAKCRB4tDGHoIJi
0jz7AQDMGT0ZB2SbFkWjxos3cZ08Ze3mWlouJG3EZjiHUCiEpQD9GdnqEmDDi+rg
c/RIx75GM1ix0t3Vh238l/JUOHWRsg0=
=/uka
-----END PGP SIGNATURE-----

--333ws8b+xrVh64Qn--


--===============6088666371328672822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6088666371328672822==--

