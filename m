Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DE8105F78C
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 12:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9PjF42XaaJRsNUpTu3J93SU2s/rzVKl5+YLs4Ka2X8=; b=ud3ynkwqvsyBPCL5BiBAFytkKF
	gblozPK8tku6lB9M+6D0ETG/HlAhBc6NW16zVE91b7hEi4QokzTeFEsONGHiyGmvygBhFZn9auu7i
	6aezRgqaJPVi1yMhauHmeOgd8PonfNkgq73e+ueSubpTNMwJAlsIjOYlqGGs5aTAjfrudEyNYsN8h
	1bx+vPSg5oHwbFkbdwC/dL5E5PqY/kGKJveeMjDWzVfy5w51VlEyfpZI9q1ZdkuZi96u6//R4iDc5
	ANxR7X/09rTkg9f8gxMoxVmBTJWlAh2/BKJKQvQBMRdPwFdJCZULn7S32jwaeZOXH4s8BRI3edY6j
	YrS8Pirg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w11fH-000000007SI-0zKW;
	Fri, 13 Mar 2026 12:30:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w11fF-000000007Ru-0trG
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 12:30:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 140216012B;
	Fri, 13 Mar 2026 12:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B019C19421;
	Fri, 13 Mar 2026 12:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773405047;
	bh=UC+Yl3z9QYsXrYj3QIsZyePn4NCs3LhBHikYlM0lMo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IVUq0zNRNrljbCxxMZulnQZ7IOV29OHJIkJ4OgZpAAvHIOj1JbG04jaMt2XLMFA/+
	 NL7xKNMiV9XwBmTh99MIY/KPA73hS6g6ez5MwN+3J7HaxHKdjhdcoWVkk1gyGnE35j
	 DBjr48+sqRS3xbffIolD3DIeuN9Eul2/I2hJTLzBUKvgKjICNXyY9LvnSQhjGrpFJX
	 JhZTnlb8fWLSi8b0IipKgeWCV0sM7qDa+Rm3X7rMHrn7AdiWT9uU4FWGjHtJ0TrYfg
	 iZ3mA8NEZw0MzFdHLIOr4VuSyP8dru3o3zUNJo5Mw77r0ZJFr729SF0f3nhzvzZCa6
	 8Xp6cvqwz9HMw==
Date: Fri, 13 Mar 2026 12:30:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
	david@redhat.com, palmer@dabbelt.com, pjw@kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc, lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com, marcel@ziswiler.com, kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 0/6] riscv: support EIC770X/JH7110 noncoherent
 devices with XPbmtUC
Message-ID: <20260313-uninsured-desecrate-06d51e8c100d@spud>
References: <20260313084407.29669-1-ganboing@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260313084407.29669-1-ganboing@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============9202659942140323371=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9202659942140323371==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xl7sylfjzH1sx4al"
Content-Disposition: inline


--xl7sylfjzH1sx4al
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 01:44:01AM -0700, Bo Gan wrote:
> Starfive JH7110 and ESWIN EIC770X both have non cache-coherent
> peripherals. On JH7110[1], GPU/VOUT/VPU/ISP are routed to the sys port,
> making them not cache-coherent. On EIC770X, all peripherals are routed
> to the sys port, and none is cache-coherent. To make drivers work on
> such platforms, the standard solution is to use Svpbmt and map the DMA
> buffer as uncacheable. However, neither SoC supports Svpbmt. Instead,
> they map the system memory twice, as cached and uncached. The uncached
> alias implicitly applies the uncacheable PMA. To support such platform,
> a special form of Svpbmt, namely "XPbmtUC" is introduced in this patch.
> It's a synthetical PTE format where a single bit (UC) is controlling
> the cacheability and the bit position can be configured at runtime. It
> is intended to model the physical memory aliasing with minimal effort.
>=20
> On JH7110, it aligns perfectly with the HW, as the aliased UC region
> happens to be offsetted by 2^34. Thus, configuring the XPbmtUC with
> bit=3D32 (PPN is shifted by 2) is all that needs to be done.
>=20
> On EIC770X, the aliased UC region is put to a awkward offset, and given
> there can be 2 NUMA node (dual-die) with 2 separate memory regions and
> their UC alias counterpart, we instead ask the firmware to provide a
> thin-layer hypervisor to re-arrange the memory map. The XPbmtUC will be
> enabled with bit=3D38, thus map all UC pages to 2^40 (the upper-half of
> 2^41), and the underlaying hypervisor will re-map the 2^40+ addresses
> to the appropriate UC alias regions. (See description in PATCH 1/6)
>=20
> We chose bit 38 (PPN bit 40) to make the 2-stage translation efficient.
> Hypervisor can utilize Sv39x4 G-stage scheme, and map all pages as 1GB
> huge page, consuming only the first-level page table (16KB total), and
> several TLB entries. In practice, it's the firmware/bootloader that
> configures XPbmtUC through device-tree, based on firmware capabilities,
> and skip the enablement on stock firmware. This is tested on Hifive
> Premier P550 with the modified OpenSBI[2]. It runs the host Linux in VS
> mode, and provide the aforementioned remapping. The performance penalty
> (if not running KVM in Linux) is minimal, as the CPU is never switched
> to HS mode. A very slight, unavoidable, slow down is with the external
> interrupt delivery. Due to the lack of AIA in EIC770X, all device irq
> now needs to trap to M mode first, before forwarding to VS mode. The
> overhead of running KVM in such setup is yet unknown, and may well be
> noticeable, as all HS-qualified instructions will trap to M mode, and
> there's also the extra cost of flushing G/VS-stage TLBs. I'm analyzing
> it in parallel.
>=20
> I'm aware there's an ongoing series that Samuel sent for physical
> memory aliases. I haven't been following too closely, but if you're
> worried about it touching to many areas, I hope my series can shed some
> light on the problem. My change is very minimal and local, also fairly
> easy to remove if we later decide deprecating it down the road.
>=20
> [1] https://github.com/starfive-tech/JH7100_Docs/blob/main/JH7100%20Cache=
%20Coherence%20V1.0.pdf
> [2] https://github.com/ganboing/opensbi/tree/eic77x-vspt-physalias-wip

For those following along at home, Samuel's series is:
https://lore.kernel.org/all/20251113014656.2605447-20-samuel.holland@sifive=
=2Ecom/

I've been meaning to try it, but never conjured up the time to dig into
it...

--xl7sylfjzH1sx4al
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabQDcgAKCRB4tDGHoIJi
0k91AQCTigu4flNTwbRfBa2qpwsZVt98SjWUsg5VrekaxBGmfwEAtK6Z8NycfbK9
zELdQt5kDWP0hvATewi82y8QSsJ6WgM=
=TC7+
-----END PGP SIGNATURE-----

--xl7sylfjzH1sx4al--


--===============9202659942140323371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9202659942140323371==--

