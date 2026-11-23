Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52277606A321
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 12:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oj+wbzT3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kvwxdh8s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hDdgnDIaXeCEYTUEtMVOx5Zw4jKjZkfBZrd7qbSGc2s=; b=oj+wbzT3iUIPJVo/5hBDFzk752
	retyvCFQJ6ITUpxuG7ZvW1e8y3PAOAzGU4/nhuFQFDWhDlXEvt4TzorT62gCDbU1BXozsyMotom5y
	GtTMLoevUBhau63uwx1q6ptMd3HhggwY+Keqoz5WrUJV6RnZvkhkU4BulQ4og1hV3qU0JVeQgTCTa
	+LvRfKbqUUHuo1CBbLgB8NlZuAwJ2UaEwQ4rIyOI3gezCeRmxpZke1uo/ttj20/fbY7QoLErXxxPF
	7MoialoR4o1dOOPvzhxlpogmvDANWv6ZtslXoLKzADb50Q/rQUYBVRHX3LFoymlGvUVMgpRPA6CuW
	9Lnb3A1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVT4S-00000003LBM-3ZxX;
	Mon, 23 Nov 2026 12:22:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVT4R-00000003LB3-2fw0
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 12:22:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C303861FFA;
	Mon, 23 Nov 2026 12:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4371F000CF;
	Mon, 23 Nov 2026 12:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795436574;
	bh=v3ZXJghUVjeMaPQn4cN/Z1xtE3USOoB0nytfsQJJ3Ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kvwxdh8sZZLrNiRaGNJHAeTD3Nn3ZNFKQIiHbCC/WXsVrYVt6hgexABD/CmZTwBa5
	 wbVxC8MBYw6g9XATXqYempsISAOwSRzi97d8ImxgSJj9meOIPAnC/BCnhOweR7GyHD
	 LeZpnp1VFmRPOXz5P8L1bDlKfBSaG0bTn4diXDW94rhE098Xz5rc7cVALWk9+2m7BF
	 Z0zlROQmJL8QMqZOVkcRX/ZEzhPyP8QcpLSoF0W6XFa7HBXabA8YiRSrGfJkECr/6q
	 9aVkP/rztoF+1HsAAQ7WE+dn8CBws0VTdAxdvQeR5z2dNR8nX8fj0GBUmDcqNXN1hV
	 nTb/wkqaWyOXg==
Date: Mon, 23 Nov 2026 13:22:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: spacemit: Add K3 CoM260 TQ
Message-ID: <20261123-normal-girlish-jerboa-81a5bc@quoll>
References: <20261117-k3-tq-dts-based-on-com260-v2-0-68b337bd8938@linux.spacemit.com>
 <20261117-k3-tq-dts-based-on-com260-v2-1-68b337bd8938@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261117-k3-tq-dts-based-on-com260-v2-1-68b337bd8938@linux.spacemit.com>
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

On Tue, Nov 17, 2026 at 08:48:51AM +0000, Troy Mitchell wrote:
> The K3 CoM260 TQ board combines a CoM260 module with the TQ carrier
> board. Add its board compatible with the CoM260 module and K3 SoC
> fallbacks.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
