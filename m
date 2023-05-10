Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93351C7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 12:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDKV5vfSqIk9stUoZ9xn9lTf7XIW/lHyxDlr/fElSJw=; b=s4cj65Jnqx/BNadDZ3ldIkwdHf
	VgruFL2eS9EVqo0l+2L+NXwuUfogfChx/FlM8ErlrKn/+7igWSX6R3hiTtm5CXzTnyzA0mNAHCjqb
	mhMbt72jTpXgH6RMJlKl4PjKg4e2a5jhhLN8eGyjg/CmpEORFi1kgyp5tutasWpk7FMp5hklzhxeP
	wN2L+9AeRW/shEuwSpFNHAzyEkq/85P6Ssxi0lqwsY8eGrCMhGnAcFpBQDNgaww9dDaiKV/kvH+xC
	3hb5nCPbm19ZXQ+8e9mGp4mbu0hq/1JyTYsqxuTF6HjaYL/AlK9c3jk4aGmNPAl43SIVk2lq8up9m
	CiQsEIbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwjCP-006AJ0-2U;
	Wed, 10 May 2023 12:45:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwjCN-006AIC-01
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 12:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683722738; x=1715258738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ft2xF1mBOJy5jrUDL8wm0sluvoXUoK2p6NXMOoc4iMo=;
  b=AjYOybWuKdw4beUkcjBXIYOC92Kd7RWy+Y9ZW4Mn6BT24RyMu2ApQH2G
   l/e+6n0fqbdsveWMvdcwLFIg4fXRTYoWmrFpaJlJ+bJ7Pj16/l+/1lQ2X
   DXFRSeeuLfDRm55Jc1aaMSpOPbjQornf1M9AYWhgCqtTXHg1m8c76PFZs
   o+PHwbWiI9mteJKKs8IKK8RbrO2wYfDpfe8WuQoaM58OfOj8r07GFTPSl
   XOICvwBeI4yu0jchAm9K+dLt3QeVwCzOE3KE8Sz5HBO798meZE336u1Cz
   prZJ5Dh1tyF0bfcINtlkOLVHrPU/8frI+H70AwUF5OfJso1JGPAqyAbyM
   w==;
X-IronPort-AV: E=Sophos;i="5.99,264,1677567600"; 
   d="asc'?scan'208";a="214647202"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 May 2023 05:45:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 10 May 2023 05:45:31 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 10 May 2023 05:45:29 -0700
Date: Wed, 10 May 2023 13:45:09 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <apatel@ventanamicro.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Robin Murphy
	<robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Atish Patra
	<atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, Anup Patel
	<anup@brainfault.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<iommu@lists.linux.dev>
Subject: Re: [PATCH v3 01/11] RISC-V: Add riscv_fw_parent_hartid() function
Message-ID: <20230510-squealing-pruning-2c94b85785b0@wendy>
References: <20230508142842.854564-1-apatel@ventanamicro.com>
 <20230508142842.854564-2-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230508142842.854564-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_054539_122905_96333A2A 
X-CRM114-Status: GOOD (  22.37  )
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
Content-Type: multipart/mixed; boundary="===============8853042213456947794=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8853042213456947794==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7J+wqfSckLJsTGge"
Content-Disposition: inline

--7J+wqfSckLJsTGge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 08, 2023 at 07:58:32PM +0530, Anup Patel wrote:
> We add common riscv_fw_parent_hartid() which help device drivers
> to get parent hartid of the INTC (i.e. local interrupt controller)
> fwnode. Currently, this new function only supports device tree
> but it can be extended to support ACPI as well.
>=20
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/processor.h |  3 +++
>  arch/riscv/kernel/cpu.c            | 12 ++++++++++++
>  2 files changed, 15 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/=
processor.h
> index 94a0590c6971..6fb8bbec8459 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -77,6 +77,9 @@ struct device_node;
>  int riscv_of_processor_hartid(struct device_node *node, unsigned long *h=
artid);
>  int riscv_of_parent_hartid(struct device_node *node, unsigned long *hart=
id);
> =20
> +struct fwnode_handle;
> +int riscv_fw_parent_hartid(struct fwnode_handle *node, unsigned long *ha=
rtid);
> +
>  extern void riscv_fill_hwcap(void);
>  extern int arch_dup_task_struct(struct task_struct *dst, struct task_str=
uct *src);
> =20
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 5de6fb703cc2..1adbe48b2b58 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -73,6 +73,18 @@ int riscv_of_parent_hartid(struct device_node *node, u=
nsigned long *hartid)
>  	return -1;
>  }
> =20
> +/* Find hart ID of the CPU fwnode under which given fwnode falls. */
> +int riscv_fw_parent_hartid(struct fwnode_handle *node, unsigned long *ha=
rtid)
> +{
> +	/*
> +	 * Currently, this function only supports DT but it can be
> +	 * extended to support ACPI as well.
> +	 */

Statement of the obvious here, no?
Although, it seems a little odd to read this comment & the corresponding
statement in the commit message, when the series appears to have been
based on the ACPI?

Perhaps by the time v4 comes around, ACPI support will have been merged
& that'll be moot.

> +	if (!is_of_node(node))
> +		return -EINVAL;
> +	return riscv_of_parent_hartid(to_of_node(node), hartid);

nit: blank line before the return here please.

Thanks,
Conor.

--7J+wqfSckLJsTGge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFuR1QAKCRB4tDGHoIJi
0i56AP9FXRjPPY/ysx3+btPbR/gOm42Ygf+JSC4zYeMmWzv56AEAloGa6J6cwoJk
U1ibc9oqpOeFavnGuNNDRsxCfer39AE=
=fBPY
-----END PGP SIGNATURE-----

--7J+wqfSckLJsTGge--


--===============8853042213456947794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8853042213456947794==--

