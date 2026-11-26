Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02233606A32A
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lexx4QXI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D+DarMAr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bmxchz0/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ymgSH204mCjz674FyWaE/qSS6gLTl35UOetjYtnNXj4=; b=Lexx4QXIAvdpZn45WNMit8++0P
	ncEQqYV7aobbnbnbeQHdJYBbJzvSUphvl5vBCmI4Xu/139r0LJJ3Jaaav4uzRgn8fe6TsEd0vuZVs
	4HQrUFcXhjKBJjl8yOiX5xfm8DPZEJP1X0Bnz+467QW/whqvAIrlHn0QJLkmzhymbN1Yf9Jfuv0Yx
	bs/wDW2c9+DSsWgMZLMaktcLRLv7bAgRbKo6p6z7L/ZKVTl566+QPIBq6lc4EUaujwFLubKJN5vVK
	+OGjp3QhR7UgA+5mP9HBhlnTn/6sus/eapMSAU/LZ/5mFMhKGSvT0Laj8dVykw8GwhD79s9oHL060
	8HdRE44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWD3-0000000CeM7-2zH5;
	Thu, 26 Nov 2026 09:56:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWD0-0000000CeL1-33K7
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:56:08 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AvRa2594867
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8XxsVc+GOQv
	zjVbH+p+BI5Iwe40BXy5jVCydFd15eKE=; b=D+DarMArmQcyB+qAMpgH8R3/4OB
	WYlEqY8GxYoKc/cJKkV7jID8ziKTAW5ae7BEMNdV9VG2+BfUa9u5F4uOhVICUKaf
	G59rC76KQGG2foWZvnfoMZZwjXVtkVWkSj5RdEtH+UziIR/aKvcRTGzuX7ISzlWz
	etYGA1yECL5b76bLnoW4B+L2V1mpgKgIpGiqCZ+UWYJG6pKHPH3yK7lsox8pv2bg
	HEwAgBHUEdocsB1G3OMvSmy6e+jXNsZ/DGAsQGKnji+9ENZA3+KhCSmVpMb+bFpb
	lhKx8YeV3Jh1e0NZiWZT0MYzB0Did67QLcsZM40KULTIY1k38H+uBJ8zfsw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sak0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:56:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3b4208826so4861413a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795686965; x=1796291765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XxsVc+GOQvzjVbH+p+BI5Iwe40BXy5jVCydFd15eKE=;
        b=Bmxchz0/KNReDUqcIR8ZqcIUdZ3ddQwdrcw/1jQigt9XydqjHf7IaNW1m5BfyUnxdI
         /r6zmbOz/ExnP6rHpiA351+Z2W1WsZaW2gGbb1ROpQlEwjao93eylK7GsvzzXFEIh8gB
         mXQGKoKlDZQb6jEi5HBlSSyO8lI1fx5/eQvG2QWdYDJVz8noTIBiPSdJdXZaY7D7F722
         9FtpCeAgU57B3Z+b6XwTaRLC/zYs92MSpAjNhGEqiZE210FTn3qrduq/CeBMQL2Jrrgh
         1s9qpgAl8IZkpHcNmC/PvUt5qS4+Fx9ENc/XcW4O4Hb8Xu0a3msAfvBWY42yMhFv0dQr
         79rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686965; x=1796291765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8XxsVc+GOQvzjVbH+p+BI5Iwe40BXy5jVCydFd15eKE=;
        b=QFAqujmOXrwwvnk4zvS6+gxwUvFMnzG4TCqUpkt1E9SFYcvyWIRiDDLTUQLSIk3FE6
         asPAlphD/PX446uJbIPJuBglFY4Fod8P2FKG8Sbw4vnVFN9TwUNXfgFqohAfRlcqATHU
         NqAWpXhb1xOQqz94vD6JQUMuL0so6L3ThjSizmM1wrOpWQYUxgq5qbHahceQxrNzBkJ8
         pyHebI2Ms9ufyg2z2E8tijfXE81GuN4TWrKaEzAPLTxMSBpBurVd+iDHDBaK66x13onN
         ilVNW8ju+itz9w45ScCJBY+VBmTNhqWakAZ7R1+ebLIMinIoWfLwOaA/NECySjXsDflZ
         OxXg==
X-Forwarded-Encrypted: i=1; AL+hErFimjP7B5IeVxivzu7qqCzY1yv69KY6Rn5UOTefJCNu6qnIrP/TTWiQ2Es1WIzl09I69LsqPpqqurXAmg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9IIskwToJQCNnWtekqTR7L8DFla50DbSjfXssCIvdq8o9yGOQ7
	qylI3uNbC9+7PxvPcKNoIgueRCtmjoFYtknoxOsbf+bP6niTffwYosbBjST/hFoZUjE8974BkTV
	GyDigDVYSTrmqpBz+jn+ixtyyQZ9KgLbUIjjxvUOj+dJuKB6/oUkUMdWmSzw2W5KcyiXFw5M=
X-Gm-Gg: AZFdTZcGhQp9svhH7vdJ87n643dmBtPwsmlnhaAMzk6UoR53OCNlylBUerRoyYE4TqS
	AWyGB4unEofhXr9ezVWbyeWKqr0yBimloQYJGMFZLdIwk7YztIWl9bofizN2g2Wn/n9dQuOofie
	4ZYaiETQ9ZY3iY0UBl2njNVx54l2cMjFoE1MKUes0CfBWSLJsDo/pwC2vDxRdAnqesrVe7ySk2/
	qWq774xiBdNALIk8fqPmMRnLKiY+lYLSgPu/J8HTFAJdgpykzPsPdHpKUoJmRnkfFHAiUH2gnnD
	Zl42nLMGfJuibCKBCssabr9PMpHN9aXdPvTInv2tq5/SLVIgmihV3CunWHsPUxnin8gbqB+YjUX
	txYrLjZkgrRnPpYwhnXOJZd9iTuWwYlzdyOCpf42Nc9g5nIKwKeWMyQvLmcgfi07ijTcWSEGhaM
	i/X6kNQYkNTFF3Bv/11njW1PUMVn9gScNhjT+FbO/LnfUpB1KnVXFWf2FJA4noaDg0HHvB+oLOF
	Q==
X-Received: by 2002:a17:90b:4490:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b41c7bbef0mr12900377a91.1.1795686965434;
        Thu, 26 Nov 2026 01:56:05 -0800 (PST)
X-Received: by 2002:a17:90b:4490:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b41c7bbef0mr12900364a91.1.1795686964966;
        Thu, 26 Nov 2026 01:56:04 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:56:04 -0800 (PST)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 01/14] dt-bindings: Add RISC-V trace component bindings
Date: Thu, 26 Nov 2026 15:25:22 +0530
Message-ID: <5454076167a828931e198bd167dea1e2a64cdd0b.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b080236 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=W-_n0kkjAAAA:8 a=f9mqD-BOXdQ1R_-L-AkA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-GUID: vC0uc0hoDwXNBgjGejBwnNJghiiCX_5U
X-Proofpoint-ORIG-GUID: vC0uc0hoDwXNBgjGejBwnNJghiiCX_5U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX00LUTcMQLvpy
 kkulZaCZk3OHO7p69OCtP8QmP2fE/fS5TalMk3FRo0IyQA78uO7t9yrIVeXyvj8kNWDGheBulTc
 4H1J917z6TBFgisbk/7eiGGPRnhKsno17a00tDg2+sRF3R+rSlpBbeMK9dppU5LTNJpJoulKONw
 DbPMPvFft/Ay/1VSX9aQEyk1DU9VX5FXVWHO2uIWnILRmYJEHwLFdLx+zIfEq1uHGpbVa7kSg9a
 ucOpUtHSCSMuCixuA6RMqNJYBs7Yf1B8xaMXF/itKSsfWYkLIyXZmsPPVBz6e3ZiL8bZSsRTkHY
 JyfHjmncJsCLBGc1QkUDt0T+SZSWc2eYjMfVtHD9GWaizPqxXH6Q/W3S86gfLiRcVVp6OibVJ9w
 3LKCA7Nby1++U0TodyOBpBGPY5t7oeW2yNa7u8ZFDaYRicjUY2siiBW0GECHKDmlLfJpDTag1bv
 xGJkteDzv626IvC2eAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX12N2TleaBdOj
 UVKGfGVSLjxeNpolU0qBGpx4Z9gda+fnTqGDzEpZTwrrduSxkqDePiWVkFSR2hkVXz1L1siOyb7
 IvGsF6y8Ctxt2Mm9bK9biuZgOHBExBs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_015606_811822_51FFC76C 
X-CRM114-Status: GOOD (  17.34  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Anup Patel <anup.patel@oss.qualcomm.com>

Add device tree bindings for the memory mapped RISC-V trace components
which support both the RISC-V efficient trace (E-trace) protocol and
the RISC-V Nexus-based trace (N-trace) protocol.

The RISC-V trace components are defined by the RISC-V trace control
interface specification.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
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
