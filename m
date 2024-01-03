Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1765C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 13:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nSsPxLOWG5WCqfxnT6EMw+cagRlftMegXC9Yj5b1H3c=; b=XNZKNOwJrQ3eps
	6qCffwLs3Ahe8RRG4TOQfHzt4NjjfwlgYVb+dmAOrcpoLWHQtqGpbDOGah5b2gOI5zyuDWmG4fg1v
	apGAvqYwrIR2crMfDRchgnznyRn5xn98kBlLXi/5s5cJ/epK5j4hzaZEXdhK3EutvU23RQ11RmYIy
	i/aMVOOJ5YS7UoeRm/DGeIZbUZaw9KwYO4OeXtqQOe1jG3rV0j4xizvCSxFH9nMCFfl5EE1F33DUt
	BUVYkEb5JA9dHyZDuvus43HVmBKbR9wXXOZ4b/lyEu+TPX5rfZg5Y1nq0L98+3J7uU+PcbTWMQsnY
	ZhHvSRYskDMuwB5pIRTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1JK-00Awou-2C;
	Wed, 03 Jan 2024 13:29:30 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1JD-00AwhH-30
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 13:29:26 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3D37D3F5CC
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jan 2024 13:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1704288548;
	bh=0xlyxKFbvUzm4zLJgn5EKeObZzal+VTFR9Rg6ALS2M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=D5U+W56dz22Sq5TDFhArSwNC6juXtPifx6+sxiRd13o2b4tsYBMEhE9DxQxqrmzQU
	 fetYQSrjtyA93a5o+iUYptn1rzQG7t7t+8haaSOMa9lL/T5Ebpb0/Qvl3Q1gH+VY2W
	 ta7vnJ8F4GoK7fre8LyV5Z2Gy6BqFcdzIyEWJ3HQOL2sVEUmZgdYvXCn0IZtw8tMFK
	 IlJdCvbqfZhmtYxJ7Kfa1Y70bb3Nfgvgc5qcybtOU9I9T3Z8HFgcX0I52hLmtRGUTA
	 OU4Nq3cORuoSopLR471qRSJW7aCbfo+aKtGAvs2vPE/3lUC1MzjvdhkaEi+WEyEXvt
	 y3lDz2B14DRaQ==
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-50e7bf11ef2so5698358e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 05:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704288541; x=1704893341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xlyxKFbvUzm4zLJgn5EKeObZzal+VTFR9Rg6ALS2M4=;
        b=XXdd5DF41HeujkzrqM1nOvSEIpFDcCwLrE7FDsR1gXh+E17gG/AZ06lYyVQSx5tFl5
         L1dwW0TdnXJmtqAdZPxsh2ZiHC81gIj1057jFqGLe26fmAhJgJq2JIXz/vHhzRH3KUCq
         0jvnCLDbDRafGzanUU2wtf9afFUjcD3ykY0OWBkp5ONUr3pQ4gn1+68bYHIX0G+qh8/r
         4AS8x6wGwU+yJNNvE8Rq/gPDwXo/ubrlGeBPcujlbeNdSGbQnAto3J9Z6sxmO40+BNLt
         at7lM3o9euhnJX1QjMRBT/Fr+/7yLQvnfjM9zSXisuVmDMAYDCCOqXavIgIde5wwG8rK
         ZRgA==
X-Gm-Message-State: AOJu0YzgW+c0iZRQXNzJBgAFAfG7e5ybWMAlF1HuypKiEhURtzQZOOuI
	92/2CE5F0rbhBTm7Qa+6jG5mXG+2ctdGulwAPfvjLmDPecVv3a6ZPoP/vVbfhZAp6TP3Aap/xZ7
	/iLxYqefQKnzu/uIjUPjm3jw/AYw+E74MaBtPvnU+huzCYsyH+C8G
X-Received: by 2002:a05:6512:4d0:b0:50e:9a0d:d402 with SMTP id w16-20020a05651204d000b0050e9a0dd402mr1985085lfq.105.1704288540718;
        Wed, 03 Jan 2024 05:29:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFglWpNfCSmVpHzBKEgsAU+8MjxYPm2sCoW5U4VmzTKq+1KMDXtev6vYNkRZ5n9/d/lOFNERw==
X-Received: by 2002:a05:6512:4d0:b0:50e:9a0d:d402 with SMTP id w16-20020a05651204d000b0050e9a0dd402mr1985076lfq.105.1704288540552;
        Wed, 03 Jan 2024 05:29:00 -0800 (PST)
Received: from stitch.. ([2a01:4262:1ab:c:5af0:999b:bb78:7614])
        by smtp.gmail.com with ESMTPSA id eu18-20020a170907299200b00a26e53be089sm9549873ejc.44.2024.01.03.05.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 05:29:00 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v2 7/8] riscv: dts: thead: Add TH1520 pinctrl settings for UART0
Date: Wed,  3 Jan 2024 14:28:44 +0100
Message-ID: <20240103132852.298964-8-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_052924_665883_1FD881E5 
X-CRM114-Status: GOOD (  10.98  )
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

Add pinctrl settings for UART0 used as the default debug console on
both the Lichee Pi 4A and BeagleV Ahead boards.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../boot/dts/thead/th1520-beaglev-ahead.dts   | 26 +++++++++++++++++++
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 26 +++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index f1e8eaed487c..c697a50ca9b1 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -62,6 +62,32 @@ &dmac0 {
 	status = "okay";
 };
 
+&padctrl0_apsys {
+	uart0_pins: uart0-0 {
+		tx-pins {
+			pins = "UART0_TXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "UART0_RXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index 0ae2c20d5641..932838c55f90 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -29,6 +29,32 @@ chosen {
 	};
 };
 
+&padctrl0_apsys {
+	uart0_pins: uart0-0 {
+		tx-pins {
+			pins = "UART0_TXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "UART0_RXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
