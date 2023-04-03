Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D54C76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 18:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Dy9icW6Nj7hzoivSJKrO9vCRznngtnpx6J6JBIaOhM=; b=qOhMJgoYUvjueDrZ40+YYf2d7g
	o/5KhSp5sdGBTb1mX9APD69k3bL5UvF5BDvWumGMHZMvBUDYjZ5TNP9dZTXQW2joLqoyBakCqkRp3
	Ebs7p4k+MiQujohS2uDrcj2Py//odcyXJE1OM9cZ1pIwucwsYfI2iBmhlvqh8gtPs+oqs8FwYALLa
	QEJvESFN4SgSmUuJ1EKnq+fsSMtPF5aKg/rZgPYgHT7iJ0gbXrVDZpziQaPSO3CGAd4/Sg98cyd6q
	bTkF3AdGmSMa6RT7mu8vdRgA3F+au7UaJhOx18r/rkr3sMvbMrZUyUJD5bwqxS+ZvkpWApR9woBdA
	HEbvr/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOy4-00GDZD-11;
	Mon, 03 Apr 2023 18:31:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOy1-00GDY4-1Z
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 18:31:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D85FA62638;
	Mon,  3 Apr 2023 18:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955B1C433EF;
	Mon,  3 Apr 2023 18:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680546704;
	bh=o3RwlIhCEYrO4ntJi9qqgqGqIZpIGhhKYmBaW6wiPB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nl2aNxeK+tyv2h7Xtc3R6vMLqTxpdf26KonLrTUAaO0lMgylMBpw/EejnDB1bCQgF
	 T1BABIWDQ44VCTNscPgGmtkkpm0ziUM0AqLkc4LhAZ9Mvg1clKGkjUVoeW/ema3zPq
	 Zx96UQcBfLyh1DRKuWoFXh2T4Vk/RdUx6+HXapepur1qdNIy6FUoLqhLOsrqZF2lEY
	 +U2q4NJ0EQw1WVoCKeyeJfk2+EGgjtJm/UKVdLKmfSRHQlXBa9jlKX0b0I+xQY69iU
	 7Eu4/M1Y+vis85ilDZWwOOm8VVIy5FwgxkkBmSt/STmzzh4ENycyzpPy63n5kmqd0E
	 Ad7VG/PjG5vbg==
Date: Mon, 3 Apr 2023 19:31:38 +0100
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
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
Subject: Re: [PATCH v7 1/6] riscv: mm: dma-noncoherent: Switch using function
 pointers for cache management
Message-ID: <20230403-peroxide-retail-d7046cb806fe@spud>
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <f12f9773-77b5-4ba6-9e9e-adbc67ca0110@spud>
 <CA+V-a8s0UViJ0tBSyiL0ZG8iVT3QSW77=VujJJOfiuM8T=9ntg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+V-a8s0UViJ0tBSyiL0ZG8iVT3QSW77=VujJJOfiuM8T=9ntg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_113145_559317_CA21C67E 
X-CRM114-Status: GOOD (  13.70  )
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
Content-Type: multipart/mixed; boundary="===============1132415646626880654=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1132415646626880654==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b/tLN+10ke3HU7wD"
Content-Disposition: inline


--b/tLN+10ke3HU7wD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 03, 2023 at 07:23:37PM +0100, Lad, Prabhakar wrote:
> > I think all of the above should be prefixed with riscv_cbom to match the
> > other riscv_cbom stuff we already have.
> Just to clarify, the riscv_cbom prefix should just be applied to the
> ZICOM functions and not to T-HEAD?

Yah, can leave the T-HEAD stuff as is IMO.

Cheers,
Conor.

--b/tLN+10ke3HU7wD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCsbigAKCRB4tDGHoIJi
0p60AQCszeJEQpmXWuGiboXB8Hchy8tk2SJUYIcxRG/FXjMr1QEAxg/uIZdyzwLe
3Zibwoth4VJ2MTUzPgfVuRO6IPUtswE=
=S+Sw
-----END PGP SIGNATURE-----

--b/tLN+10ke3HU7wD--


--===============1132415646626880654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1132415646626880654==--

