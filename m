Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C881606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 13:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1+SWwRze;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DJzNn+wa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FqKSu5Cs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dsJxziRojDRQRYzTglauZ02hDl8x+YgRvHOqpGhPLWU=; b=1+SWwRzeKh0hoCFmZBHUaRj0lg
	TLYnTKjR0W1aEfoUsKUK20ucy1M7+b5bphEVcnyWUhpqgieUBo6vMvrxXa6x5a++sAKpLlpcuDFCr
	w797TPTRghCVCts+eKLAOc2ztE+5sLIPSW/VE/7FpeurGSJn96pr24L2ELgOuLRu02zaF1oQvzRJF
	EdUr/dry8RDlDc0FgAc5nm8L4EqlqxoHP07D/XjwqR6cbUr2sbNTceS7a8OAfGbf2fxu/LEMm+zVL
	o3fcT/iFTmC75denKWU2gEZ7/+gpIrryLbygMDp+dCSV3VVtysd9DYqwNK26iuS8kpYyNgaLDYWjd
	VtPsAOBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqNg-00000006bEY-0kRj;
	Tue, 24 Nov 2026 13:16:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqNS-00000006b98-15Xm
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 13:16:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AODAw6U1408627
	for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 13:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hBzVLClOSEG
	yAdU0kuKKVnfXtMFpmo67/NIzqOitKqQ=; b=DJzNn+waZmkIj6BE/F7JwVj7Te+
	GjssrSKgdIOEzhMVjWNmd1Zogre3jquEanDVlbV5bIBvtBKA1GQve7G/WBfKiszm
	FQDa6WCtnf4tAiyKh4eZ2g8kTZSlzk5U6aJyoivcFyWlvC/kxKpFEnRNy/sOPCLx
	OFriDS7nn9D4oL6p9mLMqzljgFTrT9x16RxQ/KS5FfSFirH4hCTfAnIo99iMgEEJ
	7JQlSi38JWG/DPxqu/a93/gtL/zmkKdqHy4mqkbzvKSW4dafwgKRVsIMhr2g8g0D
	YKiS7ikpzXGf8p2PCyhAnhY3/4BaiOkpmitTjhCbQfhp+85u7v5SIo+rEUg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b8000tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 13:16:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386ad819860so2177569eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 05:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795526164; x=1796130964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hBzVLClOSEGyAdU0kuKKVnfXtMFpmo67/NIzqOitKqQ=;
        b=FqKSu5Css8QesHf8OaxRWNc7GnFSBpQvW46N2rLcjMqIbz9ibho6WH0FX7KbjfS+qm
         4OXrPsbf6OkNWhHllgKene/fbU+bf5uyITqkUZUgn5id14urjaUdJNknB7B3VToi4Qd8
         OZ31bSVY/4GnKI23Wl6gQMoGscEz9VUoTfxaZNpu1oT+uEmyU/MQlS8Mrv8T8dQy3Krn
         oWp+ZAllzAjIanxSsL4+2kgNGRIvMoSoOSgkFNdJdCFPc2R2a4bEcc2RuLnbTY1198mE
         hVacBFp4JjveZ+2IeZwnEruCKoS8HAB4fBtsB2+2lbpWT1STwPuwf61zBSh1O3ydUJvi
         N5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526164; x=1796130964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hBzVLClOSEGyAdU0kuKKVnfXtMFpmo67/NIzqOitKqQ=;
        b=o1kTM6Ao+8plAeRSsTPyysDEd3TarTmBUluhm0VWB3D1sARY/NgUlXYAdheRsP8uMD
         UAnn4swdPCmt/D8s00XlK8ea4PYjoTKZqvv711eeBU6mUuKljdd2GrKz1yEb9oI6dU0u
         joaH+Kwiy+cjW2j2AAaU/AAbyjIia/rkze4Zyvx28GHd+m95YRjo/YMtRG6Tve2fUgCz
         nRLUrlOVKt2YUQrBaHHA1MCN6JuthugeY2LyxpvyrWXa8qZBPHFQr/I7JLf0cDBDjGia
         dYXu6dAA5f2WSZz4/oFZgTbIDrwVUozVdKSFDwQAYGCJXI5xsugeanTWN2UVj7OB2sjN
         QA9g==
X-Gm-Message-State: APuU4Z+HJraDi9MZ+CeoJ9cMudC8AkGggQ/gp/j85mpPezf2yh/W2NUR
	KXKBOIXfeNnx8x2fORA58Lu8jdl2Y4aWYdiszpSsp3MatLzlXLmD87Y1zwPJgyF715EBfym4Hae
	WOHiQRay7FsKpTXo7Z7Qbgk86s/09XET0RjO3qwx9YBMD611YS7RAvGGGmn5RiePHGvOjlyg=
X-Gm-Gg: AZFdTZfNVGYcPNBiPn9IAtr1MS6nJ153PMYcjU8VwNtq+kvgjjazf6q0cAhqbdi42rA
	OnEBCWoZdE9ZlfFf64RuDL058ztAPiVAV9vVSoNNGYavQvAgzs/YZozspZtiN/aArnOaZB/VaZP
	7CHqo0Gr8zyHm0gyFlGqvTLwEW1Xe7oFGJRBJ3jcRAwVIGrJgOuJpynvYqVUThUMQLc8wtOpiHc
	gNn4GQ7PBGcDGBmrvA9YD1e1zXOY8+OsOmcL/WztbMDrRFmwVJnkkSPlq+g3xqks6GfQcYiwvrf
	xuWoO7j0OXhfm2ZcENkdotfDr+IrshccMfb9Ngql/x4PKK6TyPbyN7lGQzLkPyiVwQgZBQ9Fixr
	VUq6L5YY4JGk5prxVSGo8SHRNfvg8bMxolexVNAfHoWVzoAnnuGVoI2unb8Y2Z53G8vxssJRY0Z
	KGlaDsiobjUSgWMSzymiRBG31UjJUyZDGNAQa+UWszBD0sATlBvxYf0GyQlzLeXg==
X-Received: by 2002:a05:693c:6205:b0:386:a498:3ab1 with SMTP id 5a478bee46e88-386a4983cc5mr10398633eec.25.1795526163595;
        Tue, 24 Nov 2026 05:16:03 -0800 (PST)
X-Received: by 2002:a05:693c:6205:b0:386:a498:3ab1 with SMTP id 5a478bee46e88-386a4983cc5mr10398574eec.25.1795526162685;
        Tue, 24 Nov 2026 05:16:02 -0800 (PST)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm56371320eec.4.2026.11.24.05.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:16:02 -0800 (PST)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        wim@linux-watchdog.org, linux@roeck-us.net,
        radim.krcmar@oss.qualcomm.com, anup@brainfault.org,
        anup.patel@oss.qualcomm.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, prajwal.n.oss@gmail.com,
        Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [RFC PATCH v4 2/2] drivers/watchdog: Add RISC-V SBI watchdog driver
Date: Tue, 24 Nov 2026 18:45:42 +0530
Message-ID: <20261124131542.613271-3-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124131542.613271-1-prajwal.n@oss.qualcomm.com>
References: <20261124131542.613271-1-prajwal.n@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MSBTYWx0ZWRfX0UgAI4V+tgxn
 zeyYYZdqKribo9ozBz1G8fiTRvJfdXwffKRwSnLHsdOJA6cxpxfVo1tUJKz35e7s8tHmdbgvfBj
 88PkYOEeIgvqOGBNnlaq6FGmQbDQ9IBUxMQtf0rALTjjJqIOpJUPZCxU/N0HJY28BzuJBxbFPLZ
 Pxk9yzp4tLcr2yiZ7rwXRcyOLOHS+L+ZDmE6V6Z3DGdPmME1cetX+/qj4ZXjqNH3Y6ppe6SZeMR
 hGK/oxfMTPByUDMHZHkyU2uqQ0eizgeJoQLwUGzRoQv8GqMwqlVAfvo9LO5LDEe75AOXbs5LH2N
 w730zw/BsJJwfD7SVOBKIjluCj0WMMShlTbpyhw7utYoQePIq+1U9KrnSHlHRRccTZ0AO+Ri2/I
 ZN30Ej0X5J0k4h9o3lA03nAMQgP+ty+D00s1GFmuLPsPmN+A04n8lSuelcJDUO7oqqzztRPhb0f
 CNgVjcBjnrFKCOSIBBg==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b058e15 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=0SxRSwYGAAAA:8 a=TyS6Ky86QTBuXj3fIXcA:9 a=O8hF6Hzn-FEA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=evtWB9OUeeBtXImRToD_:22
X-Proofpoint-ORIG-GUID: a87zqHm3Fq3SozAKjq73ZZXqK8MkAlOR
X-Proofpoint-GUID: a87zqHm3Fq3SozAKjq73ZZXqK8MkAlOR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MSBTYWx0ZWRfX9osSfBbI6GBY
 ToVV065bQxdvloRFh7dsLuiLMX5wC+uCNYwLQujcoabhBd0V5jiHOCydZDYzvdiZ7BQEgGn55si
 Zv7sHl29G34gEkOQBIhigfdlSixd2AE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_051615_392992_0D4CD262 
X-CRM114-Status: GOOD (  25.01  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a watchdog driver for the RISC-V SBI watchdog extension.
The driver integrates with the Linux watchdog framework to
configure and control the watchdog. The driver invokes the
SBI watchdog using the standard SBI calls.

Support pretimeout event notifications using Message Signaled
Interrupts (MSIs).

Signed-off-by: Prajwal N <prajwal.n@oss.qualcomm.com>
---
 drivers/watchdog/Kconfig         |  10 +
 drivers/watchdog/Makefile        |   1 +
 drivers/watchdog/riscv_sbi_wdt.c | 442 +++++++++++++++++++++++++++++++
 3 files changed, 453 insertions(+)
 create mode 100644 drivers/watchdog/riscv_sbi_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f7d0a0c2c0ef..d6b4e8ccd057 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -2164,6 +2164,16 @@ config STARFIVE_WATCHDOG
 	  Say Y here to support the watchdog of StarFive JH7100 and JH7110
 	  SoC. This driver can also be built as a module if choose M.
 
+config RISCV_SBI_WATCHDOG
+	tristate "RISC-V SBI based Watchdog support"
+	depends on RISCV_SBI
+	default RISCV
+	select WATCHDOG_CORE
+	help
+	  Say Y here to include support for a watchdog timer
+	  implemented by the Supervisor Binary Interface on RISCV platforms.
+	  Requires firmware support.
+
 # S390 Architecture
 
 config DIAG288_WATCHDOG
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 9ac406677aba..c20c43f06ed0 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -202,6 +202,7 @@ obj-$(CONFIG_WATCHDOG_RTAS) += wdrtas.o
 # RISC-V Architecture
 obj-$(CONFIG_ATCWDT200_WATCHDOG) += atcwdt200_wdt.o
 obj-$(CONFIG_STARFIVE_WATCHDOG) += starfive-wdt.o
+obj-$(CONFIG_RISCV_SBI_WATCHDOG) += riscv_sbi_wdt.o
 
 # S390 Architecture
 obj-$(CONFIG_DIAG288_WATCHDOG) += diag288_wdt.o
diff --git a/drivers/watchdog/riscv_sbi_wdt.c b/drivers/watchdog/riscv_sbi_wdt.c
new file mode 100644
index 000000000000..8e3db9854788
--- /dev/null
+++ b/drivers/watchdog/riscv_sbi_wdt.c
@@ -0,0 +1,442 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RISC-V SBI watchdog driver
+ *
+ * Copyright (C) 2026 Qualcomm Inc.
+ */
+
+#include <linux/device.h>
+#include <asm/sbi.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+#include <linux/watchdog.h>
+#include <linux/msi.h>
+#include <linux/kernel.h>
+#include <linux/of_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/irqchip/riscv-imsic.h>
+
+#define DRV_NAME            "riscv-sbi-wdt"
+#define DRV_VERSION         "1.0"
+
+/* Watchdog default timeout in seconds */
+#define SBI_WATCHDOG_DEFAULT_TIMEOUT		60
+
+/* MSI capability mask */
+#define SBI_WATCHDOG_CAP_MSI_SUPPORT_MASK	BIT(1)
+
+/* Convert second to microsecond */
+static inline u32 sec_to_usec(unsigned int sec)
+{
+	return (u32)(sec * 1000000ULL);
+}
+
+/* Convert microsecond to second and ceil the result */
+static inline unsigned int usec_to_sec_ceil(u32 usec)
+{
+	return (unsigned int) DIV_ROUND_UP_ULL(usec, 1000000ULL);
+}
+
+/* Convert microsecond to second and floor the result */
+static inline unsigned int usec_to_sec(u32 usec)
+{
+	return (unsigned int) (usec / 1000000ULL);
+}
+
+/* SBI watchdog attributes */
+struct sbiwdt_attributes {
+	/* MSI and SSE capability flags */
+	u32 wdt_capability;
+	/* Watchdog state */
+	u32 wdt_state;
+	/* Minimum watchdog timeout supported in us */
+	u32 wdt_min_period;
+	/* Watchdog timeout period in us */
+	u32 wdt_period;
+	/* Time left until watchdog expiry in us */
+	u32 wdt_time_left;
+	/* Watchdog pretimeout in us */
+	u32 wdt_notif_time;
+	/* MSI target address low 32-bit */
+	u32 wdt_notif_msi_addr_low;
+	/* MSI target address high 32-bit */
+	u32 wdt_notif_msi_addr_high;
+	/* MSI data */
+	u32 wdt_notif_msi_data;
+};
+
+/* SBI watchdog global structure */
+struct sbiwdt {
+	/* Kernel watchdog instance */
+	struct watchdog_device          wdd;
+	struct sbiwdt_attributes        attrs;
+	int                             virq;
+};
+
+/* Watchdog pretimeout expiry handler */
+static irqreturn_t sbiwdt_pretimeout_handler(int irq, void *dev_id)
+{
+	struct sbiwdt *wdt = dev_id;
+
+	watchdog_notify_pretimeout(&wdt->wdd);
+
+	return IRQ_HANDLED;
+}
+
+/* Read watchdog attribute */
+static int sbiwdt_read_attribute(enum sbi_ext_wdt_attribute_id attr_id, u32 *attr_val)
+{
+	struct sbiret sret;
+
+	sret = sbi_ecall(SBI_EXT_WDT, SBI_EXT_WATCHDOG_READ_ATTRIBUTE, attr_id, 0, 0, 0, 0, 0);
+	*attr_val = sret.value;
+
+	return sbi_err_map_linux_errno(sret.error);
+}
+
+/* Write watchdog attribute */
+static int sbiwdt_write_attribute(enum sbi_ext_wdt_attribute_id attr_id, u32 val)
+{
+	struct sbiret sret;
+
+	sret = sbi_ecall(SBI_EXT_WDT, SBI_EXT_WATCHDOG_WRITE_ATTRIBUTE, attr_id, val, 0, 0, 0, 0);
+
+	return sbi_err_map_linux_errno(sret.error);
+}
+
+/* Write the MSI address and data attributes in one SBI call*/
+static int sbiwdt_write_notif_msi_message(u32 msi_addr_low, u32 msi_addr_high, u32 msi_data)
+{
+	struct sbiret sret;
+
+	sret = sbi_ecall(SBI_EXT_WDT, SBI_EXT_WATCHDOG_WRITE_NOTIF_MSI_MESSAGE, msi_addr_low,
+								msi_addr_high, msi_data, 0, 0, 0);
+
+	return sbi_err_map_linux_errno(sret.error);
+}
+
+/* Start the watchdog */
+static int sbiwdt_start(struct watchdog_device *wdd)
+{
+	struct sbiret sret;
+
+	sret = sbi_ecall(SBI_EXT_WDT, SBI_EXT_WATCHDOG_START, 0, 0, 0, 0, 0, 0);
+
+	return sbi_err_map_linux_errno(sret.error);
+}
+
+/* Stop the watchdog */
+static int sbiwdt_stop(struct watchdog_device *wdd)
+{
+	struct sbiret sret;
+
+	sret = sbi_ecall(SBI_EXT_WDT, SBI_EXT_WATCHDOG_STOP, 0, 0, 0, 0, 0, 0);
+
+	return sbi_err_map_linux_errno(sret.error);
+}
+
+/* Pat the watchdog */
+static int sbiwdt_pat(struct watchdog_device *wdd)
+{
+	struct sbiret sret;
+
+	sret = sbi_ecall(SBI_EXT_WDT, SBI_EXT_WATCHDOG_PAT, 0, 0, 0, 0, 0, 0);
+
+	return sbi_err_map_linux_errno(sret.error);
+}
+
+/* Set the watchdog timeout value */
+static int sbiwdt_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
+{
+	struct sbiwdt *wdt = watchdog_get_drvdata(wdd);
+	u32 period_usec;
+	int ret;
+
+	if (timeout <= wdt->wdd.pretimeout)
+		return -EINVAL;
+
+	period_usec = sec_to_usec(timeout);
+
+	ret = sbiwdt_write_attribute(SBI_WATCHDOG_PERIOD, period_usec);
+	if (ret)
+		return ret;
+
+	wdt->attrs.wdt_period = period_usec;
+	wdt->wdd.timeout = timeout;
+
+	return 0;
+}
+
+/* Set the watchdog pretimeout value*/
+static int sbiwdt_set_pretimeout(struct watchdog_device *wdd, unsigned int pretimeout)
+{
+	struct sbiwdt *wdt = watchdog_get_drvdata(wdd);
+	u32 notif_time_usec;
+	int ret;
+
+	if (pretimeout >= wdd->timeout)
+		return -EINVAL;
+
+	notif_time_usec = sec_to_usec(pretimeout);
+	ret = sbiwdt_write_attribute(SBI_WATCHDOG_NOTIF_TIME, notif_time_usec);
+	if (ret)
+		return ret;
+
+	wdt->wdd.pretimeout = pretimeout;
+	wdt->attrs.wdt_notif_time = notif_time_usec;
+
+	return ret;
+}
+
+/* Get the watchdog timeleft before expiry */
+static unsigned int sbiwdt_get_timeleft(struct watchdog_device *wdd)
+{
+	struct sbiwdt *wdt = watchdog_get_drvdata(wdd);
+	unsigned int time_left_usec;
+	int ret;
+
+	ret = sbiwdt_read_attribute(SBI_WATCHDOG_TIME_LEFT, &time_left_usec);
+	if (ret) {
+		dev_err(wdt->wdd.parent, "Failed to read watchdog time left: %d\n", ret);
+		return 0;
+	}
+
+	return usec_to_sec(time_left_usec);
+}
+
+static const struct watchdog_info sbiwdt_info = {
+	.options	=	WDIOF_SETTIMEOUT	|
+				WDIOF_KEEPALIVEPING	|
+				WDIOF_MAGICCLOSE,
+	.identity	=	DRV_NAME,
+};
+
+static const struct watchdog_info sbiwdt_pretimeout_info = {
+	.options	=	WDIOF_SETTIMEOUT		|
+				WDIOF_KEEPALIVEPING		|
+				WDIOF_MAGICCLOSE		|
+				WDIOF_PRETIMEOUT,
+	.identity	=	DRV_NAME,
+};
+
+static const struct watchdog_ops sbiwdt_ops = {
+	.owner		= THIS_MODULE,
+	.start		= sbiwdt_start,
+	.stop		= sbiwdt_stop,
+	.ping		= sbiwdt_pat,
+	.set_timeout	= sbiwdt_set_timeout,
+	.set_pretimeout	= sbiwdt_set_pretimeout,
+	.get_timeleft	= sbiwdt_get_timeleft,
+};
+
+/* The callback function from IMSIC containing the MSI address and data */
+static void sbiwdt_msi_write(struct msi_desc *desc, struct msi_msg *msg)
+{
+	int ret;
+	struct device *dev = msi_desc_to_dev(desc);
+	struct sbiwdt *wdt;
+
+	if (!dev || !msg)
+		return;
+
+	wdt = dev_get_drvdata(dev);
+	if (!wdt) {
+		dev_err(dev, "Missing SBI watchdog driver data\n");
+		return;
+	}
+
+	/* Store MSI info in attributes*/
+	wdt->attrs.wdt_notif_msi_addr_low = msg->address_lo;
+	wdt->attrs.wdt_notif_msi_addr_high = msg->address_hi;
+	wdt->attrs.wdt_notif_msi_data = msg->data;
+
+	/* Pass the MSI attribute values to OpenSBI */
+	ret = sbiwdt_write_notif_msi_message(wdt->attrs.wdt_notif_msi_addr_low,
+						wdt->attrs.wdt_notif_msi_addr_high,
+						wdt->attrs.wdt_notif_msi_data);
+	if (ret) {
+		dev_err(dev, "Failed to configure watchdog MSI: %d\n", ret);
+		return;
+	}
+}
+
+/* Initialize the watchdog attributes */
+static int sbiwdt_init_attributes(struct sbiwdt *wdt)
+{
+	int ret;
+	u32 attr_val;
+	u32 timeout_usec;
+
+	/* Read watchdog capability from firmware */
+	ret = sbiwdt_read_attribute(SBI_WATCHDOG_CAPABILITY, &attr_val);
+	if (ret)
+		return ret;
+
+	wdt->attrs.wdt_capability = attr_val;
+
+	/*
+	 * Read watchdog min period supported in firmware
+	 * The firmware ensures the MIN_PERIOD is in valid range
+	 */
+	ret = sbiwdt_read_attribute(SBI_WATCHDOG_MIN_PERIOD, &attr_val);
+	if (ret)
+		return ret;
+
+	if (!attr_val)
+		attr_val = 1;
+
+	wdt->attrs.wdt_min_period = attr_val;
+	wdt->wdd.min_timeout = usec_to_sec_ceil(wdt->attrs.wdt_min_period);
+
+	/* Initialize the watchdog timeout to default value */
+	timeout_usec = sec_to_usec(SBI_WATCHDOG_DEFAULT_TIMEOUT);
+	ret = sbiwdt_write_attribute(SBI_WATCHDOG_PERIOD, timeout_usec);
+	if (ret)
+		return ret;
+
+	wdt->attrs.wdt_period = timeout_usec;
+	wdt->wdd.timeout = SBI_WATCHDOG_DEFAULT_TIMEOUT;
+	wdt->wdd.max_timeout = U32_MAX / USEC_PER_SEC;
+
+	/*
+	 * Initialize the pretimeout to default value
+	 * The firmware ensures the pretimeout init value is 0
+	 */
+	wdt->attrs.wdt_notif_time = 0;
+	wdt->wdd.pretimeout = 0;
+
+	return 0;
+}
+
+/* Callback from devm for MSI cleanup */
+static void sbiwdt_msi_free_irqs(void *dev)
+{
+	platform_device_msi_free_irqs_all((struct device *) dev);
+}
+
+static int sbiwdt_probe(struct platform_device *pdev)
+{
+	struct sbiwdt *wdt;
+	const struct imsic_global_config *imsic_global;
+	struct irq_domain *msi_domain;
+	struct device *dev = &pdev->dev;
+	int rc;
+
+	/* Allocate memory for the global watchdog structure */
+	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
+	if (!wdt)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, wdt);
+	watchdog_set_drvdata(&wdt->wdd, wdt);
+
+	/* Initialiaze watchdog attributes */
+	rc = sbiwdt_init_attributes(wdt);
+	if (rc)
+		return dev_err_probe(dev, rc, "Failed to read SBI watchdog attributes\n");
+
+	wdt->wdd.parent = dev;
+	wdt->wdd.info = &sbiwdt_info;
+	wdt->wdd.ops = &sbiwdt_ops;
+
+	watchdog_stop_on_unregister(&wdt->wdd);
+	watchdog_stop_on_reboot(&wdt->wdd);
+
+	/* Setup MSI if the capability is available */
+	if (wdt->attrs.wdt_capability & SBI_WATCHDOG_CAP_MSI_SUPPORT_MASK) {
+		imsic_global = imsic_get_global_config();
+		if (!imsic_global)
+			return dev_err_probe(dev, -ENODEV, "IMSIC firmware node is unavailable\n");
+
+		msi_domain = irq_find_matching_fwnode(imsic_global->fwnode,
+							DOMAIN_BUS_PLATFORM_MSI);
+
+		if (!msi_domain)
+			return dev_err_probe(dev, -ENODEV,
+					     "IMSIC platform MSI domain is unavailable\n");
+
+		dev_set_msi_domain(&pdev->dev, msi_domain);
+
+		/* MSI setup */
+		rc = platform_device_msi_init_and_alloc_irqs(dev, 1, sbiwdt_msi_write);
+		if (rc)
+			return dev_err_probe(dev, rc, "Failed to allocate MSIs\n");
+
+		/* Register with devm the MSI cleanup callback */
+		rc = devm_add_action_or_reset(dev, sbiwdt_msi_free_irqs, dev);
+		if (rc)
+			return dev_err_probe(dev, rc, "Failed to add sbiwdt MSI cleanup\n");
+
+		/* Enable pretimeout only when the MSI is allocated */
+		wdt->wdd.info = &sbiwdt_pretimeout_info;
+
+		wdt->virq = msi_get_virq(dev, 0);
+		if (!wdt->virq)
+			return dev_err_probe(dev, -ENODEV, "Failed to get MSI virtual IRQ\n");
+
+		rc = devm_request_irq(dev, wdt->virq,
+					sbiwdt_pretimeout_handler,
+					0, "sbiwdt-pretimeout", wdt);
+		if (rc)
+			return dev_err_probe(dev, rc, "Failed to request pretimeout IRQ\n");
+	}
+
+	rc = devm_watchdog_register_device(dev, &wdt->wdd);
+	if (rc)
+		return dev_err_probe(dev, rc, "Failed to register RISC-V SBI watchdog device\n");
+
+	dev_info(&pdev->dev, "RISC-V SBI Watchdog registered\n");
+
+	return 0;
+}
+
+static struct platform_driver sbiwdt_driver = {
+	.driver = {
+			.name = DRV_NAME,
+	},
+	.probe  = sbiwdt_probe,
+};
+
+static struct platform_device *sbiwdt_pdev;
+
+static void __exit sbiwdt_exit(void)
+{
+	platform_device_unregister(sbiwdt_pdev);
+	platform_driver_unregister(&sbiwdt_driver);
+}
+
+static int __init sbiwdt_init(void)
+{
+	int ret;
+	struct platform_device *pdev;
+
+	/* Probe for SBI WDT extension */
+	if (sbi_spec_version < sbi_mk_version(3, 0) ||
+		sbi_probe_extension(SBI_EXT_WDT) <= 0) {
+		return -ENODEV;
+	}
+
+	ret = platform_driver_register(&sbiwdt_driver);
+	if (ret)
+		return ret;
+
+	pdev = platform_device_register_simple(DRV_NAME, -1, NULL, 0);
+	if (IS_ERR(pdev)) {
+		platform_driver_unregister(&sbiwdt_driver);
+		return PTR_ERR(pdev);
+	}
+
+	sbiwdt_pdev = pdev;
+
+	return 0;
+}
+late_initcall(sbiwdt_init);
+module_exit(sbiwdt_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Prajwal N <prajwal.n@oss.qualcomm.com>");
+MODULE_DESCRIPTION("RISC-V SBI Watchdog Driver");
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
