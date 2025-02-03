Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D852C02193
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 08:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MmjXG1RHO6lb6GUsnPZZuiIjsVhqo0gLGNxOUyg/1LA=; b=XefqwxjpIm+rmf
	eqv82yxQdE8Nwf4Y3jd1eI8ksafCeSVZntv2NbqedynImVsq6CU3vfQRZnUm9lvenkSHj4MfUxMEd
	ckP14Wuc2E5zV9XM9m+T1+t+3aDoH+rXZbdHNVry1QtEvc7L8OO3JDdfUh9NDkjOdAWWbkolqtuUf
	Xh9MtNzrQLJ1JCkU++bsfGtq6I9fpMTBqhvN0PpXI4xzydlfpsnyXZQAVILRu1E+kQ0GLftCIw3zr
	Ycr4Mfpgx36Lsu8KPS77VnKJ/1sg0/S9xHikzw6qrpWU2Aqy1pXcaIyp+yHkMbTTU4M3erriMZpeX
	Fttdo7oYyhn9/IZHUWvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tes9q-0000000Etxf-0AA8;
	Mon, 03 Feb 2025 08:50:18 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tes9n-0000000Etw2-1Tpg
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 08:50:16 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-46fa764aac2so35979881cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 00:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572614; x=1739177414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCnHAquQUwch4tcFWwygkET+UwWze5YhLFw9G/xcbPA=;
        b=PLpoTPmv+rBPwYQwlath1N4T4mfctw/NyDpIk9anVKY3PBMcXImdw0TCbxO5Y4oFv8
         hSh7wwxJDmzhBJPrXO2AxiKPjux41YstsGg8ZZcsLY7Zx37nkgTksHcjdOwkvz5rX7jn
         Efgv1iyJ6r6o4gzTToIPWB/VKK1hyhM0AS88azFQq8cZK7uZQsRjywXmSYt7X3BHy/+7
         ThIaakU6HjOqvfK0YbDyc2Nv4OxOjAOdb/bv31kyhPzH+P8L//E0/VkUOnc3w2oJIVJO
         IWA+6intoxCNW7+aHiiafaMMpIyzkdf0/WhXj7jBtj64JNW1YWd9CQw6Wgm4eYlwtmRv
         2GHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572614; x=1739177414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCnHAquQUwch4tcFWwygkET+UwWze5YhLFw9G/xcbPA=;
        b=tTC81ZqA1rA6khjBmJJReQWHo6y7A73b9BR7f5Z95/LcpIaKGOk5jhM6Yc3I75D9gb
         jF94yoqstxu6TLl6HM0mBSzYuMi6pKTR/Rb5Q9VINFER+Y4ZhNr0v6KsPZrQHjWvuISC
         MvLi3/GRcKs6UEUVGJN2P6J3NABOLfI1orqA9RWVy1EK51ONKxxY4OxydTdG9pQ38sdN
         zCmDAcCrNd9Nj+ZUwgsuCqsiKg4r+Hs6JgQI3QhqCtRNLQUiha+ubuGVcCvibAq1sQ2T
         imeAlbOyQ4bujCquBsDzxQDdpRMOY4c8kzscMJNFJiW00h1PbED1OsAuo1n2jpLz6Md+
         I1Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXm1FoAbjZ/3oidGm0rcGIdX5KHeNFYaNqCY4kbRD1S3cPehs2+QGyJGDNNOa4e6TtZ6jqZNj86brMVSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAv0hZ1UBlDBYnLJblWrfHI9KJJsXG3JXpYymgarpI/ZTrXok1
	KXoxCTU4YnZbz6E0Ppu275lRFMdh9qdpS12Mc1/h8CwAuFiiFVUZyGKjOdIZ66Y=
X-Gm-Gg: ASbGncs8XM84C/mQipFUgWIhRjCsLM1IO5kv89N4GQTknkR9XSqCJjqWd3LAKf/sYM4
	C+Ea9XNF1c3O4n/shg8sbAp3rH8Mxom2TRY3Egw7axRXqgwekRuis52Gjcnd5AYgRRcLi1RnpN3
	BV0WVQVD0K3YMSYOJTHOPjfPu9Oc277mDeoxeRFosPAPlOHB9uwX1zr8WIdybzSAKp39Y0TuNRa
	/GiLUfZJU7qoNEPUJz/QWwFG+Yf1xESWTP+FMGjRKb2IzGdFy9ljG6jm2jVmqiCBg9uskHc9Xo1
	+zADcvVYCEb7i+yNq2vaXkuVnbtxrnTTZ4Tdio+TqH/tBndsRYt3h9Q=
X-Google-Smtp-Source: AGHT+IGOIuwdSy2AtM7BxpLkRJK1hm6BLxTjmWDlKOGDZZi51/9Wkwiyb7XXsEI/yNOgfLAOZVUrkA==
X-Received: by 2002:a05:622a:1803:b0:467:84a7:5147 with SMTP id d75a77b69052e-46fd0b6f794mr281355951cf.39.1738572614133;
        Mon, 03 Feb 2025 00:50:14 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:50:13 -0800 (PST)
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
Subject: [RFC PATCH v2 04/17] RISC-V: Add defines for the SBI message proxy extension
Date: Mon,  3 Feb 2025 14:18:53 +0530
Message-ID: <20250203084906.681418-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_005015_389127_20BBAB2F 
X-CRM114-Status: GOOD (  10.87  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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
index 972eecccfb2a..b730b5159b97 100644
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
