Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66434C7EE22
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 07:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFHXYIQale9QQoHd0dAQaqeULgK695svPfmgt2YXK2Q=; b=LQH426M2e0FVZ9
	caGSt4cPhHYVLiRBmTnbDh4OTmvf8GD214ZbmtCc7pvVImyJlc2l9xzSQ07V5aHoJmMWhhRPjCl5c
	8WWUI2/nuc7N3GsuO/os/EWMm/tAVIOYC/N8b4sdZNC0xIkbVubkRC0KIgLwNnCKQfLIPs4kdhBXm
	jT90IRPnpU5O6wmlZcBMriaNvwHpQg8gk5tQAMi4r01aYPeu2pldgmk0VxGNAbWTMQLWVJg886tG6
	CFBUCSa9632+N+Osp4DqaSbVYWLzMxB6Fiq4F8xMB/LJV3tbcGSrLef4h2Ahdjh5PBBHCYpLwO4VH
	rstzizCQ8PWugN2sDfXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvCOq-00Cmb8-03;
	Sat, 06 May 2023 07:32:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvCOm-00CmYx-1g;
	Sat, 06 May 2023 07:32:09 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f41dceb9c9so434535e9.3;
        Sat, 06 May 2023 00:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683358325; x=1685950325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/p1ytnQh6YEGVhEhqDXJrPOG30ZOWl4FCmbFIXesQs=;
        b=bHsdH9QLBx95JODO+aI3BTZ9JpWH80AULgNrIwX35ln3QWMnNrfyonN+IEHO3a2qXT
         zQayMOl3UCEcpbg7SLIxbGxSaxH7wpxwpx3k6GfGLVqIOq34mTLj/N+WmeALlM/BV8QJ
         1Yg5TejIXbppSec1n7g550mo+9+Ow80CwC8KhpOwO5B33fezYPoOP1ue2+MnAAhZR7aN
         JYTD8eG2esMfafDyBkIrl8YCg2DAoQqQYOlOqcRt0aAiXAXbBP9eR0f06G21todRHxqn
         emMzyrfrkGuzCNT+6qaxL0Pc0Ktrb3COiRtiFN7x/LlK6Ftkp/pBQI9OGoIAW5IOERVy
         l0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683358325; x=1685950325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/p1ytnQh6YEGVhEhqDXJrPOG30ZOWl4FCmbFIXesQs=;
        b=azWgmWyrwIPdShafjvpLPnNGYps1ROnUmQjotXeem9DQAAA8QAhceN++MrlG6HNWCT
         xykFRGmzxm8DaeTlkOh9hmkKONRzsQM9SNUUdeKn1tZyY2+omGxva2RNC9Md5E9866E7
         FdnuLKoMSVv9xqIZG0XAy5Fo9FxBKIvRrFiT/Q7c9dR4SCsk7H8TVC2q5JjLTn+Sa5/S
         ogxiSp2APfee3sKA4qAtTUfqqkYBy9HfkL02gXFaz9Xs6d1fHcjy+SjEo5wyHzWEYUl5
         uOn4z1+yMXQM/Zh/+LMmnOYmh9kZAvfoa0ucF/XIPo+5loOG9sdDs6CounqlV7qkeZl4
         08qQ==
X-Gm-Message-State: AC+VfDwSqb1QDQW3HStg4ghXvRktpCF4QkqU4KD8gW+MKJo1Ov4wu2F7
	gb8dpKBFoBMye8MMoNPhRgc=
X-Google-Smtp-Source: ACHHUZ6JTn71OUBh2OirtFdnyg6dCjdW09TDzjxul9OlyXa2r6klaU6in0h6LXx3WvVWtVJrCWb40w==
X-Received: by 2002:a7b:cb53:0:b0:3f2:53a5:d308 with SMTP id v19-20020a7bcb53000000b003f253a5d308mr2586133wmj.6.1683358324784;
        Sat, 06 May 2023 00:32:04 -0700 (PDT)
Received: from localhost.localdomain ([176.221.215.212])
        by smtp.gmail.com with ESMTPSA id q14-20020a7bce8e000000b003f182a10106sm10071944wmj.8.2023.05.06.00.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 00:32:04 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/6] dt-bindings: spi: sun6i: add DT bindings for Allwinner R329 SPI
Date: Sat,  6 May 2023 10:30:09 +0300
Message-Id: <20230506073018.1411583-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506073018.1411583-1-bigunclemax@gmail.com>
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_003208_561627_29C6FF35 
X-CRM114-Status: GOOD (  11.68  )
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

From: Icenowy Zheng <icenowy@aosc.io>

Allwinner R329 SPI has two controllers, and the second one has helper
functions for MIPI-DBI Type C.

Add compatible strings for these controllers

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index de36c6a34a0f..2c1b8da35339 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -21,6 +21,8 @@ properties:
     oneOf:
       - const: allwinner,sun6i-a31-spi
       - const: allwinner,sun8i-h3-spi
+      - const: allwinner,sun50i-r329-spi
+      - const: allwinner,sun50i-r329-spi-dbi
       - items:
           - enum:
               - allwinner,sun8i-r40-spi
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
