Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4661C10F07
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 08:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8GFDqU2TIay2hQ+3Pc4LkCjCh9eRPsbt2SvwB2I1MtE=; b=MbePm6dG4nq8bv
	8OGyGhNeRRsJdaCUytUIvZ+O3tyIat6rnKPosFK59D0aLRODHHb9cpsQ5yDWFmIpXiFmfoIUNPfBA
	sjcTZ7qIUeyMd4rRsAdMEGzlYe9SNQHk/aEYDMtkWCu1CIulCxVevqu3/kPQYSd4ayV6ywL64adkO
	DoZ1kKioQaaGDfg8O3mE7o/BUbNtjm5t1F3Swe+nWzd1ZeC7q7fl1abseoRopwmmu/k0GAd0rBSRM
	3S7Xc2RekO3bbu1usF6SgFtxwR8cCCJ+Hg9kUeDNIhvXaS37x3MFvjkEdDprRvXYm41kWXNNC5U+m
	jH+z9bmiHrj75nXUOZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAmyh-009MCC-0G;
	Wed, 06 Dec 2023 08:09:55 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAmyd-009M93-22
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 08:09:52 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5c5f0e325a6so2567732a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 00:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701850190; x=1702454990; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1pIpUFLzpCT8QDWNeKsRiOFIfK00T0l+KbsCecbFYJw=;
        b=whI72HnR9u6S3pX64gK9qrx/T/xUodMJte5jC933kzADx3ZTSR03fmvk6Mwf2I3dA9
         pnABypZ1YnBY8f2tbL7VO18Sooa17W5r6er+m74gVSWXgV7Ic6U4h8LEIbSQ7URP/QUh
         8jX4pIzzfQ9/jxKHqQVzliDvuYOiqudz5EWPdj50yKsjG+1L9NXql5qGsdN+9Sszfm/l
         xPBVWvRNu1j/OI+UIR882HZEoFbFGljjfD0eMRygCPFRwlJnO7oN8aXSXPAPPl2aDyhL
         WdeX5yPrXKWql9V3lG1IYB+fE4sQ9ZQOqGGAkNY3eVFNMFpPhJE9IysrJcb5jjgY+ZWI
         Er1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701850190; x=1702454990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pIpUFLzpCT8QDWNeKsRiOFIfK00T0l+KbsCecbFYJw=;
        b=EO+EPmaTD7Gu5QA+PF9JRgScd4C11sHWhfUq8TbFkQ6o7jRtYiwC5GV3npM33HaBa5
         aGBOdR2twLIhOibMqapBJmx/7Ycj8Rxdt8gieK4B6Um/OUw6DoToc6hfAdjvXYxZjKZB
         uztyRNURiFOIJmdz4JNRzHAo+y7wstM8AnCxj8I+xPO1EZcI4RQjX9fhekiKgB2L7ckG
         8LjjdbgeNIcnoBFfRKsn+vLDE9MvRRgBTRyn3bpbKDzPNh3kfskATaba3BAF36MMz80t
         SF0cSLI2ilNcIHJ4G7pEncDNcPpPYpp8ge12aqD/PQ44sNRBwOxylCxVoJeqYiDh0Gud
         Gikg==
X-Gm-Message-State: AOJu0Yxv2FWEBbYXsP65LuYAK9O0zSirTKD+DF1S2khRyS57gf9oCXr/
	HSFSHJlNSptlwNACE39hAlynVw==
X-Google-Smtp-Source: AGHT+IEldF6NX4UdDsjXNYhsE6P1JkJbILpm78gIrKcVPLzHcmb7S4JEk4u7SzdUVicpnDM1Ua9f6g==
X-Received: by 2002:a05:6a20:a296:b0:18b:556b:6d54 with SMTP id a22-20020a056a20a29600b0018b556b6d54mr173291pzl.55.1701850190073;
        Wed, 06 Dec 2023 00:09:50 -0800 (PST)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:92e9:8fb4:700:680])
        by smtp.gmail.com with ESMTPSA id bd11-20020a170902830b00b001d0d312bc2asm1208668plb.193.2023.12.06.00.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 00:09:49 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Date: Wed, 06 Dec 2023 00:09:24 -0800
Subject: [PATCH v8 4/4] riscv: dts: thead: Enable LicheePi 4A eMMC and
 microSD
MIME-Version: 1.0
Message-Id: <20231206-th1520_mmc_dts-v8-4-69220e373e8f@baylibre.com>
References: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com>
In-Reply-To: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Jason Kridner <jkridner@beagleboard.org>, 
 Robert Nelson <robertcnelson@beagleboard.org>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701850181; l=1125;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=yYq9cxJ0lp7+Eh78pcwxzBZNnaFwpVwT9d+26rl94NA=;
 b=jb8cqdanu6l93Jt+/zm1d32I4d8zOII7x4Qcm78W4yozsuLULYbPulbeM3HeDuy8xujWKAlu1
 +CIVjtZVPG4DWogtFtk7DWr68Pb8l0gdFp+jKqI0Ni+kiynhHX+9F9u
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_000951_674257_072B2EFC 
X-CRM114-Status: UNSURE (   8.64  )
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

Add emmc node properties for the eMMC device and add sdio0 node
properties for the microSD slot. Set the frequency for the sdhci
reference clock.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi      | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index a802ab110429..1365d3a512a3 100644
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
+&emmc {
+	bus-width = <8>;
+	max-frequency = <198000000>;
+	mmc-hs400-1_8v;
+	non-removable;
+	no-sdio;
+	no-sd;
+	status = "okay";
+};
+
+&sdio0 {
+	bus-width = <4>;
+	max-frequency = <198000000>;
+	status = "okay";
+};

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
