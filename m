Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072A2ECAAD4
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 06:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYSCuq/4QQmWuFqGzsGyAx8jzj3k3amBdv5TpZFUmkw=; b=zlCUntesFsWen0
	hezFhqfRG35HIM9rySbLyRcVz9WKtCzsAqp3mReizkUuS+XIg6h1TOGzE+ETzKk+5WRGCzW/r1gZt
	Hzcgr2oG44gpVm6PYfg3CFia76brZE/5gkekYM7tFtSezdTRtgya1rWvmvbM0iL2P3tInS59F+An8
	V33ApzHq169CQPQdGlmClT20kN00igyMFdRGEp0V2nTrWWbLwwT3fJfpUwU0Yxpdg/cM4eXv8CuvV
	XJXl1YPfftM6GxuNiWehYCDWkk3xgwcvUCQ1Wc+k8+6KrmfR2SUTxuLovPZDqfePgVw8Iw3RXFyyb
	GwnkToi0Rcu4CQvXCm7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSYAG-005EQe-FP; Mon, 29 Aug 2022 06:22:28 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSYA2-005EMQ-4J
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 06:22:15 +0000
Received: by mail-pl1-x635.google.com with SMTP id v5so803157plo.9
        for <linux-riscv@lists.infradead.org>; Sun, 28 Aug 2022 23:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=5qFR00BMuGJipLFoaj2azG9jU2Eo8KYkvyGJ+j0iod8=;
        b=J7MVpEl/nWCi8C71UpWMWf8LhSM/YOsgH7uv8oq8L+8OxEhIVRKRhvRxc9NvBUhI5l
         MdMdDS0+t6zUjS/ZnIpP7bYBD2vUOBIFlEEs9CSaIDTJtCslGdyuAv8KYm5VX9x/194A
         /BZdONbraQtNdC6aTfrJ96przgMqPbnf2YCjk850bPA5a4xo2nuNhaEgXuTYYmKQSysD
         bZFbzPSSQZQNYCZ+V/2TWr6lw3Ngo0lvsvOv9z/T8Xidm9RvcUzcqlzBAtZqh1jOTjWI
         0IFz+rJfEAwDhUtBd9wPbwkhIibKhndCR4In+p128U9vf5kxNlTeeQLa1zt20TWJRc7G
         trFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=5qFR00BMuGJipLFoaj2azG9jU2Eo8KYkvyGJ+j0iod8=;
        b=DIbxlV74GhkbQdlEujXShOvQfIDiH8boLvyFegDgDydw5tNss3+npXRltr5aunJjRQ
         9fKiV8GPrOseu8Tjx8lul74buUvDibHTOC96KBHfNctEA+nM/5T0AZrYiylMIEvuRC3q
         Rp6l64KG+7IZ/lmXaDIq8iXcYNFDSWfzl50NFB+nfxrX41ObRpPZU8l9/YcHxyDWwLXf
         mqn01fEPgu56AtTjlOibbAWH0bo7Lk8XAxuTFhsgNQiseAYFwMf7RZhJNFkyK+Hs5hya
         eOv7x/ctydCmgGVVyFOsKVaRqhQfTytBi0K8KuxbzbSwXqQqLnYqTUruqpRbH81xkE36
         Tkkg==
X-Gm-Message-State: ACgBeo3fPU1x4EAW7XCadx0eE1QK8WVBf68w6I+GaJTOraPEbOWaqVYI
	SQzlI/iYJNu5fg0PAFJDeBIc5w==
X-Google-Smtp-Source: AA6agR7jvBdZOH5tNUpYmOqD9WuauCQXx1RiCeHYBEQPYpN4K7JdFayWiNaD2bfyIGZLJ0G9qsyDHw==
X-Received: by 2002:a17:903:32cc:b0:174:e627:4909 with SMTP id i12-20020a17090332cc00b00174e6274909mr1332677plr.67.1661754132424;
        Sun, 28 Aug 2022 23:22:12 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id mp10-20020a17090b190a00b001f333fab3d6sm5817972pjb.18.2022.08.28.23.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 23:22:11 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 1/3] dt-bindings: sifive-ccache: rename SiFive L2 cache to composible cache
Date: Mon, 29 Aug 2022 06:22:00 +0000
Message-Id: <20220829062202.3287-2-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220829062202.3287-1-zong.li@sifive.com>
References: <20220829062202.3287-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_232214_188899_870B81C1 
X-CRM114-Status: UNSURE (   8.40  )
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

Since composible cache may be L3 cache if private L2 cache exists, it
should use its original name composible cache to prevent confusion.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
---
 .../riscv/{sifive-l2-cache.yaml => sifive-ccache.yaml}      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive-ccache.yaml} (92%)

diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
similarity index 92%
rename from Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
rename to Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
index 69cdab18d629..1a64a5384e36 100644
--- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
@@ -12,8 +12,8 @@ maintainers:
   - Paul Walmsley  <paul.walmsley@sifive.com>
 
 description:
-  The SiFive Level 2 Cache Controller is used to provide access to fast copies
-  of memory for masters in a Core Complex. The Level 2 Cache Controller also
+  The SiFive Composable Cache Controller is used to provide access to fast copies
+  of memory for masters in a Core Complex. The Composable Cache Controller also
   acts as directory-based coherency manager.
   All the properties in ePAPR/DeviceTree specification applies for this platform.
 
@@ -27,6 +27,7 @@ select:
         enum:
           - sifive,fu540-c000-ccache
           - sifive,fu740-c000-ccache
+          - sifive,ccache0
 
   required:
     - compatible
@@ -37,6 +38,7 @@ properties:
       - enum:
           - sifive,fu540-c000-ccache
           - sifive,fu740-c000-ccache
+          - sifive,ccache0
       - const: cache
 
   cache-block-size:
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
