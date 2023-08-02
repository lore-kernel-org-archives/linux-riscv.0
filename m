Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4453C04E69
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 17:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ohqxmUQCE28BVjq9Q2zjh4hl7BSCLpvF8gQQLspiZE=; b=QL/9/Q+jAmwa+QfXh6R6St1Txo
	ciXk68NV/gvT5exeJQQ5/8GdtwNWkLFRtt0oFb9vOeuZ8bWs1NTPBp9BfBltzBG+qhnGZJH+wWfFL
	nKoX9yhOiqFpWbWo3+Xx3P9r6hjzpyV7/HgUha52oYfasaNyklCHFcEh/hIUhQp83CgcWvGjgbW8d
	tSEhtPv+JJpGVR0GXewRg4J6mvv9DmD4tzokJZcU9IGcnMg8Imo8jzuBXv8zbFp5Se+EuEXlQAyHJ
	YX2twzUGp/Zrop2j067iwnOYFlXZAp+GVAZNE8AS0njyEjeSVDKwOTdWGfS+xqgNbJRms6aXtNHnv
	wvR3N9Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRFX2-005UHL-2j;
	Wed, 02 Aug 2023 17:21:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRFX0-005UGT-1B
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 17:21:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C1A1861A41;
	Wed,  2 Aug 2023 17:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E76C433C7;
	Wed,  2 Aug 2023 17:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690996865;
	bh=V+7J5iMl8WESEj4Cb67K/RCJO33+poqVvT0BwhRiAxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IgN5nEWimzIHei44JnWou6LQO2Xz9xfPWdUscdopUP3nSooYinHWCg51jQogAfXCh
	 IkP6GhQ+mWg9fu5H5Ylu5pp8M8S9DubR+sNfef+b7QkdlI3aLBv+VY9kbCSFXNko1M
	 a4LpE7eIjsqQMxv6qZvfVOJI5KaJjkEcsyDVfbPAsTHiTjH7gzARVyv3ls+Rk7dAcw
	 oFluHqcZAfL5yarEIALIealee/EZtOXpNYeHws0R8PE5Cit3KKuP7M7F5RUJEfKHvf
	 3h90SnbMmrxXFmpJTfEh1knoGeZOmGYAPY2XvZEweDFLZBWuON3IFtLaTBq4zHtY3D
	 S2iJcB24T0hyg==
Date: Wed, 2 Aug 2023 18:20:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v7 01/15] RISC-V: Add riscv_get_intc_hartid() function
Message-ID: <20230802-deviancy-vengeful-cbecf4350526@spud>
References: <20230802150018.327079-1-apatel@ventanamicro.com>
 <20230802150018.327079-2-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230802150018.327079-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_102106_443660_6A1A91F2 
X-CRM114-Status: GOOD (  13.02  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============0254547889553314397=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0254547889553314397==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2kdZzoSQMTLDssYb"
Content-Disposition: inline


--2kdZzoSQMTLDssYb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 02, 2023 at 08:30:04PM +0530, Anup Patel wrote:

> +/* Find hart ID of the INTC fwnode. */
> +int riscv_get_intc_hartid(struct fwnode_handle *node, unsigned long *hartid)
> +{
> +	int rc;
> +	u64 temp;
> +
> +	if (!is_of_node(node)) {
> +		rc = fwnode_property_read_u64_array(node, "hartid", &temp, 1);
> +		if (!rc)
> +			*hartid = temp;
> +	} else
> +		rc = riscv_of_parent_hartid(to_of_node(node), hartid);

This branch needs to be enclosed in braces too.

> +
> +	return rc;
> +}
> +
>  DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);


--2kdZzoSQMTLDssYb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMqQewAKCRB4tDGHoIJi
0oI/AP4mfxD8KI2kW8xjXStGxSzehmET1254kpoBNm9rD/RP+gEAuB0Z2Cgramuw
EoCQ4U+WeJmvdDUdCguKiECHDM8AZgo=
=w4op
-----END PGP SIGNATURE-----

--2kdZzoSQMTLDssYb--


--===============0254547889553314397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0254547889553314397==--

