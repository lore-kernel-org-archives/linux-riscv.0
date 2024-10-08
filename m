Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184A1CEFC56
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 20:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YI5/1nvrhPkiuTZ5FWYXsa46Msql+XZX37STUnVhvTU=; b=i58fC1tOTgBAgJ+lyRdo4lEI11
	5+CNXig7Y3IW+x0vqkoytHpchND1DHGlPzqc0gS7jvlYFmsxj7SdqXv7hr7BsdN3a4wvVBgcG//pB
	KogxYIVep5SKZHmoBxHzpcSBv1udOWnSsaHO2KevxoSnjiNHzqkX5FJNfhxlQcFCwPoELunJjWhv6
	trKNMbNvoS/BraRH7C23T8aecgSHawJAe/C7mh7YmCmXJjfMvbJwCDtFDW5Sa8iMPLU1nbzoUMYHR
	hVntw8OpW7gVa9Z291gi3Y/nlXCdxk35OkbSfXxrN4O88LNkI4WoCuvqYIsqGPv4YRuGXCecSrhOb
	RquMxENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syGzV-0000000753U-14Tm;
	Tue, 08 Oct 2024 20:39:33 +0000
Received: from mail-yw1-f178.google.com ([209.85.128.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syGyA-000000074mN-2HsR
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 20:38:12 +0000
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e23aa29408so2530047b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 13:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728419889; x=1729024689;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLQWcbSeACwcvaqhHPxSN1w4SwChShyv5tLpM/fC9Yk=;
        b=DzFJHTsmeIUPe9xE4yp27RDSlmM95zguUo4vYU5qnqxfhty6KFapc1tCBd0LSXBeaI
         ivRvtmm+h9w2S5ZTouTBhTgSuMVgEOoM9omOhB0sPnI2CIfi5vas7SwAxqe0n6Z56y8Q
         UU3EazjkkBofo1vPQBMonb9te7EOBQh9aGJI3iWthNg6B1cizShPUloTAXTgQ3ThFdzw
         ih+m0WWQB25J/K39oWz4LcxKz6ryGbvpYlzGD6Ix8U67aoiGVob5LrExxyij/a/cCOEH
         XW0Am2PBa7N667jSzpJuXW5FkXNf8Krzc712ZatPYS1Le3euivY1iNGh7i9TcWdkb4vL
         zwmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK7DM2hUobHgbDY035dMG96RAMQCVf2GK3REsrcREr8NJejAGzXALQ2mgnumlAMLOy/WgMgpPnOmInDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwM6wXv8ZkJG5bmS2DeSVPGx7+r1ItXHr5WPGTtN3DC2QSD0GPD
	9PZNObDc5+K/dG9GGtg7W01kzBayQknhM/3YeWt4rhekFj+uFbzX
X-Google-Smtp-Source: AGHT+IH/wdL65vivp7PfrfQVA0fDIsUhc54pvWm6lDQKZwpUQZzp6PARgfrfCuhPvLMyd4Pc0FL/nQ==
X-Received: by 2002:a05:690c:f90:b0:6dd:ddf6:90aa with SMTP id 00721157ae682-6e3221994f1mr3766917b3.5.1728419888888;
        Tue, 08 Oct 2024 13:38:08 -0700 (PDT)
Received: from maniforge (c-76-141-129-107.hsd1.il.comcast.net. [76.141.129.107])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2d927f2ecsm15876017b3.45.2024.10.08.13.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 13:38:08 -0700 (PDT)
Date: Tue, 8 Oct 2024 15:38:05 -0500
From: David Vernet <void@manifault.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH v3] selftests: sched_ext: Add sched_ext as proper
 selftest target
Message-ID: <20241008203805.GA11867@maniforge>
References: <20241008153519.1270862-1-bjorn@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241008153519.1270862-1-bjorn@kernel.org>
User-Agent: Mutt/2.2.13 (00d56288) (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_133810_606976_07B66305 
X-CRM114-Status: GOOD (  14.24  )
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
Content-Type: multipart/mixed; boundary="===============4061745244204324326=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4061745244204324326==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FfRfl7W5WtKub8Po"
Content-Disposition: inline


--FfRfl7W5WtKub8Po
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2024 at 05:35:18PM +0200, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
>=20
> The sched_ext selftests is missing proper cross-compilation support, a
> proper target entry, and out-of-tree build support.
>=20
> When building the kselftest suite, e.g.:
>=20
>   make ARCH=3Driscv CROSS_COMPILE=3Driscv64-linux-gnu-  \
>     TARGETS=3Dsched_ext SKIP_TARGETS=3D"" O=3D/output/foo \
>     -C tools/testing/selftests install
>=20
> or:
>=20
>   make ARCH=3Darm64 LLVM=3D1 TARGETS=3Dsched_ext SKIP_TARGETS=3D"" \
>     O=3D/output/foo -C tools/testing/selftests install
>=20
> The expectation is that the sched_ext is included, cross-built, the
> correct toolchain is picked up, and placed into /output/foo.
>=20
> In contrast to the BPF selftests, the sched_ext suite does not use
> bpftool at test run-time, so it is sufficient to build bpftool for the
> build host only.
>=20
> Add ARCH, CROSS_COMPILE, OUTPUT, and TARGETS support to the sched_ext
> selftest. Also, remove some variables that were unused by the
> Makefile.
>=20
> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>

Thanks for the improvements!

Acked-by: David Vernet <void@manifault.com>

--FfRfl7W5WtKub8Po
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRBxU1So5MTLwphjdFZ5LhpZcTzZAUCZwWYLQAKCRBZ5LhpZcTz
ZDTXAQDSgn0IREF4p0liOsz0dF24wvDTIcPiy6zuQUC34R1nsAD9GP2nfWYYpCdx
qskgLUrRlX6L0gBF46rOzWbDdyOGFgQ=
=gM1q
-----END PGP SIGNATURE-----

--FfRfl7W5WtKub8Po--


--===============4061745244204324326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4061745244204324326==--

