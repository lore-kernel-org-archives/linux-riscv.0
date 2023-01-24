Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A52C38142
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 09:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MFAQ26ptid69ggYxziFtY0TzFxThAws9pJtDPjfuQik=; b=Gxemoh/IQUYNWr
	J2RbakPrN53V+0JHZqWDQSGOhaGL0uyCcCUk3firC0HlSKyQy+sFLmc+Y+Od6Mqf8pt/1UGYgoFk+
	qUQHmyKEem7oD0BdhnEuDYibAzC6WHTQ2MXar4TXogVqwTrp/XWjjc8mTGCPhhzfMEi2dq+iER/qd
	/3eMt8sGOdcxnCfnDuHHcNpp1/NkzCATkcD0NKoVjCbTxjWdcvE4OSPIi6+r9NjAvXlv5usgwqT7+
	QgGSc5jrNCTeOvg9qS4oriWgccHTh97zeDpDz7oxKZD5wne3ZSjGgSbh3ecX0OXzOfZS/dKr/58lN
	Ex/dt/DEZM/OAhAFos4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFUR-002s1v-Os; Tue, 24 Jan 2023 09:21:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFT9-002rJS-6y
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 09:19:56 +0000
Received: by mail-wm1-x32e.google.com with SMTP id o17-20020a05600c511100b003db021ef437so10407644wms.4
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jan 2023 01:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbA6lJheuFk/8xFTT1ePhHPMDBY/JK/4xrBmt+OOi4U=;
        b=gyaMQF7LxN91BqAUGGwqgwsMO2hEdoTGvJ1VHPth0Vl8RgAka5nDpZvB74rufyb+Z0
         xV00CuvPEWQEr09/BVy1JzwjLcVogjv11FrOZXW+ugvwl0cfQHBRj3Bfa0yC15GWAl1t
         jXdQs2B6bMEn/Y1LezZLuXMYjROjGQRcLXxatD01tROgJfIaE5vqoJBuPDvdnubUBmHM
         uG17LU+D1qCJqe3hjfo9MtGoUGnnwKLsjTJUeCxXC2tNvX/cvNTUmEDgAPXYS0cmUL3i
         gTnni68xV+zWuVbwacWcJZ8jbWYQ5xcswPnGiChiZ+46OlyTOlunUIshv6Q7wrqIN36n
         NQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XbA6lJheuFk/8xFTT1ePhHPMDBY/JK/4xrBmt+OOi4U=;
        b=h7hkEm6SytDPGZ1NfzmaAZXTzzk/2nWiiywHbqN08OU7cGRoPOBCxyrkf1sA8q4q1Q
         Cp26WNpek3HS8F/7dkrWYF9pvLMDmff2lwhUahbnkH4k8TcBmLoZHqeDfL+hJKNRC9TP
         Ckt0ADepMwXJtPYEl17k7WfBb5Elw/uzx6ijEA3sZoslUAAwS65xUqTVjVdxYEVPUz9R
         Gl3JWxZhAUDx5QOImHUIw0L55Ht1ksm24q6EZ0HcOhmNDMaTpxfMusU28pzFE6Th5CVg
         u5+qA39AKjoc613U7qYnMqLTevXSyF8Z33BvGlxXtlQna//miZkAMUSak98y5YZyEYJA
         DfUw==
X-Gm-Message-State: AFqh2kpx+MRqW7jUd1VkzGesZt/S55Z9GkMIcEwObVzHi8C6OXQy0goF
	v6FdgPetPqihdep6eIBLT/SY9Q==
X-Google-Smtp-Source: AMrXdXsuCK5QkrJAsWUR9ETP50ULGZWTSxGw8meu3uy8bzB1kS3qzFWy3OBucmJfla4MOZzaKSjqcA==
X-Received: by 2002:a05:600c:6001:b0:3da:f80a:5e85 with SMTP id az1-20020a05600c600100b003daf80a5e85mr26600878wmb.26.1674551990693;
        Tue, 24 Jan 2023 01:19:50 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i22-20020a05600c355600b003a84375d0d1sm13672242wmq.44.2023.01.24.01.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:19:50 -0800 (PST)
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
Subject: [PATCH v2 06/12] dt-bindings: serial: 8250_omap: drop rs485 properties
Date: Tue, 24 Jan 2023 10:19:10 +0100
Message-Id: <20230124091916.45054-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_011955_285432_3E21F9B7 
X-CRM114-Status: UNSURE (   9.17  )
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
 Documentation/devicetree/bindings/serial/8250_omap.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250_omap.yaml b/Documentation/devicetree/bindings/serial/8250_omap.yaml
index 53dc1212ad2e..7db8e5477b03 100644
--- a/Documentation/devicetree/bindings/serial/8250_omap.yaml
+++ b/Documentation/devicetree/bindings/serial/8250_omap.yaml
@@ -70,11 +70,6 @@ properties:
   dsr-gpios: true
   rng-gpios: true
   dcd-gpios: true
-  rs485-rts-delay: true
-  rs485-rts-active-low: true
-  rs485-rx-during-tx: true
-  rs485-rts-active-high: true
-  linux,rs485-enabled-at-boot-time: true
   rts-gpio: true
   power-domains: true
   clock-frequency: true
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
