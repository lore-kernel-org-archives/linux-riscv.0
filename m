Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35194C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k2Sn3b/dMdppyYksQpKQ60yOnQ+L9nA81Ay3bpm5qYM=; b=YqfSCkouSVReHe
	BfbrrP1v2V+bHc6ITeSnDnhVgjpkGiYBBYBBQrYR93QPoB2U+Zr3PXrGUnmBXUh7JKXqJqIPili5R
	E26qWoIe1m9iBQ3oNIrhi3/NZ8/sfj46q1BC6MevGuItcWtA1hePACmg6WN43mCt0v9rghu87PpEF
	yl6zzyvcO5/HZUVQcq9wwCLohAqDNED3CkojKizP2k0buxyDVGtynUtHOO1KFVs22ZMbbanOWTcfn
	g0AhuYBNw5wfilVoH8PrXMK1T3XXjf4MYztQQB1Zad8tykS+0Motz8KbwOWiInkxnGyvqxGJtyi1t
	C8o3VnCknL548NXsr2HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYq1-004xpn-KJ; Mon, 30 Jan 2023 18:25:05 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYnw-004wt0-A9
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:22:58 +0000
Received: by mail-pj1-x1032.google.com with SMTP id nn18-20020a17090b38d200b0022bfb584987so11963949pjb.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Gxugdzqzv74vjLFN2TZ8EvRMhrnTxWt9U64bf/S3Oc=;
        b=HoT+WfLCPPdnBPUY4u//wG/nqz54nnbVNEyB/zyFuh1wqwl7dUUdORc82V0pXzgGqI
         P+YM1ucudSo6RbZP1NN8kR1hUTZHRzmX3X900Mruv8tZUv4pInMpR+m5wxoBS9EOCAan
         KAz+PN2XnNL5mEey1FiMMcqZnFzJ5utcOjeTPA6tGPvAI354RrTSw64eae8l9V3M7mNe
         UOTtpDsckz5dXpGxWPyskJY1LeUUYZ7v7meb1XdF/dwjbC/P4hZJlV9J05dYQB5Y43Y3
         OwizeHCRBrpe676Q1ZZ55JKz5XeEHId+0SX3YBESwKsZLHWSYkYSSOQpQXIKVCIwWoxa
         EH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Gxugdzqzv74vjLFN2TZ8EvRMhrnTxWt9U64bf/S3Oc=;
        b=mKsjoMC5Ki2o3NgjwbijkPi8cwEGfPuQOMNE/8XhmMiwSaYbboB5H8cPUKLzKppOYG
         06KZjs/GQWsCJITtdb1SwXZzAh5/IHXgk/BtMdF4dkEYKhs45AjSJNfQoKvy8b/cMYLV
         g0iy978pHV0cCfhRVzR2fKMc8CsPG6INHCTSmsDroFEF2PxhBtDeHQjDUsMTxprqZLOO
         zDGS6wlhzT4+UNV45SCw63Dd5td8G5//RsLNZT3neuuDdQN8Q2L8sdQLFNV9C4YoQx/s
         RdpZjvVXTwS/BXLmKknXWGanOFZREYQ0obpBvRmmDeVMwjf9dThic+8fAfWK+pkrD1fu
         +0NA==
X-Gm-Message-State: AO0yUKXX9tX4GZpXDlMRaCvuB3BYMO+QN5IfXDtYAshWvUuuJqQkXFTs
	5C2b684tlvGV2lvThiDqIGAreg==
X-Google-Smtp-Source: AK7set/oaqjYHxZkFri7nAIEqSWUP50dWr7zEqKA6GyAWIBxDhDJBbMSoEj9UgNo8WKJ+5WDx5WxUw==
X-Received: by 2002:a17:90b:33c2:b0:22c:1bd6:77de with SMTP id lk2-20020a17090b33c200b0022c1bd677demr18654479pjb.3.1675102972682;
        Mon, 30 Jan 2023 10:22:52 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:22:52 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 04/24] RISC-V: ACPI: Add empty headers to enable ACPI core
Date: Mon, 30 Jan 2023 23:52:05 +0530
Message-Id: <20230130182225.2471414-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102256_408258_82558B70 
X-CRM114-Status: GOOD (  11.34  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Few header files are required unconditionally by ACPI core.
So add empty header files for now and update it when needed.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/acenv.h | 17 +++++++++++++++++
 arch/riscv/include/asm/cpu.h   |  9 +++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 arch/riscv/include/asm/acenv.h
 create mode 100644 arch/riscv/include/asm/cpu.h

diff --git a/arch/riscv/include/asm/acenv.h b/arch/riscv/include/asm/acenv.h
new file mode 100644
index 000000000000..bbc38ecdf753
--- /dev/null
+++ b/arch/riscv/include/asm/acenv.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * RISC-V specific ACPICA environments and implementation
+ *
+ * Copyright (C) 2014, Linaro Ltd.
+ *   Author: Hanjun Guo <hanjun.guo@linaro.org>
+ *   Author: Graeme Gregory <graeme.gregory@linaro.org>
+ * Copyright (C) 2023, Ventana Micro Systems Inc.
+ *   Author: Sunil V L <sunilvl@ventanamicro.com>
+ */
+
+#ifndef _ASM_ACENV_H
+#define _ASM_ACENV_H
+
+/* It is required unconditionally by ACPI core, update it when needed. */
+
+#endif /* _ASM_ACENV_H */
diff --git a/arch/riscv/include/asm/cpu.h b/arch/riscv/include/asm/cpu.h
new file mode 100644
index 000000000000..51ec1a89a7a9
--- /dev/null
+++ b/arch/riscv/include/asm/cpu.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2014 ARM Ltd.
+ * Copyright (C) 2023 Ventana Micro Systems Inc.
+ */
+#ifndef __ASM_CPU_H
+#define __ASM_CPU_H
+
+#endif /* __ASM_CPU_H */
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
