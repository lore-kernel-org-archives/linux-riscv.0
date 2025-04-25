Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE5CC369D1
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 05:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nSFa39AdbY2y8AWOoQANmDe4Nhf6kH/1I1hBoPUlR1I=; b=q82lUGNUREt4Jy
	M0DjsuKqHKIi82ZJtrmmZ+npVkL9g2EnMH3PcgsXvwF55F73WJxdtw4AlgQaxI0Jikw6nGpQJmJIR
	9fuitS72PE7DWq7Nb4aD0qmoia0qcMTHwjiUeQGXuksp7KctOMYFxBdYaaNw6uBG1klt+SaGYExLK
	gIDZ7QqAZcTm9rfLD3huhBk2vRuXm/cBLdzk3/k/0h0B6aFOJlGWhFVQtkhqdtUWt96qRFc9eZ9zp
	uXHfr8FhAevtGzFkMysfu85OVTI5yO4HVnc6n+qBQcCHzbxzXlWSC/GEc7gMu7vS3IeT56Y4uwtTH
	XgD+jLzdbP6xKvfKupvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8C5v-0000000G1q2-1z6s;
	Fri, 25 Apr 2025 05:59:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8C5s-0000000G1pW-48xW
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 05:59:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CCE4AA4BC95;
	Fri, 25 Apr 2025 05:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2388C4CEE4;
	Fri, 25 Apr 2025 05:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745560763;
	bh=GLp1ktjFa7K3wjwfc/rJPiarptC1W+shUho7laLH4QA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XEB75zzOCleMN1u4qU3hI0/g19GzAUy2M4ejlMLMuvN3pDW3JLiLvdbOFayRSHEKq
	 VQLk2z04wzXPeZGTEt+Bf56fI1AC9cmfAeSmNkOOc/zoP1/QykCMMNSF6XcjXOAcCJ
	 yxTUAnYy1w4lEx0KA7CS0uRYVFRetp5ytT3t/hpZ6W6ddjFQ5XwPNxVUphz5eBlWR8
	 iTAubyJLavL2lK132zU0OUS8KhXcl04eCWwtKnKK31lAvEZk90id4BvI7xjDIFYWz4
	 z367m6L8C0kf6TeQAuhh5OU/RWrzRJKk7c7TwomYxT00sdb3YhwYau/arEN+TgFbzp
	 /HFETG4ueoMGQ==
Date: Fri, 25 Apr 2025 07:59:20 +0200
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
Subject: Re: [PATCH v6 2/3] spi: dt-bindings: snps,dw-apb-ssi: Add compatible
 for SOPHGO SG2042 SoC
Message-ID: <20250425-prudent-ara-of-chivalry-bfffb5@kuoka>
References: <20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com>
 <20250425-sfg-spi-v6-2-2dbe7bb46013@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250425-sfg-spi-v6-2-2dbe7bb46013@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_225925_089674_BA248E0A 
X-CRM114-Status: UNSURE (   9.28  )
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

On Fri, Apr 25, 2025 at 10:28:13AM GMT, Zixian Zeng wrote:
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
