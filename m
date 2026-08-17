Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA0CC5B572
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 16:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9c51mhDGXC2tg0TjGSFvNQ7YM0M9gKSTemOSFzeVYco=; b=mHTA7bePpR8gFQ
	WcNBGqOYRkvnrVMZY66tKO1sVVItaKYqhCvoyjL+c1/A6uLjFEW9ZZY9wDOpDgCfCwMTYnP6shLdv
	vM/Ti3bexNP0h8WmlIQ2DZY+prexgqo/ZWPDY41iKNLKIwo++hXg/2m4hvLEHS+kge/+E/jT6iqpq
	hjz1wOlctEjZqH1Ub6qi7qWCnX6fHvJ26/0mHf3YfGiFRmqxF5AG0CuNJSsm1t5of56AzjmSTGX7b
	6MbUcV6mRICFip7Xg+SNvJVvqXA0BJlD3w831KTMlHKPsIO1Vv4txcpK0UUIPTBPDWx16qdcgrQVQ
	qL+iIq2oAMoMj3oTrQHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvznW-00000006TIT-0WU4;
	Mon, 17 Aug 2026 16:02:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvznT-00000006TH0-2XcG
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 16:02:48 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFYlkf2766998
	for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 16:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DRZIbW1vGBp
	/wtVL8vbCZ6t98BD8d3Nj0MpYQ1ianMs=; b=iT1PrO+P4jWxtYAFL4U2OFfSqcc
	RXSacy+IBUy6gH0+wfZ6Txm9VFCy8SECckJ3bKmfV3aMVlZCxF8v3kAM1HTzXTyq
	VgoJ4468KKeIvZHuaWIyRiY7pGqbV/g7jbdQmNrFxFsNi7qatP13ZZHX+ZK3kNBR
	1vluveu6HCUTsE8PBUm1SzHhGQL2zCDeoDkQuHyb7wvuL3chsD/AwpGLA2nQPRJM
	uO0ZQUgmcvpcQDIPp6FNwxe/fIgaOvMEXBYrOyVXoT56xphmjN/OHthmNNKfYJwk
	Sa47MfoCD7k/1ziR3KNZRx9WNEurBN1a36PmvTmgBnQV+tJ6DOcZidiyiiQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wrej3km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 16:02:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848474825ffso39609b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 09:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786982565; x=1787587365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRZIbW1vGBp/wtVL8vbCZ6t98BD8d3Nj0MpYQ1ianMs=;
        b=aycp1Rdn02l0i8zlxPy/ikJHguxEaJrgY3Qf8Zb4Nfdv559JsmqmPa1z8wznB2UXxR
         3+BPD9HdcweNKKyp3H1rfd6Qj2NEBA9TEQoODIbDlR6Ef8tJeeB7E+yS6KBWXFydj1u6
         uLxz9ubyz8HG1uRC9IxLUgd+hJMRh6lDEMuwY5Br/CVQj75HA6hSW96lFzqvxaoSzp32
         sv1iSavJ3fLE3psU0TEm8YpbvpbgUnFeEXAO2Z4V5nRbdCnZ5JX4XE9C0sgik1RjPLrU
         uAXyzSEdh9jadK5M8vilC7cpelX4uOuulp4kGtPNY1tQEuziUCYK8i6lFt7mluA78+Dc
         v0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786982565; x=1787587365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRZIbW1vGBp/wtVL8vbCZ6t98BD8d3Nj0MpYQ1ianMs=;
        b=liGOj6tZzdgyliWCE4ZujYCXFJW+UqTu3xUNw7JSDdMeopnSmpcGxdootRGw/2tYyr
         MhigdxId709psmCDACgjwTaEyOBSVInqtzGlv11u93Ym9RC/nnErlZmoqIfzexZrGx/3
         NHqes7f3vu2ShG9mC4vh0vZ3qpvPs1inyJE/JDLkSyCwTUyvH3Sqw2a313nOTgzuJ4Cz
         lM4GD8PvPUmSq40o+7oKwYinJk42LKy73Dfzh044UPVHDurxeN/wolfHLQrBs56CPoRz
         C3JYFAEnnIWN88HSMeGSIW96g4jPOH15m1LaNyx+Iq9l+2h27Q8WPgrj+oRbfvbRHw5A
         WaYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrT0tqYh9bEVJHYctrTQN3Y82Ht8YGcgYCnoVQAMSwKQkoJLPX6D9lbpWE0cVI2QdHaBjiRi+H3VI1Qkw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmwv66hlU1Qn2OkQCr8v+/rUeBxcoZJLu5L88wM2teKACzZwRE
	8r8qoC8r2aHD+kp9vKJLPnOM6kn0QGexScSnZpMbIWrypP2mpUdUzjjJAnrhwQQrnjPKHlz5oJ+
	GZIa5jzXeBETc3c85OB6AOH2P/cwcryS/4olpVnchYMe0QToKnWuakAfkFSFXNZHQHldlzFQ=
X-Gm-Gg: AR+sD10l66SR1sSW6MsyHaiVZtjEo07QFyBWjsaP+kcTvIPHSMobOpdeSfDNDUUl6+j
	MC0AlvoMOHitZgwbQCoPNNN2pEhAL1clkECO52Y34HjwyYOMfJ0m/QOjXOL1VhEPjDABbOB2HTt
	oFHmwg4JgeFMbFieJF+y6EEpNiLdbfbbIRcs66rOhDmIGaHd3tNtfYnmpd4nmigd0AlhPa1se4z
	PbP5ngH10iTJz6s8UdJQGJSh1GEvpPurxUQrDFXudabG0mzAl5eAJ0Zqux1Z7OTsYXXqgkj41Wq
	Hj+ZuAWyW09mxrnLhv9qZosoNdkLzEJUz+rTQgwlkspo9goBCntoH45/ROPA5OEamicFweQySu+
	3LciuWhIek7Wml+1KA8AvV7nYZUvBFTNNpRrxr8uzAPIJhUM9a96iFtonaktmyNIpBscblae44h
	CfIgAQ8ww6Ydk5tPbSIkhOtJ2Q0w==
X-Received: by 2002:a05:6a00:a01:b0:847:70f4:613f with SMTP id d2e1a72fcca58-851bc396235mr99900b3a.12.1786982564618;
        Mon, 17 Aug 2026 09:02:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:a01:b0:847:70f4:613f with SMTP id d2e1a72fcca58-851bc396235mr99816b3a.12.1786982563857;
        Mon, 17 Aug 2026 09:02:43 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-851b6f8b189sm562883b3a.34.2026.08.17.09.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:02:43 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <docular.xu@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Deepak Gupta <debug@rivosinc.com>, Xu Lu <luxu.kernel@bytedance.com>,
        Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] dt-bindings: riscv: Add Sspesa and Ssplcofi extensions
Date: Mon, 17 Aug 2026 21:32:17 +0530
Message-ID: <20260817160222.3313295-2-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=FqI1OWrq c=1 sm=1 tr=0 ts=6a8330a6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=2yNJKbwY4VjyOEKDNOIA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: LvZ2xNXNIpXIJYmDEs10kGN3AKecMjiM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfXw0/bbXBfuNXi
 73l+Gs6lc+heZCrvVbqMOgWDZ2s4RzLdoNJLzoyRfunOuudCFbd3E//kHGZTgNtuuNrFHV6wjC1
 EcPiiLUqzEBy4INxVuFG9Pg2hdsPMp3aD1PH7V+R9WZ7UyrwUX1DFy4G4dqSb56CPPxHz+IKO6P
 fTvpQqvqmBKt3KKnTl8k9jH/tZri8uCeiicBdPq9MkmkwqEeBoOiDAr+tgFf+qtHmkruWBWGPL3
 SsJ39CgMTaO4lloc/ZLFiIFXKs2A5RjIP9vmcb1QPDQJZWGAGvV21ato+NMMNSGB83BlF9jODCL
 dyABknAFnXPYoyM+pjzhyZLHwxReNjoTviOPAhvNlv0wfDkF0GWafoHeXPSdhBHdpFgFEoNfIn3
 cezmeNfkebsm7Lh5br6U53VadoL1BVPUm5KdO3/ZVPM4xnlefpNa9VmRhtWfN+GZ866F5DJ8OU9
 wj1vxFmEXu+VW07Okuw==
X-Proofpoint-GUID: LvZ2xNXNIpXIJYmDEs10kGN3AKecMjiM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfX6ePBkSijaLGm
 fbXRzP/awI5U8yacH6KzmtZ373cFBn9HuMZlgiUv/miqCCuTwfmZeI937moR/7w2EkCoc3/8O7p
 qa90AXHNDW2/IBGPOEIJmSFNVYL7+LE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_090247_763096_E7849193 
X-CRM114-Status: GOOD (  11.59  )
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

Document the RISC-V Performance Event Sampling extensions Sspesa
(Precise Event Sample Attribution) and Ssplcofi (Precise Local Counter
Overflow Interrupt) in the ISA extensions binding.

Add a dependency rule requiring Sspesa to be present whenever Ssplcofi
is present.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5ffc40d599c0..f316b93754ff 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -232,6 +232,18 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: sspesa
+          description: |
+            The standard Sspesa supervisor-level extension for precise event
+            sample attribution, as defined in the RISC-V Performance Event
+            Sampling specification.
+
+        - const: ssplcofi
+          description: |
+            The standard Ssplcofi supervisor-level extension for precise local
+            counter overflow interrupts, as defined in the RISC-V Performance
+            Event Sampling specification. Ssplcofi depends on Sspesa.
+
         - const: ssstateen
           description: |
             The standard Ssstateen extension for supervisor-mode view of the
@@ -934,6 +946,13 @@ properties:
                 const: smnpm
             - contains:
                 const: ssnpm
+      # Ssplcofi depends on Sspesa
+      - if:
+          contains:
+            const: ssplcofi
+        then:
+          contains:
+            const: sspesa
       # Za64rs and Ziccrse depend on Zalrsc or A
       - if:
           contains:
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
