Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ED260A2608
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 04:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YK+bpej2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1cZ8FWy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W9/I2ZwoDAu9TghdkabigRq1uWzhK9lT7hZLkftHlBE=; b=YK+bpej24wNXJlzqaQESdheHq3
	A0R4RbrEJ95dWjBIWedPyaBXlmPX4LVDuQyyLIWYn4lHl8i4/hNHbYiMUIpDT+5h2vesS6PXiMU49
	QMtgWz3F4tOmaX+9vEj8KuhJgZ3U6ES4JN2W3hgE1VUHJUu0kZTx3FyhNBiyPOGuuY8LLSFvH4APX
	eVLAYtyQTWDky4FhsvVSD1akrcWJvybFUiekDdyNwL2q0JRGg3NHXZZ/ZybX4btv7O2ZWmeo3JK6k
	KdZxf9xCfPjVu1Z6WF5DD6ivZJypliGQ8UnW0B0zZnuj4O+4OJ3U078i7rat/BPdMr64oV349GnmR
	egLH3Q8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSnu0-000000015Kd-32nu;
	Mon, 16 Nov 2026 04:01:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSntz-000000015Jr-0Nje
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 04:01:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1L3v33321566;
	Mon, 16 Nov 2026 04:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k6PBeX30On8
	UKQ31LxyPYYj0deLdbMxJ58AQNMR9GT8=; b=a1cZ8FWy6TZ8ch/Jbd/oIb5EzRe
	9AK/kwd5P5Edt09Oyi8OCfjk5vdHleWikag7m0wc6ExySltP7FdVWYPHa4Ccdeq/
	/TomZpWtFf8QcntGPKWfbyszj2pKZmy9DVpviRu4sQUBAKteauN9cd+9vnWbjltv
	Si7lwlw9UBjj76ZCb+SQg12B5yPoQxN1aknjbO+3yKbNO1lwE+apnJ0H6F8wGxe2
	odI1b9cl5AzPxoejq5BTIF5ZM/+2TBdoaWeTCr7LI/1K6nwRv+r++/Ps9MVuLll3
	UI7CtjarA+VZtTfbVN2A/V9CtwQHzkjM8qYX7DoIt5QEqHlHn37UHSiHpKw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhmk5h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 04:00:54 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG40q1l4139888;
	Mon, 16 Nov 2026 04:00:52 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AG40pnk4139875
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 04:00:51 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id EBAE3248EA; Mon, 16 Nov 2026 09:30:50 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Rahul Pathak <rahul@summations.net>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sunil V L <sunilvl@oss.qualcomm.com>,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
        Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2 2/5] RISC-V: Use irqsave to prevent interrupt when accessing MPXY shared memory
Date: Mon, 16 Nov 2026 09:30:46 +0530
Message-ID: <20261116040049.1795610-3-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116040049.1795610-1-anup.patel@oss.qualcomm.com>
References: <20261116040049.1795610-1-anup.patel@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: 6ESGtdfeASokbIcLJtq_REFh6wlGuH4h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxNSBTYWx0ZWRfX+7iv2A0qqXhB
 mXiqn1sBhMjOZi6yuSO0u+rhdKrTu4tJYQa0hyiAEaHPO6TGJCAT1cDfLiOgrFfc/nJ6ySOza0G
 0z+Gr48hOOKAKC+Wd1+I2nbqbYqnLp4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxNSBTYWx0ZWRfX/qx+Xgxo9xok
 DZhGfSaU2ftBFQyzYJnkkNg96Ex7/uZZpUDvXyqMFAttB0PTnPNiezWMu4pZbFDmq+1j7bHkwxR
 ZXThqfeRDI3Nkj3MnOleEIkqcf/zMrkutwq2W2ug/Bq9esNyQ/EdEAqUOf7HwEwBuxOb3NDZEQe
 k3Wf4OSNMzflzRp6SRsF0Sl2bjSGtT2bvPZ6xKjtmg/q1TheQTvCJodJiQatMNu0/2U3hUiADKt
 hp20XqFY/r9YW+F5mLGsJrWegGXAhh9JTjcZ4Nzq6LPA4SC7JhmOYoPCb09zv7sxR+r4pxyxvXk
 Yf19Yp0CE1PTWvlxmhYyOjPt9r1AeclPWuGFN3X2IVG2zLiJhZK1r71QaCo9SpIwJ8WX389pA2l
 nrjXniUOdnm58NJxB7/riP+CxOztvJU+tcSF4hJgZggsDQ/oIzSLC8uGIu3phsn9u/hDqgjcnr4
 OHtombsCZwPskD45qhg==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6afa7ff6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=Z9CWrU2r9MEVleDcQ90A:9
X-Proofpoint-ORIG-GUID: 6ESGtdfeASokbIcLJtq_REFh6wlGuH4h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_200107_144823_7B71F95F 
X-CRM114-Status: GOOD (  17.85  )
X-Spam-Score: -2.7 (--)
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

Currently, get_cpu()/put_cpu() is used to prevent getting preempted when
accessing shared memory but an external interrupt can still be taken which
may invoke RPMI system IRQ driver potentially corrupting MPXY shared memory.

To prevent the above, replace get_cpu()/put_cpu() with irq save/restore
which ensures external interrupt can't corrupt MPXY shared memory.

Co-developed-by: Jassi Brar <jassisinghbrar@gmail.com>
Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/kernel/sbi_mpxy.c | 114 +++++++++++++++++------------------
 1 file changed, 57 insertions(+), 57 deletions(-)

diff --git a/arch/riscv/kernel/sbi_mpxy.c b/arch/riscv/kernel/sbi_mpxy.c
index 17a2cee21311..99ab3e552da3 100644
--- a/arch/riscv/kernel/sbi_mpxy.c
+++ b/arch/riscv/kernel/sbi_mpxy.c
@@ -6,8 +6,10 @@
  */
 
 #define pr_fmt(fmt) "riscv: " fmt
+#include <linux/cleanup.h>
 #include <linux/cpu.h>
 #include <linux/init.h>
+#include <linux/irqflags.h>
 #include <linux/mm.h>
 #include <linux/percpu.h>
 #include <linux/printk.h>
@@ -50,113 +52,116 @@ EXPORT_SYMBOL_GPL(sbi_mpxy_shmem_size);
 
 int sbi_mpxy_get_channel_count(u32 *channel_count)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
-	struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
+	struct sbi_mpxy_channel_ids_data *sdata;
+	struct mpxy_local *mpxy;
 	u32 remaining, returned;
 	struct sbiret sret;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!channel_count)
 		return -EINVAL;
 
-	get_cpu();
+	/*
+	 * The shared memory is per-CPU.  Disable IRQs so that a local IRQ
+	 * cannot re-enter and clobber the buffer while the SBI call uses it.
+	 * This also pins the current CPU for this_cpu_ptr().
+	 */
+	guard(irqsave)();
+	mpxy = this_cpu_ptr(&mpxy_local);
+	if (!mpxy->shmem_active)
+		return -ENODEV;
+	sdata = mpxy->shmem;
 
 	/* Get the remaining and returned fields to calculate total */
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
 			 0, 0, 0, 0, 0, 0);
 	if (sret.error)
-		goto err_put_cpu;
+		return sbi_err_map_linux_errno(sret.error);
 
 	remaining = le32_to_cpu(sdata->remaining);
 	returned = le32_to_cpu(sdata->returned);
 	*channel_count = remaining + returned;
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(sbi_mpxy_get_channel_count);
 
 int sbi_mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
-	struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
 	u32 remaining, returned, count, start_index = 0;
+	struct sbi_mpxy_channel_ids_data *sdata;
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!channel_count || !channel_ids)
 		return -EINVAL;
 
-	get_cpu();
+	guard(irqsave)();
+	mpxy = this_cpu_ptr(&mpxy_local);
+	if (!mpxy->shmem_active)
+		return -ENODEV;
+	sdata = mpxy->shmem;
 
 	do {
 		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
 				 start_index, 0, 0, 0, 0, 0);
 		if (sret.error)
-			goto err_put_cpu;
+			return sbi_err_map_linux_errno(sret.error);
 
 		remaining = le32_to_cpu(sdata->remaining);
 		returned = le32_to_cpu(sdata->returned);
 
-		count = returned < (channel_count - start_index) ?
-			returned : (channel_count - start_index);
+		count = min(returned, channel_count - start_index);
 		memcpy_from_le32(&channel_ids[start_index], sdata->channel_array, count);
 		start_index += count;
 	} while (remaining && start_index < channel_count);
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(sbi_mpxy_get_channel_ids);
 
 int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
 			u32 *attrs_buf)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!attr_count || !attrs_buf)
 		return -EINVAL;
 
-	get_cpu();
+	guard(irqsave)();
+	mpxy = this_cpu_ptr(&mpxy_local);
+	if (!mpxy->shmem_active)
+		return -ENODEV;
 
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_READ_ATTRS,
 			 channel_id, base_attrid, attr_count, 0, 0, 0);
 	if (sret.error)
-		goto err_put_cpu;
+		return sbi_err_map_linux_errno(sret.error);
 
 	memcpy_from_le32(attrs_buf, (__le32 *)mpxy->shmem, attr_count);
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(sbi_mpxy_read_attrs);
 
 int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
 			 u32 *attrs_buf)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!attr_count || !attrs_buf)
 		return -EINVAL;
 
-	get_cpu();
+	guard(irqsave)();
+	mpxy = this_cpu_ptr(&mpxy_local);
+	if (!mpxy->shmem_active)
+		return -ENODEV;
 
 	memcpy_to_le32((__le32 *)mpxy->shmem, attrs_buf, attr_count);
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_WRITE_ATTRS,
 			 channel_id, base_attrid, attr_count, 0, 0, 0);
 
-	put_cpu();
 	return sbi_err_map_linux_errno(sret.error);
 }
 EXPORT_SYMBOL_GPL(sbi_mpxy_write_attrs);
@@ -166,16 +171,17 @@ int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
 				    void *rx, unsigned long max_rx_len,
 				    unsigned long *rx_len)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	unsigned long rx_bytes;
 	struct sbiret sret;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!tx && tx_len)
 		return -EINVAL;
 
-	get_cpu();
+	guard(irqsave)();
+	mpxy = this_cpu_ptr(&mpxy_local);
+	if (!mpxy->shmem_active)
+		return -ENODEV;
 
 	/* Message protocols allowed to have no data in messages */
 	if (tx_len)
@@ -185,17 +191,14 @@ int sbi_mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
 			 channel_id, msg_id, tx_len, 0, 0, 0);
 	if (rx && !sret.error) {
 		rx_bytes = sret.value;
-		if (rx_bytes > max_rx_len) {
-			put_cpu();
+		if (rx_bytes > max_rx_len)
 			return -ENOSPC;
-		}
 
 		memcpy(rx, mpxy->shmem, rx_bytes);
 		if (rx_len)
 			*rx_len = rx_bytes;
 	}
 
-	put_cpu();
 	return sbi_err_map_linux_errno(sret.error);
 }
 EXPORT_SYMBOL_GPL(sbi_mpxy_send_message_with_resp);
@@ -203,15 +206,16 @@ EXPORT_SYMBOL_GPL(sbi_mpxy_send_message_with_resp);
 int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
 				       void *tx, unsigned long tx_len)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!tx && tx_len)
 		return -EINVAL;
 
-	get_cpu();
+	guard(irqsave)();
+	mpxy = this_cpu_ptr(&mpxy_local);
+	if (!mpxy->shmem_active)
+		return -ENODEV;
 
 	/* Message protocols allowed to have no data in messages */
 	if (tx_len)
@@ -220,7 +224,6 @@ int sbi_mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_SEND_MSG_WITHOUT_RESP,
 			 channel_id, msg_id, tx_len, 0, 0, 0);
 
-	put_cpu();
 	return sbi_err_map_linux_errno(sret.error);
 }
 EXPORT_SYMBOL_GPL(sbi_mpxy_send_message_without_resp);
@@ -229,32 +232,29 @@ int sbi_mpxy_get_notifications(u32 channel_id,
 			       struct sbi_mpxy_notification_data *notif_data,
 			       unsigned long *events_data_len)
 {
-	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
+	struct mpxy_local *mpxy;
 	struct sbiret sret;
 
-	if (!mpxy->shmem_active)
-		return -ENODEV;
 	if (!notif_data || !events_data_len)
 		return -EINVAL;
 
-	get_cpu();
+	guard(irqsave)();
+	mpxy = this_cpu_ptr(&mpxy_local);
+	if (!mpxy->shmem_active)
+		return -ENODEV;
 
 	sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS,
 			 channel_id, 0, 0, 0, 0, 0);
 	if (sret.error)
-		goto err_put_cpu;
+		return sbi_err_map_linux_errno(sret.error);
 	if (sret.value < 0 || mpxy_shmem_size < sizeof(*notif_data) ||
-	    sret.value > mpxy_shmem_size - sizeof(*notif_data)) {
-		put_cpu();
+	    sret.value > mpxy_shmem_size - sizeof(*notif_data))
 		return -EOVERFLOW;
-	}
 
 	memcpy(notif_data, mpxy->shmem, sret.value + sizeof(*notif_data));
 	*events_data_len = sret.value;
 
-err_put_cpu:
-	put_cpu();
-	return sbi_err_map_linux_errno(sret.error);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(sbi_mpxy_get_notifications);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
