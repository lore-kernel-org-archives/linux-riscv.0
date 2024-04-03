Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2A3CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 17:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRPMdE2n5RIBNkgBsAi1rg/DylebSnyN2wHPqoDm108=; b=cbM9f87kFxutow
	FIQlDV/gU1vzMQNCQ/5xA+TIOcPvTeGQSZIwJDdD/Fzz5ZJXd1geAmb6GEIdHOIVz0Wai+dV1lFRQ
	Y3EY5tZcjXCza0vbd8V9G1nVeUI24ftdWf2/2sWXvlAs5faUybeEjGwIe9iVmDzEF6dgrzYTlwwHK
	oFkm+dq9igmsaizuS1qo9+zDwIhhXFydQnAuYjI8enPKRIFH+ODmy/jsumQx3CR/XljH/8+ipKu9u
	2MRq0D/8mXgzW+M7QgDlZmx+vqdvrjfOx2EqnXI+VpNKJOJXfbqfDp56zWR77Xnj4c+ZPUzWNdlqW
	IlW4E7hlbH2fc7Zwz2zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs4Cx-0000000H7sE-2Q4R;
	Wed, 03 Apr 2024 17:15:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs4Ct-0000000H7qG-3l57;
	Wed, 03 Apr 2024 17:15:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0E412CE2B08;
	Wed,  3 Apr 2024 17:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E04CC43399;
	Wed,  3 Apr 2024 17:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712164525;
	bh=LU4Fr44tzUgk3hAyzANG0d2RG8nR6qdxsxdjqxB5zO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Crn2Bypvo3Kv0F/G3kczzQFESKl58l7QIP+KlF5HW2ukxnJddUqfeWcVj2sibhi6r
	 Wd4pAC48+U3CzabQU/ScGSwvstLaVOAenqS+JANq9rVVusFqiX8CZsZz9Yu7IQE06P
	 dN61bJcHFau91VNy3QNbrlcU5t2RpnRl22f2UaWjMoMqKUuTPMNOxL8vgYtFaj4Qah
	 mD+UlGcjt9JtvGnhOe6FDnxJK10I1bP/zZQOPKLhLrIaWjD8/L1yWpxm7e33T26IV5
	 /FPvSBI+GIFCJPeP6n2EDA5WlPj8vgjmsy0twk/tcWyBo6Vr6TY9o1opeuGt+O40yd
	 SRup2Djue5aSg==
Date: Wed, 3 Apr 2024 12:15:23 -0500
From: Rob Herring <robh@kernel.org>
To: Tan Chun Hau <chunhau.tan@starfivetech.com>
Cc: Andrew Halaney <ahalaney@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jisheng Zhang <jszhang@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Jee Heng Sia <jeeheng.sia@starfivetech.com>,
	Paolo Abeni <pabeni@redhat.com>, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Dumazet <edumazet@google.com>, devicetree@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v6 1/1] dt-bindings: net: starfive,jh7110-dwmac: Add
 StarFive JH8100 support
Message-ID: <171216452060.4016592.7318363130745016894.robh@kernel.org>
References: <20240403100549.78719-1-chunhau.tan@starfivetech.com>
 <20240403100549.78719-2-chunhau.tan@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403100549.78719-2-chunhau.tan@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_101528_130118_A429FB5B 
X-CRM114-Status: GOOD (  11.69  )
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


On Wed, 03 Apr 2024 03:05:49 -0700, Tan Chun Hau wrote:
> Add StarFive JH8100 dwmac support.
> The JH8100 dwmac shares the same driver code as the JH7110 dwmac
> and has only one reset signal.
> 
> Please refer to below:
> 
>   JH8100: reset-names = "stmmaceth";
>   JH7110: reset-names = "stmmaceth", "ahb";
>   JH7100: reset-names = "ahb";
> 
> Example usage of JH8100 in the device tree:
> 
> gmac0: ethernet@16030000 {
>         compatible = "starfive,jh8100-dwmac",
>                      "starfive,jh7110-dwmac",
>                      "snps,dwmac-5.20";
>         ...
> };
> 
> Signed-off-by: Tan Chun Hau <chunhau.tan@starfivetech.com>
> ---
>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 28 +++++++++++++++----
>  1 file changed, 23 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
