Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292F6D13585
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2024 20:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZXeKoNPoLS9SqlK4/j2UXLBtXkPb8G/kcuU3jtXEnM=; b=XMAaPCHCM1Z5L7
	Lrsr08tzboR05YM0tDHrCVzCn67XE1GUgWJD7Aj3ScY4ngENejAdPr0CawbEDwX1zz0Tcpy69nDhc
	YSZuMN33YGrZykLA9yHsdSFze/2IVgTd2eskfm8b/NpTmSQO+Wfnza+NXY0GTbM+CGUzqgoSV+3zH
	m+BM3MZ0HtA0YLOrFq/nlePaN30wYuSAur5sVaCSqe2I8rGAQ8nIcUbAbqTstYUPBSi9wVKOafTtm
	YQWVID8YaiGg+Vqu3pIhQK7wU7B/omJ5MjLGmJt9MFVruxIr2jj6K5N1Ul0h+ohdyWTTCIscm8QpF
	RyEJuQk72EGmJD5fn5iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5A19-00000008qrl-1nza;
	Sun, 27 Oct 2024 20:37:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t59zW-00000008qcP-2Nk3;
	Sun, 27 Oct 2024 20:36:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 646A45C4D01;
	Sun, 27 Oct 2024 20:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D846DC4CEC3;
	Sun, 27 Oct 2024 20:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730061359;
	bh=6Pmsfn3UxhCWmSXYNuTtCkIJ/1rryCxBFsSk1I6wK2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GdvjmXHBclQ+H8qDqDMxr5h/OZYeOxS82/fn0aRZvoXukCGft7x+1LDtIQUayJ/hs
	 aO5+GssudxAnfBqG4biD7EdXt4Jm6YMCb/CW8qi0GKkJfEJJnom0yhuzQbl3SRp7IB
	 DbajJdz3LcCQ/Y6RaUbWKFnC1dy4JOrZnGoqBW4JLqMQPiWebtF/n2xq8ZAp91afbU
	 BWI+cUyQ0bfW4HllsfTAQrhdQ4upyKhCx41mZFuxSkyO1vZt5ZIMNnM+mcu1J9TZEx
	 hrNRM1YcwCKjgd12r3Zd0qkxfGq03GZFokyls7HNHDhUI6Qp/z1OapcYekJzcroe6j
	 rE0uJrB+65LBA==
Date: Sun, 27 Oct 2024 21:35:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: net: snps,dwmac: Add dwmac-5.30a
 version
Message-ID: <c7ue72h3wvzgpcr3joqrtchoy4352ibsp63cpqps2y77oek6k4@5nd54nyk6mpx>
References: <20241025011000.244350-1-inochiama@gmail.com>
 <20241025011000.244350-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241025011000.244350-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_133602_677518_97C0C3FB 
X-CRM114-Status: GOOD (  12.07  )
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

On Fri, Oct 25, 2024 at 09:09:57AM +0800, Inochi Amaoto wrote:
> Add compatible string for dwmac-5.30a IP.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 4e2ba1bf788c..3c4007cb65f8 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -31,6 +31,7 @@ select:
>            - snps,dwmac-4.20a
>            - snps,dwmac-5.10a
>            - snps,dwmac-5.20
> +          - snps,dwmac-5.30a

Same as for Enclustra patchset... this is incomplete approach. These are
just fallbacks, visible by "contains" keyword and you should come with
proper specific compatible. Look how other compatibles are arranged.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
