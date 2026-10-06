Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AABCA5FFF
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 00:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J7bvOp3oJ2dYB/Uddr0h3HNxizybpCW1yLAjUwwCR7c=; b=aDYkshHmHyadWf
	7alKvdLaqW1vzLwZx8riUO/e7G0C4NG6O1oq/2flPuNREMXjUOqGtvSTxSTRWtGTp3vEiq+iKxf7L
	jMmOIZSX6JNPh5h8IN2Alg+duDKGF0tTMIsxydcLTyjnqmNcCpmUP088+9AtJitC8+R1c2uQkj/qF
	UOesNW4IMeMkRN/E18h9x3oetlemrKGzbFK5xHSX0+J57jtyoYrBUM+OuKzk+M/bq699oYTOtaA4Y
	PF1GDexQqYcUZJWO//01sQtbkMCF3W8OwEDU6jFaZOjSDh+/YTREncQnf38u6LkFF7K1YnDGVqFEK
	o48WJJjpV5CGIr1kZeFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDtDw-0000000HP5B-1My7;
	Tue, 06 Oct 2026 00:40:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDtDs-0000000HP0s-2GNs
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 00:40:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KNEs32955265
	for <linux-riscv@lists.infradead.org>; Tue, 6 Oct 2026 00:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dovwb3uTuq5K59dqdz0kPhDC1qlUCkJ6dzdznEz/4J4=; b=M9Dd5gz/Nnd/BJS8
	eGnnCEQo5vqfju8HJkoU1j2kCVHwJc39UFE0Q861MvD6H/2OFRKVnDv827tH/5xh
	0bDA2y6zGz9ra0EyfcEuHc9RD492AUh5ENZ2rklBjBsIE3Zlbs+dZ2JJlBRV8b+n
	DtQgcMvBUZPwu8JBIBaD4BDddBzeK9Q107tIkZEkrhYHWZttbcuw2NSkZTltfV1+
	Y9NqoTQR6IfzZV4syo5ZIx91NhhN83n97FP7lvT0iHANX0oEIMS5o15yFkDrrD4r
	W46aznv//895zEe/3Q1bJPof8e+nvtMeinXAQhmYY/p6pkaEHclyVlOlyzXCq232
	SYGWJQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4cj62gdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 00:39:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so5850262eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2026 17:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791247198; x=1791851998; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dovwb3uTuq5K59dqdz0kPhDC1qlUCkJ6dzdznEz/4J4=;
        b=GFci38ExUAQ1hKkSbSxGNGh7UXQF4hfSjXeUX9A+zScBtzGZI1NL+bd9kYEKImzL35
         yRPeE4Y0929qO2JJ+k3XynymIZD+GV8mdCXsoLuTvxkHb183lcWQEmud6JsgVDuBiY5K
         t57dkwliqiuxxIN2Ugp0zZ/k0fAHCdU2h/gR+EN1pXwnQzI+mYmzIXyiMSWVzZaZaAOP
         OOoC0FEuLzDhqbMQM2DexrbvsswPgEz6iqjvtw4xIp6PlE8Zy8oEvE8g7kMpUgQHPOTj
         7XVnFZNnq7yHnkoxtpBAbEv8geGxBaGNEsaiu5gDd0v/QFNFCNG8E3LjYbLdGZzaJUk7
         Z/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791247198; x=1791851998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dovwb3uTuq5K59dqdz0kPhDC1qlUCkJ6dzdznEz/4J4=;
        b=1WhZw6Yuznz2aXRWUgJGDA+dI7EtpPtSAVpXEC2pBJjtPRAqm4Fvxxe2c4QoFcCroK
         wAXyfP8RlPK8j57qM77ZIPZKJnEkbqtVKwuSYKi/UCQO9mmISSh33IR4TUzWkZBLYgij
         jZOucWPsuTncUM4ivqIUZEOQfWdLpJENZvpFvZTnmrW7rQnxTXCiQvySqxDnWkLE+Bqr
         ckRh0OyeY3XyQl1Sn8MWXU/yUsBmy2sxABFF6q/q1pPVusoovSDaNp44RqOxen2E+jCE
         jo1l1h2uB8xwr56kRqlwClWe5wBb3neeaeQ9Mfi+KhIivVVIOvn661p4aawNc86xv0d8
         zBFw==
X-Forwarded-Encrypted: i=1; AKwUvBzIm8Z4/B3IlPqN0ihegeu447iG7DVRh6Cr0ZDS3hf3uCFzFSRRkGFizkZFroGnaQ6QMIJilVMBYOoTiw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ1aEyoWot3fwCfHzjmCk9J3VD/n20Gp9ufJIuhGZzLCf+dVtpY
	y7eynCiXEJeAqmKpPvwITKCwOzyUEYTvqKWVacK5Pqmj8qtFiwJRK6xBUCABx1OWJHzpUMNJW5c
	Ycr5vMAZfqFgBjWfehpWMDYvQc7NQdovEPVAtDXZqwOBURhzXnRDYbZwlqq1A5p1Dl1OZnw==
X-Gm-Gg: AYBFou1WzOXmYOJbwImTLNCJrGMru39o5NirGCayAeansCnyC3Y5iBJYQTo2Q249H+V
	YjOm5gusL58HRqzaiSNJFePiGtvTSaJhDIkgDDekT1fzwsgqAnzTBNR415YMRbRnSAnLyEI6jBC
	pRFB9O2+JCvR0UJrZaiaS8Jme5VMblrt6lkOeJZEmkTHo8iApYNU+naazG+0862ckO0fLwwkWZ2
	2AD/J5FRxH85GnjOJvGdiMv3GNG9v1u+2aFBqpypQWx/6lQczarmFaJb/QPioTNpsGlLWCzSO6C
	qiGq66w1qWvTQFseB/AAgXglQoVouAF29bRfpS5I0sK74OMT80bH6Xu/XawMnEAK8k2AN8a1pyG
	+abFMLt/5XKpfxynoDk6ZJq2Y3jVwVkam50aWewWstQM/1zLqJjej1vwC1A==
X-Received: by 2002:a05:693c:8810:20b0:351:27f0:e411 with SMTP id 5a478bee46e88-35127f0e81emr6947161eec.20.1791247198252;
        Mon, 05 Oct 2026 17:39:58 -0700 (PDT)
X-Received: by 2002:a05:693c:8810:20b0:351:27f0:e411 with SMTP id 5a478bee46e88-35127f0e81emr6947118eec.20.1791247197525;
        Mon, 05 Oct 2026 17:39:57 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146ac078fsm2108874eec.22.2026.10.05.17.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 17:39:57 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:39:48 -0700
Subject: [PATCH RFC v2 4/8] tee: optee: add RPMI dynamic shared-memory pool
MIME-Version: 1.0
Message-Id: <20261005-rpmi-tee-service-grp-dev-v2-4-72f222e23ec1@oss.qualcomm.com>
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX+mq2ZEyurVsP
 1dN3IcPFrXia898A+szV3qfxVuRX3r7E8RZm6HEr3uC75nw2n9UFNvH7gspw1ZkJGX3gtiF5z9t
 t2FfBPTeWJhDyv+aCuMuZUkzkJ9Nspn6znOpa7N9p/XByRSb/SByaJzjRNL95gjRpUodb/QEfSK
 PEIT0biqAtztmHwUTVdpzi6Sl3yXUBeh/NLP81pdPY4TfMsq/WN4sb7eDRkQdwC3kFeeVaVUypK
 HuQcYKo6esK9q7ogJKsE1S1FsqT9lsLaZhrbt0/6BQJgiVnzeUS5wodmeo/lZ5eRmlOlobfaRET
 8DkMtqOxAM41ZZqI9xgKoEDOZG8ZzYVA12Yq/Ti/oHvn0czqhCpH+HHGPPHkwcPlyL0eAIEelkn
 qecD/zu0XSCZkdPB7I/QAlQLJIJuRhmVj1tHNr4Sl2+pGiRATbipT+s7J8TZY1o0WmP8+C9/4zJ
 NkK249xcEpHAXgK+w4Q==
X-Proofpoint-GUID: FS_91kkeYK6xHjerabIjKfGCqaYzWAel
X-Proofpoint-ORIG-GUID: FS_91kkeYK6xHjerabIjKfGCqaYzWAel
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfXwh/76DBtjq4o
 ou8+NBypmlEXUzW4nnzZJNZvwDmmrLYrt9KZejoFQlV4JO5X33OypiLKZzK8XNTxwT7EekEJqJh
 FUz/TvvlXry6lfw1vy12by6xcNZ9TOs=
X-Authority-Analysis: v=2.4 cv=bpTZl0ai c=1 sm=1 tr=0 ts=6ac4435f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hYfsqUzT0y0sb8bvQO0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_174000_797182_FE489F65 
X-CRM114-Status: GOOD (  12.22  )
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

Add a page-based dynamic shared-memory pool for the RPMI backend using
the common TEE allocation and free helpers.

Register allocated pages as RPMI parcels so OP-TEE can access them.
Unregister the parcels before freeing their backing pages.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/rpmi_abi.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
index e7fc853cfb15..c29b7ac4552a 100644
--- a/drivers/tee/optee/rpmi_abi.c
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -282,6 +282,42 @@ static int optee_rpmi_shm_unregister_supp(struct tee_context *ctx,
 	return ret;
 }
 
+static int optee_rpmi_pool_alloc(struct tee_shm_pool *pool, struct tee_shm *shm,
+				 size_t size, size_t align)
+{
+	return tee_dyn_shm_alloc_helper(shm, size, align,
+					optee_rpmi_shm_register);
+}
+
+static void optee_rpmi_pool_free(struct tee_shm_pool *pool, struct tee_shm *shm)
+{
+	tee_dyn_shm_free_helper(shm, optee_rpmi_shm_unregister);
+}
+
+static void optee_rpmi_pool_destroy(struct tee_shm_pool *pool)
+{
+	kfree(pool);
+}
+
+static const struct tee_shm_pool_ops optee_rpmi_pool_ops = {
+	.alloc = optee_rpmi_pool_alloc,
+	.free = optee_rpmi_pool_free,
+	.destroy_pool = optee_rpmi_pool_destroy,
+};
+
+static struct tee_shm_pool *optee_rpmi_shm_pool_alloc(void)
+{
+	struct tee_shm_pool *pool;
+
+	pool = kzalloc_obj(*pool);
+	if (!pool)
+		return ERR_PTR(-ENOMEM);
+
+	pool->ops = &optee_rpmi_pool_ops;
+
+	return pool;
+}
+
 /* Convert a memory reference to an OP-TEE RPMI parcel reference. */
 static int to_msg_param_rpmi_mem(struct optee_msg_param *mp,
 				 const struct tee_param *p)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
