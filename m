Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A5CC3DA41
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 15:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c09EoFkqGY/gGLEVf7ZHBUxZSU63b1T+0LWq8mL2ZFQ=; b=EPMJv+ASDMaQ5U
	ztl49s/gC6fY508R6bsRjt+pcauKAXa0eMUezaP++KuNZ9kopS1aD6m5DhXZamIdH9aQLva30a5gw
	y5Jp3vuSmYogfY9vNROFBvvlyPGLuaH36N57h8gVvkAFs5M0STzfK/dGEulRuzMGlROuDb3tKFT/g
	ZR+TWer6xpm2iR+64+m6n+G8nNi3bLEuAupso21yVZVn5PAsltVCb+UVYB6QQSp+tKwTcpKfYbyvU
	Bs8VkZT00yh0/Yv6dZ2O2mBdyT8LIhgtfRP7EwW6vp12zQ1r9GhqIuw+xDof8oh/zorzeHMrAi1Lt
	s6IKlOk/qL3e+n13biGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRCPP-00000007fhk-3yxX;
	Tue, 09 Jul 2024 15:05:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRCPM-00000007fgl-1JWA
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 15:05:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469BpAgn006130;
	Tue, 9 Jul 2024 15:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F56bbU4FAxbKIxHdSEWInjuA6bZTyrLhpH7ENSBE/5g=; b=PM4RsgVFogh/esNy
	d83koIFUqCXgr2F7teAqgLsxnHEX8LoAwEMlJ8A8rpoDiKmoetHrZJAHgNThl8UF
	G6Rtjz2HlM/CjNVAwMqgSBmm4y2xGm1j1xKLIW7KIK23kXSzCc6D69iBiYoJnOx8
	4XCaW6TbTWCZvkrri608WCAWSi3ehz4oN8wYmbkyfCAkM4zEVRk+KeIzQe6Wx1yX
	pu855T2cCtPqN3LHOp9eZau2HGtcr9syys2ZkgsgFo7IwD3ff8wnfTQJDBk8guAu
	PNZP34umTG/noD+ph3w5Llr9Bokmkh6pem42iTcf11K4+SiNW82A0zA6k4DnF84E
	fze+zw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406xa66qnv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 15:05:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469F59Zi030543
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 15:05:09 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 08:05:04 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 23:04:44 +0800
Subject: [PATCH v2 1/2] dt-bindings: cache: qcom,llcc: Add QCS9100
 description
MIME-Version: 1.0
Message-ID: <20240709-add_qcs9100_llcc_compatible-v2-1-99d203616eed@quicinc.com>
References: <20240709-add_qcs9100_llcc_compatible-v2-0-99d203616eed@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_llcc_compatible-v2-0-99d203616eed@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720537501; l=1256;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=XP9FQoEiY1PMvBceItTwxb7yJDOmRScik8HW4tJKoMQ=;
 b=pluo/EgCQPcJHvm0pCBNu2SmNlhaTEFPgIBCAQdis+wWWk99QaTn66gwgLB8NiEZMcSlssvfT
 +DCR1sADjhBAJORLpkWfDR+UQ3t9oITpb1PfuGnoyOU2aNT7/uU3S1G
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 09LSOZGNslt8X5oHyrz2qxFs2I6fYEgm
X-Proofpoint-ORIG-GUID: 09LSOZGNslt8X5oHyrz2qxFs2I6fYEgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=806
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_080532_502752_E2E893E3 
X-CRM114-Status: UNSURE (   9.92  )
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

Add the cache controller compatible and register region descriptions for
QCS9100 platform.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-llcc" to describe non-SCMI
based LLCC.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 68ea5f70b75f..a38c8b99099e 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     enum:
       - qcom,qdu1000-llcc
+      - qcom,qcs9100-llcc
       - qcom,sa8775p-llcc
       - qcom,sc7180-llcc
       - qcom,sc7280-llcc
@@ -85,6 +86,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qcs9100-llcc
               - qcom,sa8775p-llcc
     then:
       properties:

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
