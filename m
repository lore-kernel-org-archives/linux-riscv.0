Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5329EC4452B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 01:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XQYnJND/2LsgXtn9oFnWQxmq1PYw6gAggrQ2oNzQZ2M=; b=wJMoZXZN2brtdj
	PRbjaVyESi6koOYRBjEkUBP8FLIPHExnAUCTGbcvmbiQxMem79ihTUo/X2QJvC6t68Ea+oNdNpGCS
	JEcqIFiAbQq4tWrSAtCufnfCEbIDVQDWT6LfMzv/nbmEhkBcojlSxnJiG+MFNMXC10q7l65xL0sRw
	f5ff7NsU61qE6k5TIuiRtBuG5nTPr/b2XvapsyVF3A0CKGk8enVFOKWOlT+Nh5XOlRdawrHrmzEUR
	TYRzFexhANbduYEk/WIxEcm7O6s9ZpBo4OSFgu6hBnAVr7wkBsF3o9VDLBL32flT9eqSsA2FSLkUW
	idqBGuqvU34KIBm+qRHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLXF-0000000Agum-3i1H;
	Wed, 22 Jul 2026 01:14:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmLXD-0000000Agu1-07TF
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 01:14:08 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1CQfl3511744
	for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 01:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E1FREXTgaVc/UUkLKa4gAq
	EqZSljJQdvhSaACy7VL3M=; b=Sy2B4yassWDj5pkFPoCJ8brJe7lEEGvuddly6E
	JWCF28/sKMWefenURTA+VdJ47QFSWvVoHI9VcjslB0ta5qQ/meMraAJmq7gJW+G4
	cOKdC8AhmMAkxW5kJrvaJbSkRJOApJh9NpISO8Kus3++OjuBXX2dF3u1LqBm9nfv
	CAa1TbitL/NKdh3tX/x/DYL62JlDaBdIkHLkTFGAuI+tfzf/4ZzePkKaamblffLL
	wWyzws56m1bWFs9ha+lTfyPnXhF+vxvwibNE8+dMHPzfD5P6qlsb56/s28aO4qeh
	8TJkmIymlo2WccQM1WO2vyzRSDZml3Jqn1whhnqobEAzn1kA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bsaurg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 01:14:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so5838756a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2026 18:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784682846; x=1785287646; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E1FREXTgaVc/UUkLKa4gAqEqZSljJQdvhSaACy7VL3M=;
        b=T9JwY2x3KFyFwAc4PS1s3WXvgKhPKfJ/X9YX/RP0rj6KhXnM2hs4G/M2LuIlPcYZXd
         S3bXFzx4gqpl4xW0klRXrkpw0dB0SewYReO2nBuMseuX8YwkzR+Xpf5xAf/gfgXRerdj
         5Z8R1HiOdKEgomg5wPoPSauSBRKi/6ne1qcGQTHFEWpXG5OhoXpe+zZVv+iaPROGFBpH
         ayTdCj1Zk8GSFumnCI0fl+cXsvp6mbfsnQTabQNzPHOrQ1Yfxz/0sem3u0yUI5KVKG2F
         HuF+8ZzCeUB+ws4r0a79WI0Su6jX1yebIrvI47o6Otp50AvM2TDxV+v31sny7hZMDsDQ
         YaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784682846; x=1785287646;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E1FREXTgaVc/UUkLKa4gAqEqZSljJQdvhSaACy7VL3M=;
        b=K1kUHSWelerkixViY2EOD7AB6SpVlXwkUksh7T8x2w81OOrlrpK/wYy4N17amC7t7L
         qhvPbPJiySiEbrCG/yY0l19Cu8ABsDmjp5Xv8WlQvdlOkUapDKx3j4iybTqmwioBBrAv
         xmP+drio+GA1Dr0El8STW0tJaEIHQ7kzIFj9xp2q2TnlUotaO4KAc76EeA9tKYXkAP5s
         HnMThE+t5ss1ywYajRiK+Oz9uyt3pEOTNnmFsa5qCeRWEWaR6R9QYdwDAUwDchKhXbEc
         NDHo0Xlyqx308JXMShjgCZv+sP3/4RU1VsG7wk/GjBlS5HqLlAxFPL7IeG0XRPYg/Mid
         jGGQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUUpdQcIQh1oKe5SEXjr86FyxXlCmObYCAvzV0VUv1IWT+XLs9j+ebsAdi410/Ac+/b+KHCQEDBIPZTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ01cPx+ZxoCwhFwyKCOt9SrmFtOfUcldAp5UfOPkojU1aZe+C
	Q8cKizWJDog3qTVZ4CCqmTXZQ88bBl+0V8Tut/VS2987R1wee9lp9s8VvOmlOE1dHMcbS9PO8cr
	9sZM7IAv6GD05z+NURYo571f8pMGqWV8wVlMr5I748u3ErnZhtc5A9WRZrDBj3s20Pq2V3LU=
X-Gm-Gg: AR+sD125B3plP1yQlvqb8qHrbOXBDDHl/k0cN2nvMac/nUkMNKXp+riyzkXEozXAkBM
	VxH5GyGiJ9wJJlWqVBVhMljTzQmcUbJqbZw9bYeUczEkIZJv0EpYWjk+Q9+ou+VsacgVGMfTtaB
	2A2Ok3hdx+CKUCgB8x46FBpaS6SfHra/9X8P1vPxFHdSX5EBOWyZgpRl5xdXc1h/NOtKUB5U78p
	1y345HVi2Hbwmxs+AhBcT9iQgHFzwbDxM9YNvkQ0UA29HyKbesEkJMllgkmOHVuElibGdWejuCd
	vxa/tflcPkTPeqVy2vVTA4vrt61st+5K4NY74JYPx6hSTDNSVhE6w7Ga+XCvTby78Wv9EUP/9mW
	CTDtvdlE8TOwMiMMPhwtu/AwdHSHtk6I2zBN4D/hLVuw4/XscCPlf0wpoLUaNsMo=
X-Received: by 2002:a17:90b:586f:b0:37d:a52a:ff12 with SMTP id 98e67ed59e1d1-38ea344e49dmr1545352a91.10.1784682845696;
        Tue, 21 Jul 2026 18:14:05 -0700 (PDT)
X-Received: by 2002:a17:90b:586f:b0:37d:a52a:ff12 with SMTP id 98e67ed59e1d1-38ea344e49dmr1545317a91.10.1784682845162;
        Tue, 21 Jul 2026 18:14:05 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea7b4da35sm160380a91.17.2026.07.21.18.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 18:14:04 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
Date: Wed, 22 Jul 2026 09:13:46 +0800
Message-Id: <20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEsZYGoC/43NsQ6CMBDG8VchnT1CC0Vw8j2MQ2mv0ChUe0g0h
 He3MDmY6HLJ/4bfNzPC4JDYIZlZwMmR80OMfJcw3amhRXAmNhOZKLM9L0AZA9oHJNd2IwzeIIH
 1Aahzl6DAWqtEyVGZsmARuQW07rkNnM6xO0ejD69tb+Lr92964pBBw7WtZF2KQsqjJ0rvD3XVv
 u/TeNi6MIlPVf5URVSxMUUlMa+V5F/UZVneB6Ik2SkBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784682838; l=1591;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=uDo2ajQB4Xh3El5qxd9yn446KCZ7hlt1rys8NkxD1z4=;
 b=gCxZ4KUBkLroE8drdbEOYnQrtjIsToKzsxc6tBDOnq30rpj0eu9O19HNM7FYGrjOcMJ/7NshY
 MIr5W8M2tmWArmW53ttDAo8qY1pOgpGl17SriSOLJZkwIuVidvUcmqs
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: 2mcLMZm1acFihXpJlwN804_QyHCXeQGP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAwOCBTYWx0ZWRfX0TTLOZ0S0qIZ
 jvJbIhUucM4DeoR8zzXvTPrRgxRq6yfilecairLXCAC3o4N71AjJYqM7tQOYrsJ4xlR4FjS7blK
 ESz7jQAXLDuOj/zJLALYzl8jjA5vV0x6a/HF+ErX28F5y4jVZudOOIO78VUkVFAZ1VmjR9OC7DS
 ++yOwTjv6S1J2oSGEHYnlG90XWJC4wfmD5VtAo4SVe2XEB9Ff2ymLQ2eoH1h6k3izBLO2/FH9Fh
 SrtGQWsm3ds+SwtBsvjRRa3zxtD8TYTn5quTqFXsmxthHmnjW9JciY3vot8YAaSb4vDzrl/SXpF
 leQudLgQdC7r0LbZ6f8v7u1ej4fy5kxJop8dK02QXNYFfn0m850Qq4YePMfvrDGgTeeJv2N9yZx
 UHFUs0OHeByxW2OLsd5NXO9OrHOJoXQ+cEDi+NeZvcM2fXHvofFtHCyr/JybOy9So4tROkH8R9i
 WKMsyypWth6BgapczuQ==
X-Proofpoint-GUID: 2mcLMZm1acFihXpJlwN804_QyHCXeQGP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAwOCBTYWx0ZWRfX7NxarLb8dvYD
 eDTmutEboYj65iMqzaznBKrav24P4X4Yn8sxAqQudqyxKpmvwotM86FVC7Tg8jeRNOr5eidQFgK
 2LKYcI/lzuoJCe13ms+xxFuv5cjKyso=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a60195e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=anp7WcwJjaQlINPkyJkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_181407_076500_41FDAF8D 
X-CRM114-Status: GOOD (  13.40  )
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
Changes in v3:
- add correct subsystem prefix in dt-binding subject.
- Link to v2: https://lore.kernel.org/r/20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com

Changes in v2:
- remove MMIO for the ETM devices.
- Link to v1: https://lore.kernel.org/r/20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com

---
Jie Gan (2):
      dt-bindings: arm: coresight-ctcu: document CTCU device for shikra
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
