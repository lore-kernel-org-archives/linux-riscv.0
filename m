Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4090C98310
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 07:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhUZ4JxdvlU84Pf309svJuCVZEBJzqdHJym2ILgr+4Q=; b=x7KZjiK3dCuBVY
	e6lZ9cf1/98XDfpPZmVwa/kQE36i2DgvUD3/OHDfoLIbDjC0RQzXXFJMy2TWjlHUz/aCnw3CMVADx
	NdoVw6HATJvEJp7WCvLyvAgt8+DxB8k2oSbWjO0x1WWW9FA/uZ/LCR8kxwuzxSsIaDmbLwFipzQ6X
	mBNdtn1ZfBcqdvHGN1pmL4pun/Xlh+4NHtbtM/h6Vxpn2baCra6zDhHTN9vdu/m1loIluACB0b9LU
	bScWUbLVdw0wslMPxBt7aKnqIWVUvoN6/9mWXTezYBiWoUUpnqYXCeuBtGNHEH5a0LG76C3bZI0m6
	Hc5i+SPjaNmCSTxP3HUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e2U-0000000AJVu-3pEh;
	Thu, 24 Sep 2026 07:38:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e2B-0000000AJPO-0sbz
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Sep 2026 07:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/RXRnwPgf5Yg8j/qRJh/Q3brJCXnytYSbNn+jc5b4gc=; b=fG07+zUl0pGH62eV/88vECxGAs
	8L+47iMxA45bEKlkdy3f4nJ+CzDv7byxGSZoDQTYrAJ0VRB0PrSfDR7A9sjM2M7OREjrVpCeIDv4x
	v0f04SVYaW7VleWdMu1P+TsHICUznp5+jpoTLWBKWiOM01Tgb/wVAYfGncbpO+XWclToesHemKxl6
	bYI2jgp/QoEMHiDY0mXGJFW+lIou8jo8OtsM1odEygSnuA9zwmmmY5LqYKaa5JW981xYCYlf75oqI
	LqIPnroS9rkryVYGG2xb8nlfaCraNgSXFTAIFFrxM6ZqShR0NSppPc+Ja9v0hF7Fu8LjevFPkb7hl
	6bT9AIbg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e23-0000000FnuV-36L9
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 07:38:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eBUV772439
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/RXRnwPgf5Y
	g8j/qRJh/Q3brJCXnytYSbNn+jc5b4gc=; b=jA3sior+8hRuvHeZRTnB3RAc9I2
	4TOd7c2N4LQBAYwzlrZ0Bd/lNVCKDT/MDMRzrFoxVKCSQapjRxvRqZBrJMo8/OTV
	glLQxAT8rP6R+UQk9/yEiOjrotSlvKge01suU1eTsPaRcnAI1fXChx6SMjYiAxDw
	gXJ3jFN5WC1X5XAzakAqBij1zjdyvaI0APC/086OaoDC+8RojYjOCCL7RGwyebcM
	ocIjJuGwK5i4lCK5VM3AvEDsYu8/hPnpLmZiHaF6zE4gj6R6kyCgjfqc3C5K/8zJ
	v/D8UWc6/otMkVmfNgmx4flb38Cu3Sn4aQtpGMDqH9wDKmE3cIS442U+QVg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr909n3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:38:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so2848357eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 00:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235489; x=1790840289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RXRnwPgf5Yg8j/qRJh/Q3brJCXnytYSbNn+jc5b4gc=;
        b=ESVasW1oJZIj2AzNgbTtHHHe7GLnCnhjkrzsUldBhh5ZHhDlOnzEmSfYMcazAc4N8t
         UyeJ5TmSSJ141vb7DT4hYEhGVP/KlLZGjji7rfTnzcoMZIjjxlhL17X3GejYN8H0GogQ
         WHaw4HltbqYDQ3/n9T7c6j6fxh/A2gR+MhbglZCQTlO7VE1Frg5DcYsOKgohTBeJyM5Z
         YKBU1PqVDZgrqpAzLwOV7E21FZj6FBESns45Ja+T8K/FYfh9ESVb/8FwbepZ8JBWOEML
         h+x8k417eEH4WycmoN+FNciN68U+lWXQrAD7ye/7ijDbGKNUk6LeusPx9FP5Jk1MOBbT
         fAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235489; x=1790840289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/RXRnwPgf5Yg8j/qRJh/Q3brJCXnytYSbNn+jc5b4gc=;
        b=N5cmxUJow31A3vxjV5dhChvxKz5SXSDB/UqaUPsr19UUPt2quC08yuhnrBYhrZZOsR
         jScSZN0Dk/HTwm74rsopnboCpUtyQNpQBSrqSMUor73DOTgJXLknbG5pXaCToLGMRbJF
         JxlMco2jCLH/9CUav7TMcHJT8aHN3W7k84DzbqRJ4SrngjGArYyVqn6cwHQPbbGq4TXD
         Rc+3SVbaAatoTe0V56v7mIuljCkMtCC1AQ/uLCjtwcfoke0f3x4y54mkXrqYZl6kP/a9
         gNOlv+Eu2M1nmhyb8R7gdowO9dcDeZSZPyXVU5Pa3+hKuw57Mtu1Ii1Uvib8++HDqF8T
         OwaQ==
X-Gm-Message-State: AFuF++nbctjP8Lq+NkxGQ7LXNdDKD9HNa4oqWhmzuB/b3V43xDqxGnFp
	vn2+ZZG5pOmF6F4nCbdQRLeAEdbygjQaWxPP0nMclwU7mMtEj2F/5yEML9YbpGEhpNKX7eKdc2i
	opASaJvceyxlq6UVU1PAUQncl2M3xIxjOVJ4SQ16lWSYxHSvX1GASAf4pPofmcawqL+KZdIk7+r
	RecG0=
X-Gm-Gg: AYBFou2mGBkAGqhOc2jPwFAvWd720+aNacRXl8m+B+qQR1+SSSNbj+BFRhaQhJfeeWn
	HNMILQZJbK65a26l/EbJKc6AlZF9xasO12i8trMETi7LiBoFDbwROmCKwBCQJL0A2AYYKCIIY3y
	U2KkKycuDM/GQ9RhfvBvMIU7Zxab8UjD9JF8KZt+OjvT9QpPs9CcWprg2Yq8LbqecyjdJfn6na7
	VXmddDoRB9yigkI7AxyHMtuScBdde1HEj0c1gtg6lQwxH3FcmuVYvzFK+86kZtmwcUqKxUh57gg
	OUAPZp+qFi/MLfEiEC/+J2lfOJdljKe687kcXcNytzbyYdid80QM1zb2NL3Ea9s8KuFkoqUSojL
	9doI9XNnf2zbHsDJZ8bcuwAoZi8wrA+UT4h5V/PbmZQ8mlVgPw+s9Db13k295fs9sDBHFBOXanr
	cN0UN9EO2B0vaKydkn/fUaTDK+
X-Received: by 2002:a05:693c:88d0:10b0:33f:155c:e8f9 with SMTP id 5a478bee46e88-34004a899e7mr1248801eec.14.1790235489012;
        Thu, 24 Sep 2026 00:38:09 -0700 (PDT)
X-Received: by 2002:a05:693c:88d0:10b0:33f:155c:e8f9 with SMTP id 5a478bee46e88-34004a899e7mr1248756eec.14.1790235488231;
        Thu, 24 Sep 2026 00:38:08 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7cfd9sm12120680eec.5.2026.09.24.00.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:38:07 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org
Cc: acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com, ardb@kernel.org,
        conor@kernel.org, james.morse@arm.com, lenb@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robert.moore@intel.com,
        sunilvl@oss.qualcomm.com, tony.luck@intel.com,
        zhangzhanpeng.jasper@bytedance.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v5 7/9] riscv: Introduce HEST SSE notification handlers
Date: Thu, 24 Sep 2026 13:07:12 +0530
Message-ID: <20260924073714.1650588-8-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX43NLLEnkWw9q
 JaB3EqLXfhWSZkgRiagEWbZM1xDog6eLx9QcmWZvGpqztfQB9hrUo2CTSTbjXOY8EfOGejR6Tm6
 Aw21vlw8Jur3KyMYVWbW64fAcJ/ly3s=
X-Proofpoint-GUID: ppa5r06b4lrL6SP93SpCh4wNpRzp1NN2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX2X0nPcuWLZvh
 vvicR4tQ3hgKgx95Rfj7uslrrl9reXuq2zW8LJ73lh2iEDqRqH9unScX/fv9t50vELSq1mrQv56
 QkKsY58g5bK6AIMTA+WHC8BFRaupZ9Ic1luf0w0fDtIrc+f8B/9OCCRfPOUEBbsDW1R8F5U3VYF
 loeZBy8kHCbgLzBSZ0D9wLynvomY+a01HmiWDvU4l01bvhUB0OYokGAIN0or3JzZq+IqTnwejD+
 116fggoLLA7XnRUbQ5v4Ntkg/i5CGRlCfpfHQhwWA5dsCIQLCHiaCz7XIbL92joUFTKKo/+YYeA
 WEEHI6bbwVKDM8zsljW3ZmAMrX54Pkt89B9ZTUKhr8UkmL4bExk+Ay5jAwLbh/WK4OwesrgFxhr
 gmFYs5sIgS/YVskNMT0+gYQytQVBTrjzN9ID3EmhB3UTJ0aXAhCjQ9jCvevh1hI+KurdUdbyp3C
 aJ7XFcWrXpBSTaZA/jw==
X-Proofpoint-ORIG-GUID: ppa5r06b4lrL6SP93SpCh4wNpRzp1NN2
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab4d361 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=Eu4eB5ymJzOrEwSPfFIA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_083816_177242_7EA4CD0F 
X-CRM114-Status: GOOD (  17.69  )
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

Add config option to enable SSE in APEI. When it is enabled, functions
to register/unregister a ghes entry with SSE are avilable along with
low and high priority event handers. If a SSE notification type is
determined, a ghes common handler to handle an error event is registered.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 drivers/acpi/apei/Kconfig |  5 ++
 drivers/acpi/apei/ghes.c  | 99 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 93 insertions(+), 11 deletions(-)

diff --git a/drivers/acpi/apei/Kconfig b/drivers/acpi/apei/Kconfig
index 428458c623f0..895a843d0e36 100644
--- a/drivers/acpi/apei/Kconfig
+++ b/drivers/acpi/apei/Kconfig
@@ -46,6 +46,11 @@ config ACPI_APEI_SEA
 	depends on ARM64 && ACPI_APEI_GHES
 	default y
 
+config ACPI_APEI_SSE
+	bool
+	depends on RISCV && RISCV_SBI_SSE && ACPI_APEI_GHES
+	default y
+
 config ACPI_APEI_MEMORY_FAILURE
 	bool "APEI memory error recovering support"
 	depends on ACPI_APEI && MEMORY_FAILURE
diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index fe10ab0e02f6..1a6d21f7992b 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -17,6 +17,8 @@
  *   Author: Huang Ying <ying.huang@intel.com>
  */
 
+#include <linux/err.h>
+#include <linux/riscv_sbi_sse.h>
 #include <linux/arm_sdei.h>
 #include <linux/kernel.h>
 #include <linux/moduleparam.h>
@@ -100,6 +102,11 @@
 #define FIX_APEI_GHES_SDEI_CRITICAL	__end_of_fixed_addresses
 #endif
 
+#ifndef CONFIG_RISCV_SBI_SSE
+#define FIX_APEI_GHES_SSE_LOW_PRIORITY	__end_of_fixed_addresses
+#define FIX_APEI_GHES_SSE_HIGH_PRIORITY	__end_of_fixed_addresses
+#endif
+
 static ATOMIC_NOTIFIER_HEAD(ghes_report_chain);
 
 static inline bool is_hest_type_generic_v2(struct ghes *ghes)
@@ -1682,6 +1689,63 @@ static int apei_sdei_unregister_ghes(struct ghes *ghes)
 	return sdei_unregister_ghes(ghes);
 }
 
+#if defined(CONFIG_ACPI_APEI_SSE)
+/* SSE Handlers */
+static int __ghes_sse_callback(struct ghes *ghes,
+			       enum fixed_addresses fixmap_idx)
+{
+	if (!ghes_in_nmi_queue_one_entry(ghes, fixmap_idx)) {
+		irq_work_queue(&ghes_proc_irq_work);
+
+		return 0;
+	}
+
+	return -ENOENT;
+}
+
+/* Low priority */
+static int ghes_sse_lo_callback(u32 event_num, void *arg, struct pt_regs *regs)
+{
+	static DEFINE_RAW_SPINLOCK(ghes_notify_lock_sse_lo);
+	struct ghes *ghes = arg;
+	int err;
+
+	raw_spin_lock(&ghes_notify_lock_sse_lo);
+	err = __ghes_sse_callback(ghes, FIX_APEI_GHES_SSE_LOW_PRIORITY);
+	raw_spin_unlock(&ghes_notify_lock_sse_lo);
+
+	return err;
+}
+
+/* High priority */
+static int ghes_sse_hi_callback(u32 event_num, void *arg, struct pt_regs *regs)
+{
+	static DEFINE_RAW_SPINLOCK(ghes_notify_lock_sse_hi);
+	struct ghes *ghes = arg;
+	int err;
+
+	raw_spin_lock(&ghes_notify_lock_sse_hi);
+	err = __ghes_sse_callback(ghes, FIX_APEI_GHES_SSE_HIGH_PRIORITY);
+	raw_spin_unlock(&ghes_notify_lock_sse_hi);
+
+	return err;
+}
+
+static int apei_sse_register_ghes(struct ghes *ghes)
+{
+	return sse_register_ghes(ghes, ghes_sse_lo_callback,
+				 ghes_sse_hi_callback);
+}
+
+static int apei_sse_unregister_ghes(struct ghes *ghes)
+{
+	return sse_unregister_ghes(ghes);
+}
+#else /* CONFIG_ACPI_APEI_SSE */
+static int apei_sse_register_ghes(struct ghes *ghes) { return -EOPNOTSUPP; }
+static int apei_sse_unregister_ghes(struct ghes *ghes) { return -EOPNOTSUPP; }
+#endif
+
 static int ghes_probe(struct platform_device *ghes_dev)
 {
 	struct acpi_hest_generic *generic;
@@ -1728,6 +1792,14 @@ static int ghes_probe(struct platform_device *ghes_dev)
 		pr_warn(GHES_PFX "Generic hardware error source: %d notified via local interrupt is not supported!\n",
 			generic->header.source_id);
 		goto err;
+	case ACPI_HEST_NOTIFY_SSE:
+		if (!IS_ENABLED(CONFIG_ACPI_APEI_SSE)) {
+			pr_warn(GHES_PFX "Generic hardware error source: %d notified via SSE is not supported\n",
+				generic->header.source_id);
+			rc = -EOPNOTSUPP;
+			goto err;
+		}
+		break;
 	default:
 		pr_warn(FW_WARN GHES_PFX "Unknown notification type: %u for generic hardware error source: %d\n",
 			generic->notify.type, generic->header.source_id);
@@ -1795,6 +1867,17 @@ static int ghes_probe(struct platform_device *ghes_dev)
 		if (rc)
 			goto err;
 		break;
+
+	case ACPI_HEST_NOTIFY_SSE:
+		rc = apei_sse_register_ghes(ghes);
+		if (rc) {
+			pr_err(GHES_PFX "Failed to register for SSE notification on vector %d\n",
+			       generic->notify.vector);
+			goto err;
+		}
+		pr_err(GHES_PFX "Registered SSE notification on vector %d\n",
+		       generic->notify.vector);
+		break;
 	default:
 		BUG();
 	}
@@ -1824,7 +1907,6 @@ static int ghes_probe(struct platform_device *ghes_dev)
 
 static void ghes_remove(struct platform_device *ghes_dev)
 {
-	int rc;
 	struct ghes *ghes;
 	struct acpi_hest_generic *generic;
 
@@ -1858,16 +1940,11 @@ static void ghes_remove(struct platform_device *ghes_dev)
 		ghes_nmi_remove(ghes);
 		break;
 	case ACPI_HEST_NOTIFY_SOFTWARE_DELEGATED:
-		rc = apei_sdei_unregister_ghes(ghes);
-		if (rc) {
-			/*
-			 * Returning early results in a resource leak, but we're
-			 * only here if stopping the hardware failed.
-			 */
-			dev_err(&ghes_dev->dev, "Failed to unregister ghes (%pe)\n",
-				ERR_PTR(rc));
-			return;
-		}
+		apei_sdei_unregister_ghes(ghes);
+		break;
+
+	case ACPI_HEST_NOTIFY_SSE:
+		apei_sse_unregister_ghes(ghes);
 		break;
 	default:
 		BUG();
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
