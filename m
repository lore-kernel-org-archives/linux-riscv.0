Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676B2C44502
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 22:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmcIhN8AkAMgnHgtFijFW6fJabbGL8SyHKIQS+dXMCk=; b=kjc3s4z3EhQ5uz
	I04j0hua394h0ur6mqQspsqplo8CyBrWwyabS5C/TiJlHB4DDZJo00UKXAi30bWLk8Mhb3jg/ev0B
	veHNRejE6CyuPB2V/yjKxGnaneJd44fYWCgywgH9GANpzOX1gEZj6Fw/se0L4IeCoQXMpdexfu7cR
	TBJx5us0/kvNWrezzTguo2BMNcSoqmbT6v1yEq3cJ1w3HgDAto7/gL4BGJQQPrOajmr8+p8cA04Hh
	vwt5Qj9SQ8/KoNSPjTvMJ4RdyG6Ks5rFZ+jftNCnRoB5yzX0oNl5P0n12Yvswb0AsUsBx94OQcfQT
	62XzaU7FJU9GdImkEwlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgroT-0000000DiQp-3j6Y;
	Mon, 06 Jul 2026 22:29:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgroS-0000000DiQb-1ctk
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 22:29:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 92197417C3;
	Mon,  6 Jul 2026 22:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4CBD1F000E9;
	Mon,  6 Jul 2026 22:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783376955;
	bh=NIKhsdKujmUyo5f1I8e0key9LsLGYc70ehoq2AKl2uE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G1CpuDRrdmcEC3wEPp2EVGqS3HOURCh2yKP14x2Er3LIpE0Tkc0mbAgDMaBJN5W0X
	 181F/jwiOAN1KUKl7d8Tt9eqaXftQp+0szy8NqHpE4ZGAN+l6ygxC6pQRp6QD4Qi9b
	 PD+cjXv5G0p1b4RhnU3thcwBP/tAEKulVNe+MkjBA+OskiUYP4gz5Af3sxvILh5i9y
	 NSaJwEybJx+Cmcj73mmLNBb+CZKxXIwmgW3FpsZ9uRWTaj3E2yosi1DEV/TEJrrTx1
	 sRsIQcEh/TffxG3kOyZY+Vh0qjdF+17MokOULQIjZKL+OkpTJomQieKfasUeuzHmUS
	 qgxzLhRCrca0A==
Date: Mon, 6 Jul 2026 22:29:13 +0000
From: Yixun Lan <dlan@kernel.org>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v4] riscv: dts: spacemit: Use symbolic PDMA request
 numbers on K1
Message-ID: <20260706222913-GKD35811@kernel.org>
References: <20260620-b4-k1-pdma-req-macros-v4-1-3cf77d0bd0d6@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260620-b4-k1-pdma-req-macros-v4-1-3cf77d0bd0d6@gmail.com>
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

On 01:07 Sat 20 Jun     , Guodong Xu wrote:
> The PDMA request numbers (DRQ) are fixed values specific to the SoC from
> a hardware perspective. The detailed definition can be found in K1 User
> Manual [1], Chapter 9.4.3 DMA Connectivity & Assignments. Add a DTS
> header file to define the symbolic names for the DRQs of non-secure DMA
> peripherals.
> 
> Convert the K1 SPI3 node to these macros.
> 
> Link: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k1/k1_docs/k1_usermanual/9.Top_System.md [1]
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
Thanks

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
