Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969EDC77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 15:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgFVx3xWqbTjQ7Sjv99QKdnZqQBmi+HkaTMQo7seZQ8=; b=pEyAtEZQyUXqPseqzvqsY50QPO
	ydX1afHwE9qJZm2eLo6GzYSRDUJVLU/vGtTZ1i+XndO5ukf1mYPTKtU3MA2QzKMfd55reCQCiVi6j
	bEW0T06ARU8dVm6AeVVma15rCACl0J/XXFq1V9QAcvDDxsgnEdJycJIMu9emruvkOo8nRkEVbBpat
	jZoQYg5HiXt+tCxw4erJR4d03enBpb5MwUJQT0qBuAqAbZQp2SqJeDwSuFFRSuavgDOu75RGVQAxq
	5rKB/XeuWjK0Qcfnk/wCwS3ByLNy07W+LugXRfvuswVoLVwIpSb3RYN0DMkCjTcXXt/TD+4wXwtIP
	ZRrbnXeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px8Fx-009DFc-05;
	Thu, 11 May 2023 15:31:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px8Fu-009DEt-27
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 15:31:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C53C64F01;
	Thu, 11 May 2023 15:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE00C433EF;
	Thu, 11 May 2023 15:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683819057;
	bh=SJGJCU3gDVdyuC2QEctenjUwW0dVdNNgc2Fs7wfRUns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Plchd8Sgzf0HyZ6hAta56VujgSCqgIqmnXlPXxDg3/EQeUS2meUBh57yRNcbIwcvf
	 ymUNvFgu9cQF2habL+H6SJxZyzn0tSJV68f1wG3dlb8dcbYDPRRCylRubpvGiung9b
	 Acu3rRXq2q6WQ4S592Be2MD7seZqsiHsRJm9kjPULT4RIIz5eeSAiL+mBiBqBSJ29e
	 nvQTswr6Xhoao9K2aYU2ZCFBoAXe1qDBf8MpGgmIipD+pWELVlZfFstz5/Wwh6gpQy
	 cm9Pq+e3lC3hTAIuubP7rfe07pmFqU8pnAD3sPbd6sWBhcsi6eiB+4xiyjIHYHU0x1
	 n71zOWGE8XU0w==
Date: Thu, 11 May 2023 16:30:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] PCI: microchip: Avoid cast to incompatible function type
Message-ID: <20230511-coming-saturate-a2ae32462a3a@spud>
References: <20230511-pci-microchip-clk-cast-v1-1-7674f4d4e218@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230511-pci-microchip-clk-cast-v1-1-7674f4d4e218@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_083058_769521_3215E0EC 
X-CRM114-Status: GOOD (  22.17  )
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
Content-Type: multipart/mixed; boundary="===============7188178736652920318=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7188178736652920318==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EILHGzwimB/Seb9q"
Content-Disposition: inline


--EILHGzwimB/Seb9q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 05:24:18PM +0200, Simon Horman wrote:
> Rather than casting clk_disable_unprepare to an incompatible function typ=
e,
> update the type to match that expected by devm_add_action_or_reset.
>=20
> Reported by clang-16 with W-1:
>=20
>  .../pcie-microchip-host.c:866:32: warning: cast from 'void (*)(struct cl=
k *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-=
function-type-strict]
>          devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unp=
repare,
>                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>  ./include/linux/device.h:265:38: note: expanded from macro 'devm_add_act=
ion_or_reset'
>          __devm_add_action_or_reset(release, action, data, #action)
>                                              ^~~~~~
> No functional change intended.
> Compile tested only.
>=20

Yeah, there's already a patch for this:
https://lore.kernel.org/linux-pci/20230111125323.1911373-3-daire.mcnamara@m=
icrochip.com/

The lads didn't want to pick any of that piecemeal & Daire hasn't been
able to get back to that work until this week.

I don't think we an ETA though on a v4, so:
Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip PolarFire PCIe controll=
er driver")
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
and I don't know if you wanna propagate the:
| Reported-by: kernel test robot <lkp@intel.com>

Thanks,
Conor.

> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>  drivers/pci/controller/pcie-microchip-host.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/c=
ontroller/pcie-microchip-host.c
> index 5e710e485464..d8aa6e3cdbff 100644
> --- a/drivers/pci/controller/pcie-microchip-host.c
> +++ b/drivers/pci/controller/pcie-microchip-host.c
> @@ -848,6 +848,11 @@ static const struct irq_domain_ops event_domain_ops =
=3D {
>  	.map =3D mc_pcie_event_map,
>  };
> =20
> +inline void mc_clk_disable_unprepare(void *data)
> +{
> +	clk_disable_unprepare(data);
> +}
> +
>  static inline struct clk *mc_pcie_init_clk(struct device *dev, const cha=
r *id)
>  {
>  	struct clk *clk;
> @@ -863,8 +868,7 @@ static inline struct clk *mc_pcie_init_clk(struct dev=
ice *dev, const char *id)
>  	if (ret)
>  		return ERR_PTR(ret);
> =20
> -	devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare,
> -				 clk);
> +	devm_add_action_or_reset(dev, mc_clk_disable_unprepare, clk);
> =20
>  	return clk;
>  }
>=20

--EILHGzwimB/Seb9q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF0KLAAKCRB4tDGHoIJi
0tK+AQD8LmbqfvLBNOFt2fxN3TxKPiyS2a77L81h8U5fsh6TCQD/ZHftPgTlHksh
kHFdg+H8MRi1rLrypMvc0N6nRlCySwM=
=Prv1
-----END PGP SIGNATURE-----

--EILHGzwimB/Seb9q--


--===============7188178736652920318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7188178736652920318==--

