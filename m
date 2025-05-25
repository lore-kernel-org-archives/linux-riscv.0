Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042E3C54ED0
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 08:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zb1+xVYl7TaAHMzNJ444KjIVzzJwc8PsscYNtYb6lmk=; b=LtPOxD/5jX7Psk
	zmPcwK0K+wQXOOPM756sPhzGpKaEWFxm+JRKdPv3hb4N325ZTh34G5yLwKNp+nNI0XI583z19SL8h
	xYjfYXYL8hFVpNYo/XQO++Kbf0jNsj+LSKv21ILWsjlzPMwIPHnkQYN/X5NvQZKP6zKpkYvTx59HQ
	MxAJrjQ5QV/00xvndyO9XBaphTAQc2WplnhjlnxN/0vC2Y6TgSzHZLZ2OPOQzJDZ3pHpSY3T1MlhQ
	FPKQ1aqhOwumWMDAdHRwTldJMkzhegUWUNSp763AA+xRTGiMuEvZq69PVxd0alkNTGrOG9grTLaU9
	lZWCznTiSzNxxCoZg88A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ71W-00000006mP3-2bAf;
	Sun, 25 May 2025 08:48:02 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ71U-00000006mNx-1Dx4
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 08:48:01 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-afc857702d1so946919a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 01:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162879; x=1748767679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxTPUwSNoQG9w3qR3LtIgBXvV+xInFFIHYJOltRLchg=;
        b=ed668g+a65bXtLgW9+rZAp/FdtFHoEUi0zWnMwaVbpskcrfLePXF8tmrqFN5wJX5eo
         fW5LygcFJ9JSlWNRHLxXrt4Iqxi+drhQkumeFAmtBZvRd/rRTs//UxYSH+hyLvJbhuKV
         9rO5Do/oqgJEprwT8XKZonoFx2HJ7XDdYX3TQoQyAcIR3nujL37Otqq1AE6JWsb72vqH
         5VZw3y3d8mAxFpeGiY+7G1huaxmTwGvmsSihIl9ydT6aOXRePdLkgSF1e4U40/bgtEv2
         5oFuYSkOfQ0J7SjiwgHueLQ0SuKU3wC9b7s6mb2Sbm8JT/a3dOQ8SN7aTDjiK299nN+a
         TewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162879; x=1748767679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxTPUwSNoQG9w3qR3LtIgBXvV+xInFFIHYJOltRLchg=;
        b=BZUkvy6KEarHMCpPwdGJ6mwA2joNVGlc80UXGWbChiVCyRneeBzUbJ9WhmjOnwHSRr
         43Q9gcG66tXHJDpuyk90hnBX2R7+0WIQtFoUQVYrH4f9yKla8fRrX2aW1ZUrwuQsCJgm
         vW7eiPRtYyLt1Yar7l/O+vMbquj2JUFkt0TRVwObgKfkm7UAKMrY3CCqpyDtvqO6pd1N
         dYJeizBUyYnN3pP1SA3zdC8HIQyQjfgiyQButRsiezUY/f18SCbggMiClRz7w4sCoGud
         NACZXkivigyUpbSVb50/0F18UQs+EuFu6t7LIZnCl5a9/W1KVgucvKVSV7QYkKWpVQRY
         EH+A==
X-Forwarded-Encrypted: i=1; AJvYcCU/ZRiIpFYrBwQC3K5eNXLX+Kqfmjuwi12SQHD/p5o8CxgDQdzR4/If9hzsg0BEDSTg5fDqw440aRwDbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMpFxF+bTg0zSIdBsdjVBrGaQBgzZP+hfDNfodBfqbQ4nO7GuW
	gww6bCRQQzyFRUOO5NN/kEMuff7F7Qm1ruQZH0SBjBn5jbP9kyVXwB1NyZ8UBvdAbPE=
X-Gm-Gg: ASbGncsn2W7ojZGIJpSONgXMHyWvP5PGi7LYsfI/d+AQURN/oQ186p1lvhdrgy4APcP
	CyDYBYMm8wC4d8nscjVbYe9ZqvZ5S+GZoOugUq171KgW56zZht2gzAQqL3l90sNqx0edW5WcoGZ
	0YhmQDoI/p2xxk1XJerDuTClUT2EgByUYb4ZVjkeArsD/eFJ/Ef6Nes2ZzfJ0qNtmzOM1ZvIecV
	0m+vV9zcjP0D5UvesmoG1EC+xOS/cdu43gZSGqfH/Sl1p6ReZyD7uZpfFY3GtnNGchnvbzENKmu
	qR+gGBgfNJ9NmD2st9R1uzfsQBxGJxTkLmlwhA/5fpWaFZ4rog1S656zRA1Gob/uhmkgKLXSS7B
	cwNxiYlZ09Lm//tj/ZkY=
X-Google-Smtp-Source: AGHT+IF6mcaEZWbA8iyluK8Fs5wPoJKNdBvm0onkyLBbi40FMwWBFWDsb1yc8bl3vzyCm+t/IpfIvQ==
X-Received: by 2002:a05:6a21:338b:b0:1f5:8e39:9470 with SMTP id adf61e73a8af0-2188c35309dmr9030985637.31.1748162879217;
        Sun, 25 May 2025 01:47:59 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:47:58 -0700 (PDT)
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
Subject: [PATCH v4 04/23] RISC-V: Add defines for the SBI message proxy extension
Date: Sun, 25 May 2025 14:16:51 +0530
Message-ID: <20250525084710.1665648-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_014800_329276_B8151B59 
X-CRM114-Status: GOOD (  11.32  )
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
 arch/riscv/include/asm/sbi.h | 60 ++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 4dd6aafb8468..d295c26a7c26 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -35,6 +35,7 @@ enum sbi_ext_id {
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
+	SBI_EXT_MPXY = 0x4D505859,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -402,6 +403,65 @@ enum sbi_ext_nacl_feature {
 #define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
 #define SBI_NACL_SHMEM_SRET_X_LAST		31
 
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
+/* Possible values of MSG_PROT_ID attribute */
+enum sbi_mpxy_msgproto_id {
+	SBI_MPXY_MSGPROTO_RPMI_ID = 0x0,
+};
+
+/** RPMI message protocol specific MPXY attributes */
+enum sbi_mpxy_rpmi_attribute_id {
+	SBI_MPXY_RPMI_ATTR_SERVICEGROUP_ID = SBI_MPXY_ATTR_MSGPROTO_ATTR_START,
+	SBI_MPXY_RPMI_ATTR_SERVICEGROUP_VERSION,
+	SBI_MPXY_RPMI_ATTR_MAX_ID,
+};
+
+/* Encoding of MSG_PROT_VER attribute */
+#define SBI_MPXY_MSG_PROT_VER_MAJOR(__ver)	(((__ver) >> 16) & 0xffff)
+#define SBI_MPXY_MSG_PROT_VER_MINOR(__ver)	((__ver) & 0xffff)
+#define SBI_MPXY_MSG_PROT_MKVER(__maj, __min)	(((__maj) << 16) | (__min))
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
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
