Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48791CCFA18
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 16:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f34TsBB7Oyy73fHx74xjXE/iGikk9tiQPyox2UTFytQ=; b=r+iZoe4zbC7tLU7OfF9xZOsEO7
	+UhK/URBCXJWmABsTKnVXepdF2cCj1BH8gBCSLM3o/mmLqoA7fk1ec1wfHIBNCZeEGRsw14PCdxR8
	qlmpfhvzrdJJaEEqsZiSS0k2uVm+YHFOrCoy8IDflgAirNYOuu1NVZcS+3HrOSDm1XJGVvSW3dpxt
	bGEbdg39tWT1ICCD+rwR5FcgE3emuzRgj0NBqudSnBMCiGieGk0xyurAOlSDZO8rMCGPR2CDj7D5c
	BwC3IDV9q8lNRDRD7W/MAd9mopEIbudY4aqf4Egrr8bzOkc5O4j4J+i9uwp2tXTsvSq0Yi0bMgF6O
	FGod8Mkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHljR-00000003Fqz-00ML;
	Sat, 08 Nov 2025 16:24:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHljO-00000003FqT-0Ley;
	Sat, 08 Nov 2025 16:24:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 21C6C43B0D;
	Sat,  8 Nov 2025 16:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3B3C4CEFB;
	Sat,  8 Nov 2025 16:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762619041;
	bh=8xqsPy/8pD1oeGp2VPuCIqEvJBg7qqACdyqs52xqN6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R0w+fyRXmNsZ8ePbH/yGTTzgTjPNUbhxtUeFJ++0E7FJCnAMxC7ry9r6Gs7j9F3SJ
	 y5gStanuy804lxMfhMnpMV6aKJQk/M/JEzbC3SR0arexAXsELjpb42+xkDUFY6oncf
	 LcEtfTs520zxEJ4zYty6e/HphgJ0RurYMWAfTJoGGHeJ9JtswdgDcfifJUhxroMfak
	 apT4Z9g9V3u3cpfrtp6bGCDbeakyKwaJXkx6Ycij4DR9MB1eLba7+103VM0A1eJo5h
	 7SDotm1e+kUqBZYfD8axcmds/B3mn6HPX5/5nlEd1tV4Dq2DPB6Id8b8Dho/vq8oLY
	 HPh1bYIoyST3w==
Date: Sat, 8 Nov 2025 16:23:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: revy <gaohan@iscas.ac.cn>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>, krzk+dt@kernel.org,
	conor+dt@kernel.org, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Yixun Lan <dlan@gentoo.org>,
	Drew Fustini <fustini@kernel.org>, geert+renesas@glider.be,
	Guodong Xu <guodong@riscstar.com>, Haylen Chu <heylenay@4d2.org>,
	Joel Stanley <joel@jms.id.au>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH 1/3] riscv: soc: re-organized allwinner menu
Message-ID: <20251108-hurler-clammy-0df5e778c04c@spud>
References: <cover.1762588494.git.gaohan@iscas.ac.cn>
 <d17a3a01e2b1297538c419b51953f9613426ba42.1762588494.git.gaohan@iscas.ac.cn>
 <e98a1e59-f3ff-4e9f-a180-79aea9943236@kernel.org>
 <43109A90-8447-4006-8E29-2D2C0866758F@iscas.ac.cn>
 <287444fa-120c-42b4-9919-2f05ab1a2ab7@kernel.org>
 <8ae5d81d-4869-4c39-9561-cb0f87da70fd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <8ae5d81d-4869-4c39-9561-cb0f87da70fd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_082402_167902_14037823 
X-CRM114-Status: GOOD (  22.00  )
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
Content-Type: multipart/mixed; boundary="===============0867017680666497219=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0867017680666497219==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zDi7HsMP+xaYfO8R"
Content-Disposition: inline


--zDi7HsMP+xaYfO8R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 08, 2025 at 03:48:18PM +0100, Krzysztof Kozlowski wrote:
> On 08/11/2025 15:47, Krzysztof Kozlowski wrote:
> > On 08/11/2025 14:59, revy wrote:
> >>
> >>
> >>
> >>> -----Original Messages-----
> >>> From: "Krzysztof Kozlowski" <krzk@kernel.org>
> >>> Sent Time: 2025-11-08 19:29:07 (Saturday)
> >>> To: gaohan@iscas.ac.cn, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dab=
belt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre=
 Ghiti" <alex@ghiti.fr>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlow=
ski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Chen-Yu T=
sai" <wens@csie.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel =
Holland" <samuel@sholland.org>, "Yixun Lan" <dlan@gentoo.org>, "Drew Fustin=
i" <fustini@kernel.org>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "G=
uodong Xu" <guodong@riscstar.com>, "Haylen Chu" <heylenay@4d2.org>, "Joel S=
tanley" <joel@jms.id.au>
> >>> Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, de=
vicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi=
@lists.linux.dev, "Han Gao" <rabenda.cn@gmail.com>
> >>> Subject: Re: [PATCH 1/3] riscv: soc: re-organized allwinner menu
> >>>
> >>> On 08/11/2025 09:20, gaohan@iscas.ac.cn wrote:
> >>>> From: Han Gao <gaohan@iscas.ac.cn>
> >>>>
> >>>> Allwinner currently offers d1(s)/v821/v861/v881 on RISC-V,
> >>>> using different IPs.
> >>>>
> >>>> d1(s): Xuantie C906
> >>>> v821: Andes A27 + XuanTie E907
> >>>> v861/v881: XuanTie C907
> >>>>
> >>>> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> >>>> ---
> >>>> arch/riscv/Kconfig.socs | 22 +++++++++++++++++-----
> >>>> 1 file changed, 17 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> >>>> index 848e7149e443..7cba5d6ec4c3 100644
> >>>> --- a/arch/riscv/Kconfig.socs
> >>>> +++ b/arch/riscv/Kconfig.socs
> >>>> @@ -54,14 +54,26 @@ config SOC_STARFIVE
> >>>> 	help
> >>>> 	  This enables support for StarFive SoC platform hardware.
> >>>>
> >>>> -config ARCH_SUNXI
> >>>> -	bool "Allwinner sun20i SoCs"
> >>>> +menuconfig ARCH_SUNXI
> >>>> +	bool "Allwinner RISC-V SoCs"
> >>>> +
> >>>> +if ARCH_SUNXI
> >>>> +
> >>>> +config ARCH_SUNXI_XUANTIE
> >>>
> >>>
> >>> You should not get multiple ARCHs. ARCH is only one. There is also not
> >>> much rationale in commit msg for that.
> >>
> >> The main goal is to avoid choosing multiple IP addresses for erreta.=
=20
> >> If using Andes IPs, I don't want to choose XuanTIe (T-Head) ERRETA.
> >=20
> > Not explained in commit msg but anyway not a good argument. It is some
> > sort of micro optimization and you completely miss the point we target
> > multiarch kernels.
>=20
> Heh, and I actually did not forbid or discourage choosing erratas per
> your soc. I said you only get one top level ARCH. Look at all arm64
> platforms. How many ARCHs are there per one vendor?


Yeah, it only allows you to enable the errata, it doesn't force any of
them to "y". Some will get enabled by default when ARCH_SUNXI is
enabled, but if someone is only targeting on device they can just turn
them off... I'm pretty inclined to just NAK this unless there's some
actual value.

--zDi7HsMP+xaYfO8R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ9ukwAKCRB4tDGHoIJi
0qJsAP9PB5Qfwou9FktzjX1XPDGtvQx5CGiUMGnYmlQQvt7gAwD/YQjrczBDtE6G
yftMBPxa/2JWp4I00u3RUCiy5yPmrwc=
=Vu6g
-----END PGP SIGNATURE-----

--zDi7HsMP+xaYfO8R--


--===============0867017680666497219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0867017680666497219==--

