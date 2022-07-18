Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715C9C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 15:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2NLizJj/3zEuVuPib3IDprT5JoX9MrZB5Kjo2Uv/jg=; b=Vbqpz+Px0Xc0xx
	gWWgcWFrusgV5ZNSwiIaQZWqzz39pzIDurowZzJ4mNa3SBmfMhTL9s9aKpTNYx9irSbGmoD8pRoVz
	3reGlq9zGh2/Cfc1mEAj0y8a7K3xg2Uj5KXl3RGLSM1uPaKYH+JSpEwLCXVtMRFq1jEcEoMoqo9D6
	5UC0eFFVnuNy5fvG9Igu/tS0wIaBolpqhnxv5sEkILVuO7zM1XHEHPJp/6VD55jfK/6bVKqEMXVpC
	jxNlpZGGhC0Xni9EcHt+UAlVLynGlOdvnWNM57jmJEhxdhoqyB8zEuzzI1Xvileyafo1FaWfphVRV
	kv1T9HotN5QD2jP3GOEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDSQY-00G7fY-Ng; Mon, 18 Jul 2022 15:12:54 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDSQV-00G7cu-PN
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 15:12:53 +0000
Received: from [167.98.27.226] (helo=[10.35.4.171])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1oDSQ9-002C9w-8q; Mon, 18 Jul 2022 16:12:29 +0100
Message-ID: <7c68e645-efd7-c48c-77aa-9aa607c77033@codethink.co.uk>
Date: Mon, 18 Jul 2022 16:12:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 03/13] dt-bindings: dma: dw-axi-dmac: extend the number
 of interrupts
Content-Language: en-GB
To: Conor Dooley <mail@conchuod.ie>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
 <vkoul@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
 <conor.dooley@microchip.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Niklas Cassel <niklas.cassel@wdc.com>, Dillon Min <dillon.minfei@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <20220705215213.1802496-4-mail@conchuod.ie>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20220705215213.1802496-4-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_081251_852406_599199B5 
X-CRM114-Status: GOOD (  22.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 05/07/2022 22:52, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
> controller, but according to the documentation & devicetree it has 6
> interrupts rather than the standard one. Support the 6 interrupt
> configuration by unconditionally extending the binding to a maximum of
> 8 per-channel interrupts thereby matching the number of possible
> channels.

I think you can still configure it to produce a single interrupt
even if there are per-channel interrupts available. This is from
my reading of the driver a little while ago so may not be totally
correct now.

Having per-channel irqs might be useful in the future, but as above
I think it'll require the driver to be updated to do it (and possibly
some sort of detection)


> Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 51
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   .../devicetree/bindings/dma/snps,dw-axi-dmac.yaml          | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index 4324a94b26b2..67aa7bb6d36a 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> @@ -34,7 +34,12 @@ properties:
>         - const: axidma_apb_regs
>   
>     interrupts:
> -    maxItems: 1
> +    description:
> +      If the IP-core synthesis parameter DMAX_INTR_IO_TYPE is set to 1, this
> +      will be per-channel interrupts. Otherwise, this is a single combined IRQ
> +      for all channels.
> +    minItems: 1
> +    maxItems: 8
>   
>     clocks:
>       items:


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
