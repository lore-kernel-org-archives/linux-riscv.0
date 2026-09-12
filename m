Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A07C88E59
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2026 10:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aelXdyD5op5RALZfSWyz2eZTrsbriwn0gdL2EW6Tnz4=; b=3JVnGanH6qjIU4
	anZfnHHEvYDhGLXTVDUBgZCSwdHlxDQR6hFu02z4XvV/h23FczN+jvWpEfeU+++L9OxDBnWy6NYtn
	wRrdgBGGmbmqR4xHBQrKvTaVvkQY98coxq245Cu0dHENeiCUKmV4IlZx1DPMz646ZzgumrLdEDDIY
	R7sLSQXJAakbBv8EnRWKCjQJDz9vGLYQvNL24ILJNZ32e7xNffCRUtZxvdL0035b0hTqFPBYzcLiY
	C9DkKnQ102vQQCHV44oQXTUOtS7SIZFib5aPQp1egUCBAT9/j0+qXNuGgA4lXDrgBMW5W8uYcfzOm
	reoqti3W31vY9U1jGBvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Kll-00000000lhC-0AaM;
	Sat, 12 Sep 2026 10:15:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Kli-00000000lg6-1QOq
	for linux-riscv@lists.infradead.org;
	Sat, 12 Sep 2026 10:15:35 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68C84x1t2832758
	for <linux-riscv@lists.infradead.org>; Sat, 12 Sep 2026 10:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zIuGB8S7sRqJtqaXIx6R8EAbbBn7m6GmghtV+o0/jPY=; b=IKhV9cEworVEOEwW
	gk6s/AjMqe1VEHdXDf6OW1iibkSxE39kSVan21oa2dvnbSCWnDHoIjrQ2diJxQmY
	YxfYT9yfzY6U1+a1grvJUlkzeWwZnosPxX0ZE3OXoZXOfNTyBrvl4ZqLW5Y3Z/h0
	ggOEKIPlLrs2YU2oGI0YSBvre/dgljMoYrgeDJ60MHeN8pun6EP8vvXA65/a6z72
	rVrsmCe963u+12MIiYuQY3RSPDsIrakxpNh6jN+rfpMynrU5paHAavftKC24lJ74
	mnlPtLyAdqvKVO6/EV0/XjcgW+F6b3rLapZ2viLj5AiLF8JJxN5sOGsGOWrVohf+
	JDl3Aw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dgpyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sat, 12 Sep 2026 10:15:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso1819273a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 12 Sep 2026 03:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789208132; x=1789812932; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIuGB8S7sRqJtqaXIx6R8EAbbBn7m6GmghtV+o0/jPY=;
        b=Kowz81uHEDDIihIgdsTfed7rdvvlRMP446MXv26j3nkWqffL/SmGXvjPStDk8uOG0o
         BooYEQrL9pCrnxRqTK5X1eg8N6eR5ebFa/yRaGyu6SMeuRE1+LkrNB5dmmZYrDZUGbEl
         alv5q2x6OP1mOsUuXnfCRwA6M9+h+yr0nl/IKwsayO18QfjCt7/cdRM86g78a01ikQGc
         0Z1lL7txn4ik+xm1F5o+RAkaREhSQgJo+PW7JX54UQbM89rpP6WfDrjGjF1jS1IXVISa
         0aYTvux4ERVsgV/WCnMJX4+6ZgVPea3W9UORcefTGegVD3ihtKnS6JlCgPvlO0GViT2d
         gc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789208132; x=1789812932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIuGB8S7sRqJtqaXIx6R8EAbbBn7m6GmghtV+o0/jPY=;
        b=gyd1a1NLPxVfk+IaW1UVt2skZsqe1AUVbPOsqYefewXZhfkzYKyOlJTU90xWgTWDJk
         pJ31t7Wy79pGDnCPgOXOmYFVaGfuWP8qeK44KyPVH+AGK877VkVDkMGWCiZZ1ju3139H
         FrzMeGxwA9kjL/9UerJlD6mzT6Fw825EEshrWNbo44JiBj0E9A98mFDO9d+ot2+PDZBX
         Q56FwEsJnOPA43jyWUaGAqjrdfnpWs5RhIEiCtQqRM0979FAAddZVJS2JufGFZhygAsX
         Pr/rRLGxfgSLnVj4gWEb8XXq3chjVNkPIS+Ousw/dOtxdJAiWU+ri3xTy4Ob7y1vnxSh
         FxUA==
X-Forwarded-Encrypted: i=1; AKwUvBwtyzlBrD0BODgg8bLYiEAUhpCCD5YTBLPfK4M1utxUsBuW2UM78gEEYmgcyaFEf5bTxZNd5c3tpaPNuw==@lists.infradead.org
X-Gm-Message-State: AFuF++kKoEuBKxQ+QaIaxjsqgTjFXqtfFh1cGJ3UiFOHXul0qEm+qm1H
	Cs72XOTuYK5hufg1k1gNVmtUCPg2Y9yrjZ5iYm2PZeuK/VKJ7b10S/muGkggShLnlff8F863MIl
	F2MFWVOvn9JtDxsu3UlIqkzR+865PpQYG4AfXMIvRAujbeS8utuiIWai2fKOYgOdtibmc9Q==
X-Gm-Gg: AYBFou3UFbaTq2xlrLDJavJvsr23B1YqyQBkTa1vL56GyGiaMuUCnh/U1rFcpYKViCj
	l28copjQCOcGmu/Lh54PwXYWroFb+5njt+vbHOt3nLfZOL8EoqvTxhuy7kczhUGhbsF/I8z/OYQ
	Is2/Q9OHFoW+9Lq9/uyd56bQJ3NydcE0DB3SJ97BbhxRY/vrCUOogYr/Hjtx6YaexruipmSjc0M
	Vbfm4aLiLc/fH50K+VVZ6Sa1WbrSTPdn+ej5Gj5nSN1Lcvq6I6BYF8Rk10b172GKeJxTBwDzrm7
	QKgjZY6PRukMe/UuyuGxoeVh5ET1Ju+W2eBg4PXWuKnnsI0/26cwl4Ds3Uw39SPMEBuN8NGfO5p
	GRLncQkorhbEXPjrhtifhjKz7TVWZoRrYs3cU0gNcpRchDujoO6XQXNsmBqE=
X-Received: by 2002:a17:90b:52cd:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-39dbc699006mr4249282a91.14.1789208131974;
        Sat, 12 Sep 2026 03:15:31 -0700 (PDT)
X-Received: by 2002:a17:90b:52cd:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-39dbc699006mr4249221a91.14.1789208131506;
        Sat, 12 Sep 2026 03:15:31 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm10340085eec.8.2026.09.12.03.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:15:30 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 03:15:14 -0700
Subject: [PATCH RFC 3/5] optee: riscv: enable persistent shared argument
 cache
MIME-Version: 1.0
Message-Id: <20260912-rpmi-tee-service-grp-dev-v1-3-1d1d35c2a859@oss.qualcomm.com>
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
In-Reply-To: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfX+RpbamJHjeAz
 7aEosYBP0PiJuviWTwciZQGggcLKQrWr4kVzUiQwMnYTjIRqlqa2U4B11BV3lzFbuHgsTH7q2Zl
 VzV571kJARFDAV1hhQLa5GF85G5lSeMozeH5Tz4k8noAXfpo0lLE4FoY6aAcbHieFHl9wShx/RQ
 qFYeV8IbkBTNvH/Zzh4PgHP1vaMxXEa4rlDezXyvk5YLh2Pgr+xDFYYYieB2w05axZzyxZijwsy
 p2YSsRzc+82kffrLSfshIWmGZy4JqYnPOUSneg6UlY89eOlInIysokJb1Y+UcFQc/BylKwDlq4Y
 qDj0CQWFk2Wx4SAR9GhMgBa9XNzopYrqm7DjTlKYjCKKjh67qUWaUni8ubgwsr75a1m7G6lyTDc
 ZM/EhdHvyxOrHSYWO3tOAhb/Lh6BhdM6NAeuVawacYuCcOhltGV96j4A+nx+IGaESB8pVQsk4Af
 Sbm1LKpQaXqAYawWBeA==
X-Proofpoint-ORIG-GUID: 6PFlbBwi_a6DoyP4qqQQvkpdgFFPsCdq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfX92UgdkATb/re
 39b+4Oyuxpr76WXeJ7StOteutjrekjhrYN/NVJMSo+PcB2NHpczSoXt6spFrWze+o5q/HfR3ilL
 3B06Fj1un6EZ2FUxYBp/nHt5X4wEw18=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa52645 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hYfsqUzT0y0sb8bvQO0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 6PFlbBwi_a6DoyP4qqQQvkpdgFFPsCdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_03,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_031534_522337_F3AE7364 
X-CRM114-Status: GOOD (  15.83  )
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

Use the OP-TEE shared argument cache when secure world advertises
OPTEE_ABI_SEC_CAP_ARG_OFFSET.

In this mode the argument structure can reside at an offset within an
already registered parcel-backed shared-memory buffer, allowing the same
buffer to be reused across calls instead of creating and reclaiming a
parcel for each call.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/optee_riscv.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/tee/optee/optee_riscv.c b/drivers/tee/optee/optee_riscv.c
index 36115326486d..72c9eb85f4fe 100644
--- a/drivers/tee/optee/optee_riscv.c
+++ b/drivers/tee/optee/optee_riscv.c
@@ -1149,6 +1149,7 @@ static int optee_riscv_probe(struct platform_device *pdev)
 	struct tee_device *teedev;
 	struct tee_context *ctx;
 	struct mbox_client *client;
+	u32 arg_cache_flags = 0;
 	struct optee *optee;
 	u32 sec_caps;
 	unsigned int nr_cpus;
@@ -1219,6 +1220,15 @@ static int optee_riscv_probe(struct platform_device *pdev)
 		goto err_free_channels;
 	}
 
+	/*
+	 * If OP-TEE can read the argument struct from an offset into a shared
+	 * memory buffer, cache and reuse one buffer across calls instead of
+	 * creating a fresh parcel per call. This is the persistent pool that
+	 * matches the FF-A OPTEE_FFA_SEC_CAP_ARG_OFFSET path.
+	 */
+	if (sec_caps & OPTEE_ABI_SEC_CAP_ARG_OFFSET)
+		arg_cache_flags |= OPTEE_SHM_ARG_SHARED;
+
 	pool = optee_riscv_shm_pool_alloc_pages();
 	if (IS_ERR(pool)) {
 		rc = PTR_ERR(pool);
@@ -1266,7 +1276,7 @@ static int optee_riscv_probe(struct platform_device *pdev)
 	atomic_set(&optee->riscv.next_nonce, 0);
 	optee_cq_init(&optee->call_queue, 0);
 	optee_supp_init(&optee->supp);
-	optee_shm_arg_cache_init(optee, 0);
+	optee_shm_arg_cache_init(optee, arg_cache_flags);
 	mutex_init(&optee->rpmb_dev_mutex);
 	platform_set_drvdata(pdev, optee);
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
