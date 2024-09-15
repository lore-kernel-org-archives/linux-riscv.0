Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DF8C35FE0
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Sep 2024 02:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eaNr0tFOcEIeQwUjC0OnTA14nr+BwjFxElpUNZ4y6aw=; b=pIJ8vMsStBSm8h
	rQn2KjLr+MTIGKqqLD0wJRkKeto19/227ucTOzb+V6PkuQPIcdxSFQ9Y3TdqFOd/KL2xQJk7P1SCq
	OVBqTFlIuNaprJHOjbVkx2qZG0taY1EcYwb/csXydgVkihF5hbpPrKNur63o9d47yfPmTjCRIwoSR
	Y1OayPP68Mdy4mrm2hgMZQVUxTjWqavLSzV9O+CGOfOrKdxcD8IjXXPbkuQQWhEaXVO4ZAIjLs29d
	SB+3xKuZtndPHlIE4Kkfm1GPi6EPDzi6rxNIWIyMGm0hsAKN/T1RR93JV6ybxbBFwz0gr+kRG4PEn
	I29xblmL11NlgMdw1xgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spfE8-00000001Vus-1PsR;
	Sun, 15 Sep 2024 02:43:04 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spfE4-00000001VtW-463b
	for linux-riscv@lists.infradead.org;
	Sun, 15 Sep 2024 02:43:02 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e05f25fb96eso1898384276.1
        for <linux-riscv@lists.infradead.org>; Sat, 14 Sep 2024 19:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1726368179; x=1726972979; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRW1CgWbOLN0dxInO1RVa4MCLZ/SoGKEH+KzW/Dmmts=;
        b=PLEFL1ez8O47ibwshvYcnIC+Pdzn39gpp1tDXnPH5y3e4gk65TYxXec4j2mjx6mFtA
         dmjS5iaGJ58eoR9vyCCRzjfpZkVzqBaY7tWhjyRGDZ2l6lXMG4RjyjDAT2m2em+wanj9
         JeCez4y4K21Sp+kv73p0YtrdCiGoPuRLKYXIt9AxNwojjLzLaBCn79lgI7E27Ht5ndE0
         QhOHPaVoCVR8Af03DxmKZW5aWQQqOB8WPBxzt2RwHwjkCQavDd6MrHl0EnJHQZXFJ3QM
         gZhWgtZG1czo/2jKQYybBZ1SZe5NK0imIqmzJk7ICLQl2xBUXdFO2wlQYbXN+yuHk7vm
         IpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726368179; x=1726972979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRW1CgWbOLN0dxInO1RVa4MCLZ/SoGKEH+KzW/Dmmts=;
        b=He6mEuGoXrbn0lFymPKPTSYFAcbZaLcmBp+ThPXZ78c0W58BLIs4n4GItT5nD0acMG
         Oza8qsucDqzMJoapnl0V0aQSCj0O9NXldh5TAsul2GmbolBFgNGb/7dpzvIs0VFj/Hlu
         MAvxL57xDOTTi7Bd0M3FT+5hgp32Ja2IpROy98SJIGUge2o78Wwxx26zFkDi1kDQ2eDb
         MssLliOBN/JwI8OAIyt0CcW6ehlFpQ8wKkLoQOQccMfRyWxlMJLhq0p6nlQW/awq0Lkc
         i2LTpXy2oDn/386s6roi6d73kvFF4669OzlPUDlcVsEUWW1tSGmA2A5uIV2AK5JVAUKJ
         VE2w==
X-Gm-Message-State: AOJu0YxsffsLUOA+ootqYD+Yq55eOhuVXYrFvt0eURHGT7gRIXTulKj9
	faqBwQLv+UkzHrcg9EUjQ3t8Xol3mn2oU3o1KTM+LMFZvR7l33fp7tNMUDkibDA=
X-Google-Smtp-Source: AGHT+IEx8GtZaKrbGBS25oCnrlxDQauqhJwCRWXxT7EBP3CqFLy1MH3r5DNRJRFoU0qKJgkRzpyjnw==
X-Received: by 2002:a05:690c:39d:b0:6b7:a7b3:8db2 with SMTP id 00721157ae682-6dbcc579a93mr70022007b3.30.1726368179545;
        Sat, 14 Sep 2024 19:42:59 -0700 (PDT)
Received: from [127.0.1.1] ([216.139.163.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2e0d924sm4129097b3.41.2024.09.14.19.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 19:42:59 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 14 Sep 2024 19:40:52 -0700
Subject: [PATCH v2 4/8] riscv: dts: thead: Add TH1520 GPIO ranges
MIME-Version: 1.0
Message-Id: <20240914-th1520-pinctrl-v2-4-3ba67dde882c@tenstorrent.com>
References: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
In-Reply-To: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_194301_057798_BCD8CCAA 
X-CRM114-Status: UNSURE (   9.77  )
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

Add gpio-ranges properties to the TH1520 device tree, so user space can
change basic pinconf settings for GPIOs and are not allowed to use pads
already used by other functions.

Adjust number of GPIOs available for the different controllers.

Acked-by: Rob Herring <robh@kernel.org>
Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 9367754eede8..f9e339d3472d 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -338,6 +338,7 @@ portc: gpio-controller@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <32>;
+				gpio-ranges = <&padctrl0_apsys 0 0 32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -355,7 +356,8 @@ portd: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <23>;
+				gpio-ranges = <&padctrl0_apsys 0 32 23>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -381,6 +383,7 @@ porta: gpio-controller@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <32>;
+				gpio-ranges = <&padctrl1_apsys 0 0 32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -398,7 +401,8 @@ portb: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <31>;
+				gpio-ranges = <&padctrl1_apsys 0 32 31>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -541,7 +545,8 @@ porte: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <16>;
+				gpio-ranges = <&padctrl_aosys 0 9 16>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -566,7 +571,8 @@ portf: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				ngpios = <32>;
+				ngpios = <23>;
+				gpio-ranges = <&padctrl_aosys 0 25 22>, <&padctrl_aosys 22 7 1>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
