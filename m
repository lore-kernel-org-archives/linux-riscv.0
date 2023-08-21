Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21E5EE4996
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 15:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hm36artS1f5rmN/JHnXutuhinSM0rKo//sN3aB03oas=; b=NDsX2ovnW19YZp
	NaqbClmxL//kuc0NnYjoIZXk2FgvlEYVoTG/dvTAbL1BKkRIWsUvsECcQOqUy5cN+AY97zOgKiEGP
	NQpx5mtN03E29+upRacanFZn8YI1MadHFXu4JPJCpu8LZ9dmGPRU96QHRHINv3smGUN2DyFqU5xk6
	yLesBRvMJeyNGDrmVDU9mrF1bulz91IxGGF3WuEajG1XdsIbU1KJ/FrRUmPxaqixlUskZ+Mh+A9mw
	oZv9mEKk5/si/3qkt0+I44bJx3nFN3RAtJuMMcwwZaJZkseTqCG7bfiXaCedO/V1NQuoddIw8GFsY
	TcRj1vO9ejcr/X3UJeSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY785-00EIaF-1i;
	Mon, 21 Aug 2023 15:47:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY783-00EIZS-08;
	Mon, 21 Aug 2023 15:47:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7DE11615DB;
	Mon, 21 Aug 2023 15:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232DEC433C7;
	Mon, 21 Aug 2023 15:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692632861;
	bh=OdLn/5VwnPYcOVsCm+SxsCuQhbrbLAaRF11wH0pSOb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s8fNMQA1Zn7WVe+BgPARVdchTxIZUalr5+U+um1aPXWS+g2QJrjG/cSgcnKkH6nad
	 Ao1kq5R5JP3ezKEMdOXe26B+4Mc3xUPExkE43BUDSPa0KlY4mGJDjdwiJ4MypcCQqe
	 pVel4Pm45bgEf+jrZy+zlJklXuvseyMMR6nthiYRiQZRcVZFXf3zEAmFHH592Z4b/3
	 YSlpmd8X9eM57Bn93I7P6j8rzwKt287aP8GJ96LZp9IM8s75CXQtN2kIemw+K5m5eB
	 SVLNvWi7r4Y6JpJjj+O4u2d6cIFfhyuorRdJWxDxzy3iM3Gyq7EnNrDQzeuN1gqygi
	 HTXykkslXktjA==
Received: (nullmailer pid 1722819 invoked by uid 1000);
	Mon, 21 Aug 2023 15:47:39 -0000
Date: Mon, 21 Aug 2023 10:47:39 -0500
From: Rob Herring <robh@kernel.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Maxime Ripard <mripard@kernel.org>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 2/5] ASoC: dt-bindings: Add schema for
 "allwinner,sun20i-d1-codec-analog"
Message-ID: <20230821154739.GA1720453-robh@kernel.org>
References: <20230805180506.718364-1-bigunclemax@gmail.com>
 <20230805180506.718364-3-bigunclemax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230805180506.718364-3-bigunclemax@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_084743_118606_2B01E03F 
X-CRM114-Status: GOOD (  12.84  )
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

On Sat, Aug 05, 2023 at 09:05:02PM +0300, Maksim Kiselev wrote:
> Add a DT schema to describe the analog part of the Allwinner D1/T113s
> internal audio codec.
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---
>  .../allwinner,sun20i-d1-codec-analog.yaml     | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun20i-d1-codec-analog.yaml

Looks the same as allwinner,sun8i-a23-codec-analog.yaml. Why can't you 
use that?

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
