Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDEC606A693
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 14:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U6ZL6o2q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SXodKdFk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ELkgRfsq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kU9+UUSDuA9PqWj168uLr0QGKKqVdjcmMQ51+H8Mze4=; b=U6ZL6o2qFceS7W3dOW0OusLCSV
	ZnSnYZkL+JZn7DVksLUBXri/f7s0sUy10QfixlKEkPyUIXf+i4mdeWO58CaFahXCpoFR1zJa1wKDi
	E9/aR2M1uzo16EZUILYdrwPyCVdOAmVd48lvOzYPeGnExdWKQv/s24o1S90lPB0fxphXVJoTlnlI9
	cr3beJC0B06jNKSKcLatXM508U8Ijhv2qksnFbuP8aVi1cpyvQRG73ECJIvuv6gD05ZD9gAFl6OaU
	N2F5d+jzrufYV/bK6KgrfjRp4uSte99H+3jzwxBMRM+pmxWScs0TbEDHiIp1hitfEoAnUsfXFJoxT
	hNBKaOUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWat1-0000000DdXh-0S1y;
	Thu, 26 Nov 2026 14:55:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWasz-0000000DdXA-1u8x
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 14:55:46 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVatJ3144150
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 14:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=a6LZCrT8blrosdMMyKWcFIwetyPJUyCyft8
	Ow98DzCU=; b=SXodKdFkMLtMTOrfMzWXV2VVj5QfZHy2ksWi3B/0KCNTJ3BjUR+
	h+pEHQqlrR3PBSgRKgAwxMD5jmnlsYs4CISg0L/Lk+owswQqovKT0Kym59B0f3F/
	wm9xfJSboDZavSKdPNS190fXCO8VW23AJxtssfkYhF9VJz9b906c/0BuL91agQ0v
	GDEbJVDDsSyASjMcTZ4bc7uLW2e14bN6ldcMme6sVpAAEFsWVzCs7tyZfFOYDCCC
	rx7qwoyen3jUcltAvC6ot8SAPNNSrO2sjGeGoibfteaOp4h/xnTA137Ycv0BDOQ7
	rVTmrZM8O8bgOgqJ5U8So8O7eyGQAUcOHVg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahvv7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 14:55:44 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b597143a81so36318c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 06:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704944; x=1796309744; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a6LZCrT8blrosdMMyKWcFIwetyPJUyCyft8Ow98DzCU=;
        b=ELkgRfsqIz/qiqDiDbzCCInsu+Kyss4ea0eC7jY2Hr1wjpPfGeB9jj8k7fkHTKiy7a
         LkFORDGmFCHNQ5yC7IJnOSXt4PDFKVWzJV/sxwdbcBFWCjwXDDYjh+vze+0TE04S8tl2
         a19vS5IXO3kwy7tkGtYrwMPu4CPmV4JrmrhhfxC6qXauxnx3skpiflgsUVLMKyYV3XEm
         Wviq2d+yYTl3iIiyAqOxICcQwjPHeBMR/VoTMvgWOnc8yWf5HIxxnJXn7CYp/aNwAeHf
         S2hblanSM7LhCDmogxmuRowM5rXUv0qQuYYrW7a+P+SK0I9c/MraXHCWDbE5LgRb+9Cd
         vPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704944; x=1796309744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6LZCrT8blrosdMMyKWcFIwetyPJUyCyft8Ow98DzCU=;
        b=r3yY37uqmve9W1Uj7iKdeZD/hLjmMJdlTx1XJFJ6QcZxvA8e7siYl5KYgfTXxdGpl6
         59CN8N336uugo0TzYF2DPlMnzxm6pmB2SFIlC79iNq6XaJZgacnzv72GplqZEtAJucN4
         znT88FuA6xNNl84UVmlESoAN3Hya+wclb/2+JB6JWW3rAk052GSJ+1ilN1HuNv6zSckV
         Lujg6QNNrtFZZoUx+hNSuInag7gMUVkp/9oJY6ZsqoSVHYD8XGsSatHR0JQj7dH4FU8J
         eVwZKGzhTCrZh3qveux7lyyqF1iwqAlaiuu2dxUc8cAGiln5h4/ROvTHn0bx4fIK2n57
         6T5g==
X-Gm-Message-State: APuU4Z+cNhI68VkA9bBXFwbtXbCbCJ9E3qyxh9CZZ1F/LrbPqKPPUW73
	YjZjWeQtNzB4J11+C9r5JhJxRUXYL/cGiqk2E380ILJOjUn+scKd7nM1LDXyOyPv7sg3GixLjJ6
	x4uABSFrrPjD8j5nwF3y8AdPVxBD9NrB9s20zLcZFkb+D/7cQDEV/KjUCXij6jhki3r8ee8s=
X-Gm-Gg: AZFdTZcrxilbYzN2C3bwns+gUx4CXLZ/kVvVfCpjkqrffbwnXTS0ALkJ2mWc/MudwGI
	RXaqSDd3Y42hbn7SKn1kXJ+79ydzkHG3PndnK1czMncNZKWpzR/zxPR91zCYiiiEAp76k8ek2Fj
	e4LGoiUppmzT69WQPaVU7i4PdZKJwPkR11SWV7y8MlAdY2t1t8BxqU2Eja/WqXfGnSP65FN6ev3
	FN2RtMFxff8RfA6Y0cAlRJWq53je7HMiUrj+KMJ9aTCnEomiuqNnTt9GczSrmWt7uxWgvoPCJ1q
	ZwzhXP/7gQHlD+Ugd9zbiP1C0zsLWG29SOYvLYjtA7xPjUKVxZTEcirX03039odatUzzOLCnbva
	L1VbmUNy9Ycgk1h4IJj+gbBzPuulEgDI8pdiHLi+tDWdFbBq1DJFiZ3fI/Mz86IMc9cZa6Z22kh
	Em5UoKUXzlSbRETpBoEsoR9Z7Od2Gf8MQ7DF1teNLQzcX2d1mbROjxkenCccpo5f3uEzjY7j7eY
	mgifAHalyyQIEHlg/Q4eR9jDw==
X-Received: by 2002:a05:7022:e882:b0:1b5:481:ff0f with SMTP id a92af1059eb24-1b55692fd20mr22829560c88.32.1795704943889;
        Thu, 26 Nov 2026 06:55:43 -0800 (PST)
X-Received: by 2002:a05:7022:e882:b0:1b5:481:ff0f with SMTP id a92af1059eb24-1b55692fd20mr22829530c88.32.1795704943270;
        Thu, 26 Nov 2026 06:55:43 -0800 (PST)
Received: from QCOM-oorDxvP0dv.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm50644066c88.12.2026.11.26.06.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:55:42 -0800 (PST)
From: Shankar C <shankar.c@oss.qualcomm.com>
To: anup@brainfault.org, tglx@kernel.org, radu@rendec.net, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        sunilvl@oss.qualcomm.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        shankar@fw64.net, Shankar C <shankar.c@oss.qualcomm.com>
Subject: [PATCH] irqchip/riscv-imsic: Use the global config for ACPI fwnode lookup
Date: Thu, 26 Nov 2026 14:55:30 +0000
Message-ID: <20261126145530.634759-1-shankar.c@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: xoec6w2CINquHTwep6tqKHaUhMsWhUIW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfXwp4Rzbz009cC
 QEg611YftcrVC1Mmlg85RPfeygQH0WWGTkfBBDl/ZQUoqGP/nd0XqhTzWqNonph1GgUbCF9KFsE
 Tgwkive1VklutMxQFQ/QJlgwAXrYZ6k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX41kfmkecNh/f
 7E+7XZfEIko5e3b1P5MD5yNiK9/i2CMhNmtjOQQzvon7X3bEVXsr6e/q2oa3EF63qUlmn3zoTGR
 8HJ+h8D3pox/bGD6NRHLvKzFmtwE72s6jHoDwRpNzTthDYVI5vAB9HrD/VrALFi6yzH5cT3TiGG
 7KM9Q/I0h2POZyV9eHGQrYrrB6I24Ri0GARgh6TO+RgBVZvQnq2mKk4+WpxiiI03qNkt7UILGTu
 +jslw8OLGUmwbLROuyzGkEebmFBI+QRfAnIcYJ6Z+0w3oVEVx/Hn5i11q6Z3m4odylRTNdpi0+I
 6zJU4pCyL2/taAYKd3m7XXARXRt/cNJ9xl3bod7CmnZ/fftTR8xeBc3YQSwgoTIscVGhgJ2uSz2
 z5h8dMXL9Hjf5hQW22UmhQEhK+fq5UDYgq3sH/sfKdD06JSGnz+U+QNwtwHES4Qj6BQ0K2ruMeB
 YIJyhfW3yj/ZiLPNPVg==
X-Proofpoint-ORIG-GUID: xoec6w2CINquHTwep6tqKHaUhMsWhUIW
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b084870 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=WHxfcFHoiASMFufPa_YA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_065545_496689_D26B107A 
X-CRM114-Status: GOOD (  12.04  )
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

The IMSIC firmware node is already available through the global
configuration, so the separate ACPI fwnode pointer duplicates that
state.

Signed-off-by: Shankar C <shankar.c@oss.qualcomm.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c | 9 +--------
 include/linux/irqchip/riscv-imsic.h     | 9 ++++++++-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 06726a062b75..0fb5484d0cd7 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -248,17 +248,10 @@ IRQCHIP_DECLARE(riscv_imsic, "riscv,imsics", imsic_early_dt_init);
 
 #ifdef CONFIG_ACPI
 
-static struct fwnode_handle *imsic_acpi_fwnode;
-
-struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev)
-{
-	return imsic_acpi_fwnode;
-}
-EXPORT_SYMBOL_GPL(imsic_acpi_get_fwnode);
-
 static int __init imsic_early_acpi_init(union acpi_subtable_headers *header,
 					const unsigned long end)
 {
+	struct fwnode_handle *imsic_acpi_fwnode;
 	struct acpi_madt_imsic *imsic = (struct acpi_madt_imsic *)header;
 	int rc;
 
diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index b7be1aad7774..692be2321046 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -96,7 +96,14 @@ static inline const struct imsic_global_config *imsic_get_global_config(void)
 
 #if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_RISCV_IMSIC)
 int imsic_platform_acpi_probe(struct fwnode_handle *fwnode);
-struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev);
+
+static inline struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev)
+{
+	if (imsic_get_global_config())
+		return imsic_get_global_config()->fwnode;
+
+	return NULL;
+}
 #else
 static inline struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev) { return NULL; }
 #endif
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
