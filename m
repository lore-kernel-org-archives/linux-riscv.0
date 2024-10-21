Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83001D0E6C3
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 07:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xzuNgyJsI4Lbv+qV3b07ba6ha09zb822UkpMqdAKpFQ=; b=jJQvK74YOPOZrs
	Lvn6ALnmTcSE2MuFd/LRdOzuiOC7FVHj0zCeHPz1VNG9eeRhrO0GwARjEcLcWYWPJBi6GtjmsnxHd
	SBprMZcgUElkd9YKyvSP3c3aK4D9nb9Bzd+mXsBb/jQoCA55ufxZCBCJk2vjdJKNw41PQao5IJibd
	bcln8ePeJ6V9kENvnxsM2X9g+eQ48RY3zH7yw9++LJAE49HdouStT9Y9W4QuOm4xJi1K73qhVtuOD
	wZfJD0rVDyluyHAt8r4euV40HAhBM4S9pk61LH4a7y+7/Pilf16rMWDb1eJ1n8a+9saDu3uiG5NjQ
	DWE8LrBfQdvsOqoNZ4gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2n7F-00000006QzS-02fB;
	Mon, 21 Oct 2024 07:46:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2myk-00000006Obw-1qWX;
	Mon, 21 Oct 2024 07:37:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47EC3A41B7B;
	Mon, 21 Oct 2024 07:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5693BC4CEC3;
	Mon, 21 Oct 2024 07:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729496245;
	bh=2gy3du6vsKAJ+C9iOq3ZQ9oB1KOFdx7EruIwXtjFbKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nR/GULq/+kGrI0Fv7mYTKOVQ46vxfvEI40yJL7e5Y4YTVk114dLmmXRkMfSMvlaCR
	 jm/AZdEUwHMvpq16IG2LtxPx0XPUPadQkx4hs7KFD1dcgtrGAk4KxZNvUtr5G6ATYt
	 IzYlpv6Dx6yHHVfT39ni80lFapHZcVaeqckYZSUjYgudsEzuUAQ0U89Onr3P9z2SY/
	 ZFD2sy/o5pf+DGgj3ZPpqk255+EpxbmExaksbrK0jGq2Zcg4hIrrozf/aO3A0qefT5
	 fuiXwVnEBbZOOOt9kGN9BIFlWjZzP36rs2TeCYlLSgxW18YgdchDgR3AflfX2PcK0q
	 0+y21zYamQkSw==
Date: Mon, 21 Oct 2024 09:37:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Drew Fustini <drew@pdp7.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v4 1/3] dt-bindings: net: Add T-HEAD dwmac
 support
Message-ID: <bv2ao6oxrpbg3hihe6lb66h7bf2d47pg3dcv4c7mrfue26s7br@hsnqynh2ujyj>
References: <20241020-th1520-dwmac-v4-0-c77acd33ccef@tenstorrent.com>
 <20241020-th1520-dwmac-v4-1-c77acd33ccef@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241020-th1520-dwmac-v4-1-c77acd33ccef@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_003726_562235_298593A6 
X-CRM114-Status: UNSURE (   9.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Oct 20, 2024 at 07:36:00PM -0700, Drew Fustini wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Add documentation to describe the DesginWare-based GMAC controllers in
> the T-HEAD TH1520 SoC.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [drew: rename compatible, add apb registers as second reg of gmac node,
>        add clocks and interrupts poroperties]
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>

...

> +  interrupts:
> +    items:
> +      - description: Combined signal for various interrupt events
> +
> +  interrupt-names:
> +    items:
> +      - const: macirq
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names

I asked to drop these, because referenced schema already requires these.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
