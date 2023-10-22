Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395E6CDB474
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Oct 2023 18:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgE1DeqpNmkGJfZmTeUXdZmadkp3G/DlLC8lj+Y56X4=; b=I4Qf4hfuVKSJKqpCnxG5VmU3hS
	VxVTC1cw8WKKFlZFwrb8xk79Nx3CXjPLDp4vdGXEpLhW7tFLwMVh1LAwauaFFwQ0g4gIQQAskT1Yd
	sg9j7l2maa2Lqnwrerr5KE9ZuzABBT3UWqbQ3R2k84mpDH/iOzEoJuKFruhwd6rc/aPQeMKrPRrSG
	Yexaj7h6qO0ydauUdd6DD1m4WbittpwVIjq29y3LDWFr42HpURwb2QLFGpcjJaNlEPjkpaKSqo4uA
	Qk5d61Zlanaqe4dIhzAwQ3NpHY5wbTAnRROGN1DAF5OWoR5dTTy1Wk5ZERrvvtUHPry3EopB08+Rh
	AcBkbNgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quckt-005mgd-05;
	Sun, 22 Oct 2023 18:00:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quckn-005meu-2j;
	Sun, 22 Oct 2023 18:00:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id AF4AFB80D7D;
	Sun, 22 Oct 2023 18:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EED4C433C8;
	Sun, 22 Oct 2023 18:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697997639;
	bh=9wO5luQQA8YamZzHgZ2c+8fPusMyrapaaEYIJ6WW7d4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCvWET6DpMgtWpc4RTvFqtnFe/lRb3pvOTc1BbmpzD7II1ggf9IjdzX1rT13qkC/W
	 CceP0hWDUW4bxZqJJCAh2iXQcjGJ4IY9xombM9nW4mmBLJ30cEEfy4iGkkWw27YAhP
	 9nkhlXCuiwMRr9FMucNlHHRApkm/bV71zVP042GkU4jCckh7fTETl4l2VDGocODOtD
	 iVm0eOPrPBAkYRCFBcQv52qjHDEKwKfpOsGo73uG+ZI2FRJ4cs4yyzHVT0xb2zoCN4
	 cTBMUO5QxyRTGCh4NlNoSsFmyF94GjaZ8+XRzAAgsll0kYuiTTmX700T/uYhBOkJy2
	 vdOJEVOK7HDjg==
Date: Sun, 22 Oct 2023 19:00:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v3 00/13] Support Andes PMU extension
Message-ID: <20231022-cabana-crate-503b6e8d0481@spud>
References: <20231022151858.2479969-1-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20231022151858.2479969-1-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_110046_149599_30D1E1CB 
X-CRM114-Status: GOOD (  13.94  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: multipart/mixed; boundary="===============2516339456439628989=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2516339456439628989==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kQihSqwF+AlYNzqS"
Content-Disposition: inline


--kQihSqwF+AlYNzqS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Sun, Oct 22, 2023 at 11:18:45PM +0800, Yu Chien Peter Lin wrote:
> Hi All,
>=20
> This patch series introduces the Andes PMU extension, which serves
> the same purpose as Sscofpmf. In this version we use FDT-based
> probing and the CONFIG_ANDES_CUSTOM_PMU to enable perf sampling
> and filtering support.
>=20
> Its non-standard local interrupt is assigned to bit 18 in the
> custom S-mode local interrupt enable/pending registers (slie/slip),
> while the interrupt cause is (256 + 18).
>=20
> The feature needs the PMU device registered in OpenSBI.
> The OpenSBI and Linux patches can be found on Andes Technology GitHub
> - https://github.com/andestech/opensbi/commits/andes-pmu-support-v2
> - https://github.com/andestech/linux/commits/andes-pmu-support-v3
>=20
> The PMU device tree node used on AX45MP:
> - https://github.com/andestech/opensbi/blob/andes-pmu-support-v2/docs/pmu=
_support.md#example-3
>=20
> Tested hardware:
> - ASUS  Tinker-V (RZ/Five, AX45MP single core)
> - Andes AE350    (AX45MP quad core)
>=20
> Locus Wei-Han Chen (1):
>   riscv: andes: Support symbolic FW and HW raw events
>=20
> Yu Chien Peter Lin (12):
>   riscv: errata: Rename defines for Andes
>   irqchip/riscv-intc: Allow large non-standard hwirq number
>   irqchip/riscv-intc: Introduce Andes IRQ chip
>   dt-bindings: riscv: Add Andes interrupt controller compatible string
>   riscv: dts: renesas: r9a07g043f: Update compatible string to use Andes
>     INTC
>   perf: RISC-V: Eliminate redundant IRQ enable/disable operations
>   RISC-V: Move T-Head PMU to CPU feature alternative framework
>   perf: RISC-V: Introduce Andes PMU for perf event sampling
>   dt-bindings: riscv: Add T-Head PMU extension description
>   dt-bindings: riscv: Add Andes PMU extension description
>   riscv: dts: allwinner: Add T-Head PMU extension
>   riscv: dts: renesas: Add Andes PMU extension

You only sent 5 of these patches FYI.

--kQihSqwF+AlYNzqS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTVjPAAKCRB4tDGHoIJi
0o+CAQCs8vdPe2eoLkFKb2hs5d1cvV8J9PlrQHw0kqccpMHL3AD8CQBoM5Sk3hvM
Gz9PBQeo9LO29BJjkL9Q/nthrSlgIw0=
=9vNu
-----END PGP SIGNATURE-----

--kQihSqwF+AlYNzqS--


--===============2516339456439628989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2516339456439628989==--

