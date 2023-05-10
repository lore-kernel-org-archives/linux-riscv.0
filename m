Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18D2C77B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 12:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYWY3Dpt4Wb1nr/fzslM2K/cT5RVyU1TS4kLbf9MvaA=; b=GWEYy405b27w51FjpKsjAd/xeM
	JCkq1LPB9TEe49XmgTKIvHwg5mCkd2gKvI9m7Qjz0sZOxddMlSEcvuFLuBP0gofef/uQGnGm+98BY
	KYkuQRNceO0A17uVq/b1Z5TRDvoQif/deKcVrnPnVi3kSDzGKCcYlct29A53YZA30FrJYxbGy1GEh
	kq8SS/kGroRtsOADYWKKaU5Sd77Q1oStzE5o7KfEMPPLNUvLDQ+rNi/pCxyxqnCHuYtwipdMkCTfC
	Kyme0Tm5r+B1VW7/N5AYjNPwKqDDEJUOX9UJTAJmVNVmPqtWmHg4RiTOf59JNHADILThxNC2jlqlN
	HNqG4/Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwikj-0067UM-2s;
	Wed, 10 May 2023 12:17:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwikf-0067TC-1x
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 12:17:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683721021; x=1715257021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c0LtGL7zvuyoxmCVFA1srE+yHPP0jp3sH5qXd5mFOug=;
  b=eq4UBJNfFAwnVa96S7LpMz/WTRTz2Degf1RyjfQRm5Ci3feSyyzVlnW+
   TIMGAJUPlQfShoMyIVhb/qyFXIOM3dgqILwg44H97SHm4+fMEYaVE1pap
   s2fyt51LH+1rht1sLVWTOn0uo+HlhVDbh2tTbMntevSGmHA1SP7HbF7MO
   HzAUR44UZ1GdMwcgUaM+w8umK2a7sFHcDh9q5opkRkGkcgmON02t0io2j
   daMzvwphexbR0E0HSAVkXJj6lc8A42Lik3COJM66cH++Yf9v4mltuoO1I
   0PaHyBY61xWKkT9nNYTvVHQNjcOVtRJp8Q4bBctUIZsMXVh/rprq1cz3T
   w==;
X-IronPort-AV: E=Sophos;i="5.99,264,1677567600"; 
   d="asc'?scan'208";a="210553509"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 May 2023 05:16:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 10 May 2023 05:16:45 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 10 May 2023 05:16:43 -0700
Date: Wed, 10 May 2023 13:16:23 +0100
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
Subject: Re: [PATCH v3 04/11] dt-bindings: interrupt-controller: Add RISC-V
 incoming MSI controller
Message-ID: <20230510-untried-duvet-7e3c230fcefd@wendy>
References: <20230508142842.854564-1-apatel@ventanamicro.com>
 <20230508142842.854564-5-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230508142842.854564-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_051701_699050_A1989C86 
X-CRM114-Status: GOOD (  12.19  )
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
Content-Type: multipart/mixed; boundary="===============7458990399880570599=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7458990399880570599==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yuw4pefuYIA+XBN4"
Content-Disposition: inline

--yuw4pefuYIA+XBN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Anup,

On Mon, May 08, 2023 at 07:58:35PM +0530, Anup Patel wrote:
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 16384
> +    description:
> +      This property represents the set of CPUs (or HARTs) for which given
> +      device tree node describes the IMSIC interrupt files. Each node pointed
> +      to should be a riscv,cpu-intc node, which has a riscv node (i.e. RISC-V
> +      HART) as parent.

One minor nit here about wording - "riscv node" doesn't seem
particularly clear to me, should it be s/riscv node/cpu node/?

My only thing last time around was my misunderstanding, and you also
appear to have resolved Rob's complaints, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Just to note, it'd be great if you could CC me on series that I've
already reviewed when you resubmit them?
Although in this case, if you ran get_maintainer.pl on v6.4-rc1 it'd have
told you to CC me anyway ;)

Thanks,
Conor.

--yuw4pefuYIA+XBN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFuLFwAKCRB4tDGHoIJi
0rSoAQDigVc1zoOIAq0GeK2C6LRDT48ecB1I90Fv+aw41IVdHwEApAt8ew3bob+u
Bn7gu+nIK1drEkZwQYODA5bMAVpuzwA=
=g+th
-----END PGP SIGNATURE-----

--yuw4pefuYIA+XBN4--


--===============7458990399880570599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7458990399880570599==--

