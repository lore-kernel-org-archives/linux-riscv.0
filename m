Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4276C6FA86
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 14:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JlyRd3BAMOku1whVy55WCHN6RiFGgMjHilATcOpN1hY=; b=4a6lSFFio8TIe9
	g77TMBpUK2jGRp+rAovBR7TSbUNtX/NZtwvy4PX/lVlRGUIAtqP+aOyXVWucYAN6xBFyAAS2TUJ0O
	10T/VMxrNtIGLZWPEaxQ8NRQDCJrELQQk6QVgiUBTUQjPWEqHy+mthbkeJmwkkHgednUsC748JM18
	kUOKJHCw/3qKVerNCBfaNMiwIuxanR8uvdMJKg3E5kJQf+hrc8KFMSynU4knp78zb+Iq6006YcHQN
	Hktq2F2lraP6gCPGXjQccPemxjlkeMTQy/LVNHzKDTp59BJrj6FcJgX6Kq2hMoFrf8sQgcNfET9b+
	FkFdJX8jqoYPMjq2lIlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIli-004qEa-69; Thu, 08 Sep 2022 14:44:38 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIlg-004q6g-7z
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 14:44:37 +0000
Received: by mail-pj1-x102c.google.com with SMTP id q9-20020a17090a178900b0020265d92ae3so2545260pja.5
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 07:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=1O4MLVbmX/2gc1Qfnxh9Du1G8eStsMcSf2LwqkEqzqw=;
        b=CF4korFnZ5botkl98V+ysIFWWuooEKPxVpYRIYrlQXlJ0Er70IRasrkpMnG9/WD29r
         HmURGNeghbycuovGIHa+Kk7xNgx1ZQ7pVJUGkziOtFTfkHzK1QKnaUKwx8c7n4DnEXFh
         snsW9yyPo7pirx0A4pfzQ388lif5TmabuC39IGnDsAkv48MP4jeXNi5Q4muEu58hq5lE
         j9cl1E/o3UnYAGZhRNfXt9dsXJ5prGoQXcHLDjvyA8HfCmrv4lAW0YKEFnlZNWvG5RB7
         a8McQq+bWHVvIC5i3za6GWi1y7MuJkE1DV7ygt3EOvcpZIIRoBvRVzBKoB399ZUXkWkO
         mhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=1O4MLVbmX/2gc1Qfnxh9Du1G8eStsMcSf2LwqkEqzqw=;
        b=m3qO0iuvu56oE0TgaCVHuEmCzPOruIXhvPlVT8NMU6Xs4zAZwfyWIFP6QI2rTM2T3x
         EJYYffkJy8V3Z+XXMR9u36GrZExQvFV9EPHzbzvdDZRRGXALHhniEYkN/ODRiwF5wuP7
         sWln3/kGc6mxWDmx+ICAz8sxsuZPL5SmJIhTXWubQFUjSdrXY+x5q4KTdBLg7uUkJlrs
         czphvP+EZf0CMs4RS8w2DJC0IV97c3TrYukfIJtGo5xuJmUWkCat/VzptrF5CQveS1u+
         ad7GcBbavs0BjPaR0gVTb34XdzOgzGLsLgwLi3Au9nMgMA1P6wxgzPgZhWFRKlRhNy3o
         7jtw==
X-Gm-Message-State: ACgBeo1i5wjuyjxSBZyv40E6NZhf9rt3smDuBO2UfS3RGpH4ySZUUn6E
	YK9KXOFTCh6g0CvCA7KTnsApOQ==
X-Google-Smtp-Source: AA6agR4fMCwBAw9So2S8D12dXe5cZLB6a/xZwSPlAPYJak+1KFwxCj6yOCUEkLh9GcOh/8oUsn2oiQ==
X-Received: by 2002:a17:903:264e:b0:176:e9d3:64b6 with SMTP id je14-20020a170903264e00b00176e9d364b6mr8255573plb.172.1662648273289;
        Thu, 08 Sep 2022 07:44:33 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b4-20020a170902d40400b001750361f430sm4484728ple.155.2022.09.08.07.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 07:44:32 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	ben.dooks@sifive.com,
	bp@alien8.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v3 1/6] dt-bindings: sifive-ccache: change Sifive L2 cache to Composable cache
Date: Thu,  8 Sep 2022 14:44:19 +0000
Message-Id: <20220908144424.4232-2-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220908144424.4232-1-zong.li@sifive.com>
References: <20220908144424.4232-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_074436_305462_94DC5168 
X-CRM114-Status: UNSURE (   9.52  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Since composable cache may be L3 cache if private L2 cache exists, we
should use its original name Composable cache to prevent confusion.

Signed-off-by: Zong Li <zong.li@sifive.com>
Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Suggested-by: Ben Dooks <ben.dooks@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 ...five-l2-cache.yaml => sifive,ccache0.yaml} | 28 +++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)
 rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive,ccache0.yaml} (83%)

diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
similarity index 83%
rename from Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
rename to Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
index ca3b9be58058..bf3f07421f7e 100644
--- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
@@ -2,18 +2,18 @@
 # Copyright (C) 2020 SiFive, Inc.
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/riscv/sifive-l2-cache.yaml#
+$id: http://devicetree.org/schemas/riscv/sifive,ccache0.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: SiFive L2 Cache Controller
+title: SiFive Composable Cache Controller
 
 maintainers:
   - Sagar Kadam <sagar.kadam@sifive.com>
   - Paul Walmsley  <paul.walmsley@sifive.com>
 
 description:
-  The SiFive Level 2 Cache Controller is used to provide access to fast copies
-  of memory for masters in a Core Complex. The Level 2 Cache Controller also
+  The SiFive Composable Cache Controller is used to provide access to fast copies
+  of memory for masters in a Core Complex. The Composable Cache Controller also
   acts as directory-based coherency manager.
   All the properties in ePAPR/DeviceTree specification applies for this platform.
 
@@ -22,6 +22,7 @@ select:
     compatible:
       contains:
         enum:
+          - sifive,ccache0
           - sifive,fu540-c000-ccache
           - sifive,fu740-c000-ccache
 
@@ -33,6 +34,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - sifive,ccache0
               - sifive,fu540-c000-ccache
               - sifive,fu740-c000-ccache
           - const: cache
@@ -45,7 +47,7 @@ properties:
     const: 64
 
   cache-level:
-    const: 2
+    enum: [2, 3]
 
   cache-sets:
     enum: [1024, 2048]
@@ -115,6 +117,22 @@ allOf:
         cache-sets:
           const: 1024
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sifive,ccache0
+
+    then:
+      properties:
+        cache-level:
+          enum: [2, 3]
+
+    else:
+      properties:
+        cache-level:
+          const: 2
+
 additionalProperties: false
 
 required:
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
