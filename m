Return-Path: <SRS0=npS7=OR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE89C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 12:51:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A04C60FF2
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 12:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A04C60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/Otz6IKwN6saZFOi/MOWHsNXsiqImrHIXpuQOND+Xw=; b=P4tgmVQVyWjjQW
	AXNCMWBjl6ct1RbsP7MxJdgCWBTY9cLYpq8RUXqjk9N5mqvtck7cc7/VHiMGRGdMGelTxYoza/wcF
	xSPVDMC6nfsSHu/CLh4qB2B4hs18M7M+RKOXyWuy5rajXwHjbPISKU4T1+pH7PZZG4LUiR77fUGIU
	pVcKfpQGVnCSgVU9vAK3swYEF4z1WuvPXbXDykNi1b1OhMUOsgLHPEjXc1P1j0ia2CGEv7J4VIeFP
	KGpOFk/Q9+IVIhXKXOqb7bRrqfULVCXpip/gt+X1h5osZk/Nh3OBAo7QnWo87oS8Mq92C3a3drE+I
	rcPoYKgY6Irf9Tkq2l/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUq61-002gXw-V1; Mon, 27 Sep 2021 12:51:02 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUq5y-002gUm-Ge
 for linux-riscv@lists.infradead.org; Mon, 27 Sep 2021 12:51:00 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3971840828
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 12:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632747056;
 bh=gL2n73HFUZMgICxi9XxH4YAlloJV26Mt1lAxrRgunho=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=lNx+trnLPezcfVob9zFV9tc2LMYLcLEhotK8CYHYYBenPKGfwZNiDD3dsh9VLU6Un
 6RDZo9JrnfuuQ6ARvY7Rfkw3nQ1HfZGYoCHeJDCJbZA59WCit3Om4hrQzdpjkytb1Z
 8i7j7EhMv144Cez575suNq6qQFFKBa0lebnmpBWCB/848ELlhTzv6bGo8FzUrvG0kY
 Nn9M4gLR1JC7Pn0sWYynahOBs98nWTif7dErssYCpwIo5hRhiKeWUUC2QHw8epvKTN
 O55Hz527rOlSz3t/+MNEzZeNXHUAABjlKGKTAGM1hdF5oKwyJvNBlJTQ8fmKVleXXW
 jmdSf+4+RIyag==
Received: by mail-lf1-f69.google.com with SMTP id
 z9-20020a0565120c0900b003fce36c1f74so3732971lfu.9
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 05:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gL2n73HFUZMgICxi9XxH4YAlloJV26Mt1lAxrRgunho=;
 b=4uSDEq4eUAVUHHiD/8Sqdd1Ik6I+pE5VJ6IUXI+WMVg9YH8NYH9JsXYspGjsc+euRY
 vn0dqEW8ac4f7F04kBhBRNO5IK/TPQzBkopvN32QPYyiSCwTQz5DM3Swzrq/tPeYBHJ5
 5XlauMaVhmM5O4OCDolMKK9rebZtaA4FZZhHM32hSKEDW9itEoJnb9m5FOf+wPIBkxVV
 mnLm+NwRBHyfrQcUky7GIxqrFaKy2rI49cPoQSh18NwN/4b2NrBOkCOGv45jOGM8kJZc
 X6VLQgYyG0ruB+Mb9uqTiUOM9TWxd5gdB/eVDF+uyu6VkrJVfKrAIq0bgJ3Zwf8Yamrz
 lTeQ==
X-Gm-Message-State: AOAM532Ao1TIhp/fLYb9FHBJJso7QK6u7ZkdvDnDgotzMGdN3CGi5ofS
 lczkz7utg/PktuAEqrJS3v9zEsGVAHqGchGDdwpi8sfQNWClW8O+zZISbCJavjGrrB7dk+lSl4T
 fXP8KPgJyXTYgtTJUhhwMh4DU4Am+eTV2Ur/coMtijGPbMw==
X-Received: by 2002:ac2:4d22:: with SMTP id h2mr24000839lfk.429.1632747054379; 
 Mon, 27 Sep 2021 05:50:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyk4pwmdGw/4Ofbnvsd28i4hCYWPZtzP5PsR1gIz62OdaiPMEFoxgoIwLu67WJig5byBmk5g==
X-Received: by 2002:ac2:4d22:: with SMTP id h2mr24000825lfk.429.1632747054225; 
 Mon, 27 Sep 2021 05:50:54 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id v28sm1592102lfi.22.2021.09.27.05.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 05:50:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v4 5/6] riscv: dts: microchip: drop unused pinctrl-names
Date: Mon, 27 Sep 2021 14:50:43 +0200
Message-Id: <20210927125044.20046-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927125044.20046-1-krzysztof.kozlowski@canonical.com>
References: <20210927125044.20046-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_055058_784932_129094BE 
X-CRM114-Status: GOOD (  11.70  )
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

pinctrl-names without pinctrl-0 does not have any sense:

  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: sdhc@20008000: 'pinctrl-0' is a dependency of 'pinctrl-names'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

---

Changes since v2:
1. Drop some patch garbage from rebase, pointed by Geert.

Changes since v1:
1. Add review.
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index b15e93d1702b..63984e53c0b3 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -268,7 +268,6 @@ mmc: mmc@20008000 {
 			reg = <0x0 0x20008000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupts = <88 89>;
-			pinctrl-names = "default";
 			clocks = <&clkcfg 6>;
 			max-frequency = <200000000>;
 			status = "disabled";
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
