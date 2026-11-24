Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F95606A326
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 12:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JNDNxXuS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J9HZe9Ar
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8Jd+QmXDC8xhJCWtabdnzvJ5+cNB4r66rGWZ/l/jdJs=; b=JNDNxXuSsFtnMV8QRe/zfM/KGN
	Rn7frfh89PVdHJvnpEWGgr+YRwbcIvEXD7MKhq50FKOzRzpOJ82dvdxR1E8z1HPG8A9jJuijvNkWK
	OEhFZlvgxRu/xxlLqzRQLyLFORbXdnTBLV3sW9O9rsjLzaPAG1HMDk/IDJA2UI+Dmr+8gvhXu6Dh5
	Vusr9GVZIxQZ1fJ2t/S4yFuSDXvDVwBfXGQT0ZXHkjkTgOnmwQM6Duu2LMgVnJcZItYip+oGl9riO
	3artBRVSbyIDFE/nnfh8ECAddfxePniz8Vvgta8TB/4qZPU0P9Hhjp7dBy4eI5lIoDb862TaMQ9oy
	jNjDPrbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpSf-00000006UsX-3swL;
	Tue, 24 Nov 2026 12:17:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpSf-00000006UsO-1fZ3
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 12:17:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B9C41601CA;
	Tue, 24 Nov 2026 12:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C369D1F000D0;
	Tue, 24 Nov 2026 12:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522644;
	bh=Ck6kiCUJ2Nnh4S9Lexj7ozDGtWc6otailWEPqpSNlOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J9HZe9ArwAdfTWLIwlK9s0zK1LcZwdcKQ4gsPQwYmKB9MTEZnzoAcJkBDQG8yUWfr
	 j9Bszdn+JpK5gIhYJNUlNaIedgsdA7F+G3cQrSy4jTjVHhIjNPpqTIN8MkLCBW7Lbb
	 C18yk3Sw6KZt2kRtXRiLBz6dPDzA2A7/9h9sZYp3/3XX4ZG8Mse7Eg6q87crDIGTZx
	 YZqsYb1CCQPsW+bJsgmB+9R6qZ6uYIeyqj7fjDCDauWDTGQNL8PvkKZ02adzrP0dPM
	 G42Q/0dpxz4cnGnBNzIvK3XYeTFxrSUFwIPTLKg+rtVP50w+oowInrBhFuBTCHGSxI
	 wRhTmi6GtBAsQ==
Date: Tue, 24 Nov 2026 12:17:21 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] riscv: dts: spacemit: k3-com260-ifx: Drop wrong SD
 card vmmc-supply
Message-ID: <20261124121721-GKK100890@kernel.org>
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
 <20261105-k3-com260-module-sd-nor-mac-v1-1-138b39d74602@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-1-138b39d74602@linux.spacemit.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 08:23 Thu 05 Nov     , Troy Mitchell wrote:
> The SD card VDD on the K3 CoM260 module comes from a fixed, always-on
> 3.3 V rail that software cannot control. ALDO4 of the P1 PMIC does not
> supply the card, so referencing it as vmmc-supply describes the wrong
> power wiring.
> 
> Drop the vmmc-supply property. It is optional for a card powered by a
> fixed supply, and the SDHCI core then uses the voltages advertised by
> the controller.
> 
> Fixes: 055044260e7a ("riscv: dts: spacemit: k3: Enable SD card support")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> index fadcf28389be..6e295bc6f196 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> @@ -122,7 +122,6 @@ &sdhci0 {
>  	no-sdio;
>  	disable-wp;
>  	cap-sd-highspeed;
> -	vmmc-supply = <&aldo4>;
>  	vqmmc-supply = <&aldo1>;
>  	sd-uhs-sdr25;
>  	sd-uhs-sdr50;
> 
> -- 
> 2.56.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
