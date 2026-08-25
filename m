Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28D1C61DB6
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 08:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOxiYfkbflEUqhcu6oAjR6mtg+H/cC9NShyPntp+Ymw=; b=w5cBNROdb6lJevHZDZsKTRfFtQ
	kgtThbcnHU+NufEtjo7Ucl0UrGI4Dyw9urvapoY9IxLnn1SvmyrQfJ43o0ku5i49ZJQ7MuG9g/EGa
	g+DiRfG4/1eTCvD/B9BD58GGRVFXh/hpqqrdkOpYZy1Kt0yyDrRE09V9oJme3jjMSdZswZetILp1C
	A6w81CvVl061mmKfqN26lLgOAR8E5gggWpof2feG4Vcso9lWpIOC10SbrBqMiT6dz8D5/Jwzl6dtc
	Z/BNM1fipZsSV71M1bPFC/X844vZnjJjIMDmfn3I5d556hVf3Kn+wqJjKgcWjY8QMf8KANLd88Iv3
	XfQa9drg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymSC-00000000NIF-3Hsx;
	Tue, 25 Aug 2026 08:24:20 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymS9-00000000NHd-45x3
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 08:24:20 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c1c52d920b8so634192766b.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 01:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787646255; x=1788251055; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DZQvgMF9MtoSMKn9/xxgPT3t+kYxUHeBLkPFZwmxGy0=;
        b=iSTipxUZRFCegQTl2Z2i31tqnkUGt2sLmuueTVeKLja5NkSzpPQ1az735FlHQRZ4GM
         Irqpa2M/qmIWuW3KPfgHDDEd+H0ZavIFjrC0Yjo8iqOWMGeLyF/IYsJYfwL+vGkm/82C
         UQNslWmVNuuORX/GLu01fwurLGM9bbBxkp1T0/O0zSM8yGoshF/5HMTHuoLsDk5v7IwR
         Dj3F6gXgZ+dzHkkvQVeueLis7bs9bkdzG1wVTtxFUv2eUxpFMjLV4mLwsNqIyDxsKrts
         8GJ6Na2LQrkoJqOw+A5qNrrKBHl4pqJZQbCXJnUIpSSwS2mxUYf0X8Z3mkw2AKKxGoDX
         HTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787646255; x=1788251055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZQvgMF9MtoSMKn9/xxgPT3t+kYxUHeBLkPFZwmxGy0=;
        b=gA0eeGw1tBJk3bCnmXULxBU5Iq4puuNeCgD/vHY6cazRi6RSobAr6b1AGIpxFSyzh6
         2iq/9ca9twSq3fp8+N/jr7sTaizqniX/X+sy/tdjKwXZtUaTTIaksojc5FrnpC5WzGq7
         SivUQn3AhQMw5LMDJHVuj+XfT2CTL4ViF0fsmqvI4TncLSNx0wzq+rUR1XuPgWfcITMJ
         mIT5Z+wOU1/FfqjEWG2d/ca6d4TbPqGQ76988zoSWqpFghCejZC6d9Sidq73CjS78Q6A
         59vGLPD/tIXkvO7J8AL0hHcjr308ZwimyMPfqmGcFa4gWMfDAjL+LVwFNfkEq/NYn2kp
         A4vw==
X-Forwarded-Encrypted: i=1; AHgh+RpPZip9n2VBFfQ6IAgvcWfJE+e2yWjsef3idFLXocKNZITLer3EufhNpe1LXj31+lt1Vr1A53y0NchmxQ==@lists.infradead.org
X-Gm-Message-State: AFuF++k+TEaVWcuU4Bv7ZpXU1c8jBfWlFIBqhijvFtkkBtQ9t1qqvZ2A
	pQYMApPT4p7Zjwfm4LFQSPtiWlEaoFQNNVmXDxaH7sCReSj6BDWuc05u66qG0NsS2tg=
X-Gm-Gg: AR+sD13zJCJBMdVLUJnBa6px1BFRPRQDjfzNd6+GyvE1xVynwXjKX4M54dMD9uG7Emo
	s90JaZMcQob1pyQgI/XH9nifz+u9or5IZrFNxldX0pIT3TyIG0YVal11LbyFLAc4wmYerZhLUpa
	0enSlQ9BGPFg6XQPe4OeYKcJeQ18zPCjjU3zSmqhP8N3kuTRnl+2KCoy5ftW0Brz2ro8Am3sKwu
	bnTSaW2DdQbHuzL5Bjo5OiQWhTxUPclGv3IpuC7Ui+rFd3Lz9OCHdDzAdp1lpcD58lmJATkSUXg
	1jsMWFs8pZDl3W//t9DeP5TiDlE1v+Dramy8kBcrXz/fDoICPKOdNDR+ru1YEN5sVkKK2GZhFYT
	A0FpscEBl6Di1+zt83h7Pi1DPSGsko5IecLbD9mu3vn22HvxuoyYOz2wG3gBWzCWFDJAz/EiM3p
	0fxb7V9xYarNd5x6vzIZqJ0I6nSNtRK0mR+0YRsR2cTGNwT61Qiur38GVY4zNORaR/KQb6yWWr4
	qruVwBUqM4vta1znYn+d6+ITvMZ1dX/PN3QpagWiw+U+EJ2bg==
X-Received: by 2002:a17:907:1c07:b0:c15:f26a:3438 with SMTP id a640c23a62f3a-c24e5c1ffd3mr497229766b.24.1787646255345;
        Tue, 25 Aug 2026 01:24:15 -0700 (PDT)
Received: from localhost (p200300f65f19a904037016a565660d5e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:370:16a5:6566:d5e])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c24966f9cbcsm1874351966b.29.2026.08.25.01.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:24:14 -0700 (PDT)
Date: Tue, 25 Aug 2026 10:24:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Kees Cook <kees@kernel.org>, Joel Granados <joel.granados@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	kernel-dev@igalia.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	fsverity@lists.linux.dev, keyrings@vger.kernel.org, bpf@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wpan@vger.kernel.org, lvs-devel@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	coreteam@netfilter.org, linux-sctp@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-s390@vger.kernel.org, bridge@lists.linux.dev, mptcp@lists.linux.dev, 
	rds-devel@oss.oracle.com, virtualization@lists.linux.dev
Subject: Re: [PATCH RFC v3 03/13] sysctl, mod_devicetable: add macro
 MODULE_SYSCTL_TABLE
Message-ID: <ao1P_mEJdyRExG3v@monoceros>
References: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
 <20260819-sysctl-module-aliases-v3-3-aab90569365d@igalia.com>
 <aomlfGJM61qZKxx2@monoceros>
 <4e3eaf1d3419e808be046035f114bf6c@igalia.com>
 <aotteDcc588iwC6g@monoceros>
 <4aa22e41e8ff4bab6638cf0baaa9d07b@igalia.com>
MIME-Version: 1.0
In-Reply-To: <4aa22e41e8ff4bab6638cf0baaa9d07b@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_012418_319897_4D8DAD93 
X-CRM114-Status: GOOD (  27.20  )
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
Content-Type: multipart/mixed; boundary="===============8531577741764608496=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8531577741764608496==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ajsyed3ibfmsggn6"
Content-Disposition: inline


--ajsyed3ibfmsggn6
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC v3 03/13] sysctl, mod_devicetable: add macro
 MODULE_SYSCTL_TABLE
MIME-Version: 1.0

Hello,

On Mon, Aug 24, 2026 at 06:04:03PM -0300, Mauricio Faria de Oliveira wrote:
> On 2026-08-23 19:12, Uwe Kleine-K=F6nig wrote:
> > On Sat, Aug 22, 2026 at 01:57:24PM -0300, Mauricio Faria de Oliveira wr=
ote:
> >> On 2026-08-22 10:41, Uwe Kleine-K=F6nig wrote:
> >> > On Wed, Aug 19, 2026 at 03:16:16PM -0300, Mauricio Faria de Oliveira=
 wrote:
> >> >> The MODULE_SYSCTL_TABLE macro emits a struct module_sysctl_table va=
riable
> >> >> with pointers to a sysctl table's path and entries, and table/entry=
 sizes.
> >> >=20
> >> > That new struct doesn't seem to contain any pointer?
> >>=20
> >> The struct module_sysctl_table fields .path and .table are pointers,
> >> although with kernel_ulong_t type so that the same 32/64-bit size is
> >> used in file2alias.c based on KERNEL_ELFCLASS (and not on the host,
> >> which might differ with CROSS_COMPILE).
> >=20
> > Cross compilation isn't an issue for the already existing device id
> > structures; many of them also contain pointers.
> > (While modpost doesn't use the pointers, the size of the structures must
> > be known to correctly interpret the arrays.)
>=20
> Indeed. I missed some device_id structures with pointers, and that
> devicetable-offsets.c is cross-compiled to generate
> devicetable-offsets.h for file2alias.c to use offsets and sizes of the
> target architecture.
>=20
> I'll change .path and .table to pointers in the next version.

I *think* the existing device-id structs use char[] for strings that are
relevant for modpost. I look forward to you finding out if there is
still a justification for that :-D

> > I would be great if your series didn't introduce a new obstacle for
> > [CHERI].
>=20
> Absolutely. I'll be happy to adjust the series and testing for that.
>=20
> Could you please confirm one should just follow [1], which uses [2] to
> build the LLVM toolchain, and use it to build the kernel [3]?
>=20
> [1] https://github.com/cheri-linux#building-and-running
> [2] https://github.com/cheri-linux/buildroot
> [3] https://github.com/CHERI-Alliance/linux/tree/codasip-cheri-riscv-7.1

I used
https://github.com/CHERI-Alliance/meta-cheri/tree/codasip-scarthgap and
didn't care about toolchain and rootfs. It also has qemu integrated, so
you can actually test it.

Best regards
Uwe

--ajsyed3ibfmsggn6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqNUSoACgkQj4D7WH0S
/k5rHwf/eQKyjSm4dfYOnpO+kyESzhGSDXacrU0BK/nrQ7Z3BN+QipNdHe9BZ4f7
k+3uxaB8pZmyHeh98alfg/5Bq9HBt62YSsVo0f1LrxdEuw+otojZstZ5BajlC1fB
uCZWsGYJ1lROqcGUkm3WTuwmO+VkI4no1e0+OMnKjMkIdarwm+SRxroNmGXPxjFS
0c5XzO8ufI4T330xBhTtUCfIGtmOib0XeyZT/dCtT8wNoKlznA36ojMl4ZOArWgW
VYBN9/JdmoDGTZxdbWqXoETzY//dT0yaCQF2J8+eM7vMW+ay0vkBIpxXkR9QmIGF
KIDH4l3txv82X35T5GJP5y9myooT6g==
=Ph6i
-----END PGP SIGNATURE-----

--ajsyed3ibfmsggn6--


--===============8531577741764608496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8531577741764608496==--

