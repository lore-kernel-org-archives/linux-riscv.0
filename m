Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4ABC10DC1
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 01:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAdI90jl3u3Uuk1QyGjf5+CQexLO2UONwYw4wCCgv5Y=; b=NGhWHHtxgPxLQj
	DwU8yw8HC20iciRLjZZd6EaEhuHxnDOCYpP5wzdMy35eqSwSU44APLyvktvgwFFLnAcZM96/VX2s3
	hD4MLB8gG+5/dEJv9SOIPthMHrE9vITOImM6TIarDLJVIG+kxr/gjMRBrAKPbRcvnMfZAnAwYK0LW
	RwRY/HJp0TcnXe1gjCGCumzCZbpUJusM7RA+2CuohAwSAGe6woaMSrw6mYsZJu1DCQ66Q9FAveM9e
	YjOse3D3RmpRrkugCXR0gTEg3UVlUgyS5LPBIgl1t8F/Fozq1wSTeZe/EhR0XX2OJj+gkrDQHeX2l
	j+CC6hptvlzVGnGzs/Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8WBC-009i53-04;
	Thu, 30 Nov 2023 01:49:26 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8WB4-009i18-2l
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 01:49:20 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cfbce92362so12859765ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 17:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701308957; x=1701913757; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k59bvv7KTPcWcR0nU2285Ag1/kbZ0ckoH5XbjyM+11I=;
        b=H5dgWMTz8AkDFO1V7P4N6Q8Odg4SX5M8IJTXou7WjgL35kH3yXozDYgCSe4Ay3Ld1k
         P4J1swD2dXCt3WyAEwwPFjfVPeri6mwAEPdfSwzN/umnKrComzASGLYaeRow+ZWmoXtc
         Jf4na0d9/OwH2rt9NIIib3/iAyNakocuu5XA+3DYFyQNDrkFngQLtAO529a2AR6KoBUt
         J6hesMQHWd4FaT/8qsBJ565HpcE/Uv/spGSDMq5t07Iop632MTC4A4LVQxdj0hsPnije
         srVE+yGsDXl2c0w2pIecXxWdpLh0O1+ctTDqCU2VRyUjfrvcrOFNGa5ysWn1pZm9P7zE
         aFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701308957; x=1701913757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k59bvv7KTPcWcR0nU2285Ag1/kbZ0ckoH5XbjyM+11I=;
        b=Za0e26axFDjfwclJd/a59aoAzMOXpzlg9bGA0pWJuxRZjqW4JaNgZNmIYzwt6Bo6YA
         9mcb4Mk5L3tNrW8IsKTbRgB+EiHWhHty64rWakclxdTCPd/aqJ6mvkO+7OGOoYNCDmmZ
         RIbg/IRbF7Yyyj7cA+XrLsmU16IXSOTcBJ61jGk+s4p0jD3txROkZDbw0+2we0wMHlY5
         nkfYH2Azwg7PpjgymNhKfDPeu3CI8KiQ5NN9N553gyenGnnLi1ep/wBc+4yzwlMK1ieQ
         KkLDgNJEkI+v9qE0JAOj7GV1xnpXDUI0JnqFOqQkMgdpyRTRRAnDIQNcUHy/7pQvg4bB
         tvOQ==
X-Gm-Message-State: AOJu0YyzxyRyDfl4feX2Qlh8wE4xpJuzUOf7TsYXsvwVqpdDw4hZApLF
	QgDNcr0MVsnXlNEBWWNygAJDlA==
X-Google-Smtp-Source: AGHT+IFWN+veB1Lo+5WzY9Hv9vg6vdys4LdvUiI0HD+zQd1G2l7aZznMEfaQzC7XjS8ZH8qOxGjBdA==
X-Received: by 2002:a17:902:c18b:b0:1cf:b2a9:fc00 with SMTP id d11-20020a170902c18b00b001cfb2a9fc00mr21521734pld.9.1701308957476;
        Wed, 29 Nov 2023 17:49:17 -0800 (PST)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:9707:1e8c:3166:6a23])
        by smtp.gmail.com with ESMTPSA id bc3-20020a170902930300b001d00b0bd306sm24455plb.251.2023.11.29.17.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 17:49:17 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Date: Wed, 29 Nov 2023 17:48:50 -0800
Subject: [PATCH v7 4/4] riscv: dts: thead: Enable LicheePi 4A eMMC and
 microSD
MIME-Version: 1.0
Message-Id: <20231129-th1520_mmc_dts-v7-4-c77fc19caa6f@baylibre.com>
References: <20231129-th1520_mmc_dts-v7-0-c77fc19caa6f@baylibre.com>
In-Reply-To: <20231129-th1520_mmc_dts-v7-0-c77fc19caa6f@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701308949; l=1102;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=FNhPhUUvWwP+QKoj7n3Ul287CfcC/2teVzVQAZNIlgs=;
 b=dAFvB72xQtzNxvN94yqiVLj81s4pJ66+wqg02OfxeOO3TUhR9uDJUuRgzoq7/QDFIVK5ppXps
 jq6MzKvmTLKB6BxP95jRZ/iuxxpATqAnJ5doFXEx2wvG5WjZ8euLRfO
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_174918_916087_02CA06A0 
X-CRM114-Status: UNSURE (   9.37  )
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
index a802ab110429..0818bd3c1f84 100644
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
