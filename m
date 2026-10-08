Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD59CA600D
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 03:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8VoGg+ygZHOceEtMjgcx/kr5P4iS5zBGwsLa98A7cc=; b=yLawLYH3AJpCn3
	ehHj5yADJLerm0UvmAW9jMszl90VM7sLKKzcRyDUdNrB9lgdT3yQKA1KYNuqGF7j4VY/JfRivPGJi
	C0Zl4apreFpVFFFCHTG6w479NDAjzz/y+Ntw5pMO303b+rTEJ3usE3yf4E5EONZHA/XYZ1e1GF/zi
	6VmBskZVuylhQiGaSCzKvsr5KtPPjyBIzQeNgYlhsoZp80OkV/7i5amyw0Hq7ckhS6p8FuNQk9hFM
	vFg8vysqbHtCZx9PSCr6M9u5OP6LQWgHG2Dzc5JIvp7oTjtCBxusLsknx+aeCJL5+/sQwK/ZXXpKN
	oL9KpksIzYhPZCKo+6QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeoM-00000003Rpg-3V0h;
	Thu, 08 Oct 2026 03:28:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeoJ-00000003RnZ-3iJV
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 03:28:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hSQV1114193
	for <linux-riscv@lists.infradead.org>; Thu, 8 Oct 2026 03:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3LlMYlWp2TcEmoujTF0c+B3OZcUutnCnpZb9I2TwtLU=; b=OfiZ+NANuOKh9WeD
	I3/zjfKcmSx1bArA9JF5tF0CapDuohhOzwM8GMBUPChXeCidQMlxo9SETKuGll3e
	JOG8TU3QCGmDSIlhT97CiMcZSXzhL/qRFNCHlFAWWWgolBuHSHJtVdIWr9aLDyie
	UocvmYJ7Be9Z2FcOWBA2QiEB4INfo9APrMq9Tev+iS+Gf+y5rKLemX6zbnzP0Lmp
	zY/IXRzPzp6xhJrJzdbpKubThvQ4G8XrNuzfTSEKTtmcGZfyYE9fe9q9XuDPbmdr
	5yae59b6jT0ZXFEF2M3xKVFk+1MMbkLleTfSrhFS1gypICSgFdbSnCZ/8KBJe1JS
	NFsWkw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3h0xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 03:28:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510562ef98so6398863eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 20:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791430126; x=1792034926; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LlMYlWp2TcEmoujTF0c+B3OZcUutnCnpZb9I2TwtLU=;
        b=eqemyXVzTtv0H10emKg6VfarmJmHlWiJOxp1ZCKr4nj7uP/z4hS0aV++zLhh8xValJ
         DDyUN4ADfm8y8A9irmcSlSkZlbpUNA9hgaJ/VU4dZYorXYSSiFD7Ru9F9MbOejeHDbmi
         1qbz/OOTOPCdhSG6pWscy04HYzmnKAwYk97aKAxUHrhbIVAXaP1dbvZ6BWcOzmuFXzh7
         isDOHXGdfOVM5LPZhALqnaj+LiAXmeVPFrxhdLGT9mi2q7/TIx/BQduNcM9SyYs9Apei
         xXMd2c5MDtI/6Igttq9vQkYsblZdNJvvQsRfjuTptpaA6mMf1HiLgOk7uJE0SQe0TtN1
         6VNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791430126; x=1792034926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3LlMYlWp2TcEmoujTF0c+B3OZcUutnCnpZb9I2TwtLU=;
        b=vdU7skbsghYI9bDkn9BcA4Jd7xAkkdpIs4+N9tG4H8CAT2O1dtid1WvcmS9aMc0/mx
         NimzNLu3XR5RHziiCmtk7BV7KcDUABbtNpC9L+3kBCmjhvJ4ralZHzf3UFLA0lZmqCQI
         XyLFsOOj4NiLB/aDxCMOep+7K020eLWaZqUfm9EHYAUNxTWxjC3l5RyRP/El/l8FL2FT
         H7N1QPkDc2SHs8+KGFZPf+xq/CfRMd2Iv/Nl0weQ7y846MXmww0m5CKiT+DLrRYEJ9Wb
         B33eQcLPVlgg36WjGJAyzpX8ghbg0ITh534BrjYmWH8v5W/34wE955h2E6tgW5IdqrWw
         mmzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGD1KauvGntccEky3BtEkvUn2somFV9JKEjlznjGRCi3DmqkmZ/rEJwYLqn3Jb9EfMF48w9S5lGw+Y3Q==@lists.infradead.org
X-Gm-Message-State: AFuF++kpg4tdzbFyRdfGywqZwazoClIN3N4TiPsU50os8HyHevGww5cp
	tu7K5KVMzJK0grSPsWWuIcj7WUob8Xm4jVFyuDNooPEio7GyMV35uYr7yDIPM1T82QSvN9s2SNo
	yoKIuYD6OvvYOP+ORq1vhiaRM9gMfDfydq7mLWvs2/6TmspDstbccXgkfDq6LLtOFG6W+c/Weup
	+kRg==
X-Gm-Gg: AYBFou3fHnaX/uTaykJLbCbai5tqx8EmmAarM400UKESbpS7EwlzuRMCspW0x/nRVsO
	z8OZ3EHUKabso2QlQzmdsnu9ElG5SgTMK3iClUsxXw3qcv1yQLw4M8NJ7S6tMBSo5UA4Dkb/VOi
	Xei9wsBlp45DQ9L6abl7HC3j1bFlVqmgVqeiqJB413NYw6uGPE6JJh4X8cC+5A68G23a5gLFnNS
	D0zYgpzI3JKAm+P/0oputWksNYrl2VWxk8X7IVKwtg1QXr7VQKXHzDh9MA0aRazxDNnI5ecpbT6
	qidoaA76IfPW74gqDGUpLJrUqtCC6to+zItmXYDMZvXumDQNUjylG8qc/uWe0Rh8ucwuOpwvOGI
	35ENOt0D/KIJvFXdDUMW6Ga4KuVzH27FaWolmsUFeReWnysbegTrO5R1JLg==
X-Received: by 2002:a05:7300:6ca1:b0:351:4d2d:af26 with SMTP id 5a478bee46e88-3515d86f0aemr7081123eec.2.1791430125625;
        Wed, 07 Oct 2026 20:28:45 -0700 (PDT)
X-Received: by 2002:a05:7300:6ca1:b0:351:4d2d:af26 with SMTP id 5a478bee46e88-3515d86f0aemr7081071eec.2.1791430125002;
        Wed, 07 Oct 2026 20:28:45 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35179d07566sm2168349eec.30.2026.10.07.20.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:28:44 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 20:27:09 -0700
Subject: [PATCH RFC v2 03/10] firmware: add RPMI TEE bus support
MIME-Version: 1.0
Message-Id: <20261007-riscv-rpmi-tee-abi-v2-3-45939a13d223@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX0mBTtQEIoaVK
 X2lwG38hz1BQbeEPH08JGvoBbMuzpmwrVj3zWdC3QMASy0l8bhH2cV+/2n+TG0hQCACw7Ie9HyW
 SaESBPwCKh4oZjbHo99L5QVXz9X1L6s=
X-Proofpoint-ORIG-GUID: MQo78I_8uCS_9Xa31ciljmOSWh1q32_r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfXxcqovpguPt79
 3sUZEp5Yxu3IWz7J7syJTeT9k8mNvYSGzBUoS9He487WR/UIzinJKteV07KLykDaEH18BkjOSGe
 9llkhSV7+zaQ7KeCeM7nff+I36aXIjU9tSkIxSgaGNIxtnJTog9rhr89t0VIPhjd1fwq0Htzqq/
 Uh5DLPb79OriEPgqKReGFd45xp35kIxRh+UUq0KRi4LuRqzyrSc10619BMf1Wm0oXpM83WJurD9
 zAgkaJa12FHhW2BYoKYzl1e8LGrCylzjdG2s/TW2UE5uUQMDaOM5qzJ2VZNno1uSkWlTRL2clwz
 IuYzcYH7ytqjdjF2n4BhyW4KSa2cjodd/QpwGlVTBoaSNNa8al661koXyC0e5cOS+uP4c5DM5tf
 Ds9XiShj38/shqeXbKQ0qbWsymsaf2l8gI60HvKNnrsujuOzrfyj2MwKt2/vm+ZmR7p3Lv6EuCH
 YLUdfOFFhjYX6gFbf5g==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac70dee cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IHj7fnvydjjLQZ3tJQkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: MQo78I_8uCS_9Xa31ciljmOSWh1q32_r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_202848_051060_95F7192A 
X-CRM114-Status: GOOD (  20.79  )
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

RPMI TEE endpoints can provide multiple services identified by UUID.
Add a service bus so consumer drivers can bind to these services
without depending on the underlying mailbox transport.

Introduce device and driver registration interfaces with UUID-based
matching. Represent each endpoint and service UUID pair as a device
with a unique name.

Expose the endpoint ID, service UUID and modalias through sysfs, and
provide modalias uevents for consumer modules with matching aliases.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/Kconfig                 |   2 +
 drivers/firmware/Makefile                |   1 +
 drivers/firmware/riscv_rpmi_tee/Kconfig  |   8 ++
 drivers/firmware/riscv_rpmi_tee/Makefile |   5 +
 drivers/firmware/riscv_rpmi_tee/bus.c    | 202 +++++++++++++++++++++++++++++++
 include/linux/rpmi_tee.h                 |  83 +++++++++++++
 6 files changed, 301 insertions(+)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index c183d98c1e8f..46297332288f 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -6,6 +6,8 @@
 
 menu "Firmware Drivers"
 
+source "drivers/firmware/riscv_rpmi_tee/Kconfig"
+
 source "drivers/firmware/arm_scmi/Kconfig"
 
 config ARM_SCPI_PROTOCOL
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index a855d3696173..772fe024baab 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
 
 obj-y				+= arm_ffa/
 obj-y				+= arm_scmi/
+obj-y				+= riscv_rpmi_tee/
 obj-y				+= broadcom/
 obj-y				+= cirrus/
 obj-y				+= meson/
diff --git a/drivers/firmware/riscv_rpmi_tee/Kconfig b/drivers/firmware/riscv_rpmi_tee/Kconfig
new file mode 100644
index 000000000000..b0396183b87d
--- /dev/null
+++ b/drivers/firmware/riscv_rpmi_tee/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config RISCV_RPMI_TEE_TRANSPORT
+	tristate "RISC-V RPMI TEE service group transport"
+	depends on RISCV && OF && RISCV_SBI_MPXY_MBOX
+	help
+	  Say Y or M here to enable the transport for services provided by the
+	  RISC-V RPMI TEE service group.
diff --git a/drivers/firmware/riscv_rpmi_tee/Makefile b/drivers/firmware/riscv_rpmi_tee/Makefile
new file mode 100644
index 000000000000..d80ab5bc9dc4
--- /dev/null
+++ b/drivers/firmware/riscv_rpmi_tee/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+rpmi-tee-bus-y = bus.o
+rpmi-tee-core-objs := $(rpmi-tee-bus-y)
+obj-$(CONFIG_RISCV_RPMI_TEE_TRANSPORT) = rpmi-tee-core.o
diff --git a/drivers/firmware/riscv_rpmi_tee/bus.c b/drivers/firmware/riscv_rpmi_tee/bus.c
new file mode 100644
index 000000000000..1393adda0d3a
--- /dev/null
+++ b/drivers/firmware/riscv_rpmi_tee/bus.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * RISC-V RPMI TEE bus
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/device.h>
+#include <linux/idr.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/rpmi_tee.h>
+#include <linux/slab.h>
+
+#define RPMI_TEE_UEVENT_MODALIAS_FMT	"rpmi_tee:%pUb"
+
+static DEFINE_IDA(rpmi_tee_bus_id);
+
+static int rpmi_tee_device_match(struct device *dev,
+				 const struct device_driver *drv)
+{
+	const struct rpmi_tee_device_id *id_table;
+	struct rpmi_tee_device *rdev = to_rpmi_tee_dev(dev);
+
+	id_table = to_rpmi_tee_drv(drv)->id_table;
+	if (!id_table)
+		return 0;
+
+	while (!uuid_is_null(&id_table->uuid)) {
+		if (uuid_equal(&rdev->uuid, &id_table->uuid))
+			return 1;
+		id_table++;
+	}
+
+	return 0;
+}
+
+static int rpmi_tee_device_probe(struct device *dev)
+{
+	struct rpmi_tee_driver *rdrv = to_rpmi_tee_drv(dev->driver);
+
+	return rdrv->probe(to_rpmi_tee_dev(dev));
+}
+
+static void rpmi_tee_device_remove(struct device *dev)
+{
+	struct rpmi_tee_driver *rdrv = to_rpmi_tee_drv(dev->driver);
+
+	if (rdrv->remove)
+		rdrv->remove(to_rpmi_tee_dev(dev));
+}
+
+static int rpmi_tee_device_uevent(const struct device *dev,
+				  struct kobj_uevent_env *env)
+{
+	const struct rpmi_tee_device *rdev = to_rpmi_tee_dev(dev);
+
+	return add_uevent_var(env, "MODALIAS=" RPMI_TEE_UEVENT_MODALIAS_FMT,
+			      &rdev->uuid);
+}
+
+static ssize_t endpoint_id_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct rpmi_tee_device *rdev = to_rpmi_tee_dev(dev);
+
+	return sysfs_emit(buf, "0x%x\n", rdev->endpoint_id);
+}
+static DEVICE_ATTR_RO(endpoint_id);
+
+static ssize_t uuid_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct rpmi_tee_device *rdev = to_rpmi_tee_dev(dev);
+
+	return sysfs_emit(buf, "%pUb\n", &rdev->uuid);
+}
+static DEVICE_ATTR_RO(uuid);
+
+static ssize_t modalias_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct rpmi_tee_device *rdev = to_rpmi_tee_dev(dev);
+
+	return sysfs_emit(buf, RPMI_TEE_UEVENT_MODALIAS_FMT, &rdev->uuid);
+}
+static DEVICE_ATTR_RO(modalias);
+
+static struct attribute *rpmi_tee_device_attrs[] = {
+	&dev_attr_endpoint_id.attr,
+	&dev_attr_uuid.attr,
+	&dev_attr_modalias.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(rpmi_tee_device);
+
+const struct bus_type rpmi_tee_bus_type = {
+	.name		= "rpmi_tee",
+	.match		= rpmi_tee_device_match,
+	.probe		= rpmi_tee_device_probe,
+	.remove		= rpmi_tee_device_remove,
+	.uevent		= rpmi_tee_device_uevent,
+	.dev_groups	= rpmi_tee_device_groups,
+};
+EXPORT_SYMBOL_GPL(rpmi_tee_bus_type);
+
+int rpmi_tee_driver_register(struct rpmi_tee_driver *driver,
+			     struct module *owner, const char *mod_name)
+{
+	if (!driver->probe || !driver->id_table)
+		return -EINVAL;
+
+	driver->driver.bus = &rpmi_tee_bus_type;
+	driver->driver.name = driver->name;
+	driver->driver.owner = owner;
+	driver->driver.mod_name = mod_name;
+
+	return driver_register(&driver->driver);
+}
+EXPORT_SYMBOL_GPL(rpmi_tee_driver_register);
+
+void rpmi_tee_driver_unregister(struct rpmi_tee_driver *driver)
+{
+	driver_unregister(&driver->driver);
+}
+EXPORT_SYMBOL_GPL(rpmi_tee_driver_unregister);
+
+static void rpmi_tee_device_release(struct device *dev)
+{
+	struct rpmi_tee_device *rdev = to_rpmi_tee_dev(dev);
+
+	ida_free(&rpmi_tee_bus_id, rdev->id);
+	kfree(rdev);
+}
+
+struct rpmi_tee_device *
+rpmi_tee_device_register(const uuid_t *uuid, u32 endpoint_id,
+			 const struct rpmi_tee_ops *ops, struct device *parent)
+{
+	struct rpmi_tee_device *rdev;
+	int id;
+	int ret;
+
+	if (!uuid || !ops)
+		return ERR_PTR(-EINVAL);
+
+	id = ida_alloc_min(&rpmi_tee_bus_id, 1, GFP_KERNEL);
+	if (id < 0)
+		return ERR_PTR(id);
+
+	rdev = kzalloc_obj(*rdev, GFP_KERNEL);
+	if (!rdev) {
+		ida_free(&rpmi_tee_bus_id, id);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	rdev->dev.parent = parent;
+	rdev->dev.bus = &rpmi_tee_bus_type;
+	rdev->dev.release = rpmi_tee_device_release;
+	dev_set_name(&rdev->dev, "rpmi-tee-%d", id);
+
+	rdev->id = id;
+	rdev->endpoint_id = endpoint_id;
+	rdev->ops = ops;
+	uuid_copy(&rdev->uuid, uuid);
+
+	ret = device_register(&rdev->dev);
+	if (ret) {
+		put_device(&rdev->dev);
+		return ERR_PTR(ret);
+	}
+
+	return rdev;
+}
+EXPORT_SYMBOL_GPL(rpmi_tee_device_register);
+
+void rpmi_tee_device_unregister(struct rpmi_tee_device *rdev)
+{
+	if (rdev)
+		device_unregister(&rdev->dev);
+}
+EXPORT_SYMBOL_GPL(rpmi_tee_device_unregister);
+
+static int __init rpmi_tee_bus_init(void)
+{
+	return bus_register(&rpmi_tee_bus_type);
+}
+
+subsys_initcall(rpmi_tee_bus_init);
+
+static void __exit rpmi_tee_bus_exit(void)
+{
+	bus_unregister(&rpmi_tee_bus_type);
+	ida_destroy(&rpmi_tee_bus_id);
+}
+
+module_exit(rpmi_tee_bus_exit);
+
+MODULE_DESCRIPTION("RISC-V RPMI TEE bus");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/rpmi_tee.h b/include/linux/rpmi_tee.h
new file mode 100644
index 000000000000..c499f0427833
--- /dev/null
+++ b/include/linux/rpmi_tee.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * RISC-V RPMI TEE transport interface
+ */
+
+#ifndef _LINUX_RPMI_TEE_H
+#define _LINUX_RPMI_TEE_H
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/uuid.h>
+
+struct rpmi_tee_ops;
+
+struct rpmi_tee_device {
+	struct device dev;
+	u32 id;
+	u32 endpoint_id;	/* RPMI endpoint identifier of the TEE. */
+	uuid_t uuid;		/* UUID identifying the TEE service. */
+	const struct rpmi_tee_ops *ops;
+};
+
+#define to_rpmi_tee_dev(d) container_of(d, struct rpmi_tee_device, dev)
+
+struct rpmi_tee_device_id {
+	uuid_t uuid;
+};
+
+struct rpmi_tee_driver {
+	const char *name;
+	int (*probe)(struct rpmi_tee_device *rdev);
+	void (*remove)(struct rpmi_tee_device *rdev);
+	/* NULL-UUID-terminated list of supported service UUIDs. */
+	const struct rpmi_tee_device_id *id_table;
+	struct device_driver driver;
+};
+
+#define to_rpmi_tee_drv(d) \
+	container_of_const(d, struct rpmi_tee_driver, driver)
+
+extern const struct bus_type rpmi_tee_bus_type;
+
+#if IS_REACHABLE(CONFIG_RISCV_RPMI_TEE_TRANSPORT)
+struct rpmi_tee_device *
+rpmi_tee_device_register(const uuid_t *uuid, u32 endpoint_id,
+			 const struct rpmi_tee_ops *ops, struct device *parent);
+void rpmi_tee_device_unregister(struct rpmi_tee_device *rdev);
+int rpmi_tee_driver_register(struct rpmi_tee_driver *driver,
+			     struct module *owner, const char *mod_name);
+void rpmi_tee_driver_unregister(struct rpmi_tee_driver *driver);
+#else
+static inline struct rpmi_tee_device *
+rpmi_tee_device_register(const uuid_t *uuid, u32 endpoint_id,
+			 const struct rpmi_tee_ops *ops, struct device *parent)
+{
+	return NULL;
+}
+
+static inline void rpmi_tee_device_unregister(struct rpmi_tee_device *rdev)
+{
+}
+
+static inline int rpmi_tee_driver_register(struct rpmi_tee_driver *driver,
+					   struct module *owner,
+					   const char *mod_name)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void rpmi_tee_driver_unregister(struct rpmi_tee_driver *driver)
+{
+}
+#endif
+
+#define rpmi_tee_register(driver) \
+	rpmi_tee_driver_register(driver, THIS_MODULE, KBUILD_MODNAME)
+#define rpmi_tee_unregister(driver) \
+	rpmi_tee_driver_unregister(driver)
+
+#endif /* _LINUX_RPMI_TEE_H */

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
