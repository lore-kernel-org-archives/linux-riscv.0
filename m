Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A4CCA6007
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 03:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qGzc6ontqZGscpVlKOuAhwvEsERsJzu7IIUOONZfe8E=; b=leEeUHD4r4xu/F
	RzdMVo8PWCi7jnehIkqlWkzGT61xvSwC5CcquIfb54cPRTc+JlWNu/HdU9119/t3D19+9NU+3fm96
	WmIgOsynYuMBRzeuZsk6UtUObaJa33mpgd3AHyzKGfhNnI34xjrniTdpSVFuKHBbvkYH9E2dR6Alw
	JwXtA/m+SToZ4bCiewtLgux3dGpR0yIayhJMDV7EVHsUgpa1rGIiaWXBQq2RqdPxJ0kMGtMrANtNp
	Vw2qLLkbXwT1+Evp7+9vphFO5I6vDSiiiRJrSnuo261PW9CQgIq02JXs0Fk+1heKNcMrBwOkKJBnG
	/YWLVkcGWEYt817om93A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeoO-00000003RsI-49EC;
	Thu, 08 Oct 2026 03:28:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeoL-00000003RoS-1auo
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 03:28:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hlB31114670
	for <linux-riscv@lists.infradead.org>; Thu, 8 Oct 2026 03:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZMbjzTGadlfykU/nTDUxL8dMYc8O8fFEzaAJY3fPRwI=; b=FZUPGItBETjdAzRL
	B5pYQ0wdEFStWX658zzZwawaBvk8UQqPRLzn1gdXOjsQH+Y6RpJxIhfx+RXHVq1S
	Q8ujP9tKCD29Y8tfRQ7XwoeDMimSkOxCFvbWDg+KXralawm13fxaeCxcNNHSw9k7
	/Z6LCq8fKQ8j4lFpSIuWBiqS5YkX4KH1bgvPDfB/R46dF5oyICNfUwFv4LT9s00U
	SWpcuQ4WJGRkkvp3Jsg/GXA+7qoYWD7sHuz1GCHfSvmoJQddbQ2XejRgc9d+cBQJ
	HtCHi+RpC1dlf1QcSwoy0HvQQpIs4xnDcqfa2HiooqNTqSNY1JAe4CJ9rBBFrEeY
	yTWnog==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3h0xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 03:28:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30f1b904861so6338982eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 20:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791430127; x=1792034927; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZMbjzTGadlfykU/nTDUxL8dMYc8O8fFEzaAJY3fPRwI=;
        b=BdmYv6Cg2Wc/xVsY4d6yGBvBPsT3YsLywPbfVtiLXL6SEcHzIhcHF+S1AYqpw8LKLW
         CljlweMWPVzD0JjS68Fv75baNwqPF378VifNWRZoGleiBh7aHAiP51Rja8tY9DlebHuh
         UDqdIkWSEfAsdyhpK1h+D/ChtFBHDVTTb2hiae56W+v66MYRjQ/ca6Co+DPjjy70wefn
         lS3I52zU2jeehkTtbw+Uj38WZs65gMaXHLFJmobk3dpDd6Z5BZj2hYvTUD349Zf/0jbG
         +r7c1pvcDH0nyduSm7v9cUKa6a34wlhV1nzYnv7RjdjGT78ShILCEswT+TX5IlGhVJoN
         k8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791430127; x=1792034927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZMbjzTGadlfykU/nTDUxL8dMYc8O8fFEzaAJY3fPRwI=;
        b=TOFTLsUk2KD7qaEAfBtl3ulyLoQz3Q/0h8CJRpGy1fe5zG0fo0kVOzkAjKfkKxr80p
         3uMzdK1caVBwblaGG09Cml6xQ87Bx64OOced+LR5AR9YngPXygRE4jw34aPbVzx9Xjyy
         VlLfVCp+Tt1JECSUmpc31lDCEnnwWfpumLRYW8N7aB6pOfvDQHFGOO8P99DzCLX6ajnS
         +ipOj8U3pYV1NOD0v8x8Tb+Ne4OWimRj6BGtWXN4OYtDYZFbyAIRnkAQK7pf1338X5pq
         h2Q4OJhim8cIy2S4o8Ed6kblQnzLuJKf6p72ovWOb5Cc5s//EztyYo9fHL1CZTYSDJwq
         qetA==
X-Forwarded-Encrypted: i=1; AKwUvBxIwy2f5VrXmLo0XCQ1o2WPuM/5naMJxQ7zpVp9osMNCK8P0/Ad7+1BsZXEXUUg87OKXioqJay+/ILbnQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLuvHAWoLaDIUWEd5pRW2bacRIwH7zatde/6cnGULSByrVzmV+h
	8ZRRDbQyeRYucjnWZj+UZ4I9Qnzbhyrfk678VskXOIgLuBgNAPHRz6BoaVPNRLwZjDX16VCec0C
	7udRNuHLgLfSlLtvT4cF75ff0kU43nIuyLQFutW+9M36yjfi+6YwRcu0DQfbw6HshkGSm/A==
X-Gm-Gg: AYBFou0wFQ/dJiJx/3d9pO9zYbN2fdw2CQY4lTNEmp0VD9yPTAy3nSlJAe1ysmj+4L1
	II9cYqcbb4OXRhD+6EqB8wTnbQrXc8a7Tm5ZmScYID0EAh7UdVE0YywcXFBRiHDBIi3WH9ywVo/
	+H+n4+NDjdiiUs83X42QU5QevN+AkoUV7L/Tbc/vH0OujTudwRMhYtg04qOheE99F+AD4cpPR+Z
	UqHZTKqUBDSNUkIuYoea84/CZbRFtL5zypD3QGQNxnzJnvqiItk/Ua89d1lqPEkqNGA9VM/h4lW
	A0bSRJ45zGO4ZUetNKQwc3x0Mk+XNytLDQpklqV1+TafMxS6PpQV2qU8pIz1i4JSde4eTDXxl4V
	HnY5jIIO8YnDQHl1CoJXEd0zFD6DVcev7p/Fc8uf0KG4WQRjOfxOAnnG8sw==
X-Received: by 2002:a05:693c:894d:20b0:34c:3ae5:c280 with SMTP id 5a478bee46e88-3515dd030edmr4864982eec.10.1791430127164;
        Wed, 07 Oct 2026 20:28:47 -0700 (PDT)
X-Received: by 2002:a05:693c:894d:20b0:34c:3ae5:c280 with SMTP id 5a478bee46e88-3515dd030edmr4864931eec.10.1791430126393;
        Wed, 07 Oct 2026 20:28:46 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35179d07566sm2168349eec.30.2026.10.07.20.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:28:45 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 20:27:10 -0700
Subject: [PATCH RFC v2 04/10] dt-bindings: firmware: add RISC-V RPMI TEE
 transport
MIME-Version: 1.0
Message-Id: <20261007-riscv-rpmi-tee-abi-v2-4-45939a13d223@oss.qualcomm.com>
References: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
In-Reply-To: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX1aAXu6t5ktC1
 Pl98GJAjfFfqcsN+pO8kqojM4Dvq267JEBZaUogd8jz560SJsC8nfLXZWSRLTDgm+J7ofjKcEQ1
 ogcAelDWG1eJYGkf+MMAwxuJEqNlfUk=
X-Proofpoint-ORIG-GUID: BMGhww6Tpul8kr3HTYt3XdfrLSXssRGS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX7AqAJ+rn5UWW
 rB2MNbMxDELMlVRUpeoLPRhCT2KHHgZqFSZEUjSVep1ZFRqPWieT+LqkZaXVtWniwS/jXJY3mJ5
 cqRvvvUsmeOR7aur2XLXnWn2vg8m5LxQc/dzOmcX+FE91GFIBWJGc5AslCfx+Nlp8QvUAKeWg73
 EuyrUBOkXSBXCUmDhkb2P2z0AepUdBmgcG0jTVXR80hOUjpWdSfkyADH/Ag1l4m1onvtCGNe2RU
 E6VDdJ6O447T1RC6IRsjViwPqBkvvsOKR5NEiomxuZ+Wp0q/KcnzJlCbB6jPMQJ1FKdx4fqV1h+
 zZIgabvxxoZqDqUS1hJMpN4iECHWWF9aIdj6gcf8UWv+LK6Qg67P2UhzSeglznK1yAt7+uuxxAK
 d4yaBQM9Q/dXZEX9gD+7hWHOp6sK2R+ltro0xDnmPbL/2yBD4sXLv0nyRMb6mZX+OXVsEK333AT
 62/jLGN6vvmk0wnjcww==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac70df0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=X9k_jdDNchH65YliorYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: BMGhww6Tpul8kr3HTYt3XdfrLSXssRGS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_202849_551798_271ADBA6 
X-CRM114-Status: GOOD (  13.32  )
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

Add a binding for the RPMI TEE service group carried over an SBI MPXY
mailbox channel. The transport uses this channel to discover TEE
endpoints and their services.

Require a single mailbox reference. Notification interrupt information
is obtained from firmware through TEE_PROBE_FEATURES rather than an
interrupt property in the TEE transport node.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 .../bindings/firmware/riscv,rpmi-tee.yaml          | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/riscv,rpmi-tee.yaml b/Documentation/devicetree/bindings/firmware/riscv,rpmi-tee.yaml
new file mode 100644
index 000000000000..b7bbe8893e56
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/riscv,rpmi-tee.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/riscv,rpmi-tee.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI TEE service group transport
+
+maintainers:
+  - Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
+
+description: |
+  The RISC-V Platform Management Interface TEE service group is carried over
+  an SBI MPXY RPMI mailbox channel. The transport discovers TEE services and
+  creates child devices for their endpoint and UUID pairs.
+
+properties:
+  compatible:
+    const: riscv,rpmi-tee
+
+  mboxes:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+
+additionalProperties: false
+
+examples:
+  - |
+    rpmi-tee {
+        compatible = "riscv,rpmi-tee";
+        mboxes = <&mpxy_mbox 0x3000 0x0>;
+    };

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
