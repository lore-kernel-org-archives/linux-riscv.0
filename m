Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B34C25B45
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 21:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHFuI6sIlVeZ3eBH1UjkCAg2X++VmYq5BtJx444juhg=; b=DrCik6EH/5ECKv
	IQZ1Zv2QJbBup/k/MNaZhwuZjkf/MAImRg9V0U1E5FF35SsSRM5ZjfPmlJwafaX2Xrl4rGs0TSXuJ
	P6Ww9juDxrCGjnROtpvKAu0Ks/BzXQ9IeZs9t59mm3EhOffzJbLNo1UVH1JIkznZVkR29fkhKEvz2
	wNz/fJdZYX8IIn2DP5O/RuuEJi0N0Za2Nmw5smohg58LrczO9+YB8pkzHcHuGEb2nA0yVA9QjEOtn
	LwSuBh1Uwm1lT7uGv9elKkd+ZnqcbLWC+KTg40g+fRGvu/48AVY+tUVXwqQefZkiTvofgB1c/mvvn
	4vSqmvj9hkXVdYg9AQhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv28x-008HZn-0j;
	Mon, 23 Oct 2023 21:07:23 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv28q-008HUs-2w
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 21:07:19 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6b3c2607d9bso3084397b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 14:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698095236; x=1698700036; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frioRiPhaekRnCE/0ENvI5wkvdspg2jE1Z81EEiVDoc=;
        b=Kp2MEE9V9ZWkoFDzEjdCGRGLBGB5KNWPkMDWs9W24QmBLxxP1sVborwq+M3h6bn4n1
         44ZUbpzS44L2LMObTgYZQRBX3V7drNjtYmC4HdXIc33SoSbKzIjdHN+YfZcUxqvBbVdv
         uFWXUEt+o0FTGjYv3ZYFi8t2LD2uZeiN/r354iYngTZPKGW2nejzQGdLzx7k4M2UHzE9
         uTiOJq1KyOxc5XumoqjQKHMEj+SZKCCRxO/2YX9ETT5LaDDzirl5VUh5X+ttuoxSRibw
         yO5ly4ARu+f++fRs4dtxwVHYvv1MZyiae4PgDl04W+1mwVhpsfLXp7mueRHLVyiptjNf
         G+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698095236; x=1698700036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frioRiPhaekRnCE/0ENvI5wkvdspg2jE1Z81EEiVDoc=;
        b=kJ3LS86+o0LqcY2qWyiaqEPKRbJtq4rPqfXPtuxl0NI9+Si7/gAN2XGbi5lpmLzoVO
         uAofoZL8d9bktCD7IbvvUW8auCgwG/QpFkrl2iZDz7D5CKAF5oHsI13NekqkLg3gN7eS
         t4D/GBmxysW4jWqkhpZt2IBi8sF9jt4KCNxqHmSF0QA2ETNOYsDMtIpkDcyZfPAc3Er0
         Dwq1y2lJ3oYFi8DrgRntAVAce0jOZ5jhFF8Oq6zTTCh7wHmFN1oNNBLtu0BzOyeMxMxs
         k+h1GQR6UtZnsL9rqJQPdbDKdJ088pXmOUD2XryxheXM+Pj8Mn4S6vago2e5feJhJEcp
         baEw==
X-Gm-Message-State: AOJu0YyvWx2ZYdw91NL0IDpaplLcEdjb8vdsH3PzmH6x58bbEMUGxAOW
	AyxMlhsGT0uN3lPXSw3Cuis1tQ==
X-Google-Smtp-Source: AGHT+IGWrHTrnLkYiQyu+QLLmhX/cQml0jPNHPXJOjZpJ+Z4E+jfkFscNGmA1AJnuN2Y6KPQM0ObCA==
X-Received: by 2002:a05:6a00:1747:b0:693:3851:bd98 with SMTP id j7-20020a056a00174700b006933851bd98mr8163238pfc.2.1698095236354;
        Mon, 23 Oct 2023 14:07:16 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:b9a0:8714:407c:4146])
        by smtp.gmail.com with ESMTPSA id k28-20020aa79d1c000000b006bde2480806sm6573066pfp.47.2023.10.23.14.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 14:07:16 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Mon, 23 Oct 2023 14:07:06 -0700
Subject: [PATCH v3 5/7] riscv: dts: thead: Add TH1520 mmc controllers and
 sdhci clock
MIME-Version: 1.0
Message-Id: <20231023-th1520-mmc-v3-5-abc5e7491166@baylibre.com>
References: <20231023-th1520-mmc-v3-0-abc5e7491166@baylibre.com>
In-Reply-To: <20231023-th1520-mmc-v3-0-abc5e7491166@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698095224; l=1608;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=118IOeI3EDHQnRGvuv5ewuNsGEAnYvxtIZdzQTMEyXk=;
 b=XyMu8wvvsVfsnmoVXWNgX+KUd9hOCnDa6dLi4MnIvVGBBqGRnsVHK86mx+4qjhfZBbXb1s2ST
 azF53vPUXUBAo9/G0vksN6nCUnyIEip5lqZ8/HB02fymtmxyf6Jbbam
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_140716_969224_12716DFA 
X-CRM114-Status: UNSURE (   9.73  )
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
Cc: devicetree@vger.kernel.org, Drew Fustini <dfustini@baylibre.com>, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, Xi Ruoyao <xry111@xry111.site>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add node for the SDHCI fixed clock. Add mmc0 node for the first mmc
controller instance which is typically connected to the eMMC device.
Add mmc1 node for the second mmc controller instance which is typically
connected to microSD slot.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index ff364709a6df..f5ec9326c4b8 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -134,6 +134,13 @@ uart_sclk: uart-sclk-clock {
 		#clock-cells = <0>;
 	};
 
+	sdhci_clk: sdhci-clock {
+		compatible = "fixed-clock";
+		clock-frequency = <198000000>;
+		clock-output-names = "sdhci_clk";
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -292,6 +299,22 @@ dmac0: dma-controller@ffefc00000 {
 			status = "disabled";
 		};
 
+		mmc0: mmc@ffe7080000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe7080000 0x0 0x10000>;
+			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sdhci_clk>;
+			clock-names = "core";
+		};
+
+		mmc1: mmc@ffe7090000 {
+			compatible = "thead,th1520-dwcmshc";
+			reg = <0xff 0xe7090000 0x0 0x10000>;
+			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sdhci_clk>;
+			clock-names = "core";
+		};
+
 		timer0: timer@ffefc32000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc32000 0x0 0x14>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
