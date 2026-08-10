Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944AAC5AD55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxjCrZm8FZDAlKzdPPOmSI5ibMT1jDDh1yNVwOky0EQ=; b=J50evSaZay1tdF
	+CWf4bmGv4Qy+8rnf6FbHcSOZT6WsQePB9gn4om1fJlTq0aiZMqbwqry5IGmiCy4dlwkmwMdwXCws
	fDuNnzh5CXwvv+CDGLXkbp2YYisoPBYTApqlftX3odPSXzB4NlWWmGZDeCvxLe6Pcn8hZXRmotjeS
	dYFag8TezK86C1nS51/i+0E0IGT5Hu/wmh9K6raaN5WR4nCE5Ak7cyag2Yy27iRkLBLL04ldBDMUX
	xl3XoGosOWuNAxll36FyGJWSwfOvAVK3XpZXWdPu6qWAyJfsE+ccm2RglgC9er0DJu09IFdciXVLB
	9w8ZAXySrquKFT4SPFKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRqT-0000000CEGW-13L8;
	Mon, 10 Aug 2026 15:23:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRqQ-0000000CEEG-2Bed
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 15:23:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj5th2206591
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O8v8yIaQJEs
	t5NLok5icCkr9lpo4Go8g22QAHh4O4hI=; b=g5diXRZcCw54/IoE0HVxU7Z5xRG
	bQBy6lEw6IUtpytPqpsTaNIppX96kasiMkEsPY71L11fEyu7Pq+ATnwtz35PvnBV
	+TYz57TdLJ9zRg6WhBW4DyO/dfj5LH52I16hZUDT1DXUhkC4sm9YU7jr8etn7Lx6
	65V+iyPqlZlQFohBc0pt2gSi59uy/mCr/08ix8tXdDWCLG0tCYoTsEWbgqbGjeJ8
	fXr1PVqXbhVf/AQvJZqCeWOfL8VgSa1YxGlLP3s4ATSFog4dHRWzUGSxzp2Ipeus
	dojeD5c3QHUQHPIZjfly7W4lnACKa6djnNA3dq0ntQ60aEsZz7/uQvNaqcw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v3t7yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:23:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb92868263so2480616a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 08:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375397; x=1786980197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8v8yIaQJEst5NLok5icCkr9lpo4Go8g22QAHh4O4hI=;
        b=BcbqN+Dt/Lm0YwEoBNVVPsgPkherCElnZp1kVXEb3fENhhvEflWSIkHJYk+nqEmApo
         5vxRP66cRryBHne92b4PdNbGTh9LbJk9CaABp8NIlLDQZb6zEV7yuBH9yMA/QDfULh02
         Got9zyekWnzQS6hVZ1af8sRtDsErMKGchoSbGwBFxsQ0nx7fR2AlZb+VHvXOGbpP7u9+
         8cxPGMK9i7Bv9LgWkufCEFVXZnyh+b6jn0jnkmRdq5IE/3FpVyP8oF+dCfPHVpkhYBxV
         5sYYgPoTlwrE+NMZwk/ae7tA650K4rNgh2Fmg7EMVPZ5V8hqVcT3MtkCJP1cqV+8qfx3
         +FAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375397; x=1786980197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O8v8yIaQJEst5NLok5icCkr9lpo4Go8g22QAHh4O4hI=;
        b=NVA8xsbWvIa+RRVKRTeOvNLWjBIr0mM4LgJluyGFJWDGSG9CeB51HddOfxyjp8I6LL
         fme0isn93JloKIHxSMx75VSGzbW3cD5+c6mMD5MuM3E9h4yqtsRODbqueeIFvopN9hGF
         bh3E07Noc9i809QHyfPqo42iwEQd99+W4QdK9IfxgIgd3LLgX83xPa5qmZ5323kOguQP
         HHBD83NnrGlKVSEz8Muyl1gDZTdE8H/Xj5ukC1OsgoleoEA1riLt4bmSUE6VNhYvZYna
         5Q5OBd+wkzpgUvRGCwmNe9wSTopD4HDJAmavwhJEJNRpPVJHnMOX3UsoNRIzgybyjKUa
         Jubw==
X-Forwarded-Encrypted: i=1; AHgh+RpFyWzRczZlcFL0DB8J29xbmeGu8ZC5ynH35fek6FtuLKHMfoi2+KlRR21pnVdkiwgjbhbiv+nJMsWXsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yya+zUH7PAyyAd1xO20AtG3opICH7Jia+C3/l0VHgYGjgqb1Dc6
	siBrKSmYvzw2UJn3O+Wv4pe2kzV6c4fm58nwal/clX7aA90R4REYYJLMhLPXs3JDk1O556hIVg1
	HVojZlk5RM7+dI8c0TgLr/D/EAI9iEHaMx/Z86xOcoUmMLWUmsXwIHqRvHYWSOfxcBPYYKBs=
X-Gm-Gg: AR+sD128+ysX38t8/rK0lkAZ5h9vWI1TfEkRyQBBk1cc1eS49dX4ujNV0emus5EC6Is
	YsetnwQED8skbSU0TuD515J3H+QW6YX8wyFdF4b3w7XpFBp2c3gAd4m6GSEmX6GsFI41+uBleRI
	2AcePlYQ80fS7g9y62CIcXDa94GmlezYaOJ1i2Y+jKL4IICuTD72qP4OaYFvLeixjgoojzdbJXO
	qYcvwAqDbdeVD7NUVq1G7vniRWUijJR4uEuM2kiY8SnqPZIadYzWBLOgYOtKz2BmF7+dkaEaWUE
	+5uMf2kHy6iX9+nmHyup4cv7vlgF96r9rJcEWb+KIZY7tC0desOxEfQ/T32rzEFwGOpnn860GDt
	WKu/1x54lFcA/kv1Wf3KS1qnkiyAsWDcwY2CVNJTPWEody0HxSWHeOEPui30wKnjgEfyZcZZ3Or
	wZF5dyw3mv5OljEDF6+aqtJiqHPA==
X-Received: by 2002:a05:6a20:e347:b0:3bd:3800:7538 with SMTP id adf61e73a8af0-3cb85ffdacamr47203017637.33.1786375396811;
        Mon, 10 Aug 2026 08:23:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:e347:b0:3bd:3800:7538 with SMTP id adf61e73a8af0-3cb85ffdacamr47202942637.33.1786375396337;
        Mon, 10 Aug 2026 08:23:16 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:23:15 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [PATCH v5 01/14] dt-bindings: Add RISC-V trace component bindings
Date: Mon, 10 Aug 2026 20:52:03 +0530
Message-ID: <20260810152223.3946743-2-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: XSKKyPCw4oQGPgYq2HAK2zj9uvJPICPe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfXzP/qh4IpJ72v
 gWxp4s4NtGWavjkhE8CYtopEc/SOhHFiscffGRypqfN0cfpc23H0zAB8eZGWzAm3tdOBkCEMdoO
 uMhOvtgfGC7F7vlVa+S4B4ixlXxfxNuCnhmByjNkavu4JgLounAtimL8BcBtcgiSACZNGsZ/wU9
 Y71XIbJWnSw5e5WXmBVLOz52VnYKEnKNHycgz60w8UItZmXLLB6VWms9Pldy/YdrasSGs5CK00A
 84C66iqU1GDvWKRIhaSwO9t9p2RC+CBFfhMr/yoe2Q4/crh+jCOjbX300npCHj0rMCa5Q5FjJnV
 4I3Ga+fTOTFSP+DJMqRKISsKfvGkGM06uj5bc1J0f/Vmd6kKj9Ajj1eUIGFY7BNeET0xPxLmaJI
 PKo0as9FnEQvwWcnDdCcnSYJjOLugmRyOaiGjsWKmNZ+B2Au98ZhTL44wPlqVPvg5qP/Hlws2Pt
 SjFopJrkLS6/3icxM0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX9gSLYVooBLTW
 yWZKLe2742byWCry01ulUM0BKkmeiqY6WBpey/lN+TUp69tuifTKQTFKpZM+aySM4EkPfR/aZOx
 bAocUPbNBfUSmO3WXXJzzHdK0kgxC8g=
X-Proofpoint-GUID: XSKKyPCw4oQGPgYq2HAK2zj9uvJPICPe
X-Authority-Analysis: v=2.4 cv=c+mbhx9l c=1 sm=1 tr=0 ts=6a79ece5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=W-_n0kkjAAAA:8 a=f9mqD-BOXdQ1R_-L-AkA:9
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_082318_583244_8B9D6579 
X-CRM114-Status: GOOD (  17.33  )
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

From: Anup Patel <anup.patel@oss.qualcomm.com>

Add device tree bindings for the memory mapped RISC-V trace components
which support both the RISC-V efficient trace (E-trace) protocol and
the RISC-V Nexus-based trace (N-trace) protocol.

The RISC-V trace components are defined by the RISC-V trace control
interface specification.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/riscv/riscv,trace-component.yaml | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml

diff --git a/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
new file mode 100644
index 000000000000..bb519bc4a163
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/riscv,trace-component.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Trace Component
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description:
+  The RISC-V trace control interface specification standard memory mapped
+  components (or devices) which support both the RISC-V efficient trace
+  (E-trace) protocol and the RISC-V Nexus-based trace (N-trace) protocol.
+  The RISC-V trace components have implementation specific directed acyclic
+  graph style interdependency where output of one component serves as input
+  to another component and certain components (such as funnel) can take inputs
+  from multiple components. The type and version of a RISC-V trace component
+  can be discovered from it's IMPL memory mapped register hence component
+  specific compatible strings are not needed.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qemu,trace-component
+      - const: riscv,trace-component
+
+  reg:
+    maxItems: 1
+
+  cpus:
+    maxItems: 1
+    description:
+      phandle to the cpu to which the RISC-V trace component is bound.
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    patternProperties:
+      '^port(@[0-7])?$':
+        description: Input connections from RISC-V trace component
+        $ref: /schemas/graph.yaml#/properties/port
+
+  out-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    patternProperties:
+      '^port(@[0-7])?$':
+        description: Output connections from RISC-V trace component
+        $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+
+anyOf:
+  - required: [ in-ports ]
+  - required: [ out-ports ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    // Example 1 (Per-hart encoder and ramsink components):
+
+    trace@c000000 {
+      compatible = "qemu,trace-component", "riscv,trace-component";
+      reg = <0xc000000 0x1000>;
+      cpus = <&CPU0>;
+
+      out-ports {
+        port {
+          CPU0_ENCODER_OUTPUT: endpoint {
+            remote-endpoint = <&CPU0_RAMSINK_INPUT>;
+          };
+        };
+      };
+    };
+
+    trace@c001000 {
+      compatible = "qemu,trace-component", "riscv,trace-component";
+      reg = <0xc001000 0x1000>;
+      cpus = <&CPU0>;
+
+      in-ports {
+        port {
+          CPU0_RAMSINK_INPUT: endpoint {
+          };
+        };
+      };
+    };
+
+    trace@c002000 {
+      compatible = "qemu,trace-component", "riscv,trace-component";
+      reg = <0xc002000 0x1000>;
+      cpus = <&CPU1>;
+
+      out-ports {
+        port {
+          CPU1_ENCODER_OUTPUT: endpoint {
+            remote-endpoint = <&CPU1_RAMSINK_INPUT>;
+          };
+        };
+      };
+    };
+
+    trace@c003000 {
+      compatible = "qemu,trace-component", "riscv,trace-component";
+      reg = <0xc003000 0x1000>;
+      cpus = <&CPU1>;
+
+      in-ports {
+        port {
+          CPU1_RAMSINK_INPUT: endpoint {
+          };
+        };
+      };
+    };
+
+...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
