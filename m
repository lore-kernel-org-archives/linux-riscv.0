Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42050C4450B
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 01:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VgEOIcuw+XzwBQoDn+qCAyuj8p3RnrJz/fhFXFrRQMM=; b=N6kpQxjpO9yS3O
	ceZdVfcyKUmgHkq4gHey2mVU9orndWfO2jnL561sxHkmUxXM1vQgsIsEX7YgTyaTfPxpjrJTrhZwc
	6Zk+Rx/URz0pLm6aUVzqyiQZSdtc8YqRfBt5m3mQaDlp5FZlGA7zzyY8U0dTOFT8OC+NHUQOEAXYD
	RzfszUdBfqiHRDFWDtXyeUyLkSEgNyZ8AqV9f2NoUkq5AWmNzmBH3H1jahtYBlvE7rqOWYDBA0HEH
	IjIdsmWiU8L/yLahHXXGiws+97p1HvFDi14mfn87l7xY6m1IbLsFHCysCggb/o7AhhnEmshWeV7oN
	S9dPmCsYoIp7eD42syDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoEt-0000000DXX0-0d9t;
	Wed, 15 Jul 2026 01:16:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoEq-0000000DXW0-1cvX
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 01:16:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0IM511954119
	for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 01:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pAtH5G57y5Gbyi1Jlqywtr
	XzbSjK544adRCQmBhjzoA=; b=iii4boXyuleGRQ6V5NlVuC5I8eyHZ6YgyCZQOx
	1zZSqWLNeL1bN0G+jwsidoGpONzkVtOPPQ3bLg2tIEswsMCIQKxwzwqDETz9GWa7
	EnHGaa7veKyZhZvFGblqkUi0ShjeRDOcw5s1lezsemkX3D6+0pv452AYkNeCSqng
	PfRQngf0op/0NPE4WguuQorCokY1ks0tsQlg76eyBGH99uhl1yGth66egjzuuaRm
	wkb42OlLx20Mz+fZCFutBSZFkW5yFPpZMKawuSRp1UXxeaiTLl+khejmtj/v05Rf
	hXKCeWt0pPtHFgxZzJgkwtOCFiuh2vgC64IQE6ARUyanI+yw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g1d1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 01:16:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce02cb769so20061365ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 18:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784078198; x=1784682998; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pAtH5G57y5Gbyi1JlqywtrXzbSjK544adRCQmBhjzoA=;
        b=jpn82WuSxa52KsPjdu0YZRbdIE4jnQSORPqWiLb5hQCv3eYnwfbnflzsosxjQgvVYt
         ItcxsMcRODWrd7vIZuizpYefitdkHRJwrwg8ClKHOXuAm4/Bfn0AO381TUUPz0uXJgqC
         hO8kV7jPguIvtZPN8TNXSriPpy82UgPkxgEJSDKrWEkNuhvcTypGatv0sz0ZDAX0mTt5
         7h1/fLCl6SMlD2k+76hH/V9XKA4SmWTLhNcagDBRTbJQkKRxdvH5MTRXFM0yiDgIzYaX
         S8zPvOfV5ZUCYBf7CRmZh6rPmJ8HRQmsy5qubDgan32mSOCWCC/cbWMi62dRbyaLxR6Q
         f7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784078198; x=1784682998;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pAtH5G57y5Gbyi1JlqywtrXzbSjK544adRCQmBhjzoA=;
        b=s1ywxXbg7K6n8m1ebubDojtd52Ke/3pKHqum5grQxB51s3TV96qLqR8HfT7PTnlkrP
         bps4DO3DisitbdKzq2xIBPD2v7hF1TsLp3X1hmwXmvMBtYHGVQX0Ai75n8ydYmynDUq4
         dUq/Y3DNCnkB3NT64pv/PSiH80fzT4XJzHp+jCz72jMASttSKWrhgsPdhnv62QzgqJQE
         Bi15zK9lw9nDzwMbdfQxM2pLluX9Za+Iw7ciU6V6RSjrVMHquFdDrlEjyove9Bf8xHon
         WkCgn/YjeYFh1CUwMjxLT7sdjHhl82lT+UYfxThOdUDZwWHM+Rp5TAFcV0kEBNIu6wKX
         hrpQ==
X-Forwarded-Encrypted: i=1; AHgh+RrM/KCHZ5/ClxmQK+p795h/moewf+/2xcekc216zsBzXg6P6w7Dveb1avdKLVXkR3k/SR3vrrCSpupxWw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4PVn5lilVYw2ykuJqO0idFXiJp+HjydxhUT05bPSH37FOoQQK
	poHgrdBY+XXLNRE3q1OzJkwsnY34T7XFRvOJww17c6JBx1YuFsPCO0NgKDwq4YG8dQ8BHAmawlG
	wMiEgb30K+zDR5n0NJCGLKo9QkAx9uIxnrboXM1wO4k/XMUzLKiQl2VWkNfoD5jHxDFtc4G8=
X-Gm-Gg: AfdE7cnCjuOM/HGs+jbdSQ82ayK7GoT3xEGCzfJMC9/njCiPcq3CMGs70gRA7FQcvxZ
	T5rOPORqHIz8qASsuFMPYumbdJUqQGNYFVbZx3oiHqEDaYqNivEWvrnF61JPxeZkq/BmkPGX8gY
	c8wsrM1KhY/odbeqADrDg6ZhxgNU++S2n9XiUPC4A4EqB8HZClOR9UKdwVUsEY9Gu+6lySYck61
	nJkVpYjaAvAyOorYu6YoYHHH5a7DCmVbs0EFWIHZ1WMCIHU9r5JiXDcyFJIhtK05c+NwaGGH/IG
	iSSq47ZEdQSqNmC5RCdfihIiBEyVpYDwM7vBV26zNH4UUVBV7Ree7H0kByMUD23e+LpbHPmIYBN
	K3uPD3kWWTjQbcBxiuCfke2/A/xUHY+SuoNluSaGDsGOsxq4UPsVZ5atVwfiyUKgwbx7tNAvb5A
	==
X-Received: by 2002:a17:90b:3a83:b0:382:1a6f:ba3b with SMTP id 98e67ed59e1d1-38dc74d04d6mr13821914a91.5.1784078198085;
        Tue, 14 Jul 2026 18:16:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3a83:b0:382:1a6f:ba3b with SMTP id 98e67ed59e1d1-38dc74d04d6mr13821886a91.5.1784078197613;
        Tue, 14 Jul 2026 18:16:37 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e1745a3fesm2207487a91.13.2026.07.14.18.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:16:37 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
Date: Wed, 15 Jul 2026 09:16:13 +0800
Message-Id: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAF7fVmoC/42NTQ6CMBBGr0K6dghtaP1ZeQ/DorZTOlGodpBoC
 He3cgI3X/K+xXuLYMyELE7VIjLOxJTGAmpXCRft2COQLyxUo0yzly1Y78GljEx9nGBMHhlCysC
 RbtlCCMEqI9F604oieWQM9N4Cl65wJJ5S/my9Wf7ev9WzhAau0oWDPhrVan1OzPXzZe8uDUNdR
 nTrun4BMGpfPNMAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784078191; l=1381;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=aFIWDU6AlfYlaPP8X5OcNF9jcaSZ/urzY1gk6bBHoCE=;
 b=WEFYv59/YJRcXk5HjnUKTQ+mT91vfzOOTpTQoQY20Vt8nnM5uVg9+ccZhEhHFAl+sTdfH6+09
 fDtaLiZtefRAzHpWJWnHQCV0A7bNjLVlQFQvvbiro07GyVvMDvcCNA3
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAwOCBTYWx0ZWRfXwuQEqTRXT61f
 gD3BB7lQavEVOXx5MMSY/56cVu8gDecSmaYQ7t/oWjNhSZg6N7P8SajxFuEbmv91y9IDYXaZeuA
 azbyBovbeK+MzkHE+Y1H4+SM0jUT5uY=
X-Proofpoint-ORIG-GUID: OzEkYDCbUn-p3RzD1hRq3qRoIAyIFTFb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAwOCBTYWx0ZWRfXy0X7UwToCzdB
 +dbeUyGl01DSwg193WaY/LAlJosJQR/CIe1UXpcdnIjQm18pZJg6OwBKiSX5o9O3DCk5GYqFkGE
 jcMk48yruKc1C8Kj9eCKqMqgTtq9Xu7LD5ac44WIzIjtxGAWosnN6hYmafF5Gf3TuvAerGJDdSs
 yn8gpwtbsFtX2oiYCiWvAnMgySkRwzC6t9qmixjsgsiu3uR0vdvzhS5zEBIqat1eO7VPsjSoSp1
 fVjmv/y3zQPepdGlVgHWMOqwLZHQuOo7eDfqaKcvBz0QMJR2zmerdgVltKha2mUgvEtEguujrVW
 JHGRZxGcESBCtVUjyTu7Mvj4SJzhgHwfY0HrgBxzxjQvBpejXSokt6kVSzkohkx98lW9neS6Yu6
 afz7BVi3yM7F1ZwzF9DFANCqowgXF66Rsn5ThcoQlHi7bxnog+OqgclId/cFaoTi1zfZAZneazV
 uVd/8fdNm4NKkKLZjRg==
X-Proofpoint-GUID: OzEkYDCbUn-p3RzD1hRq3qRoIAyIFTFb
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a56df77 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=anp7WcwJjaQlINPkyJkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_181640_538418_C3E66766 
X-CRM114-Status: GOOD (  12.40  )
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
Changes in v2:
- remove MMIO for the ETM devices.
- Link to v1: https://lore.kernel.org/r/20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com

---
Jie Gan (2):
      dt-bindings: arm: add CTCU device for shikra
      arm64: dts: qcom: shikra: Add coresight nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1295 ++++++++++++++++++++
 2 files changed, 1296 insertions(+)
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
