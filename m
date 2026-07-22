Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5A9C4452D
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 01:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1JX7f7z+nHQeG7P0FpG54GKTVvYqvmj0Uwf+9Eldu3k=; b=RLK/6mwBMBfiUp
	eSg+YOxmrvJe/SfXDFla3Dr731Pk+Js0ZKPMTZHL+cOpu078TKgE0MZ1Tae32PWRzutZT9UxNPZ25
	yNJ3ZlkENe5evzsw6dR456f2M0H8w85gEYYqTr/bGs2aGsmI9tftep9Qniy72/hbL4BE6st6M+9BR
	GWkYH5mSQATa+pWTOYRHg+Uve4p4Z8rhYezMUZ+NtFubskazT8QI2ScHNa4Ga0P99eXyyMswZDR1m
	rAjEsc50ovleSLHfzpu9KwrD1JQAKvydsmEwbjtmH7vTeyu9jxsA/hpxM12mVCQurfpqUuCgybnDf
	U4+xJ9msM7M2hzZHtFOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLXN-0000000AgxA-0LWo;
	Wed, 22 Jul 2026 01:14:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLXK-0000000Agw3-09B8
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 01:14:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1CjjZ335662
	for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 01:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=; b=CYX9671vuZfIt+xX
	au4XcaSKIcre2A0riu8zYCAbTZcxouSraEUlbpDo+UAqzLg4ltp1427pE2tEPVrv
	F1xX22tIlCaiwX64ssxlDF113tmZ4L4iXDI5O5fEKrqwhBBD7ktXSW0IoTy9r/mW
	AkfrZyM2wBVzLLCS2z8/xcuvgEqgzNRoDvAh3jL7lOL0yrHoTtp4O5HL5ZsgmEMo
	gZqpbu+9CkBNHD3nv3oJZSOmcOf1StsBoAisW1zRKjwn2ZdwFNkJZEHJ/+3+h0y0
	Oc8fw++4fKvbYAAJJWRohZWjF6w0F2Mw9OgffGFBJ8sKWq87OYTT/2a996WpAiDF
	1SQg8Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsuqyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 01:14:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so13881753a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2026 18:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784682853; x=1785287653; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=hpz050o48i9IZ8PWsez66tlAgGNMAZN1+GMvKAXI/mAtWnUedqhVpgEcmw0fiEpacr
         K+Jw2kB9786JcQos94XC8Y/eGEXOiDoXF+hTo7KEzH+PkSaExcqyICfS+ppHfMcV0ihb
         O5IBHDBhCBYRA/6MuWYxr3AoDj+dBrDa5Aw16pzUlhp0bOSRIGKQv8DYfUvYbdO5EAoX
         2K7HRCPubXi9YcAnQ4YAZ2jn9+waJzN1JqzxYhfes9PEYb1wACy/1Q5Be5DtENTLaWYH
         9U5i0jg1VSIOzy9VnOyiSzCzKMpsTyCmr6ifl7JnWn1R0HRt5nPV5Nvv6/8F887wezlp
         Peig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784682853; x=1785287653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=LQHqeEGPrHKlg/qOxFteuWThKm1D5V6dUGOFPZd+1WDipk9gQOlOy3aNmES79NUpdd
         sdrlDuhMCuQPSjHm1oaVurc3JAo6mWpGc2DyUdG7oJnRYJ25C5+p18N+vYOyOCJ/KfBm
         n18w3+klj1OMAPIsmazx0FI58AGQuAjdS+gFaRuK/JKvJpkfqVw/UIxlTSonSxFF94G2
         y/jprhEfXHXIwm65osfvvKksJbG5H6Ol6ER8gU6WdhYXshJ+pIEWI0lCeTFyse2pJTpu
         4YfacfC2tIoSFMtOY/2RNU4/1ByMRzJahpI317Az692yEBDE+tqmKebL/oU6dS0F1I+8
         XPgA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9AmIHELfzodZ06bf6zHiZrHIQRLqo0YNHBOisxoTHu/SYh/xPa/Dx28kOH/dyzDSUpvzY4Kwe0xtq0g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0wPRZgOCErLKCcoc7uJpkh5ZK6eb3PxsDt7VQdgIG+19jRTXN
	w7pXeTws+Z1AhKxhbf+OzBgd9oo6kmj2u/36hl4h7RIGPevg9a5czwvFZtA0IkXMGe4xBaSZQo9
	T6+ULck5HKPsw9mVs+2lpvhIg1l0DyT6Tv1n+8tQeB4XU30kVbp+QDT37zN+w9EyDwU/Natk=
X-Gm-Gg: AR+sD12Or8k0jNjRxeJQIwkKG03znuR9x0YhEOzgKLjvhm4j5aV+PajE6Ga4nM6q5uI
	GhQ8zk5fSY5xmiXYJN94dEKxoireArxk2n0PmU4u939epYDUpGpxez3Wqmpd2wP3BsPfMgDM0So
	bAeU5thP2GcZqAo9OMCm6ZXdllU3zDyLx6x9oqIA89t3znO0tupkvvCbOyibNfp0yt8sxHqINAj
	430ys0qMmy3Clue32Zsg6J7nXmiNCvNHuIpf6C77b6/OCIUYcpnC+nBqxNvq/tn0Ru6zzR4pVKw
	9Lb+Ol/Ee4u4u3f3toewbFdMRQWOERdHxgV+hvva3Ul0VMT5OoyBbVZ2KVsLYeY5e6w0Idp64uB
	kwreCM3+sUpRVl5oZwctKn4qALEUu/trTiacGkGaP1jX0GlrU2YJuMSjVLCG0IxA=
X-Received: by 2002:a17:90b:2e90:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-38e4b418439mr20460543a91.6.1784682852856;
        Tue, 21 Jul 2026 18:14:12 -0700 (PDT)
X-Received: by 2002:a17:90b:2e90:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-38e4b418439mr20460479a91.6.1784682852018;
        Tue, 21 Jul 2026 18:14:12 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea7b4da35sm160380a91.17.2026.07.21.18.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 18:14:11 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:13:47 +0800
Subject: [PATCH v3 1/2] dt-bindings: arm: coresight-ctcu: document CTCU
 device for shikra
MIME-Version: 1.0
Message-Id: <20260722-add-coresight-nodes-for-shikra-v3-1-1400a3454e9f@oss.qualcomm.com>
References: <20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com>
In-Reply-To: <20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784682838; l=948;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tQRjjrGLQhurhoVg6JDZIViVv0b1R+8JttaNXtHXaZg=;
 b=jBakBYCNzDdjVoMi5eDvzHX1E+IdgD6H1Fcbk/cuN0Kd6M8m0FR7gpM5zzunUVXs5JyxpLzSO
 5hSv83maoH6AYpsiiaJH+r7Tuieo4//oOCgQQRdIycA0s3DMr6HbMRb
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: v5soubVGrcpS-u01hqlAvKjhQpDw8aRR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAwOCBTYWx0ZWRfX5y1nUi9xX5ZH
 z1nL/DoPjVUBTxdtMvJPN61xJxYBrTXwKbCYm4YmOljnLjt4IbQFNE9UJCyXQVsJG/g12Jt1A+/
 9lTfMJHvqJ6qc96p4QCPE77gBuwI+jA=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a601965 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bwSPl2VgRa2lNh99CM4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: v5soubVGrcpS-u01hqlAvKjhQpDw8aRR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAwOCBTYWx0ZWRfX3MecgByIVRd1
 KzWfV34g/WlJt8qsJi69Jx/hLruln0vx/56ClkXSnrCi89mHN4/bpd86+566gmHiMZJJDD2a+Na
 dATZHuKxgGZ578b7DZdRYOIoEjX8PNS9dHRWfonFte+b3MW5PTLRhx9RtKnxjXMnHNBPeXFl/3n
 i1xvB3BPUPYTF3Uxsnmz6ejRqzZCiPxRE5HDOvKsrs23g/G6KjpH7OELru18FuQdd2+FgEQJG5z
 ZE2oKk70z/3WZ1h92q/V1y4pNtlwc1uIQjzHiiDSlHGhzhr591XGnx31GgpSH3E2xBSP3asc+S8
 cvrXxYcxLUgKV+s9p3NZ7l0GQP6bnbJ/DoBaMFmXvKd6ZsSO8tIYlGEywAoxqnVktrw/ZltXuFi
 Ib1uooMyS5uYeM7BI5463gDIZREezw/aLO0Pz/QAjFNC43n+J3pVnsNmKe7V//TnryV2wW1R6LS
 GkvdKNEuiGu+2UcDeXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_181414_091215_454904E2 
X-CRM114-Status: GOOD (  11.35  )
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

The CTCU device for shikra shares the same configurations as SA8775p.
Add a fallback to enable the CTCU for shikra to utilize the compatible
of the SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index f3f3feac4ce2..335a8e1a5a9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -32,6 +32,7 @@ properties:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu
+              - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
               - qcom,x1e80100-ctcu
           - const: qcom,sa8775p-ctcu

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
