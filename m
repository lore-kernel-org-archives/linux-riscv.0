Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A64606A33F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 23:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jrd36syg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asub0Id8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jwB3Vy55Ih4h0IryNxbh437cEHWiEi5SH+1jz8nAt8U=; b=jrd36sygQE9M5kR6D1TIIKtwQQ
	ZHRCeclPCOeXkQxzjfUAKLtmyWHHesHZUKOIWHp2nIlgRlRuf6SJHURKasV26He6DWYexJbBEx10h
	tdo2NGAuNT8/NnVswOkTh6GsB2NLMN1Rq+orSRSoem4ap1gGWyMVkDo/dxBRD9zgBL0hZdlFYBz1P
	Vfq7ImWTjWv7nRc0NkFGHoqnsenqanVXFdSHsAHP2bXp+fjTxtsQFmovmKDTmOGaLY4Wk4M2zk+49
	82N+THPho8c+n367cgkmxy1SXO1JnpLJCqWNGwxqkSenCRg0bVyu62+LJf6LSgib3Qbx8FxNZtqvU
	NvATRc5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS0KB-0000000EmSk-2EHN;
	Fri, 13 Nov 2026 23:04:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS0K9-0000000EmSM-3VpZ
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 23:04:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C62C41885;
	Fri, 13 Nov 2026 23:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10F31F000C4;
	Fri, 13 Nov 2026 23:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794611089;
	bh=Krx13oDhrRUsMiTIZ62Zs/3Dq6U/Cu5IlVxvdunMvxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=asub0Id8uKMir4Sbcs1fqGd5cRgvs415DyEMt8ueIxeyAQm4hoQXX/auX2Tljs0Ca
	 rvedxqjQ9YCTY0jMhe54wXZAPVQvzX8d5vhvdi+ySKZi19dLCkxBXTwDClZzGoYlQk
	 20Z3lBw1+2z0KkLN7Kk7J9XUiYAtd/mEeKZV8gTdBJgHiou+saGr2PapavicypGw9r
	 BrjGCZman0b8Nvk4p7Gu9rVgXs2FfrwMzxGq2bCIZU+/E3EJUjV20RxbTtbYQe+dN1
	 X1RLNiu8XOeL9zs9/KB7ZmQrJOojCl8BEnPpp8wkl8z+LfOeIyAVISOVRbswT/y8hm
	 AcakntsBaFm8A==
Date: Fri, 13 Nov 2026 23:04:46 +0000
From: Yixun Lan <dlan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k1: Correct missing space
Message-ID: <20261113230446-GKA67791@kernel.org>
References: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261113185214.182695-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261113185214.182695-4-krzysztof.kozlowski@oss.qualcomm.com>
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

Hi Krzysztof,

On 19:52 Fri 13 Nov     , Krzysztof Kozlowski wrote:
> Correct minor style issue around white-space - missing space.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 542bfc0d19f5..5d5f7f8a393d 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -948,7 +948,7 @@ pdma: dma-controller@d4000000 {
>  				resets = <&syscon_apmu RESET_DMA>;
>  				interrupts = <72>;
>  				dma-channels = <16>;
> -				#dma-cells= <1>;
> +				#dma-cells = <1>;
>  				status = "disabled";
>  			};
>  
Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
