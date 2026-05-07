Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E76CD343B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 06:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rCPEDQ0Tk+FyWIg1egUJi/VGpE1/1M1+biHGPAFW9k=; b=jVGFcJPha0W0r0
	y3pgk2HyQDEsKz68GMhAeCepYBiiZRsVqiMJuAP8b/WGW1iFy5tnSosv/qZH8OLNuPd+kJaXnaUvD
	zWViGp0bFtwCs2eHDoYC0apufomDbFkxHSwFIme8p+hIlnC46xu80luyp2wlZ3QJoBoeu43VrB4dg
	kdBNvKtPjA1vbrk0gPkvmOsPDjdzfq1WbFpfwokIqYGA4PawNGaHgN9miuLNGas9TrhqM9OY62Hz7
	NWGPfBYOzjAFtxbmuEme6vZD3H2SseKbHbgzmhiGAJQ+oMDdZ7jUTiLy5nw5xVRPCg/MCPQcIKGJm
	SnHcArZEvTuut1M9KHag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsQ2-00000002vjD-2v4h;
	Thu, 07 May 2026 06:41:10 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKsQ1-00000002viR-2jJe
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 06:41:09 +0000
Received: from Vostro-3710.. (unknown [119.122.215.211])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3d7029094;
	Thu, 7 May 2026 14:40:55 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: linux.amoon@gmail.com
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	gaohan@iscas.ac.cn,
	huang.ze@linux.dev,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 2/4] riscv: dts: spacemit: k1-bananapi-f3: Update USB regulator on onboard usb and label
Date: Thu,  7 May 2026 14:40:50 +0800
Message-Id: <20260507064050.1881348-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260502051906.8160-3-linux.amoon@gmail.com>
References: <20260502051906.8160-3-linux.amoon@gmail.com>
MIME-Version: 1.0
X-HM-Tid: 0a9e012afe1e03a2kunm6dfa036b197e03
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCH0tDVkxJThodSk1OQkpITFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJSkpZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pOTE5VSktLVUpCS0tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_234109_908529_8DF07E94 
X-CRM114-Status: UNSURE (   4.12  )
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

> @@ -366,7 +366,7 @@ &usb_dwc3 {
>  	hub_2_0: hub@1 {
>  		compatible = "usb2109,2817";
>  		reg = <0x1>;
> -		vdd-supply = <&usb3_hub_5v>;
> +		vdd-supply = <&reg_5v_vbus>;
>  		peer-hub = <&hub_3_0>;
>  		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
>  	};
> @@ -374,7 +374,7 @@ hub_2_0: hub@1 {
>  	hub_3_0: hub@2 {
>  		compatible = "usb2109,817";
>  		reg = <0x2>;
> -		vdd-supply = <&usb3_hub_5v>;
> +		vdd-supply = <&reg_5v_vbus>;
>  		peer-hub = <&hub_2_0>;
>  		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
>  	};

This is incorrect. The hub is powered by vcc5v0_hub. According
to the schematic, 5v_vbus provides the VBUS for the USB3 ports.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
