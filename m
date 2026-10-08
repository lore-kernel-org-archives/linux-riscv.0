Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E72DCA600C
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 03:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rCCPAbANV3xz+IzRDTKqrSiBHlEA6Ka6WCjT2U14HNM=; b=cPyHfJHX5OGWel
	rmv8DMD4iqJNJIDJb9rOt1d0+FeBgxnvGbK8FjM+hYmRn7jahI8S8kl9IFhIb46EMEXG2JxBsvTRa
	NdkkJNkGMcdyBDbQ0SMGH1SyG0otagMX/73FhUExPrCV+au1AZUsETMXArJ23g3fe2THpR4EPWsTZ
	SY5+ya8hItGLPFL+3ETxyrVjKHW6ditlhq/zlpDWOGhXXf/Dyiv6ikSfoEExFmDZmDn+ge0n24nlp
	XDNQdYqqXoo8Sp/JbA4/TMi6iIEzsIwH4wQBk8UhF9zv1j75O93UbiligT9F8IbWHLAIDmX+opNCy
	ErKMGsYT/Uh8exCKJXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeoT-00000003Rxt-2NcT;
	Thu, 08 Oct 2026 03:28:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeoQ-00000003Ru8-3ExE
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 03:28:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hfoL434537
	for <linux-riscv@lists.infradead.org>; Thu, 8 Oct 2026 03:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xq/6RviwiI4D0pjh/SnP69MfRLFyAZXinygQJ5DPCiM=; b=dlpvT/FPhwBMYClT
	me9U1IesnRgGVsIhg5RFrAO8VKHUqcWYCiiTNS4Upu1GAV0fRaVgNOQ7mfLNU4pB
	DByNovRMDawf7NMBCfimvAtUQQ2wi9CRMbynGpmVkBLKcZnF7yH+9rO7p5gpsDBR
	sll1nK9IXarW2kqwN7vpWxnnrT1dQ13xpij/YVHmSSeqKgD/MGYSHFK/EPQZ82rf
	3AVfQd4R6xV3NqnAvbzz58TQkE3rZIPMZUEHz7gsWvo09wZ1dkAJrmHwvEHYKdyh
	BCkI4peFPd1xsR2uTU3H4AYpYXmGHKkpQ/JRgX+FfGxsrVUPekDRBxIaNxUR9w5B
	twasSw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe38uwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 03:28:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34d49d8dee1so4874713eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 20:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791430133; x=1792034933; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xq/6RviwiI4D0pjh/SnP69MfRLFyAZXinygQJ5DPCiM=;
        b=D3/aGT3y+rUkuPwekHuAUnFeCldeYjKqGOkgMOXmKZKLui1hxbsXiAWZzH4Q+CYtlE
         WOzm5Qzydhr3PZ1aKp8Srg5ZpNkSXkSmC+Z6AZ649yZBc8YyFBamvurLghrwDLqU/Cyt
         jlXIeUTTWJpAM7/VI9aLbN3jtTKct/TcvmHtYsZOg6b2to12QgpCLZBcIsH0iYVxdAwl
         I5134a74lBBxcbBGJFtjZBouD+4ZimL/AiSEmamAkRzUGbDe2gkS4dvF+R2Mj+0SxwPD
         vfc8R025Eeb8P57wkFWVgntafzkXiTieewgLLETuAxtHpNoqwmPJGRLPImboNY+TiLVP
         6PrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791430133; x=1792034933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xq/6RviwiI4D0pjh/SnP69MfRLFyAZXinygQJ5DPCiM=;
        b=stwsqtrRXHny6S/s1QZ3LehvHIJMecSaM1I+OMskfwWp1axw40NYEaCEfMkgSZiNrm
         NILHtIlcOutUjuNqEKvI/k2LCzw0PFzQZGOM6iaagncnNPvMRjAOHgsnHLhsCHgO53Wp
         DxR+SEXkeT4Kmc9m+cXr+/h3JHS1S5nuJPsg2/naAqh2/XAEMWNU9BpcICgOpFwIGxaH
         QZV1e2d20HWBRuAndqQCtIlr/td6wvY8Wer6mo76Cs26ar2jXJUr9jEmD/WBNbwuKejE
         2tXr1vlhhwKEWUW7yZjFo8OqsJigkDBms7OguhFPkNGClYMdWWCULpDYewXKlnMzI/KK
         jLhA==
X-Forwarded-Encrypted: i=1; AKwUvBxuHxfMNYc1ltrDyLRqEPoK7Pv9kPtPvtAZVu2Sb9CdDbvcpuDe7U/650MulpsVgdOds+jvuJJNeYfkkg==@lists.infradead.org
X-Gm-Message-State: AFuF++kgqTQul6kwYE8X6C6M0TRC5slrs77Wh/LSXhsAH7HFDTiI7s+N
	OUSQpaE8LMBhOox95tVDDGGlnJfeWaJ3D3HUeL5Wz/hkeSxhYqX/6J6Qe7Xg1xiwhe9t2mMFRQ7
	didIzV1EanAluvcu6IjqVDC93P2xtEDQB/2SkjMKSCrPAXR5nlY4q1G0poO65gjf+BeDU5w==
X-Gm-Gg: AYBFou2vAn6ggFSeYE2niv2BXuRxl9VcB8C85TsU6d+SYugcfnFarMkb76klVZ1hf/3
	Kx5wR8g0ytuIiEs2rjgu51Icfd6dAqQfE4qe4rtp/MEm0992mjUjM2m3OBJEJywTRAJBYHOaWb3
	Hnd9g0JZDNp8oAKNa3L0DwcJ5hGCCuNzwnf+xEC5/QxeJbcUA+/FV6/OchnYfh6zWPG/5+0j413
	CVUuY7vBCJd0v4pUBcCIGu0cYx+3gEEylEKKhzU57X5Im1QOJRd5Iipd6aH8RQbg9ZvwnbM3IeS
	o7zunJWVvB7BC/1aOX6+r3hDXUyQMbzqROwcg6Mj5wGivhGKnILlo5XfjrfbMNEWtSxaf7WYNYX
	8i+6U/5yusZPwr2ZpBR5ooVdhhVR/pLm/QxANQ+3I12lZpanxA9fKWPBO/w==
X-Received: by 2002:a05:7300:7314:b0:34d:96cb:d75e with SMTP id 5a478bee46e88-3515de9ff53mr7510587eec.27.1791430132471;
        Wed, 07 Oct 2026 20:28:52 -0700 (PDT)
X-Received: by 2002:a05:7300:7314:b0:34d:96cb:d75e with SMTP id 5a478bee46e88-3515de9ff53mr7510526eec.27.1791430131842;
        Wed, 07 Oct 2026 20:28:51 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35179d07566sm2168349eec.30.2026.10.07.20.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:28:51 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 20:27:14 -0700
Subject: [PATCH RFC v2 08/10] firmware: riscv: rpmi-tee: cache TEE
 capabilities
MIME-Version: 1.0
Message-Id: <20261007-riscv-rpmi-tee-abi-v2-8-45939a13d223@oss.qualcomm.com>
References: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
In-Reply-To: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: 1tVrBnbpyVyIdZioYcu7Xan46paTZZ4b
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac70df5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0-kq_-QLXk4bkpNlR94A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX0cBvK1oYz909
 h3JQB1wsymvrHu+pyWuJcDaRL+yC97D9EyyMv+rIaoQX2gyf0H+qiaP0XKnY9+HtOdZrB7Tvo6N
 0fFN5Nq2wMQt/KtToLYB3h2r40Bkono=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX8AoZQ5LCq87Y
 B/k3+IJj1B6BP9ZnZHD8beS2rriVA4DVHWsGpow6NJoc1ruWHYc6MStHwgWJyfGP74a5Q07kk0E
 DgTx61VPrrcCUhTds4x9y0jbmq5pgskJy0mYVODDm7dWmoJrIPrrm7q+uF8BGDx48oBgbsKAXUi
 /sKJ8Nfw/NuYsM/z3DE4JCVFZWQkv0xF9Burk3Iu8rS6BvhnyTTiVvZ3f4aXMZvFfkZSeV3qBAQ
 v88Kl49E+AwTgEeno7V+nJnBliSxnXz32teZIaFFOngVR2vVAAbv0q5b4IiXu5AdyGQ7TQsOh8z
 BqffLG0cwKVBMWNDnXeHSNXJAvsp2dbdugVH2VqZ/DjQdVmJ1htTKKLHuIxWCP6cUmKV/21qNW6
 hTe3F7wHemEXkkG4tegla0ewCeNJdVQ/1nxlovsnNh+TMIyHMOQ4bQu3M0ecIdAPfLVFtW3MqPD
 uNlItB8zcZksJdD8X/Q==
X-Proofpoint-ORIG-GUID: 1tVrBnbpyVyIdZioYcu7Xan46paTZZ4b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_202854_934403_7529DC5E 
X-CRM114-Status: GOOD (  18.40  )
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

Query firmware capabilities during transport initialization and cache
support for memory lending, sharing, segmented parcels and signal buses.

Distinguish REE-accessible memory operations from those restricted to
TEE-to-TEE use so Linux only enables operations available to it.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/riscv_rpmi_tee/driver.c           | 73 ++++++++++++++++++++++
 drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h | 15 +++++
 2 files changed, 88 insertions(+)

diff --git a/drivers/firmware/riscv_rpmi_tee/driver.c b/drivers/firmware/riscv_rpmi_tee/driver.c
index a683f7d28c25..b43a09f5e853 100644
--- a/drivers/firmware/riscv_rpmi_tee/driver.c
+++ b/drivers/firmware/riscv_rpmi_tee/driver.c
@@ -18,6 +18,33 @@
 
 #include "rpmi_tee_private.h"
 
+#define RPMI_TEE_FEATURE_MEMORY_LEND		1
+#define RPMI_TEE_FEATURE_MEMORY_SHARE		2
+#define RPMI_TEE_FEATURE_SIGNAL_BUS		3
+#define RPMI_TEE_FEATURE_MULTISEGMENT_OPS	4
+
+#define RPMI_TEE_MEMORY_FEATURE_UNSUPPORTED		0
+#define RPMI_TEE_MEMORY_FEATURE_TEE_ONLY		1
+#define RPMI_TEE_MEMORY_FEATURE_FULLY_SUPPORTED	2
+
+/**
+ * struct rpmi_tee_probe_features_req - TEE_PROBE_FEATURES request
+ * @feature_id: TEE feature identifier to query.
+ */
+struct rpmi_tee_probe_features_req {
+	__le32 feature_id;
+} __packed;
+
+/**
+ * struct rpmi_tee_probe_features_resp - TEE_PROBE_FEATURES response
+ * @status: RPMI completion status.
+ * @value: Feature-specific value.
+ */
+struct rpmi_tee_probe_features_resp {
+	__le32 status;
+	__le32 value;
+} __packed;
+
 /**
  * struct rpmi_tee_call_req - TEE_CALL request prefix
  * @sender_id: Calling REE endpoint identifier.
@@ -186,6 +213,29 @@ static int rpmi_tee_check_transport(struct rpmi_tee_transport *priv)
 
 /* RPMI TEE SERVICE GRP API. */
 
+/* TEE_PROBE_FEATURES. */
+static int rpmi_tee_probe_features(struct rpmi_tee_transport *priv,
+				   u32 feature_id, u32 *value)
+{
+	struct rpmi_tee_probe_features_req req = {
+		.feature_id = cpu_to_le32(feature_id),
+	};
+	struct rpmi_tee_probe_features_resp resp;
+	size_t resp_len = sizeof(resp);
+	int ret;
+
+	ret = rpmi_tee_send(priv, RPMI_TEE_SRV_PROBE_FEATURES, &req,
+			    sizeof(req), &resp, &resp_len);
+	if (ret)
+		return ret;
+	if (resp_len != sizeof(resp))
+		return -EPROTO;
+
+	*value = get_unaligned_le32(&resp.value);
+
+	return 0;
+}
+
 /* Return the transport that owns @rdev. */
 static struct rpmi_tee_transport *
 rpmi_tee_device_to_transport(struct rpmi_tee_device *rdev)
@@ -371,6 +421,7 @@ static int rpmi_tee_setup_endpoints(struct rpmi_tee_transport *priv)
 static int rpmi_tee_transport_probe(struct platform_device *pdev)
 {
 	struct rpmi_tee_transport *priv;
+	u32 value;
 	int ret;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -394,6 +445,28 @@ static int rpmi_tee_transport_probe(struct platform_device *pdev)
 		goto out_failed;
 	}
 
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_MEMORY_LEND,
+				      &value);
+	if (ret)
+		goto out_failed;
+	priv->mem.lend_ok = value == RPMI_TEE_MEMORY_FEATURE_FULLY_SUPPORTED;
+
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_MEMORY_SHARE,
+				      &value);
+	if (ret)
+		goto out_failed;
+	priv->mem.share_ok = value == RPMI_TEE_MEMORY_FEATURE_FULLY_SUPPORTED;
+
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_MULTISEGMENT_OPS,
+				      &priv->mem.multisegment_max);
+	if (ret)
+		goto out_failed;
+
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_SIGNAL_BUS,
+				      &priv->notif.feature);
+	if (ret)
+		goto out_failed;
+
 	ret = rpmi_tee_setup_endpoints(priv);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret,
diff --git a/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h b/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
index 07e6b9913cb7..0c3cfa0f14ec 100644
--- a/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
+++ b/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
@@ -14,17 +14,28 @@
 /* TEE service group and the services used by this module. */
 #define RPMI_SRVGRP_TEE		0x10
 
+#define RPMI_TEE_SRV_PROBE_FEATURES	0x02
 #define RPMI_TEE_SRV_PROBE_SYSTEM	0x03
 #define RPMI_TEE_SRV_PROBE_DOMAIN	0x04
 #define RPMI_TEE_SRV_PROBE_ENDPOINT	0x05
 #define RPMI_TEE_SRV_CALL		0x18
 
+struct rpmi_tee_notif_state {
+	u32 feature;
+};
+
 struct rpmi_tee_mbox {
 	struct mbox_client client;
 	struct mbox_chan *chan;
 	u32 max_msg_data_size;
 };
 
+struct rpmi_tee_mem_state {
+	u32 multisegment_max;
+	bool lend_ok;
+	bool share_ok;
+};
+
 /**
  * struct rpmi_tee_transport - State for one RPMI TEE transport instance
  * @dev: Parent platform device.
@@ -33,6 +44,8 @@ struct rpmi_tee_mbox {
  * @max_call_resp_size: Maximum TEE_CALL response payload size in bytes.
  * @self_id: Local REE physical endpoint identifier.
  * @devices: List of registered TEE service devices.
+ * @mem: Memory parcel operation state.
+ * @notif: Signal notification state.
  */
 struct rpmi_tee_transport {
 	struct device *dev;
@@ -41,6 +54,8 @@ struct rpmi_tee_transport {
 	size_t max_call_resp_size;
 	u32 self_id;
 	struct list_head devices;
+	struct rpmi_tee_mem_state mem;
+	struct rpmi_tee_notif_state notif;
 };
 
 /* Report local transport errors separately from the returned RPMI status. */

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
