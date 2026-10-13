Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36AFCC6B03
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 05:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVMbqd/EsM2oqGould8+qqtfInbpMrXgdo21+x/qO/I=; b=BdORQVSWhX6oUm
	Njx429i1Sbfw+Nfz1I/dLbNhmqknRBrSGIl5bIQaHv1D0g0ITID43epzgZZoJwvoC/ZvD3ov4/XSB
	+zkNRxCXhuO51yRlxT8Be3Mt5kus+apAYLJdXF0ghBSIs2OFttuVt346AoOvKVfgzMeJq4P/iwc8a
	zI2RBs8APpjSA/dfCbXIn3IdO3MN5n/PdjVsilyWpVsZMH2cXyHiIT+HLGVHR35puuxjOugQVCy04
	YDw9wlQZuRIqjbt2sr4n8PXhpLmcrXrhKKeQ7FrRTQlluSUo39enS/yGtDXnN9k3rKaKoQUEqRler
	ieT8sMlL0xgxKVmEi/Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVGx-0000000C22F-3IZB;
	Tue, 13 Oct 2026 05:41:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVGv-0000000C20d-3YkL
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 05:41:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D45siD173322
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 05:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P9/Es066BKyO9sRu6bY124oGmsHpSkt+MyzxTSuoHdw=; b=N64wzUaJQPWl7GrO
	o2Y+P28Hfkq5qTYerT+VjMf7hTj/co8gaqJdwraY6hVP4uhIpmeZ0FvGjum454FL
	6KlFVbTIIJxsDXtPHoeqjV9idCktviSbAY+2E2CCWzcpS9xcwZ+4CKjs0DoUVwy3
	Y0k2wYRtTK6Euzg+zwosQ2VBUJDGLtFra15XIOYxh3MQr+KtwY0P/XW01vfK7ofV
	/km00MnWOkcftyL70IeeC9zSsCrl1aWKHeGU72j+vPpGJzL8UkJeqwAGN5cz5NJR
	u7a7h9KPul7kOSqyMm9JoJI5czruSxvt66Qh5W1ukGuLRAxNQM4YFcplME6y2gfI
	rfK2og==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqr9uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 05:41:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so1122506a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 22:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791870117; x=1792474917; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9/Es066BKyO9sRu6bY124oGmsHpSkt+MyzxTSuoHdw=;
        b=ZjK9AH7I+tu8jOK8iCm8tiutfOJFeMaStPRC8X89bn798Vjc61Uy1Fkf13/ZXFiSFy
         jiqP5Wn1tze/Sj1E7KcR9uj51S/RElw7UM1pzP6Ju5NfI5pWLDp73k7W+TgAkSP/iqik
         aftwV8rrV/4KDv2xXV+zAyyjktafqmD3LlKQ4C1Bjmr+nCK/qASmQUA7TDGwN99oEB6I
         BY5zZUGNx7NP88YbvSQevU4hNc7I2IlPg4Yv1KT69okdTuN4bQ0SHGhXt0g0aRhChJMk
         FrkZwiggrJlpfYiKJvJAWCgrHscyUVwv3jYNb2f66oDDp5SVptl7jLKFNZbDWzrcBbog
         ZHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791870117; x=1792474917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9/Es066BKyO9sRu6bY124oGmsHpSkt+MyzxTSuoHdw=;
        b=z+wdSVTOPM+wSIelRk6UOjfKHu5ry3vNoum/Iy0wpnQvN9CghbpYb0tuhxcrW6sQ79
         p3OjqvVf6cU8Inl7Gm18dXs17M3v++JRhUk55uJOzlZSx7LBemh/dbgyRLjLhJB09XLx
         4mRbBPfqqGJtJtRnphFrrkJo372vGh1gvhs8ObTvWuKGUSdps9CPURkEnbO9aLZeoWgh
         /QklnzCuPEqGJwk2HvYqbwSaivDLnQAGGJWr9uTA13kFl/cCpGiIUMbR73uNjoG2Xxfi
         ynfVVnfhsCCMcCq0C9Sa1kZwgkGn2K4o3M3UBt0i0a85Tn8M6PMLBhJ5nm4PKWpn70+N
         ubuA==
X-Forwarded-Encrypted: i=1; AKwUvBxNGFQyhqI8q0g/oYnlXXo31NH7Q03s1nVasKEvXINVb5Y5R2c34rFE3wQA3fDvQz/WtMe3sMUyhJYRVQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLieWPS+vRgX9ajpG42xAqmh2R5rESvWOjYg/bpace3F2cnR36R
	sE+uejTPwa7h8Ef+UYwSJnbCok49/+vvMAdJdDYD7TLKXBD0/FQhM/6hycLVdRGPbCGqpDTZC3g
	K0pDadsTFuINQS3RDpsQKCqcwsgFwaNcQXOESInm32M48nivAxTBagRFLbN30qxb1gnIkVQ==
X-Gm-Gg: AYBFou2eawqUirwB/MAVhNjQDMlZFqts8V4IDITqRPggxvDfW9vYtKT1VTGhoc9FrPQ
	zOSex4yc9gd34lP0rhCyhrlt3tcb+plz2BLPvpx8qbSFnmWGQR0dcHzUfBpVHi8rGtzoR9hHsnl
	JUq3tiVuxz0/6ZgKMYYaPsddUNhVZdC3m2Z9UPvo64CirkxCHMWBXr/LdU0sC8oJpXkohVAikyJ
	wub89iueTqqqRBH9uCQB/beqS52Ah3rpGy6unKk7/7eK/rLSNFfFQwuW2bF/F7olX390EX0yHxU
	MGpaAuzZDBoBdD/9is8MUqSoCIrepuLrb4l6AeX/dm4XvFDChlwvPWaiahqwrHpnw39Q+SxyQxU
	E9AVxTQ1ZxGqM6aV6Xkkuf4qpetzBWuqrLmyojNG9Y8T75tDHSO6EfljfZQ==
X-Received: by 2002:a17:90b:3143:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3ab3ac95141mr10687414a91.56.1791870116704;
        Mon, 12 Oct 2026 22:41:56 -0700 (PDT)
X-Received: by 2002:a17:90b:3143:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3ab3ac95141mr10687396a91.56.1791870116192;
        Mon, 12 Oct 2026 22:41:56 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm22926361a91.11.2026.10.12.22.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:41:54 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:41:32 -0700
Subject: [PATCH RFC v3 5/9] tee: optee: add RPMI dynamic shared-memory pool
MIME-Version: 1.0
Message-Id: <20261012-rpmi-tee-service-grp-dev-v3-5-975b574667e2@oss.qualcomm.com>
References: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
In-Reply-To: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
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
X-Proofpoint-GUID: XiqWa1e_P6EUjEbb-EzOp0kKDUeLa0Ip
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6acdc4a5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hYfsqUzT0y0sb8bvQO0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX1PvnAH41DTHK
 jZpcpPqogDHP6chlP6Y4fzdGeepI5h2K7pmFhMI6oXUZY/ipmBg3zl5yWnq6EgzH48mEm20tsBd
 RKu2yc/soh8IsiEW2YZWvqHvypEsnUU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX7GrFRQ7vBaiE
 yL9HMaWa0/XVcnjUDiFjxzp6au/hqzaxx9twU4boS2YM7vdMB+0++bBeDXq6KcUSKUJSqfcDRmV
 kRw7I2GsJ0IW+8+dc2VlL+l0ZYXD9SONCU4hudV2G2EdJS71gc6S4Wrzav2wwuIvpzoGtmZ4wmu
 uN0D1V8wncfYMqc71WqdKANJwjLd9vtW9fHzPzoPQ4fi4GwWVbMVEQbBaNffMqNRS6P2rsNExUh
 fNplwgIqSJ+E0ppj1deE9ub7sEXyZCscYci9Qg05HzNLX3JfjauxyjY8/cWbS6fkwJpWZAUYOfH
 aYeS4/xBLzyL5FURktaJ54HSS5j5ufdcPMhquSJh5BWrcdYTgwGb7n4tu7bkgxLaYPSWtGYh5nZ
 fGaQAFgAQMA35NI4NQJ+Fy8AGdvSjEaVpAkwju/tGjiYQSwUD3ZjBuJoJVoZhGxQ4QePzawN9f5
 LbUJpMWo8nfQHLNkstw==
X-Proofpoint-ORIG-GUID: XiqWa1e_P6EUjEbb-EzOp0kKDUeLa0Ip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_224157_913059_85711C25 
X-CRM114-Status: GOOD (  12.38  )
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
index 940676794280..bbb219ddab38 100644
--- a/drivers/tee/optee/rpmi_abi.c
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -183,6 +183,42 @@ static int optee_rpmi_shm_unregister_supp(struct tee_context *ctx,
 	return rc;
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
