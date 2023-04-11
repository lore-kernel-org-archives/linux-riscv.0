Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CE0C7619A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 21:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YW6otizbrANTu6rDiLv5UhlKohIXsiKD06nf0kcXxk4=; b=me37fwkPOs0W5tyR8VUmVAyb79
	0K7YayKSLT3Zi7A3KUzIfuRxtluIdLhDoBMjhqcDmhRGx2oYlb88CXux2WfiZQ00X8qLBm2FHxB73
	6IVP6bulVT/QWHxEbXed0a+S+1hyTLC4FiccrhbzNFSpb+5kOD/0E9PtK5AuH7UpXd3Uhp/y7dKb8
	/U5oJYd5UqgK8h1PwMdhXYzCE5KhMHzISSyIyl0SAcI5JkDMukOd/qpwji6bV94DSURO2ycNfvnHD
	kzk2AK3oVM/TgH3IwrawpGEtHaNIkXqOmUu2IMMCZxntcZH5tXHlS4RDgSIQ1doZT7U5CTPmyfDhD
	qIXJxLrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmLCc-0018rJ-0z;
	Tue, 11 Apr 2023 21:06:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmLCa-0018qW-22
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 21:06:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 06DF460FA0;
	Tue, 11 Apr 2023 21:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3585AC433D2;
	Tue, 11 Apr 2023 21:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681247215;
	bh=P5kk+3HVor0otYo94Y9G9N4eNK+mWyQxWEUIOko/rMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PbIKZGOCX/7fiRt1GpDSR+rtak3ggv7H77B2RxD/Hc77w1JmFPLR1dnH1REUEzfSQ
	 DN0CCuxfM4QR88K9qVp3NoXzkSupq9iGFP3Fu6K3DNBxGB9ACEN4n6orD+FJ26IuEG
	 oi2rdpOCAVYKY0n7TT4Yq9lTLW4F9anemxOGpe4/2cKSJXNV5gMPUs96t2v3y7Ebnb
	 V/64xUxcPEfnuwKOZMo0ntcSqZlQAJWcLXAdHRE7TYxqNZ48q0f1j95flV/dmAE0B0
	 0HuDa55MzfNfqHNSM9NCfu5ml/xYvLPFi1S3thPEfiy5O2VdqkLL5evp3Ma1938+S6
	 9i+u/0/r8KceQ==
Date: Tue, 11 Apr 2023 22:06:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 5/7] soc: starfive: Use call back to parse device tree
 resources
Message-ID: <20230411-stimuli-reapprove-4659d50e5d2e@spud>
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
 <20230411064743.273388-6-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230411064743.273388-6-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_140656_712400_146A8C10 
X-CRM114-Status: GOOD (  14.85  )
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
Content-Type: multipart/mixed; boundary="===============4435593716108048142=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4435593716108048142==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bDUiOgF7hkvaIlrf"
Content-Disposition: inline


--bDUiOgF7hkvaIlrf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 10, 2023 at 11:47:41PM -0700, Changhuang Liang wrote:
> Different compatible parse device tree resources work in different ways.

Right now there is only one compatible, so this commit message needs to
be expanded on to provide more information on your motivation.

> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

>  static int jh71xx_pmu_init_domain(struct jh71xx_pmu *pmu, int index)
>  {
>  	struct jh71xx_pmu_dev *pmd;
> @@ -296,23 +325,20 @@ static int jh71xx_pmu_probe(struct platform_device =
*pdev)
>  	if (!pmu)
>  		return -ENOMEM;
> =20
> -	pmu->base =3D device_node_to_regmap(np);
> -	if (IS_ERR(pmu->base))
> -		return PTR_ERR(pmu->base);
> -
> -	pmu->irq =3D platform_get_irq(pdev, 0);
> -	if (pmu->irq < 0)
> -		return pmu->irq;
> -
> -	ret =3D devm_request_irq(dev, pmu->irq, jh71xx_pmu_interrupt,
> -			       0, pdev->name, pmu);
> -	if (ret)
> -		dev_err(dev, "failed to request irq\n");
> +	spin_lock_init(&pmu->lock);
> =20
>  	match_data =3D of_device_get_match_data(dev);
>  	if (!match_data)
>  		return -EINVAL;
> =20
> +	if (match_data->pmu_parse_dt) {

How can this be false?

Cheers,
Conor.

--bDUiOgF7hkvaIlrf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDXL6gAKCRB4tDGHoIJi
0hKsAQDfXKLTbzKOVFnOKyo4Q8rhO79dEC4uKOIjSEkTkNr0sAEAmTPcrqwT9S1J
id3pUSxlo+QqgTZJtIAEFaPBifiRGg8=
=MAxW
-----END PGP SIGNATURE-----

--bDUiOgF7hkvaIlrf--


--===============4435593716108048142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4435593716108048142==--

