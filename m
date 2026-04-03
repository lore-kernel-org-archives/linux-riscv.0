Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84C9E7E360
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 09:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fS1k6WJgNvJoccJso/O5rYD+b9WmED2V1Nirw5hI0JU=; b=ibiiCrl34B78Xq
	QuIpt1I42Sp2CtbSiHe0kh0mowmEEUD9tl6Y0s4ItjUJM7fUR1Dn23xyVbMt+NHDhDNbnenyuy76g
	8Jhj33p1QuBvnWEkzGZGWOMd0+f998noeSPmf4ug8lpv+KIqiahAd9vZ5NMBSeJgCAu3pOZ1aMFcT
	zNwDC8k2SP7He5VACJQHkjhD8AtvTE/tIayktm4HyIcNncCZf3lkJ06974MJx86fR4lmcnL6ukWTv
	YfeI0QFmn8Tic6f2bIPb6b26XspzvueCbiaC0gVFeSXlbWiQ1Ej79Kmr2Nfw2D2P+z3C+QUHI3pJB
	euQi3fDWtp7rIVDkL90g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bAv-00000001qYH-0R8O;
	Fri, 03 Apr 2026 09:50:49 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bAs-00000001qXm-0hvA
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 09:50:47 +0000
Received: from localhost.localdomain (unknown [116.25.95.185])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3973ed8f2;
	Fri, 3 Apr 2026 17:50:42 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: gaohan@iscas.ac.cn
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
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
	spacemit@lists.linux.dev
Subject: Re: [PATCH v5 3/3] riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2
Date: Fri,  3 Apr 2026 17:50:36 +0800
Message-Id: <20260403095036.231761-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cfe646a5549a2b3fc8a4335c3ab4918599615369.1775148159.git.gaohan@iscas.ac.cn>
References: <cfe646a5549a2b3fc8a4335c3ab4918599615369.1775148159.git.gaohan@iscas.ac.cn>
MIME-Version: 1.0
X-HM-Tid: 0a9d52c0860803a2kunmb70347af59b92c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSk5CVksfSEpJGkkeTEhLSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNOWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_025046_400891_9BF9AFEA 
X-CRM114-Status: UNSURE (   4.28  )
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

> +	pcie_vcc_3v3: regulator-pcie-vcc3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "pcie_vcc3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio K1_GPIO(116) GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};

I would like to maintain the same property order as the
regulator below, and add vin-supply:

```
	pcie_vcc3v3: pcie-vcc3v3 {
		compatible = "regulator-fixed";
		enable-active-high;
		gpios = <&gpio K1_GPIO(116) GPIO_ACTIVE_HIGH>;
		regulator-name = "pcie_vcc3v3";
		regulator-min-microvolt = <3300000>;
		regulator-max-microvolt = <3300000>;
		vin-supply = <&vcc_5v0>;
	};
```

> +&pcie1 {
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;

> +&pcie2 {
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;

I think vpcie3v3-supply is not needed here. [1]

> +	hub_2_0: hub@1 {
> +		compatible = "usb5e3,610";
> +		reg = <0x1>;
> +		peer-hub = <&hub_3_0>;
> +		vdd-supply = <&vcc5v0_usb30>;

vdd-supply = <&vcc_5v0>;

Please refer to the schematic. [2]

[1] https://lore.kernel.org/linux-pci/u53qfrubgrcamiz35ox6lcdpp5bbzfwcsic466z5r6yyx6xz3n@c64nw2pegtfe/
[2] https://drive.google.com/drive/folders/1pcI_U0C3VJKTCg8A1zj08CwNbohnONSR

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
