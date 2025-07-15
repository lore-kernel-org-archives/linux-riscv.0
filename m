Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A417C83F17
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 04:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/HJFDLF1CKYsgVerJkYPOTRDuWeQOQ5D7KQqYq5IGI0=; b=nzMjOUtUNzrM9u
	OuvTyqVImEvWmRmcNRcyNVeulVX4VYr4E5HGwSX9/LpvdNTT9yaT5M6cXgANi5ZvwOesidzrGGiNJ
	DXzsXNJzViuZIAC+QRSRexYp2N0U97Jp7BmgTDKx5fdMIWx0KtptH5ezTprorenodolSWKV+Miq/z
	gdOthgkwu6boqzfprwarNV1I1Gfb+exjauFH+CanYezJyd9BPnC1tnEu06df6sY28NXqvelaW2efD
	q+sWXau5JwqRfhJB3vwY2J4jtozFbe2r5iszRrzjkGEf95kDdMIuMzevNLoLR2ZzAYBWIIfehX+tN
	imLMkXLBijkTrwZZN1vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXHQ-000000040QL-3Thl;
	Tue, 15 Jul 2025 04:28:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWbm-00000003voa-42uF
	for linux-riscv@lists.infradead.org;
	Tue, 15 Jul 2025 03:45:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3F2145F0C;
	Tue, 15 Jul 2025 03:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9F2C4CEE3;
	Tue, 15 Jul 2025 03:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752551134;
	bh=elGNN/7GREr5t/sTwb+Cm6955F1QyvllRbGLbNSu6vA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jcY3U8Hxj+NyN3DitDeH/2XPSk2vRa49Q01aMRN9C/L4A1tTY96j8+Vf1I78Yfghu
	 D8y5521xRvUwssBl9afbadX+xI0UdBW0amxz7p3HpOPzn5d5Yomuwm0ed9UHFXnxCp
	 JK/t/oec1rZhd2uDWJPogmwIk6oNe/mfOQ6fpfa8q53PHMQZ09K/Uj47DGZa+wrlU0
	 XUqbyB0aBbK6sS2Xn+PvSWIFkxkfRZpSooexnkQAR5ZqLmYb1CHDfK88nu8u+7WA8q
	 9qq9BZZkdQZdzJzno2R4SuOY2E+Wu0VDH3vBLYYq2DxcMbzgL0hbbgib2q7frsK0Co
	 MT+60iMC4rb+w==
Date: Mon, 14 Jul 2025 22:45:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: dmaengine@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Alex Elder <elder@riscstar.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: Re: [PATCH v3 1/8] dt-bindings: dma: Add SpacemiT K1 PDMA controller
Message-ID: <175255113305.1485.18050987625765048681.robh@kernel.org>
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
 <20250714-working_dma_0701_v2-v3-1-8b0f5cd71595@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250714-working_dma_0701_v2-v3-1-8b0f5cd71595@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_204535_021020_64FC7FBF 
X-CRM114-Status: UNSURE (   7.97  )
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


On Mon, 14 Jul 2025 17:39:28 +0800, Guodong Xu wrote:
> Add device tree binding documentation for the SpacemiT K1 PDMA
> controller.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v3: New patch.
> ---
>  .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
