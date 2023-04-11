Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E244AC76196
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 14:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFdfoIjtgyl8Z1yevVpknKOI3dtCkYdXCcyVCioLI6w=; b=C1shUVYLvC3aND7B842W5mQ+GE
	5Hn6gpJ3u6bJZXkAOFdjiVKN26fyevzlYbnVkShSVlYFQnPOWNkPy4SdCRjhKx4VVDlkPYtXvzkdE
	YY8z3pW4LeyemyhISwed/4lK7Pw1ZHhqUIQd9MfIgEIQHWU0akc+XmLeEW1gNSIYa+KpeYv95YJyQ
	hez+DrVF8+YEId1RYY/tRea9ktgMHwntMhuKyWzhZNyrur9FqAiGxEiWtdg8EMbvSbVHo/KmxtC9V
	a4K6NPGxupMl3Xj1UpNuiWDnxuN7ZIpS15TUovyKi9FfHxI6j5DcB0qIQOByriG/04Hj8W8xrwzpN
	dciCEy6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEoL-000EDq-0f;
	Tue, 11 Apr 2023 14:17:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEoG-000EBc-2S
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 14:17:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681222645; x=1712758645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l+JgXouqrG+N1yi4JFy3ghvDTExLHywE71wQs1yugEQ=;
  b=dBtxZTbBUIalfTMFw/+z0387kizNDE9gNdwu+S9gOjj88TlxGzbmVpL+
   dSne8RnUpzzsR+qAzauqDCEC7q/fw/p1RyFKHUKKdVrtn4X2I4OaKgv6o
   mT85GtuRIbtVl0XxCkLyfLI0xmIYQFhsjQZKjs10AVZgf3yQnyemd+Vp0
   YR/b4SoCUqwQer725x8QZFNG3uPUfIAD/14yHFwoA494+KGjH5+wjW38D
   i6OPvBCErKGRJHwSgSTRUyEgANWm4bMopX5cEEQjw+QoyE8cW8rKDi4vq
   d1fSobnAoW0W6ptcjATV5mZRCdUGw1YNj4p/tt/8vDKtGEyehvjG0pxL8
   w==;
X-IronPort-AV: E=Sophos;i="5.98,336,1673938800"; 
   d="asc'?scan'208";a="205964165"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Apr 2023 07:17:20 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 11 Apr 2023 07:17:19 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 11 Apr 2023 07:17:14 -0700
Date: Tue, 11 Apr 2023 15:16:58 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v6 0/6] RISC-V Hardware Probing User Interface
Message-ID: <20230411-primate-rice-a5c102f90c6c@wendy>
References: <20230407231103.2622178-1-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230407231103.2622178-1-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_071724_863958_32AEC224 
X-CRM114-Status: GOOD (  32.07  )
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
Cc: heiko@sntech.de, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, Celeste Liu <coelacanthus@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Tobias Klauser <tklauser@distanz.ch>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Jann Horn <jannh@google.com>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Heiko Carstens <hca@linux.ibm.com>, vineetg@rivosinc.com, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Nathan Chancellor <nathan@kernel.org>, Mark Brown <broonie@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, Anup Patel <apatel@ventanamicro.com>, linux-kselftest@vger.kernel.org, slewis@rivosinc.com, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: multipart/mixed; boundary="===============4763124927143414028=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4763124927143414028==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AMh/Lwu23Kj/r0q5"
Content-Disposition: inline

--AMh/Lwu23Kj/r0q5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Evan,

On Fri, Apr 07, 2023 at 04:10:57PM -0700, Evan Green wrote:
>=20
> There's been a bunch of off-list discussions about this, including at
> Plumbers.  The original plan was to do something involving providing an
> ISA string to userspace, but ISA strings just aren't sufficient for a
> stable ABI any more: in order to parse an ISA string users need the
> version of the specifications that the string is written to, the version
> of each extension (sometimes at a finer granularity than the RISC-V
> releases/versions encode), and the expected use case for the ISA string
> (ie, is it a U-mode or M-mode string).  That's a lot of complexity to
> try and keep ABI compatible and it's probably going to continue to grow,
> as even if there's no more complexity in the specifications we'll have
> to deal with the various ISA string parsing oddities that end up all
> over userspace.
>=20
> Instead this patch set takes a very different approach and provides a set
> of key/value pairs that encode various bits about the system.  The big
> advantage here is that we can clearly define what these mean so we can
> ensure ABI stability, but it also allows us to encode information that's
> unlikely to ever appear in an ISA string (see the misaligned access
> performance, for example).  The resulting interface looks a lot like
> what arm64 and x86 do, and will hopefully fit well into something like
> ACPI in the future.
>=20
> The actual user interface is a syscall, with a vDSO function in front of
> it. The vDSO function can answer some queries without a syscall at all,
> and falls back to the syscall for cases it doesn't have answers to.
> Currently we prepopulate it with an array of answers for all keys and
> a CPU set of "all CPUs". This can be adjusted as necessary to provide
> fast answers to the most common queries.
>=20
> An example series in glibc exposing this syscall and using it in an
> ifunc selector for memcpy can be found at [1].
>=20
> I was asked about the performance delta between this and something like
> sysfs. I created a small test program [2] and ran it on a Nezha D1
> Allwinner board. Doing each operation 100000 times and dividing, these
> operations take the following amount of time:
>  - open()+read()+close() of /sys/kernel/cpu_byteorder: 3.8us
>  - access("/sys/kernel/cpu_byteorder", R_OK): 1.3us
>  - riscv_hwprobe() vDSO and syscall: .0094us
>  - riscv_hwprobe() vDSO with no syscall: 0.0091us
>=20
> These numbers get farther apart if we query multiple keys, as sysfs will
> scale linearly with the number of keys, where the dedicated syscall
> stays the same. To frame these numbers, I also did a tight
> fork/exec/wait loop, which I measured as 4.8ms. So doing 4
> open/read/close operations is a delta of about 0.3%, versus a single vDSO
> call is a delta of essentially zero.

Two nits w.r.t. build bot complaints...

On patch 2:
arch/riscv/include/uapi/asm/unistd.h:54:1: warning: initializer overrides p=
rior initialization of this subobject [-Winitializer-overrides]
I think this one is kinda spurious, all of the syscalls complain like
this (and do on arm64 too IIRC). There was a patch from Guo somewhere to
disable -Winitializer-overrides in this case, I should go find out what
happened to it.

On patch 4:
arch/riscv/kernel/cpufeature.c:29:1: warning: symbol '__pcpu_scope_misalign=
ed_access_speed' was not declared. Should it be static?

Probably because cos cpufeature.c doesn't include the header of the same
name... Perhaps Palmer could fix that one up on application?

Cheers,
Conor.


--AMh/Lwu23Kj/r0q5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDVr2gAKCRB4tDGHoIJi
0ohDAP4vO99mP1Aar7XOlBB+xPLraW90a9bDAoMU0IbNlORQPAD/dsc19K8yMIXX
s/fnS3/GuvOs4S1Ty6FJFopQ+2J+HA8=
=0uEU
-----END PGP SIGNATURE-----

--AMh/Lwu23Kj/r0q5--


--===============4763124927143414028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4763124927143414028==--

