Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B1FD609C2
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldA6iGYvts6Gk76F7th3IMQgAKZpo1RN7ZXt4N/uJ/c=; b=4illB7mAViWUDaFHwUNt/w5g4L
	Zc9hSOWuabV3g3ICy+r1tnZbytpftNlg23R/yNcaUXzElhJuoX/bJHP8Mx1GL2VYi7uPM8sA9XBv+
	QOPOWmJE/KNmxpla0SKzjIXZ++ega/mVsz0OlvLG6BXSu1okEwuHIuQPNb0GAQHREVbpdFUF1iOtL
	inDtHWOpFExGKVSj5rjxVgz6O2my0reSH7giRUSEeex5LmEJS4PIM3EGxfpJDdN+ZwqNsZGY5HLEz
	ZKhm3AMKnt6Zg9fHDQyoU9xopykYXAMB7x5vNi2p6Ne3WzwAjmmCo7JS+/erUPTzsHGCcOedTZhIf
	HhAEz64g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVY4e-00000005XWN-2sk9;
	Tue, 16 Dec 2025 16:38:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVY4c-00000005XW2-19Is
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 16:38:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87C9240C22;
	Tue, 16 Dec 2025 16:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951B3C4CEF1;
	Tue, 16 Dec 2025 16:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765903133;
	bh=YORjPCca5peZWVj6CVOcw/8KWpP/pH7SpA6us1ULmiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WJpemtmIk2rMjnCn3v7nh69rKI9f12U5K2ce7K1SdvTH3K8V/XCAjGYqUooo1dsve
	 +UyVw2M0adaPV13tXJzfkeBbMgPJjBgHCPnQzu10PywY64IvX9480ctmR+xWE7e1Ya
	 xrEit1nRdKDse2nMppdXuD4T/1KZuNVXpdVt6V9g2fc/Erlse1yltwMPrqIQ7n6g7k
	 SWV6H5Ft3u3hvznJ8yHbOwpudHC7IVdEVoRqHz5+vDZtMHjJ46yOFMQ5SB7/aCEOcz
	 6tYakF8JzlBYJ6M33r5stI/UDX2jB3GeCO9uXJEGM2TVSCkbMLCB5JGzZuGaf5Lub9
	 90aO5EMg4uVVQ==
Date: Tue, 16 Dec 2025 16:38:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>, Ze Huang <huangze@whut.edu.cn>,
	"Anton D . Stavinskii" <stavinsky@gmail.com>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B
 compatible
Message-ID: <20251216-alto-clasp-bc7077c5eea0@spud>
References: <20251214224601.598358-1-inochiama@gmail.com>
 <20251214224601.598358-2-inochiama@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20251214224601.598358-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_083854_332479_C6ED4B66 
X-CRM114-Status: UNSURE (   5.45  )
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
Content-Type: multipart/mixed; boundary="===============2913280264581918563=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2913280264581918563==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VEWkek89ZpqGU94g"
Content-Disposition: inline


--VEWkek89ZpqGU94g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--VEWkek89ZpqGU94g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUGLFwAKCRB4tDGHoIJi
0nDOAP9vwQyYWU89RuSI7vTvOyK9H8grlJWln1QnEpgY2Xw2/wEA4SyvcrWu3DkE
u0H72/NgKCnlCeFE/XVZXkj6DahaRgo=
=Zrte
-----END PGP SIGNATURE-----

--VEWkek89ZpqGU94g--


--===============2913280264581918563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2913280264581918563==--

