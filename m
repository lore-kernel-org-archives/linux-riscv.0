Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39E2C79FB6
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2026 10:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c/IqfY5rBc+cfxIgFGpIMyO/H0tpZ71Gv6BKU3Q18/Y=; b=I4MoZ8Nbe0azuT
	+mhHXxJxS+Grv2QDB0xKOyRV4B1vHdO7OA6K3lD9JSQ2Uznnae5b3ZlYYZb0XAa91fvPCnb1ikauL
	wgDX4N8PAdpYXAD9G9jvfoSJfPj7uri+4gwnlJgX8HKZtXM3vYsRLdRJMCxltAd/lqPzCRE+WP745
	o5VqAVZNypeL/Wphp1CGeLTcoa3t+BdekSjgTriTCwVAW8HLIjZt5yk6Po0yjmiazm8r+vM6IUoPB
	4cMT5ow4gcAHWHxUoPELRrsV1RvUUv85j9OVNWsLLXfReVTgQdTPmCF8U3UYLTGR0d1WJNYvk27qc
	EiMqkhfwr30MxpvMe+Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Klp-00000000lik-27TF;
	Sat, 12 Sep 2026 10:15:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Kll-00000000lh6-1U1L
	for linux-riscv@lists.infradead.org;
	Sat, 12 Sep 2026 10:15:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68C84x1u2832758
	for <linux-riscv@lists.infradead.org>; Sat, 12 Sep 2026 10:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fvGdQtR+Qwoj5VESRUaaVEODegCn4Sli4jhlqF7Rgls=; b=h9P10Eq/EjHe7DFE
	AHgtUu+UIQ9wbQglsmtTmEED1LS3t9Jq2HDfhzSlGFoAMdZWvziEZf+Xbuz1CSkl
	uHzWeZY3qegkmYQkSu4W9Tjjkp+sOq0Hcl59jMrptzK4lNfhTlNmvUA9k83gkFNT
	Z3+6pocgFldsyLB5gwj5JFlGAT/xQC/OxwM6k1ZTxoyI1ATMNZDUQE5AUcvuBO4H
	/C+arjehUGRr+Kpi87yn0uq5DuuxCnZAzX39PSee4MeIdkcK7af2wBMmeb1P3K/6
	9YbX89jsZyIjFZMnCBSsTaCyufqdm3usdlxa9Ig5MDKkZ/vwBqGXW9bfkARkjh+N
	/lPZZw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dgpyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sat, 12 Sep 2026 10:15:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc489e7a701so2509251a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 12 Sep 2026 03:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789208135; x=1789812935; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvGdQtR+Qwoj5VESRUaaVEODegCn4Sli4jhlqF7Rgls=;
        b=WI+SZ3Pw1eWLAugzY/BouhpfivEmP3Sy8fgSGw1ZGIdYdMwSc3GWv0vRcI8Pi46HGH
         GPmrzGLMF+KFaVC34hP3nyJptkrpv/XnW0UrSNbEM2UbJu4Y294wAqYdU4YOzx87pG3F
         fpeaxUned2tChh+/rYeFztXa3AdN4L2qdVw7OTxLgCtmf83us9DvbseL7s5G5Of96pHz
         875inOWfUEIiBvS/gx/ls9o5tiu1Q1OB5WTZtC8iEsEapTo70NUf40CEs80wMwyoYi9I
         RztVOlWiV02bKqJr3D79PKOrSejlPuGbzyYLs3uB8qCtR3Fc7j2IOT3fJoE4jP7QdzWI
         I3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789208135; x=1789812935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvGdQtR+Qwoj5VESRUaaVEODegCn4Sli4jhlqF7Rgls=;
        b=q2z9QyhWBpJ9Vcrh3ZJjE7g6MLO4Gp7AlqXFq72GH/RBCrlO6TqaA5b0NsRDm/t4YF
         2Vmr6ewCrQfwKPSUNRjyClIS719+Kkae8mo3MrSbX7zjsmsYfYMgagUwMFeaH0xZDRQ2
         2B0UJ3FEX0w39vj5eDseQPspd8RuTXpI9BGaab8XKKbKQu4tRIrHIS0nm6jZG0AwE5kQ
         T+Dy8m+gM1nZYOQykZI07+PwXN79DiHxZM5tknd6qVTj73GDxzFic4wDF/LvFaSAzUar
         5A4RaxXGWw39FCRjidOaFVoEo50gGhrgil37Oh9wgZivKrafkU5miWHHa6iHp45KCPCc
         4eiw==
X-Forwarded-Encrypted: i=1; AKwUvBy5Y0hG4mGP20IgUZl98YCP1YHB664EwsdCDJ8T7RMdm3OZWDvu4QDyHoA4NdyFNlWXYPnuLkS9Ve1qsQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nmOP15FrRPxpGObVc+Ey6Y3br9J+VLmb8g+Rg7YAY+IsFOFleq
	ekR7lieDtUF3vWs9I4F/70B6lMjGgJh1IW2iZSxBM2i5OkYtrMgKSIEduvlW3fF4xbyiJ71iHRa
	QBzYka68j5cL6HqY6ZmjkMACLlo1u5CM9aO3YTwwS7lgcvv64HU2OTJfNGF5kve68Bhwmcg==
X-Gm-Gg: AYBFou370z8PofnzCFcC4cqqSGsagDKyCyO6uAdrvZO4RQTaL8tYNZMjMg1N2maXLHH
	Enzd5E7Uj3bgrR5D8r8ppwZhg6BawSUFqui4Y7CK76YQyljZ03Ut6Jm2nxxMlE2gAPknwlCI/H4
	SnMmacoSfpLrBWDCmg+tULSOZJHxFULxHrf4oMpn7Q8u+N/rXnuXQDhKKvulOLkQYOnclF7bBOb
	meEhyBNDUkHcDLGW/Sk0qCV5OMaRHbH3S+3twiH1OytigGKdLkxodNKlk9LrIJZnmsTKwEjrm9G
	zdfvHHLjZMvmkxJE++kd7Kil6+Hjbu8+ZKcJ/oVOByHwzuqio2hC0a1Gf2/45Lw8f9xxQYV6bEc
	OHJf2EKRLS69Niln3zMLBDgfn68dm1Zz5iSYMoDQtITRMkgWGcc6LrKvTzew=
X-Received: by 2002:a17:90a:d2cb:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-39d9c234851mr13405561a91.14.1789208135076;
        Sat, 12 Sep 2026 03:15:35 -0700 (PDT)
X-Received: by 2002:a17:90a:d2cb:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-39d9c234851mr13405513a91.14.1789208134601;
        Sat, 12 Sep 2026 03:15:34 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm10340085eec.8.2026.09.12.03.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:15:34 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 03:15:16 -0700
Subject: [PATCH RFC 5/5] dt-bindings: tee: add RISC-V RPMI TEE transport
MIME-Version: 1.0
Message-Id: <20260912-rpmi-tee-service-grp-dev-v1-5-1d1d35c2a859@oss.qualcomm.com>
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
In-Reply-To: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfX7lZAI3V8xnGO
 Ym0Vvy4mojKpuK3Ry8IhCmFNmTNPhSFOlYMHKm8O62P9wdunCgZYngFd/u82AUUPAg9G2H9Jhhe
 3oT6EvKte2KZW8Z5nFpBXK8uBeHvlFnZKsTDytN/CxIkYDLNwxt5a+KEKF9TUFUmy7f4HTQMHqK
 T/cxZew6PUxGOH9VcniTmCJBLhdxo8MJ5FDQw6RiuGjhL6naN+Rs0wHdT5ZMobaH9yLBK2jYoM3
 pUwmzRtunuZoHfC8822je+i5QeMWXucwq9IbUQhRtERecZN/WT4ls4qogUd2AJUh8UDb4WLabjR
 04XJz4WFkdUNYt+vc3kpKhGxItI4+CE++krh0j1MGkT3N0FrUYKB1lFOJKUb/MjHbhIhbgZwsdS
 4ep5I19gOEI6T/dXMpb7xpyYR8CfevWYpETEU7irskGTo/M/sPyHUFHJOazxUwfHVipKwKBmpt9
 vlG6VLELCnKYztfAvVw==
X-Proofpoint-ORIG-GUID: IyxIKkNfae5EdCNbuZgg1FTwZ4LNxfUe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfX2f7SQiWI0V+e
 qdIuHygQC7ic2uP0fgjbK21OOsAcb51ySuIVpJNJiAYsDNHPqOYKHmQe5DBTrToCvRS4m3l+DZl
 kezTX2bcKcTwHvG+BsDiPNl/Jms4vgY=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa52648 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=b45o4kL6AAAA:8 a=UjdUaUu09JUVB5va2ocA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22 a=dhdsR-PFWuPJUldTnwXm:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: IyxIKkNfae5EdCNbuZgg1FTwZ4LNxfUe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_03,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_031537_520548_1B07B793 
X-CRM114-Status: GOOD (  17.50  )
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

Add a device-tree binding for the OP-TEE RISC-V transport using the RPMI
TEE service group over SBI MPXY.

Describe one mailbox channel per hart and an optional interrupt used as
the availability doorbell for asynchronous notifications.

Add the binding to the existing OP-TEE MAINTAINERS entry.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 .../bindings/tee/riscv,rpmi-mpxy-tee.yaml          | 65 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml b/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
new file mode 100644
index 000000000000..8f6ff313fd42
--- /dev/null
+++ b/Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/tee/riscv,rpmi-mpxy-tee.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI TEE service group based message proxy
+
+maintainers:
+  - Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
+
+description: |
+  The RISC-V Platform Management Interface (RPMI) [1] defines a messaging
+  protocol which is modular and extensible. The supervisor software can
+  send/receive RPMI messages via the SBI MPXY extension [2] or some dedicated
+  supervisor-mode RPMI transport.
+
+  The RPMI specification [1] defines a TEE service group which is the RISC-V
+  analog of Arm FF-A: OP-TEE and the rich execution environment (REE, i.e.
+  Linux) are peer endpoints and the RPMI framework (machine mode firmware)
+  mediates every message. Entering OP-TEE on a hart runs it on that hart until
+  it responds, so the SBI implementation provides one SBI MPXY channel per
+  hart; all of them are listed, in hart order, on a single node.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+properties:
+  compatible:
+    const: riscv,rpmi-mpxy-tee
+
+  mboxes:
+    minItems: 1
+    description:
+      One SBI MPXY channel implementing the RPMI TEE service group per hart,
+      listed in the same order as the CPU nodes.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Availability doorbell raised by OP-TEE to signal asynchronous
+      notifications over the RPMI TEE signal bus. Optional; when absent
+      asynchronous notification is disabled.
+
+required:
+  - compatible
+  - mboxes
+
+additionalProperties: false
+
+examples:
+  - |
+    tee {
+        compatible = "riscv,rpmi-mpxy-tee";
+        mboxes = <&mpxy_mbox 0x10 0x0>, <&mpxy_mbox 0x11 0x0>;
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 207a6e2db70c..7d0e550085b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20577,6 +20577,7 @@ M:	Jens Wiklander <jenswi@kernel.org>
 L:	op-tee@lists.trustedfirmware.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-optee-devices
+F:	Documentation/devicetree/bindings/tee/riscv,rpmi-mpxy-tee.yaml
 F:	drivers/tee/optee/
 
 OP-TEE RANDOM NUMBER GENERATOR (RNG) DRIVER

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
