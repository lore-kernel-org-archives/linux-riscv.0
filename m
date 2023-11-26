Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD83C07CA9
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Nov 2023 23:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eff0RNjirdN7lf7hRJ+kAOTnyUY9S55v1IeMqCMEM0I=; b=1r8aDKuDFKRPVR
	jn4Nm/4jpwZwoEJmHaBlSmJe+qkFLXf4eykbQdGf7YSrh1RVjbmYKr31SCk+T3pSKFm5rwv3Ykq7k
	/kYaxHPKYPFjttrgmy9EfbFnuqH1V6zXbSgs5QnYIHld4SRALmxVtoPVEPAnF/Ssi5eojUf+JQoLr
	U5w6cW3hSoKteoXualjPo08/Gnns5H2TWhIeKM/nvZP/SJrIWSWy6CD9LLTfKhgIZXwOtp0oQ7SoI
	q2YnrSwmpHI3xBk3fJJFC8D6BxgLbDLHc+ZSjShp8X4oYRX1l2FMZ91GJa/puOZ4dL4n5QrKu4Q2I
	PwAUswpEvpAjA50m2jvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7OYS-00GhY8-1p;
	Sun, 26 Nov 2023 23:28:48 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7OYM-00GhRu-0p
	for linux-riscv@lists.infradead.org;
	Sun, 26 Nov 2023 23:28:45 +0000
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2D7FE406D3
	for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 23:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701041320;
	bh=OuMn6YJcnYA0SdFjV5QIvrMlS1FQMrQ/PHdRB99f0NE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Y2bwiN7j7dtbM7Pnt4JW7uaZzTPowVPyIQxyES7AmEcWDHzcD+/rU9jZtYN/7Z8uk
	 TGS8mSYbWX31CFp9Z6Hbd+gzokDHAjIEYtJRYF0GPsRsVzqF+crVpChsIw68Z8UX9P
	 L3qRzytn+aM9DHxNMq0XRPSvM7IgIjnn1BL0Vp0l3+CdteULZ6dDxT6CmoTW6M3ZXS
	 XjcRxuwEZqNA2pmG7r+RF7jXkjESjWxpLoDL482leXJoq3TuIJHUv3g4I3TQZbjwC4
	 GZbdh8t6mZE79Kw9pW7JkzGxRbwZV6TFEZzeNArvxlLLj6Ntsx5SQtOrDJCMmihcy5
	 W0akuWCXJpWJQ==
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-285b3dd68c0so1662842a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 15:28:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701041318; x=1701646118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OuMn6YJcnYA0SdFjV5QIvrMlS1FQMrQ/PHdRB99f0NE=;
        b=py4eWSKcBHxBPxwxspAahx/7ZX2g2QHkYTj8g0DBUqD2UdzJX/SxtovCn8m2/Ae49S
         kPY9DYvWuvMWULNBU//rXhLjqq97aLBLOsPp6t2e2GwxyHIsNiyJGbqbkrXEAXlj5CKD
         VdH6pLiGSbQDF95Z41qfZtW4N3FOOd16CR4VkptlDWLMx9JJbn3o31EjB4YpmqJzNYLW
         m3NLs+3F9l6YbFWwUJMKNCOVsaWxsWDOmPrHUA5rj4J05RxRiJhrs6Zp6I016AfKEqeF
         TZ4cYHzjKQTa2926ZINgY8dIwYMadoQ8oksuXS3wqY6eJ549eXCA0JDDelmm3rK2z6yI
         1Gzg==
X-Gm-Message-State: AOJu0Yy1nEhCt/PgvIitH+aEb7h3cUkGoYIq5IDn8Zby59S3WH/Uvdac
	StNZUwIe03GJJ7Ix/v3GeZP4xSwxSyegUZdD6Lt5gFFrYt2JAfTwGlDnGIFVrWgWtl4VceZQdEd
	13IF/Hun/RayxgsnNoRF60vuzhZt/RgksL3kXz1y20abZU9X+tZtajQ==
X-Received: by 2002:a17:902:e80d:b0:1cf:b56f:5359 with SMTP id u13-20020a170902e80d00b001cfb56f5359mr6002919plg.16.1701041318487;
        Sun, 26 Nov 2023 15:28:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJoOhGmXHm3ZFgs42HkJ4RCFLyzcurPDAEjQybVEulGwZcrjrwFmdT8LY5fG5jxKouwWX+bA==
X-Received: by 2002:a17:902:e80d:b0:1cf:b56f:5359 with SMTP id u13-20020a170902e80d00b001cfb56f5359mr6002901plg.16.1701041318277;
        Sun, 26 Nov 2023 15:28:38 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id y10-20020a170902b48a00b001cfb52ebffesm3123853plr.147.2023.11.26.15.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 15:28:37 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/8] riscv: dts: starfive: Add JH7100 MMC nodes
Date: Mon, 27 Nov 2023 00:27:44 +0100
Message-Id: <20231126232746.264302-7-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
References: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_152842_558276_71E9192F 
X-CRM114-Status: GOOD (  10.36  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree nodes for the Synopsis MMC controllers on the
StarFive JH7100 SoC.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index 0cafac437746..c216aaecac53 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -178,6 +178,32 @@ plic: interrupt-controller@c000000 {
 			riscv,ndev = <133>;
 		};
 
+		sdio0: mmc@10000000 {
+			compatible = "snps,dw-mshc";
+			reg = <0x0 0x10000000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_SDIO0_AHB>,
+				 <&clkgen JH7100_CLK_SDIO0_CCLKINT_INV>;
+			clock-names = "biu", "ciu";
+			interrupts = <4>;
+			data-addr = <0>;
+			fifo-depth = <32>;
+			fifo-watermark-aligned;
+			status = "disabled";
+		};
+
+		sdio1: mmc@10010000 {
+			compatible = "snps,dw-mshc";
+			reg = <0x0 0x10010000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_SDIO1_AHB>,
+				 <&clkgen JH7100_CLK_SDIO1_CCLKINT_INV>;
+			clock-names = "biu", "ciu";
+			interrupts = <5>;
+			data-addr = <0>;
+			fifo-depth = <32>;
+			fifo-watermark-aligned;
+			status = "disabled";
+		};
+
 		clkgen: clock-controller@11800000 {
 			compatible = "starfive,jh7100-clkgen";
 			reg = <0x0 0x11800000 0x0 0x10000>;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
