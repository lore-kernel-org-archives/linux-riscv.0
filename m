Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA576D1AD38
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 09:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1X1rR5j6DO5122CilIAW+prBdF1BcD1GUBR7070PMiw=; b=BT7/TgC7kGPRSHCQHB3+dv/Cbp
	u835Pc1Cvh8430rXyQJ8PgiZNs9c99zfem0ULtl8eT2AE4Bnv+VYJ8d2N+vsLv5kAlgtieRKGM5h3
	t/tGEPuHzMNqyS2FlQA4rLlmNzgnwB+x2jhziTNf5KOZ34ziTYCUed+1LWsPovSXwP7H0hqf6e5UF
	nyiV0tRooDRYt5YsoP3uqlsPIeqpLRliXPk3Ilx2AsIV1V0dfh6mMlesgxGAtTfsYa0hVi6oC/pqN
	bAOCdWXJgfcgzb+beJ5mFu9u8YhL9qcKt0dlDbWrsurXmLVycYjCQFPLuSxlov0am2HU40cV0QmKN
	MeryU6SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t10Xk-0000000BH8B-1QIq;
	Wed, 16 Oct 2024 09:42:12 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t10RB-0000000BFbn-2hLT
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 09:35:27 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539f72c913aso3586969e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 02:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729071324; x=1729676124; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=icikz+noVT+A1IghOr2dEkNmSwULz+YkGpQA6euzKVk=;
        b=nUJelArCTqUalZ12UDwBfQmw8is1NHEnm215HJb8cECfU77WIbv7hnFBzQ/Fo2TyLR
         IYoNW4TyNKiHDTwXEpIutEOdCOKVFFl07y9+wA0OFjEBoTcgG7mGH/FKEl+vHee94yT5
         qv9J6F7d189ZFN+jq2fCuAY6HbU9khKbAPahrkrr9dLSzDwaFZjWm56pWDkwktyhbVRA
         zlfsvIVp0JhMIsuzu/U+t9lPpLYBgRRYo+luVL37F1B4Dg2hlBNSIiB+B5PvL0VO3b/W
         r2hpUHhuGynAVj7f0NM1O1iT82fzGKlsZ9L/UCJSohi/sdIJcvObuBuqz6IPDl+q19RM
         wMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729071324; x=1729676124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icikz+noVT+A1IghOr2dEkNmSwULz+YkGpQA6euzKVk=;
        b=xK7fmhRrylLjyCD/csK0zaRXLH6wtRw8OZxxsA/mLikh/a7OzZxq3M8fkO21ZZvxJX
         rqRwa1ITZcyH265HftUVUG0jiGvXb47DgKs1RH1U5v/53lm1ig4VeG4PYcgRfwIS3WjY
         CUoIVm14Ip2Uz5wdb3N2kb43WRR1010no4CI5DtIBtXgRamxql52cO+r45DTgVTFNsi7
         /Z1iSODVH9xVKMbBfHl5iDAerx9iOP5Jji6di1s98Meu+jh9kfo3YOJpzDWVAuRFrMMH
         MlaFO9X2qtelu5bvAL3m3HFNhK1V7bdm0xj/EVIvGfyA+daoHlim6Suzy78YL3IsFmFx
         /awA==
X-Forwarded-Encrypted: i=1; AJvYcCVYckWzwCE2O6naBn842FlpTDi2mzFpHRlhjKM/RrDCur6he3upJ/RdfEqGj/3onNgA9e0nnSEBKm9r9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyldf/ODnKqW4UrRtK/uuBwVfyL0tCDflRkstzpjzeD9ffBdUyB
	A6trCk/zqQpUlrTQ3fpfufPSdZbpRX183d6Nj/TrM4xv7mVO7bTDUNF62sXO+gw=
X-Google-Smtp-Source: AGHT+IGdsTFBiZLsx7xeTyOWkTfBtsndYobtBU/I5Fi4D8Vk3Mbkp1GQJDuJHZgpcIfqpPb22hA7XQ==
X-Received: by 2002:a05:6512:3d23:b0:52c:dd3d:85af with SMTP id 2adb3069b0e04-53a03f2f1ccmr2175646e87.25.1729071323803;
        Wed, 16 Oct 2024 02:35:23 -0700 (PDT)
Received: from localhost (p200300f65f19e3002f38cf427133ca7b.dip0.t-ipconnect.de. [2003:f6:5f19:e300:2f38:cf42:7133:ca7b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4314bf60fc4sm26528075e9.38.2024.10.16.02.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 02:35:23 -0700 (PDT)
Date: Wed, 16 Oct 2024 11:35:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v9 2/7] iommu/riscv: Add RISC-V IOMMU platform device
 driver
Message-ID: <lagj6ljulmfjogrzhfd3jrf5fnngev63q2g3bmvftwfzc3s6mb@gw6oz4yriyjf>
References: <cover.1728579958.git.tjeznach@rivosinc.com>
 <b8da2b00aec3f7b4b2e3a7cc194f7961bf656f24.1728579958.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <b8da2b00aec3f7b4b2e3a7cc194f7961bf656f24.1728579958.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_023525_706225_27F0C1B3 
X-CRM114-Status: GOOD (  13.37  )
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
Content-Type: multipart/mixed; boundary="===============9033658271179295425=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9033658271179295425==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3vc2emncsrj4cjb2"
Content-Disposition: inline


--3vc2emncsrj4cjb2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v9 2/7] iommu/riscv: Add RISC-V IOMMU platform device
 driver
MIME-Version: 1.0

Hello,

On Thu, Oct 10, 2024 at 12:48:05PM -0700, Tomasz Jeznach wrote:
> +static const struct of_device_id riscv_iommu_of_match[] = {
> +	{.compatible = "riscv,iommu",},

nitpick: Unusual indention:

uwe@taurus:~/gsrc/linux$ git grep -l '{.compatible =' | wc -l
192
uwe@taurus:~/gsrc/linux$ git grep -l '{ .compatible =' | wc -l
4197

(Hu, I expected the difference to be bigger than a factor of ~20.)

I'd go for a space before ".compatible" and one after the trailing
comma.

> +	{},
> +};
> +
> +static struct platform_driver riscv_iommu_platform_driver = {
> +	.probe = riscv_iommu_platform_probe,
> +	.remove_new = riscv_iommu_platform_remove,
> +	.driver = {
> +		.name = "riscv,iommu",
> +		.of_match_table = riscv_iommu_of_match,
> +		.suppress_bind_attrs = true,
> +	},
> +};

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers. Please just drop "_new".

Best regards
Uwe

--3vc2emncsrj4cjb2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcPiNcACgkQj4D7WH0S
/k7leggAlsgDNwa3KOwBku5V/0eQ57YS6VqfeJom1rXbWx9kfuKXyA1X2FD5V6eH
DEc2IdXEIy1pM/AxZbbt5gNqs2UR6L9VfWToyK+unN62it0PTXxp21dUmdjRXH6e
1nb0PRAAknig82wzfc7EedPJZgp6E46w229pZbiIwOpDbgQOko+r7X3qBB/g9qUh
EHzEVCZ61ySvWWlo5n6mglBmMAiAOB1K/j13oLIp5Em2ym2r+J5/Tq4FmLhe3Evb
auslSx2a/QBlMF2jpdrxRBiCYjlDXbcU27NkVEimEgu/56llOuhZisOYCTlmnMYR
Cr+0vmUBG3jSXmSBeNr4sS9tAy0J6g==
=+mcI
-----END PGP SIGNATURE-----

--3vc2emncsrj4cjb2--


--===============9033658271179295425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9033658271179295425==--

