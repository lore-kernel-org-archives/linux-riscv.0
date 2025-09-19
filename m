Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC0ACAC592
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 20:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NDwVYczkZHv0B3LRAU/3/7Y0vhj9jODKwmULFbAtO+Q=; b=SeGbMpPtj++Int
	lfhmilr+WP1yIbH/fw1zJATfDfkxOTtipjcniuuTaFp2kN9WJoFf9BBGd9gWWJIONiw1n+zFgv7Q7
	zq+T1aPXbDU+/ZIBJ86cBJW9U6XsT5B4cf6JNyrXDxxeGkTZYgXT0IYKu1BlRQuNttGS4VS5+4gRA
	LSuNaJAMybSt2Te05me8B1L5VOVNUloiBN2c948Ji4Lx5C5b7+LG7X8vKI6H6smdphQzlYI0hXtdi
	eWtCsMqdUTkilNBR3PuO/LuIrq7NYbWFLSopyfF1afOxFNIZO/Vv0zFnBsg2hJbcAbdbPQ+1/KQsi
	bBcWDkpmjDz7s09dN2lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzi0g-000000040Ox-2IyG;
	Fri, 19 Sep 2025 20:47:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzi0e-000000040Om-3gDO
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 20:47:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ECDCC6013A;
	Fri, 19 Sep 2025 20:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87121C4CEF0;
	Fri, 19 Sep 2025 20:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758314831;
	bh=8ZdaVlsLZ6+YqF2PuATIawPN2p3wYF0R7tpv5xXnP8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=el2P5cI5c1PQLUF1JQ9+vMHslN9O+S4VdFuzZEypxycWiaT8dz+kwJvqfmqweFFOp
	 9o0OxuGVX5XGmf1IRbLnGHAntNslP/aveO+Sk6okFX5gbcM9aLXgyLhdOGZqRXiph6
	 OB4AN5c+YTkq7a2p4EEMx1+QFOdI7nMPrsgfoL+CrS8o7FR72RJ44qxiCmwuJNdB6q
	 AshlowEhC8N0XIDT6WaL33UfgkZK4mnkO1g3fpk/pcQ1fbhS3lUxnq/ywcleuQ3Vbx
	 Q1mO+p56dkqr2MBsFL/GRb8u2ErSty2BwsfQjhmEajtnP3poyJAjYn+rWiNqzWqO+T
	 i7WgYF5X5t7Jw==
Date: Fri, 19 Sep 2025 15:47:10 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: alex@ghiti.fr, conor+dt@kernel.org, spacemit@lists.linux.dev,
	broonie@kernel.org, linux-spi@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, dlan@gentoo.org,
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
	ziyao@disroot.org
Subject: Re: [PATCH v2 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Message-ID: <175831481987.2188907.2053375143678932465.robh@kernel.org>
References: <20250919155914.935608-1-elder@riscstar.com>
 <20250919155914.935608-2-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250919155914.935608-2-elder@riscstar.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Fri, 19 Sep 2025 10:59:11 -0500, Alex Elder wrote:
> Add support for the SPI controller implemented by the SpacemiT K1 SoC.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v2: - Use enum rather than const for the binding compatible string
>     - Omit the label and status property in the binding example
>     - No more spacemit,k1-ssp-id property
>     - Interrupts no longer specified with interrupts-extended
> 
>  .../bindings/spi/spacemit,k1-spi.yaml         | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
