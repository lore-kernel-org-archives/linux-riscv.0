Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D511BEB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 01:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3B9bewMV6kDI0tWFKZmSoG2zFuS0UkzHCir1RMhQzo8=; b=ArAP07nebYxOjR
	bRS1BkYIFfDGG1vVSAXTklI7MxOej1Eum4BkDOrLvcZzy6+Lxb+XtdXDAWzJjOrDBXoDQAoEfhALB
	oFU4vgFv5CCXO4NhYhIbAoT0tXtLeJVbf89vgE972XLkdz3ALKYit/Awgqn6ZLCHHdmuEbsDHHqYn
	GvRFUltyvDeBXLErlGCPucSSAnbPpM/g6g78N/dNGkK8OwkjqAj4aSDKtA9tuIEVmOFB62V02JbUX
	i3Jd08gYMekcWja7MM9s+wJ9dR/8/1PLUU5F0VOlgikgfoKgXBYpItz5p/DFP1iPU5rm93QcXcnAd
	7GrNt0N3JiQTKVF+ar5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO6Q4-005nYE-1i;
	Tue, 25 Jul 2023 01:00:56 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO6Px-005nV4-2I
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 01:00:50 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-55b1238a013so3513267a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 18:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690246849; x=1690851649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ll0Z6sPfoNlYpMsjwTyfIvK2krIfZa7HiWUCwQnkPdA=;
        b=Qu+lOJSyR4OxlZZGUVqXiRX+LDk5oh9uv+g4FjzcapO3UEOndSDi8uoP6AxzAt/ZO4
         AnPiggOfo+Jl5RcIG6rVXHL88EDLcI00pdFfoaY/Eyyr324sIbdNaxsKTCgCRLcjY+12
         n3xOi+AaqVDjPL0tlC0crgKrr/QEZa7VTXtt7S9SEFoDpRyK9LTewNotXjx9i1EXyMVc
         A2K/NMAUjhM1tWw7P4iBY8fdfQebIk9f1MgGceUiwoWnWtnnA6kNj7x7cRHvX/uJGFVx
         JusGpwjhrPq4RjJpng4h7XkiaKHWXWTjm38FPi8G/RpJMC6u2cNen18Mp+I3DCTxweyn
         3onw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690246849; x=1690851649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ll0Z6sPfoNlYpMsjwTyfIvK2krIfZa7HiWUCwQnkPdA=;
        b=fQybRSArRMwRIuSAjtiMpUhzbyPpiuP7lQz5fcyWCr+kfC2LAboVLzk2quHIqlRVYG
         lhLfFw2gNbXX5UupQRuGRBu7LtKDIsKy9Oatd07RB5h1JJ0rkvskLbu66P/MH7LE3ns2
         hGJ+UZqLRbW/5GchUV/OFHeeG+B09Fq9H2Pn2ebtjmJEQuDhWmRqs4oJ6OIb4jwpsSdY
         X8MGtUYYEFwbagWgGhEHaHBQ4898Mel4mh0l8xsZ0sSR9crux3Z4+DWCBHbBQZDwUu5M
         QzpMznT3SMaoNzVEG5VMVa4wnQHK1PhoHknU5K0bMij6nrRui1h4KhfAr41hGqIRtVV7
         nn8A==
X-Gm-Message-State: ABy/qLaG9Uqtp9ghTCb0Y3n3H0Mo5b4vg4F3FH8zSh7xEQgHgwgn8QN8
	8DphpKRXtDaOH28bvNBo5Lg6PbFh62n1IDnwSF20uw==
X-Google-Smtp-Source: APBJJlEJfbDJNH608pWUheZz5f97FYPk5RB/uAh2UtiLf7o4tdIdOe44w9xO37Xlj4wo9DuSj9jq8A==
X-Received: by 2002:a05:6a20:12d3:b0:12f:bc36:4c67 with SMTP id v19-20020a056a2012d300b0012fbc364c67mr15897632pzg.61.1690246848782;
        Mon, 24 Jul 2023 18:00:48 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:2cbf:9196:a906:e222])
        by smtp.gmail.com with ESMTPSA id h18-20020a62b412000000b00682a75a50e3sm8576900pfn.17.2023.07.24.18.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 18:00:48 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Mon, 24 Jul 2023 17:59:17 -0700
Subject: [PATCH RFC 3/4] riscv: dts: thead: Enable BeagleV Ahead eMMC
 controller
MIME-Version: 1.0
Message-Id: <20230724-th1520-emmc-v1-3-cca1b2533da2@baylibre.com>
References: <20230724-th1520-emmc-v1-0-cca1b2533da2@baylibre.com>
In-Reply-To: <20230724-th1520-emmc-v1-0-cca1b2533da2@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 Robert Nelson <robertcnelson@beagleboard.org>, 
 Jason Kridner <jkridner@beagleboard.org>, 
 Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690246840; l=933;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=vzPbiAqekRJrMwxZ/WMGUL3NDV27jNZgpcUxGuUx06o=;
 b=mnelfhkyum4sqvxQ4+7or/rnFxuZiOWaKusz28UsOyv+ffJpB1LIb1d/3yMhoePbv89hmvonH
 cSBi299EoneDiFg4Z7DO4In9ih5HiOMUBSPxPdlO+rJCS0RH4MHJTJX
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_180049_750658_2B335F6B 
X-CRM114-Status: UNSURE (   8.55  )
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

Add properties to the emmc node and enable it and set the frequency for
the sdhci clock.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index c315e5bd3d2d..140f5d5c8c97 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -52,6 +52,10 @@ &uart_sclk {
 	clock-frequency = <100000000>;
 };
 
+&sdhci_clk {
+	clock-frequency = <198000000>;
+};
+
 &dmac0 {
 	status = "okay";
 };
@@ -59,3 +63,13 @@ &dmac0 {
 &uart0 {
 	status = "okay";
 };
+
+&mmc0 {
+	max-frequency = <198000000>;
+	non-removable;
+	mmc-hs400-1_8v;
+	no-sdio;
+	no-sd;
+	bus-width = <8>;
+	status = "okay";
+};

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
