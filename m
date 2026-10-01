Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F19CA5FA5
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 05:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ymgSH204mCjz674FyWaE/qSS6gLTl35UOetjYtnNXj4=; b=ZqLQ2qG9B94GnG
	yL0BS1PGxUob2He+3kemGdRtMynwuUT/nmxIEPCeOm9M0XuGliS9WNicw8e3gbA37TRM6jzG9xsr0
	+CC2yXfVbPMaZEuTy+DqZLs8aMrRbFGDUBLcrjtNEn2vkTYXj30WobVRWj7QvOcA2E0IroJTEi60x
	tq5BA8Rcc8yGEmA0VVKQzgc+k+zY2J8RQz2+oX15c/6uqxZplVfmqk/nEWg7pkurYW+lfUsrblVmC
	ZdmVFiSEnZJJFPp6NFuhCcnTYgiygGDc6U+MtqXwdeD0Orh5BNiQDFYYGMAbsVaZATwAqxGNlLrq+
	WZLdh4WIKqnkrsX5LBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9Gb-00000007nNk-1fBz;
	Thu, 01 Oct 2026 05:23:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9GY-00000007nMy-2FlB
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 05:23:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gpm11090257
	for <linux-riscv@lists.infradead.org>; Thu, 1 Oct 2026 05:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8XxsVc+GOQv
	zjVbH+p+BI5Iwe40BXy5jVCydFd15eKE=; b=j7vI8qUQEtd9b2ruCBCEx42+akU
	jHkO5xfDE+CR1wvDL8mVMiL2TnaXqXry0yzK7GtF62kJfDsXheiM/VJidAel3Iar
	r4vOX1nzNQsSZHhNY4JEKEmIixSzHYsuWrm+EqW8IyDQ9spF8y9IPmS4QIffFX6k
	YMxg3ox4yV7PmZPCYTUs0WfF9UezRqceAlOHz+zGZkvrlgTjKfuTTp5bpXOQX9CH
	DVegnez8WnmLG79PKMctD8+gTdTqSg+i0jcqYgxDyMhr/ABTvUHDInhfj+qWOS51
	mkFzy3ryHKhBSSTsukJHAhAMrhxfvtG4r/I3dfwFlZ+9VMUsuTvlZJUZBXQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188ssw29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 05:23:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e2dc7312e5so15336395ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 22:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832212; x=1791437012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XxsVc+GOQvzjVbH+p+BI5Iwe40BXy5jVCydFd15eKE=;
        b=b/XADCkAYAPLacZodq/6N8/4yQFbqPqC9DnGDa9mx5A8NNFXx4g9xMNynQfl0iSB4/
         msDk9gWPk+gEgf7BBynsTDdi8kA6HbxetwVRTkKpjIZjreeTeix5O8hDNYDyooUvRzye
         9Ss620qEk9KhdcA3Wo2DesC4dVuP3xym0kGEn4uV7NX3s+fk93JB5todpU+GA+xvV/iK
         q5Ke+5j7HmP+CZdk7GB+aRl4LaDzzxSkWYrJL2Y2xG6bkI8cGFa4d+ik0J+D8epVZ74u
         O9riVW1fhzHuHD/6ouBMA8x8/z5caJfTxqssxi4wrL+YTtIuNmgsv2+pttzi/rEss71K
         IcUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832212; x=1791437012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8XxsVc+GOQvzjVbH+p+BI5Iwe40BXy5jVCydFd15eKE=;
        b=oSSv74O/sydEU3jxxiPpmUzIj5qS3jHcIhu9iYVZl1m/1OIdPg8PLrsHeiR6Fhdq8w
         v1nAQxFpur6nBUROcF1AkfQsVSYZ39yxX2rfhA6sQ/gB7oLWwoomKzqaGOBVFMptLHYf
         jgjf2bnaGRxIma0Qf+hviCTdu4pl9oxCe9Bi66TAopX2X7+NFN/cqn7Brqb/5xXfyN58
         p8glbU6ttDZSvOdtkRb54GC+A83Uttd3bL9WjGG9G87WiylXDEz/Yp4rYnHI2i10affk
         03JuJcxsJOcvGj+siDeL1irfq9nlGRHATBfN8j7dLEkLoki92gdsFAy+3nsawMVaY+aI
         b6HQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3a2wR4ilV6Yg0Mp7tQw0sEyKvLEDw9vGUx1FujZ+9f+nOGP16lC0Jp0sv+eNvMuQId5jhxn/rPbpkkA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLgyV2dCkNdnV5ORPYpqFFh0xANqsQmpOJv5qaKeCBTsiGW7IL8
	b2ceWli1feSHucuD6aMf0SwrgDGPZ0k6vc+39c6ck6tZxazmAV9WxnyPygZjJHzoNNRkkttZ9nB
	BdUrzmx+8R/Hlprr2i/MeSkMWDPPi7uzS2y25wDwLkRR8R90UEJtbkJVL1qQQ/FjcGrh9vaE=
X-Gm-Gg: AYBFou2ds7RSqEUVkjpOSPKtLBvHB5CUqNXewdNVhVaOJoFzJmWVqi9liJ7rLBWESh1
	5X9SI2T0eRYg8Lk0sHoDJkrzUKFMtn0uz5PnBlki2dHe2zdLX8o5gXBRCxbqo8hRV/Stycbaqxv
	5RecvhZKdKCPBuxMLIfDc1YcSRh5nW4/lHhGe+1B+i/JbBm9aqj80YnsphuTsKbZEsHgvVPA3aD
	OYyv3Jh5mXrR1Ov7fV9ouviwXKsGMUPOTJRd/KQjyhi/P4tPYTeocZTmue7dqjW37rux2hlkGiW
	34cTKDrbDvKVwxOlZHEjJ2HKTzCoejRDJUrY8dLRQ6U5CBhGqUX3l6i9ZytJSXAg5DmkNIJzgy/
	IPz60O4XC1hx3OYR2OQ7MXJDdguzzu9TlMFsgJrzoYHGTyV7dDEUIZYATiqy6niwOs0sVl+vm8D
	4H83y3/8g5DSPet9ee+GPj3R/R
X-Received: by 2002:a17:902:ccc4:b0:2e2:d39f:182f with SMTP id d9443c01a7336-2e2e4b35351mr25899315ad.28.1790832212359;
        Wed, 30 Sep 2026 22:23:32 -0700 (PDT)
X-Received: by 2002:a17:902:ccc4:b0:2e2:d39f:182f with SMTP id d9443c01a7336-2e2e4b35351mr25899145ad.28.1790832211858;
        Wed, 30 Sep 2026 22:23:31 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:23:31 -0700 (PDT)
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
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 01/14] dt-bindings: Add RISC-V trace component bindings
Date: Thu,  1 Oct 2026 10:52:12 +0530
Message-ID: <20261001052243.3042627-2-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX7GZ90Cvt0PbB
 P3n3aBtMvN+MZskDVqI0isUW5MEkk6W0FL6OMnq7pExAmOk/B7zh8u8ODqT8103QGa6MVjxDvb+
 x0d1OW6IezgPRPNBlhwsWphuc7mpehk=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abdee55 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=W-_n0kkjAAAA:8 a=f9mqD-BOXdQ1R_-L-AkA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-ORIG-GUID: r-RrofCxXnYJKBA0NInZmfW_KzI-zvtb
X-Proofpoint-GUID: r-RrofCxXnYJKBA0NInZmfW_KzI-zvtb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfXxri8F1vQZ4sR
 Y5a+V2JuCYhftkQRU2q9FvwJWYlWVg99Jz9BrFtiFnVb15cqE3Hm1jpLWrI38tlWINV+d4oGKFd
 5RaEkHM2toSWXUK1lGo72ssfOiVymtkXTjgsENWoBc9nqgzXAuJYUML2mNqzDyMdg4a7sTcJ/OF
 hXfJ5WVmHihr9+7+krXd0EVk0VhV2mKi0Bfxf7g3wDtc8pNHdgqjrSw7n9SvOp1D/Yle0loIRs5
 TFKnT2WSiiUxZ19MAYFHQcd9fz2WcbTrvzNkoTJdlvr6Hq7E6TRbDgnUKEG3VrN8wzxA/XZSmsE
 IMERq4FT9yJo6L3ASFoKYGeWPQfl6t0DVbl3euGGZpU9lUVZTR9V4hzAwCw9ATZy/AXlLUHKkfL
 bk5jb3WtssYreZo8xTnv6Ip1S6eG+4Ya7VoI+HWcqyucbg1cPD1s/gn3ynm++mO7HM3H71OfSLG
 ZEVbmTPAQNLwecHBKMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_222334_697229_F818A98D 
X-CRM114-Status: GOOD (  17.51  )
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
