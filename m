Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5FBC54ED0
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 08:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XyOsYpAcxCpmTzeXtC368ZEmlgrQIpFMYUWXmpII5fU=; b=A70W5OPCMc0ada
	MhaAdV8qyPTU8t1VgOEbrbqky5cD3CQsJCDCakOHEcRIO4cOgRonKyUHVnizX6zqQNYEcCDQPJrHb
	FZrz1XMhIrvMc8ieK/37t6oNH8tQeJqA4hTAQzEaW5uQ2hNEpEbL0lk05YnSK3l24Hz8S4mMVIq68
	IaHnv+l1MtpLSedJsKCmS7MiovnwuRfDTsmStlvOlMHTlJ+0q2Y1tPbr/N/MjPFMB6oLxeeF2WfB0
	2H7VH/utyUloMWVLmLbw5j374dYA4fcv1Pdm89SAaR0wqy3KVthAuz3Tk+54UeVQyLW56k0VThZxa
	wCp6H9WVaaOhyhm1jQcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ71f-00000006mUT-0uqB;
	Sun, 25 May 2025 08:48:11 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ71b-00000006mRi-3s61
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 08:48:09 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7370a2d1981so768144b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 01:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162887; x=1748767687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiYIi2TBQ4D/J/59zGCWfzUZoAifRmoj7kn5FamW3Rk=;
        b=X4WBrcEeeQzaBOHdgsbnPevaQs+BteJK221wF9dhgcACygWkkfqjSJlOIqltV4RjVD
         RuQIAAcNZIun6yi7P1KLcXEadpRwodqoOZ28lNoGGhZ7Ei6OBwlJJcCRtFNZFKj+jqqN
         ovkOv/8wARuVWSfblZrlYlXvbA+YCMBsalN0ue3275VP9feZYMTCYq+stizwMm1XTdUE
         hHDWyB+lIT6AhjV3Q7VM0ca0mHrDIkoG+yT1krGYA/LW4fsDU4XQ7juVmjfSd90qcaLM
         gZ/kXvyYtii7gf8s2CBjjF1ybKezVtYxHKoYW5DmATi9R9AhnrtOapLUsyCAGoc+EY81
         LYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162887; x=1748767687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wiYIi2TBQ4D/J/59zGCWfzUZoAifRmoj7kn5FamW3Rk=;
        b=LufCGNn68OXK/gyHTktJDRzYFzzLexzqUZAj0nPJ+evHCI0GBpwVU4YA/eg6qHD+me
         TVEpPfpYxxfLDio0Efk+UdIwXHMbUDCWkRQSfgWViiRXrPpCWDiVrqhLkMozu8JQDO5d
         NKqxH1mHc7DXZV+9rB8NNkcaxTTC5DpwcLDV63KevB0tKBaIwfpyRMrAHB2M52MwFgN6
         1fTOo05l2zQolJKpVjycpJ5yu5O5L1N9BC/tko6poOPMmR6yQ0eA4XoD790WQsusYbzJ
         7OJzoRdfwjN9rO9X2y6jAPzKjlW1eJgcE+2lsf4AOGeLjZzz0uczcBiuN5t/88akeWUm
         oqZA==
X-Forwarded-Encrypted: i=1; AJvYcCUerBM767UgWYxrGJJq21WN0mhG45o3xjT9qkhBesq5LVJJDbKIiF+UeupwGgHbmG73m6LtECqIYpBbwg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxziC5dpI5/F3BwkZFY/bpAE89wc5kGvC+Xyjlc5y/8v+NKUt51
	CglcGj3XzenrRsLUUFvrnjN9Sivjz8pG+eAGHDe4bqnxt9eiIBIeUvOkaTDP/kS/jFU=
X-Gm-Gg: ASbGncuEgG1d6yUTGhOEt0h8L3FQwTPY1JkRPLL5PUdqCnIVGe3leYe9CwyKkK0VFZd
	cXgOyoYhRVKTVbfC/Iv1qPjej33nls2j9kcSTBfDipyfn+429ajnh0LyIySOzvbCVEWKqdCI7ou
	FPe8kvq7BwhNHloIj2TR/grViuEt8Vs/j2/UxVnGcIpdTS6CUe9YVgQ4RYxsY1gyGcS47E0DyvY
	Rr358Zs8Yi+oggv3VvxPa1Ka2QMAa/iJDJIucF0klF+EkNQrRzsIXlxLDkuY0PntuCEP6BOOAnc
	KxP6iKh/BUFGwtIW4a0BUcRW0+KbfpsqfEyYZ2AxH3bBImxE4r0IgCxeZ9IbEcAr/PuHOLUBh73
	hfCOBUmgP
X-Google-Smtp-Source: AGHT+IHLCuj83RBSXtF+CJjFR7uZzjXCVdf26lgkr+DXZnXL9xVDiqoLiuMn0ibtY2VqfD7+84bcnA==
X-Received: by 2002:a05:6a21:999b:b0:1f5:7eb5:72dc with SMTP id adf61e73a8af0-2188c1e8dd0mr8425307637.3.1748162886931;
        Sun, 25 May 2025 01:48:06 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:48:06 -0700 (PDT)
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
Subject: [PATCH v4 05/23] mailbox: Add common header for RPMI messages sent via mailbox
Date: Sun, 25 May 2025 14:16:52 +0530
Message-ID: <20250525084710.1665648-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_014807_961985_F87DD42C 
X-CRM114-Status: GOOD (  16.95  )
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
 include/linux/mailbox/riscv-rpmi-message.h | 204 +++++++++++++++++++++
 1 file changed, 204 insertions(+)
 create mode 100644 include/linux/mailbox/riscv-rpmi-message.h

diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/mailbox/riscv-rpmi-message.h
new file mode 100644
index 000000000000..6201d4dd6047
--- /dev/null
+++ b/include/linux/mailbox/riscv-rpmi-message.h
@@ -0,0 +1,204 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2025 Ventana Micro Systems Inc. */
+
+#ifndef _LINUX_RISCV_RPMI_MESSAGE_H_
+#define _LINUX_RISCV_RPMI_MESSAGE_H_
+
+#include <linux/mailbox_client.h>
+
+/* RPMI version encode/decode macros */
+#define RPMI_VER_MAJOR(__ver)		(((__ver) >> 16) & 0xffff)
+#define RPMI_VER_MINOR(__ver)		((__ver) & 0xffff)
+#define RPMI_MKVER(__maj, __min)	(((__maj) << 16) | (__min))
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
+	RPMI_ERR_VENDOR_START		= -128
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
+/* RPMI linux mailbox attribute IDs */
+enum rpmi_mbox_attribute_id {
+	RPMI_MBOX_ATTR_SPEC_VERSION = 0,
+	RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE,
+	RPMI_MBOX_ATTR_SERVICEGROUP_ID,
+	RPMI_MBOX_ATTR_SERVICEGROUP_VERSION,
+	RPMI_MBOX_ATTR_MAX_ID
+};
+
+/* RPMI linux mailbox message types */
+enum rpmi_mbox_message_type {
+	RPMI_MBOX_MSG_TYPE_GET_ATTRIBUTE = 0,
+	RPMI_MBOX_MSG_TYPE_SET_ATTRIBUTE,
+	RPMI_MBOX_MSG_TYPE_SEND_WITH_RESPONSE,
+	RPMI_MBOX_MSG_TYPE_SEND_WITHOUT_RESPONSE,
+	RPMI_MBOX_MSG_TYPE_NOTIFICATION_EVENT,
+	RPMI_MBOX_MSG_MAX_TYPE
+};
+
+/* RPMI linux mailbox message instance */
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
+/* RPMI linux mailbox message helper routines */
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
