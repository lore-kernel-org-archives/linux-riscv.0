Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C48C04FE1
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 03:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BhUnHBFsU3rTzNm6gF/wNvDz6X6Z+rC1na2KexTR6kc=; b=D3u1649KLvApTw
	4IrWT2AY6irELHxR0/bf/M4TGa7TvhYI2AwYEvwRo0rxHgQ566MWPqAFCgw89t/psBVdEpVItruH/
	i29NR/Db2P97naDS5mHmBTCJ1KHuVoRkKBDbg2Auu9GX47VT+e5/MsAgph6zTGN7B+nvQohFXyU0E
	LjsM0YC29cGur/vSwC6j6hcpk9a1xbRL8KHRhSuGqOIwTXHqQ/fyKrtTBvbtj5ZbSLlV5HWrOUvIE
	cKdxshtyrkB8M9ZYccEhu1amzNrENCdEujC3yJT5X1FZpAeNEtteU/l/dHaufY+j1XC+iSsvP/902
	tjKr/udOx38GR+B8lo9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS7lE-00DcIX-2h;
	Sat, 05 Aug 2023 03:15:24 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS7lB-00DcFj-2L
	for linux-riscv@lists.infradead.org;
	Sat, 05 Aug 2023 03:15:22 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-56c8757d45bso1832031eaf.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 20:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691205317; x=1691810117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdRLfV4DSjo6NuAp3G0Z9YBsmLluT1U9pYT+QCm2Ogw=;
        b=Sirb95geXOpdF+w/pVzPoQoiCURDTSuciOvn/xUei5K3StbbKfG9M9SWWEJA6J8KXW
         2Pdu8HvmQP+5V+NXfwzERYjQ7of36NJWN65NM7hwyB1fdGhyXt2V2nzzPNo7sc3dKOUj
         H9ETNR/cjSxuMB4y9dkfqhV84Ch1c7BEnDmaWD0I8kXJ/r6kvINdyrx1D97Aw7kLMlok
         1FBUpcFV0j54uWg0DwZpQAeAU2kgJnCz+3GeIEKCC6l4QckkNfOvi/klhWAZ5/Z+UpGz
         RQG+9MdYLIa289mgJtDhKk1PhXLXDpk7FaRD9y0QS2xEhxi0Ee2vHnOVwB15DQyy7ZSu
         l9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691205317; x=1691810117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdRLfV4DSjo6NuAp3G0Z9YBsmLluT1U9pYT+QCm2Ogw=;
        b=AjCYZmAqSqmTjK6pm5qoQfTFmP9J5mG4kcbW9XbxI1yBFTDBh6glpjf/J5A1GhupW2
         T+MLXEc3PQeBfeu3UIbEtp6W0bJybHpaEIhrSHmYPHQ9iggzVhea9vVTWpL2Bs/UT8rf
         zxeWCFS6HAAWK6wL/2UgC7A8oaDY+xqX92pPXz9vkYMzEVegynnfHy2L9DR5SYnO1t5Y
         Vkm6+g+w+RhrD6kq47f4RnSbp5Cijh5N/4QDWR74pWLZsuNSLEobalZqLGOpGi8Z+sS0
         kXu9JPVSAnA6kbzloFeggYwUty3ILvG0NYZ33XQMzT9ygATpf+1Eck+pdbskR5A9g6pQ
         pbcA==
X-Gm-Message-State: AOJu0YzfJ94CX1zvVmh7D7nhmPwRHXKDUqoFMNaHyFQ+JMOq8eaF9a1E
	ItRaDiUeGQL0YRG954OJPFwfxg==
X-Google-Smtp-Source: AGHT+IHzW5Dh9evbuaAvm6UO7LWse/VuKTkLwUY6Eyif2RtvDcFf9wUdYu+dWABgQoDwdkeE2gAtHw==
X-Received: by 2002:a05:6358:5284:b0:134:c682:213f with SMTP id g4-20020a056358528400b00134c682213fmr3883804rwa.31.1691205316886;
        Fri, 04 Aug 2023 20:15:16 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:e1a0:2f9c:e6f9:e66c])
        by smtp.gmail.com with ESMTPSA id h17-20020a170902f55100b001b864add154sm2412145plf.154.2023.08.04.20.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 20:15:16 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Fri, 04 Aug 2023 20:14:47 -0700
Subject: [PATCH RFC v2 3/4] riscv: dts: thead: Enable BeagleV Ahead eMMC
 controller
MIME-Version: 1.0
Message-Id: <20230724-th1520-emmc-v2-3-132ed2e2171e@baylibre.com>
References: <20230724-th1520-emmc-v2-0-132ed2e2171e@baylibre.com>
In-Reply-To: <20230724-th1520-emmc-v2-0-132ed2e2171e@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691205312; l=980;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=fq1uqgjhziV70k9ct30okgNDov04CSkcqVTv+e1VQgM=;
 b=xot9eapxH2cUSYpXQoibI8Z4Ff4UD4GK5A3fDmYWMiila2+9XbnG2Rse6zZNWn3UKb70c0va1
 AiqYKQdIC4iBvQL1X269HN0jdo6Y/rlkz5B+PqnyS6gCAcsFHaH9S3n
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_201521_763885_80DDB750 
X-CRM114-Status: UNSURE (   8.56  )
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
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index c315e5bd3d2d..f93c11754639 100644
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
@@ -59,3 +63,16 @@ &dmac0 {
 &uart0 {
 	status = "okay";
 };
+
+&mmc0 {
+	max-frequency = <198000000>;
+	non-removable;
+	mmc-hs400-1_8v;
+	thead,io-fixed-1v8;
+	no-sdio;
+	no-sd;
+	thead,pull-up;
+	bus-width = <8>;
+	status = "okay";
+
+};

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
