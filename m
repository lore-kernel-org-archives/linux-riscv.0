Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B212CA1019
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 03:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZjyNxWHm7dpZCHDC+JzkF4Ne9N4/xigcy9kaprqYKS0=; b=OuKub0IvXNtCtZ
	LUjYPcJb7RMD+pF8SHqDnlU4K08kQlPx84+CJCcO2XHEL3fa9OGu8dfFAjhZFu7jZNS1xmLbcldJr
	aIolwLTWgyCwDU2tonB65i4EEuI8DsPg8YkJ9SY8gV8wfc7+L2i7VPox5PEdjgDQyQ3oatpuW9H7j
	4iRy6J0kV+0o9JIRWZZWHrDuBUtOI08y6zRATALEImfLUvJxsY6qwdfsPblLCdYBB9TeS8UOOArkx
	doM+HsMCubOpC4uE0q0jZyMzBH6SLLgG96a4hVoY6N1m+K2EEJ/B+Mr5z3Qcml8NzHzfYIlTXLfD/
	whNNQ72x/IVK5qyx/CsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0bq-00000008fV0-3v0n;
	Thu, 04 Sep 2025 03:26:02 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utyA8-0000000813Z-2PDZ
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 00:49:17 +0000
Received: from ofsar (unknown [116.232.18.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 62C68340D9E;
	Thu, 04 Sep 2025 00:49:01 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	duje@dujemihanovic.xyz,
	Guodong Xu <guodong@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: (subset) [PATCH v5 0/8] dmaengine: mmp_pdma: Add SpacemiT K1 SoC support with 64-bit addressing
Date: Thu,  4 Sep 2025 08:48:45 +0800
Message-ID: <175681694608.479569.7465779228756094615.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
References: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_174916_631874_6F1D4370 
X-CRM114-Status: UNSURE (   8.74  )
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


On Fri, 22 Aug 2025 11:06:26 +0800, Guodong Xu wrote:
> This patchset adds support for SpacemiT K1 PDMA controller to the existing
> mmp_pdma driver. The K1 PDMA controller is compatible with Marvell MMP PDMA
> but extends it with 64-bit addressing capabilities through LPAE (Long
> Physical Address Extension) bit and higher 32-bit address registers (DDADRH,
> DSADRH and DTADRH).
> 
> In v5, two smatch warnings reported by kernel test bot and Dan Carpenter were
> fixed.
> 
> [...]

Applied, thanks!

[6/8] riscv: dts: spacemit: Add PDMA node for K1 SoC
      https://github.com/spacemit-com/linux/commit/81d79ad0ddcaeaf6136abe870b2386bde31b7ed4
[7/8] riscv: dts: spacemit: Enable PDMA on Banana Pi F3 and Milkv Jupiter
      https://github.com/spacemit-com/linux/commit/0e28eab0ca51282e3d14f3e2dba9fc92e3fddbe6

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
