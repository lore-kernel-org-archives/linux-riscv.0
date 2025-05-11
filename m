Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB51AC3ABCB
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 13:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WRkQMSKUuzrsGFNtP7VlJU6w9oNWqIFyYpj38nGCns8=; b=1HryWrXym4bGUQ
	f/Bq0prX2Qwm5HYXTxzc9e/FUax4FGjUZ0vN2lQ+KJmvEPJnXWVCnMVWiLBSXydBggVfUIJEyS8Uc
	o5/5xrS5Q2LLAe5cfrSyG/rBqc/zB9E4aGodxlhlRh4cMa4aOtu7dQBYd5iadqOaq4M4SvgF1Qy+E
	ojh0+LEfkXQn3kTofJbIhthrJX/EqwzwKWV/4DNkdXOxauHBhPEMdr5Bq7VTmwO8u0XBNRNy44e79
	w2lP8ik7wACzYVVZEk7P6utUTEbKcL0Bs6acOBt6iMO80NG1yFIkTxtv/6gaqrnKDuLF0gskwnjsy
	TfVWMoToUJ+EDmMoKOhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6vA-00000007HRg-3e8Q;
	Sun, 11 May 2025 13:40:48 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6v9-00000007HQT-0b0o
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:40:48 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22fa28c761dso25518895ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970846; x=1747575646; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=js2wRDvj88k2TI/SLgNG/xNXCEurcccQBWfML9QlriM=;
        b=ZsZnciNJihtlTjNuQrJ6nfsQnO+4WPqNgZkUsG7vkIE+oU7MCWTqveyFlGep/x26Dv
         WH8SeiXT1OovaL/6eoworpKpkpln/BxC4iz9Rbu8mhihA4iALnypecYgaOu8aJQXNa/x
         SpUzVaTwu5lqnDxeEvwfbXs+p0ol2jDTs+a646Mv+Aagr/L76P7ZLH0OgfvcgRef7POs
         CNeNESRlRyzf8d+sUwvRZMpL3rg3L3afkfFsiaxpGRjViceOrTSKSJJo64KHUfSm9GVR
         /ztQv8xVqvGDGekH3IKRGjVE5NzEj6GAJh+vSRft4vWACFDf9AjGCPsKV/kVB410OnSj
         eA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970846; x=1747575646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=js2wRDvj88k2TI/SLgNG/xNXCEurcccQBWfML9QlriM=;
        b=v8vMNx6GuxGzzSL9605DUZVESe0EQsZ3WqJs4Mk3MEE3UO2Yqd3ndtnq60meDrvhFW
         UUd555uAhtZ9tDEx3gJXt7YeF1GXm5IYG3l9kOnXbF9ZbV+/GYoRqIjcOmkZTei4+UsX
         YjthLBnHY0Aq4IEuVFq+QbLZTUeTX8isXmFYexCUFtakaEEZn7z452wQBgkwN04f8Df2
         i07L5TyfG33TIY2B4H9raSI/rBufUrFSf9Tj6XdDPaSLhuWGrW4VH78UjP+qh6Q3U2mV
         7845lvQgLXSxoOw88dH0aeu51TxTBlEi0eA4ne2mBJeY3UaIHHrDeFve5+eJ9Nqeee+c
         9xzg==
X-Forwarded-Encrypted: i=1; AJvYcCX8G/DNf9idbmKLAdO5jcS+HlUSmAWhpQ2MAmndJK6U2nIOUEqJyvOl411yn22MAYVzbEq+zCz1O86ZHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YylkBdBOsF6SlTOjGdMHQJH/h6wmNOLOlvPZuMb5EvAizT26MfR
	hh/a/SdcF99PEdO0sTuBvbvQSnYI2Tk+0e39ZW+IKn/67uAM+c1A5nVt3SO40xY=
X-Gm-Gg: ASbGnctgZ26Mbzycd1V7oxh6c6Ei7RImBiM6rYt7uW4l6el6Xk5A5aDPejNu6KNqeqt
	JGFU1plpB/3Orl8Wc6h8jxetc9uUt0XTD0SQ8QWTip5/nHwMYaJFakdBR7T8pgQMDjYZq9k6pJk
	m0ltFrN2fXefJ0cnDil1GrjsKMKzfVCDNgIw/BLSxzkhF1O2NUaY46kU/1ZvH8dC+gOctMumM7o
	V+D/EFdnerEMsq8Idw6ANpXf9nhVaXRS7nUy69ETB0yopqcIUkQ0qGE9fYShD8Vl8q2Muj/yIol
	OGrQCo0nGWr/Fq7FGw6U3sG1E9kkCJDDW2vPRiAtU+Iq6dNo/qq6LOhbjTi6jiofsu47D5c748i
	64GMZ3BLC34X7PQ3Ug7HwGsqa
X-Google-Smtp-Source: AGHT+IHLlMfSVXjF+6NDGBGAmnvE5gBr5aeqANsPZFqUbeLJWT/B3Zg+fBKVlL1+nLWsayoo+HUozw==
X-Received: by 2002:a17:903:2f89:b0:224:1eaa:5de1 with SMTP id d9443c01a7336-22fc8b51ac5mr118165185ad.18.1746970846131;
        Sun, 11 May 2025 06:40:46 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:40:45 -0700 (PDT)
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
Subject: [PATCH v3 05/23] mailbox: Add common header for RPMI messages sent via mailbox
Date: Sun, 11 May 2025 19:09:21 +0530
Message-ID: <20250511133939.801777-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_064047_180782_318E9A24 
X-CRM114-Status: GOOD (  16.78  )
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
 include/linux/mailbox/riscv-rpmi-message.h | 206 +++++++++++++++++++++
 1 file changed, 206 insertions(+)
 create mode 100644 include/linux/mailbox/riscv-rpmi-message.h

diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/mailbox/riscv-rpmi-message.h
new file mode 100644
index 000000000000..77e1edc569ac
--- /dev/null
+++ b/include/linux/mailbox/riscv-rpmi-message.h
@@ -0,0 +1,206 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Ventana Micro Systems Inc.
+ */
+
+#ifndef _LINUX_RISCV_RPMI_MESSAGE_H_
+#define _LINUX_RISCV_RPMI_MESSAGE_H_
+
+#include <linux/mailbox_client.h>
+
+/** RPMI version encode/decode macros */
+#define RPMI_VER_MAJOR(__ver)		(((__ver) >> 16) & 0xffff)
+#define RPMI_VER_MINOR(__ver)		((__ver) & 0xffff)
+#define RPMI_MKVER(__maj, __min)	(((__maj) << 16) | (__min))
+
+/** RPMI message header */
+struct rpmi_message_header {
+	__le16 servicegroup_id;
+	u8 service_id;
+	u8 flags;
+	__le16 datalen;
+	__le16 token;
+};
+
+/** RPMI message */
+struct rpmi_message {
+	struct rpmi_message_header header;
+	u8 data[];
+};
+
+/** RPMI notification event */
+struct rpmi_notification_event {
+	__le16 event_datalen;
+	u8 event_id;
+	u8 reserved;
+	u8 event_data[];
+};
+
+/** RPMI error codes */
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
+/** RPMI linux mailbox attribute IDs */
+enum rpmi_mbox_attribute_id {
+	RPMI_MBOX_ATTR_SPEC_VERSION = 0,
+	RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE,
+	RPMI_MBOX_ATTR_SERVICEGROUP_ID,
+	RPMI_MBOX_ATTR_SERVICEGROUP_VERSION,
+	RPMI_MBOX_ATTR_MAX_ID,
+};
+
+/** RPMI linux mailbox message types */
+enum rpmi_mbox_message_type {
+	RPMI_MBOX_MSG_TYPE_GET_ATTRIBUTE = 0,
+	RPMI_MBOX_MSG_TYPE_SET_ATTRIBUTE,
+	RPMI_MBOX_MSG_TYPE_SEND_WITH_RESPONSE,
+	RPMI_MBOX_MSG_TYPE_SEND_WITHOUT_RESPONSE,
+	RPMI_MBOX_MSG_TYPE_NOTIFICATION_EVENT,
+	RPMI_MBOX_MSG_MAX_TYPE,
+};
+
+/** RPMI linux mailbox message instance */
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
+/** RPMI linux mailbox message helper routines */
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
