Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F939E78D46
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 08:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQ6Y2usFl/I33opETEdYGc4qLNhvNT67OoB3/1tL57I=; b=h6WWS8Z9Xv+ahRm1T2MbehxKR2
	vQkfulCUGp9Cqdw8XuB8M+GS78U/CB+R7CGHw3QXQcvcxE1xoY1jBDEE+b6ItME7EFqsP9R6uAyG9
	IOyzAPW+YUJyJGUX0Uvmmny4Q4CG2OkiQqu0IxQN5x1qLMCgOQN/atliMLJeCz5UPJu5x5iUtj8E8
	m3bVIwyO2/z7Zq/1b1Y6V/IzLc6O1CWrpidvBJ+ElWdaLS4rHXloXbiS1JUIMmf49CodpySPZGGZ7
	VBNGpOgp9TYZsdQaK5RlSQok7jUuhPDkJShDnzCHnxhYCcbgN6QGKKcMjEZOnY0Brg56Nbg3fnwe6
	OeaBcIYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpN4H-0000000F4RY-2oyp;
	Mon, 09 Feb 2026 08:56:29 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpN4E-0000000F4Qu-1we3
	for linux-riscv@lists.infradead.org;
	Mon, 09 Feb 2026 08:56:28 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso25441615e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Feb 2026 00:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770627384; x=1771232184; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jU1e6cGfVovzfgBd9x95W/1mOj66I3de/7vGBXXyBSg=;
        b=3WfnLCqRej3wrSBLNwYijo6Ats+V2L55317j5km2pcRw4VfWtwcMsXMNKj4TZOmq33
         7lZl7zv3Y2ebnx41D2gVxf1Prtn/vj+xAZg8VleJ2PvFOjsaoGwrbNJgtvpWayLD5hQp
         pM5YEtaxSgr1klcuVqRDYBAm5zBU6kAh4O6Epv4RTe1UHT+OxMwEiWrlVzkL6zo+OY3I
         7Lm/p1u+0GG6+tpoJlDSk+W6Zllu/f0QG7/hPJPdGs4jmEn73b1gZvrAkDFciGVjEzAZ
         93TovqdLh0wxjg8eCX76TijUu4ZkPDHd8Wpq17C7swMEu4xsi6dVBoEAUmoMsLwzEOVa
         f/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770627384; x=1771232184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jU1e6cGfVovzfgBd9x95W/1mOj66I3de/7vGBXXyBSg=;
        b=wNJXiMXyymbj+I5ZA1uZYu2qn+rtKuhg+sle2asS8/CtBkn+hCaqLmsYtWtoFaeoON
         wZNh6/Q3G/gXs+mUZ1vENq8MJ3DeCwcPKORz61XeFaWNjWfIZMMYUfCQbze1ar873Bud
         Tmbhk+fmQIoh+2AHXu/wJ89gsSLyUGsGx+rhVqgpe64RyPyiAaD7Z8+W6f70cUVS3lpi
         6mdZ2ZTQnVtFcPW6dadkC082paXUoDGmppbinGJAfcp2YO6Rsiek8hARKkg89uHLRHfO
         aP8mGNxHHZCZSRRQF4ZXNq99s5sQe+CbsLDmC7rwCSUwVYaMHXsVIRqSJFOkuVbyPuYN
         Y7/A==
X-Forwarded-Encrypted: i=1; AJvYcCXNusq3fbV2q3xIFbvfcpOnps9D3i1aLN2zl5QoFoOxQnI/PxTm78jDwzXjCpL1/zp98ik1U9PEummKKA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgbUiA1nvtf7/yAV+p7QG150HvQ5qO5n8/PKNrSZheLv6+908v
	CYjwPmZ8QjNZ7F3/Sm6dB0zxhybmF/k2nSsy5PYIXO8G41i+7RcfHEkXM8rLYTpvk0Y=
X-Gm-Gg: AZuq6aIQBp9gnDJaSkX5mORykJfzFKtCd5MZkMNOJQOBzkUA1r6iVBUcfs49XCienAT
	gzZO2rP967u5v3qGiNfUSXpSZS3AUcToWJ9SSIPsXo3sMQ7ATLWQBJ+NYeLWD4IjPHRUB0QGWfM
	eeP6ZF4tqppzKP7tz5fD2oB3d7Q9xwIACRS55rXoJMdsVEHr+zNkObXgbXS/AzYqca6cJqrMINj
	LxiorRPRQ7zibY1F36HKG4kJPW59UIbuE5WltRLSJ9ZGELNposmkRfseHL8hUMOEEQbK6JrtksP
	NXgV8RDMZZ/YNRZhpItsEGW2CnP8B16uGPbH5tj748y9DtGhVAsizSQMnH4Z8Vaeyoi06bqyPVJ
	EJqH6BmcxmbzMx2qfrD24Z0Gk7yX74OJdI2uDdzmoHeqW1yFbFvBkwcjGTJp2pIcaFy9BFZar/+
	yJE/BxgAhvBS3Vc7DFJ/tZQ9ZujxW5vWbtZ32/TRsLmJKhxJJN0vuHfSJg/xxeSqn8EoTgMpMI5
	E4=
X-Received: by 2002:a05:600c:3b23:b0:47f:8c05:786b with SMTP id 5b1f17b1804b1-4832021eae9mr148505945e9.28.1770627383577;
        Mon, 09 Feb 2026 00:56:23 -0800 (PST)
Received: from localhost (p200300f65f20eb04869299441cec46c1.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:8692:9944:1cec:46c1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-436296bd1c9sm24833439f8f.15.2026.02.09.00.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 00:56:22 -0800 (PST)
Date: Mon, 9 Feb 2026 09:56:22 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Miguel Ojeda <ojeda@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, linux-riscv@lists.infradead.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	rust-for-linux@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-pwm@vger.kernel.org
Subject: Re: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
Message-ID: <aYmgjEWaLrdsubKM@monoceros>
References: <20260121183719.71659-1-ojeda@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260121183719.71659-1-ojeda@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_005626_526377_FB6FAAB9 
X-CRM114-Status: GOOD (  13.95  )
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
Content-Type: multipart/mixed; boundary="===============8899793597940701484=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8899793597940701484==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ry77kcf6b3keyw4r"
Content-Disposition: inline


--ry77kcf6b3keyw4r
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
MIME-Version: 1.0

Hello Miguel,

On Wed, Jan 21, 2026 at 07:37:19PM +0100, Miguel Ojeda wrote:
> The Rust kernel code should be kept `CLIPPY=3D1`-clean [1].
>=20
> Clippy reports:
>=20
>     error: this pattern reimplements `Option::unwrap_or`
>       --> drivers/pwm/pwm_th1520.rs:64:5
>        |
>     64 | /     (match ns.checked_mul(rate_hz) {
>     65 | |         Some(product) =3D> product,
>     66 | |         None =3D> u64::MAX,
>     67 | |     }) / NSEC_PER_SEC_U64
>        | |______^ help: replace with: `ns.checked_mul(rate_hz).unwrap_or(=
u64::MAX)`
>        |
>        =3D help: for further information visit https://rust-lang.github.i=
o/rust-clippy/rust-1.92.0/index.html#manual_unwrap_or
>        =3D note: `-D clippy::manual-unwrap-or` implied by `-D warnings`
>        =3D help: to override `-D warnings` add `#[allow(clippy::manual_un=
wrap_or)]`
>=20
> Applying the suggestion then triggers:
>=20
>     error: manual saturating arithmetic
>       --> drivers/pwm/pwm_th1520.rs:64:5
>        |
>     64 |     ns.checked_mul(rate_hz).unwrap_or(u64::MAX) / NSEC_PER_SEC_U=
64
>        |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: consider u=
sing `saturating_mul`: `ns.saturating_mul(rate_hz)`
>        |
>        =3D help: for further information visit https://rust-lang.github.i=
o/rust-clippy/rust-1.92.0/index.html#manual_saturating_arithmetic
>        =3D note: `-D clippy::manual-saturating-arithmetic` implied by `-D=
 warnings`
>        =3D help: to override `-D warnings` add `#[allow(clippy::manual_sa=
turating_arithmetic)]`
>=20
> Thus fix it by using saturating arithmatic, which simplifies the code
> as well.
>=20
> Link: https://rust-for-linux.com/contributing#submit-checklist-addendum [=
1]
> Fixes: e03724aac758 ("pwm: Add Rust driver for T-HEAD TH1520 SoC")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---

Looks good to me. I'll wait for Michal to add his blessing and then when
picking it up tend to drop the Fixes line. Or do we also care about
CLIPPY-cleanness in stable?

Best regards
Uwe

--ry77kcf6b3keyw4r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmJoTMACgkQj4D7WH0S
/k4zeAf/XYGAKk/eo6iDxvksTOmu3h5TkJUmEfcgxwPtvFEjikx0NKtlrbr5z5Pg
FPa/A+qSRAoxsR8Igwk8Y266YgdRS+4EwmmeKUupEY+SJFcfb+AVXx1q/Upy0B2E
jh5VCVD3VYDDM0gbaX7oEndU2edusd/Thag3PVdz8UoIpk1rEQPCV1Jz/NcCGoLU
uAw2lwAWG5YUSufm9QUCd1nu+4iH+rgGXr8844D3wK7B+6JJ91wJaFHWjFfXpNTA
wPJLf004PxvX3aVVGZVZk/jtMHKIVE+0rOKdnoPbUyu3flk4W+qJaXtV+jYZ32BT
xpbO4ij+bh7NNur4IAy8OSBPnEk+cQ==
=5cZO
-----END PGP SIGNATURE-----

--ry77kcf6b3keyw4r--


--===============8899793597940701484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8899793597940701484==--

