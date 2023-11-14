Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB803C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 21:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnLSpDuUEtXjqz9VumClzqTAhVKERngms2x9K/SFl8o=; b=cxhFSyMiGOgn4K2tAlLpv1qZrv
	7QZ1xP3uk5lNxrX7LBVR+4iW84SlvSm1QQMA0Sp67mgL2BpmpL4MnOuN8oF11SKiP4+HBMWTwh8C6
	HqhzHe2arBw+wLU/bFtD85/qOAXsrLgB3fQ3/ENKUpJMRc9KoSKzSi8IXClphEbqhG9b3N1f7vFYa
	vm0ZvxdTlIzXiRG39QE12nCqxi/KzVqdRseFPaJ2Zl4F0nYJkBm+q8KsI+pwSgyXNi3LpHzvs3vth
	onFzFoc0SWS/azeEMn4xv1PBxWADPyJ7j3Pzddy0IkVUDjxeCL0HBgjKdULW4XyuBKQDytXbbOMDR
	4yK7B9Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r30ut-00GqLJ-22;
	Tue, 14 Nov 2023 21:25:51 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r30uq-00GqKn-2k
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 21:25:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 13688CE126D;
	Tue, 14 Nov 2023 21:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D90C433C8;
	Tue, 14 Nov 2023 21:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699997145;
	bh=YP5kQ+OLq20lWVTIEgwGNCp7TX3MfqMKAJQPKo0uv4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KiJLQGDmNl0LmFgP52njoysTZoYMcrSPUM5+6omnQS79QJ5hJZ6F/NultCjouljb0
	 DKqWxaQCSwNRynmUSCZISxGLqXVHDowtsGnf7mlJzLqr7aiwzYAxmaCT6fHqVpx07y
	 mPMuDdMD6UMg9my1wuQ/A2Rll0mOBkWhW7PqlCCnc6O+g+KwKKlf9MPrh7CbPDZ+Ut
	 nzD+LkJtXG67eBIku9zd88hyWWItlqufWwKgmnTpVFKW4aoPhC54S0/YLSGaDob5a/
	 gFKYezUBwWk7ZE/IqnsI30k09b2X+9dLQRX0dLQVw0CSjLAHySNcFSys5/qmtlhD7M
	 OWpvyHYh8x6bw==
Date: Tue, 14 Nov 2023 21:25:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <dfustini@baylibre.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 7/7] riscv: dts: thead: Enable LicheePi 4A eMMC and
 microSD
Message-ID: <20231114-unsterile-waffle-dca2696aa551@squawk>
References: <20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com>
 <20231114-th1520-mmc-v6-7-3273c661a571@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20231114-th1520-mmc-v6-7-3273c661a571@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_132549_065708_69C0830B 
X-CRM114-Status: UNSURE (   7.93  )
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
Content-Type: multipart/mixed; boundary="===============1085083804263831557=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1085083804263831557==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ca5HlNeiXV0eml1X"
Content-Disposition: inline


--Ca5HlNeiXV0eml1X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 14, 2023 at 04:08:01PM -0500, Drew Fustini wrote:
> +&mmc0 {
> +	bus-width = <8>;
> +	max-frequency = <198000000>;

> +&mmc1 {
> +	max-frequency = <198000000>;
> +	bus-width = <4>;

Same nit applies here.

--Ca5HlNeiXV0eml1X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVPl0gAKCRB4tDGHoIJi
0uODAQDCOj3IIM9ip5YRSOjAlTX71NZyKmVbuSDoS4Ga2+P0KQD8DAsV1YJ7XtAZ
xJ55DxwLnJ2876cNTRc/6SQBHbzl2wE=
=53XV
-----END PGP SIGNATURE-----

--Ca5HlNeiXV0eml1X--


--===============1085083804263831557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1085083804263831557==--

