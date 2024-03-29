Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A90DC6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 20:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZTh++5bCyMKtz/OI+4gMptptLgwk1Js+Z0N0vF12+o=; b=NuuqVy5UwRoFbN
	i9ELmjNvt9iyIaQi8n+HOGMQUtU01fs/xi+ofFq4C3APKdtQk+oYJ17stGmK6rR/ayOyvj38d7jFM
	UFvbqlFeJk3XuoMFuQwKNhJhKrUDUVFSJiXxoxRdyK+TT8rt+rd7q6V8XzAXhl5n/VuyGkGV4UqG+
	Eoff1eAMsNLaQ6JuglNrxpzB2O0aQWTe3MhHDQCn2Auoqa3ULE5hsI33kTCnBIHLf2IY5aUOteZ3d
	38/gS1nONu53eq3djZs6unrRNng2HyCxbu1UHl+txKt+56hIGdRbZ/PvkAQpq5wBRtIQgkyMgtEXf
	RFVmf135Obq79kwdGVCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqIVG-00000001rcS-39YD;
	Fri, 29 Mar 2024 20:07:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqIVC-00000001rZL-45X4
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 20:07:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711742821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pnNZnWrnFQuL9z8tKMfOjE6Als92KSQE2PBtCEWHcNY=;
	b=PtCKABFkhGTXtKaky49aU/nwq5FfT6nPElXq4aitIzK9bEVjBDjRsf9YX8SYkGFVfdms6z
	2IYFSnacKMTbbDq+x+4KMKJoeGCeqQ+9lG49OjalVeM7/JO3JfyvVihXQtHBPgwlzsov5f
	yGCr3H3SiGX+dmC4m75BhHxLHeYJEDM=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-Rjhr4kRbPuSWVWHL_pVrvg-1; Fri, 29 Mar 2024 16:05:27 -0400
X-MC-Unique: Rjhr4kRbPuSWVWHL_pVrvg-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-5e4df21f22dso1751769a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 13:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711742726; x=1712347526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnNZnWrnFQuL9z8tKMfOjE6Als92KSQE2PBtCEWHcNY=;
        b=tBGlkKD36BBawKpwidpER/jweeOyKRx9v+Y/Pr3Fh3j7wsGtrx8kD2erlpIfpQJ667
         F25KQ2JLy78sV78wxmo0b+D/BPWwE5JF6mWHt/j3fEwgmssx3+C8Y9T9lUsRzwJZi9h7
         WcQi6ofEnSwnbRig+ntdDrjI90ZSquCgSdAAIxP5y/iniDNmaBq28ZlUjmbgDXOn+rQt
         EEwK42DA+J6WaCSlAwJY7LZbwiwlclmkhlz5SDybsNhmrJyBrZCNyXRftGT5mW80uxHe
         YdbYQNUYdrJ9pXomJBtKQVwf9MmnAjzLjfmO8odvs2XRvllELZWWIaH63R/KFsJ5FIzE
         vatQ==
X-Gm-Message-State: AOJu0YzgkyGuMaSWrNxTyMFOH9UtFqxm0ybshBszH9jbHAVoV5XO5md8
	BKFlYixaMGcEL5PfLCrEHfHivEDHB0ISvtvQKvIkrR0XCzEzU/MYkHmrMC1yjlnawCxs4wvaLkt
	xKsE8zJEzkPB/78HfW3aeYSvPFD/Lsd3kpqsnRjOyjXQW+j1tdREAtYQD+wwlb6pwwA==
X-Received: by 2002:a17:902:d511:b0:1dd:8ed:997d with SMTP id b17-20020a170902d51100b001dd08ed997dmr9174635plg.3.1711742726534;
        Fri, 29 Mar 2024 13:05:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJYw4jR0YEnb8pmE90nAgE4U0L687WOcBXmCkEU8q6jh3nVskf4AhRBUJH/lIDQYZgDuFnCA==
X-Received: by 2002:a17:902:d511:b0:1dd:8ed:997d with SMTP id b17-20020a170902d51100b001dd08ed997dmr9174602plg.3.1711742726167;
        Fri, 29 Mar 2024 13:05:26 -0700 (PDT)
Received: from localhost.localdomain ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id e4-20020a17090301c400b001dd6ebd88b0sm3830017plh.198.2024.03.29.13.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:05:25 -0700 (PDT)
From: wefu@redhat.com
To: jszhang@kernel.org,
	guoren@kernel.org,
	conor@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jic23@kernel.org,
	lars@metafoo.de,
	andriy.shevchenko@linux.intel.com,
	nuno.sa@analog.com,
	marcelo.schmitt@analog.com,
	bigunclemax@gmail.com,
	marius.cristea@microchip.com,
	fr0st61te@gmail.com,
	okan.sahin@analog.com,
	marcus.folkesson@gmail.com,
	schnelle@linux.ibm.com,
	lee@kernel.org,
	mike.looijmans@topic.nl
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH 3/3] dt-bindings: adc: Document XuanTie TH1520 ADC
Date: Sat, 30 Mar 2024 04:01:26 +0800
Message-ID: <20240329200241.4122000-4-wefu@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329200241.4122000-1-wefu@redhat.com>
References: <20240329200241.4122000-1-wefu@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_130703_123458_07C73E6F 
X-CRM114-Status: GOOD (  10.62  )
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

From: Wei Fu <wefu@redhat.com>

Document devicetree bindings for the XuanTie TH1520 AP sub-system ADC.

Signed-off-by: Wei Fu <wefu@redhat.com>
---
 .../bindings/iio/adc/thead,th1520.yaml        | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/thead,th1520.yaml b/Documentation/devicetree/bindings/iio/adc/thead,th1520.yaml
new file mode 100644
index 000000000000..80890ce62810
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/thead,th1520.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/thead,th1520.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: XuanTie TH1520 Analog to Digital Converter (ADC)
+
+maintainers:
+  - Fugang Duan <duanfugang.dfg@linux.alibaba.com>
+  - Wei Fu <wefu@redhat.com>
+
+description: |
+  12-Bit Analog to Digital Converter (ADC) on XuanTie TH1520
+
+properties:
+  compatible:
+    const: thead,th1520
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: adc
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - status
+
+additionalProperties: false
+
+examples:
+  - |
+    adc: adc@0xfffff51000 {
+	compatible = "thead,th1520-adc";
+	reg = <0xff 0xfff51000 0x0 0x1000>;
+	interrupts = <61 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&aonsys_clk>;
+	clock-names = "adc";
+	/* ADC pin is proprietary,no need to config pinctrl */
+	status = "disabled";
+    };
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
