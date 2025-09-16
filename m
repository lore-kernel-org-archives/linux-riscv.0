Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C995CAC59B
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 19:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JN1It/mBtHjMHDtnZ3/hfOgfdSj7d12SrL020G9xEMk=; b=hKYbKxI6ZHGOW8A+nDJRb0N2Pt
	lDfXIKnLlxXXQZ3pzP4HvYsvJ1huLVlDGzE0kVUYLbECNfkDd44uBjI+Oq8fLhg+sJ7nwXldeJaYb
	CfBxAvH7aodxzWggUHk/NRaseqXmpwyhc0sQCl10Rst9zp8/Mpoynhr+squgTVZmOfAAvdLKeYmpD
	PX8D9jhHcP1AD0Btov59kyvjMyWNPEGz3lLVtpm9jm8eC0pM3+gbVRVnOhNAqdu4GdiiPKj8cxR+9
	J7jQaMuxAlzV3/lnE+HVSs4xL4Rb5ekE7RdN5g4N3cioNY0iN8hb9hvrlpUv99qsYJgljPOJBbsGD
	R1xUE9iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uybLh-00000008rqN-3TdS;
	Tue, 16 Sep 2025 19:28:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uybLf-00000008rpv-2Ueo
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 19:28:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9865F4323B;
	Tue, 16 Sep 2025 19:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F287C4CEEB;
	Tue, 16 Sep 2025 19:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758050898;
	bh=C6yhdHJzoIbE+amyM5rD+e8WufqCd7DX2DUDM3fWED4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KtJx2PG7p/FYTgU0MxA8nQCwNnd7XEJSsqHChi31gqzyMN6wMq6p5n9aHVKPBfUqZ
	 c1mVVWzDp/4NUayYABIr4tB4yD5YPB06S53aS2mlCF3FTTiOy0Mth0KKqQoqHS8ntK
	 rq43dhV9Kc36CD7byq4TIwddp5J7c5jj6z5LE2xd8Navnk+gMoX/euu7kwrHE0mMev
	 lbDlQ1JlgEsPk3DOgkQDi9NNvp3dmrKPfYB1XijVNJc5c8GlfFpdMK7CK1UXINwlBl
	 1KGK97GPQQ/9Aj13OCSKOoOdqJlSmvmFhd7oYJAYELo5tqB6CF5sJG8s3n4gDl1lsA
	 mBIF/45peswPQ==
Date: Tue, 16 Sep 2025 12:28:16 -0700
From: Drew Fustini <fustini@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 1/2] driver: reset: th1520-aon: add driver for
 poweroff/reboot via AON FW
Message-ID: <aMm6UIMTFOH0Z3Ug@x1>
References: <20250818074906.2907277-1-uwu@icenowy.me>
 <20250818074906.2907277-2-uwu@icenowy.me>
 <i6slr5csro54ys5g7diqyacq4deidwm6f2nhpm2uwmgjlu6tyn@otrbpij4vdya>
MIME-Version: 1.0
In-Reply-To: <i6slr5csro54ys5g7diqyacq4deidwm6f2nhpm2uwmgjlu6tyn@otrbpij4vdya>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_122819_650791_524AF3A4 
X-CRM114-Status: GOOD (  15.79  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>, Fu Wei <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============6853472653875011715=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6853472653875011715==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fu0knEafnJ273Dfx"
Content-Disposition: inline


--fu0knEafnJ273Dfx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 08:22:02PM +0200, Sebastian Reichel wrote:
> Hi,
>=20
> On Mon, Aug 18, 2025 at 03:49:05PM +0800, Icenowy Zheng wrote:
> > This driver implements poweroff/reboot support for T-Head TH1520 SoCs
> > running the AON firmware by sending a message to the AON firmware's WDG
> > part.
> >=20
> > This is a auxiliary device driver, and expects the AON channel to be
> > passed via the platform_data of the auxiliary device.
> >=20
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > ---
>=20
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
> Greetings,
>=20
> -- Sebastian

Thanks for looking at this patch.

What tree do you think it should go through?

-Drew

--fu0knEafnJ273Dfx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaMm6UAAKCRDb7CzD2Six
DNWLAQCUT53BPhF35rw4W7EJqUmvuqrV8s9oiMp0hKK2821u2gD9HPELUCX8A6sY
6AzvOtfhRtzrVwGT2bbsTmqEEBrNXQs=
=mp9b
-----END PGP SIGNATURE-----

--fu0knEafnJ273Dfx--


--===============6853472653875011715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6853472653875011715==--

