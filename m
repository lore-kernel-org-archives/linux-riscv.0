Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C72EFF4953
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 07:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ShsSgli8YJ+hz6eqka1/5EC6tDfbOwjoRMN/XueKU2Q=; b=dpVoNSEj2Te9Tb
	HdThJmLqiCCV5bqIUfjuSDWWzUi/s5pZjkFKCYIOosR9hTyZWFZgKO5c0fKMxX+Uv0s8ae6LHWVnQ
	iMv83bc2F5QoLysWqZJMP1zNjIEYNuPltTogkfS+tWePTckcV6LOflmCEn66xSwDsmJnA/lqHp0lz
	eMbplRG/ejRajwPqWm5Av5p2GKsgszex/iWDQTrDf4c1p/4KmTBYpdZDuMO9yWDCy0pcMjZzs/3sQ
	JU2nBQ8HzEs3nbnmUSVGG019qAD2UaIL4d3Mm363Neslcr2FAA8OOMtVs6i5kwPY4MAQmQnr/w+Yh
	kXp1/elDX2upgDRAkg1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76bd-0000000Aj5R-41GX;
	Mon, 30 Mar 2026 07:00:13 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76bc-0000000Aj53-0Me9
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 07:00:13 +0000
Received: from localhost.localdomain (unknown [116.25.94.183])
	by smtp.qiye.163.com (Hmail) with ESMTP id 38c97798f;
	Mon, 30 Mar 2026 15:00:08 +0800 (GMT+08:00)
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
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2
Date: Mon, 30 Mar 2026 15:00:01 +0800
Message-Id: <20260330070001.1920705-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <84f8e713ef1ee46f9be852f400f52d6c055725f8.1774803532.git.gaohan@iscas.ac.cn>
References: <84f8e713ef1ee46f9be852f400f52d6c055725f8.1774803532.git.gaohan@iscas.ac.cn>
MIME-Version: 1.0
X-HM-Tid: 0a9d3d8aed1503a2kunm3ced154046e202
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSkJNVksZGkkZTR1OT0hDTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkNIWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_000012_315159_17D7B674 
X-CRM114-Status: UNSURE (   3.98  )
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

> +	usb3_hub_5v: regulator-usb3-hub-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB_HUB_EN";

regulator-name = "vcc5v0_usb30";
"USB_HUB_EN" is the pin name.

> +&usb_dwc3 {
> +	dr_mode = "host";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	hub_2_0: hub@1 {
> +		compatible = "usb5e3,610";
> +		reg = <0x1>;
> +		vdd-supply = <&usb3_hub_5v>;

This is incorrect...
The hub is powered by VCC_5V0.
VCC5V0_USB30 provides USB VBUS.

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
