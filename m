Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A5CC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jan 2022 09:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ovS+a87f5/1bGBBTgGqVZrtLvQehpW14LbnDDTFjls=; b=kWbSTJbJP+cltJ
	dysHSCGb8fpBrhtxkVrbwxTqNkaC2nV167YtW4cal99S+2Hch5ILUrvfykvYX4HXjfV7FxhlXeJ4Z
	LrpFvl7IMj2bYpfEhz+Y3aRJwnPwE6JJ29hqdHjWv1wrvq/6mioUO9gSVYF1H3+srQThEhtX7OW2e
	dWK7+sGniTMFjgX10aKEN3pPWFKizC6q98ydEydBPRAK1FhDUr5SZY7J2++MZ9i0NOeImDvig97nE
	RV0oE8/jmG0/04AAv12X0dH4TEeUpsgf43M4At0qiMzvPFUMvEzpBppbAsFtbHEf69Ac92z1jXtIa
	gZfbaM9FGL0R+0CtIjzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Iib-008RXp-Mf; Fri, 14 Jan 2022 09:17:57 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8IiZ-008RWU-GR
 for linux-riscv@lists.infradead.org; Fri, 14 Jan 2022 09:17:56 +0000
Received: by mail-pl1-x632.google.com with SMTP id e19so12763147plc.10
 for <linux-riscv@lists.infradead.org>; Fri, 14 Jan 2022 01:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=95yOM2oPjDW4I8teUQkYRlUXa8kIk+GmIx7gO72jBTY=;
 b=YPEZ7ukMzI2cN/31vBowmfQTiXMWclpljDXP5gx0881agK7JAmHUVY9q42xB0ig2sz
 G+JyRiZ6CP9KFEzGsvCZTn+9VGV7e3bS76bD7Mrkyu1blZVp4jGMillm7mL8+h0/9Uuw
 UAH3zINjhF1GKPTpYEoelai6zo6X3Mg4G4ymZHOqyAmxnygG3BdqsAkX4yR87t7RGODz
 IRHxnTz8fFK3SyL+f8ExbfdTi2FOpmMiW0kplgbiJ2gLFUMwBgKD9YXT848RdGbVbCzH
 p/ih7UBtp26Hxy3VATbG+fbJuJeBXFTcVxcKRM+ukRA9rjqxgp0CkMZGM+h1UQ6Y0BKG
 u4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=95yOM2oPjDW4I8teUQkYRlUXa8kIk+GmIx7gO72jBTY=;
 b=YzIcToN49xdD065vKNqOKNRpTdiUqSAo0pLTG2YSCXiDsNYAJ2u1b+XXkb2PyFoX5j
 lffCcn17DXdGiXUrFckbu1xDlym0Rk3Edvylh+d+G7DFLRT4/fVDG5P2O7/2KMooXkbW
 NxR2BDnu0cdlXLkHLpKKkeqdE6n2RlAX0quSh0PJTrsFCOobaHUWuQyZZxWomRDPfoDp
 Y7kLS6E/CeKpTYtbLuo751hbDZ9c4UrO30WdhhmknqTiQ+iQqBCm9j8kdDXK45T5mBwi
 RH1GsnoXhISbQl4vZnYMmr8T8rF/8JwHGVuyWcXZ0V2hvTcuPqd1EnOAmN7rAj/2/497
 wVFA==
X-Gm-Message-State: AOAM532dtwwxftJJCDuu2ymfBBpWwJ8VzH5B1GWJy+WP/9GHxYEBUFGG
 r4yKcL5OzjSSbJGkkZK7AyElXg==
X-Google-Smtp-Source: ABdhPJwT/nt0sujPYxFREq4ukryghTeohQvw9hI58l80zXnLp1SZJVKh4R2Mb5hKDbfGttEkklp60A==
X-Received: by 2002:a17:90b:4a8e:: with SMTP id
 lp14mr5351158pjb.6.1642151874394; 
 Fri, 14 Jan 2022 01:17:54 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id z3sm4237179pgc.45.2022.01.14.01.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 01:17:53 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v3 2/3] dt-bindings: Add dma-channels for pdma device node
Date: Fri, 14 Jan 2022 17:17:40 +0800
Message-Id: <5db314b798cd9cfcb5cb61bc56515220b7d50315.1642151791.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1642151791.git.zong.li@sifive.com>
References: <cover.1642151791.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_011755_573767_9E0CF6A4 
X-CRM114-Status: UNSURE (   7.54  )
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

Add dma-channels property, then we can determine how many channels there
by device tree, rather than statically defines it in PDMA driver

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 .../devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml    | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
index d32a71b975fe..3dbb8caefc17 100644
--- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
+++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
@@ -34,6 +34,12 @@ properties:
     minItems: 1
     maxItems: 8
 
+  dma-channels:
+    description: For backwards-compatible, the default value is 4
+    minimum: 1
+    maximum: 4
+    default: 4
+
   '#dma-cells':
     const: 1
 
@@ -50,6 +56,7 @@ examples:
     dma@3000000 {
       compatible = "sifive,fu540-c000-pdma";
       reg = <0x3000000 0x8000>;
+      dma-channels = <4>;
       interrupts = <23 24 25 26 27 28 29 30>;
       #dma-cells = <1>;
     };
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
