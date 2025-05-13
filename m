Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1526AC3ABC3
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 21:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXJr0LV1XQeecYoWAchCfKXBjvEcN5Lrg2YhLjO7qsQ=; b=k7GcADWtMlGRKy
	fd3hR39mthDa3oUzVI+FJ15zjcKo+9r1elR35eWgCWqatPeVYdk76ojhTBVeMCUjlr7SwgGJUJcnA
	c5cxRHChcuOjGnYFLa7/Sz1yRcMXF3SxhUuM8uM+26LKQtxgz+JG0668zNwENypnLVCSKlF2cabFt
	wkuVCQ8bxU4e3kGDmCjE7xMZ+sd4693TN62FI1Kb9/0AvgLx27+yIT8YM2K0DfD4wCKLkEm1dW5WU
	nDn1hYmo2WlKww6JgtOl6Iy5BOIWVfaRXkEvA1agDfzYltASkdBYUcHx1iTYTni5HQ9LFf6KOnaCR
	Jpe7rUGYnoHAHp5d6lXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExaS-0000000DbLq-0FPz;
	Tue, 13 May 2025 21:54:56 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExZX-0000000Db75-0Nbv
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 21:54:00 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-85d9a87660fso640097539f.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 14:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747173238; x=1747778038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXQ0rLrEsZDkkO0xDOFrK28pA119DtQt4oQHk7dYEkk=;
        b=sY24tgtD8yWTik9DqCfMRTLqEaXWwJz88bH6Rdy5AFMcpDLD3v8J0hyfuWPp5bogC5
         uI5tTqX1I6MWSv+KieenvgsiC7FtRGuvlhAmh5a/luek7Xk629AASbnLNaP/nbMzEVZq
         O1vGfdNQA7d86qXFj/T6QERBQ7gYC2xCrkZA/uk7hgUm8bM8OODcZ0iCtv15iUVfbCVT
         RemZwvTLhmINCwrRzjzsY4cgPnG4U+mI+yGQoadiFun0RAHQM2uygWe5nnypZU6jQIiK
         xFHKnasCpodAdb12W8ZOqMWsefZk8p3Ne6My55WDUW/WqKkauyZdCj5EChTxUPaUq86P
         /ulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173238; x=1747778038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXQ0rLrEsZDkkO0xDOFrK28pA119DtQt4oQHk7dYEkk=;
        b=OO7wbgpflRirxPfkYtVfwFLBUw2xYh2Vfgh2AugVjjtAZ7cJXBKTIjXyZd1fidpuAn
         ZExQUVkbI2d/Olkh5InuPpjnku5Cf/d32JzlCE6JrbWsAmSayR/vH5JLwSDny/upRaf2
         sxYKExBEfNCKraOYxTpKeWtojQCLaf40b3co9s9QKYpi6caWOD0szwR17CE0cdDlkMx/
         7u67I6Ce9VrUBV3HKpx5oZPgUbGeOGpMgBvxtFD2t+MY6LiGtW/dprx23VyJ2eA9CR95
         VX4ZCbBidvpVeO4gMpsnk2NXNm8F/3ifwN5glc3WxZSTMqCePWR62LhTAJ9OFwUNV1Tg
         kVEg==
X-Forwarded-Encrypted: i=1; AJvYcCV13fWEDWYfqtijvL7yfdoF1tjDjGLQsQ2qN7yi+TH50I8vzxS/Ks1R3qd4BwRJUY6velykt//kKPR+Pw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxajBZxe/Ki2XcOeHykSZ48Nl/Hkk9+SCmtrjp8whfvSCmOvkHx
	qtHAqakdT3lbJ22uPE1hKAAmUrZk+baHoYZuhcaDVTvANg3mG6LhtohX5FspQqU=
X-Gm-Gg: ASbGncv4fTqDEjzN0IX6y0q8DRERgSL0SGWQutvs1tc4OxX1GqfarXbHKVJW//UbI+z
	R47KhsP1kHfqZ5zfwQTG091gdm+H2v+cS0ytVi/VDrkswNDeHKtVzdvDHQzp2WDNAmYYVyLEvUe
	smaXjGiVZLIpCpu0pUo0g9iumiKZyhxOtCSZ4AjL0csjVMuZ4+BuKfUTJkvNxpxyugavXqk0kTN
	5YdYM7YCYvXBuFOhQEGp4YtN22otVTc9huC4Fc9YdHjS8FYZB/dSuF8oD5QP3wRbTcg6EVur1X4
	8PdsMCGuKltL0XWi/OU05TcLI781/8pEk4m5Ux9O5DJyxA2ZeUwRKuBBs9rYym/mX/dehu6mOog
	w8r8Lwc8GqgbU+1vFvLHYbeu2
X-Google-Smtp-Source: AGHT+IHAidM+Hnbk1eCF9zik0cgy840UdEyeKKKxABRP4OWyRlKVuC+CHVe97np7fF3lS1j5FvMYHQ==
X-Received: by 2002:a05:6602:36c8:b0:85b:3885:1592 with SMTP id ca18e2360f4ac-86a08e40afemr117157839f.10.1747173238154;
        Tue, 13 May 2025 14:53:58 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-867636e0dedsm239622539f.32.2025.05.13.14.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:53:57 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Tue, 13 May 2025 16:53:44 -0500
Message-ID: <20250513215345.3631593-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513215345.3631593-1-elder@riscstar.com>
References: <20250513215345.3631593-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_145359_130336_58EF2F5D 
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

Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
currently support resets but not clocks in the SpacemiT K1.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index c0f8c5fca975d..de403bda2b878 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -346,6 +346,18 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_rcpu: system-controller@c0880000 {
+			compatible = "spacemit,k1-syscon-rcpu";
+			reg = <0x0 0xc0880000 0x0 0x2048>;
+			#reset-cells = <1>;
+		};
+
+		syscon_rcpu2: system-controller@c0888000 {
+			compatible = "spacemit,k1-syscon-rcpu2";
+			reg = <0x0 0xc0888000 0x0 0x28>;
+			#reset-cells = <1>;
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -553,6 +565,12 @@ clint: timer@e4000000 {
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
 
+		syscon_apbc2: system-controller@f0610000 {
+			compatible = "spacemit,k1-syscon-apbc2";
+			reg = <0x0 0xf0610000 0x0 0x20>;
+			#reset-cells = <1>;
+		};
+
 		sec_uart1: serial@f0612000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xf0612000 0x0 0x100>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
