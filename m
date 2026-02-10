Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA2EEA3F0F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Feb 2026 07:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JMSsm9MllnvGNJ2slZCR/zxjprRaWCQjtnwgNOOp/wA=; b=jrRpmVlE+2rpks
	u+ueT4x7KtfP7rnsCmWW5mYBzOU4C9bQMLrGSq9zBCJ6ZQTiQvnSMRE1Ib2asG6dplNIR/h4Crvp9
	O/fBhuS/gQ8ehaMKvy2W5WjZW1F8CegUcNlogD2/ENtrwNNbmvZPF036CtxbXolSeDZv77Ixf7+9K
	ckGKqahWt0wUNHFbhN4ARQZqu2obATKIbWu7GBeCjDb0kJNvjY/9EN7/zJ9+MipBKRWiqoFv/K1Kd
	nzysk9ogoQDX+KpNKgDj2DkaVfLEcxybjeNXtT18tXN94PLbLmnE6QQu/PiaZC5ZWFzHL62EYB5mr
	1AfVf6pjpjZS2KT84/qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphje-0000000GZEQ-2aJg;
	Tue, 10 Feb 2026 07:00:34 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphja-0000000GZCI-0bcn;
	Tue, 10 Feb 2026 07:00:33 +0000
Received: from localhost.localdomain (unknown [58.61.141.99])
	by smtp.qiye.163.com (Hmail) with ESMTP id 33b43ff1f;
	Tue, 10 Feb 2026 15:00:16 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: huang.ze@linux.dev
Cc: amadeus@jmu.edu.cn,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	vkoul@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: spacemit: add regulator support to K1 USB2 PHY
Date: Tue, 10 Feb 2026 15:00:09 +0800
Message-Id: <20260210070009.46040-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DGB1P3K6I14J.1QCMDY84ZR7ZH@linux.dev>
References: <DGB1P3K6I14J.1QCMDY84ZR7ZH@linux.dev>
MIME-Version: 1.0
X-HM-Tid: 0a9c4659ce3303a2kunm2c116fa0524a63
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaT0wYVhlLHh9MH0IYHUtLTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVQkJZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0pVSktLVUtZBg
	++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_230030_360410_5AB26121 
X-CRM114-Status: UNSURE (   8.75  )
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

> > It appears Ze Huang described the vbus-supply property in
> > spacemit.k1-dwc3.yaml.
> >
> > So I should enable the regulator in the dwc3-generic-plat driver.
>
> No, we will enable regulator at port level.

Since dt-bindings (spacemit.k1-dwc3.yaml) already describes the
vbus-supply property, why can't it be implemented in the dwc3 driver?

> Previously, the VBUS regulator was defined as regulator-always-on
> in the device tree as a workaround.

I don't like this workaround because we can control the VBUS regulator
through the USB PHY driver or the USB Controller driver. These are widely
implemented in other similar drivers.

Regarding port level, few manufacturers use different VBUS supplies
for the ports coming out of the USB hub, such as the ArmSoM Sige1 board.
Most boards use the same VBUS for a single USB socket, so I don't quite
understand why we need to wait for port level implementation.

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
