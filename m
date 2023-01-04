Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EE6C3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 18:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9w81yIllkK1Si1l/XgXv+ReAcPZbSW5336uJVi1Wnxk=; b=VAJQJrG4ZgiDXZ/BnlaypzjpOQ
	kG9FMd0gscRt4pove7c5wOZiASAIZIGP8UfcF9S+dOP3JP3fhWH2K8hOVrKkwS+yf8lrZadKb7MA8
	XHpZufcnb/40V68l/IChGuzdrY+UEUmRaTjBUWupdGN2Avb9FeaaT3U5hK/ZRI+APb1NgImn9j7/P
	R4wukKZgyZ5TaiMh5qKGm8rmSMlGgVNyZgq3in8kY9xhYKJfLvvnjNrE2yhQuASXKH1mWG8zwbvfx
	nU7DxqB7SkwHpO6KlLWV03cw0Z5HWi0UxCSopfGduKnQ8gof9MwLdKWUmNeOySFEQVuO8dsMP6j1Z
	JuxH/k2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDV9Y-00DjWT-Q2; Thu, 05 Jan 2023 18:39:48 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDD4h-00DT80-GC
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 23:21:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2D27BB818E3;
	Wed,  4 Jan 2023 23:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0A0C433EF;
	Wed,  4 Jan 2023 23:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672874492;
	bh=v2/R96SafxBh5iuY4E7Baw1qoJay2O1nWXxJwVkFLI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vAk3P/lUBhcqU9rBK71+IJcT83ARY+TnNkLVUD3yxWBuX0GaR+zlOFRB7SGATXpHs
	 /bC+W+xn9OT8OKfyWRUCA0OFpKwRjgFrACvtv3qWkRqLrYhd95h4RDRArjsPhcr2Gf
	 ydNlDDW6Ga/jiHkUdZ1NAb6gZbiha8hUBjPwPnjzntQ1Isi+nIDzWc4/w6d9KELCIj
	 Kt1FrAKyDkLCvbzlj9RE+7NxwE3UHqMgY7MixlHhhQ5IxX6grAka8Gjzn0s9HzEP9H
	 TcKeqFPG1dGTeHMDw7rpl6w4lAJA+I1wyN4J7qoz9DAB97RFaojPYOafgzgOBK1Ccm
	 46VIIibxKfo5Q==
Date: Wed, 4 Jan 2023 23:21:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/9] dt-bindings: interrupt-controller: Add RISC-V
 incoming MSI controller
Message-ID: <Y7YJ9j9a+DQVF/dp@spud>
References: <20230103141409.772298-1-apatel@ventanamicro.com>
 <20230103141409.772298-5-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230103141409.772298-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_152135_905947_26EEC1F6 
X-CRM114-Status: GOOD (  16.39  )
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
Content-Type: multipart/mixed; boundary="===============1491702606809379710=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1491702606809379710==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HGsSkcCnl6i5IGAx"
Content-Disposition: inline


--HGsSkcCnl6i5IGAx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Anup,

On Tue, Jan 03, 2023 at 07:44:04PM +0530, Anup Patel wrote:
> We add DT bindings document for the RISC-V incoming MSI controller
> (IMSIC) defined by the RISC-V advanced interrupt architecture (AIA)
> specification.
>=20
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> +  The IMSIC is a per-CPU (or per-HART) device with separate interrupt fi=
le
> +  for each privilege level (machine or supervisor).

> +  The device tree of a RISC-V platform will have one IMSIC device tree n=
ode
> +  for each privilege level (machine or supervisor) which collectively de=
scribe
> +  IMSIC interrupt files at that privilege level across CPUs (or HARTs).

> +examples:
> +  - |
> +    // Example 1 (Machine-level IMSIC files with just one group):
> +
> +    imsic_mlevel: interrupt-controller@24000000 {
> +      compatible =3D "riscv,qemu-imsics", "riscv,imsics";
> +      interrupts-extended =3D <&cpu1_intc 11>,
> +                            <&cpu2_intc 11>,
> +                            <&cpu3_intc 11>,
> +                            <&cpu4_intc 11>;
> +      reg =3D <0x28000000 0x4000>;
> +      interrupt-controller;
> +      #interrupt-cells =3D <0>;
> +      msi-controller;
> +      riscv,num-ids =3D <127>;
> +    };
> +
> +  - |
> +    // Example 2 (Supervisor-level IMSIC files with two groups):
> +
> +    imsic_slevel: interrupt-controller@28000000 {
> +      compatible =3D "riscv,qemu-imsics", "riscv,imsics";
> +      interrupts-extended =3D <&cpu1_intc 9>,
> +                            <&cpu2_intc 9>,
> +                            <&cpu3_intc 9>,
> +                            <&cpu4_intc 9>;
> +      reg =3D <0x28000000 0x2000>, /* Group0 IMSICs */
> +            <0x29000000 0x2000>; /* Group1 IMSICs */
> +      interrupt-controller;
> +      #interrupt-cells =3D <0>;
> +      msi-controller;
> +      riscv,num-ids =3D <127>;
> +      riscv,group-index-bits =3D <1>;
> +      riscv,group-index-shift =3D <24>;
> +    };

How is, say linux, meant to know which of the per-level imsic DT nodes
applies to it?
I had a quick look in the driver, but could see no mechanism for it.
Apologies if I missed something obvious!

Thanks,
Conor.


--HGsSkcCnl6i5IGAx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7YJ9gAKCRB4tDGHoIJi
0vn2AP9AbpFEPFtXjhX2Xeds9ujqOyZk3T0cfbS1mobVcSsGIQEAhYSYvxGdTD6Y
DuHQBNOoJjvpsXYzq43BM95cTisFTw0=
=QAG0
-----END PGP SIGNATURE-----

--HGsSkcCnl6i5IGAx--


--===============1491702606809379710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1491702606809379710==--

