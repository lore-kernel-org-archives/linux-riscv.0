Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6272FC48BE6
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 07:46:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3310560FE9
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 07:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3310560FE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/EcdsjJKR3bmgIm2cXemlKuBEnV27Ka/8oG5JUeqnQ=; b=tCmCuHTAI48sYE
	zXqltN1b4er8MT+h6xQEjg9xQ0miuxrGH34pogxGsIJltnp5q09jBFhPnxgfe77r/mHz+a45ghE/h
	KKP+VV08XkHp0Kq5ndRxS1NJp0Jv3ebfV6e4A+S7nwok51DB2weSjES3/hfqYP5b3gV58eA/vrBI1
	zSAN4zA6gT+SiNrnUQbEZyrHuH5uxmjj7ndmhwVd4qV9Oq7rgfNDsvGR9vM9nb190Y+B5LxhEezb6
	XYXzkd+R/RalILjKOVMzhS3q2MNodJ2mEu1lSMFIz78fiGAvOZnzvvLsYk6kpjT96EJtkKib82+qm
	zzSMv/aWqrcC9ZgxfOeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltQFw-005Fsc-HK; Wed, 16 Jun 2021 07:46:36 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltQFt-005FrD-Cb
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 07:46:34 +0000
Received: by mail-ed1-x530.google.com with SMTP id z12so1429043edc.1
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 00:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5L4gySf/L9PwI1gVXMV7HFUJk3EHJfZ+w+oYJkyg4OM=;
 b=gqhbflAdQcmJa6ZSrCDkBSTYltcrYeQpeWLspvfsmrGET+sob/HU5gZanF0PpRiiVp
 MrBEAocHAtTVAbBWcVVrBiw/fvBkjye7MEul/hQzQcVfNhOjC+TpsS3FMwClOzLUiyhG
 3zKmqIavgKtaDVHfVBBXt0zv5YGx7lDXv7dAnWfQpOCse6wNQBdv0rPei8aYbOMXUXnV
 vwGDJzD0FAn+P7/Ba+JILb2fgX2GfSxQaTcMwNLXJB3nLEqs6kiiuhfR2WHQVrBmkYTi
 H8rnl7EdjwC2lIPuoN89BVCC+TfgKCkFKUcUvG0G/KWlWAJ2+y6VmnbiY46pSsup4h4L
 fkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5L4gySf/L9PwI1gVXMV7HFUJk3EHJfZ+w+oYJkyg4OM=;
 b=gtyKeMTKPdmAqn/nMM2eH7L3uJCLuTYviLWAWEbhEkb6f2/uNxCHvez09ZvGY5p8R5
 eaeo8bfhwI7EO1LYgEkv2CdxEHlrT1BxtS2CtjDGu9WZkPLNcYQyV9stKgNBytnW6oAI
 O5LsA7oAoAo5hCXI5x4Ejrf9T9++HlR7igi9FHyDITrWle1vLYDYGLHeAL0vuOn+6R49
 b93QHultOTlHUTCxkXWio6W3RIygq8m/N+p1DbO/PcGH5bAo6uyXbLYofjyglDIDIOgO
 wqD/3+2dn/Qxuj8ieVZKEzZoHJzLqao+fqMJutSwVlf1Cds2xNv6Ffy9ZvuLOgGUXzNB
 xnOQ==
X-Gm-Message-State: AOAM532HmQZucAHjfw1THqkF33wUwo7hM0Pm8wiHS6YLwelF46NrlYVd
 ONEnANfPKzI97Yy5vOlsugw=
X-Google-Smtp-Source: ABdhPJx2UjJgJCh2cipWEpjVeW69fhMWkGCwPu0xWgFNLOfBvumZPGV5OCZlQZXI6WD6/pyaAuo/Bg==
X-Received: by 2002:a05:6402:368:: with SMTP id
 s8mr2600499edw.129.1623829591669; 
 Wed, 16 Jun 2021 00:46:31 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id yd25sm657840ejb.114.2021.06.16.00.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 00:46:31 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 2/2] riscv: dts: unmatched: Add gpio card detect to
 mmc-spi-slot
Date: Wed, 16 Jun 2021 15:46:45 +0800
Message-Id: <20210616074645.429578-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616074645.429578-1-bmeng.cn@gmail.com>
References: <20210616074645.429578-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_004633_476809_F5723F4F 
X-CRM114-Status: GOOD (  10.05  )
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

From: Bin Meng <bin.meng@windriver.com>

Per HiFive Unmatched schematics, the card detect signal of the
micro SD card is connected to gpio pin #15, which should be
reflected in the DT via the <gpios> property, as described in
Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt.

[1] https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce76f4192_hifive-unmatched-schematics-v3.pdf

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index b1c3c596578f..214794363c6a 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -2,6 +2,7 @@
 /* Copyright (c) 2020 SiFive, Inc */
 
 #include "fu740-c000.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 /* Clock frequency (in Hz) of the PCB crystal for rtcclk */
@@ -228,6 +229,7 @@ mmc@0 {
 		spi-max-frequency = <20000000>;
 		voltage-ranges = <3300 3300>;
 		disable-wp;
+		gpios = <&gpio 15 GPIO_ACTIVE_LOW>;
 	};
 };
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
