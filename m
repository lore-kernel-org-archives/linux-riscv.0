Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE81CEB2C0
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 21:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnv6ll/FtOIxghjiLQ2epkypMHYUE8AE0kLSz2v+/lQ=; b=bZ9Q+3Nf/PMgxe
	34/EVAK/qWRCtmZAYeYmo781uwJbB8TmhnwSjmKD4mi6AKiGUZ+ZioxaypjUK045lyoK8RnQKUn9V
	lbDZgvmpxJ+dreHwfMk5XQ4YZrkYiqYC82VzMNW4aJgf2H17cI1ecASyBirz2ZaEwb0oMWvyyAWsJ
	lnH6c0lnZ3B8E1Rg+kgUnyfwWtOsx1nISLnrl+ry/Z/GZexGxmClsd3qu6gQq1kMWrHfi34VvCIRk
	rHaOjJfiCa4JE+FY8U2ryz49InfVRXUfg6ihK/o0u7rwcf1vpRhT71AabpSFw0x1OOxYJEukjnVdc
	Amhx5q7pCM0MJOwWGTHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svNVR-00000000q9r-3UrK;
	Mon, 30 Sep 2024 21:00:33 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svMQM-00000000g52-3Ljg
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 19:52:48 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71970655611so4418264b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Sep 2024 12:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727725874; x=1728330674; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICpyCTkGsdJm7eeaXUsSjDldVjlYUz+0ZOAQ13h1xnU=;
        b=UGJH7epEcGxiY3f1e7bP6zHmbr/ONXHLYW0jD8v73TbFtKSVgWpkL9wLr3/zX8I0Sw
         Y04YGiYstHLFIYjIxx2ZuFtpdKQvAZJZePukZw5SSPaPaPlciaJBKmxi7ivMHoJWut9q
         iHM6Yd/Ss0iXp1D2ENHqIFGfYtvQbf2dF5++gdsbV00EIHrKGNEf1YoNE52sh6QZ6fqN
         nWOJnkdONqnu0RC1n09u/NBcSHidaiz6BOs3IUNxY3a66eKiwmva2NFxjZ3DO6DK+mnQ
         +c75C4p6Lh9m7gzmZYzyb73iJXRTFgfHqYbATo+ycCmkUEEucoFgOH6v+tsObRrQggx6
         bdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727725874; x=1728330674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICpyCTkGsdJm7eeaXUsSjDldVjlYUz+0ZOAQ13h1xnU=;
        b=SSWfsZvZsybiOySa8h2dTfvCwlJDXWBh+sqU+w2n8sBKsE6XWKAFqOBwhbRDCXlOiI
         rt0CkiOO3dhWD/fnBM0fhg+wVgkY+s7/973wj7g9sDzPNN5S/SuMCszLCVZkzYJSlbd1
         P603wbGgWs9OokLE7eFKlmL/H3oA7Xcvq6cHe4OaE+UIUzNxcs66ZY2Q+0meUwBhHg5i
         zn7SEWF0rD8estVg1u5xHiU186cllP7LyTm/BPP5wLKLMH97Xw9cCF+ly7traLvB1Sn7
         kEaDbVzK3/etCNS9d+5MYQnL94mLIPCCiIuFxjyEzCaj7ieOs1KOrjsIUCzzSXLPYwyd
         l6zw==
X-Gm-Message-State: AOJu0YyyiUPbYhmQPanabVyvBd8Dhjs6Yc5JJql5OP36r2uut+OEdXp6
	Qh38kJi6mmLs5GGPPdOosOmwpOcprAt9I3hLDbxTKdLtREMt4gdN+4YUoG2EP1U=
X-Google-Smtp-Source: AGHT+IGNiVUtiKwsFmCbb9BMFxoZhqZNHK240MQuF/IFFw8Khki2fl4uSD7/w4pR2J1UZBbSAna/1w==
X-Received: by 2002:a05:6a00:2d18:b0:706:6af8:e08a with SMTP id d2e1a72fcca58-71b25f00e5cmr19917887b3a.2.1727725874095;
        Mon, 30 Sep 2024 12:51:14 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26529d4bsm6630213b3a.158.2024.09.30.12.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 12:51:13 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 30 Sep 2024 12:50:57 -0700
Subject: [PATCH v3 7/8] riscv: dts: thead: Add TH1520 pinctrl settings for
 UART0
MIME-Version: 1.0
Message-Id: <20240930-th1520-pinctrl-v3-7-32cea2bdbecb@tenstorrent.com>
References: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
In-Reply-To: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_125114_876827_5BF1D6D9 
X-CRM114-Status: UNSURE (   9.55  )
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

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add pinctrl settings for UART0 used as the default debug console on
both the Lichee Pi 4A and BeagleV Ahead boards.

Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 26 ++++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  | 26 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 69f82e7afd0b..6c0b768e8d17 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -71,7 +71,33 @@ &sdio0 {
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
index 58ad381fc1c3..f60b1879192d 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -30,7 +30,33 @@ chosen {
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
