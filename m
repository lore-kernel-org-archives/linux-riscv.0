Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCDEC27C45
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 21:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZNcypdFNQGdQ8MqmnyaFb3GcT8ghodCK6e1fMwGat0=; b=QiM7CbI6okyKYd
	wxRE9kuduVY13/8e7O8/lWGgj0uBLdIObQbnWPmvum+JbJlh12C5CBBLA/2Ew8JXvMZJXgrhi9usU
	YBYZniI303uawECr3g7BD1xWpfdAXouTKRNBoJ6gzch6VPyvojuOwi+xBOYomzt+BN8ehmgZE3B/I
	YKP5ArwzzbzowOCL+K8Jnt3HEYZjG3BkpU6ZioXI0JhYfhPxJg1McbfxjfRBDyBw2DuEqrBDGy+OW
	Iw5iaDpAkbvTcvKUBclhfQjgyQmW9d5xa7/hi4lUZ8GSAFmJc2icXKXiqX8I3nklI0+wnjJJKu1kh
	7cyIJomtBdYgUkcg0ngA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r30e0-00Go7u-2Z;
	Tue, 14 Nov 2023 21:08:24 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r30dt-00Go2K-07
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 21:08:18 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-41cb76f3cf0so36964361cf.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 13:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699996094; x=1700600894; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DnDZGk512Fn6FcfRLVRqtgZTjSOOBJwTCzWACAW0uhY=;
        b=2BzF5PN/sqhpP4hq7mU2Q4NYbSst4+eZ6mHGIZNeJvfuHVZmLTQqtT1WkluhOr9vNn
         EF78nXekN5GrToCw1Fm2m6cJk/FoXOd0SQeooOVN7nBYkBzFu/4FmH5351XZYr6uV59X
         TDDbISbcFn1fXN3hSrhb/K5G6dXpW7L4Jer+fqJS5gyTsqYu/50lfFbAcT1uw/E5G9zf
         3I7WDYqMnNYXXDoHRyTpCPfayacuYsuLlZvjnBVYVbImZJV8MbwU9rZzSOZVHQJxfc5z
         y3hN27bXrX+WKLUd9HZ6xZRKtNNNLORzI9EAraEm8GlqHxHpvkapww6TsD5BvTMAhp59
         6FXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699996094; x=1700600894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DnDZGk512Fn6FcfRLVRqtgZTjSOOBJwTCzWACAW0uhY=;
        b=h0XgN1qZajuXpFvSJuTWUHCqDtwb+OnFyM02fT5l/j0spbXwlxs6GIpAwULCg7aZap
         tu+bvtSPW1GhyQrenS4qgNZoScoaqwSZXVGV21joBKBMvaHuRo1IBs6zCCRzDk2QftdS
         f1WYXNv38ApfZsXehv/9uDY3CyjJorFEybe7eiQPoq81YtbftahbvJ7dIuT3U4xePjrW
         GDDWN6hiPbJKYcAkOkklisHLbRvLdIP4evO3etYYZiJt1t1B/iDiLEwnABHMxxO6YUcU
         1yYKphwkh01V9FwsnNKbFXia3pDo9qkS0G2kbhBWN6byRnXBuzPpu1mAH2w7J6ajELAL
         yfnw==
X-Gm-Message-State: AOJu0Yyr47xoAxlkPV9PrT3FIYoHKZfQWl/5By2oHeXjwy8jlKWI36rG
	zOWkj4p6IqRh8olKXRYrH5TFRw==
X-Google-Smtp-Source: AGHT+IEK7PlZMYuHkL/R+IsthoAOwkSQLBiE4nLJ04BntKaKYMZ7Xfo/U9ypzSKpZtZk+0pj5KANYA==
X-Received: by 2002:ac8:5788:0:b0:40d:7ffd:fc61 with SMTP id v8-20020ac85788000000b0040d7ffdfc61mr3671284qta.23.1699996094414;
        Tue, 14 Nov 2023 13:08:14 -0800 (PST)
Received: from [127.0.1.1] ([12.186.190.1])
        by smtp.gmail.com with ESMTPSA id x16-20020ac85390000000b004198d026be6sm3027549qtp.35.2023.11.14.13.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 13:08:13 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Date: Tue, 14 Nov 2023 16:08:01 -0500
Subject: [PATCH v6 7/7] riscv: dts: thead: Enable LicheePi 4A eMMC and
 microSD
MIME-Version: 1.0
Message-Id: <20231114-th1520-mmc-v6-7-3273c661a571@baylibre.com>
References: <20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com>
In-Reply-To: <20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699996086; l=1102;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=vZkA/Rp2zWEJvsAGA/badfpHmHgx6/3DqqLzYe2IxQc=;
 b=SjwF4UAXo6/VukqMwwjVNk1Bt2VTO2cQgXt/3XczOxw6M01DzJI5nFGgAMrBI3p5LGZYyeYHw
 ul3WhjbXZvaBlQ2tkLlrJa4Fs/mjbBvjVO7YJ8LK+2Qn7S2r0S0TXtz
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_130817_074589_846EE0EB 
X-CRM114-Status: UNSURE (   9.53  )
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

Add mmc0 properties for the eMMC device and add mmc1 properties for
the microSD slot. Set the frequency for the sdhci clock.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi      | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index a802ab110429..94f1741435a5 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -29,6 +29,10 @@ &apb_clk {
 	clock-frequency = <62500000>;
 };
 
+&sdhci_clk {
+	clock-frequency = <198000000>;
+};
+
 &uart_sclk {
 	clock-frequency = <100000000>;
 };
@@ -36,3 +40,19 @@ &uart_sclk {
 &dmac0 {
 	status = "okay";
 };
+
+&mmc0 {
+	bus-width = <8>;
+	max-frequency = <198000000>;
+	mmc-hs400-1_8v;
+	non-removable;
+	no-sdio;
+	no-sd;
+	status = "okay";
+};
+
+&mmc1 {
+	max-frequency = <198000000>;
+	bus-width = <4>;
+	status = "okay";
+};

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
