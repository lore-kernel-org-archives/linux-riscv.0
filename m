Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA060C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 15:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:MIME-Version:Message-ID:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NQeAPfccUQVSFF0A6qA5DBZSBXeBBRMapb4qZp5PKS8=; b=PPTIwM2/F4/n2B
	H+mwkMwdSRHAjNzMil1SBaiyxmUTV17a4IwuzrQEq47IERN/K1vdH3CIjkTI84WGDvAofE/WCmfrA
	rSfsNt8pEDOvIiXMPVCrAhofkkGAqEFad6UjS6a1kk6hbvSVWuYpXzCr8Gu4RaL+8JvDQJUeWirTU
	ivnP836QXon8k4Y2fguh3z/yVxrRSIzjBttlTES4GjlzXx1Lhn83ab2+Sdj/VTmt/8XrksPmYaaaH
	mrMEGXghRecY2TCZ5PENYAAdvBfB1I7KiUWT6re4YIKI3B372L+uJopUMh3K2NZEoG8cNpxw3/zX/
	2WzvWQXwtq2jauouKVaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRCPO-00000007fhU-1Cnd;
	Tue, 09 Jul 2024 15:05:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRCPK-00000007fgN-3DE4
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 15:05:32 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469AF3AM003367;
	Tue, 9 Jul 2024 15:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Gxt0xCLLv1gvUKPmJEAON5
	YupmuOacw6eXMWBBFmlS0=; b=fc8RKTudJS7zkSGoG8v7sGPl3ffc+kOrIXM9/z
	ASL/g2oIdJt6s8gAYx6//nYnubZjBMTXO9rUwkLNtS+LvXMDdJwR/lO2jLeqjt6n
	Iu938/6ExK9ljgqfJeQ+VHwFsbaovBf9y+kkOO9BXe+BbTXZ5mQNSTZWCAqnCN5x
	Dl/yGVXCY3Cpx/WwOOHW5GjzS6SsEq1ZojlRdU1prDYViUA0N/YKV3/odoAt5kvf
	pwDi8tabp8jKLy6Ki8oDjhm3dGezix+GIQHetRLz9tIKn6Ie8DllVWXgMTNAzgCc
	A/G3TPSH6StJCepP+rraRgSdRBBB0JCDnuScN/NasZ1FBhTQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wjn71by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 15:05:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469F58ef005131
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 15:05:08 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 08:05:01 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Subject: [PATCH v2 0/2] soc: qcom: llcc: Add QCS9100 LLCC compatible
Date: Tue, 9 Jul 2024 23:04:43 +0800
Message-ID: <20240709-add_qcs9100_llcc_compatible-v2-0-99d203616eed@quicinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIxRjWYC/zXNQQqDMBCF4atI1o2MoyHaVe9RJMQYdcBGTay0i
 HdvFLr83uJ/OwvWkw3snuzM240CTS4Cbwkzg3a95dRGMwQsQELFdduqxYQqA1DjaIwy02vWKzW
 j5XkhpRBVo9Eii4XZ244+V/1ZRw8U1sl/r7MtO9d/NwcUpYAUM4kAJc/48iajVuv6TrvHCXImj
 V+sPo7jBy7Le7a3AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720537501; l=1681;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=/DtOAA4kY1FL1wu5XQtP37fLouTTMG9j45ZSPCe1840=;
 b=wZOh1RS9udUpFY9Zd/akCwIdAwVuP7ZXXSPUtcqMiW7h5edeE/h5ChFqibyOqJNMCTXsSMnWd
 NQoXelHn5rwBOB1xJeQ3BPbRso2m3zp6MuWXUyXZsYzsphCP8uQubej
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zmLTU8rN_tuKI6g8hbH68WEP2X3nqFSR
X-Proofpoint-GUID: zmLTU8rN_tuKI6g8hbH68WEP2X3nqFSR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=869 clxscore=1015
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_080530_975135_669AC0CD 
X-CRM114-Status: GOOD (  11.46  )
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

Introduce support for the QCS9100 SoC device tree (DTSI) and the
QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
While the QCS9100 platform is still in the early design stage, the
QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
mounts the QCS9100 SoC instead of the SA8775p SoC.

The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
all the compatible strings will be updated from "SA8775p" to "QCS9100".
The QCS9100 device tree patches will be pushed after all the device tree
bindings and device driver patches are reviewed.

The final dtsi will like:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/

The detailed cover letter reference:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
Changes in v2:
  - Split huge patch series into different patch series according to
    subsytems
  - Update patch commit message

prevous disscussion here:
[1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/

---
Tengfei Fan (2):
      dt-bindings: cache: qcom,llcc: Add QCS9100 description
      soc: qcom: llcc: Add llcc configuration support for the QCS9100 platform

 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 drivers/soc/qcom/llcc-qcom.c                           | 1 +
 2 files changed, 3 insertions(+)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-add_qcs9100_llcc_compatible-3477559ba2e2

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
