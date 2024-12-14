Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00C7E7716A
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Dec 2024 17:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lSNoxEQxT4nlJSCAI4qASFGtQdy5FKovx/2GRxw6gVc=; b=tQU6ysZ0NTuSWf
	V+THrBM59NNKu1W213sRO1TOe1COZ8NTV4lBG6Aqz6kleO5pcr4empXp72uyNQGVgO9waEAuiFzN4
	ZKHvCumVZns7ZLBPN6/fihQ65WdEiJnbiJ5ZlwyUPQIedCFb8Q5dTKLscpH74OUZ84C7iGnnTh6CG
	1AnjP+osrwX1GOgziGzbqMiftD/BNsVBKvUGANaFOLPUq+T7QgPcuv2F4N9R6k0UJCOb2yHxQG4Q0
	+T+OvuRwIEU8UgE1uZZulYYhuAqEaDgxjOW3INGODhGgrLJEv6J5iidojCSo3s6ZDoZaSG/YlZXWm
	VhbqlahNUukf+ww2ZGag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMW2d-00000006i7f-26Eq;
	Sat, 14 Dec 2024 17:34:59 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMVuo-00000006gU8-1E1Y
	for linux-riscv@lists.infradead.org;
	Sat, 14 Dec 2024 17:26:55 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-216634dd574so16629595ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 14 Dec 2024 09:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734197213; x=1734802013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yE+w0neHmk87dMRt+p213gF5rtqgAWN6iext8wGVFRM=;
        b=GoFQlJy4nD3najFRD4CLhH3we4JMYqxuWrhQvzob74zv6RYqRkd7H2gH/9rxR1Vola
         gmFvskrU+yyH3AzgXshJNBz3IXP3K9YhawBWIp5ri4s0QAPSGToyYp1p0pDUtPQnYKrg
         BE9QjuaR5U9Yxjjcxm91tMU2D2mhlJexrf4VqOX/7LGajtT6M/7CIidcIiDh+wiTZR8r
         cWe9tGatmINEbCJSWsQ8l5TqcUxlMhLhMhs2LL8NHTPAWincZydxFs4/v/1AZWTD9L4y
         6g1sIVepMsSs160tlv4z/bst43hszxgsd1HbylbFQgUUvC61eTDCBEhD7B9iqoFdPika
         jh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734197213; x=1734802013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yE+w0neHmk87dMRt+p213gF5rtqgAWN6iext8wGVFRM=;
        b=mrIPgVYAhBK5kqy5TNKOiw///M2u00t8CkhsYPSiAWT25aHHkDsj+kFER9xSKNDiNb
         RWnYi0TOMAPucbJVkjBg108+cWIiwAok44HvlvP1qlEjUfzsnArgPlvKOnQiBn03y3kO
         q8gkZ5mnTyv3/FGmqS0Na65sEF5D2rZAZ9igUkz3RbEAg0JBpgP2EdLqQjAonPgEQq3o
         vMv6FOFOdagYEzRr+iiQjV3xPDM4T35DRXO9/4CZCw7L0Ebrr3M8Pa3ytraJPPHt0UYF
         /370oh3aJM2UvAc6QwOHxYZeGSeCRVZC5zsRSir6K0zGyaAEek3VPP20gdsyKKaEeagI
         YFpA==
X-Forwarded-Encrypted: i=1; AJvYcCUiJooudhLse1rEeVl3nnFPY/0n2EtAEbhr7tJ0mGIapHP2r6RerpeZr0jrQwMX+I6uPmIYpGCET319+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDDtLKYYyz6IY+iRfrQzNsyzctSnnQH6EUQl77/NX2hL33CPaZ
	cSQwrWFR2Aoh/x21ZOEV3c7VsEaXLT/Jae9GAz2kuMTllg1G/dVMS66ouXRlyPg=
X-Gm-Gg: ASbGncv1LM/lzhT1P/rQ/DSpg1dlTiOLn8blK/266hYl9B7VmywzXiGLxTmtO8NJJUE
	oqTmfTUPYF5+171XCHkGN/4DPgPQ3rOb5axr5hcxglRaWuJxd+e2ngkuEYM/c3qlsp+o99BJIyR
	0burKETODvRlsK+zMCtgdG3DLW0WRsS4WIhtNeIRiz3ZutwUK1sswVqIfpELUHfO1ytvEtnbxf2
	vIJTm6y7E96VHxUO+SBZ5uTc5ckcoXa9cJSim3BOyMdqv56sokTioNyn6//IHVfmLLvxbrV4kZo
	U57VSr8cI/YAaeU=
X-Google-Smtp-Source: AGHT+IFHcRze2J0M8hyBJEZA/NeT8/eZWD7tT0rfNtTykqj4Jc1ZWMZrjfrUoQxfR7mhTVQoKpV61g==
X-Received: by 2002:a17:902:e545:b0:216:30f9:93d4 with SMTP id d9443c01a7336-2189298bbf7mr99837005ad.8.1734197213088;
        Sat, 14 Dec 2024 09:26:53 -0800 (PST)
Received: from localhost.localdomain ([223.185.132.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e186sm5049811a91.41.2024.12.14.09.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 09:26:52 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 07/11] RISC-V: Enable GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS
Date: Sat, 14 Dec 2024 22:55:45 +0530
Message-ID: <20241214172549.8842-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214172549.8842-1-apatel@ventanamicro.com>
References: <20241214172549.8842-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_092654_334399_A2DCAA5D 
X-CRM114-Status: UNSURE (   8.34  )
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
index d4a7ca0388c0..adc878f029fb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -110,6 +110,8 @@ config RISCV
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
