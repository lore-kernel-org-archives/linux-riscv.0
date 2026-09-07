Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345FAC79FA0
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 13:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sb9Xybdx8MFFn7l6GjCJATMWLJaK8ZPzDrB1oZQ3p6I=; b=lhiHCNt0fbIkiSWNtdyLgz10A0
	oXGQVkNTk29Uq/O7wmPL9kvLbdhKR5VYeaQcpnWqZgqDcgYwUgMLUwtMSdhEwQ2UtwgEesyDHoMut
	0W3arT7du9kiGs4kJQbGb5h8P6rvY6wdiNh1dEdiRtTuudYp+T9EtpdZodghs0T8yNJgJkZPAcQZQ
	rb7QyhDgDqjqHdjfAbfvmf5wbhFKkyIO8Ht5xRxEKOMaZHebSeKgoAuc7KJ74tFzwG1exTHXbW1wp
	zBgft05hf5GowAigHoyf29jJ71oQzGRfye9mxSoxonUMJT/y/XqBzfXU00+UFKe3TpD+Cc+pDH8Py
	av4TnREA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZBr-00000006uXC-3lIG;
	Mon, 07 Sep 2026 13:15:15 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZBp-00000006uV4-0Vgr
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 13:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788786871;
	bh=Jk81SOn3/8DCg9Sox3f3yf72BQ53Su58jLkQOm28g3k=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=O5RVqvpNQRMoltwwxPWLjw9ebpujJ70vO1pMXRexd8qx74JxwB9cZGr+Dc1UEYXe/
	 3MB1MMRxH9yCMofcxFls/tNhTrtfWLLGnhJ/r3aBk8UiJ3mXmcootFEcBQjQVuy7NG
	 zLu2fXgjcA9RKtVTpLGlc6PMu1Vzm6IRas6p+gr4=
X-QQ-mid: zesmtpgz4t1788786869tac4a6f92
X-QQ-Originating-IP: OzXVZnIteLlUqwcgDV6bIEY0nAxOM5yVRWMFcHV3YdA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Sep 2026 21:14:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16469169757696969586
EX-QQ-RecipientCnt: 41
Mime-Version: 1.0
Date: Mon, 07 Sep 2026 21:14:23 +0800
Message-Id: <DL940SRP94AG.408BKFWHDVY3@linux.spacemit.com>
Cc: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, "Yixun Lan" <dlan@gentoo.org>, "Longbin Li"
 <looong.bin@gmail.com>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v5 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Inochi Amaoto" <inochiama@gmail.com>, "Jingoo Han"
 <jingoohan1@gmail.com>, "Manivannan Sadhasivam" <mani@kernel.org>, "Lorenzo
 Pieralisi" <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Frank Li"
 <Frank.Li@nxp.com>, "Niklas Cassel" <cassel@kernel.org>, "Sherry Sun"
 <sherry.sun@nxp.com>, "Arnd Bergmann" <arnd@arndb.de>, "Christian Bruel"
 <christian.bruel@foss.st.com>, "Krishna Chaitanya Chundru"
 <krishna.chundru@oss.qualcomm.com>, "Senchuan Zhang"
 <zhangsenchuan@eswincomputing.com>, "Alex Elder" <elder@riscstar.com>,
 "Xincheng Zhang" <zhangxincheng@ultrarisc.com>, "Randolph Lin"
 <randolph@andestech.com>, "Siddharth Vadapalli" <s-vadapalli@ti.com>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, "Vidya Sagar"
 <vidyas@nvidia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Danilo
 Krummrich" <dakr@kernel.org>,
 =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>, "Pengpeng Hou" <pengpeng@iscas.ac.cn>,
 "Anirudh Srinivasan" <asrinivasan@oss.tenstorrent.com>, "Gustavo Pimentel"
 <gustavo.pimentel@synopsys.com>
In-Reply-To: <20260907112606.465778-7-inochiama@gmail.com>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-7-inochiama@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N/HQSHwfvuIP8U3GKpM4u4fURsdB/lpD04rj1pPq90zjf4lHPwi6bul9
	s44mdLhhWqWGQTxTaHvg502Tjl1Q0NbTN1abmx4Sk1U561mZQNfrFElNfP9zQSj1kJoII3C
	MRKl/iaxNtZA5p2eTFoQxTT+kT6RBRivGfpuzdzGG6ZYuhHg4dYxAhyVjE2u7eIwRz4q5wZ
	885x7remQZHxLB55UitaF5ILZqmDNQr81lMbebMau/x4hcfNFZymh5LHKttFOBiuJGCEe0s
	iLO1ZD+HZr/MwNPdJXqR5ghbXmoGV17TLOBWQYIK5ttj5H6c/SMB4N6jRM1vKg6lwb7FlLF
	8NAbAo1yju0oZDygjkB3jucoddZf1mimVKCo6WfxqD74VHChhu8MGpwO5yVxHHo7BmA+cm+
	00MzWcDf3UZI3w97c4q0cwwwmEWshdXukzwFDXO/Xx44gg8PIOkJD0eIs5R2IYexA7xp5aw
	yp145G3p9cZLSqdj8tYhGcvz++nYI6KfXV2aBsTEJq93kUElpq7KUzKXgGsnajufhzLPfm6
	oUHAZlFaH55A3Fn48CeSK8PShc5Zq6E+H/kbvcionVIO+DSfyimwNEZG/7gt/TT0MXo4I22
	PTyH6ug1vdP3VCcYZ39469PfCwpCFFV0snOdsacM7NaI3k89Z1MrjylOAPL3N93kIf88kKW
	c2F2BHVPGqgjDiFNxatlTlHoBujPN5iB9qcN21uRuCO92OXlESaB88jDy0CF5U0uiOuKWmR
	i7Jb/pYcmXG2lUEMBXi9RjZTPRdcrdWpJCKpRhnDAOIIUEsIU5MhZ39tAojH9oZvhOgIwUT
	W83wzUlTPgVn/aLwxUjPnBDi8SFlht14NTYzktISzII9T0NJb6+yqthVtuAh1pIoS4X6yxg
	GBfCt3D/m9kOtCWeFkacbAlNB52Crl9IySf6nghsVhRnEELjpSlk7HUk9SK+594YFAQTXtL
	fMoTclNpjp/C2OPKAa+L6+PFc8UGTXHKlnSzGtGJaqPsTfB8O1czt9yvzdLoqBh+HY8ODee
	5qwoEiBkCUxYSRMQMv5CRFNJoQlHidnFGnRJ9WUVggArNGBBfCsMJaKOMf1ms8loJH2FbNu
	6WlIwDy+7sY5IEc70FvxAIyCLziNJrOPw9zzHZ9CCmf
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_061513_563156_C3A66732 
X-CRM114-Status: GOOD (  18.13  )
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
Content-Type: multipart/mixed; boundary="===============0398160711786959337=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0398160711786959337==
Content-Type: multipart/signed;
 boundary=b1ec608241a1d67d557c4119b4b934d57a888dda4ac98415da6425cd98df;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit

--b1ec608241a1d67d557c4119b4b934d57a888dda4ac98415da6425cd98df
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 7, 2026 at 07:26:05PM +0800, Inochi Amaoto wrote:
> [...]
>
> @@ -303,6 +316,116 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
> [...]
>
> +static int k3_pcie_init(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
> +	struct k1_pcie *k1 =3D to_k1_pcie(pci);
> +	u32 reset_ctrl =3D k1->pmu_off + PCIE_CLK_RESET_CONTROL;
> +	u32 val;
> +	int ret;
> +
> +	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);
> +
> +	k1_pcie_toggle_soft_reset(k1);
> +
> +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> +	regmap_update_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT,
> +			   PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE);
> +
> +	ret =3D k1_pcie_enable_resources(k1);
> +	if (ret)
> +		goto failed_resources;
> +
> +	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
> +	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
> +
> +	ret =3D phy_bulk_init(k1->phy_count, k1->phys);
> +	if (ret)
> +		goto failed_phy;
> +
> +	msleep(PCIE_T_PVPERL_MS);
> +
> +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> +			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
> +

Should we use pci->pe_rst when reset-gpios is provided, and keep the PMU pa=
th as
a fallback? The SDK handles both cases. The DWC core requests that GPIO wit=
h
GPIOD_OUT_HIGH, but this path only releases PERST# through the PMU, so an
endpoint using the GPIO would remain in reset.

> [...]
>
> +	/* Finally, as a workaround, disable ASPM L1 */
> +	k1_pcie_disable_aspm_l1(k1);
> +
> +	return 0;
> +

Would we also need to configure IOMMU bypass during initialization? The SDK=
 sets
the PCIe A/B/C bypass bits in PMUA_PCIE_SUBSYS_MGMT when there is no usable
iommu-map. The proposed K3 PCIe DTS has no iommu-map, and I could not find =
the
corresponding bypass setup in this series.

Is bypass already guaranteed by firmware or the reset state, or should the
driver set it here? My concern is that enumeration could succeed while endp=
oint
DMA still goes through an unconfigured IOMMU.

> [...]
>
> +static int k3_pcie_parse_port(struct k1_pcie *k1)
> +{
> +	u32 status0, status1, status2;
> +
> +	/* This register require a RAW for cleanup */
> +	status0 =3D readl_relaxed(k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> +	status1 =3D readl_relaxed(k1->link + INTR_STATUS);
> +	status2 =3D readl_relaxed(k1->link + K3_ADDR_INTR_STATUS1);
> +
> +	writel_relaxed(status0, k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
> +	writel_relaxed(status1, k1->link + INTR_STATUS);
> +	writel_relaxed(status2, k1->link + K3_ADDR_INTR_STATUS1);
> +
> +	return k1_pcie_parse_port(k1);
> +}
> +

Are these status registers accessible before the controller clocks are enab=
led
and resets released? k3_pcie_parse_port() runs before dw_pcie_host_init(), =
which
calls k3_pcie_init() to enable those resources.

The SDK uses the same ordering, but I am not sure whether it relies on firm=
ware
leaving the registers accessible. If so, would it be safer to move this cle=
aring
into k3_pcie_init(), after enabling the resources?

                                            - Troy

--b1ec608241a1d67d557c4119b4b934d57a888dda4ac98415da6425cd98df
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCap64rw0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvJyoBAMpzza2UFaPDU3N6OzT6Pqz98vTMH5QXSPlFsd2z
64hpAQCY98sw331RfVmJSB3JJfdQnKR6BfPFZ+1YGs40dQ6dBA==
=p+m0
-----END PGP SIGNATURE-----

--b1ec608241a1d67d557c4119b4b934d57a888dda4ac98415da6425cd98df--


--===============0398160711786959337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0398160711786959337==--

