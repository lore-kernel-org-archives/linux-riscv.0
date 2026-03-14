Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73532105F7B0
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 08:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=esRvyiHcBLOL9DCPDV5CQ+pYxnrPHZNXhvUTQfsA5p4=; b=KTuBsZajlK3gbu
	ISdxlo5PhEesBoI19hBY2ecOzpcT/FgfrcRI+LFPf2J6t5K7IWBSclLdtaiUDjrl0MsCHd2HoLJ6V
	y7/Foys2s44XkG8ZCfbTPwVtWtBCgSZaeBKukzuEjJF87oMYmOVQPjDjAE3zvSXbfd5AUdP4rHwKz
	I1++GGSGl2HAec4qeny5nHBbuRSfT1oKPnAFjp6oowKY6RWimls1o7C1R0p52gXuw7q1AWfKur34O
	57VJP1SWwXZqU/LU0NVQgci32wRUsTuJ2EI8LINIvBOsVmfMg3/GNiP8kRlIksjSb2N29FBmeX3ib
	moNXcwQW0CITOMl3/oEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Jv0-00000001bff-2uxh;
	Sat, 14 Mar 2026 08:00:18 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Juw-00000001bfL-3DE3
	for linux-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 08:00:16 +0000
Received: from Vostro-3710.lan (unknown [116.25.94.199])
	by smtp.qiye.163.com (Hmail) with ESMTP id 36eefd5cf;
	Sat, 14 Mar 2026 16:00:12 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: gaohan@iscas.ac.cn
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rabenda.cn@gmail.com,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v2 4/4] riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2
Date: Sat, 14 Mar 2026 16:00:03 +0800
Message-Id: <20260314080003.2573296-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310161853.3900605-5-gaohan@iscas.ac.cn>
References: <20260310161853.3900605-5-gaohan@iscas.ac.cn>
MIME-Version: 1.0
X-HM-Tid: 0a9ceb5c2ad603a2kunmb13d530a73040
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTh5MVk8aGhgaQk8fHRlPGlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkJCWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_010014_983823_A14895DC 
X-CRM114-Status: UNSURE (   5.02  )
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

> +	regulator-usb3-vbus-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB30_VBUS";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;

Is this true?

> +		enable-active-high;
> +	};
> +
> +	usb3_hub_5v: regulator-usb3-hub-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB30_HUB";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;

Although GPIO123 is labeled as USB_HUB_EN, it actually
supplies for USB3 vbus.

> +		enable-active-high;
> +	};

> ...
> +		peer-hub = <&hub_3_0>;
> +		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;

Really? GPIO124 is floating.

> +	};

I still insist that the regulator name of DT should be the same
as on the schematic. This will force us to review the schematic.

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
