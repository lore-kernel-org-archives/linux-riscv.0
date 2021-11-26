Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93E9C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 18:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wNOrjdVhLKNgmEC80/W/U/+Dmai5+1GWv+UHD7YGjOY=; b=rhp1VSBx/ZnsBz
	RXBvMHff4JDMts9MGNFmsNC++tDscYFUXcasa+lekptOsGk5S8IH1S4XvGmBa5dtH8PDSnx4ecux1
	6FUr08qXCN/OtTpW0Jw0rqcZmhX2O8+zxbKknYRY940duQl5sqyxIad01m2Le6Hib2JB9psowD1oc
	c0JlmjkeclOMKdLitGcrrmG7Y8NssXpkV+xhTPRc0Qbm0/tfTw8QtF76deVTmOqXgU5U+7v3Vll66
	W6r59gIzSCVDQCoRttii+VPlUwG7ObJT6Q1VMaIlkQCwAZNQ/eLD+i+uKbTovOnScV/2T0eMD9R99
	CxlvFti2zDW7eeJcusDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqfbC-00BPqM-Tx; Fri, 26 Nov 2021 18:05:27 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqfYW-00BO6D-Jq; Fri, 26 Nov 2021 18:02:41 +0000
Received: by mail-lj1-x236.google.com with SMTP id t11so20240929ljh.6;
 Fri, 26 Nov 2021 10:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4OWbCpLiTrW70NMTPpPUNVkhVF3RKPzG5GTofMVph+0=;
 b=U69ILAbrhbxcINYnpRQtUq6JxYWnIXttphxdlME9mX9uCA1JhL5g9P+cnao4IWTUqr
 9tPjsTZbw0wHPRnIaR2kuXc+6SuT1qdSxK1er9g80is33Nv4fNybvJeDFb+59wZ6/jA9
 lKnEss0hQGNpzJDmSzIVrPcWrzOYo8XEDeBsPuLSgtY/cdbTAUaYPsMA9QVRSCsMpWjK
 1CeUN4i4UFobttYFMLMl85bmb+/I+XpEOavkYcgGHHLEq9EDDoV4gjylJLb2WQn+vkHq
 yNteEWHoeUyiUUjoXV7o0YPYgF/rr0dWmS9D0ywrrfynL0aziDEWAvzpSp7yO/ZE2I4q
 +yjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4OWbCpLiTrW70NMTPpPUNVkhVF3RKPzG5GTofMVph+0=;
 b=YxUxPUL0JHtAf1ch52yyhb3fi+wn/CEp/BoMifhGB2lN7OkMuXEz0DoeWoVQXhAQAx
 L5YFVQUdZ4p/91FgSL0+MjsUxRLhoMGn48qMU0/gWG1BDks04/j4aNJFpy2d5s/Qd9CJ
 Pld8CRaiG0sYQNGKPOhFYhoiybFIbgc4uces0G37AEYutewlJ/Ea7qXqTG8nbusPfjd9
 hTzqaX4Ym+pWc40sonr/4Lmeme/TAtquo5H6mmLUJMk6X8VROL3oZ9oque4WsvOa4X+8
 HWFlRGMuquB+CYe9hTTPxw0wWOyWVQMNhsvLulHfoP+obyKjzZn2CeTatjB2CKnR8BIJ
 /gxQ==
X-Gm-Message-State: AOAM530bp9bc/xyQjE4DQPqUOl9v4Go9lhl62nozVlVwUEo1oWF//Ylf
 aP07Ov79G/KGuvKsRRwGtTo=
X-Google-Smtp-Source: ABdhPJz1GbkyYg9nMRW5huA9uUFPfXiNfeSRqTr9xzo7mRAD3m0tvpkkS1ciqVKYkPFDmEUOR5tJqw==
X-Received: by 2002:a2e:a58d:: with SMTP id m13mr33700861ljp.281.1637949757713; 
 Fri, 26 Nov 2021 10:02:37 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:02:37 -0800 (PST)
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
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v4 22/25] memory: emif: Use kernel_can_power_off()
Date: Fri, 26 Nov 2021 21:00:58 +0300
Message-Id: <20211126180101.27818-23-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_100240_716184_ED09E049 
X-CRM114-Status: GOOD (  15.61  )
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

Replace legacy pm_power_off with kernel_can_power_off() helper that
is aware about chained power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/emif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
index 762d0c0f0716..cab10d5274a0 100644
--- a/drivers/memory/emif.c
+++ b/drivers/memory/emif.c
@@ -630,7 +630,7 @@ static irqreturn_t emif_threaded_isr(int irq, void *dev_id)
 		dev_emerg(emif->dev, "SDRAM temperature exceeds operating limit.. Needs shut down!!!\n");
 
 		/* If we have Power OFF ability, use it, else try restarting */
-		if (pm_power_off) {
+		if (kernel_can_power_off()) {
 			kernel_power_off();
 		} else {
 			WARN(1, "FIXME: NO pm_power_off!!! trying restart\n");
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
