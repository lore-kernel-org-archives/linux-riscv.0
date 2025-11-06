Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF928CCF9F8
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Nov 2025 16:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amPXIEGdMSDj6mu9d8WyvueIZZX0Z9CBKF7OOdXvC7A=; b=TiE61myQJ3zFNW4lEVGKU2hR8e
	PT0aLs06Q28KTWbHrKVE1f5voqJV3XTMzwyNWy8112JGibmgm374cqUPKJg8hp7gS2AJGyANchXi9
	zJkd53NscmWTyrAx2l7WonEUDu+98x9t02lP1pDHqMUZxFzCslA4yzD0qLu83H4PX2/jelvrCfhD/
	jqJs1vDfZo/EKATgKLHudojWIPmgbELr6nXYujLB1T6OcUI2uDR0hi7SU+XG1xRuajrLIuPi7/itz
	pwEuJ9gRkHGicCy4WZPMgUc+470qR8NDhRCPKm+VtzygEILUmNGvBe2x7+XDyIpnMpjhDmwgjaMP8
	OFePOHnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3HA-0000000FyGn-16hT;
	Thu, 06 Nov 2025 16:55:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3H7-0000000FyFp-3RPj
	for linux-riscv@lists.infradead.org;
	Thu, 06 Nov 2025 16:55:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3B5A407D2;
	Thu,  6 Nov 2025 16:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D242FC16AAE;
	Thu,  6 Nov 2025 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762448152;
	bh=INKkQZKXRvoEmqr56OZfn85xTxcnjEuZr06CrINjP9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oCUCqgz9oWWuCpVclbbG53qqmAEteEcTdkFeRqvQroyYKhiHf3z7u6AqdAEi6hrEg
	 StHrV3mHiauNqRF0X3i2vwoYPNJ1dM7xUNnypZpe2MhYscpZZBmNhbXdl8ntQqtFgT
	 ZcsTgQ3Ze1UxPoZM1NyfMR4/0obP8BrDDOp5fRmQgLc74/LcwYBYSzeZcXe6TekX0/
	 ZKp8EcnC4VRfuawjVB7Avwhhzl9v5/YOOfYfFrGllmVe3GgsDaL5oeMx8vbvN0JxmH
	 jNGYiytGccA8KUOwQp8u6asNv64vsd/JLCLswZKCF5HEOTjK6gFIsfaccRcEe4TjIt
	 BZY+TPvUm1FWw==
Date: Thu, 6 Nov 2025 16:55:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	han.xu@nxp.com, dlan@gentoo.org, Frank.li@nxp.com,
	guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org, imx@lists.linux.dev,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: spi: fsl-qspi: support SpacemiT K1
Message-ID: <aQzTFODaYaevp0v-@finisterre.sirena.org.uk>
References: <20251027133008.360237-1-elder@riscstar.com>
 <20251027133008.360237-2-elder@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20251027133008.360237-2-elder@riscstar.com>
X-Cookie: If in doubt, mumble.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_085553_874987_1C7F03E2 
X-CRM114-Status: GOOD (  10.11  )
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
Content-Type: multipart/mixed; boundary="===============3051681846709851974=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3051681846709851974==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2o85NyMik87PQrJf"
Content-Disposition: inline


--2o85NyMik87PQrJf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 27, 2025 at 08:29:59AM -0500, Alex Elder wrote:
> Add the SpacemiT K1 SoC QSPI IP to the list of supported hardware.  This
> is the first non-Freescale device represented here.  It has a nearly
> identidal register set, and this binding correctly describes the hardware.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--2o85NyMik87PQrJf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkM0xMACgkQJNaLcl1U
h9C9ygf/asts4SaYlQ8kFs/PjZGM6Z5eh7AXfCSNgZMDEWxBB50XugwxeAM3zXmv
NQsKsvHvhBmKGsZFerQcA273D6wh2mzw+Y95N69tHKfokmk8NE5UF3uCgv/HUwNM
oRx/E5weS5meAoTeuCrkvduSTnoBimeYrJtzV4IvvrgbbMBQ+9fpBn70yAk30p1N
9wCaF/aVNynUW0Cclof9tFQ4RckouUEKdkuvt9CXV8bGpZdNevCV4J7RVoFN/Njs
Bui0PLDSesJmuRMyOSUVATZDqzG9Qf9baMUB2hptWaXlHVcXaOc8nLyfwPoYOR/c
yNI0CT15fzoNFqlhEecigMQfInXKhQ==
=d0As
-----END PGP SIGNATURE-----

--2o85NyMik87PQrJf--


--===============3051681846709851974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3051681846709851974==--

