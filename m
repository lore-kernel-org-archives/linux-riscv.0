Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB48C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 08:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJ1G/yGs5bSv1biHo/l3GlyS7cNIdip9hVC7nZmoIvE=; b=JRRgMDy8H39jSD
	M3oJ+H9mwMisQ3gEPJK9i4MRPanAew6SX71vJDXDJZGvV9PekZsNa9bXLRHRwubvxWj1P1mobGP/r
	3IzppOr/1VLeSCMtUXhREJtVmNdPDNPSSKAPoWO6MUACSc88dmi65YIzsZS5pbECSHjqYfNdLlQre
	SrhAX8174YKMQnBuF/226KujlNbdgdWatLOUbwY+2r+BBNB+VaJN5cHQS1Fi+Q6ijs+G2d/Ral8tJ
	BkSAEkf4dLwtWuFwMaGzKRdU+R3e5yuliEooDkTALZbkXkNN14EfrHtkXinKUJZF0zN5zXkDTkNLe
	Q1JH2stWgkDb4TaP25eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Csc-00FPcj-FN; Tue, 11 Jan 2022 08:51:46 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7CsY-00FPb8-BO
 for linux-riscv@lists.infradead.org; Tue, 11 Jan 2022 08:51:45 +0000
Received: by mail-pj1-x102a.google.com with SMTP id pj2so16014503pjb.2
 for <linux-riscv@lists.infradead.org>; Tue, 11 Jan 2022 00:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K49u+vw8xuJoyxVWZcA3NU+d4XvPmTqJkyhbFma1tEc=;
 b=dhVYdWw7PREA2x6EIZ4xujgcUvHYDPBvCt58d97/WsIX21uIzkZiCc2rXn6tw/8ef+
 N59TsHOZYauZ8NIBcMJjjYvDiYsFlqTLhkJtJaxu8O4qr38BnNaXg9WbqDAR6OEQ3MWX
 thmy55rc30zJKjDoRD0OdJKhs1Or9+tNIVskVu+8IDN0hFpKlzwprBCUI789q1AmzO6H
 SXEj/uSp87gr+stzL4xBYBR7Iqolh7Gt8E6pK1vnVj8htrZ9pgAmCRnu5fJpXGRyerNt
 K2S4VjfTTzAOuEkbIz0uCUPEKWg/iHzHXdvOqZVaMz/ysUKrbS2rDn/K7qfFN1DXQ5oR
 3wMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K49u+vw8xuJoyxVWZcA3NU+d4XvPmTqJkyhbFma1tEc=;
 b=MvqoKzrVKJ45Ht+hoGjctSDePB+W9A2BdZn7uFIfUBBEGn81kcN/GcJLbzS+MUA2Ek
 H9lzDHKeEES6Hu2PXjDxo7hM9VPv+Faetovf2x6ueq8XYcfZlvzisq2EiPDDtD+rPZIw
 Hm6mRZxbL2ayzE9LxN6090oqbCf7ydGt0kaEWV1fZeg+JvL3cWsCFCav6SqEzDDLymh7
 Fv/JRJd2dJpF9T3kuAJFf1iaSz/CjjNDAwthS5SHXBiVbn//9SgYdbqomTPbGn5HPaBw
 bxFi+CGL6CsD6CzBghhlqHoJQbeCMUgpcbMPYhlRe0fntPq7QQQDu4pJ7DUC7kI05dxo
 K7rg==
X-Gm-Message-State: AOAM533hnqdfrrYovMjRAn56fXDXpfQ6JWnT8ffve3cR+YcSoilI4mE9
 azMZmKn4125L1s3Hb5m3VqsbKcVg+dAexgNX
X-Google-Smtp-Source: ABdhPJyyRNf9d57sKUsXdmiRpvG67UAK/JRDnkTqjiyNt2dbhjIL4gIaHj1J+p3aF75oTpbWw45k8g==
X-Received: by 2002:a17:902:7c84:b0:149:9481:bbb9 with SMTP id
 y4-20020a1709027c8400b001499481bbb9mr3638418pll.148.1641891101607; 
 Tue, 11 Jan 2022 00:51:41 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id j4sm9447598pfa.149.2022.01.11.00.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 00:51:41 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2 1/3] riscv: dts: Add dma-channels property in dma node
Date: Tue, 11 Jan 2022 16:51:25 +0800
Message-Id: <163a2cf11b2aceee2a1b8dc83251576d2371d4a6.1641890718.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1641890718.git.zong.li@sifive.com>
References: <cover.1641890718.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_005142_738803_F8C74B4B 
X-CRM114-Status: UNSURE (   8.50  )
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
