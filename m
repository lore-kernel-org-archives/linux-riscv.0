Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371BFEF070F
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 06:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olgOiv5VlJRGd9EAnBD74wABQBfCIKnZaN/dlKiyMmA=; b=nvqwx6nehCirpo
	UT6dl6nl0BJwj2fKKaRTztmPLv/tJppW39k2FY84Xtm2mhrMEP1a6YxdqcnzHIKEkxst0h8+ohNaK
	pFggdTSruSpZFCc2dICQOoc0Sb/01dWbpJLDcegN36Mm7JjA4FSuv4UOFQKY2jM2IRcis0naD5qLS
	AEflB3IZW2WWQys64kEBy0iFI09oQnT35NA9X3Y5Fu9wXPoHtrFDXC+5YwjM+rzxK2LJ+m6rkt3UH
	1EJADhQGPuYa9tgJl55lOYmzzXy5SYocpywz8Gvnx7iBGQZ+ib9npVHRhHB9z5K2QpX8lvRnwy83I
	pIIlrExubEtePuLA1DxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpKwu-0000000Eume-1aQL;
	Mon, 09 Feb 2026 06:40:44 +0000
Received: from mail-m8221363.xmail.ntesmail.com ([8.221.36.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpKwp-0000000Eult-3i5B;
	Mon, 09 Feb 2026 06:40:42 +0000
Received: from localhost.localdomain (unknown [58.61.141.99])
	by smtp.qiye.163.com (Hmail) with ESMTP id 33912914e;
	Mon, 9 Feb 2026 14:40:25 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: krzk@kernel.org
Cc: amadeus@jmu.edu.cn,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	huang.ze@linux.dev,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	vkoul@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: spacemit: add regulator support to K1 USB2 PHY
Date: Mon,  9 Feb 2026 14:40:16 +0800
Message-Id: <20260209064016.1176056-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <8c3835c4-3602-4cee-9631-0551b0341918@kernel.org>
References: <8c3835c4-3602-4cee-9631-0551b0341918@kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0a9c412143aa03a2kunmf6f2d9044b9dc8
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDS0tDVhlKShhMGUMaH0wdTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVQkJZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVUpCS0
	tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_224040_299834_DA29B5F8 
X-CRM114-Status: UNSURE (   8.53  )
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

Hi,

> Plus, if this was a vbus regulator it would not be called "phy"...
> Even more confusing.

Sorry, I didn't consider that this naming is confusing. Other
platforms, such as Rockchip's inno-usb2phy driver, use the
"phy-supply" property. I continued with this bad naming.

> Bindings are supposed to be complete regardless what driver does
> (or does not).
>
> You must list all supplies with proper names.
>
> If this regulator was missing, then what else?

(...)

> Please start describing in the bindings your complete hardware, not
> your drivers.

It appears Ze Huang described the vbus-supply property in
spacemit.k1-dwc3.yaml. So I should enable the regulator in
the dwc3-generic-plat driver. Sorry for the noise.

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
