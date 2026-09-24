Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1405C98314
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 07:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFhRHSDjP58RvE15VQgCN65CsIMmhvyCtBF5UroSlTU=; b=Uk+NmGyBYQQupm
	Opt2VueLjzUaKkIR2OGSQ0Mtz/u4BRjsLuH+9slfARvJDC5nZiA7m//gwYKl1I1zp5Th31XG5Mupe
	hhbFegDOzhhJkOXMjVVVO4RqXG7U7iVXu9fqUGhhgoDVSMMrL5K0vADNh4VoZh7l0NVXDq85HtpkL
	LA1bKHQhO+5YM6hf/bDS+hheZyTwQ+0ji5yCzysPNWE5FeLJx1WaanAfx5K2QILav3iPV4wvLmPdR
	d6/mA0P6X8c+uEY8dG9Ua3MRYW7oHh1bZNRULxnknp54dp2jFl7xKtWfjXdVFSE2bn6isY1LqAxS8
	DeT/nc4ZYEeYFdGbVrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e2T-0000000AJUV-0rBx;
	Thu, 24 Sep 2026 07:38:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e1m-0000000AJL9-2DNB
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 07:38:10 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5e9uf2420866
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rdTF0U+iZv7
	FDTkpceF6pW19Gahev/fOfTV2XMSfzFM=; b=B6IAFx/1AqggKGQQG20qVPjR3Vl
	tz+UHmdzqasPjEUp0Q8EaLgxPKluZrS9VsMrXgpZvf++e3+a9KbIdhNqOKJmM6ZM
	aox0jnofcbdlR4gyBIbAOcJxPJmh/MWwGUK/ClZqDJN7SIGHqJZ6Ymuno1ytAG+L
	Fi9r8jqsiEWu90unQuuWe7mt7XWd7jHYsca68YQDikwOrEB3qk+0hZx9u+t2amfm
	wxSix3r1jdH7d91+14IVEmNSJhft7dMpiO6iRWKdymbp7HCFt/8b3ME1Qcjyk4dI
	5SrMU9X32C5WFoW3Tu5DhORS5VxLdguip4i9zuvyf+wuKS+NbWEtgK82I2g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstuhafd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 07:37:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so3295285eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 00:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235477; x=1790840277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rdTF0U+iZv7FDTkpceF6pW19Gahev/fOfTV2XMSfzFM=;
        b=ekE/BZPSQDQAPcVzZZF5PF9JD8eeYwkmCt0i6024RI3eNLR8S/1/5x8qsHLitho9oc
         QTW6sUvaF2iS7VBiu6sBFIY9pdXV97z/g9R/CC3wcBEqKBS18CKaPR6MP4It+xkcpNcA
         1dIZ/mSnnPtx8AiFwfA5khSqr3kigiy3a6JXXYj6l94v22OGsrmzjMQxtxClPZWWGZz/
         W5kZaiWk/UwAuhUadNHX0rl8OCOaRr8j1SJRM/c0wIgxRYrZDmTBfUjX7pWZICVZC0ZA
         82RVFUFNeuMN2UW3XJM2tZY+G/9gHy49z47am1HPSnP9fEaxBouEf0CAaB6T1J7rubAr
         Myhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235477; x=1790840277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rdTF0U+iZv7FDTkpceF6pW19Gahev/fOfTV2XMSfzFM=;
        b=TSkJDqX4QED3jd2NLYheGI+3jh2cwah/azMmjNxWd2QdKWWswFo+kofiRuDGXNAVLj
         qRe2giRYDtI30q0H6fa2eIJH2rQD1SPowyg0cKkom/n92YKUqQeebgds3znkBgsWYSSB
         EhvOVHjtzqY9wB1vBghm8jMNspVa7gs663jDme1VAGYhc5u1L9VmS8VEBBlwOo6fY/mx
         Fswzp9wCtzcqBF93lW2SmjC2kOIsba92xEyvUCb7k5B6IH5a6yPrXz0QTVLvSes2eHoM
         jhTraN8Oxt/AYYaIbPRJ6qhtD2ygO+Jy/lXyw+pK91n1HUvuwPPAw8Uzx+jL30hSDvWP
         z1qg==
X-Gm-Message-State: AFuF++k2KK+BMbX5zvh+S4LnqasE2xYFhm5PjmzxK/Qe2I3OnkskcZlg
	R7Vuczvl2nqZbcOMxvyoyPmoRv47wh+p+zaV/jDwo8NjlukGCIZEcpwP9aLb0R7trkxE6Oxjbk9
	3NLSNQd3Hl5oIVFI7GyD+XEwf1mUWNluqct0+Y9+UC1TuiYGYFAY2W6uI7pPhT9481AGMOiMXY8
	L5qQY=
X-Gm-Gg: AYBFou0PeS9/Y0JTWTQT3OVfZdDzzjqwztw6nfYn3JN5k5bnHbC6kvLbMbYRhWQO8i2
	1+Al6dcIGetWotqs6eOx8AGH1/PTmQNvK7zvcYWR0MocyMvUwY37sr1dNney0uPAR8oMp+We7+b
	krWJxFxdZM8IUPmxcno/q0mIPDZguvfZXWFD9CTcF7+Sa6CSd+yWzpLOL3Q+0LkAx69gNTpwTJn
	dODgufG+uKd3wrh43LEr5tYPcTgIgIAyyM2AQOS0AeXBHRJOD3VV2T5A7UyybtzajDfzrGiWVJS
	YswBQ2IIy8s6TpR7+SDb88gdeOMikaCAq32vxCTjaKoC9cXwDYyuE/lvge0LUzMeQEEqUCuy7Mf
	O05QvEs53iOwFEl0Xa5vTM2JZu3gen2ZTitWyqMs/KQL9f3UZBUrtw3I4NxOfKS2e/feNuEZvoi
	3OzqjUFdWBN5E3/+5KvxII2e6+V/yz3eA9HXo=
X-Received: by 2002:a05:7300:b181:b0:340:2133:5492 with SMTP id 5a478bee46e88-34021335760mr1299114eec.15.1790235477131;
        Thu, 24 Sep 2026 00:37:57 -0700 (PDT)
X-Received: by 2002:a05:7300:b181:b0:340:2133:5492 with SMTP id 5a478bee46e88-34021335760mr1299059eec.15.1790235476366;
        Thu, 24 Sep 2026 00:37:56 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7cfd9sm12120680eec.5.2026.09.24.00.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:37:55 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org
Cc: acpica-devel@lists.linux.dev, anup.patel@oss.qualcomm.com, ardb@kernel.org,
        conor@kernel.org, james.morse@arm.com, lenb@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, robert.moore@intel.com,
        sunilvl@oss.qualcomm.com, tony.luck@intel.com,
        zhangzhanpeng.jasper@bytedance.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v5 5/9] riscv: Add functions to register ghes having SSE notification
Date: Thu, 24 Sep 2026 13:07:10 +0530
Message-ID: <20260924073714.1650588-6-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260924073714.1650588-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfX58OooHjl3YeI
 F0g0Pa4DCCGlXQSKOC2YVh+Rq4/2PtehOHZYV3Yh7xiFDsufBP+PEloXE52L49Bv56273qUKPxL
 mwuq2nBpN0a+NHN+saMtBPyZ9e8Yd+U=
X-Proofpoint-ORIG-GUID: pAl18hW5Sqf6xHuzGqGiLH09ukEE4UjK
X-Proofpoint-GUID: pAl18hW5Sqf6xHuzGqGiLH09ukEE4UjK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMiBTYWx0ZWRfXwIeqC+48rWkc
 jMaCgs9hwvKuyoh/bOXejQgWHeafmr/olX/BY/iCmRbupZTRsJyFxjD3RUn9cpahPaLz2e4sY6s
 eZr2XCTipS52Sv6Z5bxJZt4uDLhdMd5ctcJ6/4I7SR5qWeKrR2cORtcUq1cfolVGCMub+rwi9xD
 3ZgXP+54ul+AZWhjV0nwA20ekCY1qZzZ8KBJ7QZu9rT4JPCWnjgW3C44V+TwsaWyUdINDj2vWGM
 sjXd/Q4IKNqPhusOjCUKo3eY23y+XQBpT5nUKQWHFi2mw76LIBDYOIiB1cNfJ8Xvn3IMBDdzgM4
 fpFan75l7I+2wwa15BpKGggHF1LBri9QmEY0YUIoZgLQ62YY/7XRT8pk+R3T/ci/dW3Rai3UgI+
 XhhLHhEnyku6o1QIUlH0XhORQ91JXxc3WFAkkNQE1rY7ziZbTCSq7nsAUx0uKxxOj1SyGXCR6Uh
 T9e20bbXPgDHgmcoQFQ==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab4d355 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Ozu7XyEW6BlgmijDRVkA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_003800_192723_D839DA3C 
X-CRM114-Status: GOOD (  17.92  )
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
index 69ce98380331..d4a8691fdf8f 100644
--- a/drivers/firmware/riscv/riscv_sbi_sse.c
+++ b/drivers/firmware/riscv/riscv_sbi_sse.c
@@ -6,6 +6,8 @@
 #define pr_fmt(fmt) "sse: " fmt
 
 #include <linux/atomic.h>
+#include <acpi/ghes.h>
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/cpuhotplug.h>
 #include <linux/cpu_pm.h>
@@ -1226,3 +1228,147 @@ static int __init sse_init(void)
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
+		ev_data = kzalloc_obj(*ev_data, GFP_KERNEL);
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
+	cb = kzalloc_obj(*cb, GFP_KERNEL);
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
index f6b3881c8884..b470abd61b92 100644
--- a/include/linux/riscv_sbi_sse.h
+++ b/include/linux/riscv_sbi_sse.h
@@ -13,6 +13,7 @@
 
 struct sse_event;
 struct pt_regs;
+struct ghes;
 
 typedef int (sse_event_handler_fn)(u32 event_num, void *arg,
 				   struct pt_regs *regs);
@@ -37,6 +38,10 @@ void sse_event_cleanup(struct sse_event *evt);
 
 int sse_event_set_target_cpu(struct sse_event *sse_evt, unsigned int cpu);
 
+int sse_register_ghes(struct ghes *ghes, sse_event_handler_fn *lo_cb,
+		      sse_event_handler_fn *hi_cb);
+int sse_unregister_ghes(struct ghes *ghes);
+
 int sse_event_enable(struct sse_event *sse_evt);
 
 int sse_event_disable(struct sse_event *sse_evt);
@@ -67,6 +72,17 @@ static inline int sse_event_set_target_cpu(struct sse_event *sse_evt,
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
