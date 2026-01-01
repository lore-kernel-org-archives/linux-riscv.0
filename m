Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754B6EEB576
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jan 2026 00:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZLnfNNcLdXrvgvue+JZZLFYth5K0WsAiLCKsLEu2yI=; b=rzj9TABi0nH5bpQzZUOCr9wqDe
	BgPhX1y3aJuEl4AC5/C1xRrPSP6DWxgLSkxdA3Zl0xpvqlL6b8zgRNX9IGayBZPenWxUVz+6L8Ede
	ZQS5Rr87BoP4hi4uZIH041xNr+5x/tLMi27LW+SgQZ32+6QFAGKek54griJ+6zkcRNNPasjilRpA8
	Gc5fUNmiWRcGCdZ1kWZ4VGHqwQt42EaA3tpLtXWHets5aGMSnwigk4ai0kCOYfZtW1ulxaxPZijAv
	oKtlCezkRYxEWzEmyQ9Z4rlrJYBqvx778JK1ixNmVXGM0hE3/vDxHi/J2mmAZOWBhQYGchLTdsNjH
	T1j2r77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb6U6-00000006SU1-24ZX;
	Thu, 01 Jan 2026 00:24:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb6U5-00000006STt-0NJn
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jan 2026 00:24:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E9FC760017;
	Thu,  1 Jan 2026 00:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A82C113D0;
	Thu,  1 Jan 2026 00:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767227047;
	bh=KNoiApyMWT+DJ8JQATW2+HokfFFLugunixpx2ju/Efw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g/5VTD1BhKf5/WmuhqAfM50d2/IyTD8N6HxvtXDzKesz6dn/jpDImNFrOkRc/TdsW
	 rpJxwoW9hd1fGmrsP0T1sU+a4jrWPAv+zVthRCZOXFc4h/Y7auCh90lJj2946gVhGb
	 3lTyhgxycbHSOnozzEVTj7nD6nkQYohyk8SsUBzXRkXL1T7tBt5MwNSba5mCuo4sPB
	 MZ9pBrD4u2RJ+jed66+QfogHzPi8nF7yukLACKy5peqY2TAM7e2uR/GAVec9TCvVlQ
	 nADJT2YCvkhGrAvJvOw5NOWB0KawztDXlhqHH0moqLtgoQI+l90C+q7gGOPQPgrEhf
	 8su+eCYh/8uxw==
Date: Thu, 1 Jan 2026 00:24:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	linux-serial@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
Message-ID: <20260101-legume-engraved-0fae8282cfbe@spud>
References: <20251216-k3-basic-dt-v1-7-a0d256c9dc92@riscstar.com>
 <60948ca2-ed3d-485b-9b11-15df7ef8791d@canonical.com>
 <CAH1PCMb=+TvB1w+G6a2ANDp05HUwC4r6CFBDHXFwSmoP3Mm8xw@mail.gmail.com>
 <f9b6b5e2-ec9e-4208-8267-77020e0a9411@canonical.com>
 <20251218-basil-quantum-225ce16e4699@spud>
 <CAH1PCMZ3KM9-D3NJ1N2LUHTHFSDVKmGKT5fU8knAL7NnV9E-gw@mail.gmail.com>
 <20251220-repacking-football-c79e660e788a@spud>
 <4e4c9e7b-d95c-4157-94c3-b06002f94a48@canonical.com>
 <20251222-dimmer-wooing-db29fe925498@spud>
 <CAH1PCMbane4uN=N0UPRDG9x9NUbD9SYsbH+NnP-gzU6Bo8L2wQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH1PCMbane4uN=N0UPRDG9x9NUbD9SYsbH+NnP-gzU6Bo8L2wQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============5905071956033120929=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5905071956033120929==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X7aUwCxMZok6EY4n"
Content-Disposition: inline


--X7aUwCxMZok6EY4n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 26, 2025 at 02:53:10PM +0800, Guodong Xu wrote:

> As we wait for Samuel to share his opinion, maybe I can submit a patch in
> (I already have it)
> my next version or as in a different patchset to implement what you sugge=
sted.
>  - Assign RISCV_ISA_EXT_SUPM a standalone ext number in hwcap.h
>  - Implement a riscv_ext_supm_validate() and put it in the callback of bo=
th
>     ssnpm and smnpm.
>  - Kconfig will be kept as a top level gatekeeper, no change.
>  - dt-binding entry for supm will not be added.
>=20
> The only reason support me to add sump into to the dt binding
> (extensions.yaml) is it's now a mandatory extension required by RVA23U64.
> However, as you explained, that logic seems not strong enough.

Regardless of what we end up doing in dt, I think you should write the
kernel code as if we are adding it to the binding. That way you can "imply"
supm from both ssnpm and smnpm (see riscv_zvkng_bundled_exts for an
example) and add the validate callback that checks against the privilege
level to supm itself. I don't think sxnpm should be disabled if the
privilege level of the kernel is different to that of the extension
(e.g. s mode kernel and smnpm) or if the kconfig option is disabled
(because I think ssnpm could be providing kvm with pointer masking even
when it is disabled for userspace). I think doing it the way I suggest
works better for those kinds of cases but also will just happen to work
for ACPI systems that have supm without the relevant sxmpm listed.

--X7aUwCxMZok6EY4n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaVW+oAAKCRB4tDGHoIJi
0t9lAP0S+GP12VlrrHu2vbrcEV+WOXWl8WA2T3jhIVGaQnHF+QD/bc6sUs2BIlUa
/VSDfvq3JlZVUzvMjkx29+2XvTi3yAc=
=RYdG
-----END PGP SIGNATURE-----

--X7aUwCxMZok6EY4n--


--===============5905071956033120929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5905071956033120929==--

