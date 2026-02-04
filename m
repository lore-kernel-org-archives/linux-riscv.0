Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2FDE9D3E1
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 14:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gowSFxcJddrIa89J7AqT0JsdSA2JQUPd3Ni1wamO3xY=; b=Te0IAgsZjwFbFT
	7jTxGunzvNtjxz181h68qCTLH5BiwkvLnQwOcKbkaOaU7/KeQxNajLebSledDSdlH2tbW9mkOS1Wi
	L2AK72Azt/YahZAeHvtkbEtNqi6fntNAAAcpouupM1z76MjIMQUy6EyPxjeU54VGIO2rB7TC5G6g2
	VFk5YIrcgHUsEpJURYSGOtS9EESIpXcorgBD2cowjbIyLo4oRRNz5OtAZ9ZO/Qd4H40/t7JXSs3et
	TTd2PPrGEq+EmlbYYhKrqbFlifkw/ubkW/NAc6pcJxT/4B7T5J7B4u9jKR1/MEmhMw0ts9z9jvlWa
	o9VBCtp/ogAdsgMk6cOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndWl-00000008ZNc-0yYQ;
	Wed, 04 Feb 2026 14:06:43 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndWi-00000008ZNC-2t7l
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 14:06:42 +0000
Received: from localhost.localdomain (unknown [58.61.141.99])
	by smtp.qiye.163.com (Hmail) with ESMTP id 331d6ec47;
	Wed, 4 Feb 2026 22:06:34 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: gaohan@iscas.ac.cn
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rabenda.cn@gmail.com,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 7/7] riscv: dts: spacemit: PCIe and PHY-related updates for OrangePi RV2
Date: Wed,  4 Feb 2026 22:06:19 +0800
Message-Id: <20260204140619.47536-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <677085181a4215c517907f44b363ef7777fd407b.1769895215.git.gaohan@iscas.ac.cn>
References: <677085181a4215c517907f44b363ef7777fd407b.1769895215.git.gaohan@iscas.ac.cn>
MIME-Version: 1.0
X-HM-Tid: 0a9c28f9f01d03a2kunmc61284e02ceb56
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGEIdVk9KGUpKSh5MTUhDGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVQkJZV1kWGg8SFR0UWUFZT0tIVUpLSElNT0JVSktLVUpCS0
	tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_060640_946919_A9157731 
X-CRM114-Status: UNSURE (   4.33  )
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

> +&combo_phy {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie0_3_cfg>;
> +};

This pinctrl is clearly incorrect (including BPI-F3).
Checking the schematic reveals that these pins are for CAM_I2C.
By the way, combo_phy connects to USB3, so it should be enabled
in the USB3 patch.

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
