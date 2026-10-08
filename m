Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D34CA6007
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 03:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9G0igvq+qwimjIYkX8rVUTOPmVRInIIm8fLeoqN5wg=; b=NC9TdOKrNG9ywJ
	xzvT7PdCV4MoQ2FiClkBKlv08lq1QLjytPqlbvuiCdgJRp8I/FfnLddvDuTZF7wG36NggUnqm2aud
	ClJ7MNzwZGfpknA2fBQ6ezQW2/5SIF3PCkECZn00W/6jCBA6JsDaLNoby+Eyb1eMRFTy8fwskMLqc
	37tYqhR3qQHWsg68/87YDvaa2I1mb91GV/iIJWhWwo1PeGKPI1Upm/IRszkC1HjEnqwOHweLg9gL/
	qYhmozM7ZSPrNiiaSfB5sYUMgv5SPOoVU/f6+gD5V8NgTDvGNUJSRTEDpn02uCQ/9fI9cQ7m9TZ3A
	fL2M7lJUq/zosh9ZEdQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeoP-00000003RsQ-0iyf;
	Thu, 08 Oct 2026 03:28:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeoM-00000003Rpb-3aj8
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 03:28:52 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hcjG2575225
	for <linux-riscv@lists.infradead.org>; Thu, 8 Oct 2026 03:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JYhMxhZH0dD9pA3ktR3FA82R4vBs9fV9ebvrujfapgw=; b=m3IiWMBwcGiYIz06
	Xz8k6ERhnf8dzZHjJjD97zML0i1SrmBc1eV8Cye+/qQh1ZzKtExlf5bV8ZQlZeXG
	kia9J92NKIs1NAssqhRZXfiYVr1Su/8pQHRbMGejuj/xqoVb+q02u07ZU3xmOh9B
	km4FlapaY5WJAikmofQhW9//RUbsEPl2X9y5xOYL63NdmfnWupr44Fy0MEdbyIIc
	UdI+p420NhxnAS6c9ojW8qBoPY7vPyDYHOpQhSq7uy+7pc7MKPc7ie52/WeYe1Po
	KNrNifzsemCcKdRWlMoWGD08CNrhIkXt2HrlLh7z+uY7ugr0wI3tTPcTbkshMCAv
	lk4NEA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg8fps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 03:28:50 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3515d2fc5ebso5721298eec.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 20:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791430130; x=1792034930; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYhMxhZH0dD9pA3ktR3FA82R4vBs9fV9ebvrujfapgw=;
        b=QnbTY8T6vV7dsJ9hUCADIqzi6nqXvsL9oboUrgRzbURehVlwHQWsNsOUAkXJkrwnMY
         3QJ0cUjUizkBsuvgeWR8JoH6fqm8z1zwabh231xv0XPKWcVgye+qSlBepNUzwRWvSr1t
         e9yC3HFhyhdBV5r9UzYW3lp7l9WReNWAjGLzXZqcsLYUNXZHmDbEXQTp25WiK60Z8rbd
         IpMb2t1RMQQLB7HRW94/5B0sgjJnfn+r6MXk9TvmMPaawralCr/r/VvRmQxHCQv+dU/X
         RWC8a5siUMtTwa4mcgwJe3mDEIdahB8blHCATGHOpr2adp9grdurSNkyQjkk7Jwm0a8t
         yXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791430130; x=1792034930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYhMxhZH0dD9pA3ktR3FA82R4vBs9fV9ebvrujfapgw=;
        b=L1YIZmLNACV8+MsH1xF+DtIAtqYtwb2bn+0vpM7UpZ/FFFHyf52l/OWe96o9S57XgJ
         4H/oD8bmATc+JroQTlkMvS+RueahHA/pNzbAR29nrpXZ2Sy+C3E9XvJCvd+MBXaOrWCD
         j/6xmygsO19FgIM3HN+rsJi2+VcGVchZvIwv3oAs0Y85z1juhXFvuz+Uv3n9Ro+ylhBZ
         LdHihqXV3ebdxXFSnQsG1RWXGeVFzEUw91/kt1ul2ABMETgC/Y7NZc1veJd9VXJfX7iQ
         LWkVJiK31NrUNHClj0n/NkTMnA7jNEz5DbNWNcLSLtko3OZVaqQl5T8zyEudJdy+w1Ky
         w8yg==
X-Forwarded-Encrypted: i=1; AKwUvBzvZONq3UEwdtn1XLP/EE0t/aprbX++/SaA0Y3EPs4abjzEWDaTvPMUMuEGUoKH0WwbQe5lP8yMGTJISA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJvLwr+++gPKv0J72JzP9K4fkVeRVVHnMoYMNSYVUYdrb3Be2Iq
	Pe/b3gXzYUtBC4JIBwWunVmyQkSJ6IBXlK42n2NONre5bztCKo9t4s7/u9UuFSytIjXaGR+yivm
	OUyPfKzgzTXtC29HQVUr+d2uwGj4fe/5YaKApQsb1vUjfsxY8IU9XLyhTX0ZhEyj7cfbcGA==
X-Gm-Gg: AYBFou2VfnkDjoVF7/cMFFDiCFMoczpkM1MUmQevZrdkmEqqo8uYEymeu5E0sdD8dH0
	BMd3NfT1XUCfOt94RG6siUQM0lZas5OEaR6kSru+cxtgeIbqJQQimzqsVvwirfbdEzeFzunLafF
	W2FIEkWCo0pvXodDcQbQjAVm0ABijxjGiq2+ju3RQ5x7v9XmlOxOuzh0qboxxpy0l6rvTswi2Fn
	jige2R15u2tgcFCpTE0ipw4v4eK1ZnCB1MBePnqFqNX05gLETUnJ2tIqvgbPn19U/lMk/OWWAjr
	gOFX8Dz4Yrp+vZ6a8D8ezKLpmnUclQsGhPIwx1d8/obFQcbbVuOQ+H6JKUAHJ47erTp+Xcpz/L0
	lRN7szu3bsOTtOfJu9CzooCQhIsYNbeqY/RBbvC9gi5eDGicVg+7J2M208Q==
X-Received: by 2002:a05:7300:8808:b0:351:232c:6d79 with SMTP id 5a478bee46e88-3515dd837d6mr4640199eec.12.1791430129372;
        Wed, 07 Oct 2026 20:28:49 -0700 (PDT)
X-Received: by 2002:a05:7300:8808:b0:351:232c:6d79 with SMTP id 5a478bee46e88-3515dd837d6mr4640114eec.12.1791430127800;
        Wed, 07 Oct 2026 20:28:47 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35179d07566sm2168349eec.30.2026.10.07.20.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:28:47 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 20:27:11 -0700
Subject: [PATCH RFC v2 05/10] firmware: add RPMI TEE transport core
MIME-Version: 1.0
Message-Id: <20261007-riscv-rpmi-tee-abi-v2-5-45939a13d223@oss.qualcomm.com>
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
X-Proofpoint-GUID: arNw3uecW-Ua7T25TFN8GozE4YN5k8Oc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX6KUl7o3hcJMx
 e7Cyn6b4SN2uPh9CnA/iG8DetGP2LiLjnGLSM1KiB8iadqbUUAD8Akr6N2tTVAA0AEFkzZXucn3
 CmnW7mcjhFOTte4D4uomw5JgneAvBsU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfXwgTFLT4n29vS
 YxMAXbs04l1QqqdW8/gfTR+LhcIaCxH30tLFthyC22yfgbSykeQn5QrYs4QJmq+ZefV8+ctraFJ
 11D2DDzCgG/uGnHRkrYL7U05JkRVohhL+H6ckqJ5drLs2qJH2VaVidwQLjcpquWUVbnmaJ8y0g8
 RiYbTms8rFp6XfR+4Sq//2kiGWJTp02N7qDNlRa1EDiN9/ihQwN7IE+Xz4IQ6CzLu2y1yNH7HBM
 j38QZk2PzvRwcaiqZBzi2f7q2P/tshMWs2+9JhtocWQ/AuRU59slppOzWBYL0E6xEdI86ofYdqt
 F68YEYf5pUphHQ8D9ydUqQzAye7TGY1GHT6Jo7P2YgQAGAjfTAVJhQos6KAiVo0ch7LmQXbhxKa
 HGSJjWfXO9LIIFR8cD1nL9FQtc2oQAu6h/ad07hIXIceQLv0oAq0v1ipxaNegi1U+2Ba/TgherG
 PIfSvn/7fTCQgwudFYA==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac70df2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=0-kq_-QLXk4bkpNlR94A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: arNw3uecW-Ua7T25TFN8GozE4YN5k8Oc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_202850_935453_F4AEF970 
X-CRM114-Status: GOOD (  22.94  )
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

Add a platform driver for the RPMI TEE service group using an SBI MPXY
mailbox channel. Select direct synchronous mailbox transfers so RPMI
transactions complete in the calling context.

Query mailbox attributes to check the RPMI specification version, TEE
service-group identifier and service-group version. Cache the maximum
message data size for subsequent service requests.

This establishes the transport state used by later discovery, memory,
and notification support.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/riscv_rpmi_tee/Makefile           |   3 +
 drivers/firmware/riscv_rpmi_tee/driver.c           | 133 +++++++++++++++++++++
 drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h |  26 ++++
 3 files changed, 162 insertions(+)

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
index 000000000000..d9ae161d241b
--- /dev/null
+++ b/drivers/firmware/riscv_rpmi_tee/driver.c
@@ -0,0 +1,133 @@
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
+#include "rpmi_tee_private.h"
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
diff --git a/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h b/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
new file mode 100644
index 000000000000..b25192c5df00
--- /dev/null
+++ b/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _RPMI_TEE_PRIVATE_H
+#define _RPMI_TEE_PRIVATE_H
+
+#include <linux/mailbox_client.h>
+#include <linux/types.h>
+
+/* TEE service group and the services used by this module. */
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
+#endif /* _RPMI_TEE_PRIVATE_H */

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
