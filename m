Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17D6CA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 04:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VjWXWs6aQLrQ7CY6kHZPGVwTsyT1LbVoumRkwyRyF2Q=; b=CjKLoLK22XGhlN
	q70TV5ZPadXo95/nGIsB7t72qLPy1+DrVP4jTRNxCa3GineAr2Zarr4zaqBLIxU1mKVRsn5DgZdej
	LZKA19cA0pcg/a/nwLnbpeeyPhh12jrb1BKxnchvBC01CBIFUCW2tQbFZ4xnqto7TT9WDA7EI6wxp
	mc+i2k5rFLZzdJYDWfOAi6Bf+cvskdejZ8HwE3d8B44gIGRZr0tpZvHFbpDx7VQHpLi09PFiO/pBK
	UhkXqduo499pmZjrwHJaUKT5o2Dwsi22G3fKefDwyFsYuR5xKnShHLm1cnkonlkekF4qsctTxjIUu
	zgqc5vxxUI8ER7tPAJ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrCc-00000006Qva-0oKm;
	Mon, 18 Aug 2025 04:10:34 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrCa-00000006Qus-1JXW
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:10:33 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-323267bcee7so4439297a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490232; x=1756095032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPHcLL2SG/7gEz7cPa5IwB1kBN+rHxLpWke4w+6lxok=;
        b=HesPtfRNrnYPiKR5BgCS3htg1ccS2nkjOWl447NcEhGSNWav+URY5KpFeWbdqD+Lvo
         QWr75Z3fo0V0pVZlM6iGCCKl0rhURadPRRMgpUQJAB2r5EQuk7GFBF9lUxbVNpeHyFeP
         MCkmC6o7g1jGddtcJOMSPW3SmhoLJMi7A5HxAFPIGCUjc/QKtEquRzT6/kBTtupKFZtD
         I81oII8XdoQIrlYcSMkmUbgHarKsyEfX10MPCxkhth8bjjsfdcGgMyLYIpdnXbNv4g7L
         Xcxz0qCmk9gYhj/uu6vMMWSFWJNqhALo6h9em+eE2NLFOFK3e1dVhGlyk+pJlEXqsmt+
         xm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490232; x=1756095032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPHcLL2SG/7gEz7cPa5IwB1kBN+rHxLpWke4w+6lxok=;
        b=fcYzW6x72ur3F8CvV9CCbc6k1xth7xn+QPaLcJwDOJ3pnsvF35UM5sK9AofBtar7PM
         JzZOOXkEQ4GII1gXlggJL4uj/mFJ59kNzMDmo+L3FeMjndxuhlVWowyerEMPRj/sLSOE
         TRuHi1fCVOPUSQQBt8Q0OIY6PGuKi7gvhKUSEwkF0hhfky2VSGFU5sRH9wS4VM0tWHGf
         bDxjT2QoILi6jYr624cbAX+G7lj0TvaVKKlBxU1sLxRJBsQqg27j0lIvL/aBIadtEn68
         AdN302GpgXBkqWO1qKwHsK3Oaf9QtMufJPWuEUrIL6TkEuppVKhk4LdxPivNuqzrTxe8
         d1Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUmTnBaNAcgxO6Jim4rAHoNyXvxzzjn9cs3wETKIsEWUno3CcQ+GmEoWQB5PFY3f9MSU+2wAtAIFfWnQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ6ecP5Yn0EHOWr1Z/iJO1i8JQC3mPmOygs2oqGV0iebRT90ZL
	CyowtjwC525bS0I9NKpbq+LhbHd+0U5KhzuV3msdTDq80UibPZOpzX8bSJDMymxK4uQ=
X-Gm-Gg: ASbGncs2FWDHZBr36OuUlpTmc+lCYOm2G8/6Vkw6Ayf59MMTFhWAqzUrQKPbuzOTCdN
	RERwFTTMOY2jfY1ZdeorlipXfWx8Ti1PP3CrGPH+NC7iOgOGAWJFHppeamUzqn1NaT4ifs2BVFY
	U0bzlx0UB7r6jsWbbtmDBd1kDaCgAN47oPy5IxeNHF2UIZVwVQAkh6ePVK9XmohqHO2AREVTYMf
	XGs32wxdVCxzWknvo2JFazxOGXtk+cBvjBeOK5dSfCED5tdZfHlzD94+mzmhjY+k1Ba8bDSZs7u
	GKCoIZY1k2i0Q54bPS/EJxCQG2jPpx26XPyNAW+dcQiSZr78SF1nLikgObKDnU7ZGUsJ/EiX59y
	tuvnGnbmlLZrlHzOL71Fp+axyXYwc0ATwCQ91aZfeV+KHlVnYdqUH2Q==
X-Google-Smtp-Source: AGHT+IG2Lm+Y52n6XKyIXBlc4RYKAT1nFaGLczgz8usKKmMpO2sTLSC8znXmp2nRau7FtQyr+2X6Qg==
X-Received: by 2002:a17:90b:1e0e:b0:313:62ee:45a with SMTP id 98e67ed59e1d1-32341ed21famr13448415a91.13.1755490231451;
        Sun, 17 Aug 2025 21:10:31 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:10:30 -0700 (PDT)
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
Subject: [PATCH v10 03/24] RISC-V: Add defines for the SBI message proxy extension
Date: Mon, 18 Aug 2025 09:38:59 +0530
Message-ID: <20250818040920.272664-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_211032_350561_C0318071 
X-CRM114-Status: GOOD (  11.10  )
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
 arch/riscv/include/asm/sbi.h | 62 ++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 341e74238aa0..c19e5c7383a6 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -36,6 +36,7 @@ enum sbi_ext_id {
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
 	SBI_EXT_FWFT = 0x46574654,
+	SBI_EXT_MPXY = 0x4D505859,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -430,6 +431,67 @@ enum sbi_fwft_feature_t {
 
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
+#define SBI_MPXY_MSG_PROT_MKVER(__maj, __min)	(((u32)(__maj) << 16) | (u16)(__min))
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
