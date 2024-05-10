Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477E1C25B10
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 21:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrwcl1K1FvsmGy8qhcKV3E4GnkzinFW83JQuuappOVY=; b=FsVbZwXIfz2jZ6ppU5e46WNlhu
	O2ZpoI2d42jZMpuyrAxYVoNSsyfcLckAH4MBiTkeCZ+1MI3e0sHeWufQLCgcIYuMJRnswO0SkaUmt
	sEUDZL4X311M4ZP7N+6T4XKKg11j5IccAskl1ixw0Wb3EgxSZG545nVbt7Y1+2G5x9niyHMARpG9I
	zah8XXxO/lN405I89wC8r6BOFOVoiBuT5wI3rzOWONDjsunLIxTl8UJhTjsERLIg8tinsklUL3LUz
	wS4ePn19Ilp34ZZkTiKWlB6ysUdVuFGNVUsIJ3v8hIGPH+446U4KngcjrcvzzknMLlElMs7nttDvS
	Vb1Q/5FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5XQg-00000006SK1-2Mda;
	Fri, 10 May 2024 21:05:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5XQd-00000006SIO-3PUf
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 21:05:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F5DD61F13;
	Fri, 10 May 2024 21:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED90EC113CC;
	Fri, 10 May 2024 21:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715375118;
	bh=AA5sZgLLBpbhXbSQdOIXGjRAYnAtflIceR2L/vwR200=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WWfoDi2uPXg023vkQwgViAKGfY1xzzMj6NRlJRbpEXW/TQBbwCDdfqCc1piRvQTOH
	 kguCo+Ojyt1KnMw95xYDPvcEEGBmX18xgfdnjLbs7vPeW2xY5crY50yrm8YK5t3RtI
	 A6RO5oPqVOIyKegimao9krXf2cxje61/bwB7NBYc1b+u/b/2tW1nH3B4LsDvUKJ0g2
	 An7CWbl3YBrqea9ONfAeDwhQ4eUSWWm83TmCC+fyGrxi3+My2zUAy8+Y+WfyaCcdkI
	 /TE879aZOB5jozx/Zjb5xpLqgkmdUSjnyIe/H3p9swlmuHyzR1Z3B+DL8GESfVFzro
	 JjertKIY8aokg==
Date: Fri, 10 May 2024 22:05:13 +0100
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
	Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 0/2] Add notifier for PLL0 clock and set it 1.5GHz on
Message-ID: <20240510-unfounded-syrup-d1263d57d05a@spud>
References: <20240507065319.274976-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240507065319.274976-1-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_140519_924303_A5D9EA5D 
X-CRM114-Status: GOOD (  18.60  )
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
Content-Type: multipart/mixed; boundary="===============5901834259317265071=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5901834259317265071==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fcmvmWId/wrDz6pC"
Content-Disposition: inline


--fcmvmWId/wrDz6pC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2024 at 02:53:17PM +0800, Xingyu Wu wrote:
> This patch is to add the notifier for PLL0 clock and set the PLL0 rate
> to 1.5GHz to fix the lower rate of CPUfreq on the JH7110 SoC.
>=20
> The first patch is to add the notifier for PLL0 clock. Setting the PLL0
> rate need the son clock (cpu_root) to switch its parent clock to OSC=20
> clock and switch it back after setting PLL0 rate. It need to use the=20
> cpu_root clock from SYSCRG and register the notifier in the SYSCRG
> driver.
>=20
> The second patch is to set cpu_core rate to 500MHz and PLL0 rate to
> 1.5GHz to fix the problem about the lower rate of CPUfreq on the=20
> visionfive board. The cpu_core clock rate is set to 500MHz first to
> ensure that the cpu frequency will not suddenly become high and the cpu=
=20
> voltage is not enough to cause a crash when the PLL0 is set to 1.5GHz.
> The cpu voltage and frequency are then adjusted together by CPUfreq.

Hmm, how does sequencing work here? If we split the patches between
trees it sounds like without the dts patch, the clock tree would (or
could) crash, or mainline if the clock changes there before the dts ones
do. Am I misunderstanding that?

--fcmvmWId/wrDz6pC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj6MCQAKCRB4tDGHoIJi
0n2KAP99FsOM8mLfQPX2XNtPhcooLIejFE//SoGuOehQcOqDMgD+PYpcuATbGArP
k5ayP3fNqZAlAgpi0kidIcGvTxc1HAA=
=5dvt
-----END PGP SIGNATURE-----

--fcmvmWId/wrDz6pC--


--===============5901834259317265071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5901834259317265071==--

