Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF70C677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 06:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12lNH1GbcT8Bsb6iZFnaVpTkbw8jLW95/zlaJ4foClc=; b=3d7d80awlTJyNU
	rJzoNslppfPWlD4NpBEP7k/JSJSu91bCnlFSkBtdmJQkrWa5cFU8CvW7SaLL3qApsadRglG8t8je5
	hanOrTC4kfFrIXb2l1mBuwJupB4yBAGov7RiXPbM18/CUrA/zGi5YPCSsXF4EkDyFCyGM7AqnIM++
	49G+hgeHe2OktZMG7cyxxmFyyY4YfK6ntVmgMcrFI8xfZ5oGYcRjepCrv0yj1As2aiWCvkncwzvxh
	H4yRLvpaYEzGoSJoXwSbpsgYIggKqa5XozZ8BAO0N9I/aijDsz7Rxn/203+AM8z3dqPnGIbnusnIu
	etucuwzUOtu/qYCx7Cdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPErq-00000008z0o-26ji;
	Wed, 11 Jun 2025 06:23:22 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEro-00000008z0F-0eva
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:23:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-23508d30142so79207175ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749622999; x=1750227799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3K28ccsWlxMwqCRbaP9oqvPlrdelc8/pGL6q7Sf+y0A=;
        b=IdtB+b0l1zQlCKjg3xuisFQgA20i5TJuC8B5/rTVeb1uUmaCf7puzViyFzxAG0ZJmR
         7Crux4GZAp+SHbzVGiWfPZ0QVT6NLvP6U0+HRrYQTkfvas745WgcJn4L4aj5gvkwTDwS
         HYV+6eDsmwRH/kks9GdrMf4tZFgA3OuX+9SMrgwZDxSbljp5ZEpCm5oI+vXwTaJjuqyU
         c25XsshPI2jUGLSesEWk56gfAoYRIFeWc1JprBYLwg2SUqPSRdwwpC/rwU1E5sebrypz
         1O/rQH6yTMDV0lNE5rQETFz5TLJ5nsY2wOGdsiKMytIAPXYGBqkoRt3vVhC6G326LTLl
         qhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622999; x=1750227799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3K28ccsWlxMwqCRbaP9oqvPlrdelc8/pGL6q7Sf+y0A=;
        b=CJqBxBTaQl34wfbw7y6LB0yWnm6+zSWVYG6Z4Sfm4R0dt+udTZDDTqReGq/i87vRkq
         U4FfMqcMJFCZNzAUqr5UWhUpUDd9nvYKhXoHBM1nEBPTxR4CMbISKLx50J+JZp4Q1q6i
         4PfsYPCOSlniHSyKWsaZTMRirBfDVd2pc5HQX6NjdM5Vll1UL5DMxmKorR8FQuMuxq95
         s822o5aGfa6d5fN/fR9ZZ0xhx38lZI+7iQzC7pEtvxOzcRUsAaPU9NwqCypqIL7t6Oih
         WoSSPqHmSgbrxL5uq1JC0BGxo9kjl28ZBUm8cw+MBQmUu0nPTwBtCV7vrJDyBUwyDha3
         +2LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfXUC5L+1E5V7jAe6kSAZzFELSU6yAH9bU+iJAzazzFtpQQi0AbVxzzbA+5w74a+2dLDG7/JLgV4zuUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyV/Z02DSAwUO9qJSMBUp7tW3NyYszpC2XLwafKGBE00vOkQUB
	sFEhPwa3h3lBpQDFZjJRBKJRSVNXsDQ7iLDx1wlmcVdkt/m7abq5buf/6jgoi++YgZM=
X-Gm-Gg: ASbGnctMzH4Z77nuksI82yC+6SHgy5DXIORrpvMLHeQPd35kVChuyn8n0FXxSgufp83
	0ZBeeHPdGZWmSch3qBdM+gbqSzJzi+QhbHPOx79Uv02HPbGfcIZoJ0VFH/I+9nT5dc19Ip41UdQ
	HvDVWS7quHUguJjyFseEqmn1/4HffHSzWVpckK5PqlG3plDnwJC2VgMcCKl5q63NVPmedHsR97t
	D3ZCdA3aGz1YY0ApU07q2B4NMSDOkTfjUiCnZqkQ2SZxkrCGjj0r6QUIPI1JkGbwDLZc2DJwqle
	8/nN6CBmptbi+5E9jeGXZg74WJR3VMTyRRGUHg+LMsYGk9RWLfLSobHp2rU3+X3GalykL7UeqZr
	c/Wc/V3m9KDcHeiCvg8SVrlr81w==
X-Google-Smtp-Source: AGHT+IHLDZwFxM0MKNLl6ed9TvPphtVlyXYtS+o1/xlJG/p+4dis78BCknfh/vBsGOTDe6Pt8koHtA==
X-Received: by 2002:a17:902:f645:b0:235:2403:77b6 with SMTP id d9443c01a7336-236426b4fb1mr22190665ad.37.1749622999268;
        Tue, 10 Jun 2025 23:23:19 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:23:18 -0700 (PDT)
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
Subject: [PATCH v5 03/23] RISC-V: Add defines for the SBI message proxy extension
Date: Wed, 11 Jun 2025 11:52:18 +0530
Message-ID: <20250611062238.636753-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_232320_195899_AAEB0C9C 
X-CRM114-Status: GOOD (  12.91  )
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
 arch/riscv/include/asm/sbi.h | 61 ++++++++++++++++++++++++++++++++++++
 include/linux/wordpart.h     |  8 +++++
 2 files changed, 69 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 341e74238aa0..cb89cd784a4d 100644
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
@@ -430,6 +432,65 @@ enum sbi_fwft_feature_t {
 
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
