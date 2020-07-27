Return-Path: <SRS0=GA+h=BG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FF7C433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 08:27:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E234420714
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 08:27:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MJBNUzwJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="T/c7E3Ex"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E234420714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tH32MgSb5wLgXweUAqEoQEnIj6WCGqFwZXP0eIrGkm4=; b=MJBNUzwJ6HAx9J0PtKGxO3Ylam
	eENsRvWmDknsb23xdaeVA4VNmo+6MlGTSRkzw5yYq2ZJjHHaJExP+dDduOyRo/sa0d1z/bffd2RYx
	L6gR9uZJ3RQL3yRcKmYTLG0pKYOC5BH3KeR243Ropy/pYu9+yJOCPOKeZUk440L9oHCyN9IFGyFdV
	PFxakSxsAcn+WgPcmZmxZw5T8iNoEx89cPL72xcB9mFeWGmcfKzBaxpceM4y2dh6jy45lznktQbSq
	z4G3FhOQikG+IZiiiXFCDVUxF6deq6Y/wslBri454c8EHAgIdbzepBoc0DwNLHPmHzNR+B6BIC7Pi
	nXFu7M1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzyTl-0005w7-Lk; Mon, 27 Jul 2020 08:27:25 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzyTg-0005v1-Q2
 for linux-riscv@lists.infradead.org; Mon, 27 Jul 2020 08:27:22 +0000
Received: by mail-pg1-x541.google.com with SMTP id z5so9052272pgb.6
 for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2020 01:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gl2BlTH+1eWV0HwxRVuyoR4jF8PryWWFatADEqIuY9I=;
 b=T/c7E3ExZc/a3T9wC6ZU7ojC6S00x4SfxZNUgsza3Hb4l/SUK4lyMIFfg6d/tIqPxi
 1R75wRIINQm8CN0ubLmuW0M0Bjrce44jw6IahYl6KFbaxySVVlu4oq1X2zF52uVe2Opa
 xsGPaospbKc8zhxIVnxSf87XfkjMQEuXV4B9eG0DnoaVR54Tv1KVnJgXucoqrNkqP0Pu
 9AFoon3j+8o96dnlg0d1eHXuFNG3evjJIfhb0h7WWx3vCIP7t9+vzI63/x8s32AVPPs6
 ijDGtFslb0S7CrGeNw8KaCufhqFISvWiR3QtEHI8hvUTZIsKIZ8Ginm/uUbHUAGMPIVv
 ZZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gl2BlTH+1eWV0HwxRVuyoR4jF8PryWWFatADEqIuY9I=;
 b=XHhko3XmWbr2StwF0sgpiwB5CElaOvtufvsz/y9uRdroYFpaOoDqXWmyrn1z7uZATU
 h+DIvx5NCm517xjyUp9kXdpBGYZl49tJ9OjGwf+kYQZ6o8edrcSwVP9pjfkWcT7vYxGf
 9F9/bvEzdCOI6nQIBF4KDxOue4wBNurDZ5oYKPoSAMzIZ9QghsvYgJcwvv0zy7g/ox+c
 Nzu9MoSynSN8SbyC5vjczSjaRAczT6aJGm+m+9MOTdCuBNH7e5S+AsHnB8ZIR6VCRRff
 dDK6Zqil0v3vA4kjDsj+c72AcZZNin8D5LZtdueLeA33DVkuZYHjkie800XurqxUnL+m
 e8uA==
X-Gm-Message-State: AOAM5313GGb4clWwcGP1mmi6qzd8L5rYfdOpwxP0qdftmmMXqkK87tcn
 OdMYntSyFZoSWayMdGNMQhR/cg==
X-Google-Smtp-Source: ABdhPJzfjRpBp4pxhQFkNexMd7BUxakmFciGWdm1ULvgPdouK0N5dJoIH9cO2IF/veh9p3go98BCSg==
X-Received: by 2002:a63:7a56:: with SMTP id j22mr18783630pgn.293.1595838438346; 
 Mon, 27 Jul 2020 01:27:18 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id ob13sm7667503pjb.3.2020.07.27.01.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 01:27:17 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, anup@brainfault.org,
 linux-riscv@lists.infradead.org
Subject: [RFC PATCH] dt-bindings: riscv: Add YAML documentation for PMU
Date: Mon, 27 Jul 2020 16:27:13 +0800
Message-Id: <a08d725612aac35f30b3c422d3617bc4c733d8c7.1595838303.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_042721_555933_DE03CFF8 
X-CRM114-Status: GOOD (  11.59  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for performance monitor unit. It passes the
dt_binding_check verification.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 .../devicetree/bindings/riscv/pmu.yaml        | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/pmu.yaml

diff --git a/Documentation/devicetree/bindings/riscv/pmu.yaml b/Documentation/devicetree/bindings/riscv/pmu.yaml
new file mode 100644
index 000000000000..0c49039a5d3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/pmu.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Performance Monitor Units
+
+maintainers:
+  - Zong Li <zong.li@sifive.com>
+  - Paul Walmsley <paul.walmsley@sifive.com>
+  - Palmer Dabbelt <palmer@dabbelt.com>
+
+properties:
+  compatible:
+    items:
+      - const: riscv,pmu
+
+  riscv,width-hpmcntr:
+    description: The width of hpmcounter CSRs. Default is 64.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  riscv,n-hpmcntr:
+    description: The number of hpmcounter CSRs. Default is zero.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  riscv,hw-event-map:
+    description: The mapping of generic hardware events to values of hpmcounter.
+      The key is the encoding of generic hardware events, and the value is the
+      actual value which is implemented by platform. If there is no a key-value
+      pair for specific generic hardware event, view the generic hardware event
+      as not supported. CYCLE and INSTRET be mapped by default, so we shouldn't
+      list PERF_COUNT_HW_CPU_CYCLES and PERF_COUNT_HW_INSTRUCTIONS here.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  riscv,hw-cache-event-map:
+    description: The mapping of generic hardware cache events to values of
+      hpmcounter. The key is encoding of generic hardware cache events, and the
+      value is the actual value which is implemented by platform. If there is no
+      a key-value pair for specific generic hardware cache event, view the
+      generic hardware cache event as not supported.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  riscv,hpmcntr-of-event:
+    description: The mapping of platform hardware events to allowed hmpcounters.
+      The key is the platform hardware event, and the value is the bitmap for
+      hmpcounters which support this event. If there is no a key-value pair for
+      specific platform hardware events, view the platform hardware events as
+      supported by all hpmcounters.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu {
+      compatible = "riscv,pmu";
+      riscv,width-hpmcntr = <40>;
+      riscv,n-hpmcntr = <2>;
+      riscv,hw-event-map = <0x3 0x0202
+                            0x4 0x4000>;
+      riscv,hw-cache-event-map = <0x010201 0x0102
+                                  0x010204 0x0802>;
+      riscv,hpmcntr-of-event = <0x100 0x18
+                                0x400 0x10>;
+    };
+
+...
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
