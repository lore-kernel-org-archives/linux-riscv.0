Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FCCE7D0BC
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 01:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=akzwyEBDd9+qC0JbC1VCPdBgKjdsR+7tUt00sdZvgpo=; b=W5bo0tskSsd+Ag
	IhRI0SpWHefQDG5Q77W0c4xxy3wGYdBFJBBH39/4iWa8ty/r8YQIn8gGK/27jL5kN8WQijYsJwnlG
	ZuMfh5GCPHQ0bfhqFFrem4f8whMqLMPfpZB33Ta7bo8x22ZbFaBBR7TkHaQfLHyEJYVU4qhIA6Pme
	U/zajpicEdfGIRQfKNIOsnNJOLLg7fQ0uxTttpQvQ+Qz3jSbdSSv2hAexUe/YS/geDa3znLzCmkGs
	BDlhjx5gdvsD19A63Y7m7yLrV14Vsu1JwPgLch9saFp7i1Nxb5Mbc+qKgTjdo0/S3H9n5lJFc2Q9u
	J6CvIHlD0Qo4qvt2d8AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVKG-007aht-11;
	Fri, 22 Sep 2023 01:51:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVKD-007aeh-1Z
	for linux-riscv@bombadil.infradead.org;
	Fri, 22 Sep 2023 01:51:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FhR9frpmu/yAUsLJSS2gpg1w0JSCDYrDF2EFLnkclH4=; b=b2BpaAX8bKQhhE5luFGpYVbuPy
	GhFQu5JGiZJAr66JD+K30ZjNn23nBvSlLztSksF87EKEsWWoHxApafo09LOZRhDUfmkq+iJz5gCZm
	VVwv6Yo9KW6koNudZK2wysEHlScQ5vgYELrT1cfmbdpUHmRDyL659PSFBN8nBphTqYDX7PoeEHz8w
	2u8Q5DgU/F2q7gdEJy+W8oJPa4POqLa0EMoGmTi3YuC7i8tONf1y3R190z/LzHi99BWvLIJ/Mvgxa
	riNp4DKuABozcRYAFtgz/rptCINnH8a5TdXPFNDwjBoeaO2Ybt11zEfyAFb/UvAT4EZvNBAsuH5Wn
	tiIgISww==;
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVK6-00Fq1W-1Z
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 01:51:19 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1dc863efb61so610714fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 18:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695347472; x=1695952272; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhR9frpmu/yAUsLJSS2gpg1w0JSCDYrDF2EFLnkclH4=;
        b=SrZpbQ7HhnOmICYB8vLHEC/Dv8IjEMQKIbopxFwUh9dN8mC8JZ2mjqqNAMSn1ruy+3
         wA6LVih/KanrgqTaAoVQnae7KpJZYodSVYXYMuS1RL+3MhZA18fQBm6EL9mfJUq5QQGA
         NTvAE4fQ48hwkNUY0PQ4ecNzsFnbQOitPVUGMu67AG5ErbE+BrNaKq2lNBrzv2SPyLoE
         H1xtKBbOQK9fonM4rQDkEWXfkH6YvoyKB/gYMJeO77/C+UygRtQiP39c8xuTfIxMYa86
         9F4rlrB1+ve7EGICniki2xCN54jKOPAwT0A2gs/6ArOji/WgJf9/cRT37wIKhXuSjEKv
         A8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695347472; x=1695952272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhR9frpmu/yAUsLJSS2gpg1w0JSCDYrDF2EFLnkclH4=;
        b=nMU3N2uF0CKGHSVNzJu1Ko0UGZNHj2upLrZKcNtww2arlDXrg9+YP7twc8LrZ58S7n
         CEm3HPdYZrWCvN7kHGdpqG58TA9aVuc9GaIYBhl91g/Iw9IA+tPvb+ps3LwKXbTox4Ri
         z+GBe63DWzb+FINi/GNORjPYOYJ0WPVUb/p7atXO8urpsh72bTfsNEUnziexy5tuWHH+
         3CxtPL+0eCp4ksmUZdjsM+uwv7x6wHSVjSFrHscr57jlelSlXL8kyBBv7JlANpjndM2H
         S6aBbyycidnK/00WS0OXAjP1KA6dX5HibJJeMp8XIDXhcs/Wtd6VxlW1UiuhJJ9G+nwG
         e/ZA==
X-Gm-Message-State: AOJu0Yyquer2z+rmxje+PfwmgWXjnjp9dhz1L+WK3EqkgDOjrwXxu6CJ
	cTIai68xyuByY/55WqDb0mA2Wg==
X-Google-Smtp-Source: AGHT+IG6f1s/2Qluw/AcJPeKmsWPsdAsou8qMp5DVhViZ2oFPjZlrQWRIfAn8jL/kTb28f16DxKnNQ==
X-Received: by 2002:a05:6870:418f:b0:1bf:607:e0f2 with SMTP id y15-20020a056870418f00b001bf0607e0f2mr7359618oac.29.1695347472260;
        Thu, 21 Sep 2023 18:51:12 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:fa26:6227:be1c:67f0])
        by smtp.gmail.com with ESMTPSA id y10-20020a63b50a000000b0057412d84d25sm1973856pge.4.2023.09.21.18.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 18:51:11 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Thu, 21 Sep 2023 18:49:51 -0700
Subject: [PATCH 4/6] riscv: dts: thead: Add TH1520 mmc controller and sdhci
 clock
MIME-Version: 1.0
Message-Id: <20230921-th1520-mmc-v1-4-49f76c274fb3@baylibre.com>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
In-Reply-To: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695347467; l=1256;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=BOuTsoiS4wD+cP61c2nYQjChDl2neNVnlaTjhPPnjNo=;
 b=828BIUxxnWEqAhThpR3UsYUCLsNEjUrqd+nJV6aT2PNkFMKfXThBLTjniRlEi27zEM9N2HE7i
 2TD3Ch0KrQ3BZYG48TuKVeR9eYlfwYG7F8m+g8psY+m2UCtMFgl1xpF
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_025116_716537_A486A62A 
X-CRM114-Status: UNSURE (   9.82  )
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

Add nodes for the SDHCI fixed clock and the first mmc controller which
is typically connected to the eMMC device.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index ff364709a6df..ee0711352790 100644
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
@@ -292,6 +299,14 @@ dmac0: dma-controller@ffefc00000 {
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
 		timer0: timer@ffefc32000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc32000 0x0 0x14>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
