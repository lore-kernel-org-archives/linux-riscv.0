Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0102C38142
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 09:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/xGt/ajbiVE/KRdchqMRBkkwo2mb1xMxkREUNaqHks=; b=bNUmUrwTBxX+NN
	lWE2rgo0RdZemJqOV+dFT5YSkIKadijlybknrxu0NMf8EVB95R99Khg3fuBG0og+4QsX3kLGIMu2T
	ibtd7JrVobdNdmYnGQQGJMmA+mF6TYCeXQYTm+DvDhjWjRtUXrij+5cJuPsVELB6Cm7IfPbJr+gnk
	PlO9SPNrbUogpdgHwpLv2lg8XDVoWgVe9q2NLYPv5pVRCMUrrGUNtevgTHTgIFzFgBuwkLryqHhpd
	LLhRkNNVD467vWYRjY/8yVRyQiNiygZp9MWstrthclB1ie5R6sh8qugbAe5weTeu7fmGOIobpuQEm
	OMfd+FKvDk+JxZ072KPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFSh-002r9D-Ty; Tue, 24 Jan 2023 09:19:27 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFSd-002r7c-5c
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 09:19:26 +0000
Received: by mail-wr1-x432.google.com with SMTP id h12so9204259wrv.10
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jan 2023 01:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43A1eeWrpE679NQnTX4HGXlIW2NbDWo9ZcYcCEyQGv8=;
        b=ONjezc3uRXZlJmtLiPWC5mw58yms5cO1PTcTCwcnTPM7f+VvICxnFSBl4X/nLpZfmY
         aFmZ3dz8KHuvPhnMycUrIU/wfcpj8N8tsdpFu5yuGNIbgryu8ovn89HtaD4MKOiJKEDX
         szOT9ZhlzqEDlnnFaMRhnlVV5qYKwvhQwI3JN7baJMOGma2Qj4R0RJVNKqfbbQMGyvKQ
         Tip/5m94Y2UniXLOdCInty6j5cE1B0Bn5OkDlTQr+FOLfGUpyhQQlBlj7sINgWJ53+VX
         1JUDRoNwSdUHX6CRdmFB63SsqOSneNpY5t3UXCyF/IZuzsgGFD/JuD03wzIN/9nfsVus
         YW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43A1eeWrpE679NQnTX4HGXlIW2NbDWo9ZcYcCEyQGv8=;
        b=TLbwJBHPS7kf3YYdjbX7y1XoLaPF7TTY2ITbT4xVhuyib+gDGH4AO9ktgeE7xOo1kv
         Ona7rQXHjq1pKa5cgqZTLvysaqsWMdJEdwTHGF/AXE4ZQOCR0pqlfJZDVJGJI9GFml8z
         6v+1AgXdQRm/t6Ov3Syj+n8Z7oa9yQL3jv/ac0angBs7j0SlUHw3BEPIaqTmw/D9Bknl
         IiNkOEeH0D1nKPvC+Jfw6EB9tGFnNUCsIPKHkukGR+MbdPglxCNE5QZT0BygaJpMqCiw
         h4gGs3RomcWEnRFROQgd/DhFzwWUEx/GdKLOj8jwsWKXdLu/oQGLp/s9YMeryA1CxmHy
         uKvg==
X-Gm-Message-State: AFqh2kq9l9HRlnHvDO+LSXEnxRHr/youGf2kwjW6l65D3TZRSwZWnX1V
	qIZw4DButzvfX1vg0MvUyZ8bYA==
X-Google-Smtp-Source: AMrXdXtDeqK3bf9pLkBQmMDNhFtINAt86Lm3kD2eTMHoeuC73VR+7IfQ6qYkFopm1Ln3EMVZmWg2kw==
X-Received: by 2002:a05:6000:1706:b0:2bd:dfbe:c17f with SMTP id n6-20020a056000170600b002bddfbec17fmr28359868wrc.58.1674551961808;
        Tue, 24 Jan 2023 01:19:21 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i22-20020a05600c355600b003a84375d0d1sm13672242wmq.44.2023.01.24.01.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:19:21 -0800 (PST)
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
Subject: [PATCH v2 03/12] dt-bindings: serial: pl011: allow ARM Primecell properties
Date: Tue, 24 Jan 2023 10:19:07 +0100
Message-Id: <20230124091916.45054-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_011923_270489_6302A728 
X-CRM114-Status: UNSURE (   9.84  )
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

Reference ARM Primecell bindings to allow typical Primecell device node properties:

  broadcom/bcm2711-rpi-400.dtb: serial@7e201000: Unevaluated properties are not allowed ('arm,primecell-periphid' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/pl011.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/pl011.yaml b/Documentation/devicetree/bindings/serial/pl011.yaml
index 80af72859876..9571041030b7 100644
--- a/Documentation/devicetree/bindings/serial/pl011.yaml
+++ b/Documentation/devicetree/bindings/serial/pl011.yaml
@@ -10,6 +10,7 @@ maintainers:
   - Rob Herring <robh@kernel.org>
 
 allOf:
+  - $ref: /schemas/arm/primecell.yaml#
   - $ref: serial.yaml#
 
 # Need a custom select here or 'arm,primecell' will match on lots of nodes
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
