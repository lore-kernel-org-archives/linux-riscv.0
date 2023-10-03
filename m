Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC4AE75421
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 04:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SiZGZ8Pyb4qVPaI3Mt/XIkBpGEUPjPPTrvuM43iDLtQ=; b=hn/bLJXdjOvaAY
	OEuJNMZz7PIHGzyFs5+othnvoDAQ6PnjhKO84/XTn683aX0SkoYR2iGk6cLnwJeDDaYHw+CREKkBh
	WsKMlgDDfEeMuoOCeHAHb44kPTIq2v36/hvfZ/p6aLwld/g4f9Q/cQcLiHKoDwzdwqVQ1e72XoTWo
	YLZqOr4u/qBCavf8n3KyA9tISu9c6dmqiUm6EhJdL1oO4eeuk7MA1DWglEx2dRu9gcwIXwPmD0V3w
	lmvXD7FrpJuCZBNv52+tKMYf/5/CjuGlryCj2dfPIyscdSQVRIYn7FOw5KeDGxKAoxt3atGWH/gzI
	ZeDwr5c7dgKjHoPIYMKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXH2-00Dnss-2H;
	Tue, 03 Oct 2023 04:44:44 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXGy-00DnrP-39
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 04:44:43 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-690bccb0d8aso371962b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 21:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696308278; x=1696913078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYhetJOGeGWONv0pBZCT4Mywf3EBvVtv+lOqGOUogJM=;
        b=oYUniKoDJz9Iynv4bVEUtGf3f75vsQK+xsUqGngi0MjBDfm4AWeqCi7bWPrm7bGBoT
         fMZU1CPUiR6TxuXaG3cDiuwQsAJocVpEQzPHttVjiu5wvy0NYjanB3I6eN0lCrd2buIw
         S4jdTGYi4K1aRAfccg9MUaqGvXrTFDcrhkEbiq6C2urfj6prkife3E60YLDfNKFGXd2s
         bRECj0NZG0AsC+VaRKSHYkbcv6r5m4hbhhc2cxXv+G0XS8qO3jcrlT7jnyCeFoaAcLEm
         4g6542z+izyWx6UrXw8AGffhpRE3KRy2ireKgOobz4oYqIAxpry8RVQedgLozWHcebug
         CQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696308278; x=1696913078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYhetJOGeGWONv0pBZCT4Mywf3EBvVtv+lOqGOUogJM=;
        b=TJiRISb9B9FsIAc/nmpHDRjpqn6mQ04kAT0vGlk/vOBokXZsGh7phG2J2C83iLgYS/
         EMQzoV/w3lzBC4DxEcqoeT/uFMUGjTJrMPrKPQbpJfquwU9dO541tVDfiAATS61fZOoi
         lKgoTrIihfOG4NhOlWppny8xtvs04PS7q/hxPW5zQxFphGuf4ldHnzo2H8rdvSngWGVt
         pV3zM05B617rdvRK9CMv94HPKAqsv526kVDn7tfJNdyytgbLaJ0qDGx2CenWU4gV25AY
         UxTFOoAoviSLDUPl7zN0ghJ5DUgHMfu/LAkr/qaZlyuCPyCXdRSPDJRnysWnjofnB3/R
         envQ==
X-Gm-Message-State: AOJu0YxaC4NV9J9V4tHgNdrhVWiPwFydAPAuicnIbRRY0X2Ndzs+IEai
	y9EDh08Vt/K0S09ykqPsQebJOA==
X-Google-Smtp-Source: AGHT+IFh2kqvEvnNTxvGwWlu8C31fgUxH+K6y/DHJOiawavSp9uWUY0H+X4gukVaX5d0LvOwRxsG8w==
X-Received: by 2002:a05:6a00:c92:b0:68c:69ca:2786 with SMTP id a18-20020a056a000c9200b0068c69ca2786mr13194905pfv.34.1696308278346;
        Mon, 02 Oct 2023 21:44:38 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.132])
        by smtp.gmail.com with ESMTPSA id h9-20020aa786c9000000b0068e49cb1692sm346421pfo.1.2023.10.02.21.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 21:44:37 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v10 01/15] RISC-V: Don't fail in riscv_of_parent_hartid() for disabled HARTs
Date: Tue,  3 Oct 2023 10:13:49 +0530
Message-Id: <20231003044403.1974628-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003044403.1974628-1-apatel@ventanamicro.com>
References: <20231003044403.1974628-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_214441_011460_A54D846B 
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The riscv_of_processor_hartid() used by riscv_of_parent_hartid() fails
for HARTs disabled in the DT. This results in the following warning
thrown by the RISC-V INTC driver for the E-core on SiFive boards:

[    0.000000] riscv-intc: unable to find hart id for /cpus/cpu@0/interrupt-controller

The riscv_of_parent_hartid() is only expected to read the hartid from
the DT so we should directly call of_get_cpu_hwid() instead of calling
riscv_of_processor_hartid().

Fixes: ad635e723e17 ("riscv: cpu: Add 64bit hartid support on RV64")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index c17dacb1141c..157ace8b262c 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -125,13 +125,14 @@ int __init riscv_early_of_processor_hartid(struct device_node *node, unsigned lo
  */
 int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 {
-	int rc;
-
 	for (; node; node = node->parent) {
 		if (of_device_is_compatible(node, "riscv")) {
-			rc = riscv_of_processor_hartid(node, hartid);
-			if (!rc)
-				return 0;
+			*hartid = (unsigned long)of_get_cpu_hwid(node, 0);
+			if (*hartid == ~0UL) {
+				pr_warn("Found CPU without hart ID\n");
+				return -ENODEV;
+			}
+			return 0;
 		}
 	}
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
