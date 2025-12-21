Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE04AE67482
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Dec 2025 15:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UopoM6EhRC+Miv35C/36UuXJCs5IN/o+7sybDAOz3s0=; b=X5ftPVAr+X0UTU
	opBJTkhsunmj9qYwbzNAoDFjqwnOogv+x+4cb7JY36R5RgRn1DJvyF0HzYuwdRzctDlysKHT0kbGw
	wXWCIVrHWveOz84zf25g6zNHfDykWtsxb69Y0neYsk7k95HvWUZKmog6QwYcS7lojUIs7A0drey5w
	LUpYA3lY7x4XX8vBoAhaEkWon3VHtT7CX/eD03/1+RTtJZEW32qFMvGHtFXj5KEsPGtBi5Z0IDs2w
	DOGon0oXhpkiysvSv6VhZkYH8FD6oFTieU7F4qm9r02rVo5+UB60L5NpY687uHzeMNV8YEjPQmHOT
	deMvwqxn76RWSK834Z+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXL42-0000000CXL0-42ev;
	Sun, 21 Dec 2025 15:09:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXL41-0000000CXKq-1pCO
	for linux-riscv@lists.infradead.org;
	Sun, 21 Dec 2025 15:09:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 811B460007;
	Sun, 21 Dec 2025 15:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4F2C4CEFB;
	Sun, 21 Dec 2025 15:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766329780;
	bh=2/gGdRF4YQEY0trDcqIqtagcyDa3bJuflC2YsN5NlPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IuY+iubIVecBN2Qq68xRboT8/axzkrTeQvFg3tML6oN/nEPttRYLTfO4fXdim8csn
	 DENi+qFlHgY8TEkRrnPpOrydx9FzDX6+xHHmmlKCtDI0+jEe7hFdSQqRIh7MTxrWJr
	 Suu0c2T2OScbdte4a+Ja9/weW+ok/hqhof9CFCnURHGjMbA50mOI48WuQ5Tr8af2wA
	 Piq8dbIp3+CN00qb7QFdzztO8HEwkWqifNxfane8Cw4rVT5LDYq9ek8FsRiqoNB1qZ
	 779kRobuUlBxQA0Qd8TNnbvF+LbMAwQz2r3xBY1HxroGJ2nOILPFpAuaKsGu4BImTX
	 hfQ/NKH9HeqLQ==
Date: Sun, 21 Dec 2025 16:09:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Iker Pedrosa <ikerpedrosam@gmail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mmc: spacemit,sdhci: add reset support
Message-ID: <20251221-unnatural-resilient-trogon-7b20a7@quoll>
References: <20251221-07-k1-sdhci-reset-v1-0-6780af7fa6e7@gentoo.org>
 <20251221-07-k1-sdhci-reset-v1-1-6780af7fa6e7@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251221-07-k1-sdhci-reset-v1-1-6780af7fa6e7@gentoo.org>
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

On Sun, Dec 21, 2025 at 04:20:26PM +0800, Yixun Lan wrote:
> The SpacemiT SDHCI controller has two reset lines, one connect to AXI bus
> which shared by all controllers, while another one connect to individual
> controller separately.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> index 13d9382058fb..322c69b056f4 100644
> --- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
> @@ -32,12 +32,24 @@ properties:
>        - const: core
>        - const: io
>  
> +  resets:
> +    items:
> +      - description: axi reset, connect to AXI bus, shared by all controllers
> +      - description: sdh reset, connect to individual controller separately
> +
> +  reset-names:
> +    items:
> +      - const: axi
> +      - const: sdh
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>    - clocks
>    - clock-names
> +  - resets
> +  - reset-names

This is an ABI break without mentioning in commit msg and without any
justification.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
