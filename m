Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398DDC79FB6
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 16:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=62MqbsAsSi5h0W9MPehJAb31jaZyad+5FTvExVlJS3A=; b=u1IxKF2Ooiy7kw
	xgpi6+R5oDPyodSnHAgZXQ5XFZwCENJT6eSM01wNlON2C0P/9sQnc5ZZ1C9o57v4vASeUS7dsjDu7
	9DjjeYatpGZbCyRiK0kTBMfhukulSt4Q9wISJzmvm2No2RdZoRTtPFYBRIJiB0d1GP886wI34pH1Y
	lh/TWeiMVzCOsFk9jNZ7mD71zb/j9/KjE+jHqzH5+Y+mXqJNHV+OOhsegINUOodotsZu11/pwvl2I
	eyHBLUCJzcjYcYSefoWeD+Rtfjqo7XXDctSTW2Wt9byn2hShvS7gLzD75iRO63/tGP6eK4+sqxW93
	IJ9IrVlkphc182wA6lVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LZf-0000000CP0M-0bmg;
	Wed, 09 Sep 2026 16:55:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LZd-0000000CP07-4AcW
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 16:55:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 772B0417DD;
	Wed,  9 Sep 2026 16:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C401F000FF;
	Wed,  9 Sep 2026 16:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788972901;
	bh=xrZiWkO/Cig928w3Hg0lcA4NQRdYMH+CxvejqzEbOxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jBayZFm0zOZtOV/v6V/j6XvGE/wtPFLdi3lhON81fWBU5akr3AmKRrbF+wFpvFRiN
	 otWfZbXcUpKbpH8HJyQj2s1imtaqHlKCdXs38ur0R8US9enl32LAU4a0qPiWw/Tach
	 HNqNB3KObm3DaMxItwekuERLPTFf6I1ViX5eni75KKQ2tevrSdH5CkSCAgG9Up4qrE
	 X/uXCSH0sVRMNWIWAhH4uzv2+Y9H0+w2fNviIGzldWpiLDTGMw+RI4GzqiX0bIWrpq
	 fg+tbFAf82bSYRVS+b+YF7JsD4vaYYnwpnzp4pJWfILi5jNFO1HfKCNi17jfxoQ5hq
	 xTJpYrRVFYsTA==
Date: Wed, 9 Sep 2026 18:54:54 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: wangjia@ultrarisc.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Mark Brown <broonie@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-i2c@vger.kernel.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 06/10] dt-bindings: i2c: dw: Add compatible for
 UltraRISC DP1000 SoC
Message-ID: <aqGOXnv2meGnCKzh@zenone.zhora.eu>
References: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
 <20260907-ultrarisc-dts-v2-6-5eb4c97477c5@ultrarisc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260907-ultrarisc-dts-v2-6-5eb4c97477c5@ultrarisc.com>
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

Hi Jia,

On Mon, Sep 07, 2026 at 05:54:45PM +0800, Jia Wang via B4 Relay wrote:
> From: Jia Wang <wangjia@ultrarisc.com>
> 
> The DP1000 integrates four DesignWare APB I2C controllers. I2C1 supports
> SMBus, while I2C0, I2C2, and I2C3 support standard I2C transfers. Each
> controller has one register range and uses separate reference and APB
> interface clocks.
> 
> Add the DP1000-specific compatible string with the generic one as a
> fallback.
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>

Just this patch, pushed to i2c/i2c.

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
