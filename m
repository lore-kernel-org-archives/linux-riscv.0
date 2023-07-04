Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9A0EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 16:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X9umGopjs7tQe/apvpM6WbWY7/io4jfgB5RBdycnND8=; b=qVE9ixB9Tqzj/q
	XlpQ0hZ0on4Os4VoMi8+axYZyydbJSiBPMiItfOpHMzfbHhDzvt47fHo0W6TfpeVFGDKJGAKFnZX9
	VB/z8+oS/9ee+mbsNkZC5pER/H7w+yYSAY42lKXVXUhbbTDGv33WzMxPe/WZXHdQpJZfz+DEh9Xjs
	bVnWNn0ALUZolhgApe4pVpPz7xBQurdMRHn2xMjiHjqVHzGadU7bzfrwVQ12S0DRdgR5QoMpbCKUB
	xITzVyP1Nfb2M/6sbV8l5d3A3BQpsdH7Uj/9OIypCGRXlAau0LlsYWH8I4ZTpYXRfEAelpZGI5uRr
	WRC28VH77SJxQdVDccaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGihF-00DmyJ-2U;
	Tue, 04 Jul 2023 16:16:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGihB-00Dmwm-2j;
	Tue, 04 Jul 2023 16:16:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D7D63612DC;
	Tue,  4 Jul 2023 16:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2E7C433C8;
	Tue,  4 Jul 2023 16:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688487362;
	bh=k1DBTIVmtQdmuvViEJWZzhb8aPKMCScd3plhjiJsXXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h9y86wx8Eua2Jt/lLwTgu+U1on/jF1Uy7fj3N2Ym2lH7sfkjztuhXmh3PIY/R2gPq
	 qp5nvU02K0PY66Q2MOzor5X5XN3+g8/hYhLnvT5dFGKOzvNac8gR+fnwaDKGBlmUXq
	 zBS7vmWOfFyNT6AyjxDO2g9KqVqJgVE8dfvT5pAHEK3KOQ9AqEcB46t2B3/p8kUDf+
	 LzSPyABYm8FEwdPksgy2lAxBhZatBSvvLZj23H9cJDUBAdaEp6GaFYgUR3Nmwan+mn
	 LbwsG0z0TfnN+1vSpBVlrzZSmleMX2SbQRxlMoS53v/JBZdfG7TbQ0ffLmkcK90+X9
	 fpSWMdiBeP+hA==
Date: Wed, 5 Jul 2023 01:16:00 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] PCI: meson: Remove cast between incompatible
 function type
Message-ID: <20230704161600.GA435329@rocinante>
References: <20230629165956.237832-1-kwilczynski@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230629165956.237832-1-kwilczynski@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_091605_946411_D7945AB9 
X-CRM114-Status: GOOD (  10.02  )
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

Hello,

> Rather than casting void(*)(struct clk *) to void (*)(void *), that
> forces conversion to an incompatible function type, replace the cast
> with a small local stub function with a signature that matches what
> the devm_add_action_or_reset() function expects.
> 
> The sub function takes a void *, then passes it directly to
> clk_disable_unprepare(), which handles the more specific type.
> 
> Reported by clang when building with warnings enabled:
> 
>   drivers/pci/controller/dwc/pci-meson.c:191:6: warning: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
>                                    (void (*) (void *))clk_disable_unprepare,
>                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> No functional changes are intended.

Applied to controller/remove-void-cast, thank you everyone!

[01/03] PCI: meson: Remove cast between incompatible function type
	https://git.kernel.org/pci/pci/c/60fce60ab7b6
[02/03] PCI: keembay: Remove cast between incompatible function type
	https://git.kernel.org/pci/pci/c/43a2eef7cbba
[03/03] PCI: microchip: Remove cast between incompatible function type
	https://git.kernel.org/pci/pci/c/9e4811ce626f

	Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
