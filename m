Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F09CD37AF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ph796bIkVDko/katSpNKmiOPoP+fGIN5AlR3lLuO5f8=; b=Bs9gIQsBk6euX7DAAdNBBZddwy
	p0kwvt615OIHAd5dVKpmpr+x43JS0ewqvch8qg5W2CmvrO3E7XEw/M2b9X1COneOJWqvPtlbq0t4H
	FpPNiSeioID3gN39sen4JhzcAQ1obM/4x5FjhuAUkEvvWzOTOJ2ZeEXZTxlUkY3ZECjgwENNoPA+3
	eeWAtXD75MzORGZKVQbuEy2S1+FYJkNeN/exuT2uzlDXuuQwZblOTUkjZ9zDZfid/qVICzzujW2Eb
	mVCsco1nT6hOy+Sm/SKa0j2c3wKduXk6vt2rx3XBwQKzKOsjF7Gn+shfOB9ZOTtCVzcyVqsIJnYZq
	FVr7e1ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhIq9-00BZpx-3B;
	Sat, 16 Sep 2023 00:07:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhIq7-00BZpS-0M
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:07:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 6D3BFCE2AEF;
	Sat, 16 Sep 2023 00:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBAEC433C8;
	Sat, 16 Sep 2023 00:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694822826;
	bh=8Yu+GwYPHDePl3LqNlzEzfrFvMmCmV66DDHEshoQFPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CNH6CLgxFzU1zRS0ABaVNSmRwjWQmVfC7I+QNZrLanrYn2S10zMTqneXnbPwIx8U+
	 9+DYbJCYWmEjSRJLFUD0KnU4SrTfH4U70goBTEtWJYYgE+3CDQj+S3xahTybXlvnI8
	 4+hXbVGzT3NrhxXoS7XMOoswH8SBrs7wuJAcOF/OO9C3feM3vkPLoLdSn2ljVt86RK
	 5e7cGHkB2Lxc38+DNvVOM9w4WpQtgBzaL7RK4nBiIaLc/XKkVS+PdQE+h/FYgT5qjw
	 v+xWeWSrzk26/qThAn9dkn6BUyKeIP3f7IuSP+BCNnVyKI4KQN3Z7AGLxQNSa/LO+P
	 g8EQp9/9wUiPw==
Date: Sat, 16 Sep 2023 01:07:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v6 19/19] riscv: dts: starfive: add PCIe dts
 configuration for JH7110
Message-ID: <20230916-monitor-idiom-86d6894b1e88@spud>
References: <20230915102243.59775-1-minda.chen@starfivetech.com>
 <20230915102243.59775-20-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230915102243.59775-20-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_170711_321842_A2174FE8 
X-CRM114-Status: UNSURE (   9.05  )
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
Content-Type: multipart/mixed; boundary="===============4722995540197463047=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4722995540197463047==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+RcYDkBcBEoWjbZf"
Content-Disposition: inline


--+RcYDkBcBEoWjbZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 06:22:43PM +0800, Minda Chen wrote:
> Add PCIe dts configuraion for JH7110 SoC platform.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Not really important, but checkpatch whinges about the double signoff
here, since both are you"

--+RcYDkBcBEoWjbZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQTxpAAKCRB4tDGHoIJi
0lj9AQDNWfMti/9mi01vMJjKM7GVM2xrI3XaabEtUXwy9R9NmAD7BHYTvEI4JQ/I
+ECDoV1Pnxx67atTC+kUEC0W38scYQw=
=uVmt
-----END PGP SIGNATURE-----

--+RcYDkBcBEoWjbZf--


--===============4722995540197463047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4722995540197463047==--

