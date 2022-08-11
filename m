Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14640C19F2D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 20:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OiHNQN/noSo2I4TljvoIXsyn0H4wH2UiVJ9waHJ/sDI=; b=tVYEJ3mMtXqeLY
	44oVeHirjvPnSDqB4yaiOsMhO0QU+xZz3RdRyI5IO1h5l1KR6ggY/qheX4dr0N8BgzKni8ZnBcCf8
	tLpetDgZKDJyUl8lOKLlZEu04L0SOeYP6hWjKm9U4dxrKb0xEBm2jtmd0t50AeMXOXOLjUmR9w857
	pFAsGdgNmkHep4Bcx1veWl1e4q6gVw7p5RIzvSOeRkkLZAwlpj+Lu9tK/aCr7Yd36f6+puE6TcX+H
	sHi5l2gQXhAw3omUt78UI7Cg53m2NC8xnsNnT510PAC+XFLttZSSSs6cWPc/VQgUhoplVchn6PhKt
	Bo1C8X4Q37OLqRsQyUkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMErp-0056Wq-I3; Thu, 11 Aug 2022 20:33:21 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMErm-0056UU-0i
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 20:33:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id p12-20020a7bcc8c000000b003a5360f218fso3261189wma.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 13:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=44JZfQo8qBDZMgfCdrZJwZLuiR284QlmRSCfMxTvtpo=;
        b=Rg+2K2aUJR5EC4EzeEhjweVggh3LGAxXDW+n+myh6+YEfAOfixSRbOplNLuQc+hbCh
         k+KeOqNm6R7kogF4zChBu0vPRB6/t4pC7dpmsahLZa0MR1bkVO2XWKiYhLL+J8YqQUDk
         ZtKBGxLruXNAffh3BmuL+H6PQwULOjdofcVTtJDehPnCkEwCuYwFQvxMN+8on0EzLv0W
         8hG4NzCnIC7nauXERnsjmeIsK9LpEBmZMluKZGrodeAYGFQJLpKQqnVMGITSegeShwjt
         CAS9qdr1VnbdcCuBIY3JiurrcquUlr5/UocbOVp2P97KWNRvHxATlrQBQ9jfvz51J/Lu
         zNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=44JZfQo8qBDZMgfCdrZJwZLuiR284QlmRSCfMxTvtpo=;
        b=8AtKyWPwbSJkpvUGgcrM6rL9PlzOpkrCi3itUy2P63yvHAO1aLTQ9RIvuPnikJElCB
         ac00XK6bfiK8wML7N58DxNT7nDJ07/+cqtNM9kFiK+8lclZ90yQpDALHzR56xSHzoiSr
         AtPTsaTjYOlZMGxAjs6nczT5m+1UfOcz7A1yliMACA5hjokpmishn1QjMmnAkwv5ZCUb
         OLE7iS1d28hz7RXuRysP4cltlK5uT1ZA4EoaxgEOvQkoMzx5Y2p0TGKwHF7rXy+fgNPC
         ta10MyehZdfyxqHDsnyXXI1m1H+/QByj8xlt94Dg5cCOc4TZg3AvQov4N9Ifsu+ainDQ
         r/gw==
X-Gm-Message-State: ACgBeo2DirTHSO8LtS2khvxoTFpbC+on2vPlh3hUOQmqcjFTSMZUDQC/
	yvXGxnnhKpyPqRhFsKsfQNcs5w==
X-Google-Smtp-Source: AA6agR5N8mHJgZv+snXP8haUdkqppQ+4312cBLsCj598n23ICeGirf1H5+hFJyDA92da/FyY+BkSUQ==
X-Received: by 2002:a05:600c:3845:b0:3a3:19e8:829e with SMTP id s5-20020a05600c384500b003a319e8829emr6647580wmr.11.1660249996798;
        Thu, 11 Aug 2022 13:33:16 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i12-20020adfefcc000000b0021f1ec8776fsm86643wrp.61.2022.08.11.13.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 13:33:16 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Daire McNamara <daire.mcnamara@microchip.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: PCI: fu740-pci: fix missing clock-names
Date: Thu, 11 Aug 2022 21:33:04 +0100
Message-Id: <20220811203306.179744-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220811203306.179744-1-mail@conchuod.ie>
References: <20220811203306.179744-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_133318_081431_B4C81B84 
X-CRM114-Status: GOOD (  12.04  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The commit in the fixes tag removed the clock-names property from the
SiFive FU740 PCI Controller dt-binding, but it was already in the dts
for the FU740. dtbs_check was not able to pick up on this at the time
but v2022.08 of dt-schema now can:

arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dtb: pcie@e00000000: Unevaluated properties are not allowed ('clock-names' was unexpected)
        From schema: linux/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml

The Linux driver does not use this property, but outside of the kernel
this property may have users. Re-add the property and its "clocks"
dependency.

Fixes: b92225b034c0 ("dt-bindings: PCI: designware: Fix 'unevaluatedProperties' warnings")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I went back and forth on removing the property from the dts, but this
seems like the change that is more conservative..
---
 .../devicetree/bindings/pci/sifive,fu740-pcie.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
index 195e6afeb169..c7a9a2dc0fa6 100644
--- a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
@@ -51,6 +51,12 @@ properties:
     description: A phandle to the PCIe power up reset line.
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: pcie_aux
+
   pwren-gpios:
     description: Should specify the GPIO for controlling the PCI bus device power on.
     maxItems: 1
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
