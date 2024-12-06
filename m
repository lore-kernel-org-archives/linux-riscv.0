Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1093E77179
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 23:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxqzYy1xvihiGzkL/F/MjLIuvqhPluKn1mKC3qCslRc=; b=iMlTRGyufA8D05kTfksYLGNkRF
	+ByTG2DbOg3tVo9zemmOcNzF+8XddYpEyUBMAyv6WvQ00jQr7ZOgIy/TOtBxC3OQRDcec0xObG/8r
	uOLL0QxXDW3rsNoPFPHTgr06wBYXVmvkAeV9jVgzsbM2rvC6uH3odUBA3FTTyBIDoM6Lvi8Pr0eLp
	lbaoYk5yldxTjbPJSNlsFGt8NZIfwOK7oU+XUs4zmCdLstG0p7rlRl/QiINvJnuuS1zOeORs1dm9y
	t4QpCirQ/6C8+nAoou/indiSsHAF33TfIxXh22FMzcXw4Qau/ZhsQ6oJmj6nD4wlXNAowtslFj73n
	yFkMfGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJhrF-000000031kz-1pEQ;
	Fri, 06 Dec 2024 23:35:37 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJhrC-000000031kP-2LHY
	for linux-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 23:35:35 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7258cf2975fso2343105b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Dec 2024 15:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733528133; x=1734132933; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=126Ubm7PaeWZ4ZTzd+fTI4aIf3M9NdpROOmAVqkxosw=;
        b=XqHbUR9+cTSdZB7jrZv1U/ebtRTfbNXJky/22TMwQk0b/PpxutHw+KTkm7p7JY5wAU
         LVROfzY9xxd0iYcjyiaDYeifY/ODuOoewronnWMZrYGWm/oyyzA7j66VodMqDo2GiXvI
         LXIfGsBk6m833FMdARHif+uQkEh/6swl7RgSgyyPvBqM3/lByd3g/HstN4NnqzaSZTVJ
         bYY+gLwI8sUsirgqEDgZKGr5HLcp1GyRgTFr2wssVdpbJxww3WxXdqYjHar1aXLyujes
         Jx4BWCR23OFrz5YnD+Bf6Qnk7/EVAqPBWnorFgxPC1FxYwyD/NGP/1KZKOgkkUJeN7mg
         eQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733528133; x=1734132933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=126Ubm7PaeWZ4ZTzd+fTI4aIf3M9NdpROOmAVqkxosw=;
        b=C+D23mb+ep4FArLNagXr4ExTVmyhrKGLH/e0Y7J8pOHpYhyACsDFnoOYO8ZXy3kTCu
         GdwmSh6Wk3AarsAIQJda79JX3te1iB2oibSZxAEFfqxhZXjHOPcURfDYy0P0ti9X+sNY
         hd8bW0X8Qu68tnyALlefaEronxBb2O76HHqGzECaFiowPO/2NfMLDbDyFsHp1T+ZbABN
         JFXnu57SacbfS+3W6QbYSx47Z09KjE0hipUu5bBMGWrZGGqouIJxNFBvkfvktm573Fe1
         7UCZAdiM1gwOafG5KwXk44bf5ojXaZ25e2LMvmbcMvdG8PIUhHBpRF5iZ+6NT3+XSFqY
         BRag==
X-Forwarded-Encrypted: i=1; AJvYcCU54R4zPXg/D6ztrJ+zjHOpFxHns2nLh/GDvayvhxu1++DEFRQmgeFnYMklaxqvWOA+NA1u0q5mqbfZvg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBRd+9l2GBDA2xffkUiRwJXTKKn1407aBiqL6uyxLzJcXG/+nv
	RyIgblY3YzIiTMrDChpl2vmXzMvX07S7d7NLIM38pj5EhXYSHanr
X-Gm-Gg: ASbGncvSsdV4qvKMS6PXz8DD6YFzYvrd/w59z4fcXqbzdN50zMr/r8a6BURbTVenkSP
	US3pAYffFS7jnFzutTVJiJalBzg236fIKb26EIKrMws6klBuj2oioUTZeNbnzAjlg37bjDd8zJQ
	amRXn1aEio9oL/rPmW9/rvn2XMOn/r87FEsHjGKbIQ87ihq5l/yE0RrlGw8xcMviA3U60kZOlpT
	mo43sNKtB8sic8acmpH0z93+a32Y7Pua7fSJxUhGIcSBH4sHg==
X-Google-Smtp-Source: AGHT+IGCyNnkcXUzTJfpaaB0JuvpkQlDsGaivHj5Ru3IRnBxIZ67ik/FVm+00VqFGVdNnEtFStzg4A==
X-Received: by 2002:a17:903:11c8:b0:215:4a31:47d8 with SMTP id d9443c01a7336-21614d1ef5emr71074785ad.9.1733528132717;
        Fri, 06 Dec 2024 15:35:32 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e5f265sm33841085ad.70.2024.12.06.15.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 15:35:31 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 5B40542806FA; Sat, 07 Dec 2024 06:35:27 +0700 (WIB)
Date: Sat, 7 Dec 2024 06:35:27 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Robbin Ehn <rehn@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, bjorn@rivosinc.com,
	puranjay12@gmail.com, alexghiti@rivosinc.com,
	yongxuan.wang@sifive.com, greentime.hu@sifive.com,
	nick.hu@sifive.com, nylon.chen@sifive.com, tommy.wu@sifive.com,
	eric.lin@sifive.com, viccent.chen@sifive.com, zong.li@sifive.com,
	samuel.holland@sifive.com
Subject: Re: [PATCH v3 3/7] riscv: ftrace: prepare ftrace for atomic code
 patching
Message-ID: <Z1OKPxHBJ0kV5TbA@archie.me>
References: <20241127172908.17149-1-andybnac@gmail.com>
 <20241127172908.17149-4-andybnac@gmail.com>
 <87v7vxf7t6.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
In-Reply-To: <87v7vxf7t6.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_153534_676158_76676FD3 
X-CRM114-Status: GOOD (  11.05  )
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
Content-Type: multipart/mixed; boundary="===============8286598528974407869=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8286598528974407869==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fdN/cFbE4b73Mn/0"
Content-Disposition: inline


--fdN/cFbE4b73Mn/0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2024 at 11:02:29AM +0100, Bj=C3=B6rn T=C3=B6pel wrote:
> Adding Robbin for input, who's doing much more crazy text patching in
> JVM, than what we do in the kernel. ;-)
>=20
> Let's say we're tracing "f". Previously w/ stop_machine() it was
> something like:
>=20
> f:
> 1: nop
>    nop
>    ...
>    ...
>=20
> ftrace_caller:
>    ...
>    auipc	a2, function_trace_op
>    ld		a2, function_trace_op(a2)
>    ...
> 2: auipc    ra, ftrace_stub
>    jalr     ftrace_stub(ra)
>=20
> The text was patched by ftrace in 1 and 2.
>=20
> ...and now:
> f:
>    auipc    t0, ftrace_caller
> A: nop
>    ...
>    ...
>=20
> ftrace_caller:
>    ...
>    auipc    a2, function_trace_op
>    ld       a2, function_trace_op(a2)
>    ...
>    auipc    ra, ftrace_call_dest
>    ld       ra, ftrace_call_dest(ra)
>    jalr     ra=20
>=20
> The text is only patched in A, and the tracer func is loaded via
> ftrace_call_dest.

Previously the operation was no-op, right?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--fdN/cFbE4b73Mn/0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ1OKOgAKCRD2uYlJVVFO
o6Y+AQCiT8k5GCk4aLvmXeShXl/pfnz5HC+PJM+m4E8quF6IJQD+My2mpICqvpg/
Bn0rGqOqUEb+abAgVYRVjE8IIuPdPwE=
=ruu5
-----END PGP SIGNATURE-----

--fdN/cFbE4b73Mn/0--


--===============8286598528974407869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8286598528974407869==--

