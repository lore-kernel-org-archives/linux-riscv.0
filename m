Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF07CFB448
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 15:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxHW6ukU20r0M2pfSTkmHycNr8zjGfWvMJhM6gqQp9g=; b=0t/bMetHaL0AKs3wved8Y1muyV
	uk2uOdy64uTk0Yf2Fdmg7vCVZYKdJMlkSUP2tuUXK7zS30fcPa0ex/bG+59VksWyr03luf9M8Tx5O
	cXS5fD9Pglg/imiT+5STKn96TCL9lE4iwNh1pD7f0u/WwUXC+9AxvjQrCIJPZxs0OVghV0UmjZgmJ
	Y1za8EWt0255sazaAAmbri6GirwzHxga7rBKp7d9Wj7BjOvLOmSYmmnVrj5TvsxLHGzwlg9vZ7D7r
	aQfR0T/A4NV9Q5Tc2vrxeRF7/s7eqmxJFhZxiK+4aVvRJtoZjBMlVamhaQuN5miyky1y775zCNUMV
	ac0b2oXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxpv9-000000030Ro-2ZfZ;
	Mon, 07 Oct 2024 15:45:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxpte-0000000302r-0cWY
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 15:43:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 569C95C5745;
	Mon,  7 Oct 2024 15:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE75DC4CEC7;
	Mon,  7 Oct 2024 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728315821;
	bh=AhsZq1BsiII0roJalW8IMhJQxXPA+0/dIC/qxDCsip8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b9adUiYl58rRZbT3kDUBY17RMvFVmouBxn0VmyNNzJWlJRSW/CMXs8+fGBEbXejri
	 4qvJulkvLjZSGMjWVCfg2JE6gFEfyEx6vXkX0TD/hKV+WiPfwyWSvK0hcJZOVyOqvB
	 cixv2XPtCiH5gV+QbdzfbCmQb8JnJhzlwtapr6T2ZA9PuU/2VW/w/uGKh3daOjqvcB
	 /vtTRvaZ9T5oR0UYUOHFMxHGbKHWUTIr3hC5gc85EiEJci8myOCNZdfXoCgr1N7SVy
	 W2jzN4bKPbf30tk3F2HquhENaQbSkq6PZfzqyFZAl2PIas00qRs0ep2XUXUkyAb2yj
	 Kcdlb9C8Sz9AQ==
Date: Mon, 7 Oct 2024 16:43:38 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH v2] selftests: sched_ext: Add sched_ext as proper
 selftest target
Message-ID: <ZwQBqlG6MShCkNrU@finisterre.sirena.org.uk>
References: <20241007073133.989166-1-bjorn@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241007073133.989166-1-bjorn@kernel.org>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_084342_298337_1629BD1A 
X-CRM114-Status: GOOD (  16.11  )
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
Content-Type: multipart/mixed; boundary="===============7537434184243538197=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7537434184243538197==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RQTX0C3QpGBx/Yar"
Content-Disposition: inline


--RQTX0C3QpGBx/Yar
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2024 at 09:31:32AM +0200, Bj=F6rn T=F6pel wrote:

> When building the kselftest suite, e.g.:

>   make ARCH=3Driscv CROSS_COMPILE=3Driscv64-linux-gnu- \
>     SKIP_TARGETS=3D"" O=3D/output/foo -C tools/testing/selftests install

> The expectation is that the sched_ext is included, cross-built, and
> placed into /output/foo.

When building for arm64 with this applied on top of mainline or -next
I'm seeing:

   make ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu- -C tools/testing/se=
lftests TARGETS=3Dsched_ext SKIP_TARGETS=3D"

give

  CLNG-BPF create_dsq.bpf.o
In file included from create_dsq.bpf.c:9:
/home/broonie/git/linux/tools/sched_ext/include/scx/common.bpf.h:33:17: err=
or: use of undeclared identifier 'SCX_DSQ_FLAG_BUILTIN'
   33 |         _Static_assert(SCX_DSQ_FLAG_BUILTIN,
      |                        ^

and more (my system clang is clang 20).  It's also failing with a native
x86_64 build in the same way.  I've run "make headers_install", it looks
like clang is not getting told about the copy of the headers installed
in ./usr/include:

clang -g -D__TARGET_ARCH_x86 -mlittle-endian -I/home/broonie/git/linux/tool=
s/testing/selftests/sched_ext/include -I/home/broonie/git/linux/tools/testi=
ng/selftests/sched_ext/include/bpf-compat -I/home/broonie/git/linux/tools/t=
esting/selftests/sched_ext/build/include -I/home/broonie/git/linux/tools/in=
clude/uapi -I/home/broonie/git/linux/tools/sched_ext/include -I/home/brooni=
e/git/linux/include -idirafter /usr/lib/llvm-20/lib/clang/20/include -idira=
fter /usr/local/include -idirafter /usr/include/x86_64-linux-gnu -idirafter=
 /usr/include  -Wall -Wno-compare-distinct-pointer-types -Wno-incompatible-=
function-pointer-types -O2 -mcpu=3Dv3 -target bpf -c create_dsq.bpf.c -o /h=
ome/broonie/git/linux/tools/testing/selftests/sched_ext/build/obj/sched_ext=
/create_dsq.bpf.o

> Add CROSS_COMPILE, OUTPUT, and TARGETS support to the sched_ext
> selftest. Also, remove some variables that were unused by the
> Makefile.

> +ifneq ($(CROSS_COMPILE),)
> +DEFAULT_BPFTOOL :=3D $(OUTPUT_DIR)/host/sbin/bpftool
> +HOST_OBJ_DIR :=3D $(OBJ_DIR)/host/bpftool
> +HOST_LIBBPF_OUTPUT :=3D $(OBJ_DIR)/host/libbpf/
> +HOST_LIBBPF_DESTDIR :=3D $(OUTPUT_DIR)/host/
> +HOST_DESTDIR :=3D $(OUTPUT_DIR)/host/
> +else
> +DEFAULT_BPFTOOL :=3D $(OUTPUT_DIR)/sbin/bpftool
> +HOST_OBJ_DIR :=3D $(OBJ_DIR)/bpftool
> +HOST_LIBBPF_OUTPUT :=3D $(OBJ_DIR)/libbpf/
> +HOST_LIBBPF_DESTDIR :=3D $(OUTPUT_DIR)/
> +HOST_DESTDIR :=3D $(OUTPUT_DIR)/
> +endif

This won't detect a cross compile when building using LLVM as that
doesn't need to set CROSS_COMPILE, it can use the same binaries for all
targets.  There's runes in the Makefile for the mm selftests for
identifying the target architecture, though actually I'm wondering if
it's worth just always building the host copy and never having to worry
if the target build is a cross build or not?  It's obvious overhead in
the native case though if we actually need the target copy.

--RQTX0C3QpGBx/Yar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcEAakACgkQJNaLcl1U
h9An1wf9HtCpL0qKu0Mw8tfGrwi5hcoQz4t6Hk0itley1H29WYnc2QdzBCtkJ23x
XqySN35gxSHfydFAIZmO7/OZA6pBn5Ip1hp0F4BL7HpwsV5ee4mUI3DryMAkRIYX
DZGQRcUPa+638ozn/Q6QPgfBt61GlgvJQJJKkF3tzuG12ky7+9flumeFjogWkCoB
FSA6Cmh3rrDbSEuCaSeylc60Xq0vaxZmj3xTtwuoAvQbdD+JI9b5PTA3PYgrL8JR
rG/Msmf/++9rlZK3zn9O0U/H4OXt9J6A2BEd+79oc2ZVLnfzi8ajqH/NG+XkZZBC
hibi6Md/pXB2ZNbvaYQw+iRkck7Tlg==
=xhLq
-----END PGP SIGNATURE-----

--RQTX0C3QpGBx/Yar--


--===============7537434184243538197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7537434184243538197==--

