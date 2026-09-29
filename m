Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0844DCA5FAB
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 03:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iIDGwlQ7J3YCFYnwZiE/jlVDtxo/urzUy9+/00xHN1M=; b=eh6gaq883R35lb
	7OILZoN/Y6j6E7b7CaxhiyWUPgbwR/moTGlFVi2e4F0h0T5d7QeIsxUju1wo87XPnD72afyP7Dpoh
	tOLcFacJJbdti2qz93bsqqCr+uqeEAWUUAexa7CXxDqB8E3Jq43ioUknk25/Yx2h0Grda7J+9gDPq
	aSYbgk8j8T+KzL77ppD3ySH/AQkY2LaEWpugsfYeFTwfd4JNa2V9dt4K/JHrzzR6fYSOujpHnKa2q
	gyV2lk53bfE2nizO+MyJqwwXYGi1VcW8tKG8jYVzyPLfu8auf211rjgitIU2Lo3v8j/S6BQ2dz1+Y
	2So1fF40vuwX+Ra4AGIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOLx-00000002C4e-0TvS;
	Tue, 29 Sep 2026 03:18:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOLr-00000002C1Z-1NU6
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 03:17:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0jKCn2557906
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 03:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CbXZIFabmAbEjfK2I2xCUw3hbj2D7qnhOVuAj0Qii1U=; b=kWYXtGOOa7dD7fPm
	TjcHp1TpgBwIGDPOV8h2wGF8dF1EOwfB69gEkqlidb60FyoyscgarMpfkHSo5Gyy
	kK+7ujrAbn9bAwx3aba5ZP5P+SF7hdoQIjWVk+OtOaUOTiSTlBerhGEOEX+62e+v
	7INzODemgq3SJ1cUo7JEl8OP8YQCAKDkUVuxIangalsN1mxlQJI9xZzlf1pDUECz
	ADTSt8eP5z7b5zmwvs1D3SAy07/J/0P10sm0ayA3KWK6x9Ia5H2lJA+uVGsUJBQI
	sg4u7P3FEj5BtPZUko15WssIf4rlNBMUBuXclVK6TEMEIM/wjCMNfF8YjhfnPCjT
	eCcm0g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwn9vh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 03:17:54 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-144d4ba280aso64687c88.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 20:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790651874; x=1791256674; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbXZIFabmAbEjfK2I2xCUw3hbj2D7qnhOVuAj0Qii1U=;
        b=WJ+/kJQi2vFlM+yhOXHqHGGfNTwLYg2MBpDO721wevgpaaxrgQrsmDHeJ9cwIhf2QH
         AceqDJHA2afGqpvv228gluIDBP3j7rAqrVu2yL37xNoXn9ggEDdtrtDKGlocB6e8QMZQ
         pqUIaWeL8V17ibfXYScx6FQsdsE1eJB6YP6mBVGWV5XpvMT6PQZlUy3C9nb1+XRKfThX
         6mZcPJoYDCHK67Ds6pRuQ2qYlXrW5oKqTrxW3OZZhxlwfZY/dKiEkk7q339t3eMKutIU
         XcwJ9Kvde2N5G0K3o4FmAnZ7w0QQZVecU29f7MrmIzYGP20B3doHEO1XiLlKKleMVgxM
         OJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651874; x=1791256674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CbXZIFabmAbEjfK2I2xCUw3hbj2D7qnhOVuAj0Qii1U=;
        b=oPbGs8RzspZQqbfSLEB4v3uaH642bj8WDOQ/j6HTKbds271oRBPJYTsHgS+H8XSYRb
         mbiTtHTi3suLsIK4MOojg1k7PQSauGg810DAuriNlBPZjxb9RRvUbgluWytIKtkbyUvX
         HXeEd4On96SOiRa7Nn+n6Uqx3AgFDZ53mqE0C0LGMWdwvL38ezl1AkE7n9lE1W7vqHj6
         10YUSLmmLfucGcMA19kRL28wdCXsULfgsVKXD3/xjbVUOT216N+hNHMA1TnzNexvfJk2
         VCIleS+TbyTR4kAHQ9nBZHTqMjPcMZUA/i4YUsBe9qz85Kmjv6CjO1KzpkDH0ZomZYaX
         ZPdw==
X-Forwarded-Encrypted: i=1; AKwUvBy8A4s6DY48sWDKIE5erXxWcrvXhGt/Inf3jBE6kHDAIznnDSwxbBzJGM5tWZFr2qr5qI0D18MzalAJZQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mBxFMQcWrzKvhaUdtJkk34yLOIXzc+1/ogqti7oQZA570K0Xxy
	KEUsD/a7tXjjmKpiQ9p6hwVl03qQwxdLv4BeIICUM22+cDmbqzt09vV/w57E7ZU3b28aeI0qusf
	0Ctink7lpmdKWevQNIX5tKrwMRhW2OjijV9G/BK4zc+Y3Nyo8P9vCMXwG2YPtqf4uVWYT1w==
X-Gm-Gg: AYBFou0abN+L7FYTjlK/x3A4wL5dE3cqi1iEXtjLNZ4uCd47pBFwQZA6VVv7eDamFr6
	ODpHoE7UxsnrJzODtLBg52Obp9/Px4xY2cv64pxVaF6Dey82WREMesGENw8M0/xO4gFQR4OC/yY
	fK4WaBUIj07J2aU1jlAKA+iQeesVoEVZTZ8r/NXnWYLjs71m3dUWnVtvC1EqxYMnaF5ZyfjJcrx
	b+2Xgwczt6lota/XtHJolEthsRCrTrYZmfcFwXkVUbkfrE0G8bOuYrXHQvxbQRKWhnWrxktLBcA
	1PkmdaO7An0xu+dHH0FpdGc7X/5ezpYPemOOGbi4h+N2LNdKnZNeKWsOHtHuMJKhgbTvkIcT5Co
	t1OMg25ItYcjuYb+r2363EasCFXWtbZLtOj4mpM+frOH7+GzVWrfyJj8OO0s=
X-Received: by 2002:a05:7022:3a83:b0:141:2f15:552f with SMTP id a92af1059eb24-14b2b6c2670mr1924705c88.9.1790651873807;
        Mon, 28 Sep 2026 20:17:53 -0700 (PDT)
X-Received: by 2002:a05:7022:3a83:b0:141:2f15:552f with SMTP id a92af1059eb24-14b2b6c2670mr1924657c88.9.1790651873052;
        Mon, 28 Sep 2026 20:17:53 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad4028a9sm24789368c88.11.2026.09.28.20.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:17:52 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 20:16:58 -0700
Subject: [PATCH RFC 07/10] firmware: riscv: rpmi-tee: discover TEE services
MIME-Version: 1.0
Message-Id: <20260928-riscv-rpmi-tee-abi-v1-7-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: N4_0mzsdK5x80Dyr3yEx_j2GYgJvntUO
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abb2de2 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zg7WzeXGWC4RVWCX2BsA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX/Wk3v3QKgUdE
 H2OWdzV69MT/h5nTerG0pUuEnF0/szxYQjmMerECpvTzlvwehEpF6MDINo4JIBcLfaLkGjCpTM3
 wjE4If4PD6GJJpz2pg/cnBZtFCN9+VYblrN/By2dAQiYPhZzmBQ1wPiYnziFt0qniVD2wvjpFNq
 45e16nslBF5dlH9Nb1dIBZ/YS+qrsXd4Ie+0RglYh/5X77y+9RhSf7fKpIZO8RO0+C+4TE44NQJ
 gsx5y8yqFsvjzc/7vn87xHm9bqhaVFtfPUI8h0aBCAGts3InK0ybe1DnEbccilOy3JcBXO7RK4r
 kBtISLKcUKTE+Wu5fMrGLWnsSSS82HBHPQGb4KOq+s+0YlCfnwNtOaJSVAK4Fx49t7B4gCSpr3y
 8Nc6aWR/xquGPhLgdK6CEpA8JBzJMYOzEVemycJ88xXalXUqzUzSDmp43zfr51S6nuIXnZaKyg4
 Y/QBov7WDWX+GOaVhmA==
X-Proofpoint-GUID: N4_0mzsdK5x80Dyr3yEx_j2GYgJvntUO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX4+Vxv5tsWNnX
 9K4sznc2xDvG629HQKqr2dVFpR81KlIpF6g6PD41jSYGTbQeinioZXhhkmVjE95lrWsTJfOLIuT
 YcYtG6tBFkPNG4TADmZuEzvryHKQSGY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_201755_392136_42D212E4 
X-CRM114-Status: GOOD (  21.41  )
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

Add the RPMI TEE service-group message layer: TEE_PROBE_FEATURES and
TEE_PROBE_SYSTEM requests, and TEE_CALL for invoking a service on a
discovered endpoint. Use TEE_PROBE_SYSTEM to retrieve the Self and
Whole-system SYSINFO tables during transport probe, and register one
RPMI TEE device for every physical TEE service UUID discovered.

Implement the msg_ops.call operation on top of TEE_CALL, so consumer
drivers bound to the registered devices can issue service requests
without depending on the RPMI wire format.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/riscv_rpmi_tee/driver.c | 504 +++++++++++++++++++++++++++++++
 include/linux/rpmi_tee.h                 |  10 +
 2 files changed, 514 insertions(+)

diff --git a/drivers/firmware/riscv_rpmi_tee/driver.c b/drivers/firmware/riscv_rpmi_tee/driver.c
index 633dba116584..db3dbab53078 100644
--- a/drivers/firmware/riscv_rpmi_tee/driver.c
+++ b/drivers/firmware/riscv_rpmi_tee/driver.c
@@ -7,24 +7,188 @@
 
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
+#include <linux/cleanup.h>
+#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/overflow.h>
 #include <linux/platform_device.h>
 #include <linux/rpmi_tee.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+
+#include "sysinfo.h"
 
 #define RPMI_SRVGRP_TEE		0x10
 
+#define RPMI_TEE_SRV_PROBE_FEATURES	0x02
+#define RPMI_TEE_SRV_PROBE_SYSTEM	0x03
+#define RPMI_TEE_SRV_CALL		0x13
+
+#define RPMI_TEE_FEATURE_SYSINFO_FORMAT	6
+
+#define RPMI_TEE_SYSTEM_WHOLE		0
+#define RPMI_TEE_SYSTEM_SELF		3
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
+/**
+ * struct rpmi_tee_probe_system_req - TEE_PROBE_SYSTEM request
+ * @format: Requested system-information format.
+ * @target_type: Requested system-information target type.
+ * @target_len: Target-specific request data length.
+ * @target: Target-specific request data.
+ */
+struct rpmi_tee_probe_system_req {
+	__le32 format;
+	__le32 target_type;
+	__le32 target_len;
+	u8 target[];
+} __packed;
+
+/**
+ * struct rpmi_tee_probe_system_resp - TEE_PROBE_SYSTEM response prefix
+ * @status: RPMI completion status.
+ * @data_len: Length of the following system-information data.
+ * @data: System-information data in the requested format.
+ */
+struct rpmi_tee_probe_system_resp {
+	__le32 status;
+	__le32 data_len;
+	u8 data[];
+} __packed;
+
+/**
+ * struct rpmi_tee_call_req - TEE_CALL request prefix
+ * @sender_id: Calling REE endpoint identifier.
+ * @target_id: Destination TEE endpoint identifier.
+ * @service: UUID of the target service.
+ * @service_data_len: Length of @service_data in bytes.
+ * @service_data: Service-defined request data.
+ */
+struct rpmi_tee_call_req {
+	__le32 sender_id;
+	__le32 target_id;
+	u8 service[UUID_SIZE];
+	__le32 service_data_len;
+	u8 service_data[];
+} __packed;
+
+/**
+ * struct rpmi_tee_call_resp - TEE_CALL response prefix
+ * @status: RPMI completion status.
+ * @service_data_len: Length of @service_data in bytes.
+ * @service_data: Service-defined response data.
+ */
+struct rpmi_tee_call_resp {
+	__le32 status;
+	__le32 service_data_len;
+	u8 service_data[];
+} __packed;
+
 struct rpmi_tee_mbox {
 	struct mbox_client client;
 	struct mbox_chan *chan;
 	u32 max_msg_data_size;
 };
 
+struct rpmi_tee_child {
+	struct list_head node;
+	struct rpmi_tee_device *rdev;
+};
+
 struct rpmi_tee_transport {
 	struct device *dev;
 	struct rpmi_tee_mbox mbox;
+	u32 self_id;
+	struct list_head devices;
 };
 
+/* __rpmi_tee_send() - Send an RPMI TEE service request. */
+static int __rpmi_tee_send(struct rpmi_tee_transport *priv, u32 service_id,
+			   const void *req, size_t req_len, void *resp,
+			   size_t *resp_len, s32 *status)
+{
+	size_t max_resp_len = *resp_len;
+	struct rpmi_mbox_message msg;
+	int ret;
+
+	if (req_len > priv->mbox.max_msg_data_size ||
+	    max_resp_len > priv->mbox.max_msg_data_size)
+		return -EMSGSIZE;
+
+	rpmi_mbox_init_send_with_response(&msg, service_id, (void *)req,
+					  req_len, resp, max_resp_len);
+	ret = rpmi_mbox_send_message_sync(priv->mbox.chan, &msg);
+	if (ret)
+		return ret;
+	/* At least STATUS word should be present. */
+	if (msg.data.out_response_len < sizeof(__le32))
+		return -EPROTO;
+
+	*resp_len = msg.data.out_response_len;
+	*status = (s32)get_unaligned_le32(resp);
+
+	return 0;
+}
+
+/**
+ * rpmi_tee_send() - Send an RPMI TEE service request
+ * @priv: RPMI TEE transport
+ * @service_id: RPMI TEE service identifier
+ * @req: Request data
+ * @req_len: Request data length
+ * @resp: Response data buffer, or %NULL for a status-only response
+ * @resp_len: On entry, response buffer capacity; on success, response length
+ *
+ * Pass both @resp and @resp_len as %NULL when the service has no response
+ * payload beyond the mandatory RPMI status word.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+static int rpmi_tee_send(struct rpmi_tee_transport *priv, u32 service_id,
+			 const void *req, size_t req_len, void *resp,
+			 size_t *resp_len)
+{
+	__le32 status_resp;
+	size_t status_resp_len = sizeof(status_resp);
+	s32 status;
+	int ret;
+
+	if (!resp && !resp_len) {
+		resp = &status_resp;
+		resp_len = &status_resp_len;
+	} else if (!resp || !resp_len) {
+		return -EINVAL;
+	}
+
+	ret = __rpmi_tee_send(priv, service_id, req, req_len, resp, resp_len,
+			      &status);
+	if (ret)
+		return ret;
+
+	if (status == RPMI_ERR_NO_DATA)
+		return -ENODATA;
+
+	return rpmi_to_linux_error(status);
+}
+
 /**
  * rpmi_tee_get_attr() - Get an RPMI mailbox attribute
  * @priv: RPMI TEE transport
@@ -77,12 +241,343 @@ static int rpmi_tee_check_transport(struct rpmi_tee_transport *priv)
 	ret = rpmi_tee_get_attr(priv, RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE, &value);
 	if (ret)
 		return ret;
+	/* The mandatory TEE_CALL request and response must fit the mailbox. */
+	if (value < sizeof(struct rpmi_tee_call_req) ||
+	    value < sizeof(struct rpmi_tee_call_resp))
+		return -EMSGSIZE;
 
 	priv->mbox.max_msg_data_size = value;
 
 	return 0;
 }
 
+/* RPMI TEE SERVICE GRP API. */
+
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
+/**
+ * rpmi_tee_probe_system - retrieve a TEE system-information description
+ * @priv: RPMI TEE transport.
+ * @target_type: System-information target type.
+ * @data: Returns an allocated system-information buffer.
+ * @data_len: Returns the size of @data in bytes.
+ *
+ * Supports only the Whole-system and Self targets, which have no target data.
+ * The caller owns the returned buffer in @data and must free them with kfree().
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+static int rpmi_tee_probe_system(struct rpmi_tee_transport *priv,
+				 u32 target_type, void **data, size_t *data_len)
+{
+	struct rpmi_tee_probe_system_req req = {
+		.format = cpu_to_le32(RPMI_TEE_SYSINFO_FORMAT_TABLE),
+		.target_type = cpu_to_le32(target_type),
+		/* Whole-system and Self probes have no target data. */
+		.target_len = 0,
+	};
+	size_t resp_len = priv->mbox.max_msg_data_size;
+	u32 len;
+	int ret;
+
+	if (target_type != RPMI_TEE_SYSTEM_WHOLE &&
+	    target_type != RPMI_TEE_SYSTEM_SELF)
+		return -EINVAL;
+
+	struct rpmi_tee_probe_system_resp *resp __free(kfree) =
+		kzalloc(resp_len, GFP_KERNEL);
+	if (!resp)
+		return -ENOMEM;
+
+	ret = rpmi_tee_send(priv, RPMI_TEE_SRV_PROBE_SYSTEM, &req, sizeof(req),
+			    resp, &resp_len);
+	if (ret)
+		return ret;
+
+	if (resp_len < sizeof(*resp))
+		return -EPROTO;
+	len = get_unaligned_le32(&resp->data_len);
+	if (len != resp_len - sizeof(*resp))
+		return -EPROTO;
+
+	/* Keep the system data. */
+	*data = kmemdup(resp->data, len, GFP_KERNEL);
+	if (!*data)
+		return -ENOMEM;
+
+	*data_len = len;
+
+	return 0;
+}
+
+/* Retrieve the local REE endpoint identifier. */
+static int rpmi_tee_parse_self(struct rpmi_tee_transport *priv, u32 *self_id)
+{
+	void *data __free(kfree) = NULL;
+	size_t data_len;
+	int ret;
+
+	ret = rpmi_tee_probe_system(priv, RPMI_TEE_SYSTEM_SELF, &data,
+				    &data_len);
+	if (ret)
+		return ret;
+
+	return rpmi_tee_sysinfo_parse_self(data, data_len, self_id);
+}
+
+/**
+ * rpmi_tee_parse_system() - Retrieve and parse Whole-system SYSINFO
+ * @priv: RPMI TEE transport.
+ * @system: Returned endpoint and service discovery records.
+ *
+ * Retrieve the Whole-system SYSINFO description. The caller owns the arrays
+ * in @system on success and must free them with kfree().
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+static int rpmi_tee_parse_system(struct rpmi_tee_transport *priv,
+				 struct rpmi_tee_sysinfo_system *system)
+{
+	void *data __free(kfree) = NULL;
+	size_t data_len;
+	int ret;
+
+	/* Start with no output storage to obtain the required record counts. */
+	*system = (struct rpmi_tee_sysinfo_system) {};
+
+	ret = rpmi_tee_probe_system(priv, RPMI_TEE_SYSTEM_WHOLE, &data,
+				    &data_len);
+	if (ret)
+		return ret;
+
+	ret = rpmi_tee_sysinfo_parse_system(data, data_len, priv->self_id,
+					    system);
+	if (ret != -ENOSPC)
+		return ret;
+
+	if (system->ep_count) {
+		system->ep_capacity = system->ep_count;
+		system->eps = kcalloc(system->ep_capacity, sizeof(*system->eps),
+				      GFP_KERNEL);
+		if (!system->eps)
+			return -ENOMEM;
+	}
+
+	if (system->service_count) {
+		system->service_capacity = system->service_count;
+		system->services = kcalloc(system->service_capacity,
+					   sizeof(*system->services), GFP_KERNEL);
+		if (!system->services) {
+			kfree(system->eps);
+			return -ENOMEM;
+		}
+	}
+
+	ret = rpmi_tee_sysinfo_parse_system(data, data_len, priv->self_id,
+					    system);
+	if (ret) {
+		kfree(system->services);
+		kfree(system->eps);
+	}
+
+	return ret;
+}
+
+/**
+ * rpmi_tee_op_call - Invoke a service offered by a TEE endpoint
+ * @rdev: TEE service device.
+ * @req: Service-defined request data.
+ * @req_len: Length of @req in bytes.
+ * @resp: Buffer for service-defined response data.
+ * @resp_len: On entry, capacity of @resp; on success, response length.
+ *
+ * MPXY can return -ENOSPC after the TEE has processed the request when the
+ * response exceeds the supplied buffer. Callers must not blindly retry a
+ * non-idempotent request in that case.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+/* Return the transport that owns @rdev. */
+static struct rpmi_tee_transport *
+rpmi_tee_device_to_transport(struct rpmi_tee_device *rdev)
+{
+	return dev_get_drvdata(rdev->dev.parent);
+}
+
+static int rpmi_tee_op_call(struct rpmi_tee_device *rdev, const void *req,
+			    size_t req_len, void *resp, size_t *resp_len)
+{
+	struct rpmi_tee_transport *priv = rpmi_tee_device_to_transport(rdev);
+	size_t call_req_len, call_resp_len;
+	u32 service_data_len;
+	int ret;
+
+	if (!resp_len || (!req && req_len) || (!resp && *resp_len))
+		return -EINVAL;
+
+	/* TEE_CALL payload must fit the mailbox. */
+	if (req_len > priv->mbox.max_msg_data_size -
+		sizeof(struct rpmi_tee_call_req) ||
+	    *resp_len > priv->mbox.max_msg_data_size -
+		sizeof(struct rpmi_tee_call_resp))
+		return -EMSGSIZE;
+
+	call_req_len = sizeof(struct rpmi_tee_call_req) + req_len;
+	call_resp_len = sizeof(struct rpmi_tee_call_resp) + *resp_len;
+
+	struct rpmi_tee_call_req *call_req __free(kfree) =
+		kzalloc(call_req_len, GFP_KERNEL);
+	if (!call_req)
+		return -ENOMEM;
+
+	struct rpmi_tee_call_resp *call_resp __free(kfree) =
+		kzalloc(call_resp_len, GFP_KERNEL);
+	if (!call_resp)
+		return -ENOMEM;
+
+	call_req->sender_id = cpu_to_le32(priv->self_id);
+	call_req->target_id = cpu_to_le32(rdev->endpoint_id);
+	export_uuid(call_req->service, &rdev->uuid);
+	call_req->service_data_len = cpu_to_le32(req_len);
+	if (req_len)
+		memcpy(call_req->service_data, req, req_len);
+	/* Make TEE CALL. */
+	ret = rpmi_tee_send(priv, RPMI_TEE_SRV_CALL, call_req, call_req_len,
+			    call_resp, &call_resp_len);
+	if (ret)
+		return ret;
+
+	if (call_resp_len < sizeof(*call_resp))
+		return -EPROTO;
+	service_data_len = get_unaligned_le32(&call_resp->service_data_len);
+	if (service_data_len != call_resp_len - sizeof(*call_resp))
+		return -EPROTO;
+
+	if (service_data_len)
+		memcpy(resp, call_resp->service_data, service_data_len);
+	*resp_len = service_data_len;
+
+	return 0;
+}
+
+static const struct rpmi_tee_msg_ops rpmi_tee_msg_ops = {
+	.call = rpmi_tee_op_call,
+};
+
+static const struct rpmi_tee_ops rpmi_tee_ops = {
+	.msg_ops = &rpmi_tee_msg_ops,
+};
+
+static void rpmi_tee_unregister_devices(struct rpmi_tee_transport *priv)
+{
+	struct rpmi_tee_child *child, *tmp;
+
+	list_for_each_entry_safe(child, tmp, &priv->devices, node) {
+		list_del(&child->node);
+		rpmi_tee_device_unregister(child->rdev);
+		kfree(child);
+	}
+}
+
+static struct rpmi_tee_device *
+rpmi_tee_find_device(struct rpmi_tee_transport *priv, const uuid_t *uuid,
+		     u32 endpoint_id)
+{
+	struct rpmi_tee_child *child;
+
+	list_for_each_entry(child, &priv->devices, node) {
+		if (child->rdev->endpoint_id == endpoint_id &&
+		    uuid_equal(&child->rdev->uuid, uuid))
+			return child->rdev;
+	}
+
+	return NULL;
+}
+
+static int
+rpmi_tee_register_devices(struct rpmi_tee_transport *priv,
+			  const struct rpmi_tee_sysinfo_service_info *services,
+			  size_t service_count)
+{
+	size_t i;
+	int ret;
+
+	for (i = 0; i < service_count; i++) {
+		const struct rpmi_tee_sysinfo_service_info *service = &services[i];
+
+		/* Discard duplicate devices in the same endpoint. */
+		if (rpmi_tee_find_device(priv, &service->uuid,
+					 service->endpoint_id))
+			continue;
+
+		struct rpmi_tee_child *child __free(kfree) =
+			kzalloc_obj(*child, GFP_KERNEL);
+		if (!child) {
+			ret = -ENOMEM;
+			goto err_unregister;
+		}
+		child->rdev = rpmi_tee_device_register(&service->uuid,
+						       service->endpoint_id,
+						       &rpmi_tee_ops,
+						       priv->dev);
+		if (IS_ERR(child->rdev)) {
+			ret = PTR_ERR(child->rdev);
+			goto err_unregister;
+		}
+
+		list_add_tail(&no_free_ptr(child)->node, &priv->devices);
+	}
+
+	return 0;
+
+err_unregister:
+	rpmi_tee_unregister_devices(priv);
+
+	return ret;
+}
+
+static int rpmi_tee_setup_endpoints(struct rpmi_tee_transport *priv)
+{
+	struct rpmi_tee_sysinfo_system system;
+	int ret;
+
+	ret = rpmi_tee_parse_self(priv, &priv->self_id);
+	if (ret)
+		return ret;
+
+	ret = rpmi_tee_parse_system(priv, &system);
+	if (ret)
+		return ret;
+
+	ret = rpmi_tee_register_devices(priv, system.services,
+					system.service_count);
+	kfree(system.services);
+	kfree(system.eps);
+
+	return ret;
+}
+
 static int rpmi_tee_transport_probe(struct platform_device *pdev)
 {
 	struct rpmi_tee_transport *priv;
@@ -94,6 +589,7 @@ static int rpmi_tee_transport_probe(struct platform_device *pdev)
 
 	priv->dev = &pdev->dev;
 	platform_set_drvdata(pdev, priv);
+	INIT_LIST_HEAD(&priv->devices);
 	priv->mbox.client.dev = &pdev->dev;
 	priv->mbox.client.tx_sync = true;
 	priv->mbox.chan = mbox_request_channel(&priv->mbox.client, 0);
@@ -108,6 +604,13 @@ static int rpmi_tee_transport_probe(struct platform_device *pdev)
 		goto out_failed;
 	}
 
+	ret = rpmi_tee_setup_endpoints(priv);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret,
+			      "failed to discover RPMI TEE services\n");
+		goto out_failed;
+	}
+
 	return 0;
 
 out_failed:
@@ -120,6 +623,7 @@ static void rpmi_tee_transport_remove(struct platform_device *pdev)
 {
 	struct rpmi_tee_transport *priv = platform_get_drvdata(pdev);
 
+	rpmi_tee_unregister_devices(priv);
 	mbox_free_channel(priv->mbox.chan);
 }
 
diff --git a/include/linux/rpmi_tee.h b/include/linux/rpmi_tee.h
index c499f0427833..57c1843537da 100644
--- a/include/linux/rpmi_tee.h
+++ b/include/linux/rpmi_tee.h
@@ -41,6 +41,16 @@ struct rpmi_tee_driver {
 #define to_rpmi_tee_drv(d) \
 	container_of_const(d, struct rpmi_tee_driver, driver)
 
+struct rpmi_tee_msg_ops {
+	int (*call)(struct rpmi_tee_device *rdev, const void *req,
+		    size_t req_len, void *resp, size_t *resp_len);
+};
+
+/* RPMI TEE transport operation groups. */
+struct rpmi_tee_ops {
+	const struct rpmi_tee_msg_ops *msg_ops;
+};
+
 extern const struct bus_type rpmi_tee_bus_type;
 
 #if IS_REACHABLE(CONFIG_RISCV_RPMI_TEE_TRANSPORT)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
