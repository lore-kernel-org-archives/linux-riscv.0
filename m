Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD18DC6FD18
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 10:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DmZYt/hmZUm7f0PsGuFwcPeAxTZ23VEOzJK8B7CSFA=; b=WEJ6N4FSpE816vDblu9XDMFJsq
	gYgl0k+eXIqEFF5zhsWKlGq46gmtB/oWkaFx3cByYZD+azyihxpXbnbfPxksdXN4zLYFT3r/ILMCc
	kmGL/7banFlrqk7EpozTmZ9FqAmCoK+GZ+lpocL14yS34PvMFcTyqjHlrRQtoR3hiocxzSAuS52xR
	+mdPq33nW1LzZzaJ0+jjB5tVJeoZ6ZZaDXYlJ+t9YGZ1DROZevV89b1Sl74jiGsT9lzN1oB9Njl+l
	wwIekJhzkO2t340+Eu08fbt2gRqd/5DAzjWccFkDNXtM9ja7mtYGmfCSCo+Ex63XTp7N8ONKeG1/t
	uSrOxIXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBtc-006ud2-0O;
	Fri, 31 Mar 2023 10:22:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBtZ-006uc2-0Z
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 10:22:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680258129; x=1711794129;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O97ADEtm/OjO7nPRNILELGyEc11czzC4AfiYhLq7BVU=;
  b=euSCwCqFP7ucnqyBgSGrWrew/dHYQlCHbjbt1KCtwi0JZ83edCk1a2PC
   WwpY7BcgLSd1q3dvk1xhOHQMm8GSqisrDiWr69VLo3oBB3ufZp5eXDhye
   LO1zljNZkE3W4x4C0l1bWOz4wqOBETlxAlhLaNS9Xbnon4SqVc31q3OXR
   l1xdWL7B0u3WLoiH0MREZp99D4QDTwMguqBkaAZL3wd8MYm3U50IqTIDg
   XuGB7Nz4pvLUCyLfo/X+WjsmuYa92lIF2Nt2luzMA1ty/ty0Y4GnVHtNE
   8oMTum8GUg7CdyNt9mApX+jbLrZPwmwajTtzsPHVviLq6VDtVVTrFjpJt
   g==;
X-IronPort-AV: E=Sophos;i="5.98,307,1673938800"; 
   d="asc'?scan'208";a="207167804"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Mar 2023 03:22:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 03:22:05 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 31 Mar 2023 03:22:02 -0700
Date: Fri, 31 Mar 2023 11:21:48 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
CC: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, Guo Ren
	<guoren@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>,
	<linux-riscv@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Rob Herring
	<robh@kernel.org>
Subject: Re: [PATCH v7 4/6] dt-bindings: cache: r9a07g043f-l2-cache: Add DT
 binding documentation for L2 cache controller
Message-ID: <65394572-33ae-4241-8936-0ccc8353d1a2@spud>
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20230330204217.47666-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_032209_216567_0CA8FA52 
X-CRM114-Status: UNSURE (   7.02  )
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
Content-Type: multipart/mixed; boundary="===============1507393799508485288=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1507393799508485288==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZaakkSvjL3VDjlgv"
Content-Disposition: inline

--ZaakkSvjL3VDjlgv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

$subject: t-bindings: cache: r9a07g043f-l2-cache: Add DT binding documentation for L2 cache controller
                             ^^^^^^^^^^^^^^^^^^^
I assume this should be updated to be ax45mp-foo instead?

Cheers,
Conor.

--ZaakkSvjL3VDjlgv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCa0PAAKCRB4tDGHoIJi
0p5iAP9SWWenRmTwVMmV5yA0RKo8s1JsMjzzWaOTHtxbXLVfuAEArMTwVtQ8gzTS
RxcRbytq2gWtJbpyS6svV1wo0kiDews=
=ilmE
-----END PGP SIGNATURE-----

--ZaakkSvjL3VDjlgv--


--===============1507393799508485288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1507393799508485288==--

