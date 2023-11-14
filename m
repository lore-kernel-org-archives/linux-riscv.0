Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6DEC27C47
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 21:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uCEy7fopG0vLuuN/IuAnIvORB0BjanUlKhCC4o7Lzp4=; b=T/MYi9o6x2d4wQ
	4tG5c5Qxrfm+zhYxSnRp6TV3A2drG9Gi+Rrx1mJJI/6FnsYwokeL28JkuOmVj1CJrCRxa/8Nz0pqi
	FkMm4+kbq9567l8iU/8fH5jfpUaP+bT3bgaCZbSeUlbAQ3Yd7EtjeItumZfYq3Sv0D2qp+X/VTgCY
	9Zdz8htwq1j92mMBrMAjxFKxRyEMgBz+9umd1ZUa+W966e8WTa9/uhdw6IhU4Z8jcR9atUu3X62Rm
	E5uiniLC+q5b1lHMoCR2L9z7u19VGEeRd0SzxlB21r6XDzjRBG6bXX3zPWhOkG17glFFRjE3zW2b8
	phziq+ATrWpTctoZyFwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r30e0-00Go7W-0C;
	Tue, 14 Nov 2023 21:08:24 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r30ds-00Go1u-1m
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 21:08:17 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-41cc0e9d92aso36666471cf.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 13:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699996093; x=1700600893; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSa6NAVY2VMgd1nmwOwphCO64qKVXCiZUmGbVj1XUeM=;
        b=bB9jLsWj53kGBxDoi1G6iSyOGfG/GIuBrLTqIXFy3isIqzzabikcSUDKlFkMdd6Md8
         hAsqTKnRsRbuoRhMxMbpkr6wA3UWnhoLYkilsby3uWBQ2Ghr3XaUK9wxgfVByqP+sCOb
         lfPHwK2KnVi9Lc1FjvpA/w0F5cCrw+4p8KofC1ewCC3vgvaAX4O4junzWcAJjFyKU2Vi
         F2DQsG507V6PzqPhCvYhIjpBTDOzvByQab1HJneQfZSjNTD8CBawxDB84Rle1/ztlvw5
         hfWoAAapem4hCbAXOlyWMOfUvxZKqCa/Nc+z0R+pJ69E4LxzNgER8viKcbXjlb3pNKq9
         1OgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699996093; x=1700600893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSa6NAVY2VMgd1nmwOwphCO64qKVXCiZUmGbVj1XUeM=;
        b=AlYLPi+dbbi734DvjG83pVGpYzLM5r8pRSUBPr9l6v25sFB4efDfry+bOeldvsfWiR
         PNVGGkIdvPcLDFwfS2Zvhjt0G+BA4G+kHeVUVco53ewNWfVBElgiqWgnvuSj5Nnapc6m
         aIAsK1rypTXdFCkOkM6ernhLMNe6pEdcQwugzN4ef5L0BJIn7fQiMjYPlzF+bvFItuZj
         eyVmGDOlO6clp8pspCN7gbotlnMbryAigv9I4XPOTVDZ+AFrL6F9XjxkuGaJa1CGARKE
         jDStL7Rv42oR/9UX/xUXhxilpxEuhhBXUYiEwhcMiyCxwn+rXiMzCljTZSZ2Ht4DDW8Z
         SSBQ==
X-Gm-Message-State: AOJu0YyV28CLMaU9U+jX/K2QURRhOriCQN0gYLqBaY5/HYMkldmP45IC
	tAAK2DWNBMT4k+gzios2B82FTA==
X-Google-Smtp-Source: AGHT+IFTxwPK9muJ+tyuUM8rO+hMqktPAV/DENOvHNpAKp/MaM98OFUWj8k2GiuHtP77zLWId26eiQ==
X-Received: by 2002:a05:622a:1485:b0:41e:2314:8dde with SMTP id t5-20020a05622a148500b0041e23148ddemr4036430qtx.38.1699996092945;
        Tue, 14 Nov 2023 13:08:12 -0800 (PST)
Received: from [127.0.1.1] ([12.186.190.1])
        by smtp.gmail.com with ESMTPSA id x16-20020ac85390000000b004198d026be6sm3027549qtp.35.2023.11.14.13.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 13:08:12 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Date: Tue, 14 Nov 2023 16:08:00 -0500
Subject: [PATCH v6 6/7] riscv: dts: thead: Enable BeagleV Ahead eMMC and
 microSD
MIME-Version: 1.0
Message-Id: <20231114-th1520-mmc-v6-6-3273c661a571@baylibre.com>
References: <20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com>
In-Reply-To: <20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699996086; l=1108;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=4bgo3aK3cuR26cRWBbMVA6MrvhUqOJ8As8gzvmDCzhs=;
 b=fgvbHypWZrq1O1XBKI1HYkf6KoCvbawChRB0RaWEQlNIV1gRXQoqyG2UpVayFVmHe82+m+chX
 ekzmV1ENmFyAAA/bGCw4bizdqv2LXaX1OLbo+dKRHX56MNf5j6v5YTY
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_130816_590034_2631C24A 
X-CRM114-Status: UNSURE (   9.35  )
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
