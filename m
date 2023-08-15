Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35776C04A6A
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGScUJUe1E1dQ1Ofl0ItAnSZGrTf1k04nLl0+0bRXso=; b=DB2fGjpO3W9kAPcJPo1NGqaoQR
	I9sMAtwdS2qf4CBOxUIlb3ubng1yITMxGM/snRXSP9ksHwSAL2eXpzX24MFL1R1lz9PH0N7D1FAVi
	uKdnbAtGsmZVrcqbhXxoh4hJRrh2Cck1IGzoF/pgBMvUgCjsFPelsTYhBJwDe3s4uLlCVTot4ILhl
	a0Laothn2qdQhALWZ3sQTgEtfWtuL2rndqJ2Z8+hz2BD+5ntUMiKQox5+Sh552GC4ZyVD1crJrpzw
	ZaIThBKCRic4o/YTk8mootxHHdmV7CutsWaOXo57ASCcK7GF2GrXd5xrniTEt0V/H5Sf3XAJ+5jVV
	AQpR0uyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVtsM-001fi4-0n;
	Tue, 15 Aug 2023 13:14:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVtsJ-001fhR-0O
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 13:14:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 10418652F0;
	Tue, 15 Aug 2023 13:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC33C433C7;
	Tue, 15 Aug 2023 13:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692105255;
	bh=uEmdk+l1xR/L7ugojSPAdX8y4SCIHB3k+lxThFMjeLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZnSAU99/UA2m/wD9foK/l3iLxUAcmMUvBCVj9U1JXTiaSofMXG3XKsbOHcXbtEp3W
	 sEINweTZ3NcaB4K0fKQUt+U3itxVjlXj/kQG9S/gCLXDAx5MpmcIo6omK/9t3DJUD6
	 GPMNDZI6NdxlF9/1QGEKFyhNRKzXySSkSR5l00uNFhg4rJ/8hsNA/YCdLQ7CpxDPw/
	 doGENsGn26U5UbGMGDq6QWRXQZpyoaY3H0rHU5G0t09fTiyg56VeWzJ1hxv6+zTbOB
	 kR+u8mXpP1kYiHwKK/D/UttVAIT9LaLT+tTXvvpppO1SVWTYFBHYgwrtCJ6M5e886r
	 V6+p38On87tuA==
Date: Tue, 15 Aug 2023 14:14:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] drivers/perf: Risc-V: Update platform specific firmware
 event handling
Message-ID: <20230815-selection-happiness-ed2d92c4ad7d@spud>
References: <20230814043134.367280-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230814043134.367280-1-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_061419_201711_5BC9EE61 
X-CRM114-Status: GOOD (  14.00  )
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
Content-Type: multipart/mixed; boundary="===============2117307604634731784=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2117307604634731784==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K4X7NvIwezZSHDOM"
Content-Disposition: inline


--K4X7NvIwezZSHDOM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 14, 2023 at 10:01:34AM +0530, Mayuresh Chitale wrote:
> +			/*
> +			 * For Risc-V platform specific firmware events

This is a nit, but it my OCD is triggered every time I read it - please
don't invent another style of writing the name of the architecture, both
here and in the commit message. If you respin for some other reason,
could you please change these to one of the established styles?

Thanks,
Conor.

> +			 * Event code - 0xFFFF
> +			 * Event data - raw event encoding
> +			 */
> +			ret = SBI_PMU_EVENT_TYPE_FW << 16 | RISCV_PLAT_FW_EVENT;
>  			*econfig = raw_config_val;
> +			break;


--K4X7NvIwezZSHDOM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNt6IgAKCRB4tDGHoIJi
0sZNAP0a0EoFsCRFk5YB/0fXhr2LK9jav2Ft+fjiVg+bboaTCgEAz1MEOdVW9SWm
qgN57amZqZoofGqTahLRFY9BUjeWaA4=
=UB3D
-----END PGP SIGNATURE-----

--K4X7NvIwezZSHDOM--


--===============2117307604634731784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2117307604634731784==--

