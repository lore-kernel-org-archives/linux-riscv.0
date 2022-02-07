Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CA9C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 06:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJIhKP0B1Rtx4Qc1CxlJ+JWvujUKpLnW+MeexygVdV4=; b=4EdqHksB/q+bIi
	bLBgR/WkhjNpdxVL9rWb8RIxZlbyiqYrRK6tAmr3tNM/JEauukq1lAtxLd4v3u7V9xNZZYBDVHFgR
	wcCshL8LsVJ5xfi3BgOB/JUF64zFKZhn9CxHzEFDIHYwH9WR3UQ/3pZlrLARHOtKNuONN4cUQE5pm
	dJXhyZ+MG71FmS87rnD0AUfXVcobo+cFuZSuqqM5t+feFsW++TQBzgKiJNGBi6I2hNAl2lBz1m03f
	jQzkPUbbcVWYR7QBNp+yAHYYNPSOi9lGdwHes5g1tY+xnUdAPOHFmS+AjMUJXIDR6Bp9jthmwn7Oc
	fCbcYn9mA0B12nTYR6WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGxYF-0098Wd-1T; Mon, 07 Feb 2022 06:31:03 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGxY3-0098So-BB
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 06:30:52 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 d9-20020a17090a498900b001b8bb1d00e7so1754672pjh.3
 for <linux-riscv@lists.infradead.org>; Sun, 06 Feb 2022 22:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=osho4FvgLzowJuFLyZCnSgKHB8Ho1YEMLsQwVPBIhrQ=;
 b=aYEV+dyLB+amBduXwKLTJW/3/KSl0vdvVUWqaLhgwH4B52TecfYl5wCP1ZsiORX1CB
 6hlKB8KJmLK9j+we7MeXGW6G05ckobQjwsznT1kEQiadEJyLHzDccSzCK9AzYAuaTRCM
 K4KcKEkTnnNOt1MxOYkMnFNv3yFdmEFTCib5cwP+6y/bm82FjQbng91jGTlkRTjSNeGB
 +WdbeFm4zHYH/AZll9BgHaTYRZ2bjnigbxMujoB+FVhkClPBDL0Cywwc+18lTVbUP5Q7
 Ax4GJY29WBjjomuDf+oLTC/bLe713unqaaNjg2z2DmSWFEbapAdr5MvSsxKjydf2Fhfk
 Bo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=osho4FvgLzowJuFLyZCnSgKHB8Ho1YEMLsQwVPBIhrQ=;
 b=qD6X5G/Gq84YElKEUvZiowL39DkpDVZA+tMBQhGJRqDC0L/BO9noxilhUMgieSCAWn
 5qXyCAqvqpe66DyU0J+VBPF9kEOY3+KpA222o77jaoylMlHCBH1f3vci7wV5oVBy7/8b
 TJxjLxE9D97tMRKiuNdrvmJBmA5sK3bNUH3xU7PDZSLcCLJ4+T37V/7BzXPQHlzgydxn
 m9mcRW4JMVk1RUzC9HmPf6ka5QH3t3S52htYVVepu6u/G2Bq821/GdwHPLp8UncDMy+d
 Oo+teeo45I22yVlXwir6MU/Eba+9xPDFUW+m656GIs9PkZGh2zBTyWnzhFxAd5IRIVmE
 SoXg==
X-Gm-Message-State: AOAM532UEbdwCbJNoaa7GGxgoupW8ynpl9qHeof9+HqafHswgveIXeGX
 5P0kEC8W6jnilKjsL55VAoLnig==
X-Google-Smtp-Source: ABdhPJyVcYtlV91++9ZVxo2GN3FeH1zysf9x9ULbE58unMlpr3ZDHua5lxLFugP4dveVBuh2RNkDcw==
X-Received: by 2002:a17:90a:eb0f:: with SMTP id
 j15mr7879986pjz.155.1644215450600; 
 Sun, 06 Feb 2022 22:30:50 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id i10sm5266634pjd.2.2022.02.06.22.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 22:30:50 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5 1/3] dt-bindings: Add dma-channels property and modify
 compatible
Date: Mon,  7 Feb 2022 14:30:38 +0800
Message-Id: <30430019105af445d52b7a48331c106f8e6d6816.1644215230.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1644215230.git.zong.li@sifive.com>
References: <cover.1644215230.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220206_223051_417702_6B7F9EE0 
X-CRM114-Status: UNSURE (   9.77  )
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
by device tree, rather than statically defining it in PDMA driver.
In addition, we also modify the compatible for PDMA versioning scheme.

Signed-off-by: Zong Li <zong.li@sifive.com>
Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
index 75ad898c59bc..92f410f54d72 100644
--- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
+++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
@@ -25,7 +25,15 @@ description: |
 properties:
   compatible:
     items:
-      - const: sifive,fu540-c000-pdma
+      - enum:
+          - sifive,fu540-c000-pdma
+      - const: sifive,pdma0
+    description:
+      Should be "sifive,<chip>-pdma" and "sifive,pdma<version>".
+      Supported compatible strings are -
+      "sifive,fu540-c000-pdma" for the SiFive PDMA v0 as integrated onto the
+      SiFive FU540 chip resp and "sifive,pdma0" for the SiFive PDMA v0 IP block
+      with no chip integration tweaks.
 
   reg:
     maxItems: 1
@@ -34,6 +42,12 @@ properties:
     minItems: 1
     maxItems: 8
 
+  dma-channels:
+    description: For backwards-compatibility, the default value is 4
+    minimum: 1
+    maximum: 4
+    default: 4
+
   '#dma-cells':
     const: 1
 
@@ -48,8 +62,9 @@ additionalProperties: false
 examples:
   - |
     dma@3000000 {
-      compatible = "sifive,fu540-c000-pdma";
+      compatible = "sifive,fu540-c000-pdma", "sifive,pdma0";
       reg = <0x3000000 0x8000>;
+      dma-channels = <4>;
       interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>, <30>;
       #dma-cells = <1>;
     };
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
