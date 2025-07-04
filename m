Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F7BC83F03
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZKEIc4z7qouYuIFq76b84bhy57+goPy4I7CB+Hbw00A=; b=tDYz3QPut7iu+/
	qhDt4tW34sPygL914ubNllo5XQl5XAzMTkdK365dNe4eHd0D0wg1W673pnTmUewBKWLbFUcMwAcjl
	GFA9lSf6w91uf4gMBsjmfoCmmDvRGCaHGA5TMcV76qoO2hdQAd6txoYaOHQgztvv+erdDJtVoBZ3n
	HHOhf/V6vF0wMUt3ZJte7XC9jjort/7VrOznPWtznZ6IbXz0kRfowFBcylj3nzs6WQBc+s6gBRkY5
	pRxBwQOn78unBptY4YJ/qjucS69bmxlBVQqd2DBYyTgWvtdjMJfnBjy1hZ7dfHlO+fjg94GHxVWGJ
	yU1C80uxJXQCEb1yrtBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaVw-0000000DUrK-08l3;
	Fri, 04 Jul 2025 07:07:16 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaTb-0000000DUIB-3jkU
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 07:04:53 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so544474a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 00:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612691; x=1752217491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7NWz24690I24vfVTDuJoYnj8j4L+1x62uPEQcGO8p0=;
        b=WcKJkvza8roRbNhNe9KQ3QMxeh8HFkUe7LmXb01gvupXYgook2dAyieShS7ryPNtRC
         w+N6fJ+hOGANvsHQTt2mGJ4anueYK6DNitFXG5MQhGr7HnlLPgEAa6CRWy5wbwWU6Fx9
         NRI7JHJSQFJzk9YN+oVfO3npL+3L0axoHX1WcDiTecJFrQm1bzxGnLGMTLz2b1mi+kj6
         k5QKRnY3rP2T5uLYJj6UZQHO8HS4fyQQ8hjLwv4+OzJ4ZKAh3xvtmWi1BrEl3Y7PUqUP
         cWLZbhR2EzSiCNxfChNLnDTKEmg4yfuJO/i6Rxlb0xEDIrVj+rHpllMmqZ/FxcmsGtsJ
         ubdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612691; x=1752217491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7NWz24690I24vfVTDuJoYnj8j4L+1x62uPEQcGO8p0=;
        b=xCDRo+xi+mbT4mo2sZBMbL1CFwismPpPOcvbZaXBimJ4qJHw41R7e8EK2qT5Gb+/nZ
         O7WEr89XwmkEYs7fqmAjAFR4rqdL/z+rAOUCqn3FhkKFHqiWfuFBSwaqVAUDOkSuoN43
         p3NgU5ZqkXeKbR25QUduIq7Lm8kBVwTp4pfp4HWYjRzB0y80NkybVXBLgqCEns7ytYqo
         SBlU+Zb3Ps/XwIRWFA2j12PmoWdqtfGo3MzbHbFyczf8eXzkHD/hTENxlrz//O06GmYz
         auX6qKRwj7SToZ7CiPlBtjYLg8EAGym0ZdNFkeNhnAOmjfQiMaZA9+fE9KONxS0i8Ewy
         xiRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR6XzsPxJQJs4D6zOW2WdUpX7r3/iMPFn1bHikScdAifPO4ejMayZqf84cShej4eBNEVH/Tioq5x1l6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBXLgWcMzn3BfIy1+QVWsNzKj4BjvBj29DGgWB6bICsQAHjDsr
	Cj1r4mNSynYzfgm0EBT4ral5LJkLHIeSDiejJLb1f7yxW5a8Oy+eFG9EOit0jKFtB0I=
X-Gm-Gg: ASbGncsIriulWjIymMVQ7ME3OTNa08DujoPb22DvSc6+lLc7k24JAfrTXrT3aPYmNwO
	pwUbJqf4pjqMY2y3I3CrVttQY2QJ2g4iUo3HpHKqDqOSQA8cqNDA7B+icRl9GtHBw/FdS4NVYo4
	ZSr4T8XKNSgn+G4yqHk2B8bVIYtggtD3Rtst5FzuIL3F2X4FxKmNf1t2DZaz0tXMRPlXUNZyPsH
	fo6YDFUfmF4oHaZzfra7HxZoSAr2dHCURgTc3lDaxPvhEvfa74JxhfUOgnqem9nJyO7H3v6y9tK
	DdNO0vWrC6Wa+xb9gGDr9Xd2knSWt1KJHl3Zf9YkzW6ITzM7FVt+m4vthjUXY763D6xiOs9rl/w
	t2HcTuCIzCP1IorQr+qQax/TDJA==
X-Google-Smtp-Source: AGHT+IHbhzEYmSPHJ4b0jwZFgDw0qNeqr1RSuBsvBtFR7myfOtAgs9yPg06qlUcyFP0hIps55pjbEg==
X-Received: by 2002:a17:90b:1e10:b0:312:e445:fdd9 with SMTP id 98e67ed59e1d1-31aac44b747mr2607975a91.10.1751612690866;
        Fri, 04 Jul 2025 00:04:50 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:04:50 -0700 (PDT)
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
Subject: [PATCH v8 03/24] RISC-V: Add defines for the SBI message proxy extension
Date: Fri,  4 Jul 2025 12:33:35 +0530
Message-ID: <20250704070356.1683992-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_000451_932789_DD2D9399 
X-CRM114-Status: GOOD (  13.63  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add defines for the new SBI message proxy extension which is part
of the SBI v3.0 specification.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Co-developed-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 63 ++++++++++++++++++++++++++++++++++++
 include/linux/wordpart.h     |  8 +++++
 2 files changed, 71 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 341e74238aa0..22f6e70cd32e 100644
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
+	SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS,
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
+/* Possible values of MSG_PROT_ID attribute as-per SBI v3.0 (or higher) */
+enum sbi_mpxy_msgproto_id {
+	SBI_MPXY_MSGPROTO_RPMI_ID = 0x0,
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
