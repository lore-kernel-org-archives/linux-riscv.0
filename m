Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC718D232F6
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 09:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3gOduS6RwyFDNaOMkiObGy66l9TVXJXDYRxNSOOaa/E=; b=r5/TUe+Mywyn9L
	HsAkp4KEwuqxVF8N9DEfdF4sNc2JqvOKvB/Ds1z+/QUfBYy8Bo3l9lG/mdKhSaRlAkoFW8YaNiqHg
	xhuknWy64CsJCZG9xu+DYF8GsjPx5LFCyXG4apY4JQyiEMUCN8zvsCUVtmRvQk8E2AoVyUcBV7xlB
	liRybPDjXPGF3dBxAg1oR0R2fKpqlJnJysR9XcNI1Dqv5amVlQM7PiSjcNgQXlT5NAzsRPrpSl7e2
	QiRqMxSAtfdgmKVyHa2a8c18OAL+ZqxRbeVXWlQLM/MV3x2cDTHOr0AGlNRLdO3ps9mQarT0CckGl
	p7mX7ZF3dbqN+fZ+kcBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Oe-00000001xLm-1Q3Y;
	Fri, 09 Jan 2026 09:03:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Ob-00000001xJU-1vJ2
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 09:03:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098VFi63728380
	for <linux-riscv@lists.infradead.org>; Fri, 9 Jan 2026 09:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7thsI61iVOv
	UNh22HCK2qAPj5NTxS3xwSRoZruWKBf8=; b=VfLTVZBPEPJTcnh8S3GgsofRT+w
	K2VnuXxT19d5er1dKE9/9I/YhEwfzUD5geAJdKo7jmY73ZnBBBrRp6JTHEuRfcTe
	KmhB2Wi1azzpWV7B01AYUJzcW6U5Ofjz6uucaD+OhfAw4IFouAbN5NaD6PUcdQpS
	6GkKhzUzOTfO21wj8QzAR6HeMtqFoPbRb9Zbwr/otMxGvh1fGgh5xFMZRDb+MxSm
	cOHUvwY5QHy9ffHxrjUBCHJgLd5QR2TPGF2sdGhkfF3c3WCJoDhD3FftveWjw/TR
	oLv+KdDFX2nM9zSkGzPMmMX/3OZzZaImIHhdt0vmQfdHn6WrUzozXtyegvg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjpmkhcw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 09:03:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7d24bbb9278so7056326b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 01:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949380; x=1768554180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7thsI61iVOvUNh22HCK2qAPj5NTxS3xwSRoZruWKBf8=;
        b=QDgRSwWJN9Y/tirxmNWUGoPD6W074fxEfbMTsQ6y/NKIzV2WgcUHl0v611n1ozpEg3
         0jBbZa/DiqV0zNI7g8wB1xH63tuPPYAcCzHd+euL07t6Ygt3YWIGGTBNB9EYR6sJHhOH
         imZfv1TG4yRdZvoLSlCvUS1tfnyML52mt//jsI51SiXtY7TEh+htM8JTryjM0XQQxJa7
         oB72n9vZNZVWNUGutZJ/NklCNBebAlyJZ6FdBpjvJxoF5WQ/2QmwywdfxJhhrVzFE6A0
         CQtjo2SSWJV/AtMRTF9Qd2i6k9VYzpu2ynYn+WN+vN+Fnawcd8j/CVE/JhmVMRlRlgpS
         JqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949380; x=1768554180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7thsI61iVOvUNh22HCK2qAPj5NTxS3xwSRoZruWKBf8=;
        b=kNTUhn0TaNvD7wHzaEFL8EkicqAbmEvBBSnR9cJC9+srFFo2XNnNSGmilyx85VpG3H
         3UggIseriC94HuqcRN1QTkwxG9har4yiICcSPpAVnOrJ2uqP3cOw7/rMCRr+1qv36wDY
         RHbHI/pP9lBAqLGvwGA+a5m1yaQXO1xjgGLcPPPcRMJ+T1f9BTAtLUdvcaAYT4wt5Joe
         AdF5r+yM7I5eYeFnHeBkGcuLgLlTC1RZFCuGGOyGXDypua0xQEurkbwUn3nPC6zBMR3p
         OJyVj41QyREBqjz/vzcn+j7qZUQyqkuTuUIHX7zb4467e+LP/Mhh2SzbuqZ6PsSGNMWU
         uTHw==
X-Gm-Message-State: AOJu0Yyu09hzVrZyDUKkL8fVUqy/ztiNrOik6n1tlJyPvjK0AoV6KV2e
	sGAfbExp1Jd0KTWk2EB+LTxREu4h2ciVRTckQslHwBwmu+5oWgWyHdQYT6O/sguei0KbtvT/kAq
	1nYYopdGFC/ljw47NoTU4uwbWBcYghRvX6w5gOlCW+a+tEEsslaxjUK2j4ae767vI9Z0kDT9Gn2
	t0oKY=
X-Gm-Gg: AY/fxX7eFygX2AhKq31C8H1yY2/H7HX/C1jyH+h+iZKJSNaxzC9Zksz5tWurnDg5EPz
	21Ix+2BMFYeXAJ1W8NSDoNKPuc0uKe9aDVfzk+aZeRwb8yWbCQzYU2unQOYjglE+xul9kbQDch8
	oNp9vF+Fs/U21auoXvTXD23UK7B52zieQYknVUhJy1B1XOv5jBRVGlPDDYR6v1YjCOag5Q0dW4L
	SrjIPakAgXOCxn5CsKmcWL4qibIjgXHDPUc3M3J+7Gf7H93PoOv5g+aHDRwk2TGJB+bh9NVexVm
	B7Z8tyhsB3mpC64Eci5iGF5a266iAS/J5oevZVmVwGfqOYq0idztCgE6IZgqvmL2dA26MLbd0Bj
	myRiJJhLkdCBW1CYB7RXk8Om85bpwvGn5Iix2rwgaysu/jKTwq18PLZdu3ovyPKXFotWMs4iFO2
	qg5PAlAynRJCloJWIJ3bPTWeTouxP0qfZINA==
X-Received: by 2002:a05:6a00:348d:b0:7f7:3749:d97c with SMTP id d2e1a72fcca58-81b7dc56e8bmr8974784b3a.22.1767949380065;
        Fri, 09 Jan 2026 01:03:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTMYGiUv7Wddy4gOxN3iVSD4nKGS7B9cg7aceUCQy0Uhht1CbC13+ZGNry/QY+i6KtaL7fHQ==
X-Received: by 2002:a05:6a00:348d:b0:7f7:3749:d97c with SMTP id d2e1a72fcca58-81b7dc56e8bmr8974749b3a.22.1767949379557;
        Fri, 09 Jan 2026 01:02:59 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e826asm9831562b3a.54.2026.01.09.01.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:02:59 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v3 06/10] riscv: Add functions to register ghes having SSE notification
Date: Fri,  9 Jan 2026 14:32:20 +0530
Message-ID: <20260109090224.3105465-7-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=YNiSCBGx c=1 sm=1 tr=0 ts=6960c445 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2d44Z0_5zRK2QUa08RUA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: FnE6BlrxIuC80BRakOq4SkihjBc_MNvl
X-Proofpoint-ORIG-GUID: FnE6BlrxIuC80BRakOq4SkihjBc_MNvl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NCBTYWx0ZWRfX5uwwJ41bizyt
 f+QWhoVtrrvrlgmU/AXMVOwA1wmhvybcUFNfixTJIej+g59lwUjUXMsubu3suWzOW2/i6NvEJ5e
 S78aSnjG4WpafOdjk6ybHGN/eqohvbbKX8xnBQIJUJC04aPT3dxmid38b8xbudXUvwgeJwQg6Oa
 hXvu9wK+UywMUXgEC0BBlMDeSxhFK7u2YSru0koAJOESuH4BuNhPEgjOPiRA1QgEnKueZlQ3bYj
 RuDOOVZ+tNfKv7EHxsT+dFXm9UfRcdc3w5MAi9NhYkuzO4fZl4Q2PL7wx2yWkyBGUsTCYwLVZTG
 sfKBuOg1VnG/6FybNxcs+U7o49NH7saOK6NtDUPvtdIfsS5tdXaVM57iROhEqguhWYdL2I5Mz9d
 ZUI4FR5w0VbPQXYlQ1kYM7PDLb2aOPvAE1ljUrfnwAfPlORTVTUafAMtwbIlH5j0FckeWvIlSeZ
 +fu49dVRkRyNU2sLpJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_010301_511265_CDBE37EE 
X-CRM114-Status: GOOD (  17.31  )
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
