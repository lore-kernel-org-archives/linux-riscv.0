Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62218CDB484
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 20:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcakOuUWWBEjbA62cWOwtGtfrgHoQ01TQ4vI3eWuBfI=; b=HnT1Rxub5u45wx
	HU0gQRWWacSOZOHIoQ7/8EOdTIQ2B27MH5aFKqw3Ie+kL0FMBkx3xzLIFg/e6Rv07cy7DyGscGVSn
	DLR9TOw9OeTJSGGWe+ua99ntRA2vmWRh7pg7VGjgxyyvlgdMVt0kzf0mu+m6qsmgO/KGB1WIjIk3h
	00BrMYjq+vwWD3khNPtfBt4BAUzHIVmYLhz9Eod3bDfciv9aakzmCZzbh+oRNnJN7iCqZC7ZPSvpY
	LL4lTjmz2N6Vtl2mtuRu4L9C3JjFyEe2iz1Yse9ssuGaCdtOajF3B4xN17Q8mVN01wq1IlqBe140C
	Q9KEh3MYqTC2CT9QfpPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsqwc-00DE7N-2t;
	Tue, 17 Oct 2023 20:45:38 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsqwa-00DE46-0h
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 20:45:37 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5aaebfac4b0so2828441a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 13:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697575533; x=1698180333; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNiz/16GiKwF18nTvqrbS8bwq2F/L9RlRg7oWtEwZWs=;
        b=S/xv12dGMPrjA11jf3iSesTeMhsM29h0QVP467XgrHdnNhLCWP1mbIZEyEUukQRMWk
         hYMEmBStP5SDf96HnT5cV/9tHvRK1BTJoIYyWcK7XM224kDChhevsP4BnDmQ4s6mhzj9
         0kLBsFdwJBs0Dfjnu3v6A2NTb68rUd4AtamhgAnVfPyNoPkWBj/2mmg2X026+kAlo120
         LB4w9taaCwTlx7+4nls9/YpDDWUiwy4J4B0QGsG5n95G8G+Q47BacQuZN8ZeUA9MIGar
         jitZoeifuTxb68jjwyPSMcZyQec+L2KxUB1IX2bQzaSRvMAkHvqQi1XIub08fKauxKwC
         ytag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697575533; x=1698180333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNiz/16GiKwF18nTvqrbS8bwq2F/L9RlRg7oWtEwZWs=;
        b=xE62dm7UPUiOctt371q9Xjlj5gfvj81I6fz/Zc3Tt7EbkntwhTLwjyVtF71Tgw6ub2
         QZmU8cPk89gAPw4u8nOSSGPdSNq1mhnh4PM8GpdiHrnbtf0AAanJlSKGp2DrIExR49au
         8/jAxkmt2s1Cq+BL65zfeR09Pi9OCpU6i+E27SPTBKUn7BqfgauzATBeyme2EcuiG+yK
         18lXvBTsZn8pPKv+PPY1K9mlzYtRqC9/uKJAX+3GuA5JwD2oGAfiwyWB5MRmb7j18UdP
         OhfhZ+bx9Er35JpSMjcvnmyyIibLdzBXrr8MpFs28+ZPE0If99CubAkOg6zxoOLE9B5n
         moxg==
X-Gm-Message-State: AOJu0YwnTctB92ZMLSSkU909CSxZYZlMbaRGLVdfohVB5acE5GVW4fkc
	U54bjgG+jYTWFBUE+s9L7U2AdQ==
X-Google-Smtp-Source: AGHT+IEnhSQy2mXL6KTfLBhYz1ApnwfXeWRnJ9dLuptY6RRHFhHrPL3MUgmW3VKl54Wgp6BUsyffSQ==
X-Received: by 2002:a05:6a20:7351:b0:14c:910d:972d with SMTP id v17-20020a056a20735100b0014c910d972dmr3485455pzc.12.1697575533216;
        Tue, 17 Oct 2023 13:45:33 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:51d6:dcd6:63ef:52e9])
        by smtp.gmail.com with ESMTPSA id w3-20020a17090a6b8300b0027b168cb011sm1906553pjj.56.2023.10.17.13.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 13:45:33 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Tue, 17 Oct 2023 13:43:53 -0700
Subject: [PATCH v2 7/7] riscv: dts: thead: Enable LicheePi 4A eMMC
 controller
MIME-Version: 1.0
Message-Id: <20231017-th1520-mmc-v2-7-4678c8cc4048@baylibre.com>
References: <20231017-th1520-mmc-v2-0-4678c8cc4048@baylibre.com>
In-Reply-To: <20231017-th1520-mmc-v2-0-4678c8cc4048@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697575515; l=972;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=fP0X7H2ev/K5EsIr1ajuR3Wl40rAHHxMMZR5DlF6EQU=;
 b=zzNGRi480ZBM5jq5QFMXYG/fMcO+yA74L+HUirBBNxAziVp61WiOPvolxmJJ3FfkTdUEllXn1
 T0Hl+mS034yATbcHCEq3lYgVdwBJXjkOiBymPsItzNlzSLVMYbyYY/L
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_134536_256028_4B965298 
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
 arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index a802ab110429..bc8f111571bc 100644
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
@@ -36,3 +40,13 @@ &uart_sclk {
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

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
