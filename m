Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22683C021A0
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 09:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9VXajq6t60neUU9rMTpi4e1cYBZ5EDOWx8giU8SqC4w=; b=y15J0TC6HwCSe1
	94vn0qvL+GPchL3mLYMMaTbzU/5houOloKH6gFMoIEcU1ukIwOAerKkETHnn1zc7aymovwukXfcIC
	2wLTwak81eV28Z6OJSk4ExxhnMVU94awTEhkwupd5yeVci1htfNluvn/i/W1cq8qlfOmI9Ni7Lu+q
	7E0dYGt4IjCg5MBaVTZt/h4yQmaJZJOYuqMqKCdPUSbkyucXEoSSIz/tlGnfJdhmeO4qoSVvx7ceC
	0LFSdZdESbTZaYvFsqGFetkSKxdmN/5yjF5HEd8xseM7/3glN0+axP4TnPaW6XcdKPvtoKZFyL5gR
	0G9wWv6kyI5/NUP27xIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjx5c-00000003rvM-1u1Z;
	Mon, 17 Feb 2025 09:06:56 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwxa-00000003pit-29Pg
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 08:58:39 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2211acda7f6so21511585ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Feb 2025 00:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782718; x=1740387518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=CQ24t2T3OORUKZUHdpf/oNLLdmnm7gXAu7bzdGfXjo3a0YkuIqXUPcB061AqpkVScS
         V1Z2i5pN1pr4FKgrTjftABvkAIq9X8G5VJ59Szul0j1GNXnWaQH7E+05HfB4/SxHD8lf
         bKqNO4+/Y0BNbZtzlbtO6kaAUN0WKSTyZbnPicyaF+T9HqYKfSRboXocO8G8Hch8IH97
         Bk6TJeN0l8fDsHqVEtZ6o2NxWkQWfKPXW6JZSfcsizeBI+zu/4a9Ycbn93fIpr2en2df
         XsxbSBQ7/ecFO0HYW7ULAK0q/VDwLQ0V8OY7LTwCMwWK24aCySVkhpeEtXkXUnUBa2H2
         oWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782718; x=1740387518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBZXTbuS/jzxIISJXLRWUHAJ1oANsva3E4CzlwWomJY=;
        b=h2XpsiGbrtIbvPGDhUEgMtiFkceux+kAEbvpPdlr8oPPTUPk37S/5TK55ZJZ0YOpRw
         +KVoK8+/fm8VfFuyaeouQfarYUmRPhNo9LvEVWFiDSrvHQgITWfdn1OfHJLGuk5ge0Hy
         VhvvPMYEKof8et60FFWZrwz5TEfFtp5z0FBeHwgTGSVXBxMtcMnOvH4V/Cg+B08197H5
         ewRourW5B9VGOtEr2QWPwZAE/Atf+q7WJZxnbP4OdR26KV7nexSN2OFr5WiXD3JUxYG/
         c5lfiztwN5UMAHCQU3jyct/4M+YFHzeGxSPeopMyFoSn5wiewbTS22rrFwGDJ7UpUSgW
         Q9Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVs57IHdx8YhfY1tgqdKkJNrEqyEc5WzGf8e8dS3eQConRbYBIcHQYGI6sg//+zT5P/+CKiI9WhN76jIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHM8m1opxBhyd0tv5acg5WBPkFMop/dSVv9vd/ZBatrAoOmRz0
	3fswXPFuhTlKFBH1YYxKJbZwRSjouv570gZ3TjEq7rfx5+SVhcDlwgbGcIH1P8Y=
X-Gm-Gg: ASbGncuDwNwPQaw08vUKKh32U9iAt/MAzTo/EeONceDHEhVFuhsCPnZTqHR8hfwyJ9c
	cNjqwoOIDEf5JrfpKK/UaKdPN2I8Y2ytTMdKLJgdCu2bpZQX5TyIot0xRVwWzgao4U8JKl8wJqz
	p0hxowHr4TCvlGB4CHnYRpVaB1sBWe06+vfLNpRwKpA5uSj6a1fYJTBI4yTs62Nni5BwZbZVUA1
	JUh6Racf5fZctDAPrW3dg5HYcmUAN4EyjeAi6fEt1TgTdcH10rHFPiTDlg2+mxN88Fws/RBmvVr
	FuzpR/Xd32IZ2NxFla7AZZQm/swKkXji/OgDLlpC7McEM3a2ALav//c=
X-Google-Smtp-Source: AGHT+IF5wHBOeSXkGQAxYL6n4RikPXg1rsQVBSgGjP3SNk1+gp0GdS9NH13FpIk5wtFAo3PxZIMq+w==
X-Received: by 2002:a05:6a00:3d0f:b0:732:4c47:f807 with SMTP id d2e1a72fcca58-732618fa196mr12143576b3a.21.1739782717876;
        Mon, 17 Feb 2025 00:58:37 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:58:37 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Subject: [PATCH v6 06/10] RISC-V: Select GENERIC_PENDING_IRQ
Date: Mon, 17 Feb 2025 14:26:52 +0530
Message-ID: <20250217085657.789309-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217085657.789309-1-apatel@ventanamicro.com>
References: <20250217085657.789309-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_005838_550191_FEB104F8 
X-CRM114-Status: UNSURE (   7.68  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Lunn <andrew@lunn.ch>, Atish Patra <atishp@atishpatra.org>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, hpa@zytor.com, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable GENERIC_PENDING_IRQ for RISC-V so that RISC-V irqchips can
support delayed irq mirgration in the interrupt context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..a32f39748775 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -111,6 +111,7 @@ config RISCV
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
+	select GENERIC_PENDING_IRQ if SMP
 	select GENERIC_PCI_IOMAP
 	select GENERIC_PTDUMP if MMU
 	select GENERIC_SCHED_CLOCK
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
