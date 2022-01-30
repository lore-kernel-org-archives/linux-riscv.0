Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5CBC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 23:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4MWJguzFubTBpiJYZjkbe1WDKQRVSuGktrMuNi8WuyU=; b=mj3ZDxVuj/ZW1/
	wPvcQcehsgOAKk7lnJ5J3rmReUPyvMiVvHwE7uPozP0NktZV7FIvAYwahfF7F0qaxWd9xZpUa0N1k
	cgE8pldo7gIH3DFL0Hz2mdodOr56G/36TkRzMksbav05/1zJkcZiFauDgSeQZgpeXHkdJJT9zCyxF
	MWhRWLuapz2hhJGaoDGhr6HyNKlarFoGvpo7s33dfwge3llYCrHfNncQMbPWHNKj9+dcz6+rSK5lv
	4I3WPkbYyG8hNpZhTmOPCpHA23i20hQZn6QQXqtD4dKtz30La1HpGjnkxoLUdPrFr9Gw4Q/Lkf146
	F6q3UBAPHl2esLCfBOgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEJmu-007gmf-Gt; Sun, 30 Jan 2022 23:39:16 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEJlf-007fpn-Ah
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 23:38:01 +0000
Received: by mail-lf1-x131.google.com with SMTP id z4so23317196lft.3
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 15:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6m8P3WoXpjmgm4wPv3Z7h5cBjPxfBSCYucbGZeGzChw=;
 b=pw0lvBk+dTz3ObiHx+Tziue58w6zUuZQVNJvU9S7GB+pTzwAHhgcj/iJlwXXxw2erP
 SjJaIXCKqSP4ZUdeywJtZKFLRYiUBBH6flK45216wEu+kAKbGqsUiHPKIi82YM1bz/wq
 bMKu0rK0969KEuxg/PSMaDE+zRgG2hxtPkS3M1mFIZPAgYW4ktfU2t1MzGq6fvtQ0WCp
 Y+7PFXh6gcLp4xF5Q6p6cFH24zY5vWjbmW+bewwmKwBTNzJ37xEIcDLIFgNsMgKiVVBl
 Kl81Cxsay4XTPckhsJ1WeXkyEjcWdoSjNX8wa8Lm2Ykdw2ly2wOfBD20u+sG0elmdIGM
 o1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6m8P3WoXpjmgm4wPv3Z7h5cBjPxfBSCYucbGZeGzChw=;
 b=jvSDqmI/h+xmt71icJCiQFJ642Na0DmRTXdgvPQwPxLr2Ok1hEvLXAZ0bho5UzC1R9
 PHvQWJYzxhODPdcYyHFwBtLbBmUPlNQSQEmUDE2Vzp0IWT5ciR/M9GAc/M9BgBOJ9kYe
 bkvocJ4NK+xM8Dz0+2X2pX9f+EtPEa60Sv/eGXVoWVvzNjNNTLXJZTUlgtfkDZqne1Lo
 LnI3HEmfTyZCJ4tHoh5Zf8+SNl2t5Nd4gWMyG6M2ZTZ8VvVO0z1h6qk9rNDHXFLKjahF
 VwCnbh64GaDkvLJTHOThafEAkGm1/x7d5VG3o5Yn6C2aslQjwGsPuobd6sS6rRecSC7p
 pf+g==
X-Gm-Message-State: AOAM533jyz8bF5sK9nsuk0OSpF3MvrA5GLy7pIakOwYc1m3hCd9eNOl3
 vrUiErkf1gUi/DsGmLgt4K8=
X-Google-Smtp-Source: ABdhPJym+9e+qz3b9Eox6rk6EROG58IYAq1gwBJQdx3IJq9mRqA6OUoE67/3HvdiOb6Vb5OIHzS4jw==
X-Received: by 2002:a05:6512:10c4:: with SMTP id
 k4mr13546209lfg.63.1643585878009; 
 Sun, 30 Jan 2022 15:37:58 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:57 -0800 (PST)
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
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v6 18/21] memory: emif: Use kernel_can_power_off()
Date: Mon, 31 Jan 2022 02:37:15 +0300
Message-Id: <20220130233718.21544-19-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_153759_542059_120A5970 
X-CRM114-Status: GOOD (  15.17  )
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
