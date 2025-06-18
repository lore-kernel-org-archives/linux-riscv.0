Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CDAC73C66
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8c7fbPyIdctD0OBCMttxGgv14nWDqBVQVreFmEpdAA=; b=LXmezPCe9D2wNM
	VOaz/FWwLkfYzrADMYIZff+3sjRiTa4z2JwfBffOqCLA8vhoTkHopVlyK4aqj4b7Rs/YNB1CpMfZj
	BaY/tYGT6uVgBsQe/IJd14n5aym9WHepNA96z3GYzu9Gr6TwK/MqxioLZ8O7GMt6nMJw8JYPkhrWg
	Fv2tBZF+NCHQtMa3M8WeyanadZZbqz6ZTjtqMmJhfv+XnOJNiueqFCsUV5bS5Kl2Mq9IlE3/FQ1it
	me62YIBCuJB+agVIUG93O4SI5jw9tuW4w0HsfB27FJrNzLAnygPTOO0TrPw6PA56QMd4wjWMSp3Tt
	FdLrUG/gDoSE2vRKPXKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsoK-0000000AHZ8-2YbM;
	Wed, 18 Jun 2025 13:26:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrgm-0000000A5Kp-12Bt
	for linux-riscv@bombadil.infradead.org;
	Wed, 18 Jun 2025 12:14:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nXsaU5bufMYm3XYxPsa+imfe1GGPBzMdyNVNNOxnCRU=; b=Lik2oZrVgM0SBSQvLNCKzeNTGk
	otPczsWk0ND9k4prcGuv7yKgBNmBgB/FjWfB6gl2Ie0TNzQF/hm+ExZuUC6v2BoiAtX1k1d0vSvF+
	whW6YPFrfVIAEdjN5aQ0zuZs9j4Rce4MBzYGutU+Sgz7MBTZIAoYgM6Og3zr4YmJHGXi5NcR2g0my
	WXQ3WGCEliAjGudYQmwUxu0WTT3w2bPMU6vrFRArpvKuh9GzrBVh3P/3LJaK2QPlW0ypFaL2bgPMq
	e53agVy1MgH2bMx8QOP9U7CXpxeIEDrB3IxbIJO7JoatTNFi/BANNdIGu4yKN+A+cGwyi4TCXS3Yb
	PUv+te4Q==;
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrgj-000000041e2-0ipc
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:14:47 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b271f3ae786so5020095a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 05:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248882; x=1750853682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXsaU5bufMYm3XYxPsa+imfe1GGPBzMdyNVNNOxnCRU=;
        b=lFAsRFIaijpB4H+cA3XtkdybiooCl7u0ZMrdIWyIecn1+lL2wJKoZ7pcCtbGuBZgau
         Bfxa8nT7RclO0VeHZQrNJ/uYxFYpatF32eO9JgyOSV9NyhjKS3/Zo5j2VN78uNyPdG1d
         9ypT8ywbJtMv0EyukOBui9PKexrvg1au0+LS0yUWaKX8JyQnoljokORadn3ywjSmtvvV
         /u6+0GdrEDblzj4tHRty874YnTsCOt5LO1Znw0c2Ew6B9zcc4nA7SKNdmbolaPt7VsFy
         qEvHK5zm3pp5vQKP1dR1oFjsmQ6cAMeWOPSTaVFh4y5IJRJ7rbONndl73Kd8xB+aAl19
         pfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248882; x=1750853682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXsaU5bufMYm3XYxPsa+imfe1GGPBzMdyNVNNOxnCRU=;
        b=PN3vwJa2uPxojBRP67r2OA/6OI5iSE1aOcQ6RzxD5RT4XeK6r8m7FsSyiBHU5QgmSR
         Rom8V03NcNOjFucoAnvLirlNyT3/s0KvddkGwCdrvxg0J66DmoHwutG9fXQoCX7K72Kj
         ichl7hReDeD3m2ausVDRu+zzTedQ5x6CJekAbt3AACyUICIzOYfVu4qJyWeXNYar/eci
         QkHlGC+ElyMFI97SGbQEhKSilGELeCYfGQy69Vd4785Zf0udfV+fh+YIgdn5hJF5L3EY
         bUmTHndnG8nWbfZGxejrqlTMUyNlTUIbzZcqAVXOdxZQHLTqQZhXkEJFe7x132mTFhp5
         TBaw==
X-Forwarded-Encrypted: i=1; AJvYcCX+Z7wx21XoWFiSC+84Z9iEQIovTwvpu9tlbrRDUge0sMZVCrhaLdo7X2PVeLZlq055QN6r8XxaR0qAQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOrLl6M8NSs0cSNqVsg/wf8fLlERkAYevcrv1kuFGD7P5VzqS1
	r5AgFWc6ZcbIm3pBzXdpzpFJYdxXPk+dqvqkZLjFOW9stEEdKBd9h8FX1smvG7pAjaM=
X-Gm-Gg: ASbGncuOG/CuC1w7IT1j/MqImUcfx152FHoRbe97hVN9+MiOfRajDwSL2eiFZNjcbNI
	HNXi0xTfM/a9cD+33+WnLuphVY1ISwXMh+YatN4IjmlDnbgefIsQ38oBUe5mtRctvnoNgwgxAmZ
	I8iSneDHiLysDkxmhlPrYVoJUUBn/UNj6DftejgC1rl0FldpC3fJzebbo9iPUngznBqJcheFjrY
	/N6hL0MUrP0RvT2LiOe90ZnY/6BFLg0kFp6sVtpOHRjXuavnahePHbgiQb7U0Ic5RE/RFQQ36d6
	OY6wppFzWJqO+o6B3CgLRzhJ0NcEbEclfgOLO3ztBcC2PfMaokGbtkyROvicCQgunqtiYc8OrII
	rpl05qsQvdjsapLEbIQg74OaPxdbo
X-Google-Smtp-Source: AGHT+IHDAt6S+LCqNlP/AcoJd0DtxuOspyynusq6LumWUM8AG0KDy5DjUm6vNvbZrBQI2+c48YQfNA==
X-Received: by 2002:a05:6a21:9006:b0:21c:fa68:b47c with SMTP id adf61e73a8af0-21fbd4d5478mr26347574637.18.1750248881659;
        Wed, 18 Jun 2025 05:14:41 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:14:41 -0700 (PDT)
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
Subject: [PATCH v6 03/23] RISC-V: Add defines for the SBI message proxy extension
Date: Wed, 18 Jun 2025 17:43:38 +0530
Message-ID: <20250618121358.503781-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_131445_347919_A1DFCFC0 
X-CRM114-Status: GOOD (  13.80  )
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

Add defines for the new SBI message proxy extension which is part
of the SBI v3.0 specification.

Co-developed-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 63 ++++++++++++++++++++++++++++++++++++
 include/linux/wordpart.h     |  8 +++++
 2 files changed, 71 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 341e74238aa0..59a7285ff956 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -10,6 +10,7 @@
 #include <linux/types.h>
 #include <linux/cpumask.h>
 #include <linux/jump_label.h>
+#include <linux/wordpart.h>
 
 #ifdef CONFIG_RISCV_SBI
 enum sbi_ext_id {
@@ -36,6 +37,7 @@ enum sbi_ext_id {
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
 	SBI_EXT_FWFT = 0x46574654,
+	SBI_EXT_MPXY = 0x4D505859,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -430,6 +432,67 @@ enum sbi_fwft_feature_t {
 
 #define SBI_FWFT_SET_FLAG_LOCK			BIT(0)
 
+enum sbi_ext_mpxy_fid {
+	SBI_EXT_MPXY_GET_SHMEM_SIZE,
+	SBI_EXT_MPXY_SET_SHMEM,
+	SBI_EXT_MPXY_GET_CHANNEL_IDS,
+	SBI_EXT_MPXY_READ_ATTRS,
+	SBI_EXT_MPXY_WRITE_ATTRS,
+	SBI_EXT_MPXY_SEND_MSG_WITH_RESP,
+	SBI_EXT_MPXY_SEND_MSG_WITHOUT_RESP,
+	SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS
+};
+
+enum sbi_mpxy_attribute_id {
+	/* Standard channel attributes managed by MPXY framework */
+	SBI_MPXY_ATTR_MSG_PROT_ID		= 0x00000000,
+	SBI_MPXY_ATTR_MSG_PROT_VER		= 0x00000001,
+	SBI_MPXY_ATTR_MSG_MAX_LEN		= 0x00000002,
+	SBI_MPXY_ATTR_MSG_SEND_TIMEOUT		= 0x00000003,
+	SBI_MPXY_ATTR_MSG_COMPLETION_TIMEOUT	= 0x00000004,
+	SBI_MPXY_ATTR_CHANNEL_CAPABILITY	= 0x00000005,
+	SBI_MPXY_ATTR_SSE_EVENT_ID		= 0x00000006,
+	SBI_MPXY_ATTR_MSI_CONTROL		= 0x00000007,
+	SBI_MPXY_ATTR_MSI_ADDR_LO		= 0x00000008,
+	SBI_MPXY_ATTR_MSI_ADDR_HI		= 0x00000009,
+	SBI_MPXY_ATTR_MSI_DATA			= 0x0000000A,
+	SBI_MPXY_ATTR_EVENTS_STATE_CONTROL	= 0x0000000B,
+	SBI_MPXY_ATTR_STD_ATTR_MAX_IDX,
+	/*
+	 * Message protocol specific attributes, managed by
+	 * the message protocol specification.
+	 */
+	SBI_MPXY_ATTR_MSGPROTO_ATTR_START	= 0x80000000,
+	SBI_MPXY_ATTR_MSGPROTO_ATTR_END		= 0xffffffff
+};
+
+/* Possible values of MSG_PROT_ID attribute */
+enum sbi_mpxy_msgproto_id {
+	SBI_MPXY_MSGPROTO_RPMI_ID = 0x0
+};
+
+/* RPMI message protocol specific MPXY attributes */
+enum sbi_mpxy_rpmi_attribute_id {
+	SBI_MPXY_RPMI_ATTR_SERVICEGROUP_ID = SBI_MPXY_ATTR_MSGPROTO_ATTR_START,
+	SBI_MPXY_RPMI_ATTR_SERVICEGROUP_VERSION,
+	SBI_MPXY_RPMI_ATTR_IMPL_ID,
+	SBI_MPXY_RPMI_ATTR_IMPL_VERSION,
+	SBI_MPXY_RPMI_ATTR_MAX_ID
+};
+
+/* Encoding of MSG_PROT_VER attribute */
+#define SBI_MPXY_MSG_PROT_VER_MAJOR(__ver)	upper_16_bits(__ver)
+#define SBI_MPXY_MSG_PROT_VER_MINOR(__ver)	lower_16_bits(__ver)
+#define SBI_MPXY_MSG_PROT_MKVER(__maj, __min)	make_u32_from_two_u16(__maj, __min)
+
+/* Capabilities available through CHANNEL_CAPABILITY attribute */
+#define SBI_MPXY_CHAN_CAP_MSI			BIT(0)
+#define SBI_MPXY_CHAN_CAP_SSE			BIT(1)
+#define SBI_MPXY_CHAN_CAP_EVENTS_STATE		BIT(2)
+#define SBI_MPXY_CHAN_CAP_SEND_WITH_RESP	BIT(3)
+#define SBI_MPXY_CHAN_CAP_SEND_WITHOUT_RESP	BIT(4)
+#define SBI_MPXY_CHAN_CAP_GET_NOTIFICATIONS	BIT(5)
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
diff --git a/include/linux/wordpart.h b/include/linux/wordpart.h
index 5a7b97bb7c95..ed8717730037 100644
--- a/include/linux/wordpart.h
+++ b/include/linux/wordpart.h
@@ -31,6 +31,14 @@
  */
 #define lower_16_bits(n) ((u16)((n) & 0xffff))
 
+/**
+ * make_u32_from_two_u16 - return u32 number by combining
+ * two u16 numbers.
+ * @hi: upper 16 bit number
+ * @lo: lower 16 bit number
+ */
+#define make_u32_from_two_u16(hi, lo)	(((u32)(hi) << 16) | (u32)(lo))
+
 /**
  * REPEAT_BYTE - repeat the value @x multiple times as an unsigned long value
  * @x: value to repeat
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
