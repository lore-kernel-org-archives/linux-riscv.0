Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E29C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 21:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWqrCA2iwJfJHAGgaHJvuf2w8mhxjHFR1u41qGtSn+M=; b=FUEycytWukTG73Eadpfot+ZobB
	eLm+MhY9OeKf9VfsQjI5e0Caa0RuGTWEsoNc38cR+qw7YyXATTCEyRPP6O8Yg3ECVFyLH90OFYXjc
	jIZlmNSfHnpoWPr3cqRR0Z6MM+R3+yBmbNcsZ1udZorw2ZU+OHY5dIk5LjcsBmJwGMWcv8g4cgdv6
	wclBxBWIKWFemF0UHJtQgI+jhOQaYGaYhObnPjIsG/gPtB6MHZqW0gMYxBNu0hpJ8fDB9h1LTc/ss
	BLkjnFuO1aij+L3iQnuxIMeQTZoyHOsz0OzhJ08SdQ0TgcS13MESnagD/5BHnPijd4sllcYaLf6WQ
	dJU8iMLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZIjq-00F8gK-08; Mon, 06 Mar 2023 21:51:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZIjm-00F8dv-6s
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 21:51:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6D9BEB81128;
	Mon,  6 Mar 2023 21:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A272EC433D2;
	Mon,  6 Mar 2023 21:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678139475;
	bh=ZrJmhyMhkUzjCOjMoKs2veezt+FJkmiy4IanCPeTgjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FrdQhuBdaJwRseYaFYQvhZbNqmWMvL6JcWBgGrru0xtmfApoh9bVgDL91QyYtJu46
	 H0oW9+6Gb41u6zMft3CmOoGewTA/b511tB3pw+UFtseZhnAqGvLzrt540ZdkhRiX2Z
	 /A9jIQE3w/wZ/L7NHoa7CpXtnJf76tVy0GG5k2vGsDJT/jkLk4W2i7VrLHSZzae8dq
	 0dyXmg+0+BvTiMSGvNIsWIjKWXQtTgJYxbQ+92QO/94c4TZD2PS/IzkWFhz/mUqKLo
	 nOVVL59sstJYGawKikg5TZhc7C97QX0pzqe7PKg2o8jrSmz8QZcsfArVqle3tjmRNU
	 x6ME9yGFkfgpQ==
Date: Mon, 6 Mar 2023 21:51:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>, llvm@lists.linux.dev
Subject: Re: [PATCH V3 00/20] Add basic ACPI support for RISC-V
Message-ID: <16007014-c5f2-4b07-baec-e19952236aa5@spud>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_135118_575406_0DFC3F7F 
X-CRM114-Status: GOOD (  15.60  )
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
Content-Type: multipart/mixed; boundary="===============3496363560233864826=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3496363560233864826==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="27Tfh9qw3tZtvGh2"
Content-Disposition: inline


--27Tfh9qw3tZtvGh2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Sunil,

On Fri, Mar 03, 2023 at 07:06:27PM +0530, Sunil V L wrote:
> This patch series enables the basic ACPI infrastructure for RISC-V.
> Supporting external interrupt controllers is in progress and hence it is
> tested using poll based HVC SBI console and RAM disk.
>=20
> The first patch in this series is one of the patch from Jisheng's
> series [1] which is not merged yet. This patch is required to support
> ACPI since efi_init() which gets called before sbi_init() can enable
> static branches and hits a panic.
>=20
> Patch 2 and 3 are ACPICA patches which are not merged into acpica yet
> but a PR is raised already.
>=20
> Below are two ECRs approved by ASWG.
> RINTC - https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l=
/view
> RHCT - https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/=
view
>=20
> The series depends on Anup's IPI improvement series [2].
>=20
> [1] https://lore.kernel.org/all/20220821140918.3613-1-jszhang@kernel.org/
> [2] https://lore.kernel.org/lkml/20230103141221.772261-7-apatel@ventanami=
cro.com/T/

Building a clang-15 allmodconfig (I didn't try gcc) with this series, and
Anup's IPI bits, results in a broken build, due to failings in cmpxchg:

/stuff/linux/drivers/platform/surface/aggregator/controller.c:61:25: error:=
 call to __compiletime_assert_335 declared with 'error' attribute: BUILD_BU=
G failed
        while (unlikely((ret =3D cmpxchg(&c->value, old, new)) !=3D old)) {
                               ^
/stuff/linux/include/linux/atomic/atomic-instrumented.h:1916:2: note: expan=
ded from macro 'cmpxchg'
        arch_cmpxchg(__ai_ptr, __VA_ARGS__); \
        ^
/stuff/linux/arch/riscv/include/asm/cmpxchg.h:344:23: note: expanded from m=
acro 'arch_cmpxchg'
        (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
                             ^
/stuff/linux/arch/riscv/include/asm/cmpxchg.h:335:3: note: expanded from ma=
cro '__cmpxchg'
                BUILD_BUG();                                            \
                ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=3D0 =
to see all)
/stuff/linux/include/linux/compiler_types.h:385:2: note: expanded from macr=
o '_compiletime_assert'
        __compiletime_assert(condition, msg, prefix, suffix)
        ^
/stuff/linux/include/linux/compiler_types.h:378:4: note: expanded from macr=
o '__compiletime_assert'
                        prefix ## suffix();                             \
                        ^
<scratch space>:69:1: note: expanded from here
__compiletime_assert_335
^
/stuff/linux/drivers/platform/surface/aggregator/controller.c:61:25: error:=
 call to __compiletime_assert_335 declared with 'error' attribute: BUILD_BU=
G failed
/stuff/linux/include/linux/atomic/atomic-instrumented.h:1916:2: note: expan=
ded from macro 'cmpxchg'
        arch_cmpxchg(__ai_ptr, __VA_ARGS__); \
        ^
/stuff/linux/arch/riscv/include/asm/cmpxchg.h:344:23: note: expanded from m=
acro 'arch_cmpxchg'
        (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
                             ^
/stuff/linux/arch/riscv/include/asm/cmpxchg.h:335:3: note: expanded from ma=
cro '__cmpxchg'
                BUILD_BUG();                                            \
                ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=3D0 =
to see all)
/stuff/linux/include/linux/compiler_types.h:385:2: note: expanded from macr=
o '_compiletime_assert'
        __compiletime_assert(condition, msg, prefix, suffix)
        ^
/stuff/linux/include/linux/compiler_types.h:378:4: note: expanded from macr=
o '__compiletime_assert'
                        prefix ## suffix();                             \
                        ^
<scratch space>:69:1: note: expanded from here
__compiletime_assert_335
^
/stuff/linux/drivers/platform/surface/aggregator/controller.c:61:25: error:=
 call to __compiletime_assert_335 declared with 'error' attribute: BUILD_BU=
G failed
/stuff/linux/include/linux/atomic/atomic-instrumented.h:1916:2: note: expan=
ded from macro 'cmpxchg'
        arch_cmpxchg(__ai_ptr, __VA_ARGS__); \
        ^
/stuff/linux/arch/riscv/include/asm/cmpxchg.h:344:23: note: expanded from m=
acro 'arch_cmpxchg'
        (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
                             ^
/stuff/linux/arch/riscv/include/asm/cmpxchg.h:335:3: note: expanded from ma=
cro '__cmpxchg'
                BUILD_BUG();                                            \
                ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=3D0 =
to see all)
/stuff/linux/include/linux/compiler_types.h:385:2: note: expanded from macr=
o '_compiletime_assert'
        __compiletime_assert(condition, msg, prefix, suffix)
        ^
/stuff/linux/include/linux/compiler_types.h:378:4: note: expanded from macr=
o '__compiletime_assert'
                        prefix ## suffix();                             \
                        ^
<scratch space>:69:1: note: expanded from here
__compiletime_assert_335
^
/stuff/linux/drivers/platform/surface/aggregator/controller.c:61:25: error:=
 call to __compiletime_assert_335 declared with 'error' attribute: BUILD_BU=
G failed
/stuff/linux/include/linux/atomic/atomic-instrumented.h:1916:2: note: expan=
ded from macro 'cmpxchg'
        arch_cmpxchg(__ai_ptr, __VA_ARGS__); \
        ^
/stuff/linux/arch/riscv/include/asm/cmpxchg.h:344:23: note: expanded from m=
acro 'arch_cmpxchg'
        (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
                             ^
/stuff/linux/arch/riscv/include/asm/cmpxchg.h:335:3: note: expanded from ma=
cro '__cmpxchg'
                BUILD_BUG();                                            \
                ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=3D0 =
to see all)
/stuff/linux/include/linux/compiler_types.h:385:2: note: expanded from macr=
o '_compiletime_assert'
        __compiletime_assert(condition, msg, prefix, suffix)
        ^
/stuff/linux/include/linux/compiler_types.h:378:4: note: expanded from macr=
o '__compiletime_assert'
                        prefix ## suffix();                             \
                        ^
<scratch space>:69:1: note: expanded from here
__compiletime_assert_335
^
/stuff/linux/drivers/platform/surface/aggregator/controller.c:61:25: error:=
 call to __compiletime_assert_335 declared with 'error' attribute: BUILD_BU=
G failed
/stuff/linux/include/linux/atomic/atomic-instrumented.h:1916:2: note: expan=
ded from macro 'cmpxchg'
        arch_cmpxchg(__ai_ptr, __VA_ARGS__); \
        ^
/stuff/linux/arch/riscv/include/asm/cmpxchg.h:344:23: note: expanded from m=
acro 'arch_cmpxchg'
        (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
                             ^
/stuff/linux/arch/riscv/include/asm/cmpxchg.h:335:3: note: expanded from ma=
cro '__cmpxchg'
                BUILD_BUG();                                            \
                ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=3D0 =
to see all)
/stuff/linux/include/linux/compiler_types.h:385:2: note: expanded from macr=
o '_compiletime_assert'
        __compiletime_assert(condition, msg, prefix, suffix)
        ^
/stuff/linux/include/linux/compiler_types.h:378:4: note: expanded from macr=
o '__compiletime_assert'
                        prefix ## suffix();                             \
                        ^
<scratch space>:69:1: note: expanded from here
__compiletime_assert_335
^
/stuff/linux/drivers/platform/surface/aggregator/controller.c:61:25: error:=
 call to __compiletime_assert_335 declared with 'error' attribute: BUILD_BU=
G failed
/stuff/linux/include/linux/atomic/atomic-instrumented.h:1916:2: note: expan=
ded from macro 'cmpxchg'
        arch_cmpxchg(__ai_ptr, __VA_ARGS__); \
        ^
/stuff/linux/arch/riscv/include/asm/cmpxchg.h:344:23: note: expanded from m=
acro 'arch_cmpxchg'
        (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
                             ^
/stuff/linux/arch/riscv/include/asm/cmpxchg.h:335:3: note: expanded from ma=
cro '__cmpxchg'
                BUILD_BUG();                                            \
                ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=3D0 =
to see all)
/stuff/linux/include/linux/compiler_types.h:385:2: note: expanded from macr=
o '_compiletime_assert'
        __compiletime_assert(condition, msg, prefix, suffix)
        ^
/stuff/linux/include/linux/compiler_types.h:378:4: note: expanded from macr=
o '__compiletime_assert'
                        prefix ## suffix();                             \
                        ^
<scratch space>:69:1: note: expanded from here
__compiletime_assert_335
^
/stuff/linux/drivers/platform/surface/aggregator/controller.c:61:25: error:=
 call to __compiletime_assert_335 declared with 'error' attribute: BUILD_BU=
G failed
/stuff/linux/include/linux/atomic/atomic-instrumented.h:1916:2: note: expan=
ded from macro 'cmpxchg'
        arch_cmpxchg(__ai_ptr, __VA_ARGS__); \
        ^
/stuff/linux/arch/riscv/include/asm/cmpxchg.h:344:23: note: expanded from m=
acro 'arch_cmpxchg'
        (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
                             ^
/stuff/linux/arch/riscv/include/asm/cmpxchg.h:335:3: note: expanded from ma=
cro '__cmpxchg'
                BUILD_BUG();                                            \
                ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=3D0 =
to see all)
/stuff/linux/include/linux/compiler_types.h:385:2: note: expanded from macr=
o '_compiletime_assert'
        __compiletime_assert(condition, msg, prefix, suffix)
        ^
/stuff/linux/include/linux/compiler_types.h:378:4: note: expanded from macr=
o '__compiletime_assert'
                        prefix ## suffix();                             \
                        ^
<scratch space>:69:1: note: expanded from here
__compiletime_assert_335
^
/stuff/linux/drivers/platform/surface/aggregator/controller.c:61:25: error:=
 call to __compiletime_assert_335 declared with 'error' attribute: BUILD_BU=
G failed
/stuff/linux/include/linux/atomic/atomic-instrumented.h:1916:2: note: expan=
ded from macro 'cmpxchg'
        arch_cmpxchg(__ai_ptr, __VA_ARGS__); \
        ^
/stuff/linux/arch/riscv/include/asm/cmpxchg.h:344:23: note: expanded from m=
acro 'arch_cmpxchg'
        (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
                             ^
/stuff/linux/arch/riscv/include/asm/cmpxchg.h:335:3: note: expanded from ma=
cro '__cmpxchg'
                BUILD_BUG();                                            \
                ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=3D0 =
to see all)
/stuff/linux/include/linux/compiler_types.h:385:2: note: expanded from macr=
o '_compiletime_assert'
        __compiletime_assert(condition, msg, prefix, suffix)
        ^
/stuff/linux/include/linux/compiler_types.h:378:4: note: expanded from macr=
o '__compiletime_assert'
                        prefix ## suffix();                             \
                        ^
<scratch space>:69:1: note: expanded from here
__compiletime_assert_335
^
/stuff/linux/drivers/platform/surface/aggregator/controller.c:61:25: error:=
 call to __compiletime_assert_335 declared with 'error' attribute: BUILD_BU=
G failed
/stuff/linux/include/linux/atomic/atomic-instrumented.h:1916:2: note: expan=
ded from macro 'cmpxchg'
        arch_cmpxchg(__ai_ptr, __VA_ARGS__); \
        ^
/stuff/linux/arch/riscv/include/asm/cmpxchg.h:344:23: note: expanded from m=
acro 'arch_cmpxchg'
        (__typeof__(*(ptr))) __cmpxchg((ptr),                           \
                             ^
/stuff/linux/arch/riscv/include/asm/cmpxchg.h:335:3: note: expanded from ma=
cro '__cmpxchg'
                BUILD_BUG();                                            \
                ^
note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=3D0 =
to see all)
/stuff/linux/include/linux/compiler_types.h:385:2: note: expanded from macr=
o '_compiletime_assert'
        __compiletime_assert(condition, msg, prefix, suffix)
        ^
/stuff/linux/include/linux/compiler_types.h:378:4: note: expanded from macr=
o '__compiletime_assert'
                        prefix ## suffix();                             \
                        ^
<scratch space>:69:1: note: expanded from here
__compiletime_assert_335
^
9 errors generated.

--27Tfh9qw3tZtvGh2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAZgTQAKCRB4tDGHoIJi
0uBUAPwNyD6kqs6UahOkel8ihw22Ieds7rMpfQendImfuHvc+gD+N829uA3Fy+uc
i1UvPIQcaMWNUL2BVc8u+oJ4lyYh9Qc=
=APgi
-----END PGP SIGNATURE-----

--27Tfh9qw3tZtvGh2--


--===============3496363560233864826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3496363560233864826==--

