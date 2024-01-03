Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76FAC47073
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 13:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BtKs7OJxL7j7N+zXpALyO57F8pG3UX1GwY2f+RlHTTY=; b=NnFi2uxXZoNNgD
	V4xpzxKtp7ehfqM5eGdLYNbALCDGkToOONaq7cVuFG09O5r3DhL1+5ecbXi1RUoEtzdH1RUxS7hbs
	PnIqm+AAeqcKIJB+0qc9arrY6yyMwCj4ER/ZVrJi11qjHUj2M8l3E91fOmq3JXvPsOnDx8SBOEDok
	0KM7s3ZES12PbpZ3V/6U5ngi603m7xwwD1hlA6DelgdAJuu69zmtBf+aa8zLhY2A51yX9I1zHgVKW
	hnTMGCdmkpDwLc9cTlQUDxbTFMVwOquvN3RrD7f6GEv3D7FE2pQ/dpu57g7JE+Nwl6hkeImMyNXA8
	Z8zmD+72/Eqb9oatfdMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1JG-00Awlz-1R;
	Wed, 03 Jan 2024 13:29:26 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1JC-00AwgK-15
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 13:29:24 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C213D3F5C4
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jan 2024 13:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1704288545;
	bh=Z6kJEMrEbGLyI1yj9sToUKHZA2SkNTvsj92LWdDmHKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=WPkkZHrzBYjqFRI9k7bpz88HNGn6b8NMOoYZLRsLvCEeT56tMzE5hyNW8TB2oCNRo
	 2Ge05U5YIp+jClp7eXFRRCpsLmBo0O1hYYNETFb+PGGqDBPaWyndpAhjTk/KFw0xGn
	 vGPMuR/XZrHXXOGD4SdkItuZ1c38si1c0Ad+gMri1OkgwSTXGY6rtk+BRtq+CaHvPS
	 P5fy27sLbh1k0UiBlRKqExF5dko4LtkRzljC/zhAzD/ZMBv7MQXs8TvJIR5qwRJg3K
	 Ipi09Te5VaewVxVpKKGvzMLJFGc/raa+F0RfFsvtrjlEd53YztTEnZUmIWBg1oKxei
	 JBWm1FauKTj1A==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a27fbc65b20so116137766b.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 05:29:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704288539; x=1704893339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6kJEMrEbGLyI1yj9sToUKHZA2SkNTvsj92LWdDmHKU=;
        b=PGfVmxZ7k3eYfBCZ6WnBMB/nzyWojjYNWP4aTtlDtgdvM1lgNvZBP4DRxkgiV7P3yj
         0ldL4wGdl8FMNToaC5aaJGtjniFaph+UZwpGwhx+tNV8LJX/179PN0S6sF6+5NOZaqRq
         craeO1v0319X3AfjbVOR4FMmFtHhQ5VbMwglPRVvtHAVD7hId4j2q1JPUgotAJQlFWhL
         SEFK252O7JziOKYtUI+4Bi/jdyShQhZP+G+8zLzeb1b0eEDLzK8Ag/leaH/uxrrIXmDM
         mv8hQAzyqy/9oLhkthb8msJ8cDfVeUmZMsWEI/HgXcUNv4LHxg/gcL1IRW6wud3YbZWE
         JDRw==
X-Gm-Message-State: AOJu0Yx1opqnUPKIOWr7JZgkc4Xs8ZX/YPRZqcyyxUcl4BE+BXaw5WHz
	EjowE0afGlCvAt75a/IzLT4irvXZNV7cWucF33x8i+eg2pWp3Z/phrmMADz+Xmk6Z00RwEo/csp
	I5/JZ/hzmuzPDSUVJMBhPylAKKr1Q4mpUxCG5t3XuOV8enO+QWUDQ
X-Received: by 2002:a17:906:3cc:b0:a28:28a3:89a6 with SMTP id c12-20020a17090603cc00b00a2828a389a6mr1880016eja.54.1704288539860;
        Wed, 03 Jan 2024 05:28:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+dUglk3qywpv3HLiAtpq5rTNNTGkv6sHrUH3Nu8K83CpFHOwrW3TADKmgsLV6w9iY21gf0A==
X-Received: by 2002:a17:906:3cc:b0:a28:28a3:89a6 with SMTP id c12-20020a17090603cc00b00a2828a389a6mr1880002eja.54.1704288539708;
        Wed, 03 Jan 2024 05:28:59 -0800 (PST)
Received: from stitch.. ([2a01:4262:1ab:c:5af0:999b:bb78:7614])
        by smtp.gmail.com with ESMTPSA id eu18-20020a170907299200b00a26e53be089sm9549873ejc.44.2024.01.03.05.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 05:28:58 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v2 6/8] riscv: dts: thead: Add Lichee Pi 4M GPIO line names
Date: Wed,  3 Jan 2024 14:28:43 +0100
Message-ID: <20240103132852.298964-7-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_052923_131424_C0D4A522 
X-CRM114-Status: UNSURE (   9.52  )
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

Add names for the GPIO00-GPIO14 lines of the SO-DIMM module.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../dts/thead/th1520-lichee-module-4a.dtsi    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 9865925be372..f674e5acd0f9 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -37,6 +37,45 @@ &uart_sclk {
 	clock-frequency = <100000000>;
 };
 
+&aogpio {
+	gpio-line-names = "", "", "",
+			  "GPIO00",
+			  "GPIO04";
+};
+
 &dmac0 {
 	status = "okay";
 };
+
+&gpio0 {
+	gpio-line-names = "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "",
+			  "GPIO07",
+			  "GPIO08",
+			  "",
+			  "GPIO01",
+			  "GPIO02";
+};
+
+&gpio1 {
+	gpio-line-names = "", "", "",
+			  "GPIO11",
+			  "GPIO12",
+			  "GPIO13",
+			  "GPIO14",
+			  "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "", "",
+			  "GPIO06";
+};
+
+&gpio2 {
+	gpio-line-names = "GPIO03",
+			  "GPIO05";
+};
+
+&gpio3 {
+	gpio-line-names = "", "",
+			  "GPIO09",
+			  "GPIO10";
+};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
