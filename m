Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AA3C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 09:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROWQIQGJ0NvV9zBvRk8CuGv9eyS1Nb/bcGxK6RuekaE=; b=ukbixNwW+NDl2y
	NbrrAd9PCMyTO9P+X+A1i9ns6rGbZHpkp4BTDMva9pqremvNw9dHx7njRGsA1QCkoMqWauHLUQT0j
	k17Yy+rqIlt9cuj+DEbtCeRmwIGjFWu1Vv1FYTdqd5m07/Fvr7u9d2JO6dJG56dcdf9cZwjHSPwt3
	qrHkXd5aXxf/xEEPRNbVqEy6dqSs8ogulQDOE0AVJHgQRxLg9SMhKoH5T8rdPWz6iajfxqUekOYko
	kkYvYYegdn2MIII182XCUBa06CuOZvItW7feyLWYVsAftI52hyJzZfwJuc5clysqRFcRS7MQo5gnT
	D2BYyIbBBQ70uobwD4CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOcYM-00BILo-OR; Mon, 28 Feb 2022 09:42:50 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOcYG-00BIHd-Nj
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 09:42:46 +0000
Received: by mail-oo1-xc31.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso18120663ooi.1
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 01:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c6aEUd2HwY01Z/Ayysg23IOPYksH4V6g17VAVrgQgx8=;
 b=QttJ8t7TITQ2h7Ebdmmos+aCJd8z+mdY+gYBE9OXcz3VtELeg8yeb2r9KlX97+UQZm
 FkD3pWYae7/w96EZSwtGEcBFxzIbXKFRN8ZqW6yrwVDCHZJmOoWAyiwauxOgNuv9KFdt
 fEHZw0Bzjcc8wiJD0EUsG/4QcKbv5no1c5Y5IBtU8mllCzL8CnrUcqS/1nDqI3sAspeR
 dHx95QAyhg1Zv/CNj4+gKrfD/Mv+nd+vOHbkcSGDdWooH3y+Lorm1kRQklALI2yCrjUt
 68f489zNBlCjFINmVQP2WdblHuwCgM7OooYO/LVtdZVP4jtNo2L8jK3AFDartb9tntE9
 1zvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c6aEUd2HwY01Z/Ayysg23IOPYksH4V6g17VAVrgQgx8=;
 b=Udi2H/2aHKxYUi4N9eavbL/jgXF2LrNlfJaxPklofacaTwolCsVY+h0FJVdKb7n/mo
 ao+/0HNJy3/cm4lkL9fheU0f5J6YoFSeZfqVLSklc1eXv0Sm5n2vZAh2zIuyMREdGeQ6
 2NNo8Pka90wsrmBTapTBW3EJPgoBvZOb9v91DbhPgQGoxElh0NEtB260DNdGGV4Wv3qt
 lmNVf0ZAHWfW0yxx8sKATD7ngcL4SEED8mBLGS23unJ9ANSPO99HPNv7x8UDIo9VR9zH
 iZdWU/aGMHSyM33v8h0Xuu8CR1k+oL9+1yWs0o00jJEmteFyVD95i2E5zT0CH+xjNScu
 IaSg==
X-Gm-Message-State: AOAM532mAaPUoBTOG1aNXxTAtpNGqQjwKAQQrTaiK1+Dl3ICe9kw7KQv
 /qpFiht1d8NBe0JfnYcZzflwQQ==
X-Google-Smtp-Source: ABdhPJws12zANoUoy54YotfRDiZF8JoPqN8gjYBlUZXs1PyXbDn6CYXx07jUGMqa4XLO8eSHxbA3xA==
X-Received: by 2002:a05:6870:1486:b0:d6:d70c:a4ff with SMTP id
 k6-20020a056870148600b000d6d70ca4ffmr7151638oab.185.1646041363830; 
 Mon, 28 Feb 2022 01:42:43 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 bx10-20020a0568081b0a00b002d70da1ac54sm5936852oib.19.2022.02.28.01.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 01:42:43 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, kvm-riscv@lists.infradead.org,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH 1/6] RISC-V: Add SSTC extension CSR details
Date: Mon, 28 Feb 2022 01:42:28 -0800
Message-Id: <20220228094234.3773153-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220228094234.3773153-1-atishp@rivosinc.com>
References: <20220228094234.3773153-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_014244_817679_22E77D92 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch just introduces the required CSR fields related to the
SSTC extension.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index ae711692eec9..8f37c063a205 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -165,6 +165,9 @@
 #define CSR_SIP			0x144
 #define CSR_SATP		0x180
 
+#define CSR_STIMECMP		0x14D
+#define CSR_STIMECMPH		0x15D
+
 #define CSR_VSSTATUS		0x200
 #define CSR_VSIE		0x204
 #define CSR_VSTVEC		0x205
@@ -174,6 +177,8 @@
 #define CSR_VSTVAL		0x243
 #define CSR_VSIP		0x244
 #define CSR_VSATP		0x280
+#define CSR_VSTIMECMP		0x24D
+#define CSR_VSTIMECMPH		0x25D
 
 #define CSR_HSTATUS		0x600
 #define CSR_HEDELEG		0x602
@@ -189,6 +194,8 @@
 #define CSR_HTINST		0x64a
 #define CSR_HGATP		0x680
 #define CSR_HGEIP		0xe12
+#define CSR_HENVCFG		0x60A
+#define CSR_HENVCFGH		0x61A
 
 #define CSR_MSTATUS		0x300
 #define CSR_MISA		0x301
@@ -247,6 +254,10 @@
 #define IE_TIE		(_AC(0x1, UL) << RV_IRQ_TIMER)
 #define IE_EIE		(_AC(0x1, UL) << RV_IRQ_EXT)
 
+/* ENVCFG related bits */
+#define HENVCFG_STCE	63
+#define HENVCFGH_STCE	31
+
 #ifndef __ASSEMBLY__
 
 #define csr_swap(csr, val)					\
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
