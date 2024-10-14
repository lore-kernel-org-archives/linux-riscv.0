Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F24ED1813C
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 17:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNuDbIlCgbdtHKZWo3ouDtQs5VInZTa2lvIShK0IOAM=; b=p+be4hCdMjAoRJ
	1Ni7fCrVysDiucv7Z019wZ9Yn1h6neThuNHCgUa9X3ZfUGk7bfjObjEAv9JXAlM/ZsgmegojAXy3a
	b8vl6EosT/2xSS+KwPKRLdZnPzpngt+m+tP5x3I5PWMTI0Ew1ulXa8nn1z0NOJUNb4RXmg9qIChzP
	OD8FYm2z4+7cK2J2vuDVQHwv0f70L/piu0zLyNH31UjxpEzLZ/Ellew9LzAPD6gZEtpZCaRjXEYlo
	nKmw0ty9yqDByJvsCef+zL83J8KKdl9HBGRdW0KgqlvqdCyfWRViLErMDfKgLuKod6DeLy60BRH6y
	4pQKPNovWpaSrSxqKvgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0PH8-000000066Zr-0Ib3;
	Mon, 14 Oct 2024 17:54:34 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0PH4-000000066Yx-447P
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 17:54:32 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso1175154b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 10:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728928470; x=1729533270; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehWwjmU9hAOqAMUOWeKIHlX8tN0mNj/IrInipbL2fO8=;
        b=RXzVKuFVyHbcvRThJRDlMtXTXO3am5wnPOT5gGclN/xFzEsKhwpP+EM6I6vLbpvbj/
         4BbbRzMlvoBUcJzv3YDo13gBpg9oCxY7xas4t/u8WdFjAoYBb7dV45HVSFu0TvSAmFm/
         7Bt2xaqgapOU70RjS+UtQGM+sGY6pdrI/4ppfEZxDgjVDy7YM5K+jZx8ChiEDl951FNa
         QQQ8xOCCag+yqU5hqu8GjGJS+DRK6n+JNsdm6kJ9CNv+2hcAkUZMeM6Ggl9mJtSC0dYh
         SKNxIolGk8HnwHMjFcMzdubNp6j9ImPeM9lWtEY/mm2OzPIew+vhZqZnhmtLvWFgNDFf
         sm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728928470; x=1729533270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehWwjmU9hAOqAMUOWeKIHlX8tN0mNj/IrInipbL2fO8=;
        b=JoI13S99PK2UCI7qwBnzWkUegoAJ2RQO0wNdcx61KU75UQhBW9ReKBCGiz9D+JZNzA
         D/2hWIZTF5PpULhnFrTBImpBWR5Yt+j4QHC5aEFlYfakbqttYXe6JodEZPfi/gtPDmDb
         oOUqDqx9NnqhDzCXe+u9ON26+icWBBY3qaqA4vL3K2OhpO+SrZkKkNrgBXjKK3Lv2iZL
         YeqHFatab2MbmtmGUgQF5t9Wm7/3Sqn6IoyWn4bkcB9fuV7SG26uRUBZK6ZS/VoV7dUE
         MHBS2IZrKa4qnyx3wZmJw1k8q72DBI+IrO30DbnKRgAx5m5ivDhZCpX8YOcECRpFk9+B
         fnEQ==
X-Gm-Message-State: AOJu0YyNH31wqQ3SuP8Dq3/s4p9K7GbaUuK+RTC32ZuKXcZLh5QG4KlF
	kBF/PNyIZx5wQNZHJ52Qinud9Gh9ELSmwF5AGvcSiqt3l/UGB9m63OczoSD5/XyqHoTWlQYZKyY
	M
X-Google-Smtp-Source: AGHT+IFpeRJRsm2cHiu1T3j3d9xtFI+KxEdYvrO5Pv2dkk4eBm6gnbj2n7uXlqF6jkG+oC+C5j473A==
X-Received: by 2002:a05:6a20:d808:b0:1d7:8fd:2df6 with SMTP id adf61e73a8af0-1d8c9577029mr13745197637.1.1728928469852;
        Mon, 14 Oct 2024 10:54:29 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e49a7e5e7sm5611109b3a.179.2024.10.14.10.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 10:54:28 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 14 Oct 2024 10:54:18 -0700
Subject: [PATCH 1/8] riscv: dts: thead: Add TH1520 pin control nodes
MIME-Version: 1.0
Message-Id: <20241014-th1520-pinctrl-dts-v1-1-268592ca786e@tenstorrent.com>
References: <20241014-th1520-pinctrl-dts-v1-0-268592ca786e@tenstorrent.com>
In-Reply-To: <20241014-th1520-pinctrl-dts-v1-0-268592ca786e@tenstorrent.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Kanak Shilledar <kanakshilledar@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_105431_050745_5F63493F 
X-CRM114-Status: UNSURE (   9.39  )
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

Add nodes for pin controllers on the T-Head TH1520 RISC-V SoC.

Add the missing aonsys_clk for the always-on pin controller as there is
not yet an aon subsys clock controller driver.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
[dfustini: modify description as there is now an ap_subsys clk driver]
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 6992060e6a54..93c17f52fbe9 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -216,6 +216,13 @@ osc_32k: 32k-oscillator {
 		#clock-cells = <0>;
 	};
 
+	aonsys_clk: clock-73728000 {
+		compatible = "fixed-clock";
+		clock-frequency = <73728000>;
+		clock-output-names = "aonsys_clk";
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -354,6 +361,13 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		padctrl1_apsys: pinctrl@ffe7f3c000 {
+			compatible = "thead,th1520-pinctrl";
+			reg = <0xff 0xe7f3c000 0x0 0x1000>;
+			clocks = <&clk CLK_PADCTRL1>;
+			thead,pad-group = <2>;
+		};
+
 		gpio0: gpio@ffec005000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xec005000 0x0 0x1000>;
@@ -392,6 +406,13 @@ portb: gpio-controller@0 {
 			};
 		};
 
+		padctrl0_apsys: pinctrl@ffec007000 {
+			compatible = "thead,th1520-pinctrl";
+			reg = <0xff 0xec007000 0x0 0x1000>;
+			clocks = <&clk CLK_PADCTRL0>;
+			thead,pad-group = <3>;
+		};
+
 		uart2: serial@ffec010000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xec010000 0x0 0x4000>;
@@ -538,6 +559,13 @@ porte: gpio-controller@0 {
 			};
 		};
 
+		padctrl_aosys: pinctrl@fffff4a000 {
+			compatible = "thead,th1520-pinctrl";
+			reg = <0xff 0xfff4a000 0x0 0x2000>;
+			clocks = <&aonsys_clk>;
+			thead,pad-group = <1>;
+		};
+
 		ao_gpio1: gpio@fffff52000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xfff52000 0x0 0x1000>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
