Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379D4C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 01:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJ1G/yGs5bSv1biHo/l3GlyS7cNIdip9hVC7nZmoIvE=; b=Hwqz8pr/NuSoML
	p5fmUsN82+jM8P/2Mhx918B4DlE/oRWO/a6bb7Bkdm5DAqPPkyPiwPYKitFRGy1lkbUHHCkLveLpw
	ZozfoH/WTClis5yBg8b1/tQCVc1H21qx6rOQinfgkaulnZbZsZZWmNSku8t6G8AM4Fq5VB4YFMri/
	HuOztsPVqf82nqI2LjJDoFEZJiLSewQy7Cog5NO6OIlZRqFBnESiCISracIUDED33I25Nj3Spzdvg
	7qsdwEhGmCnNkym/dHdaVxR7YO0HD+b1OIQQmeAqsUKZ5ucgTPRVn62tfVA65rNdpfupt5OCn/tDs
	3xzzqDlwcX7bdruKLgHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Gvt-00DCMG-Ll; Mon, 17 Jan 2022 01:35:41 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Gvq-00DCKc-2F
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 01:35:39 +0000
Received: by mail-pf1-x432.google.com with SMTP id w204so8799554pfc.7
 for <linux-riscv@lists.infradead.org>; Sun, 16 Jan 2022 17:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K49u+vw8xuJoyxVWZcA3NU+d4XvPmTqJkyhbFma1tEc=;
 b=fx5o8gOeg/Q4/nXN2S9EzfZaKH4Lq4w65YWm1MW939pyqPAJnVhF5MI32yLl+mMVxN
 xKQ7igoeXYDbaz1SoigpFPhD5N/f+iMD7inhwZsZNmOFYwjjReuHVKcXhsY45lqsdY4E
 kz1H/srdzXbpAR5oubHNCHf0Tpb5MqzWq+mzblEWnvoCf34LDYUqVJ9VtG3FzfDOi9/X
 RoSzDuzy+cciW0PSMaLlMA20kkL/Unv1fDDGbaEvJF3vCopP+dOQmXLN+rE6ZDUgH2Ha
 QIDZDJfD63Z2jxFwY/0RnfgMCantTV07P/6WECYOQlwH/e8NsNJIiH91WKb2Avw8Omdv
 A/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K49u+vw8xuJoyxVWZcA3NU+d4XvPmTqJkyhbFma1tEc=;
 b=mUCLDi6dcABmucYRCBuTRDhPHX3MYOw+Ce5XgfDbqGvBO5F/F1hwPGdLrVJm00fsqa
 NJfrhHVhn6SIMDjR9TyEl125APG6zF1K+WpLm+jh2JNkr1NV+5igq4ShTj6nUftX/LDH
 BCgz3tTxAC98J3+hP/0lCbe8bzWzl1Dg8rhkXXsQBzrR37BBuJ75Zfto5/M25i3tENAR
 LYIfc+W+vP7bOGjBu2d7TTDFrQKndgYV44KI7VWooy/AgKrI8Sz/x3GLUN2CSQKlG4xN
 93CmVg8uGp0JYHZkaafaUb6IM+BNHfST2vYDK327ru3AST6U9iP4K/LRlqRAYE0yuK6W
 S9CQ==
X-Gm-Message-State: AOAM530PUJ9EfLUJbhGdZyrv8nlSoESGhwkIOovGU0FM6TCM3FAjfDYA
 ysYhh1xL75hxLWjwf8dD1w2WfQ==
X-Google-Smtp-Source: ABdhPJy3cCK6M6/ymBigZBfwJeQAU3nzgG2r0QdbcItZb2aPSm1DwimovkWfD1QGC4ROmx67vrk6Vw==
X-Received: by 2002:a63:5d0e:: with SMTP id r14mr930560pgb.110.1642383337389; 
 Sun, 16 Jan 2022 17:35:37 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id l1sm10008335pgn.35.2022.01.16.17.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 17:35:36 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v4 1/3] riscv: dts: Add dma-channels property in dma node
Date: Mon, 17 Jan 2022 09:35:26 +0800
Message-Id: <163a2cf11b2aceee2a1b8dc83251576d2371d4a6.1642383007.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1642383007.git.zong.li@sifive.com>
References: <cover.1642383007.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_173538_168455_8E6F2CD5 
X-CRM114-Status: UNSURE (   8.04  )
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

Add dma-channels property, then we can determine how many channels there
by device tree.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 1 +
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index c9f6d205d2ba..3c48f2d7a4a4 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -188,6 +188,7 @@ dma@3000000 {
 			reg = <0x0 0x3000000 0x0 0x8000>;
 			interrupt-parent = <&plic>;
 			interrupts = <23 24 25 26 27 28 29 30>;
+			dma-channels = <4>;
 			#dma-cells = <1>;
 		};
 
diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 0655b5c4201d..2bdfe7f06e4b 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -171,6 +171,7 @@ dma: dma@3000000 {
 			reg = <0x0 0x3000000 0x0 0x8000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <23 24 25 26 27 28 29 30>;
+			dma-channels = <4>;
 			#dma-cells = <1>;
 		};
 		uart1: serial@10011000 {
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
