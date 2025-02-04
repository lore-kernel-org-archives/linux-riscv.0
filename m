Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627EEC0218F
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 08:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V37SBZb5WAC0QITnhI3G2cAobVhQUoIQPrwS4FNbPcY=; b=5CZoNMV33+y90b
	XaEC0oNial0zqSHO4uPE1w6SQ85nvBTN1FYkU9W46FSW05FoGrmIWuZ82WHd0JblxaUazYPeTe5Wh
	yIOZp4JxHvnR91ysXONBo6sKldJt8JoJ0XNEJyotEuXowh3kV0QZMRDtCOkXf0TU6DaaCpBH8YZKi
	5WzNbAiwX/WOOkuafQ/IfaBD4Dvsy2f6T7ESqGXaHC1yGlyNACUCf4GvvYLVG+d+6GT6jzXqF/TPw
	GVUOZxc1Q9hbSp9v9mEUihHWtgXL6y93XZVF+aMUfAy0u5VHkzepkrugw5rVmNI+jCtm8EnazEwjv
	/x3RCh9R5QUFDA2yUzlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDvD-0000000HUMD-0zkp;
	Tue, 04 Feb 2025 08:04:39 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDmE-0000000HSsR-3MXj
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 07:55:24 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7b6ed0de64aso455749285a.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 23:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655722; x=1739260522; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnRpk/p9sKuCOyv2KZjNLOO6T+xrx1m13lZc/9SNpSQ=;
        b=HGWb5V3LuorlC20A3R8l9dP9WR75SIUcCEu8BruGb6sQRGYIGKOfOd7OADt/ecQYKN
         zrnr++AXTDjgtm4GyOWMko9jAjsVsXz6fDk6Ef5xEN/9zM3+rfPmEj/xejXJX/q3lEHK
         pJVPoocqNdH67T42Sv01n1E7YLe/kEzqykjwGtTkRi7B6x+9pCgUi4N5L0dP0c07BHYM
         PoQH6ONbl0ojMHCUhCp3GHwwIc2OI9whUhMXCQah4gVRHH8n1GiDwXNo8xqAyF7ehy/C
         K1lEktCbe3nWB1/by8DFJ/jW6YMS820JVyAksCF27P6ODAGdgaKti+yezLQO8mW9HZBI
         jADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655722; x=1739260522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnRpk/p9sKuCOyv2KZjNLOO6T+xrx1m13lZc/9SNpSQ=;
        b=A7APJOSBvadntc3BYww9CsXuzbvv2xH9Wp8lzxWTpxxIkpk7cH6Og6h+JpGXez5P03
         CAYoNE4UODTLkxh7BHTC7ptarPeCh354Sg8CMLprjTKzxpYXehT/ii3Hzu7Sl941CRuH
         MWQmAsMaILEEvo/USJB4uzd0RJPqgAtQ31DoBjDvztSf0ev4vB2ZH51eotvTdCm9trVt
         wWQTxVtJaNLpUplJ5MwpzHq6PtcYEhG7oke8rMGsZgpFc0oAAQxR7RpgQ6nHWD046+y7
         sWcPt5XwGXvm/blfCNyZsOFbBYoEEkl/FOo7LprEHzR4cSYqiwfj75UAPrYQGSa21zH+
         u5kA==
X-Forwarded-Encrypted: i=1; AJvYcCWEa1pxONjWk67pp1QkQlGu8C9TH4npywVIQX5bNzqn+Wb+Umyp0V9cCGZZ0i5qimNbsydCxGIC6rvHvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBH9tk9yDPuPN2g16OjpcK1PAxiLudBwtec+stplKw+Myl3Efj
	vdT5S9Y7yw3zthMGfPEWJML6EfJ/kbZj5+iSwhLLlrs3CgklAswGVRQqoEgZFKU=
X-Gm-Gg: ASbGncumu1kGdI45zvDzCCKooO7CLMqCwyPkokdwKokJEn4Jp8IKl3u1N/rJVmIfhpF
	yIF7fCgoqlLXOO8WXdBNMk/8Fwd/rqr/TCEmO4b2jXZKjlqxuEfgQEx15Gm5pZN+2diYKO4RkqO
	Cv19haus3WoEd8H3AEy4gvQ4HKN52ohC/4V8qCL6P/nce+Ly05iSfAeNb3RqeXaRyyJwJO/g5Mr
	8dTpBQzqag65JyfgqiPDmC2wH78cKrqvKWJFR1WTceNWASAkfZCzaLC+wmpm2H9YC9p1Ksjj52s
	4BACRD7ObZvYeD9A90WF1nIy0yC0mDtxAsy0rqo8Z5nzrEBImzswYWo=
X-Google-Smtp-Source: AGHT+IHxtxKg5RW+0tra7ErqT2l5lv/l4qXvXUJ8U9uiGwIl5QtJCesqdAm7TRDDQSFPGUYW4TnQ4g==
X-Received: by 2002:a05:620a:1993:b0:7b6:d710:22ad with SMTP id af79cd13be357-7c02eca3a0amr362876885a.27.1738655721837;
        Mon, 03 Feb 2025 23:55:21 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:55:20 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v3 06/10] RISC-V: Enable GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS
Date: Tue,  4 Feb 2025 13:24:01 +0530
Message-ID: <20250204075405.824721-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204075405.824721-1-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_235522_854243_368A3C8B 
X-CRM114-Status: UNSURE (   8.35  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS for RISC-V
so that RISC-V irqchips can support delayed irq mirgration in the
interrupt context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..3c19e6ca832d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -111,6 +111,8 @@ config RISCV
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
+	select GENERIC_PENDING_IRQ if SMP
+	select GENERIC_PENDING_IRQ_CHIPFLAGS if SMP
 	select GENERIC_PCI_IOMAP
 	select GENERIC_PTDUMP if MMU
 	select GENERIC_SCHED_CLOCK
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
