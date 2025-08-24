Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E9FCA0EEB
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Aug 2025 09:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HfHCl8CXOPfLH0PSZR3TRqiuStHcuhAqvS2oByyiCfY=; b=h7+9652nZWndsH
	hbfDInWivStr3scixySyYn6RsEi545ZEZN7lStUFIWVrCiFCaVBND/ltup7UsznM2blcwcRheD4gG
	QqRfPIHJM4FyQ8vnsvG76/SV9ELLVl+v56zHVpggO2ruPZgHEZUgciVYW6i+owMyOPtr11REGxg2U
	5KTn1k7EnQ+lAptMVbC/6SAM/xeQ/bQuBTFzwZLCGUs8bArPBFwVBCpAHP0LwghH3osslsUIQZdsT
	XGLHDbr9ZNCdStTL+lIvjVrXtekm2k10vpXKUQpqklvKLn6wkGVhVXUnhbSpsYG7Ei0wBj26j5N0d
	/WgHGTfA5jKBKgw6w5Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq6yP-00000005wlI-2WJ1;
	Sun, 24 Aug 2025 09:25:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq6yO-00000005wlA-1w0q
	for linux-riscv@lists.infradead.org;
	Sun, 24 Aug 2025 09:25:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E018A601E8;
	Sun, 24 Aug 2025 09:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8392C4CEEB;
	Sun, 24 Aug 2025 09:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756027511;
	bh=S2Hs0y3UyUhNqz6ZmS2Je0osjxQ8a6YMieoxMFUDa7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L8YSmOeRjWNHNjjzRccSnLr2QjzZ3HqdwNcOJKD9CiTF8n/dkgsEAoTeqz4tjuLTJ
	 HCHO0VT8E8Tu0MGvmExgPQS+/8bFEO4XZgv0xotG6t+BFoeaRkC80YrffzE/1NhbSe
	 U80t1vQfew0fBdZ3wub3fEDp6Bi0zZqZRD3NryOQf4Tp+iObVLIKf/svVth9o6IILz
	 byWpJPN/SytHioQBEm8ktBICLo3t8eupBUN2CYBiuwfxpNF1/DIshnjVdHxOlXfcf9
	 8B4RmQMUZif6q0bFU7Fa9R0Dnk6ko/ccuzqk0wIrtqcqjvf3jM1urE1nmFT5iMQqWv
	 ns4Bov0LoIqjA==
Date: Sun, 24 Aug 2025 11:25:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hal Feng <hal.feng@starfivetech.com>, Minda Chen <minda.chen@starfivetech.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: memory-controllers: add StarFive
 JH7110 SoC DMC
Message-ID: <20250824-new-messy-raccoon-1c26b7@kuoka>
References: <20250823100159.203925-1-e@freeshell.de>
 <20250823100159.203925-2-e@freeshell.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250823100159.203925-2-e@freeshell.de>
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

On Sat, Aug 23, 2025 at 03:01:41AM -0700, E Shattow wrote:
> Describe JH7110 SoC DDR external memory interface.
> 
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  .../starfive,jh7110-dmc.yaml                  | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/starfive,jh7110-dmc.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

There is no memory controllers driver change, so I am fine if this goes
via SoC/DTS tree.  If you want me to pick it up, please ping on IRC.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
