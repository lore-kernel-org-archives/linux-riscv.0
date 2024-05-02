Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36538C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 15:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Unzz4ioskQ3DsU9xA/35dRqA5A9fTbZzC/brxUJ+IyY=; b=3n/V9yvIgF3MaEybhY4wYelYgM
	u8KHQ6ZfgEQFyQ9anj5zwARCXh+7gnHBHtgqrgY+jTZaxxVp8Ix7D0hpS6lPtI2z0QelYDzs0G0GT
	tGBV/WJs36cD737kcBM+Mjyko0nTKtSrGRxWesgsf50S6RaLYoojPJT6QWz71oWa39vRyKaySSLxu
	qdZ6pOiBwBuSp2sTzARuRAZCdYNkgr370aJKFmGhy1kvml3FFh7KwEJWMmhignmKBrl1YPm9HiDGm
	YOiI3bNwP0h/+80SqJNgbeaSFv08nsqSMKn8O7I25eJxlTBePgaxyUa2aHnHxrMl/GRz+QD7DEh4T
	cGW5zGAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Y9e-0000000D4Xl-15LQ;
	Thu, 02 May 2024 15:15:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Y9b-0000000D4Wf-11N3
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 15:15:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBAFE61B5A;
	Thu,  2 May 2024 15:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55E1C113CC;
	Thu,  2 May 2024 15:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714662920;
	bh=FisbOIvpsVFit1c3nYfm8hroZ9Szugxt6WvcPdNmDXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cdGtJqcd5fVh7bj9oZhXSfqR81kQ8rxg8zX7EWRjtJ2fxwk0Q8JMCPPJyxpom/Fth
	 QVE5kX7tB6l6erQl2nFTBv4NO1aJ5S3wpPlZeOdRf8s+IqzeorbY/hvGx6a3z2x7us
	 krVANv49x9ACe1fcgByZlVCWbCZol5pQ53pw717SHj3KoFDXmdpFMXCQ8P84PmQT7R
	 FNyEuNwPptKypEI+EBm/bKAYrlj0GrfSgsoLs0HMb3SJQdV8BuzQRyBkD7DglZnmuj
	 M69io1YoV9YM+0892j61PF87j+WVVeLu5pv2c3hrC5R2GgMq252AYIUgytHmyNY5bP
	 bDXqfXj230J2g==
Date: Thu, 2 May 2024 16:15:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: iommu: riscv: Add bindings for
 RISC-V IOMMU
Message-ID: <20240502-gains-finless-1168f9f0622f@spud>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
 <ef946892252b18f541986a461fc4d37957cc805e.1714494653.git.tjeznach@rivosinc.com>
 <20240501131556.GA2931109-robh@kernel.org>
 <CAH2o1u5OYORHNuBC17DHkRFm6D6b8qaQVep8vX4kVzJAkk36HA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH2o1u5OYORHNuBC17DHkRFm6D6b8qaQVep8vX4kVzJAkk36HA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_081523_355161_4671AA49 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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
Cc: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, devicetree@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7434841931333417971=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7434841931333417971==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SXPzoaVNzsHbB3bu"
Content-Disposition: inline


--SXPzoaVNzsHbB3bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 01, 2024 at 07:47:41PM -0700, Tomasz Jeznach wrote:
> >
> > 'qemu,iommu' is too broad. Could be other QEMU implementations of an
> > IOMMU. So 'qemu,riscv-iommu'.
> >
> I'm ok with that. Any objections from others?

None here, you can keep my tag with the things Rob noticed.

--SXPzoaVNzsHbB3bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjOuAgAKCRB4tDGHoIJi
0g/XAP49wf/9XIdSLHOzXM2XNwC6zzNqel9e+7K0mLiSKhi7IQEA7aVbXkabNtlR
W/eULVth2tAgbe5pRhdFwJFXa3pR7Qo=
=z6Kf
-----END PGP SIGNATURE-----

--SXPzoaVNzsHbB3bu--


--===============7434841931333417971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7434841931333417971==--

