Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50639C83F09
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 17:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PR1G6yyEPr45Di8tg6An6lJZps5EjUcREDiM46zYi4A=; b=M5VYZrI6iF8zMR
	j5POL+omcrNuQZXqkPREEvjkk+QW43GJ3C/nEMnd7CGzK1tByi4U68AfNh2J5rIrhAAvsFqVWdcpp
	/pqseLUcr7+WLD1t8CAQJbcSd+s9TAmOAv/ltw7JdkSpJwJr3ifBQdBNSEZhYddNB0BN0yjlRsF8J
	NeSLpRX50VINKO+ChAQxyDPFmJVeTJOzd6t1lMa7gQZksyyjFdNZ5GeXSGbV73czB9IQhenGGf/vV
	X4P7SOtPXaLBoYQmT3+s7uFs2DFlLfUNjoWeiG88ejnAgwlBUJ1BrwnaAYuSaLbKXoBmTqYg7kKTw
	JUFIQvruRmElex8mal/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBmp-000000063Yw-1zPo;
	Tue, 08 Jul 2025 17:07:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBJw-00000005zSf-2MoR
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 16:37:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF78B6143F;
	Tue,  8 Jul 2025 16:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FCF8C4CEF8;
	Tue,  8 Jul 2025 16:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751992647;
	bh=E2MH6Era3uaTUyq6UQkdrQU623x75zpfdpctt6OS6N4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YgL1aIwpNDOsBhu1lHtzt/gdL7gFViln6CKGKjxHod0zyR2fLCbowFPIjsmwrutLC
	 gHob9L7dauu0Y/QYDTiGGJI9hkGHHC6LacoeIUX3k3WEkFU8qQJeUs4C/ljg4IM81I
	 n7JF9pyG5djAD/QPmt9ZtI9jW+irROhMMzukGAgbAj343qjRffn3mkLOyzwhT3vpin
	 2Dg9e0e6fprGw8p9Ro0/426mcziDZDyHst+e4yANb4MisqoibpC1aZ9d5hFJ5MpGTk
	 R4ZFmdjIuUD2Jn/G/K0N870yt+zdH0MfEARHWiTriEYlNKlMqsisRY6Y74E+cvDPUf
	 7AS8TpPrL3jhg==
Date: Tue, 8 Jul 2025 11:37:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nick Hu <nick.hu@sifive.com>
Cc: conor+dt@kernel.org, Cyan Yang <cyan.yang@sifive.com>,
	krzk+dt@kernel.org, Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: power: Add SiFive Domain Management
 controllers
Message-ID: <175199264440.598704.6992619905695386304.robh@kernel.org>
References: <20250702091236.5281-1-nick.hu@sifive.com>
 <20250702091236.5281-2-nick.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702091236.5281-2-nick.hu@sifive.com>
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


On Wed, 02 Jul 2025 17:12:34 +0800, Nick Hu wrote:
> SiFive Domain Management controller includes the following components
> - SiFive Tile Management Controller
> - SiFive Cluster Management Controller
> - SiFive Core Complex Management Controller
> 
> These controllers control the clock and power domain of the
> corresponding domain.
> 
> Add `- {}` for the first entry [1][2]. Once the SoCs are ready, we will
> add the SoC compatible string at that time.
> 
> Links:
> - [1] https://lore.kernel.org/lkml/20250311195953.GA14239-robh@kernel.org/
> - [2] https://lore.kernel.org/lkml/CAKddAkAzDGL-7MbroRqQnZzPXOquUMKNuGGppqB-d_XZXbcvBA@mail.gmail.com/T/#t
> 
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>  .../devicetree/bindings/power/sifive,tmc.yaml | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/sifive,tmc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
