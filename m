Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B126BEB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 15:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGs5yoVCtcBXPdYoqvLWoQVKDRpKMOCGuH4ow68NBKw=; b=tB1eygtwtC08XSmuwg/tp/7ejS
	L5/5Nx3hmg6nekNdhQxKDbvTA+A3PtQ9zSMw2sjI7ul/cSiphbr2FmZf67FocowON5hYkUNjyqHE7
	t8p+xAC11fbYsrqwU8aNloCxLDjMGthFznvbEeNUkIwprIeM8hAlB228UPqFhXui0veQjm8kgingl
	a7oRu9c6jOYV2wsAZRoUCLcOEKBW4K1BzDkZD4/fTU1otf9KxJGRAuaHk/TEVcbkhI2jWs73BQguH
	d+7cHog+xmLwGy9k1OJ463qVFC2QepsN18B/TfI8ycGJygapbTeKUvnNgHlF77dBEFY27yccIR756
	ra9rldvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH4Vb-00GLCE-06;
	Wed, 05 Jul 2023 15:33:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH4VY-00GLBS-2S
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 15:33:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 48181615E3;
	Wed,  5 Jul 2023 15:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933E2C433C7;
	Wed,  5 Jul 2023 15:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688571211;
	bh=H4nxcPZ+ExyS0dhzH3wpIKUGFvb6o0coyoC4wq7eDV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3equ4Eh46rIKbunrT063IKXAta16CtlfRYk/zmvemAukP6KEnqqWpVbQlI6GR3cT
	 W7Rar6QOGieqrEiLH4b8qXqLVRk77BbCjTBtiDvJGTssid6bLdKHYU8f1Tr1QTJOwm
	 APq7qKx5CtMIjbNb3/Xv5UEmZWJM581v2L5HRCAA42DPS+36eP+hBMj/7Nl0XE0riw
	 bIuYi3rnb/3ue18k4oF1k5XIBzqAGgzqyo7yu/duk1yAbR/JkmouCYeIJ6AXE6RPWT
	 V2CrTqTyIONP+efkUyt/Bqun9O8uznc730PZW6YPVPoBXpwVIbC0nRGRyklCVzbbkJ
	 cZW6nJiR745uw==
Date: Wed, 5 Jul 2023 16:33:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v3 0/4] Obtain SMBIOS and ACPI entry from FFI
Message-ID: <20230705-patio-daringly-7fdb62228bc0@spud>
References: <20230705114251.661-1-cuiyunhui@bytedance.com>
 <mhng-48837062-b9f6-4968-be9e-9d3b352be117@palmer-ri-x1c9>
MIME-Version: 1.0
In-Reply-To: <mhng-48837062-b9f6-4968-be9e-9d3b352be117@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_083332_879055_20666060 
X-CRM114-Status: GOOD (  22.55  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, jdelvare@suse.com, aou@eecs.berkeley.edu, weidong.wd@bytedance.com, allen-kh.cheng@mediatek.com, rafael@kernel.org, geshijian@bytedance.com, lpieralisi@kernel.org, yc.hung@mediatek.com, pierre-louis.bossart@linux.intel.com, cuiyunhui@bytedance.com, linux-kernel@vger.kernel.org, rminnich@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, tinghan.shen@mediatek.com, linux-riscv@lists.infradead.org, angelogioacchino.delregno@collabora.com, linux-acpi@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, lenb@kernel.org
Content-Type: multipart/mixed; boundary="===============8479347601080551934=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8479347601080551934==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ihN2fD/aDp+6NAHP"
Content-Disposition: inline


--ihN2fD/aDp+6NAHP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, Jul 05, 2023 at 07:17:29AM -0700, Palmer Dabbelt wrote:
> On Wed, 05 Jul 2023 04:42:47 PDT (-0700), cuiyunhui@bytedance.com wrote:
> > Here's version 3 of patch series.
> >=20
> > V1: The FFI (FDT FIRMWARE INTERFACE) scheme has reached a
> > consensus with the Maintainers.
> > Please refer to:
> > https://patches.linaro.org/project/linux-acpi/patch/20230426034001.16-1=
-cuiyunhui@bytedance.com/
>=20
> From looking at that thread it seems that the consensus is this is a bad
> idea?  Sorry if I'm just missing something...

"consensus" meaning that Ard told them what he was and was not prepared
to accept in common code, and left the decision on what he was not up to
the RISC-V maintainers.

While this version of the series seems to address some of my general
code comments on the v2 (although I have not yet looked more than skin
deep), there are some outstanding, higher level, questions that were
asked on v2 that do not seem to have been answered satisfactorily yet:

- "So, could you please bring this topic for discussion in on the riscv
  tech-brs mailing list (https://lists.riscv.org/g/tech-brs) and get
  agreement?" Sunil has asked this as RVI specs have an interest in
  cross-os booting contracts. See:
  https://lore.kernel.org/linux-riscv/CAEEQ3wnsedWJYEEg8z+3C_HuCca0nD50NGpC=
dU3scxavrrOucA@mail.gmail.com/

- "I am curious how do you handle EFI memory map dependencies." to
  which the answer was "a memory node in DTS can solve it."
  I don't see anything in this version of the patchset that actually
  reads a DTS node when ACPI is enabled. If I am missing some codepath
  that does this, please let point it out. See:
  https://lore.kernel.org/linux-riscv/CAEEQ3wnsedWJYEEg8z+3C_HuCca0nD50NGpC=
dU3scxavrrOucA@mail.gmail.com/

- "I'm not a big fan of adding yet another interface. Have you considered
  doing something like [1]?" where [1] was:
  https://github.com/tianocore/tianocore.github.io/wiki/UefiPayloadPkg
  The response to this question was "This has been discussed many times
  with Ard, Please refer to <v1>". I don't see how this answers the
  question to be honest & Andrew's follow-up question asking for
  clarification went unanswered:
  https://lore.kernel.org/linux-riscv/20230703-6ac90a2de15f1017bc0ced74@ore=
l/
  Jess, Emil and Bjorn have all also commented about you could load a
  small EFI payload from Coreboot. I don't see any responses to those
  questions.

=E8=BF=90=E8=BE=89=E5=B4=94, please try to address all outstanding comments=
 (and give people
a chance to reply to you) before sending new versions.

Cheers,
Conor.

--ihN2fD/aDp+6NAHP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKWNRQAKCRB4tDGHoIJi
0jgsAP0avqf4EpjVplVilCZJJkOs1o6sMzRck0zp6JDWFqPVaAD/SIEJYiB8uJ1t
GwN1FECYebycKrG4plh7eymFH6fTzgc=
=D5GW
-----END PGP SIGNATURE-----

--ihN2fD/aDp+6NAHP--


--===============8479347601080551934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8479347601080551934==--

