Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02859CA0FEC
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 08:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9/CjS091iQc7QIIAKx9NMbE34P9vdjMwtuOUKnk8opI=; b=lFx7zeKwZlZOs/
	Oy04K4ok6bRBtxeCw4GJgAQcEEDrsBqWLjlxEBwe+HzJQWVniaB3c+8boee70ezkNNfGMtdzmTPg6
	zGb/WWHA5x0mkvAuTYGuSBnpEO0PaxvN141XvdKwXR8zskqPEEF7diw2BvhKzD4yewAmphigDGrEY
	FSKmChu2BZg7FaJ0miD9DtbxVFn2Kz25nx1ru08niq1coec/prUKkGAMW7ij6QXJ3rwNgE7+jV83+
	0FC3GFllI2WQszn9EyLcHAOco23x6nEDTB+uYEFOvx4Kj+giM0rc1zdf8O+qsIfJkqvysXbk8e0x4
	BOXpXmB9ZqwOV/MN5Z2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTK-00000004Ka5-1MJC;
	Sat, 23 Aug 2025 08:19:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upXSl-00000003Njg-2CfU
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 19:30:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DF5B6023F;
	Fri, 22 Aug 2025 19:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37BCEC4CEED;
	Fri, 22 Aug 2025 19:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755891010;
	bh=GRXNtbctyZGGC0PN83OJd5nWpOvsyv8RPeV6LIKdcos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OyF7ODKbXMAtG6mxXqBkzisVY2DOSL1mzdmdQtKgc1ir1jsHgjrNsyi+DVUcM1DzG
	 ZrVHcuhgj+hkBR0x4jZi4SPbDh2jgm1pri2kS9nYC91bkqZKiOTOIg2PzzKIPt3h2P
	 hazwMvvhJ6uXg1F2gGvo10tF/lMipHrR58s1Z5gKHdEYf5Gut3HFD871y3WGMQlI9Z
	 hQ+R6eWbKSLJ3Vvi1q0VJ0YKSLNXsXU9wGvzSQnqONsqrX54zRAHuhz/y79EeS9IwZ
	 eA+00Jc2JLJVgaTXjGszpyh6/CGfmfMalUZd6mKNozruHc2516Gqj9D9vREZXFyOL8
	 aWiPZenxpgbjQ==
Date: Fri, 22 Aug 2025 14:30:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lukas Wunner <lukas@wunner.de>, Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: Minor whitespace cleanup in example
Message-ID: <175589100873.180019.11142761697135180294.robh@kernel.org>
References: <20250821083213.46642-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250821083213.46642-2-krzysztof.kozlowski@linaro.org>
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


On Thu, 21 Aug 2025 10:32:14 +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/gpio/maxim,max31910.yaml  | 6 +++---
>  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml          | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
