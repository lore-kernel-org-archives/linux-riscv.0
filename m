Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783F8C369A2
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 14:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gS4im41RMEvTsKez283vfTFmQOnVe3lFy2OuDp8HG/k=; b=QEDZJxSuxXW9X9
	mt8OSp8r8TwUYUt95pu7cR3Nv92yzBAMF7FbGpDg7mdnX/nnWYqtUQ0euSXz7pzqGXMMPeKKJzqxv
	0HZQUiQDPh/gOQHVTbWmOew4rDKZIW8ev/yLOiVDyqbWCsQbkvTq/uWpNpuNeZtx7Xs8Md3mPHXKe
	540PAYWsaHUqNWHZT4fGDN0YGgyjbsLOTYTj1hAI2TV1SZlcRaQq0rYSpn1ykvtvGmnQAdvgLCpEK
	JdV9bIkPdZ8g1S2Nrfnu4aw0ET5fRi2sBLKKPqQvV8QJdnlM6nD5xj2XnNxXqh7aQSoYyBbkm2L2T
	Cu1nu1sL94T+U6keh0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1n2w-00000000do1-16l2;
	Mon, 07 Apr 2025 14:01:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1n1N-00000000dTA-0OFA
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 14:00:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B9E761129;
	Mon,  7 Apr 2025 14:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DD2C4CEDD;
	Mon,  7 Apr 2025 14:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744034416;
	bh=5Cal73TGm2lWIHNlKA2mCZV0gIkjUPC5RFYDmMsmJfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aygh3qc8NZeS9Y6m3Ubad39D8XuI9IH4E+efd5uoNMIDRgvJXxXAu7w0vxY1xwovV
	 a1jg1BJ3h8hIYFl/rpsra04LUnbZTfkaOayuERL2stUyoZAv1Uszwu1wau4Zj4MePR
	 VhzCZAeF8Orc6Vov5nF2/SItSsh/b1MfQMHaFq2FK5Ol7/+XKz1RO2P97YkilplU4p
	 hBR6E4yrWrB+tPTtXcm+xKrhwcBSD9L/jhKo75033UGI7DIRF9U0QkuZf6PuHLYuau
	 uaiTtqmdpU3yokh3Jix8UgpjPbh+XYjUO0jMrGcNZJHkVUGaqWE82e5ywhPFMnoJ/q
	 cUaR//orv61lA==
Date: Mon, 7 Apr 2025 09:00:15 -0500
From: Rob Herring <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 6/9] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo
 SG2044 support
Message-ID: <20250407140015.GA2164748-robh@kernel.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-7-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-7-inochiama@gmail.com>
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

On Mon, Apr 07, 2025 at 09:06:11AM +0800, Inochi Amaoto wrote:
> The sdhci IP of SG2044 is similar to it of SG2042. They
> share the same clock and controller configuration.
> 
> Add compatible string for SG2044.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml        | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> index e6e604072d3c..47b5fc1b8e07 100644
> --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> @@ -19,6 +19,9 @@ properties:
>                - rockchip,rk3562-dwcmshc
>                - rockchip,rk3576-dwcmshc
>            - const: rockchip,rk3588-dwcmshc
> +      - items:
> +          - const: sophgo,sg2044-dwcmshc
> +          - const: sophgo,sg2042-dwcmshc
>        - enum:
>            - rockchip,rk3568-dwcmshc
>            - rockchip,rk3588-dwcmshc
> @@ -74,7 +77,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: sophgo,sg2042-dwcmshc
> +            enum:
> +              - sophgo,sg2042-dwcmshc
> +              - sophgo,sg2044-dwcmshc

No need for this hunk because the new one has sophgo,sg2042-dwcmshc 
already.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
