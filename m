Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B05C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Mar 2022 09:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kRBOVkkmdlpPXnGSYfhpdxDIQEpZGvKlbDCpfpIh90Y=; b=RqGV3eLldy9ueA
	MhG3m4/S/7LDTT9SobN4aJ4ujrOJv2y5RpFiLLlrKYe04kJ7LCJiUl4ddog5EDV5741WQQuMeH2d+
	9TWmAzFOyc1bpS3izWgXg6D3VLlyV4GBPyxaFHLbh8YZvPsmqDWd1rf5qfVC9Uq/a1HrVSQQ0qaxc
	wZ1OOQ+6jAhmKNLvxxXrpi5BPnqkRBByepuaaNwxOasnlsAe6uUbjMQcNeWUuaJBZMsTZhVgJpcKx
	wIoAjzqtPJs1xYZpOmIeJb+QSsP3hsubTtNxF3ZJY5kykFZBPqeggb8D6nGS8rwlj+w1fSnk5nPKo
	ZnKjt5JsNKPrQWHkauPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYm3H-0085fu-9W; Mon, 28 Mar 2022 09:52:43 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYm3E-0085f7-SR
 for linux-riscv@lists.infradead.org; Mon, 28 Mar 2022 09:52:42 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 c15-20020a17090a8d0f00b001c9c81d9648so224420pjo.2
 for <linux-riscv@lists.infradead.org>; Mon, 28 Mar 2022 02:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bwZ4ntGN7f8A8nsIcId+rUmkc/uVaZ9W2h2a+0CTy+I=;
 b=IO1wRJ5JootJiOYi8EyMw7W414vNT7NAHx9rKQTYR0fx2t1ukxQU6t8S0ZcMXI+Qq+
 /q3SDCiAwcSY0QOAO+YRlqTqqWbMrXikfSBCt/qUcdY0KrKYixn0g46dYlA9pBnldg79
 zustXyExPGLSga3BfHWFywEdwpPF+quB+lj0f0xNKDvm9Dq9eiT2F9oX4F2t1ry1jcAc
 RQkJjH6g/2VoKdJ5bC9jmZ2mwUf5bQdok9n/dgc5ZGezYVWQ7fnzc36XoNXlM1eTwqWT
 RXPyJ15qRLLoCqmksuBVSr5yOV/nwOiRjvNQMl6YN4w2FP+FfZRXTDhETJTseOaVIzSW
 oBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bwZ4ntGN7f8A8nsIcId+rUmkc/uVaZ9W2h2a+0CTy+I=;
 b=yWwTfTB2g5tfZe698XpilD7R607dwfTeqHbfrB35X5oPripgp4STvC0v7yYUwM3lHz
 CKM/mJ332mCfxa5gNED8BI00LtusU4xbhbKMOS0gw/TDjiSoUiL1cEPJCUA/ucCRBtO/
 mHCqgd1IZVqA0DiYu226t9EPayQVSrwyQPAyL0vEIf2zXHQDhyuAeakOI05LKONdQ9uM
 RVeOb/jpykuclOb/+/YY2yDVFnqzYE9LB3g2z3Ru4YH1HKVgdraKsEcG92ImsfK9iZRe
 98XhDUAcWUmetDPYLA6WkDV92Jz2+NPDv2OguzFZEqsnQ4XTz2NPU6bB7KdMJnvoDc8i
 cJjg==
X-Gm-Message-State: AOAM531wnbgy8lCwjfRZpiL0ZWGRJ/CpCHni7xwMfPR06aaDa/+pX4io
 1oVbTRScvN0uHbDLnQslYlRrFA==
X-Google-Smtp-Source: ABdhPJyPFyUzbmqGInFSDy/EYxHjhBm+UfFDGTJClCd8Ky24rcAtEAcDFYKO1z1/CDOTCnKHWHtL+Q==
X-Received: by 2002:a17:902:6bc3:b0:156:e4f:b014 with SMTP id
 m3-20020a1709026bc300b001560e4fb014mr4737654plt.17.1648461160156; 
 Mon, 28 Mar 2022 02:52:40 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a633744000000b00381efba48b0sm12255117pgn.44.2022.03.28.02.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 02:52:39 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v8 2/4] riscv: dts: Add dma-channels property and modify
 compatible
Date: Mon, 28 Mar 2022 17:52:23 +0800
Message-Id: <d19daa503fb242eef00d79082931199cb3e48021.1648461096.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648461096.git.zong.li@sifive.com>
References: <cover.1648461096.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_025240_938339_0244D863 
X-CRM114-Status: UNSURE (   9.00  )
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
by device tree, in addition, we add the pdma versioning scheme for
compatible.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 3eef52b1a59b..6a3011180846 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -168,11 +168,12 @@ uart0: serial@10010000 {
 			status = "disabled";
 		};
 		dma: dma@3000000 {
-			compatible = "sifive,fu540-c000-pdma";
+			compatible = "sifive,fu540-c000-pdma", "sifive,pdma0";
 			reg = <0x0 0x3000000 0x0 0x8000>;
 			interrupt-parent = <&plic0>;
 			interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
 				     <30>;
+			dma-channels = <4>;
 			#dma-cells = <1>;
 		};
 		uart1: serial@10011000 {
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
