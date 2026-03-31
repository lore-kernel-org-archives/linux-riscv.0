Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBAEFF60F4
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 17:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mr5P0vKatiaRsykFLUCAHyeNlKPf0EVbbk8FZghww5M=; b=u0SXbrfiKPTBGFTu7Dw/F3uEZ3
	Hc++Xt+/CwZ8KE35XgtG490BS5hBK3P4AhEzjMqt+pSWAz/pNCAcVEJYCkCXiIx0o0B6dvRlUEW91
	2Xrf0VpdhXm77aROxLecWIViHA2/KFWTEAR7XWTl//T/uliLBVUKV3WeZNoJ845U2AClTdkbMW/4u
	IPct+mfZld8mXiM6Be8bpga+AiD0sKVNn4cB+ImbmfURPk7JLJMK79/7NwhPpHRqUYCQW6evYPW66
	pual0Fb35cYTQzgzgGoFkSuKQpno0+14zBeYCJ6t3TEftzLskNnnL8LpILVaQtJeuo75Ge2WU5ttQ
	6O2Nwl4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dLV-0000000DNiC-48jQ;
	Tue, 31 Mar 2026 17:57:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dLU-0000000DNhA-100B
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 17:57:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A6ACE600AD;
	Tue, 31 Mar 2026 17:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3D1C19423;
	Tue, 31 Mar 2026 17:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774979863;
	bh=jRshRvrfE1K59jC2hI9BuHoXj8it76oESI+BdTN4Kgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pRSW3mjQ48Dt/YlOJZnRKmYJu7Y2M4fgwblouezDaGCDM0um5+fik1vNIg59W0cXj
	 0cZvXUClUM4+UNePXX4WB0SJFTDN8iEHo9f56aJmOlDiOql3qGRKcRcMvN/mAiQOBZ
	 VaeXT05O0+C63Whi7bzNO0ZHVmRr2euuM7MUrrStZPJd64SaT0OxUec/z+YugZWkVA
	 77YgXyRYuSHmOf3M/WdQjfZG3fc0voAk9b1MBaMWAHYYMx8EFUO+P7800CuoUx7bkj
	 JJ7anQ/lJlIEO6+6J8f9y9IQfLGjiF7jGcUDogoN0t6y8G+pDwaohQ0l7Xw8PAiFt6
	 LvER2PUbeI4ug==
Date: Tue, 31 Mar 2026 18:57:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Zixian Zeng <sycamoremoon376@gmail.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Han Gao <rabenda.cn@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe
 controllers
Message-ID: <20260331-outlet-molehill-939c0daacd06@spud>
References: <20260331171248.973014-1-gaohan@iscas.ac.cn>
 <20260331171248.973014-3-gaohan@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260331171248.973014-3-gaohan@iscas.ac.cn>
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
Content-Type: multipart/mixed; boundary="===============2418044071087719074=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2418044071087719074==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m8oXAjQqyBqcuv3C"
Content-Disposition: inline


--m8oXAjQqyBqcuv3C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 01, 2026 at 01:12:48AM +0800, Han Gao wrote:
> SG2042's PCIe root complexes are cache-coherent with the CPU. Mark all
> four PCIe controller nodes (pcie_rc0 through pcie_rc3) as dma-coherent
> so the kernel uses coherent DMA mappings instead of non-coherent bounce
> buffering.

Worth pointing out I guess that this property is needed, despite riscv
being coherent by default, because the whole bus is marked
dma-noncoherent.

>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/sophgo/sg2042.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts=
/sophgo/sg2042.dtsi
> index 9fddf3f0b3b9..3af770549742 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> @@ -417,6 +417,7 @@ pcie_rc0: pcie@7060000000 {
>  			vendor-id =3D <0x1f1c>;
>  			device-id =3D <0x2042>;
>  			cdns,no-bar-match-nbits =3D <48>;
> +			dma-coherent;
>  			msi-parent =3D <&msi>;
>  			status =3D "disabled";
>  		};
> @@ -439,6 +440,7 @@ pcie_rc1: pcie@7060800000 {
>  			vendor-id =3D <0x1f1c>;
>  			device-id =3D <0x2042>;
>  			cdns,no-bar-match-nbits =3D <48>;
> +			dma-coherent;
>  			msi-parent =3D <&msi>;
>  			status =3D "disabled";
>  		};
> @@ -461,6 +463,7 @@ pcie_rc2: pcie@7062000000 {
>  			vendor-id =3D <0x1f1c>;
>  			device-id =3D <0x2042>;
>  			cdns,no-bar-match-nbits =3D <48>;
> +			dma-coherent;
>  			msi-parent =3D <&msi>;
>  			status =3D "disabled";
>  		};
> @@ -483,6 +486,7 @@ pcie_rc3: pcie@7062800000 {
>  			vendor-id =3D <0x1f1c>;
>  			device-id =3D <0x2042>;
>  			cdns,no-bar-match-nbits =3D <48>;
> +			dma-coherent;
>  			msi-parent =3D <&msi>;
>  			status =3D "disabled";
>  		};
> --=20
> 2.47.3
>=20

--m8oXAjQqyBqcuv3C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacwLDgAKCRB4tDGHoIJi
0rArAP4jBTmKxYWxfFJLKueDpo+mSl4SPqf6k8s8stuypnj0hgD+KEB3KaSC2+G8
0eWLoouJWr9QngLJgCKU1PJoXs9bvA8=
=eHvS
-----END PGP SIGNATURE-----

--m8oXAjQqyBqcuv3C--


--===============2418044071087719074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2418044071087719074==--

