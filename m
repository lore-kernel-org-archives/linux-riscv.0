Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F51CD37B6
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 08:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3gOduS6RwyFDNaOMkiObGy66l9TVXJXDYRxNSOOaa/E=; b=4Zp1vQK2P13i2n
	bEs+q3UBTap/xTL7wuDITrpBNjDMyKbaF/a3B4Wf04B11a8p2+tGSOZ9JM+sgpNz55AG6KuZHM2o0
	WWt5zeD5212Vz+pWhS/5PgmhQzbDa3q+6omxbnOc9h2tXwBCxQpzWehMQsugrh9oqgswjUzjvZaJA
	/7d7JkWzPC5E2UnSMPkci9qj7EPhSJS+ukIM09U1nodPutS25fIiH+gX/M6WBwkraN7IUIr9Rjzoz
	OYIj3PccK0KBUVcpbW/upix0cIwmlrNaFp2s7lKuvsfoYRxiUh4ywbB4mQ2hPYmATIlt0ZUgCcMsE
	w9yO3pRRXUMoK8hvR6gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Cd-00000001mOk-2Yrd;
	Wed, 13 May 2026 08:44:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Cc-00000001mNd-1XwN
	for linux-riscv@bombadil.infradead.org;
	Wed, 13 May 2026 08:44:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7thsI61iVOvUNh22HCK2qAPj5NTxS3xwSRoZruWKBf8=; b=kGV4gbg3nmiE1kcGPPJlVjuixv
	4jWCW8VIeHjP149GdrPsvMP+w45dY69u0ew1/8KwSWIPOp18ahiy1LOPs44B6h6KSX7HYsxzgzsxA
	VPm33I1DEgnv/bTb6tA4xbTMSyuLbmwqOVnPVMlsjFe1sU9MEckXOsvZGqO61miD+8Jj+zWRxnx7X
	1jNAyxo6YoHd8j1sSG/AUJwwB/2DHXf/Y2DuevguFV6hnonVpYh/1V2WSskwKTfPDcerem07FwaUx
	JIH+puE94RTarMGED1uV3bi17gqyeR4u05rR23t8ajMCba36W2/K4IT/wztYpKW2GmdEfPBiiGCYF
	Igz0ZdOQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5CV-0000000Gs7l-1sYR
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 08:44:24 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p9J72331406
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7thsI61iVOv
	UNh22HCK2qAPj5NTxS3xwSRoZruWKBf8=; b=WKj7BvvD7bYlQK1S8oz5Rw32MCc
	tGn8FxrH0FQ33DTyjhKa3chdX22dq3+PodPsALaWiNCoTnTdgoSsjAjrxSjvwTQL
	EEQ7NuR3WGdVGCGzzvPlqmMPWzAWBL1hgX0smLkmc9sTgp8gRdiDTAMTd+BMuhm6
	vCUjW0iTV5i01MO2ez6Nt48+02Pnpf32Bx9KT6HMZQaexbGUF0IyvEUiJr8K0mJP
	m87B75Uf/qBz1i1VIL48ZIz9ROkGsknfYJE/4KVIS+4rv7FilFb3Lchs6uHQX03e
	vlLTmId5vmKxsdBhXucKYXUVHQTs077y4keop69bsCeQKvGP6Opa4nXR0pQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43ypc8hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:44:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso71168525ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 01:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778661857; x=1779266657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7thsI61iVOvUNh22HCK2qAPj5NTxS3xwSRoZruWKBf8=;
        b=GfOGgiRxUFLxRjPddF2cB6sx4Lk/vS+4VJTexyb/xgqTn/RuM+CqXLEnQdVMlNn9GQ
         Dj9s2rjPwVZxCv2OpCH4cmpx2apnipJehZCWh0lzfJPevqkBd8Fper+cvFlV9bGqHNSd
         tr7dw/P3hUjhoG+1/505NjZi0PQDsRCevXt6utCmeIy2yHacE9DdGj4YRymn/iyzC8mh
         k8mAvhsBhCExEZMbNDvPclUQHOzeQB7+uZtMgZQRiVU4YoRy1ajC1Tejc+6Tnh5LJhpr
         m1AgQNrfXV0IHwSigb/o8/iGwYDJ2z9uWH6+X6gNexIrArT7JBD/JqHpQ2p7CYjObGzK
         LZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778661857; x=1779266657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7thsI61iVOvUNh22HCK2qAPj5NTxS3xwSRoZruWKBf8=;
        b=UqikE7/pekKrlixutl3Yl2MsXSoN+BNcoKjrsBRp1SYi7NvTgu8N9DqAXdDtva7Wra
         iHGGq7lhSORF1YglEVDL/aubgqiFkvRpZxK9g70WgHY6r/EsE/EQja1n/1GduzKog1M7
         m8pMXvuvB2GARjsk341IM+mjVE0jyk+ppeGeZy+zu2gYvxqxj9fs6gpY5GbGq3hTi3Kg
         RkPT+XvwZmoaxZQpi+gCGQ2hBXSFkbw8yuj7kvipJjG3lrw+dW5ZSVweUsF4bVigKWjH
         G948zA9DmjTobqiFFIUULk/nrmP8NMKM64lPMZdWHa9dsxS3Iwr/Fkad1IeEcqyR/UHu
         z9rQ==
X-Gm-Message-State: AOJu0Yxb2vkZd85RGUs1rUi/ene8KNqdNEJFMhkH+xdNf9npH0uoqSGG
	KJW88hrHBhBbjGPwgJrb1+vaRiKFKOJ8Zq4Bcbgs130WM6yjhVkF7eud0/hKbMceJamupXgzpHx
	0v0vs2qeHNc+RiIFuO0zQDCIIuFTBUy+uGYGtJ9+SdzmnGCj6lnFl9gaEC1+ve89QQkkl6Vws1P
	FltdE=
X-Gm-Gg: Acq92OHRu2KEIt1PqZPpUCeQ/ZjGepuIgeHtdYOHq0emlWovfdxYT59y+Wuax1+efvB
	gaurLYFlk86O2xrLsKaP/7ZWEUreaYQrOJZm+aoLis/pQaWJpONBHxZO+p7ESgV/2/HDM0+S8QL
	Zwxq7LTmtjTtMNuxNTXWVCAxoggvqWpyLMpuIqbmCt8+0EMuPIe9bINlvKeQey+n8HWW6B0Vg9h
	O6H9vUiusGflC5hqnCtZ/Dn5fbVNYta8VJ/XzjBv2EmtImDeuV6sffxC+oj1X6alk90houTvMiJ
	cII3gxgeB4bXDjnvz5qn1BSEj+LMnAOP6pIMYRi/IZNs2SRQVYCJPYfOz9iXK3Y8le16DxAnIzb
	wgFVFL1Z9WknNicaqEfE2dqeA8BiFpUb+jUyuROPCOfoPd8ZixCp2q6LyHwN40tr2g/l7puv5yo
	xTDcgccp89dMFmFppNk65rqClnMOlmL0G0RLP5MCauZWm6Gw==
X-Received: by 2002:a17:902:7c11:b0:2b4:5f96:184d with SMTP id d9443c01a7336-2bd2f4dc314mr13678675ad.5.1778661857003;
        Wed, 13 May 2026 01:44:17 -0700 (PDT)
X-Received: by 2002:a17:902:7c11:b0:2b4:5f96:184d with SMTP id d9443c01a7336-2bd2f4dc314mr13678465ad.5.1778661856465;
        Wed, 13 May 2026 01:44:16 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2709bsm169158725ad.5.2026.05.13.01.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 01:44:16 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v4 06/10] riscv: Add functions to register ghes having SSE notification
Date: Wed, 13 May 2026 14:13:21 +0530
Message-ID: <20260513084325.2176952-7-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: UMKMlDNQquJK-56yAcJIin9QEZqgOzt6
X-Authority-Analysis: v=2.4 cv=R5kz39RX c=1 sm=1 tr=0 ts=6a0439e2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2d44Z0_5zRK2QUa08RUA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA4OSBTYWx0ZWRfXxakbRPfmgKxv
 eKQ8x08LTfJqNY9FzaeH3rBnvQrEIdiOf7Gl20H4eDjxbmJnsUJMv8YngiD2NpKKR2SkvZtnyYd
 QzzsdzX6zq5DVmIPWUNuM1cAmPXxlA62VEN8p591V6Ws2G8ngQNjyDAZLLjE+qnIBl1tGxQlDAC
 F1+DzP9LQAaxJFD59Rzns9GRdG4asPaRQbaBkp1N4c792JOGEEYsebjzBabXpKXNCT2Msm61ZMr
 uC/rb/iE3xkjdECq6yw1cIaeTBEhUaFh4gnVuUhU1RLiZtEzuEdM4kWC3qcVPMJbzNU47J3NU1t
 q3lxaujVXznJJZ7tEdqoMZQeLXItk3TMMYPUdACbm9kUGhwzCkU+zxafqtrCMYQPhbE9VnTHXUS
 oo81T9967tWadRKZENogrSRjw7U/UOTrvXzBfr9gEJheoqIizIEL6jdqfaFGp+87XuXYft4ihIH
 v6RKw+445zy8A6B7zVg==
X-Proofpoint-GUID: UMKMlDNQquJK-56yAcJIin9QEZqgOzt6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_094421_813258_53751FB3 
X-CRM114-Status: GOOD (  16.86  )
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

Add functions to register the ghes entries which have SSE as
notification type. The vector inside the ghes is the SSE event
ID that should be registered.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 drivers/firmware/riscv/riscv_sbi_sse.c | 146 +++++++++++++++++++++++++
 include/linux/riscv_sbi_sse.h          |  16 +++
 2 files changed, 162 insertions(+)

diff --git a/drivers/firmware/riscv/riscv_sbi_sse.c b/drivers/firmware/riscv/riscv_sbi_sse.c
index c7f29b10cdfb..ee288a0c1680 100644
--- a/drivers/firmware/riscv/riscv_sbi_sse.c
+++ b/drivers/firmware/riscv/riscv_sbi_sse.c
@@ -5,6 +5,8 @@
 
 #define pr_fmt(fmt) "sse: " fmt
 
+#include <acpi/ghes.h>
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/cpuhotplug.h>
 #include <linux/cpu_pm.h>
@@ -692,3 +694,147 @@ static int __init sse_init(void)
 	return ret;
 }
 arch_initcall(sse_init);
+
+struct sse_ghes_callback {
+	struct list_head head;
+	struct ghes *ghes;
+	sse_event_handler_fn *callback;
+};
+
+struct sse_ghes_event_data {
+	struct list_head head;
+	u32 event_num;
+	struct list_head callback_list;
+	struct sse_event *event;
+};
+
+static DEFINE_SPINLOCK(sse_ghes_event_list_lock);
+static LIST_HEAD(sse_ghes_event_list);
+
+static int sse_ghes_handler(u32 event_num, void *arg, struct pt_regs *regs)
+{
+	struct sse_ghes_event_data *ev_data = arg;
+	struct sse_ghes_callback *cb = NULL;
+
+	list_for_each_entry(cb, &ev_data->callback_list, head) {
+		if (cb && cb->ghes && cb->callback)
+			cb->callback(ev_data->event_num, cb->ghes, regs);
+	}
+
+	return 0;
+}
+
+int sse_register_ghes(struct ghes *ghes, sse_event_handler_fn *lo_cb,
+		      sse_event_handler_fn *hi_cb)
+{
+	struct sse_ghes_event_data *ev_data, *evd;
+	struct sse_ghes_callback *cb;
+	u32 ev_num;
+	int err;
+
+	if (!sse_available)
+		return -EOPNOTSUPP;
+	if (!ghes || !lo_cb || !hi_cb)
+		return -EINVAL;
+
+	ev_num = ghes->generic->notify.vector;
+
+	ev_data = NULL;
+	spin_lock(&sse_ghes_event_list_lock);
+	list_for_each_entry(evd, &sse_ghes_event_list, head) {
+		if (evd->event_num == ev_num) {
+			ev_data = evd;
+			break;
+		}
+	}
+	spin_unlock(&sse_ghes_event_list_lock);
+
+	if (!ev_data) {
+		ev_data = kzalloc(sizeof(*ev_data), GFP_KERNEL);
+		if (!ev_data)
+			return -ENOMEM;
+
+		INIT_LIST_HEAD(&ev_data->head);
+		ev_data->event_num = ev_num;
+
+		INIT_LIST_HEAD(&ev_data->callback_list);
+
+		ev_data->event = sse_event_register(ev_num, ev_num,
+						    sse_ghes_handler, ev_data);
+		if (IS_ERR(ev_data->event)) {
+			pr_err("%s: Couldn't register event 0x%x\n", __func__, ev_num);
+			kfree(ev_data);
+			return -ENOMEM;
+		}
+
+		err = sse_event_enable(ev_data->event);
+		if (err) {
+			pr_err("%s: Couldn't enable event 0x%x\n", __func__, ev_num);
+			sse_event_unregister(ev_data->event);
+			kfree(ev_data);
+			return err;
+		}
+
+		spin_lock(&sse_ghes_event_list_lock);
+		list_add_tail(&ev_data->head, &sse_ghes_event_list);
+		spin_unlock(&sse_ghes_event_list_lock);
+	}
+
+	list_for_each_entry(cb, &ev_data->callback_list, head) {
+		if (cb->ghes == ghes)
+			return -EALREADY;
+	}
+
+	cb = kzalloc(sizeof(*cb), GFP_KERNEL);
+	if (!cb)
+		return -ENOMEM;
+	INIT_LIST_HEAD(&cb->head);
+	cb->ghes = ghes;
+	cb->callback = lo_cb;
+	list_add_tail(&cb->head, &ev_data->callback_list);
+
+	return 0;
+}
+
+int sse_unregister_ghes(struct ghes *ghes)
+{
+	struct sse_ghes_event_data *ev_data, *tmp;
+	struct sse_ghes_callback *cb;
+	int free_ev_data = 0;
+
+	if (!ghes)
+		return -EINVAL;
+
+	spin_lock(&sse_ghes_event_list_lock);
+
+	list_for_each_entry_safe(ev_data, tmp, &sse_ghes_event_list, head) {
+		list_for_each_entry(cb, &ev_data->callback_list, head) {
+			if (cb->ghes != ghes)
+				continue;
+
+			list_del(&cb->head);
+			kfree(cb);
+			break;
+		}
+
+		if (list_empty(&ev_data->callback_list))
+			free_ev_data = 1;
+
+		if (free_ev_data) {
+			spin_unlock(&sse_ghes_event_list_lock);
+
+			sse_event_disable(ev_data->event);
+			sse_event_unregister(ev_data->event);
+			ev_data->event = NULL;
+
+			spin_lock(&sse_ghes_event_list_lock);
+
+			list_del(&ev_data->head);
+			kfree(ev_data);
+		}
+	}
+
+	spin_unlock(&sse_ghes_event_list_lock);
+
+	return 0;
+}
diff --git a/include/linux/riscv_sbi_sse.h b/include/linux/riscv_sbi_sse.h
index 84165cb5f2d0..be0c9ad0a00c 100644
--- a/include/linux/riscv_sbi_sse.h
+++ b/include/linux/riscv_sbi_sse.h
@@ -11,6 +11,7 @@
 
 struct sse_event;
 struct pt_regs;
+struct ghes;
 
 typedef int (sse_event_handler_fn)(u32 event_num, void *arg,
 				   struct pt_regs *regs);
@@ -24,6 +25,10 @@ void sse_event_unregister(struct sse_event *evt);
 
 int sse_event_set_target_cpu(struct sse_event *sse_evt, unsigned int cpu);
 
+int sse_register_ghes(struct ghes *ghes, sse_event_handler_fn *lo_cb,
+		      sse_event_handler_fn *hi_cb);
+int sse_unregister_ghes(struct ghes *ghes);
+
 int sse_event_enable(struct sse_event *sse_evt);
 
 void sse_event_disable(struct sse_event *sse_evt);
@@ -47,6 +52,17 @@ static inline int sse_event_set_target_cpu(struct sse_event *sse_evt,
 	return -EOPNOTSUPP;
 }
 
+static inline int sse_register_ghes(struct ghes *ghes, sse_event_handler_fn *lo_cb,
+				    sse_event_handler_fn *hi_cb)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int sse_unregister_ghes(struct ghes *ghes)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int sse_event_enable(struct sse_event *sse_evt)
 {
 	return -EOPNOTSUPP;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
