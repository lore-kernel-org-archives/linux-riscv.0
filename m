Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E53ACCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 11:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CCaxQVEROhpzJOszX60p6GAQNL1YjsLZpcxVnkMhLQ8=; b=YflD+6AufRkjjp
	8EsTwIOtgQa4E0zWoSNFKznDNjdpTiIBnvC5y3XRrJtaNW9gUvAOGwVcfse7lgA4M2i7wgn9sJvyB
	3S0wGbsMLwTPAN3iswcXysNRWgUgdNqDVWN4Cuf0wj22rb4/87JocxRs5zPRl+XziRz5wB2lHeMqA
	ceKzL43TGzYSslfw7OEnamQ8n/qByBw2K5s99jF4FcMPM2clxNWH5j2H4VUqJvP4ww7BT8dUzuHLP
	+wKbh08iCPZbG/0OaDJ7w8XGQRPaE6d7TEXnR0mjuc+hENstVISRFJx4Lxdb/n21zxTvZNsmbF+pt
	I+cozROmck8PYLEIYFWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4L4-00000000yAm-2xDV;
	Wed, 29 Oct 2025 11:27:38 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4L1-00000000y7o-18Dc
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 11:27:36 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-33db8fde85cso7266600a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 04:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761737254; x=1762342054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cSTruKqOLsH1I5PXwtSeYHag9AZi6yAFctm+4E+iHg=;
        b=egakytBJscUtMI5srU1cBCcMTgKCAhbZG5rh3fL89j0PUgtZi0tspfY2E2Sx3CXLsy
         lV9WSHt03ohb09d0OSBdU6aDkr86R8UWScHmrriBIouEOOa9Ic7fadLHVQwNlx+eRxWY
         v1wQ7JfnZbDm2YN4vojc/1owWnQN+VSicDr4xZV7ahv9ofzu3rFoHHrQzMpxN0Cr7enY
         r0cRh8kG7eKm55Hwogink1KqTssjEP0kEADbLlFG/DOX4tIJDQnOxIg6sZPhTk88je4h
         gXz4GilJiQE6qA/VXg2RbBAGxzd2LplHtKbkmpqDZIwbpaxrIyTUwCzM2eMLliL87lUg
         CjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737254; x=1762342054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cSTruKqOLsH1I5PXwtSeYHag9AZi6yAFctm+4E+iHg=;
        b=Jl8lNncL7UI0WSbRnrKLbmVWiu70vcHJ8glt9Cbgi2I0ZKRJn5olN2MSJnYA0h3sG7
         8zMJMnWRYFlrp1LCGFsLHAS8RaM0qdAwLa+Wsw//zB07nY+GtW3xg6QJn9wtjBOKvCGg
         KMagsa1P771BtPtgRLsAzulEbBUFmz1AV12hUlLQ3JYlWn3qdfNbi+7o05U5MhMITyic
         pHnm/ckO+i9xWnsWYbyYEzb4aSIu79K4AeoP+96n6+CKhBGTL7dr27u/727/oQx7WaHS
         7NryTpH2bqvfmt51nmO/HqeQysyKsmagWlWh9MM+3eGyMBTwxbtKYwSl7f/GTZMmIvGw
         hM+A==
X-Gm-Message-State: AOJu0YyIR2iZ80Gh2tA2BgJPlQ/55RaIfq6osWajK/DA9/HaVlrsAw7N
	P/d2dD6KKZELKXcRu42OgLbxjFEBnba5qNRg1qfkjOJZrwN2uvkDV93TQLpYLMCbl7Z6LyJerqB
	e67uEq4nySQ==
X-Gm-Gg: ASbGncuhachU9t1nfgLeDyCez3ctEyPGuSDmNwhID+3mT328E031F/pa4FT1LAh076I
	YqoQYPrT00U0xwRDK1UN0XryfY5WJlM65+ZajU3ICx189jqucsWiuDOV4FAvYVsBYnWu8qxVx1W
	iRKlyqPYcnV6u1KPBetjoPJfEjQV/5KpGzKVFPXvDTeZSBdfoKf43hHotqGYkdLVQtZNUYxwxdw
	+KDYGPpFmJ2kA7e/pb/xHbdvRLzGTI3f033DMdz6qYTPO4qsnH9Lo7cX2o1SDuXnKDzJ2onyywe
	mrcFozk4guyBcODhpF2NC0koDRF6bZvXWB3s/jWZyA3jUAEf/45C4BY/+11z0kV40eP+4HPrc0E
	T61WxyfyKxjwX+L1QxxEwCKktr51ca2JYWgJc4WrLRUNIyJJlekqIxoGvG8zpGSYoGyAgWDXJ25
	P/TJzdJYiPYgoVbfJXsj7/D/Ldhd9qHsUf6OqMcLA=
X-Google-Smtp-Source: AGHT+IEEUQbjEhb35jM58E8VRwx1ELP2wmCevbIBmE4Rmb/2cMhIG6S77jc+DoMY/nX9v+1TYNMJig==
X-Received: by 2002:a17:90a:fc46:b0:33b:938c:570a with SMTP id 98e67ed59e1d1-3403a301f0cmr3025943a91.33.1761737254196;
        Wed, 29 Oct 2025 04:27:34 -0700 (PDT)
Received: from ventana-desktop.localhost ([2405:201:d019:c0ce:f7f5:7789:48e5:c03f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7f6040sm15316918a91.16.2025.10.29.04.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:27:33 -0700 (PDT)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v2 06/10] riscv: Add functions to register ghes having SSE notification
Date: Wed, 29 Oct 2025 16:56:44 +0530
Message-ID: <20251029112649.3811657-7-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
References: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_042735_318048_C5EF7CD6 
X-CRM114-Status: GOOD (  14.13  )
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
 drivers/firmware/riscv/riscv_sbi_sse.c | 147 +++++++++++++++++++++++++
 include/linux/riscv_sbi_sse.h          |  16 +++
 2 files changed, 163 insertions(+)

diff --git a/drivers/firmware/riscv/riscv_sbi_sse.c b/drivers/firmware/riscv/riscv_sbi_sse.c
index 6561c7acdaaa..46ebc9e9651c 100644
--- a/drivers/firmware/riscv/riscv_sbi_sse.c
+++ b/drivers/firmware/riscv/riscv_sbi_sse.c
@@ -5,6 +5,8 @@
 
 #define pr_fmt(fmt) "sse: " fmt
 
+#include <acpi/ghes.h>
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/cpuhotplug.h>
 #include <linux/cpu_pm.h>
@@ -700,3 +702,148 @@ static int __init sse_init(void)
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
+		if (cb && cb->ghes && cb->callback) {
+			cb->callback(ev_data->event_num, cb->ghes, regs);
+		}
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
index a1b58e89dd19..cd615b479f82 100644
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
