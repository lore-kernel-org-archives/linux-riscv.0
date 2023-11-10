Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6544CC4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 05:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uCEy7fopG0vLuuN/IuAnIvORB0BjanUlKhCC4o7Lzp4=; b=IvSD5xiVA9f7os
	5dLmA8HfKwmR6nKYs1x3SoaTy33Rp5fruF7RjJvIl6O37Vc/9RXwEbZcZam08kDyZovENgbIXdurY
	pI4qQwmrrgEOk/7Y/J3tL4i5nAVoTM/WVBQzNaTxdT9B0y2nt4pVMWqbJbFt3SiYq5Xhy/Z2mixEc
	54ktRlJBRjiyG0nVrF0sof7EOh1AciX7xK/0yAp48OeBplf/2lCLDiM/Ave6P32sNxQm2qjAPslZg
	x8PkBSUHVb8oLFwAhWThx3D5TigQMPOo9szChE9/kbC2QEQUT6+WPJetuBia6ixXyxw6s2FJZYfGE
	o2TBb9PWRFa/hQ27A+yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KHx-007u8U-0b;
	Fri, 10 Nov 2023 05:42:41 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KHu-007u7M-1P
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 05:42:39 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6cd09f51fe0so992275a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 21:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699594957; x=1700199757; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSa6NAVY2VMgd1nmwOwphCO64qKVXCiZUmGbVj1XUeM=;
        b=CrbrdPKCOLAM8qlCirP5i1FRHCjWL0zIuaG+o/6w35DJOP5Tthg+uBtCruKTUwdvpz
         Cew30M22fFioU9CuFALFKGe4zgvyBz2b8n+sQ7l7oUyfT2ovJF1MblQ6hFJjLNAqW4rk
         mAK2w9BdCBr5POI9hbttUpkQuoRRvOWstDXzBU1RyOKU0lBz+mcF3C3DVY+3Bj7BhCQI
         bqMeQ+5sx49KuUXEEB0KNrUxa92NYGDOHaKey8/4UTL7S4IZpDSzmlaxeTypnX2IOOvI
         4xACGcb5mV5i9FyQfqkZ0eubjQI9lk2VPw+IoealoNuAJiF/aPqyKHXAwL+YB7L9qT5P
         f4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699594957; x=1700199757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSa6NAVY2VMgd1nmwOwphCO64qKVXCiZUmGbVj1XUeM=;
        b=ALPNPkcsGWEQbOCdOog+HC4EWT4BXca+loP/j2Oa1xwCOI1j/hMeMyWCae2VddAar3
         uhHTPUmxrR/qXrUvx2k6C8Chw+sQenSnsafQVwajoyKla3EtwzpR6Z23LdhgvBXA55IZ
         PuJUXeCsuPoGF2DWm6yz2Piw/wbAAYbVKYFASbudPc1ACdxNRUjjUbQUt4ur8mjff6y0
         3IPIvG4aE3dhvMg6q/STQzUNoU6YXVnIct8/rZhBTPaXt+Sf0UjngryCamt3pBvsXtpP
         gbAgLDf9GR7Uy6wtfA600tqW98Ltisrfj/N7iXC6SR2FnP7V7VAlUWuM4pQ6oZEVUDky
         Y/0A==
X-Gm-Message-State: AOJu0Yy6WiRLHs51iRjkbDDhnlgtMmhRtBjo62idDkmnKq3ODGcaPNy+
	Hy/UjShrz3e+vqRYn4yK6GcSng==
X-Google-Smtp-Source: AGHT+IHc2dzth6LKzC6h7TBn2/SL7V+OAEY7bksLZRGZnVrvIoOC/yuSFZMolHtPmyTWRt1rlElQlA==
X-Received: by 2002:a9d:7a83:0:b0:6c4:897a:31d0 with SMTP id l3-20020a9d7a83000000b006c4897a31d0mr7519725otn.24.1699594956388;
        Thu, 09 Nov 2023 21:42:36 -0800 (PST)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:2071:4479:98b8:cc69])
        by smtp.gmail.com with ESMTPSA id ix22-20020a170902f81600b001b8a00d4f7asm4498845plb.9.2023.11.09.21.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 21:42:36 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Date: Thu, 09 Nov 2023 21:41:16 -0800
Subject: [PATCH v5 6/7] riscv: dts: thead: Enable BeagleV Ahead eMMC and
 microSD
MIME-Version: 1.0
Message-Id: <20231109-th1520-mmc-v5-6-018bd039cf17@baylibre.com>
References: <20231109-th1520-mmc-v5-0-018bd039cf17@baylibre.com>
In-Reply-To: <20231109-th1520-mmc-v5-0-018bd039cf17@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699594943; l=1108;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=4bgo3aK3cuR26cRWBbMVA6MrvhUqOJ8As8gzvmDCzhs=;
 b=lALKEKj8Qm8uCPZT94ZeDZCapEMna2PJb7qYfmxdtsiIiPu5ZBsq1ZTsCjmwM7LQeHswhFuMT
 bUj9CkooLlrCm59R+vpdz5OfJa2nhKLJZ6dvleve4V8ZDgXFGGMNDkz
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_214238_483144_7EE5FD88 
X-CRM114-Status: UNSURE (   9.47  )
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
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 70e8042c8304..f91d94f95510 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -48,6 +48,10 @@ &apb_clk {
 	clock-frequency = <62500000>;
 };
 
+&sdhci_clk {
+	clock-frequency = <198000000>;
+};
+
 &uart_sclk {
 	clock-frequency = <100000000>;
 };
@@ -56,6 +60,22 @@ &dmac0 {
 	status = "okay";
 };
 
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
+
 &uart0 {
 	status = "okay";
 };

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
