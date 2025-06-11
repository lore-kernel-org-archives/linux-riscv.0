Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EBDC71135
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 07:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XYelgJAs2YHsMs7tZN9/e531jrhq7c0vqttfMxnSb8=; b=fEWW4fF7olbM5K
	YvIpAnQKBMQuT2bFO905MBWUvEm4Qdq+gD/s+zqDnviljYVi3SP21ps6tfgfcgNzfCQxLsABnHnD6
	hRJsjP+IfJR9a1MVUH8Vo5LTEYt6cwKjexzGkxMc8l0d+1eM9jDkodtfVW0Bay4VxpYSFjGMoOAUV
	anXtP9/z0Br+TJTKzpImR3E8kSfMaffHKxJo6/9c5iSGylGFtKJuqdW3cNvX19iIgCrtcLjiB25AE
	Aczm/Avej08WTzI32LixsUNIxwPqVr6rZ1mI2BqMFeYQqMcE5GU3opJ9YpWiSq6JIA2diF8diVsKn
	Yz6hXuwI7qWzUIBpe9UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFoi-000000095bg-2NAJ;
	Wed, 11 Jun 2025 07:24:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEs2-00000008z4j-11uO
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 06:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aEk7l982A/3iNmfI4ADDZgvcRJ/gPBy9EnX2Zk0GAIw=; b=UyG+vTpeHDjAsdIg72IIgTJiHF
	jax5HTvI5aZ2typsGwZCkMHuuxpeKo8eR8gZPNMFUcoq10pUa1SDrzq6mTgotYNfq/tusRijOm11v
	KpZDNHH2hlop6XCDu3qIa5BXIqdrJZ1Tf3rsWNlqjq8WQifG/LjOMkdqcgdupI/tA7p4eTvSFYtJC
	C2JIZeISlaGbkkZ5Chkpdk7IYkPwp2wLlijhro2u2GaVmM1q8lnq11Ve06WQz3P3w5Jcgd+HgIKSY
	WnIf4M2tniNbPfrYh1EmpgIsgHlyu2XSaONFgji/D2FgQf2RDNcWEmGwcJApLmint6Ng9BOrjw0Mk
	ZcaCb9Xw==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEs0-00000002847-1ENo
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:23:34 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-234fcadde3eso73723485ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623008; x=1750227808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEk7l982A/3iNmfI4ADDZgvcRJ/gPBy9EnX2Zk0GAIw=;
        b=jQrzIhcsWpLG+F7YZcLUti8Jr0IS27Wqw+2HYJwo4PzwsOh9iff90l3w6SH3pQhzoK
         n9JXTWbNMkjkD3FccmeGjP2RcwEDhRQIdcYSDBxAmuLHHN1xvI7EhGoLx3MFgBsZgOJg
         bekM7UNahrSRZrZ+MdASrWTQJvA+nz4yDom6E6HYqvuguQrXG+msQTizTPH86SKYB+o6
         pIzoJZ37RQIe8cEl8urggXk4R8HIrvyHqgY1ey2+fpZfxyydZAzZ5hUD0ywqyaXMrqyF
         vFFW4PaN2gMIXbUec8BaKOlMtG6v9jRrSxVexVn6a73q2pKNuHktVuFk+o+9XrsMObwF
         Q4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623008; x=1750227808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEk7l982A/3iNmfI4ADDZgvcRJ/gPBy9EnX2Zk0GAIw=;
        b=LsZmfhHiRBsatllNZd4sehzi7q1WWAg2xL/7dmi0jjOod37HZChJcwJEdhp4b/iBLN
         fnlW+mkPCaea+A5BLWCIfW31WobsfJAvC+f8W4qu+MRQh434TY7JyMIjb+68h8MYI2Y+
         S6DeSoQxdj8I75TnFP0jzBt1JZ0M1oGEISxYIedPtqXYuFo1u6y9Kkjst3B1NZ7sFS+b
         YJ218q0B5GzBXie+Llszi1seiT1oEo0xk0+pX7mDaDGB3JXTgRk22YsNpBZbB6IlC5Qn
         HsJBojTKz4LmlOx+3s0uHkxIxnGzj2bM5QxAQ2/af+r47Do36M10EVsQZjVlbd5dyLvg
         LU+A==
X-Forwarded-Encrypted: i=1; AJvYcCXrQB3eA0r8q7+TGDeyX6wUfFW1RSm2Lylcr8ACH2BMZpnHfj9fKWothhxZKB+LzUXO8byTEMbjsq1Jsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcIggWJ2bestnLBf3C54OKG63uUoHtW7MO7980qp8Vv78zuygH
	kIhTLO1jTQAPHHtkbCqaGEtN+e7opF2dbx9FcvAGMt0G46dSWsD0e2SFHVmt36VNxqExOlL7x1W
	DZwtBFkc=
X-Gm-Gg: ASbGncuxC37Ea5mVCR9d88xLJlg90y7/ArlR0Xhwup3CqDR2qUByDB5ygogqC9Xky0p
	1HjTeEUmx9EjJEc9AtNNubMrTBEirTYl2Th9XMnxsLFDL7JzG5WSPjB6uUgLRYySfqWhmPqsSI+
	fFIoBPEVpLogGgnjajB1gSbA4LPrQfCHQBENPs0xvj8a9kPouoYdzYPKWnC/tcL/40OK67FkxPj
	V/xJxt607iWjxDJAUILjwcspirdLH+XULc+qdE0xIYmwIWpD0WpCgdbKyaT96hOSQ1k7vZ/oZuK
	hADaA5/3YXL93i9aVt3LnnzDruuC/0Psi919bCsl6DLc31jBgm51fvERwcFQEDmPYUn9gzfpomu
	ivFES2a5J82I0O3Pn1Y+u5HElcw==
X-Google-Smtp-Source: AGHT+IGmMjAxKFfhQNXGR6+5ZNDeO/fKZhgBO21zoWdzah1Ay1ynpmgVEmCXF7UyFGfhGCa0JX+ytQ==
X-Received: by 2002:a17:903:32cc:b0:235:ef56:7800 with SMTP id d9443c01a7336-23641af0815mr26335535ad.30.1749623008101;
        Tue, 10 Jun 2025 23:23:28 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:23:27 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v5 04/23] mailbox: Add common header for RPMI messages sent via mailbox
Date: Wed, 11 Jun 2025 11:52:19 +0530
Message-ID: <20250611062238.636753-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_072332_396115_1D4B0A09 
X-CRM114-Status: GOOD (  16.39  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The RPMI based mailbox controller drivers and mailbox clients need to
share defines related to RPMI messages over mailbox interface so add
a common header for this purpose.

Co-developed-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/mailbox/riscv-rpmi-message.h | 207 +++++++++++++++++++++
 1 file changed, 207 insertions(+)
 create mode 100644 include/linux/mailbox/riscv-rpmi-message.h

diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/mailbox/riscv-rpmi-message.h
new file mode 100644
index 000000000000..fca1f18d93eb
--- /dev/null
+++ b/include/linux/mailbox/riscv-rpmi-message.h
@@ -0,0 +1,207 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2025 Ventana Micro Systems Inc. */
+
+#ifndef _LINUX_RISCV_RPMI_MESSAGE_H_
+#define _LINUX_RISCV_RPMI_MESSAGE_H_
+
+#include <linux/errno.h>
+#include <linux/mailbox_client.h>
+#include <linux/types.h>
+#include <linux/wordpart.h>
+
+/* RPMI version encode/decode macros */
+#define RPMI_VER_MAJOR(__ver)		upper_16_bits(__ver)
+#define RPMI_VER_MINOR(__ver)		lower_16_bits(__ver)
+#define RPMI_MKVER(__maj, __min)	make_u32_from_two_u16(__maj, __min)
+
+/* RPMI message header */
+struct rpmi_message_header {
+	__le16 servicegroup_id;
+	u8 service_id;
+	u8 flags;
+	__le16 datalen;
+	__le16 token;
+};
+
+/* RPMI message */
+struct rpmi_message {
+	struct rpmi_message_header header;
+	u8 data[];
+};
+
+/* RPMI notification event */
+struct rpmi_notification_event {
+	__le16 event_datalen;
+	u8 event_id;
+	u8 reserved;
+	u8 event_data[];
+};
+
+/* RPMI error codes */
+enum rpmi_error_codes {
+	RPMI_SUCCESS			= 0,
+	RPMI_ERR_FAILED			= -1,
+	RPMI_ERR_NOTSUPP		= -2,
+	RPMI_ERR_INVALID_PARAM		= -3,
+	RPMI_ERR_DENIED			= -4,
+	RPMI_ERR_INVALID_ADDR		= -5,
+	RPMI_ERR_ALREADY		= -6,
+	RPMI_ERR_EXTENSION		= -7,
+	RPMI_ERR_HW_FAULT		= -8,
+	RPMI_ERR_BUSY			= -9,
+	RPMI_ERR_INVALID_STATE		= -10,
+	RPMI_ERR_BAD_RANGE		= -11,
+	RPMI_ERR_TIMEOUT		= -12,
+	RPMI_ERR_IO			= -13,
+	RPMI_ERR_NO_DATA		= -14,
+	RPMI_ERR_RESERVED_START		= -15,
+	RPMI_ERR_RESERVED_END		= -127,
+	RPMI_ERR_VENDOR_START		= -128,
+};
+
+static inline int rpmi_to_linux_error(int rpmi_error)
+{
+	switch (rpmi_error) {
+	case RPMI_SUCCESS:
+		return 0;
+	case RPMI_ERR_INVALID_PARAM:
+	case RPMI_ERR_BAD_RANGE:
+	case RPMI_ERR_INVALID_STATE:
+		return -EINVAL;
+	case RPMI_ERR_DENIED:
+		return -EPERM;
+	case RPMI_ERR_INVALID_ADDR:
+	case RPMI_ERR_HW_FAULT:
+		return -EFAULT;
+	case RPMI_ERR_ALREADY:
+		return -EALREADY;
+	case RPMI_ERR_BUSY:
+		return -EBUSY;
+	case RPMI_ERR_TIMEOUT:
+		return -ETIMEDOUT;
+	case RPMI_ERR_IO:
+		return -ECOMM;
+	case RPMI_ERR_FAILED:
+	case RPMI_ERR_NOTSUPP:
+	case RPMI_ERR_NO_DATA:
+	case RPMI_ERR_EXTENSION:
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+/* RPMI Linux mailbox attribute IDs */
+enum rpmi_mbox_attribute_id {
+	RPMI_MBOX_ATTR_SPEC_VERSION,
+	RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE,
+	RPMI_MBOX_ATTR_SERVICEGROUP_ID,
+	RPMI_MBOX_ATTR_SERVICEGROUP_VERSION,
+	RPMI_MBOX_ATTR_MAX_ID
+};
+
+/* RPMI Linux mailbox message types */
+enum rpmi_mbox_message_type {
+	RPMI_MBOX_MSG_TYPE_GET_ATTRIBUTE,
+	RPMI_MBOX_MSG_TYPE_SET_ATTRIBUTE,
+	RPMI_MBOX_MSG_TYPE_SEND_WITH_RESPONSE,
+	RPMI_MBOX_MSG_TYPE_SEND_WITHOUT_RESPONSE,
+	RPMI_MBOX_MSG_TYPE_NOTIFICATION_EVENT,
+	RPMI_MBOX_MSG_MAX_TYPE
+};
+
+/* RPMI Linux mailbox message instance */
+struct rpmi_mbox_message {
+	enum rpmi_mbox_message_type type;
+	union {
+		struct {
+			enum rpmi_mbox_attribute_id id;
+			u32 value;
+		} attr;
+
+		struct {
+			u32 service_id;
+			void *request;
+			unsigned long request_len;
+			void *response;
+			unsigned long max_response_len;
+			unsigned long out_response_len;
+		} data;
+
+		struct {
+			u16 event_datalen;
+			u8 event_id;
+			u8 *event_data;
+		} notif;
+	};
+	int error;
+};
+
+/* RPMI Linux mailbox message helper routines */
+static inline void rpmi_mbox_init_get_attribute(struct rpmi_mbox_message *msg,
+						enum rpmi_mbox_attribute_id id)
+{
+	msg->type = RPMI_MBOX_MSG_TYPE_GET_ATTRIBUTE;
+	msg->attr.id = id;
+	msg->attr.value = 0;
+	msg->error = 0;
+}
+
+static inline void rpmi_mbox_init_set_attribute(struct rpmi_mbox_message *msg,
+						enum rpmi_mbox_attribute_id id,
+						u32 value)
+{
+	msg->type = RPMI_MBOX_MSG_TYPE_SET_ATTRIBUTE;
+	msg->attr.id = id;
+	msg->attr.value = value;
+	msg->error = 0;
+}
+
+static inline void rpmi_mbox_init_send_with_response(struct rpmi_mbox_message *msg,
+						     u32 service_id,
+						     void *request,
+						     unsigned long request_len,
+						     void *response,
+						     unsigned long max_response_len)
+{
+	msg->type = RPMI_MBOX_MSG_TYPE_SEND_WITH_RESPONSE;
+	msg->data.service_id = service_id;
+	msg->data.request = request;
+	msg->data.request_len = request_len;
+	msg->data.response = response;
+	msg->data.max_response_len = max_response_len;
+	msg->data.out_response_len = 0;
+	msg->error = 0;
+}
+
+static inline void rpmi_mbox_init_send_without_response(struct rpmi_mbox_message *msg,
+							u32 service_id,
+							void *request,
+							unsigned long request_len)
+{
+	msg->type = RPMI_MBOX_MSG_TYPE_SEND_WITHOUT_RESPONSE;
+	msg->data.service_id = service_id;
+	msg->data.request = request;
+	msg->data.request_len = request_len;
+	msg->data.response = NULL;
+	msg->data.max_response_len = 0;
+	msg->data.out_response_len = 0;
+	msg->error = 0;
+}
+
+static inline int rpmi_mbox_send_message(struct mbox_chan *chan,
+					 struct rpmi_mbox_message *msg)
+{
+	int ret;
+
+	/* Send message for the underlying mailbox channel */
+	ret = mbox_send_message(chan, msg);
+	if (ret < 0)
+		return ret;
+
+	/* Explicitly signal txdone for mailbox channel */
+	ret = msg->error;
+	mbox_client_txdone(chan, ret);
+	return ret;
+}
+
+#endif /* _LINUX_RISCV_RPMI_MESSAGE_H_ */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
