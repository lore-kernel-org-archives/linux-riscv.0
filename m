Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57562E7D0BE
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 01:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23++ysZuPHR3lyK1+kWAhXngoLg7/pOyePXfYQBAjP4=; b=ySP9oC6T6ZkJhS
	XzhTZlSf7RN5rwLZniVzRyIEtmYQKSvbvk7tEBgLXwnaAAOD0gAzMdujPekM0mn9DoCVbnOlwNz1P
	+9IA4Ma6YNxN/bujKz0K33lf1uJpkJ/FhGYZ4DLAa7vghqVSDbIUGdKtmB4N4KgVko4NKYRUqtfmL
	ifTJykQbsEVfgXNdW2EL+pY2dIozv6NPW7JXJZh1b95LBGYvt3Nuq5FacMWX54UvzsoKdRe7sppkD
	Rzm0Vh8gOezHzHM+xrE/bX6gKykmp5G5G7XxMJJb7NFt1bPVug24yd+ZVPXg35mGIUiOjlbF2rrMb
	+38n9rxH8Sk0hYRRDPtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVKC-007adr-0W;
	Fri, 22 Sep 2023 01:51:20 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVK7-007aZv-23
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 01:51:16 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-45281e0b1cbso847690137.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 18:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695347474; x=1695952274; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cDyDoj9zqW3tb6f+dTciYYHXjkgtjjsfpMWk3ptqz4Y=;
        b=exupgGxvRz9CdCHbC/lt6mqVafuInZ8tG1uLLeRaBbhg9tYltiTN6XPsO7k9FDT3Iu
         MPQV1CYYJ+Bc575+29HAqeCzb0OH/TDX/u8CJsn7H58Lk5xwIcCEAZCqmVlWm0GkrG8m
         kG244BYSuwFG2RtrfYNLsCg4lxlPMhwMBAFqgVDdGnwagRDhqL7iinK6uE3pnc35mXxR
         j2XfRpM2Qkm7fYJPho0S2qwAYTFzR17u5FyMQ2IY3DVZk8TFeGGGayCAxcJF7j8G/ege
         uHbArsAnQAwWwQH/0gJ8JAkDSX2+2WPq6LWr37kuLDLbsXlF93iQDq1MBg/ugNo4Sfsj
         Saaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695347474; x=1695952274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDyDoj9zqW3tb6f+dTciYYHXjkgtjjsfpMWk3ptqz4Y=;
        b=TfHmYAW82THv6hep+7f2C2aiiQEB0U4M1vQL+LDZCPV/i0k8faUDKDQQK2aTfXLkpM
         AHkPhtpp/R+IsYolQuw/d8sz1wVLXli6U34U0JGlEZ5DfIT6qXI8IClXM46V0s3cJn9S
         086BtKiAilKQ+BCj+3Gu5lVSZaH8CPeEC1EeqUlW04nJ9Kd/2++wHW6aBXckDQg+nYNd
         5VztdROA0SmMrWT3/FhquAPhSGwseHKv2rUkRLOfOVVLVc+hGPWikhPZIOdz1s6Z0ABU
         rVnBT71ATJDC/bHEwTQg7MgAU4neAObDrd4YDeCGKltbALc1TJvzZyWa1IQZ4jdKtf6L
         ew5g==
X-Gm-Message-State: AOJu0YyMYobNhXMG1NkXbUIGx1p8t6V/n9mx+KYfFg7rco6icfwyMaPw
	a4msaEh+ViVSQD0RJa980WnZ6g==
X-Google-Smtp-Source: AGHT+IFXdS2JE5SAgxFGpk2JBdV0QiDMGOB+zNKqvG/7UuF33hvfFUA7v/UeS7e5AxcMQ4nkJcmsTQ==
X-Received: by 2002:a67:b911:0:b0:452:5798:64b6 with SMTP id q17-20020a67b911000000b00452579864b6mr7136727vsn.29.1695347474300;
        Thu, 21 Sep 2023 18:51:14 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:fa26:6227:be1c:67f0])
        by smtp.gmail.com with ESMTPSA id y10-20020a63b50a000000b0057412d84d25sm1973856pge.4.2023.09.21.18.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 18:51:14 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Thu, 21 Sep 2023 18:49:53 -0700
Subject: [PATCH 6/6] riscv: dts: thead: Enable LicheePi 4A eMMC controller
MIME-Version: 1.0
Message-Id: <20230921-th1520-mmc-v1-6-49f76c274fb3@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695347467; l=995;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=NVR/jz5zFITHdlX9LFGuP143Lx0/07lnI+f1VmxUhWc=;
 b=raxv8sdLi3NXEnuRTMoKuMBfYJblfB31JVKLCA7ZyLEQDTMFK0QMg4FBDAS1/RE2PwM8GeM9g
 37Bq/mEBjXzC14O3M2KIDYrOlsISgPYO/PybYfDJ47mNjxkGGIw5rgl
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_185115_674431_C0855C0A 
X-CRM114-Status: UNSURE (   8.89  )
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

Add properties to the emmc node and enable it and set the frequency for
the sdhci clock.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index a802ab110429..3de8ae0a4384 100644
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
@@ -36,3 +40,14 @@ &uart_sclk {
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
+	thead,phy-pull-up;
+	status = "okay";
+};

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
