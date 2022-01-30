Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADA1C46467
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 23:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vcZKY+Bp7kHXoduzaS6kdxFPvnhE9vFGJ9ECyfaoeMk=; b=vlz+/nAoeydBGu
	mP82ln6pnIJjiohExF84N2akV4vCCDynLH39gQdxLDW8iDXn24hBij6SsWeL8DsENA5OE5caFQV/z
	2czhzoIntUT4g89a4zHA4aLQx0Xx6ZakuPv3KGtiwqMH9H01Ok6wnyRzBf+nTQyu3S1uzSpXlQjNZ
	IEaIfl1exjiLkcL/zSSSvpHfdbfITs0N/cfdBDvf0zC+Ay7a+OC1ndYTBhrIJuPmv9aAQkDqHTxa8
	14OoO6mLdM/eP/uP3Kdh9UuyipVTVO+q6BbKoZx3uMRVfU9gQfkxmGfvBzgYGvP3z0IgWSR9z9+/O
	bK2a51AIUh0hK0HSd1mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEJlk-007fux-O4; Sun, 30 Jan 2022 23:38:04 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEJlN-007fZI-72
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 23:37:42 +0000
Received: by mail-lf1-x134.google.com with SMTP id z4so23316241lft.3
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 15:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y24DENQRtEKdQppbGIKyd5oN0ftjyxygovRkGgk1ggI=;
 b=iye0IDf8S26dwLx295PYKApjfR1uhOWkwFRwEuTaz7HfVp5gNRTd7PsGZcdNXus2j5
 KC4hfRnns4Q3gDw6FYYl2hiGD9zyQ++BtQsUN5sSEIWlqdWsG1HgjgoDbwION7zck9/B
 S8MhYR0qnGU76YGP6zQCb71/H90UqaQBgBJGYf9Z6F3zA18hOB/JJMmd+MfBgMIf44bI
 sMILvpsYiXOPyNn3wn8H/3IuNgSMTY5MBK2vT4Gl2WvXF7Wqy+10WxR4R+u39c/0cwYM
 yj8NA83EDXhIuKdSCp9nssU1hiFyiw4wPTkhvi9jW5WvzZ+itFPqw8PQ5rG3RKpTYBTp
 Kbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y24DENQRtEKdQppbGIKyd5oN0ftjyxygovRkGgk1ggI=;
 b=jPblhBZe8P1MjkbcxUvXJ8Dv/96Re0wr52Jj86PFauFgcMYZb9TWQOjsy32DyRyIP8
 4kRs4g4atug04k9OaHEuxGOJ+oXtxXDmS/O2Uib+9jDx6OnyEmT02I+mmLrgJHYhNYDp
 FpvC7eYNgQYjPREP0rz3CuIKIIg6Mqc2/X1U/y3VBAfT9+Da0Hf6F3qK1TEXSf6VJH0E
 n4wGPO9jgm/UOtmFeJ6/cvGolQ6ZgSBvWVF5VbXzMAVsxMfvX6A6DESnN6U+u/49Q7dx
 x5CvI1TYh8LuWHaDSMUeUtYOCUBoWFBDnR+//p7jiTywISqbPkV5IhmyKfvLuC+stjE9
 vD2Q==
X-Gm-Message-State: AOAM531Nd+Rs2EMa/GjN66Kr1aXBYhazQIaAGAtwLiQ23vOdmzybiF1S
 VsgnYz318YumAKyGE9xOelg=
X-Google-Smtp-Source: ABdhPJwUMukTmRLWxE4WTMsRGXBxMbLNoOfsYOAYvD7oQJog5SiqqQ5VNyGL25QpTozq+s6lOQk2Yw==
X-Received: by 2002:ac2:5186:: with SMTP id u6mr14721765lfi.519.1643585859891; 
 Sun, 30 Jan 2022 15:37:39 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:39 -0800 (PST)
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
Subject: [PATCH v6 08/21] arm64: Use do_kernel_power_off()
Date: Mon, 31 Jan 2022 02:37:05 +0300
Message-Id: <20220130233718.21544-9-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_153741_290828_DB3239D4 
X-CRM114-Status: GOOD (  13.88  )
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

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm64/kernel/process.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 5369e649fa79..6816a23bacc2 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -111,8 +111,7 @@ void machine_power_off(void)
 {
 	local_irq_disable();
 	smp_send_stop();
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 }
 
 /*
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
