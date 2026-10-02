Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF3BCA5FD4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 10:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NOmQw7AfAX561ESekH78wJ7XANcTrx10xBT6zwecCI=; b=e6NHdOAuQGXasZYY0kn6VYT9Um
	vQyvy65bNBFOvDz8kYpr83uqYl7U+2GfahxpLFTLoKpjLF89GlTzuR4vIP0+zdqEBxE+qv/G7vDZ3
	+JA8Q/KSHnX1TuQEegdBMkjRpUlP3KPTX91JdkaPzuaTlJ9+AKXVhBSCW60H0aKRyxus1hh60f+yb
	qAWmJXsli39vwn6gNq0TqxgHuh5XXjPoYOnlgZ1P6HZ4UdBn/c6YB7BHx4blrLP9b17l0IKZzWgY8
	HcoQZyaLMNp/cIRb2IqYte7oT1Wd1e3ITjKNjrVE85pZx95K5pwguZViU/XvKaSB/ue5NbkVFteQH
	b31MgwgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCa9P-0000000BFiP-1VJk;
	Fri, 02 Oct 2026 10:05:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCa9M-0000000BFhA-2tED
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 10:05:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790935556; x=1822471556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=98P1EsH1CiDVYz6+zMdaA6M1c9emp98ZounDfs767bM=;
  b=tu01q9mtT4kYq9PRc1DL+2+4lNxcT0iVhf3Kbw7K8cREIjym88DIMAmk
   QlI5QfU7+4txthfhYxmGyh56sx6DIzKNL812g13iAMwSqmpZM997xD046
   vSAbvZ0Q9L54WUSBg84WwbrUC8rvGb9yLPGYlCZjuCevnUcpzZvP/8C++
   uXUos6deAU7DLD6bsO+SVn7GNHB4INbID31Zi3nom0dKqThAgiz00BGeJ
   R03Ch776uLUjEGvsW5FN9OO2IslprWi2Qhs0ou2PX3ddqf8ToCUdUCkEe
   lbNyTM6Xxn/33/95ZOvE/zQPRmSBdyRMiZzRMRIlAEiZj3STYKOivWoF2
   A==;
X-CSE-ConnectionGUID: 9KaUDp3dRV2TwHyLsfdFzw==
X-CSE-MsgGUID: t0C0kCkzRpii0oAsAl49jw==
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="asc'?scan'208";a="63548948"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Oct 2026 03:05:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 2 Oct 2026 03:05:55 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 2 Oct 2026 03:05:53 -0700
Date: Fri, 2 Oct 2026 11:04:33 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Bo Gan <ganboing@gmail.com>
CC: <linux-riscv@lists.infradead.org>, <samuel.holland@sifive.com>,
	<david@redhat.com>, <palmer@dabbelt.com>, <pjw@kernel.org>,
	<gaohan@iscas.ac.cn>, <me@ziyao.cc>, <lizhi2@eswincomputing.com>,
	<hal.feng@starfivetech.com>, <marcel@ziswiler.com>, <conor@kernel.org>,
	<kernel@esmil.dk>, <devicetree@vger.kernel.org>
Subject: Re: [RFC PATCH v2 0/3] riscv: support EIC770X/JH7110 noncoherent
 devices with XPbmtUC
Message-ID: <20261002-demeanor-demeaning-db463813c033@wendy>
References: <20260316060328.1173634-1-ganboing@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260316060328.1173634-1-ganboing@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_030556_802282_77533023 
X-CRM114-Status: GOOD (  44.49  )
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
Content-Type: multipart/mixed; boundary="===============4287006624320486047=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4287006624320486047==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A6+7ibGAiMjBL0qL"
Content-Disposition: inline

--A6+7ibGAiMjBL0qL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

Once again, I am sorry for how long this has taken me. I've had this
sitting at the base of my review mailbox and kept meaning to get to it,
but due to being at the bottom I always got here when I was already
tired and could never face into actually sitting down and looking at
what the EIC7700 opensbi changes actually did.

On Sun, Mar 15, 2026 at 11:03:25PM -0700, Bo Gan wrote:
> SoCs with pre-Svpbmt Sifive cores, e.g., Starfive JH7110 and ESWIN
> EIC770X both have non cache-coherent peripherals. On JH7110[1], video
> subsystem (GPU/VOUT/VPU/ISP) is routed to the sys port, making them not
> cache-coherent. On EIC770X, all peripherals are routed to the sys port,
> and none is cache-coherent. Instead of Svpbmt, these SoCs map system
> memory twice -- the conventional cached region (through front port),
> and the uncached alias (through sys port) at different base addresses.
> The uncached alias implicitly applies the uncacheable PMA. Drivers
> working with noncoherent devices can utilize the uncache alias to map
> DMA buffers, without doing explicit cache flushes.
>=20
> This feature is not an ISA standard, and the cache/uncache base can be
> configured by the SoC vendor. To expose it properly, introduce a Sifive
> "errata", namely "XPbmtUC", to model the setup as a customized version
> of Svpbmt. It choses a single, artificial bit in PTE at runtime for
> cache/uncache control, effectively offsetting the PPN by power-of-2.
> On JH7110, it aligns perfectly with the HW: it maps the cached region
> at 0x40000000, and the uncached alias at 0x4_40000000. Chosing bit 32
> (PPN bit 34) as the UC bit matches HW exactly.
>=20
> Starfive JH7110 (Sifive U74 core) memory map:
>=20
>           [0x0,   0x40000000) Low MMIO
>    [0x40000000, 0x2_40000000) Cached Mem
>  [0x4_40000000, 0x6_40000000) Uncached Mem (UC+)
>  [0x9_00000000, 0x9_d0000000) High MMIO
>=20
> On EIC770X, the aliased UC region is put to a offset not power-of-2.
> There can also be 2 NUMA node (dual-die) with 2 separate memory regions
> and their UC alias counterparts are offsetted differently. We detect if
> the firmware has the capability to re-arrange the memory map, using
> G-stage pagetable, making the the offsets power-of-2 again.
>=20
>             [0x0,     0x20000000) Core Internal
>      [0x20000000,     0x40000000) Core Internal (Die 1)
>      [0x40000000,     0x60000000) Low MMIO
>      [0x60000000,     0x80000000) Low MMIO (Die 1)
>      [0x80000000,  0x10_80000000) Cached Mem
>   [0x20_00000000,  0x30_00000000) Cached Mem (Die 1)
>   [0x80_00000000,  0xa0_00000000) High MMIO
>   [0xa0_00000000,  0xc0_00000000) High MMIO (Die 1)
>   [0xc0_00000000,  0xd0_00000000) Uncached Mem <----------.
>   [0xe0_00000000,  0xf0_00000000) Uncached Mem (Die 1) <--+--.
> with firmware/hypervisor re-mapping:                      |  |
> ------------------------------------                      |  |
>  [0x100_80000000, 0x110_80000000) Mem UC+ ----------------'  |
>  [0x120_00000000, 0x130_00000000) Mem UC+ (Die 1) -----------'
>=20
> The "XPbmtUC" alternative PTE format is the cleanest solution I can
> think of to solve the non-coherent device enablement w/o Svpbmt from
> kernel side. Drivers can do explicit cache flushes to workaround the
> problem, but a. it pushes the burden of cache flushes to driver code,
> and we don't want to complicate them if it's already written with the
> cache coherent assumption in mind. b. complex drivers like GPU could
> allow user-space to mmap DMA pages, but userspace can't flush caches
> due to the lack of Zicbom on these SoCs.

he other day Icenowy submitted some patches for the drm driver used on
the JH7110 that are not actually that intrusive:
https://lore.kernel.org/all/20260930073528.3369325-3-zhengxingda@iscas.ac.c=
n/

No idea if the DRM maintainers will find this kind of thing acceptable
though, there's every chance that they hate the idea. On the JH7110 I
don't mind what's done in this series - especially given that what the
JH7100 is doing with reserved memory is something Rob considered to be a
bit of an abuse. But if the DRM guys are okay with Icenowy's work, the
value of this is obviously much reduced. One new alternative (that could
be avoided entirely if the erratum config is disabled) isn't much of a
price to pay here if the userspace flushing is important (I really dunno
anything at all about how useful that is to GPU stuff).

> I'm aware there's an ongoing
> series[2] that Samuel sent for physical memory aliases, which is
> essentially a superset of my patch. I don't mean to step ahead of him,
> but try to find a middle ground if the community still worries about
> his change touching too many areas. My change is very minimal and
> local. It's fairly easy to remove, too.

I dunno, it's not that easy to remove I don't think. Switching from this
to Samuel's approach requires a DT change, so you're looking at
regressions if this is removed.

> ----------------------------------------
> Notes about PoC firmware implementation on EIC7700X[3]:
>=20
> The OpenSBI is augmented to provide a very thin layer hypervisor, where
> it runs the entire host OS in VS-mode, and provide the aforementioned
> remapping. I remap UC+ memory to 2^40+ to make the 2-stage translation
> efficient, where I can utilize Sv39x4 G-stage scheme to map the entire
> physical address space at bottom-half, and the uncache counterparts to
> system memory at top-half. I also make use of the largest page in Sv39
> -- 1GB page, to map everything, keeping the G-stage page-table minimal,
> only 16KB in size, while also minimizing TLB misses. A very slight,
> unavoidable, slow down is with the external interrupt delivery. Due to
> the lack of AIA in EIC770X, all device irq now needs to trap to M mode
> first, before forwarding to VS mode. The overhead of running KVM in
> such setup is yet unknown, and may well be noticeable. All HS-qualified
> instructions will trap to M mode, which is costly. The NACL extension,
> if implemented, will alleviate it, but there's also the extra cost of
> flushing G/VS-stage TLBs. I'm analyzing it in parallel.

The problem with this idea though is how it works on EIC7700. This is
very invasive and the impact this has on hypervisor use (on one of the
only hypervisor capable boards) probably makes this unacceptable to most
users, compared to a solution like Samuel's that has nothing like that.

On top of that, it has firmware changes that really would need to be
either upstream or shipped by the vendor to make this acceptable. I know
vendors are willing to ship all sorts of things, but with that in mind,
they could just ship Samuel's series downstream without the downsides
the opensbi change here has. Upstreaming it may not be possible, which
would leave things in a really weird state.

I know Samuel's series has been stalled for a long time, but I expect it
to get revived when the eic7700 support patches progress past the
simpler peripherals.
Without the vendors (be that sifive or eswin or einfochips) showing
interest in this method it's really hard to sit here and tell you to
pursue this further, since you're probably gonna face resistance getting
the opensbi stuff anywhere.

Thanks,
Conor.

>=20
> Use [4] if you have a Hifive Premier P550 to try it out.
>=20
> [1] https://github.com/starfive-tech/JH7100_Docs/blob/main/JH7100%20Cache=
%20Coherence%20V1.0.pdf
> [2] https://lore.kernel.org/all/20251113014656.2605447-20-samuel.holland@=
sifive.com/
> [3] https://github.com/ganboing/opensbi/tree/eic77x-vspt-physalias-wip
> [4] https://github.com/ganboing/linux-eic77/tree/ganboing-xpbmt-uc-v2-eic=
77-clk-v15
>=20
> ---
> v2:
>  - Move the core logic to Sifive errata to address Conor's comments
>=20
> v1: https://lore.kernel.org/linux-riscv/338f0f79-1eed-4c5c-9966-04a2eaeb3=
d98@gmail.com
>=20
> Bo Gan (3):
>   riscv: alternatives: support auipc+load pair
>   riscv: errata: sifive: support auipc/load pair in patched alternatives
>   riscv: errata: sifive: Add an "errata" to simulate Svpbmt on cores
>     without
>=20
>  arch/riscv/Kconfig.errata                    | 13 ++++
>  arch/riscv/errata/sifive/errata.c            | 80 +++++++++++++++++++-
>  arch/riscv/include/asm/errata_list.h         | 19 ++++-
>  arch/riscv/include/asm/errata_list_vendors.h |  3 +-
>  arch/riscv/include/asm/insn.h                |  8 ++
>  arch/riscv/include/asm/pgtable-64.h          |  9 ++-
>  arch/riscv/kernel/alternative.c              | 11 +--
>  7 files changed, 132 insertions(+), 11 deletions(-)
>=20
> --=20
> 2.34.1
>=20

--A6+7ibGAiMjBL0qL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar+BsAAKCRB4tDGHoIJi
0lE3AQCOfH/GLXkVBPB2jihGgynqx7D1JZMi2N3fCiqGnAA7JAD+LyDk+xsEUOFx
SJOVch+YywckyodTU923LTpElyFSlQY=
=b0l0
-----END PGP SIGNATURE-----

--A6+7ibGAiMjBL0qL--


--===============4287006624320486047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4287006624320486047==--

