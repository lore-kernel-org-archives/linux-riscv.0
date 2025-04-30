Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E567DC369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 03:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0e5GEmZ9H6TvIVkapxpsWvFM9njGd7re6iSd9ZW3pnk=; b=wRFCbzEbwJqq6L
	cBYo7XVcbjFiWnH4G/8He5NQS/u2Swm4jwpVU5WXLljZxvz68QjbyDqOYbiWQvLng4U8H7nl3D6/g
	CVKxlEyFxt/nFt1kpoFImh2zO7hC7tSZLOWe5Y29YfuREVwHsamKoRE1QXCdsLIu2Txhg7+QkJabQ
	wPo+dxBFhNevcn9EPo1PdAdgvy1lgHJ2IJvlKCVAKPYxzB5O2qYu7Ut0QhNfZBEeAFVHJA3qx95H6
	o5G5sqU3iSIrTDVmJX/yPUcrffjuDd7kJlupFZB2IMi4jNZ1S2G+EBYcn8h/JWdDg/rG6jHtN9fKk
	fvHT1bO+t3oKfw5yO6PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9xvo-0000000BZZT-44ed;
	Wed, 30 Apr 2025 03:16:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wtf-0000000BUqz-39OL
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Apr 2025 02:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=R4Oe7PG99/AZHHENXUgxt/svqannmrv3ouX9muUCFhc=; b=DpuPRFRpKlHWUt4ql0eOmU513p
	v4iPrC/VCUa41wFHs15c9F5c6+KiBmHZ+eUz0jvqEqozbtc3tVduSJXvsWIa7jVglNFWp2KSd438S
	/xiYn7oSEa7b5rf6nKN/Jb8Dbuys8PCnpyRJv8OH1R6WHqVk/hMKClQ+qVCOv334SZWpx+lLNtjOF
	cNTcRnHvs3BdiIRUqi2iZVp1/DFrv4MZT3qRfzKQ8UyvEOSAyQeM6h2LrbJsvjiDYJWtyfA3jWA2n
	HtEuY/zsi0s8055bGktW6r0Ap3jPoY+ASp+bp2MOJAzcaq1uSC4CIJQrjdccjF9B+ckGjf/Q3mu5u
	r9flxqdw==;
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9wta-0000000Ddam-025r
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 02:10:02 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6ed16ce246bso37010176d6.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 19:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745978993; x=1746583793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4Oe7PG99/AZHHENXUgxt/svqannmrv3ouX9muUCFhc=;
        b=RrXyL81e97SDLHevHUsmU38ugHaQvLZifKUaRbHzvQhOwkNSvJNoOIP05TdmeNZrLX
         rmuwyPDiPvIFOqhfDegFR0ze2BQVjG0n/VuSRiYzKFzVD2D9+JaxfHdGJL5G8absSeG9
         HRqmak5DgDbMtzQeAuPuW+es9tg2zMWzW9ZAshLdwf3mdYoBok90M3s0yp1z9iIW9Eb3
         scqucDzvJ0budU0uJJkjSQYF39j2yoysUOWMoZ0RpPOQqbUv1vBQboZ81wEdyi9fo1lM
         1h/jZYxVo/y8Y/+VXkgcrouFmSt5X+Z3PVqctUb1dcObACq6fcBlUnZMakc8J0RJtIQg
         q36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745978993; x=1746583793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4Oe7PG99/AZHHENXUgxt/svqannmrv3ouX9muUCFhc=;
        b=iR8SeO/a7aX0iIVFmBrOAOczwbrPXyqmLdxzqnngImsx8gswTUDoZhgr8itT5cKNa/
         Xd3O2324cSgywmPJ3WfLv+beWiHeGTA8ori2oETIQg1AR3A3XVy4J73XdFVwDwqfNjbA
         OOtC/ZOEnNp2IlXOpPXCHqykh8FN/XgRmKGyvUDcAmUkd9fK9zr6OB/0RBS/UpTT/nva
         t4dBqFuqySmYr7zHR+uk0vt5EkfRR1RfNRhXnu8cdtRhZTpx6alsUQ63PkASSMh+2uLt
         TMDlmAFw/8ep8QOFWviHxD5aiqBYNqfHfK+QW12IKN7j9QnEMQjiw+FY/nsQPqHyQMkL
         xBOw==
X-Forwarded-Encrypted: i=1; AJvYcCWtyMHAWqW9wgBP5yyY5DxdRsrq6hS2R7QAgGTzYTikNUljlZCOF7hp6cEiyKWDPcO2mPMa69ORt61flw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn8XuAD+9uEjPdWSYfANPX2x9TIS6zhWR8WPex+M/4FH0KTBoI
	+6ptSXMrOt5gtFrH1OuIU81AjIb9LnFU28IAaKZtEZ2Z4HUhc2o5
X-Gm-Gg: ASbGncvJWpNW4r0PWU+6NZ4IN2hYD/I/KVLz+wZtC4mWg2di3RkMK4L8WUuMC9v9CSE
	5m4SjvgS4EigrPOMZ5aE+lsCbkU+Y8bmr1NBiz2XN2F50WnOZ6+zraeakY5IStI6x5/3GvqoNdY
	oUSanS8c6CMjdYv3Qz9WnF6UIOhdjfSEQGEi3gTjX3jOe3d/nGknzx8OOR5tn+26l1oC6rKSAB+
	blFvanDnLV9Spm1ub/c6QO/vKCjg7dhRVJ25zRectU/TOfwOj1RPo10hvV4q6XZ5pMXE9fxyDOi
	X0agRO+3Ob7lhElg
X-Google-Smtp-Source: AGHT+IFl/15L7e190rP7iw7nPmXMdXFhJpjehDYpux7CYj2PcXkTXFwv+NJEHvRt1t5lmdRnXR6OJA==
X-Received: by 2002:ad4:594d:0:b0:6e8:fe16:4d4f with SMTP id 6a1803df08f44-6f4fcee0e3emr26949656d6.26.1745978993602;
        Tue, 29 Apr 2025 19:09:53 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4fe835410sm2791136d6.71.2025.04.29.19.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:09:53 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/3] dt-bindings: clock: sophgo: Use precise compatible for CV1800 series SoC
Date: Wed, 30 Apr 2025 10:09:29 +0800
Message-ID: <20250430020932.307198-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430020932.307198-1-inochiama@gmail.com>
References: <20250430020932.307198-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_030958_215166_42FB9C7D 
X-CRM114-Status: UNSURE (   9.31  )
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

As previous binding uses a wildcard compatible for existed clock device
of CV1800 series SoC, it is not suitable for existed requirement.

Add new precise compatible for existed clock devices of CV1800 series
SoCs.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/clock/sophgo,cv1800-clk.yaml           | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
index 59ef41adb539..c52e130db887 100644
--- a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
@@ -11,10 +11,15 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - sophgo,cv1800-clk
-      - sophgo,cv1810-clk
-      - sophgo,sg2000-clk
+    oneOf:
+      - const: sophgo,cv1800-clk
+        deprecated: true
+      - const: sophgo,cv1800b-clk
+      - const: sophgo,cv1810-clk
+        deprecated: true
+      - const: sophgo,cv1812h-clk
+      - const: sophgo,sg2000-clk
+      - const: sophgo,sg2002-clk
 
   reg:
     maxItems: 1
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
