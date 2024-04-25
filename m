Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF4FC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 17:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sjwK6X7eD9zE+HODCLrRnoo5LXEqRP5UMri6OrDPg0=; b=0LPmu/jVqL05X/NjnpXmtsuGuV
	hOj4eho+dIspTO55VOfN/keYZCCmdtz4e3qywV2Xu8lJcwn0a/pwVGhnhobS3AVcKzJhk7RnFnNb0
	80bOBXV1P2lndeHSRsHgywtV5HWwBiuMtoTguQ1e/UOZyQu3t4sh8rfu7yfRVIqVaI+2Tup0PFHk9
	T8X10Z3s4Wkh07xybz0mNZ8pOrnliLGC2/y/j+q+c2Vbod+I/cV60VmGpu25xd/WjkoPxSIbmBTtQ
	2/+9tDEarJ5uqvYD5ExBM5eNXpIJJOrT3In4/BpDJ7hqpugmQCB2OlCgqf+l3eWnzRBeLLqt2qvJA
	SCoQVaCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s02cs-00000009WjP-1R1Q;
	Thu, 25 Apr 2024 17:11:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s02cm-00000009WgD-3JFa
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 17:11:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32CF661389;
	Thu, 25 Apr 2024 17:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35163C113CC;
	Thu, 25 Apr 2024 17:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714065067;
	bh=rQqUpvh48d2fFx+wEaWpZgBfJ44kNNs6Q4v8vtEjFa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pVwne1dhgdktoKKlKWhDtSlmrdFaxgvFuvEKeBom6NnmYUhYqoX9fWKES9qHMe86D
	 /kwyydhCCxlPYJXX2yUIAZ9ZOANVfeJtdb9qnopUdMtJsI5VGlpHXxuH0I7nj9zZat
	 SzExn0U/xevuGBC57zhIkb+c2rFgRhzQZ+exSgdgDdjZgi+8ltvqvozAjNt0mWxjaq
	 sD2FIn68bRvp89XPlguf9IqAZOeMjIJsGgyqVc+4q6Eo4QZ2sG3uNFaVU6fw2W9YX5
	 n8PrSPymLXpnyr429BBfQ+77V4+YvfK6COj7NuvwMBaWxvelxl4/a6T4xUtCUrL/1l
	 dtizFhdsjJayw==
Date: Thu, 25 Apr 2024 18:11:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: iommu: riscv: Add bindings for
 RISC-V IOMMU
Message-ID: <20240425-nursing-ground-7a3f92120058@spud>
References: <cover.1713456597.git.tjeznach@rivosinc.com>
 <c37cb93e7baa7042a3f82130bf30be6831b558dc.1713456598.git.tjeznach@rivosinc.com>
 <20240418-approach-liquefy-04551ddefbc4@spud>
 <CAH2o1u7_v=_GX5cnV5X14jggTycRTvGEJ1r_9tqtb-xgk=LEkA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH2o1u7_v=_GX5cnV5X14jggTycRTvGEJ1r_9tqtb-xgk=LEkA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_101108_921214_C6C32C47 
X-CRM114-Status: UNSURE (   9.36  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0480153354722145199=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0480153354722145199==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Swwc95+Q8CpAtvFV"
Content-Disposition: inline


--Swwc95+Q8CpAtvFV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 24, 2024 at 03:37:14PM -0700, Tomasz Jeznach wrote:
> Makes sense.  Will update to something like below:
>   compatible:
>     oneOf:
>       - items:
>           - enum:
>               - qemu,iommu
>           - const: riscv,iommu
>       - items:
>           - enum:
>               - pci1efd,edf1
>           - const: riscv,pci-iommu

That seems reasonable to me, addresses both what Rob and I pointed out.

Thanks,
Conor.

--Swwc95+Q8CpAtvFV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiqOpgAKCRB4tDGHoIJi
0iOwAP9rRgNUMnh8lOU9vNTRQerc6pb2yB1UEPBpVUg2JN4ahwD/fUj0t4ghfeIS
Nh5gnWL7xHYspUt3P4f/ljOrutHJywY=
=6/MB
-----END PGP SIGNATURE-----

--Swwc95+Q8CpAtvFV--


--===============0480153354722145199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0480153354722145199==--

