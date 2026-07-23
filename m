Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE250C44536
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 01:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWmn+lQaYyUm2v9ObUcNrJ1vD+HAqjb0+fQgIEvecT8=; b=SMPNi6pHCgbXrc
	vbuheO/sCwJ9I5YGtq6EmJZM0AeCEvSwyZl0jOEIGFDyqxSe2qnPvSYkXZ5+5nUk7W5XlcIFS8Xcc
	NXqLMV5FMn1SjsAghQUjUq58KGDAac+8HkL6XQZluxx2niqeKl1Tj8tLQFa3P7ewo2JzBhoLaiQVO
	ckjPiJivak8fjA/WoX3IFrj7rMVl9D72JLzfKp90Rc+DNY4l7liS/uGNhTk2+ye+pnVs8In3curAn
	C+kxQV+lSdsPYnETrV95V5Mt2Rlon5JgI6kq8OUCfZgKaq6lPPv+GB+LhYrUdT+hg3cktdTrnIoVN
	7KF7v5YJ+FZn1TM6V16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiWp-0000000DACJ-2J94;
	Thu, 23 Jul 2026 01:47:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiWd-0000000DA7L-0dox
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 01:47:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0XTk72658863
	for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 01:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7lBQb3aO26PPCzUD/0DgsEWzJwNnZzEQ0nrCQeklUzs=; b=azy1mT4kMdMyli3R
	YeuVauPdoJXBz8OpeIX8wWo3UoKfEeXTtkejiDeQQrKgJCOO7IvV6hrIk/kzQnCr
	AGjI1jFz/NBj2mtP0Thbv062aK/514fQYmNQkW6xWmFcp0mj9UTDeqDaF/l3fiwX
	4ymgoIOrR73qIztYZJU3Y0ogihl+rMTiGHNbn4NnXwSjwt/KD2WhQRGaTLYZ4oP6
	ukOw6hYUrnFAl1fk+IJLv1CaQMrrPigbdK3ZPD3UkfX4YpSsp1Y5IF6sPEOTDrwM
	JrR4TXpMP2AdEXxK1LKcwkuuWznBRG5oklyc49jqLcKGyZxN28UasqblM32z6Ug5
	MvIGpA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b50bv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 01:47:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so3436685ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 18:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784771222; x=1785376022; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7lBQb3aO26PPCzUD/0DgsEWzJwNnZzEQ0nrCQeklUzs=;
        b=EEDAFI6c12OOF8xvk9KQ6ZeXPggEBQKCy8zCAtBPK9XHscIoBpcFGAS4yBnUiBynJG
         mkhtL7aCN0gfJLS+c5EMzk3HaUPY8HAxMS6mQkpgp9zziJudX2lZZ51ckEyvfhx7k36q
         ufrmO1nJkdvRRvdPYMYZ6JZ0UKI6OBxCVlKixXDnMvBpxQl15e48j+gv4bcfYOC6ZR9n
         LRwwAOEr6EkU00ZU++OltamGdJOj145RCkujszeLXUQM7pvkVq2M2ODsKm76kBUMCMdv
         PA18NgHFnYMwDzWODmP1xS5fBrcxoBKe3+uFxeUZEqQRw6oI+oNfrrJXMp8arUm4dHFA
         KVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784771222; x=1785376022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lBQb3aO26PPCzUD/0DgsEWzJwNnZzEQ0nrCQeklUzs=;
        b=avYxkm5YjxXhqsbO7X+6/RLMYvo86rw6Ej3JWO2AffWgUiR8ppT9brg5dmwNBkpU2N
         U4ATFc8vRPvB8JasTrvbH9yEoyZxNrSdO5lM9EUSYJFNLzfvj75C029I7ByTui1P7CfP
         v5CypzMuDvxPE2yoHCkRbzh9gvu/L9xq3yzIfOqTPy4trBXj9EC9Tv+Xl5XzfzzT1ifK
         kQ5UDI7nCjjpelGyIK6pQcOEX7nS9ePjh5RJKxikq0dKhTnkYCNojwsPQWuccZXY9hng
         JipVIb3dJVND29XfPl95qUPNnXitRPHp9Um/GW2PzW/XzHkBYrP9KYTwT7VNJ7P7DTEr
         khNA==
X-Forwarded-Encrypted: i=1; AHgh+RogxKHus7rmszPS/h/pNsQWOQgwAVqs7V7/1F3XzyPXWyEEu0J6dgxv1OF38hE+GC8hxOo3rhQElBckrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxARncVRWs1BLRq8nRE56ZKjcDIsD8pPLROFKtvtNzbWntotsDq
	EiHNdkPy44EC17vUnJfjwHSHKyAkp1StvwKCSu7DcCFLNPiiyVp+wnEsm8RzxAz7ubMzrX3hCI2
	lE95awDFUbnI87mT95AaFYN5m7rp1jW5nOvECXADTk9M5oQe2ItdLlW89hzGJFvhThO8DKfg=
X-Gm-Gg: AR+sD11Pw1J9wCQMUlKUnVaMGdRx/QgqVmLbwfUV1wr9OeGjzLPANKEhhU+WiTtbasz
	ZU/1dCY4Z6E69meJxZH/8Idbfqn+D99ZJgr6Sok3VzAhGNJ10aFnaDxNYT6GSe/Z/gYkEFl/T9J
	/f2JxvlhNLJyGTeKJ1vVwmBVNUU01pOMSrOabQZr4YPjNplyO2foHlbX5ZZ9Uxy8uZoRA1ojYNh
	YBBGSS4vXhR83TokMcdfe+KUeOayy61TJ4iIRIF9cvza9KBp5QTDGIT3y3hRlwu52hbgP1Cu3Ia
	+js5nYEkIwJROxpsXRAagKPlXhhSArR9Nfp8o5LK8OI2NqxC4Gfkozqh0T5nl4oOD8mNH8yYOfM
	uoGEUaRaSG0futUnTaf96CgwVTz85B7tak6p9EHaoXRmexWGnxCQM2Q3Jn1usY+U=
X-Received: by 2002:a17:902:e841:b0:2cf:a1c1:c60e with SMTP id d9443c01a7336-2cfa6a5a0a3mr15816535ad.1.1784771222043;
        Wed, 22 Jul 2026 18:47:02 -0700 (PDT)
X-Received: by 2002:a17:902:e841:b0:2cf:a1c1:c60e with SMTP id d9443c01a7336-2cfa6a5a0a3mr15816185ad.1.1784771221548;
        Wed, 22 Jul 2026 18:47:01 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa39e9sm23389995ad.10.2026.07.22.18.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:47:01 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 09:46:30 +0800
Subject: [PATCH 1/2] dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
MIME-Version: 1.0
Message-Id: <20260723-add-coresight-nodes-for-shikra-v1-1-992615f9ea15@oss.qualcomm.com>
References: <20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com>
In-Reply-To: <20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784771207; l=956;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=KjZAmYYdX486FIyES0cXfj7PWztonIPwwITTJrvXDuU=;
 b=MCVWSdx3kFRU6sl12LLfX/j6oW1cFns1Kbxbiws6kjgs1+ouZvT9ESLEerRVnbqM6vSCEwB8T
 Gej5nGzKwOVAyRSI3jMXfjbVBYm0o2bMwOMcQhKEjsxq1ndFCZSFGQr
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAxNSBTYWx0ZWRfX0nIWTctEqm3G
 Ww1USYSlsdph5I7jVuCQA6ICfAVWaYI/c9o17j/FXgrRcVcGZnivAfk8mTMgZ6BzNDRsOb7fVnU
 jjlXBASk8RR3OpT1i65paXCyjMCDYFGYSIlgeLo/2rWq+ahUHp+LjuOjxHWKFUSmfgtqDnvo09k
 q/5871/FfLrw0qlUKgn3gD5BXJp1za6GYFXRzBW1/i5vC/bnnzoe+cdr8QX4whEc0lJuOen3G0c
 xojiyEvWuD7NzIjNNljKljJwzz/3DbKwl6SL3/OVuMUN13m5Ivd13Hw5lK1kGHYaST6f8G2RlP8
 3ShfoZqVlksIs6jbuQlgp51EinfMM8llxGwTrAyOxYOmnqtOFYR9sUXWVXKwzdaWN+Lxjy7YhPH
 9saBsD8q/Vbpw2ODq5aPZwWultwCg7B94VcfWNw+SIMr/4PdQLE9RomU6JVQGo1pdMbgaz5bApj
 HkhmSUP+tEtbG10GpQQ==
X-Proofpoint-GUID: _mdiz1DM1GAsSX6qL6wYpgoKP-H4cvby
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAxNSBTYWx0ZWRfX1xj+pw2vPxaM
 L4ABQgdFWd8BYz4KqLeVxG7jDsmi/2D9XsUg7g+rpnrR/GrdFSwOs+j3XEmXlvRFTTBpJZALz8s
 LoV0kRe6uuAfSaMhWm2A0rixjVxMkn4=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a617296 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=BZKsYnZZkaJ4N7IUUl4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: _mdiz1DM1GAsSX6qL6wYpgoKP-H4cvby
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_184703_208159_E0450ACB 
X-CRM114-Status: GOOD (  11.67  )
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

The CTCU device for the Shikra shares the same configurations as
SA8775p. Add a fallback to enable the CTCU for the Shikra to utilize
the compatible of the SA8775p.

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
