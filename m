Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85091C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Dec 2021 21:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGRUd/6JBTCITiZRNLTLEuPE75jNjmffSOzDCFHkvis=; b=qoEGb9ir9w1Ri+
	OmenQ09vz6+xJfzHKKuKfgZCNM+jj9zNh2Pm0zAtL/w2OJPYL0tGrNhPYgCRkY+9ja32upauoD8ea
	URqrWBN3e8ebrnR2O8YX1NdAcyrcjbqbtP/eeGAW6ZBoj3Wlo/1/BSxtyx4SWntyhkA8XiO1W6JA6
	qVYSsyv0+A253SxQ2tJg3MmTaYaFoMOe23JEHkeKgbXqq1H+UrBDuVGM6wIe0480ola6NLDkYo21O
	YJ6pU9Uo6sWneBjLI90GKBQKQHeMBdX5x9o9YJttYB3TNdlmzEAi4ctxPvcpOUk+bLwsZbNcrDyBn
	TtJyBD/qjo+3MLPgMN4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwW1e-007Gnh-E3; Sun, 12 Dec 2021 21:04:54 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwW0u-007GCW-K3
 for linux-riscv@lists.infradead.org; Sun, 12 Dec 2021 21:04:10 +0000
Received: by mail-lj1-x22c.google.com with SMTP id b19so19303891ljr.12
 for <linux-riscv@lists.infradead.org>; Sun, 12 Dec 2021 13:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cc0IUGWHitJ0Cooyguk/vAdy9iAEtCRPuqNtfJHYmrA=;
 b=Q/c1xA4uTfURNpesTFDEluAGeukAv0A39h1++QrnHKHB/Wx+jD9uvH8v63QIbUTx/0
 +6rR5eBZFCFfLub5tT4XZSawg+QmuNCEsjrKd9tJnYsJi7NapchhtdTTw5BZoWSvXNqZ
 6qalX/P65Sx1m+OSvepBjdrlXRB10kpIkI8l0kGvB4dwAOxWvQSYyQVUabX2ElBpn+NL
 9XDYXpgHW6Qi4N2A46fFgcC634zKj6WeJBReRhrYc+nPBcEHLfR4bNetpt3CSzMg8EgJ
 8HNfo2NJArfFto2I2XSFuYiZIyXwvuRmtRKx9vRDmnjHIRre5YAsG7Vp/31CfQv6ggAb
 qrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cc0IUGWHitJ0Cooyguk/vAdy9iAEtCRPuqNtfJHYmrA=;
 b=husAf0/yxmn0Wv8qVSjHmTv/6UW8C69+Q60h2NfjxHDg7yet3+lWTucDnx8/nOZyjG
 Csgg4zcDjtnFqNk5lbjC6Y+sInpnhTrjHsk6oq/08V2Sv/wpAZ9i0rtrcbxwKb/fnFlC
 uJIYsxsd0nyIItJ5J/cSXW+PXFmALgIEWN8JLR4bIb2MC/ST4VqMU4ZnYANFLcgYvpw/
 DlE2rmTusKJkSre6GH1ko9GQBfeGugpyuWfNYNzce5TCMKwlfQXat15fQZ2YL8rjmazg
 QHEN9yf9zSOMznZhZode49spc/26x51z5xcRbVN3ikiieObx+VqWwubohFd9d53OVPdX
 /vFg==
X-Gm-Message-State: AOAM533kTWZWObDuEFS/BHp9ga08/U8rP79941j6BgXwM2Wu1sFiHpcz
 NU4P6MMfg3rZ+2GG75jLLRw=
X-Google-Smtp-Source: ABdhPJy9fCaXc17ytJafsM7AkKSnE1Az22GGN1LbVGAjsgQu/yV7EBxctgRg/qU3ELcpWZOjbb6Yyw==
X-Received: by 2002:a2e:a58d:: with SMTP id m13mr26702958ljp.281.1639343046781; 
 Sun, 12 Dec 2021 13:04:06 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 13:04:06 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v5 16/21] mips: Use do_kernel_power_off()
Date: Mon, 13 Dec 2021 00:03:04 +0300
Message-Id: <20211212210309.9851-17-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_130408_696221_9AE1585A 
X-CRM114-Status: GOOD (  13.38  )
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

Kernel now supports chained power-off handlers. Use do_kernel_power_off()
that invokes chained power-off handlers. It also invokes legacy
pm_power_off() for now, which will be removed once all drivers will
be converted to the new power-off API.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/mips/kernel/reset.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/kernel/reset.c b/arch/mips/kernel/reset.c
index 6288780b779e..e7ce07b3e79b 100644
--- a/arch/mips/kernel/reset.c
+++ b/arch/mips/kernel/reset.c
@@ -114,8 +114,7 @@ void machine_halt(void)
 
 void machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 
 #ifdef CONFIG_SMP
 	preempt_disable();
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
