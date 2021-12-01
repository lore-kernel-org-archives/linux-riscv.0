Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E3FC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Dec 2021 22:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVk2Y7cKck8NWj+EolvxxUSwr6yUS/dNMVgQzn+mzZU=; b=Yt99r6YUX0mjwh
	Rg2PV4DnFtn9uLQAEf+CuM/6/+MCzmgiGVLGiCzuJ9eIOzEUt8GTRM7Un+fZgWcMC/p9WWX4cyYbN
	FRyrztE/KYF9aio/IBsM6kfyjXxit8a6KOnya7BGLT4/DRUQMVjnF3KICQQXjAr8ZxO+elJ/2+oxK
	P7zDfvY1frZdnkEUX773bo4BGDozYOZiNfZoZD649wJ97aHiseV/ASxK5g2Wm+TtfLWHivg9r0Xsz
	A9vR0rm4blf6jK2NF0Dk1A5aIzWPqs6bUmEQPso1KiyqQCFDr/DYQVxMEaQXBPVcJMQHg3hd+AeVE
	PHHOvR1UNLIngax/QMbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msYLU-00AIqG-0p; Wed, 01 Dec 2021 22:45:00 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msYLR-00AIpr-8n
 for linux-riscv@lists.infradead.org; Wed, 01 Dec 2021 22:44:58 +0000
Received: by mail-oi1-f181.google.com with SMTP id be32so51669941oib.11
 for <linux-riscv@lists.infradead.org>; Wed, 01 Dec 2021 14:44:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0Dik/cNjd7dc7gLFF+HRwBT65imFDvL1Ud86HVBJD6E=;
 b=akKu38fySAaB/ur7uiDW+TEZBC2vHRTXemIOPy4DMXGjokw1HXfGWdWFY8OBVD+TwW
 exf/ABWirao0QIejPOWt4GbuqwJopoi5In5/LBIiEY/pF2hxpqYLZ9MhXmlAcBaYeRuK
 1GqN75hL8P6hmBM3wcGPHYkfou7GTK1jlVgVac2PTQ6easP4auI0UoFRYQ1NSniLnoKg
 cqKYPAblM2cxHwhZc5LFqsxUaWi4i0WrNMojRfmqwmsUfdtaBo2yJu4CIhmz/fNenWBN
 MFrZKmk0FM7yqVpnZ1mks0gsMzNrDdwjNTYFcIrPCS0jWG+OqvVItnWkPfLxYYgytfw9
 7wbg==
X-Gm-Message-State: AOAM530qM0T5AHv2PanXiTw3wYmgGyPP/yA8Jxk9/ykwNOKl+ALGLhR+
 zFMSva1oY/0uDJ0p4++W7Q==
X-Google-Smtp-Source: ABdhPJyLil+OfJfqBVs1n7CKHGfbsRXi0FhqLOQM/I7Swp00LprZjST9HaQCtsbrKbRr3xhicV2sEg==
X-Received: by 2002:aca:2103:: with SMTP id 3mr1231505oiz.48.1638398695949;
 Wed, 01 Dec 2021 14:44:55 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 184sm543015oih.58.2021.12.01.14.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:44:55 -0800 (PST)
Received: (nullmailer pid 2968560 invoked by uid 1000);
 Wed, 01 Dec 2021 22:44:54 -0000
Date: Wed, 1 Dec 2021 16:44:54 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-riscv@lists.infradead.org, Heng Sia <jee.heng.sia@intel.com>,
 Rob Herring <robh+dt@kernel.org>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 linux-kernel@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH] dt-bindings: dma: snps,dw-axi-dmac: Document optional
 reset
Message-ID: <Yaf65gY4Qo9irkdB@robh.at.kernel.org>
References: <20211125152008.162571-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211125152008.162571-1-geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_144457_358356_D22C0B76 
X-CRM114-Status: UNSURE (   9.90  )
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

On Thu, 25 Nov 2021 16:20:08 +0100, Geert Uytterhoeven wrote:
> "make dtbs_check":
> 
>     Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>     arch/riscv/boot/dts/canaan/sipeed_maix_bit.dt.yaml: dma-controller@50000000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	    From schema: Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> 
> The Synopsys DesignWare AXI DMA Controller on the Canaan K210 SoC
> exposes its reset signal.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
