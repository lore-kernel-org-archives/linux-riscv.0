Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A82C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 09:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MyNri3uHRGotlqSZAYECQ3u8sAbJaxCS7jRO27VMtrg=; b=EFCtSV3yREzkBq
	PatHfUQA5Kll8U/nyFfg8+g2XOTYRgs7CqEnAqx2zteYmnOLdKdeGrk+ImrIehdx0o9cxwFnx9R/x
	nUHjzlEnTOQlnCnwPW0hDPT/29LMU31eXEAVQ65VvRQlFGgOSPmTs7Vbq14OIH4AfUHyzwY/7kB9e
	VKpLqvW88tVFAXAkIpcsSe2DApbyV6T7asRKokAw92h+ejYpbHZkV51AjX3BAZduSO6sHtu28TvyY
	Y8p0PaLHHAN/fpyidgpDWSCSAOaR/yKkm3igoOR4Swzz7KVGMapHJ6qmqH/3PbqIF/WIEPrkGT/Du
	UP//YoeA2uR4Ty0UDIEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ3xr-009DM0-IB; Fri, 04 Mar 2022 09:11:07 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ3Wl-0095wE-Jo
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 08:43:09 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 mv5-20020a17090b198500b001bf2a039831so757257pjb.5
 for <linux-riscv@lists.infradead.org>; Fri, 04 Mar 2022 00:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uBjY8RLSr4Wf/RqUjGw1XSvLuEMUT8Kxzt7XGrbbTA4=;
 b=LBoOjG64D/UMKqjjSUSfIyY9paBrboCxsj/Gk30Ux0Yb8y2kWr8kPSLbNzGy9XG2XZ
 jJKBTfU6YXbux6peglEz/OoYAgwv5D7xs3apAmtrKkzbjAt9B2ES3SJA7604uFndWa+p
 GUaLKENTUVnG3n1zgZcMa9GA9rMGA0wnwIq+DQCI7UjWacOD8kH8QkyF6o0aTMgP7mp2
 0JjHtm0FN65X88abSM4OcXgWdEzFFOE9nC9+ah0WVYNODF01angmKItlODyivzSO7ypR
 lj7XJxlv87EAfbZ/E5AEKz8ScT1O0caqrF6EfKajxxRpjtIywTJoQLKQ0Lg+nErySjqK
 sb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uBjY8RLSr4Wf/RqUjGw1XSvLuEMUT8Kxzt7XGrbbTA4=;
 b=VWY0ZrltuPZDFx5s1Be860vNhvApEd4R4W/exwavHCAKhoJzr57VcLh5q4mWOvDI4f
 d/ztwXc7qxTDbguvYiKL7M7h0W3l14b5vPT6YGKMtUwVqKxtXnHrT5ijZ/E0YoqoT3LQ
 0nrU06puuWHuVzVxWFvfLrU68rHEjE5DdS+3ybdzqrNcumX3bcDKRlFgtvugddanuSUe
 HImTkfbHsH5hng2VT8jfb3i1944ZZ+Ys46vqx+TPko1e2AlDc74f3/aWvIJudGtDUkl1
 XEk3CqT+IozJVvSILGY75zZHe6vH37apBLYF9k3/o5dRQE4itBZKxh13X+h1W5xQeC71
 yMhg==
X-Gm-Message-State: AOAM530cvEuTTk4hp++qJxmDOwAj+7hTCrDu229s5GC7n3jPNeUUj6Ey
 vWfGq7UVAoA3w+cdhIgHLxPo7ZLCbaZYXQ==
X-Google-Smtp-Source: ABdhPJwogdPTQWP1HP1Zd+7+fIG0Cal3Ojoq8ZMgoufYmc6w15ueqOAsSeXr5UrPaoE8WU/Z25lopA==
X-Received: by 2002:a17:90b:1809:b0:1bf:59c:d20b with SMTP id
 lw9-20020a17090b180900b001bf059cd20bmr9506145pjb.220.1646383386342; 
 Fri, 04 Mar 2022 00:43:06 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 mu1-20020a17090b388100b001bedddf2000sm4245191pjb.14.2022.03.04.00.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 00:43:05 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/3] dt-bindings: Add dma-channels property and modify
 compatible
Date: Fri,  4 Mar 2022 16:42:55 +0800
Message-Id: <12cff3b68de1bd02a8915bd70999bb4edafaca1b.1646383150.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1646383150.git.zong.li@sifive.com>
References: <cover.1646383150.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_004307_692277_891A607F 
X-CRM114-Status: GOOD (  10.40  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
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
