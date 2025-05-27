Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3381C54F30
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 07:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O21um++BI8WxSnJzPykut7501PS52enU3CG1/SnGhZM=; b=uAiqYMfCLIafPp
	yw88daFtngpI4ktISQKxwCHqnohxwg6XGjDJCuEmIUsYtMZFcnGfaogLgV3INcAiRWqV0lWHm0HE1
	L4wg1Vk1W814Nd074vMq8aqC+csN/OrZba1dtKjYxwBcgWc4idAwyLZ7Luq2BAz4jvUimYsroV1tz
	aSk4nBBtwwpK6HtJI6f4FsVTL7wRqqUZTFB9x3gjZsrpULjpgycmVbu+PbycVUvxYfzeVTOJPmg4W
	F14oGFC4gmMv5FtgThrqUoj8Gh0eCZIDGKr2lzmHv5E8iANjCuWNvVxP+PLVnJl2cvMXClWjp16m2
	Eg2i5jSSpFH9ivvbg/NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJoQo-0000000A7Jk-0XQ1;
	Tue, 27 May 2025 07:09:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJoD1-0000000A5D1-0QCe
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 06:54:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C6384A338;
	Tue, 27 May 2025 06:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC18C4CEEA;
	Tue, 27 May 2025 06:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748328885;
	bh=QfDd2n6cFYxP02STJxzyK1KJcbrSY/2E6tZlrCZsMhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bclxlVw2IYLcWxr58kYfVjk0uBUQyDLV/GHEOoTneMgUy1l6skSnG2YZaAcRDGiRe
	 oy1AWYOskvfgAISsj/OjcESMUi+PqsaeSW1k+hAgjxDCWVk1OJGgmtoAxLiUJAIkPM
	 UiuVQfOUgwK8KIvSZ+lOwu+IbBClMOxw34TMbLraUfL5KH1V4U9PtmjoD0SBX9SaAW
	 UphDeyBTfNyhfJcX+TYSfVFqdaQYpX5cBZBWr03Lmou/LZZrf1OJW8jXG087wCtXLp
	 WAV++B+Q1OiBEVhDPdKozWvOQd8402m0HSApU9ZrofZ5skcwzsD+V7miYb73d3UsOT
	 PXuELbK0ZMHPQ==
Date: Tue, 27 May 2025 08:54:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ze Huang <huangze@whut.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add K1 MBUS controller
Message-ID: <20250527-friendly-armadillo-of-snow-5bec9e@kuoka>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_235447_159375_282D7D8F 
X-CRM114-Status: GOOD (  11.09  )
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

On Mon, May 26, 2025 at 10:40:18PM GMT, Ze Huang wrote:
> Some devices on the SpacemiT K1 SoC perform DMA through a memory bus
> (MBUS) that is not their immediate parent in the device tree. This bus
> uses a different address mapping than the CPU.
> 
> To express this topology properly, devices are expected to use the
> interconnects with name "dma-mem" to reference the MBUS controller.
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>  .../bindings/soc/spacemit/spacemit,k1-mbus.yaml    | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-mbus.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-mbus.yaml

Memory bus controllers go to /memory-controllers/ directory.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
