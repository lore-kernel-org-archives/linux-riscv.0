Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD7BC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 01:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1JX7f7z+nHQeG7P0FpG54GKTVvYqvmj0Uwf+9Eldu3k=; b=B3Fq0CcD9pFvz/
	HkC2qU9HkLx1Ctj5/acve9V/MhjBNljABHB534x2V0OEEDjBDN1DrzsK3A2sFtzZc5kaGr1EBR5cm
	InChcLLGtRcHsSKN4lu+bH0C6ZiBYHo9ObT7bDatiMGneZlnr3LH45YJIRbOJHpeak/c8WKFCCTAL
	XiN5X6sHioMvMxODErmCttx2aCKtgVBqDESShj9clfuG4GbsOrvJSFkKKl1vm9/9jJIOfr2zydqu9
	JR3TiwaGPx3LYO6kY17IfbFLA+gOsYUfl8x0bHB22QHsQxHdIeWimHg6KlJCABsJhto66G2Q+AlLt
	lTH7gGm+Yt3pe+95Kkew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSPE-0000000AhVE-1O9d;
	Tue, 14 Jul 2026 01:57:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSPB-0000000AhTx-0l5a
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 01:57:55 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DNn08C2985450
	for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 01:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=; b=GdFVVWf3TfbkZG2Y
	ZEXDFOc5++40fuiyQx0QM26CIhBkbPxbkOTAxrl1R13hRkEf6SdW7hR382NN/Q9j
	u8QJQxoFBsgkejxOhShH35JHCc9NLcn6SbNNLR5fRdV6k3pFfzGtAdA4uMMKKLDC
	QEAER7IIPXw5fH9e7RPre21/dFWA7vCKQp6segHeHdOiUsSIxEt6RvbVtFzs4366
	dvQwbSUQob1LThKD1mbuzp9OW5MJ3ZsPQ/IwOllR5XTY6jhahurQ1AjFLtvX/hy7
	XCg15Ao9QtNAf0JTY46Rfcx37sqY9Ek5q4oEzsxGrJPup26xAiiOjBXCQqCPzYbj
	T8UoQQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44j1gmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 01:57:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c891ed872ddso6604301a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 18:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783994271; x=1784599071; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=BBSKtchIQravyjDxJKlxIpkhAXkeg2UNLgHsYuQAlXNgFvbLwa76vLXz5mH83/VPWw
         QG0Ud46vVzT5HLkjyo1jfunkOXwPdSRavDs7X1uwUsNNUwkSt13SpcJUx1wcxEeixNzh
         ggLxDyo7xGWQ3eUu6NHZ8SX221IJFrJvg2jIid2ycbiBgIM9r4BJoWuEB4XabToMXSVX
         vyUkkDUdXGDo/ArkH77xo9v7Ca8PUEhOe1adp2W3/2dRXi7aHi1Ho6P5+Gb0KgEma30E
         t3Lx6TavLNhzFODGNmHoY7kqgFWjVe9tUSH3jXMvQS6YLWp+ImF5CVuY4jyql5QoyK/t
         2EQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783994271; x=1784599071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=dxA+TyT0W4STT22u0EZDIVMLtgdlZ74XRis7qWny2xYwoqTqiMQ2kumzIbQ8B1TkTh
         VisT41D7yV4MZs6QzrdaMdMtryS/CmltzIEm5JiXM4GoKwb1s+UquF1lXjDGtbrSau0e
         OMwXuehd4ZNFnuOB0r35ta8n6OhuFQHOkfxZTzPsnaKhjtcUGo6ZROPUNg59LRAolGHj
         T7rdWonlqmvuPJC8dstqdnH7841+OUNuJsiWnwnEhSLZLHO0PxQk/ZAGiRynoSnCzGg3
         0kIVWxcJBEBO/y55kdnew2DsmRqEnBUgNJu5nwuUiSjLHUgzjnvp5mVbw3xWwrnRCLPf
         oXrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpt9duy0oOzpdQ7cmIiBsEIeniqFhZaKL4ECNuRJo7bq6iXrPlw7Xu0BFeqyZgQUkPiA+Qe+4RSuqqgkw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaXnq+f/w/ydvHhTNjLS90M9wAuBE/YmsA8XvJzA63U4QVlHtF
	UJQfLnQW9ZtQwvk+N35Y14QUwtFPzm20yrhDSFfJVYBW1t446Z+N8KjZTP02V0TwtG9t30il2c3
	1hwC9+TJcqL+uRJ1YvBOao5Otj/ZKb2K3vDujVdMNaqa2SwJOEcWMs/rKGF+WEjrKOxHEmMs=
X-Gm-Gg: AfdE7cm+Dzjxqs02F17XiMgVngzg7o4cT6ZQFhXw6afI8NnnnpmY/2zLFqSp2+vR4d3
	KlR4mE9m0Nf4P4QPbcKHvkOGuTIEsODEzakjGWLuDdiFH9zpYsaLzaEl9KWy+U1QiaforTFVmwB
	gns4a5QNavKiH/Eg/jXAiKrxVRs7yG3D/Km3Poj4Ui+w9ZuI5nwqw8fa8lWQE/EOYWm2nOg7IjQ
	1Oia8T5lA64gHFZX+X5roIUObdHROH8qoXEEQe5nileyXvhK1SQO2ZzNuZUZWuGfBgVTp1GZ34C
	awQBxiAKKYkBV5AnlKQRK+BcerxSxZdHpw5lCLVXeaHDvSLv/LqcTjgX8zusiXn7ojip0vcHtcN
	M2clF2lxserUWkVBN4sudjIw5rlMLe55lF66BG1FXKapZPjS+UyFplHdBuk1dGenqUt4nNFZz4g
	==
X-Received: by 2002:a05:6a00:2d1b:b0:848:599f:26b with SMTP id d2e1a72fcca58-84a5140f5b2mr1435678b3a.14.1783994271267;
        Mon, 13 Jul 2026 18:57:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d1b:b0:848:599f:26b with SMTP id d2e1a72fcca58-84a5140f5b2mr1435657b3a.14.1783994270836;
        Mon, 13 Jul 2026 18:57:50 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f29ed3dsm634191b3a.27.2026.07.13.18.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 18:57:49 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:57:25 +0800
Subject: [PATCH 1/2] dt-bindings: arm: add CTCU device for shikra
MIME-Version: 1.0
Message-Id: <20260714-add-coresight-nodes-for-shikra-v1-1-b1cf85962455@oss.qualcomm.com>
References: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
In-Reply-To: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783994260; l=948;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tQRjjrGLQhurhoVg6JDZIViVv0b1R+8JttaNXtHXaZg=;
 b=dFnReCQgB1F4kdP6N3jOcn2Ya1eg8bL+kLH+qKY8JJP5w1AWyBHlggG7AXiRu9hPYu4/4MrrW
 LCjAADl1NfFC3xBVmDM6Iq1YOeuluTQfFmcIKhbdK2sUMjdi3FMnmzm
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDAxNSBTYWx0ZWRfX3n+wa9Z3juG2
 QSMURA/IhrQQ978mlIR/U1GdHjQqHl8dNehZEQAH6vpJDUvQAU+cfb/1uqg6v4Hzviu/8IG66hp
 bQxx5eABcdGE+/2/NMMDRgd/Iw2VUX4=
X-Authority-Analysis: v=2.4 cv=N4UZ0W9B c=1 sm=1 tr=0 ts=6a5597a0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bwSPl2VgRa2lNh99CM4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: W7-Xqh2GmU5Z9IcYXSGsgwZHt-xteZET
X-Proofpoint-ORIG-GUID: W7-Xqh2GmU5Z9IcYXSGsgwZHt-xteZET
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDAxNSBTYWx0ZWRfX3dNKrNt31XkL
 ULxDPjeukse2iliE5H/76uwteaGBRSffVzQnTlbBjLDWfe+2vpWRtuFyOx0W634AzURWXqk3GOp
 a0wfG/PCxxE3Rs/hXAwBMeXVngzBvYu9etlgz84Ur68PLhF7i7PywhAU7FdsTZ+MCyhJ5/wtE05
 nEunEa8HshdPbdAF/SNf8DVjpiogsMnEKNOP74m7WHxJ0MkMu1RBpEGeTLjbe6tgoVLJuJAn/J4
 OMJHV5gtYBlgU7+wXqa+i1IWgDoCGCB+f+A4omuSjt/ncgU0UqGFgbJz42YKyUQefWGVqI+HEnb
 FCnh7talXTF8L4ou+npdESwxlcZa3l8gQob2/2oZSYfowu6ftTLGWpRlw9JCk/5aluOg97sIVTn
 9r1IRd8IAXt+aobJ7yUTPkJVJaM1fRZtvglXXQRvGhdo+nfohEl6hyuOyW1KDaVd6NNwewsRe1w
 S82A/k+qo/TGrcBYnmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_185753_376211_43271483 
X-CRM114-Status: GOOD (  11.27  )
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
