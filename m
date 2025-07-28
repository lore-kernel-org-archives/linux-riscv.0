Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB9FC83F17
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 09:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZKEIc4z7qouYuIFq76b84bhy57+goPy4I7CB+Hbw00A=; b=OTZV0oO8s3/LmF
	3CMKnxLA8/uVeg0cjk6FLRBEWTixgh8BoRfJeuWiwRCq1AeP8p0nsb7HDwpy9tfkfyn32GHk8Z2pg
	o+631pKCc0chHXPB/+XgdV4Pq+3o0SfOXGO275WoZilKXxAjxuGEw1UMwOg0SVgKDHDbx49R6A6kz
	mqhvMkTFkjqL5KdA+roflzfQYiYxFtM1ihJNRR0idTEIzr924KUnHDnCFquPaUocpB7BvNkXXaK1I
	gG5Kdtpmxb9HdPZO4td12sPAL7c3aMZD6P+Nm9rMFL7co/EEf+psHZTuMhCqbzXD1bwiQjHbD/wLO
	TCii9MWTQJ73JyIcVKHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKMN-0000000E7ky-3sEh;
	Mon, 28 Jul 2025 09:41:31 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKML-0000000E7jw-2Cd9
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:41:30 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-31ca042d3b8so3421422a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695689; x=1754300489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7NWz24690I24vfVTDuJoYnj8j4L+1x62uPEQcGO8p0=;
        b=bqT8LDudmCn9KdOOvaMoDTEBtBMlSWTcs2YUu9IsR1a4rbdMPYsiT7KlQYnBVnkbob
         mKn8Z6KWqZ4cKY1bs7AESqlSS5BRN1b12glDvCDvnli478finpAADCyO3duhUsgFYYvI
         hueXQ+9AjUq8KWMt2ytls9/nsFUEFxpfk8F/N6Op9lqWsMPL4c1AoKDqQ+ob67phuCQj
         qJdibzhAEY7EF1sdZGDUUjxSyTL4CLSJHD7Vl175Grl+41Wtlarvv8Sq/E0hHzUMf6ls
         VyDBgxOFMsJLuEAxblwxmgUME64gu93F7xu3pV2n7lCCuOka0FXR/1RC/AsKc10i4TYf
         sZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695689; x=1754300489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7NWz24690I24vfVTDuJoYnj8j4L+1x62uPEQcGO8p0=;
        b=hINGceU/cOM9EM2VA9wILik5JXp+A3TqbLCPDnyTSXazhCSyZObvHF+cgVhbuS7wmN
         aHB6nBtxxgQpqBRB2MNlo1e9oPbSnDxH1bVd5VWCRKH8oEfxPqj7oeHtLb1NX9xTZZrp
         RoVNAxT83XB8EVF9rvSlZ33QyVDsx3mvrL2CCbYFgM5TWw2PUhFX65Woi78ehUicUXbs
         2JuvM+8jXJ/KXNIDEHXmMvNXBikrL5vzCjPMaomtiq1Z61F3lSjQAzwGkucVKV36R/ra
         gAqzotxbiDqWxYOnCJJVf8TVKj2+yCkRteZkk0TMeDz6otx8Ax5lSwVSZmci0UWg0fRx
         K/VQ==
X-Forwarded-Encrypted: i=1; AJvYcCURyGn9GSvDHmARS/vbFKlnQsLFPD8j3kPuwvxPN7da+K6yAnMLQWjA0J+1PF0xj6JXiOE1uvu/kx6ySQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwE0RdAxNyNcll+DwcxSGO2DdJzSJQrSjFYvMv+/JkIZ/K1Q8Re
	xQunBxmUqUHzbKyxDd7UWG+FibqPi4BWNrAlFfRc+PDKtPrAEaf418kmzTe6kuJQW84=
X-Gm-Gg: ASbGncslEiJlSJXuRICezcnwgSISilIrI2k4lQsdP/HY4Yy1fKNRfzQt9MtiIoJg7Vm
	R4J1MFBZ0xVHTFS0oQufZbZG47MQQBBPhRvXgCY+Vn1Kh3ovOpHWW/KOzJ9ZhkIRqvV/+7lvY1z
	IUvlLZ+zZnaZ+XysEeSsRQI8G814a2R2O/B8oQZtQOkjvfOdRp4hSvJ25+YgH0yeLHW9A7yP+UU
	qgF8jUN3Na9TViTPluWZJlu0mgcE8lnbpqpdUtIKvrxe+amqEV+lnUC8bmd6tE0uJKGjmNTPBVF
	tgrHSUbL70qgre6mrqKH6zCI/BZqSVb6AX8o6jFU9wtETierUT1uULBqsWotecg5j5rSVsS4Iyl
	sQHgBlEZaMvESnlLZNugK0a/6Izzj0PTcV0hWEC3AhRaN9IUV7VM/ebbSXgGM
X-Google-Smtp-Source: AGHT+IGHvXUp0klG2IZgTeZspvgsTkBclEVSkU6fmBMU5iF93kVQ+B6MpF1hlObdmg0SKveb59e7Hg==
X-Received: by 2002:a17:90b:1650:b0:313:20d2:c99b with SMTP id 98e67ed59e1d1-31e7787c856mr15209245a91.9.1753695688442;
        Mon, 28 Jul 2025 02:41:28 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:41:27 -0700 (PDT)
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
Subject: [PATCH v9 03/24] RISC-V: Add defines for the SBI message proxy extension
Date: Mon, 28 Jul 2025 15:10:11 +0530
Message-ID: <20250728094032.63545-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_024129_563534_C9D35FB4 
X-CRM114-Status: GOOD (  13.49  )
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
