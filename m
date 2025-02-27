Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF621C1B0FF
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 13:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmf9uQQkIoLvmTFzyFncsvOCAJPiXCjgmYSlGCzCApo=; b=MZRuVuDd/Lc+IO
	sSfwdPbqxbmVVHbK218PkPpnMjpsBwE5Ng4PmMq0+5YZCpslwGu9OeB4x0S6UPB/nXkusaESaxRl3
	mzrOQ4cZ648e2RRXJifOXJfil8zDpHZy+AwxaRgFSUPtKvCCZpRYejVBbK5VqhbgLhb2p1hTTsMrX
	2lppGaJGcgZKQ9jS8/VtfpMtv61MyHuV3SKEGAU7IpPK4urqQEayLlB2xG2D1UAjMzP773tqzF4D7
	tXZjq0XvQlvv5Y3eByTEJkkoaXAwMiTqzp4EGl/gDwcZ3dIAhqfjhYw0ChO6dI8qc/ihiGBArIQeJ
	dJ9XpLlxEeKr9IjKEW5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndol-00000007VAX-27P0;
	Thu, 27 Feb 2025 13:20:47 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnd8Y-00000007O7j-3on1
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 12:37:12 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22359001f1aso9667915ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 04:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740659830; x=1741264630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kGyolrr9eB+rihlUpak7d80WkLbYEDuFsdAvhSOlWk=;
        b=d2o7mBq1s7ECesEgSw2cqpgiUFsRK2USYRH5c/tdUMwPb1HVV6UjJ0Bn3mSlFuNygQ
         5vPACp+mAO54nEvkwfKdXPnVC1F53GqYqCVqqe9/UVYMgpAl63GoLqyZPEmgPX6i8PzO
         mrnMswW7Iw8InyE0Fvt525ekP2RQl4mfeizcP3ueBB3XhCKSe6aV9g6ZIXvdbgnI0zPB
         yMASGY1gZjmVXRpoKZsYglqH+b6WqP0vqRpM80Lq6fTfebbUAuleCbDt05NnNhUN3w0i
         rBx1ItE7CsmhSDxtMVzQsvO+DQ5+7Dv+y73uXdDxdee1gHP/RFHk0SWZtyf0IpBj1EXK
         SKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740659830; x=1741264630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kGyolrr9eB+rihlUpak7d80WkLbYEDuFsdAvhSOlWk=;
        b=Pl+QApu1L/0w6DQFEGyLgdv+VcgD3PE00FLyvBQF1ZzmtQTAYgADtWZCvJCFwq2ZAw
         67HjLYVQUSsFduP2b8KvlMjY6v03JtLYfDv4iTKH2xjuqif0NhzxMQVwRZE3yunBrnYA
         wrDN06Vv+4u0BoMO1fiUH+Wn4Y12L3L4JhlbW2uo2p3F72UkfKAjKqz4SaQYgKya8hl7
         S/Ih6ZaBDNieE3csMZn4sAiyBp+uXPHiqu3K9KIANKVHC98VOQPdHa3xJPiVZxsjk1b/
         ck3mRinftM95rldlFEMcdB129jq4hQbNitFunb30WvHGix25C7wWwaMyqJKWzraLCMqH
         XgrA==
X-Gm-Message-State: AOJu0YxGWF7Ts46eoE4bUjmsBvlEV7kHPSDKFkeOgPkqAHnv7mdP2mCJ
	5fUrHnGC6oNelXQ18lYgi/8bJaa3nLgSukO+heIFLQjmXK/t7WYTvygXG9eRfSM3AgnjfpAXYF2
	q5+g=
X-Gm-Gg: ASbGncvogWZCV/s0W+Cf+gK/YF/WaRc2etY2HF7+06X6hUy+dRxZ19Bd0j6yM7f3Xrk
	CWlGQZ/xjfJZt9cz7sIHa9djAj3V4HCLd3WHjoToQ7y4ipWLzy61WYWninrw9+CXXiin0BSXj6G
	nCJSs4XtitsOMQig5qMgcDRGmQdahMbGtLLdguIlqmTMiwhqj4aJhAES/dIKHar4fBYVOwtPNjX
	CioL+HshWweenlY1OoAPsZhtkLmtX9+JZLDymk5+bevts6Ab3wMhlDylfIyMK+yJK6a4dhi16pM
	wauMHs+OCU/ml8lMH3A5XKvlIzT+C/IoYt8A
X-Google-Smtp-Source: AGHT+IGCecOAkzBb0oLJqkAuzU2vtPXYUZlAY6MApfNhCwxjDIHSb/IyUg2/UngOj1IqUQZUagR0Tg==
X-Received: by 2002:a17:902:daca:b0:220:c164:6ee1 with SMTP id d9443c01a7336-221a1148bdcmr409969065ad.32.1740659829813;
        Thu, 27 Feb 2025 04:37:09 -0800 (PST)
Received: from ventana-bhyve.. ([49.37.249.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5bddsm13219135ad.140.2025.02.27.04.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:37:09 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v1 06/10] riscv: Add functions to register ghes having SSE notification
Date: Thu, 27 Feb 2025 18:06:24 +0530
Message-ID: <20250227123628.2931490-7-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
References: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_043710_952337_43FA7DF1 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: apatel@ventanamicro.com, cleger@rivosinc.com, tony.luck@intel.com, Himanshu Chauhan <hchauhan@ventanamicro.com>, robert.moore@intel.com, conor@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add functions to register the ghes entries which have SSE as
notification type. The vector inside the ghes is the SSE event
ID that should be registered.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 drivers/firmware/riscv/riscv_sse.c | 147 +++++++++++++++++++++++++++++
 include/linux/riscv_sse.h          |  15 +++
 2 files changed, 162 insertions(+)

diff --git a/drivers/firmware/riscv/riscv_sse.c b/drivers/firmware/riscv/riscv_sse.c
index c165e32cc9a5..511db9ad7a9e 100644
--- a/drivers/firmware/riscv/riscv_sse.c
+++ b/drivers/firmware/riscv/riscv_sse.c
@@ -5,6 +5,8 @@
 
 #define pr_fmt(fmt) "sse: " fmt
 
+#include <acpi/ghes.h>
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/cpuhotplug.h>
 #include <linux/cpu_pm.h>
@@ -689,3 +691,148 @@ static int __init sse_init(void)
 	return ret;
 }
 arch_initcall(sse_init);
+
+struct sse_ghes_callback {
+	struct list_head head;
+	struct ghes *ghes;
+	sse_event_handler *callback;
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
+		if (cb && cb->ghes && cb->callback) {
+			cb->callback(ev_data->event_num, cb->ghes, regs);
+		}
+	}
+
+	return 0;
+}
+
+int sse_register_ghes(struct ghes *ghes, sse_event_handler *lo_cb,
+		      sse_event_handler *hi_cb)
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
diff --git a/include/linux/riscv_sse.h b/include/linux/riscv_sse.h
index c73184074b8c..16700677f1e8 100644
--- a/include/linux/riscv_sse.h
+++ b/include/linux/riscv_sse.h
@@ -12,6 +12,8 @@
 struct sse_event;
 struct pt_regs;
 
+struct ghes;
+
 typedef int (sse_event_handler)(u32 event_num, void *arg, struct pt_regs *regs);
 
 #ifdef CONFIG_RISCV_SSE
@@ -27,6 +29,9 @@ int sse_event_enable(struct sse_event *sse_evt);
 
 void sse_event_disable(struct sse_event *sse_evt);
 
+int sse_register_ghes(struct ghes *ghes, sse_event_handler *lo_cb,
+		      sse_event_handler *hi_cb);
+int sse_unregister_ghes(struct ghes *ghes);
 #else
 static inline struct sse_event *sse_event_register(u32 event_num, u32 priority,
 						   sse_event_handler *handler,
@@ -50,6 +55,16 @@ static inline int sse_event_enable(struct sse_event *sse_evt)
 
 static inline void sse_event_disable(struct sse_event *sse_evt) {}
 
+static inline int sse_register_ghes(struct ghes *ghes, sse_event_handler *lo_cb,
+				    sse_event_handler *hi_cb)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int sse_unregister_ghes(struct ghes *ghes)
+{
+	return -EOPNOTSUPP;
+}
 
 #endif
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
