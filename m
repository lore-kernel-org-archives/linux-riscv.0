Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DABC44507
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 01:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1JX7f7z+nHQeG7P0FpG54GKTVvYqvmj0Uwf+9Eldu3k=; b=lGzeMXy9CSj+pB
	r5Vh67UJ2po4ZJ4maXFP+a4ltMZwtYVK05wdAUfl2gEuKnuPx76PEPifjYE4eiKXZwpzN/C5iUWDf
	GcXclTQE/w1myAWReEGVhny4aVX/qTwGPxDnQrMtGyb9e2Dinz0cYG9BxOjUlX2BGHShObPobRckR
	L0o/GO0FFV8CGSVlAyH8dATuSC15inyE9+Rd06K9NVLe2POh5kb604xS5WlKsKzWAYQ+qyf/BqWAh
	HKpHyUPWns+sU/w1AzloshQYCyx5Q0kUo65+6kBRDcrLnwb2KhLSM7lrvN53eCZpNNKV8PQPHLrS8
	dhDP5xn24RUbtATGtzGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoEy-0000000DXZr-2oGB;
	Wed, 15 Jul 2026 01:16:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoEw-0000000DXXf-1UNB
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 01:16:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0IqhS2076889
	for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 01:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=; b=ZnLn+WJxNHdNzF4i
	3W+cZF6RmtLpCQU1MTWdWGxgW+Q6CBk/MU07fBZgetR6321KC6yrX1rD+AOHGSaX
	EdXPiHEmTXhTfCDDmBRQHt87jtRl5yDKBbwl5bOM4L/UBDQ1neX5SoEHhr2XutDh
	zQMGegjFmLXwcbb5Koo6EfcF23turYDZF4N5RuiyCQEI8vtlE+3k19WHEorefctb
	jG7zaUtupi1AkGPSEzKPGEs0G2RkqrK91/l1y7IL+Lu3WE4W3/UoHq5kDlatiz2B
	os8mJ7Wj25cnFlcVf7c48HnVoQuLUtlkQYN/EyRVMdXgCETKe+/6Dy/A/+K09yt0
	pKQn4Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr2f3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 01:16:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38869800848so7670637a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 18:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784078204; x=1784683004; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=WxU3UEsE4salfynYInhgtAS9n/ctRbT1vR24FauQ7GA8Zs/9vo2/0wNm9D7ItOGRkk
         yHoKNRZFQ60juJKoI/6m1c40gIkNMtryP9gcv0fbvwnq4m0T75MUpsQ9nRx42Ln6f79F
         ziRncc6dBb/9KuosOq3SfYuSb+htei4X36jR+b9w25du/FqgSoSzHvvYiv52qoEGB1kl
         t9p19TDW858sMRlvWsCA91+nfME59bzSnedMgy2SFYTP59y9JdQCdLamNODzBi7kiCcW
         mIJXfbMv3sElTzKzIpb3zBEVKKG2fHZzn5OceWVsh811xYiXcTA78QlRT540RTSWq+TY
         t0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784078204; x=1784683004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=DX3p4oipisnq99NHYvAxmbA6uyBZQlsNQlszN0nXMN+SXsXsfD27Cekjd0UKQPeQt6
         Mu8fvh9CsLak5R+RODmlB/zf390evQzQocHaGom3n5T4pofnW6yAL9/2JOXrfE7IpPTK
         neShbz5zoeydfVTijZisYfGInJknG6APGM5BSKjywKEWEZMEQjdY+QEYrQZC6QhSY6Mx
         eYpXRtv0LYu/lN37PoinOAd4whMB0UKza6sQIUxKBEBWRCnkQktNuyw8X4MMGGEFEVBP
         qVw2rgwRPjrYC7KHoP7kv1tJ2cnLUyNfK5c48jAo4iRdnNmEcofBhOxeepSDTe7hZI6X
         hQPw==
X-Forwarded-Encrypted: i=1; AHgh+RqnHRuvcPNHmFylxYSxpwEcmEzogJ0fctyFdAj00V7YIhYfTvsuz8/Xb1bJnEKBIgbwDiO4/C/SzESvsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5ppX4wIaVwt62coT7gfwB7azrlUJ3NTNyN9n8lb33AiQJ6mv8
	H8MDHW+ONDom1DMWctuTc71ak7i5Dtk6F/MWx4Z8iCeP/h2/gUONFMdWrNfsCQwuBCAakXGhj0Z
	GavSnLWAAvgyM6R5PtpByQnVypn0nIG+0iofgBYlBHZvSaDccshrFIvWRMx+7XljNoRAP3oo=
X-Gm-Gg: AfdE7cmINdkaq9huPRrhfxX13omzSGTLPxKlCG+nmq89yyb3cIWaixNZm9xvqLLAqm8
	Kx+RUuJZdnuIOHLhnsjTEyPLkMHa/64G8sWNGrS6/hBnHM44D02sYhk6ujK5yU4fhMYkGjwrwSK
	xoZJW6JKVQ9OiUrXfHH7cdEQVrc/B5lBMEjlheEGczjQO3wnayYpCl6CeS837RpqOpJTyJFxKY1
	ryYgcUYgrHC3XY6mLDFB8gF0nhVTmcxoQ56nuc2dWKe7RJQn+vYRHlVc4U/2l66xg6a9lnGiOal
	/yS1xgYN97exAwifqohMSJmudQCe/zH7NqQ1n0ippzjb2Rbv2+AtxeuNv2bQEXY+S9F8QpPulOg
	HqeToLwj3+u3ScdCNHVSvMsfAd7zz+7VMT3w/rJ3pBNi9NuXV0ON0LexRYV5HWFK1aaN2zBhJKA
	==
X-Received: by 2002:a17:90b:3c8a:b0:38e:baf:6087 with SMTP id 98e67ed59e1d1-38e1af3fbf1mr4250307a91.35.1784078204360;
        Tue, 14 Jul 2026 18:16:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8a:b0:38e:baf:6087 with SMTP id 98e67ed59e1d1-38e1af3fbf1mr4250282a91.35.1784078203859;
        Tue, 14 Jul 2026 18:16:43 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e1745a3fesm2207487a91.13.2026.07.14.18.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:16:43 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:16:14 +0800
Subject: [PATCH v2 1/2] dt-bindings: arm: add CTCU device for shikra
MIME-Version: 1.0
Message-Id: <20260715-add-coresight-nodes-for-shikra-v2-1-ebd485e39a51@oss.qualcomm.com>
References: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
In-Reply-To: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784078191; l=948;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tQRjjrGLQhurhoVg6JDZIViVv0b1R+8JttaNXtHXaZg=;
 b=WtyqlZzA0DXss5OsWmivd5DeH34exJbbEApd5XxCJO2QDiBWm7Js2v6uEFquGfE6CkTb+Abn9
 iyXf/b5+j4XB7vlIZQ9mF1ykxlBRUym8OWoSjDj47vk3A6GEOOUaG5/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAwOCBTYWx0ZWRfX8p1us0t+MIoJ
 ja6aupPJahuLa1rD/5xrr947rCPIhver91X0d0J7S9hOMAPLiQs6R13Bh68oSYY9QpjoJd2ek+H
 0FQruqKcmtn9Y5VtPTXSClBm6K7bKZ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAwOCBTYWx0ZWRfX8HYTYWWUqLl+
 WarN3Xz2TbjKkqwqa8I0XQvy6WT5uGgsmmNrXbt90Wj9HMqUwAAyyGmLTg1sI8r0P+cpEHdqeNY
 CrLz7BbaVXuS2iFKtLgiSOYxJq31hrQCFc5/cTqqMifjrVgJWRGSEnCYKwmxSH2urfZX1c94hEo
 CuhaMakFELLBFCEAvCn4xEYNnISL3cCwTcMCkpvV6Ot0Vpj2DdUSZEjCcENpuGBFZAQsinkh/Uo
 vtchIIAdjymU4kGwq1tGomMXqq4yT5Oj/jNw8eTy8vkLQrdi0ITSfIEqZWHBaTVNwCGSUA32P7X
 ERey11prwZgnBa2l5qGp7WpAh27o+WZaBEZu0WoOlsFAI5TQKZNprx7b7UdrRfBYwRORiH/H758
 6jtAXcv1mIkIYpDHWcyoNfB5Y8LfvDPQ86pJSzvJByOPkEHSsxktfzLdVI9BZ1bD6GRmAtTg9EZ
 6xp86P83ZLTfOGfmwVg==
X-Proofpoint-ORIG-GUID: kiYxthz6RZw8AKN8DhPnvtUqHy-frV0D
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a56df7d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bwSPl2VgRa2lNh99CM4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: kiYxthz6RZw8AKN8DhPnvtUqHy-frV0D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_181646_528988_942551EC 
X-CRM114-Status: GOOD (  11.98  )
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
