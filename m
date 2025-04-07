Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D10DC36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 06:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pLy/lzTFaIy/6SeZ01ElRKfJ0H7iZoX8rn0tgb4FpqQ=; b=4bXpL8oklQpYSj
	fUUqNBnHqqAM/sFv8dgKLtD2cpB/ABQU3b6X7HZHoiQPAztMVnnFwOoyFOp3J+QMZBcOED3utvays
	UhaisSdiN5cEwT/6jhzCoeM0noBUxHKF5Yi13CGYV9Dg1eE9QrATfVIW88+Vr05UdzyJnjuklptuF
	qmO3r0PdEdj0emCW5OFgSh9J0Jkkmcz/EJir9Vyuw+CNXJR96rIxkz7f13ccUdVMah76R6l7lWKT8
	I2bLb5ki1JjINu14eN7CC+xCwDM2vWyXjhWgzkg6ANIRIJt2d+H35QLiV/re+69vnjqKML9b1tX7M
	49YFJdCPgPX1Vo/H3KCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1g5Z-0000000GaWg-3bBk;
	Mon, 07 Apr 2025 06:36:09 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1g4r-0000000GaNB-1IGg
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 06:35:26 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso3802316a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 06 Apr 2025 23:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744007724; x=1744612524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGIQTeSUJ/msyOcBGgyCOEy8RB/Vu85gn7KiLYCFQmg=;
        b=XDDnG1Uprintlk+S9YOibrmhheW6Ce6GfyeJ9wNF8KUwSW58xwzTDIrZ7dKXkWT+h8
         UQ16S8prIp/w/q0OyfF71sb8pfnBt9gM2Wwbf39lqw1otZW+yQUdJanYlSB+Ri/uRdTT
         toz2qf0KxPVxzx7GELFJkjzeR8f0lcFfEBWPfpzhz8U+ejv7HBLsjKieDAULqgFqXpql
         0hoEf1vlqhwBnILkVwvags87+5W5VXiniZysxzHmIJ8pYs2defT5V60X6s+uXaEi15cC
         XFiKCOqDXPA7VbDmRFhF+tbglOtkD4HA5vZMnQgwNdwh+SLBdKqzjBsJU82h7f9fFCbZ
         noVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744007724; x=1744612524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGIQTeSUJ/msyOcBGgyCOEy8RB/Vu85gn7KiLYCFQmg=;
        b=lk7fOL3V4a70ujymS5PUw1YMZCWwoZNRl4XacGAzGTflC5WNqfppRR5o6NqwSkdf6i
         3kAl3Uv+8nacuAVSY+HF5o+9eiRk0WgH+ea+AKOcqmxPOE6k+8ZGRJhAbz91Q6XLmK2F
         T15/M2yhvJx4qQCCbeOZubyydzLATe0DOG3vrqBTBbRYSI0BOBa1va9IiIBWPx3xl+Fb
         M+urRn7jX/bMUoP2cUkHbexE9BVcsK74NX7DvZdFs6BBlygzaMMAY/1CvXGTCOmR7ZL+
         PXhcG3BXpP0WAMUqQ6UhvxCEmmUC8BjXuYxGGhaqrry4lbSC0fz3jty4pL/YaAPutJ8n
         rAgg==
X-Forwarded-Encrypted: i=1; AJvYcCVXLz3iCLnWUG0yhF0bDxSxZxxP1tokeNcd/KE4MfXH9OZ4zkvZvkoeLRpNjGmEe4c839QQs0dgn7oAVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKXAtAIBw6LLwK3VTLf8dsla4yU1oKDE2KUE5srxKOwbYxOwkp
	b6z/Q68UPgSZXlpD0njrFGCBK6UzXm2/OugRZ8XDOZDmFtKwPPbF
X-Gm-Gg: ASbGnctd9nzy/AlIsKCH6njbVNiJ6YcObcz3ERoyFhcId7camjoeAQ1IJ/paOnFcirI
	9AMy26bJvadZuRqAZ86oe/oKuBOwO5yzSfpaBJopNFcC/GqE+NDBX/slIBDB2Acxx6extU39VU0
	pNnTZIyepynSYSN5SUhJCsKj/ZjA4jrY6hMfXzej4/HXmNx57UhJUmJEXgC1mprQ2/vwa6FmjKm
	/7mNdwl/z5SIC71dYWJ+18Fi0eUIJDyHNkODObocqIVao6aaTZ+d1jnebuU+7nvJKtWxhbBdsEF
	LTz7LaGYtqzlOVQrGfvVO/rFKYakXgWIOgYq
X-Google-Smtp-Source: AGHT+IHBFpIgTbEaMnBWm5RVBjeYevVuixu+5yTWxBRjJdtCoVEVF/pCoi2mcsaK29zligKIYWm+4w==
X-Received: by 2002:a17:90b:1f8c:b0:2ff:52e1:c49f with SMTP id 98e67ed59e1d1-306a4892fafmr14203035a91.26.1744007723635;
        Sun, 06 Apr 2025 23:35:23 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::610c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983da691sm8048044a91.47.2025.04.06.23.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 23:35:23 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Mon, 07 Apr 2025 14:35:12 +0800
Subject: [PATCH v4 1/2] spi: dt-bindings: snps,dw-apb-ssi: Add compatible
 for SOPHGO SG2042 SoC
MIME-Version: 1.0
Message-Id: <20250407-sfg-spi-v4-1-30ac949a1e35@gmail.com>
References: <20250407-sfg-spi-v4-0-30ac949a1e35@gmail.com>
In-Reply-To: <20250407-sfg-spi-v4-0-30ac949a1e35@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 sophgo@lists.linux.dev, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
 dlan@gentoo.org, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744007713; l=1084;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=Ocz7+gcKVvx9JS7ROJOowK4HkGeQFJNuw93TvrjIVTM=;
 b=Uxcj0G45ieTZvKKQjyJrxTtDAyr9bek1RVrok389pH1B68f9abGhumzllp68p4QUAXIPiL0cU
 w83qtuBizUND2pqbvQGlxfR9NsMTPYVLoZS9AoWD/VKGhB/9V9nGlcB
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_233525_348868_8A24B2EB 
X-CRM114-Status: UNSURE (   8.05  )
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

add compatible property to include "sophgo,sg2042-spi" for
the SOPHGO SG2042 SoC SPI Controller.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index bccd00a1ddd0ad92b437eed5b525a6ea1963db57..94102d94ed5dffe889a8a11c1c637d466713c208 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -88,6 +88,10 @@ properties:
               - renesas,r9a06g032-spi # RZ/N1D
               - renesas,r9a06g033-spi # RZ/N1S
           - const: renesas,rzn1-spi   # RZ/N1
+      - description: SOPHGO SG2042 SoC SPI Controller
+        items:
+          - const: sophgo,sg2042-spi
+          - const: snps,dw-apb-ssi
       - description: T-HEAD TH1520 SoC SPI Controller
         items:
           - const: thead,th1520-spi

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
