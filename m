Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FD4CA5FAB
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 03:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDLhUFZNfywFa/x4D4xLGws2+3tDv61DjDFnJGBqG6A=; b=0OzM/IiUeDs8tl
	GpKeM5d2Q6ESiJFU9hwxb/h1BeDhmEAWpS0ulHQw9+BYp/YVp+85xMy2YYQ1FkKHEKBcu0uizM4TG
	HtT8YbldtWnDenqiAxgmyhSJCqaEnYQzy/KThdMmXi30FPgrNrFIugyS/zEZ+Mglwk0M+Yy5ylFdc
	+Tbn6h2VAE80BTu2YPQsii85rNWH6DFQBrxFSNq69mPBWxZiGfEvTcrHRm9FRsocZw8ZKVWgl1D7b
	aawCRVDNWCVTUrTk2pCPR9VNMTOUTBxA1g+CIcOAZkTJr5JuKNKgVlX+c6wAcLFTmZbljWfKve58r
	tERtBQsNnDxcLfZoj3oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOLs-00000002C26-1kH7;
	Tue, 29 Sep 2026 03:17:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOLo-00000002C02-26Nf
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 03:17:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0j7wD4080001
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 03:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aCUHYK+w4BDMVrp4w2bXUwotIcGHHJCYmu108KdLKKU=; b=KeU2pJToCBgVGDtb
	l2KtoBHgPRgiyunO+KHMzrEeKafoEfIOX9XBJlls+lJA8/9RnSnaT8FxYIkUaWHI
	WIL4u2//qOjR4SSqyhDLWPSe7s+xQ437Uu9cYmLky4D7sSdkZK44A+OEVBizZ9Ro
	aCEwd24IZ7zouG9puTvNgf0TyjVbtTuUYHgQOx/x6aZj0oaKwi5zJgi9X9Ms34Qk
	gLJcHOWOMCb/pp9bJ2EseOB0REnbRAwvXiu7gtUg1cZgb1Mxp7fx6MBylgG77/Cn
	783E9shzCBqnHN9B0eNA84bYh/CwBJqajdnDWNF76DpWfTDyioMpyGF8MYpkLUmd
	uqjFTw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03hw02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 03:17:51 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso611296eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 20:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790651871; x=1791256671; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aCUHYK+w4BDMVrp4w2bXUwotIcGHHJCYmu108KdLKKU=;
        b=gIVA0zV2ihl8C98ZC498a46pkjpa5IU52/my5EbOo0lJqfbOIiygBJqlv08bwaaeM1
         Qs9sejAgfdMIfGeFyAEyOUnt7Pgyl/qqS0EbP5eg516FDTv3aLcrAsQkLInfvbfeDVRQ
         zS/6Jq5MYLdvQ0pjfbQf5xWKKQ1B4R/0s8OkSJhh6Pjdo+Hao16RDKcSv2wI1J5uu0ps
         +8lnK86w5yJohPPFKVSWFeLrTo9uCCqq8HvHot96g7ZXwNIsyQLpECXjaaA7Cqgi7sIY
         2QycW0aoknCXJIzApBRfLJrPCEfudLcQ7i6RIE3+ODFpZ6YfRQMCDfD84esiJTV4tT2n
         6XMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651871; x=1791256671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCUHYK+w4BDMVrp4w2bXUwotIcGHHJCYmu108KdLKKU=;
        b=vcx5a2QexyWKb76XD9BGLae02OcL4flPelaf4Vb+IzHlBHaBZvdH4fBAF22gAQ/NzD
         OyJPitbmQPggEpw0aruV5+sbyw1Aivf9GAb5NF43m6sdK61arfkrUoS34CxMiQn1ekup
         36xZ+3/TxcTPCkCAJdOl6dNLFielo52KwP0FofVc3N2hJVSXlaJ5MZ37O5yLrrgIT+ez
         U/bFJEbTOLaaFkCryZhX0/nHRMQrqCftddRDWYgGbTpDsE1Lq4qqD8dBXTFGXazQyY3p
         Ulv6q3i/sXbbOdd6+Nqqiey6t3P69qhODsNTkJhfSnTpLSmjw6MTnRSQXPfs9Vqb7HzR
         52ZA==
X-Forwarded-Encrypted: i=1; AKwUvBxyTUgt0kTZ65x1ZnGENYbdq9tlqfqPy971Pod0TFWydcTCp06FDmT4gGduuwMrbSzn5SrZHv8OUUaHyQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lkl1B0JkJbhQBN8YfGEaFLbcI/kHQsQezZRThwjkoa1ltLM/D5
	NONGnGzp+Lav3e2CeFEN4SnCAfjCj/zq4D10kk3Gc9ZkClx46hH418mXPwBtzhAM10Ipt+aWNUj
	3y+L0UaFKCMWGhsvclr6B47gSB0wOjqk9ix9IPeTwfEoQOGYYwU8edWVtjSI6a7Nwh0ISjg==
X-Gm-Gg: AYBFou0WXwzeO0LYbhLO9UxE7uHz6pP4j6EJBz8XrYju3xyKHJ6QxIVjqk4MNRdktHR
	WeCH8vGgKZkoDiPwxeqLowHFsY1+B++FkYHs9nGzozttYgMXeqys3OSLIVgJXhLwaYNrFBglWFy
	8LvMZYknrNMtPLzvxCBFAj0bY2NRIzXLP+8/E+QML70T/NqTqdzg7g5RN/3P3DFrL98JpfZPBbC
	WWxNX05Wt6h1M9Sq+FIrJ1Q3AyCjAsBOLPWotKuZ3v4a7vTbR9CgvHNgYCpGr5Adkc0Ot2FV/Z0
	WcdXVYQnWuxjPa8sNYgv1VwQ+Pcox5zO/M9rTajd/+dJFn0wz3nGL/AQUzgycgSBtdW8lJ1Wt1U
	j6tvcE+vF4HNt+D4P3wmn6VGFlw/hEjSufdWgCHtTnA10PoKWWbe8Lqw1Vbo=
X-Received: by 2002:a05:701b:424f:20b0:136:4bbe:9524 with SMTP id a92af1059eb24-14b2df6149dmr1530586c88.10.1790651871196;
        Mon, 28 Sep 2026 20:17:51 -0700 (PDT)
X-Received: by 2002:a05:701b:424f:20b0:136:4bbe:9524 with SMTP id a92af1059eb24-14b2df6149dmr1530549c88.10.1790651870575;
        Mon, 28 Sep 2026 20:17:50 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad4028a9sm24789368c88.11.2026.09.28.20.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:17:50 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 20:16:56 -0700
Subject: [PATCH RFC 05/10] firmware: add RPMI TEE transport core
MIME-Version: 1.0
Message-Id: <20260928-riscv-rpmi-tee-abi-v1-5-04908b81d885@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX2ZCJOgSM8LRJ
 aj3qRBX0iRnO8sWODpSCEtO57lNxYGyrVvWUdmFVFb+70jr2dC9izlMRdGqOIOSKSDqzpO75w1a
 GP8QLEoPlhTLwZY1etg2+Yufjt1DoSo=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abb2de0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5numxkeOl0lsm_bA3l4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfXwz1lKVcM8Igi
 r/td4+wcuLgtLakSH3q6b46Ej2F2hyXSNW3et1FocM98WntqykbK4MeOTdUHsNear6CCXiskqb5
 dOzYgq0Hy5NwTuhOjSXzhVqzEeW2bcIVENiqk2+PkCaDRIrnsdonJGXvafvoU9Bi+pUik70IP/o
 oTx6ZzkImzjmpv8A2FRACWRchxOeTgtQsqs63BpMfy3axBJkI/5WimZihWT2pS82Z0/4JWMeq04
 y2hfdeufDVT0Dd4YTMS9GuZ8w0vL3u2N5vWgCXvtNfCiRdr+13NExDPAZxR5O1sLzI8h5mYQ/at
 IhaJ6aQOegpVzP9e2w72DACNcdvKDHeUTM9d6AsxmBszmpgNH9Ugz9QB9WTPy5tm+Rx3CsTwFXy
 6ZbSBqusOAYtf7ydzmDkhNPSXJVloB+XU2HvdYPc42evaJTFx/SjCDPJdLyUt6E5Luz+ExgQbpA
 CEDF52/HY1IhQm5PO5w==
X-Proofpoint-GUID: gxm8lbRzP06K8JYfll2FyKGGySPNrSwf
X-Proofpoint-ORIG-GUID: gxm8lbRzP06K8JYfll2FyKGGySPNrSwf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_201752_566076_77F03CD7 
X-CRM114-Status: GOOD (  20.75  )
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

Add the RISC-V RPMI TEE platform driver and bind it to a direct
synchronous mailbox channel via tx_sync.

Before retaining the channel, validate the RPMI spec version, the
TEE service-group identifier and version, and cache the negotiated
maximum message data size, so later discovery, memory, and
notification support can rely on a checked transport.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/riscv_rpmi_tee/Makefile |   3 +
 drivers/firmware/riscv_rpmi_tee/driver.c | 144 +++++++++++++++++++++++++++++++
 2 files changed, 147 insertions(+)

diff --git a/drivers/firmware/riscv_rpmi_tee/Makefile b/drivers/firmware/riscv_rpmi_tee/Makefile
index d80ab5bc9dc4..8984127535ed 100644
--- a/drivers/firmware/riscv_rpmi_tee/Makefile
+++ b/drivers/firmware/riscv_rpmi_tee/Makefile
@@ -3,3 +3,6 @@
 rpmi-tee-bus-y = bus.o
 rpmi-tee-core-objs := $(rpmi-tee-bus-y)
 obj-$(CONFIG_RISCV_RPMI_TEE_TRANSPORT) = rpmi-tee-core.o
+rpmi-tee-driver-y = driver.o
+rpmi-tee-module-objs := $(rpmi-tee-driver-y)
+obj-$(CONFIG_RISCV_RPMI_TEE_TRANSPORT) += rpmi-tee-module.o
diff --git a/drivers/firmware/riscv_rpmi_tee/driver.c b/drivers/firmware/riscv_rpmi_tee/driver.c
new file mode 100644
index 000000000000..633dba116584
--- /dev/null
+++ b/drivers/firmware/riscv_rpmi_tee/driver.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * RISC-V RPMI TEE transport
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/mailbox_client.h>
+#include <linux/mailbox/riscv-rpmi-message.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/rpmi_tee.h>
+
+#define RPMI_SRVGRP_TEE		0x10
+
+struct rpmi_tee_mbox {
+	struct mbox_client client;
+	struct mbox_chan *chan;
+	u32 max_msg_data_size;
+};
+
+struct rpmi_tee_transport {
+	struct device *dev;
+	struct rpmi_tee_mbox mbox;
+};
+
+/**
+ * rpmi_tee_get_attr() - Get an RPMI mailbox attribute
+ * @priv: RPMI TEE transport
+ * @id: Attribute identifier
+ * @value: Returned attribute value
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+static int rpmi_tee_get_attr(struct rpmi_tee_transport *priv,
+			     enum rpmi_mbox_attribute_id id, u32 *value)
+{
+	struct rpmi_mbox_message msg;
+	int ret;
+
+	rpmi_mbox_init_get_attribute(&msg, id);
+	ret = rpmi_mbox_send_message_sync(priv->mbox.chan, &msg);
+	if (ret)
+		return ret;
+
+	*value = msg.attr.value;
+
+	return 0;
+}
+
+/* Validate the RPMI mailbox transport and cache its message size. */
+static int rpmi_tee_check_transport(struct rpmi_tee_transport *priv)
+{
+	u32 value;
+	int ret;
+
+	ret = rpmi_tee_get_attr(priv, RPMI_MBOX_ATTR_SPEC_VERSION, &value);
+	if (ret)
+		return ret;
+	if (value < RPMI_MKVER(1, 0))
+		return -EPROTONOSUPPORT;
+
+	ret = rpmi_tee_get_attr(priv, RPMI_MBOX_ATTR_SERVICEGROUP_ID, &value);
+	if (ret)
+		return ret;
+	if (value != RPMI_SRVGRP_TEE)
+		return -ENODEV;
+
+	ret = rpmi_tee_get_attr(priv, RPMI_MBOX_ATTR_SERVICEGROUP_VERSION,
+				&value);
+	if (ret)
+		return ret;
+	if (value < RPMI_MKVER(1, 0))
+		return -EPROTONOSUPPORT;
+
+	ret = rpmi_tee_get_attr(priv, RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE, &value);
+	if (ret)
+		return ret;
+
+	priv->mbox.max_msg_data_size = value;
+
+	return 0;
+}
+
+static int rpmi_tee_transport_probe(struct platform_device *pdev)
+{
+	struct rpmi_tee_transport *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+	platform_set_drvdata(pdev, priv);
+	priv->mbox.client.dev = &pdev->dev;
+	priv->mbox.client.tx_sync = true;
+	priv->mbox.chan = mbox_request_channel(&priv->mbox.client, 0);
+	if (IS_ERR(priv->mbox.chan))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->mbox.chan),
+				     "failed to request mailbox channel\n");
+
+	ret = rpmi_tee_check_transport(priv);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret,
+			      "invalid RPMI TEE mailbox channel\n");
+		goto out_failed;
+	}
+
+	return 0;
+
+out_failed:
+	mbox_free_channel(priv->mbox.chan);
+
+	return ret;
+}
+
+static void rpmi_tee_transport_remove(struct platform_device *pdev)
+{
+	struct rpmi_tee_transport *priv = platform_get_drvdata(pdev);
+
+	mbox_free_channel(priv->mbox.chan);
+}
+
+static const struct of_device_id rpmi_tee_transport_match[] = {
+	{ .compatible = "riscv,rpmi-tee" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rpmi_tee_transport_match);
+
+static struct platform_driver rpmi_tee_transport_driver = {
+	.probe = rpmi_tee_transport_probe,
+	.remove = rpmi_tee_transport_remove,
+	.driver = {
+		.name = "riscv-rpmi-tee",
+		.of_match_table = rpmi_tee_transport_match,
+	},
+};
+
+module_platform_driver(rpmi_tee_transport_driver);
+
+MODULE_DESCRIPTION("RISC-V RPMI TEE service group transport");
+MODULE_LICENSE("GPL");

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
