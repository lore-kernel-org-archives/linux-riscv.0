Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61254CAC587
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 16:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agIu2EzXikEKWGrsAEg+oPyZV4bP96QY2rryeUl1qpk=; b=4cgobydn0TXnHgkE1o9RA4lLRY
	qb38jF2fE7cDlp9/8Td12nYDjDWybGQrQydYbEpjn+myKxChNJpFNYwZTKtp79uD6r9SrTMVN/dn9
	uUNM2jaRStXp+6FqRFPL6WeAUrTT+deN8HiRobANmmyfw9GLj39O9qU8RI2yiU9DClOTIj29drMA+
	e3dGf5nAPPw1/DGLTwLcDmwRzIbGL6V22jGZAGsh40xSCfk2vqoMqmYNHWG30lBkfzgk8WMzVrtuh
	9oHO70DIr8pzwn+NXc4a+zLm93R2HtFgk+YP4U8GJWpdsPgqpUUeR1NrcfbsFByQq5Eh36nItZ3pe
	0ERYES+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwk5D-00000004BWz-07Of;
	Thu, 11 Sep 2025 16:23:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwk5A-00000004BWG-23lP
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 16:23:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6C0340889;
	Thu, 11 Sep 2025 16:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2208C4CEF0;
	Thu, 11 Sep 2025 16:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757607815;
	bh=9QxraYm5GUXl7u0Oai/gva02p1eqz1FDVLfEUwZUjL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mMEp+KuToFa34pqvXC293dC/bMZBCA2jf39qtrvLFLtDv/jTjek/wWdEUC2zGsdFq
	 0fUFc2eTzSZ/aLutBhS7V4XjRgFqzVDCTyXFbPpfbjFch/3tIMTu6KCUVzM0dLeKiT
	 eLlJGLRWQSG3vnaYejiczvXdACq6Wfh1BrMPuK3lETFnL4PPXHgpkwxL0t204tBo2F
	 nDhZc90oobiuGCV34Vd/yNGKHeJfBnQewGHLrx9iUTFofDOMjZU5/cFqU1SMk+cp2L
	 Q9A0c6e9zs2ca6E9GsAWjvNOBQQJEb7u4XhU5yXM+QtSu3mMe65Ii8V5hwB9/acC1C
	 3ppwPVU7AcoIQ==
Date: Thu, 11 Sep 2025 17:23:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	James Morse <james.morse@arm.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Vasudevan Srinivasan <vasu@rivosinc.com>, guo.wenjia23@zte.com.cn,
	liu.qingtao2@zte.com.cn, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] RISC-V: Detect Ssqosid extension and handle srmcfg
 CSR
Message-ID: <20250911-chaste-rare-fbc3b48a341a@spud>
References: <20250910-ssqosid-v6-17-rc5-v1-0-72cb8f144615@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250910-ssqosid-v6-17-rc5-v1-0-72cb8f144615@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_092336_572331_C6576060 
X-CRM114-Status: GOOD (  27.00  )
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
Content-Type: multipart/mixed; boundary="===============8527382530339738027=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8527382530339738027==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="66oBAo5TwOQvaR8d"
Content-Disposition: inline


--66oBAo5TwOQvaR8d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 11:15:28PM -0700, Drew Fustini wrote:
> This series adds support for the RISC-V Quality-of-Service Identifiers
> (Ssqosid) extension [1] which adds the srmcfg register. This CSR=20
> configures a hart with two identifiers: a Resource Control ID (RCID)
> and a Monitoring Counter ID (MCID). These identifiers accompany each
> request issued by the hart to shared resource controllers.
>=20
> Background on RISC-V QoS:
>=20
> The Ssqosid extension is used by the RISC-V Capacity and Bandwidth
> Controller QoS Register Interface (CBQRI) specification [2]. QoS in
> this context is concerned with shared resources on an SoC such as cache
> capacity and memory bandwidth. Intel and AMD already have QoS features
> on x86 and ARM has MPAM. There is an existing user interface in Linux:
> the resctrl virtual filesystem [3].
>=20
> The srmcfg CSR provides a mechanism by which a software workload (e.g.
> a process or a set of processes) can be associated with an RCID and an
> MCID. CBQRI defines operations to configure resource usage limits, in
> the form of capacity or bandwidth. CBQRI also defines operations to
> configure counters to track the resource utilization.
>=20
> Goal for this series:
>=20
> These two patches are taken from the implementation of resctrl support
> for RISC-V CBQRI. Please refer to the proof-of-concept RFC [4] for
> details on the resctrl implementation. More recently, I have rebased
> the CBQRI support on mainline [5]. Big thanks to James Morse for the
> tireless work to extract resctrl from arch/x86 and make it available
> to all archs.
>=20
> I think it makes sense to first focus on the detection of Ssqosid and
> handling of srmcfg when switching tasks. It has been tested against a
> QEMU branch that implements Ssqosid and CBQRI [6]. A test driver [7]
> was used to set srmcfg for the current process. This allows switch_to
> to be tested without resctrl.
>=20
> Changes from RFC v2:
>  - Rename all instances of the sqoscfg CSR to srmcfg to match the
>    ratified Ssqosid spec
>  - RFC v2: https://lore.kernel.org/linux-riscv/20230430-riscv-cbqri-rfc-v=
2-v2-0-8e3725c4a473@baylibre.com/
>=20
> Changes from RFC v1:
>  - change DEFINE_PER_CPU to DECLARE_PER_CPU for cpu_sqoscfg in qos.h to
>    prevent linking error about multiple definition. Move DEFINE_PER_CPU
>    for cpu_sqoscfg into qos.c
>  - renamed qos prefix in function names to sqoscfg to be less generic
>  - handle sqoscfg the same way has_vector and has_fpu are handled in the
>    vector patch series
>  - RFC v1: https://lore.kernel.org/linux-riscv/20230410043646.3138446-1-d=
fustini@baylibre.com/
>=20
> [1] https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
> [2] https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
> [3] https://docs.kernel.org/filesystems/resctrl.html
> [4] https://lore.kernel.org/linux-riscv/20230419111111.477118-1-dfustini@=
baylibre.com/
> [5] https://github.com/tt-fustini/linux/tree/b4/cbqri-v6-17-rc5
> [6] https://github.com/tt-fustini/qemu/tree/riscv-cbqri-rqsc-pptt
> [7] https://github.com/tt-fustini/linux/tree/ssqosid-v6-17-rc5-debug
>=20
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
> Drew Fustini (2):
>       RISC-V: Detect the Ssqosid extension
>       RISC-V: Add support for srmcfg CSR from Ssqosid ext
>=20
>  MAINTAINERS                        |  6 ++++++
>  arch/riscv/Kconfig                 | 17 ++++++++++++++++
>  arch/riscv/include/asm/csr.h       |  8 ++++++++
>  arch/riscv/include/asm/hwcap.h     |  1 +
>  arch/riscv/include/asm/processor.h |  3 +++
>  arch/riscv/include/asm/qos.h       | 41 ++++++++++++++++++++++++++++++++=
++++++
>  arch/riscv/include/asm/switch_to.h |  3 +++
>  arch/riscv/kernel/cpufeature.c     |  1 +

Why is there no binding change here? Is it not possible to use the
extension on DT systems, or is this an oversight?

--66oBAo5TwOQvaR8d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaML3ggAKCRB4tDGHoIJi
0sDhAP0Y7MCc4EvQQ+4eO1Eg3H3Ujeucf8hI6xyXcdaIGBykMAD9E/9sPo9X2ojz
/FZEoMDL+uhV7qYu4lfS54vhGJOVcAI=
=u1qT
-----END PGP SIGNATURE-----

--66oBAo5TwOQvaR8d--


--===============8527382530339738027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8527382530339738027==--

