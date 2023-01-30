Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A57C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G25x7NEPwMY5Mm6sLRSR+lLi69xo5n8bxWt0n4G3EEs=; b=KAktFtduE767IR
	e/a1bs26O+t5NiY59x2lBlPh1x9csJsYuzC1RK0/pT/21iqmQNgt5d5R8Ty4bAUjhKq24dB+WesmD
	oWGSKl517SraZwC7+ys/7gkDpuGDulw1cMeaNQ3JeawQ8l4Qv15e7Qu+oyB9HKa/szM5jcITwJlCI
	hdiQWWBet55eh1U4mvqSj1kHqs1KMQERYg7Cf7LTg9E2y9QxA7p9D0f5vvr1+dPM0Z7hdTRUMdbVd
	dFn5Dp5jDvAPJkrj7/B2kzlypccOaVXMY3Skz8NRslWUQiUbVxCbH+zDiUuq29KTdrWq3iZ66TH6F
	RYfkrR4Q2Y9XMWStKCPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYqO-004y6r-7o; Mon, 30 Jan 2023 18:25:28 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYoD-004wz8-E7
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:23:14 +0000
Received: by mail-pl1-x635.google.com with SMTP id p24so12518304plw.11
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPNO/SxCaad+QHrUHg1W5XYbXIP+iBGVf1xglNrkc7w=;
        b=WAt9qxmLcMCzx3x9infWfLlyTRY7lQwbLQgH+mqXQo8DaInODomPFYDru14it+/rwL
         FKOjU3kGSGvjRCJYGNq2J3I07ZEnZ2Bph7Cb19sB1kEq1iHguj5rtG6WsoXH3ZD7TYZN
         Ls5e3cWuM0m3oJ0jAOuLWK/MdCpxiTs0N/t0Izo9LfJy+vGfhYn87Vrttba7ZDWMziE/
         A08N/tccmOYsLazLRWGMy8dyvGbcOWNX9dDkplIHbZ2N65daS8oRYxkaa404MTl8Exiw
         wpa6wUWNjRjFB4qsp0OXBmuBLPbZxKyUhU+EuhlYJBnfoixeacW/CA9qkRNTfKQxDHfo
         1lpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPNO/SxCaad+QHrUHg1W5XYbXIP+iBGVf1xglNrkc7w=;
        b=Is2RilXFfEOvwOGxNQMbO9JfreU31Byu297ZkdSYOmq2U6bZZ9XxtABweA6NRgxkQk
         FXjTBPoyv6mgw3jMX+ajDT2Tna0Dle3LHfB+22z8l3XBp9VM05zbbv5GaOMWkwkc1aJk
         sYVbo8P0AshAO1Su2mhnGPZalTIymUQPChDxtjfw/Rh61ZHsprvxVA7ZKBUwNubu1UUc
         Tkmd7qnNDlhlNM1xSkmaFtXrGodERsET6/E/+kjF2q1c9iSEnijvBmRsIHDy7Q7iiqXr
         P0CWeQa44Q+Lrx41nM9ruqVI+sNuhzOf4XigIEMDP+QllHtkAj24Igap+89X7uj6Qnfd
         4zXQ==
X-Gm-Message-State: AO0yUKWD4sUrQcnVSmhqSlw1TRERcxw4sDbrSxs7oFy9hRUfIJPoYBx5
	4ht9pB6+o0xBr7CD33XsoTEcTw==
X-Google-Smtp-Source: AK7set+8WSMVCSxjvJ7pcIybsaePEVFCKPT/8u2wMLIFDS/YpCiIenEFMsDbeymxOLvTs+dp4pi/rw==
X-Received: by 2002:a17:90b:20a:b0:22c:147d:137f with SMTP id fy10-20020a17090b020a00b0022c147d137fmr20585364pjb.17.1675102991516;
        Mon, 30 Jan 2023 10:23:11 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:23:10 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 08/24] ACPI: Enable ACPI_PROCESSOR for RISC-V
Date: Mon, 30 Jan 2023 23:52:09 +0530
Message-Id: <20230130182225.2471414-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102313_511442_CCDC79BF 
X-CRM114-Status: UNSURE (   9.92  )
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

The ACPI processor driver is not currently enabled for RISC-V.
Enable it

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index ccbeab9500ec..b44ac8e55b54 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -281,7 +281,7 @@ config ACPI_CPPC_LIB
 
 config ACPI_PROCESSOR
 	tristate "Processor"
-	depends on X86 || IA64 || ARM64 || LOONGARCH
+	depends on X86 || IA64 || ARM64 || LOONGARCH || RISCV
 	select ACPI_PROCESSOR_IDLE
 	select ACPI_CPU_FREQ_PSS if X86 || IA64 || LOONGARCH
 	select THERMAL
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
