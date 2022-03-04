Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5C5C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 20:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROWQIQGJ0NvV9zBvRk8CuGv9eyS1Nb/bcGxK6RuekaE=; b=T5IeHgO746tk+c
	2Z0FIlhkMg6FrDHax5C+XUYgXLb0ldaf6faqPekG8p241bKUg+TqtYu38IepONmwK+NGUTkb5JfiE
	0EDCEOGF8Ec0vJxiIJFndnRUdHlztXI1E+aZFxK1RIOO5puTMVKV2/5z26MhC5TQtVp8WLiLVbO8p
	Tm0BmrZHZkAkVknn70CrpnHFifwGybH0ExPNvXJNwXEMfLoa/sWj8yOMRczPoIWXOOGa1KgvpyAzk
	Rx21Hiomi/R9wxStfuGKA6Nes5jvFMoyDWJLnL8HlZtJTM2/RoqvWWDc/00IG7Nad6O7/x9oteaFM
	+s59tuZoYlHvqpBuy4lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQEGE-00BtAs-6k; Fri, 04 Mar 2022 20:10:46 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQEGA-00Bt7N-PV
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 20:10:44 +0000
Received: by mail-qt1-x832.google.com with SMTP id t28so8362992qtc.7
 for <linux-riscv@lists.infradead.org>; Fri, 04 Mar 2022 12:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c6aEUd2HwY01Z/Ayysg23IOPYksH4V6g17VAVrgQgx8=;
 b=OTNsK7j5dme3IWmBvygn+JNkeA/iSLbLNVG7NPSIxtQxVzkFwdmDsLe6Ps4Z0d+Asn
 /h6LTCk3MYXpN2rkmpaDUl53wNaFt6bkBi++QQ9H+m4XbD7iw3Gaql8PTvhIMS7po78I
 9d/4qbHopPz7zYIvgS7kBzJkL2CyzM3p9URRe1XuSK4c7xxVol1G30HmKW0/FtkrQ9An
 fSPM38RBjJbm9z0yB5oVYrbY5sRppU7/e0h+Pm/zXNlwEnEJWSV5QJjjH4tKXxdFi3S4
 xIOm7briW1DQJusAwcbL6NGDugS/efnIAfYxN4j73g5zZGVS5M0z2tRHOklbQDyFykPN
 vqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c6aEUd2HwY01Z/Ayysg23IOPYksH4V6g17VAVrgQgx8=;
 b=w8oHqkxvPEg8lctaqcO11QPTxC4H29sx8Mw/LKbYynMj4SAbZ3U0EKgUS5pOjzx2zY
 SzXiT5J43IjEgomxq53hAuwZOqvWJ52SKBGJ/J9ZyhmWWyMMLBzQRpw6JG3Gv1fJS20+
 vsoy1ELh1X3KYN9VRFWCOKwf/KrT8PX1p1QB1juJQXkTPVZ+S6fkK7SAM0iFcKUA0x7X
 DzPF3L9KGkVaBJ37cMadSBusTXrNME1EU1CeN94M4kM2xUFXDr9qv7bZcVULHMXvIDQQ
 QmCoknokye8nXyA+5cziSs9R6jqaBRUFm1n2ySBsGitJBZUbQAL52EcCgkNO/Poh4ViH
 6frA==
X-Gm-Message-State: AOAM533kiQQzsq/8BYQrf9gOsLMusV7mGwsWn9Kku3Ee2djmavW5GGfj
 tHK/oqwgFJ5X7psxXuFTXro2kLcN7GLH4g==
X-Google-Smtp-Source: ABdhPJwc8lEqPa56iPaIxhTGB31XNo6PyIYeb5DupNo7mYfqTQjOKAVOAv57R7W4kjXKcWpmxkcP3A==
X-Received: by 2002:ac8:5fd3:0:b0:2de:9f95:8eae with SMTP id
 k19-20020ac85fd3000000b002de9f958eaemr370759qta.217.1646424639864; 
 Fri, 04 Mar 2022 12:10:39 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 20-20020ac84e94000000b002de8f564305sm4605481qtp.1.2022.03.04.12.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 12:10:39 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH v2 1/7] RISC-V: Add SSTC extension CSR details
Date: Fri,  4 Mar 2022 12:10:14 -0800
Message-Id: <20220304201020.810380-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304201020.810380-1-atishp@rivosinc.com>
References: <20220304201020.810380-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_121042_848507_12593CD9 
X-CRM114-Status: UNSURE (   8.04  )
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
