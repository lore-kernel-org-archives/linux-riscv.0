Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17D7CD4F3C
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 20:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UI1XjZ2lxq9NVF8MWP998tIxXS3R563zs5xBoKULniU=; b=Ygw/3CLeMfjuE6yDBo4zDnVZ6n
	PrCbvGeK5PrP5VpFGuGmNT1/J4JaYmbqhCpf0f4ZCYNEcbxLlksoBOJfdVqJCYIhRlrQS4ntDRyGp
	tyLXmtViH+vWJNR9+vKpTU/srOOn9bQ4acW2oeKGvKWz/c53vegLzof4OYqfyJLq0rne0VttLsYRz
	XNO4nhFJ8okzdjxmlnxsGhIU+XFMrjlAu52Pm6XfgV+dFM+pv9zdZPrA44huPq1kk/gPOH3dctKVo
	bo1+9x+y9zKm0cZk69OSXfprFTR5+vQ296z8cro16v0BfZx6962bqmbLBV+bzhTB3whl1CgE/79NZ
	Ls6isrnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOiOp-0000000DRH3-3WyL;
	Sun, 17 May 2026 20:47:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOiOc-0000000DRG1-3H99
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 20:47:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C6A52419AF;
	Sun, 17 May 2026 20:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEDCDC2BCB8;
	Sun, 17 May 2026 20:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779050851;
	bh=8l2JZyd0qp+/2cMhcZGlUMdUhecY4ayHyTnCgWxo6lM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s16+PkgxNgbz04nvSqZ1NDkGXVnt8BLgLnMZgZqS0bMkNjjYwi50NQmw82jxSor1x
	 XIPe8iReQbPmWHNdscx3XyfeukMxW3afk5bk2L+PGNfl3N/SSJMw2kJr2ZPig+8A2z
	 KZRPdsVGs1LhX/qVe0a35RnwClFRlKalewmTObatNIJsE4IQAQ/2bvJqWdylXiFYB7
	 Tl+qCILAay+eLbI4zZxkWpYIeyB8wPa1YgS9I6UHKL+qNkIq8wXXFRezcEbOaPAyeF
	 gHsCTQqXOX6z+3L8ddlCe8QzRrTaqshgTsyU/EIfxKYkAgCO/d78xzTyHmKkPAiT5q
	 dTq2t1BhvCWrg==
Date: Sun, 17 May 2026 21:47:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: add binding header for
 sf21-topcrm
Message-ID: <20260517-cartoon-slather-ec5ad7605449@spud>
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-2-438f2e0513ff@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260517-sf21-topcrm-v1-2-438f2e0513ff@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_134734_841120_8B1122AB 
X-CRM114-Status: UNSURE (   7.70  )
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
Content-Type: multipart/mixed; boundary="===============4367120823460212267=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4367120823460212267==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NDNiJudJTjPz3l07"
Content-Disposition: inline


--NDNiJudJTjPz3l07
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 17, 2026 at 10:12:56PM +0800, Chuanhong Guo wrote:
> +#define SF21_CLK_PCIE_REFP		30
> +#define SF21_CLK_MAX			31

> +#define SF21_RESET_IROM			17
> +#define SF21_RESET_MAX			18


Having _MAX is not permitted, but is also really confusing that "max"
appears to be max+1, so actually represents the count not the max?

--NDNiJudJTjPz3l07
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagopXgAKCRB4tDGHoIJi
0ryUAQDutzNna+dS1Srtfi1let6kex89J0o1R0P7Q0ufH5QsowD/QrELQWfp+sz7
6qMbRiR/I1cEmEy9KpZW6LY936HAJws=
=S1b8
-----END PGP SIGNATURE-----

--NDNiJudJTjPz3l07--


--===============4367120823460212267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4367120823460212267==--

