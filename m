Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B0BC54E94
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 16:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqQRROyveFwwIPi0Q9cBvLwIjBItOQXvAjg2SnKp2nE=; b=E1bttAJNnwMMof
	o10FwURLNyZxKWrRLZln0wLmSghnbctSZx73YL3kGQnJ+2Mc3qCL5LVjwMYsMcdeuwGuFcvP1L1KN
	oyiiX5bdn64Pc0MCe3ij64aj116jRAYHoOcyOQ1PmBoLdNh3R1CpIEGAuF8TXY18z4zod7Kykjlx8
	pALjkCuDII7WQZB+gKQHuIzqW1ovifiqnyZmqhhEp9O00oxm8Ki5l4qHBAwW67HTsjHwJ6Vl8uzVq
	Y+62EJrQVy0+YQj9z82EFsf9I7+Wlv3hnSODNhx4Jfw3F1adf+Vf/6+sohdEN7hyKHo2SjkgGo/kA
	1nxk35jQT7BbtnOqfF/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzTM-000TFN-FZ; Mon, 23 Jan 2023 16:15:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzHE-000Okk-DM
	for linux-riscv@bombadil.infradead.org; Mon, 23 Jan 2023 16:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lf7sCIV+g7d4Io27nUeL8AFqRST4Uv3gC9DO+XLsu5c=; b=iO/Vduw6Sxk9COR3OldaIj3YwL
	7RXsTsU+2s73DjdRKIkCNvzzbHHhBSAPsc9v7YwfXdLEqwxpBACZIAGrz3Y65TqwWe5P1FHwePdmP
	S03DlgjKvfmMAA0fg7uHvCrLeARwzBC4ONaQAoTmAZQ9FRaiL1Qy9zk72kpBxIla4U/TtB+11amT3
	rO4utUZShhGCLnrZN4YhHxVIXKc+XvpT32U5tavZpf+YFCx9pDleReNp1p5sCH8nT6coGwJ7PIoQB
	VUARyaQr+BoEWx/nNrkX7P/SqA+qvuEn7f4yp/nT5kmS/quNo105CQg0+poZjv0BFTt4MZR+rq8P2
	T2jGrfwg==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pJyVJ-001ZFq-1n
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jan 2023 15:13:11 +0000
Received: by mail-wr1-x42e.google.com with SMTP id y1so6622943wru.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 07:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lf7sCIV+g7d4Io27nUeL8AFqRST4Uv3gC9DO+XLsu5c=;
        b=cqVYvO11OXKCMxWS2m2N8CuvmAo04795P3glA3/QShNfksesNCwdIiapFJIUxHx8cg
         3rS+IwE+nzmtwwJKmwEYmQW5HLkl7MmB54iys0Xhur69ZQg04gXhIFNjki1cNxhgM/hm
         KVdVtMqmIHX9lNjdkHzp2HS8EYbgPuXUYi8+63DnFvCutve84+4ZjO1HvGNqiyFO7QiQ
         0rkXFCKJMjZnLe10OEAwNQV/7I7wA0Qmxni0Mo/QqIeyhtr1qYNrtVfm7dhsM722pJ1P
         sPnDVVZr0HkwjgZyaHNJBlv/Mmd2HgHSPEa6D8zIE0r8kuGKh0CVafLNIOC929NHP8Cs
         Evnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lf7sCIV+g7d4Io27nUeL8AFqRST4Uv3gC9DO+XLsu5c=;
        b=np46OcP/7NGI6rjV4c0eUdy3a7eFd4W27LZ2RtN+6UVC8CSTZzMIjMaOQql9J7LM14
         yIKFNLOInoccCLXedIo630F+6igwkAFIEcCSQ9JNLsVZlWLQBFbC9qnNHQQCz2qRx20v
         yda7LccUsM9g9RdvRvE8KeLxjSOWQYBo7Ci303BPf36fysHr3Mo/jW/3j0SrioyW1bG3
         JmIy+4nLPoTgY6Nx+sbvtvpRXfe0/MjWclh35c+WFfcw9rvxeoEsEO40V5Q1lWJxYgZ4
         1iQif5O9IQHeAwkFUWfHgVshUfTSPDonvoYzRNgW/pRibq3Au6SYMbYA2EqB8UIswXsj
         rrqw==
X-Gm-Message-State: AFqh2koq1HCjjg9YPi8DnEl8Z7EsxrLEofuZsan1vV+jM5eqcnt6RnXC
	CzLC395YiOlW5cQ0/7MSixu6vw==
X-Google-Smtp-Source: AMrXdXvPieFXZTI3YD37rAAxnRgL7EXzr2+7M2297WZ2GeWKED5O3/ADcQWZP+sLDJlxaXVyZ1+vHQ==
X-Received: by 2002:adf:edd1:0:b0:2bc:7d12:e736 with SMTP id v17-20020adfedd1000000b002bc7d12e736mr21123596wro.1.1674486810209;
        Mon, 23 Jan 2023 07:13:30 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:13:29 -0800 (PST)
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
	- <devicetree@vger.kernel.org>,
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
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 09/13] dt-bindings: serial: fsl-lpuart: allow other serial properties
Date: Mon, 23 Jan 2023 16:12:58 +0100
Message-Id: <20230123151302.368277-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_151302_331024_7B39307A 
X-CRM114-Status: UNSURE (   8.77  )
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

Reference common serial properties bindings to allow typical serial
properties:

  imx8qxp-ai_ml.dtb: serial@5a060000: Unevaluated properties are not allowed ('uart-has-rtscts' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index b1e81a6451a6..26c3593fa98b 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: "rs485.yaml"
+  - $ref: serial.yaml#
 
 properties:
   compatible:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
