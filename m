Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E43D3C54D
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2024 05:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGKXzxC0iJ1DP1/YEnLCBR/iEseoyuw35wYnF0+FzHA=; b=JKRtHMh38IUHrQjkMieGxXiJi/
	0DH3x1pa08ZZjMPOmS6BdhMdUhJwBH+xDe9Jb1zv91Axtg2Nxw9T59l42PLTl2szNe+mpcB93s0vr
	6A+i7qGv1npE8abQoGzMhH8xVEVGQW3NV91Sz4LxU4TlCCCgY0cKhKNY+CF7L69eEFRWlIAPx1ogO
	SkLgJ5FHt6pnvs2I6QQMG42uKsko+etrmf3PreZHRVHg25mPpu4bYJAoztmqhZ++VmWraz5UxQw2M
	sviXAN9bZ/Ii3iWY+mTCT7brO5rJ6+KAtPXl3EAx8CmHzf/qbFWA6fWp0tesvMC1ZyuruO2hr8OTO
	sdW80Tfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1faQ-0000000GyRv-2YFS;
	Fri, 18 Oct 2024 05:31:42 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1faM-0000000GyQp-340p
	for linux-riscv@lists.infradead.org;
	Fri, 18 Oct 2024 05:31:41 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-37d49ffaba6so1272833f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 22:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729229496; x=1729834296; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c6pJR17Cx+vhBdPlKGr1glBzn0/Huh2wZWajDJPJL9g=;
        b=Xi00AZNRssaggS5tWcFQHSgzJqPvyCeth/Vzx8Sy2dRjSzn6LnRfBhm05D0g+X+n20
         psGMgnfWNBHn5kXYQLGTC6h3/mvL3H+TBJkFmY68R5DkWzHNq10TIDafh1x8kSR8SW86
         DdYhhwAe2hTj/jEdTNem3GqiUViLiqRrffZ9a+iqvZEC/SNkWigOJwQvTxudYVFddaiN
         vsmTxaWu4JA2Q/g50Tyt1llZFtkcmk6WF+ebjq+j9Jp9QNrGpk4Ba3JwNfp9crICzBHA
         XbfglxI4QQCAqxxadJNJapdLyer95vZtoNUCyYL0wwaj79GkfAD038ilK/+j1JZ6rlk0
         cZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729229496; x=1729834296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6pJR17Cx+vhBdPlKGr1glBzn0/Huh2wZWajDJPJL9g=;
        b=MReCyiq9hEh/Dcd17Un7g1TqUlKBBaeBIH9HQE3dKFW2/Za82KvEhK+L8GSPHTE5bb
         XXdihukqUblfoJka8IuK7A695PW1s6MhQnr/kCpF+loxRtcATpvztxhjchrFt5bpYpfX
         VbO9RV/5Xtm+Jw8PpWOVZGoOF4YKZkv/MHCm6XMGC6PSQIbA3ZY7qsNPsUOVFvuU89bC
         88uXnIScnhcU41x4liObS/kOClYciL5pKcR010r6s5RC1/7b9+YJWuxti8mlyzW06XB7
         1IdVEfyI+istP8IiuBLFoxy8/8FKDNnKpVnMkeMLq0r2U8uOaQr6Io6tHCTmKalniAyZ
         az/w==
X-Forwarded-Encrypted: i=1; AJvYcCUZbcVF1o2Evc68kVtaXrq6vVY3xqaFnjgoY0cvObLsi6dJAHDQ0+5VC/CUIt8srAgxWF7XJm6uOETidQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwqYiLabaSwwtU3CC3491yNnHVDIvA4DgvMqm8tfY70GcZrv4st
	iW2q9kqjilfmZr3W/iE+iO5k8A/kfG2zwtUC3EpGuiMkI8ic4DLuFejEQHnyz5A=
X-Google-Smtp-Source: AGHT+IG8Ld3kpTB/rwLsIFn3KMclllCP6Lx/tf5/1/edc8B38j82iBjzH0rHnvWAB7r6efnRAWqU6A==
X-Received: by 2002:adf:e008:0:b0:37d:3735:8fe7 with SMTP id ffacd0b85a97d-37eab70bbf3mr720253f8f.32.1729229496469;
        Thu, 17 Oct 2024 22:31:36 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:c04e:758c:2eb5:eeda])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c29ddasm44973866b.211.2024.10.17.22.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 22:31:35 -0700 (PDT)
Date: Fri, 18 Oct 2024 07:31:33 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v9 2/7] iommu/riscv: Add RISC-V IOMMU platform device
 driver
Message-ID: <5jxxlmvyyennvrg5w6l3ma5pg7ythzo6z65nhs3lhpscmcl5sc@w22emfmvf2rg>
References: <cover.1728579958.git.tjeznach@rivosinc.com>
 <b8da2b00aec3f7b4b2e3a7cc194f7961bf656f24.1728579958.git.tjeznach@rivosinc.com>
 <lagj6ljulmfjogrzhfd3jrf5fnngev63q2g3bmvftwfzc3s6mb@gw6oz4yriyjf>
 <CAH2o1u4BYyHhi3dVcBrB8T2JpXdxStsfYodmOT-6a8KMHAot8w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH2o1u4BYyHhi3dVcBrB8T2JpXdxStsfYodmOT-6a8KMHAot8w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_223138_793740_06A5763A 
X-CRM114-Status: GOOD (  14.62  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: multipart/mixed; boundary="===============7300916677628431342=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7300916677628431342==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fbh7gyoiozliysgu"
Content-Disposition: inline


--fbh7gyoiozliysgu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v9 2/7] iommu/riscv: Add RISC-V IOMMU platform device
 driver
MIME-Version: 1.0

Hello Tomasz,

On Thu, Oct 17, 2024 at 09:45:14AM -0700, Tomasz Jeznach wrote:
> Thank you for those comments, they look reasonable.
> Can we postpone those changes after v10 is merged into the iommu
> subsystem tree?

If the patch is already scheduled to go in, that's fine.

My motivation to reply is the .remove_new thing and just pointed the
indention as I noticed it while replying to your patch. So I don't care
about the indention. Do as you please.

drivers/iommu is still on my todo list to convert from .remove_new to
.remove, so you can just wait until I come around. I'll push it a bit to
the end to be sure to have your patch in next already so it will get
converted in a catch-all patch for drivers/iommu.

Thanks
Uwe

--fbh7gyoiozliysgu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcR8rIACgkQj4D7WH0S
/k54eQf/YHC2YibpwUipmuB41HqAHsAljGTGCjGvubnogU3Jg8+TQNsVCfGqZXiu
si3jNg2XK8hVkXTPzdSH0nIRx+Be7vhMJWMyKr894iU5YDrDDV2n1Y+isdYzrUal
rzz5N1eG26FaxM4czeRU064oACyOKuyPIYY10yrkQiko3A3sWVa5SMHS4fm4IWIV
2KXXGUkx5ctFSaCtJCseENcFdV/yAmQ/Y83sQrle/sqrou8wkm7WIegZHMEe22cT
nG3GMref6aC4I4kLjFhQKdUKEkqJuqkhcYzqhuq+TGSUGet/ZkN6AR8N0+QA3RDr
6iM6q7fDc1d3XirP6chF+olWVozGxQ==
=jEvi
-----END PGP SIGNATURE-----

--fbh7gyoiozliysgu--


--===============7300916677628431342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7300916677628431342==--

