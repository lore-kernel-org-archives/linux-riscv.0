Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE70D46BFA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=nq4zZ7O1LKJiY9pP4mW08UkYjW0E/N2H4TqTYgWLtu0=; b=ZIK
	OZXRrwQHIgOSswFR028N13LZN7lN4I1dNJUpAu/uFCtRcL/sc5RqjWEnw/vw+/R70zfoZMBIq4Zf0
	18Pt47yR2pg3uEIpFnV4Vjs/eQ+dvq3RX97r5gjxKkrrk8gjS4oP3qrq0Dmb4FJEk8N7OsFpbrul3
	4gCCCgYPKoBtKVJXSOdosk2PTkX4w8+UhLB8mTb8cf/gK980NuiiBxqNLEI9XtU9pv17P0Lzy6b8U
	StMUdTbCY1T2Ig0AkUmSaD1282dniSFjgJImRprMkChM3f0Z4WMiB8x61hcymE6zOeYSNbphH+1SQ
	75ZAIWsnxaZrHm2/zAqfnqe88xHAb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCE5-0000000GlwN-1MJx;
	Wed, 28 Jan 2026 20:33:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCE3-0000000Glvn-09AR
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:33:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0372E4322E
	for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 20:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1038C4CEF1;
	Wed, 28 Jan 2026 20:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632396;
	bh=NsZ5Kq9r35CaHuCFHxfGPRoTwNixKVjCSljAZj4SwoI=;
	h=Date:From:To:Cc:Subject:From;
	b=j69xuUKvH7H9Q1zhzt43MRz0kJc4n0oHW6lfqHi1E2VDrsfbIhQyWzdqGDNl4Od0r
	 m049N5/Klyd5iAyOHuA3YT1b9LCX6IijDlb+czJvR28zFum79g+dNWKOEu1ZMitQvt
	 Q1c30J5zm0SWpsYy90ZQyvUbuWDC9jDvBO/jrQCHGtooAxa0FUuZzdSg1g4fv2hdMU
	 BfuEBF5j/FUx16mzJEhDYJdQ/wAdMzviHijkLVt0da4yt66wIyjOMPWYMhSksMv4nI
	 qioFkq4H7kFy+uuK2U6Jf9EBMDD03n+E3dLthwdb/UtH7eIq5SGk4YS0w21cneo3up
	 bz6B+1MFNn97Q==
Date: Wed, 28 Jan 2026 20:33:13 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.20 (or v7.0?)
Message-ID: <20260128-palpable-varmint-00bfd7603786@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_123319_110779_B0E129CC 
X-CRM114-Status: GOOD (  14.34  )
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
Content-Type: multipart/mixed; boundary="===============7993786812964101940=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7993786812964101940==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y9QYtxq3CH0Jiq+z"
Content-Disposition: inline


--y9QYtxq3CH0Jiq+z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey folks,

Not a very big PR from me this time either. Last windows I've been
expecting my PR to contain the Canaan k230 platform but the clock
driver that I am waiting on always seems to end up not being quite
ready =C2=AF\_(=E3=83=84)_/=C2=AF

Cheers,
Conor.

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt=
-for-v6.20

for you to fetch changes up to 18649ffbb63bca40896f973b6997914f9d603b1e:

  riscv: dts: anlogic: dr1v90: Add "b" ISA extension (2026-01-19 09:58:30 +=
0000)

----------------------------------------------------------------
RISC-V Devicetrees for v6.20 (or v7.0)

Anlogic:
Minor change to the extension information, to add the "b" extension
that's a catch-all for 3 of the extensions already in the dts.

Starfive:
Append the jh7110 compatible to jh7110s devicetrees, as that will enable
OpenSBI etc to run without adding support for this minor variant. The
"s" device differs from the non "s" device only in
thermal limits and voltage/frequency characteristics.

Microchip:
Redo the mpfs clock setup yet again, to something approaching correct.
The original binding conjured up for the platform was wildly inaccurate,
and even with the original improvements, a bigger change to using
syscons was required to support several peripherals that also inhabit
the memory regions that the clocks lie in. The damage to the dts isn't
that bad in the end, and of course the whole thing has been done in a
backwards compatible manner, with the code changes being merged a cycle
or two ago in the kernel and like a year ago in U-Boot (the only other
user that I am aware of).

Generic:
Additions to extensions.yaml, mainly for things in the "rva23" profile
that appear for the first time on the Spacemit K3 SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (2):
      riscv: dts: microchip: fix mailbox description
      riscv: dts: microchip: convert clock and reset to use syscon

E Shattow (3):
      dt-bindings: riscv: starfive: Append JH-7110 SoC compatible to Vision=
Five 2 Lite board
      riscv: dts: starfive: Append JH-7110 SoC compatible to VisionFive 2 L=
ite board
      riscv: dts: starfive: Append JH-7110 SoC compatible to VisionFive 2 L=
ite eMMC board

Guodong Xu (6):
      dt-bindings: riscv: update ratified version of h, svinval, svnapot, s=
vpbmt
      dt-bindings: riscv: Add B ISA extension description
      dt-bindings: riscv: Add descriptions for Za64rs, Ziccamoa, Ziccif, an=
d Zicclsm
      dt-bindings: riscv: Add Ssccptr, Sscounterenw, Sstvala, Sstvecd, Ssu6=
4xl
      dt-bindings: riscv: Add Sha and its comprised extensions
      riscv: dts: anlogic: dr1v90: Add "b" ISA extension

Rob Herring (Arm) (1):
      dt-bindings: riscv: extensions: Drop unnecessary select schema

 .../devicetree/bindings/riscv/extensions.yaml      | 194 +++++++++++++++++=
++--
 .../devicetree/bindings/riscv/starfive.yaml        |   1 +
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi            |   5 +-
 arch/riscv/boot/dts/microchip/mpfs.dtsi            |  34 ++--
 .../jh7110-starfive-visionfive-2-lite-emmc.dts     |   2 +-
 .../starfive/jh7110-starfive-visionfive-2-lite.dts |   2 +-
 6 files changed, 210 insertions(+), 28 deletions(-)

--y9QYtxq3CH0Jiq+z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXpyiQAKCRB4tDGHoIJi
0mL0AP9XnBn8s7fse1xTA+LiMd0yiq7XWXQa1byPBpPtYPGMEAD+ItCbzlJraR2W
qGgC+Xs7ceqTHRFrnlMvPYAFA2sxlwo=
=qjQr
-----END PGP SIGNATURE-----

--y9QYtxq3CH0Jiq+z--


--===============7993786812964101940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7993786812964101940==--

