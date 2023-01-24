Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B76C25B4E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 09:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CwhebaynJD/ZpYQjqj/kT15nZ4+lH5b12BHX3qJnI3I=; b=d52T5iEwDwZCFC
	TalrYw8OatMlj6Q4m54b5eQWLO/BZg3+YWelNZRNE2NSpMTOdADEGiz24VPSHXpPwNHQUkM5tTo/Y
	zcLYCv8JfzzOT4f8GFT9A07Xt2hsUChRruKyzRPyy+Nk6WvpD6OmYJzQ6z7cZ6/dzi80wzhSv7HLP
	g/T/26LUJcse1kT9nS9mHB1fDxb1YggVA6vxsfoc3OopRq1ebXvFyyqW2wPZgmws5XN0gMXP5Ofv5
	6GXht7STcWuWC+q0ayYakVQ54NvkCluA0wq2uvDi8Rl4uQAP27mwNGC8DgQrFojDDiauf6cIgiu4l
	BRVAFPY37tSDzKL6xO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFVe-002sd8-TN; Tue, 24 Jan 2023 09:22:30 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFTC-002rFd-Vb
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 09:20:00 +0000
Received: by mail-wm1-x334.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso742422wmb.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jan 2023 01:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iisYcPXooI57UtkAF+HOVcsh+51Ufy433rxJDACay30=;
        b=QIK45URkusdjjJyIz28i81nYHz/bPWip0DX2PvrCQnN65/DuO7w68GyeUkuXNIKNsi
         xs/1Vj/8ytAp3/zQx6EAL9f9lMjpqjQMr2D6A57bkBfcQuqWvaPZ1xR2yt43BYBpaGMx
         VgESHMdfMFchyGnRbxszQ3RlARP5wVOjSJz7IFde+G+7FvaAGhJHz0TNkWNAfkbwMwa6
         JM6RrxW67FgZHlwp9ePpPQLJdxKKyy+zfijtg8Hx+v8EogkhvtE5DPWZ46MJhlpsHUal
         KLUOITI571JUoZ4F5YpYZN2pGyrntmAj6GwTh/SKIi0DAZdNfbnxcpZ1dB7MbB2hT2hx
         vA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iisYcPXooI57UtkAF+HOVcsh+51Ufy433rxJDACay30=;
        b=vMnS0X8Fyk7BKHoDYFqZnx55++DmDoLm/tPHgdvQmylVkFMhrx19eOiwkO0L2k9roh
         UdswWrvnYxZUGG8kS1zl5E+xprO71+YZG6Ps/DHcxRjc0WlF6ncU7IMwq5Z4ZM+Kyw6b
         gkIYjS7q2RiUI9eeVgcgpCaViDOh7Hls2kXvy7CXlkuDc92kvJV0FD4QtiDun7PdjhHw
         /gPkgcNrAv3jPFzma/zHj0JuHXhHsspd3PeiIJ5eZA4TUtO2TfnMTS+xdE4y/9InPk/H
         rmWAJ8Q1s5wm4lcIZ2oTbmmmJm1muj0vCD4ASFdMDL1Hnunf82t7kxvslF21TISC3PjJ
         O+Aw==
X-Gm-Message-State: AFqh2koos9SfRcxHZU9P9VVDu66hGSUjHYn8xwBIjGJAfWZQ47GJ/1Zx
	ieemEg7iVNLpRER9pq2Ij5tIEQ==
X-Google-Smtp-Source: AMrXdXs8JG3T2Xep07y1ru/0yEt0ZLj+5ZJcdU+kq6WsnkoPtozPtAB9ElLE+hLK/vU0BiZFCOSAQA==
X-Received: by 2002:a7b:ca52:0:b0:3da:f4f5:ad0f with SMTP id m18-20020a7bca52000000b003daf4f5ad0fmr27205002wml.10.1674551998415;
        Tue, 24 Jan 2023 01:19:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i22-20020a05600c355600b003a84375d0d1sm13672242wmq.44.2023.01.24.01.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:19:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Chester Lin <clin@suse.com>,
	Fugang Duan <fugang.duan@nxp.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Pragnesh Patel <pragnesh.patel@sifive.com>,
	Le Ray <erwan.leray@foss.st.com>,
	Peter Korsgaard <jacmet@sunsite.dk>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 08/12] dt-bindings: serial: fsl-lpuart: drop rs485 properties
Date: Tue, 24 Jan 2023 10:19:12 +0100
Message-Id: <20230124091916.45054-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_011959_092715_6EE69F01 
X-CRM114-Status: UNSURE (   8.98  )
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

The binding references rs485 schema, so there is no need to list its
properties.  Simplify a bit by removing unneeded entries.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index 74f75f669e77..b1e81a6451a6 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -64,9 +64,6 @@ properties:
       - const: rx
       - const: tx
 
-  rs485-rts-active-low: true
-  linux,rs485-enabled-at-boot-time: true
-
 required:
   - compatible
   - reg
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
