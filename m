Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37846EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 19:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+piilWv2PkbEEuMvxoAe5JOjjZ/C4V/4+uCDR3+u4dg=; b=Vmu61SYOd/43nWE1EMP/xbjEO1
	ZDu8kQsqnHaEp22DHnt8TBiFVK+km0ovbmq/TItLKFlBD35k91moPBP83f1oYCtPaVw+znkJLMRTK
	jqPybEt+UggsFlEEFujXi8Q6tLLjIJW/3r3oqL1sDfh3uJkkp9wC9JK4Zof9OVWQIA/+XbvLrvDt4
	8kUWf6AmkbkIJ04zdWx2vl7GyvHGGqxmSQGbFx8P8HRshB0X+/1uQqQicbugqlbaFzG65XwvaDrdp
	wvPepFcZMtWitIR8vQdNCs3ZekjJqpSGNxbZYngdQhcFVz/I3YNWVHVi6yLjIySugSFgPDV39wbVy
	HjTfFKNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9W9V-00CXuG-1z;
	Wed, 14 Jun 2023 19:27:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9W9S-00CXtN-21
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 19:27:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EF4D662FD6;
	Wed, 14 Jun 2023 19:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C2FC433C0;
	Wed, 14 Jun 2023 19:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686770849;
	bh=T2ORHO5yFSlNbPCHm8exnTbQMAiovym6Yw8Agz5UFng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTMCil+hklnlF1wdBdgexpCOuFi7k1H8k1v4rWagRqV3dxUorHBVWLvou82XCQT8/
	 jGgNlk8Ejwuimir91p35ihiH6bHZUUrwQqRDeRZgQL1tDYxS/Ig7Y28b2KpoP74PQP
	 kjFwt2HNJmkbJL06LaIx9f95tFxmKDQAkPlvRt0PTrDM/HhW3/Bm1lH46mPgZ2kYA3
	 AkRZ7zBaMSKFK5ptaSPTUDDg+omBNLLOKpL41HRYpqsUsDS37laN3QtBlcz1E3dMGk
	 JXhBGHlC+rn9z6ohcuooizlA1WQTPc5Jc1eq9JeNUTEIu7fvwCZjNQBV1UBO6JP6Ck
	 2bTCSnLKgL2KQ==
Date: Wed, 14 Jun 2023 20:27:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Saravana Kannan <saravanak@google.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v4 07/10] dt-bindings: interrupt-controller: Add RISC-V
 advanced PLIC
Message-ID: <20230614-devotee-repave-37d670dbfb7c@spud>
References: <20230613153415.350528-1-apatel@ventanamicro.com>
 <20230613153415.350528-8-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230613153415.350528-8-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_122730_764378_6163505A 
X-CRM114-Status: GOOD (  15.43  )
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
Content-Type: multipart/mixed; boundary="===============8279629277712202503=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8279629277712202503==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5BjMorMatJMI/kO2"
Content-Disposition: inline


--5BjMorMatJMI/kO2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Anup,

Mostly looks good, once minor comment.

On Tue, Jun 13, 2023 at 09:04:12PM +0530, Anup Patel wrote:

> +  riscv,children:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 1024
> +    items:
> +      maxItems: 1
> +    description:
> +      A list of child APLIC domains for the given APLIC domain. Each child
> +      APLIC domain is assigned a child index in increasing order, with the
> +      first child APLIC domain assigned child index 0. The APLIC domain child
> +      index is used by firmware to delegate interrupts from the given APLIC
> +      domain to a particular child APLIC domain.
> +
> +  riscv,delegation:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 1024
> +    items:
> +      items:
> +        - description: child APLIC domain phandle
> +        - description: first interrupt number of the parent APLIC domain (inclusive)
> +        - description: last interrupt number of the parent APLIC domain (inclusive)
> +    description:
> +      A interrupt delegation list where each entry is a triple consisting
> +      of child APLIC domain phandle, first interrupt number of the parent
> +      APLIC domain, and last interrupt number of the parent APLIC domain.
> +      Firmware must configure interrupt delegation registers based on
> +      interrupt delegation list.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - riscv,num-sources
> +
> +anyOf:
> +  - required:
> +      - interrupts-extended
> +  - required:
> +      - msi-parent

Not sure if you missed this from the last version, but I asked if we
needed a
	dependencies:
	  riscv,delegate: [ riscv,children ]

IOW, I don't think it is valid to have a delegation without having
children?

Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--5BjMorMatJMI/kO2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIoUmwAKCRB4tDGHoIJi
0s8OAQC9Z5JXorm19qiau/8bfDQbErjoln46aJVOZhOB61Zs4AEAldzBD4e5sVZx
BB4EhiqD4OULcq1ms+OtgVW6TW7zIgE=
=hrI0
-----END PGP SIGNATURE-----

--5BjMorMatJMI/kO2--


--===============8279629277712202503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8279629277712202503==--

