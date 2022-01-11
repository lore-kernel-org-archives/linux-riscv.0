Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E31EC43217
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 08:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ovS+a87f5/1bGBBTgGqVZrtLvQehpW14LbnDDTFjls=; b=lBjJ4P0H5NS9J4
	VX5XBoym/LPbfv1Fdv3sEAfDmwSN8FxhIFqno36Kbqp055Kq++ru1AGgu59kTvZlwCDk/uYJm6KIJ
	FcpyPT1DsJI9yZPbzsIBiM6yDHO3ZJtevOPRX1Ru8F8T91DNPLXJ9W2yEBdX7/zIM4oOuT9ZCdXnV
	Se8x0/qK2RDEKWEfVQgml81l2KYT+m6tiNM84+JBsJddmFFql5icFyoSMLw/HhHhHHOCRReCjS4+B
	sh5cmm6+hq/d9YSw1F2hd/z7sGUBI4dW4tRKVfK1dwWZuMc/TaY7stEROOtmq4aJcB+nrnPWrZPI+
	1BwA7YRMaYPuKpaFB+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Cse-00FPdV-6n; Tue, 11 Jan 2022 08:51:48 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Csb-00FPcA-Ce
 for linux-riscv@lists.infradead.org; Tue, 11 Jan 2022 08:51:46 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so4594274pjb.5
 for <linux-riscv@lists.infradead.org>; Tue, 11 Jan 2022 00:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=95yOM2oPjDW4I8teUQkYRlUXa8kIk+GmIx7gO72jBTY=;
 b=GpMh6fkVqVZnpQ6fScwSciNnWMkmNTtU1WgST8+pCoVLTfgXeKSZPYogUkpsxz6FF8
 +/WpAxttfOV5TjT30xKEvL0rMlmogZOvL5ugDuwDo5eKo/S6U/EinZ6A+7O7Wj/MZ7Qu
 9VLER8etNMkI5H/6yhxTf83SOM8KvmMuHHqNR7mFTlu6mj8BQoLXQ2Oh7zlInW8SZdVb
 fp4+SLidAPI2J9gB0om53xk/hHNTonmlL56uac8Nqo+p7Ww3v4YCmeBNPdfehubbB50E
 sbzbwr4fsRxt56wcVkdGZMa97wM7wATjjeQ7Gfmj7HA75e0HSHt0woJkskypzV61D4KB
 oj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=95yOM2oPjDW4I8teUQkYRlUXa8kIk+GmIx7gO72jBTY=;
 b=USkqDZLhtxF2pry70vNGEmsaDNPrhdRc1Gkp9l5onDkgXxXMRXDTFRIDD9FxRNbV+A
 +EKjQdIUZE9PRLPUc0JwzvAJDeaUOwBt9toY6sqg5z1TGXvG+E38yKCVGvxTRVqGS22s
 us+LoZ/xozyTH3sqzG7kueMxbU69rPcLGTt8KszJhb3t+hOtADnuk0onuDrRrEZIx4sf
 v178HByvq/qxrkPdWClIr20l9To6m3Uh2nPeioHVVmdv7BiYu8I0iTObuFT7LV+AU1a3
 PzkDeBUY3ogFubrHE0oqhF+1elwlj9V8DlJ1zQiGl3UN319QcWyKi/fWqLSbdIhE3U7h
 k9qg==
X-Gm-Message-State: AOAM531wG5Us20dlRoVLLAEnvLf8eMHd7tykWFpi5fiLmy8IBWGoEjfw
 IN/0JqQdhgn0ThkoNabZ5sO1sA==
X-Google-Smtp-Source: ABdhPJxlbSxnGg4ihJcp7ofYvFqtVX8rwXaySdYUqfwyOnXJUtvZ0NiapTjTqylZZvzzNHeBMF6Y+A==
X-Received: by 2002:a17:90a:578b:: with SMTP id
 g11mr2051970pji.76.1641891104660; 
 Tue, 11 Jan 2022 00:51:44 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id j4sm9447598pfa.149.2022.01.11.00.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 00:51:44 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2 2/3] dt-bindings: Add dma-channels for pdma device node
Date: Tue, 11 Jan 2022 16:51:26 +0800
Message-Id: <5db314b798cd9cfcb5cb61bc56515220b7d50315.1641890718.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1641890718.git.zong.li@sifive.com>
References: <cover.1641890718.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_005145_453966_35D6BC9C 
X-CRM114-Status: UNSURE (   7.87  )
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
