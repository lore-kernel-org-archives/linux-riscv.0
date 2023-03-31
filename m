Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8C3C761A6
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 18:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOy5jdLkYtvjAYrqEDKkxqyeGyCerhBNuNGuoNYY5M8=; b=IPImpgu28cHugADVVfUKz4X2Wt
	wtD11YzT2ezqE/7Vjfx1wvTl1xQVZwLa8n04MbP1362D/mex/vCs6kMN69YdKB1KBjw+fsGTDJuHX
	+IgDPXZPnWOrSfKu3q4xGJ4ZgE4P0//DojMsx7AGjcZSLjUR3NBkCyQvhwdO3W/iaZq8HA6eTsqCX
	wGG9SsJUw777lO8vHT26g83tuD5duPLcJkr8h5Jn2rvSuwI7bpqH/xGDUS7BuAsDJgV9q/55uNDhE
	rfXSY0xV6t8MFcZ1CFYIfpmBYMMEbnmR21owKVz6YoFzx8c4NJQpPP9cletEpSRBegy3NvKH8B+57
	xWbUy2kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piJ7o-008OuY-2y;
	Fri, 31 Mar 2023 18:05:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piJ7m-008Ot5-17
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 18:05:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 01D6562B14;
	Fri, 31 Mar 2023 18:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4836C433EF;
	Fri, 31 Mar 2023 18:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680285915;
	bh=yhcavFdyZAlXWQO8EApfE+E9GTxovJYaD/pUnichZz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L0k8seiS11xBTJAujqyXzQ//L9p/LdHzmCHVFeyDUgIsMpM7tSz5hx6qWke2G9xbR
	 BEY/6T0imbYxxl08CO9kcNv/cI4o7XEZqqm4VAN9erLOx6HNoabWTd0rZPxdpKxLSa
	 sOP+IhUAA96DLkD23XgTnI7euo4tZD7iIYFj6fDZOVbNTbmSNmCfsZCXH6NfxurBZT
	 Hwv0LN8fZzUg1mNh/8Lbfg0GKkWvJOLTf5nl9iX1CmM+sQXBkZOEPs/RB4NwcsPlCK
	 ikXaw2381vMyNXIa1lCRKXv5GX1IS6bp71jkkqeeeQVTa0AZ0b+r/+jr/gOeq7zNUL
	 LW8YOT5ZFOsdQ==
Date: Fri, 31 Mar 2023 19:05:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v7 0/6] RISC-V non-coherent function pointer based CMO +
 non-coherent DMA support for AX45MP
Message-ID: <b2dcda17-5850-47c1-94bc-4ca87f900581@spud>
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_110518_430684_FE38F773 
X-CRM114-Status: GOOD (  11.39  )
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
Content-Type: multipart/mixed; boundary="===============5568266375982177247=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5568266375982177247==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bVgU0rnp1uDT6zu5"
Content-Disposition: inline


--bVgU0rnp1uDT6zu5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 30, 2023 at 09:42:11PM +0100, Prabhakar wrote:

> - This series requires testing on Cores with zicbom and T-Head SoCs

I don't actually know if there are Zicbom parts, may need to test that
on QEMU.
I had to revert unrelated content to boot, but my D1 NFS setup seems to
work fine with these changes, so where it is relevant:
Tested-by: Conor Dooley <conor.dooley@microchip.com> # tyre-kicking on D1

Cheers,
Conor.

--bVgU0rnp1uDT6zu5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCcg0gAKCRB4tDGHoIJi
0olCAQCODgwigBuDYnHh9SF7jlHE8FV8O/wdkD8XBah6GNMDWAD/djjcC5dOGg3O
+9LnK+BLDW/pLsgfMrjK3UpuiS7xYQ4=
=R6x2
-----END PGP SIGNATURE-----

--bVgU0rnp1uDT6zu5--


--===============5568266375982177247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5568266375982177247==--

