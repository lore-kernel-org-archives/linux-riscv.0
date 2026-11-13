Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA52606A88D
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 12:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qKuaqSAZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BJI3Nn3D;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bCK+OWp0;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ODCDwNyB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HOYc/CjHcIkQxczFMTaWL3j+EBez2hROkbGAtTA0W5A=; b=qKuaqSAZq/nTtNvZpAjrMi8ywL
	EXjm7a7nho3WpNDo3wIyINIE9tWAz6mPRShJe7+jLVkfjg6tMnVJnkqJeCTVy9yEw7sdawANi7+hk
	aAEFoES+Km10BT4v0QleY//45+5xWNe31EKyKQNeQLTzIxMHW48zv4C5FpnMlkImnXIpkEyBPUvuj
	IPKNVvbwcXDosoHtMcP8/tODi1Pr+tcJBnyoAiJWf8wdyyFcsq1q9Rpmydrz7qy/eIso73mKHtwI4
	gH8gNYjLGl5EX+ksw7r5Nu1PWS4b6RiQ//nsgMWahhahhlB1NhEekzDBSbatNPSEzuxbJ402NCNsf
	7FfujcVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqG0-0000000Chiv-07Q5;
	Fri, 13 Nov 2026 12:19:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFy-0000000ChgW-1LhT
	for linux-riscv@bombadil.infradead.org;
	Fri, 13 Nov 2026 12:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=B/nngffQbnxE8edZgYDkfDF569XKTL0+U5/3nMBa/VQ=; b=BJI3Nn3DuLvhNVUhUt66mSGMVT
	CbQ2ASPM0wLNZUH1g9ZC23xrd3sCcFAHSxbAUJm+TP+7/nvavgf2kfrBmxDNFBb/rq0mYCClXY2uY
	y3nlMEqVFmBr49YNMeoAGZXzKm6MD3yfc2zGDFxy6Nu++G3RdwlF4di+c2KcI/ZEsnQTAIQ0S6AcD
	sQzsNe15Ki/w9RWqs49VQZCNLQQG2t7fawKgIk7erspY0WM/geIio/KM9zWYqT7vWoMvGvoX0L2TW
	gKjx/WE6IK4jEX8ItyGK1OZyG5cxpu4+PpYZ+ZwnICWxZOXjgNXOR0sOU1IgPnesY8IBLzJvGOaPe
	F0tIfawg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFr-0000000BEQm-0ENU
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 12:19:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJVUH3772063
	for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 12:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B/nngffQbnx
	E8edZgYDkfDF569XKTL0+U5/3nMBa/VQ=; b=bCK+OWp0G5lHhVe6YfUnn5l7N+C
	pA1AG8jbKad8bV0AqIqT6P9gVCl7OQAxy5M9MZAbXq5vXEsetliPTbcBNHWdV8Mj
	WE9GFw4V0Qag4OfOAbdAF370oEeGb5nxpHrCw4OPR0iViCWzygPIkCImHhMPTtUK
	LiQeHwjUmWZTIoC/DE3yUPQoL9xdZejvYghofWFw0zS19SE4XNceA+eSuqEhpCOv
	3Y10/omFZGSFj9vlf5q3e7c8Q5nhz7VzAU678iySXg4tPwTme37bBTv9xPEIbCtg
	uzYAaDQfUMdCMGKqfvLWMiqdvvgpUqbluy1vwKqkOBlnE/xPTzPn8r/2O3A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2msnef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 12:19:39 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b5b49cabso828075c88.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 04:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794572379; x=1795177179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B/nngffQbnxE8edZgYDkfDF569XKTL0+U5/3nMBa/VQ=;
        b=ODCDwNyB8nIdGVSVNneWnSpem/95cS8pJy5OgL3tj8EXD1cuPhCnQqztSJ8OI1SWSd
         vGEypXJKG82u7mlaLnz/lg5XbRBHRGDmVP0D4RD6uS6iNL8KrDC5cgs2Wm8SCvcz/GKp
         7zck4+zZ3xawrM76qCFh8SqRCuPIWNwEqxexCSA8uhVem9B7uZ987xxjyhei09TwBfjN
         KaykvL5hN4zE5d0BcJWKbC+9u0kOZtfORSfelQGdhnHyvhCnTZG4N2DYFGRlPcaeEVHD
         QBsck7mrnsYLA9Tkuxb3Rej9IozlIz1e36khUh1ssGEFn64/aMzGL6bUlT3WnFa7O0j2
         zthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572379; x=1795177179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B/nngffQbnxE8edZgYDkfDF569XKTL0+U5/3nMBa/VQ=;
        b=jmv4uvwPr66HcRte/83zqn3baFwKMS8hbT01dcA8B16EcPRRCdXhlLj33nDFRD42GM
         vdUBiSNfK26/G9q03T8cJviJGeL08fE3INGa6NXZOW65AlttoqNo213iB/jfMmYWJMpw
         tuqkV7Xvx74YUUxPPMtPj7DiC1IGZM9qBx1qIfzWsRVt7antfooNethsz+pmrtalwWw9
         22D0Mi/hRQLVslRM7e2CPyi1dzsbr08loSDu1uNYIUAluiEHNTyRImxquInoTbG774tY
         Az7I2csAOLDVKsWCXm9Po8hv0ydi/QKEX63UeFXLvLQK1srEmKPunJ0YyYlghGF36+yq
         xTWw==
X-Gm-Message-State: APuU4Z+N3gLL4XxQUpeMJorW/zz47GaryWpRPOXY/00I7lGlA2hfY80/
	xy42sBttqhR8flsJQ1mTlopEOaUretM90m0sto4ez1jVMEGna1mtoSsWjZt4lbJkuuoMyxIL/z0
	bm+cKXEI/LRqCMdq1pVjKRIm6EiHjpEK6fgk8Eicw/L+xdHsfqb3ghYQkROd+uZxcDwyZybuJDa
	ML9Qs=
X-Gm-Gg: AYBFou0H7b2EJ0MbJOo9bJsVa4LH+OjmCYg0hZ0H+8nAJVN3WY2DE/N9ekyVd5MTEH7
	jQz63Q1+d6Z8B4EgaS8Yy9RZhl78E2/RyoYNbtlsIjERzI3fq4p171Y8ujLrJ/znMbEZt+kyG1x
	l2zWGuas+xIlMcMzU2kNCTqVS5wxh/yGFlNphe2o61YKx+iUgFRqbIRVMLJRfDdrdGjY4wZopyY
	NiQEuiVzRrC4OrQuHexUVrSrc45jPmtaMLIJx5MR9RCpSQH2YWm+33ZevmIWdD08KDXT1Z0b6G4
	6KXyOdYZuRLPEv42d/FA5cEVeDghfDUfFRhrjhUlt8zJwgQ7HHsqhHQj0kkepoelJVe6KUT3oqw
	WzKD//PCs/nvsfDljclSN0eKE88o8RJ7MtsMvCJ3J9nzUK9u9DcCuPTWYtteYzr1ajcWkiwYPrg
	kzBtz40joFLkVN+6DXGyioVxLfJNteXdLloLN79gW66ZFLhqLB1SoX3wj7wosP
X-Received: by 2002:a05:7022:eb47:20b0:144:e246:a0b2 with SMTP id a92af1059eb24-1b50315729cmr2458877c88.44.1794572378713;
        Fri, 13 Nov 2026 04:19:38 -0800 (PST)
X-Received: by 2002:a05:7022:eb47:20b0:144:e246:a0b2 with SMTP id a92af1059eb24-1b50315729cmr2458857c88.44.1794572378050;
        Fri, 13 Nov 2026 04:19:38 -0800 (PST)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm6423629c88.7.2026.11.13.04.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:19:37 -0800 (PST)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        wim@linux-watchdog.org, linux@roeck-us.net,
        radim.krcmar@oss.qualcomm.com, anup@brainfault.org
Cc: linux-riscv@lists.infradead.org, linux-watchdog@vger.kernel.org,
        prajwal.n.oss@gmail.com, Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [RFC PATCH v2 2/2] drivers/watchdog: Add RISC-V SBI watchdog driver
Date: Fri, 13 Nov 2026 17:48:57 +0530
Message-ID: <20261113121857.1640918-3-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113121857.1640918-1-prajwal.n@oss.qualcomm.com>
References: <20261113121857.1640918-1-prajwal.n@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: malq7fyCg9ny0b1TXXG1fDbWinhlEJa1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfXx0kOUMBYlyLx
 PnlYpLP+qVtuHN22T/3/BrsrmFLTI7BOjQTYE6Y3mxvtvcy79uJRIuL53NMyWDSc4Tt9mJw/BY8
 I6FthSUBWC3v7vfKukHMJD2pMcL05hbfIQfmiROob5Rg8FKIoevOrmlUngaILimY27AxWmZ1QvR
 wo67qploWmBhwXTouvXbxKIMMAv4Ky3k3UW8OxofO4JoT1zgA/T2CmyosTvmr+wFdeOWHE3CXas
 NrsIRWTwySzuMO20BNxVANGDdfaxDUBFn0fdKOv7A4viPKAEqRNpiX3pzdviIono7wCkBZ0piRO
 sOwJehp+JyMxuILYxUUZJLE36cY5A0YLMrweIASLCPfJUcoVdmTmPyGP4bAzsWYY48Gkeu9xO+S
 /16FISBRub9BZ/x9BdmoU+diBfbfTFh0wtsbp6esoumMIDw4gAmxI01dtKJV6BrI+WmDxAaU/E3
 Tkr/iZ9i9fPluBkXxow==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfXz05ZAM0MBwnw
 a4GQGTxfetwMyMy2YYl1xyxQzbIjdZfy1cQ0gn8WHfz+Fto3R6NrrSR9yxsaQ1sq4t0gVEhHW75
 FhNux2sm5OCmgZXW7XLFlyy7AVctnbw=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af7005b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=0SxRSwYGAAAA:8 a=TyS6Ky86QTBuXj3fIXcA:9 a=O8hF6Hzn-FEA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=evtWB9OUeeBtXImRToD_:22
X-Proofpoint-GUID: malq7fyCg9ny0b1TXXG1fDbWinhlEJa1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_121943_318858_2BCD2E8B 
X-CRM114-Status: GOOD (  25.19  )
X-Spam-Score: -0.9 (/)
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

Add the RISCV_SBI_WATCHDOG Kconfig option, which depends on
RISCV and RISCV_SBI support.

Add a watchdog driver for the RISC-V SBI watchdog extension.
The driver integrates with the Linux watchdog framework to
configure and control the watchdog. The driver invokes the
SBI watchdog using the standard SBI calls.

Support pretimeout event notifications using Message Signaled
Interrupts (MSIs).

Signed-off-by: Prajwal N <prajwal.n@oss.qualcomm.com>
---
 drivers/watchdog/Kconfig         |   9 +
 drivers/watchdog/Makefile        |   1 +
 drivers/watchdog/riscv_sbi_wdt.c | 435 +++++++++++++++++++++++++++++++
 3 files changed, 445 insertions(+)
 create mode 100644 drivers/watchdog/riscv_sbi_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f7d0a0c2c0ef..69dce9b7f164 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -2164,6 +2164,15 @@ config STARFIVE_WATCHDOG
 	  Say Y here to support the watchdog of StarFive JH7100 and JH7110
 	  SoC. This driver can also be built as a module if choose M.
 
+config RISCV_SBI_WATCHDOG
+	tristate "RISC-V SBI based Watchdog support"
+	depends on RISCV_SBI
+	default RISCV
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
index 000000000000..577756f152ce
--- /dev/null
+++ b/drivers/watchdog/riscv_sbi_wdt.c
@@ -0,0 +1,435 @@
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
+	/* Read watchdog min period supported in firmware */
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
+	/* Initialize the pretimeout to default value */
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
+		dev_err_probe(dev, rc, "Failed to read SBI watchdog attributes\n");
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
+			dev_err_probe(dev, -ENODEV, "IMSIC firmware node is unavailable\n");
+
+		msi_domain = irq_find_matching_fwnode(imsic_global->fwnode,
+							DOMAIN_BUS_PLATFORM_MSI);
+
+		if (!msi_domain)
+			dev_err_probe(dev, -ENODEV, "IMSIC platform MSI domain is unavailable\n");
+
+		dev_set_msi_domain(&pdev->dev, msi_domain);
+
+		/* MSI setup */
+		rc = platform_device_msi_init_and_alloc_irqs(dev, 1, sbiwdt_msi_write);
+		if (rc)
+			dev_err_probe(dev, rc, "Failed to allocate MSIs\n");
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
+			dev_err_probe(dev, -ENODEV, "Failed to get MSI virtual IRQ\n");
+
+		rc = devm_request_irq(dev, wdt->virq,
+					sbiwdt_pretimeout_handler,
+					0, "sbiwdt-pretimeout", wdt);
+		if (rc)
+			dev_err_probe(dev, rc, "Failed to request pretimeout IRQ\n");
+	}
+
+	rc = devm_watchdog_register_device(dev, &wdt->wdd);
+	if (rc)
+		dev_err_probe(dev, rc, "Failed to register RISC-V SBI watchdog device\n");
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
