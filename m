Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB95C71135
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 13:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bpsyeHtZ8Cr4YEV/c/YdWXge8cXsJwwNcTL8iBfW+to=; b=zftfbpeZck6X/V
	J77iBGT2HVf7GWbdKakJOwN/5iCrkQKjacBMOKpfWvqeUxbJg0zN9fru1ZueSqRsI0zyhCN/xxB5V
	6wCjazibV37h04PpjYRZbefq61CSF6+z8Cdzfnmdr/2H8BqcVOYqnQcQlqzjenW7224KL0SBnaM08
	9uwOVlPXFZvoPAvj16sQ1UQEc9v5bWXgCbNMCx39RdSVDihiKndm34ovqHFhVmjmBAmCbuS0Vbs1x
	GL7xN7qvz7G40MoY2MarHFXjDLT7aGe5ocnLyEE5x2o/J/mbImOfejqB9eFeWzInncZk1Ec2OSdIv
	VwgjBmiuCUB8R/NklT5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4VY-0000000GUYx-2DKu;
	Fri, 13 Jun 2025 13:31:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4VY-0000000GUYp-0EXD
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 13:31:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04B606113B;
	Fri, 13 Jun 2025 13:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D37C4CEE3;
	Fri, 13 Jun 2025 13:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749821506;
	bh=MkEOfV0i8W8Lzd3l73+lQlM1om1xg080yIUMBBKWzQ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=O/VPNTzUz05NC3yjAiux2hvUTE/Ka6AwFOVYrWp6ZFWiu4VJ+IgLHUlOBs4Jl0OKl
	 MNDujlBTFjcz2gII6bn14jE28wbxEB/BDoHFBRXPLTH/TlkClG4dV/0IZRs3DO7uT2
	 xp17cInINFkYJ+Ied5DPAOnBnOOr4x129XlGI/S1dyQEaKdwFa4z5XRdYA+MVJWdVK
	 UJAJJ90dwdseQJ9jytb5XAypir0dPpjXGMPLwsjQtLbFAPudlFXY1/hmAaYJoCooP4
	 ULDcQEeOBWLKVKx8lESCsQtDCdNEfaBm6oQd0VFH5ZDOJkWO8+HwuXNWYGeu5i99TM
	 9i5tmtAqtt4cQ==
Date: Fri, 13 Jun 2025 06:31:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan
 <dlan@gentoo.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>, Vivian Wang
 <uwu@dram.page>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/4] net: spacemit: Add K1 Ethernet MAC
Message-ID: <20250613063145.62871999@kernel.org>
In-Reply-To: <20250613-net-k1-emac-v1-2-cc6f9e510667@iscas.ac.cn>
References: <20250613-net-k1-emac-v1-0-cc6f9e510667@iscas.ac.cn>
	<20250613-net-k1-emac-v1-2-cc6f9e510667@iscas.ac.cn>
MIME-Version: 1.0
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

On Fri, 13 Jun 2025 10:15:08 +0800 Vivian Wang wrote:
> +	rx_ring->desc_addr = dma_alloc_coherent(&pdev->dev, rx_ring->total_size,
> +						&rx_ring->desc_dma_addr,
> +						GFP_KERNEL);
> +	if (!rx_ring->desc_addr) {
> +		kfree(rx_ring->rx_desc_buf);
> +		return -ENOMEM;
> +	}
> +
> +	memset(rx_ring->desc_addr, 0, rx_ring->total_size);

dma_alloc_coherent() already clears memory.
-- 
pw-bot: cr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
