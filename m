Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AF1CF885A
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 20:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ff9OpipJsiRpns+NwJCsmIEb2+Opg5DagAp4EwOexPU=; b=qo6qID1iviV1yCxUSX2lJgqxB1
	sa3Djb/RdYZQSt1SGwR0+xI7u+mswlDzgHz/Mn6Thk55Or0OYsxlAEfhaRonMtJ9CCvBZnM5V2WVl
	/Ksajf6xz3z29VSOrd5XO5r8xh6GXWBchtdZFpLsr6DMj/ubLrUTyprViJY5ROqc5IuirGZmlCXBO
	fv+i325r7bOeU8Jn7/+UU4qr4QYZ+MMABKdNZ/M18Y0OHshwf9mV2K6hKkhesQl8Vh/khrtv1UjN9
	kyASoOYfX6wiYy9LyWigZ6VC7V+3Ex0XOmwitegGPpGNPnCyOjz4Hy0RAUIL+kqiPBF+KSOuDNz+/
	6QbctUqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swoV5-0000000E2At-46tJ;
	Fri, 04 Oct 2024 20:02:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swnXi-0000000DoQb-42Mi
	for linux-riscv@bombadil.infradead.org;
	Fri, 04 Oct 2024 19:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qkxm/OHPet7Zjw6QCsjdjVbVeK6Q7QSnuwybW1OxgWc=; b=PLWbTud3czEAxc8cgvWk8LiDtE
	0hU9CFhUnVTv6MUMMXGKDmfrwiGMBrwzsGfM166n1+vj8bj7F0EsHjHMMqrDyxmpCR/kl/IfG/Gj3
	oK3dm1vQtWb2NG+OdRPL2OmMu0cCX5gkwIeO/L97FtVAmpLWrWJiK9SNzOTSGMeypncgllEgLNCHY
	8eGUbxCnmtwoX6YC37CgIEoNsxpPR87mcI8TEG5fYmWsfzOFvfrTTGOLmoxrM7jNim6ioV8BdzpyB
	Rdl4wqM91nDP6fcaEnDgYz/Mu6F/vfl/6pm97J6mSBc8HA62uKVDbYDZk6L98au6UM8lDDMzIBDaH
	7+oV3zVQ==;
Received: from mail-qv1-f43.google.com ([209.85.219.43])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swnXJ-00000003tuk-2Vg7
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 19:00:44 +0000
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6cb27e974ceso15766336d6.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Oct 2024 12:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728068417; x=1728673217;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkxm/OHPet7Zjw6QCsjdjVbVeK6Q7QSnuwybW1OxgWc=;
        b=K1ZK4ebX68y4CSCQ3phSN9ndtG3J3zXGxkLON8iGiUMgfE/nWC1tr7AFeSp0S/2jmP
         bnj+VTds4BSFbV5euhyYFpNk4P4+Gak2oc/dWFc7cLiKWo7fNQzZ9BAzWmq/0wJVGeDL
         p1Prm43psUalvqNMViBKMOhGiksFB5/JQqUbUnkcllZG0cf6sOCtXznYNc1xEsfJJee2
         QugOwBNOiSKGZAAU3To+wtiRqCIfpkJZAejlDIasNx2BiTiOsb05pNxs54udRmC/fIes
         qmbLGtLphyJOjbQKOGtL0zdpqtFI68aZwuuOn5SIiK3RPggZlRfuKEDuls5g2l7+bnLv
         zGYA==
X-Forwarded-Encrypted: i=1; AJvYcCUpYB2bP9ru8+ZReRjC84cy3+L5E3BrMqq74e+NDOUxKgAoMx6BnEquBZyyZ5T6Gylwe9x02tqwuAlvhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfuZFuCf7R9nExGXm3Uk5OyqZBR5taVDNgfml4rQHl7BzlWGzK
	Bgc4w8yRXGB5nIjVcRiz1wBBq11liqbdUyU3F/N67f57ZDr5Lv2632i5fQ==
X-Google-Smtp-Source: AGHT+IHwmWhUNZLoKBZBzrHAuiK/CRzNPe6zvX+k5dVAbJhsyyQHmJcbtMkjFYFKuTouPQicMUcpxw==
X-Received: by 2002:a05:6214:5503:b0:6c3:5833:260f with SMTP id 6a1803df08f44-6cb9a4eafe7mr45102326d6.39.1728068416859;
        Fri, 04 Oct 2024 12:00:16 -0700 (PDT)
Received: from maniforge (c-76-141-129-107.hsd1.il.comcast.net. [76.141.129.107])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cba47512bdsm1688556d6.88.2024.10.04.12.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 12:00:15 -0700 (PDT)
Date: Fri, 4 Oct 2024 14:00:13 -0500
From: David Vernet <void@manifault.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] selftests: sched_ext: Add sched_ext as proper selftest
 target
Message-ID: <20241004190013.GB56767@maniforge>
References: <20241004094247.795385-1-bjorn@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241004094247.795385-1-bjorn@kernel.org>
User-Agent: Mutt/2.2.13 (00d56288) (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_200038_682507_FDBE7E89 
X-CRM114-Status: GOOD (  18.88  )
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
Content-Type: multipart/mixed; boundary="===============4789932546072435347=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4789932546072435347==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xuk+u8UxomGOBld1"
Content-Disposition: inline


--xuk+u8UxomGOBld1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2024 at 11:42:46AM +0200, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>

Thanks a lot Bj=F6rn for working on this.

> The sched_ext selftests is missing proper cross-compilation support, a
> proper target entry, and out-of-tree build support.
>=20
> When building the kselftest suite, e.g.:
>=20
>   make ARCH=3Driscv CROSS_COMPILE=3Driscv64-linux-gnu- \
>     SKIP_TARGETS=3D"" O=3D/output/foo -C tools/testing/selftests install
>=20
> The expectation is that the sched_ext is included, cross-built, and
> placed into /output/foo.
>=20
> Add CROSS_COMPILE, OUTPUT, and TARGETS support to the sched_ext
> selftest.
>=20
> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> ---
>  tools/testing/selftests/Makefile           |  1 +
>  tools/testing/selftests/sched_ext/Makefile | 59 +++++++++++++++-------
>  2 files changed, 41 insertions(+), 19 deletions(-)
>=20
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/M=
akefile
> index b38199965f99..20ee8a0b795c 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -88,6 +88,7 @@ TARGETS +=3D rlimits
>  TARGETS +=3D rseq
>  TARGETS +=3D rtc
>  TARGETS +=3D rust
> +TARGETS +=3D sched_ext
>  TARGETS +=3D seccomp
>  TARGETS +=3D sgx
>  TARGETS +=3D sigaltstack
> diff --git a/tools/testing/selftests/sched_ext/Makefile b/tools/testing/s=
elftests/sched_ext/Makefile
> index 0754a2c110a1..66467a99184d 100644
> --- a/tools/testing/selftests/sched_ext/Makefile
> +++ b/tools/testing/selftests/sched_ext/Makefile
> @@ -13,14 +13,8 @@ LLVM_SUFFIX :=3D $(LLVM)
>  endif
> =20
>  CC :=3D $(LLVM_PREFIX)clang$(LLVM_SUFFIX) $(CLANG_FLAGS) -fintegrated-as
> -else
> -CC :=3D gcc

Given that we're including ../lib.mk, can we just get rid of this whole blo=
ck?

>  endif # LLVM
> =20
> -ifneq ($(CROSS_COMPILE),)
> -$(error CROSS_COMPILE not supported for scx selftests)
> -endif # CROSS_COMPILE
> -
>  CURDIR :=3D $(abspath .)
>  REPOROOT :=3D $(abspath ../../../..)
>  TOOLSDIR :=3D $(REPOROOT)/tools
> @@ -34,18 +28,39 @@ GENHDR :=3D $(GENDIR)/autoconf.h
>  SCXTOOLSDIR :=3D $(TOOLSDIR)/sched_ext
>  SCXTOOLSINCDIR :=3D $(TOOLSDIR)/sched_ext/include
> =20
> -OUTPUT_DIR :=3D $(CURDIR)/build
> +ifeq (,$(OUTPUT))
> +OUTPUT :=3D $(CURDIR)/build
> +RUNNER_DIR :=3D $(CURDIR)
> +else
> +OUTPUT_DIR :=3D $(OUTPUT)

This breaks if you use make from the selftests/sched_ext directory.  AFAICT=
 it
looks like OUTPUT is always set in ../lib.mk, so we always go to the OUTPUT=
_DIR
:=3D $(CURDIR) branch. Because of that, running `make clean` will delete the
whole sched_ext selftests directory. Also, did you mean for the first branc=
h to
be:

+OUTPUT_DIR :=3D $(CURDIR)/build

as opposed to:

> +OUTPUT :=3D $(CURDIR)/build

[...]

Thanks,
David

--xuk+u8UxomGOBld1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRBxU1So5MTLwphjdFZ5LhpZcTzZAUCZwA7PQAKCRBZ5LhpZcTz
ZPoZAP9bSuKYYs994wmUp8WMfOXDiFGe8xsav/5htQkIbRVslwD+OudAqVtsa2Qe
PbwPgF0KtahM0Aa0bMGJ3l9vyX7aTAw=
=t/6n
-----END PGP SIGNATURE-----

--xuk+u8UxomGOBld1--


--===============4789932546072435347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4789932546072435347==--

