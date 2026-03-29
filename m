Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2147EF3D5F5
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Mar 2026 07:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucO4K95gcamWkq1Cs70D3jV3ZMj41Ugx2okkX5IasGY=; b=DxceTd/mhl+DGLDeRffWVYwMmX
	RF40QPs6RtMy/gC/6iiqcVs9OAp1o+75JReugRaWSjSv9/a4VN3DPRDHZgsu7FsxBBUJbyRt7fuRU
	w2x60/foFiCZFLXz0PGDN74RsiITBcRnKCIH5DKfySL8k5o7+J61Sf6muv5TI5VUa4VnU/L2NgR46
	9urImd+g/HMbis42sJ5xxwr5QyHiBxT9ZEhhv6lIGzFXdBs8pTsCsrKEeyEvVjS1UYG1oF25PJRAc
	IGriKDJILKpUoKNoCetu9MZhmPD0C/F+k9+kVt7NXm5wuym+mElIxjxB8aovkWxr7FyrYe+AVwO74
	SEWZ/8uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6khK-00000009i35-3arY;
	Sun, 29 Mar 2026 07:36:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6khG-00000009i2j-1cvh
	for linux-riscv@lists.infradead.org;
	Sun, 29 Mar 2026 07:36:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so45712975e9.1
        for <linux-riscv@lists.infradead.org>; Sun, 29 Mar 2026 00:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774769792; x=1775374592; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YGQAEjmAzZmM43FCjwJ92AtwcCRmR31MyKsLDZHjdfE=;
        b=VGaw5vBq9M5hDke68Jlb3ytq+40QYosUTr6ymXfF+w+vOxhNiDWX0Iy654KDQBgzVp
         AMiu84XpH6WRhV+MeWsi3bnZa436KCLGruQEzyJK4+1hXGMpB4FKrbX0Q0QkQbhq7UJv
         kYEkzh4L4eAZyl6gEbdU2LgrAg13Jr600eATahL+dgGvz4cWws0TNX4WxuNLGy1huq3d
         Rvp2mZv2u0KCzYSf1Q/6y7RsA30pSCoJSlxodZ69QWnxNd+qWYusi2/TmfZCM493+VJb
         2+dlir/3tkobi09dXlXxob233nNBO1evJllUXkSdt7YB5IdvWeaShgu1mvWBy55OeKFs
         8GbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774769792; x=1775374592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGQAEjmAzZmM43FCjwJ92AtwcCRmR31MyKsLDZHjdfE=;
        b=olOzF0D010A/tdq+Ay3+dQ8YQkB/+3AN7uPoBbJKZe8czpqar3KIo5D0/TlTISSfl4
         t+uR6ao5ukJc2DseOXly9qxUF+Hlh5IsXPPjJ20GX+KBlYeVCYNdkcPwXx56gOxv03Ui
         zG77EE8qx6HDYnN8VKiDrqc37oy2ETTkPEQyhMN88FxFGHGHcpTheY/r3Nps7Dr/xTjW
         4vvW7jWy7xmVk0r4ckn+jX+CVD9jwjdBr3sFF13Kb6VEGGqsT07cgfbj7bi6bVvwcKbP
         FN3oH3WulvA0e1LtI0MxKzYssL1d80hcxOuzQGrosKWJ/PvR3ms8L5DGk1duOERbHhFW
         52iw==
X-Forwarded-Encrypted: i=1; AJvYcCXI981msZ4KY6lLLpam3SxNXPU3fTxo96Qh4tLN8UBw3lb7s0eZF5jXkBl9D9OEw3OGnHUjqo2DurczkA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxk/m4uiwUXFCHA9ZAHQ21XO38JP0Q45qtpTvBf2OaBVD/xawF
	U4b80G2/LJ7fGuJFgG2XY3AvATmatAt7ns88BD0mbmn+5vNn2BVCNoJ4nX9tVyCnUQ0=
X-Gm-Gg: ATEYQzy+TDMXUYwsjSgt1KMb9Qa6uMmttYsx+HnKwdhm8Ipu5wQV3qKoOTkaUWEbIFd
	MwJg0UFuQDb/R05maYYcKnd2uG4z+1rk9F9oyxrKVQrQFeMfCGA7LSPAfvHfZImXm8ajfrVY2Qb
	B4FmLhGH9SuMXK0ulDzm8T1HcQPCWD69/M2VM3nK/HpQIc52GEfa3LBKMs0nuiW0hUoEoRTc6ZB
	le74iStmB81fZa+ggqZ7NIEeVK6jS58MHntDPcB54QTk84FI8U+FPg5MAgchuDT9Zy3RXgfZE8X
	9rh5Js+OrAXyajOnTNDlNSZwvBqy5mDA9C6Z7dTvbcEFn5lngLvmHV+YwQHvWJPh0agGaa05u5P
	6+C+l5nRM5DMGanJKmq7CvjBaYdNEfqT+uKEK31Jj49OqxI5g61NWSh4dnIWZVQg9b+Psf3xNga
	BzSLd7btFyQ6hhLDkP22/xhoRkHgy2
X-Received: by 2002:a05:600c:1f13:b0:487:169:9f64 with SMTP id 5b1f17b1804b1-48727d73709mr136213455e9.12.1774769791514;
        Sun, 29 Mar 2026 00:36:31 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48725fc4827sm50781685e9.11.2026.03.29.00.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:36:30 -0700 (PDT)
Date: Sun, 29 Mar 2026 09:36:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, linux-riscv@lists.infradead.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	rust-for-linux@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-pwm@vger.kernel.org
Subject: Re: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
Message-ID: <acjVGgDLnYAg1UAc@monoceros>
References: <20260121183719.71659-1-ojeda@kernel.org>
 <aYmgjEWaLrdsubKM@monoceros>
 <CANiq72kk_UJVNbQ3aKuV4_LPFm-a0xjZqZyk57ZpkHp8yX8jzQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72kk_UJVNbQ3aKuV4_LPFm-a0xjZqZyk57ZpkHp8yX8jzQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_003634_694610_E7537EE9 
X-CRM114-Status: GOOD (  16.15  )
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
Content-Type: multipart/mixed; boundary="===============1765306374857533995=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1765306374857533995==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v5mkeeaofiokcizu"
Content-Disposition: inline


--v5mkeeaofiokcizu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
MIME-Version: 1.0

On Sat, Mar 28, 2026 at 02:53:17PM +0100, Miguel Ojeda wrote:
> On Mon, Feb 9, 2026 at 9:56=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > Looks good to me. I'll wait for Michal to add his blessing and then when
> > picking it up tend to drop the Fixes line. Or do we also care about
> > CLIPPY-cleanness in stable?
>=20
> Do you plan on picking this one up? Michal already reviewed it.

Hmm, I guess I missed that because that patch isn't on patchwork. I
don't even find it in the list of patches that don't require action.
(e.g.
https://patchwork.ozlabs.org/project/linux-pwm/list/?submitter=3D83457&stat=
e=3D%2A&archive=3Dboth,
or
https://patchwork.ozlabs.org/project/linux-pwm/list/?series=3D&submitter=3D=
&state=3D*&q=3DCLIPPY%3D1&archive=3Dboth&delegate=3D
)

Applied with s/arithmatic/arithmetic/ in the commit log to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
now.

Sorry for the delay
Uwe

--v5mkeeaofiokcizu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnI1noACgkQj4D7WH0S
/k5Flwf+KzKsAaEdMl6wSc4xOfiDF7nzYo0AsBFHTxGvoBdXye3ZU33stEw3kA3L
Ugumdo7+UHnF+8b/QzgIXeLtcYyHxgPN52c7nxxsXInEd0L5w//y/W2WdSQ6HbJu
icpbYEBGCM0GvLemMP8P42cnchR7+5a6G5fbRqygGXgJn+8Zlyf/jzWaZYmPAEvW
gZ47q1NgiKby1TaIKgnEPKe5Gqa98+zOxQF908RJ2/43/TPFFsVIfP4koBGqEd17
64ocAOTcKSQokKnMN68C5BZGaO7eZufI/IvunxoHu8R1oRC3iJU4zxrVOMX3vt37
lZN8EC7XTOHJ5xkFaPi0T2XNqeVFtg==
=5n6k
-----END PGP SIGNATURE-----

--v5mkeeaofiokcizu--


--===============1765306374857533995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1765306374857533995==--

