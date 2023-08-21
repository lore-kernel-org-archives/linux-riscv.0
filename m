Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11CDEE4996
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 15:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aAoOxyVPAcT6K9BcEPPNYB+gXgnPe0g2v/cL8hkzMhM=; b=tZzycUVDno8Enk
	iN8iw3TpEObxN4EXVrZS0K3O8zHGC50Z5S4+KUq+CosXaVBbBzL1zyT5tm6Cm2CXFieRzzU2EpIve
	JHFODU64gTsmttkLsJHZsJL4j3ZkdhOJUVbmcHNc8yXNWQI96+r7GwP9svMZ7KV4Jh2JP/uEY1sLE
	0dq+wuGp1k4hKF66fqGuWXxzrpoCHqeNNH50N8whvFtop87hcDTbvueDJhyKS2DwK/SKFiDGGZR8l
	WVzioCxBkd+PCvDfMwzNMAP9d+C5If7Zt02391TORVKDAei6ZvGT3DGY9fpyQ472B3HOr3ydilLCx
	+jTXL1aKjq7/KvvVdr2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY76H-00EIOp-1v;
	Mon, 21 Aug 2023 15:45:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY76E-00EINd-1g;
	Mon, 21 Aug 2023 15:45:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0996261CDC;
	Mon, 21 Aug 2023 15:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC65FC433C8;
	Mon, 21 Aug 2023 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692632749;
	bh=DXrBW2VJ76u0qVfmft5avHbG1deyDq+corIBjd53wc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SKVE57PRlBtesE3gZdkizeZ6WGvgRsETyqu6TWNmpAvStHVujOjQzFG4oLBobshxc
	 RztHW+B/KH2ieaUPmT5aF/dO1xLAtAVP40P2CMIHbG0BTsAsvi/S8+MCjyhqCOVnfD
	 QRzwKXcd1KEMAsEmcX8WVwO1bwWGsv9ssQ8ru4/5Te27MzFSbhYmiX1rG2wmYoSwb+
	 Oap0su4emwsccN90z8N3AdZUkGlLQdEILBTJMLgduA7VOzB7z+VejrHGrgmA4tEoGY
	 rM/iZcMuPy880GtnTWFf4jCzF+wRhOlf/KMj3LFdSur3yyqiEdB3k4BJ25wUquqHij
	 KylNtp/whrn7A==
Received: (nullmailer pid 1720300 invoked by uid 1000);
	Mon, 21 Aug 2023 15:45:45 -0000
Date: Mon, 21 Aug 2023 10:45:45 -0500
From: Rob Herring <robh@kernel.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sunxi@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 1/5] ASoC: dt-bindings: sun4i-a10-codec: Add binding
 for Allwinner D1 SoC
Message-ID: <169263274519.1720239.16779866504888120217.robh@kernel.org>
References: <20230805180506.718364-1-bigunclemax@gmail.com>
 <20230805180506.718364-2-bigunclemax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230805180506.718364-2-bigunclemax@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_084550_627371_39D8DE93 
X-CRM114-Status: GOOD (  11.81  )
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


On Sat, 05 Aug 2023 21:05:01 +0300, Maksim Kiselev wrote:
> The Allwinner D1 SoC has a internal audio codec that similar to previous
> ones, but it contains a three ADC channels instead of two, and also has
> a separate clocks for ADC and DAC modules.
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---
>  .../sound/allwinner,sun4i-a10-codec.yaml      | 64 ++++++++++++++++---
>  1 file changed, 56 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
