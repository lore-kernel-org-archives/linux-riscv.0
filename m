Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2E1CA5FA1
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 03:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MnNZB92Itqc0Qqs1NVMjQOOZC1jMKNr1GAcnEJDvTuw=; b=Wz8Xt3EfqT5/gx
	6h8Y9krthFoVH2tg70sLaOJS05x7MnuskngdcbG90wNAKFowGJgrn1wCCH8+Ep5bQBZEcFw7Jursz
	OqMdnzgvPXXVu41kZvdsB8OCHzFswbEuoxHX8M7pDWFx1WmxjuPALHYj15fOwFIt56MUEzAnnl0/Z
	pUIq4ds6I/VQXGP0pv1UIvXwUNwSNTSo5VF9hldLS++wRgAI0PKJUA2rJqIYpaAMKsg++/rEuUl9Y
	y+UBMVKlq9v1ValSPvR7sb1lQO1Xjpi9I3sQjpjIddDJi5pt5lmCZpxPnGV+p78Tsu7PPHjyQIPMJ
	BITj6W8N9TAUVhh89M8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOLx-00000002C4t-1oTD;
	Tue, 29 Sep 2026 03:18:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOLu-00000002C2S-2Tb9
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Sep 2026 03:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dASJnt3k+iJPNvbft15iYvw/242GHxpDWKpgPsBPFKM=; b=AFZjAeIqGyYLE6WCmjxuZKT6ZA
	o+T7nwyDqLp2FZwxSm6cOXqPQIryW9i31fZDa+dicQBtnSzr0l3E9dhOawrMUfTMvPgC1cIJsIkXq
	HW5wUsyYgMBR+B+UYCJ7JIQW53TBb9ndlYOWPM0GBm8W2ZcPaFTrf+F1Dc8wgQiR9qzYloIcRLli7
	I+Iill1HwjQGW5ZLmVxw5o7TVD3azSJpwIjXY2iFhMStwDfe4I5WZOiM0g8uWVZGTvgN+K28f7EjN
	n+wPk5nG+75ThaGhKSJrRN0lnvugRQbo70Iaa4xGVPjPhigXFIFP4t0xvzhcxCP3zSf+13g3xqjKm
	qBUSMQPw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBOLq-000000027tS-06S4
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 03:17:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0j3Sa3210506
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 03:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dASJnt3k+iJPNvbft15iYvw/242GHxpDWKpgPsBPFKM=; b=RBYjQyfQIm0ZW0Mv
	9bx+8E+EwcRxCBq0N4hspGuNB4YGuxsej+iq4FDqh+o/F9nCFvq6w0rJPK2QVJGV
	ui/0zYqKJIBWorO+gAPf9Tnoa7aeyP12imF+MqWLFJnd1PfutZKgwLFl9UVm5f3S
	vFEjp48hpL3uubhkjYYa2HETFdhrlVOiS9oF9B6YRqAMllOJPI7Tt8glf1qIsyLm
	pWM32xlNb8rsq4ajsjzeHb4N4u4+K9pEj1Mdq76hJLOEdvUWz/DJCIhGwsTl2bxm
	slbiNmIu2kW0nyhd0pTxkKBhIvqVrDtnj+V/+HDbj23L7AfzK7U3VGdsaAwF86hJ
	EdaNkw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4rvu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 03:17:50 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1466ab2bc8dso1024179c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 20:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790651870; x=1791256670; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dASJnt3k+iJPNvbft15iYvw/242GHxpDWKpgPsBPFKM=;
        b=Ul6smb8GfJuY2POLryTQWNgMa9DT0ODs2KqvNmCVCM+NnANd2I+s2aViZwgoVTDFk6
         B1ZUjrABxdcmYRTfkWzWX055ZhRDf0JVgkdYsk13euxUDxdUi2iY5eWhhxZS5acLuNZ2
         idfQVSHY0yeriljL3ALhC9CT8/LGaa1biz7mAslMIW2PEKxGeD052UPGTrlgFk4SLPWC
         vel/k4HcI3+reKKo04Tl8cbA6+h9pjFIuGsRo4hN3pYkEuL9RTzR5ZpJHAmQ24ch6POC
         qz1lNrLWkrDR5T60tk+R3NvtUPQauqW7wWY2VwPwM7/wDg1Cc6TAyQYM6HNL9calG7dw
         Vr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651870; x=1791256670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dASJnt3k+iJPNvbft15iYvw/242GHxpDWKpgPsBPFKM=;
        b=ha5qkix+abN1qSMRvcmx+J1nhu0EKt4rx+BqzljA0NQuwx/eM/xfc12+wRLqFSaf/f
         CzhMeLr+po48be0f0zYDBctsK5PD2qGT/h8LHvocbriVtPL3yJuPHwq1siWLSMUv1LIH
         K7r1QPUYVA3iPNvz/B1uXj5pxeXZJxCPpeFRCzTocvdTYKpncm63WgP5v9aT3NyXAH6Y
         8bJYZMyce1Yy81Spzfy0X2ncqd8ZTvcAUc0iN+WS4MXwIhJXycLZdVcihhEFK72WIeKx
         X+GqdwY9hbs2ovqVGb3ei8c/XTb78wS5wyR51bpOAUZMzr8u1rg5wKVRDpfbdL3U3It5
         4tdA==
X-Forwarded-Encrypted: i=1; AKwUvBxZwefJDXA7uLMUayr9QiqhmeJTmUQx1aaxOywPelOY7CsHZZ8/Jy4jfBoYTLpzyeMwhhWRaB6vrgricQ==@lists.infradead.org
X-Gm-Message-State: AFuF++na6ccCiy/Zpfg2DazdAHFxy7/PEXcu7GEv1BdpJe4CkuBpJL7L
	GlFTexH89E/bRHsx9Ud74lvcSjABzghkeIHsOwRiOU/xgT/BW4WZAeSUFlXzDaj5r2h2dc2/8fX
	hWyVMxqaJCBhKL8e1Cgj1iyc+EaSEa0v7bWQmgR/87sddzRx38gbWcsnB0JM7cuHzwnOatJJu0N
	jgPw0a
X-Gm-Gg: AYBFou35LzShTt2JHBsjA5Jo9t4iOXQiIO9F5ogwh1S3L2QGKwKkGor6kXo6sLBJMTy
	qHHVhLKbPKsBn5gWPRSOGqQpzH1uAZ0DISC1sRsubHHwOuwn8AQBiwyluLLNCMc9P/a+YsdWH9A
	GXVVX8z972dI7j8t8u4uH1tycLs98YwZy/39pgaxq5XZHkikwfeUVbNHwdJQPl566bikW7AQ9l1
	vn6Tmm5mLqgUrzxTFIW26e+pWTSZj3tZ1GYQwI+/K/NwbR1Tr6IiuSHzXa72aP5n55Zswwaxq3G
	fC3Mt/vIALbL9LICCarKtfOR7F4/dGWjTeoT60+cQhemWsgni5ihKnapzhi67JO+cimZ2SQ9cKj
	g0IMeIQkVDdBGVwaIIYWHT1vqh3u488D9vtjwY/u4YpkmfnMGqzYCDwy0Bj4=
X-Received: by 2002:a05:7023:881:b0:143:2984:6516 with SMTP id a92af1059eb24-146d096b3damr13332475c88.37.1790651869988;
        Mon, 28 Sep 2026 20:17:49 -0700 (PDT)
X-Received: by 2002:a05:7023:881:b0:143:2984:6516 with SMTP id a92af1059eb24-146d096b3damr13332436c88.37.1790651869421;
        Mon, 28 Sep 2026 20:17:49 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad4028a9sm24789368c88.11.2026.09.28.20.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:17:49 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 20:16:55 -0700
Subject: [PATCH RFC 04/10] dt-bindings: firmware: add RISC-V RPMI TEE
 transport
MIME-Version: 1.0
Message-Id: <20260928-riscv-rpmi-tee-abi-v1-4-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX/tRRJHWaMixW
 2CR8w/BLHnkQE/fSaoGtvXwq1Xt5V4NmI+nXPRJ2jzIF0USlwWmdwmYGSEop/EKHvZYYh9d6ur1
 FIWBgSYS0FE2+lf8tRJ5btEYK/GgWXo=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb2dde cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=X9k_jdDNchH65YliorYA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX1p07LEcPs25W
 HvXx4DzdOB5cqdANPWy9BdFnTfe0Xut1dHrFCjRGgYPtd/aKs6R1wliQBpTZd0F3+mu6b//uJ4x
 5HZRMqNMe2pYdu6iE3tfp3yrcC3QStlhqkbaoe+JPDdoD4DCSebJNIGQjs7NOsIryk8UEZ9QOkX
 FgZBi32Bx5btPpzPT3i9ZYeL8wjhLyG4a6EvvxyqP/TVpmIOl86aQSCZR/nvr1aEzla0yfSvvTK
 qR6M6p7VJUzz12xArS/O8tVLKBeMzMz0SYAOQSQsCId3Kaoyg9gu7N9Bx1dWt8McXOmcq+dSK4F
 vWAnvw1uixQDUFIs0fk3qGvb3DW+v6KLGen+kX0ez7On/NgSuqgvrW+v+Sz68X+DaHKJnvpHaV9
 bnsVTj6iTX5Rl/1gVOZoebE8zm2B5FM7KSUXtbRNtyrjIPFmMzntiEAlPkHyg163oV8nCw5jpyD
 6CD4D7W6NIg5JSayYkA==
X-Proofpoint-GUID: mNzchrBZq72OUysZ3JrFHJcCA9ZHt3_Q
X-Proofpoint-ORIG-GUID: mNzchrBZq72OUysZ3JrFHJcCA9ZHt3_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_041755_140480_C7AFD3EC 
X-CRM114-Status: GOOD (  14.54  )
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

Document the platform device that carries the RISC-V RPMI TEE
service group over a single SBI MPXY mailbox channel.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 .../bindings/firmware/riscv,rpmi-tee.yaml          | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/riscv,rpmi-tee.yaml b/Documentation/devicetree/bindings/firmware/riscv,rpmi-tee.yaml
new file mode 100644
index 000000000000..32287f27a625
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
+  - Amirreza Zarrabi <amrzar@gmail.com>
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
