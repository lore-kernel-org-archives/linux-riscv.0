Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EE7E7545F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Dec 2025 15:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idsoCeb4x2Zg6dx1eciueOFwrtHhlIpWn6u0pClXhr4=; b=WqqPAff9gxRDzA
	u6yGzpA2LaX/JAYf+BRPBxoVNzdy0TKknJ7XO7ih44a7aRcsyQAuS0HahuKgylZB9XLhZjV5nZv4a
	48aPV7Lr/BX6gT4AWYY0AMBUqBcTFu6SdqlIw+KSmNp8TsbMLfcan6DjfQ80qII9g6Z4Jg2nc5E+M
	IOGpeDdJRTWtrdTxit+zkOD/c/k1/4xhXn4BTc06Nf8qah2A8Xz3ULP+Y5rLaz56h49uxog+dokiz
	khdV0aUDDmXIcZGbDn/certyLBHLNrrPq29M28BSO5OOKlWog4k1HpQaTEsbnd+lGw23iFugLcvjA
	uhKZ+bBtbWmtBtOITXhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQLw-0000000H36M-3NdW;
	Wed, 24 Dec 2025 15:00:46 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQLk-0000000H33q-1rZT
	for linux-riscv@lists.infradead.org;
	Wed, 24 Dec 2025 15:00:39 +0000
Received: from localhost.localdomain (unknown [116.25.94.210])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2e70ee70f;
	Wed, 24 Dec 2025 23:00:14 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: michael.opdenacker@rootcommit.com
Cc: dan.carpenter@linaro.org,
	dlan@gentoo.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add MMC support on BPI-F3 and OrangePi RV2
Date: Wed, 24 Dec 2025 23:00:03 +0800
Message-Id: <20251224150003.1232791-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251215-k1-boards-add-mmc-v1-2-d68dc87d4aab@rootcommit.com>
References: <20251215-k1-boards-add-mmc-v1-2-d68dc87d4aab@rootcommit.com>
MIME-Version: 1.0
X-HM-Tid: 0a9b50dff8cc03a2kunme7f3b4a155e5
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCH04eVkweT0geQkpIGh9MHVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSUpLWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_070037_485241_3A877731 
X-CRM114-Status: UNSURE (   4.09  )
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

> +&sdhci0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc1_cfg>;

It would be better to arrange them in alphabetical order.
(Place pinctrl below no-sdio)

> +	bus-width = <4>;
> +	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;

It seems that "cap-sd-highspeed" is missing?

> +	cd-inverted;
> +	no-sdio;
> +	status = "okay";
> +};

> +			sdhci0: mmc@d4280000 {

An immature idea. Would naming nodes this way be better?

sdmmc: mmc@d4280000
 sdio: mmc@d4280800
 emmc: mmc@d4281000

This seems to fit the description here better:
https://bianbu-linux.spacemit.com/en/device/peripheral_driver/SDHC/#dts-configuration

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
