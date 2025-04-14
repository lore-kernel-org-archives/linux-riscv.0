Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B41C369AE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 07:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvNBdqSWDniKqOTVO//jJdIw9ueRUzfVrNM2Hzn+vPE=; b=20cFe0U0ovSKFd
	XkuUCdn+QGajfhalBH8H6AbKIwVpFOGpuNMswIvknUQi03c3v/WWJWFoL0sQJxockO7TsdmChq/0t
	2GFH18HRixQ65IqHd6u2ACs+bf1Fb56g1A2ODlnzsexkDoRule+Q8P9gYWD9doNZd5W4H69zaTM8c
	Qu1PCI0XW/aV0Q/0kBn9lJp/pciEPq2VqLj65ZyLHKeGcJjO7e4mlSRRvWPgS2cIgGll5qLnv+Q3w
	nMbf8z4cOaJrekVeaR5N3X1pkW85QOc3gAGTEUYtpdUhhtkBVET4RzJTpcEsZwlJbJH7hSdbwaabh
	lTWNQnCyNdv0+VN8UViQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4EIm-00000000w4x-1VHF;
	Mon, 14 Apr 2025 07:32:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4EIj-00000000w4H-3aZ3
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 07:32:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B8294A301;
	Mon, 14 Apr 2025 07:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F94C4CEEC;
	Mon, 14 Apr 2025 07:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744615937;
	bh=RLi0xcDFC0POZyCjRcWUAUkI6UXBaxE2GsFQ2nAPD6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fo/JuIFISjKZlyesPpSbbr776bFBfLjQmABhSc/bKJ3RrVh7ZNGshiWObc3MB4ZM5
	 HHXjT8l9/JG+19xNMyEYUeHgXcbe5bFYY4Ol2EK0NqXOa+2uX9EN0POyPWWd3XtnzG
	 6ldG+qsok2HpxaKQDhxcT8IAmRq6VPvPRelLWnC+c4CqKE6gnVUyocqXi6jlSFEC6j
	 MWW74QXYnfMBcv0nK+A3iQvkFVy9DG8l1q+/Ma+LBAvcEAdvL0uyz1JLomWD4J1qSE
	 WKE8jFDuWdxZuuvAoOq1V6maND/EB2Aq3d9XWJGKPlYBJR9OmvcmUM34DTAf3OiM5o
	 BY5EGH0tjDNag==
Date: Mon, 14 Apr 2025 09:32:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 07/10] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo
 SG2044 support
Message-ID: <20250414-slick-vulture-of-awe-fa658f@shite>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <20250413223507.46480-8-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250413223507.46480-8-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_003217_914201_A9BE35E1 
X-CRM114-Status: UNSURE (   9.35  )
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

On Mon, Apr 14, 2025 at 06:35:01AM GMT, Inochi Amaoto wrote:
> The sdhci IP of SG2044 is similar to it of SG2042. They
> share the same clock and controller configuration.
> 
> Add compatible string for SG2044.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
