Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76170C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZ2pR5C/wXJipZyEHTkaYk1PO/Gad3UeUqYzfPR/NW8=; b=4hTmFpLwtHi3X4
	N+NWIvy4Wv0QSSF2BsLQvHurIBQsSXKriZQyF43C7C4eqOAMkTbsDazl5ui/7p/6rni2WyB3Brb0K
	Faq64K9VsK29DE4budB/mEBkyRlkhQTcNAybmw5sbQ3x1fKChvaFy3Wb5QnwnzfrRaFHDzqP4Bygw
	IRpYHitW7lrZbCpDpWzOsWZ5jCvVfJZ0HPmwzN7vBt5KG5K2JNMdLF/n3Lu4munAxzhHEQHejaHoE
	ApQ1Pj/ONUyml17/uh4DHng686iK+vfiRJFivj9nyGwWolcmehynu7CHAVxb+WeGP/TXxtCcfdgLj
	SgiqYVze0McvZLliRalw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYsd-004zf7-TH; Mon, 30 Jan 2023 18:27:47 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYpE-004xTN-16
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:24:17 +0000
Received: by mail-pj1-x102e.google.com with SMTP id o13so11891038pjg.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkGE01Mpgd0zQdA3GENSlYo9eU6sEMItLJR0OaGMyjQ=;
        b=jbIhshr5uVfA86th0bcTdtMzr9oS1VyqbMLYF5ZGlBRXNpHrcs8DWHf/D9IgTeFh1F
         Y5e11T4Vvtref1QDKQ+XiHXojUg0e+i+S38peWV4Apx94P0NKRcB0DAmJRk0RrJle8Fm
         3awc1GpI7w1j7MnnGL3ciDCIf90r85C3QXXXCK0L3ojt2238HEnvWEsLTfjYhakRe3hG
         wbMlKcmEJuWJHEPilJoudPQPRUa6ARXhJ98TEnIkJtu3FyXxlmD89cMv78BzfLFR5kYy
         Qc3rHv2CCGYsIixWXWQgdM+5g+FKaEJDGviWmeoLzOH5zJk9RSqhHAdf13vmHvrp3x82
         1r5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkGE01Mpgd0zQdA3GENSlYo9eU6sEMItLJR0OaGMyjQ=;
        b=lbw1xtDw1tVN0MK/Wc6EYqrrgy+ibZvdBqEMwWTq1NsrwAM8YC/WiYPdDmx4+N/0Is
         GcwVCrr/xF5OF9QBdvDbVdJLeYK8SEWgOH4sM89W+oFtOfO45iOHn3AI4Y1N7MDA+8rG
         Pm/Jg1lXrL7L8XkLTIL+GIm4q9xJQJWaif6OWhgCjWpgxhvrKsljsQ9lEhG0Jkslc93j
         eBGdneKmrTHyg+zYRJYD6EZIblCxAyvcGjMa49sYGC44BNM3e3/8ad5Tp2zVqQ6Ylc1k
         9hGR/jJDRcDIztr3I8Q5bzYDCISFGK4871jc29A2lmb/OIOS75pCOPchHbum+B0YpeOn
         Wnrg==
X-Gm-Message-State: AO0yUKXJ3F96jiDoaoEEFT4ynAb2AFTLa6QBoKJC8ANuxM+JY7X3N2BX
	nOxQAP//jc6ZDrbm787RzMwyfA==
X-Google-Smtp-Source: AK7set9Pnqr1BTxPCJQr0H6gTIG5Wj6YCKgECl1AdrucdYZkfWDBH80CoQiA1a+eIyoZ5cYvuPNGpQ==
X-Received: by 2002:a17:90b:3909:b0:22e:5ffa:2a34 with SMTP id ob9-20020a17090b390900b0022e5ffa2a34mr1813190pjb.36.1675103055398;
        Mon, 30 Jan 2023 10:24:15 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:24:14 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 22/24] RISC-V: ACPI: Enable ACPI in defconfig
Date: Mon, 30 Jan 2023 23:52:23 +0530
Message-Id: <20230130182225.2471414-23-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102416_105687_C828A98E 
X-CRM114-Status: UNSURE (   8.86  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add support to build ACPI subsystem in defconfig.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 128dcf4c0814..8ce06fb0dde8 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -218,3 +218,7 @@ CONFIG_RCU_EQS_DEBUG=y
 # CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
 CONFIG_MEMTEST=y
+CONFIG_ARCH_SUPPORTS_ACPI=y
+CONFIG_ACPI=y
+CONFIG_ACPI_MCFG=y
+# CONFIG_PCI_QUIRKS is not set
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
