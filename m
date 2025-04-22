Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A95C369CB
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 10:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hn8QdWmjyx7+CwJHSkWx2z2tUpiguDrfVRAbwtyL9xI=; b=DoagS+EEVWNvno
	oRAHxiRotCvY4jXO6Z90TJqx0ZU2LaUBKDXXqxrM1HfO9gme/SAiczoX012/DvfSRHqoxcbnnXWoa
	6aXBCRtsA7AXPd466hpz2Oe0rcgr1uOCmJ+ca/uIdrksoQJE4tSppjmPieKujXyGisx/qDbOZtyM4
	/lHDB+Hk0wovAW+NIxYYcwOH3MZothE49WFKTZEh4gBXDZnKNQMqzH/Ae+jAvpxqweH+K7lxv8cCC
	wfTTRjc8KvKf9KXWcG8xEVzEQXH1+p1XQW+HLBR5ToZ3qZ0bjT/4snbxfTjlKNAVNLmqUPmJtCSMg
	CUxVyDXHbWvB1+6pFaQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AWk-00000006g61-1Uwh;
	Tue, 22 Apr 2025 10:06:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79Kx-00000006Qa2-0uNZ
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 08:50:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14BAC5C490E;
	Tue, 22 Apr 2025 08:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC458C4CEE9;
	Tue, 22 Apr 2025 08:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745311837;
	bh=zT5yjxc1BjzTyrF7qU74cHTpuWHBzYOk4qyMnCNGTHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yd+/1hHgLMKAkVj5RRoxdtfnlZvK1uI+LWg7GeK5M7op2BTQbEt3E1GQzqqDCAx3O
	 4ktpx0Uki5Ub3ZQqHJuHeLAyNfUt7LTucKDPSaPQF7JTirLi5GOQ9KIjUbvwe06P/Z
	 cdAP/YmPAq/PfQcfhfHIFk2qtwvJvl1o5FujvGoYLq1/nIQkHM+wlYACfH55/MQgmN
	 DglqVLwpW5Y3PBwzvSbi37lHwFjF2Fqfv9OH3B18VVwhpgVoV67X3+CQQQOft3ht3Y
	 o69MQnmF2YrNOLhe1/jOFxWICf2rgJVeDMq3PM/AZkdQrc7dTZ2wS2+CcGr50H7D2s
	 KMZplLLJazrAA==
Date: Tue, 22 Apr 2025 10:50:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, sophgo@lists.linux.dev, 
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, dlan@gentoo.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 2/3] spi: dt-bindings: snps,dw-apb-ssi: Add compatible
 for SOPHGO SG2042 SoC
Message-ID: <20250422-super-giraffe-of-drizzle-b388bf@kuoka>
References: <20250422-sfg-spi-v5-0-c7f6554a94a0@gmail.com>
 <20250422-sfg-spi-v5-2-c7f6554a94a0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250422-sfg-spi-v5-2-c7f6554a94a0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_015039_583408_38B716F2 
X-CRM114-Status: GOOD (  12.34  )
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

On Tue, Apr 22, 2025 at 10:27:09AM GMT, Zixian Zeng wrote:
> Sophgo SG2042 ships an SPI controller [1] compatible with the Synopsys
> DW-SPI IP. Add SoC-specific compatible string and use the generic one
> as fallback.
> 
> Link: https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/SPI.rst [1]
> 
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> ---
>  Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> index a43d2fb9942d85b1482a52782c0a97cd5c6edd99..d32380a2e5b18f61ed66715b4ac67c04fbda10ef 100644
> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -67,6 +67,7 @@ properties:
>                - mscc,jaguar2-spi
>                - renesas,rzn1-spi
>                - thead,th1520-spi
> +              - sophgo,sg2042-spi

Messed order. s goes before t.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
