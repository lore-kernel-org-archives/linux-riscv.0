Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7309DC44501
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 01:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kL7ktvOmAWJBGm6EZsqFtkhR/KJ6nUTmHmBhxx7C1A0=; b=Hei0Se9MqgWOeZ
	t/NfP1q7ZV6cQY+aveZOyuhVVtRUnryN3g4YLn8Zm5h/uxvPNkPDqeu5XaVfwlwgx7fgJM51r1CTo
	Z8tSmX19iF1MiTTJYoUYkF7r/F7BMWwEebQ1zEwjT5W3fI9DFAysQ1I85afQ7cjQNcYfZ7tzvMkXb
	nSzvnyZ63g36BGsP8POe6TJ8nd1VluTzXI4KUjtUDv2rgps3JqaQcB+E7tmLfdBLfmAiloej6uHkO
	KW2ZMQDPbsmGIqvoa3VcMRvUIRSEjde8gjr9XleIzGr7cnthAq9b/rr0KkySzfI70g0UHc98mBvwt
	6FwSW3xH958jQhjM3z9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSP8-0000000AhTS-0z4t;
	Tue, 14 Jul 2026 01:57:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSP5-0000000AhSI-31OZ
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 01:57:49 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E1kNoG3259724
	for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 01:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tp+sv+c71VTdHi1qXlE1u1
	5U+7SzQuSNHRz9AK/D148=; b=Lt5XL7NfRoJOWWR8HMi5u8+L9Bxyt7UKH/i//O
	mk0zDHYEstNElk/MsiQ7QES0PZHqITKhrdr7jARMSK4u2ssThVffL7vrnAlqCuuE
	wLM9ZtHVHg7p+FRCPOtljYj1Tc5Tf6JWl9g/mmwF5RlBjRvpCiBj3dJ5Izwil0e5
	i+7+N3Cn8zKAXuD2lQqGW7ix0S3DM2EredYGOu2m8uXeWCBQAuD+E1AMPi7OnOCS
	ESabFpCjUNDTLaKUi+YhRn1LvloIwSP3+MFf9knwCxeuIwA9N32mK2NEcFJygi1d
	F53KKGBK6YKqnkXnZdr55AogzMwzyw5nrJpq2CoaujSo+Zag==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr480yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 01:57:46 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848860def2cso3724764b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 18:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783994266; x=1784599066; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tp+sv+c71VTdHi1qXlE1u15U+7SzQuSNHRz9AK/D148=;
        b=XzVj0pmbToJk6+148heDPydCfsFnuy//H0IrLivcTblswkk+RbNH85p1D0YcifT2Nx
         YwSj2h+e6y83Fw052cyy0NnEmJkdciVU2npn0ohClGDLPrt1IA8CXQQhlekyhO6DjMBJ
         mYgJoOPnNKmvpRSV/n1Cf+orQvFfbAY0JfNWuedNsYWNCluA3Htg0iMi5qgy57rAXxfm
         0SrKUAEhMXqGBXTRh7eH4+5R+v1cCkZRcCEbMlikPXrRMBEcb5YZJbJJw5FW+xZaClVV
         ImT8AXdHDKOGIXFf7x6PeT6JmgPlk3YYPDGsTCZBAfGHD1cnxFyRe1K1FG+RJHcKeE/z
         LtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783994266; x=1784599066;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tp+sv+c71VTdHi1qXlE1u15U+7SzQuSNHRz9AK/D148=;
        b=R41u6orDGDNBJBJAEHFw0jqcL+buWB/BHnOQg7K7CWv6bIi+bDVzevc8p1gn0Vd7Ko
         Fos7jsfJW0gF3YFkKnWAVpE8CcpBVaufolAMcFhQ+HuWVc8Q4CW7l/fQerPY+VZHolew
         YmmpFL5dUYZimwMc3bvKAFf4G21F6ngpppMHUGI0mUPKiD3ruf6f9sovsJLDl4SlLmkY
         TUGyUqLxW6HHgSeUIrNFqy2WuqztChgCfi0EPKU7MZS2fEIJH6h5SvStHTH7FgriUK4B
         mBrnBOzBCTra32xh4X0waOVH4DWhBL9G7KXs0njgGuMFSy6IckvEhyYc/g+X1y485286
         G1EQ==
X-Forwarded-Encrypted: i=1; AHgh+RoREg8AO4Nw/AaaAwl2jXktxwnM2DHZ/PK3K0t/HUBAVExgPKwP9iLLPY7krZ1r285lBvMtnMhqvjMufA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhV9ecz7Y+8CkylPId4Viy12aW+Gsyb+DDCxqFmlVC9cbnwKRZ
	OK4hYbMLClBSDjwhciTPJxcw+GnxiHd+DYDFu9CXQDhyo/etjFSicP/Fyi/R371dV9LtLbYtL6k
	LAThnYz/RM9LyOSRyYygMKxHcFjNbTK1eU2wqpJPCX5vTYw5qQJLqYtBuypHTTiahc/icvLU=
X-Gm-Gg: AfdE7cla3anNY3mQwSB7V6+spRi4SJgQK4r0YmLzbQ1hw7aeUhqeJfoCNIAzJEJB4Y4
	2R4/LVf9nB6Hp5r00izSjdKHZJTO8v/k4eeMY2Oul+Iu0SFhKwIp3pySILRlpHhIpZrYkjbFFqS
	XsKz3b4llSZsmmmM2Gt4Mnfyk7un4oOFU11/9lK+vLEciwnBXSXqYNzuXehRMYDBvuvF/5viWkI
	dkXdphM5UzR6K1vZqJ7EBehU5/kzMPC9/TQTKb1D+KNZ/sbztkLMtHmOnjY+yF0x8BQrqsK2Eoi
	xHVeqA1V9e/cQs9sQTMBqiUj4VbZwPqAgi/WxC0PONWLIxYVkEqE6ba5Wg2lROKD+qFGASplCM0
	Yz23/NHLcu0rX/cpExDN9hUoxQHzxfPHWfMwSWG0ZX2ZjBA0i6vJdJA5U/OTiLTvvvSZyYu7YVA
	==
X-Received: by 2002:a05:6a00:4484:b0:848:700d:c950 with SMTP id d2e1a72fcca58-8488975a906mr10015130b3a.37.1783994265807;
        Mon, 13 Jul 2026 18:57:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4484:b0:848:700d:c950 with SMTP id d2e1a72fcca58-8488975a906mr10015096b3a.37.1783994265313;
        Mon, 13 Jul 2026 18:57:45 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f29ed3dsm634191b3a.27.2026.07.13.18.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 18:57:44 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
Date: Tue, 14 Jul 2026 09:57:24 +0800
Message-Id: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIWXVWoC/x3NMQrDMAxA0asEzRXEJjjQq5QOIpJiEbCLVEoh5
 O41Hd/y/wkhbhJwn05w+VhYbwPpNsFWqe2CxsOQ51zmNS1IzLh1l7C9vrF1lkDtjlHtcEJVpVy
 SEJcFRuTlovb9Dx7P6/oBzTuaNXAAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783994260; l=1206;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=F2K9sEjjREWTXCiiFvgwr/QcjLlB0RgcEW4s31Wtlh0=;
 b=nhcXZEAnqwFMvxfhtW3CN+qiVqmS7C8vIUCnVOD/G678bP0apyOiIDi0PpEatlNLYmjRNgQQA
 CrX5DtpTQwnA+B9F7EjUkpiwWwy6VWaUTVTpQ/ijdd04dI+/7Cm4ypP
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: y_xFPLoIz_1k16LE3ANLyqWZChQa94BV
X-Proofpoint-ORIG-GUID: y_xFPLoIz_1k16LE3ANLyqWZChQa94BV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDAxNiBTYWx0ZWRfX3y4Q+Nef7CIt
 rqTPFZJ+aAbh/vAhC6l6YoVcdgCAn0z3buE/ucC8NDD2g0TmtqoqunufgmsAVi51tpuW1ucIJTR
 92MqYmHZBSZyU+2kZ3iTlaw9wr1KePIIjYBJQe7ofc6sAxT3iAudVCwZed88qn70tx4c/dMp9qh
 y6wln9bctEm8h60Wtek8OUU5mLEfc6IegUFsQMqAqyPgYIlrobsma23Svz6WKAyjoPRUjSZ+fIb
 RDuV1moqP+xhMlm7141yZM2xDpQTsouUx+BgE0p+TCJ6MtGa9nio/XcnIZgIDrxUtfxEG0mRSnL
 fFbHY0DCWBMMJiMvZlPTID+IQywEo7XQD3+gnx0i4ipF9MGrl/rpgz5bbJW7Zb8DQkSU28UY/ns
 vE95CxGkunxQhT2nU3r1TOdBgNdHPFUya/lTfPEvaXyCfOkM7shlAhFqHIpL0Dk7roz9x9JIGfa
 gqv7egiCvxDT6HLeHtg==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a55979a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YMzFSpygh5mOmOF2B6YA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDAxNiBTYWx0ZWRfXw5xVxAEKjNck
 A0i6DnMk5KIJWeb0+9yDcrDEWJxA2xObPrR5XZG+seUsjsIvIQl97yC/oHjOnsFy+1vumYe/CNu
 3a0Qt+Ggd09TzIuMW2GNICpu8XICgGM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_185747_905744_E5F899EA 
X-CRM114-Status: GOOD (  11.30  )
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

This series adds the CoreSight debug and trace subsystem for the
Qualcomm Shikra SoC.

The first patch adds a fallback compatible for the Shikra CTCU (CoreSight
Trace Control Unit). The CTCU on Shikra shares the same configuration as
the one on SA8775p, so "qcom,shikra-ctcu" falls back to the existing
"qcom,sa8775p-ctcu" compatible.

The second patch adds the DT nodes describing the CoreSight topology on
Shikra, including the funnels, replicators, TMC sinks (ETR/ETF), STM,
per-core ETMs, CTIs, and the TPDM/TPDA trace collection blocks, along
with the CTCU and the dummy source/sink endpoints that model external
trace sources and the EUD sink.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (2):
      dt-bindings: arm: add CTCU device for shikra
      arm64: dts: qcom: shikra: Add coresight nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1298 ++++++++++++++++++++
 2 files changed, 1299 insertions(+)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-add-coresight-nodes-for-shikra-fffa261ead64

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
