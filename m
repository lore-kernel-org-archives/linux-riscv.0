Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BD9C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 01:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ovS+a87f5/1bGBBTgGqVZrtLvQehpW14LbnDDTFjls=; b=33HGVA70JcNPsO
	PuxiRL1pFUgcTlMXb20kL93CeRsmONZf61Ar2JyewJpSNF9L/AmEMp5VumIUNF81nzDe+fCLxo8b5
	SAqmdfdAjwuKlHyY4nBT+jhKRbPAOUC8HJlD+KtJqBVyTbG/ghepCuClJW7t+O+UCNcLq3bg/QWhe
	97A0eLcRcOnNSN3yGUiEHpMELfWlyWBprBtusYGR7k38pMwZWhDwCzstvZRZQNkJtcJxigaRucMt2
	KGQrZ4XBPVM8RqPdBE4+nsgCC7yvogGqAAaQTwh0qVH5xFxLvvBKdWNsP9BjmhOy54Eqfkooxs98i
	0N2uHZmpQKHyohTbWr1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Gvw-00DCNa-Hj; Mon, 17 Jan 2022 01:35:44 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Gvt-00DCLh-44
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 01:35:42 +0000
Received: by mail-pg1-x534.google.com with SMTP id s15so2780715pgs.1
 for <linux-riscv@lists.infradead.org>; Sun, 16 Jan 2022 17:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=95yOM2oPjDW4I8teUQkYRlUXa8kIk+GmIx7gO72jBTY=;
 b=P+GoisCraOgxlHu4ekz372AMVjqGk0k3oxAotFVY+JXZ1wKhghK/9VUBiHjSULBAuP
 YT4wwsz1owUO6iPKiWsGy1oGSOL98t8npnafFRWj4DEjOXLcNTXLnrLnipNYmy/X/59V
 zv0G3qMbqQOTkecphSBHdfCzauar+Qn4EvJPR8jFtiEevja0Dtfpo2IarctGfKHjFxDk
 RDRT+OUyc72T9apyF/om+OYvNxSz/TyAz0HE3JwmeR91oHCM5yiG8rB9AraAmv3V5Uyr
 V34ti5X4PUmue5qVTDpJii8D9glNa22wkQgNu9rqk8ukaXF1h0hiqtROVWDQaiPGjKfM
 7mFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=95yOM2oPjDW4I8teUQkYRlUXa8kIk+GmIx7gO72jBTY=;
 b=xzNWcrRP6siDE9x/zagMKyjK+WTRsRc/dEKeUctwLyzg3UmPiH+QoX1lc8GuUEvv+y
 bUapLEGb5mOXIEzvm+GAxSWo5s2hFKB2eCd7NtnHiRP8hIwB+o8yXKw9D/8moFV1HzDz
 wQhUKDx2wOADNGPHnImkeFn0VPkFAVMa3AtXzrX66w7pcV8YQe2IZ8Q5yUdPAKPPSeJt
 WBjYKzWrsGc7T+Jp2nvDGeLs+TRs+4gQFcpR8VZGgHcInqQHGTSyKL+Sl5SODYi8C7eF
 8aVMS2ICgRA/TcbQjoKUDFS5xbLdMYpR9pMO0U8II3DzCwlmFMWlIzqgtJ1hFQfjrV8v
 VydA==
X-Gm-Message-State: AOAM531nBwjXt9NMiqveO7ZwnODFCxZ5FQ6iwTUfwhLNP/5iBc3Jor9f
 QInyOwNZri2MFWUrrFq9oI29AQ==
X-Google-Smtp-Source: ABdhPJzYYuCt8lJjXiFcWFdBW421Oc4GF3QS64Lff1lAlXxFDNO5aZc7/9nqJvZybIZwWwo2dzrwBQ==
X-Received: by 2002:a63:284:: with SMTP id 126mr16642095pgc.328.1642383340489; 
 Sun, 16 Jan 2022 17:35:40 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id l1sm10008335pgn.35.2022.01.16.17.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 17:35:39 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v4 2/3] dt-bindings: Add dma-channels for pdma device node
Date: Mon, 17 Jan 2022 09:35:27 +0800
Message-Id: <5db314b798cd9cfcb5cb61bc56515220b7d50315.1642383007.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1642383007.git.zong.li@sifive.com>
References: <cover.1642383007.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_173541_184667_3AFB4BD4 
X-CRM114-Status: UNSURE (   7.57  )
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
